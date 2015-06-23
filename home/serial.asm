Serial:: ; 6ef
; The serial interrupt.

	push af
	push bc
	push de
	push hl

	ld a, [$ffc9]
	and a
	jr nz, .asm_71c

	ld a, [wc2d4]
	bit 0, a
	jr nz, .asm_721

	ld a, [$ffcb]
	inc a
	jr z, .asm_726

	ld a, [rSB]
	ld [hSerialReceive], a

	ld a, [hSerialSend]
	ld [rSB], a

	ld a, [$ffcb]
	cp $2
	jr z, .asm_752

	ld a, 0 << rSC_ON
	ld [rSC], a
	ld a, 1 << rSC_ON
	ld [rSC], a
	jr .asm_752

.asm_71c
	call Function3e80
	jr .asm_75a

.asm_721
	call Function2057
	jr .asm_75a

.asm_726
	ld a, [rSB]
	cp $1
	jr z, .asm_730
	cp $2
	jr nz, .asm_752

.asm_730
	ld [hSerialReceive], a
	ld [$ffcb], a
	cp $2
	jr z, .asm_74f

	xor a
	ld [rSB], a
	ld a, $3
	ld [rDIV], a

.asm_73f
	ld a, [rDIV]
	bit 7, a
	jr nz, .asm_73f

	ld a, 0 << rSC_ON
	ld [rSC], a
	ld a, 1 << rSC_ON
	ld [rSC], a
	jr .asm_752

.asm_74f
	xor a
	ld [rSB], a

.asm_752
	ld a, $1
	ld [$ffca], a
	ld a, $fe
	ld [hSerialSend], a

.asm_75a
	pop hl
	pop de
	pop bc
	pop af
	reti
; 75f

Function75f:: ; 75f
	ld a, $1
	ld [$ffcc], a
.asm_763
	ld a, [hl]
	ld [hSerialSend], a
	call Function78a
	push bc
	ld b, a
	inc hl
	ld a, $30
.asm_76e
	dec a
	jr nz, .asm_76e
	ld a, [$ffcc]
	and a
	ld a, b
	pop bc
	jr z, .asm_782
	dec hl
	cp $fd
	jr nz, .asm_763
	xor a
	ld [$ffcc], a
	jr .asm_763

.asm_782
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_763
	ret
; 78a

Function78a:: ; 78a
	xor a
	ld [$ffca], a
	ld a, [$ffcb]
	cp $2
	jr nz, .asm_79b
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a

.asm_79b
	ld a, [$ffca]
	and a
	jr nz, .asm_7e5
	ld a, [$ffcb]
	cp $1
	jr nz, .asm_7c0
	call Function82b
	jr z, .asm_7c0
	call .asm_825
	push hl
	ld hl, wcf5c
	inc [hl]
	jr nz, .asm_7b7
	dec hl
	inc [hl]

.asm_7b7
	pop hl
	call Function82b
	jr nz, .asm_79b
	jp Function833

.asm_7c0
	ld a, [rIE]
	and $f
	cp $8
	jr nz, .asm_79b
	ld a, [wcf5d]
	dec a
	ld [wcf5d], a
	jr nz, .asm_79b
	ld a, [wcf5d + 1]
	dec a
	ld [wcf5d + 1], a
	jr nz, .asm_79b
	ld a, [$ffcb]
	cp $1
	jr z, .asm_7e5
	ld a, $ff
.asm_7e2
	dec a
	jr nz, .asm_7e2

.asm_7e5
	xor a
	ld [$ffca], a
	ld a, [rIE]
	and $f
	sub $8
	jr nz, .asm_7f8
	ld [wcf5d], a
	ld a, $50
	ld [wcf5d + 1], a

.asm_7f8
	ld a, [hSerialReceive]
	cp $fe
	ret nz
	call Function82b
	jr z, .asm_813
	push hl
	ld hl, wcf5c
	ld a, [hl]
	dec a
	ld [hld], a
	inc a
	jr nz, .asm_80d
	dec [hl]

.asm_80d
	pop hl
	call Function82b
	jr z, Function833

.asm_813
	ld a, [rIE]
	and $f
	cp $8
	ld a, $fe
	ret z
	ld a, [hl]
	ld [hSerialSend], a
	call DelayFrame
	jp Function78a

.asm_825
	ld a, $f
.asm_827
	dec a
	jr nz, .asm_827
	ret
; 82b

Function82b:: ; 82b
	push hl
	ld hl, wcf5b
	ld a, [hli]
	or [hl]
	pop hl
	ret
; 833

Function833:: ; 833
	dec a
	ld [wcf5b], a
	ld [wcf5c], a
	ret
; 83b

Function83b:: ; 83b
	ld hl, wcf56
	ld de, wcf51
	ld c, $2
	ld a, $1
	ld [$ffcc], a
.asm_847
	call DelayFrame
	ld a, [hl]
	ld [hSerialSend], a
	call Function78a
	ld b, a
	inc hl
	ld a, [$ffcc]
	and a
	ld a, $0
	ld [$ffcc], a
	jr nz, .asm_847
	ld a, b
	ld [de], a
	inc de
	dec c
	jr nz, .asm_847
	ret
; 862

Function862:: ; 862
	call Function309d
	callab Function4000
	call Function87d
	jp Function30b4
; 871


Function871:: ; 871
	call Function309d
	callab Function4000
	jp Function87d
; 87d



Function87d:: ; 87d
	ld a, $ff
	ld [wcf52], a
.asm_882
	call Function8c1
	call DelayFrame
	call Function82b
	jr z, .asm_89e
	push hl
	ld hl, wcf5c
	dec [hl]
	jr nz, .asm_89d
	dec hl
	dec [hl]
	jr nz, .asm_89d
	pop hl
	xor a
	jp Function833

.asm_89d
	pop hl

.asm_89e
	ld a, [wcf52]
	inc a
	jr z, .asm_882
	ld b, $a
.asm_8a6
	call DelayFrame
	call Function8c1
	dec b
	jr nz, .asm_8a6
	ld b, $a
.asm_8b1
	call DelayFrame
	call Function908
	dec b
	jr nz, .asm_8b1
	ld a, [wcf52]
	ld [wcf51], a
	ret
; 8c1

Function8c1:: ; 8c1
	push bc
	ld b, $60
	ld a, [InLinkBattle]
	cp $1
	jr z, .asm_8d7
	ld b, $60
	jr c, .asm_8d7
	cp $2
	ld b, $70
	jr z, .asm_8d7
	ld b, $80

.asm_8d7
	call Function8f3
	ld a, [wcf56]
	add b
	ld [hSerialSend], a
	ld a, [$ffcb]
	cp $2
	jr nz, .asm_8ee
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a

.asm_8ee
	call Function8f3
	pop bc
	ret
; 8f3

Function8f3:: ; 8f3
	ld a, [hSerialReceive]
	ld [wcf51], a
	and $f0
	cp b
	ret nz
	xor a
	ld [hSerialReceive], a
	ld a, [wcf51]
	and $f
	ld [wcf52], a
	ret
; 908

Function908:: ; 908
	xor a
	ld [hSerialSend], a
	ld a, [$ffcb]
	cp $2
	ret nz
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	ret
; 919

Function919:: ; 919
	ld a, [InLinkBattle]
	and a
	ret nz
	ld a, $2
	ld [rSB], a
	xor a
	ld [hSerialReceive], a
	ld a, $0
	ld [rSC], a
	ld a, $80
	ld [rSC], a
	ret
; 92e
