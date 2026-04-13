SMODS.Atlas {
    key = 'gstake_atlas',
    path = 'glass_stake.png',
    px = 29,
    py = 29
}

--hook for fergile and very fergile
costhook = Card.set_cost
function Card:set_cost()
    costhook(self)
    if self.ability.jeej_fergile then
        self.cost = self.cost /2
        self.sell_cost = self.sell_cost /2
    end
    if self.ability.jeej_very_fergile then
        self.cost = 2
        self.sell_cost = 1
    end
end

SMODS.Stake {
    name = 'Glass Stake',
    key = 'Gstake',
    atlas = 'gstake_atlas',
    applied_stakes = {},
    above_stake = 'jeej_stake_stake',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
    shiny = false,
    modifiers = function ()
        G.GAME.modifiers.jeej_spawn_fergile = true
    end
}