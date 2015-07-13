ViridianMart_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ClerkScript_0x9b5e7:
	loadfont
	pokemart $0, $0012
	loadmovesprites
	end

LassScript_0x9b5ee:
	jumptextfaceplayer UnknownText_0x9b5f4

CooltrainerMScript_0x9b5f1:
	jumptextfaceplayer UnknownText_0x9b61a

UnknownText_0x9b5f4:
	text "The GYM LEADER"
	line "here is totally"
	cont "cool."
	done

UnknownText_0x9b61a:
	text "Have you been to"
	line "CINNABAR?"

	para "It's an island way"
	line "south of here."
	done

ViridianMart_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $7, $3, 4, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x9b5e7, -1
	person_event SPRITE_LASS, 6, 11, $5, $2, 255, 255, $0, 0, LassScript_0x9b5ee, -1
	person_event SPRITE_COOLTRAINER_M, 10, 5, $7, $0, 255, 255, $0, 0, CooltrainerMScript_0x9b5f1, -1
