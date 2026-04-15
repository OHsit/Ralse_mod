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
        SMODS.Consumable:take_ownership('soul',
        {
            cost = 10,
            hidden = false,
            soul_rate = 0.9,
            can_repeat_soul = true
        },
        true --silent thinguuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
    )
    SMODS.Rarity:take_ownership('Legendary',
    {
        default_weight = 0.07
    },
    true
)
    end
}