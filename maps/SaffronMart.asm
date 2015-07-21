SaffronMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x18a3bf:
	loadfont
	pokemart $0, $001e
	loadmovesprites
	end

CooltrainerMScript_0x18a3c6:
	jumptextfaceplayer UnknownText_0x18a3cc

CooltrainerFScript_0x18a3c9:
	jumptextfaceplayer UnknownText_0x18a3f3

UnknownText_0x18a3cc:
	text "There's a big"
	line "RADIO TOWER in"
	cont "LAVENDER."
	done

UnknownText_0x18a3f3:
	text "I want to become"
	line "stronger, but I'm"
	cont "not good yet…"

	para "Could you show me"
	line "how sometime?"
	done

SaffronMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $3, 3, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 7, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, ClerkScript_0x18a3bf, -1
	person_event SPRITE_COOLTRAINER_M, 6, 11, OW_DOWN | $3, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, CooltrainerMScript_0x18a3c6, -1
	person_event SPRITE_COOLTRAINER_F, 10, 11, OW_UP | $1, $1, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, CooltrainerFScript_0x18a3c9, -1
