EcruteakMart_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 2
	warp_def $7, $2, 9, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $7, $3, 9, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x99c3b, EVENT_ALWAYS_THERE
	person_event SPRITE_SUPER_NERD, 6, 9, $5, $1, 255, 255, $a0, 0, SuperNerdScript_0x99c42, EVENT_ALWAYS_THERE
	person_event SPRITE_GRANNY, 10, 10, $7, $0, 255, 255, $0, 0, GrannyScript_0x99c45, EVENT_ALWAYS_THERE
