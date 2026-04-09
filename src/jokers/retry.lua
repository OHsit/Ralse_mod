SMODS.Atlas {
    key = 'perfect_hand',
    path = 'perfect_hand.png',
    px = 71,
    py = 95
}
SMODS.Joker {
    key = "bestahand",
    atlas = 'perfect_hand',
    pos = {x=0,y=0},
    unlocked = true,
    discovered = true,
    rarity =1,
    cost = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    config={extra={discards = 25,hands = 1 }},
    pools = {["Ralseaddtiton"] = true},
    loc_vars = function (self, info_queue, card)
        return {vars={card.ability.extra.discards,card.ability.extra.hands}}
    end,
    add_to_deck = function (self,card,form_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
        G.GAME.round_resets.hands = card.ability.extra.hands
    end,
    remove_from_deck = function (self,card,form_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard
    end
}