SMODS.Shader {
    key = 'chavenos',
    path = 'upfront.fs'
}


SMODS.Edition {
    key = "upfront",
    shader = 'chavenos',
    config = {
        e_chips = '1.2', e_mult = '1.2'
    },
    unlocked = true,
    discovered = true,
    loc_vars = function (self, info_queue, card)
        return{vars = {card.edition.e_chips,card.edition.e_mult}}
    end,
    loc_txt = {
        name = 'placeholder',
        text = {
            'Gives'
        }
    },
    in_shop = true,
    weight = 9,
    extra_cost = 5,
    apply_to_float = false,
    disable_shadow = true,
    disable_base_shader = true,
     calculate = function (self,card,context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                e_chips = card.edition.e_chips,
                e_mult = card.edition.e_mult
            }
         end
     end
}