Route1718Gate_MapScriptHeader: ; 0x73607
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x7360d, $0000

	; callback count
	db 0
; 0x7360d

UnknownScript_0x7360d: ; 0x7360d
	end
; 0x7360e

OfficerScript_0x7360e: ; 0x7360e
	jumptextfaceplayer UnknownText_0x7362c
; 0x73611

UnknownScript_0x73611: ; 0x73611
	checkitem BICYCLE
	iffalse UnknownScript_0x73617
	end
; 0x73617

UnknownScript_0x73617: ; 0x73617
	showemote $0, $2, 15
	spriteface $0, UP
	loadfont
	writetext UnknownText_0x7364d
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x73629
	end
; 0x73629

MovementData_0x73629: ; 0x73629
	step_right
	turn_head_left
	step_end
; 0x7362c

UnknownText_0x7362c: ; 0x7362c
	text "CYCLING ROAD"
	line "Uphill Starts Here"
	done
; 0x7364d

UnknownText_0x7364d: ; 0x7364d
	text "Hang on! Don't you"
	line "have a BICYCLE?"

	para "The CYCLING ROAD"
	line "is beyond here."

	para "You have to have a"
	line "BICYCLE to go on."
	done
; 0x736b6

Route1718Gate_MapEventHeader: ; 0x736b6
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $0, 1, GROUP_ROUTE_17, MAP_ROUTE_17
	warp_def $5, $0, 2, GROUP_ROUTE_17, MAP_ROUTE_17
	warp_def $4, $9, 1, GROUP_ROUTE_18, MAP_ROUTE_18
	warp_def $5, $9, 2, GROUP_ROUTE_18, MAP_ROUTE_18

	; xy triggers
	db 2
	xy_trigger 0, $4, $5, $0, UnknownScript_0x73611, $0, $0
	xy_trigger 0, $5, $5, $0, UnknownScript_0x73611, $0, $0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 6, 9, $6, $0, 255, 255, $90, 0, OfficerScript_0x7360e, $ffff
; 0x736ed
