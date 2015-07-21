; BG effects for use in battle animations.

Functionc8000: ; c8000 (32:4000)
	ld hl, ActiveBGEffects
	ld e, $5
.asm_c8005
	ld a, [hl]
	and a
	jr z, .asm_c8012
	ld c, l
	ld b, h
	push hl
	push de
	call Functionc804a
	pop de
	pop hl
.asm_c8012
	ld bc, $4
	add hl, bc
	dec e
	jr nz, .asm_c8005
	ret

Functionc801a: ; c801a (32:401a)
	ld hl, ActiveBGEffects
	ld e, $5
.asm_c801f
	ld a, [hl]
	and a
	jr z, .asm_c802c
	ld bc, $4
	add hl, bc
	dec e
	jr nz, .asm_c801f
	scf
	ret
.asm_c802c
	ld c, l
	ld b, h
	ld hl, $0
	add hl, bc
	ld a, [BattleAnimTemps]
	ld [hli], a
	ld a, [BattleAnimTemps + 1]
	ld [hli], a
	ld a, [BattleAnimTemps + 2]
	ld [hli], a
	ld a, [BattleAnimTemps + 3]
	ld [hl], a
	ret

EndBattleBGEffect: ; c8043 (32:4043)
	ld hl, 0
	add hl, bc
	ld [hl], 0
	ret

Functionc804a: ; c804a (32:404a)
	ld hl, 0
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, BattleBGEffects
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

BattleBGEffects: ; c805a (32:405a)
	dw BattleBGEffect_0
	dw Functionc80eb
	dw Functionc80f3
	dw Functionc812d
	dw Functionc8141
	dw Functionc8155
	dw Functionc8171
	dw Functionc818b
	dw Functionc81a5
	dw Functionc81b3
	dw Functionc81ea
	dw Functionc837b
	dw Functionc83a8
	dw Functionc8545
	dw Functionc8599
	dw Functionc863f
	dw Functionc8662
	dw Functionc8214
	dw Functionc8281
	dw Functionc8689
	dw Functionc8709
	dw Functionc8be8
	dw Functionc8bf2
	dw Functionc8bfd
	dw Functionc8c08
	dw Functionc8c14
	dw Functionc8c20
	dw Functionc8c30
	dw Functionc8b00
	dw Functionc8c3c
	dw Functionc8c55
	dw Functionc8cf9
	dw Functionc8d02
	dw Functionc8761
	dw Functionc89ee
	dw Functionc87a7
	dw Functionc8805
	dw Functionc8837
	dw Functionc892a
	dw Functionc82f5
	dw Functionc89b5
	dw Functionc8607
	dw Functionc8a3a
	dw Functionc8acc
	dw Functionc8964
	dw Functionc88e7
	dw Functionc8ce1
	dw Functionc8919
	dw Functionc85c2
	dw Functionc85ce
	dw Functionc8603
	dw Functionc8c61
	dw Functionc8ca2
	dw Functionc8d3a


BattleBGEffect_0: ; c80c6 (32:40c6)
	call EndBattleBGEffect
	ret

Functionc80ca: ; c80ca (32:40ca)
	ld hl, $1
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Functionc80d7: ; c80d7 (32:40d7)
	pop de
	ld hl, $1
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Functionc80e5: ; c80e5 (32:40e5)
	ld hl, $1
	add hl, bc
	inc [hl]
	ret

Functionc80eb: ; c80eb (32:40eb)
	ld de, .inverted
	jp Functionc80fb
; c80f1 (32:40f1)

.inverted
	db %11100100 ; 3210
	db %00011011 ; 0123
; c80f3

Functionc80f3: ; c80f3 (32:40f3)
	ld de, .white
	jp Functionc80fb
; c80f9 (32:40f9)

.white
	db %11100100 ; 3210
	db %00000000 ; 0000
; c80fb

Functionc80fb: ; c80fb (32:40fb)
	ld a, $1
	ld [BattleAnimTemps], a
	ld hl, $1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_c810a
	dec [hl]
	ret

.asm_c810a
	ld hl, $2
	add hl, bc
	ld a, [hl]
	ld hl, $1
	add hl, bc
	ld [hl], a
	ld hl, $3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_c8120
	call EndBattleBGEffect
	ret

.asm_c8120
	dec a
	ld [hl], a
	and 1
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ld [wcfc7], a
	ret

Functionc812d: ; c812d (32:412d)
	ld de, Unknown_c813d
	call Functionc8d57
	jr c, .asm_c8139
	ld [wcfc7], a
	ret
.asm_c8139
	call EndBattleBGEffect
	ret
; c813d (32:413d)

Unknown_c813d:
	db $e4, $e0, $d0, $ff
; c8141

Functionc8141: ; c8141 (32:4141)
	ld de, Unknown_c8151
	call Functionc8d57
	jr c, .asm_c814d
	ld [wcfc7], a
	ret
.asm_c814d
	call EndBattleBGEffect
	ret
; c8151 (32:4151)

Unknown_c8151:
	db $e4, $f4, $f8, $ff
; c8155

Functionc8155: ; c8155 (32:4155)
	ld de, Unknown_c8168
	call Functionc8d57
	jr c, .asm_c8164
	ld [wcfc7], a
	ld [wcfc9], a
	ret
.asm_c8164
	call EndBattleBGEffect
	ret
; c8168 (32:4168)

Unknown_c8168:
	db $e4, $f8, $fc, $f8, $e4, $90, $40, $90, $fe
; c8171

Functionc8171: ; c8171 (32:4171)
	call Functionc9059
	jr nz, .asm_c817b
	ld de, Unknown_c8185
	jr .asm_c817e
.asm_c817b
	ld de, Unknown_c8188
.asm_c817e
	call Functionc8d57
	ld [wcfc8], a
	ret
; c8185 (32:4185)

Unknown_c8185:
	db $e4, $90, $fe
; c8188

Unknown_c8188:
	db $f0, $c0, $fe
; c818b

Functionc818b: ; c818b (32:418b)
	call Functionc9059
	jr nz, .asm_c8195
	ld de, Unknown_c819f
	jr .asm_c8198
.asm_c8195
	ld de, Unknown_c81a2
.asm_c8198
	call Functionc8d57
	ld [wcfc8], a
	ret
; c819f (32:419f)

Unknown_c819f:
	db $e4, $d8, $fe
; c81a2

Unknown_c81a2:
	db $f0, $cc, $fe
; c81a5

Functionc81a5: ; c81a5 (32:41a5)
	ld de, Unknown_c81af
	call Functionc8d57
	ld [wcfc7], a
	ret
; c81af (32:41af)

Unknown_c81af:
	db $1b, $63, $87, $fe
; c81b3

Functionc81b3: ; c81b3 (32:41b3)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c81b6: ; c81b6 (32:41b6)
	dw Functionc81c0
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc81e3


Functionc81c0: ; c81c0 (32:41c0)
	call Functionc80e5
	push bc
	call Functionc9038
	jr nz, .asm_c81d1
	hlcoord 12, 0
	ld bc, $707
	jr .asm_c81d7
.asm_c81d1
	hlcoord 2, 6
	ld bc, $606
.asm_c81d7
	call ClearBox
	pop bc
	xor a
	ld [hBGMapThird], a ; $ff00+$d5
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	ret

Functionc81e3: ; c81e3 (32:41e3)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call EndBattleBGEffect
	ret

Functionc81ea: ; c81ea (32:41ea)
	call Functionc9042
	jr z, .asm_c81f3
	call EndBattleBGEffect
	ret
.asm_c81f3
	call Functionc9038
	jr nz, .asm_c81fd
	ld de, Unknown_c8210
	jr .asm_c8200
.asm_c81fd
	ld de, Unknown_c820c
.asm_c8200
	ld a, e
	ld [BattleAnimTemps + 1], a
	ld a, d
	ld [BattleAnimTemps + 2], a
	call Functionc83ed
	ret
; c820c (32:420c)

Unknown_c820c:
	db $00, $31, $00
	db $ff
; c8210

Unknown_c8210:
	db $03, $00, $03
	db $ff
; c8214

Functionc8214: ; c8214 (32:4214)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8217: ; c8217 (32:4217)
	dw Functionc8223
	dw Functionc825a
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc827a


Functionc8223: ; c8223 (32:4223)
	call Functionc9042
	jr z, .asm_c8230
	ld hl, w5_d40e
	inc [hl]
	call EndBattleBGEffect
	ret
.asm_c8230
	call Functionc80e5
	push bc
	call Functionc9038
	jr nz, .asm_c8242
	ld a, $b8
	ld [BattleAnimTemps], a
	ld a, $84
	jr .asm_c8249
.asm_c8242
	ld a, $b9
	ld [BattleAnimTemps], a
	ld a, $30
.asm_c8249
	ld [BattleAnimTemps + 1], a
	ld a, $40
	ld [BattleAnimTemps + 2], a
	xor a
	ld [BattleAnimTemps + 3], a
	call Functionc82ee
	pop bc
	ret

Functionc825a: ; c825a (32:425a)
	call Functionc80e5
	push bc
	call Functionc9038
	jr nz, .asm_c826b
	hlcoord 12, 6
	ld bc, $107
	jr .asm_c8271
.asm_c826b
	hlcoord 2, 6
	ld bc, $106
.asm_c8271
	call ClearBox
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	pop bc
	ret

Functionc827a: ; c827a (32:427a)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call EndBattleBGEffect
	ret

Functionc8281: ; c8281 (32:4281)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8284: ; c8284 (32:4284)
	dw Functionc8290
	dw Functionc82c7
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc82e7


Functionc8290: ; c8290 (32:4290)
	call Functionc9042
	jr z, .asm_c829d
	ld hl, w5_d40e
	inc [hl]
	call EndBattleBGEffect
	ret
.asm_c829d
	call Functionc80e5
	push bc
	call Functionc9038
	jr nz, .asm_c82af
	ld a, $ba
	ld [BattleAnimTemps], a
	ld a, $84
	jr .asm_c82b6
.asm_c82af
	ld a, $bb
	ld [BattleAnimTemps], a
	ld a, $30
.asm_c82b6
	ld [BattleAnimTemps + 1], a
	ld a, $40
	ld [BattleAnimTemps + 2], a
	xor a
	ld [BattleAnimTemps + 3], a
	call Functionc82ee
	pop bc
	ret

Functionc82c7: ; c82c7 (32:42c7)
	call Functionc80e5
	push bc
	call Functionc9038
	jr nz, .asm_c82d8
	hlcoord 12, 5
	ld bc, $207
	jr .asm_c82de
.asm_c82d8
	hlcoord 2, 6
	ld bc, $206
.asm_c82de
	call ClearBox
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	pop bc
	ret

Functionc82e7: ; c82e7 (32:42e7)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call EndBattleBGEffect
	ret

Functionc82ee: ; c82ee (32:42ee)
	callab Functioncc9a1
	ret

Functionc82f5: ; c82f5 (32:42f5)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c82f8: ; c82f8 (32:42f8)
	dw Functionc8302
	dw Functionc831d
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc8365


Functionc8302: ; c8302 (32:4302)
	call Functionc80e5
	call Functionc9038
	ld [hl], a
	ld hl, $2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_c8315
	ld a, $9
	jr .asm_c8317
.asm_c8315
	ld a, $8
.asm_c8317
	ld hl, $3
	add hl, bc
	ld [hl], a
	ret

Functionc831d: ; c831d (32:431d)
	ld hl, $2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_c833e
	hlcoord 0, 6
	ld de, $806
.asm_c832b
	push de
	push hl
.asm_c832d
	inc hl
	ld a, [hld]
	ld [hli], a
	dec d
	jr nz, .asm_c832d
	pop hl
	ld de, $14
	add hl, de
	pop de
	dec e
	jr nz, .asm_c832b
	jr .asm_c8355
.asm_c833e
	hlcoord 19, 0
	ld de, $807
.asm_c8344
	push de
	push hl
.asm_c8346
	dec hl
	ld a, [hli]
	ld [hld], a
	dec d
	jr nz, .asm_c8346
	pop hl
	ld de, $14
	add hl, de
	pop de
	dec e
	jr nz, .asm_c8344
.asm_c8355
	xor a
	ld [hBGMapThird], a ; $ff00+$d5
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	call Functionc80e5
	ld hl, $3
	add hl, bc
	dec [hl]
	ret

Functionc8365: ; c8365 (32:4365)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld hl, $3
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_c8377
	ld hl, $1
	add hl, bc
	ld [hl], $1
	ret
.asm_c8377
	call EndBattleBGEffect
	ret

Functionc837b: ; c837b (32:437b)
	call Functionc9038
	jr nz, .asm_c8385
	ld de, Unknown_c839e
	jr .asm_c8388
.asm_c8385
	ld de, Unknown_c8394
.asm_c8388
	ld a, e
	ld [BattleAnimTemps + 1], a
	ld a, d
	ld [BattleAnimTemps + 2], a
	call Functionc83ed
	ret
; c8394 (32:4394)

Unknown_c8394:
	db $02, $31, $02
	db $01, $31, $01
	db $00, $31, $00
	db $ff
; c839e

Unknown_c839e:
	db $05, $00, $05
	db $04, $00, $04
	db $03, $00, $03
	db $ff
; c83a8

Functionc83a8: ; c83a8 (32:43a8)
	call Functionc9038
	jr nz, .asm_c83b2
	ld de, Unknown_c83d7
	jr .asm_c83b5
.asm_c83b2
	ld de, Unknown_c83c1
.asm_c83b5
	ld a, e
	ld [BattleAnimTemps + 1], a
	ld a, d
	ld [BattleAnimTemps + 2], a
	call Functionc83ed
	ret
; c83c1 (32:43c1)

Unknown_c83c1:
	db $00, $31, $00
	db $fe, $66, $00
	db $01, $31, $01
	db $fe, $44, $01
	db $02, $31, $02
	db $fe, $22, $02
	db $fd, $00, $00
	db $ff
; c83d7

Unknown_c83d7:
	db $03, $00, $03
	db $fe, $77, $03
	db $04, $00, $04
	db $fe, $55, $04
	db $05, $00, $05
	db $fe, $33, $05
	db $fd, $00, $00
	db $ff
; c83ed

Functionc83ed: ; c83ed (32:43ed)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c83f0: ; c83f0 (32:43f0)
	dw Functionc83fa
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc842a
	dw Functionc8434


Functionc83fa: ; c83fa (32:43fa)
	ld hl, $3
	add hl, bc
	ld e, [hl]
	ld d, $0
	inc [hl]
	ld a, [BattleAnimTemps + 1]
	ld l, a
	ld a, [BattleAnimTemps + 2]
	ld h, a
rept 3
	add hl, de
endr
	ld a, [hl]
	cp $ff
	jr z, Functionc8434
	cp $fe
	jr z, .asm_c8425
	cp $fd
	jr z, .asm_c841d
	call Functionc8458
.asm_c841d
	call Functionc80e5
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	ret
.asm_c8425
	call Functionc843b
	jr Functionc83fa

Functionc842a: ; c842a (32:442a)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld hl, $1
	add hl, bc
	ld [hl], $0
	ret

Functionc8434: ; c8434 (32:4434)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call EndBattleBGEffect
	ret

Functionc843b: ; c843b (32:443b)
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
	ld e, [hl]
	ld d, 0
	ld hl, Unknown_c849c
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ClearBox
	pop bc
	ret

Functionc8458: ; c8458 (32:4458)
	push bc
	push hl
	ld e, [hl]
	ld d, 0
	ld hl, Unknown_c84a8
rept 3
	add hl, de
endr
	ld a, [hli]
	ld b, a
	and $f
	ld c, a
	ld a, b
	swap a
	and $f
	ld b, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	inc hl
	ld a, [hli]
	ld [BattleAnimTemps], a
	push de
	ld e, [hl]
	ld d, 0
	ld hl, Unknown_c849c
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
.asm_c8484
	push bc
	push hl
	ld a, [BattleAnimTemps]
	ld b, a
.asm_c848a
	ld a, [de]
	add b
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_c848a
	pop hl
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_c8484
	pop bc
	ret
; c849c (32:449c)

Unknown_c849c: ; c849c
	dwcoord  2,  6
	dwcoord  3,  8
	dwcoord  4, 10
	dwcoord 12,  0
	dwcoord 13,  2
	dwcoord 14,  4
; c84a8

Unknown_c84a8: ; c84a8
	dbw $66, Unknown_c84ba
	dbw $44, Unknown_c84de
	dbw $22, Unknown_c84ee
	dbw $77, Unknown_c84f2
	dbw $55, Unknown_c8523
	dbw $33, Unknown_c853c
; c84ba

Unknown_c84ba: ; c84ba
	db $00, $06, $0c, $12, $18, $1e
	db $01, $07, $0d, $13, $19, $1f
	db $02, $08, $0e, $14, $1a, $20
	db $03, $09, $0f, $15, $1b, $21
	db $04, $0a, $10, $16, $1c, $22
	db $05, $0b, $11, $17, $1d, $23
; c84de

Unknown_c84de: ; c84de
	db $00, $0c, $12, $1e
	db $02, $0e, $14, $20
	db $03, $0f, $15, $21
	db $05, $11, $17, $23
; c84ee

Unknown_c84ee: ; c84ee
	db $00, $1e
	db $05, $23
; c84f2

Unknown_c84f2: ; c84f2
	db $00, $07, $0e, $15, $1c, $23, $2a
	db $01, $08, $0f, $16, $1d, $24, $2b
	db $02, $09, $10, $17, $1e, $25, $2c
	db $03, $0a, $11, $18, $1f, $26, $2d
	db $04, $0b, $12, $19, $20, $27, $2e
	db $05, $0c, $13, $1a, $21, $28, $2f
	db $06, $0d, $14, $1b, $22, $29, $30
; c8523

Unknown_c8523: ; c8523
	db $00, $07, $15, $23, $2a
	db $01, $08, $16, $24, $2b
	db $03, $0a, $18, $26, $2d
	db $05, $0c, $1a, $28, $2f
	db $06, $0d, $1b, $29, $30
; c853c

Unknown_c853c: ; c853c
	db $00, $15, $2a
	db $03, $18, $2d
	db $06, $1b, $30
; c8545

Functionc8545: ; c8545 (32:4545)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8548: ; c8548 (32:4548)
	dw Functionc854e
	dw Functionc8557
	dw Functionc8561


Functionc854e: ; c854e (32:454e)
	call Functionc80e5
	ld de, $202
	call Functionc8f69

Functionc8557: ; c8557 (32:4557)
	ld a, [hLCDStatCustom] ; $ff00+$c6
	and a
	ret z
	push bc
	call Functionc8565
	pop bc
	ret

Functionc8561: ; c8561 (32:4561)
	call Functionc8f0a
	ret

Functionc8565: ; c8565 (32:4565)
	ld hl, w5_d422
	ld de, w5_d422 + 1
	ld c, $3f
	ld a, [hl]
	push af
.asm_c856f
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_c856f
	pop af
	ld [hl], a
	ld de, LYOverridesBackup
	ld hl, w5_d422
	ld bc, $0
.asm_c8580
	ld a, [$ffc7]
	cp e
	jr nc, .asm_c858b
	push hl
	add hl, bc
	ld a, [hl]
	pop hl
	jr .asm_c858c
.asm_c858b
	xor a
.asm_c858c
	ld [de], a
	ld a, c
	inc a
	and $3f
	ld c, a
	inc de
	ld a, e
	cp $5f
	jr c, .asm_c8580
	ret

Functionc8599: ; c8599 (32:4599)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c859c: ; c859c (32:459c)
	dw Functionc85a2
	dw Functionc85ba
	dw Functionc85be


Functionc85a2: ; c85a2 (32:45a2)
	call Functionc80e5
	call Functionc8eca
	ld a, $42
	ld [hLCDStatCustom], a ; $ff00+$c6
	xor a
	ld [$ffc7], a
	ld a, $5e
	ld [$ffc8], a
	ld de, $202
	call Functionc8f2e
	ret

Functionc85ba: ; c85ba (32:45ba)
	call Functionc8fef
	ret

Functionc85be: ; c85be (32:45be)
	call Functionc8f0a
	ret

Functionc85c2: ; c85c2 (32:45c2)
	call Functionc8eca
	ld a, $42
	call Functionc8ede
	call EndBattleBGEffect
	ret

Functionc85ce: ; c85ce (32:45ce)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	ld e, a
	add $4
	ld [hl], a
	ld hl, $2
	add hl, bc
	ld a, [hl]
	and $f0
	swap a
	xor $ff
	add $4
	ld d, a
	ld hl, $1
	add hl, bc
	ld a, [hl]
	ld [BattleAnimTemps], a
	ld hl, $2
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_c85fc
rept 2
	inc [hl]
endr
	call Functionc8f9a
	ret
.asm_c85fc
	call Functionc8eca
	call EndBattleBGEffect
	ret

Functionc8603: ; c8603 (32:4603)
	call Functionc8f0a
	ret

Functionc8607: ; c8607 (32:4607)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c860a: ; c860a (32:460a)
	dw Functionc8610
	dw Functionc862e
	dw Functionc863b


Functionc8610: ; c8610 (32:4610)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	ld [hLCDStatCustom], a ; $ff00+$c6
	xor a
	ld [$ffc7], a
	ld a, $5f
	ld [$ffc8], a
	ld de, $605
	call Functionc8f2e
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ret

Functionc862e: ; c862e (32:462e)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $3
	ret nz
	call Functionc8fef
	ret

Functionc863b: ; c863b (32:463b)
	call Functionc8f0a
	ret

Functionc863f: ; c863f (32:463f)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8642: ; c8642 (32:4642)
	dw Functionc8648
	dw Functionc865a
	dw Functionc865e


Functionc8648: ; c8648 (32:4648)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld de, $605
	call Functionc8f2e
	ret

Functionc865a: ; c865a (32:465a)
	call Functionc8fef
	ret

Functionc865e: ; c865e (32:465e)
	call Functionc8f0a
	ret

Functionc8662: ; c8662 (32:4662)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8665: ; c8665 (32:4665)
	dw Functionc866b
	dw Functionc8681
	dw Functionc8685


Functionc866b: ; c866b (32:466b)
	call Functionc80e5
	call Functionc8eca
	ld a, $42
	call Functionc8ede
	ld hl, $3
	add hl, bc
	ld e, [hl]
	ld d, $2
	call Functionc8f2e
	ret

Functionc8681: ; c8681 (32:4681)
	call Functionc8fef
	ret

Functionc8685: ; c8685 (32:4685)
	call Functionc8f0a
	ret

Functionc8689: ; c8689 (32:4689)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c868c: ; c868c (32:468c)
	dw Functionc8698
	dw Functionc86af
	dw Functionc86cf
	dw Functionc86bd
	dw Functionc86e9
	dw Functionc8705


Functionc8698: ; c8698 (32:4698)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	ld hl, $2
	add hl, bc
	ld [hl], $0
	ret

Functionc86af: ; c86af (32:46af)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	cp $10
	jr nc, asm_c86cb
	inc [hl]
	call Functionc86ea
	ret

Functionc86bd: ; c86bd (32:46bd)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, asm_c86cb
	dec [hl]
	call Functionc86ea
	ret
asm_c86cb: ; c86cb (32:46cb)
	call Functionc80e5
	ret

Functionc86cf: ; c86cf (32:46cf)
	ld hl, $2
	add hl, bc
	ld a, [hl]
	ld d, $2
	call Functionc905d
	ld hl, $3
	add hl, bc
	add [hl]
	call Functionc86ea
	ld hl, $2
	add hl, bc
	ld a, [hl]
	add $4
	ld [hl], a

Functionc86e9: ; c86e9 (32:46e9)
	ret

Functionc86ea: ; c86ea (32:46ea)
	ld e, a
	xor $ff
	inc a
	ld d, a
	ld h, $d2
	ld a, [$ffc7]
	ld l, a
	ld a, [$ffc8]
	sub l
	srl a
	push af
.asm_c86fa
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec a
	jr nz, .asm_c86fa
	pop af
	ret nc
	ld [hl], e
	ret

Functionc8705: ; c8705 (32:4705)
	call Functionc8f0a
	ret

Functionc8709: ; c8709 (32:4709)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c870c: ; c870c (32:470c)
	dw Functionc8712
	dw Functionc8732
	dw Functionc875d


Functionc8712: ; c8712 (32:4712)
	call Functionc80e5
	call Functionc8eca
	ld a, $42
	call Functionc8ede
	ld hl, $3
	add hl, bc
	ld e, [hl]
	ld d, $2
	call Functionc8f2e
	ld h, $d2
	ld a, [$ffc8]
	ld l, a
	ld [hl], $0
	dec l
	ld [hl], $0
	ret

Functionc8732: ; c8732 (32:4732)
	ld a, [$ffc8]
	ld l, a
	ld h, $d2
	ld e, l
	ld d, h
	dec de
.asm_c873a
	ld a, [de]
	dec de
	ld [hld], a
	ld a, [$ffc7]
	cp l
	jr nz, .asm_c873a
	ld [hl], $90
	ld a, [$ffc8]
	ld l, a
	ld a, [hl]
	cp $1
	jr c, .asm_c8752
	cp $90
	jr z, .asm_c8752
	ld [hl], $0
.asm_c8752
	dec l
	ld a, [hl]
	cp $2
	ret c
	cp $90
	ret z
	ld [hl], $0
	ret

Functionc875d: ; c875d (32:475d)
	call Functionc8f0a
	ret

Functionc8761: ; c8761 (32:4761)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8764: ; c8764 (32:4764)
	dw Functionc876a
	dw Functionc8781
	dw Functionc87a3


Functionc876a: ; c876a (32:476a)
	call Functionc80e5
	call Functionc8eca
	ld a, $42
	call Functionc8ede
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	ld hl, $2
	add hl, bc
	ld [hl], $1
	ret

Functionc8781: ; c8781 (32:4781)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, $2
	add hl, bc
	ld a, [hl]
	cp d
	ret nc
	call Functionc901b
	ld hl, $3
	add hl, bc
	ld a, [hl]
	rlca
	rlca
	and $3
	ld hl, $2
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Functionc87a3: ; c87a3 (32:47a3)
	call Functionc8f0a
	ret

Functionc87a7: ; c87a7 (32:47a7)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c87aa: ; c87aa (32:47aa)
	dw Functionc87b2
	dw Functionc87cf
	dw Functionc87de
	dw Functionc8801


Functionc87b2: ; c87b2 (32:47b2)
	call Functionc80e5
	call Functionc8eca
	ld a, $42
	call Functionc8ede
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	ld hl, $2
	add hl, bc
	ld [hl], $2
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ret

Functionc87cf: ; c87cf (32:47cf)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_c87d9
	dec [hl]
	ret
.asm_c87d9
	ld [hl], $10
	call Functionc80e5

Functionc87de: ; c87de (32:47de)
	ld a, [$ffc7]
	ld l, a
	ld a, [$ffc8]
	sub l
	dec a
	ld hl, $2
	add hl, bc
	cp [hl]
	ret c
	ld a, [hl]
	push af
	and $7
	jr nz, .asm_c87f6
	ld hl, $1
	add hl, bc
	dec [hl]
.asm_c87f6
	pop af
	call Functionc901b
	ld hl, $2
	add hl, bc
rept 2
	inc [hl]
endr
	ret

Functionc8801: ; c8801 (32:4801)
	call Functionc8f0a
	ret

Functionc8805: ; c8805 (32:4805)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8808: ; c8808 (32:4808)
	dw Functionc8810
	dw Functionc8869
	dw Functionc8888
	dw Functionc8833


Functionc8810: ; c8810 (32:4810)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	ld hl, $3
	add hl, bc
	ld [hl], $0
	call Functionc9038
	jr nz, .asm_c882f
	ld a, $2
	jr .asm_c8831
.asm_c882f
	ld a, $fe
.asm_c8831
	ld [hl], a
	ret

Functionc8833: ; c8833 (32:4833)
	call Functionc8f0a
	ret

Functionc8837: ; c8837 (32:4837)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c883a: ; c883a (32:483a)
	dw Functionc8842
	dw Functionc8869
	dw Functionc8888
	dw Functionc8865


Functionc8842: ; c8842 (32:4842)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ef4
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	ld hl, $3
	add hl, bc
	ld [hl], $0
	call Functionc9038
	jr nz, .asm_c8861
	ld a, $2
	jr .asm_c8863
.asm_c8861
	ld a, $fe
.asm_c8863
	ld [hl], a
	ret

Functionc8865: ; c8865 (32:4865)
	call Functionc8f0a
	ret

Functionc8869: ; c8869 (32:4869)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	cp $f8
	jr z, .asm_c8876
	cp $8
	jr nz, .asm_c8879
.asm_c8876
	call Functionc80e5
.asm_c8879
	call Functionc88a5
	ld hl, $2
	add hl, bc
	ld a, [hl]
	ld hl, $3
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Functionc8888: ; c8888 (32:4888)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_c8893
	call Functionc80e5
.asm_c8893
	call Functionc88a5
	ld hl, $2
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld hl, $3
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Functionc88a5: ; c88a5 (32:48a5)
	push af
	ld a, [FXAnimIDHi] ; FXAnimIDHi
	or a
	jr nz, .asm_c88b3
	ld a, [FXAnimIDLo] ; FXAnimID
	cp ROLLOUT
	jr z, .asm_c88b7
.asm_c88b3
	pop af
	jp Functionc900b
.asm_c88b7
	ld a, [$ffc7]
	ld d, a
	ld a, [$ffc8]
	sub d
	ld d, a
	ld h, LYOverridesBackup / $100
	ld a, [hSCY] ; $ff00+$d0
	or a
	jr nz, .asm_c88d0
	ld a, [$ffc7]
	or a
	jr z, .asm_c88d6
	dec a
	ld l, a
	ld [hl], $0
	jr .asm_c88d6
.asm_c88d0
	ld a, [$ffc8]
	dec a
	ld l, a
	ld [hl], $0
.asm_c88d6
	ld a, [hSCY] ; $ff00+$d0
	ld l, a
	ld a, [$ffc7]
	sub l
	jr nc, .asm_c88e0
	xor a
	dec d
.asm_c88e0
	ld l, a
	pop af
.asm_c88e2
	ld [hli], a
	dec d
	jr nz, .asm_c88e2
	ret

Functionc88e7: ; c88e7 (32:48e7)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c88ea: ; c88ea (32:48ea)
	dw Functionc88f6
	dw Functionc8869
	dw Functionc8888
	dw Functionc88f2


Functionc88f2: ; c88f2 (32:48f2)
	call Functionc8f0a
	ret

Functionc88f6: ; c88f6 (32:48f6)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	ld hl, $3
	add hl, bc
	ld [hl], $0
	call Functionc9038
	jr nz, .asm_c8915
	ld a, $fe
	jr .asm_c8917
.asm_c8915
	ld a, $2
.asm_c8917
	ld [hl], a
	ret

Functionc8919: ; c8919 (32:4919)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c891c: ; c891c (32:491c)
	dw Functionc88f6
	dw Functionc8869
	dw Functionc8929
	dw Functionc8888
	dw Functionc8926


Functionc8926: ; c8926 (32:4926)
	call Functionc8f0a

Functionc8929: ; c8929 (32:4929)
	ret

Functionc892a: ; c892a (32:492a)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c892d: ; c892d (32:492d)
	dw Functionc8933
	dw Functionc894a
	dw Functionc8960


Functionc8933: ; c8933 (32:4933)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ret

Functionc894a: ; c894a (32:494a)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	ld d, $8
	call Functionc905d
	call Functionc900b
	ld hl, $3
	add hl, bc
	ld a, [hl]
	add $4
	ld [hl], a
	ret

Functionc8960: ; c8960 (32:4960)
	call Functionc8f0a
	ret

Functionc8964: ; c8964 (32:4964)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8967: ; c8967 (32:4967)
	dw Functionc896d
	dw Functionc8985
	dw Functionc89b1


Functionc896d: ; c896d (32:496d)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	xor a
	ld hl, $2
	add hl, bc
	ld [hli], a
	ld [hl], a
	ret

Functionc8985: ; c8985 (32:4985)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	ld d, $6
	call Functionc905d
	push af
	ld hl, $2
	add hl, bc
	ld a, [hl]
	ld d, $2
	call Functionc905d
	ld e, a
	pop af
	add e
	call Functionc900b
	ld hl, $2
	add hl, bc
	ld a, [hl]
	add $8
	ld [hl], a
	ld hl, $3
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ret

Functionc89b1: ; c89b1 (32:49b1)
	call Functionc8f0a
	ret

Functionc89b5: ; c89b5 (32:49b5)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c89b8: ; c89b8 (32:49b8)
	dw Functionc89be
	dw Functionc89ca
	dw Functionc89da


Functionc89be: ; c89be (32:49be)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ret

Functionc89ca: ; c89ca (32:49ca)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	cp $20
	ret nc
	inc [hl]
	ld d, a
	ld e, $4
	call Functionc8f2e
	ret

Functionc89da: ; c89da (32:49da)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_c89ea
	dec [hl]
	ld d, a
	ld e, $4
	call Functionc8f2e
	ret
.asm_c89ea
	call Functionc8f0a
	ret

Functionc89ee: ; c89ee (32:49ee)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c89f1: ; c89f1 (32:49f1)
	dw Functionc89f7
	dw Functionc8a14
	dw Functionc8a36


Functionc89f7: ; c89f7 (32:49f7)
	call Functionc80e5
	call Functionc8eca
	ld a, $42
	call Functionc8ef4
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	ld hl, $2
	add hl, bc
	ld [hl], $1
	ld hl, $3
	add hl, bc
	ld [hl], $20
	ret

Functionc8a14: ; c8a14 (32:4a14)
	ld hl, $2
	add hl, bc
	ld a, [hl]
	cp $38
	ret nc
	push af
	ld hl, $3
	add hl, bc
	ld a, [hl]
	ld d, $10
	call Functionc9066
	add $10
	ld d, a
	pop af
	add d
	call Functionc901b
	ld hl, $3
	add hl, bc
rept 2
	inc [hl]
endr
	ret

Functionc8a36: ; c8a36 (32:4a36)
	call Functionc8f0a
	ret

Functionc8a3a: ; c8a3a (32:4a3a)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8a3d: ; c8a3d (32:4a3d)
	dw Functionc8a49
	dw Functionc8a6f
	dw Functionc8a70
	dw Functionc8a88
	dw Functionc8a6f
	dw Functionc8aac


Functionc8a49: ; c8a49 (32:4a49)
	call Functionc80e5
	ld a, $e4
	call Functionc8ecb
	ld a, $47
	call Functionc8ede
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	ld a, [$ffc7]
	ld l, a
	ld h, $d2
.asm_c8a60
	ld a, [$ffc8]
	cp l
	jr z, .asm_c8a69
	xor a
	ld [hli], a
	jr .asm_c8a60
.asm_c8a69
	ld hl, $3
	add hl, bc
	ld [hl], $0

Functionc8a6f: ; c8a6f (32:4a6f)
	ret

Functionc8a70: ; c8a70 (32:4a70)
	call Functionc8ab0
	jr nc, .asm_c8a79
	call Functionc8a9a
	ret
.asm_c8a79
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ld a, [$ffc7]
	inc a
	ld [$ffc7], a
	call Functionc80e5
	ret

Functionc8a88: ; c8a88 (32:4a88)
	call Functionc8ab0
	jr nc, .asm_c8a96
	call Functionc8a9a
	ld a, [$ffc8]
	dec a
	ld l, a
	ld [hl], e
	ret
.asm_c8a96
	call Functionc80e5
	ret

Functionc8a9a: ; c8a9a (32:4a9a)
	ld e, a
	ld a, [$ffc7]
	ld l, a
	ld a, [$ffc8]
	sub l
	srl a
	ld h, $d2
.asm_c8aa5
	ld [hl], e
rept 2
	inc hl
endr
	dec a
	jr nz, .asm_c8aa5
	ret

Functionc8aac: ; c8aac (32:4aac)
	call Functionc8f19
	ret

Functionc8ab0: ; c8ab0 (32:4ab0)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	inc [hl]
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, Unknown_c8ac7
	add hl, de
	ld a, [hl]
	cp $ff
	ret
; c8ac7 (32:4ac7)

Unknown_c8ac7:
	db $00, $40, $90, $e4, $ff
; c8acc

Functionc8acc: ; c8acc (32:4acc)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8acf: ; c8acf (32:4acf)
	dw Functionc8ad3
	dw Functionc8ae5


Functionc8ad3: ; c8ad3 (32:4ad3)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld hl, $2
	add hl, bc
	ld [hl], $40
	ret

Functionc8ae5: ; c8ae5 (32:4ae5)
	ld hl, $2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_c8afc
	dec [hl]
	srl a
	srl a
	srl a
	and $f
	ld d, a
	ld e, a
	call Functionc8f2e
	ret
.asm_c8afc
	call Functionc8f0a
	ret

Functionc8b00: ; c8b00 (32:4b00)
	ld a, [hCGB] ; $ff00+$e6
	and a
	jr nz, asm_c8b7a
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8b08: ; c8b08 (32:4b08)
	dw Functionc8b0e
	dw Functionc8b22
	dw Functionc8b60


Functionc8b0e: ; c8b0e (32:4b0e)
	call Functionc80e5
	ld a, $e4
	call Functionc8ecb
	ld a, $47
	ld [hLCDStatCustom], a ; $ff00+$c6
	xor a
	ld [$ffc7], a
	ld a, $60
	ld [$ffc8], a
	ret

Functionc8b22: ; c8b22 (32:4b22)
	ld hl, $3
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
	call Functionc9038
	jr nz, .asm_c8b4d
	ld hl, Unknown_c8bd8
	add hl, de
	ld a, [hli]
	ld [wcfc9], a
	ld d, a
	ld e, [hl]
	ld bc, $2f30
	jr .asm_c8b5b
.asm_c8b4d
	ld hl, Unknown_c8be0
	add hl, de
	ld d, [hl]
	inc hl
	ld a, [hl]
	ld [wcfc9], a
	ld e, a
	ld bc, $3728
.asm_c8b5b
	call Functionc8b6c
	pop bc
	ret

Functionc8b60: ; c8b60 (32:4b60)
	call Functionc8f19
	ld a, $e4
	ld [wcfc7], a
	ld [wcfc9], a
	ret

Functionc8b6c: ; c8b6c (32:4b6c)
	ld hl, LYOverridesBackup
.asm_c8b6f
	ld [hl], d
	inc hl
	dec b
	jr nz, .asm_c8b6f
.asm_c8b74
	ld [hl], e
	inc hl
	dec c
	jr nz, .asm_c8b74
	ret
asm_c8b7a: ; c8b7a (32:4b7a)
	ld de, Jumptable_c8b81
	call Functionc80ca
	jp [hl]
; c8b81 (32:4b81)

Jumptable_c8b81: ; c8b81
	dw Functionc8b87
	dw Functionc8b91
	dw Functionc8bca
; c8b87

Functionc8b87: ; c8b87
	call Functionc80e5
	ld hl, $0003
	add hl, bc
	ld [hl], $0
	ret
; c8b91

Functionc8b91: ; c8b91
	ld hl, $0003
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
	call Functionc9038
	jr nz, .asm_c8bbb
	ld hl, Unknown_c8bd8
	add hl, de
	ld a, [hli]
	push hl
	call Functionc8e7f
	pop hl
	ld a, [hl]
	call Functionc8e52
	ret

.asm_c8bbb
	ld hl, Unknown_c8bd8
	add hl, de
	ld a, [hli]
	push hl
	call Functionc8e52
	pop hl
	ld a, [hl]
	call Functionc8e7f
	ret
; c8bca

Functionc8bca: ; c8bca
	ld a, $e4
	call Functionc8e52
	ld a, $e4
	call Functionc8e7f
	call EndBattleBGEffect
	ret
; c8bd8

Unknown_c8bd8: ; c8bd8
	db $e4, $e4
	db $f8, $90
	db $fc, $40
	db $f8, $90
; c8be0

Unknown_c8be0: ; c8be0
	db $e4, $e4
	db $90, $f8
	db $40, $fc
	db $90, $f8
; c8be8

Functionc8be8: ; c8be8 (32:4be8)
	ld de, Unknown_c8bef
	call Functionc8d77
	ret
; c8bef (32:4bef)

Unknown_c8bef: ; c8bef
	db $e4, $6c, $fe
; c8bf2

Functionc8bf2: ; c8bf2 (32:4bf2)
	ld de, Unknown_c8bf9
	call Functionc8d77
	ret
; c8bf9 (32:4bf9)

Unknown_c8bf9: ; c8bf9
	db $e4, $90, $40, $ff
; c8bfd

Functionc8bfd: ; c8bfd (32:4bfd)
	ld de, Unknown_c8c04
	call Functionc8d77
	ret
; c8c04 (32:4c04)

Unknown_c8c04: ; c8c04
	db $e4, $f8, $fc, $ff
; c8c08

Functionc8c08: ; c8c08 (32:4c08)
	ld de, Unknown_c8c0f
	call Functionc8d77
	ret
; c8c0f (32:4c0f)

Unknown_c8c0f: ; c8c0f
	db $e4, $90, $40, $90, $fe
; c8c14

Functionc8c14: ; c8c14 (32:4c14)
	ld de, Unknown_c8c1b
	call Functionc8d77
	ret
; c8c1b (32:4c1b)

Unknown_c8c1b: ; c8c1b
	db $e4, $f8, $fc, $f8, $fe
; c8c20

Functionc8c20: ; c8c20 (32:4c20)
	ld de, Unknown_c8c27
	call Functionc8d77
	ret
; c8c27 (32:4c27)

Unknown_c8c27: ; c8c27
	db $e4, $f8, $fc, $f8, $e4, $90, $40, $90, $fe
; c8c30

Functionc8c30: ; c8c30 (32:4c30)
	ld de, Unknown_c8c37
	call Functionc8d77
	ret
; c8c37 (32:4c37)

Unknown_c8c37:
	db $e4, $fc, $e4, $00, $fe
; c8c3c

Functionc8c3c: ; c8c3c (32:4c3c)
	ld de, Unknown_c8c43
	call Functionc8d77
	ret
; c8c43 (32:4c43)

Unknown_c8c43:
	db $e4, $90, $40, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40, $90, $e4, $ff
; c8c55

Functionc8c55: ; c8c55 (32:4c55)
	ld de, Unknown_c8c5c
	call Functionc8d77
	ret
; c8c5c (32:4c5c)

Unknown_c8c5c:
	db $00, $40, $90, $e4, $ff
; c8c61

Functionc8c61: ; c8c61 (32:4c61)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8c64: ; c8c64 (32:4c64)
	dw Functionc8c68
	dw Functionc8c85


Functionc8c68: ; c8c68 (32:4c68)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	ld hl, $2
	add hl, bc
	ld [hl], $1
	ld hl, $3
	add hl, bc
	ld [hl], $20
	ret

Functionc8c85: ; c8c85 (32:4c85)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_c8c9e
	dec [hl]
	and $1
	ret nz
	ld hl, $2
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	call Functionc900b
	ret
.asm_c8c9e
	call Functionc8f0a
	ret

Functionc8ca2: ; c8ca2 (32:4ca2)
	call Functionc80d7 ;  ;  ; call does not return

Jumptable_c8ca5: ; c8ca5 (32:4ca5)
	dw Functionc8cab
	dw Functionc8cc3
	dw Functionc8cdd


Functionc8cab: ; c8cab (32:4cab)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	ld [hLCDStatCustom], a ; $ff00+$c6
	xor a
	ld [$ffc7], a
	ld a, $37
	ld [$ffc8], a
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ret

Functionc8cc3: ; c8cc3 (32:4cc3)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, Functionc8cdd
	ld d, $6
	call Functionc905d
	call Functionc900b
	ld hl, $3
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ret

Functionc8cdd: ; c8cdd (32:4cdd)
	call Functionc8f0a
	ret

Functionc8ce1: ; c8ce1 (32:4ce1)
	call Functionc8d0b
	jr c, .asm_c8cea
	bit 7, a
	jr z, .asm_c8ceb
.asm_c8cea
	xor a
.asm_c8ceb
	push af
	call DelayFrame
	pop af
	ld [hSCY], a ; $ff00+$d0
	xor $ff
	inc a
	ld [OTPartyMon3SpclAtk], a
	ret

Functionc8cf9: ; c8cf9 (32:4cf9)
	call Functionc8d0b
	jr nc, .asm_c8cff
	xor a
.asm_c8cff
	ld [hSCX], a ; $ff00+$cf
	ret

Functionc8d02: ; c8d02 (32:4d02)
	call Functionc8d0b
	jr nc, .asm_c8d08
	xor a
.asm_c8d08
	ld [hSCY], a ; $ff00+$d0
	ret

Functionc8d0b: ; c8d0b (32:4d0b)
	ld hl, $1
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_c8d18
	call EndBattleBGEffect
	scf
	ret
.asm_c8d18
	dec [hl]
	ld hl, $3
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .asm_c8d2a
	dec [hl]
	ld hl, $2
	add hl, bc
	ld a, [hl]
	and a
	ret
.asm_c8d2a
	ld a, [hl]
	swap a
	or [hl]
	ld [hl], a
	ld hl, $2
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	and a
	ret

Functionc8d3a: ; c8d3a (32:4d3a)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .asm_c8d53
	ld d, $6
	call Functionc905d
	ld [hSCX], a ; $ff00+$cf
	ld hl, $3
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ret
.asm_c8d53
	xor a
	ld [hSCX], a ; $ff00+$cf
	ret

Functionc8d57: ; c8d57 (32:4d57)
	ld hl, $1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_c8d69

	dec [hl]
	ld hl, $3
	add hl, bc
	ld a, [hl]
	call Functionc8eb2
	ret

.asm_c8d69
	ld hl, $2
	add hl, bc
	ld a, [hl]
	ld hl, $1
	add hl, bc
	ld [hl], a
	call Functionc8eac
	ret

Functionc8d77: ; c8d77 (32:4d77)
	ld a, [hCGB] ; $ff00+$e6
	and a
	jr nz, asm_c8dd4
	push de
	ld de, Jumptable_c8d85
	call Functionc80ca
	pop de
	jp [hl]

Jumptable_c8d85: ; c8d85 (32:4d85)
	dw Functionc8d8b
	dw Functionc8daa
	dw Functionc8dc9


Functionc8d8b: ; c8d8b (32:4d8b)
	call Functionc80e5
	ld a, $e4
	call Functionc8ecb
	ld a, $47
	call Functionc8ede
	ld a, [$ffc8]
	inc a
	ld [$ffc8], a
	ld hl, $3
	add hl, bc
	ld a, [hl]
	ld [hl], $0
	ld hl, $2
	add hl, bc
	ld [hl], a
	ret

Functionc8daa: ; c8daa (32:4daa)
	ld hl, $2
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .asm_c8db5
	dec [hl]
	ret
.asm_c8db5
	ld a, [hl]
	swap a
	or [hl]
	ld [hl], a
	call Functionc8eac
	jr c, .asm_c8dc3
	call Functionc900b
	ret
.asm_c8dc3
	ld hl, $3
	add hl, bc
	dec [hl]
	ret

Functionc8dc9: ; c8dc9 (32:4dc9)
	call Functionc8f19
	ld a, $e4
	ld [rBGP], a ; $ff00+$47
	call EndBattleBGEffect
	ret
asm_c8dd4: ; c8dd4 (32:4dd4)
	push de
	ld de, Jumptable_c8ddd
	call Functionc80ca
	pop de
	jp [hl]

Jumptable_c8ddd: ; c8ddd (32:4ddd)
	dw Functionc8de7
	dw Functionc8e02
	dw Functionc8e21
	dw Functionc8e2a
	dw Functionc8e49


Functionc8de7: ; c8de7 (32:4de7)
	call Functionc9038
	jr nz, .asm_c8df2
	call Functionc80e5
	call Functionc80e5
.asm_c8df2
	call Functionc80e5
	ld hl, $3
	add hl, bc
	ld a, [hl]
	ld [hl], $0
	ld hl, $2
	add hl, bc
	ld [hl], a
	ret

Functionc8e02: ; c8e02 (32:4e02)
	ld hl, $2
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .asm_c8e0d
	dec [hl]
	ret
.asm_c8e0d
	ld a, [hl]
	swap a
	or [hl]
	ld [hl], a
	call Functionc8eac
	jr c, .asm_c8e1b
	call Functionc8e52
	ret
.asm_c8e1b
	ld hl, $3
	add hl, bc
	dec [hl]
	ret

Functionc8e21: ; c8e21 (32:4e21)
	ld a, $e4
	call Functionc8e52
	call EndBattleBGEffect
	ret

Functionc8e2a: ; c8e2a (32:4e2a)
	ld hl, $2
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .asm_c8e35
	dec [hl]
	ret
.asm_c8e35
	ld a, [hl]
	swap a
	or [hl]
	ld [hl], a
	call Functionc8eac
	jr c, .asm_c8e43
	call Functionc8e7f
	ret
.asm_c8e43
	ld hl, $3
	add hl, bc
	dec [hl]
	ret

Functionc8e49: ; c8e49 (32:4e49)
	ld a, $e4
	call Functionc8e7f
	call EndBattleBGEffect
	ret

Functionc8e52: ; c8e52 (32:4e52)
	ld h, a
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	ld a, h
	push bc
	push af
	ld hl, BGPals ; BGPals
	ld de, Unkn1Pals ; wd000
	ld b, a
	ld c, $1
	call CopyPals
	ld hl, OBPals + 8
	ld de, Unkn2Pals + 8
	pop af
	ld b, a
	ld c, $1
	call CopyPals
	pop bc
	pop af
	ld [rSVBK], a ; $ff00+$70
	ld a, $1
	ld [hCGBPalUpdate], a ; $ff00+$e5
	ret

Functionc8e7f: ; c8e7f (32:4e7f)
	ld h, a
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	ld a, h
	push bc
	push af
	ld hl, BGPals + 8
	ld de, Unkn1Pals + 8
	ld b, a
	ld c, $1
	call CopyPals
	ld hl, OBPals ; OBPals
	ld de, Unkn2Pals ; wd040
	pop af
	ld b, a
	ld c, $1
	call CopyPals
	pop bc
	pop af
	ld [rSVBK], a ; $ff00+$70
	ld a, $1
	ld [hCGBPalUpdate], a ; $ff00+$e5
	ret

Functionc8eac: ; c8eac (32:4eac)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	inc [hl]

Functionc8eb2: ; c8eb2 (32:4eb2)
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	cp $ff
	jr z, .asm_c8ec8
	cp $fe
	jr nz, .asm_c8ec6
	ld a, [de]
	ld hl, $3
	add hl, bc
	ld [hl], $0
.asm_c8ec6
	and a
	ret
.asm_c8ec8
	scf
	ret

Functionc8eca: ; c8eca (32:4eca)
	xor a

Functionc8ecb: ; c8ecb (32:4ecb)
	ld hl, LYOverrides ; wd100
	ld e, $99
.asm_c8ed0
	ld [hli], a
	dec e
	jr nz, .asm_c8ed0
	ld hl, LYOverridesBackup
	ld e, $91
.asm_c8ed9
	ld [hli], a
	dec e
	jr nz, .asm_c8ed9
	ret

Functionc8ede: ; c8ede (32:4ede)
	ld [hLCDStatCustom], a ; $ff00+$c6
	call Functionc9038
	jr nz, .asm_c8eea
	ld de, $36
	jr .asm_c8eed
.asm_c8eea
	ld de, $2f5e
.asm_c8eed
	ld a, d
	ld [$ffc7], a
	ld a, e
	ld [$ffc8], a
	ret

Functionc8ef4: ; c8ef4 (32:4ef4)
	ld [hLCDStatCustom], a ; $ff00+$c6
	call Functionc9038
	jr nz, .asm_c8f00
	ld de, $36
	jr .asm_c8f03
.asm_c8f00
	ld de, $2d5e
.asm_c8f03
	ld a, d
	ld [$ffc7], a
	ld a, e
	ld [$ffc8], a
	ret

Functionc8f0a: ; c8f0a (32:4f0a)
	xor a
	ld [$ffc7], a
	ld [$ffc8], a
	call Functionc8eca
	xor a
	ld [hLCDStatCustom], a ; $ff00+$c6
	call EndBattleBGEffect
	ret

Functionc8f19: ; c8f19 (32:4f19)
	xor a
	ld [hLCDStatCustom], a ; $ff00+$c6
	ld a, $e4
	ld [rBGP], a ; $ff00+$47
	ld [wcfc7], a
	ld [wcfc9], a
	ld [$ffc7], a
	ld [$ffc8], a
	call Functionc8eca
	ret

Functionc8f2e: ; c8f2e (32:4f2e)
	push bc
	xor a
	ld [BattleAnimTemps], a
	ld a, e
	ld [BattleAnimTemps + 1], a
	ld a, d
	ld [BattleAnimTemps + 2], a
	ld a, $80
	ld [BattleAnimTemps + 3], a
	ld bc, LYOverridesBackup
.asm_c8f43
	ld a, [$ffc7]
	cp c
	jr nc, .asm_c8f58
	ld a, [$ffc8]
	cp c
	jr c, .asm_c8f58
	ld a, [BattleAnimTemps + 2]
	ld d, a
	ld a, [BattleAnimTemps]
	call Functionc905d
	ld [bc], a
.asm_c8f58
	inc bc
	ld a, [BattleAnimTemps + 1]
	ld hl, BattleAnimTemps
	add [hl]
	ld [hl], a
	ld hl, BattleAnimTemps + 3
	dec [hl]
	jr nz, .asm_c8f43
	pop bc
	ret

Functionc8f69: ; c8f69 (32:4f69)
	push bc
	xor a
	ld [BattleAnimTemps], a
	ld a, e
	ld [BattleAnimTemps + 1], a
	ld a, d
	ld [BattleAnimTemps + 2], a
	ld a, $40
	ld [BattleAnimTemps + 3], a
	ld bc, w5_d422
.asm_c8f7e
	ld a, [BattleAnimTemps + 2]
	ld d, a
	ld a, [BattleAnimTemps]
	call Functionc905d
	ld [bc], a
	inc bc
	ld a, [BattleAnimTemps + 1]
	ld hl, BattleAnimTemps
	add [hl]
	ld [hl], a
	ld hl, BattleAnimTemps + 3
	dec [hl]
	jr nz, .asm_c8f7e
	pop bc
	ret

Functionc8f9a: ; c8f9a (32:4f9a)
	push bc
	ld [BattleAnimTemps + 3], a
	ld a, e
	ld [BattleAnimTemps + 1], a
	ld a, d
	ld [BattleAnimTemps + 2], a
	call Functionc8fe4
	ld hl, LYOverridesBackup
	add hl, de
	ld c, l
	ld b, h
.asm_c8faf
	ld a, [BattleAnimTemps + 3]
	and a
	jr z, .asm_c8fe1
	dec a
	ld [BattleAnimTemps + 3], a
	push af
	ld a, [BattleAnimTemps + 2]
	ld d, a
	ld a, [BattleAnimTemps + 1]
	push hl
	call Functionc905d
	ld e, a
	pop hl
	ld a, [$ffc8]
	cp c
	jr c, .asm_c8fcf
	ld a, e
	ld [bc], a
	inc bc
.asm_c8fcf
	ld a, [$ffc7]
	cp l
	jr nc, .asm_c8fd6
	ld [hl], e
	dec hl
.asm_c8fd6
	ld a, [BattleAnimTemps + 1]
	add $4
	ld [BattleAnimTemps + 1], a
	pop af
	jr .asm_c8faf
.asm_c8fe1
	pop bc
	and a
	ret

Functionc8fe4: ; c8fe4 (32:4fe4)
	ld a, [$ffc7]
	ld e, a
	ld a, [BattleAnimTemps]
	add e
	ld e, a
	ld d, $0
	ret

Functionc8fef: ; c8fef (32:4fef)
	push bc
	ld a, [$ffc7]
	ld l, a
	inc a
	ld e, a
	ld h, $d2
	ld d, h
	ld a, [$ffc8]
	sub l
	and a
	jr z, .asm_c9009
	ld c, a
	ld a, [hl]
	push af
.asm_c9001
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_c9001
	pop af
	ld [hl], a
.asm_c9009
	pop bc
	ret

Functionc900b: ; c900b (32:500b)
	push af
	ld h, $d2
	ld a, [$ffc7]
	ld l, a
	ld a, [$ffc8]
	sub l
	ld d, a
	pop af
.asm_c9016
	ld [hli], a
	dec d
	jr nz, .asm_c9016
	ret

Functionc901b: ; c901b (32:501b)
	push af
	ld e, a
	ld a, [$ffc7]
	ld l, a
	ld a, [$ffc8]
	sub l
	sub e
	ld d, a
	ld h, $d2
	ld a, [$ffc7]
	ld l, a
	ld a, $90
.asm_c902c
	ld [hli], a
	dec e
	jr nz, .asm_c902c
	pop af
	xor $ff
.asm_c9033
	ld [hli], a
	dec d
	jr nz, .asm_c9033
	ret

Functionc9038: ; c9038 (32:5038)
	ld hl, $2
	add hl, bc
	ld a, [hBattleTurn] ; $ff00+$e4
	and $1
	xor [hl]
	ret

Functionc9042: ; c9042 (32:5042)
	ld hl, $2
	add hl, bc
	ld a, [hBattleTurn] ; $ff00+$e4
	and $1
	xor [hl]
	jr nz, .asm_c9053
	ld a, [EnemySubStatus3] ; EnemySubStatus3
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret
.asm_c9053
	ld a, [PlayerSubStatus3] ; PlayerSubStatus3
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret

Functionc9059: ; c9059 (32:5059)
	ld a, [hSGB] ; $ff00+$e7
	and a
	ret

Functionc905d: ; c905d (32:505d)
	ld e, a
	callab Functionce765
	ld a, e
	ret

Functionc9066: ; c9066 (32:5066)
	ld e, a
	callab Functionce76b
	ld a, e
	ret
; c906f (32:506f)
