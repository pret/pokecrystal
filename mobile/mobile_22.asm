String_89116:
	db "-----@"

String_8911c:
	db   "でんわばんごうが　ただしく" ; Phone number is not
	next "はいって　いません！@"   ; entered correctly!

String_89135:
	db   "データが　かわって　いますが"  ; The data has changed.
	next "かきかえないで　やめますか？@" ; Quit anyway?

String_89153:
	db   "メッセージは　ありません@"    ; No message

OpenSRAMBank4:
	push af
	ld a, $4
	call GetSRAMBank
	pop af
	ret

Function89168:
	ld hl, wGameTimerPause
	set GAMETIMERPAUSE_MOBILE_7_F, [hl]
	ret

Function8916e:
	ld hl, wGameTimerPause
	res GAMETIMERPAUSE_MOBILE_7_F, [hl]
	ret

Function89174:
	ld hl, wGameTimerPause
	bit GAMETIMERPAUSE_MOBILE_7_F, [hl]
	ret

Function8917a:
	ld hl, wd002
	ld bc, $32
	xor a
	call ByteFill
	ret

Function89185:
; strcmp(hl, de, c)
; Compares c bytes starting at de and hl and incrementing together until a mismatch is found.
; Preserves hl and de.
	push de
	push hl
.loop
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .done
	inc hl
	dec c
	jr nz, .loop
.done
	pop hl
	pop de
	ret

Function89193:
; copy(hl, de, 4)
; Copies c bytes from hl to de.
; Preserves hl and de.
	push de
	push hl
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop hl
	pop de
	ret

Function8919e:
; Searches for the c'th string starting at de.  Returns the pointer in de.
	ld a, c
	and a
	ret z
.loop
	ld a, [de]
	inc de
	cp "@"
	jr nz, .loop
	dec c
	jr nz, .loop
	ret

Function891ab:
	call Mobile22_SetBGMapMode1
	farcall ReloadMapPart
	call Mobile22_SetBGMapMode0
	ret

Function891b8:
	call Mobile22_SetBGMapMode0
	hlcoord 0, 0
	ld a, " "
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	call DelayFrame
	ret

Function891ca:
	push bc
	call Function891b8
	call WaitBGMap
	pop bc
	ret

Function891d3:
	push bc
	call Function891ca
	ld c, $10
	call DelayFrames
	pop bc
	ret

Function891de:
	call Mobile22_SetBGMapMode0
	call ClearPalettes
	hlcoord 0, 0, wAttrmap
	ld a, $7
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	hlcoord 0, 0
	ld a, " "
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	call Function891ab
	ret

Function891fe:
	push bc
	call Function891de
	ld c, $10
	call DelayFrames
	pop bc
	ret

Mobile_EnableSpriteUpdates:
	ld a, 1
	ld [wSpriteUpdatesEnabled], a
	ret

Mobile_DisableSpriteUpdates:
	ld a, 0
	ld [wSpriteUpdatesEnabled], a
	ret

Function89215:
	push hl
	push bc
	ld bc, wAttrmap - wTilemap
	add hl, bc
	ld [hl], a
	pop bc
	pop hl
	ret

Function8921f:
	push de
	ld de, SCREEN_WIDTH
	add hl, de
	inc hl
	ld a, $7f
.loop
	push bc
	push hl
.asm_89229
	ld [hli], a
	dec c
	jr nz, .asm_89229
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .loop
	pop de
	ret

Mobile22_PromptButton:
	call JoyWaitAorB
	call PlayClickSFX
	ret

Mobile22_SetBGMapMode0:
	xor a
	ldh [hBGMapMode], a
	ret

Mobile22_SetBGMapMode1:
	ld a, $1
	ldh [hBGMapMode], a
	ret

Function89245:
	farcall TryLoadSaveFile
	ret c
	farcall _LoadData
	and a
	ret

Function89254:
	ld bc, $d07
	jr Function89261

Function89259:
	ld bc, $0e07
	jr Function89261

Function8925e:
	ld bc, $0e0c

Function89261:
	push af
	push bc
	ld hl, MenuHeader_0x892a3
	call CopyMenuHeader
	pop bc
	ld hl, wMenuBorderTopCoord
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	add $4
	ld [hli], a
	ld a, b
	add $5
	ld [hl], a
	pop af
	ld [wMenuCursorBuffer], a
	call PushWindow
	call Mobile22_SetBGMapMode0
	call Mobile_EnableSpriteUpdates
	call VerticalMenu
	push af
	ld c, $a
	call DelayFrames
	call CloseWindow
	call Mobile_DisableSpriteUpdates
	pop af
	jr c, .done
	ld a, [wMenuCursorY]
	cp $2
	jr z, .done
	and a
	ret

.done
	scf
	ret

MenuHeader_0x892a3:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 5, 15, 9
	dw MenuData_0x892ab
	db 1 ; default option

MenuData_0x892ab:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 2 ; items
	db "はい@"
	db "いいえ@"

Function892b4:
	call Function8931b

Function892b7:
	ld d, b
	ld e, c
	ld hl, 0
	add hl, bc
	ld a, "@"
	ld bc, 6
	call ByteFill
	ld b, d
	ld c, e
	ld hl, 6
	add hl, bc
	ld a, "@"
	ld bc, 6
	call ByteFill
	ld b, d
	ld c, e
	ld hl, 12
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, 14
	add hl, bc
	ld [hli], a
	ld [hl], a
	ld hl, 16
	add hl, bc
	ld [hl], a
	ld hl, 17
	add hl, bc
	ld a, -1
	ld bc, 8
	call ByteFill
	ld b, d
	ld c, e
	ld e, 6
	ld hl, 25
	add hl, bc
.loop
	ld a, -1
	ld [hli], a
	ld a, -1
	ld [hli], a
	dec e
	jr nz, .loop
	ret

Function89305:
	xor a
	ld [wMenuSelection], a
	ld c, 40
.loop
	ld a, [wMenuSelection]
	inc a
	ld [wMenuSelection], a
	push bc
	call Function892b4
	pop bc
	dec c
	jr nz, .loop
	ret

Function8931b:
	push hl
	ld hl, $a03b ; 4:a03b
	ld a, [wMenuSelection]
	dec a
	ld bc, 37
	call AddNTimes
	ld b, h
	ld c, l
	pop hl
	ret

Function8932d:
	ld hl, 0
	add hl, bc

Function89331:
; Scans up to 5 characters starting at hl, looking for a nonspace character up to the next terminator.
; Sets carry if it does not find a nonspace character.
; Returns the location of the following character in hl.
	push bc
	ld c, NAME_LENGTH_JAPANESE - 1
.loop
	ld a, [hli]
	cp "@"
	jr z, .terminator
	cp " "
	jr nz, .nonspace
	dec c
	jr nz, .loop

.terminator
	scf
	jr .done

.nonspace
	and a

.done
	pop bc
	ret

Function89346:
	ld h, b
	ld l, c
	jr _incave

Function8934a:
	ld hl, NAME_LENGTH_JAPANESE
	add hl, bc
_incave:
; Scans up to 5 characters starting at hl, looking for a nonspace character up to the next terminator.  Sets carry if it does not find a nonspace character.  Returns the location of the following character in hl.
	push bc
	ld c, NAME_LENGTH_JAPANESE - 1
.loop
	ld a, [hli]
	cp "@"
	jr z, .terminator
	cp " "
	jr nz, .nonspace
	dec c
	jr nz, .loop

.terminator
	scf
	jr .done

.nonspace
	and a

.done
	pop bc
	ret

Function89363:
; Scans six byte pairs starting at bc to find $ff.  Sets carry if it does not find a $ff.  Returns the location of the byte after the first $ff found in hl.
	ld h, b
	ld l, c
	jr ._incave

	ld hl, 25
	add hl, bc

._incave
	push de
	ld e, NAME_LENGTH_JAPANESE
.loop
	ld a, [hli]
	cp -1
	jr nz, .ok
	ld a, [hli]
	cp -1
	jr nz, .ok
	dec e
	jr nz, .loop
	scf
	jr .done

.ok
	and a

.done
	pop de
	ret

Function89381:
	push bc
	push de
	call Function89b45
	jr c, .ok
	push hl
	ld a, -1
	ld bc, 8
	call ByteFill
	pop hl

.ok
	pop de
	ld c, 8
	call Function89193
	pop bc
	ret

Function8939a:
	push bc
	ld hl, 0
	add hl, bc
	ld de, wd002
	ld c, 6
	call Function89193
	pop bc
	ld hl, 17
	add hl, bc
	ld de, wd008
	call Function89381
	ret

Function893b3:
	call DisableLCD
	call ClearSprites
	call LoadStandardFont
	call LoadFontsExtra
	call Function893ef
	call Function8942b
	call Function89455
	call EnableLCD
	ret

Function893cc:
	call DisableLCD
	call ClearSprites
	call LoadStandardFont
	call LoadFontsExtra
	call Function893ef
	call Function89464
	call EnableLCD
	ret

Function893e2:
	call Function89b1e
	call Function893b3
	call Function8a5b6
	call Function8949c
	ret

Function893ef:
	ld de, vTiles0
	ld hl, EZChatCursorGFX
	ld bc, $20
	ld a, BANK(EZChatCursorGFX)
	call FarCopyBytes
	ret

Function893fe:
	call DisableLCD
	call Function893ef
	call EnableLCD
	call DelayFrame
	ret

EZChatCursorGFX:
INCBIN "gfx/mobile/ez_chat_cursor.2bpp"

Function8942b:
	ld de, vTiles0 tile $02
	ld hl, CardLargeSpriteGFX
	ld bc, 8 tiles
	ld a, BANK(CardLargeSpriteGFX)
	call FarCopyBytes
	ld de, vTiles0 tile $0a
	ld hl, CardSpriteGFX
	ld bc, 4 tiles
	ld a, BANK(CardSpriteGFX)
	call FarCopyBytes
	ret

Function89448:
; Clears the sprite array
	push af
	ld hl, wVirtualOAM
	ld d, 24 * SPRITEOAMSTRUCT_LENGTH
	xor a
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	pop af
	ret

Function89455:
	ld hl, CardLargeSpriteGFX
	ld de, vTiles2 tile $0c
	ld bc, (8 + 65) tiles
	ld a, BANK(CardLargeSpriteGFX) ; aka BANK(CardFolderGFX)
	call FarCopyBytes
	ret

Function89464:
	ld hl, MobileCardGFX
	ld de, vTiles2
	ld bc, $20 tiles
	ld a, BANK(MobileCardGFX)
	call FarCopyBytes
	ld hl, MobileCard2GFX
	ld de, vTiles2 tile $20
	ld bc, $17 tiles
	ld a, BANK(MobileCard2GFX)
	call FarCopyBytes
	ret

Function89481:
	ld d, 2
	call Function8934a
	ret c
	ld d, 0
	ld hl, 16
	add hl, bc
	bit 0, [hl]
	ret z
	inc d
	ret

Function89492:
	ld d, 0
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	ret z
	inc d
	ret

Function8949c:
	ldh a, [rSVBK]
	push af
	ld a, 5
	ldh [rSVBK], a
	ld hl, Palette_894b3
	ld de, wBGPals1 palette 7
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

Palette_894b3:
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

Function894bb:
	call Function894dc
	push bc
	call Function8956f
	call Function8949c
	call Function8a60d
	pop bc
	ret

Function894ca:
	push bc
	call Function894dc
	call Function895c7
	call Function8949c
	call Function8a60d
	call SetPalettes
	pop bc
	ret

Function894dc:
	push bc
	ldh a, [rSVBK]
	push af
	ld a, 5
	ldh [rSVBK], a

	ld c, d
	ld b, 0
	ld hl, .PalettePointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wBGPals1
	ld bc, 3 palettes
	call CopyBytes
	ld hl, .Pals345
	ld de, wBGPals1 + 3 palettes
	ld bc, 3 palettes
	call CopyBytes

	pop af
	ldh [rSVBK], a
	pop bc
	ret

.PalettePointers:
	dw .Pals012a
	dw .Pals012b
	dw .Pals012c

.Pals012a:
	RGB 31, 31, 31
	RGB 10, 17, 13
	RGB 10, 08, 22
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 20, 31
	RGB 10, 08, 22
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 20, 31
	RGB 10, 17, 13
	RGB 00, 00, 00

.Pals012b:
	RGB 31, 31, 31
	RGB 30, 22, 11
	RGB 31, 08, 15
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 20, 31
	RGB 31, 08, 15
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 20, 31
	RGB 30, 22, 11
	RGB 00, 00, 00

.Pals012c:
	RGB 31, 31, 31
	RGB 15, 20, 26
	RGB 25, 07, 20
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 20, 31
	RGB 25, 07, 20
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 20, 31
	RGB 15, 20, 26
	RGB 00, 00, 00

.Pals345:
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 13, 00
	RGB 14, 08, 00

	RGB 31, 31, 31
	RGB 16, 16, 31
	RGB 00, 00, 31
	RGB 00, 00, 00

	RGB 19, 31, 11
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

Function8956f:
	push bc
	ld hl, 16
	add hl, bc
	ld d, h
	ld e, l
	ld hl, $000c
	add hl, bc
	ld b, h
	ld c, l
	farcall GetMobileOTTrainerClass
	ld a, c
	ld [wTrainerClass], a
	ldh a, [rSVBK]
	push af
	ld a, 5
	ldh [rSVBK], a
	ld hl, wd030
	ld a, -1
	ld [hli], a
	ld a, " "
	ld [hl], a
	pop af
	ldh [rSVBK], a
	ld a, [wTrainerClass]
	ld h, 0
	ld l, a
	add hl, hl
	add hl, hl
	ld de, TrainerPalettes
	add hl, de
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld de, wd032
	ld c, 4
.loop
	ld a, BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	dec c
	jr nz, .loop
	ld hl, wd036
	xor a
	ld [hli], a
	ld [hl], a
	pop af
	ldh [rSVBK], a
	pop bc
	ret

Function895c7:
	ldh a, [rSVBK]
	push af
	ld a, 5
	ldh [rSVBK], a
	ld hl, Palette_895de
	ld de, wd030
	ld bc, 8
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

Palette_895de:
	RGB 31, 31, 31
	RGB 07, 07, 06
	RGB 07, 07, 06
	RGB 00, 00, 00

Function895e6:
	ld a, 7
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ret

Function895f2:
	push bc
	xor a
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	call Function89605
	call Function89655
	pop bc
	ret

Function89605:
	hlcoord 19, 2, wAttrmap
	ld a, 1
	ld de, SCREEN_WIDTH
	ld c, 14
.loop
	ld [hl], a
	dec c
	jr z, .done
	add hl, de
	inc a
	ld [hl], a
	dec a
	add hl, de
	dec c
	jr nz, .loop

.done
	hlcoord 0, 16, wAttrmap
	ld c, 10
	ld a, 2
.loop2
	ld [hli], a
	dec a
	ld [hli], a
	inc a
	dec c
	jr nz, .loop2
	hlcoord 1, 11, wAttrmap
	ld a, 4
	ld bc, 4
	call ByteFill
	ld a, 5
	ld bc, 14
	call ByteFill
	ret

Function8963d:
	hlcoord 12, 3, wAttrmap
	ld a, 6
	ld de, SCREEN_WIDTH
	lb bc, 7, 7
.loop
	push hl
	ld c, 7
.next
	ld [hli], a
	dec c
	jr nz, .next
	pop hl
	add hl, de
	dec b
	jr nz, .loop
	ret

Function89655:
	hlcoord 1, 12, wAttrmap
	ld de, SCREEN_WIDTH
	ld a, 5
	ld b, 4
.loop
	ld c, 18
	push hl
.next
	ld [hli], a
	dec c
	jr nz, .next
	pop hl
	add hl, de
	dec b
	jr nz, .loop
	ret

Function8966c:
	push bc
	call Function89688
	hlcoord 4, 0
	ld c, 8
	call Function896f5
	pop bc
	ret

Function8967a:
	push bc
	call Function89688
	hlcoord 2, 0
	ld c, 12
	call Function896f5
	pop bc
	ret

Function89688:
	hlcoord 0, 0
	ld a, 1
	ld e, SCREEN_WIDTH
	call Function896e1
	ld a, 2
	ld e, SCREEN_WIDTH
	call Function896eb
	ld a, 3
	ld [hli], a
	ld a, 4
	ld e, SCREEN_HEIGHT
	call Function896e1
	ld a, 6
	ld [hli], a
	push bc
	ld c, 13
.loop
	call Function896cb
	dec c
	jr z, .done
	call Function896d6
	dec c
	jr nz, .loop

.done
	pop bc
	ld a, 25
	ld [hli], a
	ld a, 26
	ld e, SCREEN_HEIGHT
	call Function896e1
	ld a, 28
	ld [hli], a
	ld a, 2
	ld e, SCREEN_WIDTH
	call Function896eb
	ret

Function896cb:
	ld de, SCREEN_WIDTH - 1
	ld a, 7
	ld [hl], a
	add hl, de
	ld a, 9
	ld [hli], a
	ret

Function896d6:
	ld de, SCREEN_WIDTH - 1
	ld a, 10
	ld [hl], a
	add hl, de
	ld a, 11
	ld [hli], a
	ret

Function896e1:
.loop
	ld [hli], a
	inc a
	dec e
	ret z
	ld [hli], a
	dec a
	dec e
	jr nz, .loop
	ret

Function896eb:
.loop
	ld [hli], a
	dec a
	dec e
	ret z
	ld [hli], a
	inc a
	dec e
	jr nz, .loop
	ret

Function896f5:
	call Function8971f
	call Function89736
	inc hl
	inc hl
	ld b, 2

ClearScreenArea:
; clears an area of the screen
; INPUT:
; hl = address of upper left corner of the area
; b = height
; c = width

	ld a, " " ; blank tile
	ld de, 20 ; screen width
.loop
	push bc
	push hl
.innerLoop
	ld [hli], a
	dec c
	jr nz, .innerLoop
	pop hl
	pop bc
	add hl, de
	dec b
	jr nz, .loop

	dec hl
	inc c
	inc c
.asm_89713
	ld a, $36
	ld [hli], a
	dec c
	ret z
	ld a, $18
	ld [hli], a
	dec c
	jr nz, .asm_89713
	ret

Function8971f:
	ld a, $2c
	ld [hli], a
	ld a, $2d
	ld [hld], a
	push hl
	ld de, SCREEN_WIDTH
	add hl, de
	ld a, $31
	ld [hli], a
	ld a, $32
	ld [hld], a
	add hl, de
	ld a, $35
	ld [hl], a
	pop hl
	ret

Function89736:
	push hl
	inc hl
	inc hl
	ld e, c
	ld d, $0
	add hl, de
	ld a, $2f
	ld [hli], a
	ld a, $30
	ld [hld], a
	ld de, SCREEN_WIDTH
	add hl, de
	ld a, $33
	ld [hli], a
	ld a, $34
	ld [hl], a
	add hl, de
	ld a, $1f
	ld [hl], a
	pop hl
	ret

Function89753:
	ld a, $c
	ld [hl], a
	xor a
	call Function89215
	ret

Function8975b:
	ld a, $1d
	ld [hli], a
	inc a
	ld [hli], a
	ld a, $d
	ld [hl], a
	dec hl
	dec hl
	ld a, $4
	ld e, $3
.asm_89769
	call Function89215
	inc hl
	dec e
	jr nz, .asm_89769
	ret

Function89771:
	ld a, $12
	ld [hl], a
	ld a, $3
	call Function89215
	ret

Function8977a:
	ld e, $4
	ld d, $13
.asm_8977e
	ld a, d
	ld [hl], a
	ld a, $4
	call Function89215
	inc hl
	inc d
	dec e
	jr nz, .asm_8977e
	ld e, $e
.asm_8978c
	ld a, d
	ld [hl], a
	xor a
	call Function89215
	inc hl
	dec e
	jr nz, .asm_8978c
	ret

Function89797:
	push bc
	ld a, $e
	ld [hl], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, $11
	ld [hli], a
	ld a, $10
	ld c, $8
.asm_897a6
	ld [hli], a
	dec c
	jr nz, .asm_897a6
	ld a, $f
	ld [hl], a
	pop bc
	ret

Function897af:
	push bc
	ld hl, $0010
	add hl, bc
	ld d, h
	ld e, l
	ld hl, $000c
	add hl, bc
	ld b, h
	ld c, l
	farcall GetMobileOTTrainerClass
	ld a, c
	ld [wTrainerClass], a
	xor a
	ld [wCurPartySpecies], a
	ld de, vTiles2 tile $37
	farcall GetTrainerPic
	pop bc
	ret

Function897d5:
	push bc
	call Function8934a
	jr nc, .asm_897f3
	hlcoord 12, 3, wAttrmap
	xor a
	ld de, SCREEN_WIDTH
	lb bc, 7, 7
.asm_897e5
	push hl
	ld c, $7
.asm_897e8
	ld [hli], a
	dec c
	jr nz, .asm_897e8
	pop hl
	add hl, de
	dec b
	jr nz, .asm_897e5
	pop bc
	ret

.asm_897f3
	ld a, $37
	ldh [hGraphicStartTile], a
	hlcoord 12, 3
	lb bc, 7, 7
	predef PlaceGraphic
	call Function8963d
	pop bc
	ret

Function89807:
	ld hl, ChrisSilhouetteGFX
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .asm_89814
	ld hl, KrisSilhouetteGFX
.asm_89814
	call DisableLCD
	ld de, vTiles2 tile $37
	ld bc, (5 * 7) tiles
	ld a, BANK(ChrisSilhouetteGFX) ; aka BANK(KrisSilhouetteGFX)
	call FarCopyBytes
	call EnableLCD
	call DelayFrame
	ret

Function89829:
	push bc
	ld bc, $705
	ld de, $14
	ld a, $37
.asm_89832
	push bc
	push hl
.asm_89834
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_89834
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .asm_89832
	call Function8963d
	pop bc
	ret

Function89844:
	call Function89481
	call Function894bb
	call Function897af
	push bc
	call WaitBGMap2
	call SetPalettes
	pop bc
	ret

Function89856:
	push bc
	call Function891b8
	pop bc
	call Function895f2
	call Function8966c
	call Function899d3
	call Function898aa
	call Function898be
	call Function898dc
	call Function898f3
	push bc
	ld bc, wd008
	hlcoord 2, 10
	call Function89975
	pop bc
	call Function897d5
	ret

Function8987f:
	call Function891b8
	call Function895f2
	call Function8967a
	call Function899d3
	hlcoord 5, 1
	call Function8999c
	hlcoord 13, 3
	call Function89829
	call Function899b2
	hlcoord 5, 5
	call Function899c9
	ld bc, wd008
	hlcoord 2, 10
	call Function89975
	ret

Function898aa:
	ld a, [wMenuSelection]
	and a
	ret z
	push bc
	hlcoord 6, 1
	ld de, wMenuSelection
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	ret

Function898be:
	push bc
	ld de, wd002
	ld hl, wd002
	call Function89331
	jr nc, .asm_898cd
	ld de, String_89116

.asm_898cd
	hlcoord 9, 1
	ld a, [wMenuSelection]
	and a
	jr nz, .asm_898d7
	dec hl

.asm_898d7
	call PlaceString
	pop bc
	ret

Function898dc:
	ld hl, $0006
	add hl, bc
	push bc
	ld d, h
	ld e, l
	call Function8934a
	jr nc, .asm_898eb
	ld de, String_89116

.asm_898eb
	hlcoord 6, 4
	call PlaceString
	pop bc
	ret

Function898f3:
	push bc
	ld hl, $000c
	add hl, bc
	ld d, h
	ld e, l
	call Function8934a
	jr c, .asm_8990a
	hlcoord 5, 5
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	jr .asm_89913

.asm_8990a
	hlcoord 5, 5
	ld de, String_89116
	call PlaceString

.asm_89913
	pop bc
	ret

Function89915:
	push bc
	push hl
	ld de, Unknown_89942
	ld c, $8
.asm_8991c
	ld a, [de]
	ld [hl], a
	ld a, $4
	call Function89215
	inc hl
	inc de
	dec c
	jr nz, .asm_8991c
	pop hl
	ld b, $4
	ld c, $2b
	ld a, $8
	ld de, Unknown_8994a
.asm_89932
	push af
	ld a, [de]
	cp [hl]
	jr nz, .asm_8993b
	call Function8994e
	inc de

.asm_8993b
	inc hl
	pop af
	dec a
	jr nz, .asm_89932
	pop bc
	ret

Unknown_89942:
	db $24, $25, $26, " ", $27, $28, $29, $2a
Unknown_8994a:
	db $24, $27, $29, $ff

Function8994e:
	push hl
	push de
	ld de, SCREEN_WIDTH
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld a, c
	ld [hl], a
	ld a, b
	call Function89215
	pop de
	pop hl
	ret

Function89962:
	push bc
	ld c, $4
	ld b, $20
.asm_89967
	ld a, b
	ld [hl], a
	ld a, $4
	call Function89215
	inc hl
	inc b
	dec c
	jr nz, .asm_89967
	pop bc
	ret

Function89975:
	push bc
	ld e, $8
.asm_89978
	ld a, [bc]
	ld d, a
	call Function8998b
	swap d
	inc hl
	ld a, d
	call Function8998b
	inc bc
	inc hl
	dec e
	jr nz, .asm_89978
	pop bc
	ret

Function8998b:
	push bc
	and $f
	cp $a
	jr nc, .asm_89997
	ld c, $f6
	add c
	jr .asm_89999

.asm_89997
	ld a, $7f

.asm_89999
	ld [hl], a
	pop bc
	ret

Function8999c:
	ld de, wPlayerName
	call PlaceString
	inc bc
	ld h, b
	ld l, c
	ld de, String_899ac
	call PlaceString
	ret

String_899ac:
	db "の　めいし@"

Function899b2:
	ld bc, wPlayerName
	call Function89346
	jr c, .asm_899bf
	ld de, wPlayerName
	jr .asm_899c2
.asm_899bf
	ld de, String_89116
.asm_899c2
	hlcoord 6, 4
	call PlaceString
	ret

Function899c9:
	ld de, wPlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ret

Function899d3:
	hlcoord 1, 4
	call Function89753
	hlcoord 2, 5
	call Function8975b
	hlcoord 1, 9
	call Function89771
	hlcoord 1, 11
	call Function8977a
	hlcoord 1, 5
	call Function89797
	hlcoord 2, 4
	call Function89962
	hlcoord 2, 9
	call Function89915
	ret

Function899fe:
	push bc
	push hl
	ld hl, $0019
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	call Function89a0c
	pop bc
	ret

Function89a0c:
	push hl
	call Function89363
	pop hl
	jr c, .asm_89a1c
	ld d, h
	ld e, l
	farcall Function11c08f
	ret

.asm_89a1c
	ld de, String_89153
	call PlaceString
	ret

Function89a23:
	hlcoord 0, 11
	ld b, $4
	ld c, $12
	call Function8921f
	ret

Function89a2e:
	hlcoord 11, 12
	ld b, $2
	ld c, $6
	call Textbox
	hlcoord 13, 13
	ld de, String_89a4e
	call PlaceString
	hlcoord 13, 14
	ld de, String_89a53
	call PlaceString
	call Function89655
	ret

String_89a4e:
	db "けってい@"

String_89a53:
	db "やめる@"

Function89a57:
	call JoyTextDelay_ForcehJoyDown ; joypad
	bit D_UP_F, c
	jr nz, .d_up
	bit D_DOWN_F, c
	jr nz, .d_down
	bit A_BUTTON_F, c
	jr nz, .a_b_button
	bit B_BUTTON_F, c
	jr nz, .a_b_button
	bit START_F, c
	jr nz, .start_button
	scf
	ret

.a_b_button
	ld a, $1
	and a
	ret

.start_button
	ld a, $2
	and a
	ret

.d_up
	call .MoveCursorUp
	call nc, .PlayPocketSwitchSFX
	ld a, $0
	ret

.d_down
	call .MoveCursorDown
	call nc, .PlayPocketSwitchSFX
	ld a, $0
	ret

.PlayPocketSwitchSFX:
	push af
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	pop af
	ret

.MoveCursorDown:
	ld d, 40
	ld e,  1
	call .ApplyCursorMovement
	ret

.MoveCursorUp:
	ld d,  1
	ld e, -1
	call .ApplyCursorMovement
	ret

.ApplyCursorMovement:
	ld a, [wMenuSelection]
	ld c, a
	push bc
.loop
	ld a, [wMenuSelection]
	cp d
	jr z, .equal_to_d
	add e
	jr nz, .not_zero
	inc a

.not_zero
	ld [wMenuSelection], a
	call .Function89ac7 ; BCD conversion of data in SRAM?
	jr nc, .loop
	call .Function89ae6 ; split [wMenuSelection] into [wd030] + [wd031] where [wd030] <= 5
	pop bc
	and a
	ret

.equal_to_d
	pop bc
	ld a, c
	ld [wMenuSelection], a
	scf
	ret

.Function89ac7:
	call OpenSRAMBank4
	call Function8931b
	call .Function89ad4
	call CloseSRAM
	ret

.Function89ad4:
	push de
	call Function8932d ; find a non-space character within 5 bytes of bc
	jr c, .no_nonspace_character
	ld hl, 17
	add hl, bc
	call Function89b45
	jr c, .finish_decode

.no_nonspace_character
	and a

.finish_decode
	pop de
	ret

.Function89ae6:
	ld hl, wd031
	xor a
	ld [hl], a
	ld a, [wMenuSelection]
.loop2
	cp 6
	jr c, .load_and_ret
	sub 5
	ld c, a
	ld a, [hl]
	add 5
	ld [hl], a
	ld a, c
	jr .loop2

.load_and_ret
	ld [wd030], a
	ret

Function89b00:
	farcall MG_Mobile_Layout_LoadPals
	ret

Function89b07:
	call Mobile22_SetBGMapMode0
	call DelayFrame
	farcall Function4a3a7
	ret

Function89b14:
	call ClearBGPalettes
	call Function89b07
	call Function89b00
	ret

Function89b1e:
	farcall Function4a485
	call Function89b00
	ret

Function89b28:
	call Function891de
	call ClearBGPalettes
	call Function893e2
	call Call_ExitMenu
	call Function891ab
	call SetPalettes
	ret

Function89b3b:
	call Mobile22_SetBGMapMode0
	farcall Function48cda
	ret

Function89b45:
	; some sort of decoder?
	; BCD?
	push hl
	push bc
	ld c, $10
	ld e, $0
.loop
	ld a, [hli]
	ld b, a
	and $f
	cp 10
	jr c, .low_nybble_less_than_10
	ld a, c
	cp $b
	jr nc, .clear_carry
	jr .set_carry

.low_nybble_less_than_10
	dec c
	swap b
	inc e
	ld a, b
	and $f
	cp 10
	jr c, .high_nybble_less_than_10
	ld a, c
	cp $b
	jr nc, .clear_carry
	jr .set_carry

.high_nybble_less_than_10
	inc e
	dec c
	jr nz, .loop
	dec e

.set_carry
	scf
	jr .finish

.clear_carry
	and a

.finish
	pop bc
	pop hl
	ret

Function89b78:
	push bc
	ld a, [wd010]
	cp $10
	jr c, .asm_89b8c
	ld a, e
	and a
	jr z, .asm_89b89
	ld c, e
.asm_89b85
	inc hl
	dec c
	jr nz, .asm_89b85
.asm_89b89
	ld a, $7f
	ld [hl], a
.asm_89b8c
	ld a, [wd010]
	inc a
	and $1f
	ld [wd010], a
	pop bc
	ret

Function89b97:
	call Function89c34
	jr c, .asm_89ba0
	call Function89448
	ret
.asm_89ba0
	ld a, [wd011]
	ld hl, Unknown_89bd8
	and a
	jr z, .asm_89bae
.asm_89ba9
	inc hl
	inc hl
	dec a
	jr nz, .asm_89ba9
.asm_89bae
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wVirtualOAMSprite00
.asm_89bb4
	ld a, [hli]
	cp $ff
	ret z
	ld c, a
	ld b, $0
.asm_89bbb
	push hl
	ld a, [hli]
	ld [de], a ; y
	inc de
	ld a, [hli]
	add b
	ld [de], a ; x
	inc de
	ld a, $08
	add b
	ld b, a
	ld a, [hli] ; tile id
	ld [de], a
	inc de
	ld a, [hli] ; attributes
	ld [de], a
	inc de
	pop hl
	dec c
	jr nz, .asm_89bbb
	ld b, $0
	ld c, $4
	add hl, bc
	jr .asm_89bb4

Unknown_89bd8:
	dw Unknown_89be0
	dw Unknown_89bf5
	dw Unknown_89c0a
	dw Unknown_89c1f

Unknown_89be0:
	db $01, $12, $4e, $01, 0
	db $01, $19, $4e, $01, 0 | Y_FLIP
	db $01, $12, $72, $01, 0 | X_FLIP
	db $01, $19, $72, $01, 0 | X_FLIP | Y_FLIP
	db -1 ; end

Unknown_89bf5:
	db $01, $60, $16, $01, 0
	db $01, $62, $16, $01, 0 | Y_FLIP
	db $01, $60, $92, $01, 0 | X_FLIP
	db $01, $62, $92, $01, 0 | X_FLIP | Y_FLIP
	db -1 ; end

Unknown_89c0a:
	db $01, $78, $66, $01, 0
	db $01, $78, $66, $01, 0 | Y_FLIP
	db $01, $78, $92, $01, 0 | X_FLIP
	db $01, $78, $92, $01, 0 | X_FLIP | Y_FLIP
	db -1 ; end

Unknown_89c1f:
	db $01, $80, $66, $01, 0
	db $01, $80, $66, $01, 0 | Y_FLIP
	db $01, $80, $92, $01, 0 | X_FLIP
	db $01, $80, $92, $01, 0 | X_FLIP | Y_FLIP
	db -1 ; end

Function89c34:
	push bc
	ld a, [wd012]
	ld c, a
	inc a
	and $f
	ld [wd012], a
	ld a, c
	cp $8
	pop bc
	ret

Function89c44:
	call Function89c34
	jr c, .asm_89c4f
	push de
	call Function89448
	pop de
	ret
.asm_89c4f
	ld hl, wVirtualOAMSprite00
	push de
	ld a, b
	ld [hli], a ; y
	ld d, $8
	ld a, e
	and a
	ld a, c
	jr z, .asm_89c60
.asm_89c5c
	add d
	dec e
	jr nz, .asm_89c5c
.asm_89c60
	pop de
	ld [hli], a ; x
	ld a, d
	ld [hli], a ; tile id
	xor a
	ld [hli], a ; attributes
	ret

Function89c67:
; menu scrolling?
	call JoyTextDelay_ForcehJoyDown ; joypad
	ld b, $0
	bit A_BUTTON_F, c
	jr z, .not_a_button
	ld b, $1
	and a
	ret

.not_a_button
	bit B_BUTTON_F, c
	jr z, .not_b_button
	scf
	ret

.not_b_button
	xor a
	bit D_UP_F, c
	jr z, .not_d_up
	ld a, $1
.not_d_up
	bit D_DOWN_F, c
	jr z, .not_d_down
	ld a, $2
.not_d_down
	bit D_LEFT_F, c
	jr z, .not_d_left
	ld a, $3
.not_d_left
	bit D_RIGHT_F, c
	jr z, .not_d_right
	ld a, $4
.not_d_right
	and a
	ret z ; no dpad pressed
	dec a
	ld c, a
	ld d, $0
	ld hl, .ScrollData0
	ld a, [wd02f]
	and a
	jr z, .got_data
	ld hl, .ScrollData1
.got_data
	ld a, [wd011]
	and a
	jr z, .got_row
	ld e, $4
.add_n_times
	add hl, de
	dec a
	jr nz, .add_n_times
.got_row
	ld e, c
	add hl, de
	ld a, [hl]
	and a
	ret z
	dec a
	ld [wd011], a
	xor a
	ld [wd012], a
	ret

.ScrollData0:
	db 0, 2, 0, 0
	db 1, 3, 0, 0
	db 2, 4, 0, 0
	db 3, 0, 0, 0

.ScrollData1:
	db 0, 0, 0, 0
	db 0, 3, 0, 0
	db 2, 4, 0, 0
	db 3, 0, 0, 0

Function89cdf:
	ld a, $10
	add b
	ld b, a
	ld a, $8
	add c
	ld c, a
	ld e, $2
	ld a, $2
	ld hl, wVirtualOAMSprite00
.asm_89cee
	push af
	push bc
	ld d, $4
.asm_89cf2
	ld a, b
	ld [hli], a ; y
	ld a, c
	ld [hli], a ; x
	ld a, e
	ld [hli], a ; tile id
	ld a, $1
	ld [hli], a ; attributes
	ld a, $8
	add c
	ld c, a
	inc e
	dec d
	jr nz, .asm_89cf2
	pop bc
	ld a, $8
	add b
	ld b, a
	pop af
	dec a
	jr nz, .asm_89cee
	ret

Function89d0d:
	call Mobile22_SetBGMapMode0
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a

	ld c, 8
	ld de, wBGPals1
.loop
	push bc
	ld hl, .Palette1
	ld bc, 1 palettes
	call CopyBytes
	pop bc
	dec c
	jr nz, .loop

	ld hl, .Palette2
	ld de, wBGPals1 + 2 palettes
	ld bc, 1 palettes
	call CopyBytes

	pop af
	ldh [rSVBK], a

	call SetPalettes
	farcall PrintMail
	call Mobile22_SetBGMapMode1
	ld c, 24
	call DelayFrames
	call RestartMapMusic
	ret

.Palette1:
	RGB 31, 31, 31
	RGB 19, 19, 19
	RGB 15, 15, 15
	RGB 00, 00, 00

.Palette2:
	RGB 31, 31, 31
	RGB 19, 19, 19
	RGB 19, 19, 19
	RGB 00, 00, 00

Function89d5e:
	push af
	call CopyMenuHeader
	pop af
	ld [wMenuCursorBuffer], a
	call Mobile22_SetBGMapMode0
	call PlaceVerticalMenuItems
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 7, [hl]
	ret

Function89d75:
	push hl
	call Mobile22_SetBGMapMode0
	call _hl_
	farcall Mobile_OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	pop hl
	jr asm_89d90

Function89d85:
	push hl
	call Mobile22_SetBGMapMode0
	call _hl_
	call CGBOnly_CopyTilemapAtOnce
	pop hl

asm_89d90:
	call Mobile22_SetBGMapMode0
	push hl
	call _hl_
	call Function89dab
	ld a, [wMenuCursorY]
	push af
	call Function891ab
	pop af
	pop hl
	jr c, .asm_89da9
	jr z, asm_89d90
	scf
	ret
.asm_89da9
	and a
	ret

Function89dab:
	call Mobile22_SetBGMapMode0
	farcall MobileMenuJoypad
	call Mobile22_SetBGMapMode0
	ld a, c
	ld hl, wMenuJoypadFilter
	and [hl]
	ret z
	bit 0, a
	jr nz, .asm_89dc7
	bit 1, a
	jr nz, .asm_89dd9
	xor a
	ret
.asm_89dc7
	call PlayClickSFX
	ld a, [w2DMenuNumRows]
	ld c, a
	ld a, [wMenuCursorY]
	cp c
	jr z, .asm_89dd9
	call PlaceHollowCursor
	scf
	ret
.asm_89dd9
	call PlayClickSFX
	ld a, $1
	and a
	ret

Function89de0:
	call ClearSprites
	call Function89e0a
	jr c, .asm_89e00
	ld c, $1
.asm_89dea
	call Function8a31c
	jr z, .asm_89dfd
	ld a, [wMenuCursorY]
	ld c, a
	push bc
	ld hl, Jumptable_89e04
	ld a, e
	dec a
	rst JumpTable
	pop bc
	jr .asm_89dea
.asm_89dfd
	call Function891fe
.asm_89e00
	call Function8917a
	ret

Jumptable_89e04:
	dw Function8a62c
	dw Function8a999
	dw Function8ab93

Function89e0a:
	call OpenSRAMBank4
	call Function8b3b0
	call CloseSRAM
	ld hl, Jumptable_89e18
	rst JumpTable
	ret

Jumptable_89e18:
	dw Function89e1e
	dw Function8a116
	dw Function8a2aa

Function89e1e:
	call OpenSRAMBank4
	ld bc, $a037
	call Function8b36c
	call CloseSRAM
	xor a
	ld [wd02d], a

asm_89e2e:
	ld a, [wd02d]
	ld hl, Jumptable_89e3c
	rst JumpTable
	ret

Function89e36:
	ld hl, wd02d
	inc [hl]
	jr asm_89e2e

Jumptable_89e3c:
	dw Function89e6f
	dw Function89fed
	dw Function89ff6
	dw Function8a03d
	dw Function89eb9
	dw Function89efd
	dw Function89fce
	dw Function8a04c
	dw Function8a055
	dw Function8a0e6
	dw Function8a0ec
	dw Function8a0f5
	dw Function89e58
	dw Function89e68

Function89e58:
	ld a, $1
	call Function8a2fe
	call Function891fe
	call Function893e2
	call Function89168
	and a
	ret

Function89e68:
	call Function891fe
	ld a, $1
	scf
	ret

Function89e6f:
	call Function891de
	call Function89245
	call Function89ee1
	call Function89e9a
	hlcoord 7, 4
	call Function8a58d
	ld a, $5
	hlcoord 7, 4, wAttrmap
	call Function8a5a3
	ld a, $6
	hlcoord 10, 4, wAttrmap
	call Function8a5a3
	call Function891ab
	call SetPalettes
	jp Function89e36

Function89e9a:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, Palette_89eb1
	ld de, wBGPals1 palette 5
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

Palette_89eb1:
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 27, 19, 00
	RGB 00, 00, 00

Function89eb9:
	call Function891fe
	call Function89ee1
	call Function89e9a
	hlcoord 7, 4
	call Function8a58d
	ld a, $5
	hlcoord 7, 4, wAttrmap
	call Function8a5a3
	ld a, $6
	hlcoord 10, 4, wAttrmap
	call Function8a5a3
	call Function891ab
	call SetPalettes
	jp Function89e36

Function89ee1:
	call ClearBGPalettes
	call Function893e2
	call Mobile22_SetBGMapMode0
	farcall Function4a3a7
	farcall MG_Mobile_Layout_CreatePalBoxes
	hlcoord 1, 0
	call Function8a53d
	ret

Function89efd:
	ld hl, wd012
	ld a, $ff
	ld [hli], a
	xor a
rept 4
	ld [hli], a
endr
	ld [hl], a
.asm_89f09
	ld hl, wd012
	inc [hl]
	ld a, [hli]
	and $3
	jr nz, .asm_89f2e
	ld a, [hl]
	cp $4
	jr nc, .asm_89f2e
	ld b, $32
	inc [hl]
	ld a, [hl]
	dec a
	jr z, .asm_89f26
	ld c, a
.asm_89f1f
	ld a, $b
	add b
	ld b, a
	dec c
	jr nz, .asm_89f1f
.asm_89f26
	ld c, $e8
	ld a, [wd013]
	call Function89fa5
.asm_89f2e
	ld a, [wd013]
	and a
	jr z, .asm_89f58
.asm_89f34
	call Function89f6a
	ld e, a
	ld a, c
	cp $a8
	jr nc, .asm_89f4d
	cp $46
	jr c, .asm_89f4d
	ld d, $0
	dec e
	ld hl, wd014
	add hl, de
	set 0, [hl]
	inc e
	jr .asm_89f51
.asm_89f4d
	ld a, $2
	add c
	ld c, a
.asm_89f51
	ld a, e
	call Function89f77
	dec a
	jr nz, .asm_89f34
.asm_89f58
	call DelayFrame
	ld hl, wd014
	ld c, $4
.asm_89f60
	ld a, [hli]
	and a
	jr z, .asm_89f09
	dec c
	jr nz, .asm_89f60
	jp Function89e36

Function89f6a:
	push af
	ld de, $10
	call Function89f9a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	pop af
	ret

Function89f77:
	push af
	ld de, $10
	call Function89f9a
	ld d, $2
.asm_89f80
	push bc
	ld e, $2
.asm_89f83
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	inc hl
	inc hl
	ld a, $8
	add c
	ld c, a
	dec e
	jr nz, .asm_89f83
	pop bc
	ld a, $8
	add b
	ld b, a
	dec d
	jr nz, .asm_89f80
	pop af
	ret

Function89f9a:
	dec a
	ld hl, wVirtualOAM
	and a
	ret z
.asm_89fa0
	add hl, de
	dec a
	jr nz, .asm_89fa0
	ret

Function89fa5:
	ld de, $10
	call Function89f9a
	ld e, $2
	ld d, $a
.asm_89faf
	push bc
	ld a, $2
.asm_89fb2
	push af
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	inc d
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld a, $8
	add c
	ld c, a
	pop af
	dec a
	jr nz, .asm_89fb2
	pop bc
	ld a, $8
	add b
	ld b, a
	dec e
	jr nz, .asm_89faf
	ret

Function89fce:
	call Function8a5b6
	ld a, $5
	hlcoord 7, 4, wAttrmap
	call Function8a5a3
	ld a, $6
	hlcoord 10, 4, wAttrmap
	call Function8a5a3
	call Function89448
	call SetPalettes
	call Function891ab
	jp Function89e36

Function89fed:
	ld hl, MobileCardFolderIntro1Text
	call PrintText
	jp Function89e36

Function89ff6:
	call Function891fe
	call ClearBGPalettes
	call Function893cc
	call Function89807
	call Function89492
	call Function894ca
	call OpenSRAMBank4
	ld hl, $a603
	ld a, -1
	ld bc, 8
	call ByteFill
	ld hl, $a603
	ld de, wd008
	call Function89381
	call CloseSRAM
	call Function8987f
	call OpenSRAMBank4
	hlcoord 1, 13
	ld bc, $a007
	call Function89a0c
	call CloseSRAM
	call Function891ab
	call Mobile22_PromptButton
	jp Function89e36

Function8a03d:
	ld hl, MobileCardFolderIntro2Text
	call Mobile_EnableSpriteUpdates
	call PrintText
	call Mobile_DisableSpriteUpdates
	jp Function89e36

Function8a04c:
	ld hl, MobileCardFolderIntro3Text
	call PrintText
	jp Function89e36

Function8a055:
	ld c, $7
	ld b, $4
.asm_8a059
	call Function8a0a1
	inc c
	call Function8a0c9
	push bc
	call Function8a58d
	pop bc
	call Function8a0de
	push bc
	push hl
	ld a, $5
	call Function8a5a3
	pop hl
	inc hl
	inc hl
	inc hl
	ld a, $6
	call Function8a5a3
	call CGBOnly_CopyTilemapAtOnce
	pop bc
	ld a, c
	cp $b
	jr nz, .asm_8a059
	call Function8a0a1
	hlcoord 12, 4
	call Function8a58d
	ld a, $5
	hlcoord 12, 4, wAttrmap
	call Function8a5a3
	pop hl
	ld a, $6
	hlcoord 15, 4, wAttrmap
	call Function8a5a3
	call CGBOnly_CopyTilemapAtOnce
	jp Function89e36

Function8a0a1:
	call Mobile22_SetBGMapMode0
	push bc
	call Function8a0c9
	ld e, $6
.asm_8a0aa
	push hl
	ld bc, $6
	add hl, bc
	ld d, [hl]
	call Function8a0c1
	pop hl
	ld [hl], d
	call Function89215
	ld bc, $14
	add hl, bc
	dec e
	jr nz, .asm_8a0aa
	pop bc
	ret

Function8a0c1:
	push hl
	ld bc, wAttrmap - wTilemap
	add hl, bc
	ld a, [hl]
	pop hl
	ret

Function8a0c9:
	push bc
	hlcoord 0, 0
	ld de, $14
	ld a, b
	and a
	jr z, .asm_8a0d8
.asm_8a0d4
	add hl, de
	dec b
	jr nz, .asm_8a0d4
.asm_8a0d8
	ld d, $0
	ld e, c
	add hl, de
	pop bc
	ret

Function8a0de:
	call Function8a0c9
	ld de, wAttrmap - wTilemap
	add hl, de
	ret

Function8a0e6:
	call Function8b539
	jp Function89e36

Function8a0ec:
	ld hl, MobileCardFolderIntro4Text
	call PrintText
	jp Function89e36

Function8a0f5:
	call Function8b555
	jp nc, Function8a0ff
	ld hl, wd02d
	inc [hl]

Function8a0ff:
	jp Function89e36

MobileCardFolderIntro1Text:
	text_far _MobileCardFolderIntro1Text
	text_end

MobileCardFolderIntro2Text:
	text_far _MobileCardFolderIntro2Text
	text_end

MobileCardFolderIntro3Text:
	text_far _MobileCardFolderIntro3Text
	text_end

MobileCardFolderIntro4Text:
	text_far _MobileCardFolderIntro4Text
	text_end

Function8a116:
	ld a, $1
	ld [wd030], a
	ld hl, MenuHeader_0x8a176
	call LoadMenuHeader
.asm_8a121
	call Mobile22_SetBGMapMode0
	call Function8a17b
	jr c, .asm_8a16b
	ld a, [wMenuCursorY]
	ld [wd030], a
	dec d
	jr z, .asm_8a140
	call Function8a20d
	jr c, .asm_8a121
	xor a
	call Function8a2fe
	call Function8916e
	jr .asm_8a16b
.asm_8a140
	call Function89174
	jr nz, .asm_8a14c
	call Function8a241
	jr c, .asm_8a121
	jr .asm_8a15a
.asm_8a14c
	call WaitSFX
	ld de, SFX_TWINKLE
	call PlaySFX
	ld c, $10
	call DelayFrames
.asm_8a15a
	call ExitMenu
	call Function891de
	call Function893e2
	call Function89245
	call Function89168
	and a
	ret
.asm_8a16b
	call Mobile_EnableSpriteUpdates
	call CloseWindow
	call Mobile_DisableSpriteUpdates
	scf
	ret

MenuHeader_0x8a176:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 0, SCREEN_WIDTH - 1, 6

Function8a17b:
	decoord 14, 0
	ld b, $5
	ld c, $4
	call Function89b3b
	ld hl, MenuHeader_0x8a19a
	ld a, [wd030]
	call Function89d5e
	ld hl, Function8a1b0
	call Function89d75
	jr nc, .asm_8a198
	ld a, $0
.asm_8a198
	ld d, a
	ret

MenuHeader_0x8a19a:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 0, SCREEN_WIDTH - 1, 6
	dw MenuData_0x8a1a2
	db 1 ; default option

MenuData_0x8a1a2:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING | STATICMENU_WRAP ; flags
	db 3 ; items
	db "ひらく@"
	db "すてる@"
	db "もどる@"

Function8a1b0:
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Textbox
	hlcoord 1, 14
	ld a, [wMenuCursorY]
	ld de, Strings_8a1cc
	dec a
	ld c, a
	call Function8919e
	call PlaceString
	ret

Strings_8a1cc:
	db   "めいし<NO>せいりと　へんしゅうを"
	next "おこないます"
	db   "@"

	db   "めいしフォルダー<NO>めいしと"
	next "あんしょうばんごう<WO>けします"
	db   "@"

	db   "まえ<NO>がめん<NI>もどります"
	db   "@"

Function8a20d:
	ld hl, MobileCardFolderAskDeleteText
	call PrintText
	ld a, $2
	call Function89259
	ret c
	ld hl, MobileCardFolderDeleteAreYouSureText
	call PrintText
	ld a, $2
	call Function89259
	ret c
	xor a
	call Function8a2fe
	ld hl, MobileCardFolderDeletedText
	call PrintText
	xor a
	and a
	ret

MobileCardFolderAskDeleteText:
	text_far _MobileCardFolderAskDeleteText
	text_end

MobileCardFolderDeleteAreYouSureText:
	text_far _MobileCardFolderDeleteAreYouSureText
	text_end

MobileCardFolderDeletedText:
	text_far _MobileCardFolderDeletedText
	text_end

Function8a241:
	call LoadStandardMenuHeader
	call Function891fe
	call Function8a262
	jr nc, .asm_8a254
	call Function891fe
	call Function89b28
	scf
	ret
.asm_8a254
	call Function891de
	call ClearBGPalettes
	call Call_ExitMenu
	call Function891de
	and a
	ret

Function8a262:
	call ClearBGPalettes
	call Function893e2
	call Mobile22_SetBGMapMode0
	farcall Function4a3a7
	farcall MG_Mobile_Layout_CreatePalBoxes
	hlcoord 1, 0
	call Function8a53d
	hlcoord 12, 4
	call Function8a58d
	ld a, $5
	hlcoord 12, 4, wAttrmap
	call Function8a5a3
	ld a, $6
	hlcoord 15, 4, wAttrmap
	call Function8a5a3
	xor a
	ld [wd02e], a
	ld bc, wd013
	call Function8b36c
	call Function8b493
	call Function891ab
	call SetPalettes
	call Function8b5e7
	ret

Function8a2aa:
	ld hl, MenuHeader_0x8a2ef
	call LoadMenuHeader
	ld hl, MobileCardFolderAskOpenOldText
	call PrintText
	ld a, $1
	call Function89259
	jr nc, .asm_8a2cf
	ld hl, MobileCardFolderAskDeleteOldText
	call PrintText
	ld a, $2
	call Function89259
	jr c, .asm_8a2ea
	call Function8a20d
	jr .asm_8a2ea
.asm_8a2cf
	call ExitMenu
	call Function8a241
	jr c, .asm_8a2ed
	ld a, $1
	call Function8a313
	call CloseSRAM
	call Function891de
	call Function89245
	call Function89168
	and a
	ret
.asm_8a2ea
	call CloseWindow
.asm_8a2ed
	scf
	ret

MenuHeader_0x8a2ef:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1

MobileCardFolderAskOpenOldText:
	text_far _MobileCardFolderAskOpenOldText
	text_end

MobileCardFolderAskDeleteOldText:
	text_far _MobileCardFolderAskDeleteOldText
	text_end

Function8a2fe:
	call Function8a313
	call Function89305
	ld hl, $a603
	ld bc, $8
	ld a, -1
	call ByteFill
	call CloseSRAM
	ret

Function8a313:
	ld c, a
	call OpenSRAMBank4
	ld a, c
	ld [$a60b], a
	ret

Function8a31c:
	push bc
	call Mobile22_SetBGMapMode0
	farcall Function4a3a7
	farcall MG_Mobile_Layout_CreatePalBoxes
	hlcoord 1, 0
	call Function8a53d
	hlcoord 12, 4
	call Function8a58d
	call Function8a3b2
	pop bc
	ld a, c
	ld [wMenuCursorBuffer], a
	ld [wMenuSelection], a
	call PlaceVerticalMenuItems
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 7, [hl]
.asm_8a34e
	call Function8a3a2
	call Mobile22_SetBGMapMode0
	call Function8a453
	call Function8a4d3
	call Function8a4fc
	call Function891ab
	call SetPalettes
	call Function8a383
	jr c, .asm_8a370
	jr z, .asm_8a34e
.asm_8a36a
	call Function89448
	xor a
	ld e, a
	ret
.asm_8a370
	call Function89448
	call PlaceHollowCursor
	call Function8a3a2
	ld a, [wMenuSelection]
	cp $ff
	jr z, .asm_8a36a
	ld e, a
	and a
	ret

Function8a383:
	farcall MobileMenuJoypad
	ld a, c
	ld hl, wMenuJoypadFilter
	and [hl]
	ret z
	bit 0, a
	jr nz, .asm_8a399
	bit 1, a
	jr nz, .asm_8a39e
	xor a
	ret
.asm_8a399
	call PlayClickSFX
	scf
	ret
.asm_8a39e
	call PlayClickSFX
	ret

Function8a3a2:
	ld a, [wMenuCursorY]
	dec a
	ld hl, wd002
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [wMenuSelection], a
	ret

Function8a3b2:
	ld a, $1
	ld [wMenuSelection], a
	call Function8a4fc
	call Function8a3df
	jr nc, .asm_8a3ce
	decoord 0, 2
	ld b, $6
	ld c, $9
	call Function89b3b
	ld hl, MenuHeader_0x8a435
	jr .asm_8a3db
.asm_8a3ce
	decoord 0, 2
	ld b, $8
	ld c, $9
	call Function89b3b
	ld hl, MenuHeader_0x8a40f
.asm_8a3db
	call CopyMenuHeader
	ret

Function8a3df:
	call OpenSRAMBank4
	ld hl, $a603
	call Function89b45
	call CloseSRAM
	ld hl, wd002
	jr c, .asm_8a3f8
	ld de, Unknown_8a408
	call Function8a400
	scf
	ret
.asm_8a3f8
	ld de, Unknown_8a40b
	call Function8a400
	and a
	ret

Function8a400:
	ld a, [de]
	inc de
	ld [hli], a
	cp $ff
	jr nz, Function8a400
	ret

Unknown_8a408: db 1, 2, -1
Unknown_8a40b: db 1, 2, 3, -1

MenuHeader_0x8a40f:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 10, TEXTBOX_Y - 1
	dw MenuData_0x8a417
	db 1 ; default option

MenuData_0x8a417:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 4 ; items
	db "めいしりスト@"
	db "じぶんの　めいし@"
	db "めいしこうかん@"
	db "やめる@"

MenuHeader_0x8a435:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 10, 9
	dw MenuData_0x8a43d
	db 1 ; default option

MenuData_0x8a43d:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 3 ; items
	db "めいしりスト@"
	db "じぶんの　めいし@"
	db "やめる@"

Function8a453:
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Textbox
	hlcoord 1, 14
	ld de, String_8a476
	ld a, [wMenuSelection]
	cp $ff
	jr z, .asm_8a472
	ld de, Strings_8a483
	dec a
	ld c, a
	call Function8919e
.asm_8a472
	call PlaceString
	ret

String_8a476:
	db   "まえ<NO>がめん<NI>もどります@"

Strings_8a483:
	db   "おともだち<NO>めいしは"
	next "ここ<NI>いれておきます@"

	db   "でんわばんごう<WO>いれると"
	next "めいしこうかん<GA>できます@"

	db   "ともだちと　じぶん<NO>めいしを"
	next "せきがいせんで　こうかん　します@"

Function8a4d3:
	ld a, [wMenuSelection]
	cp $1
	jr nz, .asm_8a4eb
	ld a, $5
	hlcoord 12, 4, wAttrmap
	call Function8a5a3
	ld a, $7
	hlcoord 15, 4, wAttrmap
	call Function8a5a3
	ret
.asm_8a4eb
	ld a, $7
	hlcoord 12, 4, wAttrmap
	call Function8a5a3
	ld a, $6
	hlcoord 15, 4, wAttrmap
	call Function8a5a3
	ret

Function8a4fc:
	ld a, [wMenuSelection]
	cp $3
	jr nz, asm_8a529
	ld hl, wd012
	ld a, [hli]
	ld b, a
	ld a, [hld]
	add b
	ld [hl], a
	ld b, a
	ld c, $80
	call Function89cdf
	call Function8a515
	ret

Function8a515:
	ld hl, wd012
	ld a, [hl]
	cp $38
	jr c, .asm_8a520
	cp $3c
	ret c
.asm_8a520
	ld a, [wd013]
	cpl
	inc a
	ld [wd013], a
	ret

asm_8a529:
	ld hl, wd012
	ld a, $3c
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ld hl, wVirtualOAM
	xor a
	ld bc, 8 * SPRITEOAMSTRUCT_LENGTH
	call ByteFill
	ret

Function8a53d:
	push hl
	ld a, $15
	ld c, $8
	ld de, $14
	call Function8a573
	ld a, $1d
	ld c, $9
	call Function8a57c
	inc a
	ld [hl], a
	call Function8a584
	pop hl
	add hl, de
	ld a, $1f
	ld c, $8
	call Function8a573
	dec hl
	ld a, $51
	ld [hli], a
	ld a, $26
	ld c, $1
	call Function8a57c
	ld a, $52
	ld c, $3
	call Function8a573
	ld a, $27
	ld c, $6

Function8a573:
	ld [hl], a
	call Function8a584
	inc a
	dec c
	jr nz, Function8a573
	ret

Function8a57c:
	ld [hl], a
	call Function8a584
	dec c
	jr nz, Function8a57c
	ret

Function8a584:
	push af
	ld a, $4
	call Function89215
	inc hl
	pop af
	ret

Function8a58d:
	ld a, $2d
	ld bc, $606
	ld de, $14
.asm_8a595
	push bc
	push hl
.asm_8a597
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_8a597
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .asm_8a595
	ret

Function8a5a3:
	ld bc, $603
	ld de, $14
.asm_8a5a9
	push bc
	push hl
.asm_8a5ab
	ld [hli], a
	dec c
	jr nz, .asm_8a5ab
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .asm_8a5a9
	ret

Function8a5b6:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, Palette_8a5e5
	ld de, wBGPals1 + 4 palettes
	ld bc, 3 palettes
	call CopyBytes
	ld hl, Palette_8a5fd
	ld de, wOBPals1
	ld bc, 1 palettes
	call CopyBytes
	ld hl, Palette_8a605
	ld de, wOBPals1 + 1 palettes
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

Palette_8a5e5:
	RGB 31, 31, 31
	RGB 27, 19, 00
	RGB 07, 11, 22
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 16, 31
	RGB 27, 19, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 27, 19, 00
	RGB 00, 00, 00

Palette_8a5fd:
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

Palette_8a605:
	RGB 00, 00, 00
	RGB 14, 18, 31
	RGB 16, 16, 31
	RGB 31, 31, 31

Function8a60d:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, Palette_8a624
	ld de, wOBPals1
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

Palette_8a624:
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

Function8a62c:
	call LoadStandardMenuHeader
	call Function891fe
	xor a
	call Function8b94a
	call Function8b677
.asm_8a639
	xor a
	ld [wd033], a
	ld [wd032], a
	ld [wd0e3], a
	call Function8b7bd
	ld a, c
	and a
	jr z, .asm_8a66a
	ld [wMenuSelection], a
	ld b, a
	ld a, [wScrollingMenuCursorPosition]
	inc a
	ld [wd034], a
	push bc
	call Function8b960
	ld a, c
	pop bc
	jr z, .asm_8a639
	ld c, a
	ld hl, Jumptable_8a671
	ld a, b
	ld [wMenuSelection], a
	ld a, c
	dec a
	rst JumpTable
	jr .asm_8a639
.asm_8a66a
	call Function891fe
	call Function89b28
	ret

Jumptable_8a671:
	dw Function8a679
	dw Function8a6cd
	dw Function8a8c3
	dw Function8a930

Function8a679:
	call Function891de
	call ClearBGPalettes
	call Function893cc
	call OpenSRAMBank4
	call Function8931b
	call Function89844
	call CloseSRAM
	call OpenSRAMBank4
	call Function8939a
	call Function89856
	hlcoord 1, 13
	call Function899fe
	call Function891ab
	call CloseSRAM
.asm_8a6a3
	call Function89a57
	jr c, .asm_8a6a3
	and a
	jr z, Function8a679
	ld hl, Jumptable_8a6bc
	dec a
	rst JumpTable
	jr c, Function8a679
	call Function891fe
	call Function8b677
	call Function89448
	ret

Jumptable_8a6bc:
	dw Function8a6c0
	dw Function8a6c5

Function8a6c0:
	call PlayClickSFX
	and a
	ret

Function8a6c5:
	call PlayClickSFX
	call Function89d0d
	scf
	ret

Function8a6cd:
	call Function891de
	call ClearBGPalettes
	call Function893cc
	call OpenSRAMBank4
	call Function8931b
	call Function89844
	call Function8a757
	call CloseSRAM
.asm_8a6e5
	call OpenSRAMBank4
	call Function8931b
	call Function89856
	call Function89a2e
	call Function891ab
	xor a
	ld [wd02f], a
	call CloseSRAM
.asm_8a6fb
	call Function89b97
	call Function89c67
	jr c, .asm_8a718
	ld a, b
	and a
	jr z, .asm_8a6fb
	call PlayClickSFX
	call Function89448
	ld a, [wd011]
	ld hl, Jumptable_8a74f
	rst JumpTable
	jr nc, .asm_8a6e5
	jr .asm_8a742
.asm_8a718
	call OpenSRAMBank4
	call Function8a765
	call CloseSRAM
	jr nc, .asm_8a73f
	call Mobile22_SetBGMapMode0
	call Function89448
	call Function89a23
	hlcoord 1, 13
	ld de, String_89135
	call PlaceString
	call WaitBGMap
	ld a, $2
	call Function89254
	jr c, .asm_8a6e5
.asm_8a73f
	call CloseSRAM
.asm_8a742
	call ClearBGPalettes
	call Function89448
	call Function891d3
	call Function8b677
	ret

Jumptable_8a74f:
	dw Function8a78c
	dw Function8a7cb
	dw Function8a818
	dw Function8a8a1

Function8a757:
	call Function8939a
	xor a
	ld [wd010], a
	ld [wd011], a
	ld [wd012], a
	ret

Function8a765:
	call Function8931b
	push bc
	ld hl, $0
	add hl, bc
	ld de, wd002
	ld c, $6
	call Function89185
	pop bc
	jr nz, .asm_8a78a
	push bc
	ld hl, $11
	add hl, bc
	ld de, wd008
	ld c, $8
	call Function89185
	pop bc
	jr nz, .asm_8a78a
	and a
	ret
.asm_8a78a
	scf
	ret

Function8a78c:
	call Function891fe
	ld de, wd002
	ld b, NAME_FRIEND
	farcall NamingScreen
	call OpenSRAMBank4
	call Function8931b
	push bc
	ld hl, $0
	add hl, bc
	ld d, h
	ld e, l
	ld hl, wd002
	call InitName
	call CloseSRAM
	call DelayFrame
	call JoyTextDelay
	call Function891de
	call ClearBGPalettes
	call Function893cc
	call OpenSRAMBank4
	pop bc
	call Function89844
	call CloseSRAM
	and a
	ret

Function8a7cb:
	ld a, [wMenuSelection]
	push af
	call Function891de
	ld de, wd008
	ld c, $0
	farcall Function17a68f
	jr c, .asm_8a7f4
	ld hl, wd008
	ld a, $ff
	ld bc, $8
	call ByteFill
	ld h, d
	ld l, e
	ld de, wd008
	ld c, $8
	call Function89193
.asm_8a7f4
	pop af
	ld [wMenuSelection], a
	call Function891de
	call ClearBGPalettes
	call Function893cc
	call OpenSRAMBank4
	call Function8931b
	call Function89844
	call Function89856
	call Function89a2e
	call Function891ab
	call CloseSRAM
	and a
	ret

Function8a818:
	call Function89a23
	ld hl, wd002
	call Function89331
	jr c, .asm_8a875
	ld hl, wd008
	call Function89b45
	jr nc, .asm_8a87a
	call OpenSRAMBank4
	call Function8a765
	jr nc, .asm_8a863
	call Function8931b
	push bc
	ld hl, $0
	add hl, bc
	ld d, h
	ld e, l
	ld hl, wd002
	ld c, $6
	call Function89193
	pop bc
	ld hl, $11
	add hl, bc
	ld d, h
	ld e, l
	ld hl, wd008
	ld c, $8
	call Function89193
	hlcoord 1, 13
	ld de, .string_8a868
	call PlaceString
	call WaitBGMap
	call JoyWaitAorB
.asm_8a863
	call CloseSRAM
	scf
	ret

.string_8a868
	db "めいし<WO>かきかえ　まし<TA!>@"

.asm_8a875
	ld de, String_8a88b
	jr .asm_8a87d
.asm_8a87a
	ld de, String_8911c
.asm_8a87d
	hlcoord 1, 13
	call PlaceString
	call WaitBGMap
	call JoyWaitAorB
	and a
	ret

String_8a88b:
	db   "おともだち<NO>なまえが"
	next "かかれて　いません！@"

Function8a8a1:
	call OpenSRAMBank4
	call Function8a765
	call CloseSRAM
	jr nc, .asm_8a8bf
	call Function89a23
	hlcoord 1, 13
	ld de, String_89135
	call PlaceString
	ld a, $2
	call Function89254
	jr c, .asm_8a8c1
.asm_8a8bf
	scf
	ret
.asm_8a8c1
	and a
	ret

Function8a8c3:
	call Function891de
	call ClearBGPalettes
	call Function893cc
	call OpenSRAMBank4
	call Function8931b
	call Function89844
	call Function8939a
	call Function89856
	call CloseSRAM
	call Function891ab
	hlcoord 1, 13
	ld de, String_8a919
	call PlaceString
	ld a, $2
	call Function89254
	jr c, .asm_8a90f
	call OpenSRAMBank4
	call Function892b4
	call CloseSRAM
	call Function89a23
	call Mobile22_SetBGMapMode0
	hlcoord 1, 13
	ld de, String_8a926
	call PlaceString
	call WaitBGMap
	call JoyWaitAorB
.asm_8a90f
	call Function89448
	call Function891fe
	call Function8b677
	ret

String_8a919:
	db "このデータ<WO>けしますか？@"

String_8a926:
	db "データ<WO>けしまし<TA!>@"

Function8a930:
	ld a, [wMenuSelection]
	push af
	xor a
	ld [wd032], a
	ld a, $1
	ld [wd033], a
	ld a, [wd034]
	ld [wd0e3], a
.asm_8a943
	call Function8b7bd
	ld a, [wMenuJoypad]
	and $1
	jr nz, .asm_8a953
	ld a, c
	and a
	jr nz, .asm_8a943
	pop af
	ret
.asm_8a953
	call OpenSRAMBank4
	pop af
	cp c
	jr z, .asm_8a995
	push bc
	ld [wMenuSelection], a
	call Function8931b
	push bc
	ld h, b
	ld l, c
	ld de, wd002
	ld bc, $25
	call CopyBytes
	pop de
	pop bc
	ld a, c
	ld [wMenuSelection], a
	call Function8931b
	push bc
	ld h, b
	ld l, c
	ld bc, $25
	call CopyBytes
	pop de
	ld hl, wd002
	ld bc, $25
	call CopyBytes
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
.asm_8a995
	call CloseSRAM
	ret

Function8a999:
	ld hl, MenuHeader_0x8a9c9
	call LoadMenuHeader
	ld c, $1
.asm_8a9a1
	call Function8a9ce
	jr c, .asm_8a9bb
	push bc
	push de
	call LoadStandardMenuHeader
	pop de
	dec e
	ld a, e
	ld hl, Jumptable_8a9c5
	rst JumpTable
	call Function891fe
	call Function89b28
	pop bc
	jr .asm_8a9a1
.asm_8a9bb
	call Mobile_EnableSpriteUpdates
	call CloseWindow
	call Mobile_DisableSpriteUpdates
	ret

Jumptable_8a9c5:
	dw Function8aa0a
	dw Function8ab3b

MenuHeader_0x8a9c9:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 4, 18, TEXTBOX_Y - 1

Function8a9ce:
	push bc
	decoord 11, 4
	ld b, $6
	ld c, $6
	call Function89b3b
	pop bc
	ld a, c
	ld hl, MenuHeader_0x8a9f2
	call Function89d5e
	ld hl, Function8aa09
	call Function89d85
	jr c, .asm_8a9ed
	ld c, a
	ld e, a
	and a
	ret
.asm_8a9ed
	ld c, a
	ld e, $0
	scf
	ret

MenuHeader_0x8a9f2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 4, 18, TEXTBOX_Y - 1
	dw MenuData_0x8a9fa
	db 1 ; default option

MenuData_0x8a9fa:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 3 ; items
	db "へんしゅう@"
	db "みる@"
	db "やめる@"

Function8aa09:
	ret

Function8aa0a:
	ld a, $1
	ld [wd02f], a
	ld [wd011], a
	xor a
	ld [wd010], a
	ld [wd012], a
	call OpenSRAMBank4
	ld hl, $a603
	ld de, wd008
	call Function89381
	call CloseSRAM
	call Function891fe
	call ClearBGPalettes
	call Function893cc
	call Function89807
	call Function89492
	call Function894ca
.asm_8aa3a
	call Function8987f
	call Function89a2e
	call Function891ab
.asm_8aa43
	call Function89b97
	call Function89c67
	jr c, .asm_8aa61
	ld a, b
	and a
	jr z, .asm_8aa43
	call PlayClickSFX
	call Function89448
	ld a, [wd011]
	dec a
	ld hl, Jumptable_8aa6d
	rst JumpTable
	jr nc, .asm_8aa3a
	jr .asm_8aa69
.asm_8aa61
	call Function89448
	call Function8ab11
	jr nc, .asm_8aa3a
.asm_8aa69
	call Function89448
	ret

Jumptable_8aa6d:
	dw Function8aa73
	dw Function8aab6
	dw Function8ab11

Function8aa73:
	ld a, [wMenuSelection]
	ld e, a
	push de
	call Function891de
	ld de, wd008
	ld c, $0
	farcall Function17a68f
	jr c, .asm_8aa9d
	ld hl, wd008
	ld a, $ff
	ld bc, $8
	call ByteFill
	ld h, d
	ld l, e
	ld de, wd008
	ld c, $8
	call Function89193
.asm_8aa9d
	call Function891fe
	call ClearBGPalettes
	call Function893cc
	call Function89807
	call Function89492
	call Function894ca
	pop de
	ld a, e
	ld [wMenuSelection], a
	and a
	ret

Function8aab6:
	call Function89a23
	ld hl, wd008
	call Function89b45
	jr nc, Function8ab00
	call OpenSRAMBank4
	ld de, wd008
	ld hl, $a603
	ld c, $8
	call Function89185
	jr z, .asm_8aaeb
	ld hl, wd008
	ld de, $a603
	ld c, $8
	call Function89193
	hlcoord 1, 13
	ld de, String_8aaf0
	call PlaceString
	call WaitBGMap
	call JoyWaitAorB
.asm_8aaeb
	call CloseSRAM
	scf
	ret

String_8aaf0:
	db "あたらしい　めいし<PKMN>できまし<LF>@"

Function8ab00:
	ld de, String_8911c
	hlcoord 1, 13
	call PlaceString
	call WaitBGMap
	call Mobile22_PromptButton
	and a
	ret

Function8ab11:
	call OpenSRAMBank4
	ld hl, $a603
	ld de, wd008
	ld c, $8
	call Function89185
	call CloseSRAM
	jr z, .asm_8ab37
	call Function89a23
	hlcoord 1, 13
	ld de, String_89135
	call PlaceString
	ld a, $2
	call Function89254
	jr c, .asm_8ab39
.asm_8ab37
	scf
	ret
.asm_8ab39
	and a
	ret

Function8ab3b:
.pressed_start
	call Function891fe
	call ClearBGPalettes
	call Function893cc
	call Function89807
	call Function89492
	call Function894ca
	call OpenSRAMBank4
	ld hl, $a603
	ld de, wd008
	call Function89381
	call CloseSRAM
	call Function8987f
	call OpenSRAMBank4
	hlcoord 1, 13
	ld bc, $a007
	call Function89a0c
	call CloseSRAM
	call Function891ab
	call .JoypadLoop
	jr c, .pressed_start
	ret

.JoypadLoop:
	call JoyTextDelay_ForcehJoyDown
	bit A_BUTTON_F, c
	jr nz, .a_b_button
	bit B_BUTTON_F, c
	jr nz, .a_b_button
	bit START_F, c
	jr z, .JoypadLoop
	call PlayClickSFX
	call Function89d0d
	scf
	ret

.a_b_button
	call PlayClickSFX
	and a
	ret

Function8ab93:
	call ClearBGPalettes
	call LoadStandardMenuHeader
	farcall Function105688
	call ClearSprites
	call Function891fe
	call Function89b28
	ret

Function8aba9:
	ld a, $2
	call Function8b94a
	ld a, $1
	ld [wd032], a
.asm_8abb3
	call Function891fe
	call Function8b677
.asm_8abb9
	call Function8b7bd
	jr z, .asm_8abdf
	ld a, c
	ld [wMenuSelection], a
	call OpenSRAMBank4
	call Function8931b
	ld hl, $0011
	add hl, bc
	call Function89b45
	call CloseSRAM
	jr c, .asm_8abe2
	ld de, SFX_WRONG
	call WaitPlaySFX
	call CloseSRAM
	jr .asm_8abb9

.asm_8abdf
	xor a
	ld c, a
	ret

.asm_8abe2
	call PlayClickSFX
.asm_8abe5
	call Function891de
	call ClearBGPalettes
	call Function893cc
	call OpenSRAMBank4
	call Function8931b
	call Function89844
	call CloseSRAM
	call OpenSRAMBank4
	call Function8939a
	call Function89856
	hlcoord 1, 13
	call Function899fe
	call CloseSRAM
	call Function891ab
.asm_8ac0f
	call Function89a57
	jr c, .asm_8ac0f
	and a
	jr z, .asm_8abe5
	cp $2
	jr z, .asm_8ac0f
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Textbox
	hlcoord 1, 14
	ld de, String_8ac3b
	call PlaceString
	ld a, $1
	call Function8925e
	jp c, .asm_8abb3
	ld a, [wMenuSelection]
	ld c, a
	ret

String_8ac3b:
	db   "こ<NO>ともだち<NI>でんわを"
	next "かけますか？@"

Function8ac4e:
	xor a
	ld [wMenuSelection], a
	push de
	call Function891de
	call ClearBGPalettes
	call Function893cc
	pop bc
	call Function89844
	call Function8939a
	call Function89856
	hlcoord 1, 13
	call Function899fe
	call Function891ab
	ret

Function8ac70:
	push de
	ld a, $3
	call Function8b94a

Function8ac76:
	call Function891fe
	call Function8b677

Function8ac7c:
	call Function8b7bd
	jr z, .asm_8acf0
	ld a, c
	ld [wd02f], a
	ld [wMenuSelection], a
	call OpenSRAMBank4
	call Function8931b
	call Function8932d
	call CloseSRAM
	jr nc, .asm_8acb0
	call OpenSRAMBank4
	ld hl, $0011
	add hl, bc
	call Function89b45
	call CloseSRAM
	jr nc, .asm_8accc
	call OpenSRAMBank4
	call Function892b7
	call CloseSRAM
	jr .asm_8accc

.asm_8acb0
	call Function8ad0b
	jr c, Function8ac76
	and a
	jr nz, .asm_8accc
	call OpenSRAMBank4
	ld h, b
	ld l, c
	ld d, $0
	ld e, $6
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld c, $1f
	call Function89193
	jr .asm_8ace4

.asm_8accc
	pop hl
	call OpenSRAMBank4
	ld d, b
	ld e, c
	ld c, $6
	call Function89193
	ld a, $6
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld c, $1f
	call Function89193

.asm_8ace4
	call CloseSRAM
	call LoadStandardFont
	ld a, [wd02f]
	ld c, a
	and a
	ret

.asm_8acf0
	ld hl, MobileCardFolderFinishRegisteringCardsText
	call PrintText
	ld a, $2
	call Function89259
	jp c, Function8ac7c
	call LoadStandardFont
	pop de
	ld c, $0
	scf
	ret

MobileCardFolderFinishRegisteringCardsText:
	text_far _MobileCardFolderFinishRegisteringCardsText
	text_end

Function8ad0b:
.asm_8ad0b
	ld a, [wMenuSelection]
	ld [wd02f], a
	call Function891de
	call ClearBGPalettes
	call Function893cc
	call OpenSRAMBank4
	call Function8931b
	push bc
	call Function89844
	call Function8939a
	call Function89856
	hlcoord 1, 13
	call Function899fe
	call CloseSRAM
	call Function891ab
	pop bc
.asm_8ad37
	push bc
	call Function89a57
	pop bc
	jr c, .asm_8ad37
	and a
	jr z, .asm_8ad0b
	cp $2
	jr z, .asm_8ad37
	call Mobile22_SetBGMapMode0
	push bc
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Textbox
	ld de, String_8ad89
	hlcoord 1, 14
	call PlaceString
	ld a, $2
	call Function8925e
	jr c, .asm_8ad87
	call Mobile22_SetBGMapMode0
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Textbox
	ld de, String_8ad9c
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	call Function8925e
	jr c, .asm_8ad84
	ld a, $0
	jr .asm_8ad86

.asm_8ad84
	ld a, $1

.asm_8ad86
	and a

.asm_8ad87
	pop bc
	ret

String_8ad89:
	db   "こ<NO>めいし<WO>けして"
	next "いれかえますか？@"

String_8ad9c:
	db   "おともだち<NO>なまえを"
	next "のこして　おきますか？@"

Function8adb3:
	call Function891de
	call Function8a262
	push af
	call Function891de
	pop af
	ret

Function8adbf:
	call OpenSRAMBank4
	ld hl, $a603
	call Function89b45
	call CloseSRAM
	ret

Function8adcc:
	call OpenSRAMBank4
	call Function8b3b0
	call CloseSRAM
	ret nc
	cp $2
	ret z
	scf
	ret
