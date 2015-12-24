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
	ld a, [BattleAnimTemps]
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
	ld [hli], a ; 00
	ld a, [de]
	inc de
	ld [hli], a ; 01
	ld a, [de]
	inc de
	ld [hli], a ; 02
	ld a, [de]
	inc de
	ld [hli], a ; 03
	ld a, [de]
	inc de
	ld [hli], a ; 04
	ld a, [de]
	inc de
	ld [hli], a ; 05
	ld a, [de]
	call GetBattleAnimTileOffset
	ld [hli], a ; 06
	ld a, [BattleAnimTemps + 1]
	ld [hli], a ; 07
	ld a, [BattleAnimTemps + 2]
	ld [hli], a ; 08
	xor a
	ld [hli], a ; 09
	ld [hli], a ; 0a
	ld a, [BattleAnimTemps + 3]
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
	call Functionccaaa
	call GetBattleAnimFrame
	cp -3
	jp z, .exit_no_carry
	cp -4
	jp z, .delete_exit
	push af
	ld hl, BattleAnimTemps
	ld a, [BattleAnimTemps + 7]
	xor [hl]
	and $e0
	ld [hl], a
	pop af
	push bc
	call GetBattleAnimOAMPointer
	ld a, [BattleAnimTemps + 2]
	add [hl]
	ld [BattleAnimTemps + 2], a
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
	ld a, [BattleAnimTemps + 4]
	ld b, a
	ld a, [BattleAnimTemps + 6]
	add b
	ld b, a
	push hl
	ld a, [hl]
	ld hl, BattleAnimTemps
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
	ld a, [BattleAnimTemps + 3]
	ld b, a
	ld a, [BattleAnimTemps + 5]
	add b
	ld b, a
	push hl
	ld a, [hl]
	ld hl, BattleAnimTemps
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
	ld a, [BattleAnimTemps + 2]
	add $31
	add [hl]
	ld [de], a
	inc hl
	inc de
	ld a, [BattleAnimTemps]
	ld b, a
	ld a, [hl]
	xor b
	and $e0
	ld b, a
	ld a, [hl]
	and $10
	or b
	ld b, a
	ld a, [BattleAnimTemps + 8]
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
	jr .exit_no_carry

.delete_exit
	call DeinitBattleAnimation

.exit_no_carry
	and a
	ret

.exit_set_carry
	pop bc
	scf
	ret

; ccaaa

Functionccaaa: ; ccaaa
	ld hl, BATTLEANIMSTRUCT_01
	add hl, bc
	ld a, [hl]
	and $80
	ld [BattleAnimTemps], a
	xor a
	ld [BattleAnimTemps + 7], a
	ld hl, BATTLEANIMSTRUCT_05
	add hl, bc
	ld a, [hl]
	ld [BattleAnimTemps + 8], a
	ld hl, BATTLEANIMSTRUCT_02
	add hl, bc
	ld a, [hl]
	ld [BattleAnimTemps + 1], a
	ld hl, BATTLEANIMSTRUCT_TILEID
	add hl, bc
	ld a, [hli]
	ld [BattleAnimTemps + 2], a
	ld a, [hli]
	ld [BattleAnimTemps + 3], a
	ld a, [hli]
	ld [BattleAnimTemps + 4], a
	ld a, [hli]
	ld [BattleAnimTemps + 5], a
	ld a, [hli]
	ld [BattleAnimTemps + 6], a
	ld a, [hBattleTurn]
	and a
	ret z
	ld hl, BATTLEANIMSTRUCT_01
	add hl, bc
	ld a, [hl]
	ld [BattleAnimTemps], a
	bit 0, [hl]
	ret z
	ld hl, BATTLEANIMSTRUCT_07
	add hl, bc
	ld a, [hli]
	ld d, a
	ld a, $b4
	sub d
	ld [BattleAnimTemps + 3], a
	ld a, [hli]
	ld d, a
	ld a, [BattleAnimTemps + 1]
	cp $ff
	jr nz, .check_kinesis_softboiled_milkdrink
	ld a, $28
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
	sub $8
	jr .done

.no_sub
	pop af
.done
	ld [BattleAnimTemps + 4], a
	ld a, [hli]
	xor $ff
	inc a
	ld [BattleAnimTemps + 5], a
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
	db \1, \2, \3, \4, \5, \6
endm

	battleanimobj $01, $ff, $00, $00, $02, $01 ; 00
	battleanimobj $01, $ff, $01, $00, $02, $01 ; 01
	battleanimobj $01, $ff, $02, $00, $02, $01 ; 02
	battleanimobj $01, $90, $00, $00, $02, $01 ; 03
	battleanimobj $01, $90, $01, $00, $02, $01 ; 04
	battleanimobj $01, $90, $02, $00, $02, $01 ; 05
	battleanimobj $01, $ff, $03, $00, $02, $01 ; 06
	battleanimobj $01, $ff, $04, $1b, $02, $01 ; 07
	battleanimobj $01, $ff, $05, $00, $02, $01 ; 08
	battleanimobj $01, $ff, $06, $00, $02, $01 ; 09
	battleanimobj $01, $90, $07, $09, $02, $01 ; 0a
	battleanimobj $01, $aa, $10, $10, $04, $03 ; 0b
	battleanimobj $01, $90, $0e, $04, $04, $03 ; 0c
	battleanimobj $01, $90, $0f, $03, $04, $03 ; 0d
	battleanimobj $01, $90, $10, $08, $04, $03 ; 0e
	battleanimobj $01, $90, $0f, $0a, $04, $03 ; 0f
	battleanimobj $01, $90, $11, $03, $04, $03 ; 10
	battleanimobj $01, $90, $12, $08, $06, $0a ; 11
	battleanimobj $01, $90, $13, $00, $06, $0a ; 12
	battleanimobj $01, $90, $14, $01, $06, $0a ; 13
	battleanimobj $21, $78, $16, $0b, $05, $06 ; 14
	battleanimobj $00, $00, $09, $12, $04, $0b ; 15
	battleanimobj $00, $00, $09, $13, $04, $0b ; 16
	battleanimobj $01, $90, $18, $00, $04, $08 ; 17
	battleanimobj $01, $ff, $18, $00, $04, $08 ; 18
	battleanimobj $01, $90, $1d, $06, $02, $0c ; 19
	battleanimobj $01, $b4, $1f, $38, $02, $0c ; 1a
	battleanimobj $01, $90, $08, $00, $02, $07 ; 1b
	battleanimobj $01, $a0, $08, $00, $02, $07 ; 1c
	battleanimobj $01, $ff, $19, $07, $07, $09 ; 1d
	battleanimobj $01, $ff, $1a, $07, $07, $09 ; 1e
	battleanimobj $01, $b0, $1b, $36, $07, $09 ; 1f
	battleanimobj $01, $b0, $84, $36, $06, $21 ; 20
	battleanimobj $01, $90, $21, $0c, $06, $0d ; 21
	battleanimobj $00, $00, $23, $0d, $06, $0d ; 22
	battleanimobj $01, $90, $24, $0e, $02, $0e ; 23
	battleanimobj $61, $80, $27, $0f, $06, $04 ; 24
	battleanimobj $01, $b4, $2a, $00, $06, $04 ; 25
	battleanimobj $01, $40, $2b, $11, $05, $0f ; 26
	battleanimobj $61, $98, $2c, $00, $03, $10 ; 27
	battleanimobj $61, $98, $2d, $09, $03, $10 ; 28
	battleanimobj $01, $b8, $2e, $00, $06, $0a ; 29
	battleanimobj $01, $b8, $2f, $00, $06, $0a ; 2a
	battleanimobj $01, $b8, $30, $14, $07, $11 ; 2b
	battleanimobj $01, $90, $21, $14, $03, $0d ; 2c
	battleanimobj $21, $b0, $31, $00, $03, $05 ; 2d
	battleanimobj $21, $b0, $32, $00, $03, $05 ; 2e
	battleanimobj $21, $b0, $33, $00, $03, $05 ; 2f
	battleanimobj $21, $90, $34, $15, $03, $05 ; 30
	battleanimobj $21, $90, $36, $00, $03, $05 ; 31
	battleanimobj $21, $90, $37, $03, $02, $08 ; 32
	battleanimobj $21, $90, $38, $00, $03, $05 ; 33
	battleanimobj $21, $90, $39, $03, $02, $08 ; 34
	battleanimobj $21, $90, $3a, $16, $02, $02 ; 35
	battleanimobj $01, $90, $3c, $17, $02, $02 ; 36
	battleanimobj $21, $ff, $3e, $00, $02, $02 ; 37
	battleanimobj $21, $ff, $3f, $00, $02, $02 ; 38
	battleanimobj $21, $ff, $40, $00, $02, $02 ; 39
	battleanimobj $21, $ff, $41, $00, $02, $02 ; 3a
	battleanimobj $21, $ff, $42, $00, $02, $02 ; 3b
	battleanimobj $01, $88, $43, $18, $05, $12 ; 3c
	battleanimobj $01, $88, $44, $00, $05, $12 ; 3d
	battleanimobj $21, $b8, $45, $19, $02, $13 ; 3e
	battleanimobj $21, $ff, $46, $00, $02, $14 ; 3f
	battleanimobj $21, $ff, $47, $00, $02, $14 ; 40
	battleanimobj $21, $ff, $48, $1a, $02, $14 ; 41
	battleanimobj $21, $ff, $49, $1a, $02, $14 ; 42
	battleanimobj $21, $98, $4a, $01, $02, $14 ; 43
	battleanimobj $21, $80, $4b, $00, $03, $11 ; 44
	battleanimobj $01, $88, $4c, $1c, $05, $12 ; 45
	battleanimobj $21, $b0, $4d, $1d, $02, $15 ; 46
	battleanimobj $01, $b0, $51, $1e, $03, $11 ; 47
	battleanimobj $21, $ff, $52, $1f, $05, $16 ; 48
	battleanimobj $21, $ff, $54, $1f, $05, $16 ; 49
	battleanimobj $21, $68, $56, $20, $05, $06 ; 4a
	battleanimobj $21, $90, $59, $21, $02, $0e ; 4b
	battleanimobj $21, $90, $5c, $02, $02, $17 ; 4c
	battleanimobj $01, $90, $5d, $22, $03, $11 ; 4d
	battleanimobj $61, $88, $5f, $00, $03, $10 ; 4e
	battleanimobj $61, $88, $2d, $09, $03, $10 ; 4f
	battleanimobj $21, $88, $60, $00, $03, $18 ; 50
	battleanimobj $21, $80, $60, $00, $02, $18 ; 51
	battleanimobj $21, $50, $61, $23, $03, $19 ; 52
	battleanimobj $01, $80, $63, $24, $02, $19 ; 53
	battleanimobj $01, $80, $66, $25, $02, $19 ; 54
	battleanimobj $01, $50, $1c, $00, $02, $0c ; 55
	battleanimobj $21, $a8, $67, $26, $07, $1a ; 56
	battleanimobj $21, $a8, $68, $00, $07, $1a ; 57
	battleanimobj $21, $90, $69, $01, $02, $1a ; 58
	battleanimobj $21, $90, $6d, $28, $03, $19 ; 59
	battleanimobj $21, $90, $6a, $27, $02, $1b ; 5a
	battleanimobj $00, $00, $6f, $29, $02, $1c ; 5b
	battleanimobj $21, $48, $70, $29, $02, $1c ; 5c
	battleanimobj $21, $48, $6f, $29, $02, $1c ; 5d
	battleanimobj $21, $78, $6f, $2a, $02, $1c ; 5e
	battleanimobj $61, $90, $71, $2b, $02, $1d ; 5f
	battleanimobj $61, $90, $72, $2c, $02, $1d ; 60
	battleanimobj $01, $48, $73, $2d, $04, $1e ; 61
	battleanimobj $01, $90, $74, $06, $02, $15 ; 62
	battleanimobj $01, $ff, $75, $2e, $07, $19 ; 63
	battleanimobj $21, $90, $4a, $02, $02, $14 ; 64
	battleanimobj $01, $80, $30, $2f, $02, $11 ; 65
	battleanimobj $01, $78, $76, $2a, $04, $23 ; 66
	battleanimobj $01, $80, $77, $30, $02, $1f ; 67
	battleanimobj $01, $90, $77, $02, $02, $1f ; 68
	battleanimobj $01, $ff, $77, $00, $02, $1f ; 69
	battleanimobj $01, $80, $78, $08, $03, $23 ; 6a
	battleanimobj $21, $90, $79, $00, $02, $1f ; 6b
	battleanimobj $01, $ff, $7a, $31, $03, $11 ; 6c
	battleanimobj $01, $88, $7a, $31, $03, $11 ; 6d
	battleanimobj $21, $88, $7b, $32, $02, $20 ; 6e
	battleanimobj $21, $98, $7c, $00, $02, $04 ; 6f
	battleanimobj $21, $80, $7d, $00, $02, $18 ; 70
	battleanimobj $01, $80, $21, $2f, $06, $0d ; 71
	battleanimobj $01, $b0, $7e, $33, $03, $12 ; 72
	battleanimobj $01, $80, $7f, $2f, $02, $08 ; 73
	battleanimobj $21, $a0, $6f, $34, $02, $1c ; 74
	battleanimobj $21, $a0, $74, $35, $02, $15 ; 75
	battleanimobj $21, $b0, $80, $33, $02, $14 ; 76
	battleanimobj $01, $88, $81, $37, $02, $11 ; 77
	battleanimobj $01, $88, $85, $00, $02, $22 ; 78
	battleanimobj $01, $88, $86, $00, $02, $22 ; 79
	battleanimobj $01, $90, $87, $39, $02, $1f ; 7a
	battleanimobj $01, $80, $30, $3a, $03, $11 ; 7b
	battleanimobj $21, $90, $34, $00, $03, $05 ; 7c
	battleanimobj $a1, $88, $88, $3b, $06, $13 ; 7d
	battleanimobj $01, $80, $76, $25, $04, $23 ; 7e
	battleanimobj $01, $98, $10, $34, $04, $03 ; 7f
	battleanimobj $01, $a8, $0f, $3c, $04, $03 ; 80
	battleanimobj $21, $68, $89, $29, $02, $1f ; 81
	battleanimobj $21, $b0, $8a, $00, $02, $1f ; 82
	battleanimobj $21, $80, $8c, $00, $02, $1f ; 83
	battleanimobj $21, $50, $8d, $00, $03, $1f ; 84
	battleanimobj $01, $40, $24, $40, $02, $0e ; 85
	battleanimobj $21, $a8, $8e, $41, $04, $1f ; 86
	battleanimobj $21, $88, $8f, $3e, $02, $1f ; 87
	battleanimobj $21, $88, $93, $3e, $02, $1f ; 88
	battleanimobj $21, $90, $97, $3d, $02, $1f ; 89
	battleanimobj $21, $90, $78, $3d, $03, $23 ; 8a
	battleanimobj $01, $ff, $99, $2e, $02, $19 ; 8b
	battleanimobj $21, $a0, $74, $02, $02, $15 ; 8c
	battleanimobj $21, $a0, $99, $35, $04, $19 ; 8d
	battleanimobj $21, $70, $8b, $3f, $02, $1f ; 8e
	battleanimobj $01, $90, $15, $08, $02, $0a ; 8f
	battleanimobj $01, $90, $11, $02, $04, $03 ; 90
	battleanimobj $01, $80, $7f, $42, $02, $08 ; 91
	battleanimobj $01, $90, $9a, $00, $02, $1b ; 92
	battleanimobj $21, $a0, $9b, $35, $04, $23 ; 93
	battleanimobj $21, $80, $9c, $23, $02, $25 ; 94
	battleanimobj $21, $80, $9d, $25, $02, $25 ; 95
	battleanimobj $21, $80, $9c, $00, $02, $25 ; 96
	battleanimobj $21, $80, $9e, $00, $06, $25 ; 97
	battleanimobj $61, $80, $9f, $3a, $05, $23 ; 98
	battleanimobj $21, $80, $a0, $16, $02, $23 ; 99
	battleanimobj $21, $70, $78, $43, $03, $23 ; 9a
	battleanimobj $21, $c0, $a2, $01, $02, $25 ; 9b
	battleanimobj $21, $40, $a3, $44, $03, $24 ; 9c
	battleanimobj $01, $80, $a4, $00, $02, $24 ; 9d
	battleanimobj $01, $80, $a5, $00, $03, $24 ; 9e
	battleanimobj $01, $88, $43, $45, $04, $12 ; 9f
	battleanimobj $21, $ff, $a6, $00, $02, $02 ; a0
	battleanimobj $21, $ff, $a7, $00, $02, $02 ; a1
	battleanimobj $21, $00, $b4, $4a, $07, $0f ; a2
	battleanimobj $21, $90, $a8, $02, $03, $05 ; a3
	battleanimobj $21, $40, $9c, $11, $02, $25 ; a4
	battleanimobj $61, $90, $a9, $46, $02, $23 ; a5
	battleanimobj $00, $00, $24, $47, $02, $0e ; a6
	battleanimobj $01, $80, $aa, $00, $02, $24 ; a7
	battleanimobj $21, $b8, $ab, $48, $02, $13 ; a8
	battleanimobj $21, $90, $ac, $44, $02, $13 ; a9
	battleanimobj $01, $a8, $05, $00, $02, $01 ; aa
	battleanimobj $01, $90, $24, $43, $02, $0e ; ab
	battleanimobj $01, $88, $ad, $00, $06, $17 ; ac
	battleanimobj $01, $a8, $ae, $49, $02, $01 ; ad
	battleanimobj $21, $90, $af, $01, $03, $11 ; ae
	battleanimobj $21, $00, $b0, $4a, $02, $04 ; af
	battleanimobj $00, $00, $70, $4b, $04, $1c ; b0
	battleanimobj $01, $88, $b1, $4c, $02, $19 ; b1
	battleanimobj $01, $b8, $19, $4d, $07, $09 ; b2
	battleanimobj $61, $98, $b3, $00, $03, $27 ; b3
	battleanimobj $61, $98, $74, $04, $06, $15 ; b4
	battleanimobj $21, $ff, $19, $4e, $07, $09 ; b5
	battleanimobj $01, $90, $73, $08, $04, $1e ; b6
	battleanimobj $01, $ff, $89, $4f, $04, $1f ; b7
	battleanimobj $00, $00, $b5, $00, $00, $28 ; b8
	battleanimobj $00, $00, $b6, $00, $01, $29 ; b9
	battleanimobj $00, $00, $b7, $00, $00, $28 ; ba
	battleanimobj $00, $00, $b8, $00, $01, $29 ; bb
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
	ld [BattleAnimTemps + 7], a
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
