SMODS.Atlas {
    key = 'atlas_PandY',
    path = 'stake_pinkandyellow.png',
    px = 29,
    py = 29
}
SMODS.Stake {
    name = "Pink and yellow Stake",
    key = 'PandY',
    atlas = 'atlas_PandY',
    applied_stakes = {},
    above_stake = 'gold',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
    shiny = false,
    calculate = function (self,context)
        if context.final_scoring_step  then
            return {swap = true}
        end
    end
}