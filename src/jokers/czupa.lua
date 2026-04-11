SMODS.Atlas {
    key = 'placeholder_czupa',
    path = 'czupa_placeholder.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'czupa',
    atlas = 'placeholder_czupa',
    pools = {["Ralseaddtiton"] = true},
    pos = {x=0,y=0},
    eternal_compat = true,
    perishable_compat = true,
    rarity = 4,
    cost = 21,
    config = {extra={basexmult = 1,gainxmult=1}},
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.basexmult,card.ability.extra.gainxmult}}
    end,
calculate = function(self, card, context)
    if context.setting_blind then
        local destroyed_cards = {}
        for k, v in pairs(G.jokers.cards) do
            if v:has_attribute('food') then
                table.insert(destroyed_cards, v)
            end
        end
        if next(destroyed_cards) then
            SMODS.destroy_cards(destroyed_cards)
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = 'basexmult',
                scalar_value = 'gainxmult',
                no_message = true
            })
            return {message = localize({type = 'variable', key = 'a_xmult', vars = {card.ability.extra.basexmult}}), colour = G.C.MULT}
        end
    end
    if context.joker_main then
        return {xmult = card.ability.extra.basexmult}
    end
end
}