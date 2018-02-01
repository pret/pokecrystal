	const_def 2 ; object constants
	const BATTLETOWERHALLWAY_RECEPTIONIST

BattleTowerHallway_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_BATTLETOWERHALLWAY_NOTHING

	db 0 ; callbacks

.Scene0:
	priorityjump .ChooseBattleRoom
	setscene SCENE_BATTLETOWERHALLWAY_NOTHING
.Scene1:
	end

.ChooseBattleRoom:
	follow BATTLETOWERHALLWAY_RECEPTIONIST, PLAYER
	callasm .asm_load_battle_room
	jump .WalkToChosenBattleRoom

.asm_load_battle_room
	ld a, [rSVBK]
	push af

	ld a, BANK(wBTChoiceOfLvlGroup)
	ld [rSVBK], a
	ld a, [wBTChoiceOfLvlGroup]
	ld [ScriptVar], a

	pop af
	ld [rSVBK], a
	ret

; enter different rooms for different levels to battle against
; at least it should look like that
; because all warps lead to the same room
.WalkToChosenBattleRoom: ; 0x9f5dc
	if_equal 3, .L30L40
	if_equal 4, .L30L40
	if_equal 5, .L50L60
	if_equal 6, .L50L60
	if_equal 7, .L70L80
	if_equal 8, .L70L80
	if_equal 9, .L90L100
	if_equal 10, .L90L100
	applymovement BATTLETOWERHALLWAY_RECEPTIONIST, MovementData_BattleTowerHallwayWalkTo1020Room
	jump .EnterBattleRoom

.L30L40: ; 0x9f603
	applymovement BATTLETOWERHALLWAY_RECEPTIONIST, MovementData_BattleTowerHallwayWalkTo3040Room
	jump .EnterBattleRoom

.L50L60: ; 0x9f60a
	applymovement BATTLETOWERHALLWAY_RECEPTIONIST, MovementData_BattleTowerHallwayWalkTo5060Room
	jump .EnterBattleRoom

.L70L80: ; 0x9f611
	applymovement BATTLETOWERHALLWAY_RECEPTIONIST, MovementData_BattleTowerHallwayWalkTo7080Room
	jump .EnterBattleRoom

.L90L100: ; 0x9f618
	applymovement BATTLETOWERHALLWAY_RECEPTIONIST, MovementData_BattleTowerHallwayWalkTo90100Room
	jump .EnterBattleRoom

.EnterBattleRoom: ; 0x9f61f
	faceobject PLAYER, BATTLETOWERHALLWAY_RECEPTIONIST
	opentext
	writetext Text_PleaseStepThisWay
	waitbutton
	closetext
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

BattleTowerHallway_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 11, 1, 1, BATTLE_TOWER_ELEVATOR
	warp_event 5, 0, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_event 7, 0, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_event 9, 0, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_event 13, 0, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_event 15, 0, 1, BATTLE_TOWER_BATTLE_ROOM

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 11, 2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerHallway_MapEvents, -1
