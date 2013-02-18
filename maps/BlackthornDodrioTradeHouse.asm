BlackthornDodrioTradeHouse_MapScriptHeader: ; 0x195a28
	; trigger count
	db 0

	; callback count
	db 0
; 0x195a2a

UnknownScript_0x195a2a: ; 0x195a2a
	faceplayer
	loadfont
	trade $3
	closetext
	loadmovesprites
	end
; 0x195a31

MapBlackthornDodrioTradeHouseSignpost1Script: ; 0x195a31
	jumpstd $0003
; 0x195a34

BlackthornDodrioTradeHouse_MapEventHeader: ; 0x195a34
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $3, 3, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapBlackthornDodrioTradeHouseSignpost1Script
	signpost 1, 1, $0, MapBlackthornDodrioTradeHouseSignpost1Script

	; people-events
	db 1
	person_event $28, 7, 6, $3, $0, 255, 255, $a0, 0, UnknownScript_0x195a2a, $ffff
; 0x195a5b

