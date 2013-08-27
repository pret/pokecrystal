Route31VioletGate_MapScriptHeader: ; 0x197632
	; trigger count
	db 0

	; callback count
	db 0
; 0x197634

OfficerScript_0x197634: ; 0x197634
	jumptextfaceplayer UnknownText_0x19763a
; 0x197637

CooltrainerFScript_0x197637: ; 0x197637
	jumptextfaceplayer UnknownText_0x197661
; 0x19763a

UnknownText_0x19763a: ; 0x19763a
	db $0, "Hi there!", $4f
	db "Did you visit", $55
	db "SPROUT TOWER?", $57
; 0x197661

UnknownText_0x197661: ; 0x197661
	db $0, "I came too far", $4f
	db "out. I'd better", $55
	db "phone home!", $57
; 0x19768c

Route31VioletGate_MapEventHeader: ; 0x19768c
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $0, 8, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $5, $0, 9, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $4, $9, 1, GROUP_ROUTE_31, MAP_ROUTE_31
	warp_def $5, $9, 2, GROUP_ROUTE_31, MAP_ROUTE_31

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_OFFICER, 6, 9, $6, $0, 255, 255, $80, 0, OfficerScript_0x197634, $ffff
	person_event SPRITE_COOLTRAINER_F, 6, 5, $3, $0, 255, 255, $90, 0, CooltrainerFScript_0x197637, $ffff
; 0x1976c0



