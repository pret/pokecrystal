VermilionHouseDiglettsCaveSpeechHouse_MapScriptHeader: ; 0x19202f
	; trigger count
	db 0

	; callback count
	db 0
; 0x192031

UnknownScript_0x192031: ; 0x192031
	jumptextfaceplayer UnknownText_0x192034
; 0x192034

UnknownText_0x192034: ; 0x192034
	db $0, "Over many years,", $4f
	db "DIGLETT dug a", $55
	db "large tunnel.", $51
	db "That tunnel goes", $4f
	db "to a distant town.", $57
; 0x192086

VermilionHouseDiglettsCaveSpeechHouse_MapEventHeader: ; 0x192086
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $3, 6, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event $40, 7, 5, $4, $10, 255, 255, $80, 0, UnknownScript_0x192031, $ffff
; 0x1920a3

