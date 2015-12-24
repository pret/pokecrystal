; Objects used in battle animations.

QueueBattleAnimation: ; cc9a1 (33:49a1)
	ld hl, ActiveAnimObjects
	ld e, 10
.loop
	ld a, [hl]
	and a
	jr z, .done
	ld bc, BATTLEANIMSTRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop
	scf
	ret

.done
	ld c, l
	ld b, h
	ld hl, wNumActiveBattleAnims
	inc [hl]
	call InitBattleAnimation
	ret

DeinitBattleAnimation: ; cc9bd
	ld hl, BATTLEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

; cc9c4

InitBattleAnimation: ; cc9c4 (33:49c4)
	ld a, [wBattleAnimTemp0]
	ld e, a
	ld d, 0
	ld hl, BattleAnimObjects
rept 6
	add hl, de
endr
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_INDEX
	add hl, bc
	ld a, [wNumActiveBattleAnims]
	ld [hli], a ; Index
	ld a, [de]
	inc de
	ld [hli], a ; 01
	ld a, [de]
	inc de
	ld [hli], a ; 02
	ld a, [de]
	inc de
	ld [hli], a ; Frameset ID
	ld a, [de]
	inc de
	ld [hli], a ; Function
	ld a, [de]
	inc de
	ld [hli], a ; 05
	ld a, [de]
	call GetBattleAnimTileOffset
	ld [hli], a ; Tile ID
	ld a, [wBattleAnimTemp1]
	ld [hli], a ; X Coord
	ld a, [wBattleAnimTemp2]
	ld [hli], a ; Y Coord
	xor a
	ld [hli], a ; X Offset
	ld [hli], a ; Y Offset
	ld a, [wBattleAnimTemp3]
	ld [hli], a ; 0b
	xor a
	ld [hli], a ; 0c
	dec a
	ld [hli], a ; 0d
	xor a
	ld [hli], a ; 0e
	ld [hli], a ; 0f
	ld [hl], a  ; 10
	ret

BattleAnimOAMUpdate: ; cca09
	call InitBattleAnimBuffer
	call GetBattleAnimFrame
	cp -3
	jp z, .done
	cp -4
	jp z, .delete
	push af
	ld hl, wBattleAnimTempOAMFlags
	ld a, [wBattleAnimTemp7]
	xor [hl]
	and $e0
	ld [hl], a
	pop af
	push bc
	call GetBattleAnimOAMPointer
	ld a, [wBattleAnimTempTileID]
	add [hl]
	ld [wBattleAnimTempTileID], a
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wBattleAnimOAMPointerLo]
	ld e, a
	ld d, Sprites / $100
.loop
	ld a, [wBattleAnimTempYCoord]
	ld b, a
	ld a, [wBattleAnimTempYOffset]
	add b
	ld b, a
	push hl
	ld a, [hl]
	ld hl, wBattleAnimTempOAMFlags
	bit 6, [hl]
	jr z, .no_yflip
	add $8
	xor $ff
	inc a

.no_yflip
	pop hl
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [wBattleAnimTempXCoord]
	ld b, a
	ld a, [wBattleAnimTempXOffset]
	add b
	ld b, a
	push hl
	ld a, [hl]
	ld hl, wBattleAnimTempOAMFlags
	bit 5, [hl]
	jr z, .no_xflip
	add $8
	xor $ff
	inc a

.no_xflip
	pop hl
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [wBattleAnimTempTileID]
	add $31
	add [hl]
	ld [de], a
	inc hl
	inc de
	ld a, [wBattleAnimTempOAMFlags]
	ld b, a
	ld a, [hl]
	xor b
	and $e0
	ld b, a
	ld a, [hl]
	and $10
	or b
	ld b, a
	ld a, [wBattleAnimTempPalette]
	and $f
	or b
	ld [de], a
	inc hl
	inc de
	ld a, e
	ld [wBattleAnimOAMPointerLo], a
	cp $a0
	jr nc, .exit_set_carry
	dec c
	jr nz, .loop
	pop bc
	jr .done

.delete
	call DeinitBattleAnimation

.done
	and a
	ret

.exit_set_carry
	pop bc
	scf
	ret

; ccaaa

InitBattleAnimBuffer: ; ccaaa
	ld hl, BATTLEANIMSTRUCT_01
	add hl, bc
	ld a, [hl]
	and %10000000
	ld [wBattleAnimTempOAMFlags], a
	xor a
	ld [wBattleAnimTemp7], a
	ld hl, BATTLEANIMSTRUCT_PALETTE
	add hl, bc
	ld a, [hl]
	ld [wBattleAnimTempPalette], a
	ld hl, BATTLEANIMSTRUCT_02
	add hl, bc
	ld a, [hl]
	ld [wBattleAnimTemp1], a
	ld hl, BATTLEANIMSTRUCT_TILEID
	add hl, bc
	ld a, [hli]
	ld [wBattleAnimTempTileID], a
	ld a, [hli]
	ld [wBattleAnimTempXCoord], a
	ld a, [hli]
	ld [wBattleAnimTempYCoord], a
	ld a, [hli]
	ld [wBattleAnimTempXOffset], a
	ld a, [hli]
	ld [wBattleAnimTempYOffset], a
	ld a, [hBattleTurn]
	and a
	ret z
	ld hl, BATTLEANIMSTRUCT_01
	add hl, bc
	ld a, [hl]
	ld [wBattleAnimTempOAMFlags], a
	bit 0, [hl]
	ret z
	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hli]
	ld d, a
	ld a, (-10 * 8) + 4
	sub d
	ld [wBattleAnimTempXCoord], a
	ld a, [hli]
	ld d, a
	ld a, [wBattleAnimTemp1]
	cp $ff
	jr nz, .check_kinesis_softboiled_milkdrink
	ld a, 5 * 8
	add d
	jr .done

.check_kinesis_softboiled_milkdrink
	sub d
	push af
	ld a, [FXAnimIDHi]
	or a
	jr nz, .no_sub
	ld a, [FXAnimIDLo]
	cp KINESIS
	jr z, .kinesis
	cp SOFTBOILED
	jr z, .softboiled
	cp MILK_DRINK
	jr nz, .no_sub
.kinesis
.softboiled
.milk_drink
	pop af
	sub 1 * 8
	jr .done

.no_sub
	pop af
.done
	ld [wBattleAnimTempYCoord], a
	ld a, [hli]
	xor $ff
	inc a
	ld [wBattleAnimTempXOffset], a
	ret

; ccb31

GetBattleAnimTileOffset: ; ccb31 (33:4b31)
	push hl
	push bc
	ld hl, wBattleAnimTileDict
	ld b, a
	ld c, 10 / 2
.loop
	ld a, [hli]
	cp b
	jr z, .load
	inc hl
	dec c
	jr nz, .loop
	xor a
	jr .done

.load
	ld a, [hl]
.done
	pop bc
	pop hl
	ret

_ExecuteBGEffects: ; ccb48
	callab ExecuteBGEffects
	ret

; ccb4f

_QueueBGEffect: ; ccb4f (33:4b4f)
	callab QueueBGEffect
	ret

; ccb56 (33:4b56)

BattleAnimObjects: ; ccb56
battleanimobj: MACRO
; ??, ??, frameset, function, ??, tile offset
	db \1, \2, \3, \4, \5, \6
endm

	battleanimobj $01, $ff, BATTLEANIMFRAMESET_00, BATTLEANIMFUNC_00, $02, $01 ; ANIM_OBJ_00
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_00, $02, $01 ; ANIM_OBJ_01
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_02, BATTLEANIMFUNC_00, $02, $01 ; ANIM_OBJ_02
	battleanimobj $01, $90, BATTLEANIMFRAMESET_00, BATTLEANIMFUNC_00, $02, $01 ; ANIM_OBJ_03
	battleanimobj $01, $90, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_00, $02, $01 ; ANIM_OBJ_04
	battleanimobj $01, $90, BATTLEANIMFRAMESET_02, BATTLEANIMFUNC_00, $02, $01 ; ANIM_OBJ_05
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_03, BATTLEANIMFUNC_00, $02, $01 ; ANIM_OBJ_06
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_04, BATTLEANIMFUNC_1B, $02, $01 ; ANIM_OBJ_07
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_05, BATTLEANIMFUNC_00, $02, $01 ; ANIM_OBJ_08
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_06, BATTLEANIMFUNC_00, $02, $01 ; ANIM_OBJ_09
	battleanimobj $01, $90, BATTLEANIMFRAMESET_07, BATTLEANIMFUNC_09, $02, $01 ; ANIM_OBJ_0A
	battleanimobj $01, $aa, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_10, $04, $03 ; ANIM_OBJ_0B
	battleanimobj $01, $90, BATTLEANIMFRAMESET_0E, BATTLEANIMFUNC_04, $04, $03 ; ANIM_OBJ_0C
	battleanimobj $01, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_03, $04, $03 ; ANIM_OBJ_0D
	battleanimobj $01, $90, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_08, $04, $03 ; ANIM_OBJ_0E
	battleanimobj $01, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_0A, $04, $03 ; ANIM_OBJ_0F
	battleanimobj $01, $90, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_03, $04, $03 ; ANIM_OBJ_BURNED
	battleanimobj $01, $90, BATTLEANIMFRAMESET_12, BATTLEANIMFUNC_08, $06, $0a ; ANIM_OBJ_11
	battleanimobj $01, $90, BATTLEANIMFRAMESET_13, BATTLEANIMFUNC_00, $06, $0a ; ANIM_OBJ_12
	battleanimobj $01, $90, BATTLEANIMFRAMESET_14, BATTLEANIMFUNC_01, $06, $0a ; ANIM_OBJ_13
	battleanimobj $21, $78, BATTLEANIMFRAMESET_16, BATTLEANIMFUNC_0B, $05, $06 ; ANIM_OBJ_14
	battleanimobj $00, $00, BATTLEANIMFRAMESET_09, BATTLEANIMFUNC_12, $04, $0b ; ANIM_OBJ_POKE_BALL
	battleanimobj $00, $00, BATTLEANIMFRAMESET_09, BATTLEANIMFUNC_13, $04, $0b ; ANIM_OBJ_16
	battleanimobj $01, $90, BATTLEANIMFRAMESET_18, BATTLEANIMFUNC_00, $04, $08 ; ANIM_OBJ_17
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_18, BATTLEANIMFUNC_00, $04, $08 ; ANIM_OBJ_18
	battleanimobj $01, $90, BATTLEANIMFRAMESET_1D, BATTLEANIMFUNC_06, $02, $0c ; ANIM_OBJ_19
	battleanimobj $01, $b4, BATTLEANIMFRAMESET_1F, BATTLEANIMFUNC_38, $02, $0c ; ANIM_OBJ_1A
	battleanimobj $01, $90, BATTLEANIMFRAMESET_08, BATTLEANIMFUNC_00, $02, $07 ; ANIM_OBJ_1B
	battleanimobj $01, $a0, BATTLEANIMFRAMESET_08, BATTLEANIMFUNC_00, $02, $07 ; ANIM_OBJ_1C
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_07, $07, $09 ; ANIM_OBJ_1D
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_1A, BATTLEANIMFUNC_07, $07, $09 ; ANIM_OBJ_1E
	battleanimobj $01, $b0, BATTLEANIMFRAMESET_1B, BATTLEANIMFUNC_36, $07, $09 ; ANIM_OBJ_1F
	battleanimobj $01, $b0, BATTLEANIMFRAMESET_84, BATTLEANIMFUNC_36, $06, $21 ; ANIM_OBJ_20
	battleanimobj $01, $90, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_0C, $06, $0d ; ANIM_OBJ_21
	battleanimobj $00, $00, BATTLEANIMFRAMESET_23, BATTLEANIMFUNC_0D, $06, $0d ; ANIM_OBJ_22
	battleanimobj $01, $90, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_0E, $02, $0e ; ANIM_OBJ_23
	battleanimobj $61, $80, BATTLEANIMFRAMESET_27, BATTLEANIMFUNC_0F, $06, $04 ; ANIM_OBJ_24
	battleanimobj $01, $b4, BATTLEANIMFRAMESET_2A, BATTLEANIMFUNC_00, $06, $04 ; ANIM_OBJ_25
	battleanimobj $01, $40, BATTLEANIMFRAMESET_2B, BATTLEANIMFUNC_11, $05, $0f ; ANIM_OBJ_26
	battleanimobj $61, $98, BATTLEANIMFRAMESET_2C, BATTLEANIMFUNC_00, $03, $10 ; ANIM_OBJ_27
	battleanimobj $61, $98, BATTLEANIMFRAMESET_2D, BATTLEANIMFUNC_09, $03, $10 ; ANIM_OBJ_28
	battleanimobj $01, $b8, BATTLEANIMFRAMESET_2E, BATTLEANIMFUNC_00, $06, $0a ; ANIM_OBJ_29
	battleanimobj $01, $b8, BATTLEANIMFRAMESET_2F, BATTLEANIMFUNC_00, $06, $0a ; ANIM_OBJ_FROZEN
	battleanimobj $01, $b8, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_14, $07, $11 ; ANIM_OBJ_2B
	battleanimobj $01, $90, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_14, $03, $0d ; ANIM_OBJ_2C
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_31, BATTLEANIMFUNC_00, $03, $05 ; ANIM_OBJ_2D
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_32, BATTLEANIMFUNC_00, $03, $05 ; ANIM_OBJ_2E
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_33, BATTLEANIMFUNC_00, $03, $05 ; ANIM_OBJ_2F
	battleanimobj $21, $90, BATTLEANIMFRAMESET_34, BATTLEANIMFUNC_15, $03, $05 ; ANIM_OBJ_30
	battleanimobj $21, $90, BATTLEANIMFRAMESET_36, BATTLEANIMFUNC_00, $03, $05 ; ANIM_OBJ_31
	battleanimobj $21, $90, BATTLEANIMFRAMESET_37, BATTLEANIMFUNC_03, $02, $08 ; ANIM_OBJ_32
	battleanimobj $21, $90, BATTLEANIMFRAMESET_38, BATTLEANIMFUNC_00, $03, $05 ; ANIM_OBJ_33
	battleanimobj $21, $90, BATTLEANIMFRAMESET_39, BATTLEANIMFUNC_03, $02, $08 ; ANIM_OBJ_34
	battleanimobj $21, $90, BATTLEANIMFRAMESET_3A, BATTLEANIMFUNC_16, $02, $02 ; ANIM_OBJ_35
	battleanimobj $01, $90, BATTLEANIMFRAMESET_3C, BATTLEANIMFUNC_17, $02, $02 ; ANIM_OBJ_36
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_3E, BATTLEANIMFUNC_00, $02, $02 ; ANIM_OBJ_37
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_3F, BATTLEANIMFUNC_00, $02, $02 ; ANIM_OBJ_38
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_40, BATTLEANIMFUNC_00, $02, $02 ; ANIM_OBJ_39
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_41, BATTLEANIMFUNC_00, $02, $02 ; ANIM_OBJ_3A
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_42, BATTLEANIMFUNC_00, $02, $02 ; ANIM_OBJ_3B
	battleanimobj $01, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_18, $05, $12 ; ANIM_OBJ_3C
	battleanimobj $01, $88, BATTLEANIMFRAMESET_44, BATTLEANIMFUNC_00, $05, $12 ; ANIM_OBJ_3D
	battleanimobj $21, $b8, BATTLEANIMFRAMESET_45, BATTLEANIMFUNC_19, $02, $13 ; ANIM_OBJ_GUST
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_46, BATTLEANIMFUNC_00, $02, $14 ; ANIM_OBJ_3F
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_47, BATTLEANIMFUNC_00, $02, $14 ; ANIM_OBJ_40
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_48, BATTLEANIMFUNC_1A, $02, $14 ; ANIM_OBJ_41
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_49, BATTLEANIMFUNC_1A, $02, $14 ; ANIM_OBJ_42
	battleanimobj $21, $98, BATTLEANIMFRAMESET_4A, BATTLEANIMFUNC_01, $02, $14 ; ANIM_OBJ_43
	battleanimobj $21, $80, BATTLEANIMFRAMESET_4B, BATTLEANIMFUNC_00, $03, $11 ; ANIM_OBJ_44
	battleanimobj $01, $88, BATTLEANIMFRAMESET_4C, BATTLEANIMFUNC_1C, $05, $12 ; ANIM_OBJ_45
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_4D, BATTLEANIMFUNC_1D, $02, $15 ; ANIM_OBJ_46
	battleanimobj $01, $b0, BATTLEANIMFRAMESET_51, BATTLEANIMFUNC_1E, $03, $11 ; ANIM_OBJ_47
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_52, BATTLEANIMFUNC_1F, $05, $16 ; ANIM_OBJ_48
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_54, BATTLEANIMFUNC_1F, $05, $16 ; ANIM_OBJ_49
	battleanimobj $21, $68, BATTLEANIMFRAMESET_56, BATTLEANIMFUNC_20, $05, $06 ; ANIM_OBJ_4A
	battleanimobj $21, $90, BATTLEANIMFRAMESET_59, BATTLEANIMFUNC_21, $02, $0e ; ANIM_OBJ_4B
	battleanimobj $21, $90, BATTLEANIMFRAMESET_5C, BATTLEANIMFUNC_02, $02, $17 ; ANIM_OBJ_4C
	battleanimobj $01, $90, BATTLEANIMFRAMESET_5D, BATTLEANIMFUNC_22, $03, $11 ; ANIM_OBJ_4D
	battleanimobj $61, $88, BATTLEANIMFRAMESET_5F, BATTLEANIMFUNC_00, $03, $10 ; ANIM_OBJ_4E
	battleanimobj $61, $88, BATTLEANIMFRAMESET_2D, BATTLEANIMFUNC_09, $03, $10 ; ANIM_OBJ_4F
	battleanimobj $21, $88, BATTLEANIMFRAMESET_60, BATTLEANIMFUNC_00, $03, $18 ; ANIM_OBJ_50
	battleanimobj $21, $80, BATTLEANIMFRAMESET_60, BATTLEANIMFUNC_00, $02, $18 ; ANIM_OBJ_51
	battleanimobj $21, $50, BATTLEANIMFRAMESET_61, BATTLEANIMFUNC_23, $03, $19 ; ANIM_OBJ_CHICK
	battleanimobj $01, $80, BATTLEANIMFRAMESET_63, BATTLEANIMFUNC_24, $02, $19 ; ANIM_OBJ_53
	battleanimobj $01, $80, BATTLEANIMFRAMESET_66, BATTLEANIMFUNC_25, $02, $19 ; ANIM_OBJ_54
	battleanimobj $01, $50, BATTLEANIMFRAMESET_1C, BATTLEANIMFUNC_00, $02, $0c ; ANIM_OBJ_SKULL
	battleanimobj $21, $a8, BATTLEANIMFRAMESET_67, BATTLEANIMFUNC_26, $07, $1a ; ANIM_OBJ_56
	battleanimobj $21, $a8, BATTLEANIMFRAMESET_68, BATTLEANIMFUNC_00, $07, $1a ; ANIM_OBJ_57
	battleanimobj $21, $90, BATTLEANIMFRAMESET_69, BATTLEANIMFUNC_01, $02, $1a ; ANIM_OBJ_58
	battleanimobj $21, $90, BATTLEANIMFRAMESET_6D, BATTLEANIMFUNC_28, $03, $19 ; ANIM_OBJ_PARALYZED
	battleanimobj $21, $90, BATTLEANIMFRAMESET_6A, BATTLEANIMFUNC_27, $02, $1b ; ANIM_OBJ_5A
	battleanimobj $00, $00, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_29, $02, $1c ; ANIM_OBJ_5B
	battleanimobj $21, $48, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_29, $02, $1c ; ANIM_OBJ_5C
	battleanimobj $21, $48, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_29, $02, $1c ; ANIM_OBJ_5D
	battleanimobj $21, $78, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_2A, $02, $1c ; ANIM_OBJ_5E
	battleanimobj $61, $90, BATTLEANIMFRAMESET_71, BATTLEANIMFUNC_2B, $02, $1d ; ANIM_OBJ_5F
	battleanimobj $61, $90, BATTLEANIMFRAMESET_72, BATTLEANIMFUNC_2C, $02, $1d ; ANIM_OBJ_60
	battleanimobj $01, $48, BATTLEANIMFRAMESET_73, BATTLEANIMFUNC_2D, $04, $1e ; ANIM_OBJ_61
	battleanimobj $01, $90, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_06, $02, $15 ; ANIM_OBJ_62
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_75, BATTLEANIMFUNC_2E, $07, $19 ; ANIM_OBJ_63
	battleanimobj $21, $90, BATTLEANIMFRAMESET_4A, BATTLEANIMFUNC_02, $02, $14 ; ANIM_OBJ_64
	battleanimobj $01, $80, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_2F, $02, $11 ; ANIM_OBJ_65
	battleanimobj $01, $78, BATTLEANIMFRAMESET_76, BATTLEANIMFUNC_2A, $04, $23 ; ANIM_OBJ_66
	battleanimobj $01, $80, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_30, $02, $1f ; ANIM_OBJ_67
	battleanimobj $01, $90, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_02, $02, $1f ; ANIM_OBJ_68
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_00, $02, $1f ; ANIM_OBJ_69
	battleanimobj $01, $80, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_08, $03, $23 ; ANIM_OBJ_6A
	battleanimobj $21, $90, BATTLEANIMFRAMESET_79, BATTLEANIMFUNC_00, $02, $1f ; ANIM_OBJ_6B
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_31, $03, $11 ; ANIM_OBJ_6C
	battleanimobj $01, $88, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_31, $03, $11 ; ANIM_OBJ_6D
	battleanimobj $21, $88, BATTLEANIMFRAMESET_7B, BATTLEANIMFUNC_32, $02, $20 ; ANIM_OBJ_6E
	battleanimobj $21, $98, BATTLEANIMFRAMESET_7C, BATTLEANIMFUNC_00, $02, $04 ; ANIM_OBJ_6F
	battleanimobj $21, $80, BATTLEANIMFRAMESET_7D, BATTLEANIMFUNC_00, $02, $18 ; ANIM_OBJ_70
	battleanimobj $01, $80, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_2F, $06, $0d ; ANIM_OBJ_71
	battleanimobj $01, $b0, BATTLEANIMFRAMESET_7E, BATTLEANIMFUNC_33, $03, $12 ; ANIM_OBJ_72
	battleanimobj $01, $80, BATTLEANIMFRAMESET_7F, BATTLEANIMFUNC_2F, $02, $08 ; ANIM_OBJ_73
	battleanimobj $21, $a0, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_34, $02, $1c ; ANIM_OBJ_74
	battleanimobj $21, $a0, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_35, $02, $15 ; ANIM_OBJ_75
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_80, BATTLEANIMFUNC_33, $02, $14 ; ANIM_OBJ_76
	battleanimobj $01, $88, BATTLEANIMFRAMESET_81, BATTLEANIMFUNC_37, $02, $11 ; ANIM_OBJ_77
	battleanimobj $01, $88, BATTLEANIMFRAMESET_85, BATTLEANIMFUNC_00, $02, $22 ; ANIM_OBJ_78
	battleanimobj $01, $88, BATTLEANIMFRAMESET_86, BATTLEANIMFUNC_00, $02, $22 ; ANIM_OBJ_79
	battleanimobj $01, $90, BATTLEANIMFRAMESET_87, BATTLEANIMFUNC_39, $02, $1f ; ANIM_OBJ_7A
	battleanimobj $01, $80, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_3A, $03, $11 ; ANIM_OBJ_7B
	battleanimobj $21, $90, BATTLEANIMFRAMESET_34, BATTLEANIMFUNC_00, $03, $05 ; ANIM_OBJ_7C
	battleanimobj $a1, $88, BATTLEANIMFRAMESET_88, BATTLEANIMFUNC_3B, $06, $13 ; ANIM_OBJ_7D
	battleanimobj $01, $80, BATTLEANIMFRAMESET_76, BATTLEANIMFUNC_25, $04, $23 ; ANIM_OBJ_HEART
	battleanimobj $01, $98, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_34, $04, $03 ; ANIM_OBJ_7F
	battleanimobj $01, $a8, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_3C, $04, $03 ; ANIM_OBJ_80
	battleanimobj $21, $68, BATTLEANIMFRAMESET_89, BATTLEANIMFUNC_29, $02, $1f ; ANIM_OBJ_81
	battleanimobj $21, $b0, BATTLEANIMFRAMESET_8A, BATTLEANIMFUNC_00, $02, $1f ; ANIM_OBJ_82
	battleanimobj $21, $80, BATTLEANIMFRAMESET_8C, BATTLEANIMFUNC_00, $02, $1f ; ANIM_OBJ_83
	battleanimobj $21, $50, BATTLEANIMFRAMESET_8D, BATTLEANIMFUNC_00, $03, $1f ; ANIM_OBJ_84
	battleanimobj $01, $40, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_40, $02, $0e ; ANIM_OBJ_85
	battleanimobj $21, $a8, BATTLEANIMFRAMESET_8E, BATTLEANIMFUNC_41, $04, $1f ; ANIM_OBJ_86
	battleanimobj $21, $88, BATTLEANIMFRAMESET_8F, BATTLEANIMFUNC_3E, $02, $1f ; ANIM_OBJ_87
	battleanimobj $21, $88, BATTLEANIMFRAMESET_93, BATTLEANIMFUNC_3E, $02, $1f ; ANIM_OBJ_88
	battleanimobj $21, $90, BATTLEANIMFRAMESET_97, BATTLEANIMFUNC_3D, $02, $1f ; ANIM_OBJ_89
	battleanimobj $21, $90, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_3D, $03, $23 ; ANIM_OBJ_8A
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_99, BATTLEANIMFUNC_2E, $02, $19 ; ANIM_OBJ_8B
	battleanimobj $21, $a0, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_02, $02, $15 ; ANIM_OBJ_8C
	battleanimobj $21, $a0, BATTLEANIMFRAMESET_99, BATTLEANIMFUNC_35, $04, $19 ; ANIM_OBJ_8D
	battleanimobj $21, $70, BATTLEANIMFRAMESET_8B, BATTLEANIMFUNC_3F, $02, $1f ; ANIM_OBJ_8E
	battleanimobj $01, $90, BATTLEANIMFRAMESET_15, BATTLEANIMFUNC_08, $02, $0a ; ANIM_OBJ_8F
	battleanimobj $01, $90, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_02, $04, $03 ; ANIM_OBJ_90
	battleanimobj $01, $80, BATTLEANIMFRAMESET_7F, BATTLEANIMFUNC_42, $02, $08 ; ANIM_OBJ_91
	battleanimobj $01, $90, BATTLEANIMFRAMESET_9A, BATTLEANIMFUNC_00, $02, $1b ; ANIM_OBJ_92
	battleanimobj $21, $a0, BATTLEANIMFRAMESET_9B, BATTLEANIMFUNC_35, $04, $23 ; ANIM_OBJ_93
	battleanimobj $21, $80, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_23, $02, $25 ; ANIM_OBJ_94
	battleanimobj $21, $80, BATTLEANIMFRAMESET_9D, BATTLEANIMFUNC_25, $02, $25 ; ANIM_OBJ_95
	battleanimobj $21, $80, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_00, $02, $25 ; ANIM_OBJ_96
	battleanimobj $21, $80, BATTLEANIMFRAMESET_9E, BATTLEANIMFUNC_00, $06, $25 ; ANIM_OBJ_97
	battleanimobj $61, $80, BATTLEANIMFRAMESET_9F, BATTLEANIMFUNC_3A, $05, $23 ; ANIM_OBJ_98
	battleanimobj $21, $80, BATTLEANIMFRAMESET_A0, BATTLEANIMFUNC_16, $02, $23 ; ANIM_OBJ_99
	battleanimobj $21, $70, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_43, $03, $23 ; ANIM_OBJ_9A
	battleanimobj $21, $c0, BATTLEANIMFRAMESET_A2, BATTLEANIMFUNC_01, $02, $25 ; ANIM_OBJ_9B
	battleanimobj $21, $40, BATTLEANIMFRAMESET_A3, BATTLEANIMFUNC_44, $03, $24 ; ANIM_OBJ_9C
	battleanimobj $01, $80, BATTLEANIMFRAMESET_A4, BATTLEANIMFUNC_00, $02, $24 ; ANIM_OBJ_9D
	battleanimobj $01, $80, BATTLEANIMFRAMESET_A5, BATTLEANIMFUNC_00, $03, $24 ; ANIM_OBJ_9E
	battleanimobj $01, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_45, $04, $12 ; ANIM_OBJ_9F
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_A6, BATTLEANIMFUNC_00, $02, $02 ; ANIM_OBJ_A0
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_A7, BATTLEANIMFUNC_00, $02, $02 ; ANIM_OBJ_A1
	battleanimobj $21, $00, BATTLEANIMFRAMESET_B4, BATTLEANIMFUNC_4A, $07, $0f ; ANIM_OBJ_A2
	battleanimobj $21, $90, BATTLEANIMFRAMESET_A8, BATTLEANIMFUNC_02, $03, $05 ; ANIM_OBJ_A3
	battleanimobj $21, $40, BATTLEANIMFRAMESET_9C, BATTLEANIMFUNC_11, $02, $25 ; ANIM_OBJ_A4
	battleanimobj $61, $90, BATTLEANIMFRAMESET_A9, BATTLEANIMFUNC_46, $02, $23 ; ANIM_OBJ_A5
	battleanimobj $00, $00, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_47, $02, $0e ; ANIM_OBJ_A6
	battleanimobj $01, $80, BATTLEANIMFRAMESET_AA, BATTLEANIMFUNC_00, $02, $24 ; ANIM_OBJ_A7
	battleanimobj $21, $b8, BATTLEANIMFRAMESET_AB, BATTLEANIMFUNC_48, $02, $13 ; ANIM_OBJ_A8
	battleanimobj $21, $90, BATTLEANIMFRAMESET_AC, BATTLEANIMFUNC_44, $02, $13 ; ANIM_OBJ_A9
	battleanimobj $01, $a8, BATTLEANIMFRAMESET_05, BATTLEANIMFUNC_00, $02, $01 ; ANIM_OBJ_AA
	battleanimobj $01, $90, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_43, $02, $0e ; ANIM_OBJ_AB
	battleanimobj $01, $88, BATTLEANIMFRAMESET_AD, BATTLEANIMFUNC_00, $06, $17 ; ANIM_OBJ_AC
	battleanimobj $01, $a8, BATTLEANIMFRAMESET_AE, BATTLEANIMFUNC_49, $02, $01 ; ANIM_OBJ_AD
	battleanimobj $21, $90, BATTLEANIMFRAMESET_AF, BATTLEANIMFUNC_01, $03, $11 ; ANIM_OBJ_AE
	battleanimobj $21, $00, BATTLEANIMFRAMESET_B0, BATTLEANIMFUNC_4A, $02, $04 ; ANIM_OBJ_AF
	battleanimobj $00, $00, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_4B, $04, $1c ; ANIM_OBJ_B0
	battleanimobj $01, $88, BATTLEANIMFRAMESET_B1, BATTLEANIMFUNC_4C, $02, $19 ; ANIM_OBJ_B1
	battleanimobj $01, $b8, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4D, $07, $09 ; ANIM_OBJ_B2
	battleanimobj $61, $98, BATTLEANIMFRAMESET_B3, BATTLEANIMFUNC_00, $03, $27 ; ANIM_OBJ_B3
	battleanimobj $61, $98, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_04, $06, $15 ; ANIM_OBJ_B4
	battleanimobj $21, $ff, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4E, $07, $09 ; ANIM_OBJ_B5
	battleanimobj $01, $90, BATTLEANIMFRAMESET_73, BATTLEANIMFUNC_08, $04, $1e ; ANIM_OBJ_FLOWER
	battleanimobj $01, $ff, BATTLEANIMFRAMESET_89, BATTLEANIMFUNC_4F, $04, $1f ; ANIM_OBJ_COTTON
	battleanimobj $00, $00, BATTLEANIMFRAMESET_B5, BATTLEANIMFUNC_00, $00, $28 ; ANIM_OBJ_B8
	battleanimobj $00, $00, BATTLEANIMFRAMESET_B6, BATTLEANIMFUNC_00, $01, $29 ; ANIM_OBJ_B9
	battleanimobj $00, $00, BATTLEANIMFRAMESET_B7, BATTLEANIMFUNC_00, $00, $28 ; ANIM_OBJ_BA
	battleanimobj $00, $00, BATTLEANIMFRAMESET_B8, BATTLEANIMFUNC_00, $01, $29 ; ANIM_OBJ_BB
; ccfbe

INCLUDE "battle/objects/functions.asm"

ReinitBattleAnimFrameset: ; ce7bf (33:67bf)
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], 0
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], -1
	ret

GetBattleAnimFrame: ; ce7d1
.loop
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next_frame
	dec [hl]
	call .GetPointer
	ld a, [hli]
	push af
	jr .okay

.next_frame
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	inc [hl]
	call .GetPointer
	ld a, [hli]
	cp -2
	jr z, .restart
	cp -1
	jr z, .repeat_last
	push af
	ld a, [hl]
	push hl
	and $3f
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a
	pop hl

.okay
	ld a, [hl]
	and $c0
	srl a
	ld [wBattleAnimTemp7], a
	pop af
	ret

.repeat_last
	xor a
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	dec [hl]
	dec [hl]
	jr .loop

.restart
	xor a
	ld hl, BATTLEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a
	dec a
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], a
	jr .loop

; ce823

.GetPointer: ; ce823
	ld hl, BATTLEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, BattleAnimFrameData
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, BATTLEANIMSTRUCT_FRAME
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ret

; ce83c

GetBattleAnimOAMPointer: ; ce83c
	ld l, a
	ld h, 0
	ld de, BattleAnimOAMData
	add hl, hl
	add hl, hl
	add hl, de
	ret

; ce846

LoadBattleAnimObj: ; ce846 (33:6846)
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, AnimObjGFX
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	push bc
	call DecompressRequest2bpp
	pop bc
	ret

; ce85e (33:685e)

INCLUDE "battle/objects/framesets.asm"
INCLUDE "battle/objects/oam.asm"
INCLUDE "battle/objects/gfx_headers.asm"
