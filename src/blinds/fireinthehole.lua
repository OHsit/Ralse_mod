SMODS.Atlas {
    key = 'FITH_atlas',
    px =34,
    py = 34,
    path = 'Blind_Fireinthehole.png',
    frames = 21,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind {
    key = "FITH",
    dollars = 5,
    mult = 2,
    boss = {min=1},
    atlas = 'FITH_atlas',
    boss_colour = HEX("ae0000"),
    calculate = function (self,blind,context)
        if not blind.disabled then
            if context.press_play then
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        local any_selected = nil 
                        local _cards = {}
                        for _, playing_card in ipairs(G.hand.cards) do
                            _cards[#_cards+1] = playing_card
                        end
                        for i = 1,2 do
                            if G.hand.cards[i] then
                                local selected_card, card_index = pseudorandom_element(_cards,'jeej_FITH')
                                G.hand:add_to_highlighted(selected_card,true)
                                table.remove(_cards,card_index)
                                any_selected = true
                            end
                        end
                        if any_selected and context.destroy_card then
                            return {remove = true}
                        end
                        return true
                    end
                }))
                blind.triggered = true
                delay(0.7)
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = (function ()
                        SMODS.juice_up_blind()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.06 * G.SETTINGS.GAMESPEED,
                            blockable = true,
                            blocking = false,
                        }))
                        return true
                    end)
                }))
                delay(0.3)
            end
        end
    end
}