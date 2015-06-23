VermilionMagnetTrainSpeechHouse_MapScriptHeader: ; 0x191eb5
	; trigger count
	db 0

	; callback count
	db 0
; 0x191eb7

PokefanFScript_0x191eb7: ; 0x191eb7
	jumptextfaceplayer UnknownText_0x191ec0
; 0x191eba

YoungsterScript_0x191eba: ; 0x191eba
	jumptextfaceplayer UnknownText_0x191f16
; 0x191ebd

MapVermilionMagnetTrainSpeechHouseSignpost1Script: ; 0x191ebd
	jumpstd picturebookshelf
; 0x191ec0

UnknownText_0x191ec0: ; 0x191ec0
	text "Do you know about"
	line "the MAGNET TRAIN?"

	para "It's a railway"
	line "that goes to GOL-"
	cont "DENROD in JOHTO."
	done
; 0x191f16

UnknownText_0x191f16: ; 0x191f16
	text "I want to go to"
	line "SAFFRON to see"
	cont "the MAGNET TRAIN."
	done
; 0x191f48

VermilionMagnetTrainSpeechHouse_MapEventHeader: ; 0x191f48
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $3, 4, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapVermilionMagnetTrainSpeechHouseSignpost1Script
	signpost 1, 1, $0, MapVermilionMagnetTrainSpeechHouseSignpost1Script

	; people-events
	db 2
	person_event SPRITE_POKEFAN_F, 7, 6, $8, $0, 255, 255, $0, 0, PokefanFScript_0x191eb7, $ffff
	person_event SPRITE_YOUNGSTER, 7, 4, $a, $0, 255, 255, $a0, 0, YoungsterScript_0x191eba, $ffff
; 0x191f7c
