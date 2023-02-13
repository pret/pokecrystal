	object_const_def
	const ROUTE20_SWIMMER_GIRL1
	const ROUTE20_SWIMMER_GIRL2
	const ROUTE20_SWIMMER_GUY

Route20_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route20ClearRocksCallback

Route20ClearRocksCallback:
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	endcallback

TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSign:
	jumptext CinnabarGymSignText

SwimmerfNicoleSeenText:
	text "On est léger dans"
	line "l'eau..."
	done

SwimmerfNicoleBeatenText:
	text "Oh, non!"
	done

SwimmerfNicoleAfterBattleText:
	text "La nage fait gon-"
	line "fler les muscles."

	para "C'est prouvé!"
	line "J'te jure!"
	done

SwimmerfLoriSeenText:
	text "Quelle belle"
	line "collection de"

	para "BADGES. On se fait"
	line "un p'tit combat?"
	done

SwimmerfLoriBeatenText:
	text "Non!"
	done

SwimmerfLoriAfterBattleText:
	text "Le SURF n'est plus"
	line "la seule CS à uti-"
	cont "liser sur l'eau."
	done

SwimmermCameronSeenText:
	text "Ca doit être"
	line "impossible de"

	para "nager jusqu'à"
	line "JOHTO."
	done

SwimmermCameronBeatenText:
	text "Aiyah!"
	done

SwimmermCameronAfterBattleText:
	text "On peut nager dans"
	line "la mer, les fleu-"
	cont "ves, les lacs..."
	done

CinnabarGymSignText:
	text "Tiens!"
	line "Une pancarte..."

	para "CHAMPION d'ARENE"
	line "de CRAMOIS'ILE:"
	cont "AUGUSTE"
	done

Route20_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 38,  7, SEAFOAM_GYM, 1

	def_coord_events

	def_bg_events
	bg_event 37, 11, BGEVENT_READ, CinnabarGymSign

	def_object_events
	object_event 52,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 45, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 12, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
