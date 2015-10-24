
RunMapSetupScript:: ; 15363
	ld a, [hMapEntryMethod]
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

MapSetupScript4: ; 1538f
	map_prolong_sprites

MapSetupScript12: ; 15390
	map_fade_out_palettes
	map_keep_roam

MapSetupScript1: ; 15392
	map_lcd_off
	map_sound_off
	map_load_spawn
	map_attributes
	map_change_callback
	map_spawn_coord
	map_player_coord
	map_anchor_screen
	map_load_blocks
	map_buffer_screen
	map_load_graphics
	map_time_of_day
	map_load_objects
	map_lcd_on
	map_palettes
	map_face_down
	map_sprites
	map_bike_music
	map_max_volume
	map_fade_in_palettes
	map_animations_on
	map_wildmons
	map_end_setup_script

MapSetupScript11: ; 153a9
	map_load_spawn
	map_attributes
	map_change_callback
	map_spawn_coord
	map_player_coord
	map_anchor_screen
	map_load_blocks
	map_buffer_screen
	map_lcd_off
	map_load_graphics
	map_time_of_day
	map_fade_out_music
	map_lcd_on
	map_load_objects
	map_palettes
	map_face_down
	map_sprites
	map_fade_music
	map_fade_in_palettes
	map_animations_on
	map_wildmons
	map_end_setup_script

MapSetupScript7: ; 153bf
	map_animations_off
	map_load_connection
	map_attributes
	map_change_callback
	map_player_coord
	map_load_blocks
	map_load_tileset_header
	map_save_screen
	map_load_objects
	map_fade_music
	map_palettes
	map_stop_script
	map_keep_palettes
	map_wildmons
	map_update_roam
	map_animations_on
	map_end_setup_script

MapSetupScript6: ; 153d0
	map_prolong_sprites

MapSetupScript5: ; 153d1
	map_fade_out_palettes

MapSetupScript9: ; 153d2
	map_load_warp
	map_attributes
	map_warp_face
	map_change_callback
	map_player_coord
	map_load_blocks
	map_buffer_screen
	map_lcd_off
	map_load_graphics
	map_time_of_day
	map_fade_out_music
	map_lcd_on
	map_load_objects
	map_palettes
	map_sprites
	map_fade_music
	map_fade_in_palettes
	map_animations_on
	map_wildmons
	map_update_roam
	map_end_setup_script

MapSetupScript3: ; 153e7
	map_fade
	map_clear_bg_palettes
	map_lcd_off
	map_sound_off
	map_load_blocks
	map_connection_blocks
	map_load_graphics
	map_time_of_day
	map_lcd_on
	map_palettes
	map_sprites
	map_music_force
	map_fade_in_palettes
	map_animations_on
	map_wildmons
	map_end_setup_script

MapSetupScript8: ; 153f7
	map_fade
	map_lcd_off
	map_sound_off
	map_change_callback
	map_load_blocks
	map_buffer_screen
	map_load_graphics
	map_time_of_day
	map_lcd_on
	map_palettes
	map_sprites
	map_bike_music
	map_fade_in_palettes
	map_animations_on
	map_wildmons
	map_text_scroll_off
	map_end_setup_script

MapSetupScript2: ; 15408
	map_lcd_off
	map_sound_off
	map_attributes_2
	map_anchor_screen
	map_start_callback
	map_load_blocks
	map_connection_blocks
	map_buffer_screen
	map_load_graphics
	map_time_of_day
	map_lcd_on
	map_palettes
	map_sprites
	map_bike_music
	map_fade_in_palettes
	map_animations_on
	map_wildmons
	map_end_setup_script

MapSetupScript10: ; 1541a
	map_load_blocks
	map_connection_blocks
	map_end_setup_script


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
	dbw BANK(JumpRoamMons), JumpRoamMons ; 27
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
	ld hl, wPlayerSpriteSetupFlags
	set 7, [hl]
	ret
; 154f1

DelayLoadingNewSprites: ; 154f1
	ld hl, wPlayerSpriteSetupFlags
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
	call CheckOnWater
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
