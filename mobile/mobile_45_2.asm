Function116567:
	ld hl, wc3f7
	dec [hl]
	ret nz
	ld hl, wc3f6
	inc [hl]
.asm_116570
	ld a, $7
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_1167eb
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	pop hl
	ld a, [wc3f6]
	sla a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	cp $fe
	jr nz, .asm_116595
	xor a
	ld [wc3f6], a
	jr .asm_116570

.asm_116595
	ld [wc3f5], a
	ld a, [hl]
	ld [wc3f7], a
	ret

Function11659d:
	ld a, [wc314]
	cp $12
	ret nc
	ld e, a
	ld d, 0
	ld hl, Jumptable_1165af
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Jumptable_1165af:
	dw Function11677e
	dw Function1165d5
	dw Function1165d8
	dw Function1165e3
	dw Function1165f5
	dw Function116600
	dw Function116615
	dw Function116618
	dw Function116623
	dw Function116635
	dw Function116640
	dw Function116655
	dw Function11665c
	dw Function11668d
	dw Function11669f
	dw Function1166a2
	dw Function1166c4
	dw Function1166d6
	dw Function1166d6

Function1165d5:
	call Function11678e

Function1165d8:
	ld a, $0
	ld c, a
	ld a, $ff
	ld b, a
	ld a, $a8
	call Function1166f4

Function1165e3:
	call Function116747
	ld a, [wc30e]
	cp $e8
	ret nz
	ld a, $1
	call Function116780
	ret c
	jp Function116797

Function1165f5:
	ld a, $1
	ld c, a
	ld a, $1
	ld b, a
	ld a, $e8
	call Function1166f4

Function116600:
	call Function116747
	ld a, [wc30e]
	cp $a8
	ret nz
	ld a, $1
	call Function116780
	ret c
	ld a, $2
	ld [wc314], a
	ret

Function116615:
	call Function11678e

Function116618:
	ld a, $3
	ld c, a
	ld a, $1
	ld b, a
	ld a, $28
	call Function11671f

Function116623:
	call Function116747
	ld a, [wc30f]
	cp $a0
	ret nz
	ld a, $6
	call Function116780
	ret c
	jp Function116797

Function116635:
	ld a, $2
	ld c, a
	ld a, $ff
	ld b, a
	ld a, $a0
	call Function11671f

Function116640:
	call Function116747
	ld a, [wc30f]
	cp $28
	ret nz
	ld a, $6
	call Function116780
	ret c
	ld a, $7
	ld [wc314], a
	ret

Function116655:
	xor a
	ld [wc314 + 3], a
	call Function11678e

Function11665c:
	ld hl, wc314 + 3
	ld a, $1
	xor [hl]
	ld [hl], a
	add $4
	ld c, a
	call Function11679c
	ld a, [wc314 + 3]
	and a
	jr nz, .asm_116673
	ld a, $48
	jr .asm_116675

.asm_116673
	ld a, $78

.asm_116675
	ld [wc30f], a
	call Random
	ldh a, [hRandomAdd]
	and $7
	sla a
	sla a
	sla a
	add $30
	ld [wc30e], a
	call Function116797

Function11668d:
	ld a, [wc311]
	cp $ff
	ret nz
	ld a, $b
	call Function116780
	ret c
	ld a, $c
	ld [wc314], a
	ret

Function11669f:
	call Function11678e

Function1166a2:
	ld a, $a8
	ld [wc30e], a
	ld [wc3f1], a
	ld a, $60
	ld [wc30f], a
	ld [wc3f3], a
	ld a, $ff
	ld [wc314 + 2], a
	xor a
	ld [wc314 + 3], a
	ld a, $0
	ld c, a
	call Function11679c
	call Function116797

Function1166c4:
	call Function116747
	ld a, [wc30e]
	cp $58
	ret nz
	ld a, $6
	ld c, a
	call Function11679c
	call Function116797

Function1166d6:
	call Function116747
	ld a, [wc30e]
	cp $48
	jr nz, .asm_1166e4
	xor a
	ld [wc314 + 2], a

.asm_1166e4
	ld a, [wc311]
	cp $ff
	ret nz
	ld a, $4
	ld [wc319], a
	xor a
	ld [wc314], a
	ret

Function1166f4:
	ld [wc30e], a
	ld a, b
	ld [wc314 + 2], a
	xor a
	ld [wc314 + 3], a
	ld hl, wc30f
.asm_116702
	call Random
	ldh a, [hRandomAdd]
	and $7
	jr z, .asm_11670c
	dec a

.asm_11670c
	sla a
	sla a
	sla a
	add $48
	cp [hl]
	jr z, .asm_116702
	ld [hl], a
	call Function11679c
	call Function116797
	ret

Function11671f:
	ld [wc30f], a
	ld a, b
	ld [wc314 + 3], a
	xor a
	ld [wc314 + 2], a
	ld hl, wc30e
.asm_11672d
	call Random
	ldh a, [hRandomAdd]
	and $7
	sla a
	sla a
	sla a
	add $30
	cp [hl]
	jr z, .asm_11672d
	ld [hl], a
	call Function11679c
	call Function116797
	ret

Function116747:
	ld hl, wc30e
	ld a, [wc314 + 2]
	add [hl]
	ld [hl], a
	ld hl, wc30f
	ld a, [wc314 + 3]
	add [hl]
	ld [hl], a
	ret

Function116758:
	ld a, [wc30f]
	cp $30
	jr c, .asm_116770
	jr z, .asm_116770
	cp $38
	jr c, .asm_116774
	jr z, .asm_116774
	cp $40
	jr c, .asm_116778
	jr z, .asm_116778
	xor a
	jr .asm_11677a

.asm_116770
	ld a, $c
	jr .asm_11677a

.asm_116774
	ld a, $8
	jr .asm_11677a

.asm_116778
	ld a, $4

.asm_11677a
	ld [wc314 + 4], a
	ret

Function11677e:
	ld a, $0

Function116780:
	ld hl, wc314 + 1
	cp [hl]
	jr z, .asm_11678c
	ld a, [hl]
	ld [wc314], a
	scf
	ret

.asm_11678c
	and a
	ret

Function11678e:
	ld hl, wc314
	ld a, [hl]
	ld [wc314 + 1], a
	inc [hl]
	ret

Function116797:
	ld hl, wc314
	inc [hl]
	ret

Function11679c:
	ld a, c
	ld [wc311], a
	xor a
	ld [wc312], a
	jr asm_1167af

Function1167a6:
	ld hl, wc313
	dec [hl]
	ret nz
	ld hl, wc312
	inc [hl]

asm_1167af:
	ld a, [wc311]
	cp $ff
	ret z
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_1167eb
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	pop hl
	ld a, [wc312]
	sla a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	cp $ff
	jr z, .asm_1167dc
	cp $fe
	jr nz, .asm_1167e3
	xor a
	ld [wc312], a
	jr asm_1167af

.asm_1167dc
	ld a, $ff
	ld [wc311], a
	ld a, $fd

.asm_1167e3
	ld [wc310], a
	ld a, [hl]
	ld [wc313], a
	ret

Unknown_1167eb:
	dw Unknown_1167fb
	dw Unknown_116808
	dw Unknown_116867
	dw Unknown_116870
	dw Unknown_116815
	dw Unknown_11683e
	dw Unknown_116881
	dw Unknown_1168ae

Unknown_1167fb:
	db $0, $6
	db $1, $4
	db $2, $4
	db $3, $6
	db $2, $4
	db $1, $4
	db $fe

Unknown_116808:
	db $4, $6
	db $5, $4
	db $6, $4
	db $7, $6
	db $6, $4
	db $5, $4
	db $fe

Unknown_116815:
	db $fd, $20
	db $8, $c
	db $9, $24
	db $a, $4
	db $b, $8
	db $a, $4
	db $9, $6
	db $c, $4
	db $d, $8
	db $c, $5
	db $9, $24
	db $a, $4
	db $b, $8
	db $a, $4
	db $9, $6
	db $c, $4
	db $d, $8
	db $c, $5
	db $9, $8
	db $8, $4
	db -1 ; end

Unknown_11683e:
	db $fd, $20
	db $e, $c
	db $f, $24
	db $10, $4
	db $11, $8
	db $10, $4
	db $f, $6
	db $12, $4
	db $13, $8
	db $12, $5
	db $f, $24
	db $10, $4
	db $11, $8
	db $10, $4
	db $f, $6
	db $12, $4
	db $13, $8
	db $12, $5
	db $f, $8
	db $e, $4
	db -1 ; end

Unknown_116867:
	db $14, $8
	db $15, $8
	db $16, $8
	db $15, $8
	db $fe

Unknown_116870:
	db $17, $5
	db $18, $5
	db $19, $5
	db $1a, $5
	db $1b, $5
	db $1a, $5
	db $19, $5
	db $18, $5
	db $fe

Unknown_116881:
	db $1c, $7
	db $1d, $7
	db $1e, $a
	db $1f, $a
	db $20, $5
	db $21, $5
	db $20, $5
	db $21, $5
	db $20, $18
	db $22, $4
	db $23, $2
	db $22, $2
	db $23, $2
	db $22, $1
	db $23, $1
	db $22, $1
	db $23, $4
	db $fd, $1
	db $23, $1
	db $fd, $2
	db $23, $2
	db $fd, $40
	db -1 ; end

Unknown_1168ae:
	db $24, $4
	db $25, $4
	db $26, $4
	db $27, $4
	db $28, $4
	db $29, $4
	db $2a, $4
	db $2b, $4
	db $2c, $4
	db $2d, $4
	db $2e, $4
	db $fe

Unknown_1168c5:
	dw Unknown_116923
	dw Unknown_116960
	dw Unknown_1169a1
	dw Unknown_1169de
	dw Unknown_116a1b
	dw Unknown_116a58
	dw Unknown_116a99
	dw Unknown_116ad6
	dw Unknown_116d1b
	dw Unknown_116d4c
	dw Unknown_116d85
	dw Unknown_116dbe
	dw Unknown_116df7
	dw Unknown_116e30
	dw Unknown_116e69
	dw Unknown_116e9a
	dw Unknown_116ed3
	dw Unknown_116f0c
	dw Unknown_116f45
	dw Unknown_116f7e
	dw Unknown_116b13
	dw Unknown_116b54
	dw Unknown_116b95
	dw Unknown_116bd6
	dw Unknown_116c17
	dw Unknown_116c58
	dw Unknown_116c99
	dw Unknown_116cda
	dw Unknown_116fb7
	dw Unknown_116fec
	dw Unknown_117025
	dw Unknown_117056
	dw Unknown_117083
	dw Unknown_1170c0
	dw Unknown_1170fd
	dw Unknown_11713a
	dw Unknown_117177
	dw Unknown_11719c
	dw Unknown_1171c1
	dw Unknown_1171e6
	dw Unknown_11720b
	dw Unknown_117230
	dw Unknown_117255
	dw Unknown_11727a
	dw Unknown_11729f
	dw Unknown_1172c4
	dw Unknown_1172e9

Unknown_116923:
	db $f
	db $0, $0, $1, $a
	db $0, $8, $2, $d
	db $0, $10, $3, $d
	db $0, $18, $4, $d
	db $8, $0, $11, $a
	db $8, $8, $12, $a
	db $8, $10, $13, $a
	db $8, $18, $14, $d
	db $10, $0, $21, $a
	db $10, $8, $22, $a
	db $10, $10, $23, $a
	db $10, $18, $24, $a
	db $18, $0, $31, $a
	db $18, $8, $32, $a
	db $18, $10, $33, $a

Unknown_116960:
	db $10
	db $1, $0, $1, $a
	db $1, $8, $2, $d
	db $1, $10, $3, $d
	db $1, $18, $4, $d
	db $9, $0, $11, $a
	db $9, $8, $12, $a
	db $9, $10, $13, $a
	db $9, $18, $14, $d
	db $11, $0, $5, $a
	db $11, $8, $6, $a
	db $11, $10, $7, $a
	db $11, $18, $34, $a
	db $19, $0, $15, $a
	db $19, $8, $16, $a
	db $19, $10, $17, $a
	db $19, $18, $35, $a

Unknown_1169a1:
	db $f
	db $1, $0, $1, $a
	db $1, $8, $2, $d
	db $1, $10, $3, $d
	db $1, $18, $4, $d
	db $9, $0, $11, $a
	db $9, $8, $12, $a
	db $9, $10, $13, $a
	db $9, $18, $14, $d
	db $11, $0, $25, $a
	db $11, $8, $26, $a
	db $11, $10, $27, $a
	db $11, $18, $34, $a
	db $19, $8, $36, $a
	db $19, $10, $37, $a
	db $19, $18, $35, $a

Unknown_1169de:
	db $f
	db $0, $0, $1, $a
	db $0, $8, $2, $d
	db $0, $10, $3, $d
	db $0, $18, $4, $d
	db $8, $0, $11, $a
	db $8, $8, $12, $a
	db $8, $10, $13, $a
	db $8, $18, $14, $d
	db $10, $0, $10, $a
	db $10, $8, $20, $a
	db $10, $10, $30, $a
	db $10, $18, $24, $a
	db $18, $0, $31, $a
	db $18, $8, $32, $a
	db $18, $10, $33, $a

Unknown_116a1b:
	db $f
	db $0, $0, $4, $2d
	db $0, $8, $3, $2d
	db $0, $10, $2, $2d
	db $0, $18, $1, $2a
	db $8, $0, $14, $2d
	db $8, $8, $13, $2a
	db $8, $10, $12, $2a
	db $8, $18, $11, $2a
	db $10, $0, $24, $2a
	db $10, $8, $23, $2a
	db $10, $10, $22, $2a
	db $10, $18, $21, $2a
	db $18, $8, $33, $2a
	db $18, $10, $32, $2a
	db $18, $18, $31, $2a

Unknown_116a58:
	db $10
	db $1, $0, $4, $2d
	db $1, $8, $3, $2d
	db $1, $10, $2, $2d
	db $1, $18, $1, $2a
	db $9, $0, $14, $2d
	db $9, $8, $13, $2a
	db $9, $10, $12, $2a
	db $9, $18, $11, $2a
	db $11, $0, $34, $2a
	db $11, $8, $7, $2a
	db $11, $10, $6, $2a
	db $11, $18, $5, $2a
	db $19, $0, $35, $2a
	db $19, $8, $17, $2a
	db $19, $10, $16, $2a
	db $19, $18, $15, $2a

Unknown_116a99:
	db $f
	db $1, $0, $4, $2d
	db $1, $8, $3, $2d
	db $1, $10, $2, $2d
	db $1, $18, $1, $2a
	db $9, $0, $14, $2d
	db $9, $8, $13, $2a
	db $9, $10, $12, $2a
	db $9, $18, $11, $2a
	db $11, $0, $34, $2a
	db $11, $8, $27, $2a
	db $11, $10, $26, $2a
	db $11, $18, $25, $2a
	db $19, $0, $35, $2a
	db $19, $8, $37, $2a
	db $19, $10, $36, $2a

Unknown_116ad6:
	db $f
	db $0, $0, $4, $2d
	db $0, $8, $3, $2d
	db $0, $10, $2, $2d
	db $0, $18, $1, $2a
	db $8, $0, $14, $2d
	db $8, $8, $13, $2a
	db $8, $10, $12, $2a
	db $8, $18, $11, $2a
	db $10, $0, $24, $2a
	db $10, $8, $30, $2a
	db $10, $10, $20, $2a
	db $10, $18, $10, $2a
	db $18, $8, $33, $2a
	db $18, $10, $32, $2a
	db $18, $18, $31, $2a

Unknown_116b13:
	db $10
	db $18, $0, $0, $b
	db $18, $8, $8, $b
	db $18, $10, $5c, $b
	db $18, $18, $0, $b
	db $10, $0, $0, $b
	db $10, $8, $5d, $b
	db $10, $10, $5e, $b
	db $10, $18, $0, $b
	db $8, $0, $50, $b
	db $8, $8, $51, $b
	db $8, $10, $52, $b
	db $8, $18, $50, $2b
	db $0, $0, $43, $b
	db $0, $8, $44, $b
	db $0, $10, $44, $2b
	db $0, $18, $43, $2b

Unknown_116b54:
	db $10
	db $19, $0, $0, $b
	db $19, $8, $18, $b
	db $19, $10, $c, $b
	db $19, $18, $0, $b
	db $11, $0, $42, $b
	db $11, $8, $3a, $b
	db $11, $10, $3a, $2b
	db $11, $18, $42, $2b
	db $9, $0, $58, $b
	db $9, $8, $45, $b
	db $9, $10, $45, $2b
	db $9, $18, $58, $2b
	db $1, $0, $d, $b
	db $1, $8, $44, $b
	db $1, $10, $44, $2b
	db $1, $18, $d, $2b

Unknown_116b95:
	db $10
	db $18, $0, $0, $b
	db $18, $8, $5c, $2b
	db $18, $10, $8, $2b
	db $18, $18, $0, $b
	db $10, $0, $0, $b
	db $10, $8, $5e, $2b
	db $10, $10, $5d, $2b
	db $10, $18, $0, $b
	db $8, $0, $50, $b
	db $8, $8, $52, $2b
	db $8, $10, $51, $2b
	db $8, $18, $50, $2b
	db $0, $0, $43, $b
	db $0, $8, $44, $b
	db $0, $10, $44, $2b
	db $0, $18, $43, $2b

Unknown_116bd6:
	db $10
	db $18, $0, $0, $a
	db $18, $8, $56, $a
	db $18, $10, $57, $a
	db $18, $18, $0, $a
	db $10, $0, $64, $a
	db $10, $8, $4a, $a
	db $10, $10, $4b, $a
	db $10, $18, $71, $a
	db $8, $0, $54, $a
	db $8, $8, $55, $a
	db $8, $10, $55, $2a
	db $8, $18, $54, $2a
	db $0, $0, $48, $a
	db $0, $8, $49, $a
	db $0, $10, $49, $2a
	db $0, $18, $48, $2a

Unknown_116c17:
	db $10
	db $19, $0, $0, $a
	db $19, $8, $76, $a
	db $19, $10, $77, $a
	db $19, $18, $0, $a
	db $11, $0, $64, $a
	db $11, $8, $69, $a
	db $11, $10, $6a, $a
	db $11, $18, $6b, $a
	db $9, $0, $6f, $a
	db $9, $8, $70, $a
	db $9, $10, $70, $2a
	db $9, $18, $6f, $2a
	db $1, $0, $63, $a
	db $1, $8, $19, $a
	db $1, $10, $19, $2a
	db $1, $18, $63, $2a

Unknown_116c58:
	db $10
	db $1a, $0, $6c, $a
	db $1a, $8, $6d, $a
	db $1a, $10, $6e, $a
	db $1a, $18, $0, $a
	db $12, $0, $5f, $a
	db $12, $8, $60, $a
	db $12, $10, $61, $a
	db $12, $18, $62, $a
	db $a, $0, $53, $a
	db $a, $8, $55, $a
	db $a, $10, $55, $2a
	db $a, $18, $53, $2a
	db $2, $0, $46, $a
	db $2, $8, $47, $a
	db $2, $10, $47, $2a
	db $2, $18, $46, $2a

Unknown_116c99:
	db $10
	db $19, $0, $0, $2a
	db $19, $8, $77, $2a
	db $19, $10, $76, $2a
	db $19, $18, $0, $2a
	db $11, $0, $6b, $2a
	db $11, $8, $6a, $2a
	db $11, $10, $69, $2a
	db $11, $18, $64, $2a
	db $9, $0, $6f, $a
	db $9, $8, $70, $a
	db $9, $10, $70, $2a
	db $9, $18, $6f, $2a
	db $1, $0, $63, $a
	db $1, $8, $19, $a
	db $1, $10, $19, $2a
	db $1, $18, $63, $2a

Unknown_116cda:
	db $10
	db $18, $0, $0, $a
	db $18, $8, $57, $2a
	db $18, $10, $56, $2a
	db $18, $18, $0, $a
	db $10, $0, $71, $2a
	db $10, $8, $4b, $2a
	db $10, $10, $4a, $2a
	db $10, $18, $64, $2a
	db $8, $0, $54, $a
	db $8, $8, $55, $a
	db $8, $10, $55, $2a
	db $8, $18, $54, $2a
	db $0, $0, $48, $a
	db $0, $8, $49, $a
	db $0, $10, $49, $2a
	db $0, $18, $48, $2a

Unknown_116d1b:
	db $c
	db $0, $0, $38, $4a
	db $0, $8, $39, $4a
	db $0, $10, $39, $6a
	db $0, $18, $38, $6a
	db $8, $0, $28, $4a
	db $8, $8, $29, $4a
	db $8, $10, $29, $6a
	db $8, $18, $28, $6a
	db $10, $0, $9, $4d
	db $10, $8, $19, $4a
	db $10, $10, $19, $6a
	db $10, $18, $9, $6d

Unknown_116d4c:
	db $e
	db $0, $8, $3b, $4a
	db $0, $10, $3b, $6a
	db $8, $0, $2a, $4a
	db $8, $8, $2b, $4a
	db $8, $10, $2b, $6a
	db $8, $18, $2a, $6a
	db $10, $0, $1a, $4a
	db $10, $8, $1b, $4a
	db $10, $10, $1b, $6a
	db $10, $18, $1a, $6a
	db $18, $0, $a, $4a
	db $18, $8, $b, $4a
	db $18, $10, $b, $6a
	db $18, $18, $a, $6a

Unknown_116d85:
	db $e
	db $0, $0, $35, $2a
	db $0, $8, $3c, $4a
	db $0, $10, $3d, $4a
	db $0, $18, $3e, $4a
	db $8, $0, $2c, $4a
	db $8, $8, $2d, $4a
	db $8, $10, $2e, $4a
	db $8, $18, $2f, $4a
	db $10, $0, $1c, $4a
	db $10, $8, $1d, $4a
	db $10, $10, $1e, $4d
	db $10, $18, $1f, $4d
	db $18, $10, $e, $4d
	db $18, $18, $f, $4a

Unknown_116dbe:
	db $e
	db $0, $0, $65, $4a
	db $0, $8, $66, $4a
	db $0, $10, $67, $4a
	db $0, $18, $68, $4a
	db $8, $8, $59, $4a
	db $8, $10, $5a, $4a
	db $8, $18, $5b, $4a
	db $10, $0, $4c, $4a
	db $10, $8, $4d, $4d
	db $10, $10, $4e, $4d
	db $10, $18, $4f, $4a
	db $18, $0, $3f, $4d
	db $18, $8, $40, $4d
	db $18, $10, $41, $4d

Unknown_116df7:
	db $e
	db $0, $0, $3e, $6a
	db $0, $8, $3d, $6a
	db $0, $10, $3c, $6a
	db $0, $18, $35, $a
	db $8, $0, $2f, $6a
	db $8, $8, $2e, $6a
	db $8, $10, $2d, $6a
	db $8, $18, $2c, $6a
	db $10, $0, $1f, $6d
	db $10, $8, $1e, $6d
	db $10, $10, $1d, $6a
	db $10, $18, $1c, $6a
	db $18, $0, $f, $6a
	db $18, $8, $e, $6d

Unknown_116e30:
	db $e
	db $0, $0, $68, $6a
	db $0, $8, $67, $6a
	db $0, $10, $66, $6a
	db $0, $18, $65, $6a
	db $8, $0, $5b, $6a
	db $8, $8, $5a, $6a
	db $8, $10, $59, $6a
	db $10, $0, $4f, $6a
	db $10, $8, $4e, $6d
	db $10, $10, $4d, $6d
	db $10, $18, $4c, $6a
	db $18, $8, $41, $6d
	db $18, $10, $40, $6d
	db $18, $18, $3f, $6d

Unknown_116e69:
	db $c
	db $8, $0, $9, $d
	db $8, $8, $19, $a
	db $8, $10, $19, $2a
	db $8, $18, $9, $2d
	db $10, $0, $28, $a
	db $10, $8, $29, $a
	db $10, $10, $29, $2a
	db $10, $18, $28, $2a
	db $18, $0, $38, $a
	db $18, $8, $39, $a
	db $18, $10, $39, $2a
	db $18, $18, $38, $2a

Unknown_116e9a:
	db $e
	db $0, $0, $a, $a
	db $0, $8, $b, $a
	db $0, $10, $b, $2a
	db $0, $18, $a, $2a
	db $8, $0, $1a, $a
	db $8, $8, $1b, $a
	db $8, $10, $1b, $2a
	db $8, $18, $1a, $2a
	db $10, $0, $2a, $a
	db $10, $8, $2b, $a
	db $10, $10, $2b, $2a
	db $10, $18, $2a, $2a
	db $18, $8, $3b, $a
	db $18, $10, $3b, $2a

Unknown_116ed3:
	db $e
	db $0, $10, $e, $d
	db $0, $18, $f, $a
	db $8, $0, $1c, $a
	db $8, $8, $1d, $a
	db $8, $10, $1e, $d
	db $8, $18, $1f, $d
	db $10, $0, $2c, $a
	db $10, $8, $2d, $a
	db $10, $10, $2e, $a
	db $10, $18, $2f, $a
	db $18, $0, $35, $6a
	db $18, $8, $3c, $a
	db $18, $10, $3d, $a
	db $18, $18, $3e, $a

Unknown_116f0c:
	db $e
	db $0, $0, $3f, $d
	db $0, $8, $40, $d
	db $0, $10, $41, $d
	db $8, $0, $4c, $a
	db $8, $8, $4d, $d
	db $8, $10, $4e, $d
	db $8, $18, $4f, $a
	db $10, $8, $59, $a
	db $10, $10, $5a, $a
	db $10, $18, $5b, $a
	db $18, $0, $65, $a
	db $18, $8, $66, $a
	db $18, $10, $67, $a
	db $18, $18, $68, $a

Unknown_116f45:
	db $e
	db $0, $0, $f, $2a
	db $0, $8, $e, $2d
	db $8, $0, $1f, $2d
	db $8, $8, $1e, $2d
	db $8, $10, $1d, $2a
	db $8, $18, $1c, $2a
	db $10, $0, $2f, $2a
	db $10, $8, $2e, $2a
	db $10, $10, $2d, $2a
	db $10, $18, $2c, $2a
	db $18, $0, $3e, $2a
	db $18, $8, $3d, $2a
	db $18, $10, $3c, $2a
	db $18, $18, $35, $4a

Unknown_116f7e:
	db $e
	db $0, $8, $41, $2d
	db $0, $10, $40, $2d
	db $0, $18, $3f, $2d
	db $8, $0, $4f, $2a
	db $8, $8, $4e, $2d
	db $8, $10, $4d, $2d
	db $8, $18, $4c, $2a
	db $10, $0, $5b, $2a
	db $10, $8, $5a, $2a
	db $10, $10, $59, $2a
	db $18, $0, $68, $2a
	db $18, $8, $67, $2a
	db $18, $10, $66, $2a
	db $18, $18, $65, $2a

Unknown_116fb7:
	db $d
	db $fa, $0, $72, $a
	db $fa, $8, $73, $d
	db $fa, $10, $74, $d
	db $fa, $18, $75, $d
	db $2, $0, $81, $a
	db $2, $8, $82, $a
	db $2, $10, $83, $a
	db $2, $18, $84, $a
	db $a, $0, $91, $a
	db $a, $8, $92, $a
	db $a, $10, $93, $a
	db $a, $18, $94, $a
	db $12, $10, $a3, $a

Unknown_116fec:
	db $e
	db $fd, $0, $85, $d
	db $fd, $8, $86, $d
	db $5, $0, $95, $d
	db $5, $8, $96, $a
	db $5, $10, $97, $a
	db $5, $18, $98, $a
	db $d, $0, $a5, $a
	db $d, $8, $a6, $a
	db $d, $10, $a7, $a
	db $d, $18, $a8, $a
	db $15, $0, $b3, $a
	db $15, $8, $b4, $a
	db $15, $10, $b5, $a
	db $15, $18, $b6, $a

Unknown_117025:
	db $c
	db $8, $0, $79, $d
	db $8, $8, $7a, $d
	db $8, $10, $7b, $a
	db $8, $18, $7c, $a
	db $10, $0, $89, $d
	db $10, $8, $8a, $a
	db $10, $10, $8b, $a
	db $10, $18, $8c, $a
	db $18, $0, $99, $a
	db $18, $8, $9a, $a
	db $18, $10, $9b, $a
	db $18, $18, $9c, $a

Unknown_117056:
	db $b
	db $8, $0, $7d, $a
	db $8, $8, $7e, $d
	db $8, $10, $7f, $d
	db $8, $18, $80, $a
	db $10, $0, $8d, $a
	db $10, $8, $8e, $a
	db $10, $10, $8f, $a
	db $10, $18, $90, $a
	db $18, $8, $9e, $a
	db $18, $10, $9f, $a
	db $18, $18, $a0, $a

Unknown_117083:
	db $f
	db $0, $0, $a1, $a
	db $0, $8, $a2, $a
	db $0, $10, $a2, $2a
	db $0, $18, $a1, $2a
	db $8, $0, $b1, $a
	db $8, $8, $b2, $d
	db $8, $10, $b2, $2d
	db $8, $18, $b1, $2a
	db $10, $0, $ab, $a
	db $10, $8, $ac, $a
	db $10, $10, $ac, $2a
	db $10, $18, $ab, $2a
	db $18, $8, $a4, $a
	db $18, $10, $87, $a
	db $18, $18, $88, $a

Unknown_1170c0:
	db $f
	db $0, $0, $a1, $a
	db $0, $8, $a2, $d
	db $0, $10, $a2, $2a
	db $0, $18, $a1, $2a
	db $8, $0, $b1, $a
	db $8, $8, $78, $d
	db $8, $10, $78, $2d
	db $8, $18, $b1, $2a
	db $10, $0, $ab, $a
	db $10, $8, $ac, $a
	db $10, $10, $ac, $2a
	db $10, $18, $ab, $2a
	db $18, $8, $a4, $a
	db $18, $10, $87, $a
	db $18, $18, $88, $a

Unknown_1170fd:
	db $f
	db $0, $0, $a9, $a
	db $0, $8, $aa, $a
	db $0, $10, $aa, $2a
	db $0, $18, $a9, $2a
	db $8, $0, $b7, $a
	db $8, $8, $b8, $a
	db $8, $10, $b8, $2a
	db $8, $18, $b7, $2a
	db $10, $0, $ab, $a
	db $10, $8, $ac, $a
	db $10, $10, $ac, $2a
	db $10, $18, $ad, $a
	db $18, $8, $a4, $a
	db $18, $10, $ba, $a
	db $18, $18, $bb, $a

Unknown_11713a:
	db $f
	db $0, $0, $ae, $c
	db $0, $8, $af, $c
	db $0, $10, $af, $2c
	db $0, $18, $ae, $2c
	db $8, $0, $bc, $c
	db $8, $8, $bd, $c
	db $8, $10, $bd, $2c
	db $8, $18, $bc, $2c
	db $10, $0, $bf, $c
	db $10, $8, $9d, $c
	db $10, $10, $9d, $2c
	db $10, $18, $b0, $c
	db $18, $8, $b9, $c
	db $18, $10, $c0, $c
	db $18, $18, $be, $c

Unknown_117177:
	db $9
	db $14, $0, $1f, $6
	db $14, $8, $20, $6
	db $14, $10, $21, $6
	db $c, $0, $10, $6
	db $c, $8, $11, $6
	db $c, $10, $12, $6
	db $4, $0, $1, $6
	db $4, $8, $2, $6
	db $4, $10, $3, $6

Unknown_11719c:
	db $9
	db $14, $0, $22, $6
	db $14, $8, $23, $6
	db $14, $10, $24, $6
	db $c, $0, $13, $6
	db $c, $8, $14, $6
	db $c, $10, $15, $6
	db $4, $0, $4, $6
	db $4, $8, $5, $6
	db $4, $10, $6, $6

Unknown_1171c1:
	db $9
	db $14, $0, $25, $6
	db $14, $8, $26, $6
	db $14, $10, $27, $6
	db $c, $0, $16, $6
	db $c, $8, $17, $6
	db $c, $10, $18, $6
	db $4, $0, $7, $6
	db $4, $8, $8, $6
	db $4, $10, $9, $6

Unknown_1171e6:
	db $9
	db $14, $0, $28, $6
	db $14, $8, $29, $6
	db $14, $10, $2a, $6
	db $c, $0, $19, $6
	db $c, $8, $1a, $6
	db $c, $10, $1b, $6
	db $4, $0, $a, $6
	db $4, $8, $b, $6
	db $4, $10, $c, $6

Unknown_11720b:
	db $9
	db $14, $0, $2b, $6
	db $14, $8, $2c, $6
	db $14, $10, $2d, $6
	db $c, $0, $1c, $6
	db $c, $8, $1d, $6
	db $c, $10, $1e, $6
	db $4, $0, $d, $6
	db $4, $8, $e, $6
	db $4, $10, $f, $6

Unknown_117230:
	db $9
	db $14, $0, $47, $6
	db $14, $8, $48, $6
	db $14, $10, $49, $6
	db $c, $0, $3b, $6
	db $c, $8, $3c, $6
	db $c, $10, $3b, $26
	db $4, $0, $2e, $6
	db $4, $8, $2f, $6
	db $4, $10, $30, $6

Unknown_117255:
	db $9
	db $14, $0, $35, $6
	db $14, $8, $4a, $6
	db $14, $10, $35, $6
	db $c, $0, $3d, $6
	db $c, $8, $35, $6
	db $c, $10, $3d, $26
	db $4, $0, $31, $6
	db $4, $8, $32, $6
	db $4, $10, $31, $26

Unknown_11727a:
	db $9
	db $14, $0, $4b, $6
	db $14, $8, $4c, $6
	db $14, $10, $4d, $6
	db $c, $0, $3e, $6
	db $c, $8, $3f, $6
	db $c, $10, $40, $6
	db $4, $0, $33, $6
	db $4, $8, $34, $6
	db $4, $10, $35, $6

Unknown_11729f:
	db $9
	db $14, $0, $4e, $6
	db $14, $8, $4f, $6
	db $14, $10, $50, $6
	db $c, $0, $41, $6
	db $c, $8, $42, $6
	db $c, $10, $43, $6
	db $4, $0, $35, $6
	db $4, $8, $36, $6
	db $4, $10, $37, $6

Unknown_1172c4:
	db $9
	db $14, $0, $51, $6
	db $14, $8, $52, $6
	db $14, $10, $35, $6
	db $c, $0, $44, $6
	db $c, $8, $45, $6
	db $c, $10, $46, $6
	db $4, $0, $38, $6
	db $4, $8, $39, $6
	db $4, $10, $3a, $6

Unknown_1172e9:
	db $9
	db $10, $0, $0, $2
	db $10, $8, $0, $2
	db $10, $10, $0, $2
	db $8, $0, $0, $2
	db $8, $8, $0, $2
	db $c, $10, $1f, $6
	db $0, $0, $0, $2
	db $0, $8, $0, $2
	db $4, $10, $10, $6

PichuBorderMobileOBPalettes:
INCLUDE "gfx/mobile/pichu_border_ob.pal"

PichuBorderMobileBGPalettes:
INCLUDE "gfx/mobile/pichu_border_bg.pal"

PichuBorderMobileTilemapAttrmap:
INCBIN "gfx/mobile/pichu_border.tilemap"
INCBIN "gfx/mobile/pichu_border.attrmap"
