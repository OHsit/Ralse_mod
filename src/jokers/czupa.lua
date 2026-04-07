SMODS.Atlas {
    key = 'placeholder',
    path = 'placeholder.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'czupa',
    atlas = 'placeholder',
    pools = {["Ralseaddtiton"] = true},
    pos = {x=0,y=0},
    eternal_compat = true,
    perishable_compat = true,
    rarity = 4,
    cost = 21,
    config = {extra={basexmult = 1,gainxmult=1}},
    loc_vars = function (self, info_queue, card)
        return{card.ability.extra.basexmult,card.ability.extra.gainxmult}
    end,
    calculate = function (self,card,context)
        if context.setting_blind and not context.retrigger_joker then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.Food then
                    G.jokers.cards[i].getting_sliced = true
                    G.jokers.cards[i]:start_dissolve()
                    SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "basexmult",
                    scalar_value = "gainxmult"
                      })
                    return {message = "Yummy!"}
                end
                end
        end
        if context.joker_main then
            return {Xmult_mod = card.ability.extra.basexmult}
        end
    end
}