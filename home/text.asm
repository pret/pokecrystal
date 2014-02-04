ClearBox:: ; fb6
; Fill a c*b box at hl with blank tiles.

	ld a, " "
Functionfb8::
	push bc
	push hl
.x
	ld [hli], a
	dec c
	jr nz, .x
	pop hl
	ld bc, 20 ; screen width
	add hl, bc
	pop bc
	dec b
	jr nz, Functionfb8
	ret
; fc8


ClearTileMap:: ; fc8
; Fill TileMap with blank tiles.

	ld hl, TileMap
	ld a, " "
	ld bc, 360 ; screen dimensions 20*18
	call ByteFill
	
; We aren't done if the LCD is on.
	ld a, [rLCDC]
	bit 7, a
	ret z
	jp WaitBGMap
; fdb


Functionfdb:: ; fdb
	ld a, $7
	ld hl, AttrMap
	ld bc, $0168
	call ByteFill
	jr ClearTileMap
; fe8



TextBox:: ; fe8
; Draw a text box width c height b at hl
; Dimensions do not include the border.
	push bc
	push hl
	call TextBoxBorder
	pop hl
	pop bc
	jr TextBoxPalette
; ff1


TextBoxBorder:: ; ff1

; Top
	push hl
	ld a, "┌"
	ld [hli], a
	inc a ; "─"
	call NPlaceChar
	inc a ; "┐"
	ld [hl], a

; Middle
	pop hl
	ld de, 20 ; screen width
	add hl, de
.PlaceRow
	push hl
	ld a, "│"
	ld [hli], a
	ld a, " "
	call NPlaceChar
	ld [hl], "│"
	pop hl
	ld de, 20 ; screen width
	add hl, de
	dec b
	jr nz, .PlaceRow

; Bottom
	ld a, "└"
	ld [hli], a
	ld a, "─"
	call NPlaceChar
	ld [hl], "┘"

	ret
; 101e


NPlaceChar:: ; 101e
; Place char a c times
	ld d,c
.loop
	ld [hli],a
	dec d
	jr nz, .loop
	ret
; 1024


TextBoxPalette:: ; 1024
; Fill text box width c height b at hl with pal 7
	ld de, AttrMap - TileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, 7 ; pal
.gotoy
	push bc
	push hl
.gotox
	ld [hli], a
	dec c
	jr nz, .gotox
	pop hl
	ld de, 20 ; screen width
	add hl, de
	pop bc
	dec b
	jr nz, .gotoy
	ret
; 103e


SpeechTextBox:: ; 103e
; Standard textbox.
	hlcoord 0, 12
	ld b, 4 ; height
	ld c, 18 ; screen width - 2 (border)
	jp TextBox
; 1048

UnknownText_0x1048:: ; 1048
	db $0, "ゲームフりーク!", $57
; 1052

Function1052:: ; 1052
	ld hl, .text_1056
	ret
.text_1056
	db "@"
; 1057


PrintText:: ; 1057
	call Function106c
Function105a:: ; 105a
	push hl
	hlcoord 1, 14
	ld bc, 18 + 3<<8
	call ClearBox
	pop hl

PrintTextBoxText:: ; 1065
	bccoord 1, 14
	call Function13e5
	ret
; 106c


Function106c:: ; 106c
	push hl
	call SpeechTextBox
	call Function1ad2
	call Function321c
	pop hl
	ret
; 1078



PlaceString:: ; 1078
	push hl

PlaceNextChar:: ; 1079
	ld a, [de]
	cp "@"
	jr nz, CheckDict
	ld b, h
	ld c, l
	pop hl
	ret
	pop de

NextChar:: ; 1083
	inc de
	jp PlaceNextChar

CheckDict:: ; 1087
	cp $15
	jp z, Function117b
	cp $4f
	jp z, Char4F
	cp $4e
	jp z, Function12a7
	cp $16
	jp z, Function12b9
	and a
	jp z, Function1383
	cp $4c
	jp z, $1337
	cp $4b
	jp z, Char4B
	cp $51 ; Player name
	jp z, Function12f2
	cp $49
	jp z, Function1186
	cp $52 ; Mother name
	jp z, Function118d
	cp $53
	jp z, Function1194
	cp $35
	jp z, Function11e8
	cp $36
	jp z, Function11ef
	cp $37
	jp z, Function11f6
	cp $38
	jp z, Function119b
	cp $39
	jp z, Function11a2
	cp $54
	jp z, Function11c5
	cp $5b
	jp z, Function11b7
	cp $5e
	jp z, Function11be
	cp $5c
	jp z, Function11b0
	cp $5d
	jp z, Function11a9
	cp $23
	jp z, Function11cc
	cp $22
	jp z, Function12b0
	cp $55
	jp z, Char55
	cp $56
	jp z, Function11d3
	cp $57
	jp z, $137c
	cp $58
	jp z, Function135a
	cp $4a
	jp z, Function11da
	cp $24
	jp z, Function11e1
	cp $25
	jp z, NextChar
	cp $1f
	jr nz, .asm_1122
	ld a, $7f
.asm_1122
	cp $5f
	jp z, Char5F
	cp $59
	jp z, Function11fd
	cp $5a
	jp z, Char5D
	cp $3f
	jp z, $121b
	cp $14
	jp z, $1252
	cp $e4
	jr z, .asm_1174 ; 0x113d $35
	cp $e5
	jr z, .asm_1174 ; 0x1141 $31
	jr .asm_114c ; 0x1143 $7
	ld b, a
	call Function13c6
	jp NextChar
.asm_114c
	cp $60
	jr nc, .asm_1174 ; 0x114e $24
	cp $40
	jr nc, .asm_1165 ; 0x1152 $11
	cp $20
	jr nc, .asm_115c ; 0x1156 $4
	add $80
	jr .asm_115e ; 0x115a $2
.asm_115c
	add $90
.asm_115e
	ld b, $e5
	call Function13c6
	jr .asm_1174 ; 0x1163 $f
.asm_1165
	cp $44
	jr nc, .asm_116d ; 0x1167 $4
	add $59
	jr .asm_116f ; 0x116b $2
.asm_116d
	add $86
.asm_116f
	ld b, $e4
	call Function13c6
.asm_1174
	ld [hli], a
	call PrintLetterDelay
	jp NextChar
; 0x117b


Function117b:: ; 117b
	ld c, l
	ld b, h
	callba Function17f036
	jp PlaceNextChar
; 1186

Function1186:: ; 1186
	push de
	ld de, MomsName
	jp $126a
; 118d

Function118d:: ; 118d
	push de
	ld de, PlayerName
	jp $126a
; 1194

Function1194:: ; 1194
	push de
	ld de, RivalName
	jp $126a
; 119b

Function119b:: ; 119b
	push de
	ld de, RedsName
	jp $126a
; 11a2

Function11a2:: ; 11a2
	push de
	ld de, GreensName
	jp $126a
; 11a9

Function11a9:: ; 11a9
	push de
	ld de, Char5DText
	jp $126a
; 11b0

Function11b0:: ; 11b0
	push de
	ld de, Char5CText
	jp $126a
; 11b7

Function11b7:: ; 11b7
	push de
	ld de, Char5BText
	jp $126a
; 11be

Function11be:: ; 11be
	push de
	ld de, Char5EText
	jp $126a
; 11c5

Function11c5:: ; 11c5
	push de
	ld de, Char54Text
	jp $126a
; 11cc

Function11cc:: ; 11cc
	push de
	ld de, Char23Text
	jp $126a
; 11d3

Function11d3:: ; 11d3
	push de
	ld de, $1292
	jp $126a
; 11da

Function11da:: ; 11da
	push de
	ld de, Char4AText
	jp $126a
; 11e1

Function11e1:: ; 11e1
	push de
	ld de, Char24Text
	jp $126a
; 11e8

Function11e8:: ; 11e8
	push de
	ld de, Char37Text
	jp $126a
; 11ef

Function11ef:: ; 11ef
	push de
	ld de, Char37Text
	jp $126a
; 11f6

Function11f6:: ; 11f6
	push de
	ld de, Char37Text
	jp $126a
; 11fd


Function11fd:: ; 11fd
	ld a, [hBattleTurn]
	xor $1
	jr Function1205
; 1203

Char5D:: ; 1203
	ld a, [hBattleTurn]
; 1205

Function1205:: ; 1205
	push de
	and a
	jr nz, .asm_120e ; 0x1207 $5
	ld de, BattleMonNick
	jr .asm_126a ; 0x120c $5c
.asm_120e
	ld de, Char5AText ; Enemy
	call PlaceString
	ld h, b
	ld l, c
	ld de, EnemyMonNick
	jr .asm_126a ; 0x1219 $4f
	push de
	ld a, [InLinkBattle]
	and a
	jr nz, .linkbattle
	ld a, [TrainerClass]
	cp $9
	jr z, .asm_1248 ; 0x1227 $1f
	cp $2a
	jr z, .asm_1248 ; 0x122b $1b
	ld de, $c656
	call PlaceString
	ld h, b
	ld l, c
	ld de, String12a2
	call PlaceString
	push bc
	callab Function39939
	pop hl
	ld de, StringBuffer1
	jr .asm_126a ; 0x1246 $22
.asm_1248
	ld de, RivalName
	jr .asm_126a ; 0x124b $1d
.linkbattle
	ld de, $c656
	jr .asm_126a ; 0x1250 $18
	push de
	ld de, PlayerName
	call PlaceString
	ld h, b
	ld l, c
	ld a, [PlayerGender]
	bit 0, a
	ld de, String12a5
	jr z, .asm_126a ; 0x1263 $5
	ld de, String12a6
	jr .asm_126a ; 0x1268 $0
.asm_126a
	call PlaceString
	ld h, b
	ld l, c
	pop de
	jp NextChar
; 0x1273

Char5CText:: ; 1273
	db "TM@"
Char5DText:: ; 1276
	db "TRAINER@"
Char5BText:: ; 127e
	db "PC@"
Char5EText:: ; 1281
	db "ROCKET@"
Char54Text:: ; 1288
	db "POKé@"
Char23Text:: ; 128d
	db "こうげき@"
Char56Text::; 1292
	db "……@"
Char5AText:: ; 1295
	db "Enemy @"
Char4AText:: ; 129c
	db $e1, $e2, "@" ; PK MN
Char24Text:: ; 129f
	db $70, $71, "@" ; PO KE
String12a2:: ; 12a2
	db " @"
Char35Text::
Char36Text::
Char37Text:: ; 12a4
	db "@"
String12a5:: ; 12a5
	db "@"
String12a6:: ; 12a6
	db "@"
; 12a7

Function12a7:: ; 12a7
	pop hl
	ld bc, $0028
	add hl, bc
	push hl
	jp NextChar
; 12b0

Function12b0:: ; 12b0
	pop hl
	ld bc, $0014
	add hl, bc
	push hl
	jp NextChar
; 12b9

Function12b9:: ; 12b9
	pop hl
	push de
	ld bc, $3b60
	add hl, bc
	ld de, $ffec
	ld c, $1
.asm_12c4
	ld a, h
	and a
	jr nz, .asm_12cd
	ld a, l
	cp $14
	jr c, .asm_12d1

.asm_12cd
	add hl, de
	inc c
	jr .asm_12c4

.asm_12d1
	ld hl, TileMap
	ld de, $0014
	ld a, c
.asm_12d8
	and a
	jr z, .asm_12df
	add hl, de
	dec a
	jr .asm_12d8

.asm_12df
	pop de
	inc de
	ld a, [de]
	ld c, a
	ld b, $0
	add hl, bc
	push hl
	jp NextChar
; 12ea


Char4F:: ; 12ea
	pop hl
	hlcoord 1, 16
	push hl
	jp NextChar
; 0x12f2

Function12f2:: ; 12f2
	push de
	ld a, [InLinkBattle]
	cp $3
	jr z, .asm_1301
	cp $4
	jr z, .asm_1301
	call Function13c7

.asm_1301
	call Function13b6
	call Functionaaf
	ld hl, $c5b9
	ld bc, $0312
	call ClearBox
	call Function13cd
	ld c, $14
	call DelayFrames
	ld hl, $c5b9
	pop de
	jp NextChar
; 131f


Char4B:: ; 131f
	ld a, [InLinkBattle]
	or a
	jr nz, .asm_1328
	call Function13c7

.asm_1328
	call Function13b6

	push de
	call Functionaaf
	pop de

	ld a, [InLinkBattle]
	or a
	call z, Function13cd

	push de
	call Function138c
	call Function138c
	hlcoord 1, 16
	pop de
	jp NextChar
; 1345


Char55:: ; 1345
	push de
	ld de, Text_1354
	ld b, h
	ld c, l
	call PlaceString
	ld h, b
	ld l, c
	pop de
	jp NextChar
; 1354

Text_1354:: ; 1354
	db $4b, "@"
; 1356


Char5F:: ; 1356
; ends a Pokédex entry
	ld [hl], "."
	pop hl
	ret
; 135a

Function135a:: ; 135a
	ld a, [InLinkBattle]
	cp $3
	jr z, .asm_1368
	cp $4
	jr z, .asm_1368
	call Function13c7

.asm_1368
	call Function13b6
	call Functionaaf
	ld a, [InLinkBattle]
	cp $3
	jr z, .asm_137c
	cp $4
	jr z, .asm_137c
	call Function13cd

.asm_137c
	pop hl
	ld de, .string_1382
	dec de
	ret

.string_1382
	db "@"
; 1383

Function1383:: ; 1383
	ld a, $e6
	ld [hli], a
	call PrintLetterDelay
	jp NextChar
; 138c

Function138c:: ; 138c
	ld hl, $c5b9
	ld de, $c5a5
	ld a, $3
.asm_1394
	push af
	ld c, $12
.asm_1397
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_1397
	inc de
	inc de
	inc hl
	inc hl
	pop af
	dec a
	jr nz, .asm_1394
	ld hl, $c5e1
	ld a, $7f
	ld bc, $0012
	call ByteFill
	ld c, $5
	call DelayFrames
	ret
; 13b6

Function13b6:: ; 13b6
	push bc
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call WaitBGMap
	pop af
	ld [hOAMUpdate], a
	pop bc
	ret
; 13c6

Function13c6:: ; 13c6
	ret
; 13c7

Function13c7:: ; 13c7
	ld a, $ee
	ld [$c606], a
	ret
; 13cd

Function13cd:: ; 13cd
	ld a, [$c605]
	ld [$c606], a
	ret
; 13d4

Function13d4:: ; 13d4
	ld b, a
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call PlaceString
	pop af
	rst Bankswitch

	ret
; 13e0

Function13e0:: ; 13e0
	ld hl, $13e4
	ret

.string_13e4
	db "@"
; 13e5


Function13e5:: ; 13e5
	ld a, [$cfcf]
	push af
	set 1, a
	ld [$cfcf], a
	call Function13f6
	pop af
	ld [$cfcf], a
	ret
; 13f6

Function13f6:: ; 13f6
.asm_13f6
	ld a, [hli]
	cp "@"
	ret z
	call Function13ff
	jr .asm_13f6
; 13ff

Function13ff:: ; 13ff
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, TextCommands
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop bc
	pop hl
	
; jp de
	push de
	ret
; 1410

TextCommands:: ; 1410
	dw Text_00
	dw Text_01
	dw Text_02
	dw Text_03
	dw Text_04
	dw Text_05
	dw Text_06
	dw Text_07
	dw Text_08
	dw Text_09
	dw Text_0A
	dw Text_PlaySound ; $0b
	dw Text_0C
	dw Text_0D
	dw Text_PlaySound ; $0e
	dw Text_PlaySound ; $0f
	dw Text_PlaySound ; $10
	dw Text_PlaySound ; $11
	dw Text_PlaySound ; $12
	dw Text_PlaySound ; $13
	dw Text_14
	dw Text_15
	dw Text_16
; 143e

Text_00:: ; 143e
; TX
; write text until "@"
; [$00]["...@"]

	ld d, h
	ld e, l
	ld h, b
	ld l, c
	call PlaceString
	ld h, d
	ld l, e
	inc hl
	ret
; 1449

Text_01:: ; 1449
; TX_RAM
; write text from a ram address
; little endian
; [$01][addr]

	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld h, b
	ld l, c
	call PlaceString
	pop hl
	ret
; 1455

Text_16:: ; 1455
; TX_FAR
; write text from a different bank
; little endian
; [$16][addr][bank]

	ld a, [hROMBank]
	push af

	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]

	ld [hROMBank], a
	ld [MBC3RomBank], a

	push hl
	ld h, d
	ld l, e
	call Function13f6
	pop hl

	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret
; 1470

Text_02:: ; 1470
; TX_NUM
; write bcdnumber from address, typically ram
; little endian
; [$02][addr][flags]
; flags: see PrintBCDNumber

	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, b
	ld l, c
	ld c, a
	call PrintBCDNumber
	ld b, h
	ld c, l
	pop hl
	ret
; 1480

Text_03:: ; 1480
; TX_MOVE
; move to a new tile
; little endian
; [$03][tileaddr]

	ld a, [hli]
	ld [$d0e6], a
	ld c, a
	ld a, [hli]
	ld [$d0e7], a
	ld b, a
	ret
; 148b

Text_04:: ; 148b
; TX_BOX
; draw a box
; little endian
; [$04][tileaddr][height][width]

	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	ld h, d
	ld l, e
	call TextBox
	pop hl
	ret
; 149b

Text_05:: ; 149b
; TX_LOW
; write text at (1,16)
; [$05]

	bccoord 1, 16
	ret
; 149f

Text_06:: ; 149f
; TX_WAITBUTTON
; wait for button press
; show arrow
; [06]

	ld a, [InLinkBattle]
	cp $3
	jp z, Text_0D
	cp $4
	jp z, Text_0D
	push hl
	call Function13c7
	push bc
	call Functionaaf
	pop bc
	call Function13cd
	pop hl
	ret
; 14ba

Text_07:: ; 14ba
	push hl
	call Function13cd
	call Function138c
	call Function138c
	pop hl
	bccoord 1, 16
	ret
; 14c9

Text_08:: ; 14c9
; TX_ASM

; rom only?
	bit 7, h
	jr nz, .asm_14ce
	jp [hl]

.asm_14ce
	ld a, "@"
	ld [hl], a
	ret
; 14d2

Text_09:: ; 14d2
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, b
	ld l, c
	ld b, a
	and $f
	ld c, a
	ld a, b
	and $f0
	swap a
	set 6, a
	ld b, a
	call PrintNum
	ld b, h
	ld c, l
	pop hl
	ret
; 14ed

Text_0A:: ; 14ed
	push hl
	push bc
	call GetJoypad
	ld a, [hJoyDown]
	and A_BUTTON | B_BUTTON
	jr nz, .asm_14fd
	ld c, 30
	call DelayFrames

.asm_14fd
	pop bc
	pop hl
	ret
; 1500

Text_PlaySound:: ; 1500
; chars:
;   $0b, $0e, $0f, $10, $11, $12, $13
; see TextSFX

	push bc
	dec hl
	ld a, [hli]
	ld b, a
	push hl
	ld hl, TextSFX
.asm_1508
	ld a, [hli]
	cp $ff
	jr z, .asm_151f
	cp b
	jr z, .asm_1514
	inc hl
	inc hl
	jr .asm_1508

.asm_1514
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call PlaySFX
	call WaitSFX
	pop de

.asm_151f
	pop hl
	pop bc
	ret
; 1522

Function1522:: ; 1522
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Function37ce
	pop de
	pop hl
	pop bc
	ret
; 152d

TextSFX:: ; 152d
	dbw $0b, SFX_DEX_FANFARE_50_79
	dbw $12, SFX_FANFARE
	dbw $0e, SFX_DEX_FANFARE_20_49
	dbw $0f, SFX_ITEM
	dbw $10, SFX_CAUGHT_MON
	dbw $11, SFX_DEX_FANFARE_80_109
	dbw $13, SFX_SLOT_MACHINE_START
	db $ff ; end
; 1543

Text_0C:: ; 1543
	ld a, [hli]
	ld d, a
	push hl
	ld h, b
	ld l, c
.asm_1548
	push de
	ld a, "…"
	ld [hli], a
	call GetJoypad
	ld a, [hJoyDown]
	and A_BUTTON | B_BUTTON
	jr nz, .asm_155a
	ld c, 10
	call DelayFrames
.asm_155a
	pop de
	dec d
	jr nz, .asm_1548
	ld b, h
	ld c, l
	pop hl
	ret
; 1562

Text_0D:: ; 1562
; wait for key down
; display arrow
	push hl
	push bc
	call Functionaaf
	pop bc
	pop hl
	ret
; 156a

Text_14:: ; 156a
; TX_PREDEF
; [$14][id]

	ld a, [hli]
	push hl
	ld e, a
	ld d, 0
	ld hl, $4000
	add hl, de
	add hl, de
	ld a, $9
	call GetFarHalfword
	ld d, h
	ld e, l
	ld h, b
	ld l, c
	call PlaceString
	pop hl
	ret
; 1582

Text_15:: ; 1582
; TX_DAY

	call GetWeekday
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, .Days
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	call PlaceString
	pop hl
	ret
; 15a2

.Days ; 15a2
	dw .Sun
	dw .Mon
	dw .Tues
	dw .Wednes
	dw .Thurs
	dw .Fri
	dw .Satur

.Sun    db "SUN@"
.Mon    db "MON@"
.Tues   db "TUES@"
.Wednes db "WEDNES@"
.Thurs  db "THURS@"
.Fri    db "FRI@"
.Satur  db "SATUR@"
.Day    db "DAY@"
; 15d8

