SMODS.Atlas {
    key = 'jack_atlas',
    path = 'jakc_black.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'JackB',
    atlas = 'jack_atlas',
    pos = {x=0,y=0},
    config = {extra={xchips = 2}},
    unlocked = true,
    discovered = true,
    rarity =2,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = {["Ralseaddtiton"] = true},
    loc_vars = function (self, info_queue, card)
       return{vars={card.ability.extra.xchips}} 
    end,

    calculate = function (self,card,context) --nvm I fixed 
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 11  then
 if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    message = "X" .. card.ability.extra.xchips,
                    Xchip_mod = card.ability.extra.xchips
                }
            end
        end
    end
}