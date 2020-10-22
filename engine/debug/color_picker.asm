	const_def $6a
	const DEBUGTEST_TICKS_1 ; $6a
	const DEBUGTEST_TICKS_2 ; $6b
	const DEBUGTEST_WHITE   ; $6c
	const DEBUGTEST_LIGHT   ; $6d
	const DEBUGTEST_DARK    ; $6e
	const DEBUGTEST_BLACK   ; $6f
	const DEBUGTEST_0       ; $70
	const DEBUGTEST_1       ; $71
	const DEBUGTEST_2       ; $72
	const DEBUGTEST_3       ; $73
	const DEBUGTEST_4       ; $74
	const DEBUGTEST_5       ; $75
	const DEBUGTEST_6       ; $76
	const DEBUGTEST_7       ; $77
	const DEBUGTEST_8       ; $78
	const DEBUGTEST_9       ; $79
	const DEBUGTEST_A       ; $7a
	const DEBUGTEST_B       ; $7b
	const DEBUGTEST_C       ; $7c
	const DEBUGTEST_D       ; $7d
	const DEBUGTEST_E       ; $7e
	const DEBUGTEST_F       ; $7f

DebugColorPicker:
; A debug menu to test monster and trainer palettes at runtime.

	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ldh a, [hSGB]
	and a
	ret z

.cgb
	ldh a, [hInMenu]
	push af
	ld a, 1
	ldh [hInMenu], a
	call DisableLCD
	call DebugColor_InitVRAM
	call DebugColor_LoadGFX
	call DebugColor_InitPalettes
	call DebugColor_InitMonColor
	call EnableLCD
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ld [wJumptableIndex], a
	ld [wcf66], a
	ld [wd003], a
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .exit
	call DebugColorMain
	call DebugColor_PlaceCursor
	call DelayFrame
	jr .loop

.exit
	pop af
	ldh [hInMenu], a
	ret

DebugColor_InitMonColor:
	ld a, [wd002]
	and a
	jr nz, DebugColor_InitTrainerColor
	ld hl, PokemonPalettes

DebugColor_InitMonColor2:
	ld de, wOverworldMapBlocks
	ld c, NUM_POKEMON + 1
.loop
	push bc
	push hl
	call DebugColor_InitColor
	pop hl
	ld bc, 8
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

DebugColor_InitTrainerColor:
	ld hl, TrainerPalettes
	ld de, wOverworldMapBlocks
	ld c, NUM_TRAINER_CLASSES
.loop
	push bc
	push hl
	call DebugColor_InitColor
	pop hl
	ld bc, 4
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

DebugColor_InitColor:
	ld a, BANK(PokemonPalettes) ; aka BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl

	ld a, BANK(PokemonPalettes) ; aka BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl

	ld a, BANK(PokemonPalettes) ; aka BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl

	ld a, BANK(PokemonPalettes) ; aka BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	ret

DebugColor_InitVRAM:
	ld a, BANK(vTiles3)
	ldh [rVBK], a
	ld hl, vTiles3
	ld bc, sScratch - vTiles3
	xor a
	call ByteFill

	ld a, BANK(vTiles0)
	ldh [rVBK], a
	ld hl, vTiles0
	ld bc, sScratch - vTiles0
	xor a
	call ByteFill

	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill

	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill

	call ClearSprites
	ret

DebugColor_LoadGFX:
	ld hl, DebugColor_GFX
	ld de, vTiles2 tile DEBUGTEST_TICKS_1
	ld bc, 22 tiles
	call CopyBytes

	ld hl, DebugUpArrowGFX
	ld de, vTiles0
	ld bc, 1 tiles
	call CopyBytes

	call LoadStandardFont
	ld hl, vTiles1
	ld bc, $80 tiles
.loop
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

DebugColor_InitPalettes:
	ldh a, [hCGB]
	and a
	ret z

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

	ld hl, Palette_DebugBG
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes

	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld hl, Palette_DebugBG
	ld c, 8 palettes
	xor a
.bg_loop
	ldh [rBGPD], a
	dec c
	jr nz, .bg_loop

	ld a, 1 << rOBPI_AUTO_INCREMENT
	ldh [rOBPI], a
	ld hl, Palette_DebugOB
	ld c, 8 palettes
.ob_loop
	ld a, [hli]
	ldh [rOBPD], a
	dec c
	jr nz, .ob_loop

	ld a, $94
	ld [wc608], a
	ld a, $52
	ld [wc608 + 1], a
	ld a, $4a
	ld [wc608 + 2], a
	ld a, $29
	ld [wc608 + 3], a

	pop af
	ldh [rSVBK], a
	ret

Palette_DebugBG:
INCLUDE "gfx/debug/bg.pal"

Palette_DebugOB:
INCLUDE "gfx/debug/ob.pal"

DebugColorMain:
	call JoyTextDelay
	ld a, [wJumptableIndex]
	cp 4
	jr nc, .no_start_select
	ld hl, hJoyLast
	ld a, [hl]
	and SELECT
	jr nz, .NextMon
	ld a, [hl]
	and START
	jr nz, .PreviousMon

.no_start_select
	jumptable Jumptable_81acf, wJumptableIndex

.NextMon
	call DebugColor_BackupSpriteColors
	call DebugColor_SetMaxNum
	ld e, a
	ld a, [wcf66]
	inc a
	cp e
	jr c, .SwitchMon
	xor a
	jr .SwitchMon

.PreviousMon
	call DebugColor_BackupSpriteColors
	ld a, [wcf66]
	dec a
	cp -1
	jr nz, .SwitchMon
	call DebugColor_SetMaxNum
	dec a

.SwitchMon
	ld [wcf66], a
	ld a, 0
	ld [wJumptableIndex], a
	ret

DebugColor_SetMaxNum:
; Looping back around the pic set.
	ld a, [wd002]
	and a
	jr nz, .trainer
; .mon
	ld a, NUM_POKEMON ; CELEBI
	ret
.trainer
	ld a, NUM_TRAINER_CLASSES - 1 ; MYSTICALMAN
	ret

Jumptable_81acf:
	dw DebugColor_InitScreen
	dw Function81c18
	dw Function81c33
	dw Function81cc2
	dw Function81d8e
	dw Function81daf

DebugColor_InitScreen:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, DEBUGTEST_BLACK
	call ByteFill
	hlcoord 1, 3
	lb bc, 7, 18
	ld a, DEBUGTEST_WHITE
	call DebugColor_FillBoxWithByte
	hlcoord 11, 0
	lb bc, 2, 3
	ld a, DEBUGTEST_LIGHT
	call DebugColor_FillBoxWithByte
	hlcoord 16, 0
	lb bc, 2, 3
	ld a, DEBUGTEST_DARK
	call DebugColor_FillBoxWithByte
	call DebugColor_LoadRGBMeter
	call DebugColor_SetRGBMeter
	ld a, [wcf66]
	inc a
	ld [wCurPartySpecies], a
	ld [wDeciramBuffer], a
	hlcoord 0, 1
	ld de, wDeciramBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ld a, [wd002]
	and a
	jr nz, .trainer

; .mon
	ld a, UNOWN_A
	ld [wUnownLetter], a
	call GetPokemonName
	hlcoord 4, 1
	call PlaceString
	xor a
	ld [wBoxAlignment], a
	hlcoord 12, 3
	call _PrepMonFrontpic
	ld de, vTiles2 tile $31
	predef GetMonBackpic
	ld a, $31
	ldh [hGraphicStartTile], a
	hlcoord 2, 4
	lb bc, 6, 6
	predef PlaceGraphic

	ld a, [wd003]
	and a
	jr z, .load_normal_text
; .load_shiny_text
	ld de, DebugColor_ShinyText
	jr .place_switch_text

.load_normal_text
	ld de, DebugColor_NormalText

.place_switch_text
	hlcoord 7, 17
	call PlaceString
	hlcoord 0, 17
	ld de, DebugColor_SwitchText
	call PlaceString
	jr .done

.trainer
	ld a, [wDeciramBuffer]
	ld [wTrainerClass], a
	callfar GetTrainerAttributes
	ld de, wStringBuffer1
	hlcoord 4, 1
	call PlaceString
	ld de, vTiles2
	callfar GetTrainerPic
	xor a
	ld [wTempEnemyMonSpecies], a
	ldh [hGraphicStartTile], a
	hlcoord 2, 3
	lb bc, 7, 7
	predef PlaceGraphic

.done
	ld a, 1
	ld [wJumptableIndex], a
	ret

DebugColor_ShinyText:
	db "レア", DEBUGTEST_BLACK, DEBUGTEST_BLACK, "@" ; Rare (shiny)

DebugColor_NormalText:
	db "ノーマル@" ; Normal

DebugColor_SwitchText:
	db DEBUGTEST_A, "きりかえ▶@" ; (A) Switches

DebugColor_LoadRGBMeter:
	decoord 0, 11, wAttrmap
	hlcoord 2, 11
	ld a, $1
	call Function81bde
	decoord 0, 13, wAttrmap
	hlcoord 2, 13
	ld a, $2
	call Function81bde
	decoord 0, 15, wAttrmap
	hlcoord 2, 15
	ld a, $3

Function81bde:
	push af
	ld a, DEBUGTEST_TICKS_1
	ld [hli], a
	ld bc, 15
	ld a, DEBUGTEST_TICKS_2
	call ByteFill
	ld l, e
	ld h, d
	pop af
	ld bc, 20 * 2
	call ByteFill
	ret

DebugColor_SetRGBMeter:
	ld a, [wcf66]
	inc a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, wOverworldMapBlocks
	add hl, de
	ld de, wc608
	ld bc, 4
	call CopyBytes
	xor a
	ld [wcf64], a
	ld [wcf65], a
	ld de, wc608
	call DebugColor_CalculateRGB
	ret

Function81c18:
	ldh a, [hCGB]
	and a
	jr z, .sgb
	ld a, 2
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame

.sgb
	call WaitBGMap
	ld a, 2
	ld [wJumptableIndex], a
	ret

Function81c33:
	ldh a, [hCGB]
	and a
	jr z, .sgb

; .cgb
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

	ld hl, wBGPals2
	ld de, wc608
	ld c, $1
	call Function81ee3
	hlcoord 10, 2
	ld de, wc608
	call Function81ca7
	hlcoord 15, 2
	ld de, wc608 + 2
	call Function81ca7
	ld a, TRUE
	ldh [hCGBPalUpdate], a

	ld a, 3
	ld [wJumptableIndex], a

	pop af
	ldh [rSVBK], a
	ret

.sgb
	ld hl, wSGBPals
	ld a, 1
	ld [hli], a
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	ld a, [wc608]
	ld [hli], a
	ld a, [wc608 + 1]
	ld [hli], a
	ld a, [wc608 + 2]
	ld [hli], a
	ld a, [wc608 + 3]
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wSGBPals
	call Function81f0c
	hlcoord 10, 2
	ld de, wc608
	call Function81ca7
	hlcoord 15, 2
	ld de, wc608 + 2
	call Function81ca7

	ld a, 3
	ld [wJumptableIndex], a
	ret

Function81ca7:
	inc hl
	inc hl
	inc hl
	ld a, [de]
	call Function81cbc
	ld a, [de]
	swap a
	call Function81cbc
	inc de
	ld a, [de]
	call Function81cbc
	ld a, [de]
	swap a

Function81cbc:
	and $f
	add DEBUGTEST_0
	ld [hld], a
	ret

Function81cc2:
	ldh a, [hJoyLast]
	and B_BUTTON
	jr nz, .b
	ldh a, [hJoyLast]
	and A_BUTTON
	jr nz, .a
	ld a, [wcf64]
	and $3
	ld e, a
	ld d, 0
	ld hl, Jumptable_81d02
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.b
	ld a, 4
	ld [wJumptableIndex], a
	ret

.a
	ld a, [wd002]
	and a
	ret nz
	ld a, [wd003]
	xor %00000100
	ld [wd003], a
	ld c, a
	ld b, 0
	ld hl, PokemonPalettes
	add hl, bc
	call DebugColor_InitMonColor2
	ld a, 0
	ld [wJumptableIndex], a
	ret

Jumptable_81d02:
	dw DebugColor_SelectColorBox
	dw DebugColor_ChangeRedValue
	dw DebugColor_ChangeGreenValue
	dw DebugColor_ChangeBlueValue

DebugColor_SelectColorBox:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, DebugColor_NextRGBColor
	ld a, [hl]
	and D_LEFT
	jr nz, .lightcolor
	ld a, [hl]
	and D_RIGHT
	jr nz, .darkcolor
	ret

.lightcolor
	xor a
	ld [wcf65], a
	ld de, wc608
	call DebugColor_CalculateRGB
	ret

.darkcolor
	ld a, $1
	ld [wcf65], a
	ld de, wc608 + 2
	call DebugColor_CalculateRGB
	ret

DebugColor_ChangeRedValue:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, DebugColor_NextRGBColor
	ld a, [hl]
	and D_UP
	jr nz, DebugColor_PreviousRGBColor
	ld hl, wc608 + 10
	jr DebugColor_UpdateSpriteColor

DebugColor_ChangeGreenValue:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, DebugColor_NextRGBColor
	ld a, [hl]
	and D_UP
	jr nz, DebugColor_PreviousRGBColor
	ld hl, wc608 + 11
	jr DebugColor_UpdateSpriteColor

DebugColor_ChangeBlueValue:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, DebugColor_PreviousRGBColor
	ld hl, wc608 + 12

DebugColor_UpdateSpriteColor:
	ldh a, [hJoyLast]
	and D_RIGHT
	jr nz, .increment_color_value
	ldh a, [hJoyLast]
	and D_LEFT
	jr nz, .decrement_color_value
	ret

.increment_color_value:
	ld a, [hl]
	cp 31
	ret nc
	inc [hl]
	jr .done

.decrement_color_value:
	ld a, [hl]
	and a
	ret z
	dec [hl]

.done:
	call DebugColor_CalculatePalette
	ld a, 2
	ld [wJumptableIndex], a
	ret

DebugColor_PreviousRGBColor:
	ld hl, wcf64
	dec [hl]
	ret

DebugColor_NextRGBColor:
	ld hl, wcf64
	inc [hl]
	ret

Function81d8e:
	hlcoord 0, 10
	ld bc, SCREEN_WIDTH * 8
	ld a, DEBUGTEST_BLACK
	call ByteFill
	hlcoord 2, 12
	ld de, DebugColor_AreYouFinishedString
	call PlaceString
	xor a
	ld [wd004], a
	call Function81df4
	ld a, 5
	ld [wJumptableIndex], a
	ret

Function81daf:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .cancel
	call DebugColor_TMHMJoypad
	ret

.cancel
	ld a, 0
	ld [wJumptableIndex], a
	ret

.exit ; unreferenced
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

DebugColor_TMHMJoypad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret

.up
	ld a, [wd004]
	cp NUM_TM_HM_TUTOR - 1
	jr z, .wrap_down
	inc a
	jr .done

.wrap_down
	xor a
	jr .done

.down
	ld a, [wd004]
	and a
	jr z, .wrap_up
	dec a
	jr .done

.wrap_up
	ld a, NUM_TM_HM_TUTOR - 1

.done
	ld [wd004], a
	call Function81df4
	ret

Function81df4:
	hlcoord 10, 11
	call Function81e5e
	hlcoord 10, 12
	call Function81e5e
	hlcoord 10, 13
	call Function81e5e
	hlcoord 10, 14
	call Function81e5e
	ld a, [wd004]
	inc a
	ld [wTempTMHM], a
	predef GetTMHMMove
	ld a, [wTempTMHM]
	ld [wPutativeTMHMMove], a
	call GetMoveName
	hlcoord 10, 12
	call PlaceString
	ld a, [wd004]
	call Function81e55
	ld [wCurItem], a
	predef CanLearnTMHMMove
	ld a, c
	and a
	ld de, DebugColor_AbleText
	jr nz, .place_string
	ld de, DebugColor_NotAbleText
.place_string
	hlcoord 10, 14
	call PlaceString
	ret

DebugColor_AbleText:
	db "おぼえられる@" ; Learnable

DebugColor_NotAbleText:
	db "おぼえられない@" ; Not learnable

Function81e55:
	cp NUM_TMS
	jr c, .tm
; .hm
	inc a
	inc a
.tm
	add TM01
	ret

Function81e5e:
	ld bc, 10
	ld a, DEBUGTEST_BLACK
	call ByteFill
	ret

DebugColor_CalculatePalette:
	ld a, [wc608 + 10]
	and %00011111
	ld e, a
	ld a, [wc608 + 11]
	and %00000111
	sla a
	swap a
	or e
	ld e, a
	ld a, [wc608 + 11]
	and %00011000
	sla a
	swap a
	ld d, a
	ld a, [wc608 + 12]
	and %00011111
	sla a
	sla a
	or d
	ld d, a
	ld a, [wcf65]
	and a
	jr z, .LightPalette

; .DarkPalette
	ld a, e
	ld [wc608 + 2], a
	ld a, d
	ld [wc608 + 3], a
	ret

.LightPalette
	ld a, e
	ld [wc608], a
	ld a, d
	ld [wc608 + 1], a
	ret

DebugColor_CalculateRGB:
	ld a, [de]
	and %00011111
	ld [wc608 + 10], a
	ld a, [de]
	and %11100000
	swap a
	srl a
	ld b, a
	inc de
	ld a, [de]
	and %00000011
	swap a
	srl a
	or b
	ld [wc608 + 11], a
	ld a, [de]
	and %01111100
	srl a
	srl a
	ld [wc608 + 12], a
	ret

DebugColor_BackupSpriteColors:
	ld a, [wcf66]
	inc a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, wOverworldMapBlocks ; MonPalette
	add hl, de
	ld e, l
	ld d, h
	ld hl, wc608
	ld bc, 4
	call CopyBytes
	ret

Function81ee3:
; Set palette buffer
.loop
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .loop
	ret

DebugColor_FillBoxWithByte:
; For some reason, we have another copy of FillBoxWithByte here
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

Function81f0c:
	ld a, [wcfbe]
	push af
	set 7, a
	ld [wcfbe], a
	call DebugColor_PushSGBPals
	pop af
	ld [wcfbe], a
	ret

DebugColor_PushSGBPals:
	ld a, [hl]
	and $7
	ret z
	ld b, a
.loop
	push bc
	xor a
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
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
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	rr d
	dec e
	jr nz, .loop3
	dec b
	jr nz, .loop2
	ld a, $20
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	ld de, 7000
.wait
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .wait
	pop bc
	dec b
	jr nz, .loop
	ret

DebugColor_PlaceCursor:
	ld a, DEBUGTEST_BLACK
	hlcoord 10, 0
	ld [hl], a
	hlcoord 15, 0
	ld [hl], a
	hlcoord 1, 11
	ld [hl], a
	hlcoord 1, 13
	ld [hl], a
	hlcoord 1, 15
	ld [hl], a
	ld a, [wJumptableIndex]
	cp 3
	jr nz, .clearsprites
	ld a, [wcf64]
	and a
	jr z, .place_cursor
	dec a
	hlcoord 1, 11
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld [hl], "▶"

.place_cursor
	ld a, [wcf65]
	and a
	jr z, .lightcolor

; .darkcolor
	hlcoord 15, 0
	jr .place

.lightcolor
	hlcoord 10, 0

.place
	ld [hl], "▶"
	ld b, $70
	ld c, $5
	ld hl, wVirtualOAM
	ld de, wc608 + 10
	call .placesprite
	ld de, wc608 + 11
	call .placesprite
	ld de, wc608 + 12
	call .placesprite
	ret

.placesprite
	ld a, b
	ld [hli], a ; y
	ld a, [de]
	add a
	add a
	add 3 * TILE_WIDTH
	ld [hli], a ; x
	xor a
	ld [hli], a ; tile id
	ld a, c
	ld [hli], a ; attributes
	ld a, 2 * TILE_WIDTH
	add b
	ld b, a
	inc c
	ret

.clearsprites
	call ClearSprites
	ret

DebugColor_AreYouFinishedString:
	db   "おわりますか？" ; Are you finished?
	next "はい<DOT><DOT><DOT>", DEBUGTEST_A ; YES...(A)
	next "いいえ<DOT><DOT>", DEBUGTEST_B ; NO..(B)
	db   "@"

DebugUpArrowGFX:
INCBIN "gfx/debug/up_arrow.2bpp"

DebugColor_GFX:
INCBIN "gfx/debug/color_test.2bpp"

TilesetColorPicker:
; A debug function to test tileset palettes at runtime.
; dummied out
	ret
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ldh [hMapAnims], a
	call ClearSprites
	call OverworldTextModeSwitch
	call WaitBGMap2
	xor a
	ldh [hBGMapMode], a
	ld de, DebugColor_GFX
	ld hl, vTiles2 tile DEBUGTEST_TICKS_1
	lb bc, BANK(DebugColor_GFX), 22
	call Request2bpp
	ld de, DebugUpArrowGFX
	ld hl, vTiles1
	lb bc, BANK(DebugUpArrowGFX), 1
	call Request2bpp
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, DEBUGTEST_BLACK
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, PAL_BG_TEXT
	call ByteFill
	decoord 1, 1, 0
	ld a, DEBUGTEST_WHITE
	call DebugTileset_DrawColorSwatch
	decoord 6, 1, 0
	ld a, DEBUGTEST_LIGHT
	call DebugTileset_DrawColorSwatch
	decoord 11, 1, 0
	ld a, DEBUGTEST_DARK
	call DebugTileset_DrawColorSwatch
	decoord 16, 1, 0
	ld a, DEBUGTEST_BLACK
	call DebugTileset_DrawColorSwatch
	call DebugTileset_LoadRGBMeter
	call Function8220f
	call WaitBGMap2
	ld [wJumptableIndex], a
	ld a, $40
	ldh [hWY], a
	ret

DebugTileset_DrawColorSwatch:
	hlcoord 0, 0
	call _DebugColor_DrawSwatch

DebugColor_DrawAttributeSwatch:
	ld a, [wcf64]
	hlcoord 0, 0, wAttrmap

_DebugColor_DrawSwatch:
; Fills a 4x3 box at de with byte a.
	add hl, de
rept 4
	ld [hli], a
endr
rept 2
	ld bc, SCREEN_WIDTH - 4
	add hl, bc
rept 4
	ld [hli], a
endr
endr
	ret

DebugTileset_LoadRGBMeter:
	hlcoord 2, 4
	call .Place
	hlcoord 2, 6
	call .Place
	hlcoord 2, 8
.Place:
	ld a, DEBUGTEST_TICKS_1
	ld [hli], a
	ld bc, 15
	ld a, DEBUGTEST_TICKS_2
	call ByteFill
	ret

Function8220f:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld a, [wcf64]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wBGPals1
	add hl, de
	ld de, wc608
	ld bc, 1 palettes
	call CopyBytes
	ld de, wc608
	call DebugColor_CalculateRGB

	pop af
	ldh [rSVBK], a
	ret

DebugColorMain2: ; unreferenced
	ld hl, hJoyLast
	ld a, [hl]
	and SELECT
	jr nz, .loop7
	ld a, [hl]
	and B_BUTTON
	jr nz, .cancel
	call Function822f0
	ret

.loop7
	ld hl, wcf64
	ld a, [hl]
	inc a
	and PALETTE_MASK
	cp PAL_BG_TEXT
	jr nz, .palette_ok
	xor a ; PAL_BG_GRAY
.palette_ok
	ld [hl], a
	decoord 1, 1, 0
	call DebugColor_DrawAttributeSwatch
	decoord 6, 1, 0
	call DebugColor_DrawAttributeSwatch
	decoord 11, 1, 0
	call DebugColor_DrawAttributeSwatch
	decoord 16, 1, 0
	call DebugColor_DrawAttributeSwatch
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a
	ld hl, wBGPals2
	ld a, [wcf64]
	ld bc, 1 palettes
	call AddNTimes
	ld de, wc608
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ld a, 2
	ldh [hBGMapMode], a
	ld c, 3
	call DelayFrames
	ld a, 1
	ldh [hBGMapMode], a
	ret

.cancel
	call ClearSprites
	ldh a, [hWY]
	xor %11010000
	ldh [hWY], a
	ret

Function822a3:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a
	ld hl, wBGPals2
	ld a, [wcf64]
	ld bc, 1 palettes
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wc608
	ld bc, 1 palettes
	call CopyBytes
	hlcoord 1, 0
	ld de, wc608
	call Function81ca7
	hlcoord 6, 0
	ld de, wc608 + 2
	call Function81ca7
	hlcoord 11, 0
	ld de, wc608 + 4
	call Function81ca7
	hlcoord 16, 0
	ld de, wc608 + 6
	call Function81ca7
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	call DelayFrame
	ret

Function822f0:
	ld a, [wcf65]
	and 3
	ld e, a
	ld d, 0
	ld hl, .PointerTable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.PointerTable:
	dw DebugColor_SelectColorBox2
	dw Function82339 ; Red
	dw Function8234b ; Green
	dw Function8235d ; Blue

DebugColor_SelectColorBox2:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function8238c
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ret

.left
	ld a, [wcf66]
	dec a
	jr .done

.right
	ld a, [wcf66]
	inc a

.done
	and $3
	ld [wcf66], a
	ld e, a
	ld d, 0
	ld hl, wc608
	add hl, de
	add hl, de
	ld e, l
	ld d, h
	call DebugColor_CalculateRGB
	ret

Function82339:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function8238c
	ld a, [hl]
	and D_UP
	jr nz, Function82387
	ld hl, wc608 + 10
	jr Function82368

Function8234b:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function8238c
	ld a, [hl]
	and D_UP
	jr nz, Function82387
	ld hl, wc608 + 11
	jr Function82368

Function8235d:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Function82387
	ld hl, wc608 + 12

Function82368:
	ldh a, [hJoyLast]
	and D_RIGHT
	jr nz, .right
	ldh a, [hJoyLast]
	and D_LEFT
	jr nz, .left
	ret

.right
	ld a, [hl]
	cp 31
	ret nc
	inc [hl]
	jr .done

.left
	ld a, [hl]
	and a
	ret z
	dec [hl]

.done
	call Function82391
	call Function822a3
	ret

Function82387:
	ld hl, wcf65
	dec [hl]
	ret

Function8238c:
	ld hl, wcf65
	inc [hl]
	ret

Function82391:
	ld a, [wc608 + 10]
	and %00011111
	ld e, a
	ld a, [wc608 + 11]
	and %0000111
	sla a
	swap a
	or e
	ld e, a
	ld a, [wc608 + 11]
	and %00011000
	sla a
	swap a
	ld d, a
	ld a, [wc608 + 12]
	and %00011111
	sla a
	sla a
	or d
	ld d, a
	ld a, [wcf66]
	ld c, a
	ld b, 0
	ld hl, wc608
	add hl, bc
	add hl, bc
	ld a, e
	ld [hli], a
	ld [hl], d
	ret

; unused
	ret

; unused
	ret
