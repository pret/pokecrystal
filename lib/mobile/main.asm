; A library included as part of the Mobile Adapter GB SDK.

charmap "<CR>", $d

INCLUDE "constants/hardware_constants.asm"


SECTION "Mobile Adapter SDK", ROMX

Function110000:
; Copy b bytes from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	ret

Function110007:
; Copy bytes from hl to de until a 0 is encountered.
; Include the 0 in the copy, and count the number of
; nonzero bytes copied.  Keep the de pointer at the
; copied zero.
.loop
	ld a, [hli]
	ld [de], a
	or a
	ret z
	inc de
	inc bc
	jr .loop

Function11000f:
; Copy bytes from hl to de until a 0 is encountered,
; or a bytes have been copied, whichever comes first.
; Add the byte count to the count previously stored
; in bc.
	push bc
	ld c, $0
	ld b, a
	dec b
.loop
	ld a, [hli]
	ld [de], a
	or a
	jr z, .done
	inc de
	inc c
	dec b
	jr nz, .loop
	xor a
	ld [de], a

.done
	ld a, c
	pop bc
	add c
	ld c, a
	ld a, b
	adc 0
	ld b, a
	ret

Function110029:
; Clear two bytes at $ca3a.
	xor a
	ld hl, $ca3a
	ld [hli], a
	ld [hl], a
	ret

Function110030::
; Use the byte at $c988 as a parameter
; for a dw.
; If [$c988] not in {12, 14, 16},
; clear [$c835].
	push de
	ld a, [$c988]
	cp 2 * 6
	jr z, .noreset
	cp 2 * 7
	jr z, .noreset
	cp 2 * 8
	jr z, .noreset
	xor a
	ld [$c835], a
	ld a, [$c988]
.noreset
	; Get the pointer
	ld d, 0
	ld e, a
	ld hl, .dw
	add hl, de
	; Store the low byte in [$c988]
	ld a, [hli]
	ld [$c988], a
	ld a, [hl]
	; restore de
	pop de
	ld hl, Function3e60 ; return here
	push hl
	; If the destination function is not Function110236,
	; call Function1100b4.
	ld h, a
	ld a, [$c988]
	ld l, a
	push hl
	ld a, LOW(Function110236)
	cp l
	jr nz, .okay
	ld a, HIGH(Function110236)
	cp h
.okay
	call nz, Function1100b4
	ld hl, $c986
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret ; indirectly jump to the function loaded from the dw, which returns to Function3e60.

.dw
	dw Function110115
	dw Function110236
	dw Function110291
	dw Function1103ac
	dw Function110438
	dw Function1104c6
	dw Function110578
	dw Function110582
	dw Function11058c
	dw Function1105dd
	dw Function1106ef
	dw Function110757
	dw Function1107ff
	dw Function110899
	dw Function1108a3
	dw Function110905
	dw Function1109a4
	dw Function1109f9
	dw Function110a5b
	dw Function110c3c
	dw Function110c9e
	dw Function110ddd
	dw Function1111fe
	dw Function1113fe
	dw Function1100dc
	dw Function111541
	dw Function111596
	dw Function11162d
	dw Function11032c
	dw Function11148c
	dw Function111610
	dw Function1103ac
	dw Function110235
	dw Function111540

Function1100b4:
	push bc
.loop
	di
	ld a, [$c800]
	ld b, a
	ld a, [$c80b]
	ld c, a
	ld a, [$c822]
	ei
	or a
	bit 0, a
	jr z, .done
	ld a, b
	or a
	jr nz, .loop
	ld a, c
	cp $4
	jr z, .loop
	xor a
	ld [$c80f], a
	ld hl, $c821
	set 1, [hl]
	scf
.done
	pop bc
	ret

Function1100dc:
	xor a
	ldh [rTAC], a
	ld e, c
	ld b, a
	ld hl, Unknown_112089
	add hl, bc
	ld c, [hl]
	inc hl
	ldh a, [rKEY1]
	bit 7, a
	jr nz, .asm_1100f9
	ld a, e
	sra c
	ld a, e
	cp $4
	jr nc, .asm_1100f9
	ld de, $000f
	add hl, de

.asm_1100f9
	ld a, c
	ldh [rTMA], a
	ldh [rTIMA], a
	ld a, [hli]
	ld [$c81f], a
	ld [$c816], a
	ld a, [hl]
	ld [$c820], a
	ld [$c815], a
	ld c, $7
	ld a, $2
	ldh [c], a
	ld a, $6
	ldh [c], a
	ret

Function110115:
	ld hl, $c821
	bit 1, [hl]
	jr nz, .asm_110120
	xor a
	ld l, a
	ld h, a
	ret

.asm_110120
	res 1, [hl]
	ld a, [$c80f]
	ld e, a
	cp $22
	jr z, .asm_11016a
	cp $23
	jr z, .asm_11016a
	cp $25
	jr z, .asm_11016a
	cp $26
	jr z, .asm_11018e
	cp $24
	jr z, .asm_1101a4
	cp $30
	jp z, .asm_1101f8
	cp $31
	jp z, .asm_11020d
	cp $32
	jr z, .asm_1101a4
	cp $33
	jr z, .asm_1101a4
	swap a
	and $f
	cp $1
	jr z, .asm_11016a
	cp $0
	jr z, .asm_11015d
.asm_110158
	ld hl, 0
.asm_11015b
	ld a, e
	ret

.asm_11015d
	ld a, e
	add $15
	ld e, a
	xor a
	ld hl, $c810
	ld [hli], a
	ld [hl], a
	ld hl, $c821

.asm_11016a
	xor a
	ld [$c86d], a
	ld [hl], a
	ld [$c807], a
	inc a
	ld [$c86a], a
	ld hl, $c822
	res 0, [hl]
	res 5, [hl]
	ld hl, $cb47
	xor a
	ld [hli], a
	inc a
	ld [hl], a
	call Function111686
	ld a, $15
	cp e
	jr nz, .asm_110158
	jr .asm_1101d7

.asm_11018e
	ld a, [$c821]
	bit 4, a
	ld a, $1
	jr z, .asm_11016a
	ld a, $2
	ld [$c86a], a
	ld a, [$c805]
	ld [$c807], a
	jr .asm_110158

.asm_1101a4
	res 0, [hl]
	ld hl, $c822
	res 5, [hl]
	ld hl, $c821
	res 7, [hl]
	res 6, [hl]
	set 5, [hl]
	xor a
	ld [$c86d], a
	ld [$c9af], a
	ld a, $2
	ld [$c86a], a
	ld a, $4
	ld [$c807], a
	ld a, e
	cp $32
	jr z, .asm_1101d7
	cp $33
	jr z, .asm_1101d7
	cp $30
	jr z, .asm_1101d7
	cp $31
	jp nz, .asm_110158

.asm_1101d7
	ld hl, $c810
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $32
	cp e
	jp nz, .asm_11015b
	ld a, $3
	cp h
	jp nz, .asm_11015b
	dec a
	cp l
	jr z, .asm_1101f2
	dec a
	cp l
	jp nz, .asm_11015b

.asm_1101f2
	ld bc, $c880
	jp .asm_11015b

.asm_1101f8
	ld a, [$ca3c]
	cp $a4
	jr z, .asm_1101a4
	ld a, $3
	ld [$c86a], a
	ld hl, $c810
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp .asm_11015b

.asm_11020d
	ld a, [$c810]
	cp $2
	jr z, .asm_1101a4
	cp $3
	jr z, .asm_1101a4
	ld a, $4
	ld [$c86a], a
	ld hl, $c810
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp .asm_11015b

Function110226:
	ld a, $21

Function110228:
	ld [$c80f], a
	ld hl, $c821
	set 1, [hl]
	ret

Function110231:
	ld a, $20
	jr Function110228

Function110235:
	nop

Function110236:
	ld a, [$c988]
	push af
	push bc
	push hl
	xor a
	ldh [rTAC], a
	ldh a, [rIF]
	and $1b
	ldh [rIF], a
	call Function110029
	ld bc, $0452
	ld hl, $c800
.asm_11024e
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_11024e
	ld a, [$c822]
	set 6, a
	ld [$c822], a
	pop hl
	ld a, l
	ld [$c981], a
	ld a, h
	ld [$c982], a
	pop bc
	ld hl, $c983
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld hl, $c86e
	ld a, e
	ld [hli], a
	ld [hl], d
	xor a
	ld [$c819], a
	ld c, $c
	call Function1100dc
	call Function1104b0
	pop af
	cp $35
	jr nz, .asm_110289
	ld a, $2b
	jr .asm_11028b

.asm_110289
	ld a, $a

.asm_11028b
	ld [$c86a], a
	jp Function110432

Function110291:
	ld a, [$c821]
	bit 1, a
	jr z, .asm_1102a6
	ld a, [$c80f]
	cp $14
	jr z, .asm_1102b3
	cp $25
	jr z, .asm_1102b3
	ld a, [$c821]

.asm_1102a6
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $1
	jp nz, Function110226

.asm_1102b3
	xor a
	ldh [rTAC], a
	xor a
	ld [$c819], a
	ld a, l
	ld b, h
	ld hl, $c880
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld a, [$c870]
	ld c, a
	call Function1100dc
	ld hl, $c829
	ld a, $72
	ld [hli], a
	ld a, $c8
	ld [hl], a
	ld de, $cb47
	ld b, $5
	ld hl, Unknown_11205e
	call Function110000
	ld a, [$c882]
	ld c, a
	or a
	jr z, .asm_1102f2
	cp $80
	jr nc, .asm_1102f2
	ld c, $80
	jr .asm_1102f4

.asm_1102f2
	ld a, $80

.asm_1102f4
	ld b, a
	inc a
	ld [de], a
	inc de
	ld a, $80
	add c
	ld hl, $c882
	ld [hli], a
	ld a, [hl]
	ld [de], a
	inc de
	add $80
	ld [hl], a
	ld hl, $c880
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, b
	call Function110000
	ld a, l
	ld [$c880], a
	ld a, h
	ld [$c881], a
	ld b, c
	inc b
	call Function111f63
	call Function1104b0
	ld a, $2e
	ld [$c86a], a
	ld hl, $c821
	res 1, [hl]
	set 0, [hl]
	ret

Function11032c:
	ld a, [$c821]
	bit 1, a
	jp nz, Function110226
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $1
	jp nz, Function110226
	xor a
	ldh [rTAC], a
	ld [$c819], a
	ld hl, $c880
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld hl, $c829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld a, [$c870]
	ld c, a
	call Function1100dc
	ld de, $cb47
	ld b, $6
	ld hl, Unknown_112046
	call Function110000
	ld a, [$c883]
	ld [de], a
	inc de
	ld a, [$c882]
	ld c, a
	or a
	jr z, .asm_11037f
	cp $80
	jr nc, .asm_11037f
	ld c, $80
	jr .asm_110381

.asm_11037f
	ld a, $80

.asm_110381
	ld [de], a
	inc de
	ld b, $2
	call Function111f63
	call Function1104b0
	ld a, $2d
	ld [$c86a], a
	jp Function110432

Function110393:
	ld c, LOW(rIE)
	ldh a, [c]
	or (1 << SERIAL) | (1 << TIMER)
	ldh [c], a
	ret

Function11039a:
	ld b, $0
.asm_11039c
	inc b
	jr z, .asm_1103a3
	ld a, [hli]
	or a
	jr nz, .asm_11039c

.asm_1103a3
	ld a, b
	cp c
	jr nc, .asm_1103aa
	cp $2
	ret

.asm_1103aa
	scf
	ret

Function1103ac:
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $1
	jp nz, Function110226
	push hl
	ld c, $15
	call Function11039a
	jr c, .asm_1103d2
	ld c, $22
	call Function11039a
	jr c, .asm_1103d2
	ld c, $12
	call Function11039a
	jr nc, .asm_1103d6

.asm_1103d2
	pop hl
	jp Function110231

.asm_1103d6
	xor a
	ldh [rTAC], a
	ld [$c86d], a
	ld [$c97a], a
	ld a, [$c870]
	ld c, a
	call Function1100dc
	ld hl, $c829
	ld a, $80
	ld [hli], a
	ld a, $c8
	ld [hl], a
	call Function110485
	push hl
	ld b, a
	call Function111f63
	ld b, $5
	ld hl, Unknown_112037
	ld de, $cb74
	call Function110000
	inc de
	inc de
	pop hl
	ld bc, 0
	call Function110007
	ld a, c
	ld [$cb7a], a
	ld [$c86b], a
	push de
	inc de
	ld bc, 0
	ld a, $20
	call Function11000f
	ld l, e
	ld h, d
	pop de
	ld a, c
	ld [de], a
	ld a, [$c86b]
	add c
	add $a
	ld [$cb79], a
	call Function1104b0
	ld a, $b
	ld [$c86a], a

Function110432:
	ld hl, $c821
	set 0, [hl]
	ret

Function110438:
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $1
	jp nz, Function110226
	push hl
	ld c, $15
	call Function11039a
	jr nc, .asm_110454
	pop hl
	jp Function110231

.asm_110454
	xor a
	ldh [rTAC], a
	ld [$c97a], a
	ld a, [$c870]
	ld c, a
	call Function1100dc
	ld hl, $c98f
	ld a, $81
	ld [hli], a
	ld a, $c8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $ff
	ld [$c86e], a
	call Function110485
	ld b, a
	call Function111f63
	call Function1104b0
	ld a, $c
	ld [$c86a], a
	jr Function110432

Function110485:
	ld de, $cb47
	ld hl, Unknown_11201d
	ld b, $6
	call Function110000
	pop bc
	pop hl
	push bc
	ld a, [$c818]
	cp $8c
	jr c, .asm_11049e
	ld a, $3
	jr .asm_1104a1

.asm_11049e
	ld a, [$c871]

.asm_1104a1
	ld [de], a
	inc de
	ld bc, $0001
	ld a, $14
	call Function11000f
	ld a, c
	ld [$cb4c], a
	ret

Function1104b0:
	xor a
	ld [$c81e], a
	call Function110393
	xor a
	ld [$c86b], a
	ld de, $0001
	ld hl, Unknown_112000
	ld b, $1
	jp Function111f07

Function1104c6:
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $4
	jr z, .asm_110526
	cp $3
	jr z, .asm_110526
	cp $2
	jp nz, Function110226
	ld hl, $c822
	bit 4, [hl]
	jr nz, .asm_110507
	ld a, $2
	ld [$c86b], a
	ld a, $a2
	ld [$c81e], a
	ld de, $000a
	ld hl, Unknown_11203c
	ld b, $5
	call Function111f07
.asm_1104fa
	ld a, $e
	ld [$c86a], a
	ld hl, $c821
	set 0, [hl]
	res 3, [hl]
	ret

.asm_110507
	ld a, [$c807]
	or a
	jr nz, .asm_11051f
	ld a, $1
	ld [$c86a], a
	ld hl, $c822
	res 4, [hl]
	ld hl, $c821
	ld a, [hl]
	and $17
	ld [hl], a
	ret

.asm_11051f
	ld a, $2
	ld [$c86b], a
	jr .asm_1104fa

.asm_110526
	call Function112724
	xor a
	ld [$c86b], a
	ld de, $cb67
	ld hl, Unknown_112072
	ld b, $6
	call Function110000
	ld a, [$c86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	ld a, $7
	ld [de], a
	inc de
	ld a, [$c86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120c1
	call Function110007
	ld b, c
	call Function111f63
	ld a, $95
	ld [$c81e], a
	ld hl, $cb47
	ld b, $5
	call Function111f07
	ld a, $e
	ld [$c86a], a
	jp Function110432

Function110578:
	ld b, $25
	call Function110596
	or a
	jp nz, Function1135ba
	ret

Function110582:
	ld b, $26
	call Function110596
	or a
	jp nz, Function11359d
	ret

Function11058c:
	ld b, $27
	call Function110596
	or a
	jp nz, Function1135ad
	ret

Function110596:
	ld a, [$c821]
	bit 0, a
	jr nz, .asm_1105d9
	ld a, [$c86a]
	cp $1
	jr nz, .asm_1105d9
	ld a, [$c835]
	or a
	ret nz
	ld a, b
	ld [$cb36], a
	xor a
	ldh [rTAC], a
	ld a, e
	ld [$c86e], a
	ld a, d
	ld [$c86f], a
	xor a
	ld [$c819], a
	ld a, [$c870]
	ld c, a
	call Function1100dc
	ld hl, $c829
	ld a, $80
	ld [hli], a
	ld a, $c8
	ld [hl], a
	call Function1104b0
	ld a, [$cb36]
	ld [$c86a], a
	xor a
	jp Function110432

.asm_1105d9
	pop hl
	jp Function110226

Function1105dd:
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $1
	jp nz, Function110226
	xor a
	ldh [rTAC], a
	ld a, [$c870]
	ld c, a
	call Function1100dc
	ld hl, $c98f
	ld a, $81
	ld [hli], a
	ld a, $c8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $ff
	ld [$c86e], a
	call Function1104b0
	ld a, $d
	ld [$c86a], a
	jp Function110432

Function110615:
	ld b, $15
	ld [$c86e], a
	or a
	jr z, .asm_110625
	dec a
	jr z, .asm_11062c
	dec a
	jp z, .asm_1106c1
	ret

.asm_110625
	ld a, $19
	ld hl, $c83e
	jr .asm_110631

.asm_11062c
	ld a, $6e
	ld hl, $c852

.asm_110631
	push hl
	push bc
	ld [$cba2], a
	ld hl, $c829
	ld a, $9d
	ld [hli], a
	ld a, $cb
	ld [hl], a
	xor a
	ld [$cba1], a
	ld [$c86b], a
	ld [$c9af], a
	ld de, $cb97
	ld hl, Unknown_11207d
	ld b, $6
	call Function110000
	ld de, $cb47
	ld hl, Unknown_112063
	ld b, $5
	call Function110000
	pop bc
	pop hl
	push de
	inc de
	ld a, b
	ld bc, 0
	call Function11000f
	ld a, c
	pop hl
	ld [hl], a
	ld b, c
	call Function111f63
	ld a, [$c86e]
	cp $2
	jr nz, .asm_1106ac
	ld a, [$cabc]
	or a
	jr z, .asm_1106ac
	ld hl, $c995
	ld a, [hli]
	cp $99
	jr nz, .asm_1106ac
	ld a, [hli]
	cp $66
	jr nz, .asm_1106ac
	ld a, [hli]
	cp $23
	jr nz, .asm_1106ac
	ld a, $2
	ld [$c86e], a
	dec a
	ld [$c86b], a
	ld a, $a3
	ld de, $0010
	ld hl, $c995
	call Function111f02
	ld a, $f
	ld [$c86a], a
	jp Function110432

.asm_1106ac
	ld hl, $cb47
	ld a, $a8
	ld [$c81e], a
	ld b, $5
	call Function111f07
	ld a, $f
	ld [$c86a], a
	jp Function110432

.asm_1106c1
	ld b, $50
	ld hl, $c876
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $0007
	add hl, de
	ld de, $c8ff
.asm_1106d0
	ld a, [hli]
	ld [de], a
	cp $2f
	jr z, .asm_1106da
	inc de
	dec b
	jr nz, .asm_1106d0

.asm_1106da
	xor a
	ld [de], a
	dec hl
	ld a, l
	ld [$c876], a
	ld a, h
	ld [$c877], a
	ld hl, $c8ff
	ld a, $50
	ld b, $40
	jp .asm_110631

Function1106ef:
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $2
	jp nz, Function110226
	ld a, [$c86d]
	or a
	jp nz, Function110226
	push hl
	ld c, $20
	call Function11039a
	jr nc, .asm_110712
	pop hl
	jp Function110231

.asm_110712
	xor a
	ld [$c86b], a
	ld de, $cba7
	ld hl, Unknown_112072
	ld b, $6
	call Function110000
	ld de, $cbb7
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	inc de
	inc de
	ld bc, $0001
	ld hl, Unknown_11209e
	call Function110007
	pop hl
	push hl
	ld b, $ff
.asm_11073b
	inc b
	ld a, [hli]
	or a
	jr z, .asm_110744
	cp $40
	jr nz, .asm_11073b

.asm_110744
	ld a, c
	add b
	add $2
	ld [$cbbc], a
	pop hl
	call Function110000
	call Function11295e
	ld a, $0
	jp Function110615

Function110757:
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $3
	jp nz, Function110226
	ld a, [$c98a]
	or a
	jp nz, Function110226
	push hl
.asm_11076f
	ld a, [hli]
	or a
	jr nz, .asm_11076f
	ld a, [hl]
	or a
	jp z, .asm_1107fb
	pop hl
	push hl
	ld c, $20
	call Function11039a
	jr c, .asm_1107fb
.asm_110781
	ld c, $81
	call Function11039a
	jr c, .asm_1107fb
	xor a
	cp [hl]
	jr nz, .asm_110781
	call Function112724
	xor a
	ld [$c86b], a
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $6
	call Function110000
	ld a, [$c86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, $cb53
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	ld de, $cb59
	ld a, [$c86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld de, $cb5a
	ld hl, Unknown_1120a4
	call Function110007
	pop hl
	call Function110007
	ld a, $3e
	ld [de], a
	inc de
	inc c
	ld a, l
	ld [$c87c], a
	ld a, h
	ld [$c87d], a
	call Function11295e
	ld a, c
	ld [$cb58], a
	ld b, c
	call Function111f63
	ld a, $95
	ld [$c81e], a
	ld hl, $cb53
	ld d, $0
	ld e, c
	ld b, $5
	call Function111f07
	ld a, $15
	ld [$c86a], a
	jp Function110432

.asm_1107fb
	pop hl
	jp Function110231

Function1107ff:
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $3
	jp nz, Function110226
	ld a, [$c98a]
	or a
	jp z, Function110226
	ld a, c
	or b
	jp z, Function110231
	ld a, l
	ld [$c87c], a
	ld a, h
	ld [$c87d], a
	ld hl, $c87e
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, d
	ld [$c86f], a
	call Function112724
	ld hl, $c98a
	ld a, [hl]
	and $1
	xor $1
	ld [$c86b], a
	inc [hl]
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $6
	call Function110000
	ld de, $cb4d
	ld a, [$c86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, $cbdd
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	ld de, $cbe3
	ld a, [$c86c]
	ld [de], a
	ld a, [$c86b]
	or a
	jr nz, .asm_110891
	ld bc, $0001
	ld de, $cbe4
	ld hl, Unknown_1120ba
	call Function110007
	ld a, c
	ld [$cbe2], a
	ld b, c
	call Function111f63
	ld a, $95
	ld [$c81e], a
	ld de, $0011
	ld hl, $cbdd
	ld b, $5
	call Function111f07

.asm_110891
	ld a, $16
	ld [$c86a], a
	jp Function110432

Function110899:
	ld a, [$c86a]
	cp $3
	jp nz, Function110226
	jr Function1108ab

Function1108a3:
	ld a, [$c86a]
	cp $4
	jp nz, Function110226

Function1108ab:
	ld hl, $c821
	bit 0, [hl]
	jp nz, Function110226
	call Function112724
	xor a
	ld [$c86b], a
	ld de, $cb67
	ld hl, Unknown_112072
	ld b, $6
	call Function110000
	ld a, [$c86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	ld a, $7
	ld [de], a
	inc de
	ld a, [$c86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120c1
	call Function110007
	ld b, c
	call Function111f63
	ld a, $95
	ld [$c81e], a
	ld hl, $cb47
	ld b, $5
	call Function111f07
	ld a, $17
	ld [$c86a], a
	jp Function110432

Function110905:
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $2
	jp nz, Function110226
	ld a, [$c86d]
	or a
	jp nz, Function110226
	xor a
	ld [$c86b], a
	push hl
	ld c, $20
	call Function11039a
	jr c, .asm_11092f
	ld c, $22
	call Function11039a
	jr nc, .asm_110933

.asm_11092f
	pop hl
	jp Function110231

.asm_110933
	ld de, $cba7
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	inc de
	inc de
	ld hl, Unknown_1120c8
	call Function110007
	pop hl
	push hl
	ld b, $ff
.asm_11094a
	inc b
	ld a, [hli]
	or a
	jr z, .asm_110953
	cp $40
	jr nz, .asm_11094a

.asm_110953
	ld a, b
	add $6
	ld c, a
	ld [$cbac], a
	pop hl
	ld de, $cbb3
	call Function110000
.asm_110961
	ld a, [hli]
	or a
	jr nz, .asm_110961
	call Function11295e
	ld a, c
	ld [$cbac], a
	ld bc, $0006
	ld de, $cbf3
	ld a, $20
	call Function11000f
	call Function11295e
	ld a, c
	ld [$cbec], a
	ld de, $cbe7
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	ld de, $cbee
	ld hl, Unknown_1120ce
	ld b, $5
	call Function110000
	ld de, $cbc7
	ld hl, Unknown_112072
	ld b, $6
	call Function110000
	ld a, $1
	jp Function110615

Function1109a4:
	ld hl, $c821
	bit 0, [hl]
	jp nz, Function110226
	ld a, [$c86a]
	cp $4
	jp nz, Function110226
	ld a, e
	ld [$c86e], a
	ld a, d
	ld [$c86f], a
	xor a
	ld [$c86b], a
	call Function112729
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	ld a, $7
	ld [de], a
	inc de
	ld a, [$c86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120d4
	call Function110007
	ld b, c
	call Function111f63
	ld a, $95
	ld [$c81e], a
	ld hl, $cb47
	ld b, $5
	call Function111f07
	ld a, $18
	ld [$c86a], a
	jp Function110432

Function1109f9:
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $4
	jp nz, Function110226
	xor a
	ld [$c86b], a
	ld a, e
	ld [$c86e], a
	ld a, d
	ld [$c86f], a
	ld a, l
	or h
	jp z, Function110231
	push hl
	call Function112729
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	ld a, $d
	ld [de], a
	inc de
	ld a, [$c86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120db
	call Function110007
	ld de, $cb53
	pop hl
	call Function110d37
	ld b, c
	call Function111f63
	ld a, $95
	ld [$c81e], a
	ld hl, $cb47
	ld b, $5
	call Function111f07
	ld a, $1d
	ld [$c86a], a
	jp Function110432

Function110a5b:
	ld a, [$c821]
	bit 2, a
	jr z, .asm_110a6d
	ld a, [$c86a]
	cp $1a
	jp nz, Function110226
	jp Function110af4

.asm_110a6d
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $4
	jp nz, Function110226
	ld a, l
	or h
	jp z, Function110231
	ld a, l
	ld [$c86e], a
	ld a, h
	ld [$c86f], a
	ld hl, $c827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc de
	inc de
	dec bc
	dec bc
	ld hl, $c98f
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld hl, $c829
	ld a, $80
	ld [hli], a
	ld a, $c8
	ld [hli], a
	ld a, $80
	ld [hli], a
	xor a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	xor a
	ld [$c86b], a
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	ld a, $d
	ld [de], a
	inc de
	ld a, [$c86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120e8
	call Function110007
	ld de, $cb53
	ld hl, $c86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function110d37
	ld b, c
	call Function111f63
	ld a, $95
	ld [$c81e], a
	ld hl, $cb47
	ld b, $5
	call Function111f07
	ld a, $1a
	ld [$c86a], a
	jp Function110432

Function110af4:
	ld hl, $c827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc de
	inc de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld e, [hl]
	ld a, b
	or c
	ld [$c86e], a
	ld [$c86f], a
	jr z, .asm_110b5c
	dec bc
	dec bc
	ld a, [$c993]
	or a
	jp nz, .asm_110bd5
	ld a, [$c994]
	or a
	jr z, .asm_110b1c
	ld e, a

.asm_110b1c
	xor a
	ld [$c994], a
	cp b
	jr nz, .asm_110b5c
	ld a, e
	cp c
	jr c, .asm_110b5c
	push bc
	sub c
	ld [hl], a
	ld b, c
	ld hl, $c82d
	ld a, [$c993]
	add c
	ld [hli], a
	ld a, b
	adc 0
	ld [hl], a
	xor a
	ld [$c993], a
	ld hl, $ca3f
	ld a, [hli]
	inc hl
	sub e
	dec a
	ld e, a
	ld d, $0
	add hl, de
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	call Function110000
	pop bc
	ld hl, $c827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	ld [hli], a
	ld [hl], b
	ret

.asm_110b5c
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, $c82d
	ld a, [$c993]
	add e
	ld [hli], a
	ld a, 0
	adc 0
	ld [hl], a
	xor a
	ld [$c993], a
	ld a, [$c86e]
	or a
	jr z, .asm_110b9b
	ld b, e
	ld hl, $ca3f
	ld a, [hli]
	inc hl
	sub e
	dec a
	ld e, a
	ld d, $0
	add hl, de
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	call Function110000
	ld hl, $c829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a

.asm_110b9b
	call Function1127f3
	jr z, .asm_110bbb
	di
	ld hl, $c821
	res 2, [hl]
	ld a, $1
	ld [$c86b], a
	ld de, $000b
	ld a, $95
	ld [$c81e], a
	ld hl, $cbc7
	ld b, $5
	jp Function111f07

.asm_110bbb
	ld a, $4
	ld [$c86a], a
	ld hl, $c821
	res 0, [hl]
	res 2, [hl]
	ld hl, $c827
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, $c82d
	ld b, $2
	jp Function110000

.asm_110bd5
	ld e, a
	xor a
	cp b
	jr nz, .asm_110c05
	ld a, e
	cp c
	jr c, .asm_110c05
	ld b, c
	ld hl, $c993
	ld a, [hl]
	sub c
	ld [hl], a
	ld a, $80
	sub e
	ld e, a
	ld d, $0
	ld hl, $c880
	add hl, de
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	call Function110000
	ld hl, $c827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	ld [hli], a
	xor a
	ld [hl], a
	ret

.asm_110c05
	push hl
	push bc
	ld a, [$c993]
	ld b, a
	ld a, $80
	sub e
	ld e, a
	ld d, $0
	ld hl, $c880
	add hl, de
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	call Function110000
	ld a, e
	ld [$c829], a
	ld a, d
	ld [$c82a], a
	pop bc
	ld a, [$c993]
	ld e, a
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	ld a, [$c994]
	ld e, a
	pop hl
	jp .asm_110b1c

Function110c3c:
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $4
	jp nz, Function110226
	ld a, l
	or h
	jp z, Function110231
	ld a, l
	ld [$c86e], a
	ld a, h
	ld [$c86f], a
	call Function112729
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	ld a, $d
	ld [de], a
	inc de
	ld a, [$c86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_1120f5
	call Function110007
	ld de, $cb53
	ld hl, $c86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function110d37
	ld b, c
	call Function111f63
	ld a, $95
	ld [$c81e], a
	ld hl, $cb47
	ld b, $5
	call Function111f07
	ld a, $1b
	ld [$c86a], a
	jp Function110432

Function110c9e:
	ld a, [$c821]
	bit 2, a
	jr z, .asm_110cb0
	ld a, [$c86a]
	cp $1c
	jp nz, Function110226
	jp Function110af4

.asm_110cb0
	bit 0, a
	jp nz, Function110226
	ld a, [$c86a]
	cp $4
	jp nz, Function110226
	ld a, l
	or h
	jp z, Function110231
	ld a, l
	ld [$c86e], a
	ld a, h
	ld [$c86f], a
	ld hl, $c827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc de
	inc de
	dec bc
	dec bc
	ld hl, $c98f
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld hl, $c829
	ld a, $80
	ld [hli], a
	ld a, $c8
	ld [hli], a
	ld a, $80
	ld [hli], a
	xor a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	xor a
	ld [$c86b], a
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	ld a, $e
	ld [de], a
	inc de
	ld a, [$c86c]
	ld [de], a
	inc de
	ld bc, $0001
	ld hl, Unknown_112102
	call Function110007
	ld de, $cb52
	ld hl, $c86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function110d37
	ld b, c
	call Function111f63
	ld a, $95
	ld [$c81e], a
	ld hl, $cb47
	ld b, $5
	call Function111f07
	ld a, $1c
	ld [$c86a], a
	jp Function110432

Function110d37:
	push bc
	push de
	ld b, 0
.check_under_10k
	ld a, HIGH(10000)
	cp h
	jr c, .subtract_10k
	jr nz, .done_10k
	ld a, LOW(10000)
	cp l
	jr z, .subtract_10k
	jr nc, .done_10k

.subtract_10k
	inc b
	ld a, b
	ld bc, -10000
	add hl, bc
	ld b, a
	jr .check_under_10k

.done_10k
	ld a, $30
	or b
	ld [de], a
	inc de
	ld b, 0
.check_under_1k
	ld a, HIGH(1000)
	cp h
	jr c, .subtract_1k
	jr nz, .done_1k
	ld a, LOW(1000)
	cp l
	jr z, .subtract_1k
	jr nc, .done_1k

.subtract_1k
	inc b
	ld a, b
	ld bc, -1000
	add hl, bc
	ld b, a
	jr .check_under_1k

.done_1k
	ld a, $30
	or b
	ld [de], a
	inc de
	ld b, 0
.check_under_100
	ld a, HIGH(100)
	cp h
	jr nz, .subtract_100
	ld a, LOW(100)
	cp l
	jr z, .subtract_100
	jr nc, .check_under_10

.subtract_100
	inc b
	ld a, b
	ld bc, -100
	add hl, bc
	ld b, a
	jr .check_under_100

.check_under_10
	ld a, $30
	or b
	ld [de], a
	inc de
	ld b, $0
	ld a, l
.subtract_10
	cp 10
	jr c, .done_10
	sub 10
	inc b
	jr .subtract_10

.done_10
	ld l, a
	ld a, $30
	or b
	ld [de], a
	inc de
	ld a, $30
	or l
	ld [de], a
	pop de
	ld l, e
	ld h, d
	ld b, $5
.find_first_digit
	ld a, [hl]
	cp $30
	jr nz, .found_first_digit
	inc hl
	dec b
	jr nz, .find_first_digit
	jr .done

.found_first_digit
	ld a, $5
	cp b
	jr z, .done
	sub b
	ld c, a
	ld a, [$cb4c]
	sub c
	ld c, a
	ld [$cb4c], a
	push hl
	ld b, $1
.penultimate_loop
	inc b
	ld a, [hli]
	cp $d
	jr nz, .penultimate_loop
	pop hl
	call Function110000
	pop hl
	ret

.done
	pop bc
.last_loop
	ld a, [de]
	inc de
	cp $a
	jr nz, .last_loop
	ret

Function110ddd:
	ld a, [$c821]
	bit 2, a
	ld a, [$c86a]
	jr z, .asm_110e00
	cp $13
	jp z, Function111044
	cp $1f
	jp z, Function111044
	cp $21
	jp z, Function111044
	jp Function110226

.asm_110df9
	pop hl
.asm_110dfa
	pop hl
	pop hl
	pop hl
.asm_110dfd
	jp Function110231

.asm_110e00
	cp $2
	jp nz, Function110226
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86d]
	or a
	jp nz, Function110226
	ld a, l
	ld [$c9b5], a
	ld a, h
	ld [$c9b6], a
	xor a
	ld [$c989], a
	ld [$c9a5], a
	ld [$c98a], a
	ld [$c993], a
	ld a, [hli]
	ld [$c833], a
	ld a, [hli]
	ld [$c834], a
	inc hl
	inc hl
	ld a, l
	ld [$c97f], a
	ld a, h
	ld [$c980], a
	dec hl
	dec hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $80
	cp l
	jr nz, .asm_110e4a
	ld a, $c8
	cp h
	jr z, .asm_110dfd

.asm_110e4a
	push hl
	push de
	push bc
	push hl
	ld b, URIPrefix.End - URIPrefix
	ld de, URIPrefix
.asm_110e53
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_110df9
	inc hl
	dec b
	jr nz, .asm_110e53
	push hl
	ld b, HTTPUploadURL.End - HTTPUploadURL
	ld c, $0
	ld de, HTTPUploadURL
.asm_110e64
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_110e70
	inc hl
	dec b
	jr nz, .asm_110e64
	pop hl
	jr .asm_110df9

.asm_110e70
	pop hl
	push hl
	ld b, HTTPRankingURL.End - HTTPRankingURL
	ld c, $0
	ld de, HTTPRankingURL
.asm_110e79
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_110e86
	inc hl
	dec b
	jr nz, .asm_110e79
	pop hl
	jp .asm_110df9

.asm_110e86
	pop hl
	push hl
	ld b, HTTPUtilityURL.End - HTTPUtilityURL
	ld c, $0
	ld de, HTTPUtilityURL
.asm_110e8f
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_110ea2
	inc hl
	dec b
	jr nz, .asm_110e8f
	pop hl
	ld a, $1
	ld [$c98a], a
	ld c, $1
	jr .asm_110eb3

.asm_110ea2
	pop hl
	ld b, HTTPDownloadURL.End - HTTPDownloadURL
	ld c, $0
	ld de, HTTPDownloadURL
.asm_110eaa
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_110ecb
	inc hl
	dec b
	jr nz, .asm_110eaa

.asm_110eb3
	ld hl, $c97f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, $12
	call Function11039a
	jp c, .asm_110df9
	ld c, $12
	call Function11039a
	jp c, .asm_110df9
	ld c, $1

.asm_110ecb
	ld a, c
	ld [$c98f], a
	ld [$cabc], a
	pop hl
	call Function1111d7
	ld a, b
	cp $4
	jr c, .asm_110ee3
	jp nz, .asm_110dfa
	xor a
	or c
	jp nz, .asm_110dfa

.asm_110ee3
	ld hl, $c98b
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	pop bc
	pop de
	pop hl
	ld a, l
	ld [$c876], a
	ld a, h
	ld [$c877], a
	ld hl, $c872
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc hl
	inc hl
	xor a
	ld [$c994], a

Function110f07:
	ld hl, $c833
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .asm_110f12
	xor a
	ld [hl], a

.asm_110f12
	ld hl, $c991
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, $c866
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	jr nz, .asm_110f28
	ld a, $2
	jp Function110615

.asm_110f28
	ld a, $2
	ld [$c86e], a
	ld a, $1f
	ld [$cb51], a
	ld a, $90
	ld [$cb52], a
	ld a, $1
	ld [$c86b], a
	ld de, $cb47
	ld hl, Unknown_11207d
	ld b, $6
	call Function110000
	ld hl, $c866
	ld b, $4
	call Function110000
	inc de
	inc de
	ld b, $6
	call Function111f63
	ld a, [$cabc]
	or a
	jr z, .asm_110f95
	ld hl, $c995
	ld a, [hli]
	cp $99
	jr nz, .asm_110f8a
	ld a, [hli]
	cp $66
	jr nz, .asm_110f8a
	ld a, [hli]
	cp $23
	jr nz, .asm_110f8a
	ld a, $2
	ld [$c86e], a
	dec a
	ld [$c86b], a
	ld a, $a3
	ld de, $0010
	ld hl, $c995
	call Function111f02
	ld a, $f
	ld [$c86a], a
	jp Function110432

.asm_110f8a
	ld hl, $cb47
	ld de, $c995
	ld b, $10
	call Function110000

.asm_110f95
	ld de, $0010
	ld hl, $cb47
	ld a, $a3
	ld [$c81e], a
	ld b, $5
	call Function111f07
	ld a, $f
	ld [$c86a], a
	jp Function110432

URIPrefix:
	db "http://"
.End

HTTPDownloadURL:
	db "gameboy.datacenter.ne.jp/cgb/download"
.End

HTTPUploadURL:
	db "gameboy.datacenter.ne.jp/cgb/upload"
.End

HTTPUtilityURL:
	db "gameboy.datacenter.ne.jp/cgb/utility"
.End

HTTPRankingURL:
	db "gameboy.datacenter.ne.jp/cgb/ranking"
.End

Function111044:
	ld hl, $c827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc de
	inc de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld e, [hl]
	ld a, b
	or c
	ld [$c86e], a
	ld [$c86f], a
	dec bc
	dec bc
	jp z, Function1111ca
	ld a, [$c991]
	or a
	call nz, Function11115f
	xor a
	cp e
	jp z, .asm_1110eb
	xor a
	cp b
	jr nz, .asm_1110ac
	ld a, e
	cp c
	jr c, .asm_1110ac
	push bc
	sub c
	ld [hl], a
	ld b, c
	ld hl, $c82d
	ld a, c
	ld [hli], a
	xor a
	ld [hl], a
	ld hl, $ca3f
	ld a, [hli]
	inc hl
	sub e
	dec a
	ld e, a
	ld d, $0
	add hl, de
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	call Function110000
	pop bc
	ld a, [$c991]
	ld l, a
	ld h, $0
	add hl, bc
	ld c, l
	ld b, h
	xor a
	ld [$c991], a
	ld hl, $c827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	ld [hli], a
	ld [hl], b
	ret

.asm_1110ac
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, $c82d
	ld a, [$c991]
	add e
	ld [hli], a
	ld a, 0
	adc 0
	ld [hl], a
	xor a
	ld [$c991], a
	ld a, [$c86e]
	or a
	jr z, .asm_1110eb
	ld b, e
	ld hl, $ca3f
	ld a, [hli]
	inc hl
	sub e
	dec a
	ld e, a
	ld d, $0
	add hl, de
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	call Function110000
	ld hl, $c829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a

.asm_1110eb
	di
	ld a, $2
	ld [$c989], a
	ld hl, $c821
	res 2, [hl]
	ld a, [$ca3c]
	cp $9f
	jr z, .asm_111144
	ld de, $000b
	ld a, $95
	ld [$c81e], a
	ld hl, $cb47
	ld b, $5
	call Function111f07
	ld a, $1
	ld [$c86b], a
	ret

	ld hl, $c827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$c82d]
	ld [hli], a
	ld a, [$c82e]
	ld [hl], a
	ld hl, $c98f
	inc [hl]
	ld a, $f
	ld [$c86a], a
	ld a, $1
	ld [$c86b], a
	ld a, [$c86d]
	ld [$c86e], a
	xor a
	ld [$c989], a
	ld a, $a3
	ld de, $0010
	ld hl, $c995
	jp Function111f02

.asm_111144
	res 0, [hl]
	ld hl, $c827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$c82d]
	ld [hli], a
	ld a, [$c82e]
	ld [hl], a
	ld a, $2
	ld [$c86a], a
	xor a
	ld [$c86d], a
	ei
	ret

Function11115f:
	ld e, a
	xor a
	cp b
	jr nz, .asm_111168
	ld a, c
	cp e
	jr c, .asm_1111a2

.asm_111168
	push hl
	push bc
	ld b, e
	ld c, e
	ld a, [$c993]
	sub e
	ld e, a
	ld d, $0
	ld hl, $c880
	add hl, de
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	call Function110000
	ld hl, $c829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld e, c
	ld a, c
	ld hl, $c82d
	ld [hli], a
	xor a
	ld [hl], a
	pop bc
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	ld a, [$c992]
	ld [$c82b], a
	ld e, a
	pop hl
	ret

.asm_1111a2
	ld a, e
	sub c
	ld [$c991], a
	ld a, [$c993]
	sub e
	ld e, a
	ld d, $0
	ld hl, $c880
	add hl, de
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	ld b, c
	call Function110000
	ld hl, $c827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	ld [hli], a
	xor a
	ld [hl], a
	pop af
	ret

Function1111ca:
	ld hl, $c821
	res 2, [hl]
	ld a, $6
	ld [$c86b], a
	jp Function112430

Function1111d7:
	push hl
	ld hl, $c866
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	pop hl
	jr nz, .asm_1111ee
	ld de, $0007
	add hl, de
.asm_1111e8
	ld a, [hli]
	cp $2f
	jr nz, .asm_1111e8
	dec hl

.asm_1111ee
	ld bc, -1
.asm_1111f1
	ld a, [hli]
	inc bc
	or a
	jr nz, .asm_1111f1
	ld hl, $c87a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ret

Function1111fe:
	ld a, [$c821]
	bit 2, a
	ld a, [$c86a]
	jp nz, Function1113ea
	cp $2
	jp nz, Function110226
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	ld a, [$c86d]
	or a
	jp nz, Function110226
	xor a
	ld [$c989], a
	ld [$c98a], a
	ld [$c993], a
	push hl
	push de
	push bc
	push hl
rept 4
	inc hl
endr
	ld a, [hli]
	ld [$c833], a
	ld a, [hli]
	ld [$c834], a
	inc hl
	inc hl
	ld a, l
	ld [$c97f], a
	ld a, h
	ld [$c980], a
	dec hl
	dec hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $80
	cp l
	jr nz, .asm_111251
	ld a, $c8
	cp h
	jp z, Function1113f7

.asm_111251
	ld b, URIPrefix.End - URIPrefix
	ld de, URIPrefix
.asm_111256
	ld a, [de]
	inc de
	cp [hl]
	jp nz, Function1113f7
	inc hl
	dec b
	jr nz, .asm_111256
	push hl
	ld b, HTTPDownloadURL.End - HTTPDownloadURL
	ld c, $0
	ld de, HTTPDownloadURL
.asm_111268
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_111275
	inc hl
	dec b
	jr nz, .asm_111268
	pop hl
	jp Function1113f7

.asm_111275
	pop hl
	push hl
	ld b, HTTPRankingURL.End - HTTPRankingURL
	ld c, $0
	ld de, HTTPRankingURL
.asm_11127e
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_11128f
	inc hl
	dec b
	jr nz, .asm_11127e
	ld a, $2
	ld [$c98a], a
	pop hl
	jr .asm_1112a0

.asm_11128f
	pop hl
	ld b, HTTPUploadURL.End - HTTPUploadURL
	ld c, $0
	ld de, HTTPUploadURL
.asm_111297
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_1112cc
	inc hl
	dec b
	jr nz, .asm_111297

.asm_1112a0
	ld a, [hli]
	or a
	jr nz, .asm_1112a0
.asm_1112a4
	ld a, [hld]
	cp $2f
	jr nz, .asm_1112a4
	inc hl
	inc hl
	ld a, [hl]
	cp $30
	jr c, .asm_1112cc
	cp $3a
	jr nc, .asm_1112cc
	ld hl, $c97f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, $12
	call Function11039a
	jp c, Function1113f7
	ld c, $12
	call Function11039a
	jp c, Function1113f7
	ld c, $1

.asm_1112cc
	ld a, c
	ld [$c98f], a
	ld [$cabc], a
	pop hl
	ld de, $0006
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function1111d7
	ld a, b
	cp $4
	jr c, .asm_1112eb
	jp nz, Function1113f8
	xor a
	or c
	jp nz, Function1113f8

.asm_1112eb
	pop bc
	pop de
	pop hl
	ld a, l
	ld [$c876], a
	ld a, h
	ld [$c877], a
	ld hl, $c872
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc hl
	inc hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	call Function111335
	ld hl, $c876
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld [$c9aa], a
	ld a, [hli]
	ld [$c9ab], a
	ld a, [hli]
	ld [$c9ac], a
	ld a, [hli]
	ld [$c9ad], a
	inc hl
	inc hl
	ld a, [hli]
	ld [$c876], a
	ld a, [hl]
	ld [$c877], a
	ld a, [$c98f]
	xor $1
	ld [$c994], a
	jp Function110f07

Function111335:
	ld hl, $c876
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	xor a
	ld [$c8c9], a
.asm_111344
	ld de, $8ad0
	add hl, de
	jr nc, .asm_11134e
	add $3
	jr .asm_111344

.asm_11134e
	ld de, $7530
	add hl, de
.asm_111352
	ld de, $d8f0
	add hl, de
	jr nc, .asm_11135b
	inc a
	jr .asm_111352

.asm_11135b
	ld de, $2710
	add hl, de
	ld [$c8c6], a
	xor a
.asm_111363
	ld de, $f448
	add hl, de
	jr nc, .asm_11136d
	add $30
	jr .asm_111363

.asm_11136d
	ld de, $0bb8
	add hl, de
.asm_111371
	ld de, $fc18
	add hl, de
	jr nc, .asm_11137b
	add $10
	jr .asm_111371

.asm_11137b
	ld de, $03e8
	add hl, de
.asm_11137f
	ld de, $fed4
	add hl, de
	jr nc, .asm_111389
	add $3
	jr .asm_11137f

.asm_111389
	ld de, $012c
	add hl, de
.asm_11138d
	ld de, $ff9c
	add hl, de
	jr nc, .asm_111396
	inc a
	jr .asm_11138d

.asm_111396
	ld de, $0064
	add hl, de
	ld [$c8c7], a
	xor a
.asm_11139e
	ld de, $ffe2
	add hl, de
	jr nc, .asm_1113a8
	add $30
	jr .asm_11139e

.asm_1113a8
	ld de, $001e
	add hl, de
.asm_1113ac
	ld de, $fff6
	add hl, de
	jr nc, .asm_1113b6
	add $10
	jr .asm_1113ac

.asm_1113b6
	ld de, $000a
	add hl, de
	add l
	ld [$c8c8], a
	ld de, $c9a5
	ld hl, $c8c6
	ld a, [hli]
	or $30
	ld [de], a
	inc de
	ld a, [hl]
	swap a
	and $f
	or $30
	ld [de], a
	inc de
	ld a, [hli]
	and $f
	or $30
	ld [de], a
	inc de
	ld a, [hl]
	swap a
	and $f
	or $30
	ld [de], a
	inc de
	ld a, [hl]
	and $f
	or $30
	ld [de], a
	inc de
	ret

Function1113ea:
	cp $14
	jp z, Function111044
	cp $24
	jp z, Function111044
	jp Function110226

Function1113f7:
	pop hl

Function1113f8:
	pop hl
	pop hl
	pop hl
	jp Function110231

Function1113fe:
	ld a, [$c822]
	bit 4, a
	jp z, .asm_11147f
	bit 7, a
	jp nz, .asm_11147f
	ld a, [$c821]
	bit 0, a
	jp nz, .asm_11147f
.asm_111413
	ld a, [$c800]
	or a
	jr nz, .asm_111413
	di
	ld a, [$c821]
	bit 3, a
	jp nz, .asm_11147b
	ld a, [$c807]
	or a
	jr nz, .asm_111436
	ld hl, $c821
	set 1, [hl]
	ld a, $23
	ld [$c80f], a
	ld a, $ff
	ei
	ret

.asm_111436
	xor a
	ld [$c86b], a
	push hl
	ld hl, $c829
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	pop hl
	ld a, [hli]
	or a
	jr z, .asm_111485
	cp $81
	jr nc, .asm_111485
	ld c, a
	inc a
	inc a
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	ld b, c
	call Function110000
	ld b, c
	inc b
	inc b
	call Function111f63
	ld hl, $c822
	set 7, [hl]
	ld hl, $c821
	set 0, [hl]
	ld a, $0
	ei
	ret

.asm_11147b
	ei
	ld a, $1
	ret

.asm_11147f
	call Function110226
	ld a, $ff
	ret

.asm_111485
	ei
	call Function110231
	ld a, $ff
	ret

Function11148c:
	ld a, [$c822]
	bit 4, a
	jp z, Function110226
	ld a, [$c821]
	bit 0, a
	jp nz, Function110226
	bit 3, a
	jp z, Function110226
	ld e, l
	ld d, h
	ld a, [$c992]
	or a
	jr nz, .asm_111507
	ld a, [$c993]
	ld c, a
	ld b, $0
	ld hl, $ca40
	add hl, bc
	ld a, [hli]
	or a
	jr z, .asm_1114bb
	cp $81
	jr c, .asm_1114bd

.asm_1114bb
	ld a, $80

.asm_1114bd
	ld b, a
	inc c
	add c
	ld [$c993], a
	ld a, [$c994]
	dec a
	sub b
	ld c, a
	ld [$c994], a
	ld a, b
	ld [de], a
	inc de
	call Function110000
.asm_1114d2
	xor a
	or c
	jr nz, .asm_1114dc
	ld hl, $c821
	res 3, [hl]
	ret

.asm_1114dc
	ld a, [hli]
	or a
	jr z, .asm_1114e4
	cp $81
	jr c, .asm_1114e6

.asm_1114e4
	ld a, $80

.asm_1114e6
	cp c
	ret c
	ld [$c991], a
	dec c
	ld a, c
	or a
	jr z, .asm_111500
	ld [$c992], a
	ld b, a
	ld de, $c880
	call Function110000
.asm_1114fa
	ld hl, $c821
	res 3, [hl]
	ret

.asm_111500
	ld a, $ff
	ld [$c992], a
	jr .asm_1114fa

.asm_111507
	cp $ff
	jr nz, .asm_11150c
	xor a

.asm_11150c
	ld b, a
	ld a, [$c991]
	sub b
	ld c, a
	ld hl, $c880
	ld a, [$c991]
	ld [de], a
	inc de
	ld a, b
	or a
	jr z, .asm_111521
	call Function110000

.asm_111521
	ld hl, $ca41
	ld b, c
	call Function110000
	push hl
	ld a, c
	inc a
	ld [$c993], a
	ld b, a
	ld a, [$ca3f]
	sub b
	ld [$c994], a
	ld c, a
	xor a
	ld hl, $c991
	ld [hli], a
	ld [hl], a
	pop hl
	jr .asm_1114d2

Function111540:
	nop

Function111541:
	ld hl, $c821
	bit 0, [hl]
	jp nz, Function110226
	ld a, [$c86a]
	cp $5
	jp nc, Function110226
	ld [$c985], a
	ld a, e
	ld [$c86e], a
	ld a, d
	ld [$c86f], a
	ld a, [$c807]
	cp $2
	jr c, .asm_111582
	xor a
	ld [$c86b], a
	ld a, $97
	ld hl, Unknown_11202d
	call Function111eff
.asm_11156f
	ld a, [$c988]
	cp $40
	jr nz, .asm_11157a
	ld a, $2c
	jr .asm_11157c

.asm_11157a
	ld a, $1e

.asm_11157c
	ld [$c86a], a
	jp Function110432

.asm_111582
	xor a
	ldh [rTAC], a
	ld a, [$c870]
	ld c, a
	call Function1100dc
	call Function1104b0
	ld a, $1
	ld [$c86b], a
	jr .asm_11156f

Function111596:
	ld hl, $c86a
	ld a, [hl]
	cp $1
	jp z, Function110226
	cp $2a
	jp z, Function110226
	ld a, [$c800]
	bit 1, a
	jr nz, .asm_1115af
	ld a, $2a
	jr Function1115e4

.asm_1115af
	ld a, [$c81e]
	cp $92
	jr nz, .asm_1115dd
	ld a, $2a
	ld b, $0
	di
	ld [hli], a
	ld [hl], b
	ld hl, $c822
	res 5, [hl]
	res 0, [hl]
	xor a
	ld [$c80b], a
	ld [$c800], a
	ld a, $8
	ld [$c807], a
	call Function110029
	call Function11164f
	ld hl, $c821
	set 0, [hl]
	ei
	ret

.asm_1115dd
	ld a, $2a
	ld [hli], a
	ld a, $1
	ld [hl], a
	ret

Function1115e4:
	di
	push af
	ld hl, $c821
	set 0, [hl]
	ld a, $1
	ld [$c86b], a
	ld a, [$c86d]
	or a
	ld a, [$ca3c]
	jr z, .asm_111609
	cp $9f
	jr z, .asm_11160d
	cp $a4
	jr z, .asm_11160d
.asm_111601
	call Function112430
.asm_111604
	pop af
	ld [$c86a], a
	ret

.asm_111609
	cp $a3
	jr z, .asm_111601

.asm_11160d
	ei
	jr .asm_111604

Function111610:
	ld hl, $c86a
	ld a, [hl]
	dec a
	jp z, Function110226
	dec a
	jp z, Function110226
	ld a, [$c800]
	or a
	jr nz, .asm_111626
	ld a, $28
	jr Function1115e4

.asm_111626
	ld a, $28
	ld b, $2
	ld [hli], a
	ld [hl], b
	ret

Function11162d:
	ld a, [$c86a]
	cp $1
	jp nz, Function110226
	xor a
	ld hl, $cb47
	ld [hli], a
	ld [hl], a
	call Function111686
	call Function110029
	ld bc, $0452
	ld hl, $c800
.asm_111647
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_111647
	ret

Function11164f:
	ld hl, $c815
	xor a
	ld [hli], a
	ld a, [$c81f]
	ld b, a
	ld a, [$c818]
	ld a, b
	srl a
	srl a
	add b
	add b
	ld [hl], a
	ret

Function111664:
	ld hl, $ca3a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [$c81e]
	cp $ff
	jr z, .asm_111679
	ld a, [$c822]
	bit 0, a
	jr z, .asm_11167c
.asm_111679
	ld hl, $ca2f
.asm_11167c
	add hl, de
	ld [hl], c
	inc de
	ld hl, $ca3a
	ld a, e
	ld [hli], a
	ld [hl], d
	ret

Function111686:
	xor a
	ldh [rTAC], a
	ld c, $ff
	ldh a, [c]
	and $f3
	ldh [c], a
	ld a, [$cb48]
	ld [$c86a], a
	ld a, [$cb47]
	ld c, a
	ld hl, $c821
	ld a, [hl]
	or c
	ld [hl], a
	ret

Function1116a0:
	ld a, $1
	jr Function1116a9

Function1116a4:
	set 1, [hl]
	ld a, [$c86a]

Function1116a9:
	ld [$cb48], a
	ld hl, $c815
	xor a
	ld [hli], a
	ld a, [$c81f]
	rla
	ld [hl], a
	ld hl, $c821
	ld a, [hl]
	ld b, a
	and $d
	ld [hl], a
	ld a, $2
	and b
	ld [$cb47], a
	ret

_MobileReceive::
	ld a, [$c800]
	rrca
	jp nc, Function1118bc
	rrca
	jp c, Function1117e7
	ld hl, $c801
	ld a, [hli]
	ld d, [hl]
	ld e, a
	dec de
	ld a, d
	ld [hld], a
	ld a, e
	ld [hl], a
	cp $2
	jp nc, Function1118bc
	ld a, d
	or a
	jp nz, Function1118bc
	ld hl, $c808
	add hl, de
	ldh a, [rSB]
	ld [hl], a
	ld a, $8
	cp l
	jp nz, Function1118bc
	ld a, [$c81e]
	cp $ff
	jr z, .asm_111716
	ld a, $f2
	cp [hl]
	jp z, Function111796
	dec a
	cp [hl]
	jp z, Function1117a0
	dec a
	cp [hl]
	jp z, Function1117a0
	ld a, [$c807]
	cp $1
	jr nz, .asm_111716
	ld a, [$c806]
	or a
	jr z, .asm_111778
.asm_111716
	ld a, [$c81e]
	cp $ff
	jr z, .asm_111730
	cp $ee
	jr z, .asm_111727
	cp $9f
	jr nz, .asm_111727
	ld a, $95
.asm_111727
	cp [hl]
	jr nz, asm_11179a
	ld a, [$c818]
	or a
	jr z, .asm_111730
.asm_111730
	xor a
	ld [$c819], a
	ld a, $3
	ld [$c800], a
	xor a
	ld hl, $c80a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, $c81f
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld hl, $c815
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, [$c822]
	bit 0, a
	jr z, .asm_111757
	ld a, $b
	jr .asm_111774
.asm_111757
	ld a, [$c81e]
	cp $ff
	jr z, .asm_11176e
	cp $92
	jr z, .asm_111772
	cp $a3
	jr z, .asm_111772
	cp $a8
	jr z, .asm_111772
	ld a, $20
	jr .asm_111774
.asm_11176e
	ld a, $3
	jr .asm_111774
.asm_111772
	ld a, $60
.asm_111774
	ld [hl], a
	jp Function1118bc
.asm_111778
	xor a
	ld [$c800], a
Function11177c:
	ld hl, $c820
	ld a, [hld]
	ld e, a
	ld a, [hl]
	dec a
	ld b, $3
.asm_111785
	or a
	rra
	rr e
	dec b
	jr nz, .asm_111785
	or a
	inc a
	ld hl, $c816
	ld [hld], a
	ld [hl], e
	jp Function1118bc

Function111796:
	ld b, $a
	jr asm_1117a2
asm_11179a:
	xor a
	ld [hli], a
	ld [hl], a
	jp Function1118bc

Function1117a0:
	ld b, $3
asm_1117a2:
	ld hl, $c822
	set 3, [hl]
	ld hl, $c815
	ld a, [$c820]
	ld [hli], a
	ld a, [$c81f]
	ld [hl], a
	xor a
	ld [$c800], a
	ld hl, $c819
	inc [hl]
	ld a, b
	cp [hl]
	jp nc, Function1118bc
	xor a
	ld hl, $c806
	ld [hli], a
	ld [$c800], a
	ld a, $6
	ld [hl], a
	ld hl, $c821
	set 1, [hl]
	ld a, $15
	ld [$c80f], a
	ld hl, $c810
	ld a, [$c808]
	and $f
	cp $2
	jr nz, .asm_1117e1
	inc a
.asm_1117e1
	ld [hli], a
	xor a
	ld [hl], a
	jp Function1118bc

Function1117e7:
	ld a, [$c80b]
	or a
	jr z, .asm_1117f8
	dec a
	jp z, Function11186e
	dec a
	jp z, Function111884
	jp Function111892
.asm_1117f8
	ld hl, $c80a
	ld a, [hl]
	or a
	jr nz, .asm_111803
	ld b, $99
	jr .asm_111805
.asm_111803
	ld b, $66
.asm_111805
	ldh a, [rSB]
	cp b
	jr z, .asm_111840
	cp $d2
	jr nz, .asm_111817
	xor a
	ld [$c9ae], a
.asm_111812
	xor a
	ld [hl], a
	jp Function1118bc
.asm_111817
	ld a, [$c9ae]
	inc a
	ld [$c9ae], a
	cp $14
	jr c, .asm_111812
	ld a, $6
	ld [$c807], a
	ld a, $10
	ld [$c80f], a
	xor a
	ld [$c800], a
	ld hl, $c822
	res 0, [hl]
	ld hl, $c821
	ld a, [hl]
	set 1, a
	and $f
	ld [hl], a
	jr Function1118bc
.asm_111840
	inc [hl]
	ld a, $2
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	inc [hl]
	ld hl, $c812
	ld b, $3
.asm_11184e
	ld [hli], a
	dec b
	jr nz, .asm_11184e
	ld a, [$c822]
	bit 4, a
	jr z, .asm_111864
	ld b, a
	ld a, [$c821]
	bit 3, a
	jr nz, .asm_111864
	jp Function11177c
.asm_111864
	ld a, [$c820]
	ld [hli], a
	ld a, [$c81f]
	ld [hl], a
	jr Function1118bc

Function11186e:
	call Function1118c2
	ld a, $4
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	ldh a, [rSB]
	ld [$c80c], a
	inc [hl]
	or a
	jr nz, Function1118bc
	inc [hl]
	jr Function1118bc

Function111884:
	call Function1118c2
	ld a, [$c80c]
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	inc [hl]
	jr Function1118bc

Function111892:
	ldh a, [rSB]
	ld c, a
	call Function111664
	ld hl, $c80a
	inc [hl]
	ld a, $2
	cp [hl]
	jr c, .asm_1118b4
	ld a, [$c80a]
	add $11
	ld e, a
	ld d, $c8
	ld a, [de]
	cp c
	jr z, Function1118bc
	ld a, $1
	ld [$c814], a
	jr Function1118bc
.asm_1118b4
	ld a, $4
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	inc [hl]
Function1118bc:
	ld hl, $c822
	res 1, [hl]
	ret

Function1118c2:
	ldh a, [rSB]
	ld c, a
	ld b, $0
	ld hl, $c812
	ld a, [hli]
	ld l, [hl]
	ld h, a
	add hl, bc
	ld a, h
	ld [$c812], a
	ld a, l
	ld [$c813], a
	call Function111664
	ld hl, $c80a
	inc [hl]
	ret

_Timer::
	ld a, [$c80b]
	cp $4
	call z, Function111b3c
	call Function11214e
	ld hl, $c807
	ld a, [hli]
	cp $2
	jr c, .asm_111927
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	and b
	cp $ff
	jr z, .asm_1118fe
	ld a, c
	or b
	jr nz, .asm_111927
.asm_1118fe
	ld hl, $c807
	ld a, $6
	cp [hl]
	jp z, Function111b3b
	ld [hl], a
	ld a, $10
	ld [$c80f], a
	xor a
	ld [$c800], a
	ld hl, $c822
	res 0, [hl]
	ld hl, $c821
	ld a, [hl]
	and $f
	or $2
	ld [hl], a
	ld a, $10
	ld [$c80f], a
	jp Function111b3b
.asm_111927
	ld a, [$c800]
	cp $1
	jp z, Function111b21
	cp $3
	jp z, Function111a2a
	ld a, [$c807]
	cp $1
	jp c, Function111b3b
	ld hl, $c815
	dec [hl]
	jp nz, Function111b3b
	inc hl
	dec [hl]
	jp nz, Function111b3b
	ld hl, $c807
	ld a, [$c822]
	bit 3, a
	jp nz, Function111a0b
	bit 4, a
	jr nz, .asm_11199c
	ld a, [hl]
	cp $1
	jp z, Function1119f0
	cp $a
	jr z, .asm_111984
	cp $8
	jr z, .asm_11197d
	ld a, [$c86a]
	cp $2a
	jr z, .asm_111991
	cp $d
	jr nz, .asm_111977
	ld a, [$c86b]
	cp $4
	jr nc, .asm_11199c
.asm_111977
	call Function111f97
	jp Function111b3b
.asm_11197d
	ld a, [$c805]
	ld [hl], a
	jp Function111b3b
.asm_111984
	xor a
	ld [hl], a
	ld hl, $c821
	res 0, [hl]
	call Function111686
	jp Function111b3b
.asm_111991
	xor a
	ld [hl], a
	ld [$c821], a
	call Function111686
	jp Function111b3b
.asm_11199c
	ld b, a
	ld [hl], a
	or a
	jp z, Function111b3b
	ld a, [$c822]
	bit 7, a
	jr nz, .asm_1119be
.asm_1119a9
	ld a, [$c821]
	bit 3, a
	jr nz, .asm_111977
	ld de, $b
	ld hl, Unknown_112072
	ld a, $95
	call Function111f02
	jp Function111b3b
.asm_1119be
	ld a, [$c821]
	bit 3, a
	jr nz, .asm_1119dd
	ld a, [$cb4c]
	add $a
	ld e, a
	ld d, $0
	ld a, $95
	ld [$c81e], a
	ld hl, $cb47
	ld b, $5
	call Function111f07
	jp Function111b3b
.asm_1119dd
	ld hl, $c821
	set 1, [hl]
	res 0, [hl]
	ld hl, $c822
	res 7, [hl]
	ld a, $21
	ld [$c80f], a
	jr .asm_1119a9

Function1119f0:
	ld a, $90
	ld [$c81e], a
	ld [$c808], a
	ld b, $5
	ld de, $12
	ld hl, Unknown_112001
	call Function111f07
	ld a, $1
	ld [$c806], a
	jp Function111b3b

Function111a0b:
	ld a, [hl]
	cp $6
	jp z, Function111b3b
	ld hl, $c822
	res 3, [hl]
	res 0, [hl]
	ld hl, $c81a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $5
	call Function111f07
	jp Function111b3b

Function111a2a:
	ld hl, $c80b
	ld a, [hld]
	or a
	jr z, asm_111a47
	cp $3
	jr nz, asm_111a40
	ld a, [hl]
	cp $2
	jp z, Function111ab9
	cp $3
	jp z, Function111abd
asm_111a40:
	ld a, $4b

Function111a42:
	ldh [rSB], a
	jp Function111b2e
asm_111a47:
	ld hl, $c815
	dec [hl]
	jr nz, asm_111a40
	inc hl
	dec [hl]
	jr nz, asm_111a40
	inc hl
	dec [hl]
	jr z, .asm_111a63
	ld hl, $c81f
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld hl, $c815
	ld [hli], a
	ld a, d
	ld [hli], a
	jr asm_111a40
.asm_111a63
	di
	ld a, [$c86a]
	cp $2a
	jr z, .asm_111aa8
	ld hl, $c9b2
	inc [hl]
	ld a, [hl]
	cp $1
	jr z, .asm_111a91
	ld hl, $c822
	res 5, [hl]
	res 0, [hl]
	ld hl, $c821
	res 4, [hl]
	ld a, $0
	ld [$c805], a
	ld a, $29
	ld [$c86a], a
	ld a, $1
	ld [$c806], a
	jr .asm_111aa8
.asm_111a91
	ld a, $29
	ld [$c86a], a
	xor a
	ld [$c806], a
	ld [$c86b], a
	ld [$c80b], a
	ld [$c800], a
	ld a, $8
	ld [$c807], a
.asm_111aa8
	call Function110029
	call Function11164f
	ld hl, $c822
	res 5, [hl]
	res 0, [hl]
	ei
	jp Function111b3b

Function111ab9:
	ld a, $80
	jr Function111a42

Function111abd:
	ld a, [$c814]
	or a
	jr nz, .asm_111acb
	ld a, [$ca3c]
	xor $80
	jp Function111a42
.asm_111acb
	ld hl, $c819
	inc [hl]
	ld a, $3
	cp [hl]
	jr z, .asm_111afe
	call Function110029
	ld a, $3
	ld [$c800], a
	xor a
	ld hl, $c80a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $c815
	ld a, [$c820]
	ld [hli], a
	ld a, [$c81f]
	ld [hli], a
	ld a, [$c822]
	bit 0, a
	jr z, .asm_111af9
	ld a, $b
	jr .asm_111afb
.asm_111af9
	ld a, $20
.asm_111afb
	ld [hli], a
	jr .asm_111b1c
.asm_111afe
	ld hl, $c806
	xor a
	ld [hli], a
	ld [$c800], a
	ld a, $6
	ld [hl], a
	ld hl, $c821
	set 1, [hl]
	ld a, $15
	ld [$c80f], a
	ld a, $2
	ld [$c810], a
	xor a
	ld [$c811], a
.asm_111b1c
	ld a, $f1
	jp Function111a42

Function111b21:
	ld hl, $c803
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ldh [rSB], a
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e

Function111b2e:
	ld hl, $c822
	set 1, [hl]
	ld a, (0 << rSC_ON) | (1 << rSC_CGB) | (1 << rSC_CLOCK)
	ldh [rSC], a
	ld a, (1 << rSC_ON) | (1 << rSC_CGB) | (1 << rSC_CLOCK)
	ldh [rSC], a

Function111b3b:
	ret

Function111b3c:
	xor a
	ld [$c819], a
	ld [$c80b], a
	ld hl, $c9b1
	ld [hli], a
	ld [hl], a
	ld [$c800], a
	ld hl, $c822
	res 5, [hl]
	bit 0, [hl]
	jr z, .asm_111b59
	ld a, [$ca2f]
	jr .asm_111b5c
.asm_111b59
	ld a, [$ca3c]
.asm_111b5c
	cp $9f
	jr nz, .asm_111b62
	ld a, $95
.asm_111b62
	ld b, a
	ld hl, Function111e28
	push hl
	cp $ee
	jp z, Function111e2b
	ld a, [$c81e]
	cp $ff
	jp z, Function111ef8
	cp $95
	jp z, Function111c17
	cp $a8
	jp z, Function111d23
	cp $a3
	jr z, .asm_111bbe
	cp $a4
	jr z, .asm_111bbe
	cp $93
	jr z, .asm_111be0
	cp $99
	jr z, .asm_111bf0
	cp $9a
	jp z, Function111c06
	cp $97
	jp z, Function111d70
	cp $a1
	jr z, .asm_111bd0
	cp $a2
	jr z, .asm_111bca
	cp $90
	jp z, Function111d39
	cp $94
	jp z, Function111d65
	cp $92
	jp z, Function111d65
	ld hl, $c822
	res 0, [hl]
	ld a, $a
	ld [$c807], a
	xor a
	ld [$c800], a
	ret
.asm_111bbe
	ld a, [$ca40]
	ld [$c86c], a
	ld a, $4
	ld [$c807], a
	ret
.asm_111bca
	ld a, $3
	ld [$c807], a
	ret
.asm_111bd0
	ld a, $4
	ld [$c807], a
	ld de, $c823
	ld hl, $ca40
	ld b, $4
	jp Function110000
.asm_111be0
	ld a, $2
	ld [$c807], a
	ld hl, $c822
	res 4, [hl]
	ld hl, $c821
	res 4, [hl]
	ret
.asm_111bf0
	ld hl, $c829
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $ca3f
	ld a, [hli]
	dec a
	ld b, a
	inc hl
	call Function110000
	ld a, $2
	ld [$c807], a
	ret

Function111c06:
	ld de, $c872
	ld hl, $ca40
	ld b, $2
	call Function110000
	ld a, $2
	ld [$c807], a
	ret

Function111c17:
	ld a, [$ca3c]
	cp $9f
	jp z, Function111d07
	ld a, [$c86f]
	ld b, a
	ld a, [$c86e]
	or b
	jp z, Function111d07
	ld hl, $c82b
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [$ca3f]
	dec a
	jp z, Function111d07
	ld c, a
	ld a, [$c822]
	bit 4, a
	jp z, Function111cc2
	ld a, [$c992]
	or a
	jr nz, .asm_111c89
	ld a, [$ca41]
	or a
	jr z, .asm_111c50
	cp $81
	jr c, .asm_111c52
.asm_111c50
	ld a, $80
.asm_111c52
	ld b, a
	ld a, [$ca3f]
	dec a
	dec a
	cp b
	jr c, .asm_111c6e
.asm_111c5b
	ld hl, $c821
	set 3, [hl]
	ld hl, $c993
	ld a, $1
	ld [hli], a
	ld a, [$ca3f]
	dec a
	ld [hl], a
	jp Function111d07
.asm_111c6e
	ld hl, $c992
	or a
	jr z, .asm_111c83
	ld [hld], a
	ld [hl], b
	ld b, a
	ld hl, $ca42
	ld de, $c880
	call Function110000
	jp Function111d07
.asm_111c83
	ld a, $ff
	ld [hld], a
	ld [hl], b
	jr Function111d07
.asm_111c89
	cp $ff
	jr nz, .asm_111c9d
	ld hl, $c991
	ld a, [hli]
	ld b, a
	ld a, [$ca3f]
	dec a
	cp b
	jr nc, .asm_111c5b
	jr z, .asm_111c5b
	xor a
	ld [hl], a
.asm_111c9d
	ld hl, $c991
	ld a, [hli]
	sub [hl]
	ld b, a
	ld a, [$ca3f]
	dec a
	cp b
	jr nc, .asm_111c5b
	jr z, .asm_111c5b
	ld b, a
	ld l, [hl]
	ld h, $0
	add l
	ld [$c992], a
	ld de, $c880
	add hl, de
	ld e, l
	ld d, h
	ld hl, $ca41
	call Function110000
	jr Function111d07

Function111cc2:
	xor a
	cp d
	jr nz, .asm_111cda
	ld a, c
	cp e
	jr c, .asm_111cda
	jr z, .asm_111cda
	ld a, [$c821]
	set 2, a
	ld [$c821], a
	ld a, c
	sub e
	ld c, e
	ld e, a
	jr .asm_111ce1
.asm_111cda
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc $0
	ld d, a
.asm_111ce1
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	ld hl, $ca41
	ld a, c
	or a
	jr z, Function111d07
	ld b, a
	call Function110000
	ld hl, $c829
	ld a, e
	ld [hli], a
	ld [hl], d
	ld de, $3
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	jr nc, Function111d07
	inc [hl]

Function111d07:
	ld a, [$c822]
	bit 4, a
	jr z, .asm_111d1c
	bit 7, a
	jr z, .asm_111d1c
	ld hl, $c822
	res 7, [hl]
	ld hl, $c821
	res 0, [hl]
.asm_111d1c
	ld a, [$c805]
	ld [$c807], a
	ret

Function111d23:
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	ld hl, $ca40
	ld b, $4
	call Function110000
	ld a, $4
	ld [$c807], a
	ret

Function111d39:
	ld de, $ca3f
	ld hl, Unknown_112006
	ld b, $9
.asm_111d41
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_111d4a
	inc hl
	dec b
	jr nz, .asm_111d41
.asm_111d4a
	ld a, b
	or a
	jr nz, .asm_111d59
	ld a, [$ca4a]
	cp $80
	jr c, .asm_111d62
	cp $90
	jr nc, .asm_111d62
.asm_111d59
	ld [$c818], a
	ld a, $2
	ld [$c807], a
	ret
.asm_111d62
	xor a
	jr .asm_111d59

Function111d65:
	ld a, $3
	ld [$c807], a
	ld hl, $c821
	set 4, [hl]
	ret

Function111d70:
	ld hl, $c822
	bit 0, [hl]
	jr z, .asm_111dc0
	ld a, [$c805]
	ld [$c807], a
	ld a, [$ca33]
	ld b, a
	call Function111dd9
	call Function111e15
	res 0, [hl]
	ld a, b
	cp $7
	jr z, .asm_111da9
	or a
	ret nz
	ld hl, $c821
	res 4, [hl]
	set 1, [hl]
	ld a, [$c822]
	bit 4, a
	jr nz, .asm_111dbb
	ld a, $23
	ld [$c80f], a
	ld a, $6
	ld [$c807], a
	ret
.asm_111da9
	ld hl, $c821
	res 4, [hl]
	set 1, [hl]
	ld a, $11
	ld [$c80f], a
	ld a, $6
	ld [$c807], a
	ret
.asm_111dbb
	xor a
	ld [$c807], a
	ret
.asm_111dc0
	ld hl, $c86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$ca40]
	ld b, a
	call Function111dd9
	call Function111e15
	ld a, b
	ld [hl], a
	ld a, [$c805]
	ld [$c807], a
	ret

Function111dd9:
	cp $ff
	jr z, .asm_111de7
	or a
	ret z
	cp $4
	jr z, .asm_111dea
	cp $5
	jr z, .asm_111e12
.asm_111de7
	ld b, $7
	ret
.asm_111dea
	ld b, $5
	ld a, [$c822]
	bit 0, a
	jr z, .asm_111df8
	ld a, [$c86a]
	jr .asm_111dfb
.asm_111df8
	ld a, [$c985]
.asm_111dfb
	cp $4
	ret z
	cp $1c
	ret z
	cp $1a
	ret z
	dec b
	cp $3
	ret z
	ld b, $1
	ld a, [$c822]
	bit 4, a
	ret z
	inc b
	ret
.asm_111e12
	ld b, $3
	ret

Function111e15:
	ld a, b
	and $7
	rrca
	rrca
	rrca
	push hl
	ld l, a
	ld a, [$c821]
	and $1f
	or l
	ld [$c821], a
	pop hl
	ret

Function111e28:
	jp Function110029

Function111e2b:
	ld a, [$c81e]
	cp $ff
	jp z, Function111ef8
	ld a, [$c86a]
	cp $d
	jr z, .asm_111e48
	cp $2a
	jr z, .asm_111e48
	ld a, $6
	ld [$c807], a
	ld hl, $c821
	set 1, [hl]
.asm_111e48
	ld a, [$c822]
	bit 0, a
	jr z, .asm_111e54
	ld hl, $ca33
	jr .asm_111e57
.asm_111e54
	ld hl, $ca40
.asm_111e57
	ld a, [hli]
	ld [$c80e], a
	cp $10
	jr z, .asm_111e88
	cp $12
	jr z, .asm_111e8c
	cp $13
	jr z, .asm_111ea1
	cp $15
	jr z, .asm_111eae
	cp $19
	jr z, .asm_111edc
	cp $21
	jr z, .asm_111ee0
	cp $22
	jr z, .asm_111ea1
	cp $23
	jr z, .asm_111ee4
	cp $24
	jr z, .asm_111eed
	cp $28
	jr z, .asm_111ee9
	ld a, [hl]
.asm_111e84
	ld [$c80f], a
	ret
.asm_111e88
	ld a, $10
	jr .asm_111e84
.asm_111e8c
	ld a, [hl]
	or $0
	jr z, .asm_111e9d
	cp $2
	jr z, .asm_111e99
	ld a, $13
	jr .asm_111e84
.asm_111e99
	ld a, $17
	jr .asm_111e84
.asm_111e9d
	ld a, $12
	jr .asm_111e84
.asm_111ea1
	ld hl, $c821
	res 1, [hl]
	res 4, [hl]
	ld a, $2
	ld [$c807], a
	ret
.asm_111eae
	ld a, [hl]
	cp $1
	jr nz, .asm_111ed3
	ld a, [$c822]
	bit 4, a
	jr z, .asm_111ed3
	res 4, a
	ld [$c822], a
	ld hl, $c821
	ld a, [hl]
	and $f
	or $2
	ld [hl], a
	ld a, $23
	ld [$c80f], a
	ld a, $6
	ld [$c807], a
	ret
.asm_111ed3
	ld hl, $c822
	res 5, [hl]
	ld a, $24
	jr .asm_111e84
.asm_111edc
	ld a, $14
	jr .asm_111e84
.asm_111ee0
	ld a, $22
	jr .asm_111e84
.asm_111ee4
	ld hl, $c821
	res 1, [hl]
.asm_111ee9
	ld a, $24
	jr .asm_111e84
.asm_111eed
	ld hl, $c821
	res 1, [hl]
	ld a, $3
	ld [$c807], a
	ret

Function111ef8:
	ld a, [$c805]
	ld [$c807], a
	ret

Function111eff:
	ld de, $000a

Function111f02:
	ld [$c81e], a
	ld b, $5

Function111f07:
	call Function1100b4
	ret c
	ld a, [$c800]
	cp $0
	jr z, .asm_111f17
	call Function110226
	scf
	ret
.asm_111f17
	ldh a, [rSC]
	and 1 << rSC_ON
	jr nz, .asm_111f17
	di
	ld a, [$c81e]
	cp $ff
	jr z, .asm_111f35
	ld a, l
	ld [$c81c], a
	ld a, h
	ld [$c81d], a
	ld a, e
	ld [$c81a], a
	ld a, d
	ld [$c81b], a
.asm_111f35
	ld a, e
	ld [$c801], a
	ld a, d
	ld [$c802], a
	ld a, l
	ld [$c803], a
	ld a, h
	ld [$c804], a
	ld hl, $c807
	ld a, [hl]
	cp b
	jr z, .asm_111f4f
	ld [$c805], a
.asm_111f4f
	ld a, b
	ld [$c807], a
	xor a
	ld [$c806], a
	ld a, $1
	ld [$c800], a
	ld hl, $c822
	set 5, [hl]
	ei
	ret

Function111f63:
	push de
	ld hl, 0
	ld c, b
	xor a
	cp b
	jr z, .asm_111f71
.asm_111f6c
	call Function111f8d
	jr nz, .asm_111f6c

.asm_111f71
	ld b, $4
.asm_111f73
	call Function111f8d
	jr nz, .asm_111f73
	ld e, l
	ld d, h
	ld hl, $000a
	add hl, bc
	ld c, l
	ld b, h
	pop hl
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, $80
	ld [hli], a
	xor a
	ld [hl], a
	ld e, c
	ld d, b
	ret

Function111f8d:
	dec de
	ld a, [de]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	ret

Function111f97:
	ld hl, $c822
	bit 0, [hl]
	ret nz
	ld a, [$c807]
	cp $2
	jr c, .asm_111fcb
	cp $5
	jr z, .asm_111fcb
	cp $6
	jr nz, .asm_111fcd
	ld a, [$c80f]
	cp $22
	jr z, .asm_111fcb
	cp $23
	jr z, .asm_111fcb
	cp $26
	jr z, .asm_111fcb
	swap a
	and $f
	cp $1
	jr z, .asm_111fcb
	cp $0
	jr z, .asm_111fcb
	cp $8
	jr nz, .asm_111fcd
.asm_111fcb
	scf
	ret
.asm_111fcd
	ld b, $5
	ld hl, $c81e
	ld a, [hl]
	cp $ff
	jr z, .asm_111fe9
	ld a, $97
	ld [hl], a
	ld hl, Unknown_11202d
	ld de, $a
	call Function111f07
	ld hl, $c822
	set 0, [hl]
	ret
.asm_111fe9
	ld hl, Unknown_112001
	ld de, $12
	jp Function111f07

	ds 14

Unknown_112000:
	db $4b

Unknown_112001:
	db $99, $66, $10, $00, $00

Unknown_112006:
	db $08, "NINTENDO", $02, $77, $80, $00

Unknown_112013:
	db $99, $66, $11, $00, $00, $00, $00, $11, $80, $00

Unknown_11201d:
	db $99, $66, $12, $00, $00, $00

Unknown_112023:
	db $99, $66, $13, $00, $00, $00, $00, $13, $80, $00

Unknown_11202d:
	db $99, $66, $17, $00, $00, $00, $00, $17, $80, $00

Unknown_112037:
	db $99, $66, $21, $00, $00

Unknown_11203c:
	db $99, $66, $22, $00, $00, $00, $00, $22, $80, $00

Unknown_112046:
	db $99, $66, $19, $00, $00, $02, $00, $60, $00, $7b, $80, $00

Unknown_112052:
	db $99, $66, $19, $00, $00, $02, $60, $60, $00, $db, $80, $00

Unknown_11205e:
	db $99, $66, $1a, $00, $00

Unknown_112063:
	db $99, $66, $28, $00, $00

Unknown_112068:
	db $99, $66, $14, $00, $00, $00, $00, $14, $80, $00

Unknown_112072:
	db $99, $66, $15, $00, $00, $01, $ff, $01, $15, $80, $00

Unknown_11207d:
	db $99, $66, $23, $00, $00, $06

Unknown_112083:
	db $99, $66, $24, $00, $00, $01

Unknown_112089:
	db $ec, $14, $c9
	db $e4, $0f, $0e
	db $e0, $0c, $53
	db $c4, $07, $94
	db $b0, $05, $ee
	db $ec, $10, $b4
	db $e4, $0c, $dd

Unknown_11209e:
	db "HELO ", 0
Unknown_1120a4:
	db "MAIL FROM:<", 0
Unknown_1120b0:
	db "RCPT TO:<", 0
Unknown_1120ba:
	db "DATA<CR>\n", 0
Unknown_1120c1:
	db "QUIT<CR>\n", 0
Unknown_1120c8:
	db "USER ", 0
Unknown_1120ce:
	db "PASS ", 0
Unknown_1120d4:
	db "STAT<CR>\n", 0
Unknown_1120db:
	db "LIST 00000<CR>\n", 0
Unknown_1120e8:
	db "RETR 00000<CR>\n", 0
Unknown_1120f5:
	db "DELE 00000<CR>\n", 0
Unknown_112102:
	db "TOP 00000 0<CR>\n", 0
Unknown_112110:
	db "GET ", 0
Unknown_112115:
	db " HTTP/1.0<CR>\n", 0
Unknown_112121:
	db "User-Agent: CGB-", 0
Unknown_112132:
	db "<CR>\n<CR>\n", 0
Unknown_112137:
	db "POST ", 0
Unknown_11213d:
	db "Content-Length: ", 0

Function11214e:
	ld a, [$c822]
	bit 5, a
	ret nz
	ld a, [$c86a]
	cp $a
	ret c
	ld c, a
	cp $d
	jr z, .asm_112187
	cp $f
	jr z, .asm_112196
	cp $29
	jr z, .asm_112175
	cp $2a
	jr z, .asm_112175
	cp $28
	jr z, .asm_112175
.asm_11216f
	ld a, [$c807]
	cp $6
	ret z
.asm_112175
	ld b, $0
	sla c
	ld hl, Jumptable_1121ac - 2 * $a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, $c86b
	inc [hl]
	ld a, [hl]
	ret
.asm_112187
	ld c, a
	ld a, [$c86b]
	cp $1
	jr nz, .asm_11216f
	ld hl, $c821
	res 1, [hl]
	jr .asm_112175
.asm_112196
	ld c, a
	ld a, [$c80f]
	cp $24
	jr nz, .asm_11216f
	ld a, [$c86b]
	cp $1
	jr nz, .asm_11216f
	ld hl, $c821
	res 1, [hl]
	jr .asm_112175

Jumptable_1121ac:
	dw Function1121f6
	dw Function112271
	dw Function112373
	dw Function1123b6
	dw Function1123e1
	dw Function112451
	dw Function112715
	dw Function11273a
	dw Function11299c
	dw Function112d33
	dw Function112d33
	dw Function112840
	dw Function1128db
	dw Function112969
	dw Function112a56
	dw Function112b71
	dw Function112bec
	dw Function112bbb
	dw Function112bec
	dw Function112b71
	dw Function1134cb
	dw Function112d33
	dw Function112d33
	dw Function112d33
	dw Function112d33
	dw Function112d33
	dw Function112d33
	dw Function113519
	dw Function113519
	dw Function113519
	dw Function113e42
	dw Function113ef2
	dw Function113f2d
	dw Function1121f6
	dw Function1134cb
	dw Function113672
	dw Function113626

Function1121f6:
	dec a
	jr z, .asm_1121fe
	dec a
	jr z, .asm_112210
	dec [hl]
	ret

.asm_1121fe
	ld a, [$c818]
	or a
	jr z, .asm_112206
	jr Function112269

.asm_112206
	ld a, $10
	call Function11225d
	res 0, [hl]
	set 1, [hl]
	ret

.asm_112210
	ld hl, $c86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$c818]
	cp $88
	jr c, .asm_112249
	sub $88
	ld [hl], a
	cp $4
	jr c, .asm_112226
	ld a, $3

.asm_112226
	cp $3
	jr nz, .asm_11222b
	dec a

.asm_11222b
	ld b, a
	ld a, $4
	sub b
	ld d, a
	rlca
	add d
	ld c, a
	xor a
	cp b
	jr z, .asm_11223a
	ld a, $3
	xor b

.asm_11223a
	ld hl, $c871
	ld [hld], a
	ld [hl], c
	ld a, [$c86a]
	cp $a
	jr nz, Function112251
	jp Function1116a0

.asm_112249
	ld a, $10
	call Function11225d
	jp Function1116a4

Function112251:
	xor a
	ld [$c821], a
	ld [$c807], a
	inc a
	ld [$c86a], a
	ret

Function11225d:
	ld [$c80f], a
	ld a, $5
	ld [$c86a], a
	ld hl, $c821
	ret

Function112269:
	ld a, $91
	ld hl, Unknown_112013
	jp Function111eff

Function112271:
	dec a
	jr z, .asm_11228c
	dec a
	jr z, .asm_112292
	dec a
	jr z, .asm_1122a1
	dec a
	jp z, .asm_112309
	dec a
	jp z, .asm_112326
	dec a
	jp z, .asm_112335
	dec a
	jp z, .asm_112342
	dec [hl]
	ret

.asm_11228c
	ld hl, Unknown_112046
	jp Function11236b

.asm_112292
	ld hl, $c829
	ld a, $e0
	ld [hli], a
	ld a, $c8
	ld [hli], a
	ld hl, Unknown_112052
	jp Function11236b

.asm_1122a1
	ld hl, $c880
	ld a, [hli]
	cp $4d
	jr nz, .asm_1122f5
	ld a, [hld]
	cp $41
	jr nz, .asm_1122f5
	ld b, $be
	ld de, 0
.asm_1122b3
	ld a, [hli]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec b
	jr nz, .asm_1122b3
	ld a, [hli]
	cp d
	jr nz, .asm_1122fc
	ld a, [hl]
	cp e
	jr nz, .asm_1122fc
	ld hl, $c884
	ld de, $c836
	ld b, $8
	call Function110000
	ld hl, $c8ca
	ld b, $2c
	call Function110000
	ld a, [$cb79]
	ld c, a
	sub $8
	ld e, a
	ld d, $0
	ld hl, $cb7a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $c836
	ld b, $8
	call Function110000
	ld b, c
	call Function111f63
	jr Function11235a

.asm_1122f5
	ld a, $25
	ld [$c872], a
	jr .asm_112301

.asm_1122fc
	ld a, $14
	ld [$c872], a

.asm_112301
	ld a, $6
	ld [$c86b], a
	jp Function112269

.asm_112309
	ld a, [$c821]
	and $e0
	jr nz, .asm_112314
	ld b, $92
	jr Function11234b

.asm_112314
	cp $e0
	ld a, $11
	jr z, .asm_11231b
	inc a

.asm_11231b
	ld [$c872], a
	ld a, $6
	ld [$c86b], a
	jp Function112269

.asm_112326
	ld d, a
	ld a, [$cb79]
	add $a
	ld e, a
	ld hl, $cb74
	ld a, $a1
	jp Function111f02

.asm_112335
	ld a, $2
	ld [$c86a], a
	ld hl, $c821
	res 0, [hl]
	set 5, [hl]
	ret

.asm_112342
	ld a, [$c872]
	call Function11225d
	jp Function1116a4

Function11234b:
	ld a, [$cb4c]
	add $a
	ld e, a
	ld d, $0
	ld hl, $cb47
	ld a, b
	jp Function111f02

Function11235a:
	ld hl, $c86e
	ld a, $80
	ld [hli], a
	ld a, $c8
	ld [hl], a
	ld a, $97
	ld hl, Unknown_11202d
	jp Function111eff

Function11236b:
	ld a, $99
	ld de, $000c
	jp Function111f02

Function112373:
	dec a
	jr z, Function11235a
	dec a
	jr z, .asm_112381
	dec a
	jr z, .asm_11239b
	dec a
	jr z, .asm_1123ad
	dec [hl]
	ret

.asm_112381
	ld a, [$c821]
	and $e0
	jr nz, .asm_11238c
	ld b, $92
	jr Function11234b

.asm_11238c
	cp $e0
	ld a, $11
	jr z, .asm_112393
	inc a

.asm_112393
	ld a, $3
	ld [$c86b], a
	jp Function112269

.asm_11239b
	ld hl, $c822
	set 4, [hl]
	ld a, $2
	ld [$c86a], a
	ld hl, $c821
	res 0, [hl]
	set 6, [hl]
	ret

.asm_1123ad
	ld a, [$c872]
	call Function11225d
	jp Function1116a4

Function1123b6:
	dec a
	jr z, .asm_1123be
	dec a
	jr z, .asm_1123c6
	ret

.asm_1123bd
	dec [hl]

.asm_1123be
	ld a, $94
	ld hl, Unknown_112068
	jp Function111eff

.asm_1123c6
	ld a, [$ca3c]
	cp $ee
	jr z, .asm_1123bd
	ld hl, $c822
	set 4, [hl]
	ld a, $2
	ld [$c86a], a
	ld hl, $c821
	res 0, [hl]
	set 6, [hl]
	set 5, [hl]
	ret

Function1123e1:
	dec a
	jr z, .asm_1123f2
	dec a
	jr z, .asm_11240a
	dec a
	jr z, .asm_112416
	dec a
	jr z, .asm_11241e
	dec a
	jr z, .asm_112421
	dec [hl]
	ret

.asm_1123f2
	ld a, [$ca3c]
	cp $9f
	jr z, .asm_112408
	call Function1127e1
	jr z, .asm_112408
	ld hl, $c86b
	dec [hl]
	ld hl, $cb67
	jp Function1127c5

.asm_112408
	jr Function112430

.asm_11240a
	xor a
	ld [$c86d], a
	ld a, $a2
	ld hl, Unknown_11203c
	jp Function111eff

.asm_112416
	ld a, $93
	ld hl, Unknown_112023
	jp Function111eff

.asm_11241e
	jp Function112269

.asm_112421
	ld hl, $c822
	res 4, [hl]
	ld hl, $c821
	ld a, [hl]
	and $f
	ld [hl], a
	jp Function1116a0

Function112430:
	ld a, $3
	ld [$c807], a
	ld de, $cb47
	ld hl, Unknown_112083
	ld b, $6
	call Function110000
	ld a, [$c86c]
	ld [de], a
	inc de
	inc b
	call Function111f63
	ld a, $a4
	ld hl, $cb47
	jp Function111f02

Function112451:
	dec a
	jr z, .asm_112458
	dec a
	jr z, .asm_112496
	ret

.asm_112458
	ld b, $6
	ld de, $cba3
	call Function111f63
	ld a, [$c86e]
	inc a
	cp $3
	jr nz, .asm_11248b
	ld a, [$cabc]
	or a
	jr z, .asm_11248b
	ld hl, $c995
	ld a, [hli]
	cp $99
	jr nz, .asm_112480
	ld a, [hli]
	cp $66
	jr nz, .asm_112480
	ld a, [hli]
	cp $23
	jr z, .asm_11248b

.asm_112480
	ld hl, $cb97
	ld de, $c995
	ld b, $10
	call Function110000

.asm_11248b
	ld a, $a3
	ld de, $0010
	ld hl, $cb97
	jp Function111f02

.asm_112496
	ld a, [$ca3c]
	cp $a3
	jr z, .asm_1124ce
	ld a, [$c822]
	bit 3, a
	jr z, .asm_1124ab
	dec [hl]
	ld a, $3
	ld [$c807], a
	ret

.asm_1124ab
	ld a, [$c9af]
	cp $5
	jr c, .asm_1124b8
	ld hl, $c821
	set 1, [hl]
	ret

.asm_1124b8
	dec [hl]
	ld hl, $c9af
	inc [hl]
	ld hl, $c822
	set 3, [hl]
	ld hl, $c815
	ld a, [$c820]
	ld [hli], a
	ld a, [$c81f]
	ld [hl], a
	ret

.asm_1124ce
	xor a
	ld [$c9af], a
	ld a, [$c86e]
	inc a
	ld [$c86d], a
	dec a
	jp z, Function11261c
	dec a
	jp z, Function112654
	dec a
	jp z, Function112597
	dec a
	jp z, Function112566
	call Function1125c7
	push de
	ld de, $c880
	ld hl, $c827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $1
	ld [$c86e], a
	ld a, $fa
	ld [hli], a
	xor a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	pop de
	ld a, $1
	ld [$c994], a
	call Function11269b
	ld a, $5
	ld [$c86b], a
	call Function112534
	ld a, [$c9a5]
	or a
	jr z, .asm_112521
	ld a, $1

.asm_112521
	add $23
	ld [$c86a], a
	ld a, [$c98a]
	cp $2
	jr nz, .asm_112531
	xor a
	ld [$c9a5], a

.asm_112531
	jp Function1125bf

Function112534:
	ld b, $fa
	ld hl, $c880
	xor a
.asm_11253a
	ld [hli], a
	dec b
	jr nz, .asm_11253a
	ld a, [$c876]
	ld [$c87c], a
	ld a, [$c877]
	ld [$c87d], a
	ld a, [$c87a]
	ld [$c87e], a
	ld a, [$c87b]
	ld [$c87f], a
	ld a, c
	ld [$cb58], a
	ld b, c
	call Function111f63
	ld a, $95
	ld hl, $cb53
	jp Function111f02

Function112566:
	call Function1125c7
	ld a, [$cb5a]
	and $1
	or a
	jr nz, .asm_11257d
	ld a, [$c98a]
	cp $2
	jr nz, .asm_11257d
	ld a, $1
	ld [$c994], a

.asm_11257d
	call Function11269b
	ld a, $5
	ld [$c86b], a
	call Function112534
	ld a, [$c9a5]
	or a
	jr z, .asm_112590
	ld a, $1

.asm_112590
	add $21
	ld [$c86a], a
	jr Function1125bf

Function112597:
	call Function1125c7
	call Function11269b
	ld a, $5
	ld [$c86b], a
	call Function112534
	ld a, [$c98f]
	ld b, a
	ld a, [$c994]
	and $1
	add $13
	bit 0, b
	jr z, .asm_1125bc
	sub $13
	add $1f
	dec b
	sla b
	add b

.asm_1125bc
	ld [$c86a], a

Function1125bf:
	ld hl, $c821
	set 0, [hl]
	res 2, [hl]
	ret

Function1125c7:
	ld hl, $c872
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [$c994]
	and $1
	xor $1
	ld [$c86b], a
	ld hl, $c827
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc de
	inc de
	ld a, $80
	ld [hli], a
	ld a, $c8
	ld [hli], a
	dec bc
	dec bc
	ld a, $fa
	ld [hli], a
	ld a, $0
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $6
	call Function110000
	ld a, [$c86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, $cb53
	ld hl, Unknown_112072
	ld b, $5
	call Function110000
	inc de
	ld a, [$c86c]
	ld [de], a
	inc de
	ret

Function11261c:
	xor a
	ld [$c86b], a
	ld a, [$c86c]
	ld [$cbbd], a
	ld de, $cbad
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	call Function112724
	ld a, [$cbbc]
	ld b, a
	ld de, $cbbd
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	call Function111f63
	ld hl, $cba7
	call Function1127c5
	ld a, $11
	ld [$c86a], a

Function11264e:
	ld hl, $c821
	set 0, [hl]
	ret

Function112654:
	xor a
	ld [$c86b], a
	ld a, [$c86c]
	ld [$cbad], a
	ld [$cbed], a
	ld de, $cbcd
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	call Function112724
	ld a, [$cbec]
	ld b, a
	ld de, $cbed
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	call Function111f63
	ld a, [$cbac]
	ld b, a
	ld de, $cbad
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	call Function111f63
	ld hl, $cbc7
	call Function1127c5
	ld a, $12
	ld [$c86a], a
	jr Function11264e

Function11269b:
	ld bc, $0001
	ld hl, Unknown_112110
	ld a, [$c994]
	or a
	call nz, Function1126ac
	call Function110007
	ret

Function1126ac:
	ld hl, Unknown_112137
	ret

Function1126b0:
	ld hl, Unknown_112115
	jp Function110007

Function1126b6:
	ld hl, Unknown_112121
	call Function110007
	ld hl, $013f
	ld b, $4
	call Function110000
	ld a, $2d
	ld [de], a
	inc de
	ld a, [$014c]
	and $f0
	swap a
	or $30
	ld [de], a
	inc de
	ld a, [$014c]
	and $f
	or $30
	ld [de], a
	inc de
	ld a, $7
	add c
	ld c, a
	ld hl, Unknown_112132
	jp Function110007

Function1126e6:
	xor a
	ld [$c86b], a
	ld hl, Unknown_11213d
	call Function110007
	ld hl, $c9a5
	ld b, $5
.asm_1126f5
	ld a, [hl]
	cp $30
	jr nz, .asm_112701
	inc hl
	dec b
	ld a, $1
	cp b
	jr nz, .asm_1126f5

.asm_112701
	push bc
	call Function110000
	ld a, $d
	ld [de], a
	inc de
	ld a, $a
	ld [de], a
	inc de
	pop bc
	ld a, b
	add $2
	add c
	ld c, a
	or c
	ret

Function112715:
	xor a
	ld [$c86c], a
	ld a, $2
	ld [$c86a], a
	ld hl, $c821
	res 0, [hl]
	ret

Function112724:
	ld a, $ff
	ld [$c86e], a

Function112729:
	push hl
	ld hl, $c82c
	xor a
	ld [hld], a
	ld a, $ff
	ld [hld], a
	ld a, $c8
	ld [hld], a
	ld a, $80
	ld [hl], a
	pop hl
	ret

Function11273a:
	dec a
	jr z, .asm_112752
	dec a
	jr z, .asm_11278f
	dec a
	jr z, .asm_112744
	ret

.asm_112744
	xor a
	ld [$c86d], a
	ld a, $30
	call Function11225d
	set 1, [hl]
	res 0, [hl]
	ret

.asm_112752
	call Function1127e1
	jr nz, .asm_11277a
	ld hl, $c880
	call Function112b11
	ld a, $2
	cp d
	jr nz, .asm_1127b7
	ld a, $20
	cp e
	jr nz, .asm_1127b7
	call Function112724
	ld a, [$cbbc]
	add $a
	ld e, a
	ld d, $0
	ld a, $95
	ld hl, $cbb7
	jp Function111f02

.asm_11277a
	ld a, [$ca3c]
	cp $9f
	jr z, Function1127cd
	ld hl, $c86b
	dec [hl]
	xor a
	ld [$ca3f], a
	ld hl, $cba7
	jp Function1127c5

.asm_11278f
	call Function1127e1
	jr nz, .asm_11277a
	ld hl, $c880
	call Function112b11
	ld a, $2
	cp d
	jr nz, .asm_1127b7
	ld a, $50
	cp e
	jr nz, .asm_1127b7
	ld a, $3
	ld [$c86a], a
	ld hl, $c821
	ld a, [hl]
	and $d6
	or $80
	ld [hl], a
	xor a
	ld [$c98a], a
	ret

.asm_1127b7
	ld hl, $c810
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, $2
	ld [$c86b], a
	jp Function112430

Function1127c5:
	ld de, $000b
	ld a, $95
	jp Function111f02

Function1127cd:
	ld hl, $c810
	xor a
	ld [hli], a
	ld [hl], a
	xor a
	ld [$c86d], a
	ld a, $30
	call Function11225d
	set 1, [hl]
	res 0, [hl]
	ret

Function1127e1:
	call Function112807
	ld hl, $c832

Function1127e7:
	ld a, [hli]
	cp $d
	ret nz
	ld a, [hl]
	cp $a
	ret nz
	ld a, $20
	ld [hl], a
	ret

Function1127f3:
	call Function112807
	ld hl, $c82f
	ld a, [hli]
	cp $d
	ret nz
	ld a, [hli]
	cp $a
	ret nz
	ld a, [hli]
	cp $2e
	ret nz
	jr Function1127e7

Function112807:
	push bc
	push de
	ld hl, $ca3f
	ld a, [hl]
	dec a
	jr z, .asm_11282d
	ld c, a
	cp $5
	jr nc, .asm_112830
	ld a, $5
	sub c
	ld b, a
	ld e, c
	ld d, $0
	ld hl, $c82f
	add hl, de
	ld de, $c82f
	call Function110000
	ld hl, $ca41
	ld b, c
.asm_11282a
	call Function110000

.asm_11282d
	pop de
	pop bc
	ret

.asm_112830
	sub $5
	ld c, a
	ld b, $0
	ld hl, $ca41
	add hl, bc
	ld b, $5
	ld de, $c82f
	jr .asm_11282a

Function112840:
	dec a
	jr z, .asm_112844
	ret

.asm_112844
	call Function1127e1
	jr nz, .asm_1128ab
	ld hl, $c880
	ld a, [hli]
	cp $32
	jr nz, Function1128bd
	ld a, [hli]
	cp $35
	jr nz, Function1128bd
	call Function112724
	ld hl, $c87c
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_11289d
	push hl
	ld hl, $c86b
	dec [hl]
	ld bc, $0001
	ld de, $cb5a
	ld hl, Unknown_1120b0
	call Function110007
	pop hl
	ld a, $80
	call Function11000f
	ld a, $3e
	ld [de], a
	inc de
	inc c
	ld a, l
	ld [$c87c], a
	ld a, h
	ld [$c87d], a
	call Function11295e
	ld a, c
	ld [$cb58], a
	ld b, c
	call Function111f63
	ld hl, $cb53
	ld d, $0
	ld e, c
	ld a, $95
	jp Function111f02

.asm_11289d
	ld a, $3
	ld [$c86a], a
	call Function1128d3
	ld a, $1
	ld [$c98a], a
	ret

.asm_1128ab
	ld a, [$ca3c]
	cp $9f
	jp z, Function1127cd
	ld hl, $c86b
	dec [hl]
	ld hl, $cb47
	jp Function1127c5

Function1128bd:
	ld hl, $c880
	call Function112b11
	ld hl, $c810
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, $30
	call Function11225d
	set 1, [hl]
	res 0, [hl]
	ret

Function1128d3:
	ld hl, $c821
	res 0, [hl]
	res 2, [hl]
	ret

Function1128db:
	dec a
	jr z, .asm_112947
	dec a
	jr z, .asm_1128e5
	dec a
	jr z, .asm_112913
	ret

.asm_1128e5
	ld a, [$ca3c]
	cp $9f
	jp z, Function1127cd
	call Function113482
	ld a, [$c86f]
	or a
	jr nz, .asm_112901
	ld a, $3
	ld [$c86a], a
	ld hl, $c821
	res 0, [hl]
	ret

.asm_112901
	call Function112724
	ld de, $cb4c
	ld a, $1
	ld [de], a
	inc de
	inc de
	ld b, $1
	call Function111f63
	jr .asm_112941

.asm_112913
	call Function1127e1
	jr nz, .asm_11293d
	ld a, [$ca3c]
	cp $9f
	jp z, Function1127cd
	ld hl, $c880
	call Function112b11
	ld a, d
	cp $2
	jr nz, .asm_11295b
	ld a, e
	cp $50
	jr nz, .asm_11295b
	ld a, $3
	ld [$c86a], a
	call Function1128d3
	xor a
	ld [$c98a], a
	ret

.asm_11293d
	ld hl, $c86b
	dec [hl]

.asm_112941
	ld hl, $cb47
	jp Function1127c5

.asm_112947
	call Function1127e1
	jr nz, .asm_11293d
	ld hl, $c880
	call Function112b11
	ld a, d
	cp $3
	jr nz, .asm_11295b
	ld a, e
	cp $54
	ret z

.asm_11295b
	jp Function1128bd

Function11295e:
	ld a, $d
	ld [de], a
	inc de
	inc c
	ld a, $a
	ld [de], a
	inc de
	inc c
	ret

Function112969:
	dec a
	jr z, .asm_112970
	dec a
	jr z, .asm_112989
	ret

.asm_112970
	ld a, [$ca3c]
	cp $9f
	jr z, .asm_112986
	call Function1127e1
	jr z, .asm_112986
	ld hl, $c86b
	dec [hl]
	ld hl, $cb67
	jp Function1127c5

.asm_112986
	jp Function112430

.asm_112989
	xor a
	ld [$c86d], a
	ld a, $2
	ld [$c86a], a
	ld hl, $c821
	res 0, [hl]
	res 7, [hl]
	set 5, [hl]
	ret

Function11299c:
	dec a
	jr z, .asm_1129aa
	dec a
	jr z, .asm_1129c9
	dec a
	jr z, .asm_1129e7
	dec a
	jp z, .asm_112a1d
	ret

.asm_1129aa
	call Function1127e1
	jr nz, .asm_1129fe
	ld a, [$c880]
	cp $2b
	jr nz, .asm_112a0f
	call Function112724
	ld a, [$cbac]
	add $a
	ld e, a
	ld d, $0
	ld a, $95
	ld hl, $cba7
	jp Function111f02

.asm_1129c9
	ld d, a
	call Function1127e1
	jr nz, .asm_1129fe
	ld a, [$c880]
	cp $2b
	jr nz, .asm_112a0f
	call Function112724
	ld a, [$cbec]
	add $a
	ld e, a
	ld a, $95
	ld hl, $cbe7
	jp Function111f02

.asm_1129e7
	call Function1127e1
	jr nz, .asm_1129fe
	ld a, [$c880]
	cp $2b
	jr nz, .asm_112a0f
	ld a, $4
	ld [$c86a], a
	call Function1128d3
	set 7, [hl]
	ret

.asm_1129fe
	ld a, [$ca3c]
	cp $9f
	jr z, Function112a42
	ld hl, $c86b
	dec [hl]
	ld hl, $cbc7
	jp Function1127c5

.asm_112a0f
	ld a, [$c86b]
	ld [$cb67], a
	ld a, $3
	ld [$c86b], a
	jp Function112430

.asm_112a1d
	xor a
	ld [$c86d], a
	ld de, $0002
	ld a, [$cb67]
	cp $1
	jr z, .asm_112a2c
	inc de
.asm_112a2c

Function112a2c:
	ld hl, $c821
	set 1, [hl]
	res 0, [hl]
	ld hl, $c80f
	ld a, $31
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, $5
	ld [$c86a], a
	ret

Function112a42:
	ld hl, $c810
	xor a
	ld [hli], a
	ld [hl], a
	xor a
	ld [$c86d], a
	ld a, $31
	call Function11225d
	set 1, [hl]
	res 0, [hl]
	ret

Function112a56:
	dec a
	jr z, .asm_112a5a
	ret

.asm_112a5a
	call Function1127e1
	jr nz, .asm_112a95
	ld hl, $c880
	ld a, [hli]
	cp $2b
	jr nz, .asm_112aa6
.asm_112a67
	ld a, [hli]
	cp $20
	jr nz, .asm_112a67
	call Function112aac
	ld a, [$c86e]
	ld c, a
	ld a, [$c86f]
	ld b, a
	ld a, e
	ld [bc], a
	inc bc
	ld a, d
	ld [bc], a
	call Function112aac
	ld hl, $c86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $4
	ld [$c86a], a
	jp Function1128d3

.asm_112a95
	ld a, [$ca3c]
	cp $9f
	jr z, Function112a42
	ld hl, $c86b
	dec [hl]
	ld hl, $cbc7
	jp Function1127c5

.asm_112aa6
	ld de, $0005
	jp Function112a2c

Function112aac:
	ld a, [$c872]
	push af
	ld a, [$c873]
	push af
	ld a, [$c874]
	push af
	ld bc, 0
	ld de, 0
.asm_112abe
	ld a, [hli]
	cp $d
	jr z, .asm_112b04
	cp $20
	jr z, .asm_112b04
	and $f
	ld b, a
	sla e
	rl d
	rl c
	ld a, e
	ld [$c872], a
	ld a, d
	ld [$c873], a
	ld a, c
	ld [$c874], a
	sla e
	rl d
	rl c
	sla e
	rl d
	rl c
	ld a, [$c872]
	add e
	ld e, a
	ld a, [$c873]
	adc d
	ld d, a
	ld a, [$c874]
	adc c
	ld c, a
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, $0
	adc c
	ld c, a
	jr .asm_112abe

.asm_112b04
	pop af
	ld [$c874], a
	pop af
	ld [$c873], a
	pop af
	ld [$c872], a
	ret

Function112b11:
	ld a, [$c872]
	push af
	ld a, [$c873]
	push af
	ld a, [$c874]
	push af
	ld bc, $0300
	ld de, $c872
	call Function112b60
	call nc, Function112b60
	call nc, Function112b60
	dec hl
.asm_112b2d
	ld a, [hli]
	cp $d
	jr z, .asm_112b36
	cp $20
	jr nz, .asm_112b2d

.asm_112b36
	push hl
	ld hl, $c872
	ld de, 0
	ld a, b
	or a
	jr z, .asm_112b49
	dec a
	jr z, .asm_112b4b
	dec a
	jr z, .asm_112b4f
	jr .asm_112b52

.asm_112b49
	ld a, [hli]
	ld d, a

.asm_112b4b
	ld a, [hli]
	swap a
	ld e, a

.asm_112b4f
	ld a, [hli]
	or e
	ld e, a

.asm_112b52
	pop hl
	pop af
	ld [$c874], a
	pop af
	ld [$c873], a
	pop af
	ld [$c872], a
	ret

Function112b60:
	ld a, [hli]
	cp $30
	jr c, .asm_112b6f
	cp $3a
	jr nc, .asm_112b6f
	and $f
	ld [de], a
	inc de
	dec b
	ret

.asm_112b6f
	scf
	ret

Function112b71:
	dec a
	jr z, .asm_112b75
	ret

.asm_112b75
	call Function1127e1
	jr nz, .asm_112ba3
	ld hl, $c880
	ld a, [hli]
	cp $2b
	jr nz, .asm_112bb5
.asm_112b82
	ld a, [hli]
	cp $20
	jr nz, .asm_112b82
.asm_112b87
	ld a, [hli]
	cp $20
	jr nz, .asm_112b87
	call Function112aac
	ld hl, $c86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $4
	ld [$c86a], a
	jp Function1128d3

.asm_112ba3
	ld a, [$ca3c]
	cp $9f
	jp z, Function112a42
	ld hl, $c86b
	dec [hl]
	ld hl, $cbc7
	jp Function1127c5

.asm_112bb5
	ld de, $0004
	jp Function112a2c

Function112bbb:
	dec a
	jr z, .asm_112bbf
	ret

.asm_112bbf
	call Function1127e1
	jr nz, .asm_112bd4
	ld hl, $c880
	ld a, [hli]
	cp $2b
	jr nz, .asm_112be6
	ld a, $4
	ld [$c86a], a
	jp Function1128d3

.asm_112bd4
	ld a, [$ca3c]
	cp $9f
	jp z, Function112a42
	ld hl, $c86b
	dec [hl]
	ld hl, $cbc7
	jp Function1127c5

.asm_112be6
	ld de, $0004
	jp Function112a2c

Function112bec:
	dec a
	jr z, .asm_112bf7
	dec a
	jp z, .asm_112cdb
	dec a
	ret nz
	dec [hl]
	ret

.asm_112bf7
	ld a, [$c880]
	cp $2d
	jr nz, .asm_112c03
	call Function1127e1
	jr z, .asm_112c0b

.asm_112c03
	ld a, [$c821]
	bit 2, a
	jp z, .asm_112cef

.asm_112c0b
	ld hl, $c86b
	inc [hl]
	ld hl, $c880
	ld a, [hli]
	cp $2b
	jp nz, Function112d20
	ld b, $7f
.asm_112c1a
	ld a, [hli]
	dec b
	cp $a
	jr nz, .asm_112c1a
	push hl
	ld hl, $c98f
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, b
	ld [$c82d], a
	ld a, [hli]
	ld h, [hl]
	sub b
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr nc, .asm_112c56
	cp $ff
	jr nz, .asm_112c56
	ld hl, $c991
	ld a, [hli]
	ld c, a
	inc hl
	ld a, b
	sub c
	ld [hli], a
	ld a, [$c82b]
	ld [hl], a
	ld hl, $c827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	ld [hli], a
	xor a
	ld [hl], a
	pop hl
	ld b, c
	jp Function110000

.asm_112c56
	ld [$c993], a
	ld a, [$c82b]
	ld c, a
	ld [$c994], a
	push hl
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr nc, .asm_112c9f
	cp $ff
	jr nz, .asm_112c9f
	ld a, c
	ld [$ca3d], a
	ld a, [$ca3f]
	sub c
	pop hl
	ld c, l
	pop hl
	push af
	call Function110000
	pop af
	push de
	ld hl, $ca40
	ld e, a
	ld d, $0
	add hl, de
	pop de
	ld b, c
	call Function110000
	ld a, [$ca3d]
	sub c
	ld [$c994], a
	ld hl, $c827
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$c991]
	ld [hli], a
	xor a
	ld [hl], a
	ret

.asm_112c9f
	ld [$c994], a
	ld a, l
	ld [$c82b], a
	ld a, h
	ld [$c82c], a
	pop hl
	pop hl
	call Function110000
	ld a, [$ca3f]
	sub c
	push de
	ld hl, $ca40
	ld e, a
	ld d, $0
	add hl, de
	pop de
	ld b, c
	call Function110000
	ld a, [$c82d]
	add c
	ld [$c82d], a
	ld a, [$c82e]
	adc 0
	ld [$c82e], a
	ld hl, $c829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld hl, $c821
	res 2, [hl]

.asm_112cdb
	ld a, [$c821]
	bit 2, a
	jr z, .asm_112cea
	ld a, $2
	ld [$c86b], a
	jp .asm_112d09

.asm_112cea
	call Function1127f3
	jr z, .asm_112d01

.asm_112cef
	ld a, [$ca3c]
	cp $9f
	jp z, Function112a42
	ld hl, $c86b
	dec [hl]
	ld hl, $cbc7
	jp Function1127c5

.asm_112d01
	ld a, $4
	ld [$c86a], a
	call Function1128d3

.asm_112d09
	ld a, [$c86e]
	ld l, a
	ld a, [$c86f]
	or l
	ret z
	ld hl, $c827
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, $c82d
	ld b, $2
	jp Function110000

Function112d20:
	ld a, [$c86a]
	cp $1a
	jr nz, .asm_112d2d
	ld de, $0004
	jp Function112a2c

.asm_112d2d
	ld de, $0004
	jp Function112a2c

Function112d33:
	dec a
	jr z, .asm_112d87
	dec a
	jr z, .asm_112d9f
	dec a
	jp z, .asm_112e46
	dec a
	jr z, .asm_112d4d
	dec a
	jp z, Function113317
	dec a
	jp z, Function113386
	dec a
	jp .asm_112e46

; unused
	ret

.asm_112d4d
	ld a, [$c86a]
	cp $23
	jr z, .asm_112d6d
	cp $1f
	jr z, .asm_112d60
	cp $20
	jr z, .asm_112d6d
	cp $22
	jr nz, .asm_112d82

.asm_112d60
	ld hl, $c98b
	ld a, [hli]
	cp $1
	jr nz, .asm_112d82
	ld a, [hl]
	cp $4
	jr nz, .asm_112d82

.asm_112d6d
	ld hl, $c86e
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, $c82b
	ld [hli], a
	ld [hl], a
	ld hl, $c821
	res 2, [hl]
	ld hl, $c86b
	dec [hl]
	dec [hl]

.asm_112d82
	ld hl, $c86b
	dec [hl]
	ret

.asm_112d87
	call Function113482
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $6
	call Function110000
	ld a, [$c86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63

.asm_112d9f
	ld a, [$c821]
	bit 2, a
	jr z, .asm_112dab
	ld a, $3
	ld [hl], a
	jr .asm_112dc1

.asm_112dab
	ld a, [$ca3c]
	cp $9f
	jr z, .asm_112dc1
	ld hl, $c86b
	dec [hl]
	ld de, $000b
	ld hl, $cb47
	ld b, $5
	jp Function111f07

.asm_112dc1
	ld a, [$c989]
	cp $2
	jr nc, .asm_112df2
	call Function112f61
	bit 2, a
	ret nz
	cp $3
	jr z, .asm_112e38
	cp $1
	jr nz, .asm_112df2
	ld a, [$c86a]
	cp $1f
	jr z, .asm_112de1
	cp $20
	jr nz, .asm_112df2

.asm_112de1
	ld hl, $c98b
	ld a, [hli]
	cp $1
	jr nz, .asm_112df2
	ld a, $4
	cp [hl]
	jr nz, .asm_112df2
	xor a
	ld [$c990], a

.asm_112df2
	ld a, [$c86e]
	ld l, a
	ld a, [$c86f]
	or l
	ret z
	ld a, [$c86a]
	cp $13
	jr z, .asm_112e21
	cp $14
	jr z, .asm_112e21
	cp $20
	ret z
	cp $22
	ret z
	cp $23
	ret z
	cp $1f
	jr nz, .asm_112e21
	ld hl, $c98b
	ld a, [hli]
	cp $0
	ret nz
	ld a, $2
	cp [hl]
	ret nz
	ld a, [$c86a]

.asm_112e21
	cp $24
	jr nz, .asm_112e2a
	ld hl, $c878
	jr .asm_112e2d

.asm_112e2a
	ld hl, $c827

.asm_112e2d
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, $c82d
	ld b, $2
	jp Function110000

.asm_112e38
	ld hl, $c821
	set 1, [hl]
	res 0, [hl]
	ld de, $c98b
	ld a, $24
	jr .asm_112e95

.asm_112e46
	ld a, [$c86a]
	cp $1f
	jr z, .asm_112ea6
	cp $20
	jr z, .asm_112ea6
	ld a, [$c98a]
	cp $1
	jr z, .asm_112e65
	ld a, [$c86a]
	cp $21
	jp z, .asm_112eea
	cp $22
	jp z, .asm_112eea

.asm_112e65
	ld a, [$c990]
	or a
	jp z, .asm_112f3d
.asm_112e6c
	ld hl, $c98c
	ld a, [hld]
	cp $3
	jr nz, .asm_112e7f
	ld a, [hl]
	or a
	jr z, .asm_112e7f
	cp $3
	jr nc, .asm_112e7f
	call Function1133fe

.asm_112e7f
	ld hl, $c821
	set 1, [hl]
	res 0, [hl]
	ld de, $c98b
	ld a, [$c990]
	cp $1
	ld a, $32
	jr z, .asm_112e95
	inc de
	inc de
	inc a

.asm_112e95
	ld [$c80f], a
	ld hl, $c810
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ld a, $5
	ld [$c86a], a
	ret

.asm_112ea6
	ld hl, $c98b
	ld a, [hli]
	ld h, [hl]
	ld l, a
	cp $0
	jr nz, .asm_112ec1
	ld a, $2
	cp h
	jr nz, .asm_112ec1
	ld a, [$c98d]
	ld b, a
	ld a, [$c98e]
	or b
	jr nz, .asm_112e6c
	jr .asm_112f3d

.asm_112ec1
	ld a, $1
	cp l
	jr nz, .asm_112e6c
	ld a, $4
	cp h
	jr nz, .asm_112e6c
	ld a, [$c9a5]
	or a
	jr nz, .asm_112efb
	ld a, [$c86e]
	ld l, a
	ld a, [$c86f]
	or l
	jr nz, .asm_112efb
	ld a, $2
	ld [$c86a], a
	xor a
	ld [$c86d], a
	ld hl, $c821
	res 0, [hl]
	ret

.asm_112eea
	ld hl, $c98b
	ld a, [hli]
	ld h, [hl]
	ld l, a
	cp $0
	jp nz, .asm_112e6c
	ld a, $2
	cp h
	jp nz, .asm_112e6c

.asm_112efb
	ld a, [$c98d]
	ld b, a
	ld a, [$c98e]
	cp b
	jp nz, .asm_112e6c
	or a
	jr z, .asm_112f13
	cp $1
	jp nz, .asm_112e6c
	ld a, $1
	ld [$c993], a

.asm_112f13
	ld a, [$c86b]
	cp $7
	jr z, .asm_112f3d
	ld hl, $c98f
	inc [hl]
	ld a, $f
	ld [$c86a], a
	ld a, $1
	ld [$c86b], a
	ld a, [$c86d]
	ld [$c86e], a
	xor a
	ld [$c989], a
	ld a, $a3
	ld de, $0010
	ld hl, $c995
	jp Function111f02

.asm_112f3d
	ld a, [$c993]
	cp $1
	jr nz, .asm_112f52
	ld a, $2
	ld [$c990], a
	ld hl, $c98d
	dec a
	ld [hli], a
	ld [hl], a
	jp .asm_112e7f

.asm_112f52
	ld a, $2
	ld [$c86a], a
	xor a
	ld [$c86d], a
	ld hl, $c821
	res 0, [hl]
	ret

Function112f61:
	ld hl, $c989
	ld a, [hl]
	or a
	jr nz, .asm_112f8a
	inc [hl]
	ld hl, $c880
	ld de, $0008
	add hl, de
.asm_112f70
	ld a, [hli]
	cp $20
	jr z, .asm_112f70
	dec hl
	ld d, $0
	cp $32
	jr z, .asm_112f7d
	inc d

.asm_112f7d
	ld a, d
	ld [$c990], a
	call Function112b11
	ld hl, $c98b
	ld a, e
	ld [hli], a
	ld [hl], d

.asm_112f8a
	ld hl, $c880
	ld a, [$c82d]
	ld b, a
	or a
	jr nz, .asm_112fa1
	ld hl, $c98b
	ld a, $0
	ld [hli], a
	ld [hl], a
	ld a, $1
	ld [$c990], a
	ret

.asm_112fa1
	call Function112fd5
	call Function113008
	call Function113026
	call Function113054
	call Function113167
	call Function113180
	call Function113268
	jr c, .asm_112fc9
	ld a, $d
	cp [hl]
	jr z, .asm_112fc2
	ld a, $a
	cp [hl]
	jr nz, .asm_112fa1

.asm_112fc2
	ld hl, $c990
	res 2, [hl]
	jr .asm_112fce

.asm_112fc9
	ld hl, $c990
	set 2, [hl]

.asm_112fce
	call Function11306b
	ld a, [$c990]
	ret

Function112fd5:
	ld de, Unknown_113001
	push hl
	call Function113281
	jr nc, .asm_112fe0
	pop hl
	ret

.asm_112fe0
	pop de
	push bc
	push de
	push hl
	ld b, $0
.asm_112fe6
	inc b
	ld a, [hli]
	cp $a
	jr nz, .asm_112fe6
	pop hl
	ld c, b
	ld a, [$c833]
	ld e, a
	ld a, [$c834]
	ld d, a
	or e
	jr z, .asm_112ffe
	call Function110000
	xor a
	ld [de], a

.asm_112ffe
	pop hl
	pop bc
	ret

Unknown_113001:
	db "date: ", 0

Function113008:
	ld de, Unknown_1132a6
	push hl
	call Function113273
	jr nc, .asm_113013
	pop hl
	ret

.asm_113013
	call Function112b11
	ld hl, $c98d
	ld a, e
	ld [hli], a
	ld [hl], d
	pop hl
	ld a, d
	or e
	ret z
	ld a, $2
	ld [$c990], a
	ret

Function113026:
	ld de, Unknown_1132b2
	push hl
	call Function113273
	jr nc, .asm_113031
	pop hl
	ret

.asm_113031
	pop hl
	push bc
	push hl
	push hl
	ld b, $0
.asm_113037
	inc b
	ld a, [hli]
	cp $a
	jr nz, .asm_113037
	pop hl
	ld c, b
	ld de, $cb59
	call Function110000
	ld hl, $cb59
	ld de, $c9b5
	ld b, c
	call Function110000
	xor a
	ld [de], a
	pop hl
	pop bc
	ret

Function113054:
	ld de, Unknown_1132bf
	push hl
	call Function113273
	jr nc, .asm_11305f
	pop hl
	ret

.asm_11305f
	push bc
	ld de, $c9b5
	ld b, $30
	call Function1136c1
	pop bc
	pop hl
	ret

Function11306b:
	ld hl, $c880
	ld a, [$c82d]
	ld b, a

Function113072:
	call Function113268
	jp nc, Function113089
	ld a, [$ca3c]
	cp $9f
	jp nz, Function1131a9
	push hl
	ld hl, $c990
	res 2, [hl]
	pop hl
	jr Function113095

Function113089:
	ld a, [hl]
	cp $d
	jr z, .asm_113094
	cp $a
	jr z, Function113095
	jr Function113072

.asm_113094
	inc hl

Function113095:
	inc hl
	push bc
	ld a, [$c872]
	ld b, a
	ld a, [$c873]
	or b
	pop bc
	jr z, .asm_1130b3
	ld a, [$c86a]
	cp $23
	jr z, .asm_1130b3
	cp $20
	jr z, .asm_1130b3
	cp $22
	jr z, .asm_1130b3
	jr .asm_1130d6

.asm_1130b3
	xor a
	ld hl, $c86e
	ld [hli], a
	ld [hl], a
	ld hl, $c821
	res 2, [hl]
	ld a, [$c86a]
	cp $13
	jr z, .asm_1130c8
	cp $14
	ret nz

.asm_1130c8
	ld a, $6
	ld [$c86b], a
	ld a, [$ca3c]
	cp $9f
	ret z
	jp Function112430

.asm_1130d6
	ld a, [$c82b]
	ld c, a
	dec b
	dec b
	ld a, b
	ld [$c82d], a
	jr z, .asm_11310d
	ld a, [$c873]
	ld d, a
	ld a, [$c872]
	ld e, a
	dec de
	dec de
	xor a
	or d
	jr nz, .asm_1130f5
	ld a, e
	cp b
	jp c, Function113206

.asm_1130f5
	ld a, e
	sub b
	ld [$c82b], a
	ld a, d
	sbc $0
	ld [$c82c], a
	ld a, [$c874]
	ld e, a
	ld a, [$c875]
	ld d, a
	inc de
	inc de
	call Function110000

.asm_11310d
	ld a, [$ca3c]
	cp $9f
	jr z, .asm_113150
	ld a, [$ca3f]
	or a
	jr z, .asm_113150
	ld l, c
	sub c
	ld c, a
	ld a, l
	ld hl, $ca40
	add hl, bc
	ld b, a
	push de
	ld a, [$c82b]
	ld e, a
	ld a, [$c82c]
	ld d, a
	xor a
	or d
	jr nz, .asm_113135
	ld a, e
	cp b
	jp c, Function113245

.asm_113135
	pop de
	push hl
	ld hl, $c82d
	ld a, [hl]
	add b
	ld [hli], a
	ld a, [hl]
	adc 0
	ld [hl], a
	ld c, b
	pop hl
	call Function110000
	ld hl, $c82b
	ld a, [hl]
	sub c
	ld [hli], a
	ld a, [hl]
	sbc $0
	ld [hl], a

.asm_113150
	ld hl, $c829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld hl, $c821
	res 2, [hl]
	ld a, $1
	ld [$c86b], a
	ld a, $2
	ld [$c989], a
	ret

Function113167:
	ld de, Unknown_1132ff
	push hl
	call Function113273
	jr nc, .asm_113172
	pop hl
	ret

.asm_113172
	pop de
	push bc
	push de
	push hl
	ld b, $0
.asm_113178
	inc b
	ld a, [hli]
	cp $a
	jr nz, .asm_113178
	jr Function113197

Function113180:
	ld de, Unknown_11330c
	push hl
	call Function113273
	jr nc, .asm_11318b
	pop hl
	ret

.asm_11318b
	pop de
	push bc
	push de
	push hl
	ld b, $0
.asm_113191
	inc b
	ld a, [hli]
	cp $a
	jr nz, .asm_113191

Function113197:
	pop hl
	ld c, b
	ld de, $cb57
	ld a, b
	ld [de], a
	inc de
	dec b
	dec b
	call Function110000
	xor a
	ld [de], a
	pop hl
	pop bc
	ret

Function1131a9:
	ld hl, $c979
	ld de, $c880
	ld b, $0
	ld c, b
	ld a, [hl]
	cp $a
	jr z, .asm_1131c4
.asm_1131b7
	ld a, [hld]
	inc b
	cp $a
	jr nz, .asm_1131b7
	inc hl
	inc hl
	dec b
	ld c, b
	call Function110000

.asm_1131c4
	ld a, [$c82b]
	ld b, a
	add c
	ld c, a
	push bc
	ld a, $ff
	sub b
	ld c, a
	ld b, $0
	ld hl, $ca40
	add hl, bc
	pop bc
	call Function110000
	ld a, c
	ld [$c82d], a
	ld a, $fa
	sub c
	ld [$c82b], a
	ld hl, $c829
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ld l, e
	ld h, d
	ld de, $c97a
.asm_1131ef
	xor a
	ld [hli], a
	ld a, l
	cp e
	jr nz, .asm_1131ef
	ld a, d
	cp h
	jr nz, .asm_1131ef
	ld hl, $c821
	res 2, [hl]
	ld hl, $c86b
	dec [hl]
	dec [hl]
	ld a, $4
	ret

Function113206:
	ld a, b
	sub e
	ld [$c991], a
	ld a, [$c821]
	bit 2, a
	ld a, c
	jr nz, .asm_113214
	xor a

.asm_113214
	ld [$c992], a
	ld b, e
	ld c, e
	ld a, [$c874]
	ld e, a
	ld a, [$c875]
	ld d, a
	inc de
	inc de
	call Function110000
	ld a, [$c991]
	ld [$c993], a
	ld b, a
	ld de, $c880
	call Function110000
	ld hl, $c82d
	ld a, c
	ld [hli], a
	xor a
	ld [hl], a
	ld hl, $c821
	set 2, [hl]
	ld a, $3
	ld [$c86b], a
	ret

Function113245:
	ld a, b
	sub e
	ld [$c992], a
	ld [$c82b], a
	ld b, e
	ld c, e
	pop de
	call Function110000
	ld hl, $c82d
	ld a, c
	add [hl]
	ld [hli], a
	ld a, $0
	adc [hl]
	ld [hl], a
	ld hl, $c821
	set 2, [hl]
	ld a, $3
	ld [$c86b], a
	ret

Function113268:
.asm_113268
	dec b
	ld a, [hli]
	cp $a
	ret z
	xor a
	or b
	jr nz, .asm_113268
	scf
	ret

Function113273:
	ld c, $0
.asm_113275
	ld a, [de]
	inc de
	or a
	ret z
	xor [hl]
	inc hl
	or c
	ld c, a
	jr z, .asm_113275
	scf
	ret

Function113281:
	ld c, $0
	push hl
	ld l, e
	ld h, d
	pop de
.asm_113287
	ld a, [de]
	inc de
	call Function11329d
	xor [hl]
	inc hl
	or c
	ld c, a
	xor a
	cp [hl]
	jr z, .asm_113298
	cp c
	jr z, .asm_113287
	scf

.asm_113298
	push hl
	ld l, e
	ld h, d
	pop de
	ret

Function11329d:
	cp $41
	ret c
	cp $5b
	ret nc
	or $20
	ret

Unknown_1132a6:
	db "Gb-Status: ", 0
Unknown_1132b2:
	db "Gb-Auth-ID: ", 0
Unknown_1132bf:
	db "WWW-Authenticate: GB00 name=", $22, 0
Unknown_1132dd:
	db "Content-Type: application/x-cgb", $d, "\n", 0
Unknown_1132ff:
	db "URI-header: ", 0
Unknown_11330c:
	db "Location: ", 0

Function113317:
	ld a, $1
	ld [$c86b], a
	ld de, $cb59
	ld a, [$c86c]
	ld [de], a
	inc de
	ld bc, $0001
	call Function1126b0
	ld hl, Unknown_1132dd
	ld a, [$c9a5]
	or a
	call nz, Function110007
	ld a, [$c86a]
	cp $22
	jr nz, .asm_113344
	ld a, [$c98a]
	cp $2
	jr nz, .asm_113351
	jr .asm_113348

.asm_113344
	cp $24
	jr nz, .asm_113351

.asm_113348
	ld a, [$c9a5]
	or a
	jr z, .asm_11336a
	call Function1133de

.asm_113351
	ld hl, $c9b5
	call Function110007
	call Function1126b6
	ld a, c
	ld [$cb58], a
	ld b, c
	call Function111f63
	ld a, $95
	ld hl, $cb53
	jp Function111f02

.asm_11336a
	ld hl, Unknown_113372
	call Function110007
	jr .asm_113351

Unknown_113372:
	db "Content-Length: 0", $d, "\n", 0

Function113386:
	call Function113482
	ld a, $1
	ld [$c86b], a
	ld de, $cb47
	ld hl, Unknown_112072
	ld b, $6
	call Function110000
	ld a, [$c86c]
	ld [de], a
	inc de
	ld b, $1
	call Function111f63
	ld de, $cb53
	ld hl, Unknown_112072
	ld b, $6
	call Function110000
	ld a, [$c86d]
	cp $3
	jp nz, Function113317
	ld de, $cb59
	ld a, [$c86c]
	ld [de], a
	inc de
	ld bc, $0001
	call Function1126b0
	ld a, [$c994]
	or a
	call nz, Function1133de
	call Function1126b6
	ld a, c
	ld [$cb58], a
	ld b, c
	call Function111f63
	ld a, $95
	ld hl, $cb53
	jp Function111f02

Function1133de:
	call Function1126e6
	xor a
	ld [$c86b], a
	ld a, [$c9aa]
	ld [$c87c], a
	ld a, [$c9ab]
	ld [$c87d], a
	ld a, [$c9ac]
	ld [$c87e], a
	ld a, [$c9ad]
	ld [$c87f], a
	ret

Function1133fe:
	ld hl, $cb58
	ld a, [hli]
	cp $68
	jr nz, .asm_113432
	ld a, [hli]
	cp $74
	jr nz, .asm_113432
	ld a, [hli]
	cp $74
	jr nz, .asm_113432
	ld a, [hli]
	cp $70
	jr nz, .asm_113432
	ld a, [hli]
	cp $3a
	jr nz, .asm_113432
	ld a, [hli]
	cp $2f
	jr nz, .asm_113432
	ld a, [hli]
	cp $2f
	jr nz, .asm_113432
	ld hl, $cb57
	ld de, $c880
	ld a, [hli]
	ld b, a
	call Function110000
	xor a
	ld [de], a
	ret

.asm_113432
	ld a, [$cb58]
	cp $2f
	jr z, .asm_113460
	ld de, $c880
	ld hl, $c9b5
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function110007
	ld l, e
	ld h, d
.asm_11344c
	ld a, [hld]
	cp $2f
	jr nz, .asm_11344c
	inc hl
	inc hl
	ld e, l
	ld d, h
.asm_113455
	ld hl, $cb57
	ld a, [hli]
	ld b, a
	call Function110000
	xor a
	ld [de], a
	ret

.asm_113460
	ld de, $c880
	ld hl, $c9b5
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp $2f
	jr z, .asm_113478
	ld b, $7
	call Function110000

.asm_113478
	ld a, [hli]
	ld [de], a
	inc de
	cp $2f
	jr nz, .asm_113478
	dec de
	jr .asm_113455

Function113482:
	ld hl, $c87f
	ld a, [hld]
	ld b, a
	ld a, [hld]
	ld c, a
	ld a, b
	or c
	ret z
	pop hl
	ld hl, rSC
	add hl, bc
	jr c, .asm_113496
	xor a
	ld l, a
	ld h, a

.asm_113496
	ld e, l
	ld d, h
	ld hl, $c87f
	ld a, d
	ld [hld], a
	ld a, e
	ld [hld], a
	jr nc, .asm_1134a3
	ld c, $fe

.asm_1134a3
	ld a, [hld]
	ld l, [hl]
	ld h, a
	ld a, c
	inc a
	ld [$cb4c], a
	ld de, $cb4e
	ld b, c
	call Function110000
	ld a, l
	ld [$c87c], a
	ld a, h
	ld [$c87d], a
	ld b, c
	inc b
	call Function111f63
	ld hl, $c86b
	dec [hl]
	ld hl, $cb47
	ld a, $95
	jp Function111f02

Function1134cb:
	dec a
	jr z, .asm_1134d9
	dec a
	jr z, .asm_1134f4
	dec a
	jr z, .asm_1134fc
	dec a
	jr z, .asm_11350e
	dec [hl]
	ret

.asm_1134d9
	ld a, [$ca40]
	cp $0
	jr z, .asm_1134f0
	cp $ff
	jr z, .asm_1134f0
	ld a, [$c985]
	ld [$c86a], a
	ld hl, $c821
	res 0, [hl]
	ret

.asm_1134f0
	inc [hl]
	inc [hl]
	jr .asm_1134fc

.asm_1134f4
	ld a, $97
	ld hl, Unknown_11202d
	jp Function111eff

.asm_1134fc
	ld hl, $c86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$ca42]
	cp $f0
	jr c, .asm_11350b
	set 7, [hl]

.asm_11350b
	jp Function112269

.asm_11350e
	ld a, [$c86a]
	cp $1e
	jp nz, Function112251
	jp Function1116a0

Function113519:
	dec a
	jr z, .asm_113527
	dec a
	jr z, .asm_11352d
	dec a
	jr z, .asm_11353c
	dec a
	jr z, .asm_11353f
	dec [hl]
	ret

.asm_113527
	ld hl, Unknown_112046
	jp Function11236b

.asm_11352d
	ld hl, $c829
	ld a, $e0
	ld [hli], a
	ld a, $c8
	ld [hli], a
	ld hl, Unknown_112052
	jp Function11236b

.asm_11353c
	jp Function112269

.asm_11353f
	ld hl, $c880
	ld a, [hli]
	cp $4d
	jr nz, .asm_113586
	ld a, [hld]
	cp $41
	jr nz, .asm_113586
	ld b, $be
	ld de, 0
.asm_113551
	ld a, [hli]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec b
	jr nz, .asm_113551
	ld a, [hli]
	cp d
	jr nz, .asm_11358a
	ld a, [hl]
	cp e
	jr nz, .asm_11358a
	ld a, [$c86e]
	ld e, a
	ld a, [$c86f]
	ld d, a
	ld hl, .asm_11357e
	push hl
	ld a, [$c86a]
	cp $25
	jr z, Function1135ba
	cp $26
	jr z, Function11359d
	cp $27
	jr z, Function1135ad
.asm_11357e
	ld a, $1
	ld [$c835], a
	jp Function1116a0

.asm_113586
	ld a, $25
	jr .asm_11358c

.asm_11358a
	ld a, $14

.asm_11358c
	call Function11225d
	jp Function1116a4

Function113592:
	push de
	ld l, e
	ld h, d
	xor a
	ld [hl], a
	inc de
	call Function110000
	pop de
	ret

Function11359d:
	ld b, $20
	call Function113592
	ld a, $21
	ld hl, $c88c
	call Function11000f
	xor a
	ld [de], a
	ret

Function1135ad:
	ld b, $1e
	call Function113592
	ld a, $1f
	ld hl, $c8ac
	jp Function11000f

Function1135ba:
	ld b, $65
	call Function113592
	ld hl, $c8f6
	call Function1135eb
	ld a, $11
	ld hl, $c8fe
	call Function11000f
	inc de
	ld hl, $c90e
	call Function1135eb
	ld a, $11
	ld hl, $c916
	call Function11000f
	inc de
	ld hl, $c926
	call Function1135eb
	ld a, $11
	ld hl, $c92e
	jp Function11000f

Function1135eb:
	ld b, $8
.asm_1135ed
	ld a, [hl]
	swap a
	and $f
	cp $f
	jr z, .asm_11361c
	or $30
	cp $3a
	call z, Function113620
	cp $3b
	call z, Function113623
	ld [de], a
	inc de
	ld a, [hli]
	and $f
	cp $f
	jr z, .asm_11361c
	or $30
	cp $3a
	call z, Function113620
	cp $3b
	call z, Function113623
	ld [de], a
	inc de
	dec b
	jr nz, .asm_1135ed

.asm_11361c
	xor a
	ld [de], a
	inc de
	ret

Function113620:
	ld a, $23
	ret

Function113623:
	ld a, $2a
	ret

Function113626:
	dec a
	jr z, .asm_113634
	dec a
	jr z, .asm_113639
	dec a
	jr z, .asm_11366c
	dec a
	jr z, .asm_11366f
	dec [hl]
	ret

.asm_113634
	ld b, $9a
	jp Function11234b

.asm_113639
	ld a, [$c882]
	or a
	jr nz, .asm_113642
	inc [hl]
	jr .asm_11366c

.asm_113642
	ld de, $cb4c
	ld c, a
	inc a
	ld [de], a
	inc de
	ld a, $80
	ld [de], a
	inc de
	ld hl, $c880
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, c
	call Function110000
	ld b, c
	inc b
	call Function111f63
	ld a, [$cb4c]
	add $a
	ld e, a
	ld d, $0
	ld a, $9a
	ld hl, $cb47
	jp Function111f02

.asm_11366c
	jp Function112269

.asm_11366f
	jp Function1116a0

Function113672:
	dec a
	jr z, .asm_113680
	dec a
	jr z, .asm_113686
	dec a
	jr z, .asm_1136bb
	dec a
	jr z, .asm_1136be
	dec [hl]
	ret

.asm_113680
	ld hl, $cb47
	jp Function11236b

.asm_113686
	ld a, [$c882]
	or a
	jr z, .asm_113693
	cp $81
	jr nc, .asm_113693
	inc [hl]
	jr .asm_1136bb

.asm_113693
	ld hl, $cb4e
	sub $80
	ld [hld], a
	ld a, $80
	ld [hl], a
	ld de, $cb4f
	ld b, $2
	call Function111f63
	ld hl, $c880
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $0080
	add hl, de
	ld e, h
	ld a, l
	ld hl, $c829
	ld [hli], a
	ld [hl], e
	ld hl, $cb47
	jp Function11236b

.asm_1136bb
	jp Function112269

.asm_1136be
	jp Function1116a0

Function1136c1:
	xor a
	ld [$cc28], a
	ld a, l
	ld [$cc07], a
	ld a, h
	ld [$cc08], a
	ld hl, $cc09
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, b
	ld [hli], a
	ld hl, $cc07
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $cb67
	ld b, $30
	ld c, b
	call Function110000
	ld hl, $c97f
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_1136eb
	ld a, [hli]
	or a
	jr nz, .asm_1136eb
	call Function110007
	ld a, $37
	cp c
	inc a
	jr nc, .asm_1136ff
	ld a, $2
	ld [$cc28], a
	ld a, $78

.asm_1136ff
	sub c
	ld b, a
	ld a, $80
	ld [de], a
	inc de
	xor a
.asm_113706
	dec b
	jr z, .asm_11370d
	ld [de], a
	inc de
	jr .asm_113706

.asm_11370d
	or a
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld l, e
	ld h, d
	ld b, $6
	xor a
.asm_113725
	ld [hli], a
	dec b
	jr nz, .asm_113725
	ld de, $cbe7
	ld hl, Unknown_113b7e
	ld b, $10
	call Function110000

.asm_113734
	ld hl, $cc0c
	ld a, LOW(Unknown_113b8e)
	ld [hli], a
	ld a, HIGH(Unknown_113b8e)
	ld [hl], a
	ld hl, $cc0e
	ld a, LOW(Unknown_113a70)
	ld [hli], a
	ld a, HIGH(Unknown_113a70)
	ld [hl], a
	ld hl, $cbe7
	ld de, $cc18
	ld b, $10
	call Function110000

.asm_113751
	ld hl, $cc0e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld c, a
	push hl
	call Function113909
	ld hl, $cbf7
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cbff
	call Function113a32
	pop hl
	ld a, [hli]
	ld d, [hl]
	inc hl
	ld e, a
	push hl
	ld a, [$cc28]
	bit 0, a
	jr z, .asm_11377c
	ld hl, $0040
	add hl, de
	ld e, l
	ld d, h

.asm_11377c
	ld hl, $cb67
	add hl, de
	ld e, l
	ld d, h
	ld hl, $cbff
	call Function113a32
	ld hl, $cc0c
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cbff
	call Function113a32
	pop hl
	ld a, [hli]
	ld b, a
	ld a, l
	ld [$cc0e], a
	ld a, h
	ld [$cc0f], a
	ld hl, $cbff
	call Function113a40
	ld hl, $cbf9
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cbff
	call Function113a32
	ld hl, $cbf7
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cbff
	ld b, $4
	call Function110000
	ld hl, $cc0c
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 4
	inc hl
endr
	ld a, h
	ld [$cc0d], a
	ld a, l
	ld [$cc0c], a
	cp $8e ; XXX LOW(Unknown_113b8e + $100) ???
	jp nz, .asm_113751
	ld de, $cc18
	ld hl, $cbe7
	call Function113a32
	ld de, $cc1c
	call Function113a32
	ld de, $cc20
	call Function113a32
	ld de, $cc24
	call Function113a32
	ld hl, $cc28
	bit 1, [hl]
	jr z, .asm_1137fc
	dec [hl]
	jp .asm_113734

.asm_1137fc
	ld hl, $cb67
	ld de, $cb97
	ld bc, $0030
	call Function113d66
	ld hl, $cc09
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, Unknown_113a55
	call Function110007
	ld hl, $cb97
	ld bc, $0020
	call Function113c8e
	ld a, l
	ld [$cc09], a
	ld a, h
	ld [$cc0a], a
	ld b, $12
	ld hl, $cb97
	ld de, $cb67
.asm_11382d
	ld a, $40
	and [hl]
	rlca
	ld c, a
	ld a, [hli]
	bit 4, a
	jr z, .asm_113839
	set 6, c

.asm_113839
	bit 2, a
	jr z, .asm_11383f
	set 5, c

.asm_11383f
	bit 0, a
	jr z, .asm_113845
	set 4, c

.asm_113845
	ld a, [hli]
	bit 6, a
	jr z, .asm_11384c
	set 3, c

.asm_11384c
	bit 4, a
	jr z, .asm_113852
	set 2, c

.asm_113852
	bit 2, a
	jr z, .asm_113858
	set 1, c

.asm_113858
	bit 0, a
	jr z, .asm_11385e
	set 0, c

.asm_11385e
	ld a, c
	ld [de], a
	inc de
	dec b
	jr nz, .asm_11382d
	ld b, $12
	ld hl, $cbba
	ld de, $cb8a
.asm_11386c
	ld a, $2
	and [hl]
	rrca
	ld c, a
	ld a, [hld]
	bit 3, a
	jr z, .asm_113878
	set 1, c

.asm_113878
	bit 5, a
	jr z, .asm_11387e
	set 2, c

.asm_11387e
	bit 7, a
	jr z, .asm_113884
	set 3, c

.asm_113884
	ld a, [hld]
	bit 1, a
	jr z, .asm_11388b
	set 4, c

.asm_11388b
	bit 3, a
	jr z, .asm_113891
	set 5, c

.asm_113891
	bit 5, a
	jr z, .asm_113897
	set 6, c

.asm_113897
	bit 7, a
	jr z, .asm_11389d
	set 7, c

.asm_11389d
	ld a, c
	ld [de], a
	dec de
	dec b
	jr nz, .asm_11386c
	ld b, $10
	ld de, $cb97
	ld hl, $cbe7
	call Function110000
	ld bc, $0010
	ld hl, $c97f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function110007
	ld a, $24
	sub c
	ld b, a
	ld l, e
	ld h, d
	ld a, $ff
.asm_1138c2
	ld [hli], a
	dec b
	jr nz, .asm_1138c2
	xor a
	ld [hl], a
	ld b, $24
	ld hl, $cb67
	ld de, $cb97
.asm_1138d0
	ld a, [de]
	inc de
	xor [hl]
	ld c, $0
	bit 0, a
	jr z, .asm_1138db
	set 3, c

.asm_1138db
	bit 3, a
	jr z, .asm_1138e1
	set 6, c

.asm_1138e1
	bit 6, a
	jr z, .asm_1138e7
	set 0, c

.asm_1138e7
	and $b6
	or c
	ld [hli], a
	dec b
	jr nz, .asm_1138d0
	ld hl, $cc09
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cb67
	ld bc, $0024
	call Function113c8e
	ld a, $22
	ld [hli], a
	ld a, $d
	ld [hli], a
	ld a, $a
	ld [hli], a
	xor a
	ld [hl], a
	ret

Function113909:
	call Function11391e
	ld a, c
	and $f0
	swap a
	or a
	jr z, Function11392f
	dec a
	jr z, Function113973
	dec a
	jp z, Function1139b7
	jp Function1139de

Function11391e:
	and $f
	ld e, a
	ld d, $0
	ld hl, Unknown_113b70
	add hl, de
	ld de, $cbf7
	ld b, $8
	jp Function110000

Function11392f:
	ld hl, $cbf9
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $cbff
	ld b, $4
	call Function110000
	ld hl, $cbfb
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cbff
	call Function113a0b
	ld hl, $cbf9
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $cc03
	ld b, $4
	call Function110000
	ld hl, $cc03
	call Function113a1f
	ld hl, $cbfd
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cc03
	call Function113a0b
	ld hl, $cbff
	ld de, $cc03
	call Function113a15
	ret

Function113973:
	ld hl, $cbf9
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $cbff
	ld b, $4
	call Function110000
	ld hl, $cbfd
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cbff
	call Function113a0b
	ld hl, $cbfd
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $cc03
	ld b, $4
	call Function110000
	ld hl, $cc03
	call Function113a1f
	ld hl, $cbfb
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cc03
	call Function113a0b
	ld hl, $cbff
	ld de, $cc03
	call Function113a15
	ret

Function1139b7:
	ld hl, $cbf9
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $cbff
	ld b, $4
	call Function110000
	ld hl, $cbfb
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cbff
	call Function113a28
	ld hl, $cbfd
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cbff
	call Function113a28
	ret

Function1139de:
	ld hl, $cbfd
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $cbff
	ld b, $4
	call Function110000
	ld hl, $cbff
	call Function113a1f
	ld hl, $cbf9
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cbff
	call Function113a15
	ld hl, $cbfb
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $cbff
	call Function113a28
	ret

Function113a0b:
	ld b, $4
.asm_113a0d
	ld a, [de]
	inc de
	and [hl]
	ld [hli], a
	dec b
	jr nz, .asm_113a0d
	ret

Function113a15:
	ld b, $4
.asm_113a17
	ld a, [de]
	inc de
	or [hl]
	ld [hli], a
	dec b
	jr nz, .asm_113a17
	ret

Function113a1f:
	ld b, $4
.asm_113a21
	ld a, [hl]
	cpl
	ld [hli], a
	dec b
	jr nz, .asm_113a21
	ret

Function113a28:
	ld b, $4
.asm_113a2a
	ld a, [de]
	inc de
	xor [hl]
	ld [hli], a
	dec b
	jr nz, .asm_113a2a
	ret

Function113a32:
	ld a, [de]
	inc de
	add [hl]
	ld [hli], a
	ld b, $3
.asm_113a38
	ld a, [de]
	inc de
	adc [hl]
	ld [hli], a
	dec b
	jr nz, .asm_113a38
	ret

Function113a40:
.asm_113a40
	or a
	push hl
	ld a, [hli]
	rla
	ld a, [hl]
	rla
	ld [hli], a
	ld a, [hl]
	rla
	ld [hli], a
	ld a, [hl]
	rla
	ld [hl], a
	pop hl
	ld a, [hl]
	rla
	ld [hl], a
	dec b
	jr nz, .asm_113a40
	ret

Unknown_113a55:
	db "Authorization: GB00 name=", $22, 0

Unknown_113a70:
	db $00, $00, $00, $07, $06, $04, $00, $0c, $04, $08, $00, $11, $02, $0c, $00, $16
	db $00, $10, $00, $07, $06, $14, $00, $0c, $04, $18, $00, $11, $02, $1c, $00, $16
	db $00, $20, $00, $07, $06, $24, $00, $0c, $04, $28, $00, $11, $02, $2c, $00, $16
	db $00, $30, $00, $07, $06, $34, $00, $0c, $04, $38, $00, $11, $02, $3c, $00, $16
	db $10, $04, $00, $05, $16, $18, $00, $09, $14, $2c, $00, $0e, $12, $00, $00, $14
	db $10, $14, $00, $05, $16, $28, $00, $09, $14, $3c, $00, $0e, $12, $10, $00, $14
	db $10, $24, $00, $05, $16, $38, $00, $09, $14, $0c, $00, $0e, $12, $20, $00, $14
	db $10, $34, $00, $05, $16, $08, $00, $09, $14, $1c, $00, $0e, $12, $30, $00, $14
	db $20, $14, $00, $04, $26, $20, $00, $0b, $24, $2c, $00, $10, $22, $38, $00, $17
	db $20, $04, $00, $04, $26, $10, $00, $0b, $24, $1c, $00, $10, $22, $28, $00, $17
	db $20, $34, $00, $04, $26, $00, $00, $0b, $24, $0c, $00, $10, $22, $18, $00, $17
	db $20, $24, $00, $04, $26, $30, $00, $0b, $24, $3c, $00, $10, $22, $08, $00, $17
	db $30, $00, $00, $06, $36, $1c, $00, $0a, $34, $38, $00, $0f, $32, $14, $00, $15
	db $30, $30, $00, $06, $36, $0c, $00, $0a, $34, $28, $00, $0f, $32, $04, $00, $15
	db $30, $20, $00, $06, $36, $3c, $00, $0a, $34, $18, $00, $0f, $32, $34, $00, $15
	db $30, $10, $00, $06, $36, $2c, $00, $0a, $34, $08, $00, $0f, $32, $24, $00, $15

Unknown_113b70:
	dw $cbe7
	dw $cbeb
	dw $cbef
	dw $cbf3
	dw $cbe7
	dw $cbeb
	dw $cbef

Unknown_113b7e:
	db $01, $23, $45, $67, $89, $ab, $cd, $ef
	db $fe, $dc, $ba, $98, $76, $54, $32, $10

Unknown_113b8e:
	db $78, $a4, $6a, $d7, $56, $b7, $c7, $e8, $db, $70, $20, $24, $ee, $ce, $bd, $c1
	db $af, $0f, $7c, $f5, $2a, $c6, $87, $47, $13, $46, $30, $a8, $01, $95, $46, $fd
	db $d8, $98, $80, $69, $af, $f7, $44, $8b, $b1, $5b, $ff, $ff, $be, $d7, $5c, $89
	db $22, $11, $90, $6b, $93, $71, $98, $fd, $8e, $43, $79, $a6, $21, $08, $b4, $49
	db $62, $25, $1e, $f6, $40, $b3, $40, $c0, $51, $5a, $5e, $26, $aa, $c7, $b6, $e9
	db $5d, $10, $2f, $d6, $53, $14, $44, $02, $81, $e6, $a1, $d8, $c8, $fb, $d3, $e7
	db $e6, $cd, $e1, $21, $d6, $07, $37, $c3, $87, $0d, $d5, $f4, $ed, $14, $5a, $45
	db $05, $e9, $e3, $a9, $f8, $a3, $ef, $fc, $d9, $02, $6f, $67, $8a, $4c, $2a, $8d
	db $42, $39, $fa, $ff, $81, $f6, $71, $87, $22, $61, $9d, $6d, $0c, $38, $e5, $fd
	db $44, $ea, $be, $a4, $a9, $cf, $de, $4b, $60, $4b, $bb, $f6, $70, $bc, $bf, $be
	db $c6, $7e, $9b, $28, $fa, $27, $a1, $ea, $85, $30, $ef, $d4, $05, $1d, $88, $04
	db $39, $d0, $d4, $d9, $e5, $99, $db, $e6, $f8, $7c, $a2, $1f, $65, $56, $ac, $c4
	db $44, $22, $29, $f4, $97, $ff, $2a, $43, $a7, $23, $94, $ab, $39, $a0, $93, $fc
	db $c3, $59, $5b, $65, $92, $cc, $0c, $8f, $7d, $f4, $ef, $ff, $d1, $5d, $84, $85
	db $4f, $7e, $a8, $6f, $e0, $e6, $2c, $fe, $14, $43, $01, $a3, $a1, $11, $08, $4e
	db $82, $7e, $53, $f7, $35, $f2, $3a, $bd, $bb, $d2, $d7, $2a, $91, $d3, $86, $eb

Function113c8e:
	ld a, c
	ld [$cc10], a
	ld a, b
	ld [$cc11], a
	ld c, e
	ld b, d
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	xor a
	ld [$cc16], a

.asm_113ca0
	ld b, $3
	push hl
	ld hl, $cc12
.asm_113ca6
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_113ca6
	ld a, [$cc10]
	ld c, a
	ld a, [$cc11]
	ld b, a
	xor a
	or b
	jr nz, .asm_113ccf
	ld a, $2
	cp c
	jr c, .asm_113ccf
	push hl
	dec hl
	ld a, c
	ld [$cc16], a
.asm_113cc3
	xor a
	ld [hld], a
	inc c
	ld a, $3
	cp c
	jr nz, .asm_113cc3
	pop hl
	ld bc, $0003

.asm_113ccf
	dec bc
	dec bc
	dec bc
	ld a, c
	ld [$cc10], a
	ld a, b
	ld [$cc11], a
	push de
	dec hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld a, [hl]
	ld d, a
	srl a
	srl a
	ld [hli], a
	ld a, $3
	and d
	ld d, a
	ld a, $f0
	and b
	or d
	swap a
	ld [hli], a
	ld a, $f
	and b
	ld d, a
	ld a, c
	and $c0
	or d
	rlca
	rlca
	ld [hli], a
	ld a, $3f
	and c
	ld [hld], a
	dec hl
	dec hl
	pop de
	ld b, h
	ld c, l
	pop hl
	ld a, [bc]
	inc bc
	call Function113d47
	ld [hli], a
	ld a, [bc]
	inc bc
	call Function113d47
	ld [hli], a
	ld a, [bc]
	inc bc
	call Function113d47
	ld [hli], a
	ld a, [bc]
	inc bc
	call Function113d47
	ld [hli], a
	ld a, [$cc10]
	cp $0
	jp nz, .asm_113ca0
	ld a, [$cc11]
	cp $0
	jp nz, .asm_113ca0
	ld a, [$cc16]
	cp $0
	jr z, .asm_113d43
	push hl
	dec hl
	ld b, a
.asm_113d39
	ld a, $3d
	ld [hld], a
	inc b
	ld a, $3
	cp b
	jr nz, .asm_113d39
	pop hl

.asm_113d43
	ld a, $0
	ld [hl], a
	ret

Function113d47:
	cp $1a
	jr c, .asm_113d5a
	cp $34
	jr c, .asm_113d5d
	cp $3e
	jr c, .asm_113d60
	cp $3e
	jr z, .asm_113d63
	ld a, $2f
	ret

.asm_113d5a
	add $41
	ret

.asm_113d5d
	add $47
	ret

.asm_113d60
	sub $4
	ret

.asm_113d63
	ld a, $2b
	ret

Function113d66:
	ld a, c
	ld [$cc10], a
	ld a, b
	ld [$cc11], a
	ld c, e
	ld b, d
	ld e, l
	ld d, h
	ld l, c
	ld h, b
.asm_113d74
	ld a, [$cc11]
	or a
	jr nz, .asm_113d82
	ld a, [$cc10]
	cp $4
	jp c, .asm_113e26

.asm_113d82
	ld b, $4
	push hl
	ld hl, $cc12
.asm_113d88
	ld a, [de]
	inc de
	call .Function113dfa
	ld [hli], a
	dec b
	jr nz, .asm_113d88
	ld a, [$cc10]
	ld c, a
	ld a, [$cc11]
	ld b, a
rept 4
	dec bc
endr
	ld a, b
	or c
	jr z, .asm_113dae
.asm_113da1
	ld a, [de]
	cp $d
	jr z, .asm_113daa
	cp $a
	jr nz, .asm_113dae

.asm_113daa
	inc de
	dec bc
	jr .asm_113da1

.asm_113dae
	ld a, c
	ld [$cc10], a
	ld a, b
	ld [$cc11], a
	push de
	dec hl
	ld d, [hl]
	dec hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld a, [hl]
	sla b
	sla b
	sla b
	rla
	sla b
	rla
	ld [hli], a
	ld [hl], b
	inc hl
	rrc c
	rrc c
	ld [hl], c
	dec hl
	ld a, $f
	and c
	or [hl]
	ld [hli], a
	ld a, [hli]
	and $c0
	or [hl]
	dec hl
	ld [hld], a
	dec hl
	pop de
	ld b, h
	ld c, l
	pop hl
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	ld a, [$cc10]
	or a
	jr nz, .asm_113d74
	ld a, [$cc11]
	or a
	jp nz, .asm_113d74
	xor a
	ld [hl], a
	ret

.Function113dfa:
	cp $2b
	jr c, .asm_113e24
	jr z, .asm_113e31
	cp $2f
	jr c, .asm_113e24
	jr z, .asm_113e34
	cp $30
	jr c, .asm_113e24
	cp $3a
	jr c, .asm_113e37
	cp $3d
	jr c, .asm_113e24
	jr z, .asm_113e3a
	cp $41
	jr c, .asm_113e24
	cp $5b
	jr c, .asm_113e3c
	cp $61
	jr c, .asm_113e24
	cp $7b
	jr c, .asm_113e3f

.asm_113e24
	pop hl
	pop hl
.asm_113e26
	ld hl, $c821
	set 1, [hl]
	ld a, $20
	ld [$c80f], a
	ret

.asm_113e31
	ld a, $3e
	ret

.asm_113e34
	ld a, $3f
	ret

.asm_113e37
	add $4
	ret

.asm_113e3a
	xor a
	ret

.asm_113e3c
	sub $41
	ret

.asm_113e3f
	sub $47
	ret

Function113e42:
	dec a
	jr z, .asm_113e4f
	dec a
	jr z, .asm_113e85
	dec a
	jr z, .asm_113ea8
	dec a
	jr z, .asm_113eb0
	ret

.asm_113e4f
	ld a, [$c807]
	cp $8
	jr nz, .asm_113e58
.asm_113e56
	dec [hl]
	ret

.asm_113e58
	xor a
	ld [$c86d], a
	ld a, $2
	ld [$c86a], a
	ld hl, $c821
	ld a, [hl]
	and $10
	set 5, a
	ld [hl], a
	jp Function113eb8

.asm_113e6d
	ld a, [$c86d]
	or a
	ld a, [$ca3c]
	jr z, .asm_113e81
	cp $9f
	jr z, .asm_113e85
	cp $a4
	jr z, .asm_113e85
.asm_113e7e
	jp Function112430

.asm_113e81
	cp $a3
	jr z, .asm_113e7e

.asm_113e85
	xor a
	ld [$c86d], a
	ld [$c81e], a
	ld a, $2
	ld [$c86a], a
	ld a, $3
	ld [$c807], a
	ld hl, $c821
	ld a, [hl]
	and $10
	set 5, a
	ld [hl], a
	ld hl, $c822
	bit 0, [hl]
	call z, Function111f97
	ret

.asm_113ea8
	ld a, [$c807]
	cp $8
	jr z, .asm_113e56
	ret

.asm_113eb0
	ld a, $1
	ld [$c86b], a
	jp .asm_113e6d

Function113eb8:
	ld a, $ff
	ld [$c81e], a
	ld hl, $c822
	res 5, [hl]
	res 0, [hl]
	jp Function111f97

Unreferenced_Function113ec7:
	ld hl, $c822
	ld a, [hl]
	push af
	res 3, [hl]
	res 0, [hl]
	ld hl, $c81a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	ld a, [hld]
	dec hl
	xor $80
	ld [$c81e], a
	ld b, $5
	call Function111f07
	pop af
	bit 0, a
	ret z
	ld hl, $c822
	set 0, [hl]
	ret

Function113ef2:
	dec a
	jr z, .asm_113efa
	dec a
	jr z, .asm_113f03
	dec [hl]
	ret

.asm_113efa
	ld a, [$c807]
	cp $8
	jr nz, Function113eb8
	dec [hl]
	ret

.asm_113f03
	ld a, $26
	call Function11225d
	ld a, $2a
	ld [$c86a], a
	ld hl, $c820
	ld a, [hld]
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	add hl, de
	add hl, de
	ld e, l
	ld d, h
	ld hl, $c815
	ld e, a
	ld [hli], a
	ld a, d
	ld [hl], a
	xor a
	ld [$c800], a
	ld hl, $cb47
	ld a, $2
	ld [hli], a
	dec a
	ld [hl], a
	ret

Function113f2d:
	dec a
	jr z, .asm_113f35
	dec a
	jr z, .asm_113f4f
	dec [hl]
	ret

.asm_113f35
	ld a, [$c807]
	cp $8
	jr nz, .asm_113f3e
	dec [hl]
	ret

.asm_113f3e
	xor a
	ld [$ca3c], a
	ld [$ca2f], a
	ld a, [$c81e]
	cp $91
	jr z, .asm_113f4f
	jp Function113eb8

.asm_113f4f
	xor a
	ld [$c86d], a
	ld hl, $c821
	set 0, [hl]
	ld hl, $c822
	xor a
	ld [hl], a
	xor a
	ld [$c80b], a
	xor a
	ld [$cb47], a
	ld hl, $c820
	ld a, [hld]
	ld h, [hl]
	ld l, a
	ld e, l
	ld d, h
	add hl, de
	add hl, de
	ld e, l
	ld d, h
	ld hl, $c815
	ld e, a
	ld [hli], a
	ld a, d
	ld [hl], a
	xor a
	ld [$c800], a
	ld hl, $cb47
	xor a
	ld [hli], a
	inc a
	ld [hl], a
	ret
