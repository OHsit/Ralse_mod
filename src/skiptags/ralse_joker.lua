SMODS.Tag {
    key = "ralse_joker",
    loc_txt = {
        name = 'Ralse tag',
        text = {
                    "Immediatly grants you a",
        "{C:attention}Ralses mod joker{}"
        }
    },
    atlas = "tags_atlas",
    pos = {x=2,y=0},
    min_ante = 3,

    apply = function (self,tag,context)
        tag:yep('+',G.C.DARK_EDITION, function ()
         local card = create_card("Ralseaddtiton",G.Jokers,nil,nil,nil,nil,nil,'')
        card:add_to_deck()
        G.jokers:emplace(card)
        tag.triggered = true
        return true
        end)
        if G.jokers and #G.jokers.cards > G.jokers.config.card_limit then
            tag:nope()
        end
    end
}