ClearBox::
; Fill a c*b box at hl with blank tiles.
	ld a, " "
	; fallthrough

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

ClearTilemap::
; Fill wTilemap with blank tiles.

	hlcoord 0, 0
	ld a, " "
	ld bc, wTilemapEnd - wTilemap
	call ByteFill

	; Update the BG Map.
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	ret z
	jp WaitBGMap

ClearScreen::
	ld a, PAL_BG_TEXT
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	jr ClearTilemap

Textbox::
; Draw a text box at hl with room for b lines of c characters each.
; Places a border around the textbox, then switches the palette to the
; text black-and-white scheme.
	push bc
	push hl
	call TextboxBorder
	pop hl
	pop bc
	jr TextboxPalette

TextboxBorder::
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

.PlaceChars:
; Place char a c times.
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

TextboxPalette::
; Fill text box width c height b at hl with pal 7
	ld de, wAttrmap - wTilemap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, PAL_BG_TEXT
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

SpeechTextbox::
; Standard textbox.
	hlcoord TEXTBOX_X, TEXTBOX_Y
	ld b, TEXTBOX_INNERH
	ld c, TEXTBOX_INNERW
	jp Textbox

TestText::
	text "ゲームフりーク！"
	done

RadioTerminator::
	ld hl, .stop
	ret

.stop:
	text_end

PrintText::
	call SetUpTextbox
BuenaPrintText::
	push hl
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	lb bc, TEXTBOX_INNERH - 1, TEXTBOX_INNERW
	call ClearBox
	pop hl

PrintTextboxText::
	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY
	call PlaceHLTextAtBC
	ret

SetUpTextbox::
	push hl
	call SpeechTextbox
	call UpdateSprites
	call ApplyTilemap
	pop hl
	ret

PlaceString::
	push hl

PlaceNextChar::
	ld a, [de]
	cp "@"
	jr nz, CheckDict
	ld b, h
	ld c, l
	pop hl
	ret
	pop de

NextChar::
	inc de
	jp PlaceNextChar

CheckDict::
dict: MACRO
if \1 == "<NULL>"
	and a
else
	cp \1
endc

if STRSUB("\2", 1, 1) == "\""
; Replace a character with another one
	jr nz, ._\@
	ld a, \2
._\@:
elif STRSUB("\2", 1, 1) == "."
; Locals can use a short jump
	jr z, \2
else
	jp z, \2
endc
ENDM

	dict "<MOBILE>",  MobileScriptChar
	dict "<LINE>",    LineChar
	dict "<NEXT>",    NextLineChar
	dict "<CR>",      CarriageReturnChar
	dict "<NULL>",    NullChar
	dict "<SCROLL>",  _ContTextNoPause
	dict "<_CONT>",   _ContText
	dict "<PARA>",    Paragraph
	dict "<MOM>",     PrintMomsName
	dict "<PLAYER>",  PrintPlayerName
	dict "<RIVAL>",   PrintRivalName
	dict "<ROUTE>",   PlaceJPRoute
	dict "<WATASHI>", PlaceWatashi
	dict "<KOKO_WA>", PlaceKokoWa
	dict "<RED>",     PrintRedsName
	dict "<GREEN>",   PrintGreensName
	dict "#",         PlacePOKe
	dict "<PC>",      PCChar
	dict "<ROCKET>",  RocketChar
	dict "<TM>",      TMChar
	dict "<TRAINER>", TrainerChar
	dict "<KOUGEKI>", PlaceKougeki
	dict "<LF>",      LineFeedChar
	dict "<CONT>",    ContText
	dict "<……>",      SixDotsChar
	dict "<DONE>",    DoneText
	dict "<PROMPT>",  PromptText
	dict "<PKMN>",    PlacePKMN
	dict "<POKE>",    PlacePOKE
	dict "%",         NextChar
	dict "¯",         " "
	dict "<DEXEND>",  PlaceDexEnd
	dict "<TARGET>",  PlaceMoveTargetsName
	dict "<USER>",    PlaceMoveUsersName
	dict "<ENEMY>",   PlaceEnemysName
	dict "<PLAY_G>",  PlaceGenderedPlayerName
	dict "ﾟ",         .place ; should be .diacritic
	dict "ﾞ",         .place ; should be .diacritic
	jr .not_diacritic

.diacritic
	ld b, a
	call Diacritic
	jp NextChar

.not_diacritic
	cp FIRST_REGULAR_TEXT_CHAR
	jr nc, .place

	cp "パ"
	jr nc, .handakuten

.dakuten
	cp FIRST_HIRAGANA_DAKUTEN_CHAR
	jr nc, .hiragana_dakuten
	add "カ" - "ガ"
	jr .katakana_dakuten
.hiragana_dakuten
	add "か" - "が"
.katakana_dakuten
	ld b, "ﾞ" ; dakuten
	call Diacritic
	jr .place

.handakuten
	cp "ぱ"
	jr nc, .hiragana_handakuten
	add "ハ" - "パ"
	jr .katakana_handakuten
.hiragana_handakuten
	add "は" - "ぱ"
.katakana_handakuten
	ld b, "ﾟ" ; handakuten
	call Diacritic

.place
	ld [hli], a
	call PrintLetterDelay
	jp NextChar

MobileScriptChar::
	ld c, l
	ld b, h
	farcall RunMobileScript
	jp PlaceNextChar

print_name: MACRO
	push de
	ld de, \1
	jp PlaceCommandCharacter
ENDM

PrintMomsName:   print_name wMomsName
PrintPlayerName: print_name wPlayerName
PrintRivalName:  print_name wRivalName
PrintRedsName:   print_name wRedsName
PrintGreensName: print_name wGreensName

TrainerChar:  print_name TrainerCharText
TMChar:       print_name TMCharText
PCChar:       print_name PCCharText
RocketChar:   print_name RocketCharText
PlacePOKe:    print_name PlacePOKeText
PlaceKougeki: print_name KougekiText
SixDotsChar:  print_name SixDotsCharText
PlacePKMN:    print_name PlacePKMNText
PlacePOKE:    print_name PlacePOKEText
PlaceJPRoute: print_name PlaceJPRouteText
PlaceWatashi: print_name PlaceWatashiText
PlaceKokoWa:  print_name PlaceKokoWaText

PlaceMoveTargetsName::
	ldh a, [hBattleTurn]
	xor 1
	jr PlaceMoveUsersName.place

PlaceMoveUsersName::
	ldh a, [hBattleTurn]

.place:
	push de
	and a
	jr nz, .enemy

	ld de, wBattleMonNick
	jr PlaceCommandCharacter

.enemy
	ld de, EnemyText
	call PlaceString
	ld h, b
	ld l, c
	ld de, wEnemyMonNick
	jr PlaceCommandCharacter

PlaceEnemysName::
	push de

	ld a, [wLinkMode]
	and a
	jr nz, .linkbattle

	ld a, [wTrainerClass]
	cp RIVAL1
	jr z, .rival
	cp RIVAL2
	jr z, .rival

	ld de, wOTClassName
	call PlaceString
	ld h, b
	ld l, c
	ld de, String_Space
	call PlaceString
	push bc
	callfar Battle_GetTrainerName
	pop hl
	ld de, wStringBuffer1
	jr PlaceCommandCharacter

.rival
	ld de, wRivalName
	jr PlaceCommandCharacter

.linkbattle
	ld de, wOTClassName
	jr PlaceCommandCharacter

PlaceGenderedPlayerName::
	push de
	ld de, wPlayerName
	call PlaceString
	ld h, b
	ld l, c
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	ld de, KunSuffixText
	jr z, PlaceCommandCharacter
	ld de, ChanSuffixText
	jr PlaceCommandCharacter

PlaceCommandCharacter::
	call PlaceString
	ld h, b
	ld l, c
	pop de
	jp NextChar

TMCharText::      db "TM@"
TrainerCharText:: db "TRAINER@"
PCCharText::      db "PC@"
RocketCharText::  db "ROCKET@"
PlacePOKeText::   db "POKé@"
KougekiText::     db "こうげき@"
SixDotsCharText:: db "……@"
EnemyText::       db "Enemy @"
PlacePKMNText::   db "<PK><MN>@"
PlacePOKEText::   db "<PO><KE>@"
String_Space::    db " @"
; These strings have been dummied out.
PlaceJPRouteText::
PlaceWatashiText::
PlaceKokoWaText:: db "@"
KunSuffixText::   db "@"
ChanSuffixText::  db "@"

NextLineChar::
	pop hl
	ld bc, SCREEN_WIDTH * 2
	add hl, bc
	push hl
	jp NextChar

LineFeedChar::
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	push hl
	jp NextChar

CarriageReturnChar::
	pop hl
	push de
	ld bc, -wTilemap + $10000
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

LineChar::
	pop hl
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	push hl
	jp NextChar

Paragraph::
	push de

	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .linkbattle
	cp LINK_MOBILE
	jr z, .linkbattle
	call LoadBlinkingCursor

.linkbattle
	call Text_WaitBGMap
	call PromptButton
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	lb bc, TEXTBOX_INNERH - 1, TEXTBOX_INNERW
	call ClearBox
	call UnloadBlinkingCursor
	ld c, 20
	call DelayFrames
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	pop de
	jp NextChar

_ContText::
	ld a, [wLinkMode]
	or a
	jr nz, .communication
	call LoadBlinkingCursor

.communication
	call Text_WaitBGMap

	push de
	call PromptButton
	pop de

	ld a, [wLinkMode]
	or a
	call z, UnloadBlinkingCursor
	; fallthrough

_ContTextNoPause::
	push de
	call TextScroll
	call TextScroll
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	pop de
	jp NextChar

ContText::
	push de
	ld de, .cont
	ld b, h
	ld c, l
	call PlaceString
	ld h, b
	ld l, c
	pop de
	jp NextChar

.cont: db "<_CONT>@"

PlaceDexEnd::
; Ends a Pokédex entry in Gen 1.
; Dex entries are now regular strings.
	ld [hl], "."
	pop hl
	ret

PromptText::
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .ok
	cp LINK_MOBILE
	jr z, .ok
	call LoadBlinkingCursor

.ok
	call Text_WaitBGMap
	call PromptButton
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, DoneText
	cp LINK_MOBILE
	jr z, DoneText
	call UnloadBlinkingCursor

DoneText::
	pop hl
	ld de, .stop
	dec de
	ret

.stop:
	text_end

NullChar::
	ld a, "?"
	ld [hli], a
	call PrintLetterDelay
	jp NextChar

TextScroll::
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

Text_WaitBGMap::
	push bc
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a

	call WaitBGMap

	pop af
	ldh [hOAMUpdate], a
	pop bc
	ret

Diacritic::
	ret

LoadBlinkingCursor::
	ld a, "▼"
	ldcoord_a 18, 17
	ret

UnloadBlinkingCursor::
	lda_coord 17, 17
	ldcoord_a 18, 17
	ret

FarString::
	ld b, a
	ldh a, [hROMBank]
	push af

	ld a, b
	rst Bankswitch
	call PlaceString

	pop af
	rst Bankswitch
	ret

PokeFluteTerminatorCharacter::
	ld hl, .stop
	ret

.stop:
	text_end

PlaceHLTextAtBC::
	ld a, [wTextboxFlags]
	push af
	set NO_TEXT_DELAY_F, a
	ld [wTextboxFlags], a

	call DoTextUntilTerminator

	pop af
	ld [wTextboxFlags], a
	ret

DoTextUntilTerminator::
	ld a, [hli]
	cp TX_END
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

TextCommands::
; entries correspond to TX_* constants (see macros/scripts/text.asm)
	dw TextCommand_START              ; TX_START
	dw TextCommand_RAM                ; TX_RAM
	dw TextCommand_BCD                ; TX_BCD
	dw TextCommand_MOVE               ; TX_MOVE
	dw TextCommand_BOX                ; TX_BOX
	dw TextCommand_LOW                ; TX_LOW
	dw TextCommand_PROMPT_BUTTON      ; TX_PROMPT_BUTTON
	dw TextCommand_SCROLL             ; TX_SCROLL
	dw TextCommand_START_ASM          ; TX_START_ASM
	dw TextCommand_NUM                ; TX_NUM
	dw TextCommand_PAUSE              ; TX_PAUSE
	dw TextCommand_SOUND              ; TX_SOUND_DEX_FANFARE_50_79
	dw TextCommand_DOTS               ; TX_DOTS
	dw TextCommand_LINK_PROMPT_BUTTON ; TX_LINK_PROMPT_BUTTON
	dw TextCommand_SOUND              ; TX_SOUND_DEX_FANFARE_20_49
	dw TextCommand_SOUND              ; TX_SOUND_ITEM
	dw TextCommand_SOUND              ; TX_SOUND_CAUGHT_MON
	dw TextCommand_SOUND              ; TX_SOUND_DEX_FANFARE_80_109
	dw TextCommand_SOUND              ; TX_SOUND_FANFARE
	dw TextCommand_SOUND              ; TX_SOUND_SLOT_MACHINE_START
	dw TextCommand_STRINGBUFFER       ; TX_STRINGBUFFER
	dw TextCommand_DAY                ; TX_DAY
	dw TextCommand_FAR                ; TX_FAR

TextCommand_START::
; text_start
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

TextCommand_RAM::
; text_ram
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

TextCommand_FAR::
; text_far
; write text from a different bank
; little endian
; [$16][addr][bank]

	ldh a, [hROMBank]
	push af

	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]

	ldh [hROMBank], a
	ld [MBC3RomBank], a

	push hl
	ld h, d
	ld l, e
	call DoTextUntilTerminator
	pop hl

	pop af
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ret

TextCommand_BCD::
; text_bcd
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

TextCommand_MOVE::
; text_move
; move to a new tile
; [$03][addr]

	ld a, [hli]
	ld [wMenuScrollPosition + 2], a
	ld c, a
	ld a, [hli]
	ld [wMenuScrollPosition + 2 + 1], a
	ld b, a
	ret

TextCommand_BOX::
; text_box
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
	call Textbox
	pop hl
	ret

TextCommand_LOW::
; text_low
; write text at (1,16)
; [$05]

	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	ret

TextCommand_PROMPT_BUTTON::
; text_promptbutton
; wait for button press
; show arrow
; [06]

	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jp z, TextCommand_LINK_PROMPT_BUTTON
	cp LINK_MOBILE
	jp z, TextCommand_LINK_PROMPT_BUTTON

	push hl
	call LoadBlinkingCursor
	push bc
	call PromptButton
	pop bc
	call UnloadBlinkingCursor
	pop hl
	ret

TextCommand_SCROLL::
; text_scroll
; pushes text up two lines and sets the BC cursor to the border tile
; below the first character column of the text box.
	push hl
	call UnloadBlinkingCursor
	call TextScroll
	call TextScroll
	pop hl
	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	ret

TextCommand_START_ASM::
; text_asm

	bit 7, h
	jr nz, .not_rom
	jp hl

.not_rom
	ld a, TX_END
	ld [hl], a
	ret

TextCommand_NUM::
; text_decimal
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
	set PRINTNUM_LEFTALIGN_F, a
	ld b, a
	call PrintNum
	ld b, h
	ld c, l
	pop hl
	ret

TextCommand_PAUSE::
; text_pause
	push hl
	push bc
	call GetJoypad
	ldh a, [hJoyDown]
	and A_BUTTON | B_BUTTON
	jr nz, .done
	ld c, 30
	call DelayFrames
.done
	pop bc
	pop hl
	ret

TextCommand_SOUND::
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

Unreferenced_Function1522::
; sound_cry
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call PlayMonCry
	pop de
	pop hl
	pop bc
	ret

TextSFX::
	dbw TX_SOUND_DEX_FANFARE_50_79,  SFX_DEX_FANFARE_50_79
	dbw TX_SOUND_FANFARE,            SFX_FANFARE
	dbw TX_SOUND_DEX_FANFARE_20_49,  SFX_DEX_FANFARE_20_49
	dbw TX_SOUND_ITEM,               SFX_ITEM
	dbw TX_SOUND_CAUGHT_MON,         SFX_CAUGHT_MON
	dbw TX_SOUND_DEX_FANFARE_80_109, SFX_DEX_FANFARE_80_109
	dbw TX_SOUND_SLOT_MACHINE_START, SFX_SLOT_MACHINE_START
	db -1

TextCommand_DOTS::
; text_dots
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
	ldh a, [hJoyDown]
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

TextCommand_LINK_PROMPT_BUTTON::
; text_linkpromptbutton
; wait for key down
; display arrow
	push hl
	push bc
	call PromptButton
	pop bc
	pop hl
	ret

TextCommand_STRINGBUFFER::
; text_buffer
; Print a string from one of the following:
; 0: wStringBuffer3
; 1: wStringBuffer4
; 2: wStringBuffer5
; 3: wStringBuffer2
; 4: wStringBuffer1
; 5: wEnemyMonNick
; 6: wBattleMonNick
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

TextCommand_DAY::
; text_today

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

.Days:
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
