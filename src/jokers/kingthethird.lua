SMODS.Atlas {
    key = 'Kingthe3',
    path = 'Baronthe3.png',
    px = 71,
    py = 95
}


SMODS.Joker {
    key = 'Kingthe3',
    atlas = 'Kingthe3',
    pos={x=0,y=0},
    unlocked = true,
    discovered = true,
    rarity =3,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = {["Ralseaddtiton"] = true},

    calculate = function (self, card, context)
        if context.setting_blind then
            local perfect_card = SMODS.create_card  {set = "Playing Card", seal = "Red", enhancement = "m_steel",rank = "King",suit ='H' ,area = G.discard}
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            perfect_card.playing_card = G.playing_card
            table.insert(G.playing_cards, perfect_card)
                G.E_MANAGER:add_event(Event({
                func = function ()
                perfect_card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                G.play:emplace(perfect_card) 
                return true
                end
            }))
            return {
                message = "+1 Red Seal Steel King",
                colour = G.C.SECONDARY_SET.Enhanced,
                func = function ()
                    G.E_MANAGER:add_event(Event({
                        func = function ()
                            G.deck.config.card_limit = G.deck.config.card_limit +1
                            return true
                        end
                    }))
                    draw_card(G.play,G.deck,90,'up')
                    SMODS.calculate_context({playing_card_added = true, cards = {perfect_card}})
                end
            }
        end
    end,
        in_pool = function (self, args)
        return {allow_duplicates = false}
    end
}