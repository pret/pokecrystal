CeladonMansionRoof_MapScriptHeader: ; 0x71a37
	; trigger count
	db 0

	; callback count
	db 0
; 0x71a39

UnknownScript_0x71a39: ; 0x71a39
	jumptextfaceplayer UnknownText_0x71a3f
; 0x71a3c

MapCeladonMansionRoofSignpost0Script: ; 0x71a3c
	jumptext UnknownText_0x71aa1
; 0x71a3f

UnknownText_0x71a3f: ; 0x71a3f
	db $0, "High places--I do", $4f
	db "love them so!", $51
	db "I'd say the only", $4f
	db "thing that loves", $51
	db "heights as much as", $4f
	db "me is smoke!", $57
; 0x71aa1

UnknownText_0x71aa1: ; 0x71aa1
	db $0, "There's graffiti", $4f
	db "on the wall…", $51
	db $52, " added a", $4f
	db "moustache!", $57
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
	person_event $3a, 9, 11, $4, $10, 255, 255, $90, 0, UnknownScript_0x71a39, $ffff
; 0x71afb

