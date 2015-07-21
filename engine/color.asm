
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
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	pop bc
	pop de
	ld a, c
	ld [wcda9 + 3], a
	ld a, b
	ld [wcda9 + 4], a
	ld a, e
	ld [wcda9 + 5], a
	ld a, d
	ld [wcda9 + 6], a
	ld hl, wcda9
	call Function9809
	ld hl, BlkPacket_9a86
	call Function9809
	ret
; 8ad1


Function8ad1: ; 8ad1
	ld hl, PalPacket_9c56 + 1
	call Function9610
	call Function971a
	call Function9699
	ret
; 8ade

Function8ade: ; 8ade
	ld hl, wcd9b
	ld a, [wcda9]
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
	ld hl, wcda9 + 10
	ld bc, $0006
	ld a, [wcda9]
	call AddNTimes
	pop de
	ld [hl], e
	ret
; 8b07

Function8b07: ; 8b07
	call CheckCGB
	ret z
	ld hl, Palette8b2f
	ld de, Unkn1Pals
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
	ld hl, BlkPacket_9a86
	jp Function9809
; 8b4d

Function8b4d: ; 8b4d
	call CheckCGB
	jr nz, .asm_8b5c
	ld a, [hSGB]
	and a
	ret z
	ld hl, PalPacket_9c26
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
	ld hl, PalPacket_9c36
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
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	pop af
	call Function9775
	ld a, [hli]
	ld [wcda9 + 3], a
	ld a, [hli]
	ld [wcda9 + 4], a
	ld a, [hli]
	ld [wcda9 + 5], a
	ld a, [hl]
	ld [wcda9 + 6], a
	ld hl, wcda9
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
	jr asm_8bd7

Function8bc6:
	ld a, [CurPartySpecies]
	call Function97ee
	ld a, e
	bit 7, a
	jr z, .asm_8bd7
	and $7f
rept 4
	inc hl
endr
.asm_8bd7

asm_8bd7
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
	ld a, [EnemySafeguardCount]
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
	ld a, [wd10a]
	and a
	jr z, .asm_8c52
	cp $1
	jr z, .asm_8c57
	cp $2
	jr z, .asm_8c70
	ret

.asm_8c52
	ld de, BGPals + $10 + 2
	jr .asm_8c5a

.asm_8c57
	ld de, BGPals + $18 + 2

.asm_8c5a
	ld l, c
	ld h, $0
rept 2
	add hl, hl
endr
	ld bc, Palettes_a8be
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
	hlcoord 11, 1, AttrMap
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
	ld hl, Unknown_8f6a
	ld b, 0
	dec c
rept 2
	add hl, bc
endr
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [hli]
	ld [Unkn1Pals], a
	ld [Unkn1Pals + 8 * 2], a
	ld a, [hl]
	ld [Unkn1Pals + 1], a
	ld [Unkn1Pals + 8 * 2 + 1], a
	pop af
	ld [rSVBK], a
	call Function96a4
	ld a, $1
	ret
; 8cb4

Function8cb4: ; 8cb4
	ld l, e
	ld h, 0
rept 3
	add hl, hl
endr
	ld de, Palettes_8d05
	add hl, de
	call CheckCGB
	jr nz, .asm_8cf0
	push hl
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	pop hl
rept 2
	inc hl
endr
	ld a, [hli]
	ld [wcda9 + 3], a
	ld a, [hli]
	ld [wcda9 + 4], a
	ld a, [hli]
	ld [wcda9 + 5], a
	ld a, [hli]
	ld [wcda9 + 6], a
	ld hl, wcda9
	call Function9809
	ld hl, BlkPacket_9a86
	call Function9809
	ret

.asm_8cf0
	ld de, Unkn1Pals
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM
	call Function96a4
	call Function9699
	call Function96b3
	ret
; 8d05

Palettes_8d05: ; 8d05
	RGB 20, 31, 11
	RGB 31, 19, 00
	RGB 31, 10, 09
	RGB 00, 00, 00

	RGB 15, 20, 31
	RGB 30, 26, 00
	RGB 31, 12, 00
	RGB 00, 00, 00

	RGB 24, 17, 31
	RGB 30, 26, 00
	RGB 08, 11, 31
	RGB 00, 00, 00

	RGB 31, 25, 17
	RGB 31, 18, 04
	RGB 28, 12, 05
	RGB 00, 00, 00

	RGB 19, 26, 31
	RGB 31, 05, 08
	RGB 31, 09, 31
	RGB 00, 00, 00

	RGB 31, 19, 28
	RGB 31, 21, 00
	RGB 12, 22, 00
	RGB 00, 00, 00

	RGB 19, 17, 23
	RGB 30, 26, 00
	RGB 31, 12, 00
	RGB 00, 00, 00

	RGB 07, 26, 31
	RGB 26, 26, 27
	RGB 31, 11, 11
	RGB 00, 00, 00

	RGB 21, 31, 21
	RGB 30, 26, 00
	RGB 31, 12, 00
	RGB 00, 00, 00

	RGB 07, 26, 31
	RGB 31, 31, 00
	RGB 00, 21, 00
	RGB 00, 00, 00
; 8d55

INCLUDE "predef/cgb.asm"


Function95f0: ; 95f0
	ld hl, Palette_9608
	ld de, Unkn1Pals
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM
	call Function96a4
	call Function9699
	call Function96b3
	ret
; 9608

Palette_9608: ; 9608
	RGB 31, 31, 31
	RGB 09, 31, 31
	RGB 10, 12, 31
	RGB 00, 03, 19
; 9610


Function9610: ; 9610
	ld de, Unkn1Pals
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
rept 3
	add hl, hl
endr
	ld bc, Palettes_9df6
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
	ld hl, Unkn1Pals
	ld c, $8
.asm_9683
	ld a, $ff
rept 4
	ld [hli], a
endr
	xor a
rept 4
	ld [hli], a
endr
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
	ld hl, Unkn1Pals
	ld de, BGPals
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
	ld hl, wcd9b
	ld a, [wcda9]
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	inc a
	ld e, a
	hlcoord 11, 2, AttrMap
	ld bc, $0028
	ld a, [wcda9]
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
	ld hl, Palettes_b681
	ld de, Unkn2Pals
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
	ld a, [wd45b]
	bit 2, a
	jr nz, .asm_9760
	ld a, [PlayerGender]
	and a
	jr z, .asm_9760
	ld hl, KrisPalette
	ret

.asm_9760
	ld hl, PlayerPalette
	ret
; 9764

Function9764: ; 9764
	and a
	jp nz, Function97f9
	ld a, [TrainerClass]

Function976b: ; 976b
	ld l, a
	ld h, 0
rept 2
	add hl,hl
endr
	ld bc, TrainerPalettes
	add hl, bc
	ret
; 9775

Function9775: ; 9775
	call Function97ee
	ret
; 9779

Function9779: ; 9779
	ret
; 977a

Function977a: ; 977a
	call CheckCGB
	ret z
	ld hl, Palettes_979c
	ld a, $90
	ld [rOBPI], a
	ld c, $30
.asm_9787
	ld a, [hli]
	ld [rOBPD], a
	dec c
	jr nz, .asm_9787
	ld hl, Palettes_979c
	ld de, Unkn2Pals + 8 * 2
	ld bc, $0010
	ld a, $5
	call FarCopyWRAM
	ret
; 979c

Palettes_979c: ; 979c
	RGB 31, 31, 31
	RGB 25, 25, 25
	RGB 13, 13, 13
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 05, 14, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 08, 12, 31
	RGB 01, 04, 31
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 24, 18, 07
	RGB 20, 15, 03
	RGB 00, 00, 00
; 97cc

Function97cc: ; 97cc
	call CheckCGB
	ret z
	ld a, $90
	ld [rOBPI], a
	ld a, $1c
	call Function9625
	call Function97e5
	ld a, $21
	call Function9625
	call Function97e5
	ret
; 97e5

Function97e5: ; 97e5
	ld c, $8
.asm_97e7
	ld a, [hli]
	ld [rOBPD], a
	dec c
	jr nz, .asm_97e7
	ret
; 97ee

Function97ee: ; 97ee
	ld l, a
	ld h, $0
rept 3
	add hl, hl
endr
	ld bc, PokemonPalettes
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
rept 4
	inc hl
endr
	ret
; 9809

Function9809: ; 9809
	ld a, [wcfbe]
	push af
	set 7, a
	ld [wcfbe], a
	call Function981a
	pop af
	ld [wcfbe], a
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
	ld a, [wcfbe]
	push af
	set 7, a
	ld [wcfbe], a
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
	ld hl, PalPacket_9d66
	call Function981a

.asm_988a
	pop af
	ld [wcfbe], a
	ei
	ret
; 9890


Function9890:: ; 9890
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
	ld hl, Unkn1Pals
	call Function98df
	ld hl, BGPals
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
	ld hl, Unknown_98ff
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

Unknown_98ff: ; 98ff
	dw PalPacket_9d56
	dw PalPacket_9d76
	dw PalPacket_9d86
	dw PalPacket_9d96
	dw PalPacket_9da6
	dw PalPacket_9db6
	dw PalPacket_9dc6
	dw PalPacket_9dd6
	dw PalPacket_9de6
; 9911

Function9911: ; 9911
	di
	xor a
	ld [rJOYP], a
	ld hl, PalPacket_9d56
	call Function981a
	call Function992c
	call Function9a7a
	call Function993f
	ld hl, PalPacket_9d66
	call Function981a
	ei
	ret
; 992c

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
	ld de, SGBBorderMap
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
	ld hl, PalPacket_9d26
	call Function981a
	call Function9a7a
	ld a, [rJOYP]
	and $3
	cp $3
	jr nz, .asm_99a6
	ld a, $20
	ld [rJOYP], a
rept 2
	ld a, [rJOYP]
endr
	call Function9a7a
	call Function9a7a
	ld a, $30
	ld [rJOYP], a
	call Function9a7a
	call Function9a7a
	ld a, $10
	ld [rJOYP], a
rept 6
	ld a, [rJOYP]
endr
	call Function9a7a
	call Function9a7a
	ld a, $30
	ld [rJOYP], a
rept 3
	ld a, [rJOYP]
endr
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
	ld hl, PalPacket_9d16
	call Function981a
	jp Function9a7a
; 99b4

Function99b4: ; 99b4
	call DisableLCD
	ld a, $e4
	ld [rBGP], a
	ld hl, Palettes_9df6
	ld de, VTiles1
	ld bc, $1000
	call CopyData
	call DrawDefaultTiles
	ld a, $e3
	ld [rLCDC], a
	ld hl, PalPacket_9d06
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
	ld hl, PalPacket_9d46
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
	ld hl, PalPacket_9d36
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

BlkPacket_9a86: ; 9a86
	db $21, $01, $03, $00, $00, $00, $13, $11, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9a96: ; 9a96
	db $21, $01, $07, $05, $00, $0a, $13, $0d, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9aa6: ; 9a86
	db $22, $05, $07, $0a, $00, $0c, $13, $11, $03, $05, $01, $00, $0a, $03, $03, $00
	db $0a, $08, $13, $0a, $03, $0a, $00, $04, $08, $0b, $03, $0f, $0b, $00, $13, $07

BlkPacket_9ac6: ; 9a86
	db $21, $01, $07, $05, $00, $01, $07, $07, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9ad6: ; 9a86
	db $21, $01, $07, $05, $0b, $01, $13, $02, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9ae6: ; 9a86
	db $21, $01, $07, $05, $01, $01, $08, $08, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9af6: ; 9a86
	db $21, $01, $07, $05, $07, $05, $0d, $0b, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9b06: ; 9a86
	db $22, $05, $03, $05, $00, $00, $13, $0b, $03, $0a, $00, $04, $13, $09, $02, $0f
	db $00, $06, $13, $07, $03, $00, $04, $04, $0f, $09, $03, $00, $00, $0c, $13, $11

BlkPacket_9b26: ; 9a86
	db $23, $07, $07, $10, $00, $00, $02, $0c, $02, $00, $0c, $00, $12, $01, $02, $00
	db $0c, $02, $12, $03, $02, $00, $0c, $04, $12, $05, $02, $00, $0c, $06, $12, $07
	db $02, $00, $0c, $08, $12, $09, $02, $00, $0c, $0a, $12, $0b, $00, $00, $00, $00

BlkPacket_9b56: ; 9a86
	db $22, $03, $07, $20, $00, $00, $13, $04, $03, $0f, $00, $06, $13, $11, $03, $05
	db $0f, $01, $12, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9b76: ; 9a86
	db $21, $01, $07, $10, $00, $00, $13, $05, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9b86: ; 9a86
	db $21, $02, $07, $0a, $00, $04, $13, $0d, $03, $05, $00, $06, $13, $0b, $00, $00
; 9b96

; 9b96
PalPacket_9b96:	db $51, $48, $00, $49, $00, $4a, $00, $4b, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9ba6:	db $51, $2b, $00, $24, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9bb6:	db $51, $41, $00, $42, $00, $43, $00, $44, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9bc6:	db $51, $4c, $00, $4c, $00, $4c, $00, $4c, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9bd6:	db $51, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9be6:	db $51, $36, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9bf6:	db $51, $37, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9c06:	db $51, $38, $00, $39, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9c16:	db $51, $3a, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9c26:	db $51, $3b, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9c36:	db $51, $3c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9c46:	db $51, $39, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9c56:	db $51, $2e, $00, $2f, $00, $30, $00, $31, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9c66:	db $51, $1a, $00, $1a, $00, $1a, $00, $1a, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9c76:	db $51, $32, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9c86:	db $51, $3c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9c96:	db $51, $3d, $00, $3e, $00, $3f, $00, $40, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9ca6:	db $51, $33, $00, $34, $00, $1b, $00, $1f, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9cb6:	db $51, $1b, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9cc6:	db $51, $1c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9cd6:	db $51, $35, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9ce6:	db $01, $ff, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9cf6:	db $09, $ff, $7f, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9d06:	db $59, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9d16:	db $89, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9d26:	db $89, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9d36:	db $99, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9d46:	db $a1, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9d56:	db $b9, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9d66:	db $b9, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_9d76:	db $79, $5d, $08, $00, $0b, $8c, $d0, $f4, $60, $00, $00, $00, $00, $00, $00, $00
PalPacket_9d86:	db $79, $52, $08, $00, $0b, $a9, $e7, $9f, $01, $c0, $7e, $e8, $e8, $e8, $e8, $e0
PalPacket_9d96:	db $79, $47, $08, $00, $0b, $c4, $d0, $16, $a5, $cb, $c9, $05, $d0, $10, $a2, $28
PalPacket_9da6:	db $79, $3c, $08, $00, $0b, $f0, $12, $a5, $c9, $c9, $c8, $d0, $1c, $a5, $ca, $c9
PalPacket_9db6:	db $79, $31, $08, $00, $0b, $0c, $a5, $ca, $c9, $7e, $d0, $06, $a5, $cb, $c9, $7e
PalPacket_9dc6:	db $79, $26, $08, $00, $0b, $39, $cd, $48, $0c, $d0, $34, $a5, $c9, $c9, $80, $d0
PalPacket_9dd6:	db $79, $1b, $08, $00, $0b, $ea, $ea, $ea, $ea, $ea, $a9, $01, $cd, $4f, $0c, $d0
PalPacket_9de6:	db $79, $10, $08, $00, $0b, $4c, $20, $08, $ea, $ea, $ea, $ea, $ea, $60, $ea, $ea
; 9df6

Palettes_9df6: ; 9df6
	RGB 31, 31, 31
	RGB 22, 25, 19
	RGB 16, 21, 30
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 27, 28, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 28, 19
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 24, 24
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 23, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 21, 27
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 24, 16
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 25, 30, 26
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 25, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 20, 19
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 26, 19
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 27, 28, 27
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 30, 23
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 24, 29
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 23, 29
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 25, 23, 20
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 26, 18
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 21, 18
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 25, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 22, 21, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 22, 25, 21
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 21, 22
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 20, 20
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 26, 26
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 14, 09
	RGB 15, 20, 20
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 12, 28, 22
	RGB 15, 20, 20
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 07, 07, 07
	RGB 02, 03, 03
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 22, 17
	RGB 16, 14, 19
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 18, 20, 27
	RGB 11, 15, 23
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 20, 10
	RGB 26, 10, 06
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 25, 29
	RGB 14, 19, 25
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 27, 22, 24
	RGB 21, 15, 23
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 28, 20, 15
	RGB 21, 14, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 20, 26, 16
	RGB 09, 20, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 22, 24
	RGB 28, 15, 21
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 28, 14
	RGB 26, 20, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 21, 22
	RGB 15, 15, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 23, 19, 13
	RGB 14, 12, 17
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 18, 21
	RGB 10, 12, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 22, 15, 16
	RGB 17, 02, 05
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 15, 20, 20
	RGB 05, 16, 16
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 23, 15, 19
	RGB 14, 04, 12
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 20, 17, 18
	RGB 18, 13, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 23, 21, 16
	RGB 12, 12, 10
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 25, 29
	RGB 30, 22, 24
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 23, 16
	RGB 29, 14, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 18, 18, 18
	RGB 10, 10, 10
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 26, 15
	RGB 00, 23, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 26, 15
	RGB 31, 23, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 26, 15
	RGB 31, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 26, 19
	RGB 27, 20, 14
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 20, 10
	RGB 21, 00, 04
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 20, 10
	RGB 21, 00, 04
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 26, 16
	RGB 16, 12, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 15, 28, 26
	RGB 12, 22, 26
	RGB 03, 16, 14

	RGB 31, 31, 31
	RGB 15, 28, 26
	RGB 23, 24, 24
	RGB 00, 00, 00

	RGB 31, 31, 24
	RGB 07, 27, 19
	RGB 26, 20, 10
	RGB 19, 12, 08

	RGB 31, 31, 31
	RGB 31, 28, 14
	RGB 31, 13, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 18, 21
	RGB 10, 12, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 23, 21, 16
	RGB 12, 12, 10
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 14, 00
	RGB 07, 11, 15
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 21, 22
	RGB 26, 10, 06
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 27, 04
	RGB 24, 20, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 13, 25
	RGB 24, 20, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 19, 29
	RGB 24, 20, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 22, 24
	RGB 18, 18, 18
	RGB 16, 10, 07

	RGB 31, 31, 31
	RGB 21, 25, 29
	RGB 18, 18, 18
	RGB 16, 10, 07

	RGB 31, 31, 31
	RGB 20, 26, 16
	RGB 18, 18, 18
	RGB 16, 10, 07

	RGB 31, 31, 31
	RGB 31, 28, 14
	RGB 18, 18, 18
	RGB 16, 10, 07

	RGB 31, 31, 31
	RGB 18, 18, 18
	RGB 26, 10, 06
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 22, 24
	RGB 28, 15, 21
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 20, 00
	RGB 16, 19, 29
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 02, 30
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 13, 04
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 28, 04, 02
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 18, 23, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 20, 11
	RGB 18, 13, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 25, 30, 00
	RGB 25, 30, 00

	RGB 00, 00, 00
	RGB 08, 11, 11
	RGB 21, 21, 21
	RGB 31, 31, 31
; a06e

SGBBorderMap: ; a06e
	db $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $14,$14, $15,$14, $16,$14, $17,$14, $17,$54, $16,$54, $15,$54, $14,$54, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14
	db $01,$14, $02,$14, $03,$14, $03,$54, $02,$54, $01,$54, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $24,$14, $25,$14, $26,$14, $07,$14, $07,$54, $26,$54, $25,$54, $24,$54, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$54, $01,$14, $02,$14, $03,$14, $03,$54, $02,$54, $01,$54
	db $11,$14, $12,$14, $13,$14, $13,$54, $12,$54, $11,$54, $10,$54, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $24,$14, $34,$14, $35,$14, $35,$54, $34,$54, $33,$54, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $10,$14, $11,$14, $12,$14, $13,$14, $13,$54, $12,$54, $11,$54
	db $21,$14, $22,$14, $23,$14, $23,$54, $22,$54, $21,$54, $20,$54, $07,$14, $08,$14, $09,$14, $0a,$14, $0b,$14, $0c,$14, $0d,$14, $07,$14, $07,$14, $18,$14, $09,$14, $1a,$14, $1b,$14, $0d,$14, $0c,$14, $1c,$14, $29,$14, $07,$14, $20,$14, $21,$14, $22,$14, $23,$14, $23,$54, $22,$54, $21,$54
	db $31,$14, $32,$14, $07,$14, $07,$14, $32,$54, $36,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $38,$10, $27,$10, $32,$14, $07,$54, $07,$54, $32,$54, $31,$54
	db $05,$14, $06,$14, $07,$14, $07,$54, $06,$54, $1f,$10,                                                                                                                                                                                     $37,$10, $06,$14, $07,$14, $07,$54, $06,$54, $05,$54
	db $15,$14, $16,$14, $17,$14, $17,$54, $16,$54, $1f,$10,                                                                                                                                                                                     $37,$10, $16,$14, $17,$14, $17,$54, $16,$54, $15,$54
	db $25,$14, $26,$14, $07,$14, $07,$54, $26,$54, $1f,$10,                                                                                                                                                                                     $37,$10, $26,$14, $07,$14, $07,$54, $26,$54, $25,$54
	db $33,$14, $34,$14, $35,$14, $35,$54, $34,$54, $1f,$10,                                                                                                                                                                                     $37,$10, $34,$14, $35,$14, $35,$54, $34,$54, $33,$54
	db $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $1f,$10,                                                                                                                                                                                     $37,$10, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14
	db $02,$54, $01,$54, $07,$54, $07,$14, $07,$14, $1f,$10,                                                                                                                                                                                     $37,$10, $07,$14, $07,$14, $07,$14, $01,$14, $02,$14
	db $12,$54, $11,$54, $10,$54, $07,$14, $07,$14, $1f,$10,                                                                                                                                                                                     $37,$10, $07,$14, $07,$14, $10,$14, $11,$14, $12,$14
	db $22,$54, $21,$54, $20,$54, $07,$14, $07,$14, $1f,$10,                                                                                                                                                                                     $37,$10, $07,$14, $07,$14, $20,$14, $21,$14, $22,$14
	db $32,$54, $31,$54, $30,$54, $07,$14, $07,$14, $1f,$10,                                                                                                                                                                                     $37,$10, $07,$14, $07,$14, $30,$14, $31,$14, $32,$14
	db $06,$54, $05,$54, $04,$54, $07,$14, $07,$14, $1f,$10,                                                                                                                                                                                     $37,$10, $07,$14, $07,$14, $04,$14, $05,$14, $06,$14
	db $16,$54, $15,$54, $14,$54, $07,$14, $07,$14, $1f,$10,                                                                                                                                                                                     $37,$10, $07,$14, $07,$14, $14,$14, $15,$14, $16,$14
	db $26,$54, $25,$54, $24,$54, $07,$14, $07,$14, $1f,$10,                                                                                                                                                                                     $37,$10, $07,$14, $07,$14, $24,$14, $25,$14, $26,$14
	db $34,$54, $33,$54, $07,$54, $07,$14, $07,$14, $1f,$10,                                                                                                                                                                                     $37,$10, $07,$14, $07,$14, $07,$14, $33,$14, $34,$14
	db $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $1f,$10,                                                                                                                                                                                     $37,$10, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14
	db $01,$14, $02,$14, $03,$14, $03,$54, $02,$54, $1f,$10,                                                                                                                                                                                     $37,$10, $02,$14, $03,$14, $03,$54, $02,$54, $01,$54
	db $11,$14, $12,$14, $13,$14, $13,$54, $12,$54, $1f,$10,                                                                                                                                                                                     $37,$10, $12,$14, $13,$14, $13,$54, $12,$54, $11,$54
	db $21,$14, $22,$14, $23,$14, $23,$54, $22,$54, $1f,$10,                                                                                                                                                                                     $37,$10, $22,$14, $23,$14, $23,$54, $22,$54, $21,$54
	db $31,$14, $32,$14, $07,$14, $07,$14, $32,$54, $1f,$10,                                                                                                                                                                                     $37,$10, $32,$14, $07,$54, $07,$54, $32,$54, $31,$54
	db $05,$14, $06,$14, $07,$14, $07,$54, $06,$54, $2e,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2f,$10, $2d,$10, $06,$14, $07,$14, $07,$54, $06,$54, $05,$54
	db $15,$14, $16,$14, $17,$14, $17,$54, $16,$54, $15,$54, $14,$54, $07,$14, $07,$14, $39,$14, $0e,$14, $09,$14, $0f,$14, $28,$14, $07,$14, $19,$14, $0c,$14, $1c,$14, $29,$14, $2a,$14, $2b,$14, $2c,$14, $39,$14, $07,$14, $07,$14, $14,$14, $15,$14, $16,$14, $17,$14, $17,$54, $16,$54, $15,$54
	db $25,$14, $26,$14, $07,$14, $07,$54, $26,$54, $25,$54, $24,$54, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $01,$14, $02,$14, $03,$14, $03,$54, $02,$54, $01,$54, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $24,$14, $25,$14, $26,$14, $07,$14, $07,$54, $26,$54, $25,$54
	db $33,$14, $34,$14, $35,$14, $35,$54, $34,$54, $24,$54, $07,$54, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $10,$14, $11,$14, $12,$14, $13,$14, $13,$54, $12,$54, $11,$54, $10,$54, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $24,$14, $34,$14, $35,$14, $35,$54, $34,$54, $33,$54
	db $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $20,$14, $21,$14, $22,$14, $23,$14, $23,$54, $22,$54, $21,$54, $20,$54, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14, $07,$14
; a49e

SGBBorderPalettes: ; a49e
	RGB 24, 06, 06
	RGB 24, 24, 26
	RGB 14, 15, 20
	RGB 04, 07, 10

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25

	RGB 18, 24, 18
	RGB 31, 26, 15
	RGB 26, 19, 10
	RGB 12, 07, 05

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25

	RGB 18, 06, 31
	RGB 31, 31, 29
	RGB 31, 12, 00
	RGB 00, 00, 00

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25

	RGB 12, 31, 06
	RGB 22, 26, 30
	RGB 16, 17, 21
	RGB 00, 03, 00

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25

	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
	RGB 31, 31, 25
; a51e

SGBBorder: ; a51e
INCBIN "gfx/misc/sgb_border.2bpp"
; a8be

Palettes_a8be: ; a8be
	RGB 30, 26, 15
	RGB 00, 23, 00

	RGB 30, 26, 15
	RGB 31, 21, 00

	RGB 30, 26, 15
	RGB 31, 00, 00

Palettes_a8ca: ; a8ca
	RGB 30, 26, 15
	RGB 04, 17, 31
; a8ce

; a8ce
INCLUDE "gfx/pics/palette_pointers.asm"
; b0ce

; b0ce
INCLUDE "gfx/trainers/palette_pointers.asm"
; b1de

Functionb1de: ; b1de
	callba Function494ac
	jr c, .asm_b230

	ld a, [wPermission]
	and 7
	ld e, a
	ld d, 0
	ld hl, Unknown_b279
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [TimeOfDayPal]
	and 3
rept 3
	add a
endr
	ld e, a
	ld d, 0
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
	ld h, 0
rept 3
	add hl,hl
endr
	ld de, TilesetBGPalette
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld c, 8
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
	and 3
	ld bc, $40
	ld hl, MapObjectPals
	call AddNTimes
	ld de, Unkn2Pals
	ld bc, $40
	ld a, $5 ; BANK(Unkn2Pals)
	call FarCopyWRAM

	ld a, [wPermission]
	cp 1
	jr z, .asm_b253
	cp 2
	ret nz
.asm_b253
	ld a, [MapGroup]
	ld l, a
	ld h, 0
rept 3
	add hl,hl
endr
	ld de, RoofPals
	add hl, de
	ld a, [TimeOfDayPal]
	and 3
	cp NITE
	jr c, .asm_b26d
rept 4
	inc hl
endr
.asm_b26d
	ld de, Unkn1Pals + 8 * 6 + 2
	ld bc, 4
	ld a, $5
	call FarCopyWRAM
	ret
; b279

Unknown_b279: ; b279
	dw TilesetColors1
	dw TilesetColors1
	dw TilesetColors1
	dw TilesetColors2
	dw TilesetColors3
	dw TilesetColors4
	dw TilesetColors2
	dw TilesetColors3
; b289

TilesetColors1: ; b289
	db $00, $01, $02, $28, $04, $05, $06, $07
	db $08, $09, $0a, $28, $0c, $0d, $0e, $0f
	db $10, $11, $12, $29, $14, $15, $16, $17
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f

TilesetColors2: ; b289
	db $20, $21, $22, $23, $24, $25, $26, $07
	db $20, $21, $22, $23, $24, $25, $26, $07
	db $10, $11, $12, $13, $14, $15, $16, $07
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $07

TilesetColors3: ; b289
	db $00, $01, $02, $03, $04, $05, $06, $07
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
	db $10, $11, $12, $13, $14, $15, $16, $17
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f

TilesetColors4: ; b289
	db $00, $01, $02, $03, $04, $05, $06, $07
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
	db $10, $11, $12, $13, $14, $15, $16, $17
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f
; b309

Palette_b309: ; b309
	RGB 31, 31, 31
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 00, 00, 00
; b311

Palette_b311: ; b311
	RGB 31, 31, 31
	RGB 17, 19, 31
	RGB 14, 16, 31
	RGB 00, 00, 00
; b319

TilesetBGPalette: ; b319
INCLUDE "tilesets/bg.pal"

MapObjectPals:: ; b469
INCLUDE "tilesets/ob.pal"

RoofPals: ; b569
INCLUDE "tilesets/roof.pal"

Palettes_b641: ; b641
	RGB 27, 31, 27
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 07, 06
	RGB 20, 02, 03
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 10, 31, 09
	RGB 04, 14, 01
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 08, 12, 31
	RGB 01, 04, 31
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 22, 16, 08
	RGB 13, 07, 01
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 15, 31, 31
	RGB 05, 17, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 11, 11, 19
	RGB 07, 07, 12
	RGB 00, 00, 00
; b681

Palettes_b681: ; b681
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 10, 14, 20
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 04
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 05, 14, 00
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 08, 12, 31
	RGB 01, 04, 31
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 24, 18, 07
	RGB 20, 15, 03
	RGB 07, 07, 07

Palettes_b6f1: ; b6f1
	RGB 31, 31, 31
	RGB 18, 23, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 22, 00, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 25, 22, 00
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 23, 26, 31
	RGB 18, 23, 31
	RGB 00, 00, 00

Palettes_b719: ; b719
	RGB 31, 31, 31
	RGB 07, 06, 03
	RGB 07, 06, 03
	RGB 07, 06, 03

	RGB 31, 31, 31
	RGB 31, 31, 00
	RGB 26, 22, 00
	RGB 00, 00, 00
; b729

Palettes_b729: ; b729
	RGB 28, 31, 20
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 00, 00, 31
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 31, 15, 00
	RGB 15, 07, 00
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 00, 00, 31
	RGB 31, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 31, 00, 00
; b759

Palettes_b759: ; b759
	RGB 28, 31, 20
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 00, 00, 31
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 10, 18, 31
	RGB 13, 06, 31
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 00, 00, 31
	RGB 31, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 31, 00, 00
; b789

Palettes_b789: ; b789
	RGB 31, 31, 31
	RGB 30, 22, 24
	RGB 18, 18, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 10, 11, 31
	RGB 18, 18, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 12, 31, 11
	RGB 18, 18, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 26, 05
	RGB 18, 18, 18
	RGB 00, 00, 00
; b7a9

Palettes_b7a9: ; b7a9
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
