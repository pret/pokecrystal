Route8SaffronGate_MapScriptHeader: ; 0x7f414
	; trigger count
	db 0

	; callback count
	db 0
; 0x7f416

OfficerScript_0x7f416: ; 0x7f416
	jumptextfaceplayer UnknownText_0x7f419
; 0x7f419

UnknownText_0x7f419: ; 0x7f419
	db $0, "Have you been to", $4f
	db "LAVENDER TOWN?", $51
	db "There's a tall", $4f
	db "RADIO TOWER there.", $57
; 0x7f45b

Route8SaffronGate_MapEventHeader: ; 0x7f45b
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $0, 14, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $5, $0, 15, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $4, $9, 1, GROUP_ROUTE_8, MAP_ROUTE_8
	warp_def $5, $9, 2, GROUP_ROUTE_8, MAP_ROUTE_8

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 6, 9, $6, $0, 255, 255, $90, 0, OfficerScript_0x7f416, $ffff
; 0x7f482

