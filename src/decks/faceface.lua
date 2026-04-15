SMODS.Back {
    key = 'face',
    loc_txt = {
        name = 'Face Face Deck',
        text = {
            'Start with only face cards'
        }
    },
    initial_deck = {
        ranks = {"'A','10','9','8','7','6','5','4','3','2','1'"},
        exclude = true
    },
    apply = function (self,back)
        G.GAME.starting_params.jeej_all_faces = true
    end
}