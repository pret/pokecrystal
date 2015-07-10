VermilionHouseDiglettsCaveSpeechHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

GentlemanScript_0x192031:
	jumptextfaceplayer UnknownText_0x192034

UnknownText_0x192034:
	text "Over many years,"
	line "DIGLETT dug a"
	cont "large tunnel."

	para "That tunnel goes"
	line "to a distant town."
	done

VermilionHouseDiglettsCaveSpeechHouse_MapEventHeader:
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
	person_event SPRITE_GENTLEMAN, 7, 5, $4, $10, 255, 255, $80, 0, GentlemanScript_0x192031, $ffff
