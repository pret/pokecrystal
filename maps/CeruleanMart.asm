CeruleanMart_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ClerkScript_0x188ac0:
	loadfont
	pokemart $0, $0014
	loadmovesprites
	end

CooltrainerMScript_0x188ac7:
	jumptextfaceplayer UnknownText_0x188acd

CooltrainerFScript_0x188aca:
	jumptextfaceplayer UnknownText_0x188b46

UnknownText_0x188acd:
	text "You'll run into"
	line "many trainers on"

	para "the way to CERU-"
	line "LEAN's CAPE."

	para "They want to see"
	line "how they stack"

	para "up against other"
	line "trainers."
	done

UnknownText_0x188b46:
	text "MISTY is about the"
	line "only person in"

	para "town who can beat"
	line "the trainers at"
	cont "CERULEAN's CAPE."
	done

CeruleanMart_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $3, 6, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, LEFT << 2 | $1, $0, -1, -1, $0, 0, ClerkScript_0x188ac0, -1
	person_event SPRITE_COOLTRAINER_M, 10, 5, UP << 2 | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, CooltrainerMScript_0x188ac7, -1
	person_event SPRITE_COOLTRAINER_F, 6, 11, UP << 2 | $1, $2, -1, -1, (PAL_OW_RED << 4) | $80, 0, CooltrainerFScript_0x188aca, -1
