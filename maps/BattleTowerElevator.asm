BattleTowerElevator_MapScriptHeader: ; 0x9f558
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x9f562, $0000
	dw UnknownScript_0x9f567, $0000

	; callback count
	db 0
; 0x9f562

UnknownScript_0x9f562: ; 0x9f562
	priorityjump UnknownScript_0x9f568
	dotrigger $1
; 0x9f567

UnknownScript_0x9f567: ; 0x9f567
	end
; 0x9f568

UnknownScript_0x9f568: ; 0x9f568
	follow $2, $0
	applymovement $2, MovementData_0x9f58f
	applymovement $0, MovementData_0x9f592
	writebyte $a
	special $0086
	playsound SFX_ELEVATOR
	earthquake 60
	waitbutton
	follow $2, $0
	applymovement $2, MovementData_0x9e578
	stopfollow
	warpsound
	disappear $2
	applymovement $0, MovementData_0x9e578
	warpcheck
	end
; 0x9f58f

MovementData_0x9f58f: ; 0x9f58f
	step_right
	turn_head_down
	step_end
; 0x9f592

MovementData_0x9f592: ; 0x9f592
	turn_head_down
	step_end
; 0x9f594

BattleTowerElevator_MapEventHeader: ; 0x9f594
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $1, 1, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY
	warp_def $3, $2, 1, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_RECEPTIONIST, 6, 5, $9, $0, 255, 255, $0, 0, MovementData_0x9f58f, $ffff
; 0x9f5b1

