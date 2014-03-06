EcruteakLugiaSpeechHouse_MapScriptHeader: ; 0x99332
	; trigger count
	db 0

	; callback count
	db 0
; 0x99334

GrampsScript_0x99334: ; 0x99334
	jumptextfaceplayer UnknownText_0x9933d
; 0x99337

YoungsterScript_0x99337: ; 0x99337
	jumptextfaceplayer UnknownText_0x993ec
; 0x9933a

MapEcruteakLugiaSpeechHouseSignpost0Script: ; 0x9933a
	jumpstd $000c
; 0x9933d

UnknownText_0x9933d: ; 0x9933d
	text "This happened when"
	line "I was young."

	para "The sky suddenly"
	line "turned black. A"

	para "giant flying #-"
	line "MON was blocking"
	cont "out the sun."

	para "I wonder what that"
	line "#MON was? "

	para "It was like a bird"
	line "and a dragon."
	done
; 0x993ec

UnknownText_0x993ec: ; 0x993ec
	text "Is there really a"
	line "#MON that big?"

	para "If it exists, it"
	line "must be powerful."
	done
; 0x99431

EcruteakLugiaSpeechHouse_MapEventHeader: ; 0x99431
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $3, 7, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $7, $4, 7, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 1, 2, $0, MapEcruteakLugiaSpeechHouseSignpost0Script

	; people-events
	db 2
	person_event SPRITE_GRAMPS, 7, 6, $3, $0, 255, 255, $0, 0, GrampsScript_0x99334, $ffff
	person_event SPRITE_YOUNGSTER, 8, 9, $8, $0, 255, 255, $0, 0, YoungsterScript_0x99337, $ffff
; 0x99460

