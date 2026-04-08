SMODS.Seal {
    key = 'black',
    name = 'black',
    badge_colour = HEX("000000"),
    config = {extra={money=2,retriggers=2}},
    loc_txt = {
        label = "Black Seal",
        name = "Black Seal",
        text = {
            '{C:money}+$#1#{}',
            'and retriggers {C:attention}#2#{} times',
        }
    },
    loc_vars = function (self, info_queue)
        return {vars ={self.config.extra.money,self.config.extra.retriggers}}
    end,
    calculate = function (self, card, context)
        if context.repetition then
            return {
                repetitions = card.ability.seal.extra.retriggers,
                dollars = card.ability.seal.extra.money
            }
        end
    end
}