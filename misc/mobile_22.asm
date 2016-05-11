
String_8911c: ; 8911c
	db   "でんわばんごうが ただしく"   ; Phone number is not
	next "はいって いません!@"         ; entered correctly!
; 89135

String_89135: ; 89135
	db   "データが かわって いますが"  ; The data has changed.
	next "かきかえないで やめますか?@" ; Quit anyway?
; 89153

String_89153: ; 89153
	db   "メッセージは ありません@"    ; No message
; 89160

OpenSRAMBank4: ; 89160
	push af
	ld a, $4
	call GetSRAMBank
	pop af
	ret
; 89168


Function89168: ; 89168 (22:5168)
	ld hl, GameTimerPause
	set 7, [hl]
	ret

Function8916e: ; 8916e (22:516e)
	ld hl, GameTimerPause
	res 7, [hl]
	ret

Function89174: ; 89174 (22:5174)
	ld hl, GameTimerPause
	bit 7, [hl]
	ret

Function8917a: ; 8917a (22:517a)
	ld hl, wd002
	ld bc, $32
	xor a
	call ByteFill
	ret

Function89185: ; 89185 (22:5185)
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

Function89193: ; 89193
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
; 8919e


Function8919e: ; 8919e (22:519e)
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

Function891ab: ; 891ab
	call Mobile22_SetBGMapMode1
	callba ReloadMapPart
	call Mobile22_SetBGMapMode0
	ret
; 891b8

Function891b8: ; 891b8
	call Mobile22_SetBGMapMode0
	hlcoord 0, 0
	ld a, " "
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	call DelayFrame
	ret
; 891ca


Function891ca: ; 891ca (22:51ca)
	push bc
	call Function891b8
	call WaitBGMap
	pop bc
	ret

Function891d3: ; 891d3 (22:51d3)
	push bc
	call Function891ca
	ld c, $10
	call DelayFrames
	pop bc
	ret

Function891de: ; 891de
	call Mobile22_SetBGMapMode0
	call ClearPalettes
	hlcoord 0, 0, AttrMap
	ld a, $7
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	hlcoord 0, 0
	ld a, " "
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	call Function891ab
	ret
; 891fe

Function891fe: ; 891fe
	push bc
	call Function891de
	ld c, $10
	call DelayFrames
	pop bc
	ret
; 89209

Function89209: ; 89209
	ld a, 1
	ld [wSpriteUpdatesEnabled], a
	ret
; 8920f

Function8920f: ; 8920f
	ld a, 0
	ld [wSpriteUpdatesEnabled], a
	ret
; 89215

Function89215: ; 89215
	push hl
	push bc
	ld bc, AttrMap - TileMap
	add hl, bc
	ld [hl], a
	pop bc
	pop hl
	ret
; 8921f


Function8921f: ; 8921f (22:521f)
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

Mobile22_ButtonSound: ; 89235 (22:5235)
	call JoyWaitAorB
	call PlayClickSFX
	ret

Mobile22_SetBGMapMode0: ; 8923c
	xor a
	ld [hBGMapMode], a
	ret
; 89240

Mobile22_SetBGMapMode1: ; 89240
	ld a, $1
	ld [hBGMapMode], a
	ret
; 89245


Function89245: ; 89245 (22:5245)
	callba TryLoadSaveFile
	ret c
	callba _LoadData
	and a
	ret

Function89254: ; 89254 (22:5254)
	ld bc, $d07
	jr Function89261

Function89259: ; 89259
	ld bc, $0e07
	jr Function89261

Function8925e: ; 8925e
	ld bc, $0e0c

Function89261: ; 89261
	push af
	push bc
	ld hl, MenuDataHeader_0x892a3
	call CopyMenuDataHeader
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
	call Function89209
	call VerticalMenu
	push af
	ld c, $a
	call DelayFrames
	call CloseWindow
	call Function8920f
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
; 892a3

MenuDataHeader_0x892a3: ; 0x892a3
	db $40 ; flags
	db 05, 10 ; start coords
	db 09, 15 ; end coords
	dw MenuData2_0x892ab
	db 1 ; default option
; 0x892ab

MenuData2_0x892ab: ; 0x892ab
	db $c0 ; flags
	db 2 ; items
	db "はい@"
	db "いいえ@"
; 0x892b4

Function892b4: ; 892b4 (22:52b4)
	call Function8931b

Function892b7: ; 892b7
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
; 89305


Function89305: ; 89305 (22:5305)
	xor a
	ld [MenuSelection], a
	ld c, 40
.loop
	ld a, [MenuSelection]
	inc a
	ld [MenuSelection], a
	push bc
	call Function892b4
	pop bc
	dec c
	jr nz, .loop
	ret

Function8931b: ; 8931b
	push hl
	ld hl, $a03b ; 4:a03b
	ld a, [MenuSelection]
	dec a
	ld bc, 37
	call AddNTimes
	ld b, h
	ld c, l
	pop hl
	ret
; 8932d

Function8932d: ; 8932d
	ld hl, 0
	add hl, bc

Function89331: ; 89331
; Scans up to 5 characters starting at hl, looking for a nonspace character up to the next terminator.
; Sets carry if it does not find a nonspace character.
; Returns the location of the following character in hl.
	push bc
	ld c, 5
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
; 89346


Function89346: ; 89346 (22:5346)
	ld h, b
	ld l, c
	jr _incave

Function8934a: ; 8934a
	ld hl, 6
	add hl, bc
_incave:
; Scans up to 5 characters starting at hl, looking for a nonspace character up to the next terminator.  Sets carry if it does not find a nonspace character.  Returns the location of the following character in hl.
	push bc
	ld c, 5
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
; 89363

Function89363: ; 89363
; Scans six byte pairs starting at bc to find $ff.  Sets carry if it does not find a $ff.  Returns the location of the byte after the first $ff found in hl.
	ld h, b
	ld l, c
	jr ._incave

	ld hl, 25
	add hl, bc

._incave
	push de
	ld e, 6
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
; 89381

Function89381: ; 89381
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
; 8939a

Function8939a: ; 8939a
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
; 893b3


Function893b3: ; 893b3 (22:53b3)
	call DisableLCD
	call ClearSprites
	call LoadStandardFont
	call LoadFontsExtra
	call Function893ef
	call Function8942b
	call Function89455
	call EnableLCD
	ret

Function893cc: ; 893cc
	call DisableLCD
	call ClearSprites
	call LoadStandardFont
	call LoadFontsExtra
	call Function893ef
	call Function89464
	call EnableLCD
	ret
; 893e2


Function893e2: ; 893e2 (22:53e2)
	call Function89b1e
	call Function893b3
	call Function8a5b6
	call Function8949c
	ret

Function893ef: ; 893ef
	ld de, VTiles0
	ld hl, GFX_8940b
	ld bc, $20
	ld a, BANK(GFX_8940b)
	call FarCopyBytes
	ret
; 893fe

Function893fe: ; 893fe
	call DisableLCD
	call Function893ef
	call EnableLCD
	call DelayFrame
	ret
; 8940b

GFX_8940b: ; 8940b
INCBIN "gfx/unknown/08940b.2bpp"
; 8942b

Function8942b: ; 8942b (22:542b)
	ld de, VTiles0 tile $02
	ld hl, MobileAdapterGFX + $7d0
	ld bc, $80
	ld a, BANK(MobileAdapterGFX)
	call FarCopyBytes
	ld de, VTiles0 tile $0a
	ld hl, MobileAdapterGFX + $c60
	ld bc, $40
	ld a, BANK(MobileAdapterGFX)
	call FarCopyBytes
	ret

Function89448: ; 89448 (22:5448)
; Clears the Sprites array
	push af
	ld hl, Sprites
	ld d, $10 * 6
	xor a
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	pop af
	ret

Function89455: ; 89455 (22:5455)
	ld hl, MobileAdapterGFX + $7d0
	ld de, VTiles2 tile $0c
	ld bc, $490
	ld a, BANK(MobileAdapterGFX)
	call FarCopyBytes
	ret

Function89464: ; 89464
	ld hl, MobileAdapterGFX
	ld de, VTiles2
	ld bc, $200
	ld a, BANK(MobileAdapterGFX)
	call FarCopyBytes
	ld hl, MobileAdapterGFX + $660
	ld de, VTiles2 tile $20
	ld bc, $170
	ld a, BANK(MobileAdapterGFX)
	call FarCopyBytes
	ret
; 89481

Function89481: ; 89481
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
; 89492


Function89492: ; 89492 (22:5492)
	ld d, 0
	ld a, [PlayerGender]
	bit 0, a
	ret z
	inc d
	ret

Function8949c: ; 8949c
	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a
	ld hl, Palette_894b3
	ld de, UnknBGPals + 8 * 7
	ld bc, 8
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 894b3

Palette_894b3: ; 894b3
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00
; 894bb

Function894bb: ; 894bb
	call Function894dc
	push bc
	call Function8956f
	call Function8949c
	call Function8a60d
	pop bc
	ret
; 894ca


Function894ca: ; 894ca (22:54ca)
	push bc
	call Function894dc
	call Function895c7
	call Function8949c
	call Function8a60d
	call SetPalettes
	pop bc
	ret

Function894dc: ; 894dc
	push bc
	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a

	ld c, d
	ld b, 0
	ld hl, .PalettePointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, UnknBGPals
	ld bc, 3 palettes
	call CopyBytes
	ld hl, .Pals345
	ld de, UnknBGPals + 3 palettes
	ld bc, 3 palettes
	call CopyBytes

	pop af
	ld [rSVBK], a
	pop bc
	ret
; 89509

.PalettePointers: ; 89509
	dw .Pals012a
	dw .Pals012b
	dw .Pals012c
; 8950f

.Pals012a: ; 8950f
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

.Pals012b: ; 89527
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

.Pals012c: ; 8953f
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

.Pals345: ; 89557
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
; 8956f

Function8956f: ; 8956f
	push bc
	ld hl, 16
	add hl, bc
	ld d, h
	ld e, l
	ld hl, $000c
	add hl, bc
	ld b, h
	ld c, l
	callba GetMobileOTTrainerClass
	ld a, c
	ld [TrainerClass], a
	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a
	ld hl, wd030
	ld a, -1
	ld [hli], a
	ld a, " "
	ld [hl], a
	pop af
	ld [rSVBK], a
	ld a, [TrainerClass]
	ld h, 0
	ld l, a
	add hl, hl
	add hl, hl
	ld de, TrainerPalettes
	add hl, de
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
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
	ld [rSVBK], a
	pop bc
	ret
; 895c7


Function895c7: ; 895c7 (22:55c7)
	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a
	ld hl, Palette_895de
	ld de, wd030
	ld bc, 8
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 895de (22:55de)

Palette_895de: ; 895de
	RGB 31, 31, 31
	RGB 07, 07, 06
	RGB 07, 07, 06
	RGB 00, 00, 00
; 895e6

Function895e6: ; 895e6
	ld a, 7
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ret
; 895f2

Function895f2: ; 895f2
	push bc
	xor a
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	call Function89605
	call Function89655
	pop bc
	ret
; 89605

Function89605: ; 89605
	hlcoord 19, 2, AttrMap
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
	hlcoord 0, 16, AttrMap
	ld c, 10
	ld a, 2
.loop2
	ld [hli], a
	dec a
	ld [hli], a
	inc a
	dec c
	jr nz, .loop2
	hlcoord 1, 11, AttrMap
	ld a, 4
	ld bc, 4
	call ByteFill
	ld a, 5
	ld bc, 14
	call ByteFill
	ret
; 8963d

Function8963d: ; 8963d
	hlcoord 12, 3, AttrMap
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
; 89655

Function89655: ; 89655
	hlcoord 1, 12, AttrMap
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
; 8966c

Function8966c: ; 8966c
	push bc
	call Function89688
	hlcoord 4, 0
	ld c, 8
	call Function896f5
	pop bc
	ret
; 8967a


Function8967a: ; 8967a (22:567a)
	push bc
	call Function89688
	hlcoord 2, 0
	ld c, 12
	call Function896f5
	pop bc
	ret

Function89688: ; 89688
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
; 896cb

Function896cb: ; 896cb
	ld de, SCREEN_WIDTH - 1
	ld a, 7
	ld [hl], a
	add hl, de
	ld a, 9
	ld [hli], a
	ret
; 896d6

Function896d6: ; 896d6
	ld de, SCREEN_WIDTH - 1
	ld a, 10
	ld [hl], a
	add hl, de
	ld a, 11
	ld [hli], a
	ret
; 896e1

Function896e1: ; 896e1
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
; 896eb

Function896eb: ; 896eb
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
; 896f5

Function896f5: ; 896f5
	call Function8971f
	call Function89736
	inc hl
	inc hl
	ld b, 2

ClearScreenArea: ; 0x896ff
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
	jr nz, .asm_89713 ; 0x8971c $f5
	ret
; 0x8971f

Function8971f: ; 8971f
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
; 89736

Function89736: ; 89736
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
; 89753

Function89753: ; 89753
	ld a, $c
	ld [hl], a
	xor a
	call Function89215
	ret
; 8975b

Function8975b: ; 8975b
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
; 89771

Function89771: ; 89771
	ld a, $12
	ld [hl], a
	ld a, $3
	call Function89215
	ret
; 8977a

Function8977a: ; 8977a
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
; 89797

Function89797: ; 89797
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
; 897af

Function897af: ; 897af
	push bc
	ld hl, $0010
	add hl, bc
	ld d, h
	ld e, l
	ld hl, $000c
	add hl, bc
	ld b, h
	ld c, l
	callba GetMobileOTTrainerClass
	ld a, c
	ld [TrainerClass], a
	xor a
	ld [CurPartySpecies], a
	ld de, VTiles2 tile $37
	callba GetTrainerPic
	pop bc
	ret
; 897d5

Function897d5: ; 897d5
	push bc
	call Function8934a
	jr nc, .asm_897f3
	hlcoord 12, 3, AttrMap
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
	ld [hGraphicStartTile], a
	hlcoord 12, 3
	lb bc, 7, 7
	predef PlaceGraphic
	call Function8963d
	pop bc
	ret
; 89807


Function89807: ; 89807 (22:5807)
	ld hl, MobileAdapterGFX + $200
	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_89814
	ld hl, MobileAdapterGFX + $200 + $230
.asm_89814
	call DisableLCD
	ld de, VTiles2 tile $37
	ld bc, $230
	ld a, BANK(MobileAdapterGFX)
	call FarCopyBytes
	call EnableLCD
	call DelayFrame
	ret

Function89829: ; 89829 (22:5829)
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

Function89844: ; 89844
	call Function89481
	call Function894bb
	call Function897af
	push bc
	call WaitBGMap2
	call SetPalettes
	pop bc
	ret
; 89856

Function89856: ; 89856
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
; 8987f


Function8987f: ; 8987f (22:587f)
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

Function898aa: ; 898aa
	ld a, [MenuSelection]
	and a
	ret z
	push bc
	hlcoord 6, 1
	ld de, MenuSelection
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	ret
; 898be

Function898be: ; 898be
	push bc
	ld de, wd002
	ld hl, wd002
	call Function89331
	jr nc, .asm_898cd
	ld de, String_89116

.asm_898cd
	hlcoord 9, 1
	ld a, [MenuSelection]
	and a
	jr nz, .asm_898d7
	dec hl

.asm_898d7
	call PlaceString
	pop bc
	ret
; 898dc

Function898dc: ; 898dc
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
; 898f3

Function898f3: ; 898f3
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
; 89915

Function89915: ; 89915
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
; 89942

Unknown_89942: ; 89942
	db $24, $25, $26, " ", $27, $28, $29, $2a
Unknown_8994a: ; 8994a
	db $24, $27, $29, $ff
; 8994e

Function8994e: ; 8994e
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
; 89962

Function89962: ; 89962
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
; 89975

Function89975: ; 89975
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
; 8998b

Function8998b: ; 8998b
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
; 8999c


Function8999c: ; 8999c (22:599c)
	ld de, PlayerName
	call PlaceString
	inc bc
	ld h, b
	ld l, c
	ld de, String_899ac
	call PlaceString
	ret
; 899ac (22:59ac)

String_899ac: ; 899ac
	db "の めいし@"
; 899b2

Function899b2: ; 899b2 (22:59b2)
	ld bc, PlayerName
	call Function89346
	jr c, .asm_899bf
	ld de, PlayerName
	jr .asm_899c2
.asm_899bf
	ld de, String_89116
.asm_899c2
	hlcoord 6, 4
	call PlaceString
	ret

Function899c9: ; 899c9 (22:59c9)
	ld de, PlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ret

Function899d3: ; 899d3
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
; 899fe

Function899fe: ; 899fe
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
; 89a0c

Function89a0c: ; 89a0c
	push hl
	call Function89363
	pop hl
	jr c, .asm_89a1c
	ld d, h
	ld e, l
	callba Function11c08f
	ret

.asm_89a1c
	ld de, String_89153
	call PlaceString
	ret
; 89a23


Function89a23: ; 89a23 (22:5a23)
	hlcoord 0, 11
	ld b, $4
	ld c, $12
	call Function8921f
	ret

Function89a2e: ; 89a2e (22:5a2e)
	hlcoord 11, 12
	ld b, $2
	ld c, $6
	call TextBox
	hlcoord 13, 13
	ld de, String_89a4e
	call PlaceString
	hlcoord 13, 14
	ld de, String_89a53
	call PlaceString
	call Function89655
	ret
; 89a4e (22:5a4e)

String_89a4e: ; 89a4e
	db "けってい@"
; 89a53

String_89a53: ; 89a53
	db "やめる@"
; 89a57

Function89a57: ; 89a57
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
; 89a8a

.PlayPocketSwitchSFX: ; 89a8a
	push af
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	pop af
	ret
; 89a93

.MoveCursorDown: ; 89a93
	ld d, 40
	ld e,  1
	call .ApplyCursorMovement
	ret
; 89a9b

.MoveCursorUp: ; 89a9b
	ld d,  1
	ld e, -1
	call .ApplyCursorMovement
	ret
; 89aa3

.ApplyCursorMovement: ; 89aa3
	ld a, [MenuSelection]
	ld c, a
	push bc
.loop
	ld a, [MenuSelection]
	cp d
	jr z, .equal_to_d
	add e
	jr nz, .not_zero
	inc a

.not_zero
	ld [MenuSelection], a
	call .Function89ac7 ; BCD conversion of data in SRAM?
	jr nc, .loop
	call .Function89ae6 ; split [MenuSelection] into [wd030] + [wd031] where [wd030] <= 5
	pop bc
	and a
	ret

.equal_to_d
	pop bc
	ld a, c
	ld [MenuSelection], a
	scf
	ret
; 89ac7

.Function89ac7: ; 89ac7
	call OpenSRAMBank4
	call Function8931b
	call .Function89ad4
	call CloseSRAM
	ret
; 89ad4

.Function89ad4: ; 89ad4
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
; 89ae6

.Function89ae6: ; 89ae6
	ld hl, wd031
	xor a
	ld [hl], a
	ld a, [MenuSelection]
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
; 89b00


Function89b00: ; 89b00 (22:5b00)
	callba MG_Mobile_Layout_LoadPals
	ret
; 89b07 (22:5b07)

Function89b07: ; 89b07
	call Mobile22_SetBGMapMode0
	call DelayFrame
	callba Function4a3a7
	ret
; 89b14

Function89b14: ; 89b14
	call ClearBGPalettes
	call Function89b07
	call Function89b00
	ret
; 89b1e

Function89b1e: ; 89b1e (22:5b1e)
	callba Function4a485
	call Function89b00
	ret

Function89b28: ; 89b28 (22:5b28)
	call Function891de
	call ClearBGPalettes
	call Function893e2
	call Call_ExitMenu
	call Function891ab
	call SetPalettes
	ret

Function89b3b: ; 89b3b (22:5b3b)
	call Mobile22_SetBGMapMode0
	callba Function48cda
	ret

Function89b45: ; 89b45
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
; 89b78


Function89b78: ; 89b78 (22:5b78)
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

Function89b97: ; 89b97 (22:5b97)
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
	ld de, Sprites
.asm_89bb4
	ld a, [hli]
	cp $ff
	ret z
	ld c, a
	ld b, $0
.asm_89bbb
	push hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, $8
	add b
	ld b, a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop hl
	dec c
	jr nz, .asm_89bbb
	ld b, $0
	ld c, $4
	add hl, bc
	jr .asm_89bb4
; 89bd8 (22:5bd8)

Unknown_89bd8: ; 89bd8
	dw Unknown_89be0
	dw Unknown_89bf5
	dw Unknown_89c0a
	dw Unknown_89c1f
; 89be0

Unknown_89be0: ; 89be0
	db $01, $12, $4e, $01, $00
	db $01, $19, $4e, $01, $40
	db $01, $12, $72, $01, $20
	db $01, $19, $72, $01, $60
	db $ff

Unknown_89bf5: ; 89bf5
	db $01, $60, $16, $01, $00
	db $01, $62, $16, $01, $40
	db $01, $60, $92, $01, $20
	db $01, $62, $92, $01, $60
	db $ff

Unknown_89c0a: ; 89c0a
	db $01, $78, $66, $01, $00
	db $01, $78, $66, $01, $40
	db $01, $78, $92, $01, $20
	db $01, $78, $92, $01, $60
	db $ff

Unknown_89c1f: ; 89c1f
	db $01, $80, $66, $01, $00
	db $01, $80, $66, $01, $40
	db $01, $80, $92, $01, $20
	db $01, $80, $92, $01, $60
	db $ff
; 89c34

Function89c34: ; 89c34 (22:5c34)
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

Function89c44: ; 89c44 (22:5c44)
	call Function89c34
	jr c, .asm_89c4f
	push de
	call Function89448
	pop de
	ret
.asm_89c4f
	ld hl, Sprites
	push de
	ld a, b
	ld [hli], a
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
	ld [hli], a
	ld a, d
	ld [hli], a
	xor a
	ld [hli], a
	ret

Function89c67: ; 89c67 (22:5c67)
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
; 89cbf (22:5cbf)

.ScrollData0: ; 89cbf
	db 0, 2, 0, 0
	db 1, 3, 0, 0
	db 2, 4, 0, 0
	db 3, 0, 0, 0

.ScrollData1: ; 89ccf
	db 0, 0, 0, 0
	db 0, 3, 0, 0
	db 2, 4, 0, 0
	db 3, 0, 0, 0
; 89cdf

Function89cdf: ; 89cdf (22:5cdf)
	ld a, $10
	add b
	ld b, a
	ld a, $8
	add c
	ld c, a
	ld e, $2
	ld a, $2
	ld hl, Sprites
.asm_89cee
	push af
	push bc
	ld d, $4
.asm_89cf2
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, $1
	ld [hli], a
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

Function89d0d: ; 89d0d (22:5d0d)
	call Mobile22_SetBGMapMode0
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld c, 8
	ld de, UnknBGPals
.loop
	push bc
	ld hl, .Palette1
	ld bc, 1 palettes
	call CopyBytes
	pop bc
	dec c
	jr nz, .loop

	ld hl, .Palette2
	ld de, UnknBGPals + 2 palettes
	ld bc, 1 palettes
	call CopyBytes

	pop af
	ld [rSVBK], a

	call SetPalettes
	callba PrintMail_
	call Mobile22_SetBGMapMode1
	ld c, 24
	call DelayFrames
	call RestartMapMusic
	ret
; 89d4e (22:5d4e)

.Palette1: ; 89d4e
	RGB 31, 31, 31
	RGB 19, 19, 19
	RGB 15, 15, 15
	RGB 00, 00, 00
; 89d56

.Palette2: ; 89d56
	RGB 31, 31, 31
	RGB 19, 19, 19
	RGB 19, 19, 19
	RGB 00, 00, 00
; 89d5e

Function89d5e: ; 89d5e (22:5d5e)
	push af
	call CopyMenuDataHeader
	pop af
	ld [wMenuCursorBuffer], a
	call Mobile22_SetBGMapMode0
	call PlaceVerticalMenuItems
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 7, [hl]
	ret

Function89d75: ; 89d75 (22:5d75)
	push hl
	call Mobile22_SetBGMapMode0
	call _hl_
	callba Mobile_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	pop hl
	jr asm_89d90

Function89d85: ; 89d85 (22:5d85)
	push hl
	call Mobile22_SetBGMapMode0
	call _hl_
	call CGBOnly_LoadEDTile
	pop hl

asm_89d90: ; 89d90 (22:5d90)
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

Function89dab: ; 89dab (22:5dab)
	call Mobile22_SetBGMapMode0
	callba MobileMenuJoypad
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

Function89de0: ; 89de0 (22:5de0)
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

Jumptable_89e04: ; 89e04 (22:5e04)
	dw Function8a62c
	dw Function8a999
	dw Function8ab93


Function89e0a: ; 89e0a (22:5e0a)
	call OpenSRAMBank4
	call Function8b3b0
	call CloseSRAM
	ld hl, Jumptable_89e18
	rst JumpTable
	ret

Jumptable_89e18: ; 89e18 (22:5e18)
	dw Function89e1e
	dw Function8a116
	dw Function8a2aa


Function89e1e: ; 89e1e (22:5e1e)
	call OpenSRAMBank4
	ld bc, $a037 ; 4:a037
	call Function8b36c
	call CloseSRAM
	xor a
	ld [wd02d], a

asm_89e2e: ; 89e2e (22:5e2e)
	ld a, [wd02d]
	ld hl, Jumptable_89e3c
	rst JumpTable
	ret

Function89e36: ; 89e36 (22:5e36)
	ld hl, wd02d
	inc [hl]
	jr asm_89e2e

Jumptable_89e3c: ; 89e3c (22:5e3c)
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


Function89e58: ; 89e58 (22:5e58)
	ld a, $1
	call Function8a2fe
	call Function891fe
	call Function893e2
	call Function89168
	and a
	ret

Function89e68: ; 89e68 (22:5e68)
	call Function891fe
	ld a, $1
	scf
	ret

Function89e6f: ; 89e6f (22:5e6f)
	call Function891de
	call Function89245
	call Function89ee1
	call Function89e9a
	hlcoord 7, 4
	call Function8a58d
	ld a, $5
	hlcoord 7, 4, AttrMap
	call Function8a5a3
	ld a, $6
	hlcoord 10, 4, AttrMap
	call Function8a5a3
	call Function891ab
	call SetPalettes
	jp Function89e36

Function89e9a: ; 89e9a (22:5e9a)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_89eb1
	ld de, UnknBGPals + 5 palettes
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 89eb1 (22:5eb1)

Palette_89eb1: ; 89eb1
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 27, 19, 00
	RGB 00, 00, 00
; 89eb9

Function89eb9: ; 89eb9 (22:5eb9)
	call Function891fe
	call Function89ee1
	call Function89e9a
	hlcoord 7, 4
	call Function8a58d
	ld a, $5
	hlcoord 7, 4, AttrMap
	call Function8a5a3
	ld a, $6
	hlcoord 10, 4, AttrMap
	call Function8a5a3
	call Function891ab
	call SetPalettes
	jp Function89e36

Function89ee1: ; 89ee1 (22:5ee1)
	call ClearBGPalettes
	call Function893e2
	call Mobile22_SetBGMapMode0
	callba Function4a3a7
	callba MG_Mobile_Layout_CreatePalBoxes
	hlcoord 1, 0
	call Function8a53d
	ret

Function89efd: ; 89efd (22:5efd)
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

Function89f6a: ; 89f6a (22:5f6a)
	push af
	ld de, $10
	call Function89f9a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	pop af
	ret

Function89f77: ; 89f77 (22:5f77)
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

Function89f9a: ; 89f9a (22:5f9a)
	dec a
	ld hl, Sprites
	and a
	ret z
.asm_89fa0
	add hl, de
	dec a
	jr nz, .asm_89fa0
	ret

Function89fa5: ; 89fa5 (22:5fa5)
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

Function89fce: ; 89fce (22:5fce)
	call Function8a5b6
	ld a, $5
	hlcoord 7, 4, AttrMap
	call Function8a5a3
	ld a, $6
	hlcoord 10, 4, AttrMap
	call Function8a5a3
	call Function89448
	call SetPalettes
	call Function891ab
	jp Function89e36

Function89fed: ; 89fed (22:5fed)
	ld hl, UnknownText_0x8a102
	call PrintText
	jp Function89e36

Function89ff6: ; 89ff6 (22:5ff6)
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
	call Mobile22_ButtonSound
	jp Function89e36

Function8a03d: ; 8a03d (22:603d)
	ld hl, UnknownText_0x8a107
	call Function89209
	call PrintText
	call Function8920f
	jp Function89e36

Function8a04c: ; 8a04c (22:604c)
	ld hl, UnknownText_0x8a10c
	call PrintText
	jp Function89e36

Function8a055: ; 8a055 (22:6055)
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
	call CGBOnly_LoadEDTile
	pop bc
	ld a, c
	cp $b
	jr nz, .asm_8a059
	call Function8a0a1
	hlcoord 12, 4
	call Function8a58d
	ld a, $5
	hlcoord 12, 4, AttrMap
	call Function8a5a3
	pop hl
	ld a, $6
	hlcoord 15, 4, AttrMap
	call Function8a5a3
	call CGBOnly_LoadEDTile
	jp Function89e36

Function8a0a1: ; 8a0a1 (22:60a1)
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

Function8a0c1: ; 8a0c1 (22:60c1)
	push hl
	ld bc, AttrMap - TileMap
	add hl, bc
	ld a, [hl]
	pop hl
	ret

Function8a0c9: ; 8a0c9 (22:60c9)
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

Function8a0de: ; 8a0de (22:60de)
	call Function8a0c9
	ld de, AttrMap - TileMap
	add hl, de
	ret

Function8a0e6: ; 8a0e6 (22:60e6)
	call Function8b539
	jp Function89e36

Function8a0ec: ; 8a0ec (22:60ec)
	ld hl, UnknownText_0x8a111
	call PrintText
	jp Function89e36

Function8a0f5: ; 8a0f5 (22:60f5)
	call Function8b555
	jp nc, Function8a0ff
	ld hl, wd02d
	inc [hl]

Function8a0ff: ; 8a0ff (22:60ff)
	jp Function89e36
; 8a102 (22:6102)

UnknownText_0x8a102: ; 0x8a102
	; The CARD FOLDER stores your and your friends' CARDS. A CARD contains information like the person's name, phone number and profile.
	text_jump UnknownText_0x1c5238
	db "@"
; 0x8a107

UnknownText_0x8a107: ; 0x8a107
	; This is your CARD. Once you've entered your phone number, you can trade CARDS with your friends.
	text_jump UnknownText_0x1c52bc
	db "@"
; 0x8a10c

UnknownText_0x8a10c: ; 0x8a10c
	; If you have your friend's CARD, you can use it to make a call from a mobile phone on the 2nd floor of a #MON CENTER.
	text_jump UnknownText_0x1c531e
	db "@"
; 0x8a111

UnknownText_0x8a111: ; 0x8a111
	; To safely store your collection of CARDS, you must set a PASSCODE for your CARD FOLDER.
	text_jump UnknownText_0x1c5394
	db "@"
; 0x8a116

Function8a116: ; 8a116 (22:6116)
	ld a, $1
	ld [wd030], a
	ld hl, MenuDataHeader_0x8a176
	call LoadMenuDataHeader
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
	call Function89209
	call CloseWindow
	call Function8920f
	scf
	ret
; 8a176 (22:6176)

MenuDataHeader_0x8a176: ; 0x8a176
	db $40 ; flags
	db 00, 14 ; start coords
	db 06, 19 ; end coords
; 8a17b

Function8a17b: ; 8a17b (22:617b)
	decoord 14, 0
	ld b, $5
	ld c, $4
	call Function89b3b
	ld hl, MenuDataHeader_0x8a19a
	ld a, [wd030]
	call Function89d5e
	ld hl, Function8a1b0
	call Function89d75
	jr nc, .asm_8a198
	ld a, $0
.asm_8a198
	ld d, a
	ret
; 8a19a (22:619a)

MenuDataHeader_0x8a19a: ; 0x8a19a
	db $40 ; flags
	db 00, 14 ; start coords
	db 06, 19 ; end coords
	dw MenuData2_0x8a1a2
	db 1 ; default option
; 0x8a1a2

MenuData2_0x8a1a2: ; 0x8a1a2
	db $e0 ; flags
	db 3 ; items
	db "ひらく@"
	db "すてる@"
	db "もどる@"
; 0x8a1b0

Function8a1b0: ; 8a1b0
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call TextBox
	hlcoord 1, 14
	ld a, [wMenuCursorY]
	ld de, Strings_8a1cc
	dec a
	ld c, a
	call Function8919e
	call PlaceString
	ret
; 8a1cc

Strings_8a1cc: ; 8a1cc
	db   "めいし", $25, "せいりと へんしゅうを"
	next "おこないます"
	db   "@"

	db   "めいしフ,ルダー", $25, "めいしと"
	next "あんしょうばんごう", $1f, "けします"
	db   "@"

	db   "まえ", $25, "がめん", $1d, "もどります"
	db   "@"
; 8a20d


Function8a20d: ; 8a20d (22:620d)
	ld hl, UnknownText_0x8a232
	call PrintText
	ld a, $2
	call Function89259
	ret c
	ld hl, UnknownText_0x8a237
	call PrintText
	ld a, $2
	call Function89259
	ret c
	xor a
	call Function8a2fe
	ld hl, UnknownText_0x8a23c
	call PrintText
	xor a
	and a
	ret
; 8a232 (22:6232)

UnknownText_0x8a232: ; 0x8a232
	; If the CARD FOLDER is deleted, all its CARDS and the PASSCODE will also be deleted. Beware--a deleted CARD FOLDER can't be restored. Want to delete your CARD FOLDER?
	text_jump UnknownText_0x1c53ee
	db "@"
; 0x8a237

UnknownText_0x8a237: ; 0x8a237
	; Are you sure you want to delete it?
	text_jump UnknownText_0x1c5494
	db "@"
; 0x8a23c

UnknownText_0x8a23c: ; 0x8a23c
	; The CARD FOLDER has been deleted.
	text_jump UnknownText_0x1c54b9
	db "@"
; 0x8a241

Function8a241: ; 8a241 (22:6241)
	call LoadStandardMenuDataHeader
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

Function8a262: ; 8a262 (22:6262)
	call ClearBGPalettes
	call Function893e2
	call Mobile22_SetBGMapMode0
	callba Function4a3a7
	callba MG_Mobile_Layout_CreatePalBoxes
	hlcoord 1, 0
	call Function8a53d
	hlcoord 12, 4
	call Function8a58d
	ld a, $5
	hlcoord 12, 4, AttrMap
	call Function8a5a3
	ld a, $6
	hlcoord 15, 4, AttrMap
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

Function8a2aa: ; 8a2aa (22:62aa)
	ld hl, MenuDataHeader_0x8a2ef
	call LoadMenuDataHeader
	ld hl, UnknownText_0x8a2f4
	call PrintText
	ld a, $1
	call Function89259
	jr nc, .asm_8a2cf
	ld hl, UnknownText_0x8a2f9
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
; 8a2ef (22:62ef)

MenuDataHeader_0x8a2ef: ; 0x8a2ef
	db $40 ; flags
	db 12, 00 ; start coords
	db 17, 19 ; end coords
; 8a2f4

UnknownText_0x8a2f4: ; 0x8a2f4
	; There is an older CARD FOLDER from a previous journey. Do you want to open it?
	text_jump UnknownText_0x1c54dd
	db "@"
; 0x8a2f9

UnknownText_0x8a2f9: ; 0x8a2f9
	; Delete the old CARD FOLDER?
	text_jump UnknownText_0x1c552d
	db "@"
; 0x8a2fe

Function8a2fe: ; 8a2fe (22:62fe)
	call Function8a313
	call Function89305
	ld hl, $a603
	ld bc, $8
	ld a, -1
	call ByteFill
	call CloseSRAM
	ret

Function8a313: ; 8a313 (22:6313)
	ld c, a
	call OpenSRAMBank4
	ld a, c
	ld [$a60b], a
	ret

Function8a31c: ; 8a31c (22:631c)
	push bc
	call Mobile22_SetBGMapMode0
	callba Function4a3a7
	callba MG_Mobile_Layout_CreatePalBoxes
	hlcoord 1, 0
	call Function8a53d
	hlcoord 12, 4
	call Function8a58d
	call Function8a3b2
	pop bc
	ld a, c
	ld [wMenuCursorBuffer], a
	ld [MenuSelection], a
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
	ld a, [MenuSelection]
	cp $ff
	jr z, .asm_8a36a
	ld e, a
	and a
	ret

Function8a383: ; 8a383 (22:6383)
	callba MobileMenuJoypad
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

Function8a3a2: ; 8a3a2 (22:63a2)
	ld a, [wMenuCursorY]
	dec a
	ld hl, wd002
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [MenuSelection], a
	ret

Function8a3b2: ; 8a3b2 (22:63b2)
	ld a, $1
	ld [MenuSelection], a
	call Function8a4fc
	call Function8a3df
	jr nc, .asm_8a3ce
	decoord 0, 2
	ld b, $6
	ld c, $9
	call Function89b3b
	ld hl, MenuDataHeader_0x8a435
	jr .asm_8a3db
.asm_8a3ce
	decoord 0, 2
	ld b, $8
	ld c, $9
	call Function89b3b
	ld hl, MenuDataHeader_0x8a40f
.asm_8a3db
	call CopyMenuDataHeader
	ret

Function8a3df: ; 8a3df (22:63df)
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

Function8a400: ; 8a400 (22:6400)
	ld a, [de]
	inc de
	ld [hli], a
	cp $ff
	jr nz, Function8a400
	ret
; 8a408 (22:6408)

Unknown_8a408: db 1, 2, -1
Unknown_8a40b: db 1, 2, 3, -1

MenuDataHeader_0x8a40f: ; 0x8a40f
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 10 ; end coords
	dw MenuData2_0x8a417
	db 1 ; default option
; 0x8a417

MenuData2_0x8a417: ; 0x8a417
	db $a0 ; flags
	db 4 ; items
	db "めいしりスト@"
	db "じぶんの めいし@"
	db "めいしこうかん@"
	db "やめる@"
; 0x8a435

MenuDataHeader_0x8a435: ; 0x8a435
	db $40 ; flags
	db 02, 00 ; start coords
	db 09, 10 ; end coords
	dw MenuData2_0x8a43d
	db 1 ; default option
; 0x8a43d

MenuData2_0x8a43d: ; 0x8a43d
	db $a0 ; flags
	db 3 ; items
	db "めいしりスト@"
	db "じぶんの めいし@"
	db "やめる@"
; 0x8a453

Function8a453: ; 8a453 (22:6453)
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call TextBox
	hlcoord 1, 14
	ld de, String_8a476
	ld a, [MenuSelection]
	cp $ff
	jr z, .asm_8a472
	ld de, Strings_8a483
	dec a
	ld c, a
	call Function8919e
.asm_8a472
	call PlaceString
	ret
; 8a476 (22:6476)

String_8a476: ; 8a476
	db   "まえ", $25, "がめん", $1d, "もどります@"
; 8a483

Strings_8a483: ; 8a483
	db   "おともだち", $25, "めいしは"
	next "ここ", $1d, "いれておきます@"

	db   "でんわばんごう", $1f, "いれると"
	next "めいしこうかん", $4a, "できます@"

	db   "ともだちと じぶん", $25, "めいしを"
	next "せきがいせんで こうかん します@"
; 8a4d3

Function8a4d3: ; 8a4d3 (22:64d3)
	ld a, [MenuSelection]
	cp $1
	jr nz, .asm_8a4eb
	ld a, $5
	hlcoord 12, 4, AttrMap
	call Function8a5a3
	ld a, $7
	hlcoord 15, 4, AttrMap
	call Function8a5a3
	ret
.asm_8a4eb
	ld a, $7
	hlcoord 12, 4, AttrMap
	call Function8a5a3
	ld a, $6
	hlcoord 15, 4, AttrMap
	call Function8a5a3
	ret

Function8a4fc: ; 8a4fc (22:64fc)
	ld a, [MenuSelection]
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

Function8a515: ; 8a515 (22:6515)
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

asm_8a529: ; 8a529 (22:6529)
	ld hl, wd012
	ld a, $3c
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ld hl, Sprites
	xor a
	ld bc, $20
	call ByteFill
	ret

Function8a53d: ; 8a53d (22:653d)
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

Function8a573: ; 8a573 (22:6573)
	ld [hl], a
	call Function8a584
	inc a
	dec c
	jr nz, Function8a573
	ret

Function8a57c: ; 8a57c (22:657c)
	ld [hl], a
	call Function8a584
	dec c
	jr nz, Function8a57c
	ret

Function8a584: ; 8a584 (22:6584)
	push af
	ld a, $4
	call Function89215
	inc hl
	pop af
	ret

Function8a58d: ; 8a58d (22:658d)
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

Function8a5a3: ; 8a5a3 (22:65a3)
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

Function8a5b6: ; 8a5b6 (22:65b6)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_8a5e5
	ld de, UnknBGPals + 4 palettes
	ld bc, 3 palettes
	call CopyBytes
	ld hl, Palette_8a5fd
	ld de, UnknOBPals
	ld bc, 1 palettes
	call CopyBytes
	ld hl, Palette_8a605
	ld de, UnknOBPals + 1 palettes
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 8a5e5 (22:65e5)

Palette_8a5e5: ; 8a5e5
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
; 8a5fd

Palette_8a5fd: ; 8a5fd
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
; 8a605

Palette_8a605: ; 8a605
	RGB 00, 00, 00
	RGB 14, 18, 31
	RGB 16, 16, 31
	RGB 31, 31, 31
; 8a60d

Function8a60d: ; 8a60d
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_8a624
	ld de, UnknOBPals
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 8a624

Palette_8a624: ; 8a624
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00
; 8a62c

Function8a62c: ; 8a62c (22:662c)
	call LoadStandardMenuDataHeader
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
	ld [MenuSelection], a
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
	ld [MenuSelection], a
	ld a, c
	dec a
	rst JumpTable
	jr .asm_8a639
.asm_8a66a
	call Function891fe
	call Function89b28
	ret

Jumptable_8a671: ; 8a671 (22:6671)
	dw Function8a679
	dw Function8a6cd
	dw Function8a8c3
	dw Function8a930


Function8a679: ; 8a679 (22:6679)
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

Jumptable_8a6bc: ; 8a6bc (22:66bc)
	dw Function8a6c0
	dw Function8a6c5


Function8a6c0: ; 8a6c0 (22:66c0)
	call PlayClickSFX
	and a
	ret

Function8a6c5: ; 8a6c5 (22:66c5)
	call PlayClickSFX
	call Function89d0d
	scf
	ret

Function8a6cd: ; 8a6cd (22:66cd)
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

Jumptable_8a74f: ; 8a74f (22:674f)
	dw Function8a78c
	dw Function8a7cb
	dw Function8a818
	dw Function8a8a1


Function8a757: ; 8a757 (22:6757)
	call Function8939a
	xor a
	ld [wd010], a
	ld [wd011], a
	ld [wd012], a
	ret

Function8a765: ; 8a765 (22:6765)
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

Function8a78c: ; 8a78c (22:678c)
	call Function891fe
	ld de, wd002
	ld b, $5
	callba NamingScreen
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

Function8a7cb: ; 8a7cb (22:67cb)
	ld a, [MenuSelection]
	push af
	call Function891de
	ld de, wd008
	ld c, $0
	callba Function17a68f
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
	ld [MenuSelection], a
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

Function8a818: ; 8a818 (22:6818)
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
; 8a868 (22:6868)

.string_8a868
	db "めいし", $1f, "かきかえ まし", $22, "@"

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
; 8a88b (22:688b)

String_8a88b: ; 8a88b
	db   "おともだち", $25, "なまえが"
	next "かかれて いません!@"
; 8a8a1

Function8a8a1: ; 8a8a1 (22:68a1)
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

Function8a8c3: ; 8a8c3 (22:68c3)
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
; 8a919 (22:6919)

String_8a919: ; 8a919
	db "このデータ", $1f, "けしますか?@"
; 8a926

String_8a926: ; 8a926
	db "データ", $1f, "けしまし", $22, "@"
; 8a930

Function8a930: ; 8a930 (22:6930)
	ld a, [MenuSelection]
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
	ld [MenuSelection], a
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
	ld [MenuSelection], a
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

Function8a999: ; 8a999 (22:6999)
	ld hl, MenuDataHeader_0x8a9c9
	call LoadMenuDataHeader
	ld c, $1
.asm_8a9a1
	call Function8a9ce
	jr c, .asm_8a9bb
	push bc
	push de
	call LoadStandardMenuDataHeader
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
	call Function89209
	call CloseWindow
	call Function8920f
	ret

Jumptable_8a9c5: ; 8a9c5 (22:69c5)
	dw Function8aa0a
	dw Function8ab3b
; 8a9c9 (22:69c9)

MenuDataHeader_0x8a9c9: ; 0x8a9c9
	db $40 ; flags
	db 04, 11 ; start coords
	db 11, 18 ; end coords
; 8a9ce

Function8a9ce: ; 8a9ce (22:69ce)
	push bc
	decoord 11, 4
	ld b, $6
	ld c, $6
	call Function89b3b
	pop bc
	ld a, c
	ld hl, MenuDataHeader_0x8a9f2
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
; 8a9f2 (22:69f2)

MenuDataHeader_0x8a9f2: ; 0x8a9f2
	db $40 ; flags
	db 04, 11 ; start coords
	db 11, 18 ; end coords
	dw MenuData2_0x8a9fa
	db 1 ; default option
; 0x8a9fa

MenuData2_0x8a9fa: ; 0x8a9fa
	db $a0 ; flags
	db 3 ; items
	db "へんしゅう@"
	db "みる@"
	db "やめる@"
; 0x8aa09

Function8aa09: ; 8aa09
	ret
; 8aa0a

Function8aa0a: ; 8aa0a (22:6a0a)
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

Jumptable_8aa6d: ; 8aa6d (22:6a6d)
	dw Function8aa73
	dw Function8aab6
	dw Function8ab11


Function8aa73: ; 8aa73 (22:6a73)
	ld a, [MenuSelection]
	ld e, a
	push de
	call Function891de
	ld de, wd008
	ld c, $0
	callba Function17a68f
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
	ld [MenuSelection], a
	and a
	ret

Function8aab6: ; 8aab6 (22:6ab6)
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
; 8aaf0 (22:6af0)

String_8aaf0: ; 8aaf0
	db "あたらしい めいし<PKMN>できまし<LNBRK>@"
; 8ab00

Function8ab00: ; 8ab00
	ld de, String_8911c
	hlcoord 1, 13
	call PlaceString
	call WaitBGMap
	call Mobile22_ButtonSound
	and a
	ret

Function8ab11: ; 8ab11 (22:6b11)
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

Function8ab3b: ; 8ab3b (22:6b3b)
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

.JoypadLoop: ; 8ab77 (22:6b77)
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

Function8ab93: ; 8ab93 (22:6b93)
	call ClearBGPalettes
	call LoadStandardMenuDataHeader
	callba Function105688
	call ClearSprites
	call Function891fe
	call Function89b28
	ret
; 8aba9 (22:6ba9)

Function8aba9: ; 8aba9
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
	ld [MenuSelection], a
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
	call TextBox
	hlcoord 1, 14
	ld de, String_8ac3b
	call PlaceString
	ld a, $1
	call Function8925e
	jp c, .asm_8abb3
	ld a, [MenuSelection]
	ld c, a
	ret
; 8ac3b

String_8ac3b: ; 8ac3b
	db   "こ", $25, "ともだち", $1d, "でんわを"
	next "かけますか?@"
; 8ac4e

Function8ac4e: ; 8ac4e
	xor a
	ld [MenuSelection], a
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
; 8ac70

Function8ac70: ; 8ac70
	push de
	ld a, $3
	call Function8b94a

Function8ac76: ; 8ac76
	call Function891fe
	call Function8b677

Function8ac7c: ; 8ac7c
	call Function8b7bd
	jr z, .asm_8acf0
	ld a, c
	ld [wd02f], a
	ld [MenuSelection], a
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
	ld hl, UnknownText_0x8ad06
	call PrintText
	ld a, $2
	call Function89259
	jp c, Function8ac7c
	call LoadStandardFont
	pop de
	ld c, $0
	scf
	ret
; 8ad06

UnknownText_0x8ad06: ; 0x8ad06
	; Finish registering CARDS?
	text_jump UnknownText_0x1c554a
	db "@"
; 0x8ad0b

Function8ad0b: ; 8ad0b
.asm_8ad0b
	ld a, [MenuSelection]
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
	call TextBox
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
	call TextBox
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
; 8ad89

String_8ad89: ; 8ad89
	db   "こ", $25, "めいし", $1f, "けして"
	next "いれかえますか?@"
; 8ad9c

String_8ad9c: ; 8ad9c
	db   "おともだち", $25, "なまえを"
	next "のこして おきますか?@"
; 8adb3

Function8adb3: ; 8adb3
	call Function891de
	call Function8a262
	push af
	call Function891de
	pop af
	ret
; 8adbf

Function8adbf: ; 8adbf
	call OpenSRAMBank4
	ld hl, $a603
	call Function89b45
	call CloseSRAM
	ret
; 8adcc

Function8adcc: ; 8adcc
	call OpenSRAMBank4
	call Function8b3b0
	call CloseSRAM
	ret nc
	cp $2
	ret z
	scf
	ret
; 8addb
