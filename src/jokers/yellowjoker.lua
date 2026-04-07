SMODS.Atlas {
    key = 'placeholder',
    path = 'placeholder.png',
    px = 71,
    py = 95
}


SMODS.Joker {
    key = "yellow_joker",
    blueprint_compat = false,
    rarity =3,
    cost = 10,
    pos = {x=7,y=10},
    config = {extra = {money = 1}},
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.extra.money, card.ability.extra.money * ((G.deck and G.deck.cards) and #G.deck.cards or 52)}}
    end,

    calc_dollar_bonus = function (self,card)
        return {card.ability.extra.money * #G.deck.cards}       
    end
}