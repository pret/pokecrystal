	enum_start

; Directional movements

	enum movement_turn_head
turn_head: macro
	db movement_turn_head | \1 ; $00
	endm

__enum__ = __enum__ + 3

	enum movement_turn_step
turn_step: macro
	db movement_turn_step | \1 ; $04
	endm

__enum__ = __enum__ + 3

	enum movement_slow_step
slow_step: macro
	db movement_slow_step | \1; $08
	endm

__enum__ = __enum__ + 3

	enum movement_step
step: macro
	db movement_step | \1 ; $0c
	endm

__enum__ = __enum__ + 3

	enum movement_big_step
big_step: macro
	db movement_big_step | \1 ; $10
	endm

__enum__ = __enum__ + 3

	enum movement_slow_slide_step
slow_slide_step: macro
	db movement_slow_slide_step | \1 ; $14
	endm

__enum__ = __enum__ + 3

	enum movement_slide_step
slide_step: macro
	db movement_slide_step | \1 ; $18
	endm

__enum__ = __enum__ + 3

	enum movement_fast_slide_step
fast_slide_step: macro
	db movement_fast_slide_step | \1 ; $1c
	endm

__enum__ = __enum__ + 3

	enum movement_turn_away
turn_away: macro
	db movement_turn_away | \1 ; $20
	endm

__enum__ = __enum__ + 3

	enum movement_turn_in
turn_in: macro
	db movement_turn_in | \1 ; $24
	endm

__enum__ = __enum__ + 3

	enum movement_turn_waterfall
turn_waterfall: macro
	db movement_turn_waterfall | \1 ; $28
	endm

__enum__ = __enum__ + 3

	enum movement_slow_jump_step
slow_jump_step: macro
	db movement_slow_jump_step | \1 ; $2c
	endm

__enum__ = __enum__ + 3

	enum movement_jump_step
jump_step: macro
	db movement_jump_step | \1 ; $30
	endm

__enum__ = __enum__ + 3

	enum movement_fast_jump_step
fast_jump_step: macro
	db movement_fast_jump_step | \1 ; $34
	endm

__enum__ = __enum__ + 3

; Control
	enum movement_remove_sliding
remove_sliding: macro
	db movement_remove_sliding ; $38
	endm

	enum movement_set_sliding
set_sliding: macro
	db movement_set_sliding ; $39
	endm

	enum movement_remove_fixed_facing
remove_fixed_facing: macro
	db movement_remove_fixed_facing ; $3a
	endm

	enum movement_fix_facing
fix_facing: macro
	db movement_fix_facing ; $3b
	endm

	enum movement_show_person
show_person: macro
	db movement_show_person ; $3c
	endm

	enum movement_hide_person
hide_person: macro
	db movement_hide_person ; $3d
	endm

; Sleep

	enum movement_step_sleep
step_sleep: macro
if \1 <= 8
	db movement_step_sleep + \1 - 1
else
	db movement_step_sleep + 8, \1
endc
endm

__enum__ = __enum__ + 8

	enum movement_step_end
step_end: macro
	db movement_step_end ; $47
	endm

; Whatever Movement_48 is, it takes a one-byte parameter
	enum movement_step_48
step_48: macro
	db movement_step_48
	db \1
	endm

	enum movement_remove_person
remove_person: macro
	db movement_remove_person ; $49
	endm

	enum movement_step_loop
step_loop: macro
	db movement_step_loop ; $4a
	endm

	enum movement_step_4b
step_4b: macro
	db movement_step_4b ; $4b
	endm

	enum movement_teleport_from
teleport_from: macro
	db movement_teleport_from ; $4c
	endm

	enum movement_teleport_to
teleport_to: macro
	db movement_teleport_to ; $4d
	endm

	enum movement_skyfall
skyfall: macro
	db movement_skyfall ; $4e
	endm

	enum movement_step_dig
step_dig: macro
	db movement_step_dig ; $4f
	db \1
	endm

	enum movement_step_bump
step_bump: macro
	db movement_step_bump ; $50
	endm

	enum movement_fish_got_bite
fish_got_bite: macro
	db movement_fish_got_bite ; $51
	endm

	enum movement_fish_cast_rod
fish_cast_rod: macro
	db movement_fish_cast_rod ; $52
	endm

	enum movement_hide_emote
hide_emote: macro
	db movement_hide_emote ; $53
	endm

	enum movement_show_emote
show_emote: macro
	db movement_show_emote ; $54
	endm

	enum movement_step_shake
step_shake: macro
	db movement_step_shake ; $55
	db \1 ; displacement
	endm

	enum movement_tree_shake
tree_shake: macro
	db movement_tree_shake
	endm

	enum movement_rock_smash
rock_smash: macro
	db movement_rock_smash ; $57
	db \1
	endm

	enum movement_return_dig
return_dig: macro
	db movement_return_dig ; $58
	db \1
	endm

	enum movement_skyfall_top
skyfall_top: macro
	db movement_skyfall_top ; $59
	endm
