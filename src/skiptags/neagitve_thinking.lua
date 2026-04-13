SMODS.Tag {
    key = 'thinking',
    requires = "j_brainstorm","j_blueprint",
    loc_txt = {
        name = "Negative thinking",
        text = {
            'Next shop will have negaitve',
            'Brainstorm and Blueprint'
        }
    },
    apply = function (self, tag, context) -- idk how it spawns 2 time im not smart enugh
        if context.type == "store_joker_create" then
            local card
            local card2
            if not G.GAME.banned_keys["j_brainstorm"] and not G.GAME.banned_keys["j_blueprint"]  then
                card = create_card("Joker",G.Jokers,nil,nil,nil,nil,"j_brainstorm")
                card2 = create_card("Joker",G.Jokers,nil,nil,nil,nil,"j_blueprint")
                tag:yep("+",G.C.RED, function ()
                    card:set_edition({ negative = true })
                    card2:set_edition({negative = true})
                    card:add_to_deck()
                    card2:add_to_deck()
                    G.jokers:emplace(card)
                    G.jokers:emplace(card2)
                    tag.triggered = true
            return true
                end)
            else
                tag:nope()
            end
        end
    end,
    in_pool = function ()
        if G.GAME.used_jokers["j_brainstorm"] and not next(find_joker("Showmen")) then
            return false
        end
        --now for blueprint
         if G.GAME.used_jokers["j_blueprint"] and not next(find_joker("Showmen")) then
            return false
        end
        if G.GAME.banned_keys["j_brainstorm"] or G.GAME.banned_keys["j_blueprint"] then
            return false
        end
        return true
    end,
}