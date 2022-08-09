	object_const_def
	const BATTLETOWERHALLWAY_RECEPTIONIST

BattleTowerHallway_MapScripts:
	def_scene_scripts
	scene_script BattleTowerHallwayEnterScene, SCENE_BATTLETOWERHALLWAY_ENTER
	scene_script BattleTowerHallwayNoopScene,  SCENE_BATTLETOWERHALLWAY_NOOP

	def_callbacks

BattleTowerHallwayEnterScene:
	sdefer BattleTowerHallwayChooseBattleRoomScript
	setscene SCENE_BATTLETOWERHALLWAY_NOOP
	; fallthrough
BattleTowerHallwayNoopScene:
	end

BattleTowerHallwayChooseBattleRoomScript:
	follow BATTLETOWERHALLWAY_RECEPTIONIST, PLAYER
	callasm .asm_load_battle_room
	sjump .WalkToChosenBattleRoom

.asm_load_battle_room
	ldh a, [rSVBK]
	push af

	ld a, BANK(wBTChoiceOfLvlGroup)
	ldh [rSVBK], a
	ld a, [wBTChoiceOfLvlGroup]
	ld [wScriptVar], a

	pop af
	ldh [rSVBK], a
	ret

; enter different rooms for different levels to battle against
; at least it should look like that
; because all warps lead to the same room
.WalkToChosenBattleRoom:
	ifequal 3, .L30L40
	ifequal 4, .L30L40
	ifequal 5, .L50L60
	ifequal 6, .L50L60
	ifequal 7, .L70L80
	ifequal 8, .L70L80
	ifequal 9, .L90L100
	ifequal 10, .L90L100
	applymovement BATTLETOWERHALLWAY_RECEPTIONIST, MovementData_BattleTowerHallwayWalkTo1020Room
	sjump .EnterBattleRoom

.L30L40:
	applymovement BATTLETOWERHALLWAY_RECEPTIONIST, MovementData_BattleTowerHallwayWalkTo3040Room
	sjump .EnterBattleRoom

.L50L60:
	applymovement BATTLETOWERHALLWAY_RECEPTIONIST, MovementData_BattleTowerHallwayWalkTo5060Room
	sjump .EnterBattleRoom

.L70L80:
	applymovement BATTLETOWERHALLWAY_RECEPTIONIST, MovementData_BattleTowerHallwayWalkTo7080Room
	sjump .EnterBattleRoom

.L90L100:
	applymovement BATTLETOWERHALLWAY_RECEPTIONIST, MovementData_BattleTowerHallwayWalkTo90100Room
	sjump .EnterBattleRoom

.EnterBattleRoom:
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

	def_warp_events
	warp_event 11,  1, BATTLE_TOWER_ELEVATOR, 1
	warp_event  5,  0, BATTLE_TOWER_BATTLE_ROOM, 1
	warp_event  7,  0, BATTLE_TOWER_BATTLE_ROOM, 1
	warp_event  9,  0, BATTLE_TOWER_BATTLE_ROOM, 1
	warp_event 13,  0, BATTLE_TOWER_BATTLE_ROOM, 1
	warp_event 15,  0, BATTLE_TOWER_BATTLE_ROOM, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerHallway_MapEvents, -1
