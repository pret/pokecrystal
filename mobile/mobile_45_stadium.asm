GiveOddEgg:
	farcall _GiveOddEgg
	ret

Function11765d:
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	call Function11766b
	pop af
	ldh [hInMenu], a
	ret

Function11766b:
	call Function117699
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	call Function1176ee
	ld a, $5
	call OpenSRAM
	ld hl, $b1f3
	ld de, wcd49
	ld bc, $8
	call CopyBytes
	ld de, wc708
	ld bc, $11
	call CopyBytes
	call CloseSRAM
	pop af
	ldh [rSVBK], a
	ret

Function117699:
	ld a, $5
	call OpenSRAM
	ld hl, wcd49
	ld de, $b1f3
	ld bc, $8
	call CopyBytes
	ld hl, wc708
	ld bc, $11
	call CopyBytes
	call CloseSRAM
	xor a
	ld [wcd49], a
	ld [wcd4a], a
	ld [wcd4b], a
	ld [wcd4c], a
	ld [wcd4d], a
	ld [wcd4e], a
	ld [wcd4f], a
	ld hl, wc708
	ld bc, $11
	call ByteFill
	call ClearBGPalettes
	call ClearSprites
	farcall Function171c87
	farcall ReloadMapPart
	farcall ClearSpriteAnims
	ret

Function1176ee:
.loop
	call JoyTextDelay
	ld a, [wcd49]
	bit 7, a
	jr nz, .quit
	call Function117719
	farcall PlaySpriteAnimations
	farcall ReloadMapPart
	jr .loop

.quit
	farcall ClearSpriteAnims
	call ClearBGPalettes
	call ClearScreen
	call ClearSprites
	ret

Function117719:
	jumptable Jumptable_117728, wcd49

Jumptable_117728:
	dw Function117738
	dw Function117764
	dw Function1178aa
	dw Function1178e8
	dw Function117942
	dw Function117976
	dw Function117984
	dw Function1179a7

Function117738:
	farcall Function171ccd
	depixel 6, 3
	ld a, $1d
	call InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld a, $6
	ld [hl], a
	depixel 9, 4
	ld a, $1d
	call InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld a, $7
	ld [hl], a
	ld a, $3
	ld [wcd23], a
	jp MobilePassword_IncrementJumptable

Function117764:
	ld a, [wcd4a]
	cp $10
	jr nz, .asm_11776f
	ld a, $1
	jr .asm_117770

.asm_11776f
	xor a
.asm_117770
	ld [wcd24], a
	ld hl, hJoyPressed
	ld a, [hl]
	and SELECT
	jr nz, Function117764_select
	ld a, [hl]
	and START
	jr nz, Function117764_start
	ld a, [hl]
	and A_BUTTON
	jp nz, Function117764_a_button
	ld a, [hl]
	and B_BUTTON
	jr nz, Function117764_b_button
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Function117764_d_up
	ld a, [hl]
	and D_DOWN
	jr nz, Function117764_d_down
	ld a, [hl]
	and D_LEFT
	jp nz, Function117764_d_left
	ld a, [hl]
	and D_RIGHT
	jp nz, Function117764_d_right
	ret

Function117764_select:
	farcall Function171cf0
	ret

Function117764_start:
	ld a, $2
	ld [wcd4c], a
	ld a, $4
	ld [wcd4d], a
	ret

Function1177b7:
	ld a, $3
	ld [wcd24], a
	ld a, [wcd4a]
	and a
	jr z, .asm_1177c5
	jp MobilePassword_IncrementJumptable

.asm_1177c5
	ld a, $6
	ld [wcd49], a
	ret

Function1177cb:
	ld a, $80
	ld [wcd49], a
	ld [wScriptVar], a
	jp MobilePassword_IncrementJumptable

Function117764_b_button:
	call PlayClickSFX
	ld a, [wcd4a]
	and a
	ret z
	dec a
	ld [wcd4a], a
	ld e, a
	ld d, 0
	ld hl, wc708
	add hl, de
	xor a
	ld [hl], a
	hlcoord 2, 4
	add hl, de
	ld [hl], a
	ret

Function117764_d_up:
	ld a, [wcd4d]
	and a
	ret z
	dec a
	ld [wcd4d], a
	cp $3
	ret nz
	ld a, [wcd4c]
	ld e, a
	sla a
	sla a
	add e
Function117764_d_vertical_load:
	ld [wcd4c], a
	ret

Function117764_d_down:
	ld a, [wcd4d]
	cp $4
	ret z
	inc a
	ld [wcd4d], a
	cp $4
	ret nz
	ld a, [wcd4c]
	cp $a
	jr nc, .asm_117825
	cp $5
	jr nc, .asm_117829
	xor a
	jr Function117764_d_vertical_load

.asm_117825
	ld a, $2
	jr Function117764_d_vertical_load

.asm_117829
	ld a, $1
	jr Function117764_d_vertical_load

Function117764_d_left:
	ld a, [wcd4c]
	and a
	ret z
	dec a
	ld [wcd4c], a
	ret

Function117764_d_right:
	ld e, $d
	ld a, [wcd4d]
	cp $4
	jr nz, .wrap
	ld e, $2
.wrap
	ld a, [wcd4c]
	cp e
	ret z
	inc a
	ld [wcd4c], a
	ret

Function117764_a_button:
	call PlayClickSFX
	ld a, [wcd4d]
	cp $4
	jr nz, .not_4
	ld a, [wcd4c]
	cp $2
	jp z, Function1177b7
	cp $1
	jp z, Function1177cb
	jp Function117764_select

.not_4
	ld a, [wcd4a]
	ld e, a
	cp $10
	jp z, Function117764_start
	inc a
	ld [wcd4a], a
	ld d, $0
	ld a, [wcd4b]
	and a
	jr nz, .ascii_symbols
	ld hl, Unknown_117a0f
	jr .got_ascii

.ascii_symbols
	ld hl, Unknown_117a47
.got_ascii
	push de
	ld a, [wcd4c]
	ld b, a
	ld a, [wcd4d]
	ld c, $e
	call SimpleMultiply
	add b
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld hl, wc708
	add hl, de
	ld [hl], a
	pop de
	hlcoord 2, 4
	add hl, de
	sub $20
	ld [hl], a
	ld a, e
	cp $f
	ret nz
	jp Function117764_start

Function1178aa:
	ld hl, MenuHeader_1179b5
	call LoadMenuHeader
	call MenuBox
	call MenuBoxCoord2Tile
	ld hl, MenuHeader_1179bd
	call LoadMenuHeader
	call MenuBox
	call MenuBoxCoord2Tile
	farcall ReloadMapPart
	hlcoord 16, 8
	ld de, YessNoString_1179c5
	call PlaceString
	hlcoord 15, 10
	ld a, "▶"
	ld [hl], a
	hlcoord 1, 14
	ld de, AskSavePasswordString
	call PlaceString
	ld a, $1
	ld [wcd4e], a
	jp MobilePassword_IncrementJumptable

Function1178e8:
	ldh a, [hJoyPressed]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr z, .a_button
	cp D_DOWN
	jr z, .d_down
	cp D_UP
	ret nz
	ld a, [wcd4e]
	and a
	ret z
	dec a
	ld [wcd4e], a
	hlcoord 15, 8
	ld a, "▶"
	ld [hl], a
	hlcoord 15, 10
	ld a, " "
	ld [hl], a
	ret

.d_down
	ld a, [wcd4e]
	and a
	ret nz
	inc a
	ld [wcd4e], a
	hlcoord 15, 8
	ld a, " "
	ld [hl], a
	hlcoord 15, 10
	ld a, "▶"
	ld [hl], a
	ret

.a_button
	call PlayClickSFX
	ld a, [wcd4e]
	and a
	jr nz, .b_button
	call ExitMenu
	ld a, $1
	ld [wcd4f], a
	jp MobilePassword_IncrementJumptable

.b_button
	call ExitMenu
	call ExitMenu
	jp MobilePassword_IncrementJumptable

Function117942:
	call SpeechTextbox
	hlcoord 1, 14
	ld de, SavedPasswordString
	call PlaceString
	ld a, $1e
	ld [wcd4e], a
	ld a, BANK(sMobileLoginPassword)
	call OpenSRAM
	ld a, [wcd4f]
	ld [sMobileLoginPassword], a
	ld hl, wc708
	ld de, sMobileLoginPassword + 1
	ld bc, MOBILE_LOGIN_PASSWORD_LENGTH
	call CopyBytes
	call CloseSRAM
	ld a, [wcd4f]
	and a
	jr z, asm_11797e
	call MobilePassword_IncrementJumptable

Function117976:
	ld hl, wcd4e
	dec [hl]
	ret nz
	call ExitMenu
asm_11797e:
	ld a, $80
	ld [wcd49], a
	ret

Function117984:
	ld hl, MenuHeader_1179b5
	call LoadMenuHeader
	call MenuBox
	call MenuBoxCoord2Tile
	farcall ReloadMapPart
	hlcoord 1, 14
	ld de, NotAPokemonPasswordString
	call PlaceString
	ld a, $1e
	ld [wcd4e], a
	call MobilePassword_IncrementJumptable

Function1179a7:
	ld hl, wcd4e
	dec [hl]
	ret nz
	call ExitMenu
	ld a, $1
	ld [wcd49], a
	ret

MenuHeader_1179b5:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw NULL
	db 0 ; default option

MenuHeader_1179bd:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NULL
	db 0 ; default option

YessNoString_1179c5:
	db   "はい"
	next "いいえ@"

AskSavePasswordString:
	db   "こ<NO>パスワード¯ほぞんして"
	line "おきますか？@"

NotAPokemonPasswordString:
	db   "パスワード<PKMN>にゅうりょく"
	line "されていません！@"

SavedPasswordString:
	db   "ログインパスワード¯ほぞん"
	line "しました@"

MobilePassword_IncrementJumptable:
	ld hl, wcd49
	inc [hl]
	ret

pushc
setcharmap ascii

Unknown_117a0f:
	db "ABCDEFGHIJKLMNOPQRSTUVWXYZ  "
	db "abcdefghijklmnopqrstuvwxyz  "

Unknown_117a47:
	db "0123456789    "
	db "!\"#$%&'()*+   "
	db ",-./:;<=>?@   "
	db "[\\]^_`\{|}~    "
popc

; everything from here to the end of the bank is related to the
; Mobile Stadium option from the continue/newgame menu.
; Needs better function names
MobileStudium:
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	call Function117a8d
	pop af
	ldh [hInMenu], a
	ret

Function117a8d:
	call Function117a94
	call Function117acd
	ret

Function117a94:
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	call ClearBGPalettes
	call ClearSprites
	farcall Function172e78
	farcall HDMATransferAttrmapAndTilemapToWRAMBank3
	ret

Function117ab4:
	call ClearBGPalettes
	call ClearSprites
	farcall Function172e78
	farcall Function172eb9
	farcall ReloadMapPart
	ret

Function117acd:
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_117ae2
	call Function117ae9
	farcall HDMATransferAttrmapAndTilemapToWRAMBank3
	jr Function117acd

.asm_117ae2
	call ClearBGPalettes
	call ClearSprites
	ret

Function117ae9:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	dw Function117b06
	dw Function117b14
	dw Function117b28
	dw Function117b31
	dw Function117b4f
	dw Function117bb6
	dw Function117c4a

Function117b06:
	farcall Function172eb9
	ld a, $10
	ld [wcf64], a
	jp MobileStudium_JumptableIncrement

Function117b14:
	ld hl, wcf64
	dec [hl]
	ret nz
	ld hl, MenuHeader_117cbc
	call LoadMenuHeader
	call MenuBox
	call MenuBoxCoord2Tile
	jp MobileStudium_JumptableIncrement

Function117b28:
	ld hl, MobileStadiumEntryText
	call PrintText
	jp MobileStudium_JumptableIncrement

Function117b31:
	ld hl, MenuHeader_117cc4
	call LoadMenuHeader
	call MenuBox
	call MenuBoxCoord2Tile
	hlcoord 16, 8
	ld de, YesNo117ccc
	call PlaceString
	hlcoord 15, 8
	ld a, "▶"
	ld [hl], a
	jp MobileStudium_JumptableIncrement

Function117b4f:
	ldh a, [hJoyPressed]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr z, .a_button
	cp D_DOWN
	jr z, .d_down
	cp D_UP
	ret nz
	ld a, [wcf64]
	and a
	ret z
	dec a
	ld [wcf64], a
	hlcoord 15, 8
	ld a, "▶"
	ld [hl], a
	hlcoord 15, 10
	ld a, " "
	ld [hl], a
	ret

.d_down
	ld a, [wcf64]
	and a
	ret nz
	inc a
	ld [wcf64], a
	hlcoord 15, 8
	ld a, " "
	ld [hl], a
	hlcoord 15, 10
	ld a, "▶"
	ld [hl], a
	ret

.a_button
	call PlayClickSFX
	ld a, [wcf64]
	and a
	jr nz, .b_button
	call ExitMenu
	call ExitMenu
	farcall ReloadMapPart
	jp MobileStudium_JumptableIncrement

.b_button
	call ExitMenu
	call ExitMenu
	farcall ReloadMapPart
	ld a, $80
	ld [wJumptableIndex], a
	ret

Function117bb6:
	call Function117c89
	ld a, $1
	ldh [hBGMapMode], a
	farcall Function118284
	call ClearSprites
	ld a, [wMobileErrorCodeBuffer]
	and a
	jr z, .asm_117be7
	cp $a
	jr z, .asm_117be1
.asm_117bd0
	ld a, $2
	ld [wc303], a
	farcall DisplayMobileError
	ld a, $80
	ld [wJumptableIndex], a
	ret

.asm_117be1
	ld a, $80
	ld [wJumptableIndex], a
	ret

.asm_117be7
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
	ld a, [wcd89]
	and $1
	jr nz, .asm_117c16
	ld a, [w3_d000]
	cp $fe
	jr nz, .asm_117c16
	ld a, [w3_d001]
	cp $f
	jr nz, .asm_117c16
	ld hl, w3_dfec
	ld de, wcd69
	ld c, $10
.asm_117c0b
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_117c16
	inc hl
	dec c
	jr nz, .asm_117c0b
	jr .asm_117c20

.asm_117c16
	pop af
	ldh [rSVBK], a
	ld a, $d3
	ld [wMobileErrorCodeBuffer], a
	jr .asm_117bd0

.asm_117c20
	pop af
	ldh [rSVBK], a
	farcall Function172eb9
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
	ld a, $7
	call OpenSRAM
	ld hl, w3_d002
	ld de, $b000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	pop af
	ldh [rSVBK], a
	jp MobileStudium_JumptableIncrement

Function117c4a:
	ld hl, MenuHeader_117cbc
	call LoadMenuHeader
	call MenuBox
	call MenuBoxCoord2Tile
	farcall ReloadMapPart
	ld hl, MobileStadiumSuccessText
	call PrintText
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, wBGPals1
	ld de, 1 palettes
	ld c, 8
.loop
	push hl
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hl], a
	pop hl
	add hl, de
	dec c
	jr nz, .loop
	call RotateThreePalettesRight
	pop af
	ldh [rSVBK], a
	ld a, $80
	ld [wJumptableIndex], a
	ret

Function117c89:
	ld a, $7
	call OpenSRAM
	ld l, $0
	ld h, l
	ld de, $b000
	ld bc, $0ffc
.asm_117c97
	push bc
	ld a, [de]
	inc de
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .asm_117c97
	ld a, l
	ld [wcd83], a
	ld a, h
	ld [wcd84], a
	ld hl, $bfea
	ld de, wcd69
	ld bc, $10
	call CopyBytes
	call CloseSRAM
	ret

MenuHeader_117cbc:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw NULL
	db 0 ; default option

MenuHeader_117cc4:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NULL
	db 0 ; default item

YesNo117ccc:
	db   "はい"
	next "いいえ@"

MobileStadiumEntryText:
	text_far _MobileStadiumEntryText
	text_end

MobileStadiumSuccessText:
	text_far _MobileStadiumSuccessText
	text_end

MobileStudium_JumptableIncrement:
	ld hl, wJumptableIndex
	inc [hl]
	ret
