; Replaces the functionality of sgb.asm to work with CGB hardware.

CheckCGB: ; 8d55
	ld a, [hCGB]
	and a
	ret
; 8d59

Predef_LoadSGBLayoutCGB: ; 8d59
	ld a, b
	cp $ff
	jr nz, .asm_8d61
	ld a, [SGBPredef]

.asm_8d61
	cp -4
	jp z, Function96f3
	call Function9673
	ld l, a
	ld h, 0
	add hl, hl
	ld de, .jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .ReturnFromJumpTable
	push de
	jp [hl]
; 8d79

.ReturnFromJumpTable: ; 8d79
	ret
; 8d7a

.jumptable: ; 8d7a
	dw _CGB00
	dw _CGB01
	dw _CGB02
	dw _CGB03
	dw _CGB04
	dw _CGB05
	dw _CGB06
	dw _CGB07
	dw _CGB08
	dw _CGB09
	dw _CGB0a
	dw _CGB0b
	dw _CGB0c
	dw _CGB0d
	dw _CGB0e
	dw _CGB0f
	dw _CGB10
	dw _CGB11
	dw _CGB12
	dw _CGB13
	dw _CGB14
	dw _CGB15
	dw _CGB16
	dw _CGB17
	dw _CGB18
	dw _CGB19
	dw _CGB1a
	dw _CGB1b
	dw _CGB1c
	dw _CGB1d
	dw _CGB1e
; 8db8

_CGB00: ; 8db8
	ld hl, PalPacket_9c66 + 1
	ld de, wMapPals
	ld c, $4
	call CopyPalettes
	ld hl, PalPacket_9c66 + 1
	ld de, wMapPals + $20
	ld c, $4
	call CopyPalettes
	ld hl, PalPacket_9c66 + 1
	ld de, Unkn2Pals
	ld c, $2
	call CopyPalettes
	jr Function8e23

_CGB01: ; 8ddb
	ld de, wMapPals
	call Function9729
	push hl
	call Function9643
	call Function973a
	push hl
	call Function9643
	ld a, [EnemyHPPal]
	ld l, a
	ld h, $0
rept 2
	add hl, hl
endr
	ld bc, Palettes_a8be
	add hl, bc
	call Function9643
	ld a, [PlayerHPPal]
	ld l, a
	ld h, $0
rept 2
	add hl, hl
endr
	ld bc, Palettes_a8be
	add hl, bc
	call Function9643
	ld hl, Palettes_a8ca
	call Function9643
	ld de, Unkn2Pals
	pop hl
	call Function9643
	pop hl
	call Function9643
	ld a, $1
	ld [SGBPredef], a
	call Function96a4

Function8e23: ; 8e23
	call Function8e85
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $2
	call ByteFill
	hlcoord 0, 4, AttrMap
	lb bc, 8, 10
	ld a, $0
	call FillBoxCGB
	hlcoord 10, 0, AttrMap
	lb bc, 7, 10
	ld a, $1
	call FillBoxCGB
	hlcoord 0, 0, AttrMap
	lb bc, 4, 10
	ld a, $2
	call FillBoxCGB
	hlcoord 10, 7, AttrMap
	lb bc, 5, 10
	ld a, $3
	call FillBoxCGB
	hlcoord 10, 11, AttrMap
	lb bc, 1, 9
	ld a, $4
	call FillBoxCGB
	hlcoord 0, 12, AttrMap
	ld bc, $0078
	ld a, $7
	call ByteFill
	ld hl, Palettes_979c
	ld de, Unkn2Pals + $10
	ld bc, $0030
	ld a, $5
	call FarCopyWRAM
	call Function96b3
	ret
; 8e85


Function8e85: ; 8e85
	callba Function100dc0

Function8e8b: ; 8e8b
	ld hl, Palette_b311
	jr nc, .asm_8e93
	ld hl, Palette_b309

.asm_8e93
	ld de, wMapPals + 8 * 7
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM
	ret
; 8e9f

Function8e9f: ; 8e9f
	callba Function100dc0
	ld hl, Palette_b311
	jr nc, .asm_8ead
	ld hl, Palette_b309

.asm_8ead
	ld de, wMapPals
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM
	ret
; 8eb9

_CGB02: ; 8eb9
	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_8ec5
	ld hl, Palettes_b759
	jr .asm_8ec8

.asm_8ec5
	ld hl, Palettes_b729

.asm_8ec8
	ld de, wMapPals
	ld bc, $0030
	ld a, $5
	call FarCopyWRAM
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 8edb

_CGB03: ; 8edb
	ld de, wMapPals
	ld a, [wcda1]
	ld l, a
	ld h, $0
rept 2
	add hl, hl
endr
	ld bc, Palettes_a8be
	add hl, bc
	call Function9643
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
	call Function974b
	call Function9643
	ld hl, Palettes_a8ca
	call Function9643
	ld hl, Palette8f52
	ld de, wMapPals + 8 * 3
	ld bc, $0018
	ld a, $5
	call FarCopyWRAM
	call Function9699
	hlcoord 0, 0, AttrMap
	lb bc, 8, SCREEN_WIDTH
	ld a, $1
	call FillBoxCGB
	hlcoord 10, 16, AttrMap
	ld bc, $000a
	ld a, $2
	call ByteFill
	hlcoord 13, 5, AttrMap
	lb bc, 2, 2
	ld a, $3
	call FillBoxCGB
	hlcoord 15, 5, AttrMap
	lb bc, 2, 2
	ld a, $4
	call FillBoxCGB
	hlcoord 17, 5, AttrMap
	lb bc, 2, 2
	ld a, $5
	call FillBoxCGB
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 8f52

Palette8f52: ; 8f52
	RGB 31, 31, 31
	RGB 31, 19, 31
	RGB 31, 15, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 31, 14
	RGB 17, 31, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 17, 31, 31
	RGB 17, 31, 31
	RGB 00, 00, 00
; 8f6a

Unknown_8f6a: ; 8f6a
	RGB 31, 19, 31

	RGB 21, 31, 14

	RGB 17, 31, 31
; 8f70

_CGB04: ; 8f70
	ld de, wMapPals
	ld a, $1d
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	ld a, [CurPartySpecies]
	cp $ff
	jr nz, .asm_8f8a
	ld hl, Palette8fba
	call LoadHLPaletteIntoDE
	jr .asm_8f90

.asm_8f8a
	call Function9775
	call Function9643

.asm_8f90
	call Function9699
	hlcoord 1, 1, AttrMap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call Function971a
	ld hl, Palette8fc2
	ld de, Unkn2Pals + $38
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 8fba

Palette8fba: ; 8fba
	RGB 11, 23, 00
	RGB 07, 17, 00
	RGB 06, 16, 03
	RGB 05, 12, 01

Palette8fc2: ; 8fc2
	RGB 00, 00, 00
	RGB 11, 23, 00
	RGB 07, 17, 00
	RGB 00, 00, 00
; 8fca

_CGB17: ; 8fca
	ld de, wMapPals
	ld a, $1d
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	ld a, [CurPartySpecies]
	cp $ff
	jr nz, .asm_8fe4
	ld hl, Palette9036
	call LoadHLPaletteIntoDE
	jr .asm_8fed

.asm_8fe4
	ld bc, TempMonDVs
	call Function974b
	call Function9643

.asm_8fed
	call Function9699
	hlcoord 1, 4, AttrMap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call Function971a
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9009

Function9009: ; 9009
	ld hl, Palette9036
	call LoadHLPaletteIntoDE
	jr .asm_901a

	ld bc, TempMonDVs
	call Function974b
	call Function9643

.asm_901a
	call Function9699
	hlcoord 1, 1, AttrMap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call Function971a
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9036

Palette9036: ; 9036
	RGB 31, 15, 00
	RGB 23, 12, 00
	RGB 15, 07, 00
	RGB 00, 00, 00
; 903e

_CGB16: ; 903e
	ld de, wMapPals
	ld a, $1d
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	ld a, [CurPartySpecies]
	call Function9775
	call Function9643
	call Function9699
	hlcoord 7, 5, AttrMap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call Function971a
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 906e

_CGB05: ; 906e
	ld hl, Palettes_b7a9
	ld de, wMapPals
	ld bc, $0080
	ld a, $5
	call FarCopyWRAM
	call Function9699
	hlcoord 0, 2, AttrMap
	lb bc, 10, 3
	ld a, $2
	call FillBoxCGB
	hlcoord 17, 2, AttrMap
	lb bc, 10, 3
	ld a, $2
	call FillBoxCGB
	hlcoord 0, 4, AttrMap
	lb bc, 6, 3
	ld a, $3
	call FillBoxCGB
	hlcoord 17, 4, AttrMap
	lb bc, 6, 3
	ld a, $3
	call FillBoxCGB
	hlcoord 0, 6, AttrMap
	lb bc, 2, 3
	ld a, $4
	call FillBoxCGB
	hlcoord 17, 6, AttrMap
	lb bc, 2, 3
	ld a, $4
	call FillBoxCGB
	hlcoord 4, 2, AttrMap
	lb bc, 2, 12
	ld a, $1
	call FillBoxCGB
	hlcoord 3, 2, AttrMap
	lb bc, 10, 1
	ld a, $1
	call FillBoxCGB
	hlcoord 16, 2, AttrMap
	lb bc, 10, 1
	ld a, $1
	call FillBoxCGB
	hlcoord 0, 12, AttrMap
	ld bc, $0078
	ld a, $7
	call ByteFill
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 90f8

_CGB06: ; 90f8
	ld hl, PalPacket_9ca6 + 1
	call CopyFourPalettes
	call Function9699
	ld de, Unkn2Pals
	ld a, $3c
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	hlcoord 0, 6, AttrMap
	lb bc, 12, SCREEN_WIDTH
	ld a, $1
	call FillBoxCGB
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9122

_CGB07: ; 9122
	ld b, 0
	ld hl, Jumptable_912d
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 912d

Jumptable_912d: ; 912d
	dw Function9133
	dw Function9166
	dw Function9180
; 9133

Function9133: ; 9133
	ld hl, Palette_914e
	ld de, wMapPals
	call LoadHLPaletteIntoDE
	ld hl, Palette_9156
	ld de, Unkn2Pals
	ld bc, $0010
	ld a, $5
	call FarCopyWRAM
	call Function9699
	ret
; 914e

Palette_914e: ; 914e
	RGB 19, 31, 19
	RGB 18, 23, 31
	RGB 11, 21, 28
	RGB 04, 16, 24

Palette_9156: ; 9156
	RGB 29, 29, 29
	RGB 20, 19, 20
	RGB 19, 06, 04
	RGB 03, 04, 06

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 03, 04, 06
; 9166

Function9166: ; 9166
	ld de, wMapPals
	ld a, $38
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	ld de, Unkn2Pals
	ld a, $39
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	call Function9699
	ret
; 9180

Function9180: ; 9180
	ld hl, PalPacket_9c36 + 1
	call CopyFourPalettes
	ld de, Unkn2Pals
	ld a, $3a
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	call Function9699
	ret
; 9195

_CGB11: ; 9195
	ld hl, Palettes_b789
	ld de, wMapPals
	ld bc, $0028
	ld a, $5
	call FarCopyWRAM
	call Function96a4
	call Function9699
	call Function96b3
	ret
; 91ad

_CGB08: ; 91ad
	ld hl, Palettes_b641
	ld de, wMapPals
	ld bc, $0080
	ld a, $5
	call FarCopyWRAM
	ld hl, PalPacket_9cb6 + 1
	call CopyFourPalettes
	call Function9699
	call Function96b3
	ret
; 91c8

_CGB09: ; 91c8
	call Functionb1de
	ld a, $9
	ld [SGBPredef], a
	ret
; 91d1

_CGB0a: ; 91d1
	ld hl, PalPacket_9c56 + 1
	call CopyFourPalettes
	call Function8e9f
	call Function8e85
	call Function971a
	call Function96b3
	ret
; 91e4

_CGB0b: ; 91e4
	ld de, wMapPals
	ld a, c
	and a
	jr z, .asm_91f5
	ld a, $1a
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	jr .asm_921a

.asm_91f5
	ld hl, PartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [PlayerHPPal]
	call Function974b
	call Function9643
	ld hl, Palettes_979c
	ld de, Unkn2Pals + $10
	ld bc, $0030
	ld a, $5
	call FarCopyWRAM

.asm_921a
	call Function9699
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9228

_CGB0c: ; 9228
	ld hl, Palettes_b6f1
	ld de, wMapPals
	ld bc, $0028
	ld a, $5
	call FarCopyWRAM
	ld hl, Palettes_b719
	ld de, Unkn2Pals
	ld bc, $0010
	ld a, $5
	call FarCopyWRAM
	ld a, $8
	ld [SGBPredef], a
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9251

_CGB0d: ; 9251
	ld hl, PalPacket_9cb6 + 1
	call CopyFourPalettes
	call Function9699
	call Function96b3
	ret
; 925e

_CGB18: ; 925e
	ld hl, PalPacket_9bc6 + 1
	call CopyFourPalettes
	ld de, Unkn2Pals
	ld a, $4c
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Unkn2Pals
	ld a, $1f
	ld [hli], a
	ld a, $0
	ld [hl], a
	pop af
	ld [rSVBK], a
	call Function9699
	call Function96b3
	ret
; 9289

_CGB15: ; 9289
	ld de, wMapPals
	xor a
	call Function976b
	call Function9643
	ld a, $1
	call Function976b
	call Function9643
	ld a, $3
	call Function976b
	call Function9643
	ld a, $2
	call Function976b
	call Function9643
	ld a, $4
	call Function976b
	call Function9643
	ld a, $7
	call Function976b
	call Function9643
	ld a, $6
	call Function976b
	call Function9643
	ld a, $5
	call Function976b
	call Function9643
	ld a, $24
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, [PlayerGender]
	and a
	ld a, $1
	jr z, .asm_92e3
	ld a, $0

.asm_92e3
	call ByteFill
	hlcoord 14, 1, AttrMap
	lb bc, 7, 5
	ld a, [PlayerGender]
	and a
	ld a, $0
	jr z, .asm_92f6
	ld a, $1

.asm_92f6
	call FillBoxCGB
	hlcoord 18, 1, AttrMap
	ld [hl], $1
	hlcoord 2, 11, AttrMap
	lb bc, 2, 4
	ld a, $1
	call FillBoxCGB
	hlcoord 6, 11, AttrMap
	lb bc, 2, 4
	ld a, $2
	call FillBoxCGB
	hlcoord 10, 11, AttrMap
	lb bc, 2, 4
	ld a, $3
	call FillBoxCGB
	hlcoord 14, 11, AttrMap
	lb bc, 2, 4
	ld a, $4
	call FillBoxCGB
	hlcoord 2, 14, AttrMap
	lb bc, 2, 4
	ld a, $5
	call FillBoxCGB
	hlcoord 6, 14, AttrMap
	lb bc, 2, 4
	ld a, $6
	call FillBoxCGB
	hlcoord 10, 14, AttrMap
	lb bc, 2, 4
	ld a, $7
	call FillBoxCGB
	ld a, [PlayerGender]
	and a
	push af
	jr z, .asm_935d
	hlcoord 14, 14, AttrMap
	lb bc, 2, 4
	ld a, $1
	call FillBoxCGB

.asm_935d
	pop af
	ld c, $0
	jr nz, .asm_9363
	inc c

.asm_9363
	ld a, c
	hlcoord 18, 1, AttrMap
	ld [hl], a
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9373

_CGB0e: ; 9373
	ld de, wMapPals
	ld a, $10
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	ld a, [PlayerHPPal]
	ld l, a
	ld h, 0
rept 2
	add hl, hl
endr
	ld bc, Palettes_a8be
	add hl, bc
	call Function9643
	call Function9699
	hlcoord 11, 1, AttrMap
	lb bc, 2, 9
	ld a, $1
	call FillBoxCGB
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 93a6

_CGB0f: ; 93a6
	ld hl, PalPacket_9c46 + 1
	call CopyFourPalettes
	call Function9699
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 93ba

_CGB10: ; 93ba
	ld de, wMapPals
	ld a, $1d
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	call Function9699
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 93d3

_CGB14: ; 93d3
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .asm_93e6

	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_93e6

	ld hl, Palettes_9469
	jr .asm_93e9

.asm_93e6
	ld hl, Palettes_9439

.asm_93e9
	ld de, wMapPals
	ld bc, $0040
	ld a, $5
	call FarCopyWRAM
	call Function9699
	hlcoord 0, 0, AttrMap
	lb bc, 1, 10
	ld a, $1
	call FillBoxCGB
	hlcoord 10, 0, AttrMap
	lb bc, 1, 10
	ld a, $2
	call FillBoxCGB
	hlcoord 7, 2, AttrMap
	lb bc, 9, 1
	ld a, $3
	call FillBoxCGB
	hlcoord 0, 7, AttrMap
	lb bc, 3, 5
	ld a, $4
	call FillBoxCGB
	hlcoord 0, 3, AttrMap
	lb bc, 3, 5
	ld a, $5
	call FillBoxCGB
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 9439

Palettes_9439: ; 9439
	RGB 31, 31, 31
	RGB 15, 15, 31
	RGB 00, 00, 31
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 15, 15, 31
	RGB 00, 00, 31
	RGB 00, 00, 00
	RGB 31, 11, 31
	RGB 15, 15, 31
	RGB 00, 00, 31
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 15, 15, 31
	RGB 00, 00, 31
	RGB 31, 00, 00
	RGB 31, 31, 31
	RGB 15, 15, 31
	RGB 31, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 07, 19, 07
	RGB 07, 19, 07
	RGB 00, 00, 00
; 9469

Palettes_9469: ; 9469
	RGB 31, 31, 31
	RGB 31, 14, 31
	RGB 31, 07, 31
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 14, 31
	RGB 31, 07, 31
	RGB 00, 00, 00
	RGB 15, 15, 31
	RGB 31, 14, 31
	RGB 31, 07, 31
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 14, 31
	RGB 31, 07, 31
	RGB 31, 00, 00
	RGB 31, 31, 31
	RGB 31, 14, 31
	RGB 31, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 07, 19, 07
	RGB 07, 19, 07
	RGB 00, 00, 00
; 9499

_CGB12: ; 9499
	call _CGB09
	ld de, $0014
	hlcoord 0, 0, AttrMap
	ld a, [wMenuBorderTopCoord]
.asm_94a5
	and a
	jr z, .asm_94ac
	dec a
	add hl, de
	jr .asm_94a5

.asm_94ac
	ld a, [wMenuBorderLeftCoord]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	inc a
	sub b
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	inc a
	ld c, a
	ld a, $0
	call FillBoxCGB
	call Function96b3
	ret
; 94d0

_CGB13: ; 94d0
	ld hl, PalPacket_9ba6 + 1
	call CopyFourPalettes
	call Function9699
	hlcoord 0, 4, AttrMap
	lb bc, 10, SCREEN_WIDTH
	ld a, $2
	call FillBoxCGB
	hlcoord 0, 6, AttrMap
	lb bc, 6, SCREEN_WIDTH
	ld a, $1
	call FillBoxCGB
	call Function96b3
	call Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 94fa

_CGB19: ; 94fa
	ld de, wMapPals
	ld a, $4e
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	ld hl, Palette_9521
	ld de, Unkn2Pals
	call LoadHLPaletteIntoDE
	ld hl, Palette_9521
	ld de, Unkn2Pals + 8
	call LoadHLPaletteIntoDE
	call Function9699
	call Function96b3
	call Function96a4
	ret
; 9521

Palette_9521: ; 9521
	RGB 31, 31, 31
	RGB 13, 11, 00
	RGB 23, 12, 28
	RGB 00, 00, 00
; 9529

_CGB1a: ; 9529
	ld de, wMapPals
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
	call Function974b
	call Function9643
	call Function9699
	call Function96b3
	call Function96a4
	ret
; 9542

_CGB1e: ; 9542
	ld de, wMapPals
	ld a, [CurPartySpecies]
	call Function9775
	call Function9643
	call Function9699
	call Function96b3
	ret
; 9555

_CGB1b: ; 9555
	ld hl, PalPacket_9cc6 + 1
	call CopyFourPalettes
	ld hl, Palettes_b681
	ld de, Unkn2Pals
	ld bc, $0008
	ld a, $5
	call FarCopyWRAM
	ld de, Unkn2Pals + $38
	ld a, $1c
	call GetAthPalletFromPalettes9df6
	call LoadHLPaletteIntoDE
	call Function9699
	ret
; 9578

_CGB1c: ; 9578
	ld de, wMapPals
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
	call Function9764
	call Function9643
	call Function9699
	call Function96b3
	call Function96a4
	ret
; 9591

_CGB1d: ; 9591
	ld hl, Palette95e0
	ld de, wMapPals
	ld bc, $0010
	ld a, $5
	call FarCopyWRAM
	call Function96a4
	call Function9699
	hlcoord 3, 7, AttrMap
	lb bc, 8, 14
	ld a, $1
	call FillBoxCGB
	hlcoord 1, 5, AttrMap
	lb bc, 1, 18
	ld a, $1
	call FillBoxCGB
	hlcoord 1, 16, AttrMap
	lb bc, 1, 18
	ld a, $1
	call FillBoxCGB
	hlcoord 0, 0, AttrMap
	lb bc, 17, 2
	ld a, $1
	call FillBoxCGB
	hlcoord 18, 5, AttrMap
	lb bc, 12, 1
	ld a, $1
	call FillBoxCGB
	call Function96b3
	ret
; 95e0

Palette95e0: ; 95e0
	RGB 31, 31, 31
	RGB 16, 31, 14
	RGB 05, 14, 21
	RGB 05, 13, 10

	RGB 31, 31, 31
	RGB 11, 21, 25
	RGB 05, 14, 21
	RGB 00, 03, 19
; 95f0
