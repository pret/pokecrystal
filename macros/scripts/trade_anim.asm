; DoTradeAnimation.JumpTable indexes (see engine/trade/animation.asm)
	enum_start

	enum tradeanim_next_command ; $00
tradeanim_next: macro
	db tradeanim_next_command
endm

	enum tradeanim_show_givemon_data_command ; $01
tradeanim_show_givemon_data: macro
	db tradeanim_show_givemon_data_command
endm

	enum tradeanim_show_getmon_data_command ; $02
tradeanim_show_getmon_data: macro
	db tradeanim_show_getmon_data_command
endm

	enum tradeanim_enter_link_tube_command ; $03
tradeanim_enter_link_tube: macro
	db tradeanim_enter_link_tube_command
endm

__enum__ set $5

	enum tradeanim_exit_link_tube_command ; $05
tradeanim_exit_link_tube: macro
	db tradeanim_exit_link_tube_command
endm

	enum tradeanim_tube_to_ot_command ; $06
tradeanim_tube_to_ot: macro
	db tradeanim_tube_to_ot_command
endm

__enum__ set $0e

	enum tradeanim_tube_to_player_command ; $0e
tradeanim_tube_to_player: macro
	db tradeanim_tube_to_player_command
endm

__enum__ set $16

	enum tradeanim_sent_to_ot_text_command ; $16
tradeanim_sent_to_ot_text: macro
	db tradeanim_sent_to_ot_text_command
endm

	enum tradeanim_ot_bids_farewell_command ; $17
tradeanim_ot_bids_farewell: macro
	db tradeanim_ot_bids_farewell_command
endm

	enum tradeanim_take_care_of_text_command ; $18
tradeanim_take_care_of_text: macro
	db tradeanim_take_care_of_text_command
endm

	enum tradeanim_ot_sends_text_1_command ; $19
tradeanim_ot_sends_text_1: macro
	db tradeanim_ot_sends_text_1_command
endm

	enum tradeanim_ot_sends_text_2_command ; $1a
tradeanim_ot_sends_text_2: macro
	db tradeanim_ot_sends_text_2_command
endm

	enum tradeanim_setup_givemon_scroll_command ; $1b
tradeanim_setup_givemon_scroll: macro
	db tradeanim_setup_givemon_scroll_command
endm

	enum tradeanim_do_givemon_scroll_command ; $1c
tradeanim_do_givemon_scroll: macro
	db tradeanim_do_givemon_scroll_command
endm

	enum tradeanim_frontpic_scroll_command ; $1d
tradeanim_frontpic_scroll: macro
	db tradeanim_frontpic_scroll_command
endm

	enum tradeanim_textbox_scroll_command ; $1e
tradeanim_textbox_scroll: macro
	db tradeanim_textbox_scroll_command
endm

	enum tradeanim_scroll_out_right_command ; $1f
tradeanim_scroll_out_right: macro
	db tradeanim_scroll_out_right_command
endm

__enum__ set $21

	enum tradeanim_wait_80_command ; $21
tradeanim_wait_80: macro
	db tradeanim_wait_80_command
endm

	enum tradeanim_wait_40_command ; $22
tradeanim_wait_40: macro
	db tradeanim_wait_40_command
endm

	enum tradeanim_rocking_ball_command ; $23
tradeanim_rocking_ball: macro
	db tradeanim_rocking_ball_command
endm

	enum tradeanim_drop_ball_command ; $24
tradeanim_drop_ball: macro
	db tradeanim_drop_ball_command
endm

	enum tradeanim_wait_anim_command ; $25
tradeanim_wait_anim: macro
	db tradeanim_wait_anim_command
endm

__enum__ set $27

	enum tradeanim_poof_command ; $27
tradeanim_poof: macro
	db tradeanim_poof_command
endm

	enum tradeanim_bulge_through_tube_command ; $28
tradeanim_bulge_through_tube: macro
	db tradeanim_bulge_through_tube_command
endm

	enum tradeanim_give_trademon_sfx_command ; $29
tradeanim_give_trademon_sfx: macro
	db tradeanim_give_trademon_sfx_command
endm

	enum tradeanim_get_trademon_sfx_command ; $2a
tradeanim_get_trademon_sfx: macro
	db tradeanim_get_trademon_sfx_command
endm

	enum tradeanim_end_command ; $2b
tradeanim_end: macro
	db tradeanim_end_command
endm

	enum tradeanim_animate_frontpic_command ; $2c
tradeanim_animate_frontpic: macro
	db tradeanim_animate_frontpic_command
endm

	enum tradeanim_wait_96_command ; $2d
tradeanim_wait_96: macro
	db tradeanim_wait_96_command
endm

	enum tradeanim_wait_80_if_ot_egg_command ; $2e
tradeanim_wait_80_if_ot_egg: macro
	db tradeanim_wait_80_if_ot_egg_command
endm

	enum tradeanim_wait_180_if_ot_egg_command ; $2f
tradeanim_wait_180_if_ot_egg: macro
	db tradeanim_wait_180_if_ot_egg_command
endm


; Mobile
	enum_start $01

	enum mobiletradeanim_showgivemon_command ; $01
mobiletradeanim_showgivemon: macro
	db mobiletradeanim_showgivemon_command
endm

	enum mobiletradeanim_02_command ; $02
mobiletradeanim_02: macro
	db mobiletradeanim_02_command
endm

	enum mobiletradeanim_sendmon_command ; $03
mobiletradeanim_sendmon: macro
	db mobiletradeanim_sendmon_command
endm

__enum__ set $05

	enum mobiletradeanim_05_command ; $05
mobiletradeanim_05: macro
	db mobiletradeanim_05_command
endm

	enum mobiletradeanim_06_command ; $06
mobiletradeanim_06: macro
	db mobiletradeanim_06_command
endm

	enum mobiletradeanim_07_command ; $07
mobiletradeanim_07: macro
	db mobiletradeanim_07_command
endm

	enum mobiletradeanim_receivemon_command ; $08
mobiletradeanim_receivemon: macro
	db mobiletradeanim_receivemon_command
endm

__enum__ set $0b

	enum mobiletradeanim_showgetmon_command ; $0b
mobiletradeanim_showgetmon: macro
	db mobiletradeanim_showgetmon_command
endm

	enum mobiletradeanim_end_command ; $0c
mobiletradeanim_end: macro
	db mobiletradeanim_end_command
endm

	enum mobiletradeanim_showgtsgivemon_command ; $0d
mobiletradeanim_showgtsgivemon: macro
	db mobiletradeanim_showgtsgivemon_command
endm

	enum mobiletradeanim_showgtsgetmon_command ; $0e
mobiletradeanim_showgtsgetmon: macro
	db mobiletradeanim_showgtsgetmon_command
endm

	enum mobiletradeanim_0f_command ; $0f
mobiletradeanim_0f: macro
	db mobiletradeanim_0f_command
endm

	enum mobiletradeanim_10_command ; $10
mobiletradeanim_10: macro
	db mobiletradeanim_10_command
endm

	enum mobiletradeanim_11_command ; $11
mobiletradeanim_11: macro
	db mobiletradeanim_11_command
endm

	enum mobiletradeanim_12_command ; $12
mobiletradeanim_12: macro
	db mobiletradeanim_12_command
endm

	enum mobiletradeanim_showoddegg_command ; $13
mobiletradeanim_showoddegg: macro
	db mobiletradeanim_showoddegg_command
endm
