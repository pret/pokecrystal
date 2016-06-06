MainMenu_Mobile: ; 49efc
	call ClearBGPalettes
	ld a, MUSIC_MOBILE_ADAPTER_MENU
	ld [wMapMusic], a
	ld de, MUSIC_MOBILE_ADAPTER_MENU
	call Function4a6c5
Function49f0a: ; 49f0a
	call ClearBGPalettes
	call Function4a3a7
	call Function4a492
	call ClearBGPalettes
Function49f16: ; 49f16
	call MobileMenu_InitMenuBuffers
	ld c, 12
	call DelayFrames
	hlcoord 4, 0
	ld b, 10
	ld c, 10
	call Function48cdc
	hlcoord 6, 2
	ld de, MobileString1
	call PlaceString
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_HEIGHT
	call TextBox
	xor a
	ld de, String_0x49fe9
	hlcoord 1, 14
	call PlaceString
	call WaitBGMap2
	call SetPalettes
	call StaticMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc
	jr .check_buttons

.joy_loop
	call ScrollingMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc

.check_buttons
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit B_BUTTON_F, a
	jr nz, .b_button
	jr .next

.a_button
	ld hl, wMenuCursorY
	ld a, [hl]
	cp 1
	jp z, Function4a098
	cp 2
	jp z, Function4a0b9
	cp 3
	jp z, Function4a0c2
	cp 4
	jp z, Function4a100
	ld a, 1
	call MenuClickSound
.b_button
	pop bc
	call ClearBGPalettes
	call ClearTileMap
	ld a, MUSIC_MAIN_MENU
	ld [wMapMusic], a
	ld de, MUSIC_MAIN_MENU
	call Function4a6c5
	ret

.next
	ld hl, wMenuCursorY
	ld a, [hl]
	dec a
	ld hl, MobileStrings2
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, 4
	ld c, SCREEN_HEIGHT
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	jp .useless_jump

.useless_jump
	call MobileMenu_InitMenuBuffers
	pop bc
	ld hl, wMenuCursorY
	ld [hl], b
	ld b, $a
	ld c, $1
	hlcoord 5, 1
	call ClearBox
	jp .joy_loop
; 49fcc


MobileString1: ; 49fcc
	db   "めいしフ,ルダー"
	next "あいさつ"
	next "プロフィール"
	next "せ", $1e, "い"
	next "もどる"
	db   "@"
; 49fe9


MobileStrings2:

String_0x49fe9: ; 49fe9
	db   "めいし¯つくったり"
	next "ほぞんしておける フ,ルダーです@"
; 4a004

String_0x4a004: ; 4a004
	db   "モバイルたいせんや じぶんのめいしで"
	next "つかう あいさつ¯つくります@"
; 4a026

String_0x4a026: ; 4a026
	db   "あなた%じゅうしょや ねんれいの"
	next "せ", $1e, "い¯かえられます@"
; 4a042

String_0x4a042: ; 4a042
	db  "モバイルセンター", $1d, "せつぞくするとき"
	next "ひつような こと¯きめます@"
; 4a062

String_0x4a062: ; 4a062
	db   "まえ%がめん ", $1d, "もどります"
	next "@"
; 4a071

MobileMenu_InitMenuBuffers: ; 4a071 (12:6071)
	ld hl, w2DMenuCursorInitY
	ld a, 2
	ld [hli], a
	ld a, 5 ; w2DMenuCursorInitX
	ld [hli], a
	ld a, 5 ; w2DMenuNumRows
	ld [hli], a
	ld a, 1 ; w2DMenuNumCols
	ld [hli], a
	ld [hl], $0 ; w2DMenuFlags1
	set 5, [hl]
	inc hl
	xor a ; w2DMenuFlags2
	ld [hli], a
	ld a, $20 ; w2DMenuCursorOffsets
	ld [hli], a
	; this is a stupid way to load $c3
	ld a, A_BUTTON
	add D_UP
	add D_DOWN
	add B_BUTTON
	ld [hli], a ; wMenuJoypadFilter
	ld a, 1
	ld [hli], a ; wMenuCursorY, wMenuCursorX
	ld [hli], a ; wMenuCursorY, wMenuCursorX
	ret

Function4a098: ; 4a098 (12:6098)
	ld a, 2
	call MenuClickSound
	call PlaceHollowCursor
	call WaitBGMap
	call LoadStandardMenuDataHeader
	callba Function89de0
	call Call_ExitMenu
	call MG_Mobile_Layout_LoadPals
	call Function4a485
	pop bc
	jp Function49f16

Function4a0b9: ; 4a0b9 (12:60b9)
	ld a, 2
	call MenuClickSound
	pop bc
	jp Function4a4c4

Function4a0c2: ; 4a0c2 (12:60c2)
	ld a, 2
	call MenuClickSound
	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld hl, sPlayerData + PlayerName - wPlayerData
	ld de, PlayerName
	ld bc, 6 ; japanese name length
	call CopyBytes
	call CloseSRAM
	callba _LoadData
	ld c, 2
	call DelayFrames
	ld c, $1
	call InitMobileProfile
	push af
	call ClearBGPalettes
	pop af
	and a
	jr nz, .skip_save
	callba _SaveData
.skip_save
	ld c, 5
	call DelayFrames
	jr asm_4a111

Function4a100: ; 4a100 (12:6100)
	ld a, 2
	call MenuClickSound
	call ClearBGPalettes
	call Function4a13b
	call ClearBGPalettes
	call ClearTileMap

asm_4a111: ; 4a111 (12:6111)
	pop bc
	call LoadFontsExtra
	jp Function49f0a

Function4a118: ; 4a118 (12:6118)
	ld hl, w2DMenuCursorInitY
	ld a, $1
	ld [hli], a
	ld a, $d
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $2
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hli], a
	ret

Function4a13b: ; 4a13b (12:613b)
	call Function4a3a7
	call Function4a492
	call Function4a373
	ld c, 10
	call DelayFrames

Function4a149: ; 4a149 (12:6149)
	hlcoord 1, 2
	ld b, $6
	ld c, $10
	call Function48cdc
	hlcoord 3, 4
	ld de, String_4a1ef
	call PlaceString
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call TextBox
	ld a, [wMenuCursorY]
	dec a
	ld hl, Strings_4a23d
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, $4
	ld c, $12
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	callba Mobile_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	call SetPalettes
	call StaticMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc
	jr asm_4a19d

Function4a195: ; 4a195 (12:6195)
	call ScrollingMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc

asm_4a19d: ; 4a19d (12:619d)
	bit 0, a
	jr nz, .asm_4a1a7
	bit 1, a
	jr nz, .asm_4a1ba
	jr .asm_4a1bc
.asm_4a1a7
	ld hl, wMenuCursorY
	ld a, [hl]
	cp $1
	jp z, Function4a20e
	cp $2
	jp z, Function4a221
	ld a, $1
	call MenuClickSound
.asm_4a1ba
	pop bc
	ret
.asm_4a1bc
	ld hl, wMenuCursorY
	ld a, [hl]
	dec a
	ld hl, Strings_4a23d
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, $4
	ld c, $12
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	jr .asm_4a1db
.asm_4a1db
	call Function4a373
	pop bc
	ld hl, wMenuCursorY
	ld [hl], b
	lb bc, 6, 1
	hlcoord 2, 3
	call ClearBox
	jp Function4a195
; 4a1ef (12:61ef)

String_4a1ef: ; 4a1ef
	db   "モバイルセンター¯えらぶ"
	next "ログインパスワード¯いれる"
	next "もどる@"
; 4a20e

Function4a20e: ; 4a20e (12:620e)
	ld a, $1
	call MenuClickSound
	callba Function1719c8
	call ClearBGPalettes
	call DelayFrame
	jr Function4a239

Function4a221: ; 4a221 (12:6221)
	ld a, $1
	call MenuClickSound
	call Function4a28a
	jr c, Function4a239
	call Function4a373
	ld a, $2
	ld [wMenuCursorY], a
	jr .asm_4a235
.asm_4a235
	pop bc
	jp Function4a149

Function4a239: ; 4a239 (12:6239)
	pop bc
	jp Function4a13b
; 4a23d (12:623d)

Strings_4a23d: ; 4a23d
	db   "いつも せつぞく¯する"
	next "モバイルセンター¯えらびます@"

	db   "モバイルセンター", $1d, "せつぞくするとき"
	next "つかうパスワード¯ほぞんできます@"

	db   "まえ%がめん ", $1d, "もどります@"

	db   "@"
; 4a28a

Function4a28a: ; 4a28a (12:628a)
	hlcoord 2, 3
	lb bc, 6, 1
	ld a, " "
	call Function4a6d8
	call PlaceHollowCursor
	call WaitBGMap
	call LoadStandardMenuDataHeader
	ld a, $5
	call GetSRAMBank
	ld a, [$aa4b]
	call CloseSRAM
	and a
	jr z, .asm_4a2df
	hlcoord 12, 0
	ld b, $5
	ld c, $6
	call Function48cdc
	hlcoord 14, 1
	ld de, String_4a34b
	call PlaceString
	callba Mobile_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	call Function4a118
	call ScrollingMenuJoypad
	push af
	call PlayClickSFX
	pop af
	bit B_BUTTON_F, a
	jr nz, .quit
	ld a, [wMenuCursorY]
	cp $2
	jr z, .DeleteLoginPassword
	cp $3
	jr z, .quit
.asm_4a2df
	callba Function11765d
	call ClearBGPalettes
	call Call_ExitMenu
	call LoadFontsExtra
	scf
	ret

.DeleteLoginPassword:
	call PlaceHollowCursor
	ld hl, UnknownText_0x4a358
	call PrintText
	hlcoord 14, 7
	ld b, 3
	ld c, 4
	call TextBox
	callba Mobile_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	ld hl, DeletePassword_YesNo_MenuDataHeader
	call LoadMenuDataHeader
	call VerticalMenu
	bit B_BUTTON_F, a
	jr nz, .dont_delete_password
	ld a, [wMenuCursorY]
	cp $2
	jr z, .dont_delete_password
	ld a, $5
	call GetSRAMBank
	ld hl, sMobileLoginPassword
	xor a
	ld bc, LOGIN_PASSWORD_LENGTH
	call ByteFill
	call CloseSRAM
	ld hl, UnknownText_0x4a35d
	call PrintText
	call JoyWaitAorB
.dont_delete_password
	call ExitMenu
.quit
	call Call_ExitMenu
	callba Mobile_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	xor a
	ret
; 4a346 (12:6346)

MenuDataHeader_0x4a346: ; 0x4a346
	db $40 ; flags
	db 00, 12 ; start coords
	db 06, 19 ; end coords

String_4a34b: ; 4a34b
	db   "いれなおす"
	next "けす"
	next "もどる@"
; 4a358

UnknownText_0x4a358: ; 0x4a358
	; Delete the saved LOG-IN PASSWORD?
	text_jump UnknownText_0x1c5196
	db "@"
; 0x4a35d

UnknownText_0x4a35d: ; 0x4a35d
	; Deleted the LOG-IN PASSWORD.
	text_jump UnknownText_0x1c51b9
	db "@"
; 0x4a362

DeletePassword_YesNo_MenuDataHeader: ; 0x4a362
	db $40 ; flags
	db 07, 14 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x4a36a
	db 2 ; default option
; 0x4a36a

MenuData2_0x4a36a: ; 0x4a36a
	db $e0 ; flags
	db 2 ; items
	db "はい@"
	db "いいえ@"
; 0x4a373

Function4a373: ; 4a373 (12:6373)
	ld hl, w2DMenuCursorInitY
	ld a, $4
	ld [hli], a
	ld a, $2
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $40
	add $80
	add $2
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hli], a
	ret
; 4a39a (12:639a)

Function4a39a: ; 4a39a
	call Function4a485
	call Function4a492
	call Function4a3aa
	call SetPalettes
	ret
; 4a3a7

Function4a3a7: ; 4a3a7 (12:63a7)
	call Function4a485
Function4a3aa: ; 4a3aa
	hlcoord 0, 0
	lb bc, 3, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 1, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 4, 1
	ld a, $2
	call Function4a6d8
	lb bc, 1, 1
	ld a, $3
	call Function4a6d8
	lb bc, 1, 1
	ld a, " "
	call Function4a6d8
	hlcoord 1, 0
	ld a, $1
	lb bc, 3, 18
	call Function4a6d8
	lb bc, 1, 18
	ld a, $0
	call Function4a6d8
	lb bc, 1, 18
	ld a, $1
	call Function4a6d8
	lb bc, 1, 18
	ld a, $2
	call Function4a6d8
	lb bc, 11, 18
	ld a, " "
	call Function4a6d8
	hlcoord 19, 0
	lb bc, 3, 1
	ld a, $0
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 1, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 4, 1
	ld a, $2
	call Function4a6d8
	lb bc, 1, 1
	ld a, $3
	call Function4a6d8
	lb bc, 1, 1
	ld a, " "
	call Function4a6d8
	ret
; 4a449 (12:6449)

Function4a449: ; 4a449
	ld bc, 3 * SCREEN_WIDTH
	ld a, $0
	hlcoord 0, 0
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $1
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $0
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $1
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, $2
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, $3
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, " "
	call ByteFill
	ret
; 4a485

Function4a485: ; 4a485 (12:6485)
	ld de, GFX_49c0c
	ld hl, VTiles2 tile $00
	lb bc, BANK(GFX_49c0c), 13
	call Get2bpp
	ret

Function4a492: ; 4a492 (12:6492)
	call MG_Mobile_Layout00
	ret


MainMenu_MobileStudium: ; 4a496
	ld a, [StartDay]
	ld b, a
	ld a, [StartHour]
	ld c, a
	ld a, [StartMinute]
	ld d, a
	ld a, [StartSecond]
	ld e, a
	push bc
	push de
	callba MobileStudium
	call ClearBGPalettes
	pop de
	pop bc
	ld a, b
	ld [StartDay], a
	ld a, c
	ld [StartHour], a
	ld a, d
	ld [StartMinute], a
	ld a, e
	ld [StartSecond], a
	ret
; 4a4c4


Function4a4c4: ; 4a4c4 (12:64c4)
	call ClearBGPalettes
	call Function4a3a7
	call Function4a492
	call Function4a680
	call ClearBGPalettes
	ld c, 20
	call DelayFrames
	hlcoord 2, 0
	ld b, $a
	ld c, $e
	call Function48cdc
	hlcoord 4, 2
	ld de, String_4a5c5
	call PlaceString
	hlcoord 4, 4
	ld de, String_4a5cd
	call PlaceString
	hlcoord 4, 6
	ld de, String_4a5da
	call PlaceString
	hlcoord 4, 8
	ld de, String_4a5e6
	call PlaceString
	hlcoord 4, 10
	ld de, String_4a5f2
	call PlaceString
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call TextBox
	xor a
	ld hl, Strings_4a5f6
	ld d, h
	ld e, l
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ld hl, Strings_4a5f6
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 16
	call PlaceString
	call WaitBGMap2
	call SetPalettes
	call StaticMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc
	jr asm_4a54d

Function4a545: ; 4a545 (12:6545)
	call ScrollingMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc

asm_4a54d: ; 4a54d (12:654d)
	bit 0, a
	jr nz, .asm_4a557
	bit 1, a
	jr nz, .asm_4a574
	jr .asm_4a57e
.asm_4a557
	ld hl, wMenuCursorY
	ld a, [hl]
	cp $1
	jp z, Function4a6ab
	cp $2
	jp z, Function4a6ab
	cp $3
	jp z, Function4a6ab
	cp $4
	jp z, Function4a6ab
	ld a, $1
	call MenuClickSound
.asm_4a574
	pop bc
	call ClearBGPalettes
	call ClearTileMap
	jp Function49f0a
.asm_4a57e
	ld hl, wMenuCursorY
	ld a, [hl]
	dec a
	add a
	push af
	ld hl, Strings_4a5f6
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, $4
	ld c, $12
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	pop af
	inc a
	ld hl, Strings_4a5f6
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 16
	call PlaceString
	jp Function4a5b0

Function4a5b0: ; 4a5b0 (12:65b0)
	call Function4a680
	pop bc
	ld hl, wMenuCursorY
	ld [hl], b
	ld b, $a
	ld c, $1
	hlcoord 3, 1
	call ClearBox
	jp Function4a545
; 4a5c5 (12:65c5)

String_4a5c5: ; 4a5c5
	db "じこしょうかい@"
String_4a5cd: ; 4a5cd
	db "たいせん ", $4a, "はじまるとき@"
String_4a5da: ; 4a5da
	db "たいせん ", $1d, "かったとき@"
String_4a5e6: ; 4a5e6
	db "たいせん ", $1d, "まけたとき@"
String_4a5f2: ; 4a5f2
	db "もどる@"
; 4a5f6

Strings_4a5f6: ; 4a5f6
	db "めいし や ニュース ", $1d, "のせる@"
	db "あなた%あいさつです@"
	db "モバイル たいせん", $4a, "はじまるとき@"
	db "あいて", $1d, "みえる あいさつです@"
	db "モバイル たいせんで かったとき@"
	db "あいて", $1d, "みえる あいさつです@"
	db "モバイル たいせんで まけたとき@"
	db "あいて", $1d, "みえる あいさつです@"
	db "まえ%がめん ", $1d, "もどります@"
	db "@"
; 4a680

Function4a680: ; 4a680 (12:6680)
	ld hl, w2DMenuCursorInitY
	ld a, $2
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, $5
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $40
	add $80
	add $2
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

Function4a6ab: ; 4a6ab (12:66ab)
	ld a, $2
	call MenuClickSound
	call ClearBGPalettes
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	callba Function11c1ab
	pop bc
	call LoadFontsExtra
	jp Function4a4c4

Function4a6c5: ; 4a6c5 (12:66c5)
	ld a, $5
	ld [MusicFade], a
	ld a, e
	ld [MusicFadeIDLo], a
	ld a, d
	ld [MusicFadeIDHi], a
	ld c, 22
	call DelayFrames
	ret

Function4a6d8: ; 4a6d8 (12:66d8)
	push bc
	push hl
.asm_4a6da
	ld [hli], a
	dec c
	jr nz, .asm_4a6da
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, Function4a6d8
	ret
