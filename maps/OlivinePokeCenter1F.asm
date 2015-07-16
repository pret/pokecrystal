OlivinePokeCenter1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

NurseScript_0x9c002:
	jumpstd pokecenternurse

FishingGuruScript_0x9c005:
	jumpstd happinesschecknpc

FisherScript_0x9c008:
	jumptextfaceplayer UnknownText_0x9c00e

TeacherScript_0x9c00b:
	jumptextfaceplayer UnknownText_0x9c086

UnknownText_0x9c00e:
	text "The SAILOR in the"
	line "OLIVINE CAFE next"

	para "door is really"
	line "generous."

	para "He taught my"
	line "#MON STRENGTH."

	para "Now it can move"
	line "big boulders."
	done

UnknownText_0x9c086:
	text "There's a person"
	line "in CIANWOOD CITY"
	cont "across the sea."

	para "I heard him brag-"
	line "ging about his"
	cont "rare #MON."
	done

OlivinePokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $4, 1, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, UP << 2 | $2, $0, -1, -1, $0, 0, NurseScript_0x9c002, -1
	person_event SPRITE_FISHING_GURU, 8, 12, UP << 2 | $1, $1, -1, -1, $0, 0, FishingGuruScript_0x9c005, -1
	person_event SPRITE_FISHER, 7, 6, UP << 2 | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, FisherScript_0x9c008, -1
	person_event SPRITE_TEACHER, 5, 11, UP << 2 | $2, $0, -1, -1, $0, 0, TeacherScript_0x9c00b, -1
