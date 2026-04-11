SMODS.Stake {
    name = "Pink and yellow Stake",
    key = 'PandY',
    applied_stakes = {"gold"},
    calculate = function (self,context)
        if context.final_scoring_step  then
            return {swap = true}
        end
    end
}