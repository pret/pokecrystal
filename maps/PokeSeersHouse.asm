PokeSeersHouse_MapScriptHeader: ; 0x9e36c
	; trigger count
	db 0

	; callback count
	db 0
; 0x9e36e

SeerScript: ; 0x9e36e
	faceplayer
	loadfont
	special SPECIAL_POKESEER
	closetext
	loadmovesprites
	end
; 0x9e376

PokeSeersHouse_MapEventHeader: ; 0x9e376
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
	person_event SPRITE_GRANNY, 7, 6, $6, $0, 255, 255, $80, 0, SeerScript, $ffff
; 0x9e393

