turn_head_down: macro
	db $00
	endm

turn_head_up: macro
	db $01
	endm

turn_head_left: macro
	db $02
	endm

turn_head_right: macro
	db $03
	endm

half_step_down: macro
	db $04
	endm

half_step_up: macro
	db $05
	endm

half_step_left: macro
	db $06
	endm

half_step_right: macro
	db $07
	endm

slow_step_down: macro
	db $08
	endm

slow_step_up: macro
	db $09
	endm

slow_step_left: macro
	db $0a
	endm

slow_step_right: macro
	db $0b
	endm

step_down: macro
	db $0c
	endm

step_up: macro
	db $0d
	endm

step_left: macro
	db $0e
	endm

step_right: macro
	db $0f
	endm

big_step_down: macro
	db $10
	endm

big_step_up: macro
	db $11
	endm

big_step_left: macro
	db $12
	endm

big_step_right: macro
	db $13
	endm

slow_slide_step_down: macro
	db $14
	endm

slow_slide_step_up: macro
	db $15
	endm

slow_slide_step_left: macro
	db $16
	endm

slow_slide_step_right: macro
	db $17
	endm

slide_step_down: macro
	db $18
	endm

slide_step_up: macro
	db $19
	endm

slide_step_left: macro
	db $1a
	endm

slide_step_right: macro
	db $1b
	endm

fast_slide_step_down: macro
	db $1c
	endm

fast_slide_step_up: macro
	db $1d
	endm

fast_slide_step_left: macro
	db $1e
	endm

fast_slide_step_right: macro
	db $1f
	endm

turn_away_down: macro
	db $20
	endm

turn_away_up: macro
	db $21
	endm

turn_away_left: macro
	db $22
	endm

turn_away_right: macro
	db $23
	endm

turn_in_down: macro
	db $24
	endm

turn_in_up: macro
	db $25
	endm

turn_in_left: macro
	db $26
	endm

turn_in_right: macro
	db $27
	endm

turn_waterfall_down: macro
	db $28
	endm

turn_waterfall_up: macro
	db $29
	endm

turn_waterfall_left: macro
	db $2a
	endm

turn_waterfall_right: macro
	db $2b
	endm

slow_jump_step_down: macro
	db $2c
	endm

slow_jump_step_up: macro
	db $2d
	endm

slow_jump_step_left: macro
	db $2e
	endm

slow_jump_step_right: macro
	db $2f
	endm

jump_step_down: macro
	db $30
	endm

jump_step_up: macro
	db $31
	endm

jump_step_left: macro
	db $32
	endm

jump_step_right: macro
	db $33
	endm

fast_jump_step_down: macro
	db $34
	endm

fast_jump_step_up: macro
	db $35
	endm

fast_jump_step_left: macro
	db $36
	endm

fast_jump_step_right: macro
	db $37
	endm

remove_fixed_facing: macro
	db $3a
	endm

fix_facing: macro
	db $3b
	endm

hide_person: macro
	db $3d
	endm

show_person: macro
	db $3e
	endm

accelerate_last: macro
	db $45
	endm

step_sleep: macro
	db $46
	db \1 ; duration
	endm

step_end: macro
	db $47
	endm

remove_person: macro
	db $49
	endm

teleport_from: macro
	db $4c
	endm

teleport_to: macro
	db $4d
	endm

skyfall: macro
	db $4e
	endm

step_wait5: macro
	db $4f
	endm

hide_emote: macro
	db $53
	endm

show_emote: macro
	db $54
	endm

step_shake: macro
	db $55
	db \1 ; displacement
	endm
