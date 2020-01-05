MapSetupScripts:
; entries correspond to MAPSETUP_* constants (see constants/map_setup_constants.asm)
	dw MapSetupScript_Warp
	dw MapSetupScript_Continue
	dw MapSetupScript_ReloadMap
	dw MapSetupScript_Teleport
	dw MapSetupScript_Door
	dw MapSetupScript_Fall
	dw MapSetupScript_Connection
	dw MapSetupScript_LinkReturn
	dw MapSetupScript_Train
	dw MapSetupScript_Submenu
	dw MapSetupScript_BadWarp
	dw MapSetupScript_Fly

MapSetupScript_Teleport:
	db map_reset_player_object_action
MapSetupScript_Fly:
	db map_fade_out_palettes
	db map_jump_roam_mons
MapSetupScript_Warp:
	db map_disable_lcd
	db map_init_sound
	db map_enter_spawn_point
	db map_load_attributes
	db map_handle_new
	db map_spawn_player
	db map_refresh_player_coords
	db map_get_screen_coords
	db map_load_block_data
	db map_buffer_screen
	db map_load_graphics
	db map_load_time_of_day
	db map_load_objects
	db map_enable_lcd
	db map_load_palettes
	db map_spawn_in_facing_down
	db map_refresh_sprites
	db map_play_music_bike
	db map_fade_in_music
	db map_fade_in_palettes
	db map_activate_anims
	db map_load_wild_mon_data
	db map_end

MapSetupScript_BadWarp:
	db map_enter_spawn_point
	db map_load_attributes
	db map_handle_new
	db map_spawn_player
	db map_refresh_player_coords
	db map_get_screen_coords
	db map_load_block_data
	db map_buffer_screen
	db map_disable_lcd
	db map_load_graphics
	db map_load_time_of_day
	db map_fade_out_music
	db map_enable_lcd
	db map_load_objects
	db map_load_palettes
	db map_spawn_in_facing_down
	db map_refresh_sprites
	db map_fade_to_music
	db map_fade_in_palettes
	db map_activate_anims
	db map_load_wild_mon_data
	db map_end

MapSetupScript_Connection:
	db map_suspend_anims
	db map_enter_connection
	db map_load_attributes
	db map_handle_new
	db map_refresh_player_coords
	db map_load_block_data
	db map_load_tileset
	db map_save_screen
	db map_load_objects
	db map_fade_to_music
	db map_load_palettes
	db map_init_name_sign
	db map_apply_palettes
	db map_load_wild_mon_data
	db map_update_roam_mons
	db map_activate_anims
	db map_end

MapSetupScript_Fall:
	db map_reset_player_object_action
MapSetupScript_Door:
	db map_fade_out_palettes
MapSetupScript_Train:
	db map_enter_warp
	db map_load_attributes
	db map_get_warp_dest_coords
	db map_handle_new
	db map_refresh_player_coords
	db map_load_block_data
	db map_buffer_screen
	db map_disable_lcd
	db map_load_graphics
	db map_load_time_of_day
	db map_fade_out_music
	db map_enable_lcd
	db map_load_objects
	db map_load_palettes
	db map_refresh_sprites
	db map_fade_to_music
	db map_fade_in_palettes
	db map_activate_anims
	db map_load_wild_mon_data
	db map_update_roam_mons
	db map_end

MapSetupScript_ReloadMap:
	db map_fade_music_and_palettes
	db map_clear_bg_palettes
	db map_disable_lcd
	db map_init_sound
	db map_load_block_data
	db map_load_connection_block_data
	db map_load_graphics
	db map_load_time_of_day
	db map_enable_lcd
	db map_load_palettes
	db map_refresh_sprites
	db map_force_music
	db map_fade_in_palettes
	db map_activate_anims
	db map_load_wild_mon_data
	db map_end

MapSetupScript_LinkReturn:
	db map_fade_music_and_palettes
	db map_disable_lcd
	db map_init_sound
	db map_handle_new
	db map_load_block_data
	db map_buffer_screen
	db map_load_graphics
	db map_load_time_of_day
	db map_enable_lcd
	db map_load_palettes
	db map_refresh_sprites
	db map_play_music_bike
	db map_fade_in_palettes
	db map_activate_anims
	db map_load_wild_mon_data
	db map_enable_text_acceleration
	db map_end

MapSetupScript_Continue:
	db map_disable_lcd
	db map_init_sound
	db map_load_attributes_no_objects
	db map_get_screen_coords
	db map_handle_continue
	db map_load_block_data
	db map_load_connection_block_data
	db map_buffer_screen
	db map_load_graphics
	db map_load_time_of_day
	db map_enable_lcd
	db map_load_palettes
	db map_refresh_sprites
	db map_play_music_bike
	db map_fade_in_palettes
	db map_activate_anims
	db map_load_wild_mon_data
	db map_end

MapSetupScript_Submenu:
	db map_load_block_data
	db map_load_connection_block_data
	db map_end
