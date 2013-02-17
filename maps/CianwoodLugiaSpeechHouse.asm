CianwoodLugiaSpeechHouse_MapScriptHeader: ; 0x9e1ae
	; trigger count
	db 0

	; callback count
	db 0
; 0x9e1b0

UnknownScript_0x9e1b0: ; 0x9e1b0
	jumptextfaceplayer UnknownText_0x9e1bc
; 0x9e1b3

UnknownScript_0x9e1b3: ; 0x9e1b3
	jumptextfaceplayer UnknownText_0x9e23f
; 0x9e1b6

UnknownScript_0x9e1b6: ; 0x9e1b6
	jumptextfaceplayer UnknownText_0x9e2a9
; 0x9e1b9

MapCianwoodLugiaSpeechHouseSignpost1Script: ; 0x9e1b9
	jumpstd $0002
; 0x9e1bc

UnknownText_0x9e1bc: ; 0x9e1bc
	db $0, "You came from", $4f
	db "OLIVINE?", $51
	db "Do you remember", $4f
	db "the four islands", $55
	db "along the way?", $51
	db "I heard that a ", $4f
	db "mythical sea crea-", $55
	db "ture is hiding in", $55
	db "them.", $57
; 0x9e23f

UnknownText_0x9e23f: ; 0x9e23f
	db $0, "I heard that you", $4f
	db "can only see it if", $51
	db "you have a SILVER", $4f
	db "WING.", $51
	db "It must have the", $4f
	db "same scent as the", $55
	db "creature.", $57
; 0x9e2a9

UnknownText_0x9e2a9: ; 0x9e2a9
	db $0, "I've heard that", $4f
	db "the whirlpools", $51
	db "around the islands", $4f
	db "are caused by the", $55
	db "sea creature.", $51
	db "You might need a", $4f
	db "special move to", $55
	db "get past them.", $57
; 0x9e32b

CianwoodLugiaSpeechHouse_MapEventHeader: ; 0x9e32b
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 6, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapCianwoodLugiaSpeechHouseSignpost1Script
	signpost 1, 1, $0, MapCianwoodLugiaSpeechHouseSignpost1Script

	; people-events
	db 3
	person_event $29, 8, 6, $6, $0, 255, 255, $0, 0, UnknownScript_0x9e1b0, $ffff
	person_event $28, 9, 10, $5, $1, 255, 255, $a0, 0, UnknownScript_0x9e1b3, $ffff
	person_event $26, 6, 4, $7, $0, 255, 255, $90, 0, UnknownScript_0x9e1b6, $ffff
; 0x9e36c

