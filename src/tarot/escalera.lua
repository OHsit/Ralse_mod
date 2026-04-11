SMODS.Consumable {
    key = 'escalera',
    set = 'Tarot',
    config = {min_ante = 1, max_ante = 20},
    loc_txt = {
        name = 'escalera',
        text = 'Escalera, ooooooooooo!'
    },
    cost = 5,
    use = function (self,card,area,copier)
        ease_ante(math.random(card.ability.min_ante, card.ability.max_ante))
    end
}