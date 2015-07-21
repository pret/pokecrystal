BORDER_WIDTH   EQU 2
TEXTBOX_WIDTH  EQU SCREEN_WIDTH
TEXTBOX_INNERW EQU TEXTBOX_WIDTH - BORDER_WIDTH
TEXTBOX_HEIGHT EQU 6
TEXTBOX_INNERH EQU TEXTBOX_HEIGHT - BORDER_WIDTH
TEXTBOX_X      EQU 0
TEXTBOX_INNERX EQU TEXTBOX_X + 1
TEXTBOX_Y      EQU SCREEN_HEIGHT - TEXTBOX_HEIGHT
TEXTBOX_INNERY EQU TEXTBOX_Y + 2

TEXTBOX_PAL EQU 7


ClearBox:: ; fb6
; Fill a c*b box at hl with blank tiles.

	ld a, " "

Functionfb8::
.col
	push bc
	push hl
.row
	ld [hli], a
	dec c
	jr nz, .row
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .col
	ret
; fc8


ClearTileMap:: ; fc8
; Fill TileMap with blank tiles.

	ld hl, TileMap
	ld a, " "
	ld bc, TileMapEnd - TileMap
	call ByteFill
	
	; Update the BG Map.
	ld a, [rLCDC]
	bit 7, a
	ret z
	jp WaitBGMap
; fdb


ClearScreen:: ; fdb
	ld a, TEXTBOX_PAL
	ld hl, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	jr ClearTileMap
; fe8



TextBox:: ; fe8
; Draw a text box width c height b at hl.
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
	call .PlaceChars
	inc a ; "┐"
	ld [hl], a
	pop hl

	; Middle
	ld de, SCREEN_WIDTH
	add hl, de
.row
	push hl
	ld a, "│"
	ld [hli], a
	ld a, " "
	call .PlaceChars
	ld [hl], "│"
	pop hl

	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .row

	; Bottom
	ld a, "└"
	ld [hli], a
	ld a, "─"
	call .PlaceChars
	ld [hl], "┘"

	ret
; 101e

.PlaceChars: ; 101e
; Place char a c times.
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret
; 1024


TextBoxPalette:: ; 1024
; Fill text box width c height b at hl with pal 7
	ld de, AttrMap - TileMap
	add hl, de
rept 2
	inc b
endr
rept 2
	inc c
endr
	ld a, TEXTBOX_PAL
.col
	push bc
	push hl
.row
	ld [hli], a
	dec c
	jr nz, .row
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .col
	ret
; 103e


SpeechTextBox:: ; 103e
; Standard textbox.
	hlcoord TEXTBOX_X, TEXTBOX_Y
	ld b, TEXTBOX_INNERH
	ld c, TEXTBOX_INNERW
	jp TextBox
; 1048

TestText:: ; 1048
	text "ゲームフりーク!"
	done
; 1052

Function1052:: ; 1052
	ld hl, .stop
	ret
.stop	db "@"
; 1057


PrintText:: ; 1057
	call SetUpTextBox
Function105a:: ; 105a
	push hl
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	lb bc, TEXTBOX_INNERH - 1, TEXTBOX_INNERW
	call ClearBox
	pop hl

PrintTextBoxText:: ; 1065
	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY
	call Function13e5
	ret
; 106c

SetUpTextBox:: ; 106c
	push hl
	call SpeechTextBox
	call DrawOnMap
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
dict: macro
if \1 == 0
	and a
else
	cp \1
endc
	jp z, \2
endm
	dict $15, Char15
	dict $4f, Line
	dict $4e, NextLine
	dict $16, Char16
	dict $00, NullChar
	dict $4c, Function1337
	dict $4b, Char4B
	dict $51, Paragraph
	dict $49, PrintMomsName
	dict $52, PrintPlayerName
	dict $53, PrintRivalName
	dict $35, Char35
	dict $36, Char36
	dict $37, Char37
	dict $38, PrintRedsName
	dict $39, PrintGreensName
	dict $54, Char54
	dict $5b, Char5B
	dict $5e, Char5E
	dict $5c, Char5C
	dict $5d, Char5D
	dict $23, Char23
	dict $22, Char22
	dict $55, ContText
	dict $56, Char56
	dict $57, DoneText
	dict $58, PromptText
	dict $4a, Char4A
	dict $24, Char24
	dict $25, NextChar
	cp $1f
	jr nz, .ok
	ld a, $7f
.ok
	dict $5f, Char5F
	dict $59, Char59
	dict $5a, Char5A
	dict $3f, Char3F
	dict $14, Char14
	cp $e4 ; handakuten
	jr z, .place
	cp $e5 ; dakuten
	jr z, .place

	jr .nope
	ld b, a
	call Diacritic
	jp NextChar
.nope

	cp $60
	jr nc, .place

	cp $40
	jr nc, .handakuten

.dakuten

	cp $20
	jr nc, .daku1
	add $80
	jr .daku2
.daku1
	add $90
.daku2
	ld b, $e5 ; dakuten
	call Diacritic
	jr .place

.handakuten
	cp "ぱ"
	jr nc, .han1
	add "ハ" - "パ"
	jr .han2
.han1
	add "は" - "ぱ"
.han2
	ld b, $e4 ; handakuten
	call Diacritic

.place
	ld [hli], a
	call PrintLetterDelay
	jp NextChar
; 0x117b


Char15:: ; 117b
	ld c, l
	ld b, h
	callba Function17f036
	jp PlaceNextChar
; 1186


print_name: macro
	push de
	ld de, \1
	jp Function126a
endm

PrintMomsName:   print_name MomsName   ; 1186
PrintPlayerName: print_name PlayerName ; 118d
PrintRivalName:  print_name RivalName  ; 1194
PrintRedsName:   print_name RedsName   ; 119b
PrintGreensName: print_name GreensName ; 11a2

Char5D: print_name Char5DText ; 11a9
Char5C: print_name Char5CText ; 11b0
Char5B: print_name Char5BText ; 11b7
Char5E: print_name Char5EText ; 11be
Char54: print_name Char54Text ; 11c5
Char23: print_name Char23Text ; 11cc
Char56: print_name Char56Text ; 11d3
Char4A: print_name Char4AText ; 11da
Char24: print_name Char24Text ; 11e1
Char35: print_name Char35Text ; 11e8
Char36: print_name Char36Text ; 11ef
Char37: print_name Char37Text ; 11f6


Char59:: ; 11fd
	ld a, [hBattleTurn]
	xor 1
	jr Char59_5A

Char5A:: ; 1203
	ld a, [hBattleTurn]

Char59_5A: ; 1205
	push de
	and a
	jr nz, .enemy

	ld de, BattleMonNick
	jr Function126a

.enemy
	ld de, Char5AText ; Enemy
	call PlaceString
	ld h, b
	ld l, c
	ld de, EnemyMonNick
	jr Function126a


Char3F:: ; 121b
	push de

	ld a, [InLinkBattle]
	and a
	jr nz, .linkbattle

	ld a, [TrainerClass]
	cp RIVAL1
	jr z, .rival
	cp RIVAL2
	jr z, .rival

	ld de, OTName
	call PlaceString
	ld h, b
	ld l, c
	ld de, String12a2
	call PlaceString
	push bc
	callab Battle_GetTrainerName
	pop hl
	ld de, StringBuffer1
	jr Function126a

.rival
	ld de, RivalName
	jr Function126a

.linkbattle
	ld de, OTName
	jr Function126a


Char14:: ; 1252
	push de
	ld de, PlayerName
	call PlaceString
	ld h, b
	ld l, c
	ld a, [PlayerGender]
	bit 0, a
	ld de, String12a5
	jr z, Function126a
	ld de, String12a6
	jr Function126a


Function126a:: ; 126a
	call PlaceString
	ld h, b
	ld l, c
	pop de
	jp NextChar
; 0x1273

Char5CText:: db "TM@" ; 1273
Char5DText:: db "TRAINER@" ; 1276
Char5BText:: db "PC@" ; 127e
Char5EText:: db "ROCKET@" ; 1281
Char54Text:: db "POKé@" ; 1288
Char23Text:: db "こうげき@" ; 128d
Char56Text:: db "……@" ; 1292
Char5AText:: db "Enemy @" ; 1295
Char4AText:: db $e1, $e2, "@" ; PK MN ; 129c
Char24Text:: db $70, $71, "@" ; PO KE ; 129f
String12a2:: db " @" ; 12a2
Char35Text::
Char36Text::
Char37Text:: db "@" ; 12a4
String12a5:: db "@" ; 12a5
String12a6:: db "@" ; 12a6
; 12a7

NextLine:: ; 12a7
	pop hl
	ld bc, SCREEN_WIDTH * 2
	add hl, bc
	push hl
	jp NextChar
; 12b0

Char22:: ; 12b0
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	push hl
	jp NextChar
; 12b9

Char16:: ; 12b9
	pop hl
	push de
	ld bc, -TileMap + $10000
	add hl, bc
	ld de, -SCREEN_WIDTH
	ld c, 1
.asm_12c4
	ld a, h
	and a
	jr nz, .asm_12cd
	ld a, l
	cp SCREEN_WIDTH
	jr c, .asm_12d1

.asm_12cd
	add hl, de
	inc c
	jr .asm_12c4

.asm_12d1
	ld hl, TileMap
	ld de, SCREEN_WIDTH
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
	ld b, 0
	add hl, bc
	push hl
	jp NextChar
; 12ea


Line:: ; 12ea
	pop hl
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	push hl
	jp NextChar
; 0x12f2

Paragraph:: ; 12f2
	push de

	ld a, [InLinkBattle]
	cp $3
	jr z, .asm_1301
	cp $4
	jr z, .asm_1301
	call Function13c7
.asm_1301

	call Function13b6
	call KeepTextOpen
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	lb bc, TEXTBOX_INNERH - 1, TEXTBOX_INNERW
	call ClearBox
	call Function13cd
	ld c, 20
	call DelayFrames
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
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
	call KeepTextOpen
	pop de

	ld a, [InLinkBattle]
	or a
	call z, Function13cd

Function1337:: ; 1337
	push de
	call Function138c
	call Function138c
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	pop de
	jp NextChar
; 1345


ContText:: ; 1345
	push de
	ld de, .cont
	ld b, h
	ld c, l
	call PlaceString
	ld h, b
	ld l, c
	pop de
	jp NextChar

.cont	db $4b, "@"
; 1356


Char5F:: ; 1356
; Legacy: ends a Pokédex entry (Red).
; Dex entries are now regular strings.
	ld [hl], "."
	pop hl
	ret
; 135a

PromptText:: ; 135a
	ld a, [InLinkBattle]
	cp $3
	jr z, .ok
	cp $4
	jr z, .ok
	call Function13c7
.ok

	call Function13b6
	call KeepTextOpen
	ld a, [InLinkBattle]
	cp $3
	jr z, DoneText
	cp $4
	jr z, DoneText
	call Function13cd

DoneText:: ; 137c
	pop hl
	ld de, .stop
	dec de
	ret
.stop	db "@"
; 1383

NullChar:: ; 1383
	ld a, "?"
	ld [hli], a
	call PrintLetterDelay
	jp NextChar
; 138c

Function138c:: ; 138c
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	decoord TEXTBOX_INNERX, TEXTBOX_INNERY - 1
	ld a, TEXTBOX_INNERH - 1
.col
	push af
	ld c, TEXTBOX_INNERW
.row
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .row
rept 2
	inc de
endr
rept 2
	inc hl
endr
	pop af
	dec a
	jr nz, .col
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	ld a, " "
	ld bc, TEXTBOX_INNERW
	call ByteFill
	ld c, 5
	call DelayFrames
	ret
; 13b6

Function13b6:: ; 13b6
	push bc
	ld a, [hOAMUpdate]
	push af
	ld a, 1
	ld [hOAMUpdate], a
	call WaitBGMap
	pop af
	ld [hOAMUpdate], a
	pop bc
	ret
; 13c6

Diacritic:: ; 13c6
	ret
; 13c7

Function13c7:: ; 13c7
	ld a, "▼"
	ld [TileMap + 18 + 17 * SCREEN_WIDTH], a
	ret
; 13cd

Function13cd:: ; 13cd
	ld a, [TileMap + 17 + 17 * SCREEN_WIDTH]
	ld [TileMap + 18 + 17 * SCREEN_WIDTH], a
	ret
; 13d4

FarString:: ; 13d4
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
	ld hl, .stop
	ret

.stop	db "@"
; 13e5


Function13e5:: ; 13e5
	ld a, [TextBoxFrame + 1]
	push af
	set 1, a
	ld [TextBoxFrame + 1], a

	call Function13f6

	pop af
	ld [TextBoxFrame + 1], a
	ret
; 13f6

Function13f6:: ; 13f6
	ld a, [hli]
	cp "@"
	ret z
	call .TextCommand
	jr Function13f6

.TextCommand:
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, TextCommands
rept 2
	add hl, bc
endr
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
; TX_BCD
; write bcd from address, typically ram
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
; [$03][addr]

	ld a, [hli]
	ld [wd0e4 + 2], a
	ld c, a
	ld a, [hli]
	ld [wd0e4 + 2 + 1], a
	ld b, a
	ret
; 148b

Text_04:: ; 148b
; TX_BOX
; draw a box
; little endian
; [$04][addr][height][width]

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

	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
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
	call KeepTextOpen
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
	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	ret
; 14c9

Text_08:: ; 14c9
; TX_ASM

	bit 7, h
	jr nz, .not_rom
	jp [hl]

.not_rom
	ld a, "@"
	ld [hl], a
	ret
; 14d2

Text_09:: ; 14d2
; TX_NUM
; [$09][addr][hi:bytes lo:digits]
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
	jr nz, .done
	ld c, 30
	call DelayFrames
.done
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
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp b
	jr z, .play
rept 2
	inc hl
endr
	jr .loop

.play
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call PlaySFX
	call WaitSFX
	pop de

.done
	pop hl
	pop bc
	ret
; 1522

Function1522:: ; 1522
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call PlayCry
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
	db -1
; 1543

Text_0C:: ; 1543
; [$0C][num]
	ld a, [hli]
	ld d, a
	push hl
	ld h, b
	ld l, c
.loop
	push de
	ld a, "…"
	ld [hli], a
	call GetJoypad
	ld a, [hJoyDown]
	and A_BUTTON | B_BUTTON
	jr nz, .next
	ld c, 10
	call DelayFrames
.next
	pop de
	dec d
	jr nz, .loop
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
	call KeepTextOpen
	pop bc
	pop hl
	ret
; 156a

Text_14:: ; 156a
; Print a string from one of the following:
; 0: StringBuffer3
; 1: StringBuffer4
; 2: StringBuffer5
; 3: StringBuffer2
; 4: StringBuffer1
; 5: EnemyMonNick
; 6: BattleMonNick
; [$14][id]

	ld a, [hli]
	push hl
	ld e, a
	ld d, 0
	ld hl, Unknown_24000
rept 2
	add hl, de
endr
	ld a, BANK(Unknown_24000)
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
rept 2
	add hl, bc
endr
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
