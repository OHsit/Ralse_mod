SMODS.Consumable {
    key = 'gatekeep',
    set = 'Spectral',
    loc_txt = {
        name = 'Gatekeep',
        text = {
            'Random joker will gain eternal sticker',
            'and will be cleared from other stickers',
            'Random joker will be destoryed'
        }
    },
    pos = {x=0,y=0},
    atlas = 'r_consumables',
    cost = 4,
    loc_vars = function (self,info_queue,card)
        info_queue[#info_queue+1] = {key = "eternal", set = "Other"}
    end,
    can_use = function (self,card)
        return #G.jokers.cards > 0
    end,
    use = function(self,card,area,copier)
        local used_consumable = copier or card
        local deleteable_jokers = {}
        for k,v in ipairs(G.jokers.cards) do
            if not SMODS.is_eternal(v) then
                deleteable_jokers[#deleteable_jokers+1] = v
            end
        end
        local target = #G.jokers.cards == 1 and G.joker.cards[1] or pseudorandom_element(G.jokers.cards, pseudoseed("Amongus"))
        local victim = pseudorandom_element(G.jokers.cards, pseudoseed("LCDirects"))
        local _first_dissolve = nil
        G.E_MANAGER:add_event(Event({
            trigger = "before",
            delay = 0.75,
            func = function ()
                for k,v in ipairs(deleteable_jokers) do
                    if v == victim then
                        v:start_dissolve(nil,_first_dissolve)
                        _first_dissolve = true
                    end
                end
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.4,
            func = function ()
                play_sound("tarot")
                used_consumable:juice_up(0.3,0.5)
                return true
                end,
        }))
        for i = 1, #G.jokers.cards do
            local CARD = G.jokers.cards[i]
            local percent = 1.15 - (i - 0.999) / (#G.jokers.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function ()
                    CARD:flip()
                    CARD.ability.perishable = nil
                    CARD:set_rental(nil)
                    CARD:set_eternal(nil)
                    CARD.ability.jeej_fergile = nil
                    CARD.ability.jeej_very_fergile = nil
                    play_sound("card1", percent)
                    CARD:juice_up(0.3,0.3)
                    return true
                end,
            }))
        end
                    delay(0.2)
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.4,
                func = function ()
                    play_sound("tarot2")
                    used_consumable:juice_up(0.3,0.5)
                    return true
                end,
            }))
            G.E_MANAGER(Event({
                trigger = "after",
                delay = 0.15,
                func = function ()
                    play_sound("card1",0.9)
                    target:flip()
                    return true
                end,
            }))
            delay(0.2)
            G.E_MANAGER(Event({
                trigger = "after",
                delay = 0.15,
                func = function ()
                    play_sound("card1",1.1)
                    target:flip()
                    target.ability.eternal = true
                    return true
                end
            }))
    end,
force_use = function (self,card,area)
    self:use(card, area)
end,
}