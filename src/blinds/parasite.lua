SMODS.Blind {
    key = 'parasite',
    dollars = 10,
    mult = 3,
    debuff = {},
    pos = {x=0,y=7}, --placeholder
    boss ={min = 4},
    boss_colour = HEX("083000"),

    recalc_debuff = function (self,card,from_blind)
        if card.area ~= G.jokers and not G.GAME.blind.disabled then
            if not SMODS.has_no_rank(card)  and (card.base.value == "2" or card.base.value == "3" or card.base.value == "4" or card.base.value == "5" or card.base.value == "6" or card.base.value == "7" or card.base.value == "8" or card.base.value == "9" or card.base.value == "10" or card.base.value == "Ace" ) then
                return true
            end
            return false
        end
    end,
}