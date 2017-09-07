const_value set 2
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN

TrainerHouse1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ReceptionistScript_0x9af67:
	jumptextfaceplayer UnknownText_0x9af7f

CooltrainerMScript_0x9af6a:
	jumptextfaceplayer UnknownText_0x9b025

CooltrainerFScript_0x9af6d:
	jumptextfaceplayer UnknownText_0x9b0b5

YoungsterScript_0x9af70:
	jumptextfaceplayer UnknownText_0x9b11d

GentlemanScript_0x9af73:
	jumptextfaceplayer UnknownText_0x9b1c9

MapTrainerHouse1FSignpost0Script:
	jumptext UnknownText_0x9b1f4

MapTrainerHouse1FSignpost1Script:
	jumptext UnknownText_0x9b25d

MapTrainerHouse1FSignpost2Script:
	jumptext UnknownText_0x9b2c1

UnknownText_0x9af7f:
	text "Welcome to TRAINER"
	line "HOUSE, the newest"

	para "and most happening"
	line "place in VIRIDIAN."

	para "We're open to"
	line "trainers only."

	para "You can battle"
	line "against the best"

	para "of the best right"
	line "downstairs."
	done

UnknownText_0x9b025:
	text "VIRIDIAN is the"
	line "town closest to"
	cont "INDIGO PLATEAU."

	para "They built this"
	line "place because so"

	para "many trainers pass"
	line "through on their"

	para "way up to INDIGO"
	line "PLATEAU."
	done

UnknownText_0x9b0b5:
	text "They hold practice"
	line "battles downstairs"
	cont "here."

	para "I would love to"
	line "see how well a"

	para "trainer from JOHTO"
	line "battles."
	done

UnknownText_0x9b11d:
	text "I guess you can't"
	line "become the CHAMP"

	para "unless you go all"
	line "over the place and"

	para "battle all kinds"
	line "of people."

	para "The CHAMPION from"
	line "PALLET traveled to"

	para "all the cities and"
	line "towns in KANTO."
	done

UnknownText_0x9b1c9:
	text "Whew… I'm taking a"
	line "rest from #MON"
	cont "battles."
	done

UnknownText_0x9b1f4:
	text "Practice battles"
	line "are held in the"

	para "TRAINING HALL"
	line "downstairs."

	para "Skilled trainers"
	line "are invited to"
	cont "participate."
	done

UnknownText_0x9b25d:
	text "There are no rules"
	line "or regulations for"

	para "practice matches."
	line "Just like in field"

	para "battles, anything"
	line "goes!"
	done

UnknownText_0x9b2c1:
	text "…What's this?"
	line "A strategy memo?"

	para "This writing looks"
	line "like ONIX tracks…"

	para "It's completely"
	line "illegible…"
	done

TrainerHouse1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $d, $2, 3, VIRIDIAN_CITY
	warp_def $d, $3, 3, VIRIDIAN_CITY
	warp_def $2, $8, 1, TRAINER_HOUSE_B1F

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 0, 5, SIGNPOST_READ, MapTrainerHouse1FSignpost0Script
	signpost 0, 7, SIGNPOST_READ, MapTrainerHouse1FSignpost1Script
	signpost 10, 7, SIGNPOST_READ, MapTrainerHouse1FSignpost2Script

.PersonEvents:
	db 5
	person_event SPRITE_RECEPTIONIST, 11, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x9af67, -1
	person_event SPRITE_COOLTRAINER_M, 11, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x9af6a, -1
	person_event SPRITE_COOLTRAINER_F, 2, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x9af6d, -1
	person_event SPRITE_YOUNGSTER, 8, 4, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x9af70, -1
	person_event SPRITE_GENTLEMAN, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x9af73, -1
