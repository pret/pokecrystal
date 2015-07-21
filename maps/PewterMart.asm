PewterMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x1a2dcb:
	loadfont
	pokemart $0, $0013
	loadmovesprites
	end

YoungsterScript_0x1a2dd2:
	jumptextfaceplayer UnknownText_0x1a2dd8

SuperNerdScript_0x1a2dd5:
	jumptextfaceplayer UnknownText_0x1a2e3a

UnknownText_0x1a2dd8:
	text "Hi! Check out my"
	line "GYARADOS!"

	para "I raised it from a"
	line "MAGIKARP. I can't"

	para "believe how strong"
	line "it has become."
	done

UnknownText_0x1a2e3a:
	text "There once was a"
	line "weird old man who"
	cont "sold MAGIKARP."

	para "He was saying the"
	line "MAGIKARP from the"

	para "LAKE OF RAGE were"
	line "excellent."
	done

PewterMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $3, 3, GROUP_PEWTER_CITY, MAP_PEWTER_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 7, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, ClerkScript_0x1a2dcb, -1
	person_event SPRITE_YOUNGSTER, 6, 13, OW_UP | $1, $2, -1, -1, $0, 0, YoungsterScript_0x1a2dd2, -1
	person_event SPRITE_SUPER_NERD, 10, 10, OW_DOWN | $3, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, SuperNerdScript_0x1a2dd5, -1
