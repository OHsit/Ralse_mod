SMODS.Atlas {
    key = 'chud_atlas',
    px =34,
    py = 34,
    path = 'Blind_chud.png',
    frames = 21,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind {
    name = "vanilla_jack",
    key  = "vanilla_jack",
    atlas = 'chud_atlas',
    mult = 2,
    dollars = 15,
    boss = {min=1},
    boss_colour = HEX('FFFFFF'),

    recalc_debuff = function (self,card)
        for i = 1,#G.jokers.cards do 
            if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.Ralseaddtiton then
                G.jokers.cards[i]:set_debuff(true)
            end
        end
    end,

    disable = function (self)
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
        end
    end,

    defeat = function (self)
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
        end
    end
}