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

FillBoxWithByte::
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
; fc8


ClearTileMap:: ; fc8
; Fill TileMap with blank tiles.

	hlcoord 0, 0
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
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	jr ClearTileMap
; fe8



TextBox:: ; fe8
; Draw a text box at hl with room for
; b lines of c characters each.
; Places a border around the textbox,
; then switches the palette to the
; text black-and-white scheme.
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
	inc b
	inc b
	inc c
	inc c
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

RadioTerminator:: ; 1052
	ld hl, .stop
	ret
.stop	db "@"
; 1057


PrintText:: ; 1057
	call SetUpTextBox
BuenaPrintText:: ; 105a
	push hl
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	lb bc, TEXTBOX_INNERH - 1, TEXTBOX_INNERW
	call ClearBox
	pop hl

PrintTextBoxText:: ; 1065
	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY
	call PlaceHLTextAtBC
	ret
; 106c

SetUpTextBox:: ; 106c
	push hl
	call SpeechTextBox
	call UpdateSprites
	call ApplyTilemap
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

dict2: macro
	cp \1
	jr nz, ._\@
	ld a, \2
._\@:
endm

	dict "<DAY>", Char15
	dict "<LINE>", LineChar
	dict "<NEXT>", NextLineChar
	dict TX_FAR, TextFar
	dict $00, NullChar
	dict $4c, Char4C
	dict $4b, Char4B
	dict "<PARA>", Paragraph
	dict "<MOM>", PrintMomsName
	dict "<PLAYER>", PrintPlayerName
	dict "<RIVAL>", PrintRivalName
	dict $35, Char35
	dict $36, Char36
	dict $37, Char37
	dict "<RED>", PrintRedsName
	dict "<GREEN>", PrintGreensName
	dict "#", PlacePOKe
	dict "<PC>", PCChar
	dict "<ROCKET>", RocketChar
	dict "<TM>", TMChar
	dict "<TRNER>", TrainerChar
	dict $23, PlaceKougeki
	dict "<LNBRK>", Char22
	dict "<CONT>", ContText
	dict "<......>", SixDotsChar
	dict "<DONE>", DoneText
	dict "<PROMPT>", PromptText
	dict "<PKMN>", PlacePKMN
	dict "<POKE>", PlacePOKE
	dict $25, NextChar
	dict2 $1f, " "
	dict "<DEXEND>", PlaceDexEnd
	dict "<TARGET>", PlaceMoveTargetsName
	dict "<USER>", PlaceMoveUsersName
	dict "<ENEMY>", PlaceEnemysName
	dict "<PLAY_G>", PlaceGenderedPlayerName

	cp "ﾟ"
	jr z, .place ; should be .diacritic
	cp "ﾞ"
	jr z, .place ; should be .diacritic
	jr .not_diacritic

.diacritic
	ld b, a
	call Diacritic
	jp NextChar

.not_diacritic
	cp $60 ; Regular characters
	jr nc, .place

	cp "パ"
	jr nc, .handakuten

.dakuten
	cp $20
	jr nc, .daku1
	add "カ" - "ガ"
	jr .daku2
.daku1
	add "か" - "が"
.daku2
	ld b, "ﾞ" ; dakuten
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
	ld b, "ﾟ" ; handakuten
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
	jp PlaceCommandCharacter
endm

PrintMomsName:   print_name MomsName   ; 1186
PrintPlayerName: print_name PlayerName ; 118d
PrintRivalName:  print_name RivalName  ; 1194
PrintRedsName:   print_name RedsName   ; 119b
PrintGreensName: print_name GreensName ; 11a2

TrainerChar:  print_name TrainerCharText ; 11a9
TMChar:       print_name TMCharText      ; 11b0
PCChar:       print_name PCCharText      ; 11b7
RocketChar:   print_name RocketCharText  ; 11be
PlacePOKe:    print_name PlacePOKeText   ; 11c5
PlaceKougeki: print_name KougekiText     ; 11cc
SixDotsChar:  print_name SixDotsCharText ; 11d3
PlacePKMN:    print_name PlacePKMNText   ; 11da
PlacePOKE:    print_name PlacePOKEText   ; 11e1
Char35:       print_name Char35Text      ; 11e8
Char36:       print_name Char36Text      ; 11ef
Char37:       print_name Char37Text      ; 11f6


PlaceMoveTargetsName:: ; 11fd
	ld a, [hBattleTurn]
	xor 1
	jr PlaceMoveTargetsName_5A

PlaceMoveUsersName:: ; 1203
	ld a, [hBattleTurn]

PlaceMoveTargetsName_5A: ; 1205
	push de
	and a
	jr nz, .enemy

	ld de, BattleMonNick
	jr PlaceCommandCharacter

.enemy
	ld de, EnemyText ; Enemy
	call PlaceString
	ld h, b
	ld l, c
	ld de, EnemyMonNick
	jr PlaceCommandCharacter


PlaceEnemysName:: ; 121b
	push de

	ld a, [wLinkMode]
	and a
	jr nz, .linkbattle

	ld a, [TrainerClass]
	cp RIVAL1
	jr z, .rival
	cp RIVAL2
	jr z, .rival

	ld de, OTClassName
	call PlaceString
	ld h, b
	ld l, c
	ld de, String12a2
	call PlaceString
	push bc
	callab Battle_GetTrainerName
	pop hl
	ld de, StringBuffer1
	jr PlaceCommandCharacter

.rival
	ld de, RivalName
	jr PlaceCommandCharacter

.linkbattle
	ld de, OTClassName
	jr PlaceCommandCharacter


PlaceGenderedPlayerName:: ; 1252
	push de
	ld de, PlayerName
	call PlaceString
	ld h, b
	ld l, c
	ld a, [PlayerGender]
	bit 0, a
	ld de, String_kun
	jr z, PlaceCommandCharacter
	ld de, String_chan
	jr PlaceCommandCharacter


PlaceCommandCharacter:: ; 126a
	call PlaceString
	ld h, b
	ld l, c
	pop de
	jp NextChar
; 0x1273

TMCharText:: db "TM@" ; 1273
TrainerCharText:: db "TRAINER@" ; 1276
PCCharText:: db "PC@" ; 127e
RocketCharText:: db "ROCKET@" ; 1281
PlacePOKeText:: db "POKé@" ; 1288
KougekiText:: db "こうげき@" ; 128d
SixDotsCharText:: db "……@" ; 1292
EnemyText:: db "Enemy @" ; 1295
PlacePKMNText:: db "<PK><MN>@" ; PK MN ; 129c
PlacePOKEText:: db "<PO><KE>@" ; PO KE ; 129f
String12a2:: db " @" ; 12a2
Char35Text::
Char36Text::
Char37Text:: db "@" ; 12a4
String_kun:: db "@" ; 12a5
String_chan:: db "@" ; 12a6
; 12a7

NextLineChar:: ; 12a7
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

TextFar:: ; 12b9
	pop hl
	push de
	ld bc, -TileMap + $10000
	add hl, bc
	ld de, -SCREEN_WIDTH
	ld c, 1
.loop
	ld a, h
	and a
	jr nz, .next
	ld a, l
	cp SCREEN_WIDTH
	jr c, .done

.next
	add hl, de
	inc c
	jr .loop

.done
	hlcoord 0, 0
	ld de, SCREEN_WIDTH
	ld a, c
.loop2
	and a
	jr z, .done2
	add hl, de
	dec a
	jr .loop2

.done2
	pop de
	inc de
	ld a, [de]
	ld c, a
	ld b, 0
	add hl, bc
	push hl
	jp NextChar
; 12ea


LineChar:: ; 12ea
	pop hl
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	push hl
	jp NextChar
; 0x12f2

Paragraph:: ; 12f2
	push de

	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .linkbattle
	cp LINK_MOBILE
	jr z, .linkbattle
	call LoadBlinkingCursor

.linkbattle
	call Text_WaitBGMap
	call ButtonSound
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	lb bc, TEXTBOX_INNERH - 1, TEXTBOX_INNERW
	call ClearBox
	call UnloadBlinkingCursor
	ld c, 20
	call DelayFrames
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	pop de
	jp NextChar
; 131f


Char4B:: ; 131f
	ld a, [wLinkMode]
	or a
	jr nz, .communication
	call LoadBlinkingCursor

.communication
	call Text_WaitBGMap

	push de
	call ButtonSound
	pop de

	ld a, [wLinkMode]
	or a
	call z, UnloadBlinkingCursor

Char4C:: ; 1337
	push de
	call TextScroll
	call TextScroll
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


PlaceDexEnd:: ; 1356
; Legacy: ends a Pokédex entry (Red).
; Dex entries are now regular strings.
	ld [hl], "."
	pop hl
	ret
; 135a

PromptText:: ; 135a
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .ok
	cp LINK_MOBILE
	jr z, .ok
	call LoadBlinkingCursor

.ok
	call Text_WaitBGMap
	call ButtonSound
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, DoneText
	cp LINK_MOBILE
	jr z, DoneText
	call UnloadBlinkingCursor

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

TextScroll:: ; 138c
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

	inc de
	inc de
	inc hl
	inc hl
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

Text_WaitBGMap:: ; 13b6
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

LoadBlinkingCursor:: ; 13c7
	ld a, "▼"
	ldcoord_a 18, 17
	ret
; 13cd

UnloadBlinkingCursor:: ; 13cd
	lda_coord 17, 17
	ldcoord_a 18, 17
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

PokeFluteTerminatorCharacter:: ; 13e0
	ld hl, .stop
	ret

.stop	db "@"
; 13e5


PlaceHLTextAtBC:: ; 13e5
	ld a, [TextBoxFlags]
	push af
	set 1, a
	ld [TextBoxFlags], a

	call DoTextUntilTerminator

	pop af
	ld [TextBoxFlags], a
	ret
; 13f6

DoTextUntilTerminator:: ; 13f6
	ld a, [hli]
	cp "@"
	ret z
	call .TextCommand
	jr DoTextUntilTerminator

.TextCommand:
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
	dw Text_TX
	dw Text_TX_RAM
	dw Text_TX_BCD
	dw Text_TX_MOVE
	dw Text_TX_BOX
	dw Text_TX_LOW
	dw Text_WAIT_BUTTON
	dw Text_TX_SCROLL
	dw Text_START_ASM
	dw Text_TX_NUM
	dw Text_TX_EXIT
	dw Text_PlaySound ; $0b
	dw Text_TX_DOTS
	dw Text_0D
	dw Text_PlaySound ; $0e
	dw Text_PlaySound ; $0f
	dw Text_PlaySound ; $10
	dw Text_PlaySound ; $11
	dw Text_PlaySound ; $12
	dw Text_PlaySound ; $13
	dw Text_TX_STRINGBUFFER
	dw Text_TX_DAY
	dw Text_TX_FAR
; 143e

Text_TX:: ; 143e
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

Text_TX_RAM:: ; 1449
; text_from_ram
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

Text_TX_FAR:: ; 1455
; text_jump
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
	call DoTextUntilTerminator
	pop hl

	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret
; 1470

Text_TX_BCD:: ; 1470
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

Text_TX_MOVE:: ; 1480
; TX_MOVE
; move to a new tile
; [$03][addr]

	ld a, [hli]
	ld [wMenuScrollPosition + 2], a
	ld c, a
	ld a, [hli]
	ld [wMenuScrollPosition + 2 + 1], a
	ld b, a
	ret
; 148b

Text_TX_BOX:: ; 148b
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

Text_TX_LOW:: ; 149b
; TX_LOW
; write text at (1,16)
; [$05]

	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	ret
; 149f

Text_WAIT_BUTTON:: ; 149f
; TX_WAITBUTTON
; wait for button press
; show arrow
; [06]

	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jp z, Text_0D
	cp LINK_MOBILE
	jp z, Text_0D

	push hl
	call LoadBlinkingCursor
	push bc
	call ButtonSound
	pop bc
	call UnloadBlinkingCursor
	pop hl
	ret
; 14ba

Text_TX_SCROLL:: ; 14ba
; pushes text up two lines and sets the BC cursor to the border tile
; below the first character column of the text box.
	push hl
	call UnloadBlinkingCursor
	call TextScroll
	call TextScroll
	pop hl
	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	ret
; 14c9

Text_START_ASM:: ; 14c9
; TX_ASM

	bit 7, h
	jr nz, .not_rom
	jp [hl]

.not_rom
	ld a, "@"
	ld [hl], a
	ret
; 14d2

Text_TX_NUM:: ; 14d2
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
	set PRINTNUM_RIGHTALIGN_F, a
	ld b, a
	call PrintNum
	ld b, h
	ld c, l
	pop hl
	ret
; 14ed

Text_TX_EXIT:: ; 14ed
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
	inc hl
	inc hl
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
; XXX
; TX_CRY
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
	dbw TX_SOUND_0B, SFX_DEX_FANFARE_50_79
	dbw TX_SOUND_12, SFX_FANFARE
	dbw TX_SOUND_0E, SFX_DEX_FANFARE_20_49
	dbw TX_SOUND_0F, SFX_ITEM
	dbw TX_SOUND_10, SFX_CAUGHT_MON
	dbw TX_SOUND_11, SFX_DEX_FANFARE_80_109
	dbw TX_SOUND_13, SFX_SLOT_MACHINE_START
	db -1
; 1543

Text_TX_DOTS:: ; 1543
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
	call ButtonSound
	pop bc
	pop hl
	ret
; 156a

Text_TX_STRINGBUFFER:: ; 156a
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
	ld hl, StringBufferPointers
	add hl, de
	add hl, de
	ld a, BANK(StringBufferPointers)
	call GetFarHalfword
	ld d, h
	ld e, l
	ld h, b
	ld l, c
	call PlaceString
	pop hl
	ret
; 1582

Text_TX_DAY:: ; 1582
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

.Days: ; 15a2
	dw .Sun
	dw .Mon
	dw .Tues
	dw .Wednes
	dw .Thurs
	dw .Fri
	dw .Satur

.Sun:    db "SUN@"
.Mon:    db "MON@"
.Tues:   db "TUES@"
.Wednes: db "WEDNES@"
.Thurs:  db "THURS@"
.Fri:    db "FRI@"
.Satur:  db "SATUR@"
.Day:    db "DAY@"
; 15d8
