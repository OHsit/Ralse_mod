SMODS.Atlas {
    key = 'oneshot_atlas',
    px =34,
    py = 34,
    path = 'Blind_oneshot.png',
    frames = 21,
    atlas_table = 'ANIMATION_ATLAS'
}
SMODS.Blind {
    key = 'oneshot',
    atlas  = 'oneshot_atlas',
    dollars = 20,
    mult = 2,
    boss = { showdown = true },
    boss_colour = HEX('fff400'),

    calculate = function (self,blind,context)
        if not blind.disabled and context.setting_blind then
            G.GAME.blind.hands_sub = G.GAME.round_resets.hands -1
            ease_hands_played(-G.GAME.blind.hands_sub)
            blind.discards_sub = G.GAME.current_round.discards_left
                ease_discard(-blind.discards_sub)
        end
    end,
    disable = function (self)
        ease_hands_played(G.GAME.blind.hands_sub)
        ease_discard(G.GAME.blind.discards_sub)
    end
}