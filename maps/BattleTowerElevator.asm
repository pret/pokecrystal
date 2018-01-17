const_value set 2
	const BATTLETOWERELEVATOR_RECEPTIONIST

BattleTowerElevator_MapScripts:
.SceneScripts:
	db 2
	scene_script .Scene0
	scene_script .Scene1

.MapCallbacks:
	db 0

.Scene0:
	priorityjump .RideElevator
	setscene 1

.Scene1:
	end

.RideElevator:
	follow BATTLETOWERELEVATOR_RECEPTIONIST, PLAYER
	applymovement BATTLETOWERELEVATOR_RECEPTIONIST, MovementData_BattleTowerElevatorReceptionistWalksIn
	applymovement PLAYER, MovementData_BattleTowerElevatorPlayerWalksIn
	writebyte BATTLETOWERACTION_0A
	special Special_BattleTowerAction
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
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 1, 3, 1, BATTLE_TOWER_HALLWAY
	warp_def 2, 3, 1, BATTLE_TOWER_HALLWAY

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 1, 2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MovementData_BattleTowerElevatorReceptionistWalksIn, -1
