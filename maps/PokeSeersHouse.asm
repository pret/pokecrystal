const_value set 2
	const POKESEERSHOUSE_GRANNY

PokeSeersHouse_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

SeerScript:
	faceplayer
	opentext
	special Special_PokeSeer
	waitbutton
	closetext
	end

PokeSeersHouse_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 2, 7, 7, CIANWOOD_CITY
	warp_def 3, 7, 7, CIANWOOD_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 2, 3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SeerScript, -1
