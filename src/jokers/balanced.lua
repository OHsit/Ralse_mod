SMODS.Atlas {
    key = 'balanced_atlas',
    path = 'Perfectly_balanced_ver1.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'balanced',
    atlas = 'balanced_atlas',
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
    end,
    in_pool = function (self, args)
        return {allow_duplicates = false}
    end
}