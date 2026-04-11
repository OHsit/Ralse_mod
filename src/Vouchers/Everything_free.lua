SMODS.Atlas {
    key = 'atlas_free',
    path = 'Voucher_free.png',
    px = 71,
    py = 95,
}
SMODS.Voucher {
    key = 'free',
    atlas = 'atlas_free',
    config = {extra = {percent = 100}},
    loc_txt = {
        name = 'EVRYTHING IS FUCKIN FREE SALE',
        text = {
            'EVERYTHING!',
            'IS!',
            'FUCKIN!',
            'FREE!'
        }
    },
    requiers = {'v_liquidation'},
    loc_vars = function (self,info_queue,card)
        return {vars = {card.ability.extra.percent}}
    end,
    redeem = function (self,card)
        G.E_MANAGER:add_event(Event({
            func = function ()
                G.GAME.discount_percent = card.ability.extra.percent
                for _,v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end
}