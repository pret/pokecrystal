RunMapSetupScript::
	ldh a, [hMapEntryMethod]
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

INCLUDE "data/maps/setup_scripts.asm"

ReadMapSetupScript:
.loop
	ld a, [hli]
	cp map_end
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

MapSetupCommands:
; entries correspond to command indexes in constants/map_setup_constants.asm
	dba EnableLCD ; 00
	dba DisableLCD ; 01
	dba InitSound ; 02
	dba PlayMapMusic ; 03
	dba RestartMapMusic ; 04
	dba FadeToMapMusic ; 05
	dba FadeMapMusicAndPalettes ; 06
	dba PlayMapMusicBike ; 07
	dba ForceMapMusic ; 08
	dba FadeInMusic ; 09
	dba LoadBlockData ; 0a (callback 1)
	dba LoadConnectionBlockData ; 0b
	dba SaveScreen ; 0c
	dba BufferScreen ; 0d
	dba LoadMapGraphics ; 0e
	dba LoadMapTileset ; 0f
	dba LoadMapTimeOfDay ; 10
	dba LoadMapPalettes ; 11
	dba LoadWildMonData ; 12
	dba RefreshMapSprites ; 13
	dba HandleNewMap ; 14
	dba HandleContinueMap ; 15
	dba LoadMapObjects ; 16
	dba EnterMapSpawnPoint ; 17
	dba EnterMapConnection ; 18
	dba EnterMapWarp ; 19
	dba LoadMapAttributes ; 1a
	dba LoadMapAttributes_SkipObjects ; 1b
	dba ClearBGPalettes ; 1c
	dba FadeOutPalettes ; 1d
	dba FadeInPalettes ; 1e
	dba GetMapScreenCoords ; 1f
	dba GetWarpDestCoords ; 20
	dba SpawnInFacingDown ; 21
	dba SpawnPlayer ; 22
	dba RefreshPlayerCoords ; 23
	dba ResetPlayerObjectAction ; 24
	dba SkipUpdateMapSprites ; 25
	dba UpdateRoamMons ; 26
	dba JumpRoamMons ; 27
	dba FadeOutMapMusic ; 28
	dba ActivateMapAnims ; 29
	dba SuspendMapAnims ; 2a
	dba ApplyMapPalettes ; 2b
	dba EnableTextAcceleration ; 2c
	dba InitMapNameSign ; 2d

EnableTextAcceleration:
	xor a
	ld [wDisableTextAcceleration], a
	ret

ActivateMapAnims:
	ld a, $1
	ldh [hMapAnims], a
	ret

SuspendMapAnims:
	xor a
	ldh [hMapAnims], a
	ret

LoadMapObjects:
	ld a, MAPCALLBACK_OBJECTS
	call RunMapCallback
	farcall LoadObjectMasks
	farcall InitializeVisibleSprites
	ret

; unused
	ret

ResetPlayerObjectAction:
	ld hl, wPlayerSpriteSetupFlags
	set PLAYERSPRITESETUP_RESET_ACTION_F, [hl]
	ret

SkipUpdateMapSprites:
	ld hl, wPlayerSpriteSetupFlags
	set PLAYERSPRITESETUP_SKIP_RELOAD_GFX_F, [hl]
	ret

CheckReplaceKrisSprite:
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

.CheckBiking:
	and a
	ld hl, wBikeFlags
	bit BIKEFLAGS_ALWAYS_ON_BIKE_F, [hl]
	ret z
	ld a, PLAYER_BIKE
	ld [wPlayerState], a
	scf
	ret

.CheckSurfing2:
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	jr z, .nope
	cp PLAYER_SKATE
	jr z, .nope
	cp PLAYER_SURF
	jr z, .surfing
	cp PLAYER_SURF_PIKA
	jr z, .surfing
	call GetMapEnvironment
	cp INDOOR
	jr z, .no_biking
	cp ENVIRONMENT_5
	jr z, .no_biking
	cp DUNGEON
	jr z, .no_biking
	jr .nope
.no_biking
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr nz, .nope
.surfing
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	scf
	ret

.nope
	and a
	ret

.CheckSurfing:
	call CheckOnWater
	jr nz, .nope2
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .is_surfing
	cp PLAYER_SURF_PIKA
	jr z, .is_surfing
	ld a, PLAYER_SURF
	ld [wPlayerState], a
.is_surfing
	scf
	ret

.nope2
	and a
	ret

FadeOutMapMusic:
	ld a, 6
	call SkipMusic
	ret

ApplyMapPalettes:
	farcall _UpdateTimePals
	ret

FadeMapMusicAndPalettes:
	ld e, LOW(MUSIC_NONE)
	ld a, [wMusicFadeID]
	ld d, HIGH(MUSIC_NONE)
	ld a, [wMusicFadeID + 1]
	ld a, $4
	ld [wMusicFade], a
	call RotateThreePalettesRight
	ret

ForceMapMusic:
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr nz, .notbiking
	call MinVolume
	ld a, $88
	ld [wMusicFade], a
.notbiking
	call TryRestartMapMusic
	ret
