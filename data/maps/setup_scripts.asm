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
	db map_prolong_sprites
MapSetupScript_Fly:
	db map_fade_out_palettes
	db map_keep_roam
MapSetupScript_Warp:
	db map_lcd_off
	db map_sound_off
	db map_load_spawn
	db map_load_attributes
	db map_change_callback
	db map_spawn_coord
	db map_player_coord
	db map_anchor_screen
	db map_load_blocks
	db map_buffer_screen
	db map_load_graphics
	db map_time_of_day
	db map_load_objects
	db map_lcd_on
	db map_palettes
	db map_face_down
	db map_sprites
	db map_bike_music
	db map_max_volume
	db map_fade_in_palettes
	db map_animations_on
	db map_wildmons
	db map_end

MapSetupScript_BadWarp:
	db map_load_spawn
	db map_load_attributes
	db map_change_callback
	db map_spawn_coord
	db map_player_coord
	db map_anchor_screen
	db map_load_blocks
	db map_buffer_screen
	db map_lcd_off
	db map_load_graphics
	db map_time_of_day
	db map_fade_out_music
	db map_lcd_on
	db map_load_objects
	db map_palettes
	db map_face_down
	db map_sprites
	db map_fade_music
	db map_fade_in_palettes
	db map_animations_on
	db map_wildmons
	db map_end

MapSetupScript_Connection:
	db map_animations_off
	db map_load_connection
	db map_load_attributes
	db map_change_callback
	db map_player_coord
	db map_load_blocks
	db map_load_tileset
	db map_save_screen
	db map_load_objects
	db map_fade_music
	db map_palettes
	db map_stop_script
	db map_keep_palettes
	db map_wildmons
	db map_update_roam
	db map_animations_on
	db map_end

MapSetupScript_Fall:
	db map_prolong_sprites
MapSetupScript_Door:
	db map_fade_out_palettes
MapSetupScript_Train:
	db map_load_warp
	db map_load_attributes
	db map_warp_face
	db map_change_callback
	db map_player_coord
	db map_load_blocks
	db map_buffer_screen
	db map_lcd_off
	db map_load_graphics
	db map_time_of_day
	db map_fade_out_music
	db map_lcd_on
	db map_load_objects
	db map_palettes
	db map_sprites
	db map_fade_music
	db map_fade_in_palettes
	db map_animations_on
	db map_wildmons
	db map_update_roam
	db map_end

MapSetupScript_ReloadMap:
	db map_fade
	db map_clear_bg_palettes
	db map_lcd_off
	db map_sound_off
	db map_load_blocks
	db map_connection_blocks
	db map_load_graphics
	db map_time_of_day
	db map_lcd_on
	db map_palettes
	db map_sprites
	db map_music_force
	db map_fade_in_palettes
	db map_animations_on
	db map_wildmons
	db map_end

MapSetupScript_LinkReturn:
	db map_fade
	db map_lcd_off
	db map_sound_off
	db map_change_callback
	db map_load_blocks
	db map_buffer_screen
	db map_load_graphics
	db map_time_of_day
	db map_lcd_on
	db map_palettes
	db map_sprites
	db map_bike_music
	db map_fade_in_palettes
	db map_animations_on
	db map_wildmons
	db map_text_scroll_off
	db map_end

MapSetupScript_Continue:
	db map_lcd_off
	db map_sound_off
	db map_load_attributes_2
	db map_anchor_screen
	db map_start_callback
	db map_load_blocks
	db map_connection_blocks
	db map_buffer_screen
	db map_load_graphics
	db map_time_of_day
	db map_lcd_on
	db map_palettes
	db map_sprites
	db map_bike_music
	db map_fade_in_palettes
	db map_animations_on
	db map_wildmons
	db map_end

MapSetupScript_Submenu:
	db map_load_blocks
	db map_connection_blocks
	db map_end
