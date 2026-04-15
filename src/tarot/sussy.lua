SMODS.Consumable {
    key = 't_amongus',
    atlas = 'seal_atlas',
    set = 'Tarot',
    pos = {x=1,y=0},
    config = {max_highlighted = 1, extra = 'amongus'},
    loc_vars = function (self,info_queue,card)
     info_queue[#info_queue+1] = G.P_SEALS[(card.ability or self.config).extra]
    return{vars={(card.ability or self.config).max_highlighted}}
    end,
    loc_txt = {
    name = 'sussy tarot',
     text  = {
            "Select {C:attention}#1#{} cards",
            "apply a {C:red}amongus seal{} to"
        }
    },

    
    use = function(self,card,area,copier)
        for i = 1, math.min(#G.hand.highlighted, card.ability.max_highlighted) do
            G.E_MANAGER:add_event(Event({func = function ()
                play_sound('tarot1')
                card:juice_up(0.3,0.5)
                return true
            end}))

            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function ()
                G.hand.highlighted[i]:set_seal("jeej_amongus",true,true)
                return true
            end}))
            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2, func = function () G.hand:unhighlight_all(); return true end}))
    end
}