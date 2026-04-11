SMODS.Atlas  {
    key = 'soul_atlas',
    path = 'back_soul.png',
    px = 71,
    py = 95
}


SMODS.Back {
    key = 'soul',
    atlas = 'soul_atlas',
    loc_txt = {
        name = 'Determination Deck',
        text = {
            'Soul and legendary jokers',
            'can appear in shop',
            'starts with Crystal ball',
            'and Omen Globe'
        }
    },
    config = {vouchers = {'v_crystal_ball', 'v_omen_globe'}}
}