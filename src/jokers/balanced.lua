SMODS.Atlas {
    key = 'placeholder',
    path = 'placeholder.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'balanced',
    atlas = 'placeholder',
    pools = {["Ralseaddtiton"] = true},
    pos = {x=0,y=0},
    eternal_compat = true,
    perishable_compat = true,
    rarity  = 2,
    cost = 5,
    calculate = function (self,card,context)
        if context.final_scoring_step then
            return {
                balance = true          }
        end
    end
}