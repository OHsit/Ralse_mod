SMODS.Tag {
    key = 'gambling',
    atlas = 'tags_atlas',
    pos = {x=1,y=0},
    min_ante = -1,
    loc_txt = {
        name = 'Let`s go Gambling!',
        text = {
            "{C:green}#1# in #2#{} to get Legendery",
            "{C:green}#3# in #4#{} to lose {C:attention}$#7#",
            "{C:green}#5# in #6#{} to win {C:attention}$#8#"
        }
    },
    config = { legendery_odds = 20,lose_money_odds = 2,big_win_odds = 100000,lose_money = -100,big_win =100000000},
    loc_vars = function (self,info_queue)
        local legendery_numerator, legendery_denominator = SMODS.get_probability_vars(self,1,self.config.legendery_odds, 'jeej_legendery_odds')
        local lose_numerator, lose_denominator = SMODS.get_probability_vars(self,1,self.config.lose_money_odds, 'jeej_lose_money_odds')
        local win_numerator, win_denominator = SMODS.get_probability_vars(self,1,self.config.big_win_odds, 'jeej_big_win_odds')
        return {vars = {legendery_numerator,legendery_denominator,lose_numerator,lose_denominator,win_numerator,win_denominator,self.config.lose_money,self.config.big_win}}
    end,
    apply = function (self,tag,context)
        tag:yep('~',G.C.DARK_EDITION, print("gambled"))
        if context.type == "new_blind_choice" then
        if SMODS.pseudorandom_probability(card, "jeej_gambling",1,tag.config.legendery_odds, "jeej_legendery_odds") then
            local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
            card:add_to_deck()
            card:start_materialize()
            G.jokers:emplace(card)
            tag.triggered = true
            return true
        end
        if SMODS.pseudorandom_probability(card, "jeej_gambling",1,tag.config.lose_money_odds,"jeej_lose_money_odds") then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function ()
                    ease_dollars(tag.config.lose_money,true)
                end
            }))
            tag.triggered = true
            return true
            end
            if SMODS.pseudorandom_probability(card,"jeej_gambling",1,tag.config.big_win_odds, "jeej_big_win_odds") then
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function ()
                        ease_dollars(tag.config.big_win,true)
                    end
                }))
                tag.triggered = true
                return true
            end
            else
                tag.triggered = true
                return true
        end
    end

}