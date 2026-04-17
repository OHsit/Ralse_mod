-- adding ^chip nad I think ^mult from cryptlib
--I don`t wanna use whole cryptlib just for one thing
--sounds
SMODS.Sound {
    key = "emult",
    path = "ExponentialMult.wav"
}

SMODS.Sound {
    key = "echips",
    path = "ExponentialChips.wav"
}
--rest of the code
local add_exponentials = not (SMODS.Mods.Tailsman or SMODS.Mods.cdataman or {}).can_load

local calc_exponentials = function (...)end

if add_exponentials then
    calc_exponentials = function (effect,scored_card,key,amount,from_edition)
        if (key == 'e_chips' or key == "Echip_mod") and amount ~=1 then
            if effect.card then
                juice_card(effect.card)
            end
            local chips = SMODS.Scoring_Parameters["chips"]
            chips:modify((chips.current ^ amount)- chips.current)
            if not effect.remove_default_message then
                if from_edition then
                    card_eval_status_text(
                        scored_card,
                        "jokers",
                        nil,
                        percent,
                        nil,
                        {message = "^" .. amount, colour = G.C.dark_edition,edition = true}
                    )
                elseif key~= "Echip_mod" then
                    if effect.echip_message then
                        card_eval_status_text(
                            scored_card or effect.card or effect.focus,
                            "extra",
                            nil,
                            percent,
                            nil,
                            effect.echip_message
                        )
                    else
                        card_eval_status_text(scored_card or effect.card or effect.focus,"e_chips",amount,percent)
                    end
                end
            end
            return true
        end
        if (key == "e_mult" or key == "Emult_mod") and amount ~=1 then
            if effect.card then
                juice_card(effect.card)
            end
            local mult = SMODS.Scoring_Parameters["mult"]
            mult:modify((mult.current ^ amount)- mult.current)
            if from_edition then
                card_eval_status_text(
                    scored_card,
                    "jokers",
                    nil,
                    percent,
                    nil,
                    {message = "^" .. amount .. localize("k_mult"),colour = G.C.dark_edition, edition = true}
                )
            elseif key ~= "Emult_mod" then
                if effect.emult_message then
                    card_eval_status_text(
                        scored_card or  effect.card or effect.focus
                        "extra",
                        nil,
                        percent,
                        nil,
                        effect.emult_message
                    )
                else
                    card_eval_status_text(scored_card or effect.card or effect.focus,"e_mult",amount,percent)
                end
            end
        end
        return true
    end
    for _,v in ipairs({
    "e_mult", "Emult_mod",
    "e_chips", "Echip_mod"
}) do
    table.insert(SMODS.scoring_parameter_keys,v)
end
to_big = to_big or function (x) return x end
to_number = to_number or function(x) return x end
lenient_bignum = lenient_bignum or function(x) return x end
is_number = is_number or function(x) return type(x) == "number" end
end
