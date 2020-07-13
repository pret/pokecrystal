MainMenu_Mobile:
	call ClearBGPalettes
	ld a, MUSIC_MOBILE_ADAPTER_MENU
	ld [wMapMusic], a
	ld de, MUSIC_MOBILE_ADAPTER_MENU
	call Function4a6c5
Function49f0a:
	call ClearBGPalettes
	call Function4a3a7
	call Function4a492
	call ClearBGPalettes
Function49f16:
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
	call Textbox
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
	call ClearTilemap
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

MobileString1:
	db   "めいしフォルダー"
	next "あいさつ"
	next "プロフィール"
	next "せ<TTE>い"
	next "もどる"
	db   "@"

MobileStrings2:

String_0x49fe9:
	db   "めいし¯つくったり"
	next "ほぞんしておける　フォルダーです@"

String_0x4a004:
	db   "モバイルたいせんや　じぶんのめいしで"
	next "つかう　あいさつ¯つくります@"

String_0x4a026:
	db   "あなた<NO>じゅうしょや　ねんれいの"
	next "せ<TTE>い¯かえられます@"

String_0x4a042:
	db  "モバイルセンター<NI>せつぞくするとき"
	next "ひつような　こと¯きめます@"

String_0x4a062:
	db   "まえ<NO>がめん　<NI>もどります"
	next "@"

MobileMenu_InitMenuBuffers:
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
	; could have done "ld a, A_BUTTON | D_UP | D_DOWN | B_BUTTON" instead
	ld a, A_BUTTON
	add D_UP
	add D_DOWN
	add B_BUTTON
	ld [hli], a ; wMenuJoypadFilter
	ld a, 1
	ld [hli], a ; wMenuCursorY, wMenuCursorX
	ld [hli], a ; wMenuCursorY, wMenuCursorX
	ret

Function4a098:
	ld a, 2
	call MenuClickSound
	call PlaceHollowCursor
	call WaitBGMap
	call LoadStandardMenuHeader
	farcall Function89de0
	call Call_ExitMenu
	call MG_Mobile_Layout_LoadPals
	call Function4a485
	pop bc
	jp Function49f16

Function4a0b9:
	ld a, 2
	call MenuClickSound
	pop bc
	jp Function4a4c4

Function4a0c2:
	ld a, 2
	call MenuClickSound
	ld a, BANK(sPlayerData)
	call OpenSRAM
	ld hl, sPlayerData + wPlayerName - wPlayerData
	ld de, wPlayerName
	ld bc, NAME_LENGTH_JAPANESE
	call CopyBytes
	call CloseSRAM
	farcall _LoadData
	ld c, 2
	call DelayFrames
	ld c, $1
	call InitMobileProfile
	push af
	call ClearBGPalettes
	pop af
	and a
	jr nz, .skip_save
	farcall _SaveData
.skip_save
	ld c, 5
	call DelayFrames
	jr asm_4a111

Function4a100:
	ld a, 2
	call MenuClickSound
	call ClearBGPalettes
	call Function4a13b
	call ClearBGPalettes
	call ClearTilemap

asm_4a111:
	pop bc
	call LoadFontsExtra
	jp Function49f0a

Function4a118:
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

Function4a13b:
	call Function4a3a7
	call Function4a492
	call Function4a373
	ld c, 10
	call DelayFrames

Function4a149:
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
	call Textbox
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
	farcall Mobile_OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	call SetPalettes
	call StaticMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc
	jr asm_4a19d

Function4a195:
	call ScrollingMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc

asm_4a19d:
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

String_4a1ef:
	db   "モバイルセンター¯えらぶ"
	next "ログインパスワード¯いれる"
	next "もどる@"

Function4a20e:
	ld a, $1
	call MenuClickSound
	farcall Function1719c8
	call ClearBGPalettes
	call DelayFrame
	jr Function4a239

Function4a221:
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

Function4a239:
	pop bc
	jp Function4a13b

Strings_4a23d:
	db   "いつも　せつぞく¯する"
	next "モバイルセンター¯えらびます@"

	db   "モバイルセンター<NI>せつぞくするとき"
	next "つかうパスワード¯ほぞんできます@"

	db   "まえ<NO>がめん　<NI>もどります@"

	db   "@"

Function4a28a:
	hlcoord 2, 3
	lb bc, 6, 1
	ld a, " "
	call Function4a6d8
	call PlaceHollowCursor
	call WaitBGMap
	call LoadStandardMenuHeader
	ld a, $5
	call OpenSRAM
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
	farcall Mobile_OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
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
	farcall Function11765d
	call ClearBGPalettes
	call Call_ExitMenu
	call LoadFontsExtra
	scf
	ret

.DeleteLoginPassword:
	call PlaceHollowCursor
	ld hl, DeleteSavedLoginPasswordText
	call PrintText
	hlcoord 14, 7
	ld b, 3
	ld c, 4
	call Textbox
	farcall Mobile_OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	ld hl, DeletePassword_YesNo_MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	bit B_BUTTON_F, a
	jr nz, .dont_delete_password
	ld a, [wMenuCursorY]
	cp $2
	jr z, .dont_delete_password
	ld a, BANK(sMobileLoginPassword)
	call OpenSRAM
	ld hl, sMobileLoginPassword
	xor a
	ld bc, MOBILE_LOGIN_PASSWORD_LENGTH
	call ByteFill
	call CloseSRAM
	ld hl, DeletedTheLoginPasswordText
	call PrintText
	call JoyWaitAorB
.dont_delete_password
	call ExitMenu
.quit
	call Call_ExitMenu
	farcall Mobile_OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	xor a
	ret

MenuHeader_0x4a346:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 0, SCREEN_WIDTH - 1, 6

String_4a34b:
	db   "いれなおす"
	next "けす"
	next "もどる@"

DeleteSavedLoginPasswordText:
	text_far _DeleteSavedLoginPasswordText
	text_end

DeletedTheLoginPasswordText:
	text_far _DeletedTheLoginPasswordText
	text_end

DeletePassword_YesNo_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw MenuData_0x4a36a
	db 2 ; default option

MenuData_0x4a36a:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING | STATICMENU_WRAP ; flags
	db 2 ; items
	db "はい@"
	db "いいえ@"

Function4a373:
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

Function4a39a:
	call Function4a485
	call Function4a492
	call Function4a3aa
	call SetPalettes
	ret

Function4a3a7:
	call Function4a485
Function4a3aa:
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

Function4a449:
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

Function4a485:
	ld de, MobileMenuGFX
	ld hl, vTiles2 tile $00
	lb bc, BANK(MobileMenuGFX), 13
	call Get2bpp
	ret

Function4a492:
	call MG_Mobile_Layout00
	ret

MainMenu_MobileStudium:
	ld a, [wStartDay]
	ld b, a
	ld a, [wStartHour]
	ld c, a
	ld a, [wStartMinute]
	ld d, a
	ld a, [wStartSecond]
	ld e, a
	push bc
	push de
	farcall MobileStudium
	call ClearBGPalettes
	pop de
	pop bc
	ld a, b
	ld [wStartDay], a
	ld a, c
	ld [wStartHour], a
	ld a, d
	ld [wStartMinute], a
	ld a, e
	ld [wStartSecond], a
	ret

Function4a4c4:
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
	call Textbox
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

Function4a545:
	call ScrollingMenuJoypad
	ld hl, wMenuCursorY
	ld b, [hl]
	push bc

asm_4a54d:
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
	call ClearTilemap
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

Function4a5b0:
	call Function4a680
	pop bc
	ld hl, wMenuCursorY
	ld [hl], b
	ld b, $a
	ld c, $1
	hlcoord 3, 1
	call ClearBox
	jp Function4a545

String_4a5c5:
	db "じこしょうかい@"
String_4a5cd:
	db "たいせん　<GA>はじまるとき@"
String_4a5da:
	db "たいせん　<NI>かったとき@"
String_4a5e6:
	db "たいせん　<NI>まけたとき@"
String_4a5f2:
	db "もどる@"

Strings_4a5f6:
	db "めいし　や　ニュース　<NI>のせる@"
	db "あなた<NO>あいさつです@"
	db "モバイル　たいせん<GA>はじまるとき@"
	db "あいて<NI>みえる　あいさつです@"
	db "モバイル　たいせんで　かったとき@"
	db "あいて<NI>みえる　あいさつです@"
	db "モバイル　たいせんで　まけたとき@"
	db "あいて<NI>みえる　あいさつです@"
	db "まえ<NO>がめん　<NI>もどります@"
	db "@"

Function4a680:
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

Function4a6ab:
	ld a, $2
	call MenuClickSound
	call ClearBGPalettes
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	farcall Function11c1ab
	pop bc
	call LoadFontsExtra
	jp Function4a4c4

Function4a6c5:
	ld a, $5
	ld [wMusicFade], a
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a
	ld c, 22
	call DelayFrames
	ret

Function4a6d8:
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

if DEF(_DEBUG)
MainMenu_DebugRoom:
	farcall _DebugRoom
	ret
endc
