Route16Gate_MapScriptHeader: ; 0x733e3
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x733e9, $0000

	; callback count
	db 0
; 0x733e9

UnknownScript_0x733e9: ; 0x733e9
	end
; 0x733ea

OfficerScript_0x733ea: ; 0x733ea
	jumptextfaceplayer UnknownText_0x73408
; 0x733ed

UnknownScript_0x733ed: ; 0x733ed
	checkitem BICYCLE
	iffalse UnknownScript_0x733f3
	end
; 0x733f3

UnknownScript_0x733f3: ; 0x733f3
	showemote $0, $2, 15
	spriteface $0, $1
	loadfont
	2writetext UnknownText_0x73496
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x73405
	end
; 0x73405

MovementData_0x73405: ; 0x73405
	step_right
	turn_head_left
	step_end
; 0x73408

UnknownText_0x73408: ; 0x73408
	db $0, "CYCLING ROAD", $4f
	db "starts here.", $51
	db "It's all downhill,", $4f
	db "so it's totally", $55
	db "exhilarating.", $51
	db "It's a great sort", $4f
	db "of feeling that", $51
	db "you can't get from", $4f
	db "a ship or train.", $57
; 0x73496

UnknownText_0x73496: ; 0x73496
	db $0, "Hey! Whoa! Stop!", $51
	db "You can't go out", $4f
	db "on the CYCLING", $51
	db "ROAD without a", $4f
	db "BICYCLE.", $57
; 0x734df

Route16Gate_MapEventHeader: ; 0x734df
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $0, 4, GROUP_ROUTE_16, MAP_ROUTE_16
	warp_def $5, $0, 5, GROUP_ROUTE_16, MAP_ROUTE_16
	warp_def $4, $9, 2, GROUP_ROUTE_16, MAP_ROUTE_16
	warp_def $5, $9, 3, GROUP_ROUTE_16, MAP_ROUTE_16

	; xy triggers
	db 2
	xy_trigger 0, $4, $5, $0, UnknownScript_0x733ed, $0, $0
	xy_trigger 0, $5, $5, $0, UnknownScript_0x733ed, $0, $0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 6, 9, $6, $0, 255, 255, $90, 0, OfficerScript_0x733ea, $ffff
; 0x73516

