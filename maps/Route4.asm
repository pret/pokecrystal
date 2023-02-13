	object_const_def
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL

Route4_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "J'entraîne des"
	line "#MON. Un p'tit"
	cont "combat?"
	done

BirdKeeperHankBeatenText:
	text "Ack! Perdu..."
	done

BirdKeeperHankAfterBattleText:
	text "Si tu veux entraî-"
	line "ner un #MON en"

	para "particulier, mets-"
	line "le en premier et"

	para "fais un changement"
	line "tout de suite."

	para "Pas bête, hein?"
	done

PicnickerHopeSeenText:
	text "Je vais gagner,"
	line "je le sens."

	para "Ca va être ta fête"
	line "tu vas voir!"
	done

PicnickerHopeBeatenText:
	text "Plein la tête!"
	done

PicnickerHopeAfterBattleText:
	text "Des MELOFEE appa-"
	line "raissent au MONT"

	para "SELENITE, mais où"
	line "exactement?"
	done

PicnickerSharonSeenText:
	text "T'as pas aimé"
	line "mon histoire?"
	done

PicnickerSharonBeatenText:
	text "..........."
	done

PicnickerSharonAfterBattleText:
	text "..........."

	para "Je vais aller"
	line "m'entraîner....."
	done

MtMoonSquareSignText:
	text "SQUARE du MONT"
	line "SELENITE: En haut"
	cont "des escaliers."
	done

Route4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, MOUNT_MOON, 2

	def_coord_events

	def_bg_events
	bg_event  3,  7, BGEVENT_READ, MtMoonSquareSign
	bg_event 10,  3, BGEVENT_ITEM, Route4HiddenUltraBall

	def_object_events
	object_event 17,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperHank, -1
	object_event  9,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerHope, -1
	object_event 21,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	object_event 26,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
