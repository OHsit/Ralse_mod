return {
    descriptions = {
        Joker = {
            j_jeej_TADCpomni = {
                name = 'Pomni for The Amazing Digital Circus',
                text = {
                    'Gives {}{C:chips}+#1#{} chips'
                }
            },
            j_jeej_threebaldi = {
                name = '3',
                text = {
                    'When {}{s:1.5,C:attention}3{} is scored:',
                    'Retrigger {}{s:1.5,C:attention}3{} times',
                    'or gain {}{X:mult,C:white}X#1#',
                    '{C:inactive}(Currently {}{X:mult,C:white}X#2#{}{C:inactive})'
                }
            },
            j_jeej_balanced = {
                name = 'Perfectly Balanced',
                text = {
                    '{E:1,C:EDITION}Balances{} your {C:blue}hand'
                }
            },

            j_jeej_JackB = {
                name = 'Jack Black',
                text = {
                    'Every {}{C:attention}Jack{} in hand',
                    'gives {}{X:chips,C:white}X#1#{} chips'
                }
            },

            j_jeej_Kingthe3 = {
                name = "Baron King The Third",
                text = {
                    'Gives {C:attention}Red Seal Steel King{}',
                    'when blind is selected'
                }
            },
            j_jeej_HDOC = {
                name = "Hand drawing of the cat",
                text = {
                    'Gain {C:attention}+#2#${} for each played face card,',
                    'resets after beating boss blind',
                    '{C:inactive}(Currently {C:attention}#1#${}{C:inactive})'
                }
            },
            j_jeej_yellow_joker = {
                name = "Yellow Joker",
                text = {
                    "{C:attention}+#1#${} for each",
                    "remaining card in {C:attention}deck",
                    "{C:inactive}(Currently {C:attention}+#2#${}{C:inactive})"
                }
            },
            j_jeej_bestahand = {
                name = "Looking for best hand",
                text = {
                    "Each round gain {C:red}+#1#{} discards",
                    "but you have only {C:blue}#2#{} hand"
                }
            },
            j_jeej_czupa = {
                name = "Czupa",
                text = {
                    "When theres a food card in one of your joker slots",
                    "Its going to be eaten and this joker will gain {X:mult,C:white}X#2#",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive})"
                }
            },
            j_jeej_wildmen = {
                name = "Wild Men",
                text  = {
                    "When {C:attention}Wild card{} is played",
                    "Joker will gain{C:mult}+#2# mult{}",
                    "and will retrigger card {C:attention}#3#{} times",
                    "{C:inactive}(Currently {C:mult}+#1# mult{}{C:inactive})"
                }
            }
        },
        Blind = {
            bl_jeej_FITH = {
                name = "Fire In The Hole!",
                text = {
                    "After hand is played",
                    "destroy other cards in hand",
                }
            },
            bl_jeej_parasite  = {
                name = "Parasite",
                text = {
                    "Debuffs non-face cards"
                }
            },
            bl_jeej_oneshot = {
                name = "OneShot",
                text  = {
                    "Only 1 hand and 0 discards"
                }
            },
            bl_jeej_vanilla_jack = {
                name = "Vanilla Jack",
                text  = {
                    "Disables all",
                    "RALSE MOD Jokers"
                }
            },
            bl_jeej_Big_wall = {
                name = 'Comically large wall',
                text =  {
                 'Comically large blind size'
                }
            }
        },
        Stake = {
            stake_jeej_PandY = {
                name = "Pink and yellow stake",
                text = {
                    "Swaps mult and chips"
                }
            },
            stake_jeej_stake_stake = {
                name = "Stake Stake",
                text = {
                    'Winnig ante is now 11'
                }
            },
            stake_jeej_Gstake = {
                name = 'Glass Stake',
                text  = {
                    'Cards can have a Fergile sticker'
                }
            },
            stake_jeej_2fort = {
                name = '2fort stake',
                text = {
                    "Blind will scale really fast"
                }
            },
            stake_jeej_GrStake = {
                name = 'Glass breaking green screen stake',
                text = {
                    'Cards can now have Very Fergile sticker'
                }
            }
        },
        Edition = {
            edition_jeej_wired = {
            }
        },
        Other = {
            jeej_fergile = {
                name = "Fergile",
                label = "Fregile",
                text  = {
                    '{C:attention}#1# in #2#{} chance',
                    'that joker is destoryed',
                    'at the of the round'
                }
            },
            jeej_very_fergile = {
                name = "Very Fergile",
                label = "Very Fregile",
                text = {
                    '{C:attention}#1# in #2#{} chance',
                    'that joker is destoryed',
                    'at the of the round'
                }
            }
        }
    }
}