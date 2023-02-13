	object_const_def
	const ROUTE11_YOUNGSTER1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_YOUNGSTER3
	const ROUTE11_YOUNGSTER4
	const ROUTE11_FRUIT_TREE

Route11_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerYoungsterOwen:
	trainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterOwenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJason:
	trainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJasonAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicHermanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

YoungsterOwenSeenText:
	text "Y'a pas de triche"
	line "à #MON."

	para "Etre honnête, ça"
	line "c'est chouette!"
	done

YoungsterOwenBeatenText:
	text "Hein?"
	line "T'as grugé!"
	done

YoungsterOwenAfterBattleText:
	text "J'ai combattu avec"
	line "honneur."

	para "Je ne regrette"
	line "rien de rien."
	done

YoungsterJasonSeenText:
	text "Porter des shorts"
	line "dans l'herbe, ça"

	para "pique à donf... "
	line "Pas cool."
	done

YoungsterJasonBeatenText:
	text "Aïeuuuuuuu!"
	done

YoungsterJasonAfterBattleText:
	text "Je vais choper"
	line "d'autres #MON"
	cont "dans les herbes."
	done

PsychicHermanSeenText:
	text "…"
	done

PsychicHermanBeatenText:
	text "…"
	done

PsychicHermanAfterBattleText:
	text "…"

	para "J'ai perdu les"
	line "yeux fermés..."
	done

PsychicFidelSeenText:
	text "Je vois tout..."

	para "Présent, futur..."
	line "Combat!"
	done

PsychicFidelBeatenText:
	text "Heu..."
	line "Je l'avais prévu!"
	done

PsychicFidelAfterBattleText:
	text "Volonté..."
	line "Psychisme..."

	para "Ta confiance en"
	line "tes #MON est"
	cont "ta force."
	done

Route11SignText:
	text "ROUTE 11"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, Route11Sign
	bg_event 32,  5, BGEVENT_ITEM, Route11HiddenRevive

	def_object_events
	object_event 22, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	object_event 20,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJason, -1
	object_event 28,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicHerman, -1
	object_event  8,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	object_event 32,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
