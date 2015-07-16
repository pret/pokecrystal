CinnabarPokeCenter1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

NurseScript_0x1ab32c:
	jumpstd pokecenternurse

CooltrainerFScript_0x1ab32f:
	jumptextfaceplayer UnknownText_0x1ab335

FisherScript_0x1ab332:
	jumptextfaceplayer UnknownText_0x1ab37f

UnknownText_0x1ab335:
	text "CINNABAR GYM's"
	line "BLAINE apparently"

	para "lives alone in the"
	line "SEAFOAM ISLANDS"
	cont "cave…"
	done

UnknownText_0x1ab37f:
	text "It's been a year"
	line "since the volcano"
	cont "erupted."
	done

CinnabarPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND
	warp_def $7, $4, 1, GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_NURSE, 5, 7, UP << 2 | $2, $0, -1, -1, $0, 0, NurseScript_0x1ab32c, -1
	person_event SPRITE_COOLTRAINER_F, 10, 11, UP << 2 | $1, $2, -1, -1, (PAL_OW_RED << 4) | $80, 0, CooltrainerFScript_0x1ab32f, -1
	person_event SPRITE_FISHER, 8, 6, UP << 2 | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, FisherScript_0x1ab332, -1
