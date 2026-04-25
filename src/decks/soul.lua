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
            '{C:red}Soul{} and legendary jokers',
            'can appear in shop',
            'starts with {C:attention}Crystal ball{}',
            'and {C:attention}Omen Globe'
        }
    },
    config = {vouchers = {'v_crystal_ball', 'v_omen_globe'}},

    apply = function (self,back)
        G.GAME.kapi_legendary_pool.in_shop = true
        G.GAME.kapi_legendary_pool.rate = 1 -- 1%
    end
}