Script_ForcedMovement::
	readvar VAR_FACING
	ifequal DOWN, .down
	ifequal UP, .up
	ifequal LEFT, .left
	ifequal RIGHT, .right
	end

.up
	applymovement PLAYER, .MovementData_up
	end

.down
	applymovement PLAYER, .MovementData_down
	end

.right
	applymovement PLAYER, .MovementData_right
	end

.left
	applymovement PLAYER, .MovementData_left
	end

.MovementData_up:
	step_dig 16
	turn_in DOWN
	step_dig 16
	turn_head DOWN
	step_resume

.MovementData_down:
	step_dig 16
	turn_in UP
	step_dig 16
	turn_head UP
	step_resume

.MovementData_right:
	step_dig 16
	turn_in LEFT
	step_dig 16
	turn_head LEFT
	step_resume

.MovementData_left:
	step_dig 16
	turn_in RIGHT
	step_dig 16
	turn_head RIGHT
	step_resume
