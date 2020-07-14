setup_command: MACRO
	const \1_command
\1 EQUS "db \1_command"
ENDM

; MapSetupCommands indexes (see data/maps/setup_script_pointers.asm)
	const_def
	setup_command map_enable_lcd                 ; 00
	setup_command map_disable_lcd                ; 01
	setup_command map_init_sound                 ; 02
	setup_command map_play_music                 ; 03
	setup_command map_restart_music              ; 04
	setup_command map_fade_to_music              ; 05
	setup_command map_fade_music_and_palettes    ; 06
	setup_command map_play_music_bike            ; 07
	setup_command map_force_music                ; 08
	setup_command map_fade_in_to_music           ; 09
	setup_command map_load_block_data            ; 0a
	setup_command map_load_connection_block_data ; 0b
	setup_command map_save_screen                ; 0c
	setup_command map_buffer_screen              ; 0d
	setup_command map_load_graphics              ; 0e
	setup_command map_load_tileset               ; 0f
	setup_command map_load_time_of_day           ; 10
	setup_command map_load_palettes              ; 11
	setup_command map_load_wild_mon_data         ; 12
	setup_command map_refresh_sprites            ; 13
	setup_command map_handle_new                 ; 14
	setup_command map_handle_continue            ; 15
	setup_command map_load_objects               ; 16
	setup_command map_enter_spawn_point          ; 17
	setup_command map_enter_connection           ; 18
	setup_command map_enter_warp                 ; 19
	setup_command map_load_attributes            ; 1a
	setup_command map_load_attributes_no_objects ; 1b
	setup_command map_clear_bg_palettes          ; 1c
	setup_command map_fade_out_palettes          ; 1d
	setup_command map_fade_in_palettes           ; 1e
	setup_command map_get_screen_coords          ; 1f
	setup_command map_get_warp_dest_coords       ; 20
	setup_command map_spawn_in_facing_down       ; 21
	setup_command map_spawn_player               ; 22
	setup_command map_refresh_player_coords      ; 23
	setup_command map_reset_player_object_action ; 24
	setup_command map_skip_update_sprites        ; 25
	setup_command map_update_roam_mons           ; 26
	setup_command map_jump_roam_mons             ; 27
	setup_command map_fade_out_music             ; 28
	setup_command map_activate_anims             ; 29
	setup_command map_suspend_anims              ; 2a
	setup_command map_apply_palettes             ; 2b
	setup_command map_enable_text_acceleration   ; 2c
	setup_command map_init_name_sign             ; 2d

	const_def -1, -1
	setup_command map_end                        ; ff
