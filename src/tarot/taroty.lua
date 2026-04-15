SMODS.Atlas {
    key = 'seal_atlas',
    path = 'tarot_seal.png',
    px = 71,
    py = 95,
}

SMODS.Consumable {
    key = 'taroty',
    atlas = 'seal_atlas',
    set = 'Tarot',
    config = {max_highlighted = 4, extra = 'BFDI_seal'},
    loc_vars = function (self,info_queue,card)
        info_queue[#info_queue+1] = G.P_SEALS[(card.ability or self.config).extra]
        return{vars={(card.ability or self.config).max_highlighted}}
    end,
    loc_txt = {
        name = 'taroty',
         text  = {
            "Select {C:attention}#1#{} cards",
            "apply a {C:blue}BFDI Seal{} to"
        }
    },

    use = function(self,card,area,copier)
        for i = 1, math.min(#G.hand.highlighted, card.ability.max_highlighted) do
            G.E_MANAGER:add_event(Event({func = function ()
                play_sound('jeej_BFDI_yey')
                card:juice_up(0.3,0.5)
                return true
            end}))

            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function ()
                G.hand.highlighted[i]:set_seal("jeej_BFDI_seal",true,true)
                return true
            end}))
            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2, func = function () G.hand:unhighlight_all(); return true end}))
    end
}