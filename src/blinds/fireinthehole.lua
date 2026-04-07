SMODS.Atlas {
    key = 'FITH_atlas',
    px =34,
    py = 34,
    path = 'Blind_Fireinthehole.png',
    frames = 21,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind {
    key = "FITH",
    dollars = 5,
    mult = 2,
    boss = {min=1},
    atlas = 'FITH_atlas',
    boss_colour = HEX("ae0000"),
    calculate = function (self,blind,context)
        if not blind.disabled and context.destroy_card and context.cardarea == G.hand then
            return{remove = true}
        end
    end
}