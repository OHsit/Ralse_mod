SMODS.Atlas {
    key = 'escalera_atlas',
    path = 'Escalera.png',
    px = 71,
    py = 95,
    atlas_table = 'ANIMATION_ATLAS',
    frames = 12
}
SMODS.Consumable {
    key = 'escalera',
    set = 'Tarot',
    atlas = 'escalera_atlas',
    config = {min_ante = 1, max_ante = 20},
    loc_txt = {
        name = 'escalera',
        text = {
            'Escalera ooooooooooo!'
        }
    },
    cost = 5,
    use = function (self,card,area,copier)
        ease_ante(math.random(card.ability.min_ante, card.ability.max_ante))
    end,
    can_use = function (self,card)
        return true
    end
}