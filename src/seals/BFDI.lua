SMODS.Sound({key='BFDI_yey', path='bfdi-yay.ogg'})

SMODS.Atlas {
    key = "BFDI_atlas",
    path = "seal_bfdi.png",
    px = 71,
    py = 96
}


SMODS.Seal {
    key = 'BFDI_seal',
    atlas = 'BFDI_atlas',
    name = 'BFDI Seal',
    badge_colour = G.C.EDITION,
    loc_txt = {
        name = 'BFDI Seal',
        label = 'BFDI Seal',
        text = {
            'Gives {C:attention}$1{} when scored'
        }
    },
    sound = {sound = 'jeej_BFDI_yey', per = 1,vol = 0.5},
    calculate = function (self,card,context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                G.E_MANAGER:add_event(Event({func = function ()
                    play_sound('jeej_BFDI_yey')
           return true     end})),
           dollars = 1
            }
        end
    end,
}