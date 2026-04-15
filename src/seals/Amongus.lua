SMODS.Atlas {
    key = 'Amongus_atlas',
    path = 'seal_amongus.png',
    px = 71,
    py = 96
}

SMODS.Seal {
    key = 'amongus',
    atlas = 'Amongus_atlas',
    name = 'Amongus seal',
    badge_colour = HEX("FF0000"),
    config = {extra = {xchipbase = 1,xmultbase = 1, xchipgain = 0.1,xmultgain = 0.1}},
    loc_vars = function (self, info_queue)
        return {vars = {self.config.extra.xchipbase,self.config.extra.xmultbase,self.config.extra.xchipgain,self.config.extra.xmultgain}}
    end,
    loc_txt = {
        name = 'Amongus',
        label = 'Amongus seal',
        text = {
            'Amongus will gain {X:mult,C:white}X#4#{} Mult',
            'and {X:chips,C:white}X#3#{} Chips peremanetly',
            'for all amongus sealed cards when scored',
            '{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}and {X:chips,C:white}X#1#{}{C:inactive})'
        }
    },
    calculate = function (self,card,context)
        if context.cardarea == G.play and context.main_scoring then
                self.config.extra.xchipbase = self.config.extra.xchipbase + self.config.extra.xchipgain
                self.config.extra.xmultbase = self.config.extra.xmultbase + self.config.extra.xmultgain
                return {
                    message = "Amongus",
                    x_mult = self.config.extra.xmultbase,
                    x_chip = self.config.extra.xchipbase,
                }
        end
    end
}