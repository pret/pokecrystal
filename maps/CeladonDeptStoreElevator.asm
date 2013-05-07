CeladonDeptStoreElevator_MapScriptHeader: ; 0x713ab
	; trigger count
	db 0

	; callback count
	db 0
; 0x713ad

MapCeladonDeptStoreElevatorSignpost0Script: ; 0x713ad
	loadfont
	elevator Elevator_0x713be
	loadmovesprites
	iffalse UnknownScript_0x713bd
	pause 5
	playsound $006e
	earthquake 60
	waitbutton
UnknownScript_0x713bd: ; 0x713bd
	end
; 0x713be


Elevator_0x713be: ; 0x713be
	db 6 ; floors
	db _1F,  4, GROUP_CELADON_DEPT_STORE_1F, MAP_CELADON_DEPT_STORE_1F
	db _2F,  3, GROUP_CELADON_DEPT_STORE_2F, MAP_CELADON_DEPT_STORE_2F
	db _3F,  3, GROUP_CELADON_DEPT_STORE_3F, MAP_CELADON_DEPT_STORE_3F
	db _4F,  3, GROUP_CELADON_DEPT_STORE_4F, MAP_CELADON_DEPT_STORE_4F
	db _5F,  3, GROUP_CELADON_DEPT_STORE_5F, MAP_CELADON_DEPT_STORE_5F
	db _6F,  2, GROUP_CELADON_DEPT_STORE_6F, MAP_CELADON_DEPT_STORE_6F
	db $ff ; end
; 0x713d8


CeladonDeptStoreElevator_MapEventHeader: ; 0x713d8
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $1, 255, GROUP_CELADON_DEPT_STORE_1F, MAP_CELADON_DEPT_STORE_1F
	warp_def $3, $2, 255, GROUP_CELADON_DEPT_STORE_1F, MAP_CELADON_DEPT_STORE_1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 0, 3, $0, MapCeladonDeptStoreElevatorSignpost0Script

	; people-events
	db 0
; 0x713ed

