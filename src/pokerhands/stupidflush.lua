
SMODS.PokerHand ({
    key = "pkr_stupidflush",
    chips = 19,
    mult = 21,
    l_mult = 30,
    l_chips = 21,
    example = {
        { 'S_A', true },
        { 'S_2', true },
        { 'H_8', false, enhancement = 'm_lucky' },
        { 'S_5', false },
        { 'D_J', false, seal = 'Red' }
    },
    loc_txt = {
        name = "Stupid flush",
        description = {"A hand containing a 2 and a ace with this same suit"}
    },
    visible = true,

    evaluate = function (parts,hand) --idk how to fix for now just dosnet work
        local other_hands =  next(parts._straight) or next(parts._all_pairs) or next(parts._flush)
        if next(parts.jeej_you_stupid) and next(parts._flush)then
            if not other_hands then
                return {SMODS.merge_lists(parts.jeej_you_stupid)}
            end
        end
    end,

    modify_display_text = function (self, cards, scoring_hand)
        return pkr_stupidflush
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
    key = "jeej_starplanet21",
    set = "Planet",
    object_type = "Consumable",
    name = "jeej_starplanet21",
    loc_txt = {
        name = "Star of planet nr. 21",
        text = {
            "You stupid!",
        },
    },


    pos = {x=0,y=0},
    order = 99,
    atlas = "p_placeholder",
    unlocked = true,
    cost =6,
    hidden = false,

    use = function (self, card, area, copier)
        SMODS.smart_level_up_hand(card,"jeej_pkr_stupidflush")
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