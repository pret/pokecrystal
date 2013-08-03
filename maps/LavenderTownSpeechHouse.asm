LavenderTownSpeechHouse_MapScriptHeader: ; 0x7ea45
	; trigger count
	db 0

	; callback count
	db 0
; 0x7ea47

PokefanFScript_0x7ea47: ; 0x7ea47
	jumptextfaceplayer UnknownText_0x7ea4d
; 0x7ea4a

MapLavenderTownSpeechHouseSignpost1Script: ; 0x7ea4a
	jumpstd $0002
; 0x7ea4d

UnknownText_0x7ea4d: ; 0x7ea4d
	db $0, "LAVENDER is a", $4f
	db "tiny, quiet town", $51
	db "at the foot of the", $4f
	db "mountains.", $51
	db "It's gotten a bit", $4f
	db "busier since the", $51
	db "RADIO TOWER was", $4f
	db "built.", $57
; 0x7eac4

LavenderTownSpeechHouse_MapEventHeader: ; 0x7eac4
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $3, 3, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapLavenderTownSpeechHouseSignpost1Script
	signpost 1, 1, $0, MapLavenderTownSpeechHouseSignpost1Script

	; people-events
	db 1
	person_event SPRITE_POKEFAN_F, 7, 6, $7, $0, 255, 255, $90, 0, PokefanFScript_0x7ea47, $ffff
; 0x7eaeb

