GoldenrodDeptStoreElevator_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MapGoldenrodDeptStoreElevatorSignpost0Script:
	loadfont
	elevator Elevator_0x566e0
	loadmovesprites
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitbutton
	checkevent EVENT_WAREHOUSE_BLOCKED_OFF
	iftrue .Done
	checkevent EVENT_WAREHOUSE_LAYOUT_1
	iftrue .BoxLayout1
	checkevent EVENT_WAREHOUSE_LAYOUT_2
	iftrue .BoxLayout2
	checkevent EVENT_WAREHOUSE_LAYOUT_3
	iftrue .BoxLayout3
.BoxLayout3
	setevent EVENT_WAREHOUSE_LAYOUT_1
	clearevent EVENT_WAREHOUSE_LAYOUT_2
	clearevent EVENT_WAREHOUSE_LAYOUT_3
	end

.BoxLayout1
	clearevent EVENT_WAREHOUSE_LAYOUT_1
	setevent EVENT_WAREHOUSE_LAYOUT_2
	clearevent EVENT_WAREHOUSE_LAYOUT_3
	end

.BoxLayout2
	clearevent EVENT_WAREHOUSE_LAYOUT_1
	clearevent EVENT_WAREHOUSE_LAYOUT_2
	setevent EVENT_WAREHOUSE_LAYOUT_3
	end

.Done
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

.Warps:
	db 2
	warp_def $3, $1, 255, GROUP_GOLDENROD_DEPT_STORE_1F, MAP_GOLDENROD_DEPT_STORE_1F
	warp_def $3, $2, 255, GROUP_GOLDENROD_DEPT_STORE_1F, MAP_GOLDENROD_DEPT_STORE_1F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 0, 3, SIGNPOST_READ, MapGoldenrodDeptStoreElevatorSignpost0Script

.PersonEvents:
	db 0
