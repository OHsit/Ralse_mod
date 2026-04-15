SMODS.Voucher {
    key = 'anit_again',
    pos = {x=7,y=1},
    unlocked = true,
    requires = {"v_antimatter"},
    loc_txt = {
        name = "Antimatter, again?",
        text = {
            "Doubles your joker slots"
        }
    },
    redeem = function (self,card)
        G.E_MANAGER:add_event(Event({
            func = function ()
                if G.jokers then
                    G.jokers.config.card_limit = G.jokers.config.card_limit * 2
                end
                return true
            end,
        }))
    end,

    draw = function (self,card,layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' and (card.config.center.discovered or card.bypass_discovery_center) then
            card.children.center:draw_shader('negative', nil, card.ARGS.send_to_shader)
            card.children.center:draw_shader('negative_shine', nil, card.ARGS.send_to_shader)
        end
    end
}