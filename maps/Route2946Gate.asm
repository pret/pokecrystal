Route2946Gate_MapScriptHeader: ; 0x7b5b9
	; trigger count
	db 0

	; callback count
	db 0
; 0x7b5bb

UnknownScript_0x7b5bb: ; 0x7b5bb
	jumptextfaceplayer UnknownText_0x7b5c1
; 0x7b5be

UnknownScript_0x7b5be: ; 0x7b5be
	jumptextfaceplayer UnknownText_0x7b60d
; 0x7b5c1

UnknownText_0x7b5c1: ; 0x7b5c1
	db $0, "You can't climb", $4f
	db "ledges.", $51
	db "But you can jump", $4f
	db "down from them to", $55
	db "take a shortcut.", $57
; 0x7b60d

UnknownText_0x7b60d: ; 0x7b60d
	db $0, "Different kinds of", $4f
	db "#MON appear", $55
	db "past here.", $51
	db "If you want to", $4f
	db "catch them all,", $51
	db "you have to look", $4f
	db "everywhere.", $57
; 0x7b674

Route2946Gate_MapEventHeader: ; 0x7b674
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 1, GROUP_ROUTE_46, MAP_ROUTE_46
	warp_def $0, $5, 2, GROUP_ROUTE_46, MAP_ROUTE_46
	warp_def $7, $4, 1, GROUP_ROUTE_29, MAP_ROUTE_29
	warp_def $7, $5, 1, GROUP_ROUTE_29, MAP_ROUTE_29

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event $43, 8, 4, $9, $0, 255, 255, $80, 0, UnknownScript_0x7b5bb, $ffff
	person_event $27, 8, 10, $4, $10, 255, 255, $a0, 0, UnknownScript_0x7b5be, $ffff
; 0x7b6a8



