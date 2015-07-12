VermilionMart_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ClerkScript_0x191f7e:
	loadfont
	pokemart $0, $0016
	loadmovesprites
	end

SuperNerdScript_0x191f85:
	jumptextfaceplayer UnknownText_0x191f8b

BuenaScript_0x191f88:
	jumptextfaceplayer UnknownText_0x191fca

UnknownText_0x191f8b:
	text "TEAM ROCKET is no"
	line "longer in KANTO."

	para "That alone makes"
	line "me happy."
	done

UnknownText_0x191fca:
	text "I'm thinking about"
	line "going shopping in"
	cont "SAFFRON."
	done

VermilionMart_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 5, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $3, 5, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x191f7e, EVENT_ALWAYS_THERE
	person_event SPRITE_SUPER_NERD, 6, 9, $6, $0, 255, 255, $80, 0, SuperNerdScript_0x191f85, EVENT_ALWAYS_THERE
	person_event SPRITE_BUENA, 10, 12, $5, $1, 255, 255, $a0, 0, BuenaScript_0x191f88, EVENT_ALWAYS_THERE
