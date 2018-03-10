GoldenrodDeptStoreElevator_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodDeptStoreElevatorScript:
	opentext
	elevator GoldenrodDeptStoreElevatorData
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	checkevent EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	iftrue .Done
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	iftrue .BoxLayout1
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	iftrue .BoxLayout2
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	iftrue .BoxLayout3
.BoxLayout3:
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	end

.BoxLayout1:
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	end

.BoxLayout2:
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	end

.Done:
	end

GoldenrodDeptStoreElevatorData:
	db 7 ; floors
	elevfloor FLOOR_B1F, 2, GOLDENROD_DEPT_STORE_B1F
	elevfloor FLOOR_1F,  4, GOLDENROD_DEPT_STORE_1F
	elevfloor FLOOR_2F,  3, GOLDENROD_DEPT_STORE_2F
	elevfloor FLOOR_3F,  3, GOLDENROD_DEPT_STORE_3F
	elevfloor FLOOR_4F,  3, GOLDENROD_DEPT_STORE_4F
	elevfloor FLOOR_5F,  3, GOLDENROD_DEPT_STORE_5F
	elevfloor FLOOR_6F,  2, GOLDENROD_DEPT_STORE_6F
	db -1 ; end

GoldenrodDeptStoreElevator_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  3, GOLDENROD_DEPT_STORE_1F, -1
	warp_event  2,  3, GOLDENROD_DEPT_STORE_1F, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, GoldenrodDeptStoreElevatorScript

	db 0 ; object events
