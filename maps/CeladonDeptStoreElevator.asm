CeladonDeptStoreElevator_MapScriptHeader: ; 0x713ab
	; trigger count
	db 0

	; callback count
	db 0
; 0x713ad

MapCeladonDeptStoreElevatorSignpost0Script: ; 0x713ad
	loadfont
	elevator $53be
	loadmovesprites
	iffalse UnknownScript_0x713bd
	pause 5
	playsound $006e
	earthquake 60
	waitbutton
UnknownScript_0x713bd: ; 0x713bd
	end
; 0x713be

; elevator
UnknownText_0x713be: ; 0x713be
	text_waitbutton
	text_box $1504, 5, 5
	store_at $615
	text_waitbutton
	store_at $715
	text_dunno2
	store_at $815
	start_asm
; 0x713d0

INCBIN "baserom.gbc",$713d0,$713d8 - $713d0

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

