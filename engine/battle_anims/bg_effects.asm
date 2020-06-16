	const_def
	const BGSQUARE_SIX
	const BGSQUARE_FOUR
	const BGSQUARE_TWO
	const BGSQUARE_SEVEN
	const BGSQUARE_FIVE
	const BGSQUARE_THREE

; BG effects for use in battle animations.

ExecuteBGEffects:
	ld hl, wActiveBGEffects
	ld e, NUM_BG_EFFECTS
.loop
	ld a, [hl]
	and a
	jr z, .next
	ld c, l
	ld b, h
	push hl
	push de
	call DoBattleBGEffectFunction
	pop de
	pop hl
.next
	ld bc, BG_EFFECT_STRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop
	ret

QueueBGEffect:
	ld hl, wActiveBGEffects
	ld e, NUM_BG_EFFECTS
.loop
	ld a, [hl]
	and a
	jr z, .load
	ld bc, BG_EFFECT_STRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop
	scf
	ret

.load
	ld c, l
	ld b, h
	ld hl, BG_EFFECT_STRUCT_FUNCTION
	add hl, bc
	ld a, [wBattleAnimTemp0]
	ld [hli], a
	ld a, [wBattleAnimTemp1]
	ld [hli], a
	ld a, [wBattleAnimTemp2]
	ld [hli], a
	ld a, [wBattleAnimTemp3]
	ld [hl], a
	ret

EndBattleBGEffect:
	ld hl, BG_EFFECT_STRUCT_FUNCTION
	add hl, bc
	ld [hl], 0
	ret

DoBattleBGEffectFunction:
	ld hl, BG_EFFECT_STRUCT_FUNCTION
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, BattleBGEffects
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

BattleBGEffects:
; entries correspond to ANIM_BG_* constants
	dw BattleBGEffect_End
	dw BattleBGEffect_FlashInverted
	dw BattleBGEffect_FlashWhite
	dw BattleBGEffect_WhiteHues
	dw BattleBGEffect_BlackHues
	dw BattleBGEffect_AlternateHues
	dw BattleBGEffect_06
	dw BattleBGEffect_07
	dw BattleBGEffect_08
	dw BattleBGEffect_HideMon
	dw BattleBGEffect_ShowMon
	dw BattleBGEffect_EnterMon
	dw BattleBGEffect_ReturnMon
	dw BattleBGEffect_Surf
	dw BattleBGEffect_Whirlpool
	dw BattleBGEffect_Teleport
	dw BattleBGEffect_NightShade
	dw BattleBGEffect_BattlerObj_1Row
	dw BattleBGEffect_BattlerObj_2Row
	dw BattleBGEffect_DoubleTeam
	dw BattleBGEffect_AcidArmor
	dw BattleBGEffect_RapidFlash
	dw BattleBGEffect_16
	dw BattleBGEffect_17
	dw BattleBGEffect_18
	dw BattleBGEffect_19
	dw BattleBGEffect_1a
	dw BattleBGEffect_1b
	dw BattleBGEffect_1c
	dw BattleBGEffect_1d
	dw BattleBGEffect_1e
	dw BattleBGEffect_1f
	dw BattleBGEffect_20
	dw BattleBGEffect_Withdraw
	dw BattleBGEffect_BounceDown
	dw BattleBGEffect_Dig
	dw BattleBGEffect_Tackle
	dw BattleBGEffect_25
	dw BattleBGEffect_26
	dw BattleBGEffect_27
	dw BattleBGEffect_28
	dw BattleBGEffect_Psychic
	dw BattleBGEffect_2a
	dw BattleBGEffect_2b
	dw BattleBGEffect_2c
	dw BattleBGEffect_2d
	dw BattleBGEffect_2e
	dw BattleBGEffect_2f
	dw BattleBGEffect_30
	dw BattleBGEffect_31
	dw BattleBGEffect_32
	dw BattleBGEffect_VibrateMon
	dw BattleBGEffect_WobbleMon
	dw BattleBGEffect_35

BattleBGEffect_End:
	call EndBattleBGEffect
	ret

BatttleBGEffects_GetNamedJumptablePointer:
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

BattleBGEffects_AnonJumptable:
	pop de
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

BattleBGEffects_IncrementJumptable:
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	inc [hl]
	ret

BattleBGEffect_FlashInverted:
	ld de, .inverted
	jp BattleBGEffect_FlashContinue

.inverted
	dc 3, 2, 1, 0
	dc 0, 1, 2, 3

BattleBGEffect_FlashWhite:
	ld de, .white
	jp BattleBGEffect_FlashContinue

.white
	dc 3, 2, 1, 0
	dc 0, 0, 0, 0

BattleBGEffect_FlashContinue:
; current timer, flash duration, number of flashes
	ld a, $1
	ld [wBattleAnimTemp0], a
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld a, [hl]
	and a
	jr z, .init
	dec [hl]
	ret

.init
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld [hl], a
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .apply_pal
	call EndBattleBGEffect
	ret

.apply_pal
	dec a
	ld [hl], a
	and 1
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ld [wBGP], a
	ret

BattleBGEffect_WhiteHues:
	ld de, .Pals
	call BattleBGEffect_GetNthDMGPal
	jr c, .quit
	ld [wBGP], a
	ret

.quit
	call EndBattleBGEffect
	ret

.Pals:
	dc 3, 2, 1, 0
	dc 3, 2, 0, 0
	dc 3, 1, 0, 0
	db -1

BattleBGEffect_BlackHues:
	ld de, .Pals
	call BattleBGEffect_GetNthDMGPal
	jr c, .quit
	ld [wBGP], a
	ret

.quit
	call EndBattleBGEffect
	ret

.Pals:
	dc 3, 2, 1, 0
	dc 3, 3, 1, 0
	dc 3, 3, 2, 0
	db -1

BattleBGEffect_AlternateHues:
	ld de, .Pals
	call BattleBGEffect_GetNthDMGPal
	jr c, .quit
	ld [wBGP], a
	ld [wOBP1], a
	ret

.quit
	call EndBattleBGEffect
	ret

.Pals:
	dc 3, 2, 1, 0
	dc 3, 3, 2, 0
	dc 3, 3, 3, 0
	dc 3, 3, 2, 0
	dc 3, 2, 1, 0
	dc 2, 1, 0, 0
	dc 1, 0, 0, 0
	dc 2, 1, 0, 0
	db -2

BattleBGEffect_06:
	call BattleBGEffects_CheckSGB
	jr nz, .sgb
	ld de, .PalsCGB
	jr .okay

.sgb
	ld de, .PalsSGB
.okay
	call BattleBGEffect_GetNthDMGPal
	ld [wOBP0], a
	ret

.PalsCGB:
	dc 3, 2, 1, 0
	dc 2, 1, 0, 0
	db -2

.PalsSGB:
	dc 3, 3, 0, 0
	dc 3, 0, 0, 0
	db -2

BattleBGEffect_07:
	call BattleBGEffects_CheckSGB
	jr nz, .sgb
	ld de, .PalsCGB
	jr .okay

.sgb
	ld de, .PalsSGB
.okay
	call BattleBGEffect_GetNthDMGPal
	ld [wOBP0], a
	ret

.PalsCGB:
	dc 3, 2, 1, 0
	dc 3, 1, 2, 0
	db -2

.PalsSGB:
	dc 3, 3, 0, 0
	dc 3, 0, 3, 0
	db -2

BattleBGEffect_08:
	ld de, .Pals
	call BattleBGEffect_GetNthDMGPal
	ld [wBGP], a
	ret

.Pals:
	dc 0, 1, 2, 3
	dc 1, 2, 0, 3
	dc 2, 0, 1, 3
	db -2

BattleBGEffect_HideMon:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw .four

.zero
	call BattleBGEffects_IncrementJumptable
	push bc
	call BGEffect_CheckBattleTurn
	jr nz, .player_side
	hlcoord 12, 0
	lb bc, 7, 7
	jr .got_pointer

.player_side
	hlcoord 2, 6
	lb bc, 6, 6
.got_pointer
	call ClearBox
	pop bc
	xor a
	ldh [hBGMapThird], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

.four
	xor a
	ldh [hBGMapMode], a
	call EndBattleBGEffect
	ret

BattleBGEffect_ShowMon:
	call BGEffect_CheckFlyDigStatus
	jr z, .not_flying
	call EndBattleBGEffect
	ret

.not_flying
	call BGEffect_CheckBattleTurn
	jr nz, .player_side
	ld de, .EnemyData
	jr .got_pointer

.player_side
	ld de, .PlayerData
.got_pointer
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	call BattleBGEffect_RunPicResizeScript
	ret

.PlayerData:
	db  0, $31, 0
	db -1
.EnemyData:
	db  3, $00, 3
	db -1

BattleBGEffect_BattlerObj_1Row:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw .five

.zero
	call BGEffect_CheckFlyDigStatus
	jr z, .not_flying_digging
	ld hl, wLastAnimObjectIndex
	inc [hl]
	call EndBattleBGEffect
	ret

.not_flying_digging
	call BattleBGEffects_IncrementJumptable
	push bc
	call BGEffect_CheckBattleTurn
	jr nz, .player_side
	ld a, ANIM_OBJ_ENEMYFEET_1ROW
	ld [wBattleObjectTempID], a
	ld a, 16 * TILE_WIDTH + 4
	jr .okay

.player_side
	ld a, ANIM_OBJ_PLAYERHEAD_1ROW
	ld [wBattleObjectTempID], a
	ld a, 6 * TILE_WIDTH
.okay
	ld [wBattleObjectTempXCoord], a
	ld a, 8 * TILE_WIDTH
	ld [wBattleObjectTempYCoord], a
	xor a
	ld [wBattleObjectTempParam], a
	call _QueueBattleAnimation
	pop bc
	ret

.one
	call BattleBGEffects_IncrementJumptable
	push bc
	call BGEffect_CheckBattleTurn
	jr nz, .player_side_2
	hlcoord 12, 6
	lb bc, 1, 7
	jr .okay2

.player_side_2
	hlcoord 2, 6
	lb bc, 1, 6
.okay2
	call ClearBox
	ld a, $1
	ldh [hBGMapMode], a
	pop bc
	ret

.five
	xor a
	ldh [hBGMapMode], a
	call EndBattleBGEffect
	ret

BattleBGEffect_BattlerObj_2Row:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw .five

.zero
	call BGEffect_CheckFlyDigStatus
	jr z, .not_flying_digging
	ld hl, wLastAnimObjectIndex
	inc [hl]
	call EndBattleBGEffect
	ret

.not_flying_digging
	call BattleBGEffects_IncrementJumptable
	push bc
	call BGEffect_CheckBattleTurn
	jr nz, .player_side
	ld a, ANIM_OBJ_ENEMYFEET_2ROW
	ld [wBattleObjectTempID], a
	ld a, 16 * TILE_WIDTH + 4
	jr .okay

.player_side
	ld a, ANIM_OBJ_PLAYERHEAD_2ROW
	ld [wBattleObjectTempID], a
	ld a, 6 * TILE_WIDTH
.okay
	ld [wBattleObjectTempXCoord], a
	ld a, 8 * TILE_WIDTH
	ld [wBattleObjectTempYCoord], a
	xor a
	ld [wBattleObjectTempParam], a
	call _QueueBattleAnimation
	pop bc
	ret

.one
	call BattleBGEffects_IncrementJumptable
	push bc
	call BGEffect_CheckBattleTurn
	jr nz, .player_side_2
	hlcoord 12, 5
	lb bc, 2, 7
	jr .okay2

.player_side_2
	hlcoord 2, 6
	lb bc, 2, 6
.okay2
	call ClearBox
	ld a, $1
	ldh [hBGMapMode], a
	pop bc
	ret

.five
	xor a
	ldh [hBGMapMode], a
	call EndBattleBGEffect
	ret

_QueueBattleAnimation:
	callfar QueueBattleAnimation
	ret

BattleBGEffect_27:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw .four

.zero
	call BattleBGEffects_IncrementJumptable
	call BGEffect_CheckBattleTurn
	ld [hl], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and a
	jr z, .user
	ld a, $9
	jr .okay

.user
	ld a, $8
.okay
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], a
	ret

.one
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and a
	jr z, .user_2
	hlcoord 0, 6
	lb de, 8, 6
.row1
	push de
	push hl
.col1
	inc hl
	ld a, [hld]
	ld [hli], a
	dec d
	jr nz, .col1
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	dec e
	jr nz, .row1
	jr .okay2

.user_2
	hlcoord 19, 0
	lb de, 8, 7
.row2
	push de
	push hl
.col2
	dec hl
	ld a, [hli]
	ld [hld], a
	dec d
	jr nz, .col2
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	dec e
	jr nz, .row2
.okay2
	xor a
	ldh [hBGMapThird], a
	ld a, $1
	ldh [hBGMapMode], a
	call BattleBGEffects_IncrementJumptable
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	dec [hl]
	ret

.four
	xor a
	ldh [hBGMapMode], a
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld [hl], $1
	ret

.done
	call EndBattleBGEffect
	ret

BattleBGEffect_EnterMon:
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	ld de, .EnemyData
	jr .okay

.player_turn
	ld de, .PlayerData
.okay
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	call BattleBGEffect_RunPicResizeScript
	ret

.PlayerData:
	db  2, $31, 2
	db  1, $31, 1
	db  0, $31, 0
	db -1
.EnemyData:
	db  5, $00, 5
	db  4, $00, 4
	db  3, $00, 3
	db -1

BattleBGEffect_ReturnMon:
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	ld de, .EnemyData
	jr .okay

.player_turn
	ld de, .PlayerData
.okay
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	call BattleBGEffect_RunPicResizeScript
	ret

.PlayerData:
	db  0, $31, 0
	db -2, $66, 0
	db  1, $31, 1
	db -2, $44, 1
	db  2, $31, 2
	db -2, $22, 2
	db -3, $00, 0
	db -1
.EnemyData:
	db  3, $00, 3
	db -2, $77, 3
	db  4, $00, 4
	db -2, $55, 4
	db  5, $00, 5
	db -2, $33, 5
	db -3, $00, 0
	db -1

BattleBGEffect_RunPicResizeScript:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw .restart
	dw .end

.zero
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld e, [hl]
	ld d, $0
	inc [hl]
	ld a, [wBattleAnimTemp1]
	ld l, a
	ld a, [wBattleAnimTemp2]
	ld h, a
	add hl, de
	add hl, de
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .end
	cp -2
	jr z, .clear
	cp -3
	jr z, .skip
	call .PlaceGraphic
.skip
	call BattleBGEffects_IncrementJumptable
	ld a, $1
	ldh [hBGMapMode], a
	ret

.clear
	call .ClearBox
	jr .zero

.restart
	xor a
	ldh [hBGMapMode], a
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld [hl], $0
	ret

.end
	xor a
	ldh [hBGMapMode], a
	call EndBattleBGEffect
	ret

.ClearBox:
; get dims
	push bc
	inc hl
	ld a, [hli]
	ld b, a
	and $f
	ld c, a
	ld a, b
	swap a
	and $f
	ld b, a
; get coords
	ld e, [hl]
	ld d, 0
	ld hl, .Coords
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ClearBox
	pop bc
	ret

.PlaceGraphic:
; get dims
	push bc
	push hl
	ld e, [hl]
	ld d, 0
	ld hl, .BGSquares
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	and $f
	ld c, a
	ld a, b
	swap a
	and $f
	ld b, a
; store pointer
	ld e, [hl]
	inc hl
	ld d, [hl]
; get byte
	pop hl
	inc hl
	ld a, [hli]
	ld [wBattleAnimTemp0], a
; get coord
	push de
	ld e, [hl]
	ld d, 0
	ld hl, .Coords
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
; fill box
.row
	push bc
	push hl
	ld a, [wBattleAnimTemp0]
	ld b, a
.col
	ld a, [de]
	add b
	ld [hli], a
	inc de
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	pop bc
	ret

.Coords:
	dwcoord  2,  6
	dwcoord  3,  8
	dwcoord  4, 10
	dwcoord 12,  0
	dwcoord 13,  2
	dwcoord 14,  4

.BGSquares:
bgsquare: MACRO
	dn \1, \2
	dw \3
ENDM

	bgsquare 6, 6, .SixBySix
	bgsquare 4, 4, .FourByFour
	bgsquare 2, 2, .TwoByTwo
	bgsquare 7, 7, .SevenBySeven
	bgsquare 5, 5, .FiveByFive
	bgsquare 3, 3, .ThreeByThree

.SixBySix:
	db $00, $06, $0c, $12, $18, $1e
	db $01, $07, $0d, $13, $19, $1f
	db $02, $08, $0e, $14, $1a, $20
	db $03, $09, $0f, $15, $1b, $21
	db $04, $0a, $10, $16, $1c, $22
	db $05, $0b, $11, $17, $1d, $23

.FourByFour:
	db $00, $0c, $12, $1e
	db $02, $0e, $14, $20
	db $03, $0f, $15, $21
	db $05, $11, $17, $23

.TwoByTwo:
	db $00, $1e
	db $05, $23

.SevenBySeven:
	db $00, $07, $0e, $15, $1c, $23, $2a
	db $01, $08, $0f, $16, $1d, $24, $2b
	db $02, $09, $10, $17, $1e, $25, $2c
	db $03, $0a, $11, $18, $1f, $26, $2d
	db $04, $0b, $12, $19, $20, $27, $2e
	db $05, $0c, $13, $1a, $21, $28, $2f
	db $06, $0d, $14, $1b, $22, $29, $30

.FiveByFive:
	db $00, $07, $15, $23, $2a
	db $01, $08, $16, $24, $2b
	db $03, $0a, $18, $26, $2d
	db $05, $0c, $1a, $28, $2f
	db $06, $0d, $1b, $29, $30

.ThreeByThree:
	db $00, $15, $2a
	db $03, $18, $2d
	db $06, $1b, $30

BattleBGEffect_Surf:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	lb de, 2, 2
	call InitSurfWaves

.one
	ldh a, [hLCDCPointer]
	and a
	ret z
	push bc
	call .RotatewSurfWaveBGEffect
	pop bc
	ret

.two
	call BattleAnim_ResetLCDStatCustom
	ret

.RotatewSurfWaveBGEffect:
	ld hl, wSurfWaveBGEffect
	ld de, wSurfWaveBGEffect + 1
	ld c, wSurfWaveBGEffectEnd - wSurfWaveBGEffect - 1
	ld a, [hl]
	push af
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ld [hl], a
	ld de, wLYOverridesBackup
	ld hl, wSurfWaveBGEffect
	ld bc, $0
.loop2
	ldh a, [hLYOverrideStart]
	cp e
	jr nc, .load_zero
	push hl
	add hl, bc
	ld a, [hl]
	pop hl
	jr .okay

.load_zero
	xor a
.okay
	ld [de], a
	ld a, c
	inc a
	and $3f
	ld c, a
	inc de
	ld a, e
	cp $5f
	jr c, .loop2
	ret

BattleBGEffect_Whirlpool:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCY)
	ldh [hLCDCPointer], a
	xor a
	ldh [hLYOverrideStart], a
	ld a, $5e
	ldh [hLYOverrideEnd], a
	lb de, 2, 2
	call Functionc8f2e
	ret

.one
	call BattleBGEffect_WavyScreenFX
	ret

.two
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_30:
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCY)
	call BattleBGEffect_SetLCDStatCustoms1
	call EndBattleBGEffect
	ret

BattleBGEffect_31:
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	ld e, a
	add $4
	ld [hl], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and $f0
	swap a
	xor $ff
	add $4
	ld d, a
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld a, [hl]
	ld [wBattleAnimTemp0], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .done
	inc [hl]
	inc [hl]
	call Functionc8f9a
	ret

.done
	call BattleBGEffects_ClearLYOverrides
	call EndBattleBGEffect
	ret

BattleBGEffect_32:
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_Psychic:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	xor a
	ldh [hLYOverrideStart], a
	ld a, $5f
	ldh [hLYOverrideEnd], a
	lb de, 6, 5
	call Functionc8f2e
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], $0
	ret

.one
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $3
	ret nz
	call BattleBGEffect_WavyScreenFX
	ret

.two
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_Teleport:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	call BattleBGEffect_SetLCDStatCustoms1
	lb de, 6, 5
	call Functionc8f2e
	ret

.one
	call BattleBGEffect_WavyScreenFX
	ret

.two
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_NightShade:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCY)
	call BattleBGEffect_SetLCDStatCustoms1
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld e, [hl]
	ld d, 2
	call Functionc8f2e
	ret

.one
	call BattleBGEffect_WavyScreenFX
	ret

.two
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_DoubleTeam:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], $0
	ret

.one
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	cp $10
	jr nc, .next
	inc [hl]
	call .UpdateLYOverrides
	ret

.three
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .next
	dec [hl]
	call .UpdateLYOverrides
	ret

.next
	call BattleBGEffects_IncrementJumptable
	ret

.two
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	ld d, $2
	call BattleBGEffects_Sine
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	add [hl]
	call .UpdateLYOverrides
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	add $4
	ld [hl], a

.four
	ret

.UpdateLYOverrides:
	ld e, a
	xor $ff
	inc a
	ld d, a
	ld h, HIGH(wLYOverridesBackup)
	ldh a, [hLYOverrideStart]
	ld l, a
	ldh a, [hLYOverrideEnd]
	sub l
	srl a
	push af
.loop
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec a
	jr nz, .loop
	pop af
	ret nc
	ld [hl], e
	ret

.five
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_AcidArmor:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCY)
	call BattleBGEffect_SetLCDStatCustoms1
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld e, [hl]
	ld d, 2
	call Functionc8f2e
	ld h, HIGH(wLYOverridesBackup)
	ldh a, [hLYOverrideEnd]
	ld l, a
	ld [hl], $0
	dec l
	ld [hl], $0
	ret

.one
	ldh a, [hLYOverrideEnd]
	ld l, a
	ld h, HIGH(wLYOverridesBackup)
	ld e, l
	ld d, h
	dec de
.loop
	ld a, [de]
	dec de
	ld [hld], a
	ldh a, [hLYOverrideStart]
	cp l
	jr nz, .loop
	ld [hl], $90
	ldh a, [hLYOverrideEnd]
	ld l, a
	ld a, [hl]
	cp $1
	jr c, .okay
	cp $90
	jr z, .okay
	ld [hl], $0
.okay
	dec l
	ld a, [hl]
	cp $2
	ret c
	cp $90
	ret z
	ld [hl], $0
	ret

.two
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_Withdraw:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCY)
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], $1
	ret

.one
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	cp d
	ret nc
	call BGEffect_DisplaceLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	rlca
	rlca
	and $3
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.two
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_Dig:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCY)
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], $2
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], $0
	ret

.one
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ret

.next
	ld [hl], $10
	call BattleBGEffects_IncrementJumptable
.two
	ldh a, [hLYOverrideStart]
	ld l, a
	ldh a, [hLYOverrideEnd]
	sub l
	dec a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	cp [hl]
	ret c
	ld a, [hl]
	push af
	and $7
	jr nz, .skip
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	dec [hl]
.skip
	pop af
	call BGEffect_DisplaceLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	inc [hl]
	inc [hl]
	ret

.three
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_Tackle:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw Tackle_BGEffect25_2d_one
	dw Tackle_BGEffect25_2d_two
	dw .three

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], 0
	call BGEffect_CheckBattleTurn
	jr nz, .player_side
	ld a, 2
	jr .okay

.player_side
	ld a, -2
.okay
	ld [hl], a
	ret

.three
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_25:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw Tackle_BGEffect25_2d_one
	dw Tackle_BGEffect25_2d_two
	dw .three

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	call BattleBGEffect_SetLCDStatCustoms2
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], 0
	call BGEffect_CheckBattleTurn
	jr nz, .player_side
	ld a, 2
	jr .okay

.player_side
	ld a, -2
.okay
	ld [hl], a
	ret

.three
	call BattleAnim_ResetLCDStatCustom
	ret

Tackle_BGEffect25_2d_one:
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	cp -8
	jr z, .reached_limit
	cp 8
	jr nz, .finish
.reached_limit
	call BattleBGEffects_IncrementJumptable
.finish
	call Functionc88a5
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Tackle_BGEffect25_2d_two:
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_c8893
	call BattleBGEffects_IncrementJumptable
.asm_c8893
	call Functionc88a5
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Functionc88a5:
	push af
	ld a, [wFXAnimID + 1]
	or a
	jr nz, .not_rollout
	ld a, [wFXAnimID]
	cp ROLLOUT
	jr z, .rollout
.not_rollout
	pop af
	jp BGEffect_FillLYOverridesBackup

.rollout
	ldh a, [hLYOverrideStart]
	ld d, a
	ldh a, [hLYOverrideEnd]
	sub d
	ld d, a
	ld h, HIGH(wLYOverridesBackup)
	ldh a, [hSCY]
	or a
	jr nz, .skip1
	ldh a, [hLYOverrideStart]
	or a
	jr z, .skip2
	dec a
	ld l, a
	ld [hl], $0
	jr .skip2

.skip1
	ldh a, [hLYOverrideEnd]
	dec a
	ld l, a
	ld [hl], $0
.skip2
	ldh a, [hSCY]
	ld l, a
	ldh a, [hLYOverrideStart]
	sub l
	jr nc, .skip3
	xor a
	dec d
.skip3
	ld l, a
	pop af
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

BattleBGEffect_2d:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw BGEffect2d_2f_zero
	dw Tackle_BGEffect25_2d_one
	dw Tackle_BGEffect25_2d_two
	dw .three

.three
	call BattleAnim_ResetLCDStatCustom
	ret

BGEffect2d_2f_zero:
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], $0
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	ld a, -2
	jr .okay

.player_turn
	ld a, 2
.okay
	ld [hl], a
	ret

BattleBGEffect_2f:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw BGEffect2d_2f_zero
	dw Tackle_BGEffect25_2d_one
	dw .two
	dw Tackle_BGEffect25_2d_two
	dw .four

.four
	call BattleAnim_ResetLCDStatCustom
.two
	ret

BattleBGEffect_26:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], $0
	ret

.one
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	ld d, $8
	call BattleBGEffects_Sine
	call BGEffect_FillLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	add $4
	ld [hl], a
	ret

.two
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_2c:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	xor a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hli], a
	ld [hl], a
	ret

.one
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	ld d, $6
	call BattleBGEffects_Sine
	push af
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	ld d, $2
	call BattleBGEffects_Sine
	ld e, a
	pop af
	add e
	call BGEffect_FillLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	add $8
	ld [hl], a
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ret

.two
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_28:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	call BattleBGEffect_SetLCDStatCustoms1
	ret

.one
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	cp $20
	ret nc
	inc [hl]
	ld d, a
	ld e, 4
	call Functionc8f2e
	ret

.two
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	and a
	jr z, .reset
	dec [hl]
	ld d, a
	ld e, 4
	call Functionc8f2e
	ret

.reset
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_BounceDown:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCY)
	call BattleBGEffect_SetLCDStatCustoms2
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], $1
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], $20
	ret

.one
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	cp $38
	ret nc
	push af
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleBGEffects_Cosine
	add $10
	ld d, a
	pop af
	add d
	call BGEffect_DisplaceLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	inc [hl]
	inc [hl]
	ret

.two
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_2a:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five

.zero
	call BattleBGEffects_IncrementJumptable
	ld a, $e4
	call BattleBGEffects_SetLYOverrides
	ld a, $47
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ldh a, [hLYOverrideStart]
	ld l, a
	ld h, HIGH(wLYOverridesBackup)
.loop
	ldh a, [hLYOverrideEnd]
	cp l
	jr z, .done
	xor a
	ld [hli], a
	jr .loop

.done
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], $0
.one
.four
	ret

.two
	call .GetLYOverride
	jr nc, .next
	call .SetLYOverridesBackup
	ret

.next
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], $0
	ldh a, [hLYOverrideStart]
	inc a
	ldh [hLYOverrideStart], a
	call BattleBGEffects_IncrementJumptable
	ret

.three
	call .GetLYOverride
	jr nc, .finish
	call .SetLYOverridesBackup
	ldh a, [hLYOverrideEnd]
	dec a
	ld l, a
	ld [hl], e
	ret

.finish
	call BattleBGEffects_IncrementJumptable
	ret

.SetLYOverridesBackup:
	ld e, a
	ldh a, [hLYOverrideStart]
	ld l, a
	ldh a, [hLYOverrideEnd]
	sub l
	srl a
	ld h, HIGH(wLYOverridesBackup)
.loop2
	ld [hl], e
	inc hl
	inc hl
	dec a
	jr nz, .loop2
	ret

.five
	call BattleBGEffects_ResetVideoHRAM
	ret

.GetLYOverride:
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	inc [hl]
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, .data
	add hl, de
	ld a, [hl]
	cp $ff
	ret

.data
	db $00, $40, $90, $e4
	db -1

BattleBGEffect_2b:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	call BattleBGEffect_SetLCDStatCustoms1
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], $40
	ret

.one
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	srl a
	srl a
	srl a
	and $f
	ld d, a
	ld e, a
	call Functionc8f2e
	ret

.done
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_1c:
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	ld a, $e4
	call BattleBGEffects_SetLYOverrides
	ld a, LOW(rBGP)
	ldh [hLCDCPointer], a
	xor a
	ldh [hLYOverrideStart], a
	ld a, $60
	ldh [hLYOverrideEnd], a
	ret

.one
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld e, a
	and $7
	ret nz
	ld a, e
	and $18
	sla a
	swap a
	sla a
	ld e, a
	ld d, $0
	push bc
	call BGEffect_CheckBattleTurn
	jr nz, .player
	ld hl, .CGB_DMGEnemyData
	add hl, de
	ld a, [hli]
	ld [wOBP1], a
	ld d, a
	ld e, [hl]
	lb bc, $2f, $30
	jr .okay

.player
	ld hl, .DMG_PlayerData
	add hl, de
	ld d, [hl]
	inc hl
	ld a, [hl]
	ld [wOBP1], a
	ld e, a
	lb bc, $37, $28
.okay
	call .DMG_LYOverrideLoads
	pop bc
	ret

.two
	call BattleBGEffects_ResetVideoHRAM
	ld a, $e4
	ld [wBGP], a
	ld [wOBP1], a
	ret

.DMG_LYOverrideLoads:
	ld hl, wLYOverridesBackup
.loop1
	ld [hl], d
	inc hl
	dec b
	jr nz, .loop1
.loop2
	ld [hl], e
	inc hl
	dec c
	jr nz, .loop2
	ret

.cgb
	ld de, .Jumptable
	call BatttleBGEffects_GetNamedJumptablePointer
	jp hl

.Jumptable:
	dw .cgb_zero
	dw .cgb_one
	dw .cgb_two

.cgb_zero
	call BattleBGEffects_IncrementJumptable
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], $0
	ret

.cgb_one
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld e, a
	and $7
	ret nz
	ld a, e
	and $18
	sla a
	swap a
	sla a
	ld e, a
	ld d, 0
	call BGEffect_CheckBattleTurn
	jr nz, .player_2
	ld hl, .CGB_DMGEnemyData
	add hl, de
	ld a, [hli]
	push hl
	call BGEffects_LoadBGPal1_OBPal0
	pop hl
	ld a, [hl]
	call BGEffects_LoadBGPal0_OBPal1
	ret

.player_2
	ld hl, .CGB_DMGEnemyData
	add hl, de
	ld a, [hli]
	push hl
	call BGEffects_LoadBGPal0_OBPal1
	pop hl
	ld a, [hl]
	call BGEffects_LoadBGPal1_OBPal0
	ret

.cgb_two
	ld a, $e4
	call BGEffects_LoadBGPal0_OBPal1
	ld a, $e4
	call BGEffects_LoadBGPal1_OBPal0
	call EndBattleBGEffect
	ret

.CGB_DMGEnemyData:
	db $e4, $e4
	db $f8, $90
	db $fc, $40
	db $f8, $90
.DMG_PlayerData:
	db $e4, $e4
	db $90, $f8
	db $40, $fc
	db $90, $f8

BattleBGEffect_RapidFlash:
	ld de, .FlashPals
	call BGEffect_RapidCyclePals
	ret

.FlashPals:
	db $e4, $6c, $fe

BattleBGEffect_16:
	ld de, .Pals
	call BGEffect_RapidCyclePals
	ret

.Pals:
	db $e4, $90, $40, $ff

BattleBGEffect_17:
	ld de, .Pals
	call BGEffect_RapidCyclePals
	ret

.Pals:
	db $e4, $f8, $fc, $ff

BattleBGEffect_18:
	ld de, .Pals
	call BGEffect_RapidCyclePals
	ret

.Pals:
	db $e4, $90, $40, $90, $fe

BattleBGEffect_19:
	ld de, .Pals
	call BGEffect_RapidCyclePals
	ret

.Pals:
	db $e4, $f8, $fc, $f8, $fe

BattleBGEffect_1a:
	ld de, .Pals
	call BGEffect_RapidCyclePals
	ret

.Pals:
	db $e4, $f8, $fc, $f8, $e4, $90, $40, $90, $fe

BattleBGEffect_1b:
	ld de, .Pals
	call BGEffect_RapidCyclePals
	ret

.Pals:
	db $e4, $fc, $e4, $00, $fe

BattleBGEffect_1d:
	ld de, .Pals
	call BGEffect_RapidCyclePals
	ret

.Pals:
	db $e4, $90, $40, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40, $90, $e4, $ff

BattleBGEffect_1e:
	ld de, .Pals
	call BGEffect_RapidCyclePals
	ret

.Pals:
	db $00, $40, $90, $e4, $ff

BattleBGEffect_VibrateMon:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], $1
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], $20
	ret

.one
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	and a
	jr z, .finish
	dec [hl]
	and $1
	ret nz
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	call BGEffect_FillLYOverridesBackup
	ret

.finish
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_WobbleMon:
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	xor a
	ldh [hLYOverrideStart], a
	ld a, $37
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], $0
	ret

.one
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .two
	ld d, $6
	call BattleBGEffects_Sine
	call BGEffect_FillLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ret

.two
	call BattleAnim_ResetLCDStatCustom
	ret

BattleBGEffect_2e:
	call Functionc8d0b
	jr c, .xor_a
	bit 7, a
	jr z, .okay
.xor_a
	xor a
.okay
	push af
	call DelayFrame
	pop af
	ldh [hSCY], a
	xor $ff
	inc a
	ld [wAnimObject01YOffset], a
	ret

BattleBGEffect_1f:
	call Functionc8d0b
	jr nc, .skip
	xor a
.skip
	ldh [hSCX], a
	ret

BattleBGEffect_20:
	call Functionc8d0b
	jr nc, .skip
	xor a
.skip
	ldh [hSCY], a
	ret

Functionc8d0b:
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .okay
	call EndBattleBGEffect
	scf
	ret

.okay
	dec [hl]
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .every_16_frames
	dec [hl]
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and a
	ret

.every_16_frames
	ld a, [hl]
	swap a
	or [hl]
	ld [hl], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	and a
	ret

BattleBGEffect_35:
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .finish
	ld d, $6
	call BattleBGEffects_Sine
	ldh [hSCX], a
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ret

.finish
	xor a
	ldh [hSCX], a
	ret

BattleBGEffect_GetNthDMGPal:
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld a, [hl]
	and a
	jr z, .zero
	dec [hl]
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	call BattleBGEffect_GetNextDMGPal
	ret

.zero
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld [hl], a
	call BattleBGEffect_GetFirstDMGPal
	ret

BGEffect_RapidCyclePals:
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	push de
	ld de, .Jumptable_DMG
	call BatttleBGEffects_GetNamedJumptablePointer
	pop de
	jp hl

.Jumptable_DMG:
	dw .zero_dmg
	dw .one_dmg
	dw .two_dmg

.zero_dmg
	call BattleBGEffects_IncrementJumptable
	ld a, $e4
	call BattleBGEffects_SetLYOverrides
	ld a, $47
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	ld [hl], $0
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], a
	ret

.one_dmg
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .okay_1_dmg
	dec [hl]
	ret

.okay_1_dmg
	ld a, [hl]
	swap a
	or [hl]
	ld [hl], a
	call BattleBGEffect_GetFirstDMGPal
	jr c, .okay_2_dmg
	call BGEffect_FillLYOverridesBackup
	ret

.okay_2_dmg
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	dec [hl]
	ret

.two_dmg
	call BattleBGEffects_ResetVideoHRAM
	ld a, %11100100
	ldh [rBGP], a
	call EndBattleBGEffect
	ret

.cgb
	push de
	ld de, .Jumptable_CGB
	call BatttleBGEffects_GetNamedJumptablePointer
	pop de
	jp hl

.Jumptable_CGB:
	dw .zero_cgb
	dw .one_cgb
	dw .two_cgb
	dw .three_cgb
	dw .four_cgb

.zero_cgb
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn_cgb
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_IncrementJumptable
.player_turn_cgb
	call BattleBGEffects_IncrementJumptable
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	ld [hl], $0
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], a
	ret

.one_cgb
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .okay_1_cgb
	dec [hl]
	ret

.okay_1_cgb
	ld a, [hl]
	swap a
	or [hl]
	ld [hl], a
	call BattleBGEffect_GetFirstDMGPal
	jr c, .okay_2_cgb
	call BGEffects_LoadBGPal0_OBPal1
	ret

.okay_2_cgb
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	dec [hl]
	ret

.two_cgb
	ld a, $e4
	call BGEffects_LoadBGPal0_OBPal1
	call EndBattleBGEffect
	ret

.three_cgb
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .okay_3_cgb
	dec [hl]
	ret

.okay_3_cgb
	ld a, [hl]
	swap a
	or [hl]
	ld [hl], a
	call BattleBGEffect_GetFirstDMGPal
	jr c, .okay_4_cgb
	call BGEffects_LoadBGPal1_OBPal0
	ret

.okay_4_cgb
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	dec [hl]
	ret

.four_cgb
	ld a, $e4
	call BGEffects_LoadBGPal1_OBPal0
	call EndBattleBGEffect
	ret

BGEffects_LoadBGPal0_OBPal1:
	ld h, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld a, h
	push bc
	push af
	ld hl, wBGPals2
	ld de, wBGPals1
	ld b, a
	ld c, $1
	call CopyPals
	ld hl, wOBPals2 palette 1
	ld de, wOBPals1 palette 1
	pop af
	ld b, a
	ld c, $1
	call CopyPals
	pop bc
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

BGEffects_LoadBGPal1_OBPal0:
	ld h, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld a, h
	push bc
	push af
	ld hl, wBGPals2 palette 1
	ld de, wBGPals1 palette 1
	ld b, a
	ld c, $1
	call CopyPals
	ld hl, wOBPals2
	ld de, wOBPals1
	pop af
	ld b, a
	ld c, $1
	call CopyPals
	pop bc
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

BattleBGEffect_GetFirstDMGPal:
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld a, [hl]
	inc [hl]
BattleBGEffect_GetNextDMGPal:
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .quit
	cp -2
	jr nz, .repeat
	ld a, [de]
	ld hl, BG_EFFECT_STRUCT_03
	add hl, bc
	ld [hl], $0
.repeat
	and a
	ret

.quit
	scf
	ret

BattleBGEffects_ClearLYOverrides:
	xor a
BattleBGEffects_SetLYOverrides:
	ld hl, wLYOverrides
	ld e, $99
.loop1
	ld [hli], a
	dec e
	jr nz, .loop1
	ld hl, wLYOverridesBackup
	ld e, $91
.loop2
	ld [hli], a
	dec e
	jr nz, .loop2
	ret

BattleBGEffect_SetLCDStatCustoms1:
	ldh [hLCDCPointer], a
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	lb de, $00, $36
	jr .okay

.player_turn
	lb de, $2f, $5e
.okay
	ld a, d
	ldh [hLYOverrideStart], a
	ld a, e
	ldh [hLYOverrideEnd], a
	ret

BattleBGEffect_SetLCDStatCustoms2:
	ldh [hLCDCPointer], a
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	lb de, $00, $36
	jr .okay

.player_turn
	lb de, $2d, $5e
.okay
	ld a, d
	ldh [hLYOverrideStart], a
	ld a, e
	ldh [hLYOverrideEnd], a
	ret

BattleAnim_ResetLCDStatCustom:
	xor a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	call BattleBGEffects_ClearLYOverrides
	xor a
	ldh [hLCDCPointer], a
	call EndBattleBGEffect
	ret

BattleBGEffects_ResetVideoHRAM:
	xor a
	ldh [hLCDCPointer], a
	ld a, %11100100
	ldh [rBGP], a
	ld [wBGP], a
	ld [wOBP1], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	call BattleBGEffects_ClearLYOverrides
	ret

Functionc8f2e:
	push bc
	xor a
	ld [wBattleAnimTemp0], a
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	ld a, $80
	ld [wBattleAnimTemp3], a
	ld bc, wLYOverridesBackup
.loop
	ldh a, [hLYOverrideStart]
	cp c
	jr nc, .next
	ldh a, [hLYOverrideEnd]
	cp c
	jr c, .next
	ld a, [wBattleAnimTemp2]
	ld d, a
	ld a, [wBattleAnimTemp0]
	call BattleBGEffects_Sine
	ld [bc], a
.next
	inc bc
	ld a, [wBattleAnimTemp1]
	ld hl, wBattleAnimTemp0
	add [hl]
	ld [hl], a
	ld hl, wBattleAnimTemp3
	dec [hl]
	jr nz, .loop
	pop bc
	ret

InitSurfWaves:
	push bc
	xor a
	ld [wBattleAnimTemp0], a
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	ld a, $40
	ld [wBattleAnimTemp3], a
	ld bc, wSurfWaveBGEffect
.loop
	ld a, [wBattleAnimTemp2]
	ld d, a
	ld a, [wBattleAnimTemp0]
	call BattleBGEffects_Sine
	ld [bc], a
	inc bc
	ld a, [wBattleAnimTemp1]
	ld hl, wBattleAnimTemp0
	add [hl]
	ld [hl], a
	ld hl, wBattleAnimTemp3
	dec [hl]
	jr nz, .loop
	pop bc
	ret

Functionc8f9a:
	push bc
	ld [wBattleAnimTemp3], a
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	call .GetLYOverrideBackupAddrOffset
	ld hl, wLYOverridesBackup
	add hl, de
	ld c, l
	ld b, h
.loop
	ld a, [wBattleAnimTemp3]
	and a
	jr z, .done
	dec a
	ld [wBattleAnimTemp3], a
	push af
	ld a, [wBattleAnimTemp2]
	ld d, a
	ld a, [wBattleAnimTemp1]
	push hl
	call BattleBGEffects_Sine
	ld e, a
	pop hl
	ldh a, [hLYOverrideEnd]
	cp c
	jr c, .skip1
	ld a, e
	ld [bc], a
	inc bc
.skip1
	ldh a, [hLYOverrideStart]
	cp l
	jr nc, .skip2
	ld [hl], e
	dec hl
.skip2
	ld a, [wBattleAnimTemp1]
	add $4
	ld [wBattleAnimTemp1], a
	pop af
	jr .loop

.done
	pop bc
	and a
	ret

.GetLYOverrideBackupAddrOffset:
	ldh a, [hLYOverrideStart]
	ld e, a
	ld a, [wBattleAnimTemp0]
	add e
	ld e, a
	ld d, $0
	ret

BattleBGEffect_WavyScreenFX:
	push bc
	ldh a, [hLYOverrideStart]
	ld l, a
	inc a
	ld e, a
	ld h, HIGH(wLYOverridesBackup)
	ld d, h
	ldh a, [hLYOverrideEnd]
	sub l
	and a
	jr z, .done
	ld c, a
	ld a, [hl]
	push af
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ld [hl], a
.done
	pop bc
	ret

BGEffect_FillLYOverridesBackup:
	push af
	ld h, HIGH(wLYOverridesBackup)
	ldh a, [hLYOverrideStart]
	ld l, a
	ldh a, [hLYOverrideEnd]
	sub l
	ld d, a
	pop af
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

BGEffect_DisplaceLYOverridesBackup:
	; e = a
	; d = [hLYOverrideEnd] - [hLYOverrideStart] - a
	push af
	ld e, a
	ldh a, [hLYOverrideStart]
	ld l, a
	ldh a, [hLYOverrideEnd]
	sub l
	sub e
	ld d, a
	ld h, HIGH(wLYOverridesBackup)
	ldh a, [hLYOverrideStart]
	ld l, a
	ld a, $90
.loop
	ld [hli], a
	dec e
	jr nz, .loop
	pop af
	xor $ff
.loop2
	ld [hli], a
	dec d
	jr nz, .loop2
	ret

BGEffect_CheckBattleTurn:
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ldh a, [hBattleTurn]
	and $1
	xor [hl]
	ret

BGEffect_CheckFlyDigStatus:
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ldh a, [hBattleTurn]
	and $1
	xor [hl]
	jr nz, .player
	ld a, [wEnemySubStatus3] ; EnemySubStatus3
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret

.player
	ld a, [wPlayerSubStatus3] ; PlayerSubStatus3
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret

BattleBGEffects_CheckSGB:
	ldh a, [hSGB]
	and a
	ret

BattleBGEffects_Sine:
	ld e, a
	callfar BattleAnim_Sine_e
	ld a, e
	ret

BattleBGEffects_Cosine:
	ld e, a
	callfar BattleAnim_Cosine_e
	ld a, e
	ret
