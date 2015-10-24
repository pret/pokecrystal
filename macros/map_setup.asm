; Command descriptions from Condensation water's scripting compendium.	enum_start
	enum_start

	enum map_lcd_on_command
map_lcd_on: MACRO              ; 00 = Turn LCD on
	db map_lcd_on_command
ENDM

	enum map_lcd_off_command
map_lcd_off: MACRO             ; 01 = Turn LCD off
	db map_lcd_off_command
ENDM

	enum map_sound_off_command
map_sound_off: MACRO           ; 02 = Turn speakers off
	db map_sound_off_command
ENDM

	enum map_music_command
map_music: MACRO               ; 03 = Music check for current map/ special check for bug catcher contest
	db map_music_command
ENDM

	enum map_start_music_command
map_start_music: MACRO         ; 04 = Start map music anew
	db map_start_music_command
ENDM

	enum map_fade_music_command
map_fade_music: MACRO          ; 05 = Music check for current map / special check for Bug Contest/ music with FadeOut (old) and FadeIn
	db map_fade_music_command
ENDM

	enum map_fade_command
map_fade: MACRO                ; 06 = Fade out music + screen
	db map_fade_command
ENDM

	enum map_bike_music_command
map_bike_music: MACRO          ; 07 = If HIRO is on bike = bike music, else play map music
	db map_bike_music_command
ENDM

	enum map_music_force_command
map_music_force: MACRO         ; 08 = Play map music
	db map_music_force_command
ENDM

	enum map_max_volume_command
map_max_volume: MACRO          ; 09 = Turn music to highest volume
	db map_max_volume_command
ENDM

	enum map_load_blocks_command
map_load_blocks: MACRO         ; 0A = Write map data to MapRAM
	db map_load_blocks_command
ENDM

	enum map_connection_blocks_command
map_connection_blocks: MACRO   ; 0B = Compute map’s connection pars and write into MapRAM
	db map_connection_blocks_command
ENDM

	enum map_save_screen_command
map_save_screen: MACRO         ; 0C = Write current part of map into temporary memory
	db map_save_screen_command
ENDM

	enum map_buffer_screen_command
map_buffer_screen: MACRO       ; 0D = Write current part of map into read-from memory
	db map_buffer_screen_command
ENDM

	enum map_load_graphics_command
map_load_graphics: MACRO       ; 0E = Write tileset header to ram/ load tileset/ load sprite tiles/ load special tiles
	db map_load_graphics_command
ENDM

	enum map_load_tileset_header_command
map_load_tileset_header: MACRO ; 0F = Write tileset header to ram
	db map_load_tileset_header_command
ENDM

	enum map_time_of_day_command
map_time_of_day: MACRO         ; 10 = Compute time of day/ Update screen
	db map_time_of_day_command
ENDM

	enum map_palettes_command
map_palettes: MACRO            ; 11 = Load map palettes
	db map_palettes_command
ENDM

	enum map_wildmons_command
map_wildmons: MACRO            ; 12 = Load probabilities for wild Pokémon battles
	db map_wildmons_command
ENDM

	enum map_sprites_command
map_sprites: MACRO             ; 13 = Delete sprite data and draw new sprites
	db map_sprites_command
ENDM

	enum map_change_callback_command
map_change_callback: MACRO     ; 14 = Check 2nd script header for 05 and 03 callbacks
	db map_change_callback_command
ENDM

	enum map_start_callback_command
map_start_callback: MACRO      ; 15 = Check 2nd script header for 03 callbacks
	db map_start_callback_command
ENDM

	enum map_load_objects_command
map_load_objects: MACRO        ; 16 = Analyze people data anew and check 2nd script header for 02 callbacks
	db map_load_objects_command
ENDM

	enum map_load_spawn_command
map_load_spawn: MACRO          ; 17 = Writes arrival data for arrival by flying/Blackout from table 05:5319 to ram
	db map_load_spawn_command
ENDM

	enum map_load_connection_command
map_load_connection: MACRO     ; 18 = Writes arrival data for entering a map by connection to ram
	db map_load_connection_command
ENDM

	enum map_load_warp_command
map_load_warp: MACRO           ; 19 = Write warp data to ram when entering warp
	db map_load_warp_command
ENDM

	enum map_attributes_command
map_attributes: MACRO          ; 1A = Load complete map data (primary, secondary, event, script headers)
	db map_attributes_command
ENDM

	enum map_attributes_2_command
map_attributes_2: MACRO        ; 1B = Same as 1A, but some settings aren’t loaded new from the rom, such as hide function of the people events
	db map_attributes_2_command
ENDM

	enum map_clear_bg_palettes_command
map_clear_bg_palettes: MACRO   ; 1C = Fill palette data with FFFF (=white)
	db map_clear_bg_palettes_command
ENDM

	enum map_fade_out_palettes_command
map_fade_out_palettes: MACRO   ; 1D = All BG pallet color are converted to 0|0 (Pal0, Col0), all sprite colors to x|0 (FadeOut)
	db map_fade_out_palettes_command
ENDM

	enum map_fade_in_palettes_command
map_fade_in_palettes: MACRO    ; 1E = Palette FadeIn
	db map_fade_in_palettes_command
ENDM

	enum map_anchor_screen_command
map_anchor_screen: MACRO       ; 1F = Compute position of upper left-most block visible on screen
	db map_anchor_screen_command
ENDM

	enum map_warp_face_command
map_warp_face: MACRO           ; 20 = Position computation when HIRO leaves a warp
	db map_warp_face_command
ENDM

	enum map_face_down_command
map_face_down: MACRO           ; 21 = Set HIRO’s facing to “down”
	db map_face_down_command
ENDM

	enum map_spawn_coord_command
map_spawn_coord: MACRO         ; 22 = Prepare HIRO data for arrival by flight
	db map_spawn_coord_command
ENDM

	enum map_player_coord_command
map_player_coord: MACRO        ; 23 = Compute HIRO x/y data anew
	db map_player_coord_command
ENDM

	enum map_prolong_sprites_command
map_prolong_sprites: MACRO     ; 24 = Prolong old sprites before removing them
	db map_prolong_sprites_command
ENDM

	enum map_delay_sprites_command
map_delay_sprites: MACRO       ; 25 = Delay rendering new sprites
	db map_delay_sprites_command
ENDM

	enum map_update_roam_command
map_update_roam: MACRO         ; 26 = Compute chances to meet Raikou, Entei or Suicune
	db map_update_roam_command
ENDM

	enum map_keep_roam_command
map_keep_roam: MACRO           ; 27 = Recover chances to meet Raikou, Entei or Suicune
	db map_keep_roam_command
ENDM

	enum map_fade_out_music_command
map_fade_out_music: MACRO      ; 28 = Temporarily stop music playing
	db map_fade_out_music_command
ENDM

	enum map_animations_on_command
map_animations_on: MACRO       ; 29 = Activate animations
	db map_animations_on_command
ENDM

	enum map_animations_off_command
map_animations_off: MACRO      ; 2A = Deactivate animations
	db map_animations_off_command
ENDM

	enum map_keep_palettes_command
map_keep_palettes: MACRO       ; 2B = Recover all palettes
	db map_keep_palettes_command
ENDM

	enum map_text_scroll_off_command
map_text_scroll_off: MACRO     ; 2C = Turn off text scroll (for town name overlays)
	db map_text_scroll_off_command
ENDM

	enum map_stop_script_command
map_stop_script: MACRO         ; 2D = Deactivate code prolonging
	db map_stop_script_command
ENDM

map_end_setup_script: MACRO
	db -1
ENDM