; Pic animation arrangement.


Functiond0000: ; d0000
	ld hl, $c4ac
	ld a, [IsInBattle]
	cp $1
	jr z, .asm_d0012
	ld e, $0
	ld d, $0
	call Functiond008e
	ret

.asm_d0012
	ld e, $1
	ld d, $0
	call Functiond008e
	ret
; d001a

INCBIN "baserom.gbc",$d001a,$d008e - $d001a

Functiond008e: ; d008e
	call Functiond01c6
	ret c
	call Functiond00a3
.asm_d0095
	call Functiond00b4
	push af
	callba Function10402d
	pop af
	jr nc, .asm_d0095
	ret
; d00a3

Functiond00a3: ; d00a3
	push hl
	ld c, e
	ld b, $0
	ld hl, $4042
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	call Functiond01d6
	ret
; d00b4

Functiond00b4: ; d00b4
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	ld a, [$d168]
	ld c, a
	ld b, $0
	ld hl, $d169
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, [hl]
	ld hl, $40da
	rst JumpTable
	ld a, [$d168]
	ld c, a
	pop af
	ld [rSVBK], a
	ld a, c
	and $80
	ret z
	scf
	ret
; d00da

Tabled00da: ; d00da
	dw Functiond0171
	dw Functiond0166
	dw Functiond00f2
	dw Functiond00fe
	dw Functiond010b
	dw Functiond011d
	dw Functiond012f
	dw Functiond0141
	dw Functiond0155
	dw Functiond017a
	dw Functiond0188
	dw Functiond0196
; d00f2

Functiond00f2: ; d00f2
	ld a, $12
	ld [$d181], a
	ld a, [$d168]
	inc a
	ld [$d168], a

Functiond00fe: ; d00fe
	ld hl, $d181
	dec [hl]
	ret nz
	ld a, [$d168]
	inc a
	ld [$d168], a
	ret
; d010b

Functiond010b: ; d010b
	ld c, $0
	ld b, $0
	call Functiond0228
	call Functiond0504
	ld a, [$d168]
	inc a
	ld [$d168], a
	ret
; d011d

Functiond011d: ; d011d
	ld c, $0
	ld b, $4
	call Functiond0228
	call Functiond0504
	ld a, [$d168]
	inc a
	ld [$d168], a
	ret
; d012f

Functiond012f: ; d012f
	ld c, $1
	ld b, $0
	call Functiond0228
	call Functiond0504
	ld a, [$d168]
	inc a
	ld [$d168], a
	ret
; d0141

Functiond0141: ; d0141
	call Functiond0250
	ld a, [$d17e]
	bit 7, a
	ret z
	call Functiond04bd
	ld a, [$d168]
	inc a
	ld [$d168], a
	ret
; d0155

Functiond0155: ; d0155
	call Functiond0250
	ld a, [$d17e]
	bit 7, a
	ret z
	ld a, [$d168]
	inc a
	ld [$d168], a
	ret
; d0166

Functiond0166: ; d0166
	call Functiond01a9
	ld a, [$d168]
	inc a
	ld [$d168], a
	ret
; d0171

Functiond0171: ; d0171
	call Functiond01a9
	ld hl, $d168
	set 7, [hl]
	ret
; d017a

Functiond017a: ; d017a
	ld a, [$d16b]
	call Function37e2
	ld a, [$d168]
	inc a
	ld [$d168], a
	ret
; d0188

Functiond0188: ; d0188
	ld a, [$d16b]
	call Function37d5
	ld a, [$d168]
	inc a
	ld [$d168], a
	ret
; d0196

Functiond0196: ; d0196
	ld a, $f
	ld [CryTracks], a
	ld a, [$d16b]
	call Function37c4
	ld a, [$d168]
	inc a
	ld [$d168], a
	ret
; d01a9

Functiond01a9: ; d01a9
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	call Functiond04bd
	callba Function10402d
	call Functiond0536
	callba Function104047
	pop af
	ld [rSVBK], a
	ret
; d01c6

Functiond01c6: ; d01c6
	ld a, [CurPartySpecies]
	cp $fd
	jr z, .asm_d01d4
	call IsAPokemon
	jr c, .asm_d01d4
	and a
	ret

.asm_d01d4
	scf
	ret
; d01d6

Functiond01d6: ; d01d6
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	push bc
	push de
	push hl
	ld hl, $d168
	ld bc, $0029
	xor a
	call ByteFill
	pop hl
	pop de
	pop bc
	ld a, c
	ld [$d169], a
	ld a, b
	ld [$d16a], a
	ld a, l
	ld [$d16f], a
	ld a, h
	ld [$d170], a
	ld a, d
	ld [$d16e], a
	ld a, $1
	ld hl, CurPartySpecies
	call GetFarWRAMByte
	ld [$d16b], a
	ld a, $1
	ld hl, UnownLetter
	call GetFarWRAMByte
	ld [$d16c], a
	call Functiond065c
	ld [$d16d], a
	call Functiond05b4
	ld a, c
	ld [$d171], a
	pop af
	ld [rSVBK], a
	ret
; d0228

Functiond0228: ; d0228
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	push bc
	ld hl, $d172
	ld bc, $001f
	xor a
	call ByteFill
	pop bc
	ld a, b
	ld [$d173], a
	ld a, c
	ld [$d172], a
	call Functiond055c
	call Functiond05ce
	call Functiond061b
	pop af
	ld [rSVBK], a
	ret
; d0250

Functiond0250: ; d0250
	xor a
	ld [hBGMapMode], a

Functiond0253: ; d0253
	ld a, [$d17e]
	and $7f
	ld hl, Tabled025d
	rst JumpTable
	ret
; d025d

Tabled025d: ; d025d
	dw Functiond0261
	dw Functiond0282
; d0261

Functiond0261: ; d0261
	call Functiond02f8
	ld a, [$d182]
	cp $ff
	jr z, Functiond02a8
	cp $fe
	jr z, Functiond028e
	cp $fd
	jr z, Functiond0296
	call Functiond02c8
	ld a, [$d183]
	call Functiond02ae
	ld [$d181], a
	call Functiond02dc

Functiond0282: ; d0282
	ld a, [$d181]
	dec a
	ld [$d181], a
	ret nz
	call Functiond02e4
	ret
; d028e

Functiond028e: ; d028e
	ld a, [$d183]
	ld [$d17f], a
	jr Functiond0253
; d0296

Functiond0296: ; d0296
	ld a, [$d17f]
	and a
	ret z
	dec a
	ld [$d17f], a
	ret z
	ld a, [$d183]
	ld [$d17d], a
	jr Functiond0253
; d02a8

Functiond02a8: ; d02a8
	ld hl, $d17e
	set 7, [hl]
	ret
; d02ae

Functiond02ae: ; d02ae
	ld c, a
	ld b, $0
	ld hl, $0000
	ld a, [$d173]
	call AddNTimes
	ld a, h
	swap a
	and $f0
	ld h, a
	ld a, l
	swap a
	and $f
	or h
	add c
	ret
; d02c8

Functiond02c8: ; d02c8
	call Functiond04bd
	ld a, [$d182]
	and a
	ret z
	call Functiond031b
	push hl
	call Functiond033b
	pop hl
	call Functiond036b
	ret
; d02dc

Functiond02dc: ; d02dc
	ld a, [$d17e]
	inc a
	ld [$d17e], a
	ret
; d02e4

Functiond02e4: ; d02e4
	ld a, [$d17e]
	dec a
	ld [$d17e], a
	ret
; d02ec

Functiond02ec: ; d02ec
	ld a, [$d16b]
	cp $c9
	ret
; d02f2

Functiond02f2: ; d02f2
	ld a, [$d16b]
	cp $fd
	ret
; d02f8

Functiond02f8: ; d02f8
	push hl
	ld a, [$d17d]
	ld e, a
	ld d, $0
	ld hl, $d175
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	add hl, de
	ld a, [$d174]
	call GetFarHalfword
	ld a, l
	ld [$d182], a
	ld a, h
	ld [$d183], a
	ld hl, $d17d
	inc [hl]
	pop hl
	ret
; d031b

Functiond031b: ; d031b
	ld a, [$d182]
	dec a
	ld c, a
	ld b, $0
	ld hl, $d178
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	add hl, bc
	ld a, [$d177]
	call GetFarHalfword
	ld a, [$d177]
	call GetFarByte
	ld [$d180], a
	inc hl
	ret
; d033b

Functiond033b: ; d033b
	call Functiond0356
	push bc
	ld hl, $d17b
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$d180]
	call AddNTimes
	pop bc
	ld de, $d188
	ld a, [$d17a]
	call FarCopyBytes
	ret
; d0356

Functiond0356: ; d0356
	push hl
	ld a, [$d171]
	sub $5
	ld c, a
	ld b, $0
	ld hl, $4368
	add hl, bc
	ld c, [hl]
	ld b, $0
	pop hl
	ret
; d0368

INCBIN "baserom.gbc",$d0368,$d036b - $d0368

Functiond036b: ; d036b
	xor a
	ld [$d187], a
	ld [$d186], a
	ld [$d185], a
.asm_d0375
	push hl
	call Functiond0392
	pop hl
	ld a, b
	and a
	jr z, .asm_d038a
	ld a, [$d177]
	call GetFarByte
	inc hl
	push hl
	call Functiond03bd
	pop hl

.asm_d038a
	push hl
	call Functiond0499
	pop hl
	jr nc, .asm_d0375
	ret
; d0392

Functiond0392: ; d0392
	ld a, [$d187]
	and $f8
	rrca
	rrca
	rrca
	ld e, a
	ld d, $0
	ld hl, $d188
	add hl, de
	ld b, [hl]
	ld a, [$d187]
	and $7
	jr z, .asm_d03b0
	ld c, a
	ld a, b
.asm_d03ab
	rrca
	dec c
	jr nz, .asm_d03ab
	ld b, a

.asm_d03b0
	xor a
	bit 0, b
	jr z, .asm_d03b7
	ld a, $1

.asm_d03b7
	ld b, a
	ld hl, $d187
	inc [hl]
	ret
; d03bd

Functiond03bd: ; d03bd
	push af
	call Functiond03cd
	pop af
	push hl
	call Functiond03f7
	ld hl, $d16e
	add [hl]
	pop hl
	ld [hl], a
	ret
; d03cd

Functiond03cd: ; d03cd
	call Functiond046c
	ld a, [$d186]
	ld bc, $0014
	call AddNTimes
	ld a, [$c2c6]
	and a
	jr nz, .asm_d03e8
	ld a, [$d185]
	ld e, a
	ld d, $0
	add hl, de
	jr .asm_d03f3

.asm_d03e8
	ld a, [$d185]
	ld e, a
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc $0
	ld h, a

.asm_d03f3
	ret
; d03f4

INCBIN "baserom.gbc",$d03f4,$d03f7 - $d03f4

Functiond03f7: ; d03f7
	push af
	ld a, [$d171]
	cp $5
	jr z, .asm_d0405
	cp $6
	jr z, .asm_d041a
	pop af
	ret

.asm_d0405
	pop af
	cp $19
	jr nc, .asm_d0417
	push hl
	push de
	ld hl, $442f
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.asm_d0417
	add $18
	ret

.asm_d041a
	pop af
	cp $24
	jr nc, .asm_d042c
	push hl
	push de
	ld hl, $4448
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.asm_d042c
	add $d
	ret
; d042f

INCBIN "baserom.gbc",$d042f,$d046c - $d042f

Functiond046c: ; d046c
	ld hl, $d16f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$d171]
	ld de, $0000
	ld bc, $0006
	cp $7
	jr z, .asm_d048f
	ld de, $0015
	ld bc, $0019
	cp $6
	jr z, .asm_d048f
	ld de, $0029
	ld bc, $002d

.asm_d048f
	ld a, [$c2c6]
	and a
	jr nz, .asm_d0497
	add hl, de
	ret

.asm_d0497
	add hl, bc
	ret
; d0499

Functiond0499: ; d0499
	ld a, [$d186]
	inc a
	ld [$d186], a
	ld c, a
	ld a, [$d171]
	cp c
	jr nz, .asm_d04bb
	xor a
	ld [$d186], a
	ld a, [$d185]
	inc a
	ld [$d185], a
	ld c, a
	ld a, [$d171]
	cp c
	jr nz, .asm_d04bb
	scf
	ret

.asm_d04bb
	xor a
	ret
; d04bd

Functiond04bd: ; d04bd
	call Functiond04f6
	ld a, [$c2c6]
	and a
	jr nz, .asm_d04ce
	ld de, $0001
	ld bc, $0000
	jr .asm_d04d4

.asm_d04ce
	ld de, rIE
	ld bc, $0006

.asm_d04d4
	ld hl, $d16f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, $7
	ld b, $7
	ld a, [$d16e]
.asm_d04e2
	push bc
	push hl
	push de
	ld de, $0014
.asm_d04e8
	ld [hl], a
	inc a
	add hl, de
	dec b
	jr nz, .asm_d04e8
	pop de
	pop hl
	add hl, de
	pop bc
	dec c
	jr nz, .asm_d04e2
	ret
; d04f6

Functiond04f6: ; d04f6
	ld hl, $d16f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $7
	ld c, $7
	call ClearBox
	ret
; d0504

Functiond0504: ; d0504
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	xor a
	ld [hBGMapMode], a
	call Functiond051b
	callba Function104047
	pop af
	ld [rSVBK], a
	ret
; d051b

Functiond051b: ; d051b
	call Functiond0551
	ld b, $7
	ld c, $7
	ld de, $0014
.asm_d0525
	push bc
	push hl
.asm_d0527
	ld a, [hl]
	or $8
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_d0527
	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .asm_d0525
	ret
; d0536

Functiond0536: ; d0536
	call Functiond0551
	ld b, $7
	ld c, $7
	ld de, $0014
.asm_d0540
	push bc
	push hl
.asm_d0542
	ld a, [hl]
	and $f7
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_d0542
	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .asm_d0540
	ret
; d0551

Functiond0551: ; d0551
	ld hl, $d16f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $0939
	add hl, de
	ret
; d055c

Functiond055c: ; d055c
	call Functiond02f2
	jr z, .asm_d0597
	ld c, $34
	ld hl, UnownAnimationPointers
	ld de, UnownAnimationExtraPointers
	call Functiond02ec
	jr z, .asm_d0576
	ld c, $34
	ld hl, AnimationPointers
	ld de, AnimationExtraPointers

.asm_d0576
	ld a, [$d172]
	and a
	jr z, .asm_d057e
	ld h, d
	ld l, e

.asm_d057e
	ld a, [$d16d]
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, c
	ld [$d174], a
	call GetFarHalfword
	ld a, l
	ld [$d175], a
	ld a, h
	ld [$d176], a
	ret

.asm_d0597
	ld hl, EggAnimation
	ld c, $34
	ld a, [$d172]
	and a
	jr z, .asm_d05a7
	ld hl, EggAnimationExtra
	ld c, $34

.asm_d05a7
	ld a, c
	ld [$d174], a
	ld a, l
	ld [$d175], a
	ld a, h
	ld [$d176], a
	ret
; d05b4

Functiond05b4: ; d05b4
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BasePicSize]
	and $f
	ld c, a
	pop af
	ld [rSVBK], a
	ret
; d05ce

Functiond05ce: ; d05ce
	call Functiond02f2
	jr z, .asm_d0609
	call Functiond02ec
	ld b, $36
	ld c, $36
	ld hl, PikachuAnimationExtra
	jr z, .asm_d05ef
	ld a, [$d16b]
	cp $98
	ld b, $35
	ld c, $35
	ld hl, $4000
	jr c, .asm_d05ef
	ld c, $36

.asm_d05ef
	ld a, c
	ld [$d177], a
	ld a, [$d16d]
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, b
	call GetFarHalfword
	ld a, l
	ld [$d178], a
	ld a, h
	ld [$d179], a
	ret

.asm_d0609
	ld hl, $598b
	ld c, $36
	ld a, c
	ld [$d177], a
	ld a, l
	ld [$d178], a
	ld a, h
	ld [$d179], a
	ret
; d061b

Functiond061b: ; d061b
	call Functiond02f2
	jr z, .asm_d064a
	call Functiond02ec
	ld a, $34
	ld hl, UnownBitmasksPointers
	jr z, .asm_d062f
	ld a, $34
	ld hl, BitmasksPointers

.asm_d062f
	ld [$d17a], a
	ld a, [$d16d]
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [$d17a]
	call GetFarHalfword
	ld a, l
	ld [$d17b], a
	ld a, h
	ld [$d17c], a
	ret

.asm_d064a
	ld c, $34
	ld hl, EggBitmasks
	ld a, c
	ld [$d17a], a
	ld a, l
	ld [$d17b], a
	ld a, h
	ld [$d17c], a
	ret
; d065c

Functiond065c: ; d065c
	call Functiond02ec
	jr z, .asm_d0665
	ld a, [$d16b]
	ret

.asm_d0665
	ld a, [$d16c]
	ret
; d0669

Functiond0669: ; d0669
	ld a, $1
	ld [$c2c6], a

Functiond066e: ; d066e
	call Functiond01c6
	jr c, .asm_d068c
	ld h, d
	ld l, e
	push bc
	push hl
	ld de, VTiles2
	ld a, $3e
	call Predef
	pop hl
	pop bc
	ld d, $0
	ld e, c
	call Functiond008e
	xor a
	ld [$c2c6], a
	ret

.asm_d068c
	xor a
	ld [$c2c6], a
	inc a
	ld [CurPartySpecies], a
	ret
; d0695


