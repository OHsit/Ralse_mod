SMODS.Atlas {
    key = 'vfergile_atlas',
    path = 'sticker_very.png',
    px = 71,
    py = 95
}

SMODS.Sticker {
    key = 'very_fergile',
    atlas = 'vfergile_atlas',
    config = {odds = 2},
    default_compat = true,
    needs_flag_enable = true,
    rate = 0.5,
    badge_colour = HEX('FF0000'),
    loc_vars = function (self,info_queue,card)
        local numerator, denominator = SMODS.get_probability_vars(card,1,card.ability.jeej_very_fergile.odds, 'jeej_very_fergile')
        return {vars={numerator,denominator}}
    end,
    should_apply = function (self,card,center,area,bypass_reroll)
         if(pseudorandom('JABIBI') < 0.99) or (not G.GAME.modifiers.jeej_spawn_fergile == true) then
        return
        end
        return (area == G.shop_jokers) or (area == G.pack_cards)
    end,
    calculate = function (self,card,context)
        if context.end_of_round and context.game_over == false then
            if SMODS.pseudorandom_probability(card,'jeej_very_fergile',1,card.ability.jeej_very_fergile.odds) then
                SMODS.destroy_cards(card,nil,nil,true)
                return {
                    message = 'Destroyed!',
                    colour = G.C.FILTER,
                }
            end
        end
    end
}