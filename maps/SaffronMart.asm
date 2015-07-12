SaffronMart_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $3, 3, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x18a3bf, EVENT_ALWAYS_THERE
	person_event SPRITE_COOLTRAINER_M, 6, 11, $3, $0, 255, 255, $b0, 0, CooltrainerMScript_0x18a3c6, EVENT_ALWAYS_THERE
	person_event SPRITE_COOLTRAINER_F, 10, 11, $5, $1, 255, 255, $a0, 0, CooltrainerFScript_0x18a3c9, EVENT_ALWAYS_THERE
