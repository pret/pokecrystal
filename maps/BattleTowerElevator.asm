	object_const_def ; object_event constants
	const BATTLETOWERELEVATOR_RECEPTIONIST

BattleTowerElevator_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	db 0 ; callbacks

.Scene0:
	prioritysjump .RideElevator
	setscene SCENE_FINISHED
.Scene1:
	end

.RideElevator:
	follow BATTLETOWERELEVATOR_RECEPTIONIST, PLAYER
	applymovement BATTLETOWERELEVATOR_RECEPTIONIST, MovementData_BattleTowerElevatorReceptionistWalksIn
	applymovement PLAYER, MovementData_BattleTowerElevatorPlayerWalksIn
	setval BATTLETOWERACTION_0A
	special BattleTowerAction
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	follow BATTLETOWERELEVATOR_RECEPTIONIST, PLAYER
	applymovement BATTLETOWERELEVATOR_RECEPTIONIST, MovementData_BattleTowerElevatorExitElevator
	stopfollow
	warpsound
	disappear BATTLETOWERELEVATOR_RECEPTIONIST
	applymovement PLAYER, MovementData_BattleTowerElevatorExitElevator
	warpcheck
	end

MovementData_BattleTowerElevatorReceptionistWalksIn:
	step RIGHT
	turn_head DOWN
	step_end

MovementData_BattleTowerElevatorPlayerWalksIn:
	turn_head DOWN
	step_end

BattleTowerElevator_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  3, BATTLE_TOWER_HALLWAY, 1
	warp_event  2,  3, BATTLE_TOWER_HALLWAY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  1,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MovementData_BattleTowerElevatorReceptionistWalksIn, -1
