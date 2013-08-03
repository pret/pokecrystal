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
	jumpstd $0002
; 0x191ec0

UnknownText_0x191ec0: ; 0x191ec0
	db $0, "Do you know about", $4f
	db "the MAGNET TRAIN?", $51
	db "It's a railway", $4f
	db "that goes to GOL-", $55
	db "DENROD in JOHTO.", $57
; 0x191f16

UnknownText_0x191f16: ; 0x191f16
	db $0, "I want to go to", $4f
	db "SAFFRON to see", $55
	db "the MAGNET TRAIN.", $57
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

