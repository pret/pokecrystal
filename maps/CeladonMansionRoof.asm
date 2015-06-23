CeladonMansionRoof_MapScriptHeader: ; 0x71a37
	; trigger count
	db 0

	; callback count
	db 0
; 0x71a39

FisherScript_0x71a39: ; 0x71a39
	jumptextfaceplayer UnknownText_0x71a3f
; 0x71a3c

MapCeladonMansionRoofSignpost0Script: ; 0x71a3c
	jumptext UnknownText_0x71aa1
; 0x71a3f

UnknownText_0x71a3f: ; 0x71a3f
	text "High places--I do"
	line "love them so!"

	para "I'd say the only"
	line "thing that loves"

	para "heights as much as"
	line "me is smoke!"
	done
; 0x71aa1

UnknownText_0x71aa1: ; 0x71aa1
	text "There's graffiti"
	line "on the wall…"

	para $52, " added a"
	line "moustache!"
	done
; 0x71ad4

CeladonMansionRoof_MapEventHeader: ; 0x71ad4
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $1, $1, 1, GROUP_CELADON_MANSION_3F, MAP_CELADON_MANSION_3F
	warp_def $1, $6, 4, GROUP_CELADON_MANSION_3F, MAP_CELADON_MANSION_3F
	warp_def $5, $2, 1, GROUP_CELADON_MANSION_ROOF_HOUSE, MAP_CELADON_MANSION_ROOF_HOUSE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 1, 6, $4, MapCeladonMansionRoofSignpost0Script

	; people-events
	db 1
	person_event SPRITE_FISHER, 9, 11, $4, $10, 255, 255, $90, 0, FisherScript_0x71a39, $ffff
; 0x71afb
