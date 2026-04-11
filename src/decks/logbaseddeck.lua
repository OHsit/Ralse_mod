--Custom calc
SMODS.Scoring_Calculation {
    key = 'log_based',
    func = function (self,chips,mult,flames)
        return math.log(chips+mult,2)
    end
}

SMODS.Back {
    key = 'log_deck',
    loc_txt = {
        name = 'Log-Based Deck',
        text = {
            'Calculating score will be calcuated',
            'by equation {C:attention}log(mult+chips)',
            'antes are scaling by {C:attention}#1#',
            '{C:blue}+#2# hands{}, {C:red}+#3# discards',
            '{C:attention}10${} bonus when beating blind',
            '{C:attention}+#4#{} joker slots',
            'gain {C:attention}$1{} for each hand',
            'and {C:attention}$1{} for each discard'
        }
    },
    loc_vars = function (self, info_queue, back)
        return {
            vars = {
                self.config.ante_scaling,
                self.config.hands,
                self.config.discards,
                self.config.joker_slot,
                self.config.extra_hand_bonus,
                self.config.extra_discrad_bonus,
                self.config.consumable_slot
            }
        }
    end,
    config = {ante_scaling = 0.02,discards = 2,hands = 2,extra_hand_bonus = 1, extra_discrad_bonus = 1,joker_slot = 2,consumable_slot =1},
    apply = function (self,back)
       G.E_MANAGER:add_event(Event({
        func = function ()
            SMODS.set_scoring_calculation('jeej_log_based')
            return true
        end
       }))
    end,
    calc_dollar_bonus = function (self,back)
        return 10
    end
}

 --SMODS.set_scoring_calculation('jeej_log_based')