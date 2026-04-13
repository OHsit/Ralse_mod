SMODS.Atlas {
    key = 'green_atlas',
    path = 'mqdefault.png',
    px = 29,
    py =29
}

SMODS.Stake {
    name = 'Glass breaking green screen stake',
    key = 'GrStake',
    atlas = 'green_atlas',
    applied_stakes = {"jeej_2fort"},
    above_stake = "jeej_2fort",
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
    shiny = false,
    modifiers = function ()
    G.GAME.modifiers.jeej_spawn_very_fergile = true
    end
}