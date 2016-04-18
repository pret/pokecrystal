Script_ForcedMovement:: ; 0x1253d
	checkcode VAR_FACING
	if_equal DOWN, .down
	if_equal UP, .up
	if_equal LEFT, .left
	if_equal RIGHT, .right
	end
; 0x12550

.up ; 0x12550
	applymovement PLAYER, .MovementData_up
	end
; 0x12555

.down ; 0x12555
	applymovement PLAYER, .MovementData_down
	end
; 0x1255a

.right ; 0x1255a
	applymovement PLAYER, .MovementData_right
	end
; 0x1255f

.left ; 0x1255f
	applymovement PLAYER, .MovementData_left
	end
; 0x12564

.MovementData_up: ; 0x12564
	step_dig 16
	turn_in_down
	step_dig 16
	turn_head_down
	step_end
; 0x1256b

.MovementData_down: ; 0x1256b
	step_dig 16
	turn_in_up
	step_dig 16
	turn_head_up
	step_end
; 0x12572

.MovementData_right: ; 0x12572
	step_dig 16
	turn_in_left
	step_dig 16
	turn_head_left
	step_end
; 0x12579

.MovementData_left: ; 0x12579
	step_dig 16
	turn_in_right
	step_dig 16
	turn_head_right
	step_end
; 0x12580
