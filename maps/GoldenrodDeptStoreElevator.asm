GoldenrodDeptStoreElevator_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

MapGoldenrodDeptStoreElevatorSignpost0Script:
	loadfont
	elevator Elevator_0x566e0
	loadmovesprites
	iffalse UnknownScript_0x566df
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitbutton
	checkevent $0307
	iftrue UnknownScript_0x566df
	checkevent $0304
	iftrue UnknownScript_0x566cb
	checkevent $0305
	iftrue UnknownScript_0x566d5
	checkevent $0306
	iftrue UnknownScript_0x566c1
UnknownScript_0x566c1: ;0x566c1
	setevent $0304
	clearevent $0305
	clearevent $0306
	end

UnknownScript_0x566cb:
	clearevent $0304
	setevent $0305
	clearevent $0306
	end

UnknownScript_0x566d5:
	clearevent $0304
	clearevent $0305
	setevent $0306
	end

UnknownScript_0x566df:
	end


Elevator_0x566e0:
	db 7 ; floors
	db _B1F, 2, GROUP_GOLDENROD_DEPT_STORE_B1F, MAP_GOLDENROD_DEPT_STORE_B1F
	db _1F,  4, GROUP_GOLDENROD_DEPT_STORE_1F, MAP_GOLDENROD_DEPT_STORE_1F
	db _2F,  3, GROUP_GOLDENROD_DEPT_STORE_2F, MAP_GOLDENROD_DEPT_STORE_2F
	db _3F,  3, GROUP_GOLDENROD_DEPT_STORE_3F, MAP_GOLDENROD_DEPT_STORE_3F
	db _4F,  3, GROUP_GOLDENROD_DEPT_STORE_4F, MAP_GOLDENROD_DEPT_STORE_4F
	db _5F,  3, GROUP_GOLDENROD_DEPT_STORE_5F, MAP_GOLDENROD_DEPT_STORE_5F
	db _6F,  2, GROUP_GOLDENROD_DEPT_STORE_6F, MAP_GOLDENROD_DEPT_STORE_6F
	db $ff ; end


GoldenrodDeptStoreElevator_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $1, 255, GROUP_GOLDENROD_DEPT_STORE_1F, MAP_GOLDENROD_DEPT_STORE_1F
	warp_def $3, $2, 255, GROUP_GOLDENROD_DEPT_STORE_1F, MAP_GOLDENROD_DEPT_STORE_1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 0, 3, $0, MapGoldenrodDeptStoreElevatorSignpost0Script

	; people-events
	db 0
