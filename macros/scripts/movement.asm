; MovementPointers indexes (see engine/overworld/movement.asm)
	const_def 0, 4

; Directional movements

	const movement_turn_head ; $00
MACRO turn_head
	db movement_turn_head | \1
ENDM

	const movement_turn_step ; $04
MACRO turn_step
	db movement_turn_step | \1
ENDM

	const movement_slow_step ; $08
MACRO slow_step
	db movement_slow_step | \1
ENDM

	const movement_step ; $0c
MACRO step
	db movement_step | \1
ENDM

	const movement_big_step ; $10
MACRO big_step
	db movement_big_step | \1
ENDM

	const movement_slow_slide_step ; $14
MACRO slow_slide_step
	db movement_slow_slide_step | \1
ENDM

	const movement_slide_step ; $18
MACRO slide_step
	db movement_slide_step | \1
ENDM

	const movement_fast_slide_step ; $1c
MACRO fast_slide_step
	db movement_fast_slide_step | \1
ENDM

	const movement_turn_away ; $20
MACRO turn_away
	db movement_turn_away | \1
ENDM

	const movement_turn_in ; $24
MACRO turn_in
	db movement_turn_in | \1
ENDM

	const movement_turn_waterfall ; $28
MACRO turn_waterfall
	db movement_turn_waterfall | \1
ENDM

	const movement_slow_jump_step ; $2c
MACRO slow_jump_step
	db movement_slow_jump_step | \1
ENDM

	const movement_jump_step ; $30
MACRO jump_step
	db movement_jump_step | \1
ENDM

	const movement_fast_jump_step ; $34
MACRO fast_jump_step
	db movement_fast_jump_step | \1
ENDM

DEF const_inc = 1

; Control
	const movement_remove_sliding ; $38
MACRO remove_sliding
	db movement_remove_sliding
ENDM

	const movement_set_sliding ; $39
MACRO set_sliding
	db movement_set_sliding
ENDM

	const movement_remove_fixed_facing ; $3a
MACRO remove_fixed_facing
	db movement_remove_fixed_facing
ENDM

	const movement_fix_facing ; $3b
MACRO fix_facing
	db movement_fix_facing
ENDM

	const movement_show_object ; $3c
MACRO show_object
	db movement_show_object
ENDM

	const movement_hide_object ; $3d
MACRO hide_object
	db movement_hide_object
ENDM

; Sleep

	const movement_step_sleep ; $3e
MACRO step_sleep
	if \1 <= 8
		db movement_step_sleep + \1 - 1
	else
		db movement_step_sleep + 8, \1
	endc
ENDM

	const_skip 8 ; all step_sleep values

	const movement_step_end ; $47
MACRO step_end
	db movement_step_end
ENDM

	const movement_step_48 ; $48
MACRO step_48
	db movement_step_48
	db \1 ; ???
ENDM

	const movement_remove_object ; $49
MACRO remove_object
	db movement_remove_object
ENDM

	const movement_step_loop ; $4a
MACRO step_loop
	db movement_step_loop
ENDM

	const movement_step_4b ; $4b
MACRO step_4b
	db movement_step_4b
ENDM

	const movement_teleport_from ; $4c
MACRO teleport_from
	db movement_teleport_from
ENDM

	const movement_teleport_to ; $4d
MACRO teleport_to
	db movement_teleport_to
ENDM

	const movement_skyfall ; $4e
MACRO skyfall
	db movement_skyfall
ENDM

	const movement_step_dig ; $4f
MACRO step_dig
	db movement_step_dig
	db \1 ; length
ENDM

	const movement_step_bump ; $50
MACRO step_bump
	db movement_step_bump
ENDM

	const movement_fish_got_bite ; $51
MACRO fish_got_bite
	db movement_fish_got_bite
ENDM

	const movement_fish_cast_rod ; $52
MACRO fish_cast_rod
	db movement_fish_cast_rod
ENDM

	const movement_hide_emote ; $53
MACRO hide_emote
	db movement_hide_emote
ENDM

	const movement_show_emote ; $54
MACRO show_emote
	db movement_show_emote
ENDM

	const movement_step_shake ; $55
MACRO step_shake
	db movement_step_shake
	db \1 ; displacement
ENDM

	const movement_tree_shake ; $56
MACRO tree_shake
	db movement_tree_shake
ENDM

	const movement_rock_smash ; $57
MACRO rock_smash
	db movement_rock_smash
	db \1 ; length
ENDM

	const movement_return_dig ; $58
MACRO return_dig
	db movement_return_dig
	db \1 ; length
ENDM

	const movement_skyfall_top ; $59
MACRO skyfall_top
	db movement_skyfall_top
ENDM

DEF NUM_MOVEMENT_CMDS EQU const_value
