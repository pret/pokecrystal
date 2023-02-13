	object_const_def
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_FISHER2

Route3_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerFirebreatherOtis:
	trainer FIREBREATHER, OTIS, EVENT_BEAT_FIREBREATHER_OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherOtisAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer YOUNGSTER, WARREN, EVENT_BEAT_YOUNGSTER_WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterWarrenAfterBattleText
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJimmyAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBurt:
	trainer FIREBREATHER, BURT, EVENT_BEAT_FIREBREATHER_BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBurtAfterBattleText
	waitbutton
	closetext
	end

Route3MtMoonSquareSign:
	jumptext Route3MtMoonSquareSignText

FirebreatherOtisSeenText:
	text "Ah! Il fait beau!"
	line "Alors combat!"
	done

FirebreatherOtisBeatenText:
	text "Il fait beau mais"
	line "j'ai froid, là..."
	done

FirebreatherOtisAfterBattleText:
	text "La pluie ça"
	line "mouille..."
	done

YoungsterWarrenSeenText:
	text "Pfff..."
	line "Combat?"
	done

YoungsterWarrenBeatenText:
	text "Pfff...perdu."
	done

YoungsterWarrenAfterBattleText:
	text "T'es balèze."

	para "Et moi j'suis pas"
	line "trop bon...Pfff..."
	done

YoungsterJimmySeenText:
	text "Ha ha! Je cours"
	line "comme le vent!"
	done

YoungsterJimmyBeatenText:
	text "Haha! Génial!"
	done

YoungsterJimmyAfterBattleText:
	text "Moi j'aime les"
	line "shorts."

	para "C'est cool."
	line "C'est beau."
	done

FirebreatherBurtSeenText:
	text "Tu cherches le"
	line "contact?"
	done

FirebreatherBurtBeatenText:
	text "Yaaah!"
	done

FirebreatherBurtAfterBattleText:
	text "Je suis le plus"
	line "grand crache-feu"
	cont "de KANTO."

	para "Mais je suis un"
	line "dresseur nul..."
	done

Route3MtMoonSquareSignText:
	text "SQUARE du MONT"
	line "SELENITE: En haut"
	cont "des escaliers."
	done

Route3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 52,  1, MOUNT_MOON, 1

	def_coord_events

	def_bg_events
	bg_event 49, 13, BGEVENT_READ, Route3MtMoonSquareSign

	def_object_events
	object_event 26, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	object_event 10,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterWarren, -1
	object_event 16,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJimmy, -1
	object_event 49,  5, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
