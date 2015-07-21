
RunMapSetupScript:: ; 15363
	ld a, [$ff9f]
	and $f
	dec a
	ld c, a
	ld b, 0
	ld hl, MapSetupScripts
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ReadMapSetupScript
	ret
; 15377

MapSetupScripts: ; 15377
	dw MapSetupScript1
	dw MapSetupScript2
	dw MapSetupScript3
	dw MapSetupScript4
	dw MapSetupScript5
	dw MapSetupScript6
	dw MapSetupScript7
	dw MapSetupScript8
	dw MapSetupScript9
	dw MapSetupScript10
	dw MapSetupScript11
	dw MapSetupScript12
; 1538f


; Command descriptions from Condensation water's scripting compendium.
	const_def
	const map_lcd_on              ; 00 = Turn LCD on
	const map_lcd_off             ; 01 = Turn LCD off
	const map_sound_off           ; 02 = Turn speakers off
	const map_music               ; 03 = Music check for current map/ special check for bug catcher contest
	const map_start_music         ; 04 = Start map music anew
	const map_fade_music          ; 05 = Music check for current map / special check for Bug Contest/ music with FadeOut (old) and FadeIn
	const map_fade                ; 06 = Fade out music + screen
	const map_bike_music          ; 07 = If HIRO is on bike = bike music, else play map music
	const map_music_force         ; 08 = Play map music
	const map_max_volume          ; 09 = Turn music to highest volume
	const map_load_blocks         ; 0A = Write map data to MapRAM
	const map_connection_blocks   ; 0B = Compute map’s connection pars and write into MapRAM
	const map_save_screen         ; 0C = Write current part of map into temporary memory
	const map_buffer_screen       ; 0D = Write current part of map into read-from memory
	const map_load_graphics       ; 0E = Write tileset header to ram/ load tileset/ load sprite tiles/ load special tiles
	const map_load_tileset_header ; 0F = Write tileset header to ram
	const map_time_of_day         ; 10 = Compute time of day/ Update screen
	const map_palettes            ; 11 = Load map palettes
	const map_wildmons            ; 12 = Load probabilities for wild Pokémon battles
	const map_sprites             ; 13 = Delete sprite data and draw new sprites
	const map_change_callback     ; 14 = Check 2nd script header for 05 and 03 callbacks
	const map_start_callback      ; 15 = Check 2nd script header for 03 callbacks
	const map_load_objects        ; 16 = Analyze people data anew and check 2nd script header for 02 callbacks
	const map_load_spawn          ; 17 = Writes arrival data for arrival by flying/Blackout from table 05:5319 to ram
	const map_load_connection     ; 18 = Writes arrival data for entering a map by connection to ram
	const map_load_warp           ; 19 = Write warp data to ram when entering warp
	const map_attributes          ; 1A = Load complete map data (primary, secondary, event, script headers)
	const map_attributes_2        ; 1B = Same as 1A, but some settings aren’t loaded new from the rom, such as hide function of the people events
	const map_clear_bg_palettes   ; 1C = Fill palette data with FFFF (=white)
	const map_fade_out_palettes   ; 1D = All BG pallet color are converted to 0|0 (Pal0, Col0), all sprite colors to x|0 (FadeOut)
	const map_fade_in_palettes    ; 1E = Palette FadeIn
	const map_anchor_screen       ; 1F = Compute position of upper left-most block visible on screen
	const map_warp_face           ; 20 = Position computation when HIRO leaves a warp
	const map_face_down           ; 21 = Set HIRO’s facing to “down”
	const map_spawn_coord         ; 22 = Prepare HIRO data for arrival by flight
	const map_player_coord        ; 23 = Compute HIRO x/y data anew
	const map_prolong_sprites     ; 24 = Prolong old sprites before removing them
	const map_delay_sprites       ; 25 = Delay rendering new sprites
	const map_update_roam         ; 26 = Compute chances to meet Raikou, Entei or Suicune
	const map_keep_roam           ; 27 = Recover chances to meet Raikou, Entei or Suicune
	const map_fade_out_music      ; 28 = Temporarily stop music playing
	const map_animations_on       ; 29 = Activate animations
	const map_animations_off      ; 2A = Deactivate animations
	const map_keep_palettes       ; 2B = Recover all palettes
	const map_text_scroll_off     ; 2C = Turn off text scroll (for town name overlays)
	const map_stop_script         ; 2D = Deactivate code prolonging


MapSetupScript4: ; 1538f
	db map_prolong_sprites

MapSetupScript12: ; 15390
	db map_fade_out_palettes
	db map_keep_roam

MapSetupScript1: ; 15392
	db map_lcd_off
	db map_sound_off
	db map_load_spawn
	db map_attributes
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
	db -1

MapSetupScript11: ; 153a9
	db map_load_spawn
	db map_attributes
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
	db -1

MapSetupScript7: ; 153bf
	db map_animations_off
	db map_load_connection
	db map_attributes
	db map_change_callback
	db map_player_coord
	db map_load_blocks
	db map_load_tileset_header
	db map_save_screen
	db map_load_objects
	db map_fade_music
	db map_palettes
	db map_stop_script
	db map_keep_palettes
	db map_wildmons
	db map_update_roam
	db map_animations_on
	db -1

MapSetupScript6: ; 153d0
	db map_prolong_sprites

MapSetupScript5: ; 153d1
	db map_fade_out_palettes

MapSetupScript9: ; 153d2
	db map_load_warp
	db map_attributes
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
	db -1

MapSetupScript3: ; 153e7
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
	db -1

MapSetupScript8: ; 153f7
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
	db -1

MapSetupScript2: ; 15408
	db map_lcd_off
	db map_sound_off
	db map_attributes_2
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
	db -1

MapSetupScript10: ; 1541a
	db map_load_blocks
	db map_connection_blocks
	db -1


ReadMapSetupScript: ; 1541d
.loop
	ld a, [hli]
	cp -1
	ret z

	push hl

	ld c, a
	ld b, 0
	ld hl, MapSetupCommands
rept 3
	add hl, bc
endr

	; bank
	ld b, [hl]
	inc hl

	; address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; Bit 7 of the bank indicates a parameter.
	; This is left unused.
	bit 7, b
	jr z, .go

	pop de
	ld a, [de]
	ld c, a
	inc de
	push de

.go
	ld a, b
	and $7f
	rst FarCall

	pop hl
	jr .loop
; 15440

MapSetupCommands: ; 15440
	dbw BANK(EnableLCD), EnableLCD ; 00
	dbw BANK(DisableLCD), DisableLCD ; 01
	dbw BANK(SoundRestart), SoundRestart ; 02
	dbw BANK(PlayMapMusic), PlayMapMusic ; 03
	dbw BANK(RestartMapMusic), RestartMapMusic ; 04
	dbw BANK(FadeToMapMusic), FadeToMapMusic ; 05
	dbw BANK(FadeOutMapAndMusic), FadeOutMapAndMusic ; 06
	dbw BANK(EnterMapMusic), EnterMapMusic ; 07
	dbw BANK(ForceMapMusic), ForceMapMusic ; 08
	dbw BANK(CrankUpTheVolume), CrankUpTheVolume ; 09
	dbw BANK(LoadBlockData), LoadBlockData ; 0a
	dbw BANK(LoadNeighboringBlockData), LoadNeighboringBlockData ; 0b
	dbw BANK(SaveScreen), SaveScreen ; 0c
	dbw BANK(BufferScreen), BufferScreen ; 0d
	dbw BANK(LoadGraphics), LoadGraphics ; 0e
	dbw BANK(LoadTilesetHeader), LoadTilesetHeader ; 0f
	dbw BANK(LoadMapTimeOfDay), LoadMapTimeOfDay ; 10
	dbw BANK(LoadMapPalettes), LoadMapPalettes ; 11
	dbw BANK(LoadWildMonData), LoadWildMonData ; 12
	dbw BANK(RefreshMapSprites), RefreshMapSprites ; 13
	dbw BANK(RunCallback_05_03), RunCallback_05_03 ; 14
	dbw BANK(RunCallback_03), RunCallback_03 ; 15
	dbw BANK(LoadObjectsRunCallback_02), LoadObjectsRunCallback_02 ; 16
	dbw BANK(LoadSpawnPoint), LoadSpawnPoint ; 17
	dbw BANK(EnterMapConnection), EnterMapConnection ; 18
	dbw BANK(LoadWarpData), LoadWarpData ; 19
	dbw BANK(LoadMapAttributes), LoadMapAttributes ; 1a
	dbw BANK(LoadMapAttributes_IgnoreHidden), LoadMapAttributes_IgnoreHidden ; 1b
	dbw BANK(WhiteBGMap), WhiteBGMap ; 1c
	dbw BANK(FadeBlackBGMap), FadeBlackBGMap ; 1d
	dbw BANK(FadeInBGMap), FadeInBGMap ; 1e
	dbw BANK(GetCoordOfUpperLeftCorner), GetCoordOfUpperLeftCorner ; 1f
	dbw BANK(RestoreFacingAfterWarp), RestoreFacingAfterWarp ; 20
	dbw BANK(SpawnInFacingDown), SpawnInFacingDown ; 21
	dbw BANK(GetSpawnCoord), GetSpawnCoord ; 22
	dbw BANK(RefreshPlayerCoords), RefreshPlayerCoords ; 23
	dbw BANK(DelayClearingOldSprites), DelayClearingOldSprites ; 24
	dbw BANK(DelayLoadingNewSprites), DelayLoadingNewSprites ; 25
	dbw BANK(UpdateRoamMons), UpdateRoamMons ; 26
	dbw BANK(RestoreRoamMons), RestoreRoamMons ; 27
	dbw BANK(FadeOldMapMusic), FadeOldMapMusic ; 28
	dbw BANK(ActivateMapAnims), ActivateMapAnims ; 29
	dbw BANK(SuspendMapAnims), SuspendMapAnims ; 2a
	dbw BANK(RetainOldPalettes), RetainOldPalettes ; 2b
	dbw BANK(DontScrollText), DontScrollText ; 2c
	dbw BANK(ReturnFromMapSetupScript), ReturnFromMapSetupScript ; 2d
; 154ca


DontScrollText: ; 154ca
	xor a
	ld [wc2d7], a
	ret
; 154cf

ActivateMapAnims: ; 154cf
	ld a, $1
	ld [$ffde], a
	ret
; 154d3

SuspendMapAnims: ; 154d3
	xor a
	ld [$ffde], a
	ret
; 154d7

LoadObjectsRunCallback_02: ; 154d7
	ld a, $2
	call RunMapCallback
	callba Function2454f
	callba Function8177
	ret
; 154ea (5:54ea)

Function154ea: ; 154ea
	ret
; 154eb

DelayClearingOldSprites: ; 154eb
	ld hl, wd45b
	set 7, [hl]
	ret
; 154f1

DelayLoadingNewSprites: ; 154f1
	ld hl, wd45b
	set 6, [hl]
	ret

Function154f7: ; 154f7
	nop
	call Function1550c
	jr c, .ok
	call Function1554e
	jr c, .ok
	call Function1551a
	jr c, .ok
	ret
.ok
	call Special_ReplaceKrisSprite
	ret

Function1550c: ; 1550c (5:550c)
	and a
	ld hl, BikeFlags
	bit 1, [hl]
	ret z
	ld a, PLAYER_BIKE
	ld [PlayerState], a
	scf
	ret

Function1551a: ; 1551a (5:551a)
	ld a, [PlayerState]
	cp PLAYER_NORMAL
	jr z, .nope
	cp PLAYER_SLIP
	jr z, .nope
	cp PLAYER_SURF
	jr z, .surfing
	cp PLAYER_SURF_PIKA
	jr z, .surfing
	call GetMapPermission
	cp $3
	jr z, .checkbiking
	cp $5
	jr z, .checkbiking
	cp $7
	jr z, .checkbiking
	jr .nope
.checkbiking
	ld a, [PlayerState]
	cp PLAYER_BIKE
	jr nz, .nope
.surfing
	ld a, PLAYER_NORMAL
	ld [PlayerState], a
	scf
	ret
.nope
	and a
	ret

Function1554e: ; 1554e (5:554e)
	call Function1852
	jr nz, .ret_nc
	ld a, [PlayerState]
	cp PLAYER_SURF
	jr z, .surfing
	cp PLAYER_SURF_PIKA
	jr z, .surfing
	ld a, PLAYER_SURF
	ld [PlayerState], a
.surfing
	scf
	ret
.ret_nc
	and a
	ret
; 15567

FadeOldMapMusic: ; 15567
	ld a, 6
	call SkipMusic
	ret
; 1556d

RetainOldPalettes: ; 1556d
	callba _UpdateTimePals
	ret

FadeOutMapAndMusic: ; 15574
	ld e, 0
	ld a, [MusicFadeIDLo]
	ld d, 0
	ld a, [MusicFadeIDHi]
	ld a, $4
	ld [MusicFade], a
	call FadeToWhite
	ret
; 15587

ForceMapMusic: ; 15587
	ld a, [PlayerState]
	cp PLAYER_BIKE
	jr nz, .notbiking
	call VolumeOff
	ld a, $88
	ld [MusicFade], a
.notbiking
	call TryRestartMapMusic
	ret
; 1559a
