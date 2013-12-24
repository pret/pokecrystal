
INCLUDE "predef/sgb.asm"


CheckShininess: ; 8a68
; Check if a mon is shiny by DVs at bc.
; Return carry if shiny.

	ld l, c
	ld h, b

; Attack
	ld a, [hl]
	and %0010 << 4
	jr z, .NotShiny

; Defense
	ld a, [hli]
	and %1111
	cp  %1010
	jr nz, .NotShiny

; Speed
	ld a, [hl]
	and %1111 << 4
	cp  %1010 << 4
	jr nz, .NotShiny

; Special
	ld a, [hl]
	and %1111
	cp  %1010
	jr nz, .NotShiny

.Shiny
	scf
	ret

.NotShiny
	and a
	ret
; 8a88


CheckContestMon: ; 8a88
; Check a mon's DVs at hl in the bug catching contest.
; Return carry if its DVs are good enough to place in the contest.

; Attack
	ld a, [hl]
	cp 10 << 4
	jr c, .Bad

; Defense
	ld a, [hli]
	and $f
	cp 10
	jr c, .Bad

; Speed
	ld a, [hl]
	cp 10 << 4
	jr c, .Bad

; Special
	ld a, [hl]
	and $f
	cp 10
	jr c, .Bad

.Good
	scf
	ret

.Bad
	and a
	ret
; 8aa4


Function8aa4: ; 8aa4
	push de
	push bc
	ld hl, $5ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	pop bc
	pop de
	ld a, c
	ld [$cdac], a
	ld a, b
	ld [$cdad], a
	ld a, e
	ld [$cdae], a
	ld a, d
	ld [$cdaf], a
	ld hl, $cda9
	call Function9809
	ld hl, $5a86
	call Function9809
	ret
; 8ad1


Function8ad1: ; 8ad1
	ld hl, $5c57
	call Function9610
	call Function971a
	call Function9699
	ret
; 8ade

Function8ade: ; 8ade
	ld hl, $cd9b
	ld a, [$cda9]
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	and a
	ld e, $5
	jr z, .asm_8af7
	dec a
	ld e, $a
	jr z, .asm_8af7
	ld e, $f

.asm_8af7
	push de
	ld hl, $cdb3
	ld bc, $0006
	ld a, [$cda9]
	call AddNTimes
	pop de
	ld [hl], e
	ret
; 8b07

Function8b07: ; 8b07
	call CheckCGB
	ret z
	ld hl, Palette8b2f
	ld de, $d000
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM

	ld hl, Palette8b37
	ld de, MartPointer
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM

	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 8b2f

Palette8b2f: ; 8b2f
	RGB 31, 31, 31
	RGB 18, 23, 31
	RGB 15, 20, 31
	RGB 00, 00, 00
; 8b37

Palette8b37: ; 8b37
	RGB 31, 31, 31
	RGB 31, 31, 12
	RGB 08, 16, 28
	RGB 00, 00, 00
; 8b3f

Function8b3f: ; 8b3f
	call CheckCGB
	ret nz
	ld a, [hSGB]
	and a
	ret z
	ld hl, $5a86
	jp Function9809
; 8b4d

Function8b4d: ; 8b4d
	call CheckCGB
	jr nz, .asm_8b5c
	ld a, [hSGB]
	and a
	ret z
	ld hl, $5c26
	jp Function9809

.asm_8b5c
	ld de, Unkn2Pals
	ld a, $3b
	call Function9625
	jp Function9630
; 8b67

Function8b67: ; 8b67
	call CheckCGB
	jr nz, .asm_8b76
	ld a, [hSGB]
	and a
	ret z
	ld hl, $5c36
	jp Function9809

.asm_8b76
	ld de, Unkn2Pals
	ld a, $3c
	call Function9625
	jp Function9630
; 8b81

Function8b81: ; 8b81
	call CheckCGB
	jr nz, .asm_8bb2
	ld a, [hSGB]
	and a
	ret z
	ld a, c
	push af
	ld hl, $5ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	pop af
	call Function9775
	ld a, [hli]
	ld [$cdac], a
	ld a, [hli]
	ld [$cdad], a
	ld a, [hli]
	ld [$cdae], a
	ld a, [hl]
	ld [$cdaf], a
	ld hl, $cda9
	jp Function9809

.asm_8bb2
	ld de, Unkn2Pals
	ld a, c
	call Function9775
	call Function9643
	ret
; 8bbd

Function8bbd: ; 8bbd
	ld a, [TrainerClass]
	call Function976b
	ld a, e
	jr .asm_8bd7

	ld a, [CurPartySpecies]
	call Function97ee
	ld a, e
	bit 7, a
	jr z, .asm_8bd7
	and $7f
	inc hl
	inc hl
	inc hl
	inc hl

.asm_8bd7
	push hl
	ld hl, Unkn1Pals
	ld de, $0008
.asm_8bde
	and a
	jr z, .asm_8be5
	add hl, de
	dec a
	jr .asm_8bde

.asm_8be5
	ld e, l
	ld d, h
	pop hl
	call Function9643
	ret
; 8bec

Function8bec: ; 8bec
	ld a, [hCGB]
	and a
	jr nz, .asm_8bf7
	ld hl, PlayerLightScreenCount
	jp Function9809

.asm_8bf7
	ld a, [EnemyLightScreenCount]
	ld c, a
	ld a, [EnemyReflectCount]
	ld hl, AttrMap
	ld de, $0014
.asm_8c04
	and a
	jr z, .asm_8c0b
	add hl, de
	dec a
	jr .asm_8c04

.asm_8c0b
	ld b, $0
	add hl, bc
	ld bc, $0604
	ld a, [$c705]
	and $3
	call Function9663
	call Function323d
	ret
; 8c1d

Function8c1d: ; 8c1d
	call CheckCGB
	ret z
	ld a, e
	and a
	jr z, .asm_8c2d
	ld a, [CurPartySpecies]
	call Function9775
	jr .asm_8c33

.asm_8c2d
	ld a, [TrainerClass]
	call Function976b

.asm_8c33
	ld de, Unkn1Pals
	call Function9643
	call Function9699
	call Function96b3
	call Function96a4
	ret
; 8c43

Function8c43: ; 8c43
	ld a, [$d10a]
	and a
	jr z, .asm_8c52
	cp $1
	jr z, .asm_8c57
	cp $2
	jr z, .asm_8c70
	ret

.asm_8c52
	ld de, $d092
	jr .asm_8c5a

.asm_8c57
	ld de, $d09a

.asm_8c5a
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, $68be
	add hl, bc
	ld bc, $0004
	ld a, $5
	call FarCopyWRAM
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.asm_8c70
	ld e, c
	inc e
	ld hl, $cdf8
	ld bc, $0028
	ld a, [CurPartyMon]
.asm_8c7b
	and a
	jr z, .asm_8c82
	add hl, bc
	dec a
	jr .asm_8c7b

.asm_8c82
	ld bc, $0208
	ld a, e
	call Function9663
	ret
; 8c8a

Function8c8a: ; 8c8a
	call CheckCGB
	ret z
	ld hl, $4f6a
	ld b, $0
	dec c
	add hl, bc
	add hl, bc
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [hli]
	ld [Unkn1Pals], a
	ld [$d010], a
	ld a, [hl]
	ld [$d001], a
	ld [$d011], a
	pop af
	ld [rSVBK], a
	call Function96a4
	ld a, $1
	ret
; 8cb4

Function8cb4: ; 8cb4
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, Data8d05
	add hl, de
	call CheckCGB
	jr nz, .asm_8cf0
	push hl
	ld hl, $5ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	pop hl
	inc hl
	inc hl
	ld a, [hli]
	ld [$cdac], a
	ld a, [hli]
	ld [$cdad], a
	ld a, [hli]
	ld [$cdae], a
	ld a, [hli]
	ld [$cdaf], a
	ld hl, $cda9
	call Function9809
	ld hl, $5a86
	call Function9809
	ret

.asm_8cf0
	ld de, $d000
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM
	call Function96a4
	call Function9699
	call Function96b3
	ret
; 8d05

Data8d05: ; 8d05
INCBIN "baserom.gbc", $8d05, $8d55 - $8d05
; 8d55

INCLUDE "predef/cgb.asm"


INCBIN "baserom.gbc", $95f0, $9610 - $95f0


Function9610: ; 9610
	ld de, $d000
	ld c, $4

Function9615: ; 9615
	push bc
	ld a, [hli]
	push hl
	call Function9625
	call Function9630
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, Function9615
	ret
; 9625

Function9625: ; 9625
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, $5df6
	add hl, bc
	ret
; 9630

Function9630: ; 9630
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld c, $8
.asm_9639
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_9639
	pop af
	ld [rSVBK], a
	ret
; 9643

Function9643: ; 9643
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, $ff
	ld [de], a
	inc de
	ld a, $7f
	ld [de], a
	inc de
	ld c, $4
.asm_9654
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_9654
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	pop af
	ld [rSVBK], a
	ret
; 9663

Function9663: ; 9663
.asm_9663
	push bc
	push hl
.asm_9665
	ld [hli], a
	dec c
	jr nz, .asm_9665
	pop hl
	ld bc, $0014
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_9663
	ret
; 9673

Function9673: ; 9673
	push af
	push bc
	push de
	push hl
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, $d000
	ld c, $8
.asm_9683
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .asm_9683
	pop af
	ld [rSVBK], a
	pop hl
	pop de
	pop bc
	pop af
	ret
; 9699


Function9699: ; 9699
	ld hl, AttrMap
	ld bc, $0168
	xor a
	call ByteFill
	ret
; 96a4

Function96a4: ; 96a4
	ld hl, $d000
	ld de, $d080
	ld bc, $0080
	ld a, $5
	call FarCopyWRAM
	ret
; 96b3

Function96b3: ; 96b3
	ld a, [rLCDC]
	bit 7, a
	jr z, .asm_96d0
	ld a, [hBGMapMode]
	push af
	ld a, $2
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	call DelayFrame
	pop af
	ld [hBGMapMode], a
	ret

.asm_96d0
	ld hl, AttrMap
	ld de, VBGMap0
	ld b, $12
	ld a, $1
	ld [rVBK], a
.asm_96dc
	ld c, $14
.asm_96de
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_96de
	ld a, $c
	add e
	jr nc, .asm_96ea
	inc d

.asm_96ea
	ld e, a
	dec b
	jr nz, .asm_96dc
	ld a, $0
	ld [rVBK], a
	ret
; 96f3

Function96f3: ; 96f3
	ld hl, $cd9b
	ld a, [$cda9]
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	inc a
	ld e, a
	ld hl, $ce0c
	ld bc, $0028
	ld a, [$cda9]
.asm_970b
	and a
	jr z, .asm_9712
	add hl, bc
	dec a
	jr .asm_970b

.asm_9712
	ld bc, $0208
	ld a, e
	call Function9663
	ret
; 971a


Function971a: ; 971a
	ld hl, $7681
	ld de, MartPointer
	ld bc, $0010
	ld a, $5
	call FarCopyWRAM
	ret
; 9729

Function9729: ; 9729
	push de
	callba Function3da85
	ld c, l
	ld b, h
	ld a, [TempBattleMonSpecies]
	call Function974b
	pop de
	ret
; 973a

Function973a: ; 973a
	push de
	callba Function3da97
	ld c, l
	ld b, h
	ld a, [TempEnemyMonSpecies]
	call Function9764
	pop de
	ret
; 974b

Function974b: ; 974b
	and a
	jp nz, Function97f9
	ld a, [$d45b]
	bit 2, a
	jr nz, .asm_9760
	ld a, [PlayerGender]
	and a
	jr z, .asm_9760
	ld hl, FalknerPalette
	ret

.asm_9760
	ld hl, $70ce
	ret
; 9764

Function9764: ; 9764
	and a
	jp nz, Function97f9
	ld a, [TrainerClass]

Function976b: ; 976b
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, $70ce
	add hl, bc
	ret
; 9775

Function9775: ; 9775
	call Function97ee
	ret
; 9779

INCBIN "baserom.gbc", $9779, $97ee - $9779

Function97ee: ; 97ee
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, $68ce
	add hl, bc
	ret
; 97f9

Function97f9: ; 97f9
	push bc
	call Function97ee
	pop bc
	push hl
	call CheckShininess
	pop hl
	ret nc
	inc hl
	inc hl
	inc hl
	inc hl
	ret
; 9809

Function9809: ; 9809
	ld a, [$cfbe]
	push af
	set 7, a
	ld [$cfbe], a
	call Function981a
	pop af
	ld [$cfbe], a
	ret
; 981a

Function981a: ; 981a
	ld a, [hl]
	and $7
	ret z
	ld b, a
.asm_981f
	push bc
	xor a
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	ld b, $10
.asm_9829
	ld e, $8
	ld a, [hli]
	ld d, a
.asm_982d
	bit 0, d
	ld a, $10
	jr nz, .asm_9835
	ld a, $20

.asm_9835
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	rr d
	dec e
	jr nz, .asm_982d
	dec b
	jr nz, .asm_9829
	ld a, $20
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	call Function9a7a
	pop bc
	dec b
	jr nz, .asm_981f
	ret
; 9853

Function9853: ; 9853
	call CheckCGB
	ret nz
	di
	ld a, [$cfbe]
	push af
	set 7, a
	ld [$cfbe], a
	xor a
	ld [rJOYP], a
	ld [hSGB], a
	call Function994a
	jr nc, .asm_988a
	ld a, $1
	ld [hSGB], a
	call Function98eb
	call Function99b4
	call Function9a7a
	call Function993f
	call Function992c
	call Function9a7a
	call Function993f
	ld hl, $5d66
	call Function981a

.asm_988a
	pop af
	ld [$cfbe], a
	ei
	ret
; 9890


Function9890: ; 9890
	call CheckCGB
	ret z
	ld a, $1
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, $2000
	xor a
	call ByteFill
	ld a, $0
	ld [rVBK], a
	ld a, $80
	ld [rBGPI], a
	ld c, $20
.asm_98ac
	ld a, $ff
	ld [rBGPD], a
	ld a, $7f
	ld [rBGPD], a
	dec c
	jr nz, .asm_98ac
	ld a, $80
	ld [rOBPI], a
	ld c, $20
.asm_98bd
	ld a, $ff
	ld [rOBPD], a
	ld a, $7f
	ld [rOBPD], a
	dec c
	jr nz, .asm_98bd
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, $d000
	call Function98df
	ld hl, $d080
	call Function98df
	pop af
	ld [rSVBK], a
	ret
; 98df

Function98df: ; 98df
	ld c, $40
.asm_98e1
	ld a, $ff
	ld [hli], a
	ld a, $7f
	ld [hli], a
	dec c
	jr nz, .asm_98e1
	ret
; 98eb

Function98eb: ; 98eb
	ld hl, $58ff
	ld c, $9
.asm_98f0
	push bc
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	call Function981a
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .asm_98f0
	ret
; 98ff

INCBIN "baserom.gbc", $98ff, $992c - $98ff

Function992c: ; 992c
	call Function9938
	push de
	call Function9a24
	pop hl
	call Function99d8
	ret
; 9938

Function9938: ; 9938
	ld hl, SGBBorder
	ld de, $606e
	ret
; 993f

Function993f: ; 993f
	ld hl, VTiles0
	ld bc, $2000
	xor a
	call ByteFill
	ret
; 994a

Function994a: ; 994a
	ld hl, $5d26
	call Function981a
	call Function9a7a
	ld a, [rJOYP]
	and $3
	cp $3
	jr nz, .asm_99a6
	ld a, $20
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	call Function9a7a
	call Function9a7a
	ld a, $30
	ld [rJOYP], a
	call Function9a7a
	call Function9a7a
	ld a, $10
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	call Function9a7a
	call Function9a7a
	ld a, $30
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	call Function9a7a
	call Function9a7a
	ld a, [rJOYP]
	and $3
	cp $3
	jr nz, .asm_99a6
	call Function99ab
	and a
	ret

.asm_99a6
	call Function99ab
	scf
	ret
; 99ab

Function99ab: ; 99ab
	ld hl, $5d16
	call Function981a
	jp Function9a7a
; 99b4

Function99b4: ; 99b4
	call DisableLCD
	ld a, $e4
	ld [rBGP], a
	ld hl, $5df6
	ld de, VTiles1
	ld bc, $1000
	call CopyData
	call DrawDefaultTiles
	ld a, $e3
	ld [rLCDC], a
	ld hl, $5d06
	call Function981a
	xor a
	ld [rBGP], a
	ret
; 99d8

Function99d8: ; 99d8
	call DisableLCD
	ld a, $e4
	ld [rBGP], a
	ld de, VTiles1
	ld bc, $0140
	call CopyData
	ld b, $12
.asm_99ea
	push bc
	ld bc, $000c
	call CopyData
	ld bc, $0028
	call ClearBytes
	ld bc, $000c
	call CopyData
	pop bc
	dec b
	jr nz, .asm_99ea
	ld bc, $0140
	call CopyData
	ld bc, Start
	call ClearBytes
	ld bc, $0080
	call CopyData
	call DrawDefaultTiles
	ld a, $e3
	ld [rLCDC], a
	ld hl, $5d46
	call Function981a
	xor a
	ld [rBGP], a
	ret
; 9a24

Function9a24: ; 9a24
	call DisableLCD
	ld a, $e4
	ld [rBGP], a
	ld de, VTiles1
	ld b, $80
.asm_9a30
	push bc
	ld bc, $0010
	call CopyData
	ld bc, $0010
	call ClearBytes
	pop bc
	dec b
	jr nz, .asm_9a30
	call DrawDefaultTiles
	ld a, $e3
	ld [rLCDC], a
	ld hl, $5d36
	call Function981a
	xor a
	ld [rBGP], a
	ret
; 9a52

CopyData: ; 0x9a52
; copy bc bytes of data from hl to de
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, CopyData
	ret
; 0x9a5b

ClearBytes: ; 0x9a5b
; clear bc bytes of data starting from de
	xor a
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, ClearBytes
	ret
; 0x9a64

DrawDefaultTiles: ; 0x9a64
; Draw 240 tiles (2/3 of the screen) from tiles in VRAM
	ld hl, VBGMap0 ; BG Map 0
	ld de, 32 - 20
	ld a, $80 ; starting tile
	ld c, 12 + 1
.line
	ld b, 20
.tile
	ld [hli], a
	inc a
	dec b
	jr nz, .tile
; next line
	add hl, de
	dec c
	jr nz, .line
	ret
; 0x9a7a

Function9a7a: ; 9a7a
	ld de, $1b58
.asm_9a7d
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .asm_9a7d
	ret
; 9a86

INCBIN "baserom.gbc", $9a86, $a51e - $9a86

SGBBorder:
INCBIN "gfx/misc/sgb_border.2bpp"

INCBIN "baserom.gbc", $a8be, $a8d6 - $a8be

PokemonPalettes:
INCLUDE "gfx/pics/palette_pointers.asm"

INCBIN "baserom.gbc", $b0ae, $b0d2 - $b0ae

TrainerPalettes:
INCLUDE "gfx/trainers/palette_pointers.asm"

Functionb1de: ; b1de
	callba Function494ac
	jr c, .asm_b230
	ld a, [$d19a]
	and $7
	ld e, a
	ld d, $0
	ld hl, $7279
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [TimeOfDayPal]
	and $3
	add a
	add a
	add a
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Unkn1Pals
	ld b, $8
.asm_b210
	ld a, [de]
	push de
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, MornPal
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld c, $8
.asm_b222
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_b222
	pop de
	inc de
	dec b
	jr nz, .asm_b210
	pop af
	ld [rSVBK], a

.asm_b230
	ld a, [TimeOfDayPal]
	and $3
	ld bc, $0040
	ld hl, $7469
	call AddNTimes
	ld de, Unkn2Pals
	ld bc, $0040
	ld a, $5
	call FarCopyWRAM
	ld a, [$d19a]
	cp $1
	jr z, .asm_b253
	cp $2
	ret nz

.asm_b253
	ld a, [MapGroup]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $7569
	add hl, de
	ld a, [TimeOfDayPal]
	and $3
	cp $2
	jr c, .asm_b26d
	inc hl
	inc hl
	inc hl
	inc hl

.asm_b26d
	ld de, $d032
	ld bc, $0004
	ld a, $5
	call FarCopyWRAM
	ret
; b279

INCBIN "baserom.gbc", $b279, $b319 - $b279

MornPal: ; 0xb319
INCLUDE "tilesets/morn.pal"
; 0xb359

DayPal: ; 0xb359
INCLUDE "tilesets/day.pal"
; 0xb399

NitePal: ; 0xb399
INCLUDE "tilesets/nite.pal"
; 0xb3d9

DarkPal: ; 0xb3d9
INCLUDE "tilesets/dark.pal"
; 0xb419

INCBIN "baserom.gbc", $b419, $b7a9 - $b419

Paletteb7a9: ; b7a9
	RGB 31, 31, 31
	RGB 24, 25, 28
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 10, 06
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 15, 31, 00
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 15, 31
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 15, 21, 31
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 11
	RGB 31, 31, 06
	RGB 24, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 19, 29
	RGB 25, 22, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 10, 06
	RGB 31, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 05, 14, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 30, 10, 06
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 06
	RGB 20, 15, 03
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 06
	RGB 15, 21, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 06
	RGB 20, 15, 03
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 24, 21
	RGB 31, 13, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
; b829

