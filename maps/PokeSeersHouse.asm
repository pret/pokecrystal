PokeSeersHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 2
	warp_def $7, $2, 7, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 7, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_GRANNY, 7, 6, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, SeerScript, -1
