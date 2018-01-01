const_value set 2
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER

LavenderTown_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAVENDER
	return

LavenderTownPokefanMScript:
	jumptextfaceplayer LavenderTownPokefanMText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownYoungsterScript:
	jumptextfaceplayer LavenderTownYoungsterText

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd pokecentersign

LavenderMartSignText:
	jumpstd martsign

LavenderTownPokefanMText:
	text "That's quite some"
	line "building, eh?"

	para "It's KANTO's RADIO"
	line "TOWER."
	done

LavenderTownTeacherText:
	text "KANTO has many"
	line "good radio shows."
	done

LavenderTownGrampsText:
	text "People come from"
	line "all over to pay"

	para "their respects to"
	line "the departed souls"
	cont "of #MON."
	done

LavenderTownYoungsterText:
	text "You need a #"
	line "FLUTE to wake"
	cont "sleeping #MON."

	para "Every trainer has"
	line "to know that!"
	done

LavenderTownSignText:
	text "LAVENDER TOWN"

	para "The Noble Purple"
	line "Town"
	done

KantoRadioStationSignText:
	text "KANTO RADIO"
	line "STATION"

	para "Your Favorite"
	line "Programs On-Air"
	cont "Around the Clock!"
	done

VolunteerPokemonHouseSignText:
	text "LAVENDER VOLUNTEER"
	line "#MON HOUSE"
	done

SoulHouseSignText:
	text "SOUL HOUSE"

	para "May the Souls of"
	line "#MON Rest Easy"
	done

LavenderTown_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 7
	warp_def 5, 5, 1, LAVENDER_POKECENTER_1F
	warp_def 5, 9, 1, MR_FUJIS_HOUSE
	warp_def 3, 13, 1, LAVENDER_SPEECH_HOUSE
	warp_def 7, 13, 1, LAVENDER_NAME_RATER
	warp_def 1, 5, 2, LAVENDER_MART
	warp_def 13, 11, 1, SOUL_HOUSE
	warp_def 14, 5, 1, LAV_RADIO_TOWER_1F

.CoordEvents:
	db 0

.BGEvents:
	db 6
	bg_event 11, 3, BGEVENT_READ, LavenderTownSign
	bg_event 15, 7, BGEVENT_READ, KantoRadioStationSign
	bg_event 3, 9, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 15, 13, BGEVENT_READ, SoulHouseSign
	bg_event 6, 5, BGEVENT_READ, LavenderPokecenterSignText
	bg_event 2, 5, BGEVENT_READ, LavenderMartSignText

.ObjectEvents:
	db 4
	object_event 12, 7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	object_event 2, 15, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event 14, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	object_event 6, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, LavenderTownYoungsterScript, -1
