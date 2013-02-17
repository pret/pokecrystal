PokeSeersHouse_MapScriptHeader: ; 0x9e36c
	; trigger count
	db 0

	; callback count
	db 0
; 0x9e36e

UnknownScript_0x9e36e: ; 0x9e36e
	faceplayer
	loadfont
	special $0091
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
	person_event $30, 7, 6, $6, $0, 255, 255, $80, 0, UnknownScript_0x9e36e, $ffff
; 0x9e393

