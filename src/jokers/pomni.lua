SMODS.Atlas {
    key = 'pomni',
    path = 'pomni.png',
    px = 71,
    py = 95
}


SMODS.Joker{
    key = 'TADCpomni',
    atlas = 'pomni',
    pos ={x =0, y=0},
    config = {
        extra = {
            chips = 250
        }
    },
    eternal_compat = true,
    perishable_compat = true,
    rarity  = 1,
    cost = 3,
    loc_vars = function (self, info_queue,card)
        return {
            vars = {
                card.ability.extra.chips
            }
        } 
    end,
    calculate = function (self,card,context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}