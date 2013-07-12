MoveDeletersHouse_MapScriptHeader: ; 0x195cb2
	; trigger count
	db 0

	; callback count
	db 0
; 0x195cb4

SuperNerdScript_0x195cb4: ; 0x195cb4
	faceplayer
	loadfont
	special $0021
	closetext
	loadmovesprites
	end
; 0x195cbc

MapMoveDeletersHouseSignpost1Script: ; 0x195cbc
	jumpstd $0001
; 0x195cbf

MoveDeletersHouse_MapEventHeader: ; 0x195cbf
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $3, 6, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapMoveDeletersHouseSignpost1Script
	signpost 1, 1, $0, MapMoveDeletersHouseSignpost1Script

	; people-events
	db 1
	person_event SPRITE_SUPER_NERD, 7, 6, $6, $0, 255, 255, $0, 0, SuperNerdScript_0x195cb4, $ffff
; 0x195ce6

