const_value set 2
	const BATTLETOWERHALLWAY_RECEPTIONIST

BattleTowerHallway_MapScriptHeader:
.SceneScripts:
	db 2
	scene_script .Scene0
	scene_script .Scene1

.MapCallbacks:
	db 0

.Scene0:
	priorityjump .ChooseBattleRoom
	setscene 1
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

BattleTowerHallway_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def 11, 1, 1, BATTLE_TOWER_ELEVATOR
	warp_def 5, 0, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_def 7, 0, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_def 9, 0, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_def 13, 0, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_def 15, 0, 1, BATTLE_TOWER_BATTLE_ROOM

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 11, 2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerHallway_MapEventHeader, -1
