LavenderNameRater_MapScriptHeader: ; 0x7eaeb
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x7eaf1, $0000

	; callback count
	db 0
; 0x7eaf1

UnknownScript_0x7eaf1: ; 0x7eaf1
	end
; 0x7eaf2

GentlemanScript_0x7eaf2: ; 0x7eaf2
	faceplayer
	loadfont
	special $0057
	closetext
	loadmovesprites
	end
; 0x7eafa

UnknownScript_0x7eafa: ; 0x7eafa
	jumpstd $0001
; 0x7eafd

LavenderNameRater_MapEventHeader: ; 0x7eafd
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $3, 4, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_GENTLEMAN, 7, 6, $6, $0, 255, 255, $80, 0, GentlemanScript_0x7eaf2, $ffff
; 0x7eb1a

