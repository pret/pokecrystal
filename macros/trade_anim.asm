	enum_start
	enum tradeanim_next_command
tradeanim_next: macro
	db tradeanim_next_command
endm

	enum tradeanim_show_givemon_data_command
tradeanim_show_givemon_data: macro
	db tradeanim_show_givemon_data_command
endm

	enum tradeanim_show_getmon_data_command
tradeanim_show_getmon_data: macro
	db tradeanim_show_getmon_data_command
endm

	enum tradeanim_enter_link_tube_command
tradeanim_enter_link_tube: macro
	db tradeanim_enter_link_tube_command
endm

__enum__ set $5

	enum tradeanim_exit_link_tube_command
tradeanim_exit_link_tube: macro
	db tradeanim_exit_link_tube_command
endm

	enum tradeanim_tube_to_ot_command
tradeanim_tube_to_ot: macro
	db tradeanim_tube_to_ot_command
endm

__enum__ set $e

	enum tradeanim_tube_to_player_command
tradeanim_tube_to_player: macro
	db tradeanim_tube_to_player_command
endm

__enum__ set $16

	enum tradeanim_sent_to_ot_text_command
tradeanim_sent_to_ot_text: macro
	db tradeanim_sent_to_ot_text_command
endm

	enum tradeanim_ot_bids_farewell_command
tradeanim_ot_bids_farewell: macro
	db tradeanim_ot_bids_farewell_command
endm

	enum tradeanim_take_care_of_text_command
tradeanim_take_care_of_text: macro
	db tradeanim_take_care_of_text_command
endm

	enum tradeanim_ot_sends_text_1_command
tradeanim_ot_sends_text_1: macro
	db tradeanim_ot_sends_text_1_command
endm

	enum tradeanim_ot_sends_text_2_command
tradeanim_ot_sends_text_2: macro
	db tradeanim_ot_sends_text_2_command
endm

	enum tradeanim_setup_givemon_scroll_command
tradeanim_setup_givemon_scroll: macro
	db tradeanim_setup_givemon_scroll_command
endm

	enum tradeanim_do_givemon_scroll_command
tradeanim_do_givemon_scroll: macro
	db tradeanim_do_givemon_scroll_command
endm

	enum tradeanim_1d_command
tradeanim_1d: macro
	db tradeanim_1d_command
endm

	enum tradeanim_1e_command
tradeanim_1e: macro
	db tradeanim_1e_command
endm

	enum tradeanim_scroll_out_right_command
tradeanim_scroll_out_right: macro
	db tradeanim_scroll_out_right_command
endm

__enum__ set $21

	enum tradeanim_wait_80_command
tradeanim_wait_80: macro
	db tradeanim_wait_80_command
endm

	enum tradeanim_wait_40_command
tradeanim_wait_40: macro
	db tradeanim_wait_40_command
endm

	enum tradeanim_rocking_ball_command
tradeanim_rocking_ball: macro
	db tradeanim_rocking_ball_command
endm

	enum tradeanim_drop_ball_command
tradeanim_drop_ball: macro
	db tradeanim_drop_ball_command
endm

	enum tradeanim_wait_anim_command
tradeanim_wait_anim: macro
	db tradeanim_wait_anim_command
endm

__enum__ set $27

	enum tradeanim_poof_command
tradeanim_poof: macro
	db tradeanim_poof_command
endm

	enum tradeanim_bulge_through_tube_command
tradeanim_bulge_through_tube: macro
	db tradeanim_bulge_through_tube_command
endm

	enum tradeanim_give_trademon_sfx_command
tradeanim_give_trademon_sfx: macro
	db tradeanim_give_trademon_sfx_command
endm

	enum tradeanim_get_trademon_sfx_command
tradeanim_get_trademon_sfx: macro
	db tradeanim_get_trademon_sfx_command
endm

	enum tradeanim_end_command
tradeanim_end: macro
	db tradeanim_end_command
endm

	enum tradeanim_animate_frontpic_command
tradeanim_animate_frontpic: macro
	db tradeanim_animate_frontpic_command
endm

	enum tradeanim_wait_96_command
tradeanim_wait_96: macro
	db tradeanim_wait_96_command
endm

	enum tradeanim_wait_80_if_ot_egg_command
tradeanim_wait_80_if_ot_egg: macro
	db tradeanim_wait_80_if_ot_egg_command
endm

	enum tradeanim_wait_180_if_ot_egg_command
tradeanim_wait_180_if_ot_egg: macro
	db tradeanim_wait_180_if_ot_egg_command
endm

