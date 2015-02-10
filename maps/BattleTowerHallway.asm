BattleTowerHallway_MapScriptHeader: ; 0x9f5b1
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x9f5bb, $0000
	dw UnknownScript_0x9f5c0, $0000

	; callback count
	db 0
; 0x9f5bb

UnknownScript_0x9f5bb: ; 0x9f5bb
	priorityjump UnknownScript_0x9f5c1
	dotrigger $1
; 0x9f5c0

UnknownScript_0x9f5c0: ; 0x9f5c0
	end
; 0x9f5c1

UnknownScript_0x9f5c1: ; 0x9f5c1
	follow $2, $0
	callasm Function_0x9f5cb
	jump UnknownScript_0x9f5dc
; 0x9f5cb


Function_0x9f5cb: ; 0x9f5cb
	ld a, [rSVBK]
	push af

	ld a, 3
	ld [rSVBK], a
	ld a, [w3_d800]
	ld [ScriptVar], a

	pop af
	ld [rSVBK], a
	ret
; 0x9f5dc


UnknownScript_0x9f5dc: ; 0x9f5dc
	if_equal $3, UnknownScript_0x9f603
	if_equal $4, UnknownScript_0x9f603
	if_equal $5, UnknownScript_0x9f60a
	if_equal $6, UnknownScript_0x9f60a
	if_equal $7, UnknownScript_0x9f611
	if_equal $8, UnknownScript_0x9f611
	if_equal $9, UnknownScript_0x9f618
	if_equal $a, UnknownScript_0x9f618
	applymovement $2, MovementData_0x9e57a
	jump UnknownScript_0x9f61f
; 0x9f603

UnknownScript_0x9f603: ; 0x9f603
	applymovement $2, MovementData_0x9e57c
	jump UnknownScript_0x9f61f
; 0x9f60a

UnknownScript_0x9f60a: ; 0x9f60a
	applymovement $2, MovementData_0x9e586
	jump UnknownScript_0x9f61f
; 0x9f611

UnknownScript_0x9f611: ; 0x9f611
	applymovement $2, MovementData_0x9e584
	jump UnknownScript_0x9f61f
; 0x9f618

UnknownScript_0x9f618: ; 0x9f618
	applymovement $2, MovementData_0x9e582
	jump UnknownScript_0x9f61f
; 0x9f61f

UnknownScript_0x9f61f: ; 0x9f61f
	faceperson $0, $2
	loadfont
	writetext UnknownText_0x9ec26
	closetext
	loadmovesprites
	stopfollow
	applymovement $0, MovementData_0x9e576
	warpcheck
	end
; 0x9f62f

BattleTowerHallway_MapEventHeader: ; 0x9f62f
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $1, $b, 1, GROUP_BATTLE_TOWER_ELEVATOR, MAP_BATTLE_TOWER_ELEVATOR
	warp_def $0, $5, 1, GROUP_BATTLE_TOWER_BATTLE_ROOM, MAP_BATTLE_TOWER_BATTLE_ROOM
	warp_def $0, $7, 1, GROUP_BATTLE_TOWER_BATTLE_ROOM, MAP_BATTLE_TOWER_BATTLE_ROOM
	warp_def $0, $9, 1, GROUP_BATTLE_TOWER_BATTLE_ROOM, MAP_BATTLE_TOWER_BATTLE_ROOM
	warp_def $0, $d, 1, GROUP_BATTLE_TOWER_BATTLE_ROOM, MAP_BATTLE_TOWER_BATTLE_ROOM
	warp_def $0, $f, 1, GROUP_BATTLE_TOWER_BATTLE_ROOM, MAP_BATTLE_TOWER_BATTLE_ROOM

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_RECEPTIONIST, 6, 15, $6, $0, 255, 255, $0, 0, BattleTowerHallway_MapEventHeader, $ffff
; 0x9f660

