SMODS.Atlas {
    key = 'stake_atlas',
    path = 'stake_stake.png',
    px = 29,
    py = 29
}

SMODS.Stake {
    name = 'Stake Stake',
    key = 'stake_stake',
    atlas = 'stake_atlas',
    applied_stakes = {},
    above_stake = "jeej_PandY",
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
    shiny = false,
    modifiers = function ()
        G.GAME.starting_params.joker_slot = G.GAME.starting_params.joker_slot -1
    end
}