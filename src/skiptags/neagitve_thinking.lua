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
    apply = function (self, tag, context)
        if context.type == "store_joker_create" then
            local card
            local card2
            if not G.GAME.banned_keys["j_brainstorm"] and not G.GAME.banned_keys["j_blueprint"]  then
                card = create_card("Joker",context.area,nil,nil,nil,nil,"j_brainstorm")
                card2 = create_card("Joker",context.area,nil,nil,nil,nil,"j_blueprint")
                create_shop_card_ui(card,"Joker",context.area)
                create_shop_card_ui(card2,"Joker",context.area)
                card.states.visible = false
                card2.states.visible = false
                tag:yep("+",G.C.RED, function ()
                    card:set_edition({ negative = true })
                    card2:set_edition({negative = true})
                    card:start_materialize()
                    card2:start_materialize()
                    card:set_cost()
                    card2:set_cost()
                    return true
                end)
            else
                tag:nope()
            end
            tag.triggered = true
            return {
                card,
                card2
            }
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