SMODS.Shader {
    key = 'wired',
    path = 'wired.fs'
}

SMODS.Sound {
    key = 'wired_sfx',
    path = 'snd_electric_talk.wav'
}

SMODS.Edition {
    key = 'wired',
    shader = 'jeej_wired',
    unlocked = true,
    discovered = true,
    config = {
        e_chips = "1.01",e_chips_gain = "1.02",
        e_mult = "1.01", e_mult_gain = "1.02"
    },
    in_shop = true,
    weight = 7,
    extra_cost = 5,
    apply_to_float =false,
    sound = {sound = "jeej_wired_sfx",per = 1.2,vol = 0.4},
    disable_base_sahder = true,
    always_scores = true,
    loc_vars = function (self,info_queue,card)
        return {vars = {card.edition.e_chips,card.edition.e_chips_gain,card.edition.e_mult,card.edition.e_mult_gain}}
    end,
    calculate = function (self,card,context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            if context.post_trigger then
                SMODS.scale_card (card,{
                    ref_table = card.edition,
                    ref_value = "e_chips",
                    scalar_value = "e_chips_gain"
                })
                SMODS.scale_card(card,{
                    ref_table = card.edition,
                    ref_value = "e_mult",
                    scalar_value = "e_mult_gain"
                })
                scaling_message = {
                    message = "Bzzt!",} --im gonnna left this like that
            end
            return {
                e_chips = card.edition.e_chips,
                e_mult = card.edition.e_mult
            }
        end
    end
}