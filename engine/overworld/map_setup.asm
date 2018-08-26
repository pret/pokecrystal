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

MapSetupCommands:
; entries correspond to command indexes in constants/map_setup_constants.asm
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
	dba LoadTileset ; 0f
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

DontScrollText:
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

LoadObjectsRunCallback_02:
	ld a, MAPCALLBACK_OBJECTS
	call RunMapCallback
	farcall LoadObjectMasks
	farcall InitializeVisibleSprites
	ret

; unused
	ret

DelayClearingOldSprites:
	ld hl, wPlayerSpriteSetupFlags
	set PLAYERSPRITESETUP_RESET_ACTION_F, [hl]
	ret

DelayLoadingNewSprites:
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
	jr z, .checkbiking
	cp ENVIRONMENT_5
	jr z, .checkbiking
	cp DUNGEON
	jr z, .checkbiking
	jr .nope
.checkbiking
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
	jr nz, .ret_nc
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, ._surfing
	cp PLAYER_SURF_PIKA
	jr z, ._surfing
	ld a, PLAYER_SURF
	ld [wPlayerState], a
._surfing
	scf
	ret
.ret_nc
	and a
	ret

FadeOldMapMusic:
	ld a, 6
	call SkipMusic
	ret

RetainOldPalettes:
	farcall _UpdateTimePals
	ret

RotatePalettesRightMapAndMusic:
	ld e, 0
	ld a, [wMusicFadeID]
	ld d, 0
	ld a, [wMusicFadeID + 1]
	ld a, $4
	ld [wMusicFade], a
	call RotateThreePalettesRight
	ret

ForceMapMusic:
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr nz, .notbiking
	call VolumeOff
	ld a, $88
	ld [wMusicFade], a
.notbiking
	call TryRestartMapMusic
	ret
