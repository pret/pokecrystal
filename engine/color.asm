PALPACKET_LENGTH EQU $10
INCLUDE "predef/sgb.asm"

SHINY_ATK_BIT EQU 5
SHINY_DEF_VAL EQU 10
SHINY_SPD_VAL EQU 10
SHINY_SPC_VAL EQU 10

CheckShininess:
; Check if a mon is shiny by DVs at bc.
; Return carry if shiny.

	ld l, c
	ld h, b

; Attack
	ld a, [hl]
	and 1 << SHINY_ATK_BIT
	jr z, .NotShiny

; Defense
	ld a, [hli]
	and $f
	cp  SHINY_DEF_VAL
	jr nz, .NotShiny

; Speed
	ld a, [hl]
	and $f0
	cp  SHINY_SPD_VAL << 4
	jr nz, .NotShiny

; Special
	ld a, [hl]
	and $f
	cp  SHINY_SPC_VAL
	jr nz, .NotShiny

.Shiny:
	scf
	ret

.NotShiny:
	and a
	ret

CheckContestMon:
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

.Good:
	scf
	ret

.Bad:
	and a
	ret

Function8aa4:
; XXX
	push de
	push bc
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	pop bc
	pop de
	ld a, c
	ld [wSGBPals + 3], a
	ld a, b
	ld [wSGBPals + 4], a
	ld a, e
	ld [wSGBPals + 5], a
	ld a, d
	ld [wSGBPals + 6], a
	ld hl, wSGBPals
	call PushSGBPals_
	ld hl, BlkPacket_9a86
	call PushSGBPals_
	ret

InitPartyMenuPalettes:
	ld hl, PalPacket_9c56 + 1
	call CopyFourPalettes
	call InitPartyMenuOBPals
	call WipeAttrMap
	ret

SGB_ApplyPartyMenuHPPals: ; 8ade SGB layout $fc
	ld hl, wHPPals
	ld a, [wSGBPals]
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	and a
	ld e, $5
	jr z, .okay
	dec a
	ld e, $a
	jr z, .okay
	ld e, $f
.okay
	push de
	ld hl, wSGBPals + 10
	ld bc, $6
	ld a, [wSGBPals]
	call AddNTimes
	pop de
	ld [hl], e
	ret

Function8b07:
; Unreferenced
	call CheckCGB
	ret z
; CGB only
	ld hl, .BGPal
	ld de, UnknBGPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM

	ld hl, .OBPal
	ld de, UnknOBPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM

	call ApplyPals
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.BGPal:
	RGB 31, 31, 31
	RGB 18, 23, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

.OBPal:
	RGB 31, 31, 31
	RGB 31, 31, 12
	RGB 08, 16, 28
	RGB 00, 00, 00

Function8b3f:
; Unreferenced
	call CheckCGB
	ret nz
	ld a, [hSGB]
	and a
	ret z
	ld hl, BlkPacket_9a86
	jp PushSGBPals_

Function8b4d:
; XXX
	call CheckCGB
	jr nz, .cgb
	ld a, [hSGB]
	and a
	ret z
	ld hl, PalPacket_9c26
	jp PushSGBPals_

.cgb
	ld de, UnknOBPals
	ld a, $3b
	call GetPredefPal
	jp LoadHLPaletteIntoDE

Function8b67:
; XXX
	call CheckCGB
	jr nz, .cgb
	ld a, [hSGB]
	and a
	ret z
	ld hl, PalPacket_9c36
	jp PushSGBPals_

.cgb
	ld de, UnknOBPals
	ld a, $3c
	call GetPredefPal
	jp LoadHLPaletteIntoDE

Function8b81:
; XXX
	call CheckCGB
	jr nz, .cgb
	ld a, [hSGB]
	and a
	ret z
	ld a, c
	push af
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	pop af
	call GetMonPalettePointer_
	ld a, [hli]
	ld [wSGBPals + 3], a
	ld a, [hli]
	ld [wSGBPals + 4], a
	ld a, [hli]
	ld [wSGBPals + 5], a
	ld a, [hl]
	ld [wSGBPals + 6], a
	ld hl, wSGBPals
	jp PushSGBPals_

.cgb
	ld de, UnknOBPals
	ld a, c
	call GetMonPalettePointer_
	call LoadPalette_White_Col1_Col2_Black
	ret

LoadTrainerClassPaletteAsNthBGPal:
	ld a, [TrainerClass]
	call GetTrainerPalettePointer
	ld a, e
	jr got_palette_pointer_8bd7

LoadMonPaletteAsNthBGPal:
	ld a, [CurPartySpecies]
	call GetMonPalettePointer
	ld a, e
	bit 7, a
	jr z, got_palette_pointer_8bd7
	and $7f
	inc hl
	inc hl
	inc hl
	inc hl

got_palette_pointer_8bd7
	push hl
	ld hl, UnknBGPals
	ld de, 1 palettes
.loop
	and a
	jr z, .got_addr
	add hl, de
	dec a
	jr .loop

.got_addr
	ld e, l
	ld d, h
	pop hl
	call LoadPalette_White_Col1_Col2_Black
	ret

Function8bec:
; XXX
	ld a, [hCGB]
	and a
	jr nz, .cgb
	ld hl, PlayerLightScreenCount
	jp PushSGBPals_

.cgb
	ld a, [EnemyLightScreenCount] ; col
	ld c, a
	ld a, [EnemyReflectCount] ; row
	hlcoord 0, 0, AttrMap
	ld de, SCREEN_WIDTH
.loop
	and a
	jr z, .done
	add hl, de
	dec a
	jr .loop

.done
	ld b, $0
	add hl, bc
	lb bc, 6, 4
	ld a, [EnemySafeguardCount] ; value
	and $3
	call FillBoxCGB
	call LoadEDTile
	ret

ApplyMonOrTrainerPals:
	call CheckCGB
	ret z
	ld a, e
	and a
	jr z, .get_trainer
	ld a, [CurPartySpecies]
	call GetMonPalettePointer_
	jr .load_palettes

.get_trainer
	ld a, [TrainerClass]
	call GetTrainerPalettePointer

.load_palettes
	ld de, UnknBGPals
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	call ApplyAttrMap
	call ApplyPals
	ret

ApplyHPBarPals:
	ld a, [wWhichHPBar]
	and a
	jr z, .Enemy
	cp $1
	jr z, .Player
	cp $2
	jr z, .PartyMenu
	ret

.Enemy:
	ld de, BGPals + 2 palettes + 2
	jr .okay

.Player:
	ld de, BGPals + 3 palettes + 2

.okay
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, Palettes_a8be
	add hl, bc
	ld bc, 4
	ld a, $5
	call FarCopyWRAM
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.PartyMenu:
	ld e, c
	inc e
	hlcoord 11, 1, AttrMap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [CurPartyMon]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop

.done
	lb bc, 2, 8
	ld a, e
	call FillBoxCGB
	ret

LoadStatsScreenPals:
	call CheckCGB
	ret z
	ld hl, StatsScreenPals
	ld b, 0
	dec c
	add hl, bc
	add hl, bc
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [hli]
	ld [UnknBGPals], a
	ld [UnknBGPals + 8 * 2], a
	ld a, [hl]
	ld [UnknBGPals + 1], a
	ld [UnknBGPals + 8 * 2 + 1], a
	pop af
	ld [rSVBK], a
	call ApplyPals
	ld a, $1
	ret

LoadMailPalettes:
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .MailPals
	add hl, de
	call CheckCGB
	jr nz, .cgb
	push hl
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	pop hl
	inc hl
	inc hl
	ld a, [hli]
	ld [wSGBPals + 3], a
	ld a, [hli]
	ld [wSGBPals + 4], a
	ld a, [hli]
	ld [wSGBPals + 5], a
	ld a, [hli]
	ld [wSGBPals + 6], a
	ld hl, wSGBPals
	call PushSGBPals_
	ld hl, BlkPacket_9a86
	call PushSGBPals_
	ret

.cgb
	ld de, UnknBGPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrMap
	call ApplyAttrMap
	ret

.MailPals:
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

INCLUDE "predef/cgb.asm"

Function95f0:
; XXX
	ld hl, .Palette
	ld de, UnknBGPals
	ld bc, 8
	ld a, $5
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrMap
	call ApplyAttrMap
	ret

.Palette:
	RGB 31, 31, 31
	RGB 09, 31, 31
	RGB 10, 12, 31
	RGB 00, 03, 19

CopyFourPalettes:
	ld de, UnknBGPals
	ld c, $4

CopyPalettes:
.loop
	push bc
	ld a, [hli]
	push hl
	call GetPredefPal
	call LoadHLPaletteIntoDE
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .loop
	ret

GetPredefPal:
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, Palettes_9df6
	add hl, bc
	ret

LoadHLPaletteIntoDE:
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld c, $8
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ld [rSVBK], a
	ret

LoadPalette_White_Col1_Col2_Black:
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld a, $7fff % $100
	ld [de], a
	inc de
	ld a, $7fff / $100
	ld [de], a
	inc de

	ld c, 2 * 2
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop

	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de

	pop af
	ld [rSVBK], a
	ret

FillBoxCGB:
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

ResetBGPals:
	push af
	push bc
	push de
	push hl

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, UnknBGPals
	ld c, 8
.loop
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
	jr nz, .loop

	pop af
	ld [rSVBK], a

	pop hl
	pop de
	pop bc
	pop af
	ret

WipeAttrMap:
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	ret

ApplyPals:
	ld hl, UnknBGPals
	ld de, BGPals
	ld bc, 16 palettes
	ld a, $5
	call FarCopyWRAM
	ret

ApplyAttrMap:
	ld a, [rLCDC]
	bit 7, a
	jr z, .UpdateVBank1
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

.UpdateVBank1:
	hlcoord 0, 0, AttrMap
	debgcoord 0, 0
	ld b, SCREEN_HEIGHT
	ld a, $1
	ld [rVBK], a
.row
	ld c, SCREEN_WIDTH
.col
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .col
	ld a, BG_MAP_WIDTH - SCREEN_WIDTH
	add e
	jr nc, .okay
	inc d
.okay
	ld e, a
	dec b
	jr nz, .row
	ld a, $0
	ld [rVBK], a
	ret

CGB_ApplyPartyMenuHPPals: ; 96f3 CGB layout $fc
	ld hl, wHPPals
	ld a, [wSGBPals]
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	inc a
	ld e, a
	hlcoord 11, 2, AttrMap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wSGBPals]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop
.done
	lb bc, 2, 8
	ld a, e
	call FillBoxCGB
	ret

InitPartyMenuOBPals:
	ld hl, Palettes_b681
	ld de, UnknOBPals
	ld bc, 2 palettes
	ld a, $5
	call FarCopyWRAM
	ret

GetBattlemonBackpicPalettePointer:
	push de
	callba GetPartyMonDVs
	ld c, l
	ld b, h
	ld a, [TempBattleMonSpecies]
	call GetPlayerOrMonPalettePointer
	pop de
	ret

GetEnemyFrontpicPalettePointer:
	push de
	callba GetEnemyMonDVs
	ld c, l
	ld b, h
	ld a, [TempEnemyMonSpecies]
	call GetFrontpicPalettePointer
	pop de
	ret

GetPlayerOrMonPalettePointer:
	and a
	jp nz, GetMonNormalOrShinyPalettePointer
	ld a, [wPlayerSpriteSetupFlags]
	bit 2, a ; transformed to male
	jr nz, .male
	ld a, [PlayerGender]
	and a
	jr z, .male
	ld hl, KrisPalette
	ret

.male
	ld hl, PlayerPalette
	ret

GetFrontpicPalettePointer:
	and a
	jp nz, GetMonNormalOrShinyPalettePointer
	ld a, [TrainerClass]

GetTrainerPalettePointer:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, TrainerPalettes
	add hl, bc
	ret

GetMonPalettePointer_:
	call GetMonPalettePointer
	ret

Function9779: mobile
	call CheckCGB
	ret z
	ld hl, Palettes_979c
	ld a, $90
	ld [rOBPI], a
	ld c, 6 palettes
.loop
	ld a, [hli]
	ld [rOBPD], a
	dec c
	jr nz, .loop
	ld hl, Palettes_979c
	ld de, UnknOBPals + 8 * 2
	ld bc, 2 palettes
	ld a, $5
	call FarCopyWRAM
	ret

Palettes_979c:
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

Function97cc:
; XXX
	call CheckCGB
	ret z
	ld a, $90
	ld [rOBPI], a
	ld a, $1c
	call GetPredefPal
	call .PushPalette
	ld a, $21
	call GetPredefPal
	call .PushPalette
	ret

.PushPalette:
	ld c, 1 palettes
.loop
	ld a, [hli]
	ld [rOBPD], a
	dec c
	jr nz, .loop
	ret

GetMonPalettePointer:
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PokemonPalettes
	add hl, bc
	ret

GetMonNormalOrShinyPalettePointer:
	push bc
	call GetMonPalettePointer
	pop bc
	push hl
	call CheckShininess
	pop hl
	ret nc
rept 4
	inc hl
endr
	ret

PushSGBPals_:
	ld a, [wcfbe]
	push af
	set 7, a
	ld [wcfbe], a
	call PushSGBPals
	pop af
	ld [wcfbe], a
	ret

PushSGBPals:
	ld a, [hl]
	and $7
	ret z
	ld b, a
.loop
	push bc
	xor a
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	ld b, $10
.loop2
	ld e, $8
	ld a, [hli]
	ld d, a
.loop3
	bit 0, d
	ld a, $10
	jr nz, .okay
	ld a, $20
.okay
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	rr d
	dec e
	jr nz, .loop3
	dec b
	jr nz, .loop2
	ld a, $20
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	call SGBDelayCycles
	pop bc
	dec b
	jr nz, .loop
	ret

InitSGBBorder:
	call CheckCGB
	ret nz
; SGB/DMG only
	di
	ld a, [wcfbe]
	push af
	set 7, a
	ld [wcfbe], a
	xor a
	ld [rJOYP], a
	ld [hSGB], a
	call PushSGBBorderPalsAndWait
	jr nc, .skip
	ld a, $1
	ld [hSGB], a
	call _InitSGBBorderPals
	call SGBBorder_PushBGPals
	call SGBDelayCycles
	call SGB_ClearVRAM
	call PushSGBBorder
	call SGBDelayCycles
	call SGB_ClearVRAM
	ld hl, PalPacket_9d66
	call PushSGBPals

.skip
	pop af
	ld [wcfbe], a
	ei
	ret

InitCGBPals::
	call CheckCGB
	ret z
; CGB only
	ld a, $1
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, $200 tiles
	xor a
	call ByteFill
	ld a, $0
	ld [rVBK], a
	ld a, $80
	ld [rBGPI], a
	ld c, 4 * 8
.bgpals_loop
	ld a, $7fff % $100
	ld [rBGPD], a
	ld a, $7fff / $100
	ld [rBGPD], a
	dec c
	jr nz, .bgpals_loop
	ld a, $80
	ld [rOBPI], a
	ld c, 4 * 8
.obpals_loop
	ld a, $7fff % $100
	ld [rOBPD], a
	ld a, $7fff / $100
	ld [rOBPD], a
	dec c
	jr nz, .obpals_loop
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, UnknBGPals
	call .LoadWhitePals
	ld hl, BGPals
	call .LoadWhitePals
	pop af
	ld [rSVBK], a
	ret

.LoadWhitePals:
	ld c, 4 * 16
.loop
	ld a, $7fff % $100
	ld [hli], a
	ld a, $7fff / $100
	ld [hli], a
	dec c
	jr nz, .loop
	ret

_InitSGBBorderPals:
	ld hl, .PalPacketPointerTable
	ld c, 9
.loop
	push bc
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	call PushSGBPals
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .loop
	ret

.PalPacketPointerTable:
	dw PalPacket_9d56
	dw PalPacket_9d76
	dw PalPacket_9d86
	dw PalPacket_9d96
	dw PalPacket_9da6
	dw PalPacket_9db6
	dw PalPacket_9dc6
	dw PalPacket_9dd6
	dw PalPacket_9de6

Function9911:
; XXX
	di
	xor a
	ld [rJOYP], a
	ld hl, PalPacket_9d56
	call PushSGBPals
	call PushSGBBorder
	call SGBDelayCycles
	call SGB_ClearVRAM
	ld hl, PalPacket_9d66
	call PushSGBPals
	ei
	ret

PushSGBBorder:
	call .LoadSGBBorderPointers
	push de
	call SGBBorder_YetMorePalPushing
	pop hl
	call SGBBorder_MorePalPushing
	ret

.LoadSGBBorderPointers:
	ld hl, SGBBorder
	ld de, SGBBorderMap
	ret

SGB_ClearVRAM:
	ld hl, VTiles0
	ld bc, $2000
	xor a
	call ByteFill
	ret

PushSGBBorderPalsAndWait:
	ld hl, PalPacket_9d26
	call PushSGBPals
	call SGBDelayCycles
	ld a, [rJOYP]
	and $3
	cp $3
	jr nz, .carry
	ld a, $20
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $30
	ld [rJOYP], a
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $10
	ld [rJOYP], a
rept 6
	ld a, [rJOYP]
endr
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $30
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, [rJOYP]
	and $3
	cp $3
	jr nz, .carry
	call .FinalPush
	and a
	ret

.carry
	call .FinalPush
	scf
	ret

.FinalPush:
	ld hl, PalPacket_9d16
	call PushSGBPals
	jp SGBDelayCycles

SGBBorder_PushBGPals:
	call DisableLCD
	ld a, %11100100
	ld [rBGP], a
	ld hl, Palettes_9df6
	ld de, VTiles1
	ld bc, $1000
	call CopyData
	call DrawDefaultTiles
	ld a, $e3
	ld [rLCDC], a
	ld hl, PalPacket_9d06
	call PushSGBPals
	xor a
	ld [rBGP], a
	ret

SGBBorder_MorePalPushing:
	call DisableLCD
	ld a, $e4
	ld [rBGP], a
	ld de, VTiles1
	ld bc, 20 tiles
	call CopyData
	ld b, 18
.loop
	push bc
	ld bc, $c
	call CopyData
	ld bc, $28
	call ClearBytes
	ld bc, $c
	call CopyData
	pop bc
	dec b
	jr nz, .loop
	ld bc, $140
	call CopyData
	ld bc, Start
	call ClearBytes
	ld bc, 16 palettes
	call CopyData
	call DrawDefaultTiles
	ld a, $e3
	ld [rLCDC], a
	ld hl, PalPacket_9d46
	call PushSGBPals
	xor a
	ld [rBGP], a
	ret

SGBBorder_YetMorePalPushing:
	call DisableLCD
	ld a, %11100100
	ld [rBGP], a
	ld de, VTiles1
	ld b, $80
.loop
	push bc
	ld bc, 1 tiles
	call CopyData
	ld bc, 1 tiles
	call ClearBytes
	pop bc
	dec b
	jr nz, .loop
	call DrawDefaultTiles
	ld a, $e3
	ld [rLCDC], a
	ld hl, PalPacket_9d36
	call PushSGBPals
	xor a
	ld [rBGP], a
	ret

CopyData: ; 0x9a52
; copy bc bytes of data from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret
; 0x9a5b

ClearBytes: ; 0x9a5b
; clear bc bytes of data starting from de
.loop
	xor a
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret
; 0x9a64

DrawDefaultTiles: ; 0x9a64
; Draw 240 tiles (2/3 of the screen) from tiles in VRAM
	hlbgcoord 0, 0 ; BG Map 0
	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
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

SGBDelayCycles:
	ld de, 7000
.wait
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .wait
	ret

BlkPacket_9a86:
	db $21, $01, $03, $00, $00, $00, $13, $11, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9a96:
	db $21, $01, $07, $05, $00, $0a, $13, $0d, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9aa6:
	db $22, $05, $07, $0a, $00, $0c, $13, $11, $03, $05, $01, $00, $0a, $03, $03, $00
	db $0a, $08, $13, $0a, $03, $0a, $00, $04, $08, $0b, $03, $0f, $0b, $00, $13, $07

BlkPacket_9ac6:
	db $21, $01, $07, $05, $00, $01, $07, $07, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9ad6:
	db $21, $01, $07, $05, $0b, $01, $13, $02, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9ae6:
	db $21, $01, $07, $05, $01, $01, $08, $08, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9af6:
	db $21, $01, $07, $05, $07, $05, $0d, $0b, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9b06:
	db $22, $05, $03, $05, $00, $00, $13, $0b, $03, $0a, $00, $04, $13, $09, $02, $0f
	db $00, $06, $13, $07, $03, $00, $04, $04, $0f, $09, $03, $00, $00, $0c, $13, $11

BlkPacket_9b26:
	db $23, $07, $07, $10, $00, $00, $02, $0c, $02, $00, $0c, $00, $12, $01, $02, $00
	db $0c, $02, $12, $03, $02, $00, $0c, $04, $12, $05, $02, $00, $0c, $06, $12, $07
	db $02, $00, $0c, $08, $12, $09, $02, $00, $0c, $0a, $12, $0b, $00, $00, $00, $00

BlkPacket_9b56:
	db $22, $03, $07, $20, $00, $00, $13, $04, $03, $0f, $00, $06, $13, $11, $03, $05
	db $0f, $01, $12, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9b76:
	db $21, $01, $07, $10, $00, $00, $13, $05, $00, $00, $00, $00, $00, $00, $00, $00

BlkPacket_9b86:
	db $21, $02, $07, $0a, $00, $04, $13, $0d, $03, $05, $00, $06, $13, $0b, $00, $00

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

Palettes_9df6:
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

SGBBorderMap:
	db $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $14, $14, $15, $14, $16, $14, $17, $14, $17, $54, $16, $54, $15, $54, $14, $54, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14
	db $01, $14, $02, $14, $03, $14, $03, $54, $02, $54, $01, $54, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $24, $14, $25, $14, $26, $14, $07, $14, $07, $54, $26, $54, $25, $54, $24, $54, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $54, $01, $14, $02, $14, $03, $14, $03, $54, $02, $54, $01, $54
	db $11, $14, $12, $14, $13, $14, $13, $54, $12, $54, $11, $54, $10, $54, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $24, $14, $34, $14, $35, $14, $35, $54, $34, $54, $33, $54, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $10, $14, $11, $14, $12, $14, $13, $14, $13, $54, $12, $54, $11, $54
	db $21, $14, $22, $14, $23, $14, $23, $54, $22, $54, $21, $54, $20, $54, $07, $14, $08, $14, $09, $14, $0a, $14, $0b, $14, $0c, $14, $0d, $14, $07, $14, $07, $14, $18, $14, $09, $14, $1a, $14, $1b, $14, $0d, $14, $0c, $14, $1c, $14, $29, $14, $07, $14, $20, $14, $21, $14, $22, $14, $23, $14, $23, $54, $22, $54, $21, $54
	db $31, $14, $32, $14, $07, $14, $07, $14, $32, $54, $36, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $38, $10, $27, $10, $32, $14, $07, $54, $07, $54, $32, $54, $31, $54
	db $05, $14, $06, $14, $07, $14, $07, $54, $06, $54, $1f, $10,                                                                                                                                                                                     $37, $10, $06, $14, $07, $14, $07, $54, $06, $54, $05, $54
	db $15, $14, $16, $14, $17, $14, $17, $54, $16, $54, $1f, $10,                                                                                                                                                                                     $37, $10, $16, $14, $17, $14, $17, $54, $16, $54, $15, $54
	db $25, $14, $26, $14, $07, $14, $07, $54, $26, $54, $1f, $10,                                                                                                                                                                                     $37, $10, $26, $14, $07, $14, $07, $54, $26, $54, $25, $54
	db $33, $14, $34, $14, $35, $14, $35, $54, $34, $54, $1f, $10,                                                                                                                                                                                     $37, $10, $34, $14, $35, $14, $35, $54, $34, $54, $33, $54
	db $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $1f, $10,                                                                                                                                                                                     $37, $10, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14
	db $02, $54, $01, $54, $07, $54, $07, $14, $07, $14, $1f, $10,                                                                                                                                                                                     $37, $10, $07, $14, $07, $14, $07, $14, $01, $14, $02, $14
	db $12, $54, $11, $54, $10, $54, $07, $14, $07, $14, $1f, $10,                                                                                                                                                                                     $37, $10, $07, $14, $07, $14, $10, $14, $11, $14, $12, $14
	db $22, $54, $21, $54, $20, $54, $07, $14, $07, $14, $1f, $10,                                                                                                                                                                                     $37, $10, $07, $14, $07, $14, $20, $14, $21, $14, $22, $14
	db $32, $54, $31, $54, $30, $54, $07, $14, $07, $14, $1f, $10,                                                                                                                                                                                     $37, $10, $07, $14, $07, $14, $30, $14, $31, $14, $32, $14
	db $06, $54, $05, $54, $04, $54, $07, $14, $07, $14, $1f, $10,                                                                                                                                                                                     $37, $10, $07, $14, $07, $14, $04, $14, $05, $14, $06, $14
	db $16, $54, $15, $54, $14, $54, $07, $14, $07, $14, $1f, $10,                                                                                                                                                                                     $37, $10, $07, $14, $07, $14, $14, $14, $15, $14, $16, $14
	db $26, $54, $25, $54, $24, $54, $07, $14, $07, $14, $1f, $10,                                                                                                                                                                                     $37, $10, $07, $14, $07, $14, $24, $14, $25, $14, $26, $14
	db $34, $54, $33, $54, $07, $54, $07, $14, $07, $14, $1f, $10,                                                                                                                                                                                     $37, $10, $07, $14, $07, $14, $07, $14, $33, $14, $34, $14
	db $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $1f, $10,                                                                                                                                                                                     $37, $10, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14
	db $01, $14, $02, $14, $03, $14, $03, $54, $02, $54, $1f, $10,                                                                                                                                                                                     $37, $10, $02, $14, $03, $14, $03, $54, $02, $54, $01, $54
	db $11, $14, $12, $14, $13, $14, $13, $54, $12, $54, $1f, $10,                                                                                                                                                                                     $37, $10, $12, $14, $13, $14, $13, $54, $12, $54, $11, $54
	db $21, $14, $22, $14, $23, $14, $23, $54, $22, $54, $1f, $10,                                                                                                                                                                                     $37, $10, $22, $14, $23, $14, $23, $54, $22, $54, $21, $54
	db $31, $14, $32, $14, $07, $14, $07, $14, $32, $54, $1f, $10,                                                                                                                                                                                     $37, $10, $32, $14, $07, $54, $07, $54, $32, $54, $31, $54
	db $05, $14, $06, $14, $07, $14, $07, $54, $06, $54, $2e, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2f, $10, $2d, $10, $06, $14, $07, $14, $07, $54, $06, $54, $05, $54
	db $15, $14, $16, $14, $17, $14, $17, $54, $16, $54, $15, $54, $14, $54, $07, $14, $07, $14, $39, $14, $0e, $14, $09, $14, $0f, $14, $28, $14, $07, $14, $19, $14, $0c, $14, $1c, $14, $29, $14, $2a, $14, $2b, $14, $2c, $14, $39, $14, $07, $14, $07, $14, $14, $14, $15, $14, $16, $14, $17, $14, $17, $54, $16, $54, $15, $54
	db $25, $14, $26, $14, $07, $14, $07, $54, $26, $54, $25, $54, $24, $54, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $01, $14, $02, $14, $03, $14, $03, $54, $02, $54, $01, $54, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $24, $14, $25, $14, $26, $14, $07, $14, $07, $54, $26, $54, $25, $54
	db $33, $14, $34, $14, $35, $14, $35, $54, $34, $54, $24, $54, $07, $54, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $10, $14, $11, $14, $12, $14, $13, $14, $13, $54, $12, $54, $11, $54, $10, $54, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $24, $14, $34, $14, $35, $14, $35, $54, $34, $54, $33, $54
	db $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $20, $14, $21, $14, $22, $14, $23, $14, $23, $54, $22, $54, $21, $54, $20, $54, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14, $07, $14

SGBBorderPalettes:
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

SGBBorder:
INCBIN "gfx/misc/sgb_border.2bpp"

Palettes_a8be:
	RGB 30, 26, 15
	RGB 00, 23, 00

	RGB 30, 26, 15
	RGB 31, 21, 00

	RGB 30, 26, 15
	RGB 31, 00, 00

Palettes_a8ca:
	RGB 30, 26, 15
	RGB 04, 17, 31

INCLUDE "gfx/pics/palette_pointers.asm"

INCLUDE "gfx/trainers/palette_pointers.asm"

LoadMapPals:
	callba LoadSpecialMapPalette
	jr c, .got_pals

	; Which palette group is based on whether we're outside or inside
	ld a, [wPermission]
	and 7
	ld e, a
	ld d, 0
	ld hl, .TilesetColorsPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Futher refine by time of day
	ld a, [TimeOfDayPal]
	and 3
	add a
	add a
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	; Switch to palettes WRAM bank
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, UnknBGPals
	ld b, 8
.outer_loop
	ld a, [de] ; lookup index for TilesetBGPalette
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, TilesetBGPalette
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld c, 1 palettes
.inner_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop de
	inc de
	dec b
	jr nz, .outer_loop
	pop af
	ld [rSVBK], a

.got_pals
	ld a, [TimeOfDayPal]
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, UnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM

	ld a, [wPermission]
	cp TOWN
	jr z, .outside
	cp ROUTE
	ret nz
.outside
	ld a, [MapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, RoofPals
	add hl, de
	ld a, [TimeOfDayPal]
	and 3
	cp NITE
	jr c, .morn_day
rept 4
	inc hl
endr
.morn_day
	ld de, UnknBGPals + 6 palettes + 2
	ld bc, 4
	ld a, $5
	call FarCopyWRAM
	ret

.TilesetColorsPointers:
	dw .OutdoorColors ; unused
	dw .OutdoorColors ; TOWN
	dw .OutdoorColors ; ROUTE
	dw .IndoorColors ; INDOOR
	dw .DungeonColors ; CAVE
	dw .Perm5Colors ; PERM_5
	dw .IndoorColors ; GATE
	dw .DungeonColors ; DUNGEON

; Valid indices: $00 - $29
.OutdoorColors:
	db $00, $01, $02, $28, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $28, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $29, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.IndoorColors:
	db $20, $21, $22, $23, $24, $25, $26, $07 ; morn
	db $20, $21, $22, $23, $24, $25, $26, $07 ; day
	db $10, $11, $12, $13, $14, $15, $16, $07 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $07 ; dark

.DungeonColors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.Perm5Colors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

Palette_b309: ; b309 mobile
	RGB 31, 31, 31
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 00, 00, 00

Palette_b311: ; b311 not mobile
	RGB 31, 31, 31
	RGB 17, 19, 31
	RGB 14, 16, 31
	RGB 00, 00, 00

TilesetBGPalette:
INCLUDE "tilesets/bg.pal"

MapObjectPals::
INCLUDE "tilesets/ob.pal"

RoofPals:
INCLUDE "tilesets/roof.pal"

DiplomaPalettes:
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

Palettes_b681:
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

Palettes_b6f1:
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

Palettes_b719:
	RGB 31, 31, 31
	RGB 07, 06, 03
	RGB 07, 06, 03
	RGB 07, 06, 03

	RGB 31, 31, 31
	RGB 31, 31, 00
	RGB 26, 22, 00
	RGB 00, 00, 00

MalePokegearPals:
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

FemalePokegearPals:
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

Palettes_b789:
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

Palettes_b7a9:
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

