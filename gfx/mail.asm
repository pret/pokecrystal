ReadPartyMonMail: ; b9229
	ld a, [CurPartyMon]
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
ReadAnyMail: ; b9237
	push de
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call LoadFontsExtra
	pop de
	push de
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	callba IsMailEuropean
	call CloseSRAM
	ld a, c
	ld de, StandardEnglishFont
	or a
	jr z, .got_font
	ld de, FrenchGermanFont
	sub $3
	jr c, .got_font
	ld de, SpanishItalianFont

.got_font
	ld hl, VTiles1
	lb bc, BANK(StandardEnglishFont), $80
	call Get1bpp
	pop de
	call .LoadGFX
	call EnableLCD
	call WaitBGMap
	ld a, [Buffer3]
	ld e, a
	callba LoadMailPalettes
	call SetPalettes
	xor a
	ld [hJoyPressed], a
	call .loop
	call ClearBGPalettes
	call DisableLCD
	call LoadStandardFont
	jp EnableLCD

.loop
	call GetJoypad
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON | START
	jr z, .loop
	and START
	jr nz, .pressed_start
	ret

.pressed_start
	ld a, [wJumptableIndex]
	push af
	callab PrintMail ; printer
	pop af
	ld [wJumptableIndex], a
	jr .loop
; b92b8

.LoadGFX: ; b92b8
	ld h, d
	ld l, e
	push hl
	ld a, $0
	call GetSRAMBank
	ld de, sPartyMon1MailAuthorID - sPartyMon1Mail
	add hl, de
	ld a, [hli]
	ld [Buffer1], a
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hli]
	ld [CurPartySpecies], a
	ld b, [hl]
	call CloseSRAM
	ld hl, MailGFXPointers
	ld c, 0
.loop2
	ld a, [hli]
	cp b
	jr z, .got_pointer
	cp -1
	jr z, .invalid
	inc c
	inc hl
	inc hl
	jr .loop2

.invalid
	ld hl, MailGFXPointers
	inc hl

.got_pointer
	ld a, c
	ld [Buffer3], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .done
	pop bc
	push de
	jp hl
.done
	ret
; b92f8

MailGFXPointers: ; b92f8
	dbw FLOWER_MAIL,  LoadFlowerMailGFX
	dbw SURF_MAIL,    LoadSurfMailGFX
	dbw LITEBLUEMAIL, LoadLiteBlueMailGFX
	dbw PORTRAITMAIL, LoadPortraitMailGFX
	dbw LOVELY_MAIL,  LoadLovelyMailGFX
	dbw EON_MAIL,     LoadEonMailGFX
	dbw MORPH_MAIL,   LoadMorphMailGFX
	dbw BLUESKY_MAIL, LoadBlueSkyMailGFX
	dbw MUSIC_MAIL,   LoadMusicMailGFX
	dbw MIRAGE_MAIL,  LoadMirageMailGFX
	db -1
; b9317

LoadSurfMailGFX: ; b9317
	push bc
	ld hl, VTiles2 tile $31
	ld de, SurfMailBorderGFX
	ld c, 8 * 8
	call LoadMailGFX_Color2
	ld de, MailLaprasGFX
	ld c, 6 * 8
	call LoadMailGFX_Color3
	ld de, SurfMailWaveGFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	jr FinishLoadingSurfLiteBlueMailGFX

LoadLiteBlueMailGFX: ; b9335
	push bc
	ld hl, VTiles2 tile $31
	ld de, LiteBlueMailBorderGFX
	ld c, 8 * 8
	call LoadMailGFX_Color2
	ld de, MailDratiniGFX
	ld c, 6 * 8
	call LoadMailGFX_Color3
	ld de, PortraitMailUnderlineGFX
	ld c, 1 * 8
	call LoadMailGFX_Color2

FinishLoadingSurfLiteBlueMailGFX: ; b9351
	ld de, SurfLiteBlueMailSmallShapesGFX
	ld c, 2 * 8
	call LoadMailGFX_Color2
	ld c, 2 * 8
	call LoadMailGFX_Color1
	ld de, SurfLiteBlueMailLargeShapesGFX
	ld c, 8 * 8
	call LoadMailGFX_Color1
	ld c, 8 * 8
	call LoadMailGFX_Color2

	call DrawMailBorder
	hlcoord 2, 15
	ld a, $3f
	call Mail_Draw16TileRow
	ld a, $39
	hlcoord 15, 14
	call Mail_Draw3x2Graphic
	ld a, $44
	hlcoord 2, 2
	call Mail_Draw2x2Graphic
	hlcoord 15, 11
	call Mail_Draw2x2Graphic
	ld a, $4c
	hlcoord 3, 12
	call Mail_Draw2x2Graphic
	hlcoord 15, 2
	call Mail_Draw2x2Graphic
	ld a, $50
	hlcoord 6, 3
	call Mail_Draw2x2Graphic
	ld a, $40
	hlcoord 13, 2
	ld [hli], a
	hlcoord 6, 14
	ld [hl], a
	ld a, $41
	hlcoord 4, 5
	ld [hli], a
	hlcoord 17, 5
	ld [hli], a
	hlcoord 13, 12
	ld [hl], a
	ld a, $42
	hlcoord 9, 2
	ld [hli], a
	hlcoord 14, 5
	ld [hli], a
	hlcoord 3, 10
	ld [hl], a
	ld a, $43
	hlcoord 6, 11
	ld [hli], a
	pop hl
	jp MailGFX_PlaceMessage
; b93d2

LoadEonMailGFX: ; b93d2
	push bc
	ld hl, VTiles2 tile $31
	ld de, EonMailBorder1GFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld de, EonMailBorder2GFX
	ld c, 1 * 8
	call LoadMailGFX_Color1
	ld de, EonMailBorder2GFX
	ld c, 1 * 8
	call LoadMailGFX_Color1
	ld de, EonMailBorder1GFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld de, EonMailBorder3GFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld de, MailEeveeGFX
	ld c, 6 * 8
	call LoadMailGFX_Color3
	ld hl, VTiles2 tile $3d
	ld de, MailLargeCircleGFX
	ld c, 4 * 8
	call LoadMailGFX_Color1
	ld de, EonMailBorder2GFX
	ld c, 1 * 8
	call LoadMailGFX_Color2

	ld a, $31
	hlcoord 0, 0
	call Mail_Place18TileAlternatingRow
	hlcoord 1, 17
	call Mail_Place18TileAlternatingRow
	ld a, $33
	hlcoord 0, 1
	call Mail_Place16TileAlternatingColumn
	hlcoord 19, 0
	call Mail_Place16TileAlternatingColumn
	hlcoord 2, 15
	ld a, $35
	call Mail_Draw16TileRow
	inc a
	hlcoord 15, 14
	call Mail_Draw3x2Graphic
	call LovelyEonMail_PlaceIcons
	pop hl
	jp MailGFX_PlaceMessage
; b944b

LoadLovelyMailGFX: ; b944b
	push bc
	ld hl, VTiles2 tile $31
	ld de, LovelyMailBorderGFX
	ld c, 5 * 8
	call LoadMailGFX_Color2
	ld de, MailPoliwagGFX
	ld c, 6 * 8
	call LoadMailGFX_Color3
	ld de, LovelyMailUnderlineGFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld de, LovelyMailLargeHeartGFX
	ld c, 4 * 8
	call LoadMailGFX_Color2
	ld de, LovelyMailSmallHeartGFX
	ld c, 1 * 8
	call LoadMailGFX_Color1

	call DrawMailBorder2
	hlcoord 2, 15
	ld a, $3c
	call Mail_Draw16TileRow
	ld a, $36
	hlcoord 15, 14
	call Mail_Draw3x2Graphic
	call LovelyEonMail_PlaceIcons
	pop hl
	jp MailGFX_PlaceMessage
; b9491

LovelyEonMail_PlaceIcons: ; b9491
	ld a, $3d
	hlcoord 2, 2
	call Mail_Draw2x2Graphic
	hlcoord 16, 2
	call Mail_Draw2x2Graphic
	hlcoord 9, 4
	call Mail_Draw2x2Graphic
	hlcoord 2, 11
	call Mail_Draw2x2Graphic
	hlcoord 6, 12
	call Mail_Draw2x2Graphic
	hlcoord 12, 11
	call Mail_Draw2x2Graphic
	ld a, $41
	hlcoord 5, 4
	ld [hl], a
	hlcoord 6, 2
	ld [hl], a
	hlcoord 12, 4
	ld [hl], a
	hlcoord 14, 2
	ld [hl], a
	hlcoord 3, 13
	ld [hl], a
	hlcoord 9, 11
	ld [hl], a
	hlcoord 16, 12
	ld [hl], a
	ret
; b94d6

LoadMorphMailGFX: ; b94d6
	push bc
	ld hl, VTiles2 tile $31
	ld bc, 5 * 8
	call MailGFX_GenerateMonochromeTilesColor2
	ld de, MorphMailBorderGFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld de, MorphMailBorderCorner1GFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld de, MorphMailBorderCorner2GFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld de, EonMailBorder1GFX
	ld c, 1 * 8
	call LoadMailGFX_Color1
	ld de, MorphMailDividerGFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld de, MailDittoGFX
	ld c, 6 * 8
	call LoadMailGFX_Color3
	call DrawMailBorder2
	ld a, $31
	hlcoord 1, 1
	call Mail_Draw2x2Graphic
	hlcoord 17, 15
	call Mail_Draw2x2Graphic
	hlcoord 1, 3
	ld [hl], a
	hlcoord 3, 1
	ld [hl], a
	hlcoord 16, 16
	ld [hl], a
	hlcoord 18, 14
	ld [hl], a
	ld a, $36
	hlcoord 1, 4
	ld [hl], a
	hlcoord 2, 3
	ld [hl], a
	hlcoord 3, 2
	ld [hl], a
	hlcoord 4, 1
	ld [hl], a
	inc a
	hlcoord 15, 16
	ld [hl], a
	hlcoord 16, 15
	ld [hl], a
	hlcoord 17, 14
	ld [hl], a
	hlcoord 18, 13
	ld [hl], a
	inc a
	hlcoord 2, 15
	ld b, $e
	call Mail_DrawRowLoop
	inc a
	hlcoord 2, 11
	call Mail_Draw16TileRow
	hlcoord 2, 5
	call Mail_Draw16TileRow
	inc a
	hlcoord 6, 1
	call Mail_Draw13TileRow
	hlcoord 1, 16
	call Mail_Draw13TileRow
	inc a
	hlcoord 3, 13
	call Mail_Draw3x2Graphic
	pop hl
	jp MailGFX_PlaceMessage
; b9582

LoadBlueSkyMailGFX: ; b9582
	push bc
	ld hl, VTiles2 tile $31
	ld de, EonMailBorder1GFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld a, $ff
	ld bc, 1 tiles
	call ByteFill
	ld de, BlueSkyMailGrassGFX
	ld c, 1 * 8
	call LoadMailGFX_Color3
	ld de, MailDragoniteGFX
	ld c, 23 * 8
	call LoadMailGFX_Color3
	ld de, MailCloudGFX
	ld c, 6 * 8
	call LoadMailGFX_Color1
	ld de, FlowerMailSenderUnderlineGFX
	ld c, 1 * 8
	call LoadMailGFX_Color1
	ld de, MailCloudGFX
	ld c, 1 * 8
	call LoadMailGFX_Color1
	ld de, MailCloud2GFX
	ld c, 2 * 8
	call LoadMailGFX_Color1
	ld de, MailCloud3GFX
	ld c, 1 * 8
	call LoadMailGFX_Color1

	ld a, $31
	hlcoord 0, 0
	call Mail_DrawFullWidthBorder
	hlcoord 0, 1
	call Mail_DrawLeftRightBorder
	hlcoord 19, 1
	call Mail_DrawLeftRightBorder
	inc a
	hlcoord 0, 17
	call Mail_DrawFullWidthBorder
	inc a
	hlcoord 0, 16
	call Mail_DrawFullWidthBorder
	inc a
	hlcoord 2, 2
	call Mail_Place6TileRow
	hlcoord 3, 3
	call Mail_Place6TileRow
	hlcoord 4, 4
	call Mail_Place6TileRow
	dec hl
	ld [hl], $7f
	dec a
	hlcoord 15, 14
	call Mail_Draw2x2Graphic
	add $4
	hlcoord 15, 16
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	push af
	hlcoord 12, 1
	call Mail_Draw3x2Graphic
	pop af
	hlcoord 15, 4
	call Mail_Draw3x2Graphic
	inc a
	hlcoord 2, 11
	call Mail_Draw16TileRow
	inc a
	hlcoord 10, 3
	call Mail_Draw2x2Graphic
	pop hl
	jp MailGFX_PlaceMessage
; b9636

Mail_Place6TileRow: ; b9636
	ld b, $6
.loop
	ld [hli], a
	inc a
	dec b
	jr nz, .loop
	ret
; b963e

LoadFlowerMailGFX: ; b963e
	push bc
	ld hl, VTiles2 tile $31
	ld de, FlowerMailBorderGFX
	ld c, 8 * 8
	call LoadMailGFX_Color1
	ld de, MailOddishGFX
	ld c, 4 * 8
	call LoadMailGFX_Color3
	ld de, FlowerMailSenderUnderlineGFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld de, FlowerMailLargeFlowerGFX
	ld c, 4 * 8
	call LoadMailGFX_Color1
	ld c, 4 * 8
	call LoadMailGFX_Color2

	call DrawMailBorder
	hlcoord 2, 15
	ld a, $3d ; underline
	call Mail_Draw16TileRow
	ld a, $39 ; oddish
	hlcoord 16, 13
	call Mail_Draw2x2Graphic
	hlcoord 2, 13
	call Mail_Draw2x2Graphic
	ld a, $3e
	hlcoord 2, 2
	call Mail_Draw2x2Graphic
	hlcoord 5, 3
	call Mail_Draw2x2Graphic
	hlcoord 10, 2
	call Mail_Draw2x2Graphic
	hlcoord 16, 3
	call Mail_Draw2x2Graphic
	hlcoord 5, 11
	call Mail_Draw2x2Graphic
	hlcoord 16, 10
	call Mail_Draw2x2Graphic
	ld a, $42
	hlcoord 3, 4
	call Mail_Draw2x2Graphic
	hlcoord 12, 3
	call Mail_Draw2x2Graphic
	hlcoord 14, 2
	call Mail_Draw2x2Graphic
	hlcoord 2, 10
	call Mail_Draw2x2Graphic
	hlcoord 14, 11
	call Mail_Draw2x2Graphic
	pop hl
	jp MailGFX_PlaceMessage
; b96ca

LoadPortraitMailGFX: ; b96ca
	push bc
	ld hl, VTiles2 tile $31
	ld de, PortraitMailBorderGFX
	ld c, 5 * 8
	call LoadMailGFX_Color2
	ld de, PortraitMailUnderlineGFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld hl, VTiles2 tile $3d
	ld de, PortraitMailLargePokeballGFX
	ld c, 4 * 8
	call LoadMailGFX_Color1
	ld de, PortraitMailSmallPokeballGFX
	ld c, 1 * 8
	call LoadMailGFX_Color2

	call DrawMailBorder2
	hlcoord 8, 15
	ld a, $36
	ld b, $a
	call Mail_DrawRowLoop
	call LovelyEonMail_PlaceIcons
	ld a, $1
	ld [UnownLetter], a
	hlcoord 1, 10
	call PrepMonFrontpic
	pop hl
	jp MailGFX_PlaceMessage
; b9710

LoadMusicMailGFX: ; b9710
	push bc
	ld hl, VTiles2 tile $31
	ld de, MusicMailBorderGFX
	ld c, 4 * 8
	call LoadMailGFX_Color2
	ld de, MorphMailBorderCorner2GFX
	ld c, 2 * 8
	call LoadMailGFX_Color2
	ld de, MailNatuGFX
	ld c, 6 * 8
	call LoadMailGFX_Color3
	xor a
	ld bc, 1 tiles
	call ByteFill
	ld de, MusicMailLargeNoteGFX
	ld c, 3 * 8
	call LoadMailGFX_Color1
	ld de, MusicMailSmallNoteGFX
	ld c, 1 * 8
	call LoadMailGFX_Color1

	ld a, $31
	hlcoord 0, 0
	call Mail_Place18TileAlternatingRow
	hlcoord 1, 17
	call Mail_Place18TileAlternatingRow
	ld a, $33
	hlcoord 0, 1
	call Mail_Place16TileAlternatingColumn
	hlcoord 19, 0
	call Mail_Place16TileAlternatingColumn
	ld a, $35
	hlcoord 2, 15
	call Mail_Place14TileAlternatingRow
	ld a, $37
	hlcoord 15, 14
	call Mail_Draw3x2Graphic
	call LovelyEonMail_PlaceIcons
	pop hl
	jp MailGFX_PlaceMessage
; b9776

LoadMirageMailGFX: ; b9776
	push bc
	ld hl, VTiles2 tile $31
	ld bc, 5 * 8
	call MailGFX_GenerateMonochromeTilesColor2
	ld de, BlueSkyMailGrassGFX
	ld c, 1 * 8
	call LoadMailGFX_Color2
	ld de, MailMewGFX
	ld c, 18 * 8
	call LoadMailGFX_Color2
	ld de, MirageMailTopDividerGFX
	ld c, 1 * 8
	call LoadMailGFX_Color1
	ld de, MirageMailBottomDividerGFX
	ld c, 1 * 8
	call LoadMailGFX_Color1

	call DrawMailBorder2
	ld a, $36
	hlcoord 1, 16
	call Mail_DrawTopBottomBorder
	inc a
	hlcoord 15, 14
	call Mail_Draw3x2Graphic
	inc a
	hlcoord 15, 16
	ld [hli], a
	inc a
	ld [hl], a
	ld a, $3f
	hlcoord 1, 1
	call Mail_Place18TileAlternatingRow
	ld a, $41
	hlcoord 0, 2
	call Mail_Place14TileAlternatingColumn
	ld a, $43
	hlcoord 19, 2
	call Mail_Place14TileAlternatingColumn
	ld a, $45
	hlcoord 0, 1
	ld [hl], a
	inc a
	hlcoord 19, 1
	ld [hl], a
	inc a
	hlcoord 0, 16
	ld [hl], a
	inc a
	hlcoord 19, 16
	ld [hl], a
	inc a
	hlcoord 2, 5
	call Mail_Draw16TileRow
	inc a
	hlcoord 2, 11
	call Mail_Draw16TileRow
	pop hl
	jp MailGFX_PlaceMessage
; b97f8

MailGFX_GenerateMonochromeTilesColor2: ; b97f8
.loop
	xor a
	ld [hli], a
	ld a, $ff
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret
; b9803

MailGFX_PlaceMessage: ; b9803
	ld bc, MAIL_STRUCT_LENGTH
	ld de, wTempMail
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	call CopyBytes
	call CloseSRAM
	ld hl, wTempMailAuthor
	ld de, wMonOrItemNameBuffer
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [wTempMailAuthor], a
	ld [wMonOrItemNameBuffer + NAME_LENGTH - 1], a
	ld de, wTempMailMessage
	hlcoord 2, 7
	call PlaceString
	ld de, wMonOrItemNameBuffer
	ld a, [de]
	and a
	ret z
	ld a, [Buffer3]
	hlcoord 8, 14
	cp $3 ; PORTRAITMAIL
	jr z, .place_author
	hlcoord 6, 14
	cp $6 ; MORPH_MAIL
	jr z, .place_author
	hlcoord 5, 14

.place_author
	jp PlaceString
; b984e

Functionb984e: ; b984e
; XXX
.loop
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret
; b9858

DrawMailBorder: ; b9858
	hlcoord 0, 0
	ld a, $31
	ld [hli], a
	inc a
	call Mail_DrawTopBottomBorder
	inc a
	ld [hli], a
	inc a
	call Mail_DrawLeftRightBorder
	ld a, $36
	ld [hli], a
	inc a
	call Mail_DrawTopBottomBorder
	hlcoord 19, 1
	ld a, $35
	call Mail_DrawLeftRightBorder
	ld a, $38
	ld [hl], a
	ret
; b987b

DrawMailBorder2: ; b987b
	hlcoord 0, 0
	ld a, $31
	ld [hli], a
	inc a
	call Mail_DrawTopBottomBorder
	ld [hl], $31
	inc hl
	inc a
	call Mail_DrawLeftRightBorder
	ld [hl], $31
	inc hl
	inc a
	call Mail_DrawTopBottomBorder
	hlcoord 19, 1
	ld a, $35
	call Mail_DrawLeftRightBorder
	ld [hl], $31
	ret
; b989e

Mail_Place14TileAlternatingRow: ; b989e
	push af
	ld b, 14 / 2
	jr Mail_PlaceAlternatingRow

Mail_Place16TileAlternatingRow: ; b98a3
	push af
	ld b, 16 / 2
	jr Mail_PlaceAlternatingRow

Mail_Place18TileAlternatingRow: ; b98a8
	push af
	ld b, 18 / 2

Mail_PlaceAlternatingRow: ; b98ab
.loop
	ld [hli], a
	inc a
	ld [hli], a
	dec a
	dec b
	jr nz, .loop
	ld [hl], a
	pop af
	ret
; b98b5

Mail_Place14TileAlternatingColumn: ; b98b5
	push af
	ld b, 14 / 2
	jr Mail_PlaceAlternatingColumn

Mail_Place16TileAlternatingColumn: ; b98ba
	push af
	ld b, 16 / 2

Mail_PlaceAlternatingColumn: ; b98bd
.loop
	ld [hl], a
	ld de, SCREEN_WIDTH
	add hl, de
	inc a
	ld [hl], a
	add hl, de
	dec a
	dec b
	jr nz, .loop
	ld [hl], a
	pop af
	ret
; b98cc

Mail_Draw7TileRow: ; b98cc
	ld b, $7
	jr Mail_DrawRowLoop

Mail_Draw13TileRow: ; b98d0
	ld b, $d
	jr Mail_DrawRowLoop

Mail_Draw16TileRow: ; b98d4
	ld b, $10
	jr Mail_DrawRowLoop

Mail_DrawTopBottomBorder: ; b98d8
	ld b, SCREEN_WIDTH - 2
	jr Mail_DrawRowLoop

Mail_DrawFullWidthBorder: ; b98dc
	ld b, SCREEN_WIDTH

Mail_DrawRowLoop: ; b98de
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret
; b98e3

Mail_DrawLeftRightBorder: ; b98e3
	ld b, SCREEN_HEIGHT - 2
	ld de, SCREEN_WIDTH
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	ret
; b98ee

Mail_Draw2x2Graphic: ; b98ee
	push af
	ld [hli], a
	inc a
	ld [hl], a
	ld bc, SCREEN_WIDTH - 1
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	pop af
	ret
; b98fc

Mail_Draw3x2Graphic: ; b98fc
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ld bc, SCREEN_WIDTH - 2
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret
; b990c

LoadMailGFX_Color1: ; b990c
.loop
	ld a, [de]
	inc de
	ld [hli], a
	xor a
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; b9915

LoadMailGFX_Color2: ; b9915
.loop
	xor a
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; b991e

LoadMailGFX_Color3: ; b991e
.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; b9926

MorphMailDividerGFX: ; b9926
INCBIN "gfx/mail/0b9926.1bpp"

BlueSkyMailGrassGFX: ; b992e
INCBIN "gfx/mail/0b992e.1bpp"

PortraitMailSmallPokeballGFX: ; b9936
INCBIN "gfx/mail/0b9936.1bpp"

MorphMailBorderCorner2GFX: ; b993e
INCBIN "gfx/mail/0b993e.1bpp"

MusicMailSmallNoteGFX: ; b9946
INCBIN "gfx/mail/0b9946.1bpp"

SurfMailWaveGFX: ; b994e
INCBIN "gfx/mail/0b994e.1bpp"

PortraitMailUnderlineGFX: ; b995e
INCBIN "gfx/mail/0b995e.1bpp"

LovelyMailUnderlineGFX: ; b9966
INCBIN "gfx/mail/0b9966.1bpp"

LovelyMailSmallHeartGFX: ; b996e
INCBIN "gfx/mail/0b996e.1bpp"

SurfLiteBlueMailSmallShapesGFX: ; b9976
INCBIN "gfx/mail/0b9976.1bpp"

EonMailBorder1GFX: ; b997e
INCBIN "gfx/mail/0b997e.1bpp"

EonMailBorder2GFX: ; b998e
INCBIN "gfx/mail/0b998e.1bpp"

MailNatuGFX: ; b9996
INCBIN "gfx/mail/0b9996.1bpp"

MailDratiniGFX: ; b99c6
INCBIN "gfx/mail/0b99c6.1bpp"

MailPoliwagGFX: ; b99f6
INCBIN "gfx/mail/0b99f6.1bpp"

MailLaprasGFX: ; b9a26
INCBIN "gfx/mail/0b9a26.1bpp"

MailEeveeGFX: ; b9a56
INCBIN "gfx/mail/0b9a56.1bpp"

MailDittoGFX: ; b9a86
INCBIN "gfx/mail/0b9a86.1bpp"

MailMewGFX: ; b9ab6
INCBIN "gfx/mail/0b9ab6.1bpp"

MailDragoniteGFX: ; b9b46
INCBIN "gfx/mail/0b9b46.1bpp"

MailSentretGFX: ; b9bce
INCBIN "gfx/mail/0b9bce.1bpp"

MailUnusedGrassGFX: ; b9bee
INCBIN "gfx/mail/0b9bee.1bpp"

PortraitMailLargePokeballGFX: ; b9bfe
INCBIN "gfx/mail/0b9bfe.1bpp"

MailOddishGFX: ; b9c1e
INCBIN "gfx/mail/0b9c1e.1bpp"

SurfLiteBlueMailLargeShapesGFX: ; b9c3e
INCBIN "gfx/mail/0b9c3e.1bpp"

LovelyMailLargeHeartGFX: ; b9c5e
INCBIN "gfx/mail/0b9c5e.1bpp"

MorphMailBorderCorner1GFX: ; b9c7e
INCBIN "gfx/mail/0b9c7e.1bpp"

MorphMailBorderGFX: ; b9c96
INCBIN "gfx/mail/0b9c96.1bpp"

MailLargeCircleGFX: ; b9c9e
INCBIN "gfx/mail/0b9c9e.1bpp"

FlowerMailLargeFlowerGFX: ; b9cbe
INCBIN "gfx/mail/0b9cbe.1bpp"

FlowerMailSmallFlowerGFX: ; b9cde
; indirectly referenced
INCBIN "gfx/mail/0b9cde.1bpp"

MusicMailLargeNoteGFX: ; b9cfe
INCBIN "gfx/mail/0b9cfe.1bpp"

MailCloudGFX: ; b9d16
INCBIN "gfx/mail/0b9d16.1bpp"

MailCloud2GFX: ; b9d26
INCBIN "gfx/mail/0b9d26.1bpp"

MailCloud3GFX: ; b9d3e
INCBIN "gfx/mail/0b9d3e.1bpp"

SurfMailBorderGFX: ; b9d46
INCBIN "gfx/mail/0b9d46.1bpp"

EonMailBorder3GFX: ; b9d76
INCBIN "gfx/mail/0b9d76.1bpp"

FlowerMailBorderGFX: ; b9d86
INCBIN "gfx/mail/0b9d86.1bpp"

FlowerMailSenderUnderlineGFX: ; b9db6
INCBIN "gfx/mail/0b9db6.1bpp"

LiteBlueMailBorderGFX: ; b9dc6
INCBIN "gfx/mail/0b9dc6.1bpp"

MirageMailTopDividerGFX: ; b9dce
INCBIN "gfx/mail/0b9dce.1bpp"

MirageMailBottomDividerGFX: ; b9df6
INCBIN "gfx/mail/0b9df6.1bpp"

MusicMailBorderGFX: ; b9e06
INCBIN "gfx/mail/0b9e06.1bpp"

LovelyMailBorderGFX: ; b9e26
INCBIN "gfx/mail/0b9e26.1bpp"

PortraitMailBorderGFX: ; b9e4e
INCBIN "gfx/mail/0b9e4e.1bpp"


ItemIsMail: ; b9e76
	ld a, d
	ld hl, .items
	ld de, 1
	jp IsInArray
; b9e80

.items
	db FLOWER_MAIL
	db SURF_MAIL
	db LITEBLUEMAIL
	db PORTRAITMAIL
	db LOVELY_MAIL
	db EON_MAIL
	db MORPH_MAIL
	db BLUESKY_MAIL
	db MUSIC_MAIL
	db MIRAGE_MAIL
	db -1
; b9e8b
