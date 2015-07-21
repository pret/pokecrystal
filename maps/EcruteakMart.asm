EcruteakMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x99c3b:
	loadfont
	pokemart $0, $000e
	loadmovesprites
	end

SuperNerdScript_0x99c42:
	jumptextfaceplayer UnknownText_0x99c48

GrannyScript_0x99c45:
	jumptextfaceplayer UnknownText_0x99cd5

UnknownText_0x99c48:
	text "My EEVEE evolved"
	line "into an ESPEON."

	para "But my friend's"
	line "EEVEE turned into"
	cont "an UMBREON."

	para "I wonder why? We"
	line "both were raising"

	para "our EEVEE in the"
	line "same way…"
	done

UnknownText_0x99cd5:
	text "If you use REVIVE,"
	line "a #MON that's"

	para "fainted will wake"
	line "right up."
	done

EcruteakMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 9, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $7, $3, 9, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 7, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, ClerkScript_0x99c3b, -1
	person_event SPRITE_SUPER_NERD, 6, 9, OW_UP | $1, $1, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, SuperNerdScript_0x99c42, -1
	person_event SPRITE_GRANNY, 10, 10, OW_UP | $3, $0, -1, -1, $0, 0, GrannyScript_0x99c45, -1
