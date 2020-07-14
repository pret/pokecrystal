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
	map_reset_player_object_action
MapSetupScript_Fly:
	map_fade_out_palettes
	map_jump_roam_mons
MapSetupScript_Warp:
	map_disable_lcd
	map_init_sound
	map_enter_spawn_point
	map_load_attributes
	map_handle_new
	map_spawn_player
	map_refresh_player_coords
	map_get_screen_coords
	map_load_block_data
	map_buffer_screen
	map_load_graphics
	map_load_time_of_day
	map_load_objects
	map_enable_lcd
	map_load_palettes
	map_spawn_in_facing_down
	map_refresh_sprites
	map_play_music_bike
	map_fade_in_to_music
	map_fade_in_palettes
	map_activate_anims
	map_load_wild_mon_data
	map_end

MapSetupScript_BadWarp:
	map_enter_spawn_point
	map_load_attributes
	map_handle_new
	map_spawn_player
	map_refresh_player_coords
	map_get_screen_coords
	map_load_block_data
	map_buffer_screen
	map_disable_lcd
	map_load_graphics
	map_load_time_of_day
	map_fade_out_music
	map_enable_lcd
	map_load_objects
	map_load_palettes
	map_spawn_in_facing_down
	map_refresh_sprites
	map_fade_to_music
	map_fade_in_palettes
	map_activate_anims
	map_load_wild_mon_data
	map_end

MapSetupScript_Connection:
	map_suspend_anims
	map_enter_connection
	map_load_attributes
	map_handle_new
	map_refresh_player_coords
	map_load_block_data
	map_load_tileset
	map_save_screen
	map_load_objects
	map_fade_to_music
	map_load_palettes
	map_init_name_sign
	map_apply_palettes
	map_load_wild_mon_data
	map_update_roam_mons
	map_activate_anims
	map_end

MapSetupScript_Fall:
	map_reset_player_object_action
MapSetupScript_Door:
	map_fade_out_palettes
MapSetupScript_Train:
	map_enter_warp
	map_load_attributes
	map_get_warp_dest_coords
	map_handle_new
	map_refresh_player_coords
	map_load_block_data
	map_buffer_screen
	map_disable_lcd
	map_load_graphics
	map_load_time_of_day
	map_fade_out_music
	map_enable_lcd
	map_load_objects
	map_load_palettes
	map_refresh_sprites
	map_fade_to_music
	map_fade_in_palettes
	map_activate_anims
	map_load_wild_mon_data
	map_update_roam_mons
	map_end

MapSetupScript_ReloadMap:
	map_fade_music_and_palettes
	map_clear_bg_palettes
	map_disable_lcd
	map_init_sound
	map_load_block_data
	map_load_connection_block_data
	map_load_graphics
	map_load_time_of_day
	map_enable_lcd
	map_load_palettes
	map_refresh_sprites
	map_force_music
	map_fade_in_palettes
	map_activate_anims
	map_load_wild_mon_data
	map_end

MapSetupScript_LinkReturn:
	map_fade_music_and_palettes
	map_disable_lcd
	map_init_sound
	map_handle_new
	map_load_block_data
	map_buffer_screen
	map_load_graphics
	map_load_time_of_day
	map_enable_lcd
	map_load_palettes
	map_refresh_sprites
	map_play_music_bike
	map_fade_in_palettes
	map_activate_anims
	map_load_wild_mon_data
	map_enable_text_acceleration
	map_end

MapSetupScript_Continue:
	map_disable_lcd
	map_init_sound
	map_load_attributes_no_objects
	map_get_screen_coords
	map_handle_continue
	map_load_block_data
	map_load_connection_block_data
	map_buffer_screen
	map_load_graphics
	map_load_time_of_day
	map_enable_lcd
	map_load_palettes
	map_refresh_sprites
	map_play_music_bike
	map_fade_in_palettes
	map_activate_anims
	map_load_wild_mon_data
	map_end

MapSetupScript_Submenu:
	map_load_block_data
	map_load_connection_block_data
	map_end
