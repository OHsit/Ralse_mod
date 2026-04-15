SMODS.Back {
    key = 'face',
    loc_txt = {
        name = 'Face Face Deck',
        text = {
            'Start with only face cards'
        }
    },
    apply = function (self,back)
        G.GAME.starting_params.jeej_all_faces = true
    end
}