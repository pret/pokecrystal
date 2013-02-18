GoldenrodDeptStoreElevator_MapScriptHeader: ; 0x56697
	; trigger count
	db 0

	; callback count
	db 0
; 0x56699

MapGoldenrodDeptStoreElevatorSignpost0Script: ; 0x56699
	loadfont
	elevator $66e0
	loadmovesprites
	iffalse UnknownScript_0x566df
	pause 5
	playsound $006e
	earthquake 60
	waitbutton
	checkbit1 $0307
	iftrue UnknownScript_0x566df
	checkbit1 $0304
	iftrue UnknownScript_0x566cb
	checkbit1 $0305
	iftrue UnknownScript_0x566d5
	checkbit1 $0306
	iftrue UnknownScript_0x566c1
UnknownScript_0x566c1: ;0x566c1
	setbit1 $0304
	clearbit1 $0305
	clearbit1 $0306
	end
; 0x566cb

UnknownScript_0x566cb: ; 0x566cb
	clearbit1 $0304
	setbit1 $0305
	clearbit1 $0306
	end
; 0x566d5

UnknownScript_0x566d5: ; 0x566d5
	clearbit1 $0304
	clearbit1 $0305
	setbit1 $0306
	end
; 0x566df

UnknownScript_0x566df: ; 0x566df
	end
; 0x566e0

INCBIN "baserom.gbc",$566e0,$566fe - $566e0

GoldenrodDeptStoreElevator_MapEventHeader: ; 0x566fe
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
; 0x56713

