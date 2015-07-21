CeladonDeptStoreElevator_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MapCeladonDeptStoreElevatorSignpost0Script:
	loadfont
	elevator Elevator_0x713be
	loadmovesprites
	iffalse UnknownScript_0x713bd
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitbutton
UnknownScript_0x713bd:
	end


Elevator_0x713be:
	db 6 ; floors
	db _1F,  4, GROUP_CELADON_DEPT_STORE_1F, MAP_CELADON_DEPT_STORE_1F
	db _2F,  3, GROUP_CELADON_DEPT_STORE_2F, MAP_CELADON_DEPT_STORE_2F
	db _3F,  3, GROUP_CELADON_DEPT_STORE_3F, MAP_CELADON_DEPT_STORE_3F
	db _4F,  3, GROUP_CELADON_DEPT_STORE_4F, MAP_CELADON_DEPT_STORE_4F
	db _5F,  3, GROUP_CELADON_DEPT_STORE_5F, MAP_CELADON_DEPT_STORE_5F
	db _6F,  2, GROUP_CELADON_DEPT_STORE_6F, MAP_CELADON_DEPT_STORE_6F
	db $ff ; end


CeladonDeptStoreElevator_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $1, 255, GROUP_CELADON_DEPT_STORE_1F, MAP_CELADON_DEPT_STORE_1F
	warp_def $3, $2, 255, GROUP_CELADON_DEPT_STORE_1F, MAP_CELADON_DEPT_STORE_1F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 0, 3, SIGNPOST_READ, MapCeladonDeptStoreElevatorSignpost0Script

.PersonEvents:
	db 0
