const_value set 2
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER

LavenderTown_MapScriptHeader:
.MapTriggers:
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
	warp_def $5, $5, 1, LAVENDER_POKECENTER_1F
	warp_def $9, $5, 1, MR_FUJIS_HOUSE
	warp_def $d, $3, 1, LAVENDER_TOWN_SPEECH_HOUSE
	warp_def $d, $7, 1, LAVENDER_NAME_RATER
	warp_def $5, $1, 2, LAVENDER_MART
	warp_def $b, $d, 1, SOUL_HOUSE
	warp_def $5, $e, 1, LAV_RADIO_TOWER_1F

.XYTriggers:
	db 0

.Signposts:
	db 6
	signpost 3, 11, SIGNPOST_READ, LavenderTownSign
	signpost 7, 15, SIGNPOST_READ, KantoRadioStationSign
	signpost 9, 3, SIGNPOST_READ, VolunteerPokemonHouseSign
	signpost 13, 15, SIGNPOST_READ, SoulHouseSign
	signpost 5, 6, SIGNPOST_READ, LavenderPokecenterSignText
	signpost 5, 2, SIGNPOST_READ, LavenderMartSignText

.PersonEvents:
	db 4
	person_event SPRITE_POKEFAN_M, 7, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	person_event SPRITE_TEACHER, 15, 2, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	person_event SPRITE_GRAMPS, 12, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	person_event SPRITE_YOUNGSTER, 11, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 1, LavenderTownYoungsterScript, -1
