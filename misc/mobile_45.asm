
SECTION "bank45", ROMX

	charmap " ", $20 ; revert to ascii

.From: ; 114199
	db "FROM:", 0
.Sender: ; 11419f
	db "SENDER:", 0
.ReplyTo: ; 1141a7
	db "REPLY-TO:", 0
.To: ; 1141b1
	db "TO:", 0
.CC: ; 1141b5
	db "CC:", 0
.Subject: ; 1141b9
	db "SUBJECT:", 0
.Date: ; 1141c2
	db "DATE:", 0
.ContentType: ; 1141c8
	db "CONTENT-TYPE:", 0
.MimeVersion: ; 1141d6
	db "MIME-VERSION:", 0
.XMailer: ; 1141e4
	db "X-MAILER:", 0
.XGameTitle: ; 1141ee
	db "X-GAME-TITLE:", 0
.XGameCode: ; 1141fc
	db "X-GAME-CODE:", 0
.XGBMailType: ; 114209
	db "X-GBMAIL-TYPE:", 0
; 114218

INCLUDE "misc/mobile_45_sprite_engine.asm"

; 116567

Function116567: ; 116567
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
	ld b, $0
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

; 11659d

Function11659d: ; 11659d
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

; 1165af

Jumptable_1165af: ; 1165af
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
; 1165d5

Function1165d5: ; 1165d5
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

; 1165f5

Function1165f5: ; 1165f5
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

; 116615

Function116615: ; 116615
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

; 116635

Function116635: ; 116635
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

; 116655

Function116655: ; 116655
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
	ld a, [hRandomAdd]
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

; 11669f

Function11669f: ; 11669f
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
	ld [$c319], a
	xor a
	ld [wc314], a
	ret

; 1166f4

Function1166f4: ; 1166f4
	ld [wc30e], a
	ld a, b
	ld [wc314 + 2], a
	xor a
	ld [wc314 + 3], a
	ld hl, wc30f
.asm_116702
	call Random
	ld a, [hRandomAdd]
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

; 11671f

Function11671f: ; 11671f
	ld [wc30f], a
	ld a, b
	ld [wc314 + 3], a
	xor a
	ld [wc314 + 2], a
	ld hl, wc30e
.asm_11672d
	call Random
	ld a, [hRandomAdd]
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

; 116747

Function116747: ; 116747
	ld hl, wc30e
	ld a, [wc314 + 2]
	add [hl]
	ld [hl], a
	ld hl, wc30f
	ld a, [wc314 + 3]
	add [hl]
	ld [hl], a
	ret

; 116758

Function116758: ; 116758
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

; 11677e

Function11677e: ; 11677e
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

; 11678e

Function11678e: ; 11678e
	ld hl, wc314
	ld a, [hl]
	ld [wc314 + 1], a
	inc [hl]
	ret

; 116797

Function116797: ; 116797
	ld hl, wc314
	inc [hl]
	ret

; 11679c

Function11679c:
	ld a, c
	ld [wc311], a
	xor a
	ld [wc312], a
	jr asm_1167af

Function1167a6: ; 1167a6
	ld hl, wc313
	dec [hl]
	ret nz
	ld hl, wc312
	inc [hl]

asm_1167af
.asm_1167af
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
	ld b, $0
	add hl, bc
	ld a, [hli]
	cp $ff
	jr z, .asm_1167dc
	cp $fe
	jr nz, .asm_1167e3
	xor a
	ld [wc312], a
	jr .asm_1167af

.asm_1167dc
	ld a, $ff
	ld [wc311], a
	ld a, $fd

.asm_1167e3
	ld [wc310], a
	ld a, [hl]
	ld [wc313], a
	ret

; 1167eb

Unknown_1167eb:
	dw Unknown_1167fb
	dw Unknown_116808
	dw Unknown_116867
	dw Unknown_116870
	dw Unknown_116815
	dw Unknown_11683e
	dw Unknown_116881
	dw Unknown_1168ae

Unknown_1167fb: ; 1167fb
	db $0, $6
	db $1, $4
	db $2, $4
	db $3, $6
	db $2, $4
	db $1, $4
	db $fe

Unknown_116808: ; 116808
	db $4, $6
	db $5, $4
	db $6, $4
	db $7, $6
	db $6, $4
	db $5, $4
	db $fe

Unknown_116815: ; 116815
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
	db $ff

Unknown_11683e: ; 11683e
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
	db $ff

Unknown_116867: ; 116867
	db $14, $8
	db $15, $8
	db $16, $8
	db $15, $8
	db $fe

Unknown_116870: ; 116870
	db $17, $5
	db $18, $5
	db $19, $5
	db $1a, $5
	db $1b, $5
	db $1a, $5
	db $19, $5
	db $18, $5
	db $fe

Unknown_116881: ; 116881
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
	db $ff

Unknown_1168ae: ; 1168ae
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
; 1168c5

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

Unknown_116923: ; 116923
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

Unknown_116960: ; 116960
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

Unknown_1169a1: ; 1169a1
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

Unknown_1169de: ; 1169de
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

Unknown_116a1b: ; 116a1b
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

Unknown_116a58: ; 116a58
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

Unknown_116a99: ; 116a99
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

Unknown_116ad6: ; 116ad6
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

Unknown_116b13: ; 116b13
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

Unknown_116b54: ; 116b54
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

Unknown_116b95: ; 116b95
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

Unknown_116bd6: ; 116bd6
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

Unknown_116c17: ; 116c17
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

Unknown_116c58: ; 116c58
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

Unknown_116c99: ; 116c99
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

Unknown_116cda: ; 116cda
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

Unknown_116d1b: ; 116d1b
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

Unknown_116d4c: ; 116d4c
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

Unknown_116d85: ; 116d85
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

Unknown_116dbe: ; 116dbe
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

Unknown_116df7: ; 116df7
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

Unknown_116e30: ; 116e30
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

Unknown_116e69: ; 116e69
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

Unknown_116e9a: ; 116e9a
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

Unknown_116ed3: ; 116ed3
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

Unknown_116f0c: ; 116f0c
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

Unknown_116f45: ; 116f45
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

Unknown_116f7e: ; 116f7e
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

Unknown_116fb7: ; 116fb7
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

Unknown_116fec: ; 116fec
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

Unknown_117025: ; 117025
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

Unknown_117056: ; 117056
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

Unknown_117083: ; 117083
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

Unknown_1170c0: ; 1170c0
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

Unknown_1170fd: ; 1170fd
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

Unknown_11713a: ; 11713a
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

Unknown_117177: ; 117177
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

Unknown_11719c: ; 11719c
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

Unknown_1171c1: ; 1171c1
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

Unknown_1171e6: ; 1171e6
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

Unknown_11720b: ; 11720b
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

Unknown_117230: ; 117230
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

Unknown_117255: ; 117255
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

Unknown_11727a: ; 11727a
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

Unknown_11729f: ; 11729f
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

Unknown_1172c4: ; 1172c4
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

Unknown_1172e9: ; 1172e9
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
; 11730e

Palette_11730e:
	RGB 31, 31, 31
	RGB  7,  5,  4
	RGB 31, 28,  4
	RGB 31,  5,  5
	RGB 31, 31, 31
	RGB  7,  5,  4
	RGB 31, 23,  0
	RGB 31, 28,  4
	RGB 31, 31, 31
	RGB 16, 19, 31
	RGB 17, 31, 31
	RGB 31, 31, 31
	RGB  5,  5,  5
	RGB  7,  5,  4
	RGB 31, 28,  4
	RGB 19, 11,  6
	RGB 31, 31, 31
	RGB  3, 15, 31
	RGB  4, 25, 25
	RGB  0,  7, 12
	RGB 31, 31, 31
	RGB  0, 16,  0
	RGB  0, 16,  0
	RGB  0, 16,  0
	RGB  4, 11, 22
	RGB  0, 16,  0
	RGB  0, 16,  0
	RGB  0, 16,  0
	RGB 22, 11,  8
	RGB  0, 16,  0
	RGB  0, 16,  0
	RGB  0, 16,  0

Palette_11734e:
	RGB 31, 30, 30
	RGB  2,  0,  0
	RGB 10,  9,  9
	RGB 15, 14, 14

Unknown_117356: ; 117356
	db $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9
	db $c9, $c9, $c9, $c9, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c5, $c6, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c6, $c5, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $d8, $c2, $c2, $d8, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c7, $c8, $ca, $cb, $cc, $cd, $ce, $c2, $cf, $d0, $d1, $d2, $d3, $c2, $d4, $d5
	db $d6, $d7, $c8, $c7, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9
	db $c9, $c9, $c9, $c9, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1

	db $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
	db $8f, $8f, $8f, $8f, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $8f, $0f, $0f, $8f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $8f, $8f, $8f, $8f, $8f, $0f, $8f, $8f, $8f, $8f, $8f, $0f, $8f, $8f
	db $8f, $8f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
	db $8f, $8f, $8f, $8f, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
; 117656


SECTION "Mobile Stadium", ROMX

Special_GiveOddEgg: ; 117656
	callba GiveOddEgg
	ret

; 11765d

Function11765d: ; 11765d (45:765d)
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call Function11766b
	pop af
	ld [hInMenu], a
	ret

Function11766b: ; 11766b (45:766b)
	call Function117699
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	call Function1176ee
	ld a, $5
	call GetSRAMBank
	ld hl, $b1f3
	ld de, wcd49
	ld bc, $8
	call CopyBytes
	ld de, $c708
	ld bc, $11
	call CopyBytes
	call CloseSRAM
	pop af
	ld [rSVBK], a
	ret

Function117699: ; 117699 (45:7699)
	ld a, $5
	call GetSRAMBank
	ld hl, wcd49
	ld de, $b1f3
	ld bc, $8
	call CopyBytes
	ld hl, $c708
	ld bc, $11
	call CopyBytes
	call CloseSRAM
	xor a
	ld [wcd49], a
	ld [wcd4a], a
	ld [wcd4b], a
	ld [wcd4c], a
	ld [wcd4d], a
	ld [wcd4e], a
	ld [wcd4f], a
	ld hl, $c708
	ld bc, $11
	call ByteFill
	call ClearBGPalettes
	call ClearSprites
	callba Function171c87
	callba ReloadMapPart
	callba ClearSpriteAnims
	ret

Function1176ee: ; 1176ee (45:76ee)
.loop
	call JoyTextDelay
	ld a, [wcd49]
	bit 7, a
	jr nz, .quit
	call Function117719
	callba PlaySpriteAnimations
	callba ReloadMapPart
	jr .loop

.quit
	callba ClearSpriteAnims
	call ClearBGPalettes
	call ClearScreen
	call ClearSprites
	ret

Function117719: ; 117719 (45:7719)
	ld a, [wcd49]
	ld e, a
	ld d, 0
	ld hl, Jumptable_117728
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Jumptable_117728: ; 117728 (45:7728)
	dw Function117738
	dw Function117764
	dw Function1178aa
	dw Function1178e8
	dw Function117942
	dw Function117976
	dw Function117984
	dw Function1179a7


Function117738: ; 117738 (45:7738)
	callba Function171ccd
	depixel 6, 3
	ld a, $1d
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld a, $6
	ld [hl], a
	depixel 9, 4
	ld a, $1d
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld a, $7
	ld [hl], a
	ld a, $3
	ld [wcd23], a
	jp MobilePassword_IncrementJumptable

Function117764: ; 117764 (45:7764)
	ld a, [wcd4a]
	cp $10
	jr nz, .asm_11776f
	ld a, $1
	jr .asm_117770

.asm_11776f
	xor a
.asm_117770
	ld [wcd24], a
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and SELECT
	jr nz, Function117764_select
	ld a, [hl]
	and START
	jr nz, Function117764_start
	ld a, [hl]
	and A_BUTTON
	jp nz, Function117764_a_button
	ld a, [hl]
	and B_BUTTON
	jr nz, Function117764_b_button
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Function117764_d_up
	ld a, [hl]
	and D_DOWN
	jr nz, Function117764_d_down
	ld a, [hl]
	and D_LEFT
	jp nz, Function117764_d_left
	ld a, [hl]
	and D_RIGHT
	jp nz, Function117764_d_right
	ret

Function117764_select: ; 1177a5 (45:77a5)
	callba Function171cf0
	ret

Function117764_start: ; 1177ac (45:77ac)
	ld a, $2
	ld [wcd4c], a
	ld a, $4
	ld [wcd4d], a
	ret

Function1177b7: ; 1177b7 (45:77b7)
	ld a, $3
	ld [wcd24], a
	ld a, [wcd4a]
	and a
	jr z, .asm_1177c5
	jp MobilePassword_IncrementJumptable

.asm_1177c5
	ld a, $6
	ld [wcd49], a
	ret

Function1177cb: ; 1177cb (45:77cb)
	ld a, $80
	ld [wcd49], a
	ld [ScriptVar], a
	jp MobilePassword_IncrementJumptable

Function117764_b_button: ; 1177d6 (45:77d6)
	call PlayClickSFX
	ld a, [wcd4a]
	and a
	ret z
	dec a
	ld [wcd4a], a
	ld e, a
	ld d, $0
	ld hl, $c708
	add hl, de
	xor a
	ld [hl], a
	hlcoord 2, 4
	add hl, de
	ld [hl], a
	ret

Function117764_d_up: ; 1177f1 (45:77f1)
	ld a, [wcd4d]
	and a
	ret z
	dec a
	ld [wcd4d], a
	cp $3
	ret nz
	ld a, [wcd4c]
	ld e, a
	sla a
	sla a
	add e
Function117764_d_vertical_load: ; 117806 (45:7806)
	ld [wcd4c], a
	ret

Function117764_d_down: ; 11780a (45:780a)
	ld a, [wcd4d]
	cp $4
	ret z
	inc a
	ld [wcd4d], a
	cp $4
	ret nz
	ld a, [wcd4c]
	cp $a
	jr nc, .asm_117825
	cp $5
	jr nc, .asm_117829
	xor a
	jr Function117764_d_vertical_load

.asm_117825
	ld a, $2
	jr Function117764_d_vertical_load

.asm_117829
	ld a, $1
	jr Function117764_d_vertical_load

Function117764_d_left: ; 11782d (45:782d)
	ld a, [wcd4c]
	and a
	ret z
	dec a
	ld [wcd4c], a
	ret

Function117764_d_right: ; 117837 (45:7837)
	ld e, $d
	ld a, [wcd4d]
	cp $4
	jr nz, .wrap
	ld e, $2
.wrap
	ld a, [wcd4c]
	cp e
	ret z
	inc a
	ld [wcd4c], a
	ret

Function117764_a_button: ; 11784c (45:784c)
	call PlayClickSFX
	ld a, [wcd4d]
	cp $4
	jr nz, .not_4
	ld a, [wcd4c]
	cp $2
	jp z, Function1177b7
	cp $1
	jp z, Function1177cb
	jp Function117764_select

.not_4
	ld a, [wcd4a]
	ld e, a
	cp $10
	jp z, Function117764_start
	inc a
	ld [wcd4a], a
	ld d, $0
	ld a, [wcd4b]
	and a
	jr nz, .ascii_symbols
	ld hl, Unknown_117a0f
	jr .got_ascii

.ascii_symbols
	ld hl, Unknown_117a47
.got_ascii
	push de
	ld a, [wcd4c]
	ld b, a
	ld a, [wcd4d]
	ld c, $e
	call SimpleMultiply
	add b
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld hl, $c708
	add hl, de
	ld [hl], a
	pop de
	hlcoord 2, 4
	add hl, de
	sub $20
	ld [hl], a
	ld a, e
	cp $f
	ret nz
	jp Function117764_start

Function1178aa: ; 1178aa (45:78aa)
	ld hl, MenuDataHeader_1179b5
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	ld hl, MenuDataHeader_1179bd
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	callba ReloadMapPart
	hlcoord 16, 8
	ld de, YessNoString_1179c5
	call PlaceString
	hlcoord 15, 10
	ld a, "▶"
	ld [hl], a
	hlcoord 1, 14
	ld de, AskSavePasswordString
	call PlaceString
	ld a, $1
	ld [wcd4e], a
	jp MobilePassword_IncrementJumptable

Function1178e8: ; 1178e8 (45:78e8)
	ld a, [hJoyPressed]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr z, .a_button
	cp D_DOWN
	jr z, .d_down
	cp D_UP
	ret nz
	ld a, [wcd4e]
	and a
	ret z
	dec a
	ld [wcd4e], a
	hlcoord 15, 8
	ld a, "▶"
	ld [hl], a
	hlcoord 15, 10
	ld a, " "
	ld [hl], a
	ret

.d_down
	ld a, [wcd4e]
	and a
	ret nz
	inc a
	ld [wcd4e], a
	hlcoord 15, 8
	ld a, " "
	ld [hl], a
	hlcoord 15, 10
	ld a, "▶"
	ld [hl], a
	ret

.a_button
	call PlayClickSFX
	ld a, [wcd4e]
	and a
	jr nz, .b_button
	call ExitMenu
	ld a, $1
	ld [wcd4f], a
	jp MobilePassword_IncrementJumptable

.b_button
	call ExitMenu
	call ExitMenu
	jp MobilePassword_IncrementJumptable

Function117942: ; 117942 (45:7942)
	call SpeechTextBox
	hlcoord 1, 14
	ld de, SavedPasswordString
	call PlaceString
	ld a, $1e
	ld [wcd4e], a
	ld a, BANK(sMobileLoginPassword)
	call GetSRAMBank
	ld a, [wcd4f]
	ld [sMobileLoginPassword], a
	ld hl, $c708
	ld de, sMobileLoginPassword + 1
	ld bc, MOBILE_LOGIN_PASSWORD_LENGTH
	call CopyBytes
	call CloseSRAM
	ld a, [wcd4f]
	and a
	jr z, asm_11797e
	call MobilePassword_IncrementJumptable

Function117976: ; 117976 (45:7976)
	ld hl, wcd4e
	dec [hl]
	ret nz
	call ExitMenu
asm_11797e: ; 11797e (45:797e)
	ld a, $80
	ld [wcd49], a
	ret

Function117984: ; 117984 (45:7984)
	ld hl, MenuDataHeader_1179b5
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	callba ReloadMapPart
	hlcoord 1, 14
	ld de, NotAPokemonPasswordString
	call PlaceString
	ld a, $1e
	ld [wcd4e], a
	call MobilePassword_IncrementJumptable

Function1179a7: ; 1179a7 (45:79a7)
	ld hl, wcd4e
	dec [hl]
	ret nz
	call ExitMenu
	ld a, $1
	ld [wcd49], a
	ret

; 1179b5 (45:79b5)

MenuDataHeader_1179b5: ; 1179b5
	db $40 ; flags
	db 12,  0 ; start coords
	db 17, 19 ; end coords
	dw NULL
	db 0 ; default option
; 1179bd

MenuDataHeader_1179bd: ; 1179bd
	db $40 ; flags
	db  7, 14 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 0 ; default option
; 1179c5


YessNoString_1179c5: ; 1179c5
	db   "はい"
	next "いいえ@"
; 1179cc

AskSavePasswordString: ; 1179cc
	db   "こ%パスワード¯ほぞんして"
	line "おきますか?@"
; 1179e1

NotAPokemonPasswordString: ; 1179e1
	db   "パスワード<PKMN>にゅうりょく"
	line "されていません!@"
; 1179f7

SavedPasswordString: ; 1179f7
	db   "ログインパスワード¯ほぞん"
	line "しました@"
; 117a0a

MobilePassword_IncrementJumptable: ; 117a0a (45:7a0a)
	ld hl, wcd49
	inc [hl]
	ret

; 117a0f (45:7a0f)

Unknown_117a0f:
INCBIN "data/mobile/ascii-alpha.txt"

Unknown_117a47:
INCBIN "data/mobile/ascii-sym.txt"
; 117a7f


; everything from here to the end of the bank is related to the
; Mobile Stadium option from the continue/newgame menu.
; XXX better function names
MobileStudium: ; 0x117a7f
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call Function117a8d
	pop af
	ld [hInMenu], a
	ret

; 0x117a8d

Function117a8d: ; 0x117a8d
	call Function117a94
	call Function117acd
	ret

; 0x117a94

Function117a94: ; 0x117a94
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	call ClearBGPalettes
	call ClearSprites
	callba Function172e78
	callba HDMATransferAttrMapAndTileMapToWRAMBank3
	ret

; 0x117ab4

Function117ab4: ; 0x117ab4
	call ClearBGPalettes
	call ClearSprites
	callba Function172e78
	callba Function172eb9
	callba ReloadMapPart
	ret

; 0x117acd

Function117acd: ; 0x117acd
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_117ae2
	call Function117ae9
	callba HDMATransferAttrMapAndTileMapToWRAMBank3
	jr Function117acd

.asm_117ae2
	call ClearBGPalettes
	call ClearSprites
	ret

Function117ae9: ; 0x117ae9
	ld a, [wJumptableIndex]
	ld e, a
	ld d, $0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable: ; 0x117af8
	dw Function117b06
	dw Function117b14
	dw Function117b28
	dw Function117b31
	dw Function117b4f
	dw Function117bb6
	dw Function117c4a

Function117b06:
	callba Function172eb9
	ld a, $10
	ld [wcf64], a
	jp MobileStudium_JumptableIncrement

Function117b14:
	ld hl, wcf64
	dec [hl]
	ret nz
	ld hl, MenuDataHeader_117cbc
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	jp MobileStudium_JumptableIncrement

Function117b28:
	ld hl, MobileStadiumEntryText
	call PrintText
	jp MobileStudium_JumptableIncrement

Function117b31:
	ld hl, MenuDataHeader_117cc4
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	hlcoord 16, 8
	ld de, YesNo117ccc
	call PlaceString
	hlcoord 15, 8
	ld a, "▶"
	ld [hl], a
	jp MobileStudium_JumptableIncrement

Function117b4f:
	ld a, [hJoyPressed]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr z, .a_button
	cp D_DOWN
	jr z, .d_down
	cp D_UP
	ret nz
	ld a, [wcf64]
	and a
	ret z
	dec a
	ld [wcf64], a
	hlcoord 15, 8
	ld a, "▶"
	ld [hl], a
	hlcoord 15, 10
	ld a, " "
	ld [hl], a
	ret

.d_down
	ld a, [wcf64]
	and a
	ret nz
	inc a
	ld [wcf64], a
	hlcoord 15, 8
	ld a, " "
	ld [hl], a
	hlcoord 15, 10
	ld a, "▶"
	ld [hl], a
	ret

.a_button
	call PlayClickSFX
	ld a, [wcf64]
	and a
	jr nz, .b_button
	call ExitMenu
	call ExitMenu
	callba ReloadMapPart
	jp MobileStudium_JumptableIncrement

.b_button
	call ExitMenu
	call ExitMenu
	callba ReloadMapPart
	ld a, $80
	ld [wJumptableIndex], a
	ret

Function117bb6:
	call Function117c89
	ld a, $1
	ld [hBGMapMode], a
	callba Function118284
	call ClearSprites
	ld a, [wc300]
	and a
	jr z, .asm_117be7
	cp $a
	jr z, .asm_117be1
.asm_117bd0
	ld a, $2
	ld [wc303], a
	callba DisplayMobileError
	ld a, $80
	ld [wJumptableIndex], a
	ret

.asm_117be1
	ld a, $80
	ld [wJumptableIndex], a
	ret

.asm_117be7
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, [wcd89]
	and $1
	jr nz, .asm_117c16
	ld a, [w3_d000]
	cp $fe
	jr nz, .asm_117c16
	ld a, [w3_d001]
	cp $f
	jr nz, .asm_117c16
	ld hl, w3_dfec
	ld de, wcd69
	ld c, $10
.asm_117c0b
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_117c16
	inc hl
	dec c
	jr nz, .asm_117c0b
	jr .asm_117c20

.asm_117c16
	pop af
	ld [rSVBK], a
	ld a, $d3
	ld [wc300], a
	jr .asm_117bd0

.asm_117c20
	pop af
	ld [rSVBK], a
	callba Function172eb9
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, $7
	call GetSRAMBank
	ld hl, w3_d002
	ld de, $b000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	pop af
	ld [rSVBK], a
	jp MobileStudium_JumptableIncrement

Function117c4a:
	ld hl, MenuDataHeader_117cbc
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	callba ReloadMapPart
	ld hl, MobileStadiumSuccessText
	call PrintText
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, UnknBGPals
	ld de, 1 palettes
	ld c, 8
.loop
	push hl
	ld a, $7fff % $100
	ld [hli], a
	ld a, $7fff / $100
	ld [hl], a
	pop hl
	add hl, de
	dec c
	jr nz, .loop
	call RotateThreePalettesRight
	pop af
	ld [rSVBK], a
	ld a, $80
	ld [wJumptableIndex], a
	ret

Function117c89:
	ld a, $7
	call GetSRAMBank
	ld l, $0
	ld h, l
	ld de, $b000
	ld bc, $0ffc
.asm_117c97
	push bc
	ld a, [de]
	inc de
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .asm_117c97
	ld a, l
	ld [wcd83], a
	ld a, h
	ld [wcd84], a
	ld hl, $bfea
	ld de, wcd69
	ld bc, $10
	call CopyBytes
	call CloseSRAM
	ret

MenuDataHeader_117cbc: ; 0x117cbc
	db $40    ; flags
	db 12,  0 ; start coords
	db 17, 19 ; end coords
	dw NULL   ; menu data 2
	db 0      ; default option

MenuDataHeader_117cc4: ; 0x117cc4
	db $40    ; flags
	db  7, 14 ; start coords
	db 11, 19 ; end coords
	dw NULL   ; menu data 2
	db 0      ; default item

YesNo117ccc: ; 0x117ccc
	db   "はい"
	next "いいえ@"

MobileStadiumEntryText: ; 0x117cd3
	text_jump _MobileStadiumEntryText
	db "@"

MobileStadiumSuccessText: ; 0x117cd8
	text_jump _MobileStadiumSuccessText
	db "@"

MobileStudium_JumptableIncrement: ; 0x117cdd
	ld hl, wJumptableIndex
	inc [hl]
	ret
