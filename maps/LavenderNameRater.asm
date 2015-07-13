LavenderNameRater_MapScriptHeader:
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x7eaf1, $0000

	; callback count
	db 0

UnknownScript_0x7eaf1:
	end

LavenderNameRater:
	faceplayer
	loadfont
	special SpecialNameRater
	closetext
	loadmovesprites
	end

LavenderNameRaterBookshelf:
; unused
	jumpstd difficultbookshelf

LavenderNameRater_MapEventHeader:
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
	person_event SPRITE_GENTLEMAN, 7, 6, $6, $0, 255, 255, $80, 0, LavenderNameRater, -1
