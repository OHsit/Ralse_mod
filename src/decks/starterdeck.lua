SMODS.Back {
    key = 'start_deck',
    loc_txt = {
        name = 'Starter deck',
        text = {
            'Start with 1 random',
            'negitve rasle mod joker'
        }
    },

    apply = function (self,back)
        G.E_MANAGER:add_event(Event({
            func = function ()
                local card = SMODS.add_card({set = 'Ralseaddtiton', edition = 'e_negative'})
						card:start_materialize()
						return true
            end
        }))
    end
}

--SMODS.add_card({set = 'poolkey', edition = 'e_negative'})
--Ralseaddtiton