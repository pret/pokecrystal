FuchsiaMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x195ce8:
	loadfont
	pokemart $0, $001d
	loadmovesprites
	end

FisherScript_0x195cef:
	jumptextfaceplayer UnknownText_0x195cf5

CooltrainerFScript_0x195cf2:
	jumptextfaceplayer UnknownText_0x195d36

UnknownText_0x195cf5:
	text "I was hoping to"
	line "buy some SAFARI"

	para "ZONE souvenirs,"
	line "but it's closed…"
	done

UnknownText_0x195d36:
	text "The SAFARI ZONE"
	line "WARDEN's grand-"
	cont "daughter lives in"
	cont "town."
	done

FuchsiaMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $3, 1, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 7, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, ClerkScript_0x195ce8, -1
	person_event SPRITE_FISHER, 6, 7, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, FisherScript_0x195cef, -1
	person_event SPRITE_COOLTRAINER_F, 10, 11, OW_UP | $1, $2, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, CooltrainerFScript_0x195cf2, -1
