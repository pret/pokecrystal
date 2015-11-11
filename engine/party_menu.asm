SelectMonFromParty: ; 50000
	call DisableSpriteUpdates
	xor a
	ld [PartyMenuActionText], a
	call WhiteBGMap
	call Function5003f
	call WaitBGMap
	call Function32f9
	call DelayFrame
	call PartyMenuSelect
	call Function2b74
	ret
; 5001d


Function5001d: ; 5001d
	ld a, b
	ld [PartyMenuActionText], a
	call DisableSpriteUpdates
	call WhiteBGMap
	call Function5003f
	call WaitBGMap
	ld b, $a
	call GetSGBLayout
	call Function32f9
	call DelayFrame
	call PartyMenuSelect
	call Function2b74
	ret
; 5003f

Function5003f: ; 5003f
	call Function5004f
	call Function50405
	call Function503e0
	call WritePartyMenuTilemap
	call PrintPartyMenuText
	ret
; 5004f

Function5004f: ; 5004f
	call LoadFontsBattleExtra
	callab Function8ad1 ; engine/color.asm
	callab InefficientlyClear121BytesAtwc300
	ret
; 5005f


WritePartyMenuTilemap: ; 0x5005f
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl] ; Disable text delay
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill ; blank the tilemap
	call Function50396 ; This reads from a pointer table???
.loop
	ld a, [hli]
	cp -1
	jr z, .asm_50084 ; 0x5007a $8
	push hl
	ld hl, .jumptable
	rst JumpTable
	pop hl
	jr .loop ; 0x50082 $f3

.asm_50084
	pop af
	ld [Options], a
	ret
; 0x50089

.jumptable: ; 50089
	dw .displaynicks ; 0
	dw .drawhpbars ; 1
	dw Function50138 ; 2
	dw Function50176 ; 3
	dw Function501b2 ; 4
	dw Function501e0 ; 5
	dw Function5022f ; 6
	dw Function502b1 ; 7
	dw Function50307 ; 8
; 5009b

.displaynicks: ; 5009b
	hlcoord 3, 1
	ld a, [PartyCount]
	and a
	jr z, .done
	ld c, a
	ld b, $0
.loop2
	push bc
	push hl
	push hl
	ld hl, PartyMonNicknames
	ld a, b
	call GetNick
	pop hl
	call PlaceString
	pop hl
	ld de, $0028
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop2

.done
rept 2
	dec hl
endr
	ld de, .cancelstring
	call PlaceString
	ret
; 500c8

.cancelstring: ; 500c8
	db "CANCEL@"
; 500cf


.drawhpbars: ; 500cf
	xor a
	ld [wcda9], a
	ld a, [PartyCount]
	and a
	ret z
	ld c, a
	ld b, $0
	hlcoord 11, 2
.loop3
	push bc
	push hl
	call Function50389
	jr z, .skip
	push hl
	call _fillhpbar
	pop hl
	ld d, 6
	ld b, 0
	call DrawHPBar
	ld hl, wcd9b
	ld a, [wcda9]
	ld c, a
	ld b, $0
	add hl, bc
	call SetHPPal
	ld b, $fc
	call GetSGBLayout

.skip
	ld hl, wcda9
	inc [hl]
	pop hl
	ld de, $0028
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop3
	ld b, $a
	call GetSGBLayout
	ret
; 50117

_fillhpbar: ; 50117
	ld a, b
	ld bc, PartyMon2 - PartyMon1
	ld hl, PartyMon1HP
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .notfainted
	xor a
	ld e, a
	ld c, a
	ret

.notfainted
	dec hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	predef ComputeHPBarLength
	ret
; 50138

Function50138: ; 50138
	ld a, [PartyCount]
	and a
	ret z
	ld c, a
	ld b, $0
	hlcoord 13, 1
.asm_50143
	push bc
	push hl
	call Function50389
	jr z, .asm_5016b
	push hl
	ld a, b
	ld bc, PartyMon2 - PartyMon1
	ld hl, PartyMon1HP
	call AddNTimes
	ld e, l
	ld d, h
	pop hl
	push de
	lb bc, 2, 3
	call PrintNum
	pop de
	ld a, $f3
	ld [hli], a
rept 2
	inc de
endr
	lb bc, 2, 3
	call PrintNum

.asm_5016b
	pop hl
	ld de, $0028
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .asm_50143
	ret
; 50176

Function50176: ; 50176
	ld a, [PartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 8, 2
.asm_50181
	push bc
	push hl
	call Function50389
	jr z, .asm_501a7
	push hl
	ld a, b
	ld bc, PartyMon2 - PartyMon1
	ld hl, PartyMon1Level
	call AddNTimes
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	cp 100 ; This is distinct from MAX_LEVEL.
	jr nc, .asm_501a1
	ld a, "<LV>"
	ld [hli], a
	ld bc, $4102
.asm_501a1
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum

.asm_501a7
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .asm_50181
	ret
; 501b2

Function501b2: ; 501b2
	ld a, [PartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 5, 2
.asm_501bd
	push bc
	push hl
	call Function50389
	jr z, .asm_501d5
	push hl
	ld a, b
	ld bc, PartyMon2 - PartyMon1
	ld hl, PartyMon1Status
	call AddNTimes
	ld e, l
	ld d, h
	pop hl
	call Function50d0a

.asm_501d5
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .asm_501bd
	ret
; 501e0

Function501e0: ; 501e0
	ld a, [PartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 12, 2
.asm_501eb
	push bc
	push hl
	call Function50389
	jr z, .asm_5020a
	push hl
	ld hl, PartySpecies
	ld e, b
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [CurPartySpecies], a
	predef CanLearnTMHMMove
	pop hl
	call Function50215
	call PlaceString

.asm_5020a
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .asm_501eb
	ret
; 50215

Function50215: ; 50215
	ld a, c
	and a
	jr nz, .asm_5021d
	ld de, String_50226
	ret

.asm_5021d
	ld de, String_50221
	ret
; 50221

String_50221: ; 50221
	db "ABLE@"
; 50226

String_50226: ; 50226
	db "NOT ABLE@"
; 5022f


Function5022f: ; 5022f
	ld a, [PartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 12, 2
.asm_5023a
	push bc
	push hl
	call Function50389
	jr z, .asm_5025d
	push hl
	ld a, b
	ld bc, PartyMon2 - PartyMon1
	ld hl, PartyMon1Species
	call AddNTimes
	ld a, [hl]
	dec a
	ld e, a
	ld d, 0
	ld hl, EvosAttacksPointers
rept 2
	add hl, de
endr
	call Function50268
	pop hl
	call PlaceString

.asm_5025d
	pop hl
	ld de, $0028
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .asm_5023a
	ret
; 50268

Function50268: ; 50268
	ld de, StringBuffer1
	ld a, BANK(EvosAttacksPointers)
	ld bc, 2
	call FarCopyBytes
	ld hl, StringBuffer1
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
	ld a, BANK(EvosAttacks)
	ld bc, $a
	call FarCopyBytes
	ld hl, StringBuffer1
.asm_50287
	ld a, [hli]
	and a
	jr z, .asm_5029f
rept 2
	inc hl
endr
	cp EVOLVE_ITEM
	jr nz, .asm_50287
rept 2
	dec hl
endr
	ld a, [CurItem]
	cp [hl]
rept 2
	inc hl
endr
	jr nz, .asm_50287
	ld de, String_502a3
	ret

.asm_5029f
	ld de, String_502a8
	ret
; 502a3

String_502a3: ; 502a3
	db "ABLE@"
; 502a8
String_502a8: ; 502a8
	db "NOT ABLE@"
; 502b1


Function502b1: ; 502b1
	ld a, [PartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 12, 2
.asm_502bc
	push bc
	push hl
	call Function50389
	jr z, .asm_502e3
	ld [CurPartySpecies], a
	push hl
	ld a, b
	ld [CurPartyMon], a
	xor a
	ld [MonType], a
	call GetGender
	ld de, String_502fe
	jr c, .asm_502df
	ld de, String_502ee
	jr nz, .asm_502df
	ld de, String_502f5

.asm_502df
	pop hl
	call PlaceString

.asm_502e3
	pop hl
	ld de, $0028
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .asm_502bc
	ret
; 502ee

String_502ee: ; 502ee
	db "♂…MALE@"
; 502f5

String_502f5: ; 502f5
	db "♀…FEMALE@"
; 502fe

String_502fe: ; 502fe
	db "…UNKNOWN@"
; 50307


Function50307: ; 50307
	ld a, [PartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 12, 1
.asm_50312
	push bc
	push hl
	ld de, String_50372
	call PlaceString
	pop hl
	ld de, $0028
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .asm_50312
	ld a, l
	ld e, $b
	sub e
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	ld de, String_50379
	call PlaceString
	ld b, $3
	ld c, $0
	ld hl, wd002
	ld a, [hl]
.asm_5033b
	push hl
	push bc
	hlcoord 12, 1
.asm_50340
	and a
	jr z, .asm_5034a
	ld de, $0028
	add hl, de
	dec a
	jr .asm_50340

.asm_5034a
	ld de, String_5036b
	push hl
	call PlaceString
	pop hl
	pop bc
	push bc
	push hl
	ld a, c
	ld hl, Strings_50383
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	pop bc
	pop hl
	inc hl
	ld a, [hl]
	inc c
	dec b
	ret z
	jr .asm_5033b
; 5036b

String_5036b: ; 5036b
	db " ばんめ  @" ; Place
; 50372
String_50372: ; 50372
	db "さんかしない@" ; Cancel
; 50379
String_50379: ; 50379
	db "けってい  やめる@" ; Quit
; 50383
Strings_50383: ; 50383
	db "1@", "2@", "3@" ; 1st, 2nd, 3rd
; 50389


Function50389: ; 50389
	ld a, PartySpecies % $100
	add b
	ld e, a
	ld a, PartySpecies / $100
	adc 0
	ld d, a
	ld a, [de]
	cp EGG
	ret
; 50396

Function50396: ; 50396
	ld a, [PartyMenuActionText]
	and $f0
	jr nz, .override
	ld a, [PartyMenuActionText]
	and $f
	ld e, a
	ld d, 0
	ld hl, .selectmonmenuoptions
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.override
	ld hl, .default
	ret
; 503b2

.selectmonmenuoptions: ; 503b2
	dw .default
	dw .default
	dw .default
	dw .unknown1
	dw .default
	dw .unknown2
	dw .trade
	dw .trade
	dw .default
	dw .unknown3
; 503c6

.default: db 0, 1, 2, 3, 4, -1
.unknown1: db 0, 5, 3, 4, -1
.unknown2: db 0, 6, 3, 4, -1
.trade: db 0, 7, 3, 4, -1
.unknown3: db 0, 8, 3, 4, -1
; 503e0

Function503e0: ; 503e0
	ld hl, PartyCount
	ld a, [hli]
	and a
	ret z
	ld c, a
	xor a
	ld [hConnectedMapWidth], a
.asm_503ea
	push bc
	push hl
	ld hl, Function8e83f
	ld a, BANK(Function8e83f)
	ld e, $0
	rst FarCall
	ld a, [hConnectedMapWidth]
	inc a
	ld [hConnectedMapWidth], a
	pop hl
	pop bc
	dec c
	jr nz, .asm_503ea
	callab Function8cf69
	ret
; 50405
Function50405: ; 50405
	xor a
	ld [wd0e3], a
	ld de, Unknown_5044f
	call Function1bb1
	ld a, [PartyCount]
	inc a
	ld [wcfa3], a
	dec a
	ld b, a
	ld a, [wd0d8]
	and a
	jr z, .asm_50422
	inc b
	cp b
	jr c, .asm_50424

.asm_50422
	ld a, $1

.asm_50424
	ld [wcfa9], a
	ld a, $3
	ld [wcfa8], a
	ret
; 5042d

Function5042d: ; 0x5042d
	ld de, Unknown_5044f
	call Function1bb1
	ld a, [PartyCount]
	ld [wcfa3], a
	ld b, a
	ld a, [wd0d8]
	and a
	jr z, .asm_50444
	inc b
	cp b
	jr c, .asm_50446
.asm_50444
	ld a, $1
.asm_50446
	ld [wcfa9], a
	ld a, $3
	ld [wcfa8], a
	ret
; 5044f (14:444f)

Unknown_5044f: ; 5044f
; cursor y
; cursor x
; list length
; ?
; bit 6: animate sprites  bit 5: wrap around
; ?
; distance between items (hi: y, lo: x)
; allowed buttons (mask)
	db $01, $00, $00, $01, $60, $00, $20, $00
; 50457

PartyMenuSelect: ; 0x50457
; sets carry if exitted menu.
	call Function1bc9
	call Function1bee
	ld a, [PartyCount]
	inc a
	ld b, a
	ld a, [wcfa9] ; menu selection?
	cp b
	jr z, .exitmenu ; CANCEL
	ld [wd0d8], a
	ld a, [hJoyLast]
	ld b, a
	bit 1, b
	jr nz, .exitmenu ; B button?
	ld a, [wcfa9]
	dec a
	ld [CurPartyMon], a
	ld c, a
	ld b, $0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [CurPartySpecies], a

	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	and a
	ret

.exitmenu
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	scf
	ret
; 0x5049a


PrintPartyMenuText: ; 5049a
	hlcoord 0, 14
	ld bc, $0212
	call TextBox
	ld a, [PartyCount]
	and a
	jr nz, .haspokemon
	ld de, YouHaveNoPKMNString
	jr .gotstring
.haspokemon ; 504ae
	ld a, [PartyMenuActionText]
	and $f ; drop high nibble
	ld hl, PartyMenuStrings
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
.gotstring ; 504be
	ld a, [Options]
	push af
	set 4, a ; disable text delay
	ld [Options], a
	hlcoord 1, 16 ; Coord
	call PlaceString
	pop af
	ld [Options], a
	ret
; 0x504d2

PartyMenuStrings: ; 0x504d2
	dw ChooseAMonString
	dw UseOnWhichPKMNString
	dw WhichPKMNString
	dw TeachWhichPKMNString
	dw MoveToWhereString
	dw UseOnWhichPKMNString
	dw ChooseAMonString ; Probably used to be ChooseAFemalePKMNString
	dw ChooseAMonString ; Probably used to be ChooseAMalePKMNString
	dw ToWhichPKMNString

ChooseAMonString: ; 0x504e4
	db "Choose a #MON.@"
UseOnWhichPKMNString: ; 0x504f3
	db "Use on which <PK><MN>?@"
WhichPKMNString: ; 0x50504
	db "Which <PK><MN>?@"
TeachWhichPKMNString: ; 0x5050e
	db "Teach which <PK><MN>?@"
MoveToWhereString: ; 0x5051e
	db "Move to where?@"
ChooseAFemalePKMNString: ; 0x5052d  ; UNUSED
	db "Choose a ♀<PK><MN>.@"
ChooseAMalePKMNString: ; 0x5053b    ; UNUSED
	db "Choose a ♂<PK><MN>.@"
ToWhichPKMNString: ; 0x50549
	db "To which <PK><MN>?@"

YouHaveNoPKMNString: ; 0x50556
	db "You have no <PK><MN>!@"


Function50566: ; 50566
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	ld a, [PartyMenuActionText]
	and $f
	ld hl, Unknown_5057b
	call Function505c1
	ret
; 5057b

Unknown_5057b: ; 5057b
	dw UnknownText_0x50594
	dw UnknownText_0x5059e
	dw UnknownText_0x505a3
	dw UnknownText_0x505a8
	dw UnknownText_0x50599
	dw UnknownText_0x5058f
	dw UnknownText_0x505ad
	dw UnknownText_0x505b2
	dw UnknownText_0x505b7
	dw UnknownText_0x505bc
; 5058f

UnknownText_0x5058f: ; 0x5058f
	; recovered @ HP!
	text_jump UnknownText_0x1bc0a2
	db "@"
; 0x50594

UnknownText_0x50594: ; 0x50594
	; 's cured of poison.
	text_jump UnknownText_0x1bc0bb
	db "@"
; 0x50599

UnknownText_0x50599: ; 0x50599
	; 's rid of paralysis.
	text_jump UnknownText_0x1bc0d2
	db "@"
; 0x5059e

UnknownText_0x5059e: ; 0x5059e
	; 's burn was healed.
	text_jump UnknownText_0x1bc0ea
	db "@"
; 0x505a3

UnknownText_0x505a3: ; 0x505a3
	; was defrosted.
	text_jump UnknownText_0x1bc101
	db "@"
; 0x505a8

UnknownText_0x505a8: ; 0x505a8
	; woke up.
	text_jump UnknownText_0x1bc115
	db "@"
; 0x505ad

UnknownText_0x505ad: ; 0x505ad
	; 's health returned.
	text_jump UnknownText_0x1bc123
	db "@"
; 0x505b2

UnknownText_0x505b2: ; 0x505b2
	; is revitalized.
	text_jump UnknownText_0x1bc13a
	db "@"
; 0x505b7

UnknownText_0x505b7: ; 0x505b7
	; grew to level @ !@ @
	text_jump UnknownText_0x1bc14f
	db "@"
; 0x505bc

UnknownText_0x505bc: ; 0x505bc
	; came to its senses.
	text_jump UnknownText_0x1bc16e
	db "@"
; 0x505c1

Function505c1: ; 505c1
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [Options]
	push af
	set 4, a
	ld [Options], a
	call PrintText
	pop af
	ld [Options], a
	ret
; 505da
