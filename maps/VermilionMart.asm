VermilionMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 2
	warp_def $7, $2, 5, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $3, 5, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 7, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, ClerkScript_0x191f7e, -1
	person_event SPRITE_SUPER_NERD, 6, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, SuperNerdScript_0x191f85, -1
	person_event SPRITE_BUENA, 10, 12, OW_UP | $1, $1, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, BuenaScript_0x191f88, -1
