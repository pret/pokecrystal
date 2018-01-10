INCLUDE "engine/sgb_layouts.asm"

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

; unreferenced
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

; SGB layout for SCGB_PARTY_MENU_HP_PALS
SGB_ApplyPartyMenuHPPals: ; 8ade
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
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM

	ld hl, .OBPal
	ld de, wOBPals1
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
	ld de, wOBPals1
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
	ld de, wOBPals1
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
	ld de, wOBPals1
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
	ld hl, wBGPals1
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
	call CopyTilemapAtOnce
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
	ld de, wBGPals1
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
	ld de, wBGPals2 palette PAL_BATTLE_BG_ENEMY_HP + 2
	jr .okay

.Player:
	ld de, wBGPals2 palette PAL_BATTLE_BG_PLAYER_HP + 2

.okay
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
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
	ld [wBGPals1 palette 0], a
	ld [wBGPals1 palette 2], a
	ld a, [hl]
	ld [wBGPals1 palette 0 + 1], a
	ld [wBGPals1 palette 2 + 1], a
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
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrMap
	call ApplyAttrMap
	ret

.MailPals:
INCLUDE "gfx/mail/mail.pal"

INCLUDE "engine/cgb_layouts.asm"

Function95f0:
; XXX
	ld hl, .Palette
	ld de, wBGPals1
	ld bc, 1 palettes
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
	ld de, wBGPals1
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
	ld bc, PredefPals
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

	ld a, LOW(palred 31 + palgreen 31 + palblue 31)
	ld [de], a
	inc de
	ld a, HIGH(palred 31 + palgreen 31 + palblue 31)
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

	ld hl, wBGPals1
	ld c, 1 palettes
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
	ld hl, wBGPals1
	ld de, wBGPals2
	ld bc, 16 palettes
	ld a, $5
	call FarCopyWRAM
	ret

ApplyAttrMap:
	ld a, [rLCDC]
	bit rLCDC_ENABLE, a
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

; CGB layout for SCGB_PARTY_MENU_HP_PALS
CGB_ApplyPartyMenuHPPals: ; 96f3
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
	ld hl, PartyMenuOBPals
	ld de, wOBPals1
	ld bc, 2 palettes
	ld a, $5
	call FarCopyWRAM
	ret

GetBattlemonBackpicPalettePointer:
	push de
	farcall GetPartyMonDVs
	ld c, l
	ld b, h
	ld a, [TempBattleMonSpecies]
	call GetPlayerOrMonPalettePointer
	pop de
	ret

GetEnemyFrontpicPalettePointer:
	push de
	farcall GetEnemyMonDVs
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
	ld a, [wPlayerGender]
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
	ld hl, BattleObjectPals
	ld a, $90
	ld [rOBPI], a
	ld c, 6 palettes
.loop
	ld a, [hli]
	ld [rOBPD], a
	dec c
	jr nz, .loop
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette 2
	ld bc, 2 palettes
	ld a, $5
	call FarCopyWRAM
	ret

BattleObjectPals:
INCLUDE "gfx/battle_anims/battle_anims.pal"

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
	ld hl, vTiles0
	ld bc, $200 tiles
	xor a
	call ByteFill
	ld a, $0
	ld [rVBK], a
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ld [rBGPI], a
	ld c, 4 * 8
.bgpals_loop
	ld a, LOW(palred 31 + palgreen 31 + palblue 31)
	ld [rBGPD], a
	ld a, HIGH(palred 31 + palgreen 31 + palblue 31)
	ld [rBGPD], a
	dec c
	jr nz, .bgpals_loop
	ld a, 1 << rOBPI_AUTO_INCREMENT
	ld [rOBPI], a
	ld c, 4 * 8
.obpals_loop
	ld a, LOW(palred 31 + palgreen 31 + palblue 31)
	ld [rOBPD], a
	ld a, HIGH(palred 31 + palgreen 31 + palblue 31)
	ld [rOBPD], a
	dec c
	jr nz, .obpals_loop
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, wBGPals1
	call .LoadWhitePals
	ld hl, wBGPals2
	call .LoadWhitePals
	pop af
	ld [rSVBK], a
	ret

.LoadWhitePals:
	ld c, 4 * 16
.loop
	ld a, LOW(palred 31 + palgreen 31 + palblue 31)
	ld [hli], a
	ld a, HIGH(palred 31 + palgreen 31 + palblue 31)
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
	ld hl, VRAM_Begin
	ld bc, VRAM_End - VRAM_Begin
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
	ld hl, PredefPals
	ld de, vTiles1
	ld bc, $100 tiles
	call CopyData
	call DrawDefaultTiles
	ld a, LCDC_DEFAULT
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
	ld de, vTiles1
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
	ld a, LCDC_DEFAULT
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
	ld de, vTiles1
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
	ld a, LCDC_DEFAULT
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

INCLUDE "gfx/sgb/blk_packets.asm"

INCLUDE "gfx/sgb/pal_packets.asm"

PredefPals:
INCLUDE "gfx/sgb/predef.pal"

SGBBorderMap:
INCBIN "gfx/sgb/sgb_border.tilemap"

SGBBorderPalettes:
INCLUDE "gfx/sgb/sgb_border.pal"

SGBBorder:
INCBIN "gfx/sgb/sgb_border.2bpp"

HPBarPals:
INCLUDE "gfx/battle/hp_bar.pal"

ExpBarPalette:
INCLUDE "gfx/battle/exp_bar.pal"

INCLUDE "data/pokemon/palettes.asm"

INCLUDE "data/trainers/palettes.asm"

LoadMapPals:
	farcall LoadSpecialMapPalette
	jr c, .got_pals

	; Which palette group is based on whether we're outside or inside
	ld a, [wEnvironment]
	and 7
	ld e, a
	ld d, 0
	ld hl, EnvironmentColorsPointers
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
	ld hl, wBGPals1
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
	ld de, wOBPals1
	ld bc, 8 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM

	ld a, [wEnvironment]
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
	cp NITE_F
	jr c, .morn_day
rept 4
	inc hl
endr
.morn_day
	ld de, wBGPals1 palette PAL_BG_ROOF + 2
	ld bc, 4
	ld a, $5
	call FarCopyWRAM
	ret

INCLUDE "data/maps/environment_colors.asm"

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
INCLUDE "gfx/tilesets/bg_tiles.pal"

MapObjectPals::
INCLUDE "gfx/sprites/map_objects.pal"

RoofPals:
INCLUDE "gfx/tilesets/roofs.pal"

DiplomaPalettes:
INCLUDE "gfx/diploma/diploma.pal"

PartyMenuOBPals:
INCLUDE "gfx/icons/party_menu.pal"

Palettes_b6f1:
INCLUDE "gfx/unknown/b6f1.pal"

Palettes_b719:
INCLUDE "gfx/unknown/b719.pal"

MalePokegearPals:
INCLUDE "gfx/pokegear/pokegear.pal"

FemalePokegearPals:
INCLUDE "gfx/pokegear/pokegear_f.pal"

Palettes_b789:
INCLUDE "gfx/unknown/b789.pal"

SlotMachinePals:
INCLUDE "gfx/slots/slots.pal"
