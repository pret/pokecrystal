; BG effects for use in battle animations.

; no known jump sources
Functionc8000: ; c8000 (32:4000)
	ld hl, $d3fa
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

; no known jump sources
Functionc801a: ; c801a (32:401a)
	ld hl, $d3fa
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
	ld a, [$d419]
	ld [hli], a
	ld a, [$d41a]
	ld [hli], a
	ld a, [$d41b]
	ld [hli], a
	ld a, [$d41c]
	ld [hl], a
	ret

; known jump sources: c80c6 (32:40c6), c811c (32:411c), c8139 (32:4139), c814d (32:414d), c8164 (32:4164), c81e6 (32:41e6), c81ef (32:41ef), c822c (32:422c), c827d (32:427d), c8299 (32:4299), c82ea (32:42ea), c8377 (32:4377), c8437 (32:4437), c85ca (32:45ca), c85ff (32:45ff), c8d13 (32:4d13), c8dd0 (32:4dd0), c8e26 (32:4e26), c8e4e (32:4e4e), c8f15 (32:4f15)
EndBattleBGEffect: ; c8043 (32:4043)
	ld hl, 0
	add hl, bc
	ld [hl], 0
	ret

; known jump sources: c800d (32:400d)
Functionc804a: ; c804a (32:404a)
	ld hl, 0
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, BattleBGEffects
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

; no known jump sources
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


; no known jump sources
BattleBGEffect_0: ; c80c6 (32:40c6)
	call EndBattleBGEffect
	ret

; known jump sources: c8b7d (32:4b7d), c8d80 (32:4d80), c8dd8 (32:4dd8)
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

; known jump sources: c81b3 (32:41b3), c8214 (32:4214), c8281 (32:4281), c82f5 (32:42f5), c83ed (32:43ed), c8545 (32:4545), c8599 (32:4599), c8607 (32:4607), c863f (32:463f), c8662 (32:4662), c8689 (32:4689), c8709 (32:4709), c8761 (32:4761), c87a7 (32:47a7), c8805 (32:4805), c8837 (32:4837), c88e7 (32:48e7), c8919 (32:4919), c892a (32:492a), c8964 (32:4964), c89b5 (32:49b5), c89ee (32:49ee), c8a3a (32:4a3a), c8acc (32:4acc), c8b05 (32:4b05), c8c61 (32:4c61), c8ca2 (32:4ca2)
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

; known jump sources: c81c0 (32:41c0), c8230 (32:4230), c825a (32:425a), c829d (32:429d), c82c7 (32:42c7), c8302 (32:4302), c835c (32:435c), c841d (32:441d), c854e (32:454e), c85a2 (32:45a2), c8610 (32:4610), c8648 (32:4648), c866b (32:466b), c8698 (32:4698), c86cb (32:46cb), c8712 (32:4712), c876a (32:476a), c87b2 (32:47b2), c87db (32:47db), c8810 (32:4810), c8842 (32:4842), c8876 (32:4876), c8890 (32:4890), c88f6 (32:48f6), c8933 (32:4933), c896d (32:496d), c89be (32:49be), c89f7 (32:49f7), c8a49 (32:4a49), c8a84 (32:4a84), c8a96 (32:4a96), c8ad3 (32:4ad3), c8b0e (32:4b0e), c8c68 (32:4c68), c8cab (32:4cab), c8d8b (32:4d8b), c8dec (32:4dec), c8def (32:4def), c8df2 (32:4df2)
Functionc80e5: ; c80e5 (32:40e5)
	ld hl, $1
	add hl, bc
	inc [hl]
	ret

; no known jump sources
Functionc80eb: ; c80eb (32:40eb)
	ld de, .inverted
	jp Functionc80fb
; c80f1 (32:40f1)

.inverted
	db %11100100 ; 3210
	db %00011011 ; 0123
; c80f3

; no known jump sources
Functionc80f3: ; c80f3 (32:40f3)
	ld de, .white
	jp Functionc80fb
; c80f9 (32:40f9)

.white
	db %11100100 ; 3210
	db %00000000 ; 0000
; c80fb

; known jump sources: c80ee (32:40ee), c80f6 (32:40f6)
Functionc80fb: ; c80fb (32:40fb)
	ld a, $1
	ld [$d419], a
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
	ld [$cfc7], a
	ret

; no known jump sources
Functionc812d: ; c812d (32:412d)
	ld de, $413d
	call Functionc8d57
	jr c, .asm_c8139
	ld [$cfc7], a
	ret
.asm_c8139
	call EndBattleBGEffect
	ret
; c813d (32:413d)

INCBIN "baserom.gbc",$c813d,$c8141 - $c813d

; no known jump sources
Functionc8141: ; c8141 (32:4141)
	ld de, $4151
	call Functionc8d57
	jr c, .asm_c814d
	ld [$cfc7], a
	ret
.asm_c814d
	call EndBattleBGEffect
	ret
; c8151 (32:4151)

INCBIN "baserom.gbc",$c8151,$c8155 - $c8151

; no known jump sources
Functionc8155: ; c8155 (32:4155)
	ld de, $4168
	call Functionc8d57
	jr c, .asm_c8164
	ld [$cfc7], a
	ld [$cfc9], a
	ret
.asm_c8164
	call EndBattleBGEffect
	ret
; c8168 (32:4168)

INCBIN "baserom.gbc",$c8168,$c8171 - $c8168

; no known jump sources
Functionc8171: ; c8171 (32:4171)
	call Functionc9059
	jr nz, .asm_c817b
	ld de, $4185
	jr .asm_c817e
.asm_c817b
	ld de, $4188
.asm_c817e
	call Functionc8d57
	ld [$cfc8], a
	ret
; c8185 (32:4185)

INCBIN "baserom.gbc",$c8185,$c818b - $c8185

; no known jump sources
Functionc818b: ; c818b (32:418b)
	call Functionc9059
	jr nz, .asm_c8195
	ld de, $419f
	jr .asm_c8198
.asm_c8195
	ld de, $41a2
.asm_c8198
	call Functionc8d57
	ld [$cfc8], a
	ret
; c819f (32:419f)

INCBIN "baserom.gbc",$c819f,$c81a5 - $c819f

; no known jump sources
Functionc81a5: ; c81a5 (32:41a5)
	ld de, $41af
	call Functionc8d57
	ld [$cfc7], a
	ret
; c81af (32:41af)

INCBIN "baserom.gbc",$c81af,$c81b3 - $c81af

; no known jump sources
Functionc81b3: ; c81b3 (32:41b3)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c81b6: ; c81b6 (32:41b6)
	dw Functionc81c0
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc81e3


; no known jump sources
Functionc81c0: ; c81c0 (32:41c0)
	call Functionc80e5
	push bc
	call Functionc9038
	jr nz, .asm_c81d1
	ld hl, $c4ac
	ld bc, $707
	jr .asm_c81d7
.asm_c81d1
	ld hl, $c51a
	ld bc, $606
.asm_c81d7
	call ClearBox
	pop bc
	xor a
	ld [hBGMapThird], a ; $ff00+$d5
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	ret

; no known jump sources
Functionc81e3: ; c81e3 (32:41e3)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call EndBattleBGEffect
	ret

; no known jump sources
Functionc81ea: ; c81ea (32:41ea)
	call Functionc9042
	jr z, .asm_c81f3
	call EndBattleBGEffect
	ret
.asm_c81f3
	call Functionc9038
	jr nz, .asm_c81fd
	ld de, $4210
	jr .asm_c8200
.asm_c81fd
	ld de, $420c
.asm_c8200
	ld a, e
	ld [$d41a], a
	ld a, d
	ld [$d41b], a
	call Functionc83ed
	ret
; c820c (32:420c)

INCBIN "baserom.gbc",$c820c,$c8214 - $c820c

; no known jump sources
Functionc8214: ; c8214 (32:4214)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8217: ; c8217 (32:4217)
	dw Functionc8223
	dw Functionc825a
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc827a


; no known jump sources
Functionc8223: ; c8223 (32:4223)
	call Functionc9042
	jr z, .asm_c8230
	ld hl, $d40e
	inc [hl]
	call EndBattleBGEffect
	ret
.asm_c8230
	call Functionc80e5
	push bc
	call Functionc9038
	jr nz, .asm_c8242
	ld a, $b8
	ld [$d419], a
	ld a, $84
	jr .asm_c8249
.asm_c8242
	ld a, $b9
	ld [$d419], a
	ld a, $30
.asm_c8249
	ld [$d41a], a
	ld a, $40
	ld [$d41b], a
	xor a
	ld [$d41c], a
	call Functionc82ee
	pop bc
	ret

; no known jump sources
Functionc825a: ; c825a (32:425a)
	call Functionc80e5
	push bc
	call Functionc9038
	jr nz, .asm_c826b
	ld hl, $c524
	ld bc, $107
	jr .asm_c8271
.asm_c826b
	ld hl, $c51a
	ld bc, $106
.asm_c8271
	call ClearBox
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	pop bc
	ret

; no known jump sources
Functionc827a: ; c827a (32:427a)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call EndBattleBGEffect
	ret

; no known jump sources
Functionc8281: ; c8281 (32:4281)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8284: ; c8284 (32:4284)
	dw Functionc8290
	dw Functionc82c7
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc82e7


; no known jump sources
Functionc8290: ; c8290 (32:4290)
	call Functionc9042
	jr z, .asm_c829d
	ld hl, $d40e
	inc [hl]
	call EndBattleBGEffect
	ret
.asm_c829d
	call Functionc80e5
	push bc
	call Functionc9038
	jr nz, .asm_c82af
	ld a, $ba
	ld [$d419], a
	ld a, $84
	jr .asm_c82b6
.asm_c82af
	ld a, $bb
	ld [$d419], a
	ld a, $30
.asm_c82b6
	ld [$d41a], a
	ld a, $40
	ld [$d41b], a
	xor a
	ld [$d41c], a
	call Functionc82ee
	pop bc
	ret

; no known jump sources
Functionc82c7: ; c82c7 (32:42c7)
	call Functionc80e5
	push bc
	call Functionc9038
	jr nz, .asm_c82d8
	ld hl, $c510
	ld bc, $207
	jr .asm_c82de
.asm_c82d8
	ld hl, $c51a
	ld bc, $206
.asm_c82de
	call ClearBox
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	pop bc
	ret

; no known jump sources
Functionc82e7: ; c82e7 (32:42e7)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call EndBattleBGEffect
	ret

; known jump sources: c8255 (32:4255), c82c2 (32:42c2)
Functionc82ee: ; c82ee (32:42ee)
	callab Functioncc9a1
	ret

; no known jump sources
Functionc82f5: ; c82f5 (32:42f5)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c82f8: ; c82f8 (32:42f8)
	dw Functionc8302
	dw Functionc831d
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc8365


; no known jump sources
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

; no known jump sources
Functionc831d: ; c831d (32:431d)
	ld hl, $2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_c833e
	ld hl, $c518
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
	ld hl, $c4b3
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

; no known jump sources
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

; no known jump sources
Functionc837b: ; c837b (32:437b)
	call Functionc9038
	jr nz, .asm_c8385
	ld de, $439e
	jr .asm_c8388
.asm_c8385
	ld de, $4394
.asm_c8388
	ld a, e
	ld [$d41a], a
	ld a, d
	ld [$d41b], a
	call Functionc83ed
	ret
; c8394 (32:4394)

INCBIN "baserom.gbc",$c8394,$c83a8 - $c8394

; no known jump sources
Functionc83a8: ; c83a8 (32:43a8)
	call Functionc9038
	jr nz, .asm_c83b2
	ld de, $43d7
	jr .asm_c83b5
.asm_c83b2
	ld de, $43c1
.asm_c83b5
	ld a, e
	ld [$d41a], a
	ld a, d
	ld [$d41b], a
	call Functionc83ed
	ret
; c83c1 (32:43c1)

INCBIN "baserom.gbc",$c83c1,$c83ed - $c83c1

; known jump sources: c8208 (32:4208), c8390 (32:4390), c83bd (32:43bd)
Functionc83ed: ; c83ed (32:43ed)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c83f0: ; c83f0 (32:43f0)
	dw Functionc83fa
	dw Functionc80e5
	dw Functionc80e5
	dw Functionc842a
	dw Functionc8434


; known jump sources: c8428 (32:4428)
Functionc83fa: ; c83fa (32:43fa)
	ld hl, $3
	add hl, bc
	ld e, [hl]
	ld d, $0
	inc [hl]
	ld a, [$d41a]
	ld l, a
	ld a, [$d41b]
	ld h, a
	add hl, de
	add hl, de
	add hl, de
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

; no known jump sources
Functionc842a: ; c842a (32:442a)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld hl, $1
	add hl, bc
	ld [hl], $0
	ret

; known jump sources: c8410 (32:4410)
Functionc8434: ; c8434 (32:4434)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call EndBattleBGEffect
	ret

; known jump sources: c8425 (32:4425)
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
	ld d, $0
	ld hl, $449c
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ClearBox
	pop bc
	ret

; known jump sources: c841a (32:441a)
Functionc8458: ; c8458 (32:4458)
	push bc
	push hl
	ld e, [hl]
	ld d, $0
	ld hl, $44a8
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
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	inc hl
	ld a, [hli]
	ld [$d419], a
	push de
	ld e, [hl]
	ld d, $0
	ld hl, $449c
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
.asm_c8484
	push bc
	push hl
	ld a, [$d419]
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

INCBIN "baserom.gbc",$c849c,$c8545 - $c849c

; no known jump sources
Functionc8545: ; c8545 (32:4545)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8548: ; c8548 (32:4548)
	dw Functionc854e
	dw Functionc8557
	dw Functionc8561


; no known jump sources
Functionc854e: ; c854e (32:454e)
	call Functionc80e5
	ld de, $202
	call Functionc8f69

; no known jump sources
Functionc8557: ; c8557 (32:4557)
	ld a, [hLCDStatCustom] ; $ff00+$c6
	and a
	ret z
	push bc
	call Functionc8565
	pop bc
	ret

; no known jump sources
Functionc8561: ; c8561 (32:4561)
	call Functionc8f0a
	ret

; known jump sources: c855c (32:455c)
Functionc8565: ; c8565 (32:4565)
	ld hl, $d422
	ld de, $d423
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
	ld de, $d200
	ld hl, $d422
	ld bc, $0
.asm_c8580
	ld a, [$FF00+$c7]
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

; no known jump sources
Functionc8599: ; c8599 (32:4599)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c859c: ; c859c (32:459c)
	dw Functionc85a2
	dw Functionc85ba
	dw Functionc85be


; no known jump sources
Functionc85a2: ; c85a2 (32:45a2)
	call Functionc80e5
	call Functionc8eca
	ld a, $42
	ld [hLCDStatCustom], a ; $ff00+$c6
	xor a
	ld [$FF00+$c7], a
	ld a, $5e
	ld [$FF00+$c8], a
	ld de, $202
	call Functionc8f2e
	ret

; no known jump sources
Functionc85ba: ; c85ba (32:45ba)
	call Functionc8fef
	ret

; no known jump sources
Functionc85be: ; c85be (32:45be)
	call Functionc8f0a
	ret

; no known jump sources
Functionc85c2: ; c85c2 (32:45c2)
	call Functionc8eca
	ld a, $42
	call Functionc8ede
	call EndBattleBGEffect
	ret

; no known jump sources
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
	ld [$d419], a
	ld hl, $2
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_c85fc
	inc [hl]
	inc [hl]
	call Functionc8f9a
	ret
.asm_c85fc
	call Functionc8eca
	call EndBattleBGEffect
	ret

; no known jump sources
Functionc8603: ; c8603 (32:4603)
	call Functionc8f0a
	ret

; no known jump sources
Functionc8607: ; c8607 (32:4607)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c860a: ; c860a (32:460a)
	dw Functionc8610
	dw Functionc862e
	dw Functionc863b


; no known jump sources
Functionc8610: ; c8610 (32:4610)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	ld [hLCDStatCustom], a ; $ff00+$c6
	xor a
	ld [$FF00+$c7], a
	ld a, $5f
	ld [$FF00+$c8], a
	ld de, $605
	call Functionc8f2e
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ret

; no known jump sources
Functionc862e: ; c862e (32:462e)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $3
	ret nz
	call Functionc8fef
	ret

; no known jump sources
Functionc863b: ; c863b (32:463b)
	call Functionc8f0a
	ret

; no known jump sources
Functionc863f: ; c863f (32:463f)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8642: ; c8642 (32:4642)
	dw Functionc8648
	dw Functionc865a
	dw Functionc865e


; no known jump sources
Functionc8648: ; c8648 (32:4648)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld de, $605
	call Functionc8f2e
	ret

; no known jump sources
Functionc865a: ; c865a (32:465a)
	call Functionc8fef
	ret

; no known jump sources
Functionc865e: ; c865e (32:465e)
	call Functionc8f0a
	ret

; no known jump sources
Functionc8662: ; c8662 (32:4662)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8665: ; c8665 (32:4665)
	dw Functionc866b
	dw Functionc8681
	dw Functionc8685


; no known jump sources
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

; no known jump sources
Functionc8681: ; c8681 (32:4681)
	call Functionc8fef
	ret

; no known jump sources
Functionc8685: ; c8685 (32:4685)
	call Functionc8f0a
	ret

; no known jump sources
Functionc8689: ; c8689 (32:4689)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c868c: ; c868c (32:468c)
	dw Functionc8698
	dw Functionc86af
	dw Functionc86cf
	dw Functionc86bd
	dw Functionc86e9
	dw Functionc8705


; no known jump sources
Functionc8698: ; c8698 (32:4698)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
	ld hl, $2
	add hl, bc
	ld [hl], $0
	ret

; no known jump sources
Functionc86af: ; c86af (32:46af)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	cp $10
	jr nc, asm_c86cb
	inc [hl]
	call Functionc86ea
	ret

; no known jump sources
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

; no known jump sources
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

; no known jump sources
Functionc86e9: ; c86e9 (32:46e9)
	ret

; known jump sources: c86b9 (32:46b9), c86c7 (32:46c7), c86de (32:46de)
Functionc86ea: ; c86ea (32:46ea)
	ld e, a
	xor $ff
	inc a
	ld d, a
	ld h, $d2
	ld a, [$FF00+$c7]
	ld l, a
	ld a, [$FF00+$c8]
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

; no known jump sources
Functionc8705: ; c8705 (32:4705)
	call Functionc8f0a
	ret

; no known jump sources
Functionc8709: ; c8709 (32:4709)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c870c: ; c870c (32:470c)
	dw Functionc8712
	dw Functionc8732
	dw Functionc875d


; no known jump sources
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
	ld a, [$FF00+$c8]
	ld l, a
	ld [hl], $0
	dec l
	ld [hl], $0
	ret

; no known jump sources
Functionc8732: ; c8732 (32:4732)
	ld a, [$FF00+$c8]
	ld l, a
	ld h, $d2
	ld e, l
	ld d, h
	dec de
.asm_c873a
	ld a, [de]
	dec de
	ld [hld], a
	ld a, [$FF00+$c7]
	cp l
	jr nz, .asm_c873a
	ld [hl], $90
	ld a, [$FF00+$c8]
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

; no known jump sources
Functionc875d: ; c875d (32:475d)
	call Functionc8f0a
	ret

; no known jump sources
Functionc8761: ; c8761 (32:4761)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8764: ; c8764 (32:4764)
	dw Functionc876a
	dw Functionc8781
	dw Functionc87a3


; no known jump sources
Functionc876a: ; c876a (32:476a)
	call Functionc80e5
	call Functionc8eca
	ld a, $42
	call Functionc8ede
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
	ld hl, $2
	add hl, bc
	ld [hl], $1
	ret

; no known jump sources
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

; no known jump sources
Functionc87a3: ; c87a3 (32:47a3)
	call Functionc8f0a
	ret

; no known jump sources
Functionc87a7: ; c87a7 (32:47a7)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c87aa: ; c87aa (32:47aa)
	dw Functionc87b2
	dw Functionc87cf
	dw Functionc87de
	dw Functionc8801


; no known jump sources
Functionc87b2: ; c87b2 (32:47b2)
	call Functionc80e5
	call Functionc8eca
	ld a, $42
	call Functionc8ede
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
	ld hl, $2
	add hl, bc
	ld [hl], $2
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ret

; no known jump sources
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

; no known jump sources
Functionc87de: ; c87de (32:47de)
	ld a, [$FF00+$c7]
	ld l, a
	ld a, [$FF00+$c8]
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
	inc [hl]
	inc [hl]
	ret

; no known jump sources
Functionc8801: ; c8801 (32:4801)
	call Functionc8f0a
	ret

; no known jump sources
Functionc8805: ; c8805 (32:4805)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8808: ; c8808 (32:4808)
	dw Functionc8810
	dw Functionc8869
	dw Functionc8888
	dw Functionc8833


; no known jump sources
Functionc8810: ; c8810 (32:4810)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
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

; no known jump sources
Functionc8833: ; c8833 (32:4833)
	call Functionc8f0a
	ret

; no known jump sources
Functionc8837: ; c8837 (32:4837)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c883a: ; c883a (32:483a)
	dw Functionc8842
	dw Functionc8869
	dw Functionc8888
	dw Functionc8865


; no known jump sources
Functionc8842: ; c8842 (32:4842)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ef4
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
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

; no known jump sources
Functionc8865: ; c8865 (32:4865)
	call Functionc8f0a
	ret

; no known jump sources
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

; no known jump sources
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

; known jump sources: c8879 (32:4879), c8893 (32:4893)
Functionc88a5: ; c88a5 (32:48a5)
	push af
	ld a, [FXAnimIDHi] ; $cfc3
	or a
	jr nz, .asm_c88b3
	ld a, [FXAnimIDLo] ; $cfc2
	cp $cd
	jr z, .asm_c88b7
.asm_c88b3
	pop af
	jp Functionc900b
.asm_c88b7
	ld a, [$FF00+$c7]
	ld d, a
	ld a, [$FF00+$c8]
	sub d
	ld d, a
	ld h, $d2
	ld a, [hSCY] ; $ff00+$d0
	or a
	jr nz, .asm_c88d0
	ld a, [$FF00+$c7]
	or a
	jr z, .asm_c88d6
	dec a
	ld l, a
	ld [hl], $0
	jr .asm_c88d6
.asm_c88d0
	ld a, [$FF00+$c8]
	dec a
	ld l, a
	ld [hl], $0
.asm_c88d6
	ld a, [hSCY] ; $ff00+$d0
	ld l, a
	ld a, [$FF00+$c7]
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

; no known jump sources
Functionc88e7: ; c88e7 (32:48e7)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c88ea: ; c88ea (32:48ea)
	dw Functionc88f6
	dw Functionc8869
	dw Functionc8888
	dw Functionc88f2


; no known jump sources
Functionc88f2: ; c88f2 (32:48f2)
	call Functionc8f0a
	ret

; no known jump sources
Functionc88f6: ; c88f6 (32:48f6)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
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

; no known jump sources
Functionc8919: ; c8919 (32:4919)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c891c: ; c891c (32:491c)
	dw Functionc88f6
	dw Functionc8869
	dw Functionc8929
	dw Functionc8888
	dw Functionc8926


; no known jump sources
Functionc8926: ; c8926 (32:4926)
	call Functionc8f0a

; no known jump sources
Functionc8929: ; c8929 (32:4929)
	ret

; no known jump sources
Functionc892a: ; c892a (32:492a)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c892d: ; c892d (32:492d)
	dw Functionc8933
	dw Functionc894a
	dw Functionc8960


; no known jump sources
Functionc8933: ; c8933 (32:4933)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ret

; no known jump sources
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

; no known jump sources
Functionc8960: ; c8960 (32:4960)
	call Functionc8f0a
	ret

; no known jump sources
Functionc8964: ; c8964 (32:4964)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8967: ; c8967 (32:4967)
	dw Functionc896d
	dw Functionc8985
	dw Functionc89b1


; no known jump sources
Functionc896d: ; c896d (32:496d)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
	xor a
	ld hl, $2
	add hl, bc
	ld [hli], a
	ld [hl], a
	ret

; no known jump sources
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

; no known jump sources
Functionc89b1: ; c89b1 (32:49b1)
	call Functionc8f0a
	ret

; no known jump sources
Functionc89b5: ; c89b5 (32:49b5)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c89b8: ; c89b8 (32:49b8)
	dw Functionc89be
	dw Functionc89ca
	dw Functionc89da


; no known jump sources
Functionc89be: ; c89be (32:49be)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ret

; no known jump sources
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

; no known jump sources
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

; no known jump sources
Functionc89ee: ; c89ee (32:49ee)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c89f1: ; c89f1 (32:49f1)
	dw Functionc89f7
	dw Functionc8a14
	dw Functionc8a36


; no known jump sources
Functionc89f7: ; c89f7 (32:49f7)
	call Functionc80e5
	call Functionc8eca
	ld a, $42
	call Functionc8ef4
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
	ld hl, $2
	add hl, bc
	ld [hl], $1
	ld hl, $3
	add hl, bc
	ld [hl], $20
	ret

; no known jump sources
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
	inc [hl]
	inc [hl]
	ret

; no known jump sources
Functionc8a36: ; c8a36 (32:4a36)
	call Functionc8f0a
	ret

; no known jump sources
Functionc8a3a: ; c8a3a (32:4a3a)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8a3d: ; c8a3d (32:4a3d)
	dw Functionc8a49
	dw Functionc8a6f
	dw Functionc8a70
	dw Functionc8a88
	dw Functionc8a6f
	dw Functionc8aac


; no known jump sources
Functionc8a49: ; c8a49 (32:4a49)
	call Functionc80e5
	ld a, $e4
	call Functionc8ecb
	ld a, $47
	call Functionc8ede
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
	ld a, [$FF00+$c7]
	ld l, a
	ld h, $d2
.asm_c8a60
	ld a, [$FF00+$c8]
	cp l
	jr z, .asm_c8a69
	xor a
	ld [hli], a
	jr .asm_c8a60
.asm_c8a69
	ld hl, $3
	add hl, bc
	ld [hl], $0

; no known jump sources
Functionc8a6f: ; c8a6f (32:4a6f)
	ret

; no known jump sources
Functionc8a70: ; c8a70 (32:4a70)
	call Functionc8ab0
	jr nc, .asm_c8a79
	call Functionc8a9a
	ret
.asm_c8a79
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ld a, [$FF00+$c7]
	inc a
	ld [$FF00+$c7], a
	call Functionc80e5
	ret

; no known jump sources
Functionc8a88: ; c8a88 (32:4a88)
	call Functionc8ab0
	jr nc, .asm_c8a96
	call Functionc8a9a
	ld a, [$FF00+$c8]
	dec a
	ld l, a
	ld [hl], e
	ret
.asm_c8a96
	call Functionc80e5
	ret

; known jump sources: c8a75 (32:4a75), c8a8d (32:4a8d)
Functionc8a9a: ; c8a9a (32:4a9a)
	ld e, a
	ld a, [$FF00+$c7]
	ld l, a
	ld a, [$FF00+$c8]
	sub l
	srl a
	ld h, $d2
.asm_c8aa5
	ld [hl], e
	inc hl
	inc hl
	dec a
	jr nz, .asm_c8aa5
	ret

; no known jump sources
Functionc8aac: ; c8aac (32:4aac)
	call Functionc8f19
	ret

; known jump sources: c8a70 (32:4a70), c8a88 (32:4a88)
Functionc8ab0: ; c8ab0 (32:4ab0)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	inc [hl]
	srl a
	srl a
	srl a
	ld e, a
	ld d, $0
	ld hl, $4ac7
	add hl, de
	ld a, [hl]
	cp $ff
	ret
; c8ac7 (32:4ac7)

INCBIN "baserom.gbc",$c8ac7,$c8acc - $c8ac7

; no known jump sources
Functionc8acc: ; c8acc (32:4acc)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8acf: ; c8acf (32:4acf)
	dw Functionc8ad3
	dw Functionc8ae5


; no known jump sources
Functionc8ad3: ; c8ad3 (32:4ad3)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld hl, $2
	add hl, bc
	ld [hl], $40
	ret

; no known jump sources
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

; no known jump sources
Functionc8b00: ; c8b00 (32:4b00)
	ld a, [hCGB] ; $ff00+$e6
	and a
	jr nz, asm_c8b7a
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8b08: ; c8b08 (32:4b08)
	dw Functionc8b0e
	dw Functionc8b22
	dw Functionc8b60


; no known jump sources
Functionc8b0e: ; c8b0e (32:4b0e)
	call Functionc80e5
	ld a, $e4
	call Functionc8ecb
	ld a, $47
	ld [hLCDStatCustom], a ; $ff00+$c6
	xor a
	ld [$FF00+$c7], a
	ld a, $60
	ld [$FF00+$c8], a
	ret

; no known jump sources
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
	ld hl, $4bd8
	add hl, de
	ld a, [hli]
	ld [$cfc9], a
	ld d, a
	ld e, [hl]
	ld bc, $2f30
	jr .asm_c8b5b
.asm_c8b4d
	ld hl, $4be0
	add hl, de
	ld d, [hl]
	inc hl
	ld a, [hl]
	ld [$cfc9], a
	ld e, a
	ld bc, $3728
.asm_c8b5b
	call Functionc8b6c
	pop bc
	ret

; no known jump sources
Functionc8b60: ; c8b60 (32:4b60)
	call Functionc8f19
	ld a, $e4
	ld [$cfc7], a
	ld [$cfc9], a
	ret

; known jump sources: c8b5b (32:4b5b)
Functionc8b6c: ; c8b6c (32:4b6c)
	ld hl, $d200
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
	ld de, $4b81
	call Functionc80ca
	jp [hl]
; c8b81 (32:4b81)

INCBIN "baserom.gbc",$c8b81,$c8be8 - $c8b81

; no known jump sources
Functionc8be8: ; c8be8 (32:4be8)
	ld de, $4bef
	call Functionc8d77
	ret
; c8bef (32:4bef)

INCBIN "baserom.gbc",$c8bef,$c8bf2 - $c8bef

; no known jump sources
Functionc8bf2: ; c8bf2 (32:4bf2)
	ld de, $4bf9
	call Functionc8d77
	ret
; c8bf9 (32:4bf9)

INCBIN "baserom.gbc",$c8bf9,$c8bfd - $c8bf9

; no known jump sources
Functionc8bfd: ; c8bfd (32:4bfd)
	ld de, $4c04
	call Functionc8d77
	ret
; c8c04 (32:4c04)

INCBIN "baserom.gbc",$c8c04,$c8c08 - $c8c04

; no known jump sources
Functionc8c08: ; c8c08 (32:4c08)
	ld de, $4c0f
	call Functionc8d77
	ret
; c8c0f (32:4c0f)

INCBIN "baserom.gbc",$c8c0f,$c8c14 - $c8c0f

; no known jump sources
Functionc8c14: ; c8c14 (32:4c14)
	ld de, $4c1b
	call Functionc8d77
	ret
; c8c1b (32:4c1b)

INCBIN "baserom.gbc",$c8c1b,$c8c20 - $c8c1b

; no known jump sources
Functionc8c20: ; c8c20 (32:4c20)
	ld de, $4c27
	call Functionc8d77
	ret
; c8c27 (32:4c27)

INCBIN "baserom.gbc",$c8c27,$c8c30 - $c8c27

; no known jump sources
Functionc8c30: ; c8c30 (32:4c30)
	ld de, $4c37
	call Functionc8d77
	ret
; c8c37 (32:4c37)

INCBIN "baserom.gbc",$c8c37,$c8c3c - $c8c37

; no known jump sources
Functionc8c3c: ; c8c3c (32:4c3c)
	ld de, $4c43
	call Functionc8d77
	ret
; c8c43 (32:4c43)

INCBIN "baserom.gbc",$c8c43,$c8c55 - $c8c43

; no known jump sources
Functionc8c55: ; c8c55 (32:4c55)
	ld de, $4c5c
	call Functionc8d77
	ret
; c8c5c (32:4c5c)

INCBIN "baserom.gbc",$c8c5c,$c8c61 - $c8c5c

; no known jump sources
Functionc8c61: ; c8c61 (32:4c61)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8c64: ; c8c64 (32:4c64)
	dw Functionc8c68
	dw Functionc8c85


; no known jump sources
Functionc8c68: ; c8c68 (32:4c68)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	call Functionc8ede
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
	ld hl, $2
	add hl, bc
	ld [hl], $1
	ld hl, $3
	add hl, bc
	ld [hl], $20
	ret

; no known jump sources
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

; no known jump sources
Functionc8ca2: ; c8ca2 (32:4ca2)
	call Functionc80d7 ;  ;  ; call does not return

; no known jump sources
Jumptable_c8ca5: ; c8ca5 (32:4ca5)
	dw Functionc8cab
	dw Functionc8cc3
	dw Functionc8cdd


; no known jump sources
Functionc8cab: ; c8cab (32:4cab)
	call Functionc80e5
	call Functionc8eca
	ld a, $43
	ld [hLCDStatCustom], a ; $ff00+$c6
	xor a
	ld [$FF00+$c7], a
	ld a, $37
	ld [$FF00+$c8], a
	ld hl, $3
	add hl, bc
	ld [hl], $0
	ret

; no known jump sources
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

; known jump sources: c8cca (32:4cca)
Functionc8cdd: ; c8cdd (32:4cdd)
	call Functionc8f0a
	ret

; no known jump sources
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
	ld [$d314], a
	ret

; no known jump sources
Functionc8cf9: ; c8cf9 (32:4cf9)
	call Functionc8d0b
	jr nc, .asm_c8cff
	xor a
.asm_c8cff
	ld [hSCX], a ; $ff00+$cf
	ret

; no known jump sources
Functionc8d02: ; c8d02 (32:4d02)
	call Functionc8d0b
	jr nc, .asm_c8d08
	xor a
.asm_c8d08
	ld [hSCY], a ; $ff00+$d0
	ret

; known jump sources: c8ce1 (32:4ce1), c8cf9 (32:4cf9), c8d02 (32:4d02)
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

; no known jump sources
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

; known jump sources: c8130 (32:4130), c8144 (32:4144), c8158 (32:4158), c817e (32:417e), c8198 (32:4198), c81a8 (32:41a8)
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

; known jump sources: c8beb (32:4beb), c8bf5 (32:4bf5), c8c00 (32:4c00), c8c0b (32:4c0b), c8c17 (32:4c17), c8c23 (32:4c23), c8c33 (32:4c33), c8c3f (32:4c3f), c8c58 (32:4c58)
Functionc8d77: ; c8d77 (32:4d77)
	ld a, [hCGB] ; $ff00+$e6
	and a
	jr nz, asm_c8dd4
	push de
	ld de, Jumptable_c8d85
	call Functionc80ca
	pop de
	jp [hl]

; no known jump sources
Jumptable_c8d85: ; c8d85 (32:4d85)
	dw Functionc8d8b
	dw Functionc8daa
	dw Functionc8dc9


; no known jump sources
Functionc8d8b: ; c8d8b (32:4d8b)
	call Functionc80e5
	ld a, $e4
	call Functionc8ecb
	ld a, $47
	call Functionc8ede
	ld a, [$FF00+$c8]
	inc a
	ld [$FF00+$c8], a
	ld hl, $3
	add hl, bc
	ld a, [hl]
	ld [hl], $0
	ld hl, $2
	add hl, bc
	ld [hl], a
	ret

; no known jump sources
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

; no known jump sources
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

; no known jump sources
Jumptable_c8ddd: ; c8ddd (32:4ddd)
	dw Functionc8de7
	dw Functionc8e02
	dw Functionc8e21
	dw Functionc8e2a
	dw Functionc8e49


; no known jump sources
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

; no known jump sources
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

; no known jump sources
Functionc8e21: ; c8e21 (32:4e21)
	ld a, $e4
	call Functionc8e52
	call EndBattleBGEffect
	ret

; no known jump sources
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

; no known jump sources
Functionc8e49: ; c8e49 (32:4e49)
	ld a, $e4
	call Functionc8e7f
	call EndBattleBGEffect
	ret

; known jump sources: c8e17 (32:4e17), c8e23 (32:4e23)
Functionc8e52: ; c8e52 (32:4e52)
	ld h, a
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	ld a, h
	push bc
	push af
	ld hl, BGPals ; $d080
	ld de, Unkn1Pals ; $d000
	ld b, a
	ld c, $1
	call CopyPals
	ld hl, $d0c8
	ld de, $d048
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

; known jump sources: c8e3f (32:4e3f), c8e4b (32:4e4b)
Functionc8e7f: ; c8e7f (32:4e7f)
	ld h, a
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	ld a, h
	push bc
	push af
	ld hl, $d088
	ld de, $d008
	ld b, a
	ld c, $1
	call CopyPals
	ld hl, OBPals ; $d0c0
	ld de, MartPointer ; $d040 (aliases: Unkn2Pals)
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

; known jump sources: c8d73 (32:4d73), c8dba (32:4dba), c8e12 (32:4e12), c8e3a (32:4e3a)
Functionc8eac: ; c8eac (32:4eac)
	ld hl, $3
	add hl, bc
	ld a, [hl]
	inc [hl]

; known jump sources: c8d65 (32:4d65)
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

; known jump sources: c85a5 (32:45a5), c85c2 (32:45c2), c85fc (32:45fc), c8613 (32:4613), c864b (32:464b), c866e (32:466e), c869b (32:469b), c8715 (32:4715), c876d (32:476d), c87b5 (32:47b5), c8813 (32:4813), c8845 (32:4845), c88f9 (32:48f9), c8936 (32:4936), c8970 (32:4970), c89c1 (32:49c1), c89fa (32:49fa), c8ad6 (32:4ad6), c8c6b (32:4c6b), c8cae (32:4cae), c8f0f (32:4f0f), c8f2a (32:4f2a)
Functionc8eca: ; c8eca (32:4eca)
	xor a

; known jump sources: c8a4e (32:4a4e), c8b13 (32:4b13), c8d90 (32:4d90)
Functionc8ecb: ; c8ecb (32:4ecb)
	ld hl, CurMartEnd ; $d100 (aliases: LYOverrides)
	ld e, $99
.asm_c8ed0
	ld [hli], a
	dec e
	jr nz, .asm_c8ed0
	ld hl, $d200
	ld e, $91
.asm_c8ed9
	ld [hli], a
	dec e
	jr nz, .asm_c8ed9
	ret

; known jump sources: c85c7 (32:45c7), c8650 (32:4650), c8673 (32:4673), c86a0 (32:46a0), c871a (32:471a), c8772 (32:4772), c87ba (32:47ba), c8818 (32:4818), c88fe (32:48fe), c893b (32:493b), c8975 (32:4975), c89c6 (32:49c6), c8a53 (32:4a53), c8adb (32:4adb), c8c70 (32:4c70), c8d95 (32:4d95)
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
	ld [$FF00+$c7], a
	ld a, e
	ld [$FF00+$c8], a
	ret

; known jump sources: c884a (32:484a), c89ff (32:49ff)
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
	ld [$FF00+$c7], a
	ld a, e
	ld [$FF00+$c8], a
	ret

; known jump sources: c8561 (32:4561), c85be (32:45be), c8603 (32:4603), c863b (32:463b), c865e (32:465e), c8685 (32:4685), c8705 (32:4705), c875d (32:475d), c87a3 (32:47a3), c8801 (32:4801), c8833 (32:4833), c8865 (32:4865), c88f2 (32:48f2), c8926 (32:4926), c8960 (32:4960), c89b1 (32:49b1), c89ea (32:49ea), c8a36 (32:4a36), c8afc (32:4afc), c8c9e (32:4c9e), c8cdd (32:4cdd)
Functionc8f0a: ; c8f0a (32:4f0a)
	xor a
	ld [$FF00+$c7], a
	ld [$FF00+$c8], a
	call Functionc8eca
	xor a
	ld [hLCDStatCustom], a ; $ff00+$c6
	call EndBattleBGEffect
	ret

; known jump sources: c8aac (32:4aac), c8b60 (32:4b60), c8dc9 (32:4dc9)
Functionc8f19: ; c8f19 (32:4f19)
	xor a
	ld [hLCDStatCustom], a ; $ff00+$c6
	ld a, $e4
	ld [rBGP], a ; $ff00+$47
	ld [$cfc7], a
	ld [$cfc9], a
	ld [$FF00+$c7], a
	ld [$FF00+$c8], a
	call Functionc8eca
	ret

; known jump sources: c85b6 (32:45b6), c8624 (32:4624), c8656 (32:4656), c867d (32:467d), c8724 (32:4724), c89d6 (32:49d6), c89e6 (32:49e6), c8af8 (32:4af8)
Functionc8f2e: ; c8f2e (32:4f2e)
	push bc
	xor a
	ld [$d419], a
	ld a, e
	ld [$d41a], a
	ld a, d
	ld [$d41b], a
	ld a, $80
	ld [$d41c], a
	ld bc, $d200
.asm_c8f43
	ld a, [$FF00+$c7]
	cp c
	jr nc, .asm_c8f58
	ld a, [$FF00+$c8]
	cp c
	jr c, .asm_c8f58
	ld a, [$d41b]
	ld d, a
	ld a, [$d419]
	call Functionc905d
	ld [bc], a
.asm_c8f58
	inc bc
	ld a, [$d41a]
	ld hl, $d419
	add [hl]
	ld [hl], a
	ld hl, $d41c
	dec [hl]
	jr nz, .asm_c8f43
	pop bc
	ret

; known jump sources: c8554 (32:4554)
Functionc8f69: ; c8f69 (32:4f69)
	push bc
	xor a
	ld [$d419], a
	ld a, e
	ld [$d41a], a
	ld a, d
	ld [$d41b], a
	ld a, $40
	ld [$d41c], a
	ld bc, $d422
.asm_c8f7e
	ld a, [$d41b]
	ld d, a
	ld a, [$d419]
	call Functionc905d
	ld [bc], a
	inc bc
	ld a, [$d41a]
	ld hl, $d419
	add [hl]
	ld [hl], a
	ld hl, $d41c
	dec [hl]
	jr nz, .asm_c8f7e
	pop bc
	ret

; known jump sources: c85f8 (32:45f8)
Functionc8f9a: ; c8f9a (32:4f9a)
	push bc
	ld [$d41c], a
	ld a, e
	ld [$d41a], a
	ld a, d
	ld [$d41b], a
	call Functionc8fe4
	ld hl, $d200
	add hl, de
	ld c, l
	ld b, h
.asm_c8faf
	ld a, [$d41c]
	and a
	jr z, .asm_c8fe1
	dec a
	ld [$d41c], a
	push af
	ld a, [$d41b]
	ld d, a
	ld a, [$d41a]
	push hl
	call Functionc905d
	ld e, a
	pop hl
	ld a, [$FF00+$c8]
	cp c
	jr c, .asm_c8fcf
	ld a, e
	ld [bc], a
	inc bc
.asm_c8fcf
	ld a, [$FF00+$c7]
	cp l
	jr nc, .asm_c8fd6
	ld [hl], e
	dec hl
.asm_c8fd6
	ld a, [$d41a]
	add $4
	ld [$d41a], a
	pop af
	jr .asm_c8faf
.asm_c8fe1
	pop bc
	and a
	ret

; known jump sources: c8fa6 (32:4fa6)
Functionc8fe4: ; c8fe4 (32:4fe4)
	ld a, [$FF00+$c7]
	ld e, a
	ld a, [$d419]
	add e
	ld e, a
	ld d, $0
	ret

; known jump sources: c85ba (32:45ba), c8637 (32:4637), c865a (32:465a), c8681 (32:4681)
Functionc8fef: ; c8fef (32:4fef)
	push bc
	ld a, [$FF00+$c7]
	ld l, a
	inc a
	ld e, a
	ld h, $d2
	ld d, h
	ld a, [$FF00+$c8]
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

; known jump sources: c88b4 (32:48b4), c8954 (32:4954), c899d (32:499d), c8c9a (32:4c9a), c8cd1 (32:4cd1), c8dbf (32:4dbf)
Functionc900b: ; c900b (32:500b)
	push af
	ld h, $d2
	ld a, [$FF00+$c7]
	ld l, a
	ld a, [$FF00+$c8]
	sub l
	ld d, a
	pop af
.asm_c9016
	ld [hli], a
	dec d
	jr nz, .asm_c9016
	ret

; known jump sources: c8790 (32:4790), c87f7 (32:47f7), c8a2c (32:4a2c)
Functionc901b: ; c901b (32:501b)
	push af
	ld e, a
	ld a, [$FF00+$c7]
	ld l, a
	ld a, [$FF00+$c8]
	sub l
	sub e
	ld d, a
	ld h, $d2
	ld a, [$FF00+$c7]
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

; known jump sources: c81c4 (32:41c4), c81f3 (32:41f3), c8234 (32:4234), c825e (32:425e), c82a1 (32:42a1), c82cb (32:42cb), c8305 (32:4305), c837b (32:437b), c83a8 (32:43a8), c8826 (32:4826), c8858 (32:4858), c890c (32:490c), c8b39 (32:4b39), c8de7 (32:4de7), c8ee0 (32:4ee0), c8ef6 (32:4ef6)
Functionc9038: ; c9038 (32:5038)
	ld hl, $2
	add hl, bc
	ld a, [hBattleTurn] ; $ff00+$e4
	and $1
	xor [hl]
	ret

; known jump sources: c81ea (32:41ea), c8223 (32:4223), c8290 (32:4290)
Functionc9042: ; c9042 (32:5042)
	ld hl, $2
	add hl, bc
	ld a, [hBattleTurn] ; $ff00+$e4
	and $1
	xor [hl]
	jr nz, .asm_c9053
	ld a, [EnemySubStatus3] ; $c66f
	and $60
	ret
.asm_c9053
	ld a, [PlayerSubStatus3] ; $c66a
	and $60
	ret

; known jump sources: c8171 (32:4171), c818b (32:418b)
Functionc9059: ; c9059 (32:5059)
	ld a, [hSGB] ; $ff00+$e7
	and a
	ret

; known jump sources: c86d6 (32:46d6), c8951 (32:4951), c898c (32:498c), c8997 (32:4997), c8cce (32:4cce), c8d45 (32:4d45), c8f54 (32:4f54), c8f85 (32:4f85), c8fc2 (32:4fc2)
Functionc905d: ; c905d (32:505d)
	ld e, a
	callab Functionce765
	ld a, e
	ret

; known jump sources: c8a24 (32:4a24)
Functionc9066: ; c9066 (32:5066)
	ld e, a
	callab Functionce76b
	ld a, e
	ret
; c906f (32:506f)


