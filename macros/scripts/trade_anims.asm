; DoTradeAnimation.JumpTable indexes (see engine/movies/trade_animation.asm)
	const_def

	const tradeanim_next_command ; $00
tradeanim_next: MACRO
	db tradeanim_next_command
ENDM

	const tradeanim_show_givemon_data_command ; $01
tradeanim_show_givemon_data: MACRO
	db tradeanim_show_givemon_data_command
ENDM

	const tradeanim_show_getmon_data_command ; $02
tradeanim_show_getmon_data: MACRO
	db tradeanim_show_getmon_data_command
ENDM

	const tradeanim_enter_link_tube_command ; $03
tradeanim_enter_link_tube: MACRO
	db tradeanim_enter_link_tube_command
ENDM

	const_skip ; continues tradeanim_enter_link_tube_command

	const tradeanim_exit_link_tube_command ; $05
tradeanim_exit_link_tube: MACRO
	db tradeanim_exit_link_tube_command
ENDM

	const tradeanim_tube_to_ot_command ; $06
tradeanim_tube_to_ot: MACRO
	db tradeanim_tube_to_ot_command
ENDM

	const_skip 7 ; continues tradeanim_tube_to_ot_command

	const tradeanim_tube_to_player_command ; $0e
tradeanim_tube_to_player: MACRO
	db tradeanim_tube_to_player_command
ENDM

	const_skip 7 ; continues tradeanim_tube_to_player_command

	const tradeanim_sent_to_ot_text_command ; $16
tradeanim_sent_to_ot_text: MACRO
	db tradeanim_sent_to_ot_text_command
ENDM

	const tradeanim_ot_bids_farewell_command ; $17
tradeanim_ot_bids_farewell: MACRO
	db tradeanim_ot_bids_farewell_command
ENDM

	const tradeanim_take_care_of_text_command ; $18
tradeanim_take_care_of_text: MACRO
	db tradeanim_take_care_of_text_command
ENDM

	const tradeanim_ot_sends_text_1_command ; $19
tradeanim_ot_sends_text_1: MACRO
	db tradeanim_ot_sends_text_1_command
ENDM

	const tradeanim_ot_sends_text_2_command ; $1a
tradeanim_ot_sends_text_2: MACRO
	db tradeanim_ot_sends_text_2_command
ENDM

	const tradeanim_setup_givemon_scroll_command ; $1b
tradeanim_setup_givemon_scroll: MACRO
	db tradeanim_setup_givemon_scroll_command
ENDM

	const tradeanim_do_givemon_scroll_command ; $1c
tradeanim_do_givemon_scroll: MACRO
	db tradeanim_do_givemon_scroll_command
ENDM

	const tradeanim_frontpic_scroll_command ; $1d
tradeanim_frontpic_scroll: MACRO
	db tradeanim_frontpic_scroll_command
ENDM

	const tradeanim_textbox_scroll_command ; $1e
tradeanim_textbox_scroll: MACRO
	db tradeanim_textbox_scroll_command
ENDM

	const tradeanim_scroll_out_right_command ; $1f
tradeanim_scroll_out_right: MACRO
	db tradeanim_scroll_out_right_command
ENDM

	const_skip ; continues tradeanim_scroll_out_right_command

	const tradeanim_wait_80_command ; $21
tradeanim_wait_80: MACRO
	db tradeanim_wait_80_command
ENDM

	const tradeanim_wait_40_command ; $22
tradeanim_wait_40: MACRO
	db tradeanim_wait_40_command
ENDM

	const tradeanim_rocking_ball_command ; $23
tradeanim_rocking_ball: MACRO
	db tradeanim_rocking_ball_command
ENDM

	const tradeanim_drop_ball_command ; $24
tradeanim_drop_ball: MACRO
	db tradeanim_drop_ball_command
ENDM

	const tradeanim_wait_anim_command ; $25
tradeanim_wait_anim: MACRO
	db tradeanim_wait_anim_command
ENDM

	const_skip ; continues tradeanim_wait_anim_command

	const tradeanim_poof_command ; $27
tradeanim_poof: MACRO
	db tradeanim_poof_command
ENDM

	const tradeanim_bulge_through_tube_command ; $28
tradeanim_bulge_through_tube: MACRO
	db tradeanim_bulge_through_tube_command
ENDM

	const tradeanim_give_trademon_sfx_command ; $29
tradeanim_give_trademon_sfx: MACRO
	db tradeanim_give_trademon_sfx_command
ENDM

	const tradeanim_get_trademon_sfx_command ; $2a
tradeanim_get_trademon_sfx: MACRO
	db tradeanim_get_trademon_sfx_command
ENDM

	const tradeanim_end_command ; $2b
tradeanim_end: MACRO
	db tradeanim_end_command
ENDM

	const tradeanim_animate_frontpic_command ; $2c
tradeanim_animate_frontpic: MACRO
	db tradeanim_animate_frontpic_command
ENDM

	const tradeanim_wait_96_command ; $2d
tradeanim_wait_96: MACRO
	db tradeanim_wait_96_command
ENDM

	const tradeanim_wait_80_if_ot_egg_command ; $2e
tradeanim_wait_80_if_ot_egg: MACRO
	db tradeanim_wait_80_if_ot_egg_command
ENDM

	const tradeanim_wait_180_if_ot_egg_command ; $2f
tradeanim_wait_180_if_ot_egg: MACRO
	db tradeanim_wait_180_if_ot_egg_command
ENDM

; Mobile
	const_def $01

	const mobiletradeanim_showgivemon_command ; $01
mobiletradeanim_showgivemon: MACRO
	db mobiletradeanim_showgivemon_command
ENDM

	const mobiletradeanim_02_command ; $02
mobiletradeanim_02: MACRO
	db mobiletradeanim_02_command
ENDM

	const mobiletradeanim_sendmon_command ; $03
mobiletradeanim_sendmon: MACRO
	db mobiletradeanim_sendmon_command
ENDM

	const_skip ; continues mobiletradeanim_sendmon_command

	const mobiletradeanim_05_command ; $05
mobiletradeanim_05: MACRO
	db mobiletradeanim_05_command
ENDM

	const mobiletradeanim_06_command ; $06
mobiletradeanim_06: MACRO
	db mobiletradeanim_06_command
ENDM

	const mobiletradeanim_07_command ; $07
mobiletradeanim_07: MACRO
	db mobiletradeanim_07_command
ENDM

	const mobiletradeanim_receivemon_command ; $08
mobiletradeanim_receivemon: MACRO
	db mobiletradeanim_receivemon_command
ENDM

	const_skip 2 ; continues mobiletradeanim_receivemon_command

	const mobiletradeanim_showgetmon_command ; $0b
mobiletradeanim_showgetmon: MACRO
	db mobiletradeanim_showgetmon_command
ENDM

	const mobiletradeanim_end_command ; $0c
mobiletradeanim_end: MACRO
	db mobiletradeanim_end_command
ENDM

	const mobiletradeanim_showgtsgivemon_command ; $0d
mobiletradeanim_showgtsgivemon: MACRO
	db mobiletradeanim_showgtsgivemon_command
ENDM

	const mobiletradeanim_showgtsgetmon_command ; $0e
mobiletradeanim_showgtsgetmon: MACRO
	db mobiletradeanim_showgtsgetmon_command
ENDM

	const mobiletradeanim_0f_command ; $0f
mobiletradeanim_0f: MACRO
	db mobiletradeanim_0f_command
ENDM

	const mobiletradeanim_10_command ; $10
mobiletradeanim_10: MACRO
	db mobiletradeanim_10_command
ENDM

	const mobiletradeanim_11_command ; $11
mobiletradeanim_11: MACRO
	db mobiletradeanim_11_command
ENDM

	const mobiletradeanim_12_command ; $12
mobiletradeanim_12: MACRO
	db mobiletradeanim_12_command
ENDM

	const mobiletradeanim_showoddegg_command ; $13
mobiletradeanim_showoddegg: MACRO
	db mobiletradeanim_showoddegg_command
ENDM
