_NamingScreen: ; 0x116b7
	call DisableSpriteUpdates
	call NamingScreen
	call Function2b74
	ret
; 0x116c1

NamingScreen: ; 116c1
	ld hl, wc6d0
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wc6d4
	ld [hl], b
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call Function116f8
	call DelayFrame
.asm_116e5
	call Function11915
	jr nc, .asm_116e5
	pop af
	ld [hInMenu], a
	pop af
	ld [hMapAnims], a
	pop af
	ld [Options], a
	call ClearJoypad
	ret
; 116f8

Function116f8: ; 116f8
	call ClearBGPalettes
	ld b, SCGB_08
	call GetSGBLayout
	call DisableLCD
	call Function11c51
	call Function118a8
	ld a, $e3
	ld [rLCDC], a
	call Function1171d
	call WaitBGMap
	call WaitTop
	call SetPalettes
	call Function11be0
	ret
; 1171d

Function1171d: ; 1171d
	ld a, [wc6d4]
	and 7
	ld e, a
	ld d, 0
	ld hl, Jumptable_1172e
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1172e


Jumptable_1172e: ; 1172e (4:572e)
	dw Function1173e
	dw Function1178d
	dw Function117ae
	dw Function117d1
	dw Function117f5
	dw Function1182c
	dw Function1173e
	dw Function1173e


Function1173e: ; 1173e (4:573e)
	ld a, [CurPartySpecies]
	ld [wd265], a
	ld hl, Function8e83f
	ld a, BANK(Function8e83f)
	ld e, $1
	rst FarCall ;  ; indirect jump to Function8e83f (8e83f (23:683f))
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	hlcoord 5, 2
	call PlaceString
	ld l, c
	ld h, b
	ld de, Strings_11780
	call PlaceString
	inc de
	hlcoord 5, 4
	call PlaceString
	callba GetGender
	jr c, .asm_1177c
	ld a, $ef
	jr nz, .asm_11778
	ld a, $f5
.asm_11778
	hlcoord 1, 2
	ld [hl], a
.asm_1177c
	call Function1187b
	ret
; 11780 (4:5780)

Strings_11780: ; 11780
	db "'S@"
	db "NICKNAME?@"
; 1178d

Function1178d: ; 1178d (4:578d)
	callba GetPlayerIcon
	call Function11847
	hlcoord 5, 2
	ld de, String_117a3
	call PlaceString
	call Function11882
	ret
; 117a3 (4:57a3)

String_117a3: ; 117a3
	db "YOUR NAME?@"
; 117ae

Function117ae: ; 117ae (4:57ae)
	ld de, SilverSpriteGFX
	ld b, BANK(SilverSpriteGFX)
	call Function11847
	hlcoord 5, 2
	ld de, String_117c3
	call PlaceString
	call Function11882
	ret
; 117c3 (4:57c3)

String_117c3: ; 117c3
	db "RIVAL'S NAME?@"
; 117d1

Function117d1: ; 117d1 (4:57d1)
	ld de, MomSpriteGFX
	ld b, BANK(MomSpriteGFX)
	call Function11847
	hlcoord 5, 2
	ld de, String_117e6
	call PlaceString
	call Function11882
	ret
; 117e6 (4:57e6)

String_117e6: ; 117e6
	db "MOTHER'S NAME?@"
; 117f5

Function117f5: ; 117f5 (4:57f5)
	ld de, PokeBallSpriteGFX
	ld hl, VTiles0 tile $00
	lb bc, BANK(PokeBallSpriteGFX), $4
	call Request2bpp
	xor a
	ld hl, wc300
	ld [hli], a
	ld [hl], a
	depixel 4, 4, 4, 0
	ld a, SPRITE_ANIM_INDEX_0A
	call _InitSpriteAnimStruct
	ld hl, $1
	add hl, bc
	ld [hl], $0
	hlcoord 5, 2
	ld de, String_11822
	call PlaceString
	call Function11889
	ret
; 11822 (4:5822)

String_11822: ; 11822
	db "BOX NAME?@"
; 1182c

Function1182c: ; 1182c (4:582c)
	hlcoord 3, 2
	ld de, String_11839
	call PlaceString
	call Function11882
	ret
; 11839 (4:5839)

String_11839: ; 11839
	db "おともだち の なまえは?@"
; 11847

Function11847: ; 11847 (4:5847)
	push de
	ld hl, VTiles0 tile $00
	ld c, $4
	push bc
	call Request2bpp
	pop bc
	ld hl, $c0
	add hl, de
	ld e, l
	ld d, h
	ld hl, VTiles0 tile $04
	call Request2bpp
	xor a
	ld hl, wc300
	ld [hli], a
	ld [hl], a
	pop de
	ld b, SPRITE_ANIM_INDEX_0A
	ld a, d
	cp $7a
	jr nz, .asm_11873
	ld a, e
	cp $40
	jr nz, .asm_11873
	ld b, SPRITE_ANIM_INDEX_1E
.asm_11873
	ld a, b
	depixel 4, 4, 4, 0
	call _InitSpriteAnimStruct
	ret

Function1187b: ; 1187b (4:587b)
	ld a, $a
	hlcoord 5, 6
	jr Function11890

Function11882: ; 11882 (4:5882)
	ld a, $7
	hlcoord 5, 6
	jr Function11890

Function11889: ; 11889 (4:5889)
	ld a, $8
	hlcoord 5, 4
	jr Function11890

Function11890: ; 11890 (4:5890)
	ld [wc6d3], a
	ld a, l
	ld [wc6d8], a
	ld a, h
	ld [wc6d9], a
	ret


Function1189c: ; 1189c
	push bc
	push af
	ld a, [wc6d4]
	sub $3
	ld b, a
	pop af
	dec b
	pop bc
	ret
; 118a8

Function118a8: ; 118a8
	call WaitTop
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $60
	call ByteFill
	hlcoord 1, 1
	lb bc, 6, 18
	call Function1189c
	jr nz, .asm_118c4
	lb bc, 4, 18

.asm_118c4
	call ClearBox
	ld de, NameInputUpper
Function118ca: ; 118ca
	call Function1189c
	jr nz, .asm_118d5
	ld hl, BoxNameInputLower - NameInputLower
	add hl, de
	ld d, h
	ld e, l

.asm_118d5
	push de
	hlcoord 1, 8
	lb bc, 7, 18
	call Function1189c
	jr nz, .asm_118e7
	hlcoord 1, 6
	lb bc, 9, 18

.asm_118e7
	call ClearBox
	hlcoord 1, 16
	lb bc, 1, 18
	call ClearBox
	pop de
	hlcoord 2, 8
	ld b, $5
	call Function1189c
	jr nz, .asm_11903
	hlcoord 2, 6
	ld b, $6

.asm_11903
	ld c, $11
.asm_11905
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_11905
	push de
	ld de, $17
	add hl, de
	pop de
	dec b
	jr nz, .asm_11903
	ret
; 11915

Function11915: ; 11915
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_11930
	call Function11968
	callba Function8cf62
	call Function11940
	call DelayFrame
	and a
	ret

.asm_11930
	callab ClearSpriteAnims
	call ClearSprites
	xor a
	ld [hSCX], a
	ld [hSCY], a
	scf
	ret
; 11940

Function11940: ; 11940
	xor a
	ld [hBGMapMode], a
	hlcoord 1, 5
	call Function1189c
	jr nz, .asm_1194e
	hlcoord 1, 3

.asm_1194e
	lb bc, 1, 18
	call ClearBox
	ld hl, wc6d0
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wc6d8
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret
; 11968

Function11968: ; 11968
	ld a, [wJumptableIndex]
	ld e, a
	ld d, $0
	ld hl, Jumptable_11977
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11977


Jumptable_11977: ; 11977 (4:5977)
	dw Function1197b
	dw Function119a1


Function1197b: ; 1197b (4:597b)
	depixel 10, 3
	call Function1189c
	jr nz, .asm_11985
	ld d, 8 * 8
.asm_11985
	ld a, SPRITE_ANIM_INDEX_02
	call _InitSpriteAnimStruct
	ld a, c
	ld [wc6d5], a
	ld a, b
	ld [wc6d6], a
	ld hl, $1
	add hl, bc
	ld a, [hl]
	ld hl, $e
	add hl, bc
	ld [hl], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function119a1: ; 119a1 (4:59a1)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and START
	jr nz, .start
	ld a, [hl]
	and SELECT
	jr nz, .select
	ret

.a
	call Function11a0b
	cp $1
	jr z, .select
	cp $2
	jr z, .b
	cp $3
	jr z, .asm_119eb
	call Function11c11
	call Function11b14
	ret nc

.start
	ld hl, wc6d5
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $c
	add hl, bc
	ld [hl], $8
	ld hl, $d
	add hl, bc
	ld [hl], $4
	call Function1189c
	ret nz
	inc [hl]
	ret

.b
	call Function11bbc
	ret

.asm_119eb
	call Function11bf7
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.select
	ld hl, wcf64
	ld a, [hl]
	xor 1
	ld [hl], a
	jr z, .asm_11a04
	ld de, NameInputLower
	call Function118ca
	ret

.asm_11a04
	ld de, NameInputUpper
	call Function118ca
	ret

Function11a0b: ; 11a0b (4:5a0b)
	ld hl, wc6d5
	ld c, [hl]
	inc hl
	ld b, [hl]

Function11a11: ; 11a11 (4:5a11)
	ld hl, $d
	add hl, bc
	ld a, [hl]
	push bc
	ld b, $4
	call Function1189c
	jr nz, .asm_11a1f
	inc b
.asm_11a1f
	cp b
	pop bc
	jr nz, .asm_11a39
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $3
	jr c, .asm_11a33
	cp $6
	jr c, .asm_11a36
	ld a, $3
	ret
.asm_11a33
	ld a, $1
	ret
.asm_11a36
	ld a, $2
	ret
.asm_11a39
	xor a
	ret

Function11a3b: ; 11a3b (4:5a3b)
	call Function11a8b
	ld hl, $d
	add hl, bc
	ld a, [hl]
	ld e, a
	swap e
	ld hl, $7
	add hl, bc
	ld [hl], e
	ld d, $4
	call Function1189c
	jr nz, .asm_11a53
	inc d
.asm_11a53
	cp d
	ld de, Unknown_11a79
	ld a, $0
	jr nz, .asm_11a60
	ld de, Unknown_11a82
	ld a, $1
.asm_11a60
	ld hl, $e
	add hl, bc
	add [hl]
	ld hl, $1
	add hl, bc
	ld [hl], a
	ld hl, $c
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret
; 11a79 (4:5a79)

Unknown_11a79: ; 11a79
	db $00, $10, $20, $30, $40, $50, $60, $70, $80
Unknown_11a82: ; 11a82
	db $00, $00, $00, $30, $30, $30, $60, $60, $60
; 11a8b

Function11a8b: ; 11a8b (4:5a8b)
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ret
.right
	call Function11a11
	and a
	jr nz, .asm_11ab7
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $8
	jr nc, .asm_11ab4
	inc [hl]
	ret
.asm_11ab4
	ld [hl], $0
	ret
.asm_11ab7
	cp $3
	jr nz, .asm_11abc
	xor a
.asm_11abc
	ld e, a
	add a
	add e
	ld hl, $c
	add hl, bc
	ld [hl], a
	ret
.left
	call Function11a11
	and a
	jr nz, .asm_11ad8
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_11ad5
	dec [hl]
	ret
.asm_11ad5
	ld [hl], $8
	ret
.asm_11ad8
	cp $1
	jr nz, .asm_11ade
	ld a, $4
.asm_11ade
rept 2
	dec a
endr
	ld e, a
	add a
	add e
	ld hl, $c
	add hl, bc
	ld [hl], a
	ret
.down
	ld hl, $d
	add hl, bc
	ld a, [hl]
	call Function1189c
	jr nz, .asm_11af9
	cp $5
	jr nc, .asm_11aff
	inc [hl]
	ret
.asm_11af9
	cp $4
	jr nc, .asm_11aff
	inc [hl]
	ret
.asm_11aff
	ld [hl], $0
	ret
.up
	ld hl, $d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_11b0c
	dec [hl]
	ret
.asm_11b0c
	ld [hl], $4
	call Function1189c
	ret nz
	inc [hl]
	ret

Function11b14: ; 11b14 (4:5b14)
	ld a, [wc6d7]

Function11b17: ; 11b17 (4:5b17)
	ld a, [wc6d3]
	ld c, a
	ld a, [wc6d2]
	cp c
	ret nc

	ld a, [wc6d7]

Function11b23: ; 11b23
	call Function11bd0
	ld [hl], a

Function11b27: ; 11b27
	ld hl, wc6d2
	inc [hl]
	call Function11bd0
	ld a, [hl]
	cp $50
	jr z, .asm_11b37
	ld [hl], $f2
	and a
	ret
.asm_11b37
	scf
	ret
; 11b39 (4:5b39)

Function11b39: ; 11b39
	ld a, [wc6d2]
	and a
	ret z
	push hl
	ld hl, wc6d2
	dec [hl]
	call Function11bd0
	ld c, [hl]
	pop hl

.asm_11b48
	ld a, [hli]
	cp $ff
	jr z, Function11b27
	cp c
	jr z, .asm_11b53
	inc hl
	jr .asm_11b48

.asm_11b53
	ld a, [hl]
	jr Function11b23
; 11b56

Dakutens: ; Dummied out
	db "かが", "きぎ", "くぐ", "けげ", "こご"
	db "さざ", "しじ", "すず", "せぜ", "そぞ"
	db "ただ", "ちぢ", "つづ", "てで", "とど"
	db "はば", "ひび", "ふぶ", "へべ", "ほぼ"
	db "カガ", "キギ", "クグ", "ケゲ", "コゴ"
	db "サザ", "シジ", "スズ", "セゼ", "ソゾ"
	db "タダ", "チヂ", "ツヅ", "テデ", "トド"
	db "ハバ", "ヒビ", "フブ", "へべ", "ホボ"
	db $ff

Handakutens: ; Dummied out
	db "はぱ", "ひぴ", "ふぷ", "へぺ", "ほぽ"
	db "ハパ", "ヒピ", "フプ", "へぺ", "ホポ"
	db $ff
; 11bbc

Function11bbc: ; 11bbc (4:5bbc)
	ld hl, wc6d2
	ld a, [hl]
	and a
	ret z
	dec [hl]
	call Function11bd0
	ld [hl], $f2
	inc hl
	ld a, [hl]
	cp $f2
	ret nz
	ld [hl], $eb
	ret

Function11bd0: ; 11bd0 (4:5bd0)
	push af
	ld hl, wc6d0
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc6d2]
	ld e, a
	ld d, 0
	add hl, de
	pop af
	ret
; 11be0

Function11be0: ; 11be0
; load $f2, ($eb * [wc6d3]), $50 into the dw address at wc6d0
	ld hl, wc6d0
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], "·"
	inc hl
	ld a, [wc6d3]
	dec a
	ld c, a
	ld a, "→"
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ld [hl], "@"
	ret
; 11bf7


Function11bf7: ; 11bf7 (4:5bf7)
	ld hl, wc6d0
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc6d3]
	ld c, a
.asm_11c01
	ld a, [hl]
	cp $eb
	jr z, .asm_11c0a
	cp $f2
	jr nz, .asm_11c0c
.asm_11c0a
	ld [hl], $50
.asm_11c0c
	inc hl
	dec c
	jr nz, .asm_11c01
	ret

Function11c11: ; 11c11 (4:5c11)
	ld hl, wc6d5
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $6
	add hl, bc
	ld a, [hl]
	ld hl, $4
	add hl, bc
	add [hl]
	sub $8
	srl a
	srl a
	srl a
	ld e, a
	ld hl, $7
	add hl, bc
	ld a, [hl]
	ld hl, $5
	add hl, bc
	add [hl]
	sub $10
	srl a
	srl a
	srl a
	ld d, a
	hlcoord 0, 0
	ld bc, $14
.asm_11c43
	ld a, d
	and a
	jr z, .asm_11c4b
	add hl, bc
	dec d
	jr .asm_11c43
.asm_11c4b
	add hl, de
	ld a, [hl]
	ld [wc6d7], a
	ret


Function11c51: ; 11c51
	call ClearSprites
	callab ClearSpriteAnims
	call LoadStandardFont
	call LoadFontsExtra

	ld de, GFX_11e65
	ld hl, VTiles1 tile $6b
	lb bc, BANK(GFX_11e65), 1
	call Get1bpp

	ld de, GFX_11e6d
	ld hl, VTiles1 tile $72
	lb bc, BANK(GFX_11e6d), 1
	call Get1bpp

	ld de, VTiles2 tile $60
	ld hl, GFX_11cb7
	ld bc, $10
	ld a, BANK(GFX_11cb7)
	call FarCopyBytes

	ld de, VTiles0 tile $7e
	ld hl, GFX_11cc7
	ld bc, $20
	ld a, BANK(GFX_11cc7)
	call FarCopyBytes

	ld a, $5
	ld hl, wc312
	ld [hli], a
	ld [hl], $7e
	xor a
	ld [hSCY], a
	ld [wGlobalAnimYOffset], a
	ld [hSCX], a
	ld [wGlobalAnimXOffset], a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [hBGMapMode], a
	ld [wc6d2], a
	ld a, $7
	ld [hWX], a
	ret
; 11cb7

GFX_11cb7: ; 11cb7
INCBIN "gfx/unknown/011cb7.2bpp"
; 11cc7

GFX_11cc7: ; 11cc7
INCBIN "gfx/unknown/011cc7.2bpp"
; 11ce7

NameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z  "
	db "× ( ) : ; [ ] <PK> <MN>"
	db "UPPER  DEL   END "
BoxNameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z  "
	db "é 'd 'l 'm 'r 's 't 'v 0"
	db "1 2 3 4 5 6 7 8 9"
	db "UPPER  DEL   END "
NameInputUpper: ; Unreferenced?
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z  "
	db "- ? ! / . ,      "
	db "lower  DEL   END "
BoxNameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z  "
	db "× ( ) : ; [ ] <PK> <MN>"
	db "- ? ! ♂ ♀ / . , &"
	db "lower  DEL   END "
; 11e5d

GFX_11e5d: ; ????
INCBIN "gfx/unknown/011e5d.2bpp"
; 11e6d

GFX_11e65:
INCBIN "gfx/unknown/011e65.2bpp"
; 11e6d

GFX_11e6d: ; 11e6d
INCBIN "gfx/unknown/011e6d.2bpp"
; 11e75
