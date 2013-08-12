OlivineVoltorbHouse_MapScriptHeader: ; 0x9c55a
	; trigger count
	db 0

	; callback count
	db 0
; 0x9c55c

FishingGuruScript_0x9c55c: ; 0x9c55c
	faceplayer
	loadfont
	trade $2
	closetext
	loadmovesprites
	end
; 0x9c563

MapOlivineVoltorbHouseSignpost1Script: ; 0x9c563
	jumpstd $0003
; 0x9c566

OlivineVoltorbHouse_MapEventHeader: ; 0x9c566
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 3, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapOlivineVoltorbHouseSignpost1Script
	signpost 1, 1, $0, MapOlivineVoltorbHouseSignpost1Script

	; people-events
	db 1
	person_event SPRITE_FISHING_GURU, 7, 6, $3, $0, 255, 255, $80, 0, FishingGuruScript_0x9c55c, $ffff
; 0x9c58d

