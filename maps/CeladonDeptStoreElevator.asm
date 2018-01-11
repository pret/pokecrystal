CeladonDeptStoreElevator_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

CeladonDeptStoreElevatorScript:
	opentext
	elevator CeladonDeptStoreElevatorData
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
.Done:
	end

CeladonDeptStoreElevatorData:
	db 6 ; floors
	elevfloor FLOOR_1F, 4, CELADON_DEPT_STORE_1F
	elevfloor FLOOR_2F, 3, CELADON_DEPT_STORE_2F
	elevfloor FLOOR_3F, 3, CELADON_DEPT_STORE_3F
	elevfloor FLOOR_4F, 3, CELADON_DEPT_STORE_4F
	elevfloor FLOOR_5F, 3, CELADON_DEPT_STORE_5F
	elevfloor FLOOR_6F, 2, CELADON_DEPT_STORE_6F
	db -1 ; end

CeladonDeptStoreElevator_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 1, 3, -1, CELADON_DEPT_STORE_1F
	warp_def 2, 3, -1, CELADON_DEPT_STORE_1F

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 3, 0, BGEVENT_READ, CeladonDeptStoreElevatorScript

.ObjectEvents:
	db 0
