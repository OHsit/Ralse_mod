SMODS.Atlas {
    key = 'yellow_joker',
    path = 'yellow_joker.png',
    px = 71,
    py = 95
}


SMODS.Joker {
    key = "yellow_joker",
    atlas = 'yellow_joker',
    blueprint_compat = false,
    rarity =3,
    cost = 10,
    config = {extra = {money = 1}},
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.extra.money, card.ability.extra.money * ((G.deck and G.deck.cards) and #G.deck.cards or 52)}}
    end,
    pools = {["Ralseaddtiton"] = true},

    calculate = function (self, card, context)
        if context.joker_main then
            return {dollars = card.ability.extra.money *  #G.deck.cards}
        end
    end

    --calc_dollar_bonus = function (self,card) end
}