	object_const_def
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER

PalletTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PalletTownFlypointCallback

PalletTownFlypointCallback:
	setflag ENGINE_FLYPOINT_PALLET
	endcallback

PalletTownTeacherScript:
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

PalletTownTeacherText:
	text "J'entraîne des"
	line "#MON. Ils sont"

	para "mes gardes du"
	line "corps."
	done

PalletTownFisherText:
	text "Le progrès..."
	line "C'est dingue!"

	para "On peut maintenant"
	line "échanger des #-"
	cont "MON à travers le"
	cont "temps comme des"
	cont "e-mails."
	done

PalletTownSignText:
	text "BOURG PALETTE"

	para "Calme, paix et"
	line "pureté"
	done

RedsHouseSignText:
	text "CHEZ RED"
	done

OaksLabSignText:
	text "LABO #MON"
	line "de CHEN"
	done

BluesHouseSignText:
	text "CHEZ BLUE"
	done

PalletTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE, 1
	warp_event 12, 11, OAKS_LAB, 1

	def_coord_events

	def_bg_events
	bg_event  7,  9, BGEVENT_READ, PalletTownSign
	bg_event  3,  5, BGEVENT_READ, RedsHouseSign
	bg_event 13, 13, BGEVENT_READ, OaksLabSign
	bg_event 11,  5, BGEVENT_READ, BluesHouseSign

	def_object_events
	object_event  3,  8, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 12, 14, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
