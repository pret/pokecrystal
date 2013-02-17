OlivinePunishmentSpeechHouse_MapScriptHeader: ; 0x9c635
	; trigger count
	db 0

	; callback count
	db 0
; 0x9c637

UnknownScript_0x9c637: ; 0x9c637
	jumptextfaceplayer UnknownText_0x9c643
; 0x9c63a

UnknownScript_0x9c63a: ; 0x9c63a
	jumptextfaceplayer UnknownText_0x9c6b1
; 0x9c63d

MapOlivinePunishmentSpeechHouseSignpost1Script: ; 0x9c63d
	jumpstd $0002
; 0x9c640

MapOlivinePunishmentSpeechHouseSignpost0Script: ; 0x9c640
	jumpstd $0003
; 0x9c643

UnknownText_0x9c643: ; 0x9c643
	db $0, "Along the way to", $4f
	db "CIANWOOD, there", $51
	db "are four deserted", $4f
	db "islands.", $51
	db "Bad kids are taken", $4f
	db "to the islands as", $55
	db "punishment!", $57
; 0x9c6b1

UnknownText_0x9c6b1: ; 0x9c6b1
	db $0, "Whenever I get in", $4f
	db "trouble, Daddy", $55
	db "always scares me.", $57
; 0x9c6e5

OlivinePunishmentSpeechHouse_MapEventHeader: ; 0x9c6e5
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 5, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 5, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapOlivinePunishmentSpeechHouseSignpost0Script
	signpost 1, 1, $0, MapOlivinePunishmentSpeechHouseSignpost1Script

	; people-events
	db 2
	person_event $2d, 6, 5, $3, $0, 255, 255, $0, 0, UnknownScript_0x9c637, $ffff
	person_event $28, 9, 9, $5, $2, 255, 255, $0, 0, UnknownScript_0x9c63a, $ffff
; 0x9c719

