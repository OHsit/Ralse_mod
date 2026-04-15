SMODS.Atlas {
    key = 'manufacture_atlas',
    path = 'Voucher_manufacutre.png',
    px = 71,
    py = 95,
}

SMODS.Voucher {
    key = 'manufacture',
    atlas = 'manufacture_atlas',
    config = {extra = {free_reroll = 52525252525252525252525252525252525252525252525252}},
    loc_txt = {
        name = 'Reroll manufacture',
        text = {
            'Rerolls are now free'
        }
    },
    requires = {'v_reroll_glut'},
    redeem = function (self,card)
        G.E_MANAGER:add_event(Event({
            func = function ()
                 SMODS.change_free_rerolls(card.ability.extra.free_reroll)
                return true
            end
        }))
    end
}