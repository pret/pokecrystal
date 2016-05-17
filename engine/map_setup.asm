
RunMapSetupScript:: ; 15363
	ld a, [hMapEntryMethod]
	and $f
	dec a
	ld c, a
	ld b, 0
	ld hl, MapSetupScripts
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ReadMapSetupScript
	ret
; 15377

MapSetupScripts: ; 15377
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
; 1538f

MapSetupScript_Teleport: ; 1538f
	db map_prolong_sprites
MapSetupScript_Fly: ; 15390
	db map_fade_out_palettes
	db map_keep_roam
MapSetupScript_Warp: ; 15392
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
	db map_end

MapSetupScript_BadWarp: ; 153a9
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
	db map_end

MapSetupScript_Connection: ; 153bf
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
	db map_end

MapSetupScript_Fall: ; 153d0
	db map_prolong_sprites
MapSetupScript_Door: ; 153d1
	db map_fade_out_palettes
MapSetupScript_Train: ; 153d2
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
	db map_end

MapSetupScript_ReloadMap: ; 153e7
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

MapSetupScript_LinkReturn: ; 153f7
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

MapSetupScript_Continue: ; 15408
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
	db map_end

MapSetupScript_Submenu: ; 1541a
	db map_load_blocks
	db map_connection_blocks
	db map_end


ReadMapSetupScript: ; 1541d
.loop
	ld a, [hli]
	cp -1
	ret z

	push hl

	ld c, a
	ld b, 0
	ld hl, MapSetupCommands
	add hl, bc
	add hl, bc
	add hl, bc

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
	dba EnableLCD ; 00
	dba DisableLCD ; 01
	dba MapSetup_Sound_Off ; 02
	dba PlayMapMusic ; 03
	dba RestartMapMusic ; 04
	dba FadeToMapMusic ; 05
	dba RotatePalettesRightMapAndMusic ; 06
	dba EnterMapMusic ; 07
	dba ForceMapMusic ; 08
	dba FadeInMusic ; 09
	dba LoadBlockData ; 0a (callback 1)
	dba LoadNeighboringBlockData ; 0b
	dba SaveScreen ; 0c
	dba BufferScreen ; 0d
	dba LoadGraphics ; 0e
	dba LoadTilesetHeader ; 0f
	dba LoadMapTimeOfDay ; 10
	dba LoadMapPalettes ; 11
	dba LoadWildMonData ; 12
	dba RefreshMapSprites ; 13
	dba HandleNewMap ; 14
	dba InitCommandQueue ; 15
	dba LoadObjectsRunCallback_02 ; 16
	dba LoadSpawnPoint ; 17
	dba EnterMapConnection ; 18
	dba LoadWarpData ; 19
	dba LoadMapAttributes ; 1a
	dba LoadMapAttributes_SkipPeople ; 1b
	dba ClearBGPalettes ; 1c
	dba FadeOutPalettes ; 1d
	dba FadeInPalettes ; 1e
	dba GetCoordOfUpperLeftCorner ; 1f
	dba RestoreFacingAfterWarp ; 20
	dba SpawnInFacingDown ; 21
	dba SpawnPlayer ; 22
	dba RefreshPlayerCoords ; 23
	dba DelayClearingOldSprites ; 24
	dba DelayLoadingNewSprites ; 25
	dba UpdateRoamMons ; 26
	dba JumpRoamMons ; 27
	dba FadeOldMapMusic ; 28
	dba ActivateMapAnims ; 29
	dba SuspendMapAnims ; 2a
	dba RetainOldPalettes ; 2b
	dba DontScrollText ; 2c
	dba ReturnFromMapSetupScript ; 2d
; 154ca


DontScrollText: ; 154ca
	xor a
	ld [wDisableTextAcceleration], a
	ret
; 154cf

ActivateMapAnims: ; 154cf
	ld a, $1
	ld [hMapAnims], a
	ret
; 154d3

SuspendMapAnims: ; 154d3
	xor a
	ld [hMapAnims], a
	ret
; 154d7

LoadObjectsRunCallback_02: ; 154d7
	ld a, MAPCALLBACK_OBJECTS
	call RunMapCallback
	callba LoadObjectMasks
	callba InitializeVisibleSprites
	ret
; 154ea (5:54ea)

; unreferenced
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

CheckReplaceKrisSprite: ; 154f7
	nop
	call .CheckBiking
	jr c, .ok
	call .CheckSurfing
	jr c, .ok
	call .CheckSurfing2
	jr c, .ok
	ret

.ok
	call ReplaceKrisSprite
	ret

.CheckBiking: ; 1550c (5:550c)
	and a
	ld hl, BikeFlags
	bit 1, [hl]
	ret z
	ld a, PLAYER_BIKE
	ld [PlayerState], a
	scf
	ret

.CheckSurfing2: ; 1551a (5:551a)
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
	cp INDOOR
	jr z, .checkbiking
	cp PERM_5
	jr z, .checkbiking
	cp DUNGEON
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

.CheckSurfing: ; 1554e (5:554e)
	call CheckOnWater
	jr nz, .ret_nc
	ld a, [PlayerState]
	cp PLAYER_SURF
	jr z, ._surfing
	cp PLAYER_SURF_PIKA
	jr z, ._surfing
	ld a, PLAYER_SURF
	ld [PlayerState], a
._surfing
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

RotatePalettesRightMapAndMusic: ; 15574
	ld e, 0
	ld a, [MusicFadeIDLo]
	ld d, 0
	ld a, [MusicFadeIDHi]
	ld a, $4
	ld [MusicFade], a
	call RotateThreePalettesRight
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
