OlivinePunishmentSpeechHouse_MapScriptHeader: ; 0x9c635
	; trigger count
	db 0

	; callback count
	db 0
; 0x9c637

PokefanMScript_0x9c637: ; 0x9c637
	jumptextfaceplayer UnknownText_0x9c643
; 0x9c63a

LassScript_0x9c63a: ; 0x9c63a
	jumptextfaceplayer UnknownText_0x9c6b1
; 0x9c63d

MapOlivinePunishmentSpeechHouseSignpost1Script: ; 0x9c63d
	jumpstd $0002
; 0x9c640

MapOlivinePunishmentSpeechHouseSignpost0Script: ; 0x9c640
	jumpstd $0003
; 0x9c643

UnknownText_0x9c643: ; 0x9c643
	text "Along the way to"
	line "CIANWOOD, there"

	para "are four deserted"
	line "islands."

	para "Bad kids are taken"
	line "to the islands as"
	cont "punishment!"
	done
; 0x9c6b1

UnknownText_0x9c6b1: ; 0x9c6b1
	text "Whenever I get in"
	line "trouble, Daddy"
	cont "always scares me."
	done
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
	person_event SPRITE_POKEFAN_M, 6, 5, $3, $0, 255, 255, $0, 0, PokefanMScript_0x9c637, $ffff
	person_event SPRITE_LASS, 9, 9, $5, $2, 255, 255, $0, 0, LassScript_0x9c63a, $ffff
; 0x9c719

