SMODS.Atlas {
    key = 'placeholder',
    path = 'placeholder.png',
    px = 71,
    py = 95
}


SMODS.Joker {
    key = "HDOC",
    atlas = "placeholder",
    pos = {x=0,y=0},
    unlocked = true,
    discovered = true,
    rarity =2,
    cost = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    config = {extra ={basedollar = 5, gaindollar = 2}},
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.extra.basedollar,card.ability.extra.gaindollar}}
    end,


    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            SMODS.scale_card(card,{
                ref_table = card.ability.extra,
                ref_value = "basedollar",
                scalar_value ="gaindollar"
            })
            return {
                message = localize('k_upgrade_ex')
            }
        end
        if context.beat_boss and card.ability.extra.basedollar > 5 then
            card.ability.extra.basedollar = 5
            return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
        end
    end,


    calc_dollar_bonus = function (self,card)
        return card.ability.extra.basedollar
    end
}