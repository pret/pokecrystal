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

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAVENDER
	return

PokefanMScript_0x1ad6e4:
	jumptextfaceplayer UnknownText_0x1ad702

TeacherScript_0x1ad6e7:
	jumptextfaceplayer UnknownText_0x1ad73a

GrampsScript_0x1ad6ea:
	jumptextfaceplayer UnknownText_0x1ad75c

YoungsterScript_0x1ad6ed:
	jumptextfaceplayer UnknownText_0x1ad7ac

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokeCenterSignText:
	jumpstd pokecentersign

LavenderMartSignText:
	jumpstd martsign

UnknownText_0x1ad702:
	text "That's quite some"
	line "building, eh?"

	para "It's KANTO's RADIO"
	line "TOWER."
	done

UnknownText_0x1ad73a:
	text "KANTO has many"
	line "good radio shows."
	done

UnknownText_0x1ad75c:
	text "People come from"
	line "all over to pay"

	para "their respects to"
	line "the departed souls"
	cont "of #MON."
	done

UnknownText_0x1ad7ac:
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
	signpost 5, 6, SIGNPOST_READ, LavenderPokeCenterSignText
	signpost 5, 2, SIGNPOST_READ, LavenderMartSignText

.PersonEvents:
	db 4
	person_event SPRITE_POKEFAN_M, 7, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x1ad6e4, -1
	person_event SPRITE_TEACHER, 15, 2, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1ad6e7, -1
	person_event SPRITE_GRAMPS, 12, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1ad6ea, -1
	person_event SPRITE_YOUNGSTER, 11, 6, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 1, YoungsterScript_0x1ad6ed, -1
