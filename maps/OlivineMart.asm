OlivineMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x9cac7:
	loadfont
	pokemart $0, $000d
	loadmovesprites
	end

CooltrainerFScript_0x9cace:
	jumptextfaceplayer UnknownText_0x9cad4

LassScript_0x9cad1:
	jumptextfaceplayer UnknownText_0x9cb16

UnknownText_0x9cad4:
	text "Do your #MON"
	line "already know the"

	para "move for carrying"
	line "people on water?"
	done

UnknownText_0x9cb16:
	text "My BUTTERFREE came"
	line "from my boyfriend"
	cont "overseas."

	para "It carried some"
	line "MAIL from him."

	para "Want to know what"
	line "it says?"

	para "Let's see… Nope!"
	line "It's a secret!"
	done

OlivineMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 8, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 8, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 7, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, ClerkScript_0x9cac7, -1
	person_event SPRITE_COOLTRAINER_F, 6, 10, OW_UP | $1, $2, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, CooltrainerFScript_0x9cace, -1
	person_event SPRITE_LASS, 10, 5, OW_LEFT | $0, $0, -1, -1, $0, 0, LassScript_0x9cad1, -1
