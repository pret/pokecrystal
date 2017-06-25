DoBattleAnimFrame: ; ccfbe
	ld hl, BATTLEANIMSTRUCT_FUNCTION
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; ccfce

.Jumptable:
	dw BattleAnimFunction_Null ; 00
	dw BattleAnimFunction_01 ; 01
	dw BattleAnimFunction_02 ; 02
	dw BattleAnimFunction_03 ; 03
	dw BattleAnimFunction_04 ; 04
	dw BattleAnimFunction_ThrowFromPlayerToEnemy ; 05
	dw BattleAnimFunction_ThrowFromPlayerToEnemyAndDisappear ; 06
	dw BattleAnimFunction_07 ; 07
	dw BattleAnimFunction_08 ; 08
	dw BattleAnimFunction_09 ; 09
	dw BattleAnimFunction_0A ; 0a
	dw BattleAnimFunction_RazorLeaf ; 0b
	dw BattleAnimFunction_0C ; 0c
	dw BattleAnimFunction_0D ; 0d
	dw BattleAnimFunction_0E ; 0e
	dw BattleAnimFunction_0F ; 0f
	dw BattleAnimFunction_10 ; 10
	dw BattleAnimFunction_11 ; 11
	dw BattleAnimFunction_PokeBall ; 12
	dw BattleAnimFunction_PokeBallBlocked ; 13
	dw BattleAnimFunction_14 ; 14
	dw BattleAnimFunction_15 ; 15
	dw BattleAnimFunction_16 ; 16
	dw BattleAnimFunction_17 ; 17
	dw BattleAnimFunction_18 ; 18
	dw BattleAnimFunction_19 ; 19
	dw BattleAnimFunction_1A ; 1a
	dw BattleAnimFunction_1B ; 1b
	dw BattleAnimFunction_1C ; 1c
	dw BattleAnimFunction_1D ; 1d
	dw BattleAnimFunction_1E ; 1e
	dw BattleAnimFunction_1F ; 1f
	dw BattleAnimFunction_LeechSeed ; 20
	dw BattleAnimFunction_21 ; 21
	dw BattleAnimFunction_22 ; 22
	dw BattleAnimFunction_23 ; 23
	dw BattleAnimFunction_24 ; 24
	dw BattleAnimFunction_25 ; 25
	dw BattleAnimFunction_26 ; 26
	dw BattleAnimFunction_27 ; 27
	dw BattleAnimFunction_28 ; 28
	dw BattleAnimFunction_SpiralDescent ; 29
	dw BattleAnimFunction_PoisonGas ; 2a
	dw BattleAnimFunction_Horn ; 2b
	dw BattleAnimFunction_2C ; 2c
	dw BattleAnimFunction_2D ; 2d
	dw BattleAnimFunction_2E ; 2e
	dw BattleAnimFunction_2F ; 2f
	dw BattleAnimFunction_30 ; 30
	dw BattleAnimFunction_31 ; 31
	dw BattleAnimFunction_32 ; 32
	dw BattleAnimFunction_33 ; 33
	dw BattleAnimFunction_34 ; 34
	dw BattleAnimFunction_35 ; 35
	dw BattleAnimFunction_36 ; 36
	dw BattleAnimFunction_37 ; 37
	dw BattleAnimFunction_38 ; 38
	dw BattleAnimFunction_39 ; 39
	dw BattleAnimFunction_3A ; 3a
	dw BattleAnimFunction_3B ; 3b
	dw BattleAnimFunction_3C ; 3c
	dw BattleAnimFunction_3D ; 3d
	dw BattleAnimFunction_3E ; 3e
	dw BattleAnimFunction_3F ; 3f
	dw BattleAnimFunction_40 ; 40
	dw BattleAnimFunction_41 ; 41
	dw BattleAnimFunction_42 ; 42
	dw BattleAnimFunction_43 ; 43
	dw BattleAnimFunction_44 ; 44
	dw BattleAnimFunction_45 ; 45
	dw BattleAnimFunction_46 ; 46
	dw BattleAnimFunction_47 ; 47
	dw BattleAnimFunction_48 ; 48
	dw BattleAnimFunction_49 ; 49
	dw BattleAnimFunction_4A ; 4a
	dw BattleAnimFunction_4B ; 4b
	dw BattleAnimFunction_4C ; 4c
	dw BattleAnimFunction_4D ; 4d
	dw BattleAnimFunction_4E ; 4e
	dw BattleAnimFunction_4F ; 4f

BattleAnimFunction_Null: ; cd06e (33:506e)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.one
	call DeinitBattleAnimation
.zero
	ret

BattleAnimFunction_ThrowFromPlayerToEnemyAndDisappear: ; cd079 (33:5079)
	call BattleAnimFunction_ThrowFromPlayerToEnemy
	ret c
	call DeinitBattleAnimation
	ret

BattleAnimFunction_ThrowFromPlayerToEnemy: ; cd081 (33:5081)
	; If x coord at $88 or beyond, abort.
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	ret nc
	; Move right 2 pixels
	add $2
	ld [hl], a
	; Move down 1 pixel
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	; Decrease ??? and hold onto its previous value (argument of the sine function)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	; Get ???, which is the amplitude of the sine function
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	; Store the result in the Y offset
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	; Carry flag denotes success
	scf
	ret

BattleAnimFunction_04: ; cd0a6 (33:50a6)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr c, .asm_cd0b3
	call DeinitBattleAnimation
	ret

.asm_cd0b3
	add $2
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ld d, $10
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	sra a
	sra a
	sra a
	sra a
	ld [hl], a
	ret

BattleAnimFunction_03: ; cd0e3 (33:50e3)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	bit 7, [hl]
	ld a, $0
	jr z, .asm_cd0f9
	ld a, $20
.asm_cd0f9
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_01: ; cd12a (33:512a)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.one
	call DeinitBattleAnimation
	ret

.zero
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	ret nc
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	call Functionce70a
	ret

BattleAnimFunction_02: ; cd146 (33:5146)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .asm_cd158
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	call Functionce70a
	ret

.asm_cd158
	call DeinitBattleAnimation
	ret

BattleAnimFunction_PokeBall: ; cd15c (33:515c)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven
	dw .eight
	dw .nine
	dw .ten
	dw .eleven
.zero ; init
	call GetBallAnimPal
	call BattleAnim_IncAnonJumptableIndex
	ret

.one
	call BattleAnimFunction_ThrowFromPlayerToEnemy
	ret c
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	ld a, BATTLEANIMFRAMESET_0B
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

.three
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_09
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $0
	inc hl
	ld [hl], $10
.four
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and $1f
	ret nz
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a
	ret nz
	ld a, BATTLEANIMFRAMESET_0C
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

.six
	ld a, BATTLEANIMFRAMESET_0D
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	dec [hl]
.two
.five
.nine
	ret

.seven
	call GetBallAnimPal
	ld a, BATTLEANIMFRAMESET_0A
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $20
.eight
.ten
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	and $1f
	jr z, .eleven
	and $f
	ret nz
	call BattleAnim_IncAnonJumptableIndex
	ret

.eleven
	call DeinitBattleAnimation
	ret

BattleAnimFunction_PokeBallBlocked: ; cd212 (33:5212)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
.zero
	call GetBallAnimPal
	call BattleAnim_IncAnonJumptableIndex
	ret

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $70
	jr nc, .next
	call BattleAnimFunction_ThrowFromPlayerToEnemy
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
.two
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .done
	add $4
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	dec [hl]
	ret

.done
	call DeinitBattleAnimation
	ret

GetBallAnimPal: ; cd249 (33:5249)
	ld hl, .balls
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [CurItem] ; CurItem
	ld e, a
	pop af
	ld [rSVBK], a
.IsInArray:
	ld a, [hli]
	cp -1
	jr z, .load
	cp e
	jr z, .load
	inc hl
	jr .IsInArray

.load
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_PALETTE
	add hl, bc
	ld [hl], a
	ret

; cd26c (33:526c)
.balls
	db MASTER_BALL, 5
	db ULTRA_BALL,  3
	db GREAT_BALL,  6
	db POKE_BALL,   4
	db HEAVY_BALL,  2
	db LEVEL_BALL,  7
	db LURE_BALL,   6
	db FAST_BALL,   6
	db FRIEND_BALL, 3
	db MOON_BALL,   2
	db LOVE_BALL,   4
	db -1,          2
; cd284
BattleAnimFunction_10: ; cd284 (33:5284)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
.zero
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	ret nc
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	call Functionce70a
	ret

.two
	call DeinitBattleAnimation
	ret

.three
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_0F
	call ReinitBattleAnimFrameset
.four
	ret

BattleAnimFunction_07: ; cd2be (33:52be)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $30
	inc hl
	ld [hl], $48
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $20
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	sub [hl]
	jr z, .done
	jr c, .done
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
	ret

.done
	call DeinitBattleAnimation
	ret

BattleAnimFunction_08: ; cd306 (33:5306)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
.zero
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .next
	call .SetCoords
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
.one
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $0
.two
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .loop_back
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $18
	call BattleAnim_Cosine
	sub $18
	sra a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $18
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.loop_back
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f0
	jr z, .finish
	sub $10
	ld d, a
	ld a, [hl]
	and $f
	or d
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	dec [hl]
	ret

.finish
	call BattleAnim_IncAnonJumptableIndex
.three
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b0
	jr c, .retain
	call DeinitBattleAnimation
	ret

.retain
	call .SetCoords
	ret

.SetCoords:
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f
	ld e, a
	srl e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
.loop
	dec [hl]
	dec e
	jr nz, .loop
	ret

BattleAnimFunction_09: ; cd3ae (33:53ae)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done_one
	dec [hl]
	ret

.done_one
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ret

.two
	call DeinitBattleAnimation
	ret

BattleAnimFunction_0A: ; cd3f2 (33:53f2)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven
	dw .eight
	dw .nine
.zero
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	cp $7
	jr z, .seven
	ld a, BATTLEANIMFRAMESET_11
	call ReinitBattleAnimFrameset
	ret

.seven
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr nc, .set_up_eight
	add $2
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.set_up_eight
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_10
	call ReinitBattleAnimFrameset
.eight
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $10
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ret

.nine
	call DeinitBattleAnimation
	ret

.one
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	dec [hl]
	ret

.four
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
.two
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	dec [hl]
	ret

.five
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
.three
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
.six
	ret

BattleAnimFunction_RazorLeaf: ; cd478 (33:5478)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six
	dw .seven
	dw .eight
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $40
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .sine_cosine
	call BattleAnim_IncAnonJumptableIndex
	xor a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hli], a
	ld [hl], a
	ld a, BATTLEANIMFRAMESET_17
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	bit 6, [hl]
	ret z
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], $5
	ret

.sine_cosine
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call Functioncd557
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ret

.two
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $20
	jr nz, .sine_cosine_2
	call DeinitBattleAnimation
	ret

.sine_cosine_2
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	bit 6, [hl]
	jr nz, .decrease
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	jr .finish

.decrease
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	dec [hl]
.finish
	ld de, $80
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ret

.three
	ld a, BATTLEANIMFRAMESET_16
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_01
	add hl, bc
	res 5, [hl]
.four
.five
.six
.seven
	call BattleAnim_IncAnonJumptableIndex
	ret

.eight
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $c0
	ret nc
	ld a, $8
	call Functionce70a
	ret

Functioncd557: ; cd557 (33:5557)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	bit 7, a
	jr nz, .negative
	cp $20
	jr nc, .plus_256
	cp $18
	jr nc, .plus_384
	ld de, $200
	ret

.plus_384
	ld de, $180
	ret

.plus_256
	ld de, $100
	ret

.negative
	and $3f
	cp $20
	jr nc, .minus_256
	cp $18
	jr nc, .minus_384
	ld de, -$200
	ret

.minus_384
	ld de, -$180
	ret

.minus_256
	ld de, -$100
	ret

BattleAnimFunction_4E: ; cd58a (33:558a)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
.zero
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $40
	rlca
	rlca
	add $19
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $40
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .sine_cosine
	call DeinitBattleAnimation
	ret

.sine_cosine
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call Functioncd557
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_0C: ; cd5e9 (33:55e9)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $c
.one
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	call Functionce70a
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $0
	ld a, BATTLEANIMFRAMESET_22
	call ReinitBattleAnimFrameset
.two
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	jr nc, .okay
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	ld de, $60
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
.okay
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $20
	ret c
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f0
	ld e, a
	ld d, $ff
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

BattleAnimFunction_0D: ; cd66a (33:566a)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
.zero
	call BattleAnim_IncAnonJumptableIndex
	ld a, rSCY - $ff00
	ld [hLCDCPointer], a
	ld a, $58
	ld [hLYOverrideStart], a
	ld a, $5e
	ld [hLYOverrideEnd], a
	ret

.one
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp e
	jr nc, .asm_cd69b
	call BattleAnim_IncAnonJumptableIndex
	xor a
	ld [hLYOverrideStart], a
	ret

.asm_cd69b
	dec a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	add [hl]
	sub $10
	ret c
	ld [hLYOverrideStart], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	inc a
	and $7
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	inc [hl]
.two
	ret

.three
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $70
	jr c, asm_cd6da
	xor a
	ld [hLCDCPointer], a
	ld [hLYOverrideStart], a
	ld [hLYOverrideEnd], a
.four
	call DeinitBattleAnimation
	ret

asm_cd6da: ; cd6da (33:56da)
	inc a
	inc a
	ld [hl], a
	sub $10
	ret c
	ld [hLYOverrideStart], a
	ret

BattleAnimFunction_0E: ; cd6e3 (33:56e3)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd6ea
	dw Functioncd6f7
Functioncd6ea: ; cd6ea (33:56ea)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, BATTLEANIMFRAMESET_24
	add [hl] ; offset
	call ReinitBattleAnimFrameset
Functioncd6f7: ; cd6f7 (33:56f7)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b8
	jr c, .asm_cd704
	call DeinitBattleAnimation
	ret

.asm_cd704
	ld a, $2
	call Functionce70a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_0F: ; cd71a (33:571a)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd725
	dw Functioncd728
	dw Functioncd763
	dw Functioncd776
Functioncd725: ; cd725 (33:5725)
	call BattleAnim_IncAnonJumptableIndex
Functioncd728: ; cd728 (33:5728)
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cd747
	ld a, $2
	call Functionce70a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_cd747
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_28
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], $30
	ld hl, BATTLEANIMSTRUCT_01
	add hl, bc
	ld a, [hl]
	and $1
	ld [hl], a
Functioncd763: ; cd763 (33:5763)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $18
	jr nc, .asm_cd76e
	inc [hl]
	ret

.asm_cd76e
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_29
	call ReinitBattleAnimFrameset
Functioncd776: ; cd776 (33:5776)
	ret

BattleAnimFunction_11: ; cd777 (33:5777)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $38
	jr c, .asm_cd784
	call DeinitBattleAnimation
	ret

.asm_cd784
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld l, [hl]
	ld h, a
	ld de, $80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	xor $10
	ld [hl], a
	ret

BattleAnimFunction_14: ; cd7a4 (33:57a4)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd7ab
	dw Functioncd7d2
Functioncd7ab: ; cd7ab (33:57ab)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f0
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f
	sla a
	sla a
	sla a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld [hl], $1
Functioncd7d2: ; cd7d2 (33:57d2)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_cd7de
	call DeinitBattleAnimation
	ret

.asm_cd7de
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a
	ret z
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_15: ; cd80c (33:580c)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd81f
	dw Functioncd817
	dw Functioncd81f
	dw Functioncd820
Functioncd817: ; cd817 (33:5817)
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_35
	call ReinitBattleAnimFrameset
Functioncd81f: ; cd81f (33:581f)
	ret

Functioncd820: ; cd820 (33:5820)
	call DeinitBattleAnimation
	ret

BattleAnimFunction_16: ; cd824 (33:5824)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd835
	dw Functioncd860
	dw Functioncd88f
	dw Functioncd88f
	dw Functioncd88f
	dw Functioncd88f
	dw Functioncd893
Functioncd835: ; cd835 (33:5835)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_cd852
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $10
	jr .asm_cd858

.asm_cd852
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $30
.asm_cd858
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
Functioncd860: ; cd860 (33:5860)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	bit 7, a
	jr nz, .load_no_inc
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	inc a
	jr .reinit

.load_no_inc
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
.reinit
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1f
	ret nz
Functioncd88f: ; cd88f (33:588f)
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncd893: ; cd893 (33:5893)
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], $1
	ret

BattleAnimFunction_17: ; cd89a (33:589a)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd8ab
	dw Functioncd8cc
	dw Functioncd8f5
	dw Functioncd8f5
	dw Functioncd8f5
	dw Functioncd8f5
	dw Functioncd8f9
Functioncd8ab: ; cd8ab (33:58ab)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_cd8be
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $10
	jr .asm_cd8c4

.asm_cd8be
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $30
.asm_cd8c4
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
Functioncd8cc: ; cd8cc (33:58cc)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	bit 7, a
	jr nz, .asm_cd8e6
	ld a, $3d
	jr .asm_cd8e8

.asm_cd8e6
	ld a, $3c
.asm_cd8e8
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $1f
	ret nz
Functioncd8f5: ; cd8f5 (33:58f5)
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncd8f9: ; cd8f9 (33:58f9)
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], $1
	ret

BattleAnimFunction_18: ; cd900 (33:5900)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd907
	dw Functioncd913
Functioncd907: ; cd907 (33:5907)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $28
	inc hl
	ld [hl], $0
Functioncd913: ; cd913 (33:5913)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cd950
	ld d, a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld e, [hl]
	ld hl, hPushOAM ; $ff80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], d
	ret

.asm_cd950
	call DeinitBattleAnimation
	ret

BattleAnimFunction_19: ; cd954 (33:5954)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncd961
	dw Functioncd96a
	dw Functioncd96e
	dw Functioncd96a
	dw Functioncd97b
Functioncd961: ; cd961 (33:5961)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld [hl], $0
Functioncd96a: ; cd96a (33:596a)
	call Functioncd99a
	ret

Functioncd96e: ; cd96e (33:596e)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr c, asm_cd988
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncd97b: ; cd97b (33:597b)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $b8
	jr c, asm_cd988
	call DeinitBattleAnimation
	ret

asm_cd988: ; cd988 (33:5988)
	call Functioncd99a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

Functioncd99a: ; cd99a (33:599a)
	call Functioncd9f4
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	sub $8
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cd9d7
	cp $c2
	jr c, .asm_cd9e2
.asm_cd9d7
	dec a
	ld [hl], a
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	inc [hl]
	ret

.asm_cd9e2
	xor a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hli], a
	ld [hl], a
	ret

Functioncd9f4: ; cd9f4 (33:59f4)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, Unknown_cda01
	add hl, de
	ld d, [hl]
	ret

; cda01 (33:5a01)
Unknown_cda01: ; cda01
	db 8, 6, 5, 4, 5, 6, 8, 12, 16
; cda0a
BattleAnimFunction_1C: ; cda0a (33:5a0a)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr nc, .asm_cda17
	call DeinitBattleAnimation
	ret

.asm_cda17
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f
	ld e, a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	sub e
	ld [hl], a
	srl e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
.asm_cda2c
	inc [hl]
	dec e
	jr nz, .asm_cda2c
	ret

BattleAnimFunction_1F: ; cda31 (33:5a31)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncda4c
	dw Functioncda3a
	dw Functioncda4c
Functioncda3a: ; cda3a (33:5a3a)
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	inc a
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $8
Functioncda4c: ; cda4c (33:5a4c)
	ret

BattleAnimFunction_LeechSeed: ; cda4d (33:5a4d)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
.zero: ; cda58 (33:5a58)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $40
	ret

.one: ; cda62 (33:5a62)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .sprout
	call Functioncda8d
	ret

.sprout
	ld [hl], $40
	ld a, BATTLEANIMFRAMESET_57
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

.two: ; cda7a (33:5a7a)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and a
	jr z, .flutter
	dec [hl]
	ret

.flutter
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_58
	call ReinitBattleAnimFrameset
.three: ; cda8c (33:5a8c)
	ret

Functioncda8d: ; cda8d (33:5a8d)
	dec [hl]
	ld d, $20
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_02
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld h, [hl]
	ld a, h
	and $f
	swap a
	ld l, a
	ld a, h
	and $f0
	swap a
	ld h, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_3F: ; cdad6 (33:5ad6)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdadf
	dw Functioncdae9
	dw Functioncdaf9
Functioncdadf: ; cdadf (33:5adf)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $40
	ret

Functioncdae9: ; cdae9 (33:5ae9)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .asm_cdaf6
	call Functioncda8d
	ret

.asm_cdaf6
	call BattleAnim_IncAnonJumptableIndex
Functioncdaf9: ; cdaf9 (33:5af9)
	ret

BattleAnimFunction_1A: ; cdafa (33:5afa)
	call BattleAnimFunction_03
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	add $f
	ld [hl], a
	ret

BattleAnimFunction_1B: ; cdb06 (33:5b06)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdb13
	dw Functioncdb14
	dw Functioncdb28
	dw Functioncdb50
	dw Functioncdb65
Functioncdb13: ; cdb13 (33:5b13)
	ret

Functioncdb14: ; cdb14 (33:5b14)
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cdb24
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], $0
	ret

.asm_cdb24
	add $4
	ld [hl], a
	ret

Functioncdb28: ; cdb28 (33:5b28)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	ret nc
	inc [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_01
	add hl, bc
	set 0, [hl]
	ld hl, BATTLEANIMSTRUCT_02
	add hl, bc
	ld [hl], $90
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], $2
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

Functioncdb50: ; cdb50 (33:5b50)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $2c
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], $80
Functioncdb65: ; cdb65 (33:5b65)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $98
	ret nc
	inc [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_1D: ; cdb80 (33:5b80)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdb9f
	dw Functioncdbb3
	dw Functioncdbcf
	dw Functioncdbeb
	dw Functioncdc74
	dw Functioncdc1a
	dw Functioncdbc1
	dw Functioncdc1e
	dw Functioncdc27
	dw Functioncdc39
	dw Functioncdc74
	dw Functioncdc48
	dw Functioncdc57
	dw Functioncdc74
Functioncdb9f: ; cdb9f (33:5b9f)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $28
	inc hl
	ld [hl], $10
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	ret

Functioncdbb3: ; cdbb3 (33:5bb3)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .asm_cdbbd
	inc [hl]
.asm_cdbbd
	call Functioncdc75
	ret

Functioncdbc1: ; cdbc1 (33:5bc1)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $4b
	jr nc, .asm_cdbcb
	inc [hl]
.asm_cdbcb
	call Functioncdc75
	ret

Functioncdbcf: ; cdbcf (33:5bcf)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $88
	jr nc, .asm_cdbe6
	and $f
	jr nz, asm_cdbfa
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $10
	call BattleAnim_IncAnonJumptableIndex
	ret

.asm_cdbe6
	call BattleAnim_IncAnonJumptableIndex
	inc [hl]
	ret

Functioncdbeb: ; cdbeb (33:5beb)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdbf5
	dec [hl]
	ret

.asm_cdbf5
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	dec [hl]
asm_cdbfa: ; cdbfa (33:5bfa)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld e, [hl]
	ld hl, hPushOAM ; $ff80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ret

Functioncdc1a: ; cdc1a (33:5c1a)
	call DeinitBattleAnimation
	ret

Functioncdc1e: ; cdc1e (33:5c1e)
	ld a, BATTLEANIMFRAMESET_4E
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncdc27: ; cdc27 (33:5c27)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $2
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

Functioncdc39: ; cdc39 (33:5c39)
	ld a, BATTLEANIMFRAMESET_50
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $4
	call BattleAnim_IncAnonJumptableIndex
	ret

Functioncdc48: ; cdc48 (33:5c48)
	ld a, BATTLEANIMFRAMESET_4F
	call ReinitBattleAnimFrameset
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $40
	ret

Functioncdc57: ; cdc57 (33:5c57)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $20
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_cdc71
	dec [hl]
	ret

.asm_cdc71
	call BattleAnim_IncAnonJumptableIndex
Functioncdc74: ; cdc74 (33:5c74)
	ret

Functioncdc75: ; cdc75 (33:5c75)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $20
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	sub $8
	ld [hl], a
	ret nz
	xor a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hli], a
	ld [hl], a
	call BattleAnim_IncAnonJumptableIndex
	ret

BattleAnimFunction_1E: ; cdca6 (33:5ca6)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdcb6
	cp $d8
	jr nc, .asm_cdcb6
	call DeinitBattleAnimation
	ret

.asm_cdcb6
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	sub d
	ld [hl], a
	ret

BattleAnimFunction_21: ; cdcc3 (33:5cc3)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdcca
	dw Functioncdced
Functioncdcca: ; cdcca (33:5cca)
	ld a, [hBattleTurn]
	and a
	jr z, .asm_cdcd9
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	xor $ff
	add $3
	ld [hl], a
.asm_cdcd9
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $8
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, BATTLEANIMFRAMESET_59
	add [hl]
	call ReinitBattleAnimFrameset
	ret

Functioncdced: ; cdced (33:5ced)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdcfa
	dec [hl]
	call Functioncdcfe
	ret

.asm_cdcfa
	call DeinitBattleAnimation
	ret

Functioncdcfe: ; cdcfe (33:5cfe)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $10
	call BattleAnim_Sine
	ld d, a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdd20
	dec a
	ret z
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ret

.asm_cdd20
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, d
	xor $ff
	inc a
	ld [hl], a
	ret

BattleAnimFunction_22: ; cdd2a (33:5d2a)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdd31
	dw Functioncdd4f
Functioncdd31: ; cdd31 (33:5d31)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $3f
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $80
	rlca
	ld [hl], a
	add BATTLEANIMFRAMESET_5D
	call ReinitBattleAnimFrameset
	ret

Functioncdd4f: ; cdd4f (33:5d4f)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	swap a
	ld d, a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	inc [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $80
	ret nc
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and $3
	jr nz, .asm_cdd87
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
.asm_cdd87
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_23: ; cdd90 (33:5d90)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdd97
	dw Functioncddbc
Functioncdd97: ; cdd97 (33:5d97)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $80
	rlca
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	add [hl]
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $7f
	ld [hl], a
Functioncddbc: ; cddbc (33:5dbc)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld d, $10
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $3f
	jr z, .asm_cddf0
	and $1f
	ret nz
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc a
	jr .asm_cddf5

.asm_cddf0
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
.asm_cddf5
	call ReinitBattleAnimFrameset
	ret

BattleAnimFunction_24: ; cddf9 (33:5df9)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncde02
	dw Functioncde20
	dw Functioncde21
Functioncde02: ; cde02 (33:5e02)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	add BATTLEANIMFRAMESET_63
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, Unknown_cde25
	add hl, de
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
Functioncde20: ; cde20 (33:5e20)
	ret

Functioncde21: ; cde21 (33:5e21)
	call DeinitBattleAnimation
	ret

; cde25 (33:5e25)
Unknown_cde25: ; cde25
	db $ec, $f8, $00
; cde28
BattleAnimFunction_25: ; cde28 (33:5e28)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	ld d, $4
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld e, [hl]
	ld hl, $ffa0
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_26: ; cde54 (33:5e54)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	dec [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_27: ; cde6b (33:5e6b)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncde72
	dw Functioncde88
Functioncde72: ; cde72 (33:5e72)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_cde83
	ld hl, BATTLEANIMSTRUCT_01
	add hl, bc
	set 6, [hl]
.asm_cde83
	add BATTLEANIMFRAMESET_6A
	call ReinitBattleAnimFrameset
Functioncde88: ; cde88 (33:5e88)
	ret

BattleAnimFunction_28: ; cde89 (33:5e89)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncde90
	dw Functioncdebf
Functioncde90: ; cde90 (33:5e90)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $0
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld e, [hl]
	ld a, e
	and $70
	swap a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, e
	and $80
	jr nz, .asm_cdeb2
	ld a, e
	and $f
	ld [hl], a
	ret

.asm_cdeb2
	ld a, e
	and $f
	xor $ff
	inc a
	ld [hl], a
	ld a, BATTLEANIMFRAMESET_6E
	call ReinitBattleAnimFrameset
	ret

Functioncdebf: ; cdebf (33:5ebf)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_cdec9
	dec [hl]
	ret

.asm_cdec9
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ret

BattleAnimFunction_SpiralDescent: ; cdedd (33:5edd)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $28
	jr nc, .delete
	inc [hl]
	ret

.delete
	call DeinitBattleAnimation
	ret

BattleAnimFunction_2D: ; cdf1b (33:5f1b)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $28
	jr nc, .asm_cdf55
	inc [hl]
	ret

.asm_cdf55
	call DeinitBattleAnimation
	ret

BattleAnimFunction_PoisonGas: ; cdf59 (33:5f59)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functioncdf60
	dw BattleAnimFunction_SpiralDescent
Functioncdf60: ; cdf60 (33:5f60)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .next
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	ret

.next
	call BattleAnim_IncAnonJumptableIndex
	ret

BattleAnimFunction_34: ; cdf8c (33:5f8c)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $e8
	jr z, .asm_cdfc7
	dec [hl]
	ret

.asm_cdfc7
	call DeinitBattleAnimation
	ret

BattleAnimFunction_3C: ; cdfcb (33:5fcb)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	inc [hl]
	inc [hl]
	ld a, [hl]
	and $3
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .asm_ce007
	dec [hl]
	dec [hl]
	ret

.asm_ce007
	call DeinitBattleAnimation
	ret

BattleAnimFunction_35: ; ce00b (33:600b)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce014
	dw Functionce023
	dw Functionce05f
Functionce014: ; ce014 (33:6014)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $34
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $10
Functionce023: ; ce023 (33:6023)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $6c
	jr c, .asm_ce02d
	ret

.asm_ce02d
	ld a, $2
	call Functionce70a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	bit 7, a
	jr nz, .asm_ce046
	xor $ff
	inc a
.asm_ce046
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a
	and $1f
	cp $20
	ret nz
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	srl [hl]
	ret

Functionce05f: ; ce05f (33:605f)
	call DeinitBattleAnimation
	ret

BattleAnimFunction_Horn: ; ce063 (33:6063)
	call BattleAnim_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw Functionce09e
.zero: ; ce06e (33:606e)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ret

.one: ; ce083 (33:6083)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $58
	ret nc
	ld a, $2
	call Functionce70a
	ret

.two: ; ce091 (33:6091)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, Functionce09e
	call DeinitBattleAnimation
	ret

Functionce09e: ; ce09e (33:609e)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	ld d, $8
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	sra a
	xor $ff
	inc a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	add $8
	ld [hl], a
	ret

BattleAnimFunction_2C: ; ce0c5 (33:60c5)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce0ce
	dw Functionce0f8
	dw Functionce0dd
Functionce0ce: ; ce0ce (33:60ce)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f0
	swap a
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	ret

Functionce0dd: ; ce0dd (33:60dd)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	bit 7, a
	jr z, .asm_ce0f0
	ld [hl], a
.asm_ce0f0
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	sub $4
	ld [hl], a
Functionce0f8: ; ce0f8 (33:60f8)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr c, .asm_ce105
	call DeinitBattleAnimation
	ret

.asm_ce105
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	call Functionce70a
	ret

BattleAnimFunction_2E: ; ce10e (33:610e)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce115
	dw Functionce12a
Functionce115: ; ce115 (33:6115)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $28
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	sub $28
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
Functionce12a: ; ce12a (33:612a)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	and [hl]
	jr nz, .asm_ce149
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
.asm_ce149
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $20
	inc hl
	srl [hl]
	ret

BattleAnimFunction_2F: ; ce15c (33:615c)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $1
	jr nz, .asm_ce189
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
.asm_ce189
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $3
	jr nz, .asm_ce197
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
.asm_ce197
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	cp $5a
	jr nc, .asm_ce1aa
	ld a, [hl]
	and a
	jr z, .asm_ce1ac
	dec [hl]
	ret

.asm_ce1aa
	inc [hl]
	ret

.asm_ce1ac
	call DeinitBattleAnimation
	ret

BattleAnimFunction_42: ; ce1b0 (33:61b0)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	cp $40
	jr nc, .asm_ce1df
	inc [hl]
	ret

.asm_ce1df
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	call DeinitBattleAnimation
	ret

BattleAnimFunction_30: ; ce1e7 (33:61e7)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce1ee
	dw Functionce1fb
Functionce1ee: ; ce1ee (33:61ee)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], a
Functionce1fb: ; ce1fb (33:61fb)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld d, $30
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	add $8
	ld d, $30
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_31: ; ce226 (33:6226)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce22d
	dw Functionce254
Functionce22d: ; ce22d (33:622d)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld d, $10
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld [hl], $f
Functionce254: ; ce254 (33:6254)
	ret

BattleAnimFunction_32: ; ce255 (33:6255)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce260
	dw Functionce274
	dw Functionce278
	dw Functionce289
Functionce260: ; ce260 (33:6260)
	call BattleAnim_IncAnonJumptableIndex
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_ce26c
	ld a, $f0
	jr .asm_ce26e

.asm_ce26c
	ld a, $cc
.asm_ce26e
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	ret

Functionce274: ; ce274 (33:6274)
	call Functionce29f
	ret

Functionce278: ; ce278 (33:6278)
	call Functionce29f
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	ret nc
	ld a, $4
	call Functionce70a
	ret

Functionce289: ; ce289 (33:6289)
	call Functionce29f
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $d0
	jr nc, .asm_ce29b
	ld a, $4
	call Functionce70a
	ret

.asm_ce29b
	call DeinitBattleAnimation
	ret

Functionce29f: ; ce29f (33:629f)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and $7
	inc [hl]
	srl a
	ld e, a
	ld d, $0
	ld a, [hSGB]
	and a
	jr nz, .asm_ce2b6
	ld hl, Unknown_ce2c4
	jr .asm_ce2b9

.asm_ce2b6
	ld hl, Unknown_ce2c8
.asm_ce2b9
	add hl, de
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	and [hl]
	ld [wOBP0], a
	ret

; ce2c4 (33:62c4)
Unknown_ce2c4: ; ce2c4
	db $ff, $aa, $55, $aa
Unknown_ce2c8: ; ce2c8
	db $ff, $ff, $00, $00
; ce2cc
BattleAnimFunction_33: ; ce2cc (33:62cc)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld d, $18
	call BattleAnim_Sine
	sra a
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	add [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	dec [hl]
	dec [hl]
	ret

BattleAnimFunction_36: ; ce2fd (33:62fd)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce306
	dw Functionce330
	dw Functionce34c
Functionce306: ; ce306 (33:6306)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $e0
	jr nz, .asm_ce319
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $2
	ret

.asm_ce319
	ld d, a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld e, [hl]
	ld hl, hPushOAM ; $ff80
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ret

Functionce330: ; ce330 (33:6330)
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce33a
	dec [hl]
	ret

.asm_ce33a
	ld [hl], $4
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Functionce34c: ; ce34c (33:634c)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $84
	jr nc, .asm_ce35b
	ld a, $4
	call Functionce70a
	ret

.asm_ce35b
	call DeinitBattleAnimation
	ret

BattleAnimFunction_37: ; ce35f (33:635f)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce366
	dw Functionce375
Functionce366: ; ce366 (33:6366)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $7f
	add BATTLEANIMFRAMESET_81
	call ReinitBattleAnimFrameset
Functionce375: ; ce375 (33:6375)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	bit 7, [hl]
	jr nz, .asm_ce383
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
	ret

.asm_ce383
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_38: ; ce389 (33:6389)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce392
	dw Functionce39c
	dw Functionce3ae
Functionce392: ; ce392 (33:6392)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $c
	ret

Functionce39c: ; ce39c (33:639c)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce3a6
	dec [hl]
	ret

.asm_ce3a6
	call BattleAnim_IncAnonJumptableIndex
	ld a, BATTLEANIMFRAMESET_20
	call ReinitBattleAnimFrameset
Functionce3ae: ; ce3ae (33:63ae)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	dec [hl]
	ret

BattleAnimFunction_39: ; ce3b4 (33:63b4)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	push af
	ld d, $2
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop af
	ld d, $8
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_3A: ; ce3d2 (33:63d2)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .asm_ce3df
	call DeinitBattleAnimation
	ret

.asm_ce3df
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld d, $8
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	and $7
	ret nz
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	inc [hl]
	ret

BattleAnimFunction_3B: ; ce3ff (33:63ff)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce406
	dw Functionce412
Functionce406: ; ce406 (33:6406)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Functionce412: ; ce412 (33:6412)
	call DeinitBattleAnimation
	ret

BattleAnimFunction_3D: ; ce416 (33:6416)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld d, $18
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	sra a
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	inc [hl]
	ret

BattleAnimFunction_3E: ; ce43a (33:643a)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce443
	dw Functionce465
	dw Functionce490
Functionce443: ; ce443 (33:6443)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $28
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	add [hl]
	call ReinitBattleAnimFrameset
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and $f0
	or $8
	ld [hl], a
Functionce465: ; ce465 (33:6465)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_ce48b
	dec [hl]
	add $8
	ld d, a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_ce48b
	ld [hl], $10
	call BattleAnim_IncAnonJumptableIndex
Functionce490: ; ce490 (33:6490)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	dec [hl]
	and a
	ret nz
	call DeinitBattleAnimation
	ret

BattleAnimFunction_40: ; ce49c (33:649c)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce4a3
	dw Functionce4b0
Functionce4a3: ; ce4a3 (33:64a3)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, BATTLEANIMFRAMESET_24
	add [hl]
	call ReinitBattleAnimFrameset
Functionce4b0: ; ce4b0 (33:64b0)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $38
	jr nc, .asm_ce4d8
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld d, $18
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	and $1
	ret nz
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	ret

.asm_ce4d8
	call DeinitBattleAnimation
	ret

BattleAnimFunction_41: ; ce4dc (33:64dc)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld d, a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	inc [hl]
	call BattleAnim_Sine
	bit 7, a
	jr nz, .asm_ce4f4
	xor $ff
	inc a
.asm_ce4f4
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	and $1f
	ret nz
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	srl [hl]
	ret

BattleAnimFunction_43: ; ce508 (33:6508)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $10
	jr nc, .asm_ce52e
	inc [hl]
	inc [hl]
	ld d, a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_ce52e
	call DeinitBattleAnimation
	ret

BattleAnimFunction_44: ; ce532 (33:6532)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]
	ld a, e
	and $c0
	rlca
	rlca
	add [hl]
	ld [hl], a
	ld a, e
	and $3f
	push af
	push de
	call BattleAnim_Sine
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_45: ; ce55b (33:655b)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce564
	dw Functionce56e
	dw Functionce577
Functionce564: ; ce564 (33:6564)
	ld d, $18
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	inc [hl]
	jr asm_ce58f

Functionce56e: ; ce56e (33:656e)
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], $18
Functionce577: ; ce577 (33:6577)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .asm_ce58b
	ld d, a
	add $8
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	jr asm_ce58f

.asm_ce58b
	call DeinitBattleAnimation
	ret

asm_ce58f: ; ce58f (33:658f)
	call Functionce6f1
	ret

BattleAnimFunction_46: ; ce593 (33:6593)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce5b3
	dw Functionce59a
Functionce59a: ; ce59a (33:659a)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_ce5b0
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	inc [hl]
	ret

.asm_ce5b0
	call DeinitBattleAnimation
Functionce5b3: ; ce5b3 (33:65b3)
	ret

BattleAnimFunction_47: ; ce5b4 (33:65b4)
	ld d, $50
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	add [hl]
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

BattleAnimFunction_48: ; ce5dc (33:65dc)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $d0
	jr z, .disappear
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.disappear
	call DeinitBattleAnimation
	ret

BattleAnimFunction_49: ; ce5ee (33:65ee)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce5f9
	dw Functionce60a
	dw Functionce622
	dw Functionce618
Functionce5f9: ; ce5f9 (33:65f9)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	and a
	jr nz, asm_ce61c
	call BattleAnim_IncAnonJumptableIndex
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $ec
Functionce60a: ; ce60a (33:660a)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $4
	jr z, Functionce618
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret

Functionce618: ; ce618 (33:6618)
	call DeinitBattleAnimation
	ret

asm_ce61c: ; ce61c (33:661c)
	call BattleAnim_IncAnonJumptableIndex
	call BattleAnim_IncAnonJumptableIndex
Functionce622: ; ce622 (33:6622)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp $d8
	ret z
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

BattleAnimFunction_4A: ; ce62f (33:662f)
	call BattleAnim_AnonJumptable
.anon_dw
	dw Functionce63a
	dw Functionce648
	dw Functionce65c
	dw Functionce672
Functionce63a: ; ce63a (33:663a)
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	call BattleAnim_IncAnonJumptableIndex
	ret

Functionce648: ; ce648 (33:6648)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .asm_ce654
	xor a
.asm_ce654
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	inc [hl]
	inc [hl]
	ret

Functionce65c: ; ce65c (33:665c)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .asm_ce668
	xor a
.asm_ce668
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	add $8
	ld [hl], a
	ret

Functionce672: ; ce672 (33:6672)
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	cp $70
	jr c, .asm_ce67e
	xor a
.asm_ce67e
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	add $4
	ld [hl], a
	ret

BattleAnimFunction_4B: ; ce688 (33:6688)
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld e, [hl]
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	ld l, a
	and $f0
	ld h, a
	swap a
	or h
	ld h, a
	ld a, l
	and $f
	swap a
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], d
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld [hl], e
	ret

BattleAnimFunction_4C: ; ce6b3 (33:66b3)
	ld d, $18
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld a, [hl]
	inc [hl]
	call Functionce6f1
	ret

BattleAnimFunction_4F: ; ce6bf (33:66bf)
	ld d, $18
	ld hl, BATTLEANIMSTRUCT_10
	add hl, bc
	ld a, [hl]
	inc [hl]
	srl a
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	add [hl]
	call Functionce6f1
	ret

BattleAnimFunction_4D: ; ce6d2 (33:66d2)
	ld hl, BATTLEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_ce6ed
	inc [hl]
	ld hl, BATTLEANIMSTRUCT_0B
	add hl, bc
	ld d, [hl]
	call BattleAnim_Sine
	xor $ff
	inc a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_ce6ed
	call DeinitBattleAnimation
	ret

Functionce6f1: ; ce6f1 (33:66f1)
	push af
	push de
	call BattleAnim_Sine
	sra a
	sra a
	ld hl, BATTLEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call BattleAnim_Cosine
	ld hl, BATTLEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

Functionce70a: ; ce70a (33:670a)
	and $f
	ld e, a
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	ld [hl], a
	srl e
	ld hl, BATTLEANIMSTRUCT_YCOORD
	add hl, bc
.asm_ce719
	dec [hl]
	dec e
	jr nz, .asm_ce719
	ret

BattleAnim_AnonJumptable: ; ce71e (33:671e)
	pop de
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

BattleAnim_IncAnonJumptableIndex: ; ce72c (33:672c)
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	inc [hl]
	ret

BattleAnim_Cosine: ; ce732 (33:6732)
	add $10
BattleAnim_Sine: ; ce734 (33:6734)
; a = d sin a
	and $3f
	cp $20
	jr nc, .negative
	call .ApplySineWave
	ld a, h
	ret

.negative
	and $1f
	call .ApplySineWave
	ld a, h
	xor $ff
	inc a
	ret

.ApplySineWave:
	ld e, a
	ld a, d
	ld d, 0
	ld hl, BattleAnimSineWave
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0
.multiply
	srl a
	jr nc, .even
	add hl, de
.even
	sla e
	rl d
	and a
	jr nz, .multiply
	ret

BattleAnim_Sine_e: ; ce765 (33:6765)
	ld a, e
	call BattleAnim_Sine
	ld e, a
	ret

BattleAnim_Cosine_e: ; ce76b (33:676b)
	ld a, e
	call BattleAnim_Cosine
	ld e, a
	ret

; ce771 (33:6771)
BattleAnim_AbsSinePrecise: ; ce771
	ld a, e
	call BattleAnim_Sine
	ld e, l
	ld d, h
	ret

; ce778
BattleAnim_AbsCosinePrecise: ; ce778
	ld a, e
	call BattleAnim_Cosine
	ld e, l
	ld d, h
	ret

; ce77f
BattleAnimSineWave: ; ce77f
	sine_wave $100
; ce7bf
