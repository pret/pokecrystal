	enum_start
	enum tradeanim_next_command
tradeanim_next: macro
	db tradeanim_next_command ; 00
endm

	enum tradeanim_show_givemon_data_command
tradeanim_show_givemon_data: macro
	db tradeanim_show_givemon_data_command ; 01
endm

	enum tradeanim_show_getmon_data_command
tradeanim_show_getmon_data: macro
	db tradeanim_show_getmon_data_command ; 02
endm

	enum tradeanim_enter_link_tube_command
tradeanim_enter_link_tube: macro
	db tradeanim_enter_link_tube_command ; 03
endm

__enum__ set $5

	enum tradeanim_exit_link_tube_command
tradeanim_exit_link_tube: macro
	db tradeanim_exit_link_tube_command ; 05
endm

	enum tradeanim_tube_to_ot_command
tradeanim_tube_to_ot: macro
	db tradeanim_tube_to_ot_command ; 06
endm

__enum__ set $e

	enum tradeanim_tube_to_player_command
tradeanim_tube_to_player: macro
	db tradeanim_tube_to_player_command ; 0e
endm

__enum__ set $16

	enum tradeanim_sent_to_ot_text_command
tradeanim_sent_to_ot_text: macro
	db tradeanim_sent_to_ot_text_command ; 16
endm

	enum tradeanim_ot_bids_farewell_command
tradeanim_ot_bids_farewell: macro
	db tradeanim_ot_bids_farewell_command ; 17
endm

	enum tradeanim_take_care_of_text_command
tradeanim_take_care_of_text: macro
	db tradeanim_take_care_of_text_command ; 18
endm

	enum tradeanim_ot_sends_text_1_command
tradeanim_ot_sends_text_1: macro
	db tradeanim_ot_sends_text_1_command ; 19
endm

	enum tradeanim_ot_sends_text_2_command
tradeanim_ot_sends_text_2: macro
	db tradeanim_ot_sends_text_2_command ; 1a
endm

	enum tradeanim_setup_givemon_scroll_command
tradeanim_setup_givemon_scroll: macro
	db tradeanim_setup_givemon_scroll_command ; 1b
endm

	enum tradeanim_do_givemon_scroll_command
tradeanim_do_givemon_scroll: macro
	db tradeanim_do_givemon_scroll_command ; 1c
endm

	enum tradeanim_frontpic_scroll_command
tradeanim_frontpic_scroll: macro
	db tradeanim_frontpic_scroll_command ; 1d
endm

	enum tradeanim_textbox_scroll_command
tradeanim_textbox_scroll: macro
	db tradeanim_textbox_scroll_command ; 1e
endm

	enum tradeanim_scroll_out_right_command
tradeanim_scroll_out_right: macro
	db tradeanim_scroll_out_right_command ; 1f
endm

__enum__ set $21

	enum tradeanim_wait_80_command
tradeanim_wait_80: macro
	db tradeanim_wait_80_command ; 21
endm

	enum tradeanim_wait_40_command
tradeanim_wait_40: macro
	db tradeanim_wait_40_command ; 22
endm

	enum tradeanim_rocking_ball_command
tradeanim_rocking_ball: macro
	db tradeanim_rocking_ball_command ; 23
endm

	enum tradeanim_drop_ball_command
tradeanim_drop_ball: macro
	db tradeanim_drop_ball_command ; 24
endm

	enum tradeanim_wait_anim_command
tradeanim_wait_anim: macro
	db tradeanim_wait_anim_command ; 25
endm

__enum__ set $27

	enum tradeanim_poof_command
tradeanim_poof: macro
	db tradeanim_poof_command ; 27
endm

	enum tradeanim_bulge_through_tube_command
tradeanim_bulge_through_tube: macro
	db tradeanim_bulge_through_tube_command ; 28
endm

	enum tradeanim_give_trademon_sfx_command
tradeanim_give_trademon_sfx: macro
	db tradeanim_give_trademon_sfx_command ; 29
endm

	enum tradeanim_get_trademon_sfx_command
tradeanim_get_trademon_sfx: macro
	db tradeanim_get_trademon_sfx_command ; 2a
endm

	enum tradeanim_end_command
tradeanim_end: macro
	db tradeanim_end_command ; 2b
endm

	enum tradeanim_animate_frontpic_command
tradeanim_animate_frontpic: macro
	db tradeanim_animate_frontpic_command ; 2c
endm

	enum tradeanim_wait_96_command
tradeanim_wait_96: macro
	db tradeanim_wait_96_command ; 2d
endm

	enum tradeanim_wait_80_if_ot_egg_command
tradeanim_wait_80_if_ot_egg: macro
	db tradeanim_wait_80_if_ot_egg_command ; 2e
endm

	enum tradeanim_wait_180_if_ot_egg_command
tradeanim_wait_180_if_ot_egg: macro
	db tradeanim_wait_180_if_ot_egg_command ; 2f
endm


; Mobile
	enum_start 1

	enum mobiletradeanim_showgivemon_command
mobiletradeanim_showgivemon: macro
	db mobiletradeanim_showgivemon_command ; 01
endm

	enum mobiletradeanim_02_command
mobiletradeanim_02: macro
	db mobiletradeanim_02_command ; 02
endm

	enum mobiletradeanim_sendmon_command
mobiletradeanim_sendmon: macro
	db mobiletradeanim_sendmon_command ; 03
endm

__enum__ set $05

	enum mobiletradeanim_05_command
mobiletradeanim_05: macro
	db mobiletradeanim_05_command ; 05
endm

	enum mobiletradeanim_06_command
mobiletradeanim_06: macro
	db mobiletradeanim_06_command ; 06
endm

	enum mobiletradeanim_07_command
mobiletradeanim_07: macro
	db mobiletradeanim_07_command ; 07
endm

	enum mobiletradeanim_receivemon_command
mobiletradeanim_receivemon: macro
	db mobiletradeanim_receivemon_command ; 08
endm

__enum__ set $0b

	enum mobiletradeanim_showgetmon_command
mobiletradeanim_showgetmon: macro
	db mobiletradeanim_showgetmon_command ; 0b
endm

	enum mobiletradeanim_end_command
mobiletradeanim_end: macro
	db mobiletradeanim_end_command ; 0c
endm

	enum mobiletradeanim_showgtsgivemon_command
mobiletradeanim_showgtsgivemon: macro
	db mobiletradeanim_showgtsgivemon_command ; 0d
endm

	enum mobiletradeanim_showgtsgetmon_command
mobiletradeanim_showgtsgetmon: macro
	db mobiletradeanim_showgtsgetmon_command ; 0e
endm

	enum mobiletradeanim_0f_command
mobiletradeanim_0f: macro
	db mobiletradeanim_0f_command ; 0f
endm

	enum mobiletradeanim_10_command
mobiletradeanim_10: macro
	db mobiletradeanim_10_command ; 10
endm

	enum mobiletradeanim_11_command
mobiletradeanim_11: macro
	db mobiletradeanim_11_command ; 11
endm

	enum mobiletradeanim_12_command
mobiletradeanim_12: macro
	db mobiletradeanim_12_command ; 12
endm

	enum mobiletradeanim_showoddegg_command
mobiletradeanim_showoddegg: macro
	db mobiletradeanim_showoddegg_command ; 13
endm
