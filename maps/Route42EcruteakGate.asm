Route42EcruteakGate_MapScriptHeader: ; 0x19a4b3
	; trigger count
	db 0

	; callback count
	db 0
; 0x19a4b5

OfficerScript_0x19a4b5: ; 0x19a4b5
	jumptextfaceplayer UnknownText_0x19a4b8
; 0x19a4b8

UnknownText_0x19a4b8: ; 0x19a4b8
	text "MT.MORTAR is like"
	line "a maze inside."

	para "Be careful. Don't"
	line "get lost in there."
	done
; 0x19a4fe

Route42EcruteakGate_MapEventHeader: ; 0x19a4fe
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $0, 1, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $5, $0, 2, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $4, $9, 1, GROUP_ROUTE_42, MAP_ROUTE_42
	warp_def $5, $9, 2, GROUP_ROUTE_42, MAP_ROUTE_42

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 6, 9, $6, $0, 255, 255, $80, 0, OfficerScript_0x19a4b5, $ffff
; 0x19a525

