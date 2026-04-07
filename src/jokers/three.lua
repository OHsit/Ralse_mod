SMODS.Sound {
    key = 'snd_three',
    path = 'BAL_threetwoone_3.ogg',
}


SMODS.Atlas {
    key = 'baldi',
    path = 'three.png',
    px = 71,
    py = 95,
    atlas_table = 'ANIMATION_ATLAS',
    frames = 8,
    disable_mipmap = true
}

SMODS.Joker {
    key = 'threebaldi',
    atlas = 'baldi',
    pos = {x=0,y=0},
    config = {extra = {xmultgain = 0.3,XMult = 1,specialnumber = 1}},
    rarity = 3,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function (self,info_queue,card)
        return {
            vars = {
                card.ability.extra.xmultgain,
                card.ability.extra.XMult
            }
        }
    end,
    pools = {["Ralseaddtiton"] = true},
    calculate = function (self,card,context)
        if context.joker_main and not context.blueprint then
        card.ability.extra.specialnumber = math.random(1,2) 
        end
            if context.cardarea == G.play and context.individual and not context.blueprint then
                if context.other_card:get_id() == 3 then
                    action = card.ability.extra.specialnumber
                    if action == 1 then
                    SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "XMult",
                    scalar_value = "xmultgain"
                      })
                return {
                            message = "Three!",
                            play_sound("jeej_snd_three"),
                            Xmult_mod = card.ability.extra.XMult,
                       }
                    end
                    if action == 2 then
                return {
                            message = "Three!",
                            play_sound("jeej_snd_three"),
                            --sound = "BAL_threetwoone_3", for some reason it crashes idk how, everything is there
                            repetitions = 3,
                            Xmult_mod = card.ability.extra.XMult,
                            card = card,
                       }
                    end
                end
            end
                    end
                }