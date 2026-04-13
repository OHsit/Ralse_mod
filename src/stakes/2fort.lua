SMODS.Atlas {
    key = '2fort_atlas',
    path = 'stake_2fort.png',
    px = 29,
    py = 29
}

SMODS.Stake {
    name = '2fort Stake',
    key = '2fort',
    atlas = '2fort_atlas',
    applied_stakes = {"jeej_Gstake"}, -- why the fuck not
    above_stake = "jeej_Gstake",
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
    shiny = false,
    modifiers = function ()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 3
    end,
}