const_value set 2
	const ROUTE1718GATE_OFFICER

Route1718Gate_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x7360d, 0

.MapCallbacks:
	db 0

UnknownScript_0x7360d:
	end

OfficerScript_0x7360e:
	jumptextfaceplayer UnknownText_0x7362c

UnknownScript_0x73611:
	checkitem BICYCLE
	iffalse UnknownScript_0x73617
	end

UnknownScript_0x73617:
	showemote EMOTE_SHOCK, ROUTE1718GATE_OFFICER, 15
	spriteface PLAYER, UP
	opentext
	writetext UnknownText_0x7364d
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x73629
	end

MovementData_0x73629:
	step RIGHT
	turn_head LEFT
	step_end

UnknownText_0x7362c:
	text "CYCLING ROAD"
	line "Uphill Starts Here"
	done

UnknownText_0x7364d:
	text "Hang on! Don't you"
	line "have a BICYCLE?"

	para "The CYCLING ROAD"
	line "is beyond here."

	para "You have to have a"
	line "BICYCLE to go on."
	done

Route1718Gate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 1, ROUTE_17
	warp_def $5, $0, 2, ROUTE_17
	warp_def $4, $9, 1, ROUTE_18
	warp_def $5, $9, 2, ROUTE_18

.XYTriggers:
	db 2
	xy_trigger 0, $4, $5, $0, UnknownScript_0x73611, $0, $0
	xy_trigger 0, $5, $5, $0, UnknownScript_0x73611, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x7360e, -1
