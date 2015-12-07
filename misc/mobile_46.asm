SECTION "bank46", ROMX, BANK[$46]

Function118000: ; 118000
	ld a, $1
	ld [wcd38], a
	jr asm_11800b

Function118007: ; 118007
	xor a
	ld [wcd38], a

asm_11800b
	call Function1183cb
	ld a, $18
	ld [wcd33], a
	ld a, $19
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_118024
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $1b
	jr c, .asm_118037
	ld a, [wcd34]
	ld [wcf66], a

.asm_118037
	call Function1184a5
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_118024
	pop af
	ld [rSVBK], a
	call Function118452
	call ReturnToMapFromSubmenu
Function11805e: ; 11805e (46:405e)
	ret
; 11805f

Function11805f: ; 11805f
	ld a, $1
	ld [wcd38], a
	call Function1183cb
	ld a, $18
	ld [wcd33], a
	ld a, $19
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_11807d
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $1b
	jr c, .asm_118090
	ld a, [wcd34]
	ld [wcf66], a

.asm_118090
	call Function11857c
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11807d
	pop af
	ld [rSVBK], a
	call Function118452
	call ReturnToMapFromSubmenu
	ret
; 1180b8

Function1180b8: ; 1180b8
	call Function1183cb
	ld a, $22
	ld [wcd33], a
	ld a, $23
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_1180d1
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $28
	jr c, .asm_1180e4
	ld a, [wcd34]
	ld [wcf66], a

.asm_1180e4
	ld a, [wcf66]
	cp $10
	jr c, .asm_1180f2
	cp $16
	jr nc, .asm_1180f2
	call Function11884c

.asm_1180f2
	call Function1184ec
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_1180d1
	pop af
	ld [rSVBK], a
	call Function118452
	call ReturnToMapFromSubmenu
	ret
; 11811a

Function11811a: ; 11811a
	ld a, 1
	ld [wcd38], a
	jr Function118125

Function118121: ; 118121
	xor a
	ld [wcd38], a

Function118125: ; 118125
	call Function1183cb
	ld a, $3
	ld [wcd33], a
	ld a, $d
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_11813e
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $f
	jr c, .asm_118151
	ld a, [wcd34]
	ld [wcf66], a

.asm_118151
	call Function11854d
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11813e
	xor a
	ld [w3_d000], a
	pop af
	ld [rSVBK], a
	call Function118452
	call Function118180
	call ReturnToMapFromSubmenu
	ret
; 118180

Function118180: ; 118180
	ld a, [ScriptVar]
	and a
	ret nz
	ld a, [wcd38]
	and a
	ret z
	ld a, $5
	call GetSRAMBank
	ld hl, wcd69
	ld de, $a89c
	ld bc, $0016
	call CopyBytes

	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a

	ld de, w3_d202
	ld c, $96
	callba CheckStringForErrors_IgnoreTerminator
	jr c, .return_d3

	ld de, w3_d202
	lb bc, 1, $96
	callba CheckStringContainsLessThanBNextCharacters
	jr c, .return_d3

	ld hl, w3_d202
	ld de, $a8b2
	ld bc, $0096
	call CopyBytes
.reset_banks
	pop af
	ld [rSVBK], a
	call CloseSRAM
	ret

.return_d3
	ld a, $d3
	ld [wc300], a
	ld [ScriptVar], a
	jr .reset_banks
; 1181da

Function1181da: ; 1181da
	call Function1183cb
	ld a, $2
	ld [wcd38], a
	ld a, $21
	ld [wcd33], a
	ld a, $22
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_1181f8
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $28
	jr c, .asm_11820b
	ld a, [wcd34]
	ld [wcf66], a

.asm_11820b
	call Function1185c3
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_1181f8
	pop af
	ld [rSVBK], a
	call Function118452
	call ReturnToMapFromSubmenu
	ret
; 118233

Function118233: ; 118233
	call Function1183cb
	ld a, $1b
	ld [wcd33], a
	ld a, $1c
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_11824c
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $1e
	jr c, .asm_11825f
	ld a, [wcd34]
	ld [wcf66], a

.asm_11825f
	call Function118624
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11824c
	pop af
	ld [rSVBK], a
	call Function118452
	ret
; 118284

Function118284: ; 118284
	call Function1183cb
	ld a, $19
	ld [wcd33], a
	ld a, $1e
	ld [wcd34], a
	ld a, $5
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_11829d
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $20
	jr c, .asm_1182b0
	ld a, [wcd34]
	ld [wcf66], a
.asm_1182b0
	call Function1186f5
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11829d
	pop af
	ld [rSVBK], a
	call Function118452
	ret
; 1182d5 (46:42d5)


Function1182d5: ; 1182d5
	call Function1183cb
	ld a, $18
	ld [wcd33], a
	ld a, $19
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_1182ee
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $1b
	jr c, .asm_118301
	ld a, [wcd34]
	ld [wcf66], a

.asm_118301
	call Function118746
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_1182ee
	pop af
	ld [rSVBK], a
	call Function118452
	call ReturnToMapFromSubmenu
	ret
; 118329

Function118329: ; 118329
	call Function1183cb
	ld a, $15
	ld [wcd33], a
	ld a, $16
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_118342
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $18
	jr c, .asm_118355
	ld a, [wcd34]
	ld [wcf66], a

.asm_118355
	call Function118671
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_118342
	pop af
	ld [rSVBK], a
	call Function118452
	ret
; 11837a

Function11837a: ; 11837a
	call Function1183cb
	ld a, $16
	ld [wcd33], a
	ld a, $17
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_118393
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $19
	jr c, .asm_1183a6
	ld a, [wcd34]
	ld [wcf66], a

.asm_1183a6
	call Function1186b2
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_118393
	pop af
	ld [rSVBK], a
	call Function118452
	ret
; 1183cb

Function1183cb: ; 1183cb
	di
	ld a, [rIE]
	ld [wcd32], a
	call DoubleSpeed
	xor a
	ld [rIF], a
	ld [wc300], a
	ld [wc301], a
	ld [wc302], a
	ld [wcd80], a
	ld [wcd65], a
	ld [wcd66], a
	ld [wcd67], a
	ld [wcd68], a
	ld [wc314 + 6], a
	ld [wcd89], a
	ld [wcd8a], a
	ld [wcd8b], a
	ld [wc3ec], a
	ld [wc3ed], a
	ld [wc3ee], a
	ld [wc3ef], a
	ld hl, VramState
	ld a, [hl]
	ld [wcd7f], a
	set 1, [hl]
	ld a, $f
	ld [rIE], a
	ld a, $1
	ld [hFFC9], a
	ld [hMobile], a
	ei
	callba MobileFunc_106462
	callba Function106464
	callba Function115d99
	callba Function11615a
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$bfff], a
	call CloseSRAM
	ret
; 118440

Function118440: ; 118440
	push af
	ld a, $5
	call GetSRAMBank
	ld a, [$bfff]
	inc a
	ld [$bfff], a
	call CloseSRAM
	pop af
	ret
; 118452

Function118452: ; 118452
	di
	xor a
	ld [hFFC9], a
	ld [hMobile], a
	ld [hVBlank], a
	call NormalSpeed
	xor a
	ld [rIF], a
	ld a, [wcd32]
	ld [rIE], a
	ei
	ld a, [wcd7f]
	ld [VramState], a
	ld a, [wc300]
	ld [ScriptVar], a
	ret
; 118473

Function118473: ; 118473
	ld a, [wcd65]
	and a
	ret z
	ld a, [wcd66]
	inc a
	ld [wcd66], a
	cp $3c
	ret nz
	xor a
	ld [wcd66], a
	ld a, [wcd67]
	inc a
	ld [wcd67], a
	cp $3c
	ret nz
	ld a, [wcd68]
	inc a
	ld [wcd68], a
	cp $63
	jr z, .asm_1184a0
	xor a
	ld [wcd67], a
	ret

.asm_1184a0
	xor a
	ld [wcd65], a
	ret
; 1184a5

Function1184a5: ; 1184a5
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_1184b4
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1184b4

Jumptable_1184b4: ; 1184b4
	dw Function11886e
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118a8f
	dw Function11878d
	dw Function118d80
	dw Function118d9b
	dw Function11878d
	dw Function118ded
	dw Function118e6d
	dw Function11878d
	dw Function11984e
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 1184ec

Function1184ec: ; 1184ec
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_1184fb
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1184fb

Jumptable_1184fb: ; 1184fb
	dw Function11886e
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function119954
	dw Function11878d
	dw Function119973
	dw Function11878d
	dw Function119987
	dw Function11878d
	dw Function1199b4
	dw Function1199ca
	dw Function11878d
	dw Function1199e2
	dw Function119b0d
	dw Function11878d
	dw Function119b6b
	dw Function119b3b
	dw Function11878d
	dw Function119b52
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function119b45
	dw Function11878d
	dw Function119ac9
	dw Function118e76
; 11854d

Function11854d: ; 11854d
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11855c
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11855c

Jumptable_11855c: ; 11855c
	dw Function118922
	dw Function118936
	dw Function118982
	dw Function11805e
	dw Function119ca2
	dw Function119cab
	dw Function119cb8
	dw Function119cc3
	dw Function119cdf
	dw Function119cec
	dw Function119c97
	dw Function119cab
	dw Function119cb8
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 11857c

Function11857c: ; 11857c
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11858b
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11858b

Jumptable_11858b: ; 11858b
	dw Function11886e
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118a7a
	dw Function11878d
	dw Function11891c
	dw Function1198ee
	dw Function1198f7
	dw Function11878d
	dw Function119937
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 1185c3

Function1185c3: ; 1185c3
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_1185d2
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1185d2

Jumptable_1185d2: ; 1185d2
	dw Function11886e
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118aa4
	dw Function11878d
	dw Function118e92
	dw Function11878d
	dw Function118eb0
	dw Function118ec6
	dw Function118f0d
	dw Function118f14
	dw Function118f5e
	dw Function11878d
	dw Function118fc0
	dw Function11878d
	dw Function119054
	dw Function1190d0
	dw Function11878d
	dw Function1190ec
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function119cc3
	dw Function119cdf
	dw Function119cec
	dw Function11914e
	dw Function118e76
; 118624

Function118624: ; 118624
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_118633
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 118633

Jumptable_118633: ; 118633
	dw Function118866
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118aa4
	dw Function11878d
	dw Function118e92
	dw Function11878d
	dw Function11915d
	dw Function118f68
	dw Function11878d
	dw Function119009
	dw Function11878d
	dw Function119054
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 118671

Function118671: ; 118671
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_118680
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 118680

Jumptable_118680: ; 118680
	dw Function118866
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function119380
	dw Function119388
	dw Function1193a0
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 1186b2

Function1186b2: ; 1186b2
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_1186c1
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1186c1

Jumptable_1186c1: ; 1186c1
	dw Function118866
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function119380
	dw Function1193e3
	dw Function1193fb
	dw Function11878d
	dw Function119413
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 1186f5

Function1186f5: ; 1186f5 (46:46f5)
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_118704
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 118704 (46:4704)

Jumptable_118704: ; 118704 (46:4704)
	dw Function11886a
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118abc
	dw Function11878d
	dw Function119451
	dw Function1195f8
	dw Function119612
	dw Function119629
	dw Function119648
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function11967d
	dw Function119685
	dw Function119665
	dw Function11966d
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 118746 (46:4746)

Function118746: ; 118746
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_118755
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 118755

Jumptable_118755: ; 118755
	dw Function11886e
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118ad0
	dw Function11878d
	dw Function1196f2
	dw Function1197c9
	dw Function1197dc
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function119800
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 11878d

Function11878d: ; 11878d (46:478d)
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_1187af
	bit 2, a
	jr nz, .asm_1187d1
	bit 0, a
	jr nz, .asm_1187aa
	ld a, [wcd89]
	and $1
	jr z, .asm_1187a7
	ld a, $3
	ld [rSVBK], a
.asm_1187a7
	jp Function119e2e
.asm_1187aa
	call Function118821
	ret c
	ret
.asm_1187af
	ld a, $0
	call Function3e32
	ld [wc300], a
	ld a, l
	ld [wc301], a
	ld a, h
	ld [wc302], a
	ld a, $a
	call Function3e32
	ld a, [wc3f0]
	ld [wc314 + 5], a
	ld a, [wcd34]
	ld [wcf66], a
	ret
.asm_1187d1
	ld hl, wcd89
	bit 0, [hl]
	jr nz, .asm_118803
	set 0, [hl]
	ld a, $6
	ld [rSVBK], a
	ld de, UnknBGPals
	ld bc, $1000
	ld a, [hl]
	sla a
	jr c, .asm_1187f9
	sla a
	jr c, .asm_1187fd
	sla a
	jr c, .asm_1187f5
	ld a, $24
	jr .asm_1187ff
.asm_1187f5
	ld a, $28
	jr .asm_1187ff
.asm_1187f9
	ld a, $2a
	jr .asm_1187ff
.asm_1187fd
	ld a, $2c
.asm_1187ff
	call Function3e32
	ret
.asm_118803
	ld a, $d3

Function118805: ; 118805 (46:4805)
	ld [wc300], a
	xor a
	ld [wc301], a
	ld [wc302], a
	ld a, $a
	call Function3e32
	ld a, [wc3f0]
	ld [wc314 + 5], a
	ld a, [wcd34]
	ld [wcf66], a
	ret

Function118821: ; 118821 (46:4821)
	ld a, [wc314 + 5]
	cp $3
	jr c, .asm_11884a
	cp $4
	jr z, .asm_11884a
	ld a, [hJoyDown]
	cp $5
	jr nz, .asm_11884a
	ld a, $a
	call Function3e32
	ld a, $a
	ld [wc300], a
	ld a, [wc3f0]
	ld [wc314 + 5], a
	ld a, [wcd34]
	ld [wcf66], a
	scf
	ret
.asm_11884a
	and a
	ret
; 11884c (46:484c)

Function11884c: ; 11884c
	ld a, [hJoyDown]
	cp $5
	jr nz, .asm_118864
	ld a, $a
	call Function3e32
	ld a, $a
	ld [wc300], a
	ld a, [wcd34]
	ld [wcf66], a
	scf
	ret

.asm_118864
	and a
	ret
; 118866

Function118866:
	ld a, 2
	jr asm_11886f

Function11886a: ; 11886a (46:486a)
	ld a, 1
	jr asm_11886f
; 11886e (46:486e)

Function11886e:
	xor a

asm_11886f
	ld [BGMapPalBuffer], a
	ld a, $0
	ld [wcd3c], a
	call Function119e2e
	ld a, [wcd33]
	ld [wcd45], a

Function118880: ; 118880 (46:4880)
	call Function119ed8
	ret c
	xor a
	ld [wcf64], a
	ld [wc807], a
	ld de, wcd81
	ld hl, $46
	ld a, $2
	jp Function119e2b
; 118896 (46:4896)

Function118896: ; 118896
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_1188a5
	bit 2, a
	jr nz, .asm_1188a5
	bit 0, a
	jr z, .asm_1188aa

.asm_1188a5
	ld a, $34
	jp Function119e2b

.asm_1188aa
	call Function119e2e
	jp Function119e2e
; 1188b0

Function1188b0: ; 1188b0 (46:48b0)
	ld de, wc314 + 48 + 2
	ld a, $c
	jp Function119e2b

Function1188b8: ; 1188b8 (46:48b8)
	ld de, wc3ac
	ld a, $e
	jp Function119e2b

Function1188c0: ; 1188c0 (46:48c0)
	ld de, wc3cd
	ld a, $10
	jp Function119e2b

Function1188c8: ; 1188c8 (46:48c8)
	ld a, $1
	ld [wcd65], a
	call Function1188e7
	ld hl, wc708
.asm_1188d3
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .asm_1188d3
	call Function119eb4
	call Function119ec2
	ld hl, wc708
	ld a, $6
	jp Function119e2b

Function1188e7: ; 1188e7 (46:48e7)
	ld de, wc314 + 48 + 2
	ld a, $5
	call GetSRAMBank
	ld a, [$aa4a]
	call CloseSRAM
	and a
	ret z
	sla a
	ld c, a
.asm_1188fa
	ld a, [de]
	inc de
	and a
	jr nz, .asm_1188fa
	dec c
	jr nz, .asm_1188fa
	ret

Function118903: ; 118903 (46:4903)
	ld a, [wc3f0]
	ld [wc314 + 5], a
	ld c, $1
	callba Function115e18
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	jp Function119e2e


Function11891c: ; 11891c
	call Function118b42
	jp Function119e2e


Function118922: ; 118922
	ld a, [wcd38]
	and a
	jr nz, .asm_11892d
	ld hl, Text_WhatLevelDoYouWantToChallenge
	jr .asm_118930

.asm_11892d
	ld hl, Text_CheckBattleRoomListByMaxLevel

.asm_118930
	call Function11a9c0
	call Function119e2e

Function118936:
	ld a, [wc314 + 6]
	and a
	ret nz
	ld hl, MenuDataHeader_119cf7
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	call ApplyTilemap
	hlcoord 16, 8, AttrMap
	ld a, $40
	or [hl]
	ld [hl], a
	call Function3200
	ld a, $1
	ld [wcd4f], a
	ld a, $1
	ld [rSVBK], a
	ld a, [StatusFlags]
	bit 6, a
	jr nz, .asm_11896b
	ld hl, Strings_Ll0ToL40		; Address to list of strings with the choosable levels
	ld a, 5						; 4 levels to choose from, including 'Cancel'-option
	jr .asm_118970

.asm_11896b
	ld hl, Strings_L10ToL100	; Address to list of strings with the choosable levels
	ld a, 11					; 10 levels to choose from, including 'Cancel'-option

.asm_118970
	ld [wcd4a], a
	ld a, l
	ld [wcd4b], a
	ld a, h
	ld [wcd4c], a
	ld a, $3
	ld [rSVBK], a
	call Function119e2e

Function118982:
	hlcoord 13, 8
	ld de, String_119d07
	call PlaceString
	hlcoord 13, 10
	ld de, String_119d07
	call PlaceString
	ld a, [wcd4b]
	ld l, a
	ld a, [wcd4c]
	ld h, a
	ld d, $0
	ld a, [wcd4f]
	dec a
	rlca
	rlca
	rlca
	ld e, a
	add hl, de
	ld a, l
	ld e, a
	ld a, h
	ld d, a
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld bc, StringBuffer3
.asm_1189b5
	ld a, [hli]
	cp $50
	jr z, .asm_1189c4
	cp $7f
	jr z, .asm_1189c2
	ld [bc], a
	inc bc
	jr .asm_1189b5

.asm_1189c2
	ld a, $50

.asm_1189c4
	ld [bc], a
	pop af
	ld [rSVBK], a
	hlcoord 13, 9
	call PlaceString
	ld hl, hJoyPressed
	ld a, [hl]
	and $2
	jr nz, .asm_118a39
	ld a, [hl]
	and $1
	jr nz, .asm_118a01
	ld a, [hl]
	and $80
	jr nz, .asm_1189e6
	ld a, [hl]
	and $40
	jr nz, .asm_1189f2
.asm_1189e5
	ret

.asm_1189e6
	ld hl, wcd4f
	dec [hl]
	jr nz, .asm_1189e5
	ld a, [wcd4a]
	ld [hl], a
	jr .asm_1189e5

.asm_1189f2
	ld a, [wcd4a]
	ld hl, wcd4f
	inc [hl]
	cp [hl]
	jr nc, .asm_1189e5
	ld a, $1
	ld [hl], a
	jr .asm_1189e5

.asm_118a01
	call PlayClickSFX
	ld a, [wcd4f]
	ld hl, wcd4a
	cp [hl]
	jr z, .asm_118a3c
	dec a
	and $fe
	srl a
	ld [wcf65], a
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	call WriteBackup
	pop af
	ld [rSVBK], a
	ld a, [wcd38]
	and a
	jr nz, .asm_118a30
	call Function119d93
	ret c
	call Function119dd1
	ret c

.asm_118a30
	ld a, [wcd4f]
	ld [wd000 + $800], a
	jp Function119e2e

.asm_118a39
	call PlayClickSFX

.asm_118a3c
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	call WriteBackup
	pop af
	ld [rSVBK], a
	ld a, $7
	ld [wcf66], a
	ld a, $0
	ld [wcd46], a
	ret



Function118a54: ; 118a54
	ld a, [wcd55]
	ld l, a
	ld a, [wcd56]
	ld h, a
	ld de, wc3ec
	ld bc, $0004
	jp Function118ae4
; 118a65

Function118a65: ; 118a65
	ld hl, BattleDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, UnknBGPals
	ld bc, $1000
	jp Function118b10
; 118a7a

Function118a7a: ; 118a7a
	ld hl, BattleDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, UnknBGPals
	ld bc, $1000
	jp Function118b10
; 118a8f

Function118a8f: ; 118a8f
	ld hl, ExchangeDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, UnknBGPals
	ld bc, $1000
	jp Function118b10
; 118aa4

Function118aa4: ; 118aa4
	ld hl, NewsDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld a, $5
	ld [rSVBK], a
	ld de, LYOverrides
	ld bc, $e00
	jr Function118b10
; 118abc

Function118abc: ; 118abc (46:4abc)
	ld hl, MenuDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, UnknBGPals
	ld bc, $1000
	jr Function118b10
; 118ad0 (46:4ad0)

Function118ad0:
	ld hl, IndexDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, UnknBGPals
	ld bc, $1000
	jr Function118b10

Function118ae4:
	push bc
	push de
	push hl
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	pop hl
	ld c, $0
	ld de, wcc60
.asm_118af5
	ld a, [hli]
	ld [de], a
	inc de
	and a
	jr z, .asm_118b06
	inc c
	ld a, c
	cp $a6
	jr c, .asm_118af5
	ld a, $da
	jp Function118805

.asm_118b06
	call Function118b24
	pop de
	pop bc
	ld a, $2a
	jp Function119e2b
; 118b10

Function118b10:
	push de
	push bc
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	call Function118b24
	pop bc
	pop de
	ld a, $2a
	jp Function119e2b

Function118b24: ; 118b24 (46:4b24)
	ld hl, wc314 + 48 + 2
	ld a, $8
	ld [hli], a
	ld a, $c7
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $80
	ld [wcd89], a
	ld hl, wc314 + 48 + 2
	ret
; 118b42 (46:4b42)

Function118b42: ; 118b42
	ld hl, wd002
	ld a, l
	ld [wcd51], a
	ld a, h
	ld [wcd52], a
	call Function118b8c
	ld a, l
	ld [wcd55], a
	ld [wcd59], a
	ld a, h
	ld [wcd56], a
	ld [wcd5a], a
	call Function118b8c
	ld a, l
	ld [wcd53], a
	ld [wcd5d], a
	ld a, h
	ld [wcd54], a
	ld [wcd5e], a
	call Function118b8c
	ld a, l
	ld [wcd57], a
	ld [wcd5b], a
	ld a, h
	ld [wcd58], a
	ld [wcd5c], a
	call Function118b8c
	ld a, l
	ld [wcd5f], a
	ld a, h
	ld [wcd60], a
	ret
; 118b8c

Function118b8c: ; 118b8c
.asm_118b8c
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_118b8c
	dec hl
	xor a
rept 2
	ld [hli], a
endr
	ret
; 118b9a

Function118b9a: ; 118b9a
	ld a, h
	cp $e0
	ret c
	ld a, $d3
	call Function118805
	and a
	ret
; 118ba5


	charmap " ", $20 ; revert to ascii

ExchangeDownloadURL: ; 0x118ba5
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/exchange/index.txt", 0

BattleDownloadURL: ; 0x118bf7
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/battle/index.txt", 0

NewsDownloadURL: ; 0x118c47
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/news/index.txt", 0

MenuDownloadURL: ; 0x118c95
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/POKESTA/menu.cgb", 0

IndexDownloadURL: ; 0x118ce5
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/tamago/index.txt", 0


Function118d35: ; 118d35
	ld hl, LYOverridesBackup
	ld a, [wcd38]
	and a
	jr nz, .asm_118d6e
	ld a, [hli]
	cp $94
	jr nz, .asm_118d7b
	ld a, [hl]
	cp $5
	jr nz, .asm_118d7b
	ld a, [wcd4f]
	sla a
	ld b, a
	sla a
	sla a
	add b
	ld b, a
	ld a, $5
	call GetSRAMBank
	ld a, b
	ld [$b2fb], a
	call CloseSRAM
	callba Function170be4
	callba Function1700c4
	jr .asm_118d78

.asm_118d6e
	ld a, [hli]
	cp $96
	jr nz, .asm_118d7b
	ld a, [hl]
	cp $0
	jr nz, .asm_118d7b

.asm_118d78
	jp Function119e2e

.asm_118d7b
	ld a, $d3
	jp Function118805
; 118d80

Function118d80: ; 118d80
	call Function118e06
	ld a, [wcd38]
	and a
	jr z, .asm_118d8e
	call Function119e2e
	jr asm_118d9f

.asm_118d8e
	ld a, $9
	ld [wcd3c], a
	ld a, $12
	ld [wcd45], a
	call Function119e2e

Function118d9b:
	call Function119ed8
	ret c

asm_118d9f
	ld hl, $c608
	call Function119940
	ld a, [wcd38]
	and a
	jr nz, .asm_118db2
	ld a, $8f
	ld [wcd3b], a
	jr .asm_118db7

.asm_118db2
	ld a, $26
	ld [wcd3b], a

.asm_118db7
	ld hl, $d800
	ld a, $8
	ld [hli], a
	ld a, $c6
	ld [hli], a
	ld a, [wcd3b]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $8
	ld [hli], a
	ld a, $c7
	ld [hli], a
	ld a, [wcd39]
	ld [hli], a
	ld a, [wcd3a]
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, $d800
	ld de, $de00
	ld bc, $0200
	ld a, $2c
	jp Function119e2b
; 118ded

Function118ded: ; 118ded
	ld a, [wcd38]
	and a
	jr z, .asm_118e03
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba Function11b93b
	pop af
	ld [rSVBK], a

.asm_118e03
	jp Function119e2e
; 118e06

Function118e06: ; 118e06
	ld hl, wd002
	ld a, [wcd38]
	and a
	jr z, .asm_118e1d
.asm_118e0f
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_118e0f
	ld a, [hli]
	cp $a
	jr nz, .asm_118e0f

.asm_118e1d
	ld a, l
	ld [wcd39], a
	ld a, h
	ld [wcd3a], a
.asm_118e25
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_118e25
	ld a, [hli]
	cp $a
	jr nz, .asm_118e25
	dec hl
	xor a
	ld [hld], a
	ld [hl], a
	jr asm_118e3e

Function118e39: ; 118e39 (46:4e39)
.asm_118e39
	ld a, [hli]
	and a
	jr nz, .asm_118e39
	dec hl
asm_118e3e
.asm_118e3e
	ld a, [hld]
	cp $2f
	jr nz, .asm_118e3e
rept 2
	inc hl
endr
	ld de, wcd85
	ld c, $4
.asm_118e4a
	ld a, [hli]
	cp $2e
	jr z, .asm_118e63
	cp $30
	jr c, .asm_118e67
	cp $3a
	jr nc, .asm_118e67
	sub $30
	add $f6
	ld [de], a
	inc de
	dec c
	jr nz, .asm_118e4a
	ld de, wcd85
.asm_118e63
	ld a, $50
	ld [de], a
	ret
.asm_118e67
	ld a, $f3
	ld [de], a
	inc de
	jr .asm_118e63

Function118e6d: ; 118e6d (46:4e6d)
	xor a
	ld [wcd65], a
	ld a, $a
	jp Function119e2b

Function118e76: ; 118e76 (46:4e76)
	ld a, $c
	ld [wcd3c], a
	jp Function119e2e

Function118e7e: ; 118e7e (46:4e7e)
	call Function119ed8
	ret c
	ld a, $36
	jp Function119e2b

Function118e87: ; 118e87 (46:4e87)
	call Function119ed8
	ret c
	ld a, [wcd33]
	ld [wcf66], a
	ret
; 118e92 (46:4e92)

Function118e92: ; 118e92
	call Function118440
	call Function1191d3
	ld a, [wcd53]
	ld l, a
	ld a, [wcd54]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld de, $d800
	ld bc, $0800
	jp Function118b10
; 118eb0

Function118eb0: ; 118eb0
	call Function118440
	ld hl, $d802
	ld de, BGMapBuffer
	ld bc, $000c
	call CopyBytes
	call Function1192cc
	ret c
	jp Function119e2e
; 118ec6

Function118ec6: ; 118ec6
	call Function118440
	call SpeechTextBox
	ld hl, $d80e
	ld de, wc314 + 12
	ld bc, $0026
	call CopyBytes
	xor a
	ld [wc314 + 11], a
	ld a, $20
	ld [wc314 + 7], a
	ld a, $c3
	ld [wc314 + 8], a
	hlcoord 1, 14
	ld a, l
	ld [wc314 + 9], a
	ld a, h
	ld [wc314 + 10], a
	ld a, $2
	ld [wc314 + 6], a
	ld a, $1d
	ld [wcd3c], a
	ld a, $24
	ld [wcd45], a
	ld a, $11
	ld [wcd46], a
	ld a, $1c
	ld [wcd47], a
	jp Function119e2e
; 118f0d

Function118f0d: ; 118f0d
	call Function119ed8
	ret c
	call Function118440

Function118f14:
	call Function118440
	ld a, [wcd51]
	ld l, a
	ld a, [wcd52]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld a, [wcc60]
	and a
	jr z, .asm_118f32
	ld hl, UnknownText_0x11aa13
	call Function11a9c0

.asm_118f32
	ld a, [wcd57]
	ld l, a
	ld a, [wcd58]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld hl, wcc60
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $24
	ld [wcd45], a
	ld a, $13
	ld [wcd46], a
	ld a, $1c
	ld [wcd47], a
	jp Function119e2e
; 118f5e

Function118f5e: ; 118f5e
	call Function119ed8
	ret c
	call Function118440
	call DelayFrame

Function118f68:
	call Function119223
	ret c
	call Function118440
	ld a, [wcd51]
	ld l, a
	ld a, [wcd52]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld a, [wcc60]
	and a
	jr z, .asm_118fba
	ld hl, wc314 + 48 + 2
	ld a, $c608 % $100
	ld [hli], a
	ld a, $c608 / $100
	ld [hli], a
	ld a, [wcd4b]
	ld [hli], a
	ld a, [wcd4c]
	ld [hli], a
	ld a, wc708 % $100
	ld [hli], a
	ld a, wc708 / $100
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, wc314 + 48 + 2
	ld de, $de00
	ld bc, $0200
	ld a, $2c
	jp Function119e2b

.asm_118fba
	call Function119e2e
	jp Function119e2e
; 118fc0

Function118fc0: ; 118fc0
	call Function118440
	ld a, [wcd55]
	ld l, a
	ld a, [wcd56]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld a, [wcc60]
	and a
	jr z, .asm_118ffa
	ld a, [wcd51]
	ld l, a
	ld a, [wcd52]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld a, [wcc60]
	and a
	jr z, .asm_118ff2
	ld hl, UnknownText_0x11aa2c
	jr .asm_118ff5

.asm_118ff2
	ld hl, UnknownText_0x11aa4b

.asm_118ff5
	call Function11a9c0
	jr Function119009

.asm_118ffa
	ld hl, UnknownText_0x11aa4b
	call Function11a9c0
	call Function119e2e
	call Function119e2e
	jp Function119e2e

Function119009:
	call Function118440
	call Function119300
	ld a, [wcd55]
	ld l, a
	ld a, [wcd56]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld hl, wc314 + 48 + 2
	ld a, $8
	ld [hli], a
	ld a, $c6
	ld [hli], a
	ld a, [wcd4b]
	ld [hli], a
	ld a, [wcd4c]
	ld [hli], a
	ld a, $8
	ld [hli], a
	ld a, $c7
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, wc314 + 48 + 2
	ld de, UnknBGPals
	ld bc, $1000
	ld a, $2c
	jp Function119e2b
; 119054

Function119054: ; 119054
	ld a, $6
	call GetSRAMBank
	ld hl, wd002
	ld a, [wcd4f]
	ld e, a
	ld a, [wcd50]
	ld d, a
	ld a, [UnknBGPals]
	ld c, a
	ld a, [wd001]
	ld b, a
	call Function119192
	ret c
	ld a, [wcd89]
	and $1
	jr z, .asm_11908a
	ld a, $6
	ld [rSVBK], a
	ld hl, wd002
	ld a, [UnknBGPals]
	ld c, a
	ld a, [wd001]
	ld b, a
	call Function119192
	ret c

.asm_11908a
	call CloseSRAM
	ld a, $3
	ld [rSVBK], a
	ld a, $5
	call GetSRAMBank
	ld a, [wcd4f]
	ld [$b1b3], a
	ld a, [wcd50]
	ld [$b1b4], a
	ld hl, BGMapBuffer
	ld de, $aa7f
	ld bc, $000c
	call CopyBytes
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [wd474]
	ld [$b2f3], a
	ld hl, wd475
	ld de, $b2f4
	ld bc, $0004
	call CopyBytes
	pop af
	ld [rSVBK], a
	call CloseSRAM
	jp Function119e2e
; 1190d0

Function1190d0: ; 1190d0
	ld a, $3
	ld [rSVBK], a
	ld a, [wcd57]
	ld l, a
	ld a, [wcd58]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld de, UnknBGPals
	ld bc, $1000
	jp Function118b10
; 1190ec

Function1190ec: ; 1190ec
	ld a, $5
	call GetSRAMBank
	ld hl, BGMapBuffer
	ld de, $aa73
	ld bc, $000c
	call CopyBytes
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	ld a, $1
	ld [$aa72], a
	call CloseSRAM
	ld a, $6
	call GetSRAMBank
	ld a, [UnknBGPals]
	ld c, a
	ld a, [wd001]
	ld b, a
	ld hl, wd002
	ld de, $a000
	call Function119192
	ret c
	ld a, [wcd89]
	and $1
	jr z, .asm_11913e
	ld a, $6
	ld [rSVBK], a
	ld a, [UnknBGPals]
	ld c, a
	ld a, [wd001]
	ld b, a
	ld hl, wd002
	call Function119192
	ret c

.asm_11913e
	ld a, $3
	ld [rSVBK], a
	call CloseSRAM
	ld hl, UnknownText_0x11aa5a
	call Function11a9c0
	jp Function119e2e
; 11914e

Function11914e: ; 11914e
	call Function119ed8
	ret c
	ld a, $1c
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	ret
; 11915d

Function11915d: ; 11915d
	ld hl, $d802
	ld de, BGMapBuffer
	ld bc, $000c
	call CopyBytes
	ld a, $5
	call GetSRAMBank
	ld hl, BGMapBuffer
	ld de, $aa7f
	ld c, $c
.asm_119176
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_119184
	inc hl
	dec c
	jr nz, .asm_119176
	call Function119e2e
	jr .asm_11918e

.asm_119184
	ld a, $16
	ld [wcf66], a
	ld a, $b
	ld [wc300], a

.asm_11918e
	call CloseSRAM
	ret
; 119192

Function119192: ; 119192
	inc b
	inc c
	jr .asm_11919e

.asm_119196
	ld a, [hli]
	ld [de], a
	inc de
	ld a, $bf
	cp d
	jr c, .asm_1191a6

.asm_11919e
	dec c
	jr nz, .asm_119196
	dec b
	jr nz, .asm_119196
	and a
	ret

.asm_1191a6
	ld a, $d3
	call Function118805
	scf
	ret
; 1191ad

Function1191ad: ; 1191ad
	push bc
	ld c, $0
	ld a, $5
	ld [rSVBK], a
.asm_1191b4
	ld a, [hli]
	ld [de], a
	inc de
	and a
	jr z, .asm_1191cc
	inc c
	ld a, c
	cp $a6
	jr c, .asm_1191b4
	ld a, $da
	call Function118805
	ld a, $3
	ld [rSVBK], a
	pop bc
	scf
	ret

.asm_1191cc
	ld a, $3
	ld [rSVBK], a
	pop bc
	and a
	ret
; 1191d3

Function1191d3: ; 1191d3
	ld hl, wd102
	ld a, l
	ld [wcd53], a
	ld a, h
	ld [wcd54], a
	call Function11920f
	ld a, l
	ld [wcd51], a
	ld a, [wcd4a]
	ld a, h
	ld [wcd52], a
	call Function11920f
	ld a, l
	ld [wcd55], a
	ld a, [wcd4a]
	ld a, h
	ld [wcd56], a
	call Function11920f
	ld a, [wcd49]
	ld a, l
	ld [wcd57], a
	ld a, [wcd4a]
	ld a, h
	ld [wcd58], a
	call Function11920f
	ret
; 11920f

Function11920f: ; 11920f
.asm_11920f
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_11920f
	ld a, [hli]
	cp $a
	jr nz, .asm_11920f
	dec hl
	xor a
	ld [hld], a
	ld [hli], a
	inc hl
	ret
; 119223

Function119223: ; 119223
	xor a
	ld [wcd4b], a
	ld [wcd4c], a
	ld a, $5
	call GetSRAMBank
	ld hl, wc3cd
	ld de, $b092
	ld bc, $001f
	call CopyBytes
	dec de
	xor a
	ld [de], a
	ld hl, $d810
.asm_119241
	ld a, [hli]
	cp $50
	jr nz, .asm_119241
	ld a, [hli]
	ld [wcd4f], a
	ld a, [hli]
	ld [wcd50], a
	ld a, [hli]
	ld [$b1b1], a
	ld c, a
	ld a, [hli]
	ld [$b1b2], a
	ld b, a
	ld de, $b1d3
	call CopyBytes
	call CloseSRAM
	ld e, l
	ld d, h
	ld hl, $c608
.asm_119266
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_1192c2
	cp $fe
	jr z, .asm_1192a5
	call GetSRAMBank
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	inc de
	ld b, a
	ld a, [de]
	inc de
	push de
	push af
	ld a, [wcd4b]
	ld e, a
	ld a, [wcd4c]
	ld d, a
	pop af
.asm_119286
	push af
	ld a, [bc]
	inc bc
	ld [hli], a
	inc de
	pop af
	dec a
	jr nz, .asm_119286
	call CloseSRAM
	ld a, e
	ld [wcd4b], a
	ld a, d
	ld [wcd4c], a
	pop de
.asm_11929b
	and a
	jr z, .asm_119266
	ld a, $d3
	call Function118805
	scf
	ret

.asm_1192a5
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4c]
	ld b, a
	ld a, [de]
	inc de
.asm_1192af
	push af
	ld a, [de]
	inc de
	ld [hli], a
	inc bc
	pop af
	dec a
	jr nz, .asm_1192af
	ld a, c
	ld [wcd4b], a
	ld a, b
	ld [wcd4c], a
	jr .asm_11929b

.asm_1192c2
	ld a, e
	ld [wcd4d], a
	ld a, d
	ld [wcd4e], a
	and a
	ret
; 1192cc

Function1192cc: ; 1192cc
	ld a, $5
	call GetSRAMBank
	ld hl, $aa73
	ld de, $c608
	ld bc, $000c
	call CopyBytes
	call CloseSRAM
	ld hl, $c608
	ld de, BGMapBuffer
	ld c, $c
.asm_1192e8
	ld a, [de]
	inc de
	ld b, a
	ld a, [hli]
	cp b
	jr nz, .asm_1192fe
	dec c
	jr nz, .asm_1192e8
	ld a, $1f
	ld [wcd3c], a
	ld a, $27
	ld [wcf66], a
	scf
	ret

.asm_1192fe
	and a
	ret
; 119300

Function119300: ; 119300
	xor a
	ld [wcd4b], a
	ld [wcd4c], a
	ld a, [wcd4d]
	ld e, a
	ld a, [wcd4e]
	ld d, a
	ld hl, $c608
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4c]
	ld b, a
.asm_11931a
	ld a, [de]
	inc de
	cp $50
	jr z, .asm_119324
	ld [hli], a
	inc bc
	jr .asm_11931a

.asm_119324
	ld a, $3d
	ld [hli], a
	inc bc
	ld a, c
	ld [wcd4b], a
	ld a, b
	ld [wcd4c], a
	ld a, [de]
	inc de
	call GetSRAMBank
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	inc de
	ld b, a
	ld a, [de]
	inc de
	push de
	push af
	ld a, [wcd4b]
	ld e, a
	ld a, [wcd4c]
	ld d, a
	pop af
.asm_119348
	push af
	ld a, [bc]
	and $f0
	swap a
	call Function1197bf
	ld [hli], a
	inc de
	ld a, [bc]
	inc bc
	and $f
	call Function1197bf
	ld [hli], a
	inc de
	pop af
	dec a
	jr nz, .asm_119348
	call CloseSRAM
	ld a, e
	ld [wcd4b], a
	ld a, d
	ld [wcd4c], a
	pop de
	ld a, [de]
	cp $50
	jr z, .asm_11937f
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4c]
	ld b, a
	ld a, $26
	ld [hli], a
	inc bc
	jr .asm_11931a

.asm_11937f
	ret
; 119380

Function119380: ; 119380
	ld a, $80
	ld [wcd49], a
	jp Function119e2e
; 119388

Function119388: ; 119388
	ld hl, wcd49
	dec [hl]
	ret nz
	ld hl, wcc60
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $10
	ld [wcd45], a
	call Function119e2e

Function1193a0:
	call Function119ed8
	ret c
	call DelayFrame
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	ld hl, wc314 + 48 + 2
	ld a, wd000 % $100
	ld [hli], a
	ld a, wd000 / $100
	ld [hli], a
	ld a, [wcd3b]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, wc708 % $100
	ld [hli], a
	ld a, wc708 / $100
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, wc314 + 48 + 2
	ld de, $de00
	ld bc, $0200
	ld a, $2c
	jp Function119e2b
; 1193e3

Function1193e3: ; 1193e3
	ld hl, wcd49
	dec [hl]
	ret nz
	ld hl, wcc60
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $11
	ld [wcd45], a
	call Function119e2e

Function1193fb:
	call Function119ed8
	ret c
	call DelayFrame
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	ld de, UnknBGPals
	ld bc, $1000
	jp Function118b10
; 119413

Function119413: ; 119413
	ld a, $6
	call GetSRAMBank
	ld a, [UnknBGPals]
	ld c, a
	ld a, [wd001]
	ld b, a
rept 2
	dec bc
endr
	ld hl, wd002
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call Function119192
	ret c
	ld a, [wcd89]
	and $1
	jr z, .asm_119447
	ld a, $6
	ld [rSVBK], a
	ld a, [wd000]
	ld c, a
	ld a, [wd001]
	ld b, a
	ld hl, wd002
	call Function119192
	ret c

.asm_119447
	ld a, $3
	ld [rSVBK], a
	call CloseSRAM
	jp Function119e2e
; 119451

Function119451: ; 119451 (46:5451)
	ld a, [wcd89]
	and $1
	jr z, .asm_11945d
	ld a, $d3
	jp Function118805
.asm_11945d
	xor a
	ld [wcd50], a
	call Function119694
	ld a, b
	ld [wcd49], a
	call Function1196cd
	ld a, [wd002]
	ld hl, wd003

Function119471: ; 119471 (46:5471)
	push af
	ld a, [hli]
	ld [$c608], a
	ld a, [hli]
	ld [$c608 + 3], a
	ld a, [hli]
	ld [$c608 + 1], a
	ld a, [hli]
	ld [$c608 + 2], a
	ld a, [hli]
	ld [$c608 + 4], a
	ld a, [hli]
	ld [$c608 + 5], a ; $c608 + 5
	push hl
	ld a, [$c608]
	cp $ff
	jr z, .asm_1194a7
	ld a, [$c608 + 2]
	cp $ff
	jr z, .asm_1194a7
	ld a, [$c608 + 1]
	cp $ff
	jr nz, .asm_1194a7
	call Function119584
	jr c, .asm_11950c
	jr .asm_1194f0
.asm_1194a7
	ld hl, $c608
	ld de, $c608 + 3
	ld c, $3
.asm_1194af
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr c, .asm_1194f3
	jr z, .asm_1194b9
	jr nc, .asm_1194bc
.asm_1194b9
	dec c
	jr nz, .asm_1194af
.asm_1194bc
	ld c, $3
	ld hl, wcd49
	ld de, $c608
.asm_1194c4
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_1194d1
	cp [hl]
	jr z, .asm_1194d1
	jr c, .asm_1194d5
	jr nc, .asm_1194f0
.asm_1194d1
	inc hl
	dec c
	jr nz, .asm_1194c4
.asm_1194d5
	ld c, $3
	ld hl, wcd49
	ld de, $c608 + 3
.asm_1194dd
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_1194ea
	cp [hl]
	jr c, .asm_1194f0
	jr z, .asm_1194ea
	jr nc, .asm_11950c
.asm_1194ea
	inc hl
	dec c
	jr nz, .asm_1194dd
	jr .asm_11950c
.asm_1194f0
	pop hl
	jr .asm_119557
.asm_1194f3
	ld c, $3
	ld hl, wcd49
	ld de, $c608
.asm_1194fb
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_119508
	cp [hl]
	jr c, .asm_11950c
	jr z, .asm_119508
	jr nc, .asm_1194d5
.asm_119508
	inc hl
	dec c
	jr nz, .asm_1194fb
.asm_11950c
	pop hl
	ld a, $1
	ld [wcd50], a
	ld a, l
	ld [$c608], a
	ld a, h
	ld [$c608 + 1], a
	ld de, wcd69
	ld c, $10
	ld b, $0
.asm_119521
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_119528
	inc b
.asm_119528
	dec c
	jr nz, .asm_119521
	ld a, $10
	cp b
	jr z, .asm_119536
rept 4
	inc hl
endr
	jr .asm_11957a
.asm_119536
	ld a, [hli]
	cp $50
	jr nz, .asm_119552
	ld a, [hli]
	cp $33
	jr nz, .asm_119553
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [wcd83]
	cp c
	jr nz, .asm_119576
	ld a, [wcd84]
	cp b
	jr nz, .asm_119576
	jr .asm_11955b
.asm_119552
	inc hl
.asm_119553
rept 2
	inc hl
endr
	jr .asm_11955b
.asm_119557
	ld de, $14
	add hl, de
.asm_11955b
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	add hl, de
	pop af
	dec a
	jp nz, Function119471
	ld a, [wcd50]
	and a
	jr z, .asm_119571
	ld a, $1a
	ld [wcf66], a
	ret
.asm_119571
	ld a, $d8
	jp Function118805
.asm_119576
	ld a, $10
	jr .asm_11957c
.asm_11957a
	ld a, $f
.asm_11957c
	ld [wcf66], a
	pop af
	call Function1195c4
	ret

Function119584: ; 119584 (46:5584)
	ld a, [$c608]
	ld b, a
	ld a, [$c608 + 3]
	ld c, a
	cp b
	jr c, .asm_11959c
	ld a, [wcd49]
	cp b
	jr c, .asm_1195c2
.asm_119595
	cp c
	jr c, .asm_1195a2
	jr z, .asm_1195a2
	jr .asm_1195c2
.asm_11959c
	ld a, [wcd49]
	cp b
	jr c, .asm_119595
.asm_1195a2
	ld a, [$c608 + 2]
	ld b, a
	ld a, [$c608 + 5] ; $c608 + 5
	ld c, a
	cp b
	jr c, .asm_1195ba
	ld a, [wcd4b]
	cp b
	jr c, .asm_1195c2
.asm_1195b3
	cp c
	jr c, .asm_1195c0
	jr z, .asm_1195c0
	jr .asm_1195c2
.asm_1195ba
	ld a, [wcd4b]
	cp b
	jr c, .asm_1195b3
.asm_1195c0
	scf
	ret
.asm_1195c2
	and a
	ret

Function1195c4: ; 1195c4 (46:55c4)
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, $a5
	ld a, b
	cp d
	jr c, .asm_1195d9
	jr z, .asm_1195d3
	jr nc, .asm_1195f3
.asm_1195d3
	ld a, c
	cp e
	jr z, .asm_1195d9
	jr nc, .asm_1195f3
.asm_1195d9
	ld de, wcc60
	call CopyBytes
	xor a
	ld [de], a
	ld a, [$c608]
	ld l, a
	ld a, [$c608 + 1]
	ld h, a
	ld de, wcd69
	ld bc, $10
	call CopyBytes
	ret
.asm_1195f3
	ld a, $d8
	jp Function118805

Function1195f8: ; 1195f8 (46:55f8)
	ld a, $11
	ld [wcd3c], a
	ld a, $1c
	ld [wcd45], a
	ld a, $f
	ld [wcd46], a
	ld a, $14
	ld [wcd47], a
	call Function119e2e
	jp Function119e2e

Function119612: ; 119612 (46:5612)
	ld a, $14
	ld [wcd3c], a
	ld a, $1c
	ld [wcd45], a
	ld a, $10
	ld [wcd46], a
	ld a, $14
	ld [wcd47], a
	jp Function119e2e

Function119629: ; 119629 (46:5629)
	call Function119ed8
	ret c
	ld a, $60
	ld l, a
	ld a, $cc
	ld h, a
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $1c
	ld [wcd45], a
	ld a, $14
	ld [wcd47], a
	call Function119e2e

Function119648: ; 119648 (46:5648)
	call Function119ed8
	ret c
	call DelayFrame
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	call Function118b24
	ld de, UnknBGPals
	ld bc, $1000
	ld a, $2a
	jp Function119e2b

Function119665: ; 119665 (46:5665)
	ld a, $1a
	ld [wcd3c], a
	call Function119e2e

Function11966d: ; 11966d (46:566d)
	call Function119ed8
	ret c
	ld a, [wcd47]
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	ret

Function11967d: ; 11967d (46:567d)
	ld a, $18
	ld [wcd3c], a
	call Function119e2e

Function119685: ; 119685 (46:5685)
	call Function119ed8
	ret c
	ld a, $14
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	ret

Function119694: ; 119694 (46:5694)
	ld b, 0
	ld hl, Unknown_1196b8
.asm_119699
	ld de, wc708
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_1196af
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_1196b0
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_1196b1
	ret
.asm_1196af
	inc hl
.asm_1196b0
	inc hl
.asm_1196b1
	inc b
	ld a, b
	cp $7
	jr nz, .asm_119699
	ret
; 1196b8 (46:56b8)

Unknown_1196b8: ; 1196b8
	db "Mon"
	db "Tue"
	db "Wed"
	db "Thu"
	db "Fri"
	db "Sat"
	db "Sun"
; 1196cd

SECTION "bank46_2", ROMX, BANK[$46]
; A hack to use ascii above.

Function1196cd: ; 1196cd (46:56cd)
	ld de, wc719
	call Function1196de
	ld [wcd4a], a
	inc de
	call Function1196de
	ld [wcd4b], a
	ret

Function1196de: ; 1196de (46:56de)
	ld a, [de]
	inc de
	sub $30
	sla a
	ld b, a
	sla a
	sla a
	add b
	ld c, a
	add hl, bc
	ld a, [de]
	inc de
	sub $30
	add c
	ret
; 1196f2 (46:56f2)

Function1196f2: ; 1196f2
	ld hl, wd002
.asm_1196f5
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_1196f5
	ld a, [hl]
	cp $a
	jr nz, .asm_1196f5
	xor a
	ld [hld], a
	ld [hli], a
	ld a, l
	ld [wcd5b], a
	ld a, h
	ld [wcd5c], a
	inc hl
	ld e, l
	ld d, h
	ld a, [de]
	inc de
	cp $d
	jr nz, .asm_119722
	ld a, [de]
	inc de
	cp $a
	jr nz, .asm_119722
	ld a, $b
	jp Function118805

.asm_119722
	call Random
	ld c, $0
	ld b, c
.asm_119728
	call Function119798
	ld a, d
	cp $ff
	jr nz, .asm_119735
	ld a, e
	cp $ff
	jr z, .asm_11974c

.asm_119735
	ld a, [hRandomSub]
	cp d
	jr c, .asm_11974c
	jr z, .asm_11973e
	jr .asm_119745

.asm_11973e
	ld a, [hRandomAdd]
	cp e
	jr c, .asm_11974c
	jr z, .asm_11974c

.asm_119745
	inc bc
	ld a, c
	or b
	jr z, .asm_119770
	jr .asm_119728

.asm_11974c
	ld a, [wcd5b]
	ld l, a
	ld a, [wcd5c]
	ld h, a
.asm_119754
	ld a, [hld]
	cp $58
	jr nz, .asm_119754
	ld d, $0
.asm_11975b
	inc d
	ld a, [hld]
	cp $58
	jr z, .asm_11975b
rept 2
	inc hl
endr
	ld a, d
	dec a
	jr z, .asm_11978e
	dec a
	jr z, .asm_119785
	dec a
	jr z, .asm_11977e
	dec a
	jr z, .asm_119775

.asm_119770
	ld a, $d3
	jp Function118805

.asm_119775
	ld a, b
	and $f0
	swap a
	call Function1197bf
	ld [hli], a

.asm_11977e
	ld a, b
	and $f
	call Function1197bf
	ld [hli], a

.asm_119785
	ld a, c
	and $f0
	swap a
	call Function1197bf
	ld [hli], a

.asm_11978e
	ld a, c
	and $f
	call Function1197bf
	ld [hli], a
	jp Function119e2e
; 119798

Function119798: ; 119798
	ld d, $0
	ld e, d
	call Function1197b4
	swap a
	or d
	ld d, a
	call Function1197b4
	or d
	ld d, a
	call Function1197b4
	swap a
	or e
	ld e, a
	call Function1197b4
	or e
	ld e, a
	ret
; 1197b4

Function1197b4: ; 1197b4
	ld a, [hli]
	cp $61
	jr nc, .asm_1197bc
	sub $30
	ret

.asm_1197bc
	sub $57
	ret
; 1197bf

Function1197bf: ; 1197bf
	cp $a
	jr nc, .asm_1197c6
	add $30
	ret

.asm_1197c6
	add $57
	ret
; 1197c9

Function1197c9: ; 1197c9
	ld hl, wd002
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $12
	ld [wcd45], a
	call Function119e2e

Function1197dc:
	call Function119ed8
	ret c
	call DelayFrame
	ld hl, wd002
	ld de, wcc60
	ld bc, $0080
	call CopyBytes
	dec de
	xor a
	ld [de], a
	call Function118b24
	ld de, UnknBGPals
	ld bc, $1000
	ld a, $2a
	jp Function119e2b
; 119800

Function119800: ; 119800
	ld a, $fd
	ld [$c6d0], a
	ld [wc702], a
	ld a, [wcd81]
	ld [wc74e], a
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcf65]
	push af
	ld a, [wcf66]
	push af
	ld a, $1
	ld [rSVBK], a
	call FadeToMenu
	callba Function10803d
	call Function11a9ce
	call RestartMapMusic
	ld a, $3
	ld [rSVBK], a
	pop af
	ld [wcf66], a
	pop af
	ld [wcf65], a
	pop af
	ld [wcf64], a
	pop af
	ld [wJumptableIndex], a
	callba Function115dc3
	jp Function119e2e
; 11984e

Function11984e: ; 11984e
	ld a, [wcd80]
	and a
	jr nz, .asm_1198a0
	ld a, [wcd38]
	and a
	jr nz, .asm_1198a8
	callba Function170000
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcf65]
	push af
	ld a, [wcf66]
	push af
	ld a, $1
	ld [rSVBK], a
	call FadeToMenu
	callba Function108000
	call Function11a9ce
	call RestartMapMusic
	ld a, $3
	ld [rSVBK], a
	pop af
	ld [wcf66], a
	pop af
	ld [wcf65], a
	pop af
	ld [wcf64], a
	pop af
	ld [wJumptableIndex], a
	callba Function115dc3
	jp Function119e2e

.asm_1198a0
	ld a, $a
	ld [wc300], a
	jp Function119e2e

.asm_1198a8
	callba Function17005a
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcf65]
	push af
	ld a, [wcf66]
	push af
	ld a, $1
	ld [rSVBK], a
	call FadeToMenu
	callba Function108012
	call Function11a9ce
	call RestartMapMusic
	ld a, $3
	ld [rSVBK], a
	pop af
	ld [wcf66], a
	pop af
	ld [wcf65], a
	pop af
	ld [wcf64], a
	pop af
	ld [wJumptableIndex], a
	callba Function115dc3
	jp Function119e2e
; 1198ee

Function1198ee: ; 1198ee
	ld hl, UnknownText_0x11aab2
	call Function11a9c0
	call Function119e2e

Function1198f7:
	ld a, [wc314 + 6]
	and a
	ret nz
	ld hl, $c608 + 2
	call Function119940
	ld hl, $d800
	ld a, $c608 % $100
	ld [hli], a
	ld a, $c608 / $100
	ld [hli], a
	ld a, $f6
	ld [hli], a
	xor a
	ld [hli], a
	ld a, wc708 % $100
	ld [hli], a
	ld a, wc708 / $100
	ld [hli], a
	ld a, [wcd51]
	ld [hli], a
	ld a, [wcd52]
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, $d800
	ld de, $de00
	ld bc, $0200
	ld a, $2c
	jp Function119e2b
; 119937

Function119937: ; 119937
	callba Function1707f4
	jp Function119e2e
; 119940

Function119940: ; 119940
	ld de, wc3cd
	ld c, $1e
.asm_119945
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr z, .asm_119953
	and a
	jr nz, .asm_119945
	xor a
.asm_11994f
	ld [hli], a
	dec c
	jr nz, .asm_11994f

.asm_119953
	ret
; 119954

Function119954: ; 119954
	ld a, $1c
	ld [wcd3c], a
	call Function119ed8
	ld hl, $c608
	ld de, wc3cd
.asm_119962
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .asm_119962
	call Function119ec2
	ld hl, $c608
	ld a, $1e
	jp Function119e2b
; 119973

Function119973: ; 119973
	ld a, $1
	ld [wcf64], a
	xor a
	ld [wcf65], a
	ld [StringBuffer2 + 10], a
	ld de, UnknBGPals
	ld a, $20
	jp Function119e2b
; 119987

Function119987: ; 119987
	ld hl, wd001
	ld a, [UnknBGPals]
	or [hl]
	jr z, .asm_1199a0
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a
	ld de, BGPals
	ld a, $22
	jp Function119e2b

.asm_1199a0
	ld a, [StringBuffer2 + 10]
	and a
	jr z, .asm_1199ae
	ld a, $16
	ld [wcf66], a
	jp Function119b0d

.asm_1199ae
	ld a, $1b
	ld [wcf66], a
	ret
; 1199b4

Function1199b4: ; 1199b4
	ld a, [wd000 + 130]
	and a
	jr nz, .asm_1199c7
	ld a, [wd000 + 129]
	cp $7
	jr nc, .asm_1199c7
	call Function119e2e
	jp Function1199ca

.asm_1199c7
	jp Function119ac9
; 1199ca

Function1199ca: ; 1199ca
	ld a, $20
	ld [wcd89], a
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a
	ld de, LYOverrides
	ld bc, $0700
	ld a, $28
	jp Function119e2b
; 1199e2

Function1199e2: ; 1199e2
	ld c, $c
	ld de, Unknown_119e33
	call Function119e4f
	jp c, Function119ac9
	ld a, c
	cp $1
	jp nz, Function119ac9
	ld hl, $d880
	ld bc, Unknown_119af1
.asm_1199f9
	ld a, [bc]
	and a
	jr z, .asm_119a05
	cp [hl]
	jp nz, Function119ac9
	inc bc
	inc hl
	jr .asm_1199f9

.asm_119a05
	ld c, $17
	ld de, Unknown_119e40
	call Function119e4f
	jp c, .asm_119aa7
	ld a, c
	cp $1
	jp nz, .asm_119aa7
	ld a, [wd000 + $880]
	cp $31
	jp nz, .asm_119aa7
	ld a, [wd000 + $881]
	cp $20
	jp nz, .asm_119aa7
	ld a, [wd000 + $88a]
	cp $20
	jp nz, .asm_119aa7
	ld a, [wd000 + $894]
	cp $20
	jp nz, .asm_119aa7
	xor a
	ld [wd000 + $8a0], a
	ld [wd000 + $8a1], a
	ld [wd000 + $8a2], a
	ld [wd000 + $8a3], a
	ld hl, $d8a0
	ld bc, $d889
	call Function119e98
	call Function119e98
	ld hl, $d8a0
	ld a, [wcd2d]
	cp [hl]
	jr nz, Function119ac9
	inc hl
	ld a, [wcd2c]
	cp [hl]
	jr nz, Function119ac9
	inc hl
	ld a, [wcd2b]
	cp [hl]
	jr nz, Function119ac9
	inc hl
	ld a, [wcd2a]
	cp [hl]
	jr nz, Function119ac9
	xor a
	ld [wd000 + $8a0], a
	ld [wd000 + $8a1], a
	ld [wd000 + $8a2], a
	ld [wd000 + $8a3], a
	ld hl, $d8a0
	ld bc, $d88e
	call Function119e98
	ld bc, $d893
	call Function119e98
	ld hl, $d8a0
	ld a, [wcd2f]
	cp [hl]
	jr nz, .asm_119aa7
	inc hl
	ld a, [wcd2e]
	cp [hl]
	jr nz, .asm_119aa7
	inc hl
	ld a, [wcd31]
	cp [hl]
	jr nz, .asm_119aa7
	inc hl
	ld a, [wcd30]
	cp [hl]
	jr z, .asm_119aaf

.asm_119aa7
	ld a, $25
	ld [wcf66], a
	jp Function119b45

.asm_119aaf
	ld a, [StringBuffer2 + 10]
	and a
	jr nz, .asm_119aa7
	ld a, [wd000 + $895]
	sub $30
	ld [StringBuffer2 + 10], a
	ld a, [wcf64]
	ld [StringBuffer2 + 11], a
	ld a, [wcf65]
	ld [StringBuffer2 + 12], a

Function119ac9:
	ld a, [UnknBGPals]
	ld l, a
	ld a, [wd001]
	ld h, a
	dec hl
	ld a, l
	ld [UnknBGPals], a
	ld a, h
	ld [wd001], a
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a
	inc hl
	ld a, l
	ld [wcf64], a
	ld a, h
	ld [wcf65], a
	ld a, $10
	ld [wcf66], a
	ret
; 119af1

Unknown_119af1:
	INCBIN "data/mobile/x-game-code.txt"
	INCBIN "data/mobile/x-game-result.txt"
; 119b0d

Function119b0d: ; 119b0d
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	ld a, [StringBuffer2 + 10]
	cp $1
	jr z, .asm_119b23
	ld a, $19
	ld [wcf66], a
	jr Function119b3b

.asm_119b23
	ld a, $10
	ld [wcd89], a
	ld a, [StringBuffer2 + 11]
	ld l, a
	ld a, [StringBuffer2 + 12]
	ld h, a
	ld de, LYOverrides
	ld bc, $0700
	ld a, $24
	jp Function119e2b

Function119b3b:
	ld a, [StringBuffer2 + 11]
	ld l, a
	ld a, [StringBuffer2 + 12]
	ld h, a
	jr asm_119b4d

Function119b45:
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a

asm_119b4d
	ld a, $26
	jp Function119e2b
; 119b52

Function119b52: ; 119b52
	ld a, [StringBuffer2 + 10]
	cp $1
	jr nz, .asm_119b66
	ld a, $5
	call GetSRAMBank
	ld a, $4
	ld [$a800], a
	call CloseSRAM

.asm_119b66
	ld a, $1c
	jp Function119e2b
; 119b6b

Function119b6b: ; 119b6b
	ld a, [StringBuffer2 + 10]
	cp $1
	jr z, .asm_119b75
	jp Function119e2e

.asm_119b75
	ld a, [LYOverrides]
	ld b, a
	ld a, [wd101]
	or b
	jr z, .asm_119be3
	ld hl, $d800
	ld de, wd102
.asm_119b85
	ld a, [de]
	inc de
	cp $d
	jr nz, .asm_119b85
	inc de
	ld a, [de]
	cp $d
	jr nz, .asm_119b85
rept 2
	inc de
endr
.asm_119b93
	ld a, [de]
	inc de
	cp $d
	jr z, .asm_119bfa
	call Function119c3e
	ret c
	ld [hli], a
	ld a, [de]
	inc de
	call Function119c3e
	ret c
	ld [hli], a
	ld a, [de]
	inc de
	call Function119c3e
	ret c
	ld [hli], a
	ld a, [de]
	inc de
	call Function119c3e
	ret c
	ld [hl], a
	push de
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
rept 3
	inc hl
endr
	ld a, h
	cp $e0
	jr c, .asm_119b93

.asm_119be3
	ld a, $19
	ld [wcf66], a
	ld a, $5
	call GetSRAMBank
	ld a, $1
	ld [$a800], a
	call CloseSRAM
	xor a
	ld [StringBuffer2 + 10], a
	ret

.asm_119bfa
	inc de
	ld a, [de]
	cp $d
	jr nz, .asm_119b93
	ld a, l
	cp (wd000 + $800 + $69) % $100
	jr nz, .asm_119be3
	ld a, h
	cp (wd000 + $800 + $69) / $100
	jr nz, .asm_119be3
	ld a, $5
	call GetSRAMBank
	ld a, [wcf64]
	ld [$b090], a
	ld a, [wcf65]
	ld [$b091], a
	ld hl, $d800
	ld de, $b023
	ld bc, $0069
	call CopyBytes
	ld a, $3
	ld [$a800], a
	call CloseSRAM
	ld hl, $d800
	ld de, $c608
	ld bc, $0069
	call CopyBytes
	jp Function119e2e
; 119c3e

Function119c3e: ; 119c3e
	cp $2b
	jr c, .asm_119c68
	jr z, .asm_119c80
	cp $2f
	jr c, .asm_119c68
	jr z, .asm_119c84
	cp $30
	jr c, .asm_119c68
	cp $3a
	jr c, .asm_119c88
	cp $3d
	jr c, .asm_119c68
	jr z, .asm_119c8c
	cp $41
	jr c, .asm_119c68
	cp $5b
	jr c, .asm_119c8f
	cp $61
	jr c, .asm_119c68
	cp $7b
	jr c, .asm_119c93

.asm_119c68
	ld a, $19
	ld [wcf66], a
	ld a, $5
	call GetSRAMBank
	ld a, $1
	ld [$a800], a
	call CloseSRAM
	xor a
	ld [StringBuffer2 + 10], a
	scf
	ret

.asm_119c80
	ld a, $3e
	and a
	ret

.asm_119c84
	ld a, $3f
	and a
	ret

.asm_119c88
	add $4
	and a
	ret

.asm_119c8c
	xor a
	and a
	ret

.asm_119c8f
	sub $41
	and a
	ret

.asm_119c93
	sub $47
	and a
	ret
; 119c97

Function119c97: ; 119c97
	ld hl, UnknownText_0x11ab0f
	call Function11a9c0
	call Function119e2e
	jr Function119cab

Function119ca2:
	ld hl, UnknownText_0x11aaf0
	call Function11a9c0
	call Function119e2e

Function119cab:
	ld a, [wc314 + 6]
	and a
	ret nz
	ld a, $80
	ld [wcd50], a
	call Function119e2e

Function119cb8:
	ld hl, wcd50
	dec [hl]
	ret nz
	ld a, $0
	ld [wcf66], a
	ret
; 119cc3

Function119cc3: ; 119cc3
	ld a, [wcd38]
	and a
	jr z, .asm_119cd1
	dec a
	jr z, .asm_119cd6
	ld hl, UnknownText_0x11aa6a
	jr .asm_119cd9

.asm_119cd1
	ld hl, UnknownText_0x11ab4a
	jr .asm_119cd9

.asm_119cd6
	ld hl, UnknownText_0x11ab6e

.asm_119cd9
	call Function11a9c0
	call Function119e2e

Function119cdf:
	ld a, [wc314 + 6]
	and a
	ret nz
	ld a, $f
	ld [wcd3c], a
	call Function119e2e

Function119cec:
	call Function119ed8
	ret c
	ld a, [wcd46]
	ld [wcf66], a
	ret
; 119cf7

MenuDataHeader_119cf7: ; 119cf7
	db $40 ; flags
	db  7, 12 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 0 ; default option
; 119cff

MenuData_119cff: ; 119cff
	db $40 ; flags
	db  7, 15 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 0 ; default option
; 119d07

String_119d07:
	db "   ▼@"

Strings_L10ToL100: ; 119d0c
	db " L:10 @@"
	db " L:20 @@"
	db " L:30 @@"
	db " L:40 @@"
	db " L:50 @@"
	db " L:60 @@"
	db " L:70 @@"
	db " L:80 @@"
	db " L:90 @@"
	db " L:100@@"
	db "CANCEL@@"

Strings_Ll0ToL40: ; 119d64
	db " L:10 @@"
	db " L:20 @@"
	db " L:30 @@"
	db " L:40 @@"
	db "CANCEL@@"

String_119d8c:
	db "CANCEL@"
; 119d93

Function119d93: ; 119d93 (46:5d93)
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [wcd4f]
	ld c, 10
	call SimpleMultiply
	ld hl, wcd50
	ld [hl], a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, PartyMon1Level
	ld a, [PartyCount]
.party_loop
	push af
	ld a, [de]
	push hl
	push de
	pop hl
	add hl, bc
	push hl
	pop de
	pop hl
	cp [hl]
	jr z, .equal
	jr nc, .exceeds
.equal
	pop af
	dec a
	jr nz, .party_loop
	pop af
	ld [rSVBK], a
	and a
	ret

.exceeds
	pop af
	ld a, $4
	ld [wcf66], a
	pop af
	ld [rSVBK], a
	scf
	ret

Function119dd1: ; 119dd1 (46:5dd1)
	ld a, [rSVBK]
	push af
	ld a, [wcd4f]
	cp 70 / 10
	jr nc, .level_70_or_more
	ld a, $1
	ld [rSVBK], a
	ld hl, PartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, PartySpecies
	ld a, [PartyCount]
.loop
	push af
	ld a, [de]
	cp MEWTWO
	jr z, .uber
	cp MEW
	jr z, .uber
	cp LUGIA
	jr c, .next
	cp NUM_POKEMON + 1
	jr nc, .next
.uber
	ld a, [hl]
	cp 70
	jr c, .uber_under_70
.next
	add hl, bc
	inc de
	pop af
	dec a
	jr nz, .loop
.level_70_or_more
	pop af
	ld [rSVBK], a
	and a
	ret

.uber_under_70
	pop af
	ld a, [de]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wcd49
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld a, $a
	ld [wcf66], a
	pop af
	ld [rSVBK], a
	scf
	ret
; 119e2b (46:5e2b)

Function119e2b: ; 119e2b (46:5e2b)
	call Function3e32

Function119e2e: ; 119e2e (46:5e2e)
	ld hl, wcf66
	inc [hl]
	ret
; 119e33 (46:5e33)

Unknown_119e33: ; 119e33
	INCBIN "data/mobile/x-game-code-prefix.txt"
Unknown_119e40:
	INCBIN "data/mobile/x-game-result-prefix.txt"
; 119e4f

Function119e4f: ; 119e4f
	push bc
	ld hl, LYOverrides
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.asm_119e57
	ld a, [de]
	cp [hl]
	jr z, .asm_119e64
.asm_119e5b
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_119e57
.asm_119e61
	pop bc
	scf
	ret

.asm_119e64
	push de
.asm_119e65
	ld a, [de]
	inc de
	cp "\n"
	jr z, .asm_119e7a
	cp [hl]
	jr nz, .asm_119e77
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_119e65
	pop de
	jr .asm_119e61

.asm_119e77
	pop de
	jr .asm_119e5b

.asm_119e7a
	pop de
	pop bc
	inc hl
	ld de, $d880
.asm_119e80
	ld a, [hli]
	ld [de], a
	inc de
	cp $d
	jr z, .asm_119e8c
	dec c
	jr nz, .asm_119e80
	scf
	ret

.asm_119e8c
	and a
	ret
; 119e8e

Function119e8e: ; 119e8e
	cp $60
	jr c, .asm_119e95
	sub $57
	ret

.asm_119e95
	sub $30
	ret
; 119e98

Function119e98: ; 119e98
	ld a, $2
.asm_119e9a
	push af
	ld a, [bc]
	dec bc
	call Function119e8e
	or [hl]
	ld [hl], a
	ld a, [bc]
	dec bc
	call Function119e8e
	rlca
	rlca
	rlca
	rlca
	or [hl]
	ld [hl], a
	inc hl
	pop af
	dec a
	and a
	jr nz, .asm_119e9a
	ret
; 119eb4

Function119eb4: ; 119eb4 (46:5eb4)
	xor a
	ld [wc3cc], a
	ld de, wc3ac
.asm_119ebb
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .asm_119ebb
	ret

Function119ec2: ; 119ec2 (46:5ec2)
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$aa5c], a
	ld de, $aa4c
.asm_119ece
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .asm_119ece
	call CloseSRAM
	ret

Function119ed8: ; 119ed8 (46:5ed8)
	ld a, [rSVBK]
	ld [wcd8c], a
	ld a, $1
	ld [rSVBK], a
	call Function119eee
	ld a, [wcd8c]
	ld [rSVBK], a
	ld a, $1
	ld [hBGMapMode], a
	ret

Function119eee: ; 119eee (46:5eee)
	ld a, [wcd3c]
	ld e, a
	ld d, 0
	ld hl, Jumptable_119efd
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 119efd (46:5efd)

Jumptable_119efd: ; 119efd
	dw Function119f3f
	dw Function119f45
	dw Function119f56
	dw Function119f76
	dw Function119f98
	dw Function11a113
	dw Function11a129
	dw Function11a131
	dw Function11a13d
	dw Function11a14b
	dw Function11a16d
	dw Function11a192
	dw Function11a2e6
	dw Function11a302
	dw Function11a33a
	dw Function11a207
	dw Function11a235
	dw Function11a357
	dw Function11a36b
	dw Function11a38d
	dw Function11a3c5
	dw Function11a3d9
	dw Function11a3f9
	dw Function11a41b
	dw Function11a452
	dw Function11a47a
	dw Function11a488
	dw Function11a49e
	dw Function11a4db
	dw Function11a4e8
	dw Function11a4fe
	dw Function11a466
	dw Function11a47a
; 119f3f

Function119f3f: ; 119f3f
	call Function11a5b9
	jp Function11a5b0
; 119f45

Function119f45: ; 119f45
	hlcoord 4, 2
	ld de, String_11a661
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 119f56

Function119f56: ; 119f56
	ld a, [wcd44]
	and a
	jr z, .asm_119f62
	dec a
	ld [wcd44], a
	scf
	ret

.asm_119f62
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6aa
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 119f76

Function119f76: ; 119f76
	ld a, [wcd44]
	and a
	jr z, .asm_119f82
	dec a
	ld [wcd44], a
	scf
	ret

.asm_119f82
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a679
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 119f98

Function119f98: ; 119f98
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_119fef
	call ExitMenu
	call Function11a63c
	xor a
	ld [ScriptVar], a
	call Function11a00e
	ld a, [ScriptVar]
	and a
	jr z, .asm_119fd4
	call ExitMenu
	callba ReloadMapPart
	callba Function115dc3
	ld a, [wcd33]
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	scf
	ret

.asm_119fd4
	hlcoord 4, 2
	ld de, String_11a692
	call PlaceString
	ld a, $1
	ld [wc30d], a
	ld a, $1
	ld [wc314], a
	callba ReloadMapPart
	and a
	ret

.asm_119fef
	call ExitMenu
	call ExitMenu
	callba ReloadMapPart
	ld a, [wcd45]
	ld [wcf66], a
	callba Function115dc3
	ld a, $a
	ld [wc300], a
	scf
	ret
; 11a00e

Function11a00e: ; 11a00e
	ld a, $5
	call GetSRAMBank
	ld a, [$aa4b]
	and a
	jr z, .asm_11a02a
	ld a, [$aa4c]
	call CloseSRAM
	and a
	ret nz
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$aa4b], a

.asm_11a02a
	call CloseSRAM
	ld a, [BGMapPalBuffer]
	and a
	jr z, .asm_11a039
	dec a
	jr z, .asm_11a081
	jp Function11a0ca

.asm_11a039
	ld a, $3
	ld [rSVBK], a
	ld hl, $c608
	ld de, $d800
	ld bc, $00f6
	call CopyBytes
	ld a, $1
	ld [rSVBK], a
	call FadeToMenu
	callba Function11765d
	call Function11a9ce
	ld a, $3
	ld [rSVBK], a
	ld hl, $d800
	ld de, $c608
	ld bc, $00f6
	call CopyBytes
	ld a, $1
	ld [rSVBK], a
	callba Function115d99
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret

.asm_11a081
	xor a
	ld [wMenuBorderLeftCoord], a
	ld [wMenuBorderTopCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $5
	ld [wMenuBorderBottomCoord], a
	call BackUpTiles
	callba Function11765d
	callba Function117ab4
	callba MobileFunc_106462
	callba Function106464
	call ExitMenu
	callba ReloadMapPart
	callba Function115d99
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret
; 11a0ca

Function11a0ca: ; 11a0ca
	xor a
	ld [wMenuBorderLeftCoord], a
	ld [wMenuBorderTopCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $11
	ld [wMenuBorderBottomCoord], a
	call BackUpTiles
	callba Function11765d
	callba Function17d3f6
	callba MobileFunc_106462
	callba Function106464
	call ExitMenu
	callba ReloadMapPart
	callba Function115d99
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret
; 11a113

Function11a113: ; 11a113
	call Function11a63c
	ld c, $1
	callba Function115e18
	hlcoord 4, 2
	ld de, String_11a6c8
	call PlaceString
	and a
	ret
; 11a129

Function11a129: ; 11a129
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a131

Function11a131: ; 11a131
	ld hl, wcd44
	dec [hl]
	ret nz
	ld a, [wcd3c]
	inc a
	ld [wcd3c], a

Function11a13d:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret
; 11a14b

Function11a14b: ; 11a14b
	ld hl, wcd85
	ld a, [hl]
	cp $f3
	jr nz, .asm_11a155
	and a
	ret

.asm_11a155
	call Function11a1d6
	ret c
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6f1
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a16d

Function11a16d: ; 11a16d
	ld a, [wcd44]
	and a
	jr z, .asm_11a179
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a179
	call Function11a63c
	call Function11a1e6
	hlcoord 4, 2
	ld de, wc314 + 48 + 2
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a192

Function11a192: ; 11a192
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a1b6
	call ExitMenu
	callba ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a1b6
	call ExitMenu
	callba ReloadMapPart
	ld a, [wcd45]
	ld [wcf66], a
	ld [wcd80], a
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	scf
	ret
; 11a1d6

Function11a1d6: ; 11a1d6
	ld a, [wcd85]
	cp $50
	jr nz, .asm_11a1e4
	ld a, $d3
	call Function118805
	scf
	ret

.asm_11a1e4
	and a
	ret
; 11a1e6

Function11a1e6: ; 11a1e6
	ld hl, String_11a706
	ld de, wc314 + 48 + 2
	call Function11a1ff
	ld hl, wcd85
	call Function11a1ff
	ld hl, String_11a70b
	call Function11a1ff
	ld a, $50
	ld [de], a
	ret
; 11a1ff

Function11a1ff: ; 11a1ff
.asm_11a1ff
	ld a, [hli]
	cp $50
	ret z
	ld [de], a
	inc de
	jr .asm_11a1ff
; 11a207

Function11a207: ; 11a207
	ld hl, MenuDataHeader_11a2de
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	call ApplyTilemap
	hlcoord 16, 8
	ld de, String_11a2cf
	call PlaceString
	hlcoord 16, 10
	ld de, String_11a2d3
	call PlaceString
	hlcoord 15, 8
	ld a, $ed
	ld [hl], a
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a235

Function11a235: ; 11a235
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11a28f
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_11a2c1
	ld a, [hl]
	and D_UP
	jr nz, .asm_11a251
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11a270
.asm_11a24c
	call Function11a9f0
	scf
	ret

.asm_11a251
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wcd44]
	and a
	jr z, .asm_11a24c
	xor a
	ld [wcd44], a
	hlcoord 15, 8
	ld a, $ed
	ld [hl], a
	hlcoord 15, 10
	ld a, $7f
	ld [hl], a
	jr .asm_11a24c

.asm_11a270
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wcd44]
	and a
	jr nz, .asm_11a24c
	inc a
	ld [wcd44], a
	hlcoord 15, 8
	ld a, $7f
	ld [hl], a
	hlcoord 15, 10
	ld a, $ed
	ld [hl], a
	jr .asm_11a24c

.asm_11a28f
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a2c4
	call ExitMenu
	callba ReloadMapPart
	ld a, [wcd46]
	cp $0
	jr z, .asm_11a2b4
	ld a, [wcd47]
	jr .asm_11a2b7

.asm_11a2b4
	ld a, [wcd33]

.asm_11a2b7
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	scf
	ret

.asm_11a2c1
	call PlayClickSFX

.asm_11a2c4
	call ExitMenu
	callba ReloadMapPart
	and a
	ret
; 11a2cf

String_11a2cf: ; 11a2cf
	db "YES@"
; 11a2d3

String_11a2d3: ; 11a2d3
	db "NO@"
; 11a2d6

MenuDataHeader_11a2d6: ; 11a2d6
	db $40 ; flags
	db  6, 14 ; start coords
	db 10, 19 ; end coords
	dw NULL
	db 0 ; default option
; 11a2de

MenuDataHeader_11a2de: ; 11a2de
	db $40 ; flags
	db  7, 14 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 0 ; default option
; 11a2e6

Function11a2e6: ; 11a2e6
	call Function11a63c
	ld c, $2
	callba Function115e18
	hlcoord 4, 2
	ld de, String_11a71e
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a302

Function11a302: ; 11a302
	ld a, [wcd44]
	and a
	jr z, .asm_11a30e
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a30e
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a72a
	call PlaceString
	hlcoord 9, 4
	ld de, wcd68
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	hlcoord 14, 4
	ld de, wcd67
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a33a

Function11a33a: ; 11a33a
	ld a, [wcd44]
	and a
	jr z, .asm_11a346
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a346
	call ExitMenu
	callba ReloadMapPart
	callba Function115dc3
	and a
	ret
; 11a357

Function11a357: ; 11a357
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a743
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a36b

Function11a36b: ; 11a36b
	ld a, [wcd44]
	and a
	jr z, .asm_11a377
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a377
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a755
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a38d

Function11a38d: ; 11a38d
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a3b1
	call ExitMenu
	callba ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a3b1
	call ExitMenu
	callba ReloadMapPart
	ld a, [wcd45]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a3c5

Function11a3c5: ; 11a3c5
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a762
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a3d9

Function11a3d9: ; 11a3d9
	ld a, [wcd44]
	and a
	jr z, .asm_11a3e5
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a3e5
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a779
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a3f9

Function11a3f9: ; 11a3f9
	ld a, [wcd44]
	and a
	jr z, .asm_11a405
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a405
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a755
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a41b

Function11a41b: ; 11a41b
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a43f
	call ExitMenu
	callba ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a43f
	call ExitMenu
	callba ReloadMapPart
	ld a, $1c
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a452

Function11a452: ; 11a452
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a791
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a466

Function11a466: ; 11a466
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7c1
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a47a

Function11a47a: ; 11a47a
	ld a, [wcd44]
	and a
	jr z, .asm_11a486
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a486
	and a
	ret
; 11a488

Function11a488: ; 11a488
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7ac
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a49e

Function11a49e: ; 11a49e
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a4c7
	call ExitMenu
	callba ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	ld a, $14
	ld [wcf66], a
	and a
	ret

.asm_11a4c7
	call ExitMenu
	callba ReloadMapPart
	ld a, [wcd46]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a4db

Function11a4db: ; 11a4db
	call Function11a63c
	ld de, String_11a6db
	hlcoord 4, 2
	call PlaceString
	ret
; 11a4e8

Function11a4e8: ; 11a4e8
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7d7
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a4fe

Function11a4fe: ; 11a4fe
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a522
	call ExitMenu
	callba ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a522
	call ExitMenu
	callba ReloadMapPart
	ld a, [wcd45]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a536

Function11a536: ; 11a536
	ld hl, hJoyPressed
	ld a, [hl]
	and $1
	jr nz, .asm_11a5a7
	ld a, [hl]
	and $2
	jr nz, .asm_11a5a2
	ld a, [hl]
	and $40
	jr nz, .asm_11a564
	ld a, [hl]
	and $80
	jr nz, .asm_11a583
.asm_11a54d
	ld a, [wcd3c]
	cp $4
	jr z, .asm_11a562
	call Function11a9f0
	jr nz, .asm_11a562
	call ExitMenu
	callba ReloadMapPart

.asm_11a562
	scf
	ret

.asm_11a564
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wcd44]
	and a
	jr z, .asm_11a54d
	xor a
	ld [wcd44], a
	hlcoord 15, 7
	ld a, $ed
	ld [hl], a
	hlcoord 15, 9
	ld a, $7f
	ld [hl], a
	jr .asm_11a54d

.asm_11a583
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wcd44]
	and a
	jr nz, .asm_11a54d
	inc a
	ld [wcd44], a
	hlcoord 15, 7
	ld a, $7f
	ld [hl], a
	hlcoord 15, 9
	ld a, $ed
	ld [hl], a
	jr .asm_11a54d

.asm_11a5a2
	ld a, $1
	ld [wcd44], a

.asm_11a5a7
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	and a
	ret
; 11a5b0

Function11a5b0: ; 11a5b0
	ld a, [wcd3c]
	inc a
	ld [wcd3c], a
	scf
	ret
; 11a5b9

Function11a5b9: ; 11a5b9
	xor a
	ld [wMenuBorderLeftCoord], a
	ld [wMenuBorderTopCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $5
	ld [wMenuBorderBottomCoord], a
	call BackUpTiles
	hlcoord 0, 0, AttrMap
	ld b, $6
	ld c, $14
	hlcoord 0, 0
	ld b, $4
	ld c, $12
	call Function3eea
	callba ReloadMapPart
	call UpdateSprites
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret
; 11a5f5

Function11a5f5: ; 11a5f5
	ld a, $e
	ld [wMenuBorderLeftCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $6
	ld [wMenuBorderTopCoord], a
	ld a, $a
	ld [wMenuBorderBottomCoord], a
	call BackUpTiles
	hlcoord 14, 6, AttrMap
	ld b, $5
	ld c, $6
	hlcoord 14, 6
	ld b, $3
	ld c, $4
	call Function3eea
	hlcoord 16, 7
	ld de, String_11a2cf
	call PlaceString
	hlcoord 16, 9
	ld de, String_11a2d3
	call PlaceString
	hlcoord 15, 7
	ld a, $ed
	ld [hl], a
	callba ReloadMapPart
	ret
; 11a63c

Function11a63c: ; 11a63c
	hlcoord 4, 1
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 2
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 3
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 4
	ld de, String_11a7f4
	call PlaceString
	ret
; 11a661

String_11a661: ; 11a661
	db   "これから モバイルセンターに"
	next "でんわ", $1f, "かけます@"
; 11a679

String_11a679: ; 11a679
	db   "モバイルアダプタ", $25, "じゅんびは"
	next "できて いますか?@"
; 11a692

String_11a692: ; 11a692
	db   "でんわ", $1f, "かけています"
	next "しばらく おまちください@"
; 11a6aa

String_11a6aa: ; 11a6aa
	db   "でんわをかけると つうわりょう"
	next "せつぞくりょう", $4a, "かかります@"
; 11a6c8

String_11a6c8: ; 11a6c8
	db   "せつぞく しました@"
; 11a6d2

String_11a6d2: ; 11a6d2
	db   "つうしん ちゅう@"
; 11a6db

String_11a6db: ; 11a6db
	db   "つうしん ちゅう"
	next "セレクト エーでちゅうし@"
; 11a6f1

String_11a6f1: ; 11a6f1
	db   "この サービスには"
	next "つうわりょう", $25, "ほかに@"
; 11a706

String_11a706: ; 11a706
	db   "おかね", $4a, "@"
; 11a70b

String_11a70b: ; 11a70b
	db   "えん"
	next "かかります よろしい ですか?@"
; 11a71e

String_11a71e: ; 11a71e
	db   "つうしん しゅうりょう@"
; 11a72a

String_11a72a: ; 11a72a
	db   "つないだ じかん"
	next "  やく   ふん   びょう@"
; 11a743

String_11a743: ; 11a743
	db   "もっていない データが"
	next "あります!@"
; 11a755

String_11a755: ; 11a755
	db   "データ", $1f, "よみこみますか?@"
; 11a762

String_11a762: ; 11a762
	db   "おなじ データ", $1f, "よみこんだ"
	next "こと", $4a, "ありますが@"
; 11a779

String_11a779: ; 11a779
	db   "そのデータ", $24, "なくなっているか"
	next "こわれて います@"
; 11a791

String_11a791: ; 11a791
	db   "もっている データと"
	next "おなじデータしか ありません!@"
; 11a7ac

String_11a7ac: ; 11a7ac
	db   "データ", $25, "よみこみを"
	next "ちゅうし しますか?@"
; 11a7c1

String_11a7c1: ; 11a7c1
	db   "あたらしい ニュースは"
	next "ありません でした@"
; 11a7d7

String_11a7d7: ; 11a7d7
	db   "あたらしいニュース", $4a, "あります"
	next "ニュース", $1f, "よみこみますか?@"
; 11a7f4

String_11a7f4: ; 11a7f4
	db   "               @"
; 11a804

MenuDataHeader_11a804: ; 11a804
	db $40 ; flags
	db  0,  0 ; start coords
	db  5, 19 ; end coords
	dw NULL
	db 0 ; default option
; 11a80c

Function11a80c: ; 11a80c
	ld de, hDivisor
	ld bc, hDividend
	ld hl, Unknown_11a89a
	call Function11a88c
	ld bc, hQuotient
	ld hl, Unknown_11a8ba
	call Function11a88c
	ld bc, $ffb5
	ld hl, Unknown_11a8da
	call Function11a88c
	xor a
	ld b, a
	ld a, [hDivisor]
	and $f
	ld e, a
	ld a, [$ffb9]
	and $f
	call Function11a884
	ld e, a
	ld a, [$ffbb]
	and $f
	call Function11a884
	ld [wcd62], a
	ld e, b
	xor a
	ld b, a
	ld a, [hDivisor]
	and $f0
	swap a
	call Function11a884
	ld e, a
	ld a, [$ffb9]
	and $f0
	swap a
	call Function11a884
	ld e, a
	ld a, [$ffbb]
	and $f0
	swap a
	call Function11a884
	ld [wcd63], a
	ld e, b
	xor a
	ld b, a
	ld a, [hMathBuffer]
	and $f
	call Function11a884
	ld e, a
	ld a, [$ffba]
	and $f
	call Function11a884
	ld e, a
	ld a, [$ffbc]
	and $f
	call Function11a884
	ld [wcd64], a
	ret
; 11a884

Function11a884: ; 11a884
	add e
	cp $a
	ret c
	sub $a
	inc b
	ret
; 11a88c

Function11a88c: ; 11a88c
	ld a, [bc]
	sla a
	ld c, a
	xor a
	ld b, a
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ret
; 11a89a

Unknown_11a89a: ; 11a89a
x = 0
rept 16
	bcd x % 100, x / 100
x = x + 1
endr

Unknown_11a8ba: ; 11a8ba
x = 0
rept 16
	bcd x % 100, x / 100
x = x + 16
endr

Unknown_11a8da: ; 11a8da
x = 0
rept 16
	bcd x % 100, x / 100
x = x + 256
endr
; 11a8fa

Function11a8fa: ; 11a8fa
	ld a, [wc314 + 6]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11a909
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11a909

Jumptable_11a909: ; 11a909
	dw Function11a970
	dw Function11a90f
	dw Function11a971
; 11a90f

Function11a90f: ; 11a90f
	ld a, $1
	ld [rSVBK], a
	call SpeechTextBox
	ld a, $50
	ld hl, wc314 + 12
	ld bc, $008c
	call ByteFill
	ld a, [wc314 + 7]
	ld l, a
	ld a, [wc314 + 8]
	ld h, a
	ld de, wc314 + 12
.asm_11a92c
	ld a, [hli]
	cp $57
	jr z, .asm_11a94f
	cp $0
	jr z, .asm_11a92c
	cp $50
	jr z, .asm_11a92c
	cp $1
	jr z, .asm_11a941
	ld [de], a
	inc de
	jr .asm_11a92c

.asm_11a941
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.asm_11a945
	ld a, [bc]
	inc bc
	cp $50
	jr z, .asm_11a92c
	ld [de], a
	inc de
	jr .asm_11a945

.asm_11a94f
	xor a
	ld [wc314 + 11], a
	ld a, $20
	ld [wc314 + 7], a
	ld a, $c3
	ld [wc314 + 8], a
	hlcoord 1, 14
	ld a, l
	ld [wc314 + 9], a
	ld a, h
	ld [wc314 + 10], a
	ld hl, wc314 + 6
	inc [hl]
	ld a, $3
	ld [rSVBK], a

Function11a970:
	ret
; 11a971

Function11a971: ; 11a971
	ld hl, wc314 + 11
	ld a, [hJoyDown]
	and a
	jr nz, .asm_11a97f
	ld a, [hl]
	and a
	jr z, .asm_11a97f
	dec [hl]
	ret

.asm_11a97f
	ld a, [Options]
	and $7
	ld [hl], a
	ld hl, wcd8d
	ld a, [wc314 + 7]
	ld e, a
	ld a, [wc314 + 8]
	ld d, a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, e
	ld [wc314 + 7], a
	ld a, d
	ld [wc314 + 8], a
	ld a, $50
	ld [hl], a
	ld a, [wc314 + 9]
	ld l, a
	ld a, [wc314 + 10]
	ld h, a
	ld de, wcd8d
	call PlaceString
	ld a, c
	ld [wc314 + 9], a
	ld a, b
	ld [wc314 + 10], a
	ld a, [wcd8d]
	cp $50
	jr nz, .asm_11a9bf
	xor a
	ld [wc314 + 6], a

.asm_11a9bf
	ret
; 11a9c0

Function11a9c0: ; 11a9c0
	ld a, l
	ld [wc314 + 7], a
	ld a, h
	ld [wc314 + 8], a
	ld a, $1
	ld [wc314 + 6], a
	ret
; 11a9ce

Function11a9ce: ; 11a9ce
	call ClearBGPalettes
	call Function2bae
	call Call_ExitMenu
	callba MobileFunc_106462
	callba Function106464
	call Functiond90
	callba Function2b5c
	call UpdateSprites
	ret
; 11a9f0

Function11a9f0: ; 11a9f0
	ld a, $1
	and a
	ret
; 11a9f4

Function11a9f4: ; 11a9f4
	ld a, [wcd8a]
	ld l, a
	ld a, [wcd8b]
	ld h, a
	inc hl
	ld a, l
	ld [wcd8a], a
	ld a, h
	ld [wcd8b], a
	ld de, $d5d0
	add hl, de
	bit 7, h
	ret nz
	ld a, $d6
	call Function118805
	and a
	ret
; 11aa13

UnknownText_0x11aa13: ; 0x11aa13
	text "SAVE FILE will be"
	line "sent."
	done
; 0x11aa2c

UnknownText_0x11aa2c: ; 0x11aa2c
	text "Sent SAVE FILE."
	line "Reading NEWS…"
	done
; 0x11aa4b

UnknownText_0x11aa4b: ; 0x11aa4b
	text "Reading NEWS…"
	done
; 0x11aa5a

UnknownText_0x11aa5a: ; 0x11aa5a
	text "Received NEWS!"
	done
; 0x11aa6a

UnknownText_0x11aa6a: ; 0x11aa6a
	text "Quit reading NEWS?"
	done
; 0x11aa7e

UnknownText_0x11aa7e: ; 0x11aa7e
	text "Canceled sending"
	line "SAVE FILE."
	done
; 0x11aa9b

UnknownText_0x11aa9b: ; 0x11aa9b
	text "ODD EGG"
	line "was received!"
	done
; 0x11aab2

UnknownText_0x11aab2: ; 0x11aab2
	text "Registering your"
	line "record…"
	done
; 0x11aacc

UnknownText_0x11aacc: ; 0x11aacc
	text "One visit per day"
	line "per BATTLE ROOM!"
	done
; 0x11aaf0

UnknownText_0x11aaf0: ; 0x11aaf0
	text "A party #MON"
	line "tops this level."
	done
; 0x11ab0f

UnknownText_0x11ab0f: ; 0x11ab0f
	text_from_ram wcd49
	text " may go"
	line "only to BATTLE"

	para "ROOMS that are"
	line "Lv.70 or higher."
	done
; 0x11ab4a

UnknownText_0x11ab4a: ; 0x11ab4a
	text "Cancel your BATTLE"
	line "ROOM challenge?"
	done
; 0x11ab6e

UnknownText_0x11ab6e: ; 0x11ab6e
	text "Exit GYM LEADER"
	line "HONOR ROLL?"
	done
; 0x11ab8b

UnknownText_0x11ab8b: ; 0x11ab8b
	text "Linking with the"
	line "CENTER…"
	done
; 0x11aba5

Text_WhatLevelDoYouWantToChallenge: ; 0x11aba5
	text "What level do you"
	line "want to challenge?"
	done
; 0x11abcb

Text_CheckBattleRoomListByMaxLevel: ; 0x11abcb
	text "Check BATTLE ROOM"
	line "list by max level?"
	done
; 0x11abf1

UnknownText_0x11abf1: ; 0x11abf1
	text "Enter which"
	line "BATTLE ROOM?"
	done
; 0x11ac0b

UnknownText_0x11ac0b: ; 0x11ac0b
	text "Which BATTLE ROOM?"
	done
; 0x11ac1f

UnknownText_0x11ac1f: ; 0x11ac1f
	text_from_ram StringBuffer3
	text "'s ROOM"
	line "@"
	text_from_ram StringBuffer4
	text "?"
	cont "Please wait…"
	done
; 0x11ac3e

Function11ac3e: ; 11ac3e
	call SpeechTextBox
	call FadeToMenu
	callab ClearSpriteAnims2
	call Function11ac51
	call CloseSubmenu
	ret
; 11ac51

Function11ac51: ; 11ac51
	xor a
	ld [hBGMapMode], a
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	xor a
	ld [hMapAnims], a
	ld [wcd49], a
	ld [wcd4a], a
	ld [wcd4c], a
	ld [wcd4d], a
	ld [wcd4e], a
	call Function11ad1b
	call DelayFrame
.asm_11ac82
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_11aca8
	call Function11b314
	call Function11acb7
	call Function11ad6e
	ld a, 30 * 4
	ld [wCurrSpriteOAMAddr], a
	callba DoNextFrameForAllSprites
	callba ReloadMapPart
	jr .asm_11ac82

.asm_11aca8
	call ClearSprites
	pop af
	ld [hInMenu], a
	pop af
	ld [VramState], a
	pop af
	ld [Options], a
	ret
; 11acb7

Function11acb7: ; 11acb7
	ld hl, Unknown_11ba44
	ld a, [wcd49]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	decoord 6, 6
	ld a, [hli]
	ld [de], a
	decoord 0, 7
	ld bc, $0007
	call CopyBytes
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ld a, [hl]
	cp $ff
	jr nz, .asm_11aceb
	xor a
	ld [wcd49], a

.asm_11aceb
	ld hl, Unknown_11bb7d
	ld a, [wcd4a]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	decoord 3, 9
	ld bc, $0007
	call CopyBytes
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	inc hl
	ld a, [hl]
	cp $ff
	ret nz
	xor a
	ld [wcd4a], a
	ret
; 11ad1b

Function11ad1b: ; 11ad1b
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	callba Function17c000
	ld a, [MenuSelection2]
	ld [wcd82], a
	dec a
	ld [hObjectStructIndexBuffer], a
	ld a, $10
	ld [wCurIconTile], a
	ld hl, Function8e83f
	ld a, BANK(Function8e83f)
	ld e, $4
	rst FarCall
	ld hl, Function8e83f
	ld a, BANK(Function8e83f)
	ld e, $5
	rst FarCall
	ld hl, $c6d0
	ld bc, $0115
	xor a
	call ByteFill
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wcd30], a
	ld a, $2
	ld [wc7d4], a
	callba Pokedex_ChangeMode
	ret
; 11ad6e

Function11ad6e: ; 11ad6e
	ld a, [wJumptableIndex]
	ld hl, Jumptable_11ad78
	call Function11b239
	jp [hl]
; 11ad78

Jumptable_11ad78: ; 11ad78
	dw Function11b082
	dw Function11b0ff
	dw Function11ad95
	dw Function11adc4
	dw Function11ae4e
	dw Function11ae98
	dw Function11ad8f
	dw Function11af04
	dw Function11af4e
; 11ad8a

Function11ad8a: ; 11ad8a
	ld hl, wJumptableIndex
	inc [hl]
	ret
; 11ad8f

Function11ad8f: ; 11ad8f
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 11ad95

Function11ad95: ; 11ad95
	ld hl, MenuDataHeader_11ae38
	call LoadMenuDataHeader
	call MenuBox
	hlcoord 12, 12
	ld de, String_11ae40
	call PlaceString
	hlcoord 10, 10, AttrMap
	ld bc, $0808
	call Function11afd6
	callba ReloadMapPart
	call Function11ad8a
	ld a, $1
	ld [MenuSelection2], a
	ld hl, Unknown_11afcc
	call Function11afb7

Function11adc4:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and $40
	jr nz, .asm_11ade6
	ld a, [hl]
	and $80
	jr nz, .asm_11aded
	ld a, [hl]
	and $1
	jr nz, .asm_11ae06
	ld a, [hl]
	and $2
	ret z
	call PlayClickSFX
	xor a
	ld [wJumptableIndex], a
	jr .asm_11ae2e

.asm_11ade6
	ld a, [MenuSelection2]
	dec a
	ret z
	jr .asm_11adf4

.asm_11aded
	ld a, [MenuSelection2]
	inc a
	cp $4
	ret z

.asm_11adf4
	push af
	ld hl, Unknown_11afcc
	call Function11afbb
	pop af
	ld [MenuSelection2], a
	ld hl, Unknown_11afcc
	call Function11afb7
	ret

.asm_11ae06
	call PlayClickSFX
	ld a, [MenuSelection2]
	dec a
	ld hl, wcd30
	ld [hl], a
	and a
	jr z, .asm_11ae28
	hlcoord 2, 14
	ld a, [MenuSelection2]
	cp $2
	jr z, .asm_11ae23
	call Function11b272
	jr .asm_11ae2b

.asm_11ae23
	call Function11b267
	jr .asm_11ae2b

.asm_11ae28
	ld a, $3
	ld [hl], a

.asm_11ae2b
	call Function11ad8a

.asm_11ae2e
	call ExitMenu
	callba ReloadMapPart
	ret
; 11ae38

MenuDataHeader_11ae38: ; 11ae38
	db $40 ; flags
	db 10, 10 ; start coords
	db 17, 17 ; end coords
	dw NULL
	db 0 ; default option
; 11ae40

String_11ae40: ; 11ae40
	db   "どちらでも"
	next "♂ォス"
	next "♀メス"
	db   "@"
; 11ae4e

Function11ae4e: ; 11ae4e
	ld hl, MenuDataHeader_11afe8
	call LoadMenuDataHeader
	call MenuBox
	hlcoord 10, 14
	ld de, String_11aff0
	call PlaceString
	ld hl, MenuDataHeader_11b013
	call LoadMenuDataHeader
	call MenuBox
	hlcoord 16, 8
	ld de, String_11b01b
	call PlaceString
	hlcoord 14, 7, AttrMap
	lb bc, 5, 6
	call Function11afd6
	hlcoord 9, 12, AttrMap
	lb bc, 6, 11
	call Function11afd6
	callba ReloadMapPart
	call Function11ad8a
	ld a, $1
	ld [MenuSelection2], a
	ld hl, Unknown_11afd2
	call Function11afb7

Function11ae98:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and D_UP
	jr nz, .asm_11aec1
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11aec8
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11aee1
	ld a, [hl]
	and B_BUTTON
	ret z
	call PlayClickSFX
.asm_11aeb4
	hlcoord 2, 14
	ld a, $7f
	ld [hl], a
	ld a, $1
	ld [wJumptableIndex], a
	jr .asm_11aef7

.asm_11aec1
	ld a, [MenuSelection2]
	dec a
	ret z
	jr .asm_11aecf

.asm_11aec8
	ld a, [MenuSelection2]
	inc a
	cp $3
	ret z

.asm_11aecf
	push af
	ld hl, Unknown_11afd2
	call Function11afbb
	pop af
	ld [MenuSelection2], a
	ld hl, Unknown_11afd2
	call Function11afb7
	ret

.asm_11aee1
	call PlayClickSFX
	ld a, [MenuSelection2]
	cp $2
	jr z, .asm_11aeb4
	ld a, [wcd4b]
	ld [ScriptVar], a
	call Function11b022
	call Function11ad8a

.asm_11aef7
	call ExitMenu
	call ExitMenu
	callba ReloadMapPart
	ret
; 11af04

Function11af04: ; 11af04
	ld hl, MenuDataHeader_11afe8
	call LoadMenuDataHeader
	call MenuBox
	hlcoord 10, 14
	ld de, String_11b003
	call PlaceString
	ld hl, MenuDataHeader_11b013
	call LoadMenuDataHeader
	call MenuBox
	hlcoord 16, 8
	ld de, String_11b01b
	call PlaceString
	hlcoord 14, 7, AttrMap
	lb bc, 5, 6
	call Function11afd6
	hlcoord 9, 12, AttrMap
	lb bc, 6, 11
	call Function11afd6
	callba ReloadMapPart
	call Function11ad8a
	ld a, $2
	ld [MenuSelection2], a
	ld hl, Unknown_11afd2
	call Function11afb7

Function11af4e:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and D_UP
	jr nz, .asm_11af77
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11af7e
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11af97
	ld a, [hl]
	and B_BUTTON
	ret z
	call PlayClickSFX
.asm_11af6a
	hlcoord 2, 14
	ld a, $7f
	ld [hl], a
	ld a, $1
	ld [wJumptableIndex], a
	jr .asm_11afaa

.asm_11af77
	ld a, [MenuSelection2]
	dec a
	ret z
	jr .asm_11af85

.asm_11af7e
	ld a, [MenuSelection2]
	inc a
	cp $3
	ret z

.asm_11af85
	push af
	ld hl, Unknown_11afd2
	call Function11afbb
	pop af
	ld [MenuSelection2], a
	ld hl, Unknown_11afd2
	call Function11afb7
	ret

.asm_11af97
	call PlayClickSFX
	ld a, [MenuSelection2]
	cp $2
	jr z, .asm_11af6a
	ld a, $6
	ld [wJumptableIndex], a
	xor a
	ld [ScriptVar], a

.asm_11afaa
	call ExitMenu
	call ExitMenu
	callba ReloadMapPart
	ret
; 11afb7

Function11afb7: ; 11afb7
	ld e, $ed
	jr asm_11afbd

Function11afbb:
	ld e, $7f

asm_11afbd:
	ld a, [MenuSelection2]
	dec a
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, e
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld [de], a
	ret
; 11afcc

Unknown_11afcc:
	dwcoord 11, 12
	dwcoord 11, 14
	dwcoord 11, 16

Unknown_11afd2:
	dwcoord 15,  8
	dwcoord 15, 10
; 11afd6

Function11afd6: ; 11afd6
	ld de, $0014
	ld a, $3
.asm_11afdb
	push bc
	push hl
.asm_11afdd
	ld [hli], a
	dec c
	jr nz, .asm_11afdd
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .asm_11afdb
	ret
; 11afe8

MenuDataHeader_11afe8: ; 11afe8
	db $40 ; flags
	db 12,  9 ; start coords
	db 17, 19 ; end coords
	dw NULL
	db 0 ; default option
; 11aff0

String_11aff0: ; 11aff0
	db   "この じょうけんで"
	next "よろしいですか?@"
; 11b003

String_11b003: ; 11b003
	db   "こうかんを"
	next "ちゅうししますか?@"
; 11b013

MenuDataHeader_11b013: ; 11b013
	db $40 ; flags
	db  7, 14 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 1 ; default option
; 11b01b

String_11b01b:
	db   "はい"
	next "いいえ@"
; 11b022

Function11b022: ; 11b022
	ld a, [wcd2e]
	and a
	jr z, .asm_11b02e
	ld hl, StringBuffer3
	call Function11b03d

.asm_11b02e
	ld a, [wcd30]
	and a
	ret z
	cp $3
	ret z
	ld hl, StringBuffer4
	call Function11b03d
	ret
; 11b03d

Function11b03d: ; 11b03d
	push hl
	push af
	ld c, $1
.asm_11b041
	ld a, [hli]
	cp $ef
	jr z, .asm_11b051
	cp $f5
	jr z, .asm_11b051
	cp $50
	jr z, .asm_11b055
	inc c
	jr .asm_11b041

.asm_11b051
	dec hl
	ld a, $50
	ld [hli], a

.asm_11b055
	dec hl
	push hl
	ld e, $4
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	pop hl
.asm_11b05f
	ld a, [hld]
	ld [de], a
	dec de
	dec c
	jr nz, .asm_11b05f
	pop af
	pop de
	cp $1
	jr nz, .asm_11b070
	ld hl, String_11b07a
	jr .asm_11b073

.asm_11b070
	ld hl, String_11b07e

.asm_11b073
	ld bc, 4
	call CopyBytes
	ret
; 11b07a

String_11b07a: db "ォスの "
String_11b07e: db "メスの "

Function11b082: ; 11b082
	call Function11b242
	ld a, $7
	ld [wc7d3], a
	call Function11b099
	call Function11b295
	call Function11b275
	call SetPalettes
	jp Function11ad8a
; 11b099

Function11b099: ; 11b099
	ld c, $6
	hlcoord 11, 1
	ld a, [wc7d3]
	add a
	ld b, a
	xor a
	call Function11b236
	ld a, [wc7d0]
	ld e, a
	ld d, $0
	ld hl, $c6d0
	add hl, de
	ld e, l
	ld d, h
	hlcoord 11, 2
	ld a, [wc7d3]
.asm_11b0b9
	push af
	ld a, [de]
	ld [wd265], a
	push de
	push hl
	call Function11b0cf
	pop hl
	ld de, $0028
	add hl, de
	pop de
	inc de
	pop af
	dec a
	jr nz, .asm_11b0b9
	ret
; 11b0cf

Function11b0cf: ; 11b0cf
	and a
	ret z
	call Function11b0ec
	ret c
	call Function11b0e1
	push hl
	call GetPokemonName
	pop hl
	call PlaceString
	ret
; 11b0e1

Function11b0e1: ; 11b0e1
	call Function11b21e
	jr nz, .asm_11b0e8
	inc hl
	ret

.asm_11b0e8
	ld a, $1
	ld [hli], a
	ret
; 11b0ec

Function11b0ec: ; 11b0ec
	call Function11b22a
	ret nz
	inc hl
	ld de, String_11b0f9
	call PlaceString
	scf
	ret
; 11b0f9

String_11b0f9: ; 11b0f9
	db "ーーーーー@"
; 11b0ff

Function11b0ff: ; 11b0ff
	ld hl, hJoyPressed
	ld a, [hl]
	and $2
	jr nz, .asm_11b141
	ld a, [hl]
	and $1
	jr nz, .asm_11b131
	call Function11b175
	jr nc, .asm_11b125
	ld a, [wcd4c]
	inc a
	and $3
	ld [wcd4c], a
	xor a
	ld [hBGMapMode], a
	call Function11b099
	ld a, $1
	ld [hBGMapMode], a
	ret

.asm_11b125
	ld a, [wcd4c]
	and a
	ret z
	inc a
	and $3
	ld [wcd4c], a
	ret

.asm_11b131
	call Function11b20b
	call Function11b22a
	jr z, .asm_11b13d
	ld a, $1
	jr .asm_11b148

.asm_11b13d
	ld a, $2
	jr .asm_11b148

.asm_11b141
	ld hl, wJumptableIndex
	ld a, $7
	ld [hl], a
	ret

.asm_11b148
	call PlayClickSFX
	ld [wcd4b], a
	and a
	jr z, .asm_11b16c
	ld a, [wcf65]
	cp $0
	jr z, .asm_11b163
	cp $fe
	jr z, .asm_11b167
	cp $ff
	jr z, .asm_11b16b
	jp Function11ad8a

.asm_11b163
	ld a, $1
	jr .asm_11b16c

.asm_11b167
	ld a, $2
	jr .asm_11b16c

.asm_11b16b
	xor a

.asm_11b16c
	ld [wcd30], a
	ld a, $4
	ld [wJumptableIndex], a
	ret
; 11b175

Function11b175: ; 11b175
	ld a, [wc7d3]
	ld d, a
	ld a, [wc7d2]
	ld e, a
	ld hl, hJoyLast
	ld a, [hl]
	and $40
	jr nz, .asm_11b19a
	ld a, [hl]
	and $80
	jr nz, .asm_11b1ae
	ld a, d
	cp e
	jr nc, .asm_11b1ed
	ld a, [hl]
	and $20
	jr nz, .asm_11b1c6
	ld a, [hl]
	and $10
	jr nz, .asm_11b1d8
	jr .asm_11b1ed

.asm_11b19a
	ld hl, wc7d1
	ld a, [hl]
	and a
	jr z, .asm_11b1a4
	dec [hl]
	jr .asm_11b1ef

.asm_11b1a4
	ld hl, wc7d0
	ld a, [hl]
	and a
	jr z, .asm_11b1ed
	dec [hl]
	jr .asm_11b1ef

.asm_11b1ae
	ld hl, wc7d1
	ld a, [hl]
	inc a
	cp e
	jr nc, .asm_11b1ed
	cp d
	jr nc, .asm_11b1bc
	inc [hl]
	jr .asm_11b1ef

.asm_11b1bc
	ld hl, wc7d0
	add [hl]
	cp e
	jr nc, .asm_11b1ed
	inc [hl]
	jr .asm_11b1ef

.asm_11b1c6
	ld hl, wc7d0
	ld a, [hl]
	and a
	jr z, .asm_11b1ed
	cp d
	jr nc, .asm_11b1d4
	xor a
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1d4
	sub d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1d8
	ld hl, wc7d0
	ld a, d
	add a
	add [hl]
	jr c, .asm_11b1e3
	cp e
	jr c, .asm_11b1e8

.asm_11b1e3
	ld a, e
	sub d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1e8
	ld a, [hl]
	add d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1ed
	and a
	ret

.asm_11b1ef
	call Function11b295
	call Function11b275
	scf
	ret
; 11b1f7

Function11b1f7: ; 11b1f7
	hlcoord 0, 0
	ld a, $32
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ret
; 11b203

Function11b203: ; 11b203
.asm_11b203
	ld a, [de]
	cp $ff
	ret z
	inc de
	ld [hli], a
	jr .asm_11b203
; 11b20b

Function11b20b: ; 11b20b
	ld a, [wc7d1]
	ld hl, wc7d0
	add [hl]
	ld e, a
	ld d, $0
	ld hl, $c6d0
	add hl, de
	ld a, [hl]
	ld [wd265], a
	ret
; 11b21e

Function11b21e: ; 11b21e
	push de
	push hl
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	pop hl
	pop de
	ret
; 11b22a

Function11b22a: ; 11b22a
	push de
	push hl
	ld a, [wd265]
	dec a
	call CheckSeenMon
	pop hl
	pop de
	ret
; 11b236

Function11b236: ; 11b236
	jp FillBoxWithByte
; 11b239

Function11b239: ; 11b239
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 11b242

Function11b242: ; 11b242
	hlcoord 3, 4
	ld de, StringBuffer3
	call PlaceString
	xor a
	ld [MonType], a
	callba GetGender
	hlcoord 1, 4
	ld a, [CurPartySpecies]
	ld bc, wcd2f
	ld [bc], a
	dec bc
	jr c, asm_11b26a
	jr z, asm_11b26f
	ld a, $1
	ld [bc], a

Function11b267:
	ld [hl], $ef
	ret

asm_11b26a
	xor a
	ld [bc], a
	ld [hl], $7f
	ret

asm_11b26f
	ld a, $2
	ld [bc], a

Function11b272:
	ld [hl], $f5
	ret
; 11b275

Function11b275: ; 11b275
	call Function11b279
	ret
; 11b279

Function11b279: ; 11b279
	ld a, [wd265]
	ld [CurSpecies], a
	call Function11b22a
	jr z, .asm_11b28f
	call GetBaseData
	ld a, [BaseGender]
	ld [wcf65], a
	jr .asm_11b294

.asm_11b28f
	ld a, $ff
	ld [wcf65], a

.asm_11b294
	ret
; 11b295

Function11b295: ; 11b295
	hlcoord 4, 13
	ld de, String_11b308
	call PlaceString
	hlcoord 4, 14
	ld de, String_11b308
	call PlaceString
	call Function11b20b
	call Function11b22a
	jr z, .asm_11b2d1
	ld a, [$c608]
	ld c, a
	ld a, [$c608 + 1]
	ld b, a
	ld hl, $0007
	add hl, bc
	xor a
	ld [hl], a
	ld hl, $0003
	add hl, bc
	ld e, [hl]
	callba FlyFunction_GetMonIcon
	hlcoord 4, 14
	push hl
	call GetPokemonName
	jr .asm_11b2e7

.asm_11b2d1
	ld a, [$c608]
	ld c, a
	ld a, [$c608 + 1]
	ld b, a
	ld hl, $0007
	add hl, bc
	ld a, $50
	ld [hl], a
	hlcoord 4, 13
	push hl
	ld de, String_11b30e

.asm_11b2e7
	ld a, $6
	ld bc, StringBuffer4
.asm_11b2ec
	push af
	ld a, [de]
	ld [bc], a
	inc de
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b2ec
	pop hl
	ld de, StringBuffer4
	call PlaceString
	ret
; 11b2fe

String_11b2fe: ; 11b2fe
	db "あげる#@"
; 11b303

String_11b303: ; 11b303
	db "ほしい#@"
; 11b308

String_11b308: ; 11b308
	db "     @"
; 11b30e

String_11b30e: ; 11b30e
	db "みはっけん@"
; 11b314

Function11b314: ; 11b314
	call Function11b31b
	call Function11b3d9
	ret
; 11b31b

Function11b31b: ; 11b31b
	ld hl, Unknown_11b350
	ld a, [wJumptableIndex]
	cp $2
	jr c, .asm_11b349
	ld a, [wc7d1]
	cp $4
	jr nc, .asm_11b344
	cp $3
	jr c, .asm_11b349
	ld a, [wJumptableIndex]
	cp $2
	jr z, .asm_11b349
	cp $3
	jr z, .asm_11b349
	cp $6
	jr z, .asm_11b349

	ld bc, Unknown_11b37b
	jr .asm_11b34c

.asm_11b344
	ld bc, Unknown_11b389
	jr .asm_11b34c

.asm_11b349
	ld bc, Unknown_11b36d

.asm_11b34c
	call Function11b397
	ret
; 11b350

Unknown_11b350:
	db $1a, $5e, $1a, $66, $1a, $6e, $1a, $76, $1a, $7e, $1a, $86, $1a, $8e
	db $22, $5e, $22, $66, $22, $6e, $22, $76, $22, $7e, $22, $86, $22, $8e
	db $ff

Unknown_11b36d:
	db $30, $31, $31, $31, $31, $31, $32, $40, $41, $41, $41, $41, $41, $42
Unknown_11b37b:
	db $30, $31, $31, $39, $39, $39, $39, $40, $41, $41, $39, $39, $39, $39
Unknown_11b389:
	db $39, $39, $39, $39, $39, $39, $39, $39, $39, $39, $39, $39, $39, $39

Function11b397: ; 11b397
	ld de, Sprites
.asm_11b39a
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wc7d1]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [bc]
	inc bc
	ld [de], a
	inc de
	ld a, $5
	ld [de], a
	inc de
	jr .asm_11b39a
; 11b3b6

Function11b3b6: ; 11b3b6
.asm_11b3b6
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wcd4d]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	push hl
	ld l, c
	ld h, b
	ld a, [wcd4e]
	add [hl]
	inc bc
	ld [de], a
	inc de
	pop hl
	ld a, $5
	ld [de], a
	inc de
	jr .asm_11b3b6
; 11b3d9

Function11b3d9: ; 11b3d9
	ld de, Sprites + $70
	push de
	ld a, [wc7d2]
	dec a
	ld e, a
	ld a, [wc7d1]
	ld hl, wc7d0
	add [hl]
	cp e
	jr z, .asm_11b40d
	ld hl, 0
	ld bc, $0070
	call AddNTimes
	ld e, l
	ld d, h
	ld b, $0
	ld a, d
	or e
	jr z, .asm_11b40f
	ld a, [wc7d2]
	ld c, a
.asm_11b401
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr c, .asm_11b40f
	inc b
	jr .asm_11b401

.asm_11b40d
	ld b, $70

.asm_11b40f
	ld a, $15
	add b
	pop hl
	ld [hli], a
	cp $41
	jr c, .asm_11b42b
	ld a, [wJumptableIndex]
	cp $4
	jr z, .asm_11b43b
	cp $5
	jr z, .asm_11b43b
	cp $7
	jr z, .asm_11b43b
	cp $8
	jr z, .asm_11b43b

.asm_11b42b
	ld a, $9b
	ld [hli], a
	ld a, [wcd4c]
	add $3c
	ld [hli], a
	ld a, [wcd4c]
	add $1
	ld [hl], a
	ret

.asm_11b43b
	ld a, $9b
	ld [hli], a
	ld a, $39
	ld [hli], a
	xor a
	ld [hl], a
	ret
; 11b444

Function11b444: ; 11b444
	call Function11b44b
	call Function11b45c
	ret
; 11b44b

Function11b44b: ; 11b44b
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	call UpdateTime
	ret
; 11b45c

Function11b45c: ; 11b45c
.asm_11b45c
	call Function11b46a
	call DelayFrame
	ld a, [wJumptableIndex]
	cp $4
	jr nz, .asm_11b45c
	ret
; 11b46a

Function11b46a: ; 11b46a
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11b479
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11b479

Jumptable_11b479: ; 11b479
	dw Function11b483
	dw Function11b570
	dw Function11b5c0
	dw Function11b5e0
	dw Function11b5e7
; 11b483

Function11b483: ; 11b483
	call Function11b538
	ld hl, PlayerName
	ld a, $5
.asm_11b48b
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b48b
	ld de, $0030
	ld hl, PartyMon1Species
	ld a, [wcd82]
	dec a
	push af
.asm_11b49f
	and a
	jr z, .asm_11b4a6
	add hl, de
	dec a
	jr .asm_11b49f

.asm_11b4a6
	push bc
	ld a, $30
.asm_11b4a9
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b4a9
	pop de
	push bc
	ld a, [de]
	ld [CurSpecies], a
	call GetBaseData
	ld hl, $001f
	add hl, de
	ld a, [hl]
	ld [CurPartyLevel], a
	ld hl, $0024
	add hl, de
	push hl
	ld hl, $000a
	add hl, de
	pop de
	push de
	ld b, $1
	predef CalcPkmnStats
	pop de
	ld h, d
	ld l, e
rept 2
	dec hl
endr
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	pop bc
	ld de, $000b
	ld hl, PartyMonOT
	pop af
	push af
.asm_11b4e8
	and a
	jr z, .asm_11b4ef
	add hl, de
	dec a
	jr .asm_11b4e8

.asm_11b4ef
	ld a, $a
.asm_11b4f1
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b4f1
	ld de, $000b
	ld hl, PartyMonNicknames
	pop af
	push af
.asm_11b502
	and a
	jr z, .asm_11b509
	add hl, de
	dec a
	jr .asm_11b502

.asm_11b509
	ld a, $a
.asm_11b50b
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b50b
	ld de, $002f
	ld hl, $a600
	pop af
.asm_11b51b
	and a
	jr z, .asm_11b522
	add hl, de
	dec a
	jr .asm_11b51b

.asm_11b522
	ld a, $0
	call GetSRAMBank
	ld a, $2f
.asm_11b529
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b529
	call CloseSRAM
	jp Function11ad8a
; 11b538

Function11b538: ; 11b538
	ld bc, BattleMonNick + 5
	ld a, [PlayerID]
	ld [wcd2a], a
	ld [bc], a
	inc bc
	ld a, [PlayerID + 1]
	ld [wcd2b], a
	ld [bc], a
	inc bc
	ld a, [wSecretID]
	ld [wcd2c], a
	ld [bc], a
	inc bc
	ld a, [wSecretID + 1]
	ld [wcd2d], a
	ld [bc], a
	inc bc
	ld a, [wcd2e]
	ld [bc], a
	inc bc
	ld a, [wcd2f]
	ld [bc], a
	inc bc
	ld a, [wcd30]
	ld [bc], a
	inc bc
	ld a, [wd265]
	ld [bc], a
	inc bc
	ret
; 11b570

Function11b570: ; 11b570
	call Function118007
	ld a, [ScriptVar]
	and a
	jr nz, .asm_11b57f
	call Function11b585
	jp Function11ad8a

.asm_11b57f
	ld a, $4
	ld [wJumptableIndex], a
	ret
; 11b585

Function11b585: ; 11b585
	ld a, $3
	ld [rSVBK], a
	ld hl, $d800
	ld de, $c608
	ld bc, $008f
	call CopyBytes
	ld a, $1
	ld [rSVBK], a
	ld a, $5
	call GetSRAMBank
	ld de, $a800
	ld a, $1
	ld [de], a
	inc de
	ld hl, $c608
	ld bc, $008f
	call CopyBytes
	push de
	pop hl
	ld a, [hRTCMinutes]
	ld [hli], a
	ld a, [hRTCHours]
	ld [hli], a
	ld a, [hRTCDayLo]
	ld [hli], a
	ld a, [hRTCDayHi]
	ld [hl], a
	call CloseSRAM
	ret
; 11b5c0

Function11b5c0: ; 11b5c0
	ld a, [wcd82]
	dec a
	ld [CurPartyMon], a
	xor a
	ld [wd10b], a
	callba Functione039
	callba Function170807
	callba Function14a58
	jp Function11ad8a
; 11b5e0

Function11b5e0: ; 11b5e0
	xor a
	ld [ScriptVar], a
	jp Function11ad8a
; 11b5e7

Function11b5e7: ; 11b5e7
	ret
; 11b5e8

Function11b5e8: ; 11b5e8
	ld a, $0
	call GetSRAMBank
	ld hl, wRTC
	ld de, $c608
	ld bc, $0004
	call CopyBytes
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	ld hl, $c608
	ld de, $b08c
	ld bc, $0004
	call CopyBytes
	ld a, $2
	ld [$a800], a
	ld a, [$a81f]
	ld [wcd2a], a
	ld a, [$a820]
	ld [wcd2b], a
	ld a, [$a821]
	ld [wcd2c], a
	ld a, [$a822]
	ld [wcd2d], a
	ld a, [$a823]
	ld [wcd2e], a
	ld a, [$a824]
	ld [wcd2f], a
	ld a, [$a825]
	ld [wcd30], a
	ld a, [$a826]
	ld [wcd31], a
	call CloseSRAM
	call Function11b44b
	call Function11b64c
	ret
; 11b64c

Function11b64c: ; 11b64c
.asm_11b64c
	call Function11b65a
	call DelayFrame
	ld a, [wJumptableIndex]
	cp $1
	jr nz, .asm_11b64c
	ret
; 11b65a

Function11b65a: ; 11b65a
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11b669
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11b669

Jumptable_11b669: ; 11b669
	dw Function11b66d
	dw Function11b6b3
; 11b66d

Function11b66d: ; 11b66d
	call Function1180b8
	ld a, [ScriptVar]
	and a
	jr nz, .asm_11b6b0
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, [StringBuffer2 + 10]
	ld b, a
	pop af
	ld [rSVBK], a
	ld a, b
	and a
	jr z, .asm_11b691
	cp $1
	jr nz, .asm_11b6b0
	call Function11b6b4
	jr .asm_11b6b0

.asm_11b691
	callba Function17081d
	ld a, [ScriptVar]
	and a
	jr z, .asm_11b6b0
	xor a
	ld [ScriptVar], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, $2
	ld [StringBuffer2 + 10], a
	pop af
	ld [rSVBK], a

.asm_11b6b0
	jp Function11ad8a
; 11b6b3

Function11b6b3: ; 11b6b3
	ret
; 11b6b4

Function11b6b4: ; 11b6b4
	ld a, $5
	call GetSRAMBank
	ld a, [wcd30]
	ld [wc708], a
	ld a, [wcd31]
	ld [wc709], a
	ld a, $8
	ld [BGMapBuffer], a
	ld a, $c7
	ld [wcd21], a
	ld a, $d
	ld [CreditsTimer], a
	ld a, $c6
	ld [wcd23], a
	ld a, $3d
	ld [wcd24], a
	ld a, $c6
	ld [wcd25], a
	ld a, $42
	ld [wcd26], a
	ld a, $c6
	ld [wcd27], a
	ld a, $47
	ld [wcd28], a
	ld a, $c6
	ld [wcd29], a
	ld a, $46
	ld [$c628], a
	ld de, $c63d
	ld c, $5
	callba CheckStringForErrors
	jr nc, .asm_11b70f
	callba Function17d187

.asm_11b70f
	ld de, $c63d
	lb bc, 1, 5
	callba CheckStringContainsLessThanBNextCharacters
	jr nc, .asm_11b723
	callba Function17d187

.asm_11b723
	ld de, $c642
	ld c, $5
	callba CheckStringForErrors
	jr nc, .asm_11b736
	callba Function17d199

.asm_11b736
	ld de, $c642
	lb bc, 1, 5
	callba CheckStringContainsLessThanBNextCharacters
	jr nc, .asm_11b74a
	callba Function17d199

.asm_11b74a
	ld de, $c647
	ld c, $21
	callba CheckStringForErrors
	jr nc, .asm_11b75d
	callba Function17d1ab

.asm_11b75d
	ld de, $c647
	lb bc, 2, $21
	callba CheckStringContainsLessThanBNextCharacters
	jr c, .asm_11b770
	ld a, b
	cp $2
	jr nz, .asm_11b776

.asm_11b770
	callba Function17d1ab

.asm_11b776
	ld de, $c668
	ld c, $5
	callba CheckStringForErrors
	jr nc, .asm_11b789
	callba Function17d1c9

.asm_11b789
	ld de, $c668
	lb bc, 1, 5
	callba CheckStringContainsLessThanBNextCharacters
	jr nc, .asm_11b79d
	callba Function17d1c9

.asm_11b79d
	ld a, [$c608 + 6]
	cp $ff
	jr nz, .asm_11b7a8
	xor a
	ld [$c608 + 6], a

.asm_11b7a8
	ld a, [wcd31]
	ld [$c608 + 5], a
	ld [CurSpecies], a
	call GetBaseData

	ld hl, $c62c
	ld a, [hl]
	cp MIN_LEVEL
	ld a, MIN_LEVEL
	jr c, .asm_11b7c5
	ld a, [hl]
	cp MAX_LEVEL
	jr c, .asm_11b7c6
	ld a, MAX_LEVEL
.asm_11b7c5
	ld [hl], a
.asm_11b7c6
	ld [CurPartyLevel], a

	ld hl, $c616 + 1
	ld de, $c62c + 5
	ld b, $1
	predef CalcPkmnStats
	ld de, $c62c + 5
	ld hl, $c62c + 3
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	call Function11b98f
	ret
; 11b7e5

Function11b7e5: ; 11b7e5
	ld a, [$c608 + 5]
	ld [wc702], a
	ld [CurPartySpecies], a
	ld a, [wcd81]
	ld [wc74e], a
	ld hl, $c63d
	ld de, wc724
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld a, [$c608 + 11]
	ld [wEnemyWrapCount], a
	ld a, [$c608 + 12]
	ld [wPlayerCharging], a
	ld hl, $c608 + 26
	ld a, [hli]
	ld [wEnemyTrappingMove], a
	ld a, [hl]
	ld [wPlayerWrapCount], a
	ld bc, $c608 + 5
	callba GetCaughtGender
	ld a, c
	ld [wEnemyCharging], a
	call SpeechTextBox
	call FadeToMenu
	callba Function108016
	callba Function17d1f1
	ld a, $1
	ld [wForceEvolution], a
	ld a, $2
	ld [wLinkMode], a
	callba EvolvePokemon
	xor a
	ld [wLinkMode], a
	callba Function14a58
	ld a, $5
	call GetSRAMBank
	ld a, $5
	ld [$a800], a
	call CloseSRAM
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetMapTrigger
	ld a, d
	or e
	jr z, .asm_11b872
	ld a, $1
	ld [de], a

.asm_11b872
	call CloseSubmenu
	call RestartMapMusic
	ret
; 11b879

Function11b879: ; 11b879
	callba BattleTower_CheckSaveFileExistsAndIsYours
	ld a, [ScriptVar]
	and a
	ret z
	ld a, $5
	call GetSRAMBank
	ld a, [$a800]
	ld [ScriptVar], a
	ld a, [$a890]
	ld [wcd49], a
	ld a, [$a891]
	ld [wcd4a], a
	ld a, [$a892]
	ld [wcd4b], a
	ld a, [$a893]
	ld [wcd4c], a
	call CloseSRAM
	ld a, [ScriptVar]
	and a
	ret z
	ld hl, wcd4c
	ld a, [hRTCDayHi]
	cp [hl]
	ret nz
	dec hl
	ld a, [hRTCDayLo]
	cp [hl]
	ret nz
	ld hl, wcd4a
	ld a, [hRTCHours]
	cp [hl]
	jr nc, .asm_11b8d8
	ld a, $18
	sub [hl]
	ld hl, hRTCHours
	add [hl]
	ld [wcd4c], a
	ld a, [hRTCMinutes]
	ld [wcd4b], a
	xor a
	ld [wcd4a], a
	jr .asm_11b8e2

.asm_11b8d8
	ld a, [hRTCMinutes]
	ld [wcd4b], a
	ld a, [hRTCHours]
	ld [wcd4c], a

.asm_11b8e2
	xor a
	ld l, a
	ld h, a
	ld b, a
	ld d, a
	ld a, [wcd4b]
	ld e, a
	ld a, [wcd4c]
	ld c, $3c
	call AddNTimes
	add hl, de
	push hl
	xor a
	ld l, a
	ld h, a
	ld b, a
	ld d, a
	ld a, [wcd49]
	ld e, a
	ld a, [wcd4a]
	ld c, $3c
	call AddNTimes
	add hl, de
	ld a, l
	cpl
	add $1
	ld e, a
	ld a, h
	cpl
	adc $0
	ld d, a
	pop hl
	add hl, de
	ld de, $ff88
	add hl, de
	bit 7, h
	ret z
	ld a, $2
	ld [ScriptVar], a
	ret
; 11b920

Function11b920: ; 11b920
	call Function11b44b
	ld a, $5
	call GetSRAMBank
	ld hl, $a81f
	ld de, BattleMonNick + 5
	ld bc, $0008
	call CopyBytes
	call CloseSRAM
	call Function118000
	ret
; 11b93b

Function11b93b: ; 11b93b
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$a800], a
	ld hl, $a823
	ld de, wEnemyMoveStruct
	ld bc, $008f
	call CopyBytes
	call CloseSRAM
	ld a, wEnemyMoveStruct % $100
	ld [wcd20], a
	ld a, wEnemyMoveStruct / $100
	ld [wcd21], a
	ld a, $c611 % $100
	ld [wcd22], a
	ld a, $c611 / $100
	ld [wcd23], a
	ld a, $c641 % $100
	ld [wcd24], a
	ld a, $c641 / $100
	ld [wcd25], a
	ld a, $c646 % $100
	ld [wcd26], a
	ld a, $c646 / $100
	ld [wcd27], a
	ld a, $c64b % $100
	ld [wcd28], a
	ld a, $c64b / $100
	ld [wcd29], a
	call Function11b98f
	callba Function14a58
	ret
; 11b98f

Function11b98f: ; 11b98f
	ld hl, PartyCount
	ld a, [hl]
	ld e, a
	inc [hl]
	ld a, [wcd20]
	ld l, a
	ld a, [wcd21]
	ld h, a
	inc hl
	ld bc, PartySpecies
	ld d, e
.loop1
	inc bc
	dec d
	jr nz, .loop1
	ld a, e
	ld [CurPartyMon], a
	ld a, [hl]
	ld [bc], a
	inc bc
	ld a, $ff
	ld [bc], a
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	ld [wcd2a], a
.loop2
	add hl, bc
	dec a
	and a
	jr nz, .loop2
	ld e, l
	ld d, h
	ld a, [CreditsTimer]
	ld l, a
	ld a, [wcd23]
	ld h, a
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	ld a, [wcd2a]
.loop3
	add hl, bc
	dec a
	and a
	jr nz, .loop3
	ld e, l
	ld d, h
	ld a, [wcd24]
	ld l, a
	ld a, [wcd25]
	ld h, a
	ld bc, PKMN_NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld a, [wcd2a]
.loop4
	add hl, bc
	dec a
	and a
	jr nz, .loop4
	ld e, l
	ld d, h
	ld a, [wcd26]
	ld l, a
	ld a, [wcd27]
	ld h, a
	ld bc, PKMN_NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a
	ld hl, sPartyMail
	ld bc, PARTYMON_STRUCT_LENGTH - 1
	ld a, [wcd2a]
.loop5
	add hl, bc
	dec a
	and a
	jr nz, .loop5
	ld a, $0
	call GetSRAMBank
	ld e, l
	ld d, h
	ld a, [wcd28]
	ld l, a
	ld a, [wcd29]
	ld h, a
	ld bc, PARTYMON_STRUCT_LENGTH - 1
	call CopyBytes
	call CloseSRAM
	ret
; 11ba38

Function11ba38: ; 11ba38
	callba CheckCurPartyMonFainted
	ret c
	xor a
	ld [ScriptVar], a
	ret
; 11ba44

Unknown_11ba44:
	db $47, $30, $0a, $0a, $0a, $0a, $0a, $56
	db $46, $2f, $0a, $0a, $0a, $0a, $0a, $55
	db $45, $3d, $0a, $0a, $0a, $0a, $0a, $54
	db $44, $30, $0a, $0a, $0a, $0a, $0a, $53
	db $43, $2f, $0a, $0a, $0a, $0a, $0a, $52
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $51
	db $4a, $30, $0a, $0a, $0a, $0a, $0a, $50
	db $4a, $2f, $0a, $0a, $0a, $0a, $0a, $4f
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $4e
	db $4a, $30, $0a, $0a, $0a, $0a, $4d, $42
	db $4a, $2f, $0a, $0a, $0a, $0a, $6b, $58
	db $4a, $3d, $0a, $0a, $0a, $0a, $6a, $58
	db $4a, $30, $0a, $0a, $0a, $0a, $69, $58
	db $4a, $2f, $0a, $0a, $0a, $0a, $68, $58
	db $4a, $3d, $0a, $0a, $0a, $66, $67, $58
	db $4a, $30, $0a, $0a, $0a, $65, $0a, $58
	db $4a, $2f, $0a, $0a, $0a, $64, $0a, $58
	db $4a, $3d, $0a, $0a, $0a, $63, $0a, $58
	db $4a, $30, $0a, $0a, $61, $62, $0a, $58
	db $4a, $2f, $0a, $0a, $5f, $60, $0a, $58
	db $4a, $3d, $0a, $61, $62, $0a, $0a, $58
	db $4a, $30, $0a, $63, $0a, $0a, $0a, $58
	db $4a, $2f, $69, $0a, $0a, $0a, $0a, $58
	db $4a, $3d, $81, $0a, $0a, $0a, $0a, $58
	db $4a, $30, $80, $0a, $0a, $0a, $0a, $58
	db $4a, $2f, $7f, $0a, $0a, $0a, $0a, $58
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $58
	db $4a, $30, $0a, $0a, $0a, $0a, $0a, $58
	db $4a, $2f, $68, $87, $88, $89, $0a, $58
	db $4a, $3d, $6e, $6f, $70, $75, $76, $58
	db $4a, $30, $75, $76, $5c, $5d, $5e, $58
	db $4a, $2f, $71, $72, $73, $74, $6d, $58
	db $4a, $3d, $75, $76, $77, $8a, $8b, $58
	db $4a, $30, $66, $67, $65, $0a, $6a, $58
	db $4a, $2f, $83, $84, $0a, $83, $84, $58
	db $4a, $3d, $0a, $85, $82, $84, $0a, $58
	db $4a, $30, $41, $80, $40, $0a, $0a, $58
	db $4a, $2f, $83, $0a, $0a, $0a, $0a, $58
	db $4a, $3d, $40, $0a, $0a, $0a, $0a, $58
	db $ff

Unknown_11bb7d:
	db $0a, $0a, $0a, $0a, $0a, $0a, $16, $00
	db $78, $0a, $0a, $0a, $0a, $0a, $8c, $00
	db $79, $0a, $0a, $0a, $0a, $0a, $8d, $00
	db $7a, $0a, $0a, $0a, $0a, $0a, $8e, $00
	db $7b, $0a, $0a, $0a, $0a, $0a, $8c, $00
	db $7c, $0a, $0a, $0a, $0a, $0a, $8d, $00
	db $7d, $0a, $0a, $0a, $0a, $0a, $8e, $00
	db $2e, $7e, $0a, $0a, $0a, $0a, $8c, $00
	db $2e, $80, $0a, $0a, $0a, $0a, $8d, $00
	db $2e, $81, $0a, $0a, $0a, $0a, $8e, $00
	db $2e, $82, $0a, $0a, $0a, $0a, $8c, $00
	db $2e, $69, $0a, $0a, $0a, $0a, $8d, $00
	db $2e, $6a, $0a, $0a, $0a, $0a, $8e, $00
	db $2e, $6b, $0a, $0a, $0a, $0a, $8c, $00
	db $2e, $0a, $68, $0a, $0a, $0a, $8d, $00
	db $2e, $0a, $69, $0a, $0a, $0a, $8e, $00
	db $2e, $0a, $0a, $6a, $0a, $0a, $8c, $00
	db $2e, $0a, $0a, $6b, $0a, $0a, $8d, $00
	db $2e, $0a, $0a, $0a, $80, $0a, $8e, $00
	db $2e, $0a, $0a, $0a, $82, $0a, $8c, $00
	db $2e, $0a, $0a, $0a, $6c, $0a, $8d, $00
	db $2e, $0a, $0a, $0a, $0a, $83, $8e, $00
	db $2e, $0a, $6b, $0a, $0a, $0a, $8c, $00
	db $2e, $0a, $0a, $69, $0a, $0a, $8d, $00
	db $2e, $0a, $0a, $6a, $0a, $0a, $8e, $00
	db $2e, $0a, $0a, $0a, $68, $0a, $8c, $00
	db $2e, $0a, $0a, $0a, $63, $0a, $8d, $00
	db $2e, $0a, $0a, $61, $62, $0a, $8e, $00
	db $2e, $0a, $0a, $0a, $5f, $60, $8c, $00
	db $2e, $0a, $0a, $0a, $63, $0a, $8d, $00
	db $2e, $0a, $0a, $0a, $0a, $69, $8c, $00
	db $2e, $0a, $0a, $0a, $0a, $6b, $8d, $00
	db $2e, $0a, $0a, $0a, $0a, $83, $8e, $00
	db $2e, $0a, $0a, $0a, $0a, $86, $8c, $00
	db $2e, $0a, $85, $0a, $0a, $0a, $8d, $00
	db $2e, $0a, $0a, $84, $0a, $0a, $8e, $00
	db $ff


