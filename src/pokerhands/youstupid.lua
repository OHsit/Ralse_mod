SMODS.PokerHand ({
    key = "pkr_youstupid",
    chips = 9,
    mult = 10,
    l_mult = 21,
    l_chips = 21,
    example = {
        { 'S_A', true },
        { 'D_2', true },
        { 'H_8', false, enhancement = 'm_lucky' },
        { 'S_5', false },
        { 'D_J', false, seal = 'Red' }
    },
    loc_txt = {
        name = "You stupid!",
        description = {"A hand containing a 2 and a ace"}
    },
    visible = true,

    evaluate = function (parts,hand)
        if #hand >= 2 then
            local _has2 = false
            local _hasAce =false
            local eligible_cards = {}
            local other_hands = next(parts._flush) or next(parts._straight) or next(parts._all_pairs)

            for i,card in ipairs(hand) do
                if card:get_id() == 2 and _has2 == false then
                    _has2 = true
                    eligible_cards[#eligible_cards+1] = card
                elseif card:get_id() == 14 and _hasAce == false then
                    _hasAce = true
                    eligible_cards[#eligible_cards+1] = card
                end
            end

            if _has2  and _hasAce and not other_hands then
                return {eligible_cards}
            end
        end
    end,

    modify_display_text = function (self, cards, scoring_hand)
        return pkr_youstupid
    end,
})


SMODS.Atlas {
    key = 'p_placeholder',
    path ='p_placeholder.png',
    px = 71,
    py = 95,
}

SMODS.Sound({key="21",path="21_3.ogg",})


SMODS.Consumable({
    key = "jeej_planet21",
    set = "Planet",
    object_type = "Consumable",
    name = "jeej_planet21",
    loc_txt = {
        name = "Planet nr. 21",
        text = {
            "Whats 9+10?",
        },
    },


    pos = {x=0,y=0},
    order = 99,
    atlas = "p_placeholder",
    unlocked = true,
    cost =6,
    hidden = false,

    use = function (self, card, area, copier)
        SMODS.smart_level_up_hand(card,"jeej_pkr_youstupid")
        play_sound("jeej_21")
    end,

    can_use = function ()
        return true
    end,
    check_for_unlock = function (self,args)
        if args.type == "win_deck" then
            unlock_card(self)
            else
                unlock_card(self)
        end
    end,
})