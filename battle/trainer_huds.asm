BattleStart_TrainerHuds: ; 2c000
	ld a, $e4
	ld [rOBP0], a
	call LoadBallIconGFX
	call ShowPlayerMonsRemaining
	ld a, [wBattleMode]
	dec a
	ret z
	jp ShowOTTrainerMonsRemaining
; 2c012

EnemySwitch_TrainerHud: ; 2c012
	ld a, $e4
	ld [rOBP0], a
	call LoadBallIconGFX
	jp ShowOTTrainerMonsRemaining
; 2c01c

ShowPlayerMonsRemaining: ; 2c01c
	call DrawPlayerPartyIconHUDBorder
	ld hl, PartyMon1HP
	ld de, PartyCount
	call StageBallTilesData
	; ldpixel wPlaceBallsX, 12, 12
	ld a, 12 * 8
	ld hl, wPlaceBallsX
	ld [hli], a
	ld [hl], a
	ld a, 8
	ld [wPlaceBallsDirection], a
	ld hl, Sprites
	jp LoadTrainerHudOAM
; 2c03a

ShowOTTrainerMonsRemaining: ; 2c03a
	call DrawEnemyHUDBorder
	ld hl, OTPartyMon1HP
	ld de, OTPartyCount
	call StageBallTilesData
	; ldpixel wPlaceBallsX, 9, 4
	ld hl, wPlaceBallsX
	ld a, 9 * 8
	ld [hli], a
	ld [hl], 4 * 8
	ld a, -8
	ld [wPlaceBallsDirection], a
	ld hl, Sprites + PARTY_LENGTH * 4
	jp LoadTrainerHudOAM
; 2c059

StageBallTilesData: ; 2c059
	ld a, [de]
	push af
	ld de, Buffer1
	ld c, PARTY_LENGTH
	ld a, $34 ; empty slot
.loop1
	ld [de], a
	inc de
	dec c
	jr nz, .loop1
	pop af
	ld de, Buffer1
.loop2
	push af
	call .GetHUDTile
	inc de
	pop af
	dec a
	jr nz, .loop2
	ret
; 2c075

.GetHUDTile: ; 2c075
	ld a, [hli]
	and a
	jr nz, .got_hp
	ld a, [hl]
	and a
	ld b, $33 ; fainted
	jr z, .fainted

.got_hp
	dec hl
	dec hl
	dec hl
	ld a, [hl]
	and a
	ld b, $32 ; statused
	jr nz, .load
	dec b ; normal
	jr .load

.fainted
	dec hl
	dec hl
	dec hl

.load
	ld a, b
	ld [de], a
	ld bc, PARTYMON_STRUCT_LENGTH + MON_HP - MON_STATUS
	add hl, bc
	ret
; 2c095

DrawPlayerHUDBorder: ; 2c095
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, 4
	call CopyBytes
	hlcoord 18, 10
	ld de, -1 ; start on right
	jr PlaceHUDBorderTiles

.tiles
	db $73 ; right side
	db $77 ; bottom right
	db $6f ; bottom left
	db $76 ; bottom side
; 2c0ad

DrawPlayerPartyIconHUDBorder: ; 2c0ad
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, 4
	call CopyBytes
	hlcoord 18, 10
	ld de, -1 ; start on right
	jr PlaceHUDBorderTiles

.tiles
	db $73 ; right side
	db $5c ; bottom right
	db $6f ; bottom left
	db $76 ; bottom side
; 2c0c5

DrawEnemyHUDBorder: ; 2c0c5
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, 4
	call CopyBytes
	hlcoord 1, 2
	ld de, 1 ; start on left
	call PlaceHUDBorderTiles
	ld a, [wBattleMode]
	dec a
	ret nz
	ld a, [TempEnemyMonSpecies]
	dec a
	call CheckCaughtMon
	ret z
	hlcoord 1, 1
	ld [hl], $5d
	ret

.tiles
	db $6d ; left side
	db $74 ; bottom left
	db $78 ; bottom right
	db $76 ; bottom side
; 2c0f1

PlaceHUDBorderTiles: ; 2c0f1
	ld a, [wTrainerHUDTiles]
	ld [hl], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, [StartFlypoint]
	ld [hl], a
	ld b, $8
.loop
	add hl, de
	ld a, [MovementBuffer]
	ld [hl], a
	dec b
	jr nz, .loop
	add hl, de
	ld a, [EndFlypoint]
	ld [hl], a
	ret
; 2c10d

LinkBattle_TrainerHuds: ; 2c10d
	call LoadBallIconGFX
	ld hl, PartyMon1HP
	ld de, PartyCount
	call StageBallTilesData
	ld hl, wPlaceBallsX
	ld a, 10 * 8
	ld [hli], a
	ld [hl], 8 * 8
	ld a, $8
	ld [wPlaceBallsDirection], a
	ld hl, Sprites
	call LoadTrainerHudOAM

	ld hl, OTPartyMon1HP
	ld de, OTPartyCount
	call StageBallTilesData
	ld hl, wPlaceBallsX
	ld a, 10 * 8
	ld [hli], a
	ld [hl], 13 * 8
	ld hl, Sprites + PARTY_LENGTH * 4
	jp LoadTrainerHudOAM
; 2c143

LoadTrainerHudOAM: ; 2c143
	ld de, Buffer1
	ld c, PARTY_LENGTH
.loop
	ld a, [wPlaceBallsY]
	ld [hli], a
	ld a, [wPlaceBallsX]
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, [wPlaceBallsX]
	ld b, a
	ld a, [wPlaceBallsDirection]
	add b
	ld [wPlaceBallsX], a
	inc de
	dec c
	jr nz, .loop
	ret
; 2c165

LoadBallIconGFX: ; 2c165
	ld de, .gfx
	ld hl, VTiles0 tile $31
	lb bc, BANK(LoadBallIconGFX), 4
	call Get2bpp_2
	ret
; 2c172

.gfx ; 2c172
INCBIN "gfx/battle/balls.2bpp"
; 2c1b2

_ShowLinkBattleParticipants: ; 2c1b2
	call ClearBGPalettes
	call LoadFontsExtra
	hlcoord 2, 3
	ld b, 9
	ld c, 14
	call TextBox
	hlcoord 4, 5
	ld de, PlayerName
	call PlaceString
	hlcoord 4, 10
	ld de, OTPlayerName
	call PlaceString
	hlcoord 9, 8
	ld a, $69 ; "V"
	ld [hli], a
	ld [hl], $6a ; "S"
	callba LinkBattle_TrainerHuds ; no need to callba
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld a, $e4
	ld [rOBP0], a
	ret
; 2c1ef
