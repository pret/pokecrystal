; hMapEntryMethod values
; MapSetupScripts indexes (see data/maps/setup_scripts.asm)
	const_def $f1
	const MAPSETUP_WARP       ; f1
	const MAPSETUP_CONTINUE   ; f2
	const MAPSETUP_RELOADMAP  ; f3
	const MAPSETUP_TELEPORT   ; f4
	const MAPSETUP_DOOR       ; f5
	const MAPSETUP_FALL       ; f6
	const MAPSETUP_CONNECTION ; f7
	const MAPSETUP_LINKRETURN ; f8
	const MAPSETUP_TRAIN      ; f9
	const MAPSETUP_SUBMENU    ; fa
	const MAPSETUP_BADWARP    ; fb
	const MAPSETUP_FLY        ; fc

; MapSetupCommands indexes (see engine/overworld/map_setup.asm)
	const_def
	const map_enable_lcd                 ; 00
	const map_disable_lcd                ; 01
	const map_init_sound                 ; 02
	const map_play_music                 ; 03
	const map_restart_music              ; 04
	const map_fade_to_music              ; 05
	const map_fade_music_and_palettes    ; 06
	const map_play_music_bike            ; 07
	const map_force_music                ; 08
	const map_fade_in_music              ; 09
	const map_load_block_data            ; 0a
	const map_load_connection_block_data ; 0b
	const map_save_screen                ; 0c
	const map_buffer_screen              ; 0d
	const map_load_graphics              ; 0e
	const map_load_tileset               ; 0f
	const map_load_time_of_day           ; 10
	const map_load_palettes              ; 11
	const map_load_wild_mon_data         ; 12
	const map_refresh_sprites            ; 13
	const map_handle_new                 ; 14
	const map_handle_continue            ; 15
	const map_load_objects               ; 16
	const map_enter_spawn_point          ; 17
	const map_enter_connection           ; 18
	const map_enter_warp                 ; 19
	const map_load_attributes            ; 1a
	const map_load_attributes_no_objects ; 1b
	const map_clear_bg_palettes          ; 1c
	const map_fade_out_palettes          ; 1d
	const map_fade_in_palettes           ; 1e
	const map_get_screen_coords          ; 1f
	const map_get_warp_dest_coords       ; 20
	const map_spawn_in_facing_down       ; 21
	const map_spawn_player               ; 22
	const map_refresh_player_coords      ; 23
	const map_reset_player_object_action ; 24
	const map_skip_update_sprites        ; 25
	const map_update_roam_mons           ; 26
	const map_jump_roam_mons             ; 27
	const map_fade_out_music             ; 28
	const map_activate_anims             ; 29
	const map_suspend_anims              ; 2a
	const map_apply_palettes             ; 2b
	const map_enable_text_acceleration   ; 2c
	const map_init_name_sign             ; 2d
map_end EQU -1

; callback types
	const_def 1
	const MAPCALLBACK_TILES
	const MAPCALLBACK_OBJECTS
	const MAPCALLBACK_CMDQUEUE
	const MAPCALLBACK_SPRITES
	const MAPCALLBACK_NEWMAP
