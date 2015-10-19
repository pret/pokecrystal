Special_BankOfMom: ; 16218
	ld a, [$ffaa]
	push af
	ld a, $1
	ld [$ffaa], a
	xor a
	ld [wcf63], a
.asm_16223
	ld a, [wcf63]
	bit 7, a
	jr nz, .asm_1622f
	call Function16233
	jr .asm_16223

.asm_1622f
	pop af
	ld [$ffaa], a
	ret
; 16233

Function16233: ; 16233
	ld a, [wcf63]
	ld e, a
	ld d, 0
	ld hl, Jumptable_16242
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 16242

Jumptable_16242: ; 16242
	dw Function16254
	dw Function1626a
	dw Function16290
	dw Function162a8
	dw Function162e0
	dw Function16373
	dw Function16406
	dw Function1642d
	dw Function16433
; 16254

Function16254: ; 16254
	ld a, [wd854]
	bit 7, a
	jr nz, .asm_16264
	set 7, a
	ld [wd854], a
	ld a, $1
	jr .asm_16266

.asm_16264
	ld a, $2

.asm_16266
	ld [wcf63], a
	ret
; 1626a

Function1626a: ; 1626a
	ld hl, UnknownText_0x16649
	call PrintText
	call YesNoBox
	jr c, .asm_1627f
	ld hl, UnknownText_0x1664e
	call PrintText
	ld a, $81
	jr .asm_16281

.asm_1627f
	ld a, $80

.asm_16281
	ld [wd854], a
	ld hl, UnknownText_0x16653
	call PrintText
	ld a, $8
	ld [wcf63], a
	ret
; 16290

Function16290: ; 16290
	ld hl, UnknownText_0x16658
	call PrintText
	call YesNoBox
	jr c, .asm_1629f
	ld a, $3
	jr .asm_162a4

.asm_1629f
	call DSTChecks
	ld a, $7

.asm_162a4
	ld [wcf63], a
	ret
; 162a8

Function162a8: ; 162a8
	ld hl, UnknownText_0x1665d
	call PrintText
	call LoadMenuDataHeader_0x1d75
	ld hl, MenuDataHeader_0x166b5
	call CopyMenuDataHeader
	call InterpretMenu2
	call WriteBackup
	jr c, .asm_162ce
	ld a, [wcfa9]
	cp $1
	jr z, .asm_162d2
	cp $2
	jr z, .asm_162d6
	cp $3
	jr z, .asm_162da

.asm_162ce
	ld a, $7
	jr .asm_162dc

.asm_162d2
	ld a, $5
	jr .asm_162dc

.asm_162d6
	ld a, $4
	jr .asm_162dc

.asm_162da
	ld a, $6

.asm_162dc
	ld [wcf63], a
	ret
; 162e0

Function162e0: ; 162e0
	ld hl, UnknownText_0x16662
	call PrintText
	xor a
	ld hl, StringBuffer2
rept 2
	ld [hli], a
endr
	ld [hl], a
	ld a, $5
	ld [wcf64], a
	call LoadMenuDataHeader_0x1d75
	call Function16517
	call Function1656b
	call Function16571
	call WriteBackup
	jr c, .asm_1636d
	ld hl, StringBuffer2
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr z, .asm_1636d
	ld de, Money
	ld bc, StringBuffer2
	callba CheckMoney
	jr c, .asm_1635f
	ld hl, StringBuffer2
	ld de, StringBuffer2 + 3
	ld bc, $0003
	call CopyBytes
	ld bc, wd851
	ld de, StringBuffer2
	callba GiveMoney
	jr c, .asm_16366
	ld bc, StringBuffer2 + 3
	ld de, Money
	callba TakeMoney
	ld hl, StringBuffer2
	ld de, wd851
	ld bc, $0003
	call CopyBytes
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	ld hl, UnknownText_0x1668a
	call PrintText
	ld a, $8
	jr .asm_1636f

.asm_1635f
	ld hl, UnknownText_0x1667b
	call PrintText
	ret

.asm_16366
	ld hl, UnknownText_0x16680
	call PrintText
	ret

.asm_1636d
	ld a, $7

.asm_1636f
	ld [wcf63], a
	ret
; 16373

Function16373: ; 16373
	ld hl, UnknownText_0x16667
	call PrintText
	xor a
	ld hl, StringBuffer2
rept 2
	ld [hli], a
endr
	ld [hl], a
	ld a, $5
	ld [wcf64], a
	call LoadMenuDataHeader_0x1d75
	call Function16512
	call Function1656b
	call Function16571
	call WriteBackup
	jr c, .asm_16400
	ld hl, StringBuffer2
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr z, .asm_16400
	ld hl, StringBuffer2
	ld de, StringBuffer2 + 3
	ld bc, 3
	call CopyBytes
	ld de, wd851
	ld bc, StringBuffer2
	callba CheckMoney
	jr c, .asm_163f2
	ld bc, Money
	ld de, StringBuffer2
	callba GiveMoney
	jr c, .asm_163f9
	ld bc, StringBuffer2 + 3
	ld de, wd851
	callba TakeMoney
	ld hl, StringBuffer2
	ld de, Money
	ld bc, 3
	call CopyBytes
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	ld hl, UnknownText_0x1668f
	call PrintText
	ld a, $8
	jr .asm_16402

.asm_163f2
	ld hl, UnknownText_0x16671
	call PrintText
	ret

.asm_163f9
	ld hl, UnknownText_0x16676
	call PrintText
	ret

.asm_16400
	ld a, 7

.asm_16402
	ld [wcf63], a
	ret
; 16406

Function16406: ; 16406
	ld hl, UnknownText_0x1666c
	call PrintText
	call YesNoBox
	jr c, .asm_16422
	ld a, $81
	ld [wd854], a
	ld hl, UnknownText_0x16685
	call PrintText
	ld a, $8
	ld [wcf63], a
	ret

.asm_16422
	ld a, $80
	ld [wd854], a
	ld a, $7
	ld [wcf63], a
	ret
; 1642d

Function1642d: ; 1642d
	ld hl, UnknownText_0x16694
	call PrintText

Function16433: ; 16433
	ld hl, wcf63
	set 7, [hl]
	ret
; 16439

DSTChecks: ; 16439
; check the time; avoid changing DST if doing so would change the current day
	ld a, [wDST]
	bit 7, a
	ld a, [hHours]
	jr z, .asm_16447
	and a ; within one hour of 00:00?
	jr z, .LostBooklet
	jr .loop

.asm_16447
	cp 23 ; within one hour of 23:00?
	jr nz, .loop
	; fallthrough

.LostBooklet
	call Function164ea
	bccoord 1, 14
	ld hl, UnknownText_0x164f4
	call PlaceWholeStringInBoxAtOnce
	call YesNoBox
	ret c
	call Function164ea
	bccoord 1, 14
	ld hl, LostInstructionBookletText
	call PlaceWholeStringInBoxAtOnce
	ret

.loop
	call Function164ea
	bccoord 1, 14
	ld a, [wDST]
	bit 7, a
	jr z, .asm_16497
	ld hl, UnknownText_0x16508
	call PlaceWholeStringInBoxAtOnce
	call YesNoBox
	ret c
	ld a, [wDST]
	res 7, a
	ld [wDST], a
	call Function164d1
	call Function164ea
	bccoord 1, 14
	ld hl, UnknownText_0x1650d
	call PlaceWholeStringInBoxAtOnce
	ret

.asm_16497
	ld hl, UnknownText_0x164fe
	call PlaceWholeStringInBoxAtOnce
	call YesNoBox
	ret c
	ld a, [wDST]
	set 7, a
	ld [wDST], a
	call Function164b9
	call Function164ea
	bccoord 1, 14
	ld hl, UnknownText_0x16503
	call PlaceWholeStringInBoxAtOnce
	ret
; 164b9

Function164b9: ; 164b9
	ld a, [StartHour]
	add 1
	sub 24
	jr nc, .asm_164c4
	add 24
.asm_164c4
	ld [StartHour], a
	ccf
	ld a, [StartDay]
	adc 0
	ld [StartDay], a
	ret
; 164d1

Function164d1: ; 164d1
	ld a, [StartHour]
	sub 1
	jr nc, .asm_164da
	add 24
.asm_164da
	ld [StartHour], a
	ld a, [StartDay]
	sbc 0
	jr nc, .asm_164e6
	add 7
.asm_164e6
	ld [StartDay], a
	ret
; 164ea

Function164ea: ; 164ea
	hlcoord 1, 14
	ld bc, $0312
	call ClearBox
	ret
; 164f4

UnknownText_0x164f4: ; 0x164f4
	; Do you want to adjust your clock for Daylight Saving Time?
	text_jump UnknownText_0x1c6095
	db "@"
; 0x164f9

LostInstructionBookletText: ; 0x164f9
	; I lost the instruction booklet for the POKéGEAR.
	; Come back again in a while.
	text_jump UnknownText_0x1c60d1
	db "@"
; 0x164fe

UnknownText_0x164fe: ; 0x164fe
	; Do you want to switch to Daylight Saving Time?
	text_jump UnknownText_0x1c6000
	db "@"
; 0x16503

UnknownText_0x16503: ; 0x16503
	; I set the clock forward by one hour.
	text_jump UnknownText_0x1c6030
	db "@"
; 0x16508

UnknownText_0x16508: ; 0x16508
	; Is Daylight Saving Time over?
	text_jump UnknownText_0x1c6056
	db "@"
; 0x1650d

UnknownText_0x1650d: ; 0x1650d
	; I put the clock back one hour.
	text_jump UnknownText_0x1c6075
	db "@"
; 0x16512

Function16512: ; 16512
	ld de, String_1669f
	jr Function1651a

Function16517: ; 16517
	ld de, String_166a8

Function1651a: ; 1651a
	push de
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 6, 18
	call TextBox
	hlcoord 1, 2
	ld de, String_16699
	call PlaceString
	hlcoord 12, 2
	ld de, wd851
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 1, 4
	ld de, String_166b0
	call PlaceString
	hlcoord 12, 4
	ld de, Money
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 1, 6
	pop de
	call PlaceString
	hlcoord 12, 6
	ld de, StringBuffer2
	lb bc, PRINTNUM_MONEY | PRINTNUM_LEADINGZEROS | 3, 6
	call PrintNum
	call UpdateSprites
	call Function3238
	ret
; 1656b

Function1656b: ; 1656b
	ld c, 10
	call DelayFrames
	ret
; 16571

Function16571: ; 16571
.loop
	call Functiona57
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call .dpadaction
	xor a
	ld [hBGMapMode], a
	hlcoord 12, 6
	ld bc, 7
	ld a, " "
	call ByteFill
	hlcoord 12, 6
	ld de, StringBuffer2
	lb bc, PRINTNUM_MONEY | PRINTNUM_LEADINGZEROS | 3, 6
	call PrintNum
	ld a, [$ff9b]
	and $10
	jr nz, .skip
	hlcoord 13, 6
	ld a, [wMomBankDigitCursorPosition]
	ld c, a
	ld b, 0
	add hl, bc
	ld [hl], " "

.skip
	call WaitBGMap
	jr .loop

.pressedB
	scf
	ret

.pressedA
	and a
	ret
; 165b9

.dpadaction: ; 165b9
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .incrementdigit
	ld a, [hl]
	and D_DOWN
	jr nz, .decrementdigit
	ld a, [hl]
	and D_LEFT
	jr nz, .movecursorleft
	ld a, [hl]
	and D_RIGHT
	jr nz, .movecursorright
	and a
	ret

.movecursorleft
	ld hl, wMomBankDigitCursorPosition
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret

.movecursorright
	ld hl, wMomBankDigitCursorPosition
	ld a, [hl]
	cp 5
	ret nc
	inc [hl]
	ret

.incrementdigit
	ld hl, .DigitQuantities
	call .getdigitquantity
	ld c, l
	ld b, h
	ld de, StringBuffer2
	callba GiveMoney
	ret

.decrementdigit
	ld hl, .DigitQuantities
	call .getdigitquantity
	ld c, l
	ld b, h
	ld de, StringBuffer2
	callba TakeMoney
	ret
; 16607

.getdigitquantity: ; 16607
	ld a, [wMomBankDigitCursorPosition]
	push de
	ld e, a
	ld d, 0
rept 3
	add hl, de
endr
	pop de
	ret
; 16613

.DigitQuantities: ; 16613
	dt 100000
	dt 10000
	dt 1000
	dt 100
	dt 10
	dt 1

	dt 100000
	dt 10000
	dt 1000
	dt 100
	dt 10
	dt 1

	dt 900000
	dt 90000
	dt 9000
	dt 900
	dt 90
	dt 9
; 16649

UnknownText_0x16649: ; 0x16649
	; Wow, that's a cute #MON. Where did you get it? … So, you're leaving on an adventure… OK! I'll help too. But what can I do for you? I know! I'll save money for you. On a long journey, money's important. Do you want me to save your money?
	text_jump UnknownText_0x1bd77f
	db "@"
; 0x1664e

UnknownText_0x1664e: ; 0x1664e
	; OK, I'll take care of your money.
	text_jump UnknownText_0x1bd868
	db "@"
; 0x16653

UnknownText_0x16653: ; 0x16653
	; Be careful. #MON are your friends. You need to work as a team. Now, go on!
	text_jump UnknownText_0x1bd88e
	db "@"
; 0x16658

UnknownText_0x16658: ; 0x16658
	; Hi! Welcome home! You're trying very hard, I see. I've kept your room tidy. Or is this about your money?
	text_jump UnknownText_0x1bd8da
	db "@"
; 0x1665d

UnknownText_0x1665d: ; 0x1665d
	; What do you want to do?
	text_jump UnknownText_0x1bd942
	db "@"
; 0x16662

UnknownText_0x16662: ; 0x16662
	; How much do you want to save?
	text_jump UnknownText_0x1bd95b
	db "@"
; 0x16667

UnknownText_0x16667: ; 0x16667
	; How much do you want to take?
	text_jump UnknownText_0x1bd97a
	db "@"
; 0x1666c

UnknownText_0x1666c: ; 0x1666c
	; Do you want to save some money?
	text_jump UnknownText_0x1bd999
	db "@"
; 0x16671

UnknownText_0x16671: ; 0x16671
	; You haven't saved that much.
	text_jump UnknownText_0x1bd9ba
	db "@"
; 0x16676

UnknownText_0x16676: ; 0x16676
	; You can't take that much.
	text_jump UnknownText_0x1bd9d7
	db "@"
; 0x1667b

UnknownText_0x1667b: ; 0x1667b
	; You don't have that much.
	text_jump UnknownText_0x1bd9f1
	db "@"
; 0x16680

UnknownText_0x16680: ; 0x16680
	; You can't save that much.
	text_jump UnknownText_0x1bda0b
	db "@"
; 0x16685

UnknownText_0x16685: ; 0x16685
	; OK, I'll save your money. Trust me! , stick with it!
	text_jump UnknownText_0x1bda25
	db "@"
; 0x1668a

UnknownText_0x1668a: ; 0x1668a
	; Your money's safe here! Get going!
	text_jump UnknownText_0x1bda5b
	db "@"
; 0x1668f

UnknownText_0x1668f: ; 0x1668f
	; , don't give up!
	text_jump UnknownText_0x1bda7e
	db "@"
; 0x16694

UnknownText_0x16694: ; 0x16694
	; Just do what you can.
	text_jump UnknownText_0x1bda90
	db "@"
; 0x16699

String_16699: ; 16699
	db "SAVED@"
; 1669f

String_1669f: ; 1669f
	db "WITHDRAW@"
; 166a8

String_166a8: ; 166a8
	db "DEPOSIT@"
; 166b0

String_166b0: ; 166b0
	db "HELD@"
; 166b5

MenuDataHeader_0x166b5: ; 0x166b5
	db $40 ; flags
	db 00, 00 ; start coords
	db 10, 10 ; end coords
	dw MenuData2_0x166bd
	db 1 ; default option
; 0x166bd

MenuData2_0x166bd: ; 0x166bd
	db $80 ; flags
	db 4 ; items
	db "GET@"
	db "SAVE@"
	db "CHANGE@"
	db "CANCEL@"
; 0x166d6
