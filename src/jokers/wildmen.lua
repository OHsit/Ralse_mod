SMODS.Atlas {
    key = "wild_atlas",
    path = "Jimbo_wild.png",
    px = 71,
    py = 95,
}

SMODS.Joker {
    key = 'wildmen',
    atlas = 'wild_atlas',
    config = {extra = {mult = 0, multgain = 5,retrigger = 2}},
    rarity = 2,
    cost =5,
    loc_vars = function (self,info_queue,card)
        return{vars={card.ability.extra.mult,card.ability.extra.multgain,card.ability.extra.retrigger}}
    end,
    pools = {["Ralseaddtiton"] = true},
    calculate = function (self,card,context)
        if context.cardarea == G.play and context.individual and not context.blueprint then
            if SMODS.has_enhancement(context.other_card, "m_wild") then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multgain
                return {
                    message = localize("k_again_ex"),
                    repetitions = card.ability.extra.retrigger,
                    mult = card.ability.extra.mult,
                    card = card,
                }
            end
        end
    end
}