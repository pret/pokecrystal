PokeSeersHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

SeerScript:
	faceplayer
	loadfont
	special SpecialPokeSeer
	closetext
	loadmovesprites
	end

PokeSeersHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 7, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 7, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_GRANNY, 7, 6, UP << 2 | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, SeerScript, -1
