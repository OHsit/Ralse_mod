SMODS.Atlas {
    key = 'dusty_atlas',
    path = "dusty_card.png",
    px = 71,
    py = 95,
}
SMODS.Enhancement {
    key = 'dust',
    atlas = 'dusty_atlas',
    loc_txt = {
        name = 'Dusty',
        text = {
            '{C:chips}+#1# chips{} when in hand',
            '{C:attention}Doubles{} the vaule after winning the blind',
            '{C:red}Resets{} when {C:played}played'
        }
    },
    config = {h_chips = 3,timesvaule = 2},
    alwayes_scores = true,
    loc_vars = function (self, info_queue, card)
        return {vars = {card.ability.h_chips}}
    end,
    calculate = function (self, card, context)
        	if context.end_of_round and not context.individual and not context.repetition then
                card.ability.h_chips = card.ability.h_chips * card.ability.timesvaule
            return {
                message = localize('k_upgrade_ex')
            }
            end
            if context.cardarea == G.play and context.main_scoring then
                if card.ability.h_chips > 3 then
                    card.ability.h_chips = 3
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
                end
            end
    end
}