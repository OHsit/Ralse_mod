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
                local card = create_card("Joker",G.jokers,true,4,nil,nil,nil,"")
                card:set_edition({ negative = true })
                		card:add_to_deck()
						card:start_materialize()
						G.jokers:emplace(card)
						return true
            end
        }))
    end
}