Special_MagnetTrain: ; 8cc04
	ld a, [ScriptVar]
	and a
	jr nz, .ToGoldenrod
	ld a, 1 ; forwards
	lb bc,  $40,  $60
	lb de, (11 * 8) - (11 * 8 + 4), -$60
	jr .continue

.ToGoldenrod:
	ld a, -1 ; backwards
	lb bc, -$40, -$60
	lb de, (11 * 8) + (11 * 8 + 4), $60

.continue
	ld h, a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld a, h
	ld [wMagnetTrainDirection], a
	ld a, c
	ld [wMagnetTrainInitPosition], a
	ld a, b
	ld [wMagnetTrainHoldPosition], a
	ld a, e
	ld [wMagnetTrainFinalPosition], a
	ld a, d
	ld [wMagnetTrainPlayerSpriteInitX], a

	ld a, [hSCX]
	push af
	ld a, [hSCY]
	push af
	call MagntTrain_LoadGFX_PlayMusic
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $1
.loop
	ld a, [wJumptableIndex]
	and a
	jr z, .initialize
	bit 7, a
	jr nz, .done
	callab PlaySpriteAnimations
	call MagnetTrain_Jumptable
	call MagnetTrain_UpdateLYOverrides
	call PushLYOverrides
	call DelayFrame
	jr .loop

.initialize
	call MagnetTrain_Jumptable_FirstRunThrough
	jr .loop

.done
	pop af
	ld [hVBlank], a
	call ClearBGPalettes
	xor a
	ld [hLCDCPointer], a
	ld [hLYOverrideStart], a
	ld [hLYOverrideEnd], a
	ld [hSCX], a
	ld [Requested2bppSource], a
	ld [Requested2bppSource + 1], a
	ld [Requested2bppDest], a
	ld [Requested2bppDest + 1], a
	ld [Requested2bpp], a
	call ClearTileMap

	pop af
	ld [hSCY], a
	pop af
	ld [hSCX], a
	xor a
	ld [hBGMapMode], a
	pop af
	ld [rSVBK], a
	ret
; 8cc99

MagnetTrain_UpdateLYOverrides: ; 8cc99
	ld hl, LYOverridesBackup
	ld c, $2f
	ld a, [wcf64]
	add a
	ld [hSCX], a
	call .loadloop
	ld c, $30
	ld a, [wcf65]
	call .loadloop
	ld c, $31
	ld a, [wcf64]
	add a
	call .loadloop
	ld a, [wMagnetTrainDirection]
	ld d, a
	ld hl, wcf64
	ld a, [hl]
	add d
	add d
	ld [hl], a
	ret

.loadloop
	ld [hli], a
	dec c
	jr nz, .loadloop
	ret
; 8ccc9

MagntTrain_LoadGFX_PlayMusic: ; 8ccc9
	call ClearBGPalettes
	call ClearSprites
	call DisableLCD
	callab ClearSpriteAnims
	call SetMagnetTrainPals
	call DrawMagnetTrain
	ld a, $90
	ld [hWY], a
	call EnableLCD
	xor a
	ld [hBGMapMode], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba GetPlayerIcon
	pop af
	ld [rSVBK], a
	ld hl, VTiles0
	ld c, 4
	call Request2bpp
	ld hl, 12 tiles
	add hl, de
	ld d, h
	ld e, l
	ld hl, VTiles0 tile $04
	ld c, 4
	call Request2bpp
	call MagnetTrain_InitLYOverrides
	ld hl, wJumptableIndex
	xor a
	ld [hli], a
	ld a, [wMagnetTrainInitPosition]
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld de, MUSIC_MAGNET_TRAIN
	call PlayMusic2
	ret
; 8cd27

DrawMagnetTrain: ; 8cd27
	hlbgcoord 0, 0
	xor a
.loop
	call GetMagnetTrainBGTiles
	ld b, 32 / 2
	call .FillAlt
	inc a
	cp $12
	jr c, .loop
	hlbgcoord 0, 6
	ld de, MagnetTrainTilemap1
	ld c, 20
	call .FillLine
	hlbgcoord 0, 7
	ld de, MagnetTrainTilemap2
	ld c, 20
	call .FillLine
	hlbgcoord 0, 8
	ld de, MagnetTrainTilemap3
	ld c, 20
	call .FillLine
	hlbgcoord 0, 9
	ld de, MagnetTrainTilemap4
	ld c, 20
	call .FillLine
	ret
; 8cd65

.FillLine: ; 8cd65
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .FillLine
	ret
; 8cd6c

.FillAlt: ; 8cd6c
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec b
	jr nz, .FillAlt
	ret
; 8cd74

GetMagnetTrainBGTiles: ; 8cd74
	push hl
	ld e, a
	ld d, 0
	ld hl, MagnetTrainBGTiles
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	ret
; 8cd82

MagnetTrainBGTiles: ; 8cd82
; Alternating tiles for each line
; of the Magnet Train tilemap.
	db $4c, $4d ; bush
	db $5c, $5d ; bush
	db $4c, $4d ; bush
	db $5c, $5d ; bush
	db $08, $08 ; fence
	db $18, $18 ; fence
	db $1f, $1f ; track
	db $31, $31 ; track
	db $11, $11 ; track
	db $11, $11 ; track
	db $0d, $0d ; track
	db $31, $31 ; track
	db $04, $04 ; fence
	db $18, $18 ; fence
	db $4c, $4d ; bush
	db $5c, $5d ; bush
	db $4c, $4d ; bush
	db $5c, $5d ; bush
; 8cda6

MagnetTrain_InitLYOverrides: ; 8cda6
	ld hl, LYOverrides
	ld bc, LYOverridesEnd - LYOverrides
	ld a, [wMagnetTrainInitPosition]
	call ByteFill
	ld hl, LYOverridesBackup
	ld bc, LYOverridesBackupEnd - LYOverridesBackup
	ld a, [wMagnetTrainInitPosition]
	call ByteFill
	ld a, rSCX - $ff00
	ld [hLCDCPointer], a
	ret
; 8cdc3

SetMagnetTrainPals: ; 8cdc3
	ld a, $1
	ld [rVBK], a

	; bushes
	hlbgcoord 0, 0
	ld bc, 4 bgrows
	ld a, $2
	call ByteFill

	; train
	hlbgcoord 0, 4
	ld bc, 10 bgrows
	xor a
	call ByteFill

	; more bushes
	hlbgcoord 0, 14
	ld bc, 4 bgrows
	ld a, $2
	call ByteFill

	; train window
	hlbgcoord 7, 8
	ld bc, 6
	ld a, $4
	call ByteFill

	ld a, $0
	ld [rVBK], a
	ret
; 8cdf7

MagnetTrain_Jumptable: ; 8cdf7
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8ce06

.Jumptable: ; 8ce06

	dw .InitPlayerSpriteAnim
	dw .WaitScene
	dw .MoveTrain1
	dw .WaitScene
	dw .MoveTrain2
	dw .WaitScene
	dw .TrainArrived
; 8ce14

.Next: ; 8ce14
	ld hl, wJumptableIndex
	inc [hl]
	ret
; 8ce19

.InitPlayerSpriteAnim: ; 8ce19
	ld d, 10 * 8 + 5
	ld a, [wMagnetTrainPlayerSpriteInitX]
	ld e, a
	ld b, SPRITE_ANIM_INDEX_15
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [PlayerGender]
	bit 0, a
	jr z, .got_gender
	ld b, SPRITE_ANIM_INDEX_1F

.got_gender
	pop af
	ld [rSVBK], a
	ld a, b
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0
	call .Next
	ld a, $80
	ld [wcf66], a
	ret
; 8ce47

.MoveTrain1: ; 8ce47
	ld hl, wMagnetTrainHoldPosition
	ld a, [wcf65]
	cp [hl]
	jr z, .PrepareToHoldTrain
	ld e, a
	ld a, [wMagnetTrainDirection]
	xor $ff
	inc a
	add e
	ld [wcf65], a
	ld hl, wGlobalAnimXOffset
	ld a, [wMagnetTrainDirection]
	add [hl]
	ld [hl], a
	ret

.PrepareToHoldTrain:
	call .Next
	ld a, $80
	ld [wcf66], a
	ret
; 8ce6d

.WaitScene: ; 8ce6d
	ld hl, wcf66
	ld a, [hl]
	and a
	jr z, .DoneWaiting
	dec [hl]
	ret

.DoneWaiting:
	call .Next
	ret
; 8ce7a

.MoveTrain2: ; 8ce7a
	ld hl, wMagnetTrainFinalPosition
	ld a, [wcf65]
	cp [hl]
	jr z, .PrepareToFinishAnim
	ld e, a
	ld a, [wMagnetTrainDirection]
	xor $ff
	inc a
	ld d, a
	ld a, e
	add d
	add d
	ld [wcf65], a
	ld hl, wGlobalAnimXOffset
	ld a, [wMagnetTrainDirection]
	ld d, a
	ld a, [hl]
	add d
	add d
	ld [hl], a
	ret

	ret

.PrepareToFinishAnim:
	call .Next
	ret
; 8cea2

.TrainArrived: ; 8cea2
	ld a, $80
	ld [wJumptableIndex], a
	ld de, SFX_TRAIN_ARRIVED
	call PlaySFX
	ret
; 8ceae

MagnetTrain_Jumptable_FirstRunThrough: ; 8ceae
	callba PlaySpriteAnimations
	call MagnetTrain_Jumptable
	call MagnetTrain_UpdateLYOverrides
	call PushLYOverrides
	call DelayFrame
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [TimeOfDayPal]
	push af
	ld a, [wPermission]
	push af
	ld a, [TimeOfDay]
	and $3
	ld [TimeOfDayPal], a
	ld a, $1
	ld [wPermission], a
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	call UpdateTimePals
	ld a, [rBGP]
	ld [wBGP], a
	ld a, [rOBP0]
	ld [wOBP0], a
	ld a, [rOBP1]
	ld [wOBP1], a
	pop af
	ld [wPermission], a
	pop af
	ld [TimeOfDayPal], a
	pop af
	ld [rSVBK], a
	ret
; 8ceff

MagnetTrainTilemap1:
	db $1f, $05, $06, $0a, $0a
	db $0a, $09, $0a, $0a, $0a
	db $0a, $0a, $0a, $09, $0a
	db $0a, $0a, $0b, $0c, $1f
MagnetTrainTilemap2:
	db $14, $15, $16, $1a, $1a
	db $1a, $19, $1a, $1a, $1a
	db $1a, $1a, $1a, $19, $1a
	db $1a, $1a, $1b, $1c, $1d
MagnetTrainTilemap3:
	db $24, $25, $26, $27, $07
	db $2f, $29, $28, $28, $28
	db $28, $28, $28, $29, $07
	db $2f, $2a, $2b, $2c, $2d
MagnetTrainTilemap4:
	db $20, $1f, $2e, $1f, $17
	db $00, $2e, $1f, $1f, $1f
	db $1f, $1f, $1f, $2e, $17
	db $00, $1f, $2e, $1f, $0f
; 8cf4f
