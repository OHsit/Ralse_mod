SMODS.Consumable {
    key = "fresh_start",
    set = 'Spectral',
    loc_txt = {
        name = 'Fresh Start',
        text = {
            'Sells your jokers for {C:attention}7x thier vaule',
            'Get 25 {C:attention}free{} {C:green}rerolls{} and your first shop is {C:attention}free{}!'
        }
    },
    cost = 6,
    can_use = function (self,card)
        if not G.GAME.blind:get_type() then
            return true
        end
    end,
    use = function (self,card,area,copier)
        local _sellval = 0
        for i =1, #G.jokers.cards do
            if not G.jokers.cards[i].ability.eterna then
                _sellval = _sellval + G.jokers.cards[i].sell_cost*7
                G.jokers.cards[i].getting_sliced = true
                G.jokers.cards[i] = nil
            end
        end
        ease_dollars(_sellval)
        G.GAME.current_round.free_rerolls = 25
        calculate_reroll_cost(true)
        if G.shop_jokers and shop_booster then
            for _,card in pairs(G.shop_jokers.cards) do
                card.ability.couponed = true
                card:set_cost()
            end
            for _,boosters in pairs(G.shop_booster.cards) do
                boosters.ability.couponed = true
                boosters:set_cost()
            end
        end
    end
}