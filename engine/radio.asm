PlayRadioShow: ; b8612
; If we're already in the radio program proper, we don't need to be here.
	ld a, [wd002]
	cp 8
	jr nc, .ok
; If Team Rocket is not occupying the radio tower, we don't need to be here.
	ld a, [StatusFlags2]
	bit 0, a ; checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	jr z, .ok
; If we're in Kanto, we don't need to be here.
	call IsInJohto
	and a
	jr nz, .ok
; Team Rocket broadcasts on all stations.
	ld a, 7
	ld [wd002], a
.ok
; Jump to the currently loaded station.  The index to which we need to jump is in wd002.
	ld a, [wd002]
	ld e, a
	ld d, 0
	ld hl, RadioJumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

RadioJumptable: ; b863a (2e:463a)
	dw OaksPkmnTalk1  ; $00
	dw PokedexShow1 ; $01
	dw BenMonMusic1  ; $02
	dw LuckyNumberShow1 ; $03
	dw BuenasPassword1 ; $04
	dw PeoplePlaces1 ; $05
	dw FernMonMusic1 ; $06
	dw RocketRadio1 ; $07
	dw PokeFluteRadio ; $08
	dw EvolutionRadio ; $09
	dw UnownRadio ; $0a
; OaksPkmnTalk
	dw OaksPkmnTalk2  ; $0b
	dw OaksPkmnTalk3  ; $0c
	dw OaksPkmnTalk4  ; $0d
	dw OaksPkmnTalk5  ; $0e
	dw OaksPkmnTalk6  ; $0f
	dw OaksPkmnTalk7  ; $10
	dw OaksPkmnTalk8  ; $11
	dw OaksPkmnTalk9  ; $12
	dw OaksPkmnTalk10 ; $13
	dw OaksPkmnTalk11 ; $14
	dw OaksPkmnTalk12 ; $15
	dw OaksPkmnTalk13 ; $16
; Ben Music
	dw BenMonMusic2  ; $17
	dw BenMonMusic3  ; $18
	dw BenFernMusic4 ; $19
	dw BenFernMusic5 ; $1a
	dw BenFernMusic6 ; $1b
	dw BenFernMusic7 ; $1c
	dw FernMonMusic2 ; $1d
; Lucky Number Show
	dw LuckyNumberShow2 ; $1e
	dw LuckyNumberShow3 ; $1f
	dw LuckyNumberShow4 ; $20
	dw LuckyNumberShow5 ; $21
	dw LuckyNumberShow6 ; $22
	dw LuckyNumberShow7 ; $23
	dw LuckyNumberShow8 ; $24
	dw LuckyNumberShow9 ; $25
	dw LuckyNumberShow10 ; $26
	dw LuckyNumberShow11 ; $27
	dw LuckyNumberShow12 ; $28
	dw LuckyNumberShow13 ; $29
	dw LuckyNumberShow14 ; $2a
	dw LuckyNumberShow15 ; $2b
	dw LuckyNumberShow16 ; $2c
	dw LuckyNumberShow17 ; $2d
	dw LuckyNumberShow18 ; $2e
	dw LuckyNumberShow19 ; $2f
	dw LuckyNumberShow20 ; $30
	dw LuckyNumberShow21 ; $31
; Rocket Radio
	dw RocketRadio2 ; $32
	dw RocketRadio3 ; $33
	dw RocketRadio4 ; $34
	dw RocketRadio5 ; $35
	dw RocketRadio6 ; $36
	dw RocketRadio7 ; $37
	dw RocketRadio8 ; $38
	dw RocketRadio9 ; $39
	dw RocketRadio10 ; $3a
; More Pokemon Channel stuff
	dw OaksPkmnTalk14 ; $3b
	dw OaksPkmnTalk15 ; $3c
	dw OaksPkmnTalk16 ; $3d
	dw OaksPkmnTalk17 ; $3e
	dw OaksPkmnTalk18 ; $3f
; Buenas Password
	dw BuenasPassword2 ; $40
	dw BuenasPassword3 ; $41
	dw BuenasPassword4 ; $42
	dw BuenasPassword5 ; $43
	dw BuenasPassword6 ; $44
	dw BuenasPassword7 ; $45
	dw BuenasPassword8 ; $46
	dw BuenasPassword9 ; $47
	dw BuenasPassword10 ; $48
	dw BuenasPassword11 ; $49
	dw BuenasPassword12 ; $4a
	dw BuenasPassword13 ; $4b
	dw BuenasPassword14 ; $4c
	dw BuenasPassword15 ; $4d
	dw BuenasPassword16 ; $4e
	dw BuenasPassword17 ; $4f
	dw BuenasPassword18 ; $50
	dw BuenasPassword19 ; $51
	dw BuenasPassword20 ; $52
	dw BuenasPassword21 ; $53
	dw RadioScroll ; $54
; More Pokemon Channel stuff
	dw OaksPkmnTalk19 ; $55
	dw OaksPkmnTalk20 ; $56
	dw OaksPkmnTalk21 ; $57


PrintRadioLine: ; b86ea (2e:46ea)
	ld [wd003], a
	ld hl, wd00c
	ld a, [wd005]
	cp $2
	jr nc, .print
	inc hl
	ld [hl], $0
	inc a
	ld [wd005], a
	cp $2
	jr nz, .print
	bccoord 1, 16
	call PlaceWholeStringInBoxAtOnce
	jr .skip
.print
	call PrintTextBoxText
.skip
	ld a, $54
	ld [wd002], a
	ld a, $64
	ld [wd004], a
	ret
; b8718 (2e:4718)

Functionb8718: ; b8718
	push hl
	ld b, SCREEN_WIDTH * 2
.greater_than_10
	ld a, [hl]
	cp "."
	jr nz, .next
	ld [hl], " "

.next
	inc hl
	dec b
	jr nz, .greater_than_10
	pop hl
	ret
; b8728

RadioScroll: ; b8728 (2e:4728)
	ld hl, wd004
	ld a, [hl]
	and a
	jr z, .proceed
	dec [hl]
	ret
.proceed
	ld a, [wd003]
	ld [wd002], a
	ld a, [wd005]
	cp 1
	call nz, CopyBottomLineToTopLine
	jp ClearBottomLine

OaksPkmnTalk1: ; b8742 (2e:4742)
	ld a, $5
	ld [wd006], a
	call StartRadioStation
	ld hl, UnknownText_0xb8820
	ld a, $b
	jp NextRadioLine

OaksPkmnTalk2: ; b8752 (2e:4752)
	ld hl, UnknownText_0xb8825
	ld a, $c
	jp NextRadioLine

OaksPkmnTalk3: ; b875a (2e:475a)
	ld hl, UnknownText_0xb882a
	ld a, $d
	jp NextRadioLine

OaksPkmnTalk4: ; b8762 (2e:4762)
; Choose a random root, and a random Pokemon from that route.
	call Random
	and $1f
	cp $f
	jr nc, OaksPkmnTalk4
	ld hl, Unknown_b87f2
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld b, [hl]
	inc hl
	ld c, [hl]
	push bc

	ld hl, JohtoGrassWildMons
.greater_than_10
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp -1
	jr z, .done2
	inc hl
	cp b
	jr nz, .next
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp c
	jr z, .done
.next
	dec hl
	ld de, $2f
	add hl, de
	jr .greater_than_10

.done
rept 4
	inc hl
endr

.both_bits_set
	call Random
	and 3
	cp 3
	jr z, .both_bits_set

	ld bc, $e
	call AddNTimes
.greater_than_102
	call Random
	and 7
	cp 2
	jr c, .greater_than_102
	cp 5
	jr nc, .greater_than_102
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	inc hl
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	ld [wd265], a
	ld [CurPartySpecies], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wd050
	ld bc, $b
	call CopyBytes

	pop bc
	call GetWorldMapLocation
	ld e, a
	callba GetLandmarkName
	ld hl, UnknownText_0xb882f
	call CopyRadioTextToRAM
	ld a, $e
	jp PrintRadioLine

.done2
	pop bc
	ld a, $0
	jp PrintRadioLine
; b87f2 (2e:47f2)

Unknown_b87f2: ; b87f2
	map ROUTE_29
	map ROUTE_46
	map ROUTE_30
	map ROUTE_32
	map ROUTE_34
	map ROUTE_35
	map ROUTE_37
	map ROUTE_38
	map ROUTE_39
	map ROUTE_42
	map ROUTE_43
	map ROUTE_44
	map ROUTE_45
	map ROUTE_36
	map ROUTE_31
; b8810

OaksPkmnTalk5: ; b8810 (2e:4810)
	ld hl, UnknownText_0xb8834
	ld a, $f
	jp NextRadioLine

OaksPkmnTalk6: ; b8818 (2e:4818)
	ld hl, UnknownText_0xb8839
	ld a, $10
	jp NextRadioLine
; b8820 (2e:4820)

UnknownText_0xb8820: ; 0xb8820
	; MARY: PROF.OAK'S
	text_jump UnknownText_0x1bc81a
	db "@"
; 0xb8825

UnknownText_0xb8825: ; 0xb8825
	; #MON TALK!
	text_jump UnknownText_0x1bc82d
	db "@"
; 0xb882a

UnknownText_0xb882a: ; 0xb882a
	; With me, MARY!
	text_jump UnknownText_0x1bc83a
	db "@"
; 0xb882f

UnknownText_0xb882f: ; 0xb882f
	; OAK: @ @
	text_jump UnknownText_0x1bc84b
	db "@"
; 0xb8834

UnknownText_0xb8834: ; 0xb8834
	; may be seen around
	text_jump UnknownText_0x1bc858
	db "@"
; 0xb8839

UnknownText_0xb8839: ; 0xb8839
	; @ .
	text_jump UnknownText_0x1bc86d
	db "@"
; 0xb883e

OaksPkmnTalk7: ; b883e (2e:483e)
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, UnknownText_0xb884f
	ld a, $11
	jp NextRadioLine
; b884f (2e:484f)

UnknownText_0xb884f: ; 0xb884f
	; MARY: @ 's
	text_jump UnknownText_0x1bc876
	db "@"
; 0xb8854

OaksPkmnTalk8: ; b8854 (2e:4854)
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, Unknown_b8869
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $12
	jp NextRadioLine
; b8869 (2e:4869)

Unknown_b8869: ; b8869
	dw UnknownText_0xb8889
	dw UnknownText_0xb888e
	dw UnknownText_0xb8893
	dw UnknownText_0xb8898
	dw UnknownText_0xb889d
	dw UnknownText_0xb88a2
	dw UnknownText_0xb88a7
	dw UnknownText_0xb88ac
	dw UnknownText_0xb88b1
	dw UnknownText_0xb88b6
	dw UnknownText_0xb88bb
	dw UnknownText_0xb88c0
	dw UnknownText_0xb88c5
	dw UnknownText_0xb88ca
	dw UnknownText_0xb88cf
	dw UnknownText_0xb88d4
; b8889

UnknownText_0xb8889: ; 0xb8889
	; sweet and adorably
	text_jump UnknownText_0x1bc885
	db "@"
; 0xb888e

UnknownText_0xb888e: ; 0xb888e
	; wiggly and slickly
	text_jump UnknownText_0x1bc89a
	db "@"
; 0xb8893

UnknownText_0xb8893: ; 0xb8893
	; aptly named and
	text_jump UnknownText_0x1bc8af
	db "@"
; 0xb8898

UnknownText_0xb8898: ; 0xb8898
	; undeniably kind of
	text_jump UnknownText_0x1bc8c1
	db "@"
; 0xb889d

UnknownText_0xb889d: ; 0xb889d
	; so, so unbearably
	text_jump UnknownText_0x1bc8d6
	db "@"
; 0xb88a2

UnknownText_0xb88a2: ; 0xb88a2
	; wow, impressively
	text_jump UnknownText_0x1bc8ea
	db "@"
; 0xb88a7

UnknownText_0xb88a7: ; 0xb88a7
	; almost poisonously
	text_jump UnknownText_0x1bc8fe
	db "@"
; 0xb88ac

UnknownText_0xb88ac: ; 0xb88ac
	; ooh, so sensually
	text_jump UnknownText_0x1bc913
	db "@"
; 0xb88b1

UnknownText_0xb88b1: ; 0xb88b1
	; so mischievously
	text_jump UnknownText_0x1bc927
	db "@"
; 0xb88b6

UnknownText_0xb88b6: ; 0xb88b6
	; so very topically
	text_jump UnknownText_0x1bc93a
	db "@"
; 0xb88bb

UnknownText_0xb88bb: ; 0xb88bb
	; sure addictively
	text_jump UnknownText_0x1bc94e
	db "@"
; 0xb88c0

UnknownText_0xb88c0: ; 0xb88c0
	; looks in water is
	text_jump UnknownText_0x1bc961
	db "@"
; 0xb88c5

UnknownText_0xb88c5: ; 0xb88c5
	; evolution must be
	text_jump UnknownText_0x1bc975
	db "@"
; 0xb88ca

UnknownText_0xb88ca: ; 0xb88ca
	; provocatively
	text_jump UnknownText_0x1bc989
	db "@"
; 0xb88cf

UnknownText_0xb88cf: ; 0xb88cf
	; so flipped out and
	text_jump UnknownText_0x1bc999
	db "@"
; 0xb88d4

UnknownText_0xb88d4: ; 0xb88d4
	; heart-meltingly
	text_jump UnknownText_0x1bc9ae
	db "@"
; 0xb88d9

OaksPkmnTalk9: ; b88d9 (2e:48d9)
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, Unknown_b88fe
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd006]
	dec a
	ld [wd006], a
	ld a, $d
	jr nz, .nope
	ld a, $5
	ld [wd006], a
	ld a, $3b
.nope
	jp NextRadioLine
; b88fe (2e:48fe)

Unknown_b88fe: ; b88fe
	dw UnknownText_0xb891e
	dw UnknownText_0xb8923
	dw UnknownText_0xb8928
	dw UnknownText_0xb892d
	dw UnknownText_0xb8932
	dw UnknownText_0xb8937
	dw UnknownText_0xb893c
	dw UnknownText_0xb8941
	dw UnknownText_0xb8946
	dw UnknownText_0xb894b
	dw UnknownText_0xb8950
	dw UnknownText_0xb8955
	dw UnknownText_0xb895a
	dw UnknownText_0xb895f
	dw UnknownText_0xb8964
	dw UnknownText_0xb8969
; b891e

UnknownText_0xb891e: ; 0xb891e
	; cute.
	text_jump UnknownText_0x1bc9c0
	db "@"
; 0xb8923

UnknownText_0xb8923: ; 0xb8923
	; weird.
	text_jump UnknownText_0x1bc9c8
	db "@"
; 0xb8928

UnknownText_0xb8928: ; 0xb8928
	; pleasant.
	text_jump UnknownText_0x1bc9d1
	db "@"
; 0xb892d

UnknownText_0xb892d: ; 0xb892d
	; bold, sort of.
	text_jump UnknownText_0x1bc9dd
	db "@"
; 0xb8932

UnknownText_0xb8932: ; 0xb8932
	; frightening.
	text_jump UnknownText_0x1bc9ee
	db "@"
; 0xb8937

UnknownText_0xb8937: ; 0xb8937
	; suave & debonair!
	text_jump UnknownText_0x1bc9fd
	db "@"
; 0xb893c

UnknownText_0xb893c: ; 0xb893c
	; powerful.
	text_jump UnknownText_0x1bca11
	db "@"
; 0xb8941

UnknownText_0xb8941: ; 0xb8941
	; exciting.
	text_jump UnknownText_0x1bca1d
	db "@"
; 0xb8946

UnknownText_0xb8946: ; 0xb8946
	; groovy!
	text_jump UnknownText_0x1bca29
	db "@"
; 0xb894b

UnknownText_0xb894b: ; 0xb894b
	; inspiring.
	text_jump UnknownText_0x1bca33
	db "@"
; 0xb8950

UnknownText_0xb8950: ; 0xb8950
	; friendly.
	text_jump UnknownText_0x1bca40
	db "@"
; 0xb8955

UnknownText_0xb8955: ; 0xb8955
	; hot, hot, hot!
	text_jump UnknownText_0x1bca4c
	db "@"
; 0xb895a

UnknownText_0xb895a: ; 0xb895a
	; stimulating.
	text_jump UnknownText_0x1bca5d
	db "@"
; 0xb895f

UnknownText_0xb895f: ; 0xb895f
	; guarded.
	text_jump UnknownText_0x1bca6c
	db "@"
; 0xb8964

UnknownText_0xb8964: ; 0xb8964
	; lovely.
	text_jump UnknownText_0x1bca77
	db "@"
; 0xb8969

UnknownText_0xb8969: ; 0xb8969
	; speedy.
	text_jump UnknownText_0x1bca81
	db "@"
; 0xb896e

OaksPkmnTalk14: ; b896e (2e:496e)
	callba Function91868
	ld hl, UnknownText_0xb8993
	call PrintText
	call WaitBGMap
	ld hl, UnknownText_0xb898e
	call PrintText
	ld a, $3c
	ld [wd002], a
	ld a, $64
	ld [wd004], a
	ret
; b898e (2e:498e)

UnknownText_0xb898e: ; 0xb898e
	; #MON
	text_jump UnknownText_0x1bca8b
	db "@"
; 0xb8993

UnknownText_0xb8993: ; 0xb8993
	db "@"
; 0xb8994

OaksPkmnTalk15: ; b8994 (2e:4994)
	ld hl, wd004
	dec [hl]
	ret nz
	hlcoord 9, 14
	ld de, String_b89a4
	ld a, $3d
	jp Functionb8a00
; b89a4 (2e:49a4)

String_b89a4:
	db "#MON@"
; b89a9

OaksPkmnTalk16: ; b89a9 (2e:49a9)
	ld hl, wd004
	dec [hl]
	ret nz
	hlcoord 1, 16
	ld de, String_b89b9
	ld a, $3e
	jp Functionb8a00
; b89b9 (2e:49b9)

String_b89b9:
	db "#MON Channel@"
; b89c6

OaksPkmnTalk17: ; b89c6 (2e:49c6)
	ld hl, wd004
	dec [hl]
	ret nz
	hlcoord 12, 16
	ld de, String_b89d6
	ld a, $3f
	jp Functionb8a00
; b89d6 (2e:49d6)

String_b89d6:
	db "@"
; b89d7

OaksPkmnTalk18: ; b89d7 (2e:49d7)
	ld hl, wd004
	dec [hl]
	ret nz
	ld de, $1d
	callab RadioMusicNone
	ld hl, UnknownText_0xb89ff
	call PrintText
	ld a, $d
	ld [wd003], a
	xor a
	ld [wd005], a
	ld a, $54
	ld [wd002], a
	ld a, $a
	ld [wd004], a
	ret
; b89ff (2e:49ff)

UnknownText_0xb89ff: ; 0xb89ff
	db "@"
; 0xb8a00

Functionb8a00: ; b8a00 (2e:4a00)
	ld [wd002], a
	ld a, $64
	ld [wd004], a
	jp PlaceString

CopyBottomLineToTopLine: ; b8a0b (2e:4a0b)
	hlcoord 0, 15
	decoord 0, 13
	ld bc, SCREEN_WIDTH * 2
	jp CopyBytes

ClearBottomLine: ; b8a17 (2e:4a17)
	hlcoord 1, 15
	ld bc, $12
	ld a, " "
	call ByteFill
	hlcoord 1, 16
	ld bc, $12
	ld a, " "
	jp ByteFill

Functionb8a2d: ; b8a2d (2e:4a2d)
	push hl
	push de
	ld a, [CurPartySpecies]
	dec a
	rlca
	rlca
	and 3
	ld hl, .pokedexbanks
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret
; b8a42 (2e:4a42)

.pokedexbanks
	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)
; b8a46

PokedexShow1: ; b8a46 (2e:4a46)
	call StartRadioStation
.asm_b8a49
	call Random
	cp CELEBI
	jr nc, .asm_b8a49
	ld c, a
	push bc
	ld a, c
	call CheckCaughtMon
	pop bc
	jr z, .asm_b8a49
	inc c
	ld a, c
	ld [CurPartySpecies], a
	ld [wd265], a
	call GetPokemonName
	ld hl, UnknownText_0xb8b30
	ld a, $13
	jp NextRadioLine

OaksPkmnTalk10: ; b8a6c (2e:4a6c)
	ld a, [CurPartySpecies]
	dec a
	ld hl, PokedexDataPointerTable
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, BANK(PokedexDataPointerTable)
	call GetFarHalfword
	call Functionb8a2d
	push af
	push hl
	call Functionb8af3
	dec hl
	ld [hl], $57
	ld hl, wd26b
	call CopyRadioTextToRAM
	pop hl
	pop af
	call Functionb8b11
rept 4
	inc hl
endr
	ld a, l
	ld [wd26b], a
	ld a, h
	ld [wd26c], a
	ld a, $14
	jp PrintRadioLine

OaksPkmnTalk11: ; b8aa4 (2e:4aa4)
	call Functionb8ad4
	ld a, $15
	jp PrintRadioLine

OaksPkmnTalk12: ; b8aac (2e:4aac)
	call Functionb8ad4
	ld a, $16
	jp PrintRadioLine

OaksPkmnTalk13: ; b8ab4 (2e:4ab4)
	call Functionb8ad4
	ld a, $55
	jp PrintRadioLine

OaksPkmnTalk19: ; b8abc (2e:4abc)
	call Functionb8ad4
	ld a, $56
	jp PrintRadioLine

OaksPkmnTalk20: ; b8ac4 (2e:4ac4)
	call Functionb8ad4
	ld a, $57
	jp PrintRadioLine

OaksPkmnTalk21: ; b8acc (2e:4acc)
	call Functionb8ad4
	ld a, $1
	jp PrintRadioLine

Functionb8ad4: ; b8ad4 (2e:4ad4)
	ld a, [wd26b]
	ld l, a
	ld a, [wd26c]
	ld h, a
	ld a, [wd26d]
	push af
	push hl
	call Functionb8af3
	dec hl
	ld [hl], $57
	ld hl, wd26b
	call CopyRadioTextToRAM
	pop hl
	pop af
	call Functionb8b11
	ret

Functionb8af3: ; b8af3 (2e:4af3)
	ld de, wd26d
	ld bc, $13
	call FarCopyBytes
	ld hl, wd26b
	ld [hl], $0
	inc hl
	ld [hl], $4f
	inc hl
.asm_b8b05
	ld a, [hli]
	cp $50
	ret z
	cp $4e
	ret z
	cp $5f
	ret z
	jr .asm_b8b05

Functionb8b11: ; b8b11 (2e:4b11)
	ld d, a
.asm_b8b12
	ld a, d
	call GetFarByte
	inc hl
	cp $50
	jr z, .asm_b8b23
	cp $4e
	jr z, .asm_b8b23
	cp $5f
	jr nz, .asm_b8b12
.asm_b8b23
	ld a, l
	ld [wd26b], a
	ld a, h
	ld [wd26c], a
	ld a, d
	ld [wd26d], a
	ret
; b8b30 (2e:4b30)

UnknownText_0xb8b30: ; 0xb8b30
	; @ @
	text_jump UnknownText_0x1bca91
	db "@"
; 0xb8b35

BenMonMusic1: ; b8b35 (2e:4b35)
	call Functionb8b90
	ld hl, UnknownText_0xb8baa
	ld a, $17
	jp NextRadioLine

BenMonMusic2: ; b8b40 (2e:4b40)
	ld hl, UnknownText_0xb8baf
	ld a, $18
	jp NextRadioLine

BenMonMusic3: ; b8b48 (2e:4b48)
	ld hl, UnknownText_0xb8bb4
	ld a, $19
	jp NextRadioLine

FernMonMusic1: ; b8b50 (2e:4b50)
	call Functionb8b90
	ld hl, UnknownText_0xb8bb9
	ld a, $1d
	jp NextRadioLine

FernMonMusic2: ; b8b5b (2e:4b5b)
	ld hl, UnknownText_0xb8bbe
	ld a, $19
	jp NextRadioLine

BenFernMusic4: ; b8b63 (2e:4b63)
	ld hl, UnknownText_0xb8bc3
	ld a, $1a
	jp NextRadioLine

BenFernMusic5: ; b8b6b (2e:4b6b)
	call GetWeekday
	and 1
	ld hl, UnknownText_0xb8bc8
	jr z, .asm_b8b78
	ld hl, UnknownText_0xb8bcd
.asm_b8b78
	ld a, $1b
	jp NextRadioLine

BenFernMusic6: ; b8b7d (2e:4b7d)
	call GetWeekday
	and 1
	ld hl, UnknownText_0xb8bd2
	jr z, .asm_b8b8a
	ld hl, UnknownText_0xb8bd7
.asm_b8b8a
	ld a, $1c
	jp NextRadioLine

BenFernMusic7: ; b8b8f (2e:4b8f)
	ret

Functionb8b90: ; b8b90 (2e:4b90)
	call RadioTerminator
	call PrintText
	ld de, MUSIC_POKEMON_MARCH
	call GetWeekday
	and 1
	jr z, .done
	ld de, MUSIC_POKEMON_LULLABY
.done
	callab RadioMusicNone
	ret
; b8baa (2e:4baa)

UnknownText_0xb8baa: ; 0xb8baa
	; BEN: #MON MUSIC
	text_jump UnknownText_0x1bca99
	db "@"
; 0xb8baf

UnknownText_0xb8baf: ; 0xb8baf
	; CHANNEL!
	text_jump UnknownText_0x1bcaab
	db "@"
; 0xb8bb4

UnknownText_0xb8bb4: ; 0xb8bb4
	; It's me, DJ BEN!
	text_jump UnknownText_0x1bcab6
	db "@"
; 0xb8bb9

UnknownText_0xb8bb9: ; 0xb8bb9
	; FERN: #MUSIC!
	text_jump UnknownText_0x1bcac8
	db "@"
; 0xb8bbe

UnknownText_0xb8bbe: ; 0xb8bbe
	; With DJ FERN!
	text_jump UnknownText_0x1bcad8
	db "@"
; 0xb8bc3

UnknownText_0xb8bc3: ; 0xb8bc3
	; Today's @ ,
	text_jump UnknownText_0x1bcae8
	db "@"
; 0xb8bc8

UnknownText_0xb8bc8: ; 0xb8bc8
	; so let us jam to
	text_jump UnknownText_0x1bcaf6
	db "@"
; 0xb8bcd

UnknownText_0xb8bcd: ; 0xb8bcd
	; so chill out to
	text_jump UnknownText_0x1bcb09
	db "@"
; 0xb8bd2

UnknownText_0xb8bd2: ; 0xb8bd2
	; #MON March!
	text_jump UnknownText_0x1bcb1b
	db "@"
; 0xb8bd7

UnknownText_0xb8bd7: ; 0xb8bd7
	; #MON Lullaby!
	text_jump UnknownText_0x1bcb29
	db "@"
; 0xb8bdc

LuckyNumberShow1: ; b8bdc (2e:4bdc)
	call StartRadioStation
	callab Functionc434
	jr nc, .asm_b8bed
	callab Functionc422
.asm_b8bed
	ld hl, UnknownText_0xb8c7e
	ld a, $1e
	jp NextRadioLine

LuckyNumberShow2: ; b8bf5 (2e:4bf5)
	ld hl, UnknownText_0xb8c83
	ld a, $1f
	jp NextRadioLine

LuckyNumberShow3: ; b8bfd (2e:4bfd)
	ld hl, UnknownText_0xb8c88
	ld a, $20
	jp NextRadioLine

LuckyNumberShow4: ; b8c05 (2e:4c05)
	ld hl, UnknownText_0xb8c8d
	ld a, $21
	jp NextRadioLine

LuckyNumberShow5: ; b8c0d (2e:4c0d)
	ld hl, UnknownText_0xb8c92
	ld a, $22
	jp NextRadioLine

LuckyNumberShow6: ; b8c15 (2e:4c15)
	ld hl, UnknownText_0xb8c97
	ld a, $23
	jp NextRadioLine

LuckyNumberShow7: ; b8c1d (2e:4c1d)
	ld hl, UnknownText_0xb8c9c
	ld a, $24
	jp NextRadioLine

LuckyNumberShow8: ; b8c25 (2e:4c25)
	ld hl, StringBuffer1
	ld de, wdc9f
	ld bc, $8205
	call PrintNum
	ld a, $50
	ld [StringBuffer1 + 5], a
	ld hl, UnknownText_0xb8ca1
	ld a, $25
	jp NextRadioLine

LuckyNumberShow9: ; b8c3e (2e:4c3e)
	ld hl, UnknownText_0xb8ca6
	ld a, $26
	jp NextRadioLine

LuckyNumberShow10: ; b8c46 (2e:4c46)
	ld hl, UnknownText_0xb8c9c
	ld a, $27
	jp NextRadioLine

LuckyNumberShow11: ; b8c4e (2e:4c4e)
	ld hl, UnknownText_0xb8ca1
	ld a, $28
	jp NextRadioLine

LuckyNumberShow12: ; b8c56 (2e:4c56)
	ld hl, UnknownText_0xb8cab
	ld a, $29
	jp NextRadioLine

LuckyNumberShow13: ; b8c5e (2e:4c5e)
	ld hl, UnknownText_0xb8cb0
	call Random
	and a
	ld a, $3
	jr nz, .asm_b8c6b
	ld a, $2a
.asm_b8c6b
	jp NextRadioLine

LuckyNumberShow14: ; b8c6e (2e:4c6e)
	ld hl, UnknownText_0xb8cb5
	ld a, $2b
	jp NextRadioLine

LuckyNumberShow15: ; b8c76 (2e:4c76)
	ld hl, UnknownText_0xb8cba
	ld a, $3
	jp NextRadioLine
; b8c7e (2e:4c7e)

UnknownText_0xb8c7e: ; 0xb8c7e
	; REED: Yeehaw! How
	text_jump UnknownText_0x1bcb39
	db "@"
; 0xb8c83

UnknownText_0xb8c83: ; 0xb8c83
	; y'all doin' now?
	text_jump UnknownText_0x1bcb4d
	db "@"
; 0xb8c88

UnknownText_0xb8c88: ; 0xb8c88
	; Whether you're up
	text_jump UnknownText_0x1bcb60
	db "@"
; 0xb8c8d

UnknownText_0xb8c8d: ; 0xb8c8d
	; or way down low,
	text_jump UnknownText_0x1bcb73
	db "@"
; 0xb8c92

UnknownText_0xb8c92: ; 0xb8c92
	; don't you miss the
	text_jump UnknownText_0x1bcb86
	db "@"
; 0xb8c97

UnknownText_0xb8c97: ; 0xb8c97
	; LUCKY NUMBER SHOW!
	text_jump UnknownText_0x1bcb9a
	db "@"
; 0xb8c9c

UnknownText_0xb8c9c: ; 0xb8c9c
	; This week's Lucky
	text_jump UnknownText_0x1bcbaf
	db "@"
; 0xb8ca1

UnknownText_0xb8ca1: ; 0xb8ca1
	; Number is @ !
	text_jump UnknownText_0x1bcbc2
	db "@"
; 0xb8ca6

UnknownText_0xb8ca6: ; 0xb8ca6
	; I'll repeat that!
	text_jump UnknownText_0x1bcbd6
	db "@"
; 0xb8cab

UnknownText_0xb8cab: ; 0xb8cab
	; Match it and go to
	text_jump UnknownText_0x1bcbe9
	db "@"
; 0xb8cb0

UnknownText_0xb8cb0: ; 0xb8cb0
	; the RADIO TOWER!
	text_jump UnknownText_0x1bcbfe
	db "@"
; 0xb8cb5

UnknownText_0xb8cb5: ; 0xb8cb5
	; …Repeating myself
	text_jump UnknownText_0x1bcc11
	db "@"
; 0xb8cba

UnknownText_0xb8cba: ; 0xb8cba
	; gets to be a drag…
	text_jump UnknownText_0x1bcc25
	db "@"
; 0xb8cbf

PeoplePlaces1: ; b8cbf (2e:4cbf)
	call StartRadioStation
	ld hl, UnknownText_0xb8ce3
	ld a, $2c
	jp NextRadioLine

LuckyNumberShow16: ; b8cca (2e:4cca)
	ld hl, UnknownText_0xb8ce8
	ld a, $2d
	jp NextRadioLine

LuckyNumberShow17: ; b8cd2 (2e:4cd2)
	ld hl, UnknownText_0xb8ced
	call Random
	cp $7b
	ld a, $2e
	jr c, .asm_b8ce0
	ld a, $30
.asm_b8ce0
	jp NextRadioLine
; b8ce3 (2e:4ce3)

UnknownText_0xb8ce3: ; 0xb8ce3
	; PLACES AND PEOPLE!
	text_jump UnknownText_0x1bcc3a
	db "@"
; 0xb8ce8

UnknownText_0xb8ce8: ; 0xb8ce8
	; Brought to you by
	text_jump UnknownText_0x1bcc4f
	db "@"
; 0xb8ced

UnknownText_0xb8ced: ; 0xb8ced
	; me, DJ LILY!
	text_jump UnknownText_0x1bcc63
	db "@"
; 0xb8cf2

LuckyNumberShow18: ; b8cf2 (2e:4cf2)
	call Random
	and " "
	inc a
	cp $43
	jr nc, LuckyNumberShow18
	push af
	ld hl, Unknown_b8d3e
	ld a, [StatusFlags]
	bit 6, a
	jr z, .NotMet
	ld hl, Unknown_b8d43
	ld a, [KantoBadges]
	cp %11111111
	jr nz, .NotMet
	ld hl, Unknown_b8d4b
.NotMet
	pop af
	ld c, a
	ld de, $1
	push bc
	call IsInArray
	pop bc
	jr c, LuckyNumberShow18
	push bc
	callab GetTrainerClassName
	ld de, StringBuffer1
	call CopyName1
	pop bc
	ld b, $1
	callab GetTrainerName
	ld hl, UnknownText_0xb8d51
	ld a, $2f
	jp NextRadioLine
; b8d3e (2e:4d3e)

Unknown_b8d3e: db $0b, $0d, $0e, $0f, $10
Unknown_b8d43: db $11, $12, $13, $15, $1a, $23, $2e, $40
Unknown_b8d4b: db $09, $0a, $0c, $2a, $3f
               db $ff
; b8d51

UnknownText_0xb8d51: ; 0xb8d51
	; @  @ @
	text_jump UnknownText_0x1bcc72
	db "@"
; 0xb8d56

LuckyNumberShow19: ; b8d56 (2e:4d56)
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, Unknown_b8d7d
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	cp $a
	ld a, $5
	jr c, .asm_b8d7a
	call Random
	cp $7b
	ld a, $2e
	jr c, .asm_b8d7a
	ld a, $30
.asm_b8d7a
	jp NextRadioLine
; b8d7d (2e:4d7d)

Unknown_b8d7d: ; b8d7d
	dw UnknownText_0xb8d9d
	dw UnknownText_0xb8da2
	dw UnknownText_0xb8da7
	dw UnknownText_0xb8dac
	dw UnknownText_0xb8db1
	dw UnknownText_0xb8db6
	dw UnknownText_0xb8dbb
	dw UnknownText_0xb8dc0
	dw UnknownText_0xb8dc5
	dw UnknownText_0xb8dca
	dw UnknownText_0xb8dcf
	dw UnknownText_0xb8dd4
	dw UnknownText_0xb8dd9
	dw UnknownText_0xb8dde
	dw UnknownText_0xb8de3
	dw UnknownText_0xb8de8
; b8d9d

UnknownText_0xb8d9d: ; 0xb8d9d
	; is cute.
	text_jump UnknownText_0x1bcc80
	db "@"
; 0xb8da2

UnknownText_0xb8da2: ; 0xb8da2
	; is sort of lazy.
	text_jump UnknownText_0x1bcc8b
	db "@"
; 0xb8da7

UnknownText_0xb8da7: ; 0xb8da7
	; is always happy.
	text_jump UnknownText_0x1bcc9e
	db "@"
; 0xb8dac

UnknownText_0xb8dac: ; 0xb8dac
	; is quite noisy.
	text_jump UnknownText_0x1bccb1
	db "@"
; 0xb8db1

UnknownText_0xb8db1: ; 0xb8db1
	; is precocious.
	text_jump UnknownText_0x1bccc3
	db "@"
; 0xb8db6

UnknownText_0xb8db6: ; 0xb8db6
	; is somewhat bold.
	text_jump UnknownText_0x1bccd4
	db "@"
; 0xb8dbb

UnknownText_0xb8dbb: ; 0xb8dbb
	; is too picky!
	text_jump UnknownText_0x1bcce8
	db "@"
; 0xb8dc0

UnknownText_0xb8dc0: ; 0xb8dc0
	; is sort of OK.
	text_jump UnknownText_0x1bccf8
	db "@"
; 0xb8dc5

UnknownText_0xb8dc5: ; 0xb8dc5
	; is just so-so.
	text_jump UnknownText_0x1bcd09
	db "@"
; 0xb8dca

UnknownText_0xb8dca: ; 0xb8dca
	; is actually great.
	text_jump UnknownText_0x1bcd1a
	db "@"
; 0xb8dcf

UnknownText_0xb8dcf: ; 0xb8dcf
	; is just my type.
	text_jump UnknownText_0x1bcd2f
	db "@"
; 0xb8dd4

UnknownText_0xb8dd4: ; 0xb8dd4
	; is so cool, no?
	text_jump UnknownText_0x1bcd42
	db "@"
; 0xb8dd9

UnknownText_0xb8dd9: ; 0xb8dd9
	; is inspiring!
	text_jump UnknownText_0x1bcd54
	db "@"
; 0xb8dde

UnknownText_0xb8dde: ; 0xb8dde
	; is kind of weird.
	text_jump UnknownText_0x1bcd64
	db "@"
; 0xb8de3

UnknownText_0xb8de3: ; 0xb8de3
	; is right for me?
	text_jump UnknownText_0x1bcd78
	db "@"
; 0xb8de8

UnknownText_0xb8de8: ; 0xb8de8
	; is definitely odd!
	text_jump UnknownText_0x1bcd8b
	db "@"
; 0xb8ded

LuckyNumberShow20: ; b8ded (2e:4ded)
	call Random
	cp $9
	jr nc, LuckyNumberShow20
	ld hl, Unknown_b8e11
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld b, [hl]
	inc hl
	ld c, [hl]
	call GetWorldMapLocation
	ld e, a
	callba GetLandmarkName
	ld hl, UnknownText_0xb8e23
	ld a, $31
	jp NextRadioLine
; b8e11 (2e:4e11)

Unknown_b8e11: ; b8e11
	map PALLET_TOWN
	map ROUTE_22
	map PEWTER_CITY
	map CERULEAN_POLICE_STATION
	map ROUTE_12
	map ROUTE_11
	map ROUTE_16
	map ROUTE_14
	map CINNABAR_POKECENTER_2F_BETA
; b8e23

UnknownText_0xb8e23: ; 0xb8e23
	; @ @
	text_jump UnknownText_0x1bcda0
	db "@"
; 0xb8e28

LuckyNumberShow21: ; b8e28 (2e:4e28)
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, Unknown_b8e52
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyRadioTextToRAM
	call Random
	cp $a
	ld a, $5
	jr c, .asm_b8e4f
	call Random
	cp $7b
	ld a, $2e
	jr c, .asm_b8e4f
	ld a, $30
.asm_b8e4f
	jp PrintRadioLine
; b8e52 (2e:4e52)

Unknown_b8e52: ; b8e52
	dw UnknownText_0xb8d9d
	dw UnknownText_0xb8da2
	dw UnknownText_0xb8da7
	dw UnknownText_0xb8dac
	dw UnknownText_0xb8db1
	dw UnknownText_0xb8db6
	dw UnknownText_0xb8dbb
	dw UnknownText_0xb8dc0
	dw UnknownText_0xb8dc5
	dw UnknownText_0xb8dca
	dw UnknownText_0xb8dcf
	dw UnknownText_0xb8dd4
	dw UnknownText_0xb8dd9
	dw UnknownText_0xb8dde
	dw UnknownText_0xb8de3
	dw UnknownText_0xb8de8
; b8e72

RocketRadio1: ; b8e72 (2e:4e72)
	call StartRadioStation
	ld hl, UnknownText_0xb8ec5
	ld a, $32
	jp NextRadioLine

RocketRadio2: ; b8e7d (2e:4e7d)
	ld hl, UnknownText_0xb8eca
	ld a, $33
	jp NextRadioLine

RocketRadio3: ; b8e85 (2e:4e85)
	ld hl, UnknownText_0xb8ecf
	ld a, $34
	jp NextRadioLine

RocketRadio4: ; b8e8d (2e:4e8d)
	ld hl, UnknownText_0xb8ed4
	ld a, $35
	jp NextRadioLine

RocketRadio5: ; b8e95 (2e:4e95)
	ld hl, UnknownText_0xb8ed9
	ld a, $36
	jp NextRadioLine

RocketRadio6: ; b8e9d (2e:4e9d)
	ld hl, UnknownText_0xb8ede
	ld a, $37
	jp NextRadioLine

RocketRadio7: ; b8ea5 (2e:4ea5)
	ld hl, UnknownText_0xb8ee3
	ld a, $38
	jp NextRadioLine

RocketRadio8: ; b8ead (2e:4ead)
	ld hl, UnknownText_0xb8ee8
	ld a, $39
	jp NextRadioLine

RocketRadio9: ; b8eb5 (2e:4eb5)
	ld hl, UnknownText_0xb8eed
	ld a, $3a
	jp NextRadioLine

RocketRadio10: ; b8ebd (2e:4ebd)
	ld hl, UnknownText_0xb8ef2
	ld a, $7
	jp NextRadioLine
; b8ec5 (2e:4ec5)

UnknownText_0xb8ec5: ; 0xb8ec5
	; … …Ahem, we are
	text_jump UnknownText_0x1bcda8
	db "@"
; 0xb8eca

UnknownText_0xb8eca: ; 0xb8eca
	; TEAM ROCKET!
	text_jump UnknownText_0x1bcdba
	db "@"
; 0xb8ecf

UnknownText_0xb8ecf: ; 0xb8ecf
	; After three years
	text_jump UnknownText_0x1bcdc9
	db "@"
; 0xb8ed4

UnknownText_0xb8ed4: ; 0xb8ed4
	; of preparation, we
	text_jump UnknownText_0x1bcddd
	db "@"
; 0xb8ed9

UnknownText_0xb8ed9: ; 0xb8ed9
	; have risen again
	text_jump UnknownText_0x1bcdf2
	db "@"
; 0xb8ede

UnknownText_0xb8ede: ; 0xb8ede
	; from the ashes!
	text_jump UnknownText_0x1bce05
	db "@"
; 0xb8ee3

UnknownText_0xb8ee3: ; 0xb8ee3
	; GIOVANNI! @ Can you
	text_jump UnknownText_0x1bce17
	db "@"
; 0xb8ee8

UnknownText_0xb8ee8: ; 0xb8ee8
	; hear?@  We did it!
	text_jump UnknownText_0x1bce2e
	db "@"
; 0xb8eed

UnknownText_0xb8eed: ; 0xb8eed
	; @ Where is our boss?
	text_jump UnknownText_0x1bce44
	db "@"
; 0xb8ef2

UnknownText_0xb8ef2: ; 0xb8ef2
	; @ Is he listening?
	text_jump UnknownText_0x1bce5c
	db "@"
; 0xb8ef7

PokeFluteRadio: ; b8ef7 (2e:4ef7)
	call StartRadioStation
	ld a, $1
	ld [wd005], a
	ret

EvolutionRadio: ; b8f00 (2e:4f00)
	call StartRadioStation
	ld a, $1
	ld [wd005], a
	ret

UnownRadio: ; b8f09 (2e:4f09)
	call StartRadioStation
	ld a, $1
	ld [wd005], a
	ret

BuenasPassword1: ; b8f12 (2e:4f12)
; Determine if we need to be here
	call BuenasPasswordCheckMidnight
	jp nc, Functionb8f22
	ld a, [wd005]
	and a
	jp z, BuenasPassword20
	jp BuenasPassword8

Functionb8f22: ; b8f22 (2e:4f22)
	call StartRadioStation
	ld a, [hBGMapMode] ; $ff00+$d4
	push af
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld de, String_b9171
	hlcoord 2, 9
	call PlaceString
	pop af
	ld [hBGMapMode], a ; $ff00+$d4
	ld hl, UnknownText_0xb9182
	ld a, $40
	jp NextRadioLine

BuenasPassword2: ; b8f3f (2e:4f3f)
	ld hl, UnknownText_0xb9187
	ld a, $41
	jp NextRadioLine

BuenasPassword3: ; b8f47 (2e:4f47)
	call BuenasPasswordCheckMidnight
	ld hl, UnknownText_0xb918c
	jp c, BuenasPasswordAfterMidnight
	ld a, $42
	jp NextRadioLine

BuenasPassword4: ; b8f55 (2e:4f55)
	call BuenasPasswordCheckMidnight
	jp c, BuenasPassword8
	ld a, [wdc4a]
; If we already generated the password today, we don't need to generate a new one.
	ld hl, WeeklyFlags
	bit 7, [hl]
	jr nz, .AlreadyGotIt
; There are only 11 groups to choose from.
.greater_than_11
	call Random
	and $f
	cp $b
	jr nc, .greater_than_11
; Store it in the high nybble of e.
	swap a
	ld e, a
; For each group, choose one of the three passwords.
.greater_than_three
	call Random
	and $3
	cp $3
	jr nc, .greater_than_three
; The high nybble of wdc4a will now contain the password group index, and the low nybble contains the actual password.
	add e
	ld [wdc4a], a
; Set the flag so that we don't generate a new password this week.
	ld hl, WeeklyFlags
	set 7, [hl]
.AlreadyGotIt
	ld c, a
	call GetBuenasPassword
	ld hl, UnknownText_0xb9191
	ld a, $43
	jp NextRadioLine

GetBuenasPassword: ; b8f8f
; The password indices are held in c.  High nybble contains the group index, low nybble contains the word index.
; Load the password group pointer in hl.
	ld a, c
	swap a
	and $f
	ld hl, PasswordTable
	ld d, 0
	ld e, a
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
; Get the password type and store it in b.
	ld a, [hli]
	ld b, a
	push hl
	inc hl
; Get the password index.
	ld a, c
	and $f
	ld c, a
	push hl
	ld hl, .StringFunctionJumpTable
	ld e, b
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de ; de now contains the pointer to the value of this week's password, in Blue Card Points.
	call _hl_
	pop hl
	ld c, [hl]
	ret
; b8fb8


.StringFunctionJumpTable: ; b8fb8 (2e:4fb8)
	dw .Mon
	dw .Item
	dw .Move
	dw .RawString


.Mon: ; b8fc0 (2e:4fc0)
	call .GetTheIndex
	call GetPokemonName
	ret

.Item: ; b8fc7 (2e:4fc7)
	call .GetTheIndex
	call GetItemName
	ret

.Move: ; b8fce (2e:4fce)
	call .GetTheIndex
	call GetMoveName
	ret

.GetTheIndex: ; b8fd5 (2e:4fd5)
	ld h, 0
	ld l, c
	add hl, de
	ld a, [hl]
	ld [wd265], a
	ret

.RawString: ; b8fde (2e:4fde)
; Get the string from the table...
	ld a, c
	and a
	jr z, .skip
.read_loop
	ld a, [de]
	inc de
	cp "@"
	jr nz, .read_loop
	dec c
	jr nz, .read_loop
; ... and copy it into StringBuffer1.
.skip
	ld hl, StringBuffer1
.copy_loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .copy_loop
	ld de, StringBuffer1
	ret
; b8ff9 (2e:4ff9)

PasswordTable: ; b8ff9
	dw .JohtoStarters
	dw .Beverages
	dw .HealingItems
	dw .Balls
	dw .Pokemon1
	dw .Pokemon2
	dw .JohtoTowns
	dw .Types
	dw .Moves
	dw .XItems
	dw .RadioStations
; b900f
                     ; string type, points, option 1, option 2, option 3
.JohtoStarters:      db BUENA_MON,    10, CYNDAQUIL, TOTODILE, CHIKORITA
.Beverages:          db BUENA_ITEM,   12, FRESH_WATER, SODA_POP, LEMONADE
.HealingItems:       db BUENA_ITEM,   12, POTION, ANTIDOTE, PARLYZ_HEAL
.Balls:              db BUENA_ITEM,   12, POKE_BALL, GREAT_BALL, ULTRA_BALL
.Pokemon1:           db BUENA_MON,    10, PIKACHU, RATTATA, GEODUDE
.Pokemon2:           db BUENA_MON,    10, HOOTHOOT, SPINARAK, DROWZEE
.JohtoTowns:         db BUENA_STRING, 16, "NEW BARK TOWN@", "CHERRYGROVE CITY@", "AZALEA TOWN@"
.Types:              db BUENA_STRING,  6, "FLYING@", "BUG@", "GRASS@"
.Moves:              db BUENA_MOVE,   12, TACKLE, GROWL, MUD_SLAP
.XItems:             db BUENA_ITEM,   12, X_ATTACK, X_DEFEND, X_SPEED
.RadioStations:      db BUENA_STRING, 13, "#MON Talk@", "#MON Music@", "Lucky Channel@"
; b909c

BuenasPassword5: ; b909c (2e:509c)
	ld hl, UnknownText_0xb9196
	ld a, $44
	jp NextRadioLine

BuenasPassword6: ; b90a4 (2e:50a4)
	ld hl, UnknownText_0xb919b
	ld a, $45
	jp NextRadioLine

BuenasPassword7: ; b90ac (2e:50ac)
	call BuenasPasswordCheckMidnight
	ld hl, UnknownText_0xb91a0
	jr c, BuenasPasswordAfterMidnight
	ld a, $4
	jp NextRadioLine

BuenasPasswordAfterMidnight: ; b90b9 (2e:50b9)
	push hl
	ld hl, WeeklyFlags
	res 7, [hl]
	pop hl
	ld a, $46
	jp NextRadioLine

BuenasPassword8: ; b90c5 (2e:50c5)
	ld hl, WeeklyFlags
	res 7, [hl]
	ld hl, UnknownText_0xb91d2
	ld a, $47
	jp NextRadioLine

BuenasPassword9: ; b90d2 (2e:50d2)
	ld hl, UnknownText_0xb91a5
	ld a, $48
	jp NextRadioLine

BuenasPassword10: ; b90da (2e:50da)
	ld hl, UnknownText_0xb91aa
	ld a, $49
	jp NextRadioLine

BuenasPassword11: ; b90e2 (2e:50e2)
	ld hl, UnknownText_0xb91af
	ld a, $4a
	jp NextRadioLine

BuenasPassword12: ; b90ea (2e:50ea)
	ld hl, UnknownText_0xb91b4
	ld a, $4b
	jp NextRadioLine

BuenasPassword13: ; b90f2 (2e:50f2)
	ld hl, UnknownText_0xb91b9
	ld a, $4c
	jp NextRadioLine

BuenasPassword14: ; b90fa (2e:50fa)
	ld hl, UnknownText_0xb91be
	ld a, $4d
	jp NextRadioLine

BuenasPassword15: ; b9102 (2e:5102)
	ld hl, UnknownText_0xb91c3
	ld a, $4e
	jp NextRadioLine

BuenasPassword16: ; b910a (2e:510a)
	ld hl, UnknownText_0xb91c8
	ld a, $4f
	jp NextRadioLine

BuenasPassword17: ; b9112 (2e:5112)
	ld hl, UnknownText_0xb91cd
	ld a, $50
	jp NextRadioLine

BuenasPassword18: ; b911a (2e:511a)
	ld hl, UnknownText_0xb91d2
	ld a, $51
	jp NextRadioLine

BuenasPassword19: ; b9122 (2e:5122)
	ld hl, UnknownText_0xb91d2
	ld a, $52
	jp NextRadioLine

BuenasPassword20: ; b912a (2e:512a)
	ld a, [hBGMapMode] ; $ff00+$d4
	push af
	callba NoRadioMusic
	callba NoRadioName
	pop af
	ld [hBGMapMode], a ; $ff00+$d4
	ld hl, WeeklyFlags
	res 7, [hl]
	ld a, $4
	ld [wd002], a
	xor a
	ld [wd005], a
	ld hl, UnknownText_0xb91d7
	ld a, $53
	jp NextRadioLine

BuenasPassword21: ; b9152 (2e:5152)
	ld a, $4
	ld [wd002], a
	xor a
	ld [wd005], a
	call BuenasPasswordCheckMidnight
	jp nc, BuenasPassword1
	ld hl, UnknownText_0xb91d7
	ld a, $53
	jp NextRadioLine

BuenasPasswordCheckMidnight: ; b9169 (2e:5169)
	call UpdateTime
	ld a, [hHours] ; $ff00+$94
	cp $12
	ret
; b9171 (2e:5171)

String_b9171:
	db "BUENA'S PASSWORD@"
; b9182

UnknownText_0xb9182: ; 0xb9182
	; BUENA: BUENA here!
	text_jump UnknownText_0x1bce72
	db "@"
; 0xb9187

UnknownText_0xb9187: ; 0xb9187
	; Today's password!
	text_jump UnknownText_0x1bce87
	db "@"
; 0xb918c

UnknownText_0xb918c: ; 0xb918c
	; Let me think… It's
	text_jump UnknownText_0x1bce9a
	db "@"
; 0xb9191

UnknownText_0xb9191: ; 0xb9191
	; @ !
	text_jump UnknownText_0x1bceae
	db "@"
; 0xb9196

UnknownText_0xb9196: ; 0xb9196
	; Don't forget it!
	text_jump UnknownText_0x1bceb7
	db "@"
; 0xb919b

UnknownText_0xb919b: ; 0xb919b
	; I'm in GOLDENROD's
	text_jump UnknownText_0x1bcec9
	db "@"
; 0xb91a0

UnknownText_0xb91a0: ; 0xb91a0
	; RADIO TOWER!
	text_jump UnknownText_0x1bcedc
	db "@"
; 0xb91a5

UnknownText_0xb91a5: ; 0xb91a5
	; BUENA: Oh my…
	text_jump UnknownText_0x1bceeb
	db "@"
; 0xb91aa

UnknownText_0xb91aa: ; 0xb91aa
	; It's midnight! I
	text_jump UnknownText_0x1bcefb
	db "@"
; 0xb91af

UnknownText_0xb91af: ; 0xb91af
	; have to shut down!
	text_jump UnknownText_0x1bcf0d
	db "@"
; 0xb91b4

UnknownText_0xb91b4: ; 0xb91b4
	; Thanks for tuning
	text_jump UnknownText_0x1bcf22
	db "@"
; 0xb91b9

UnknownText_0xb91b9: ; 0xb91b9
	; in to the end! But
	text_jump UnknownText_0x1bcf36
	db "@"
; 0xb91be

UnknownText_0xb91be: ; 0xb91be
	; don't stay up too
	text_jump UnknownText_0x1bcf4b
	db "@"
; 0xb91c3

UnknownText_0xb91c3: ; 0xb91c3
	; late! Presented to
	text_jump UnknownText_0x1bcf5e
	db "@"
; 0xb91c8

UnknownText_0xb91c8: ; 0xb91c8
	; you by DJ BUENA!
	text_jump UnknownText_0x1bcf73
	db "@"
; 0xb91cd

UnknownText_0xb91cd: ; 0xb91cd
	; I'm outta here!
	text_jump UnknownText_0x1bcf86
	db "@"
; 0xb91d2

UnknownText_0xb91d2: ; 0xb91d2
	; …
	text_jump UnknownText_0x1bcf96
	db "@"
; 0xb91d7

UnknownText_0xb91d7: ; 0xb91d7
	;
	text_jump UnknownText_0x1bcf99
	db "@"
; 0xb91dc

CopyRadioTextToRAM: ; b91dc (2e:51dc)
	ld a, [hl]
	cp TX_FAR
	jp z, FarJumpText
	ld de, wd00c
	ld bc, SCREEN_WIDTH * 2
	jp CopyBytes

StartRadioStation: ; b91eb (2e:51eb)
	ld a, [wd005]
	and a
	ret nz
	call RadioTerminator
	call PrintText
	ld hl, RadioChannelSongs
	ld a, [wd002]
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	callab RadioMusicNone
	ret
; b920b (2e:520b)

RadioChannelSongs: ; b920b
	dw MUSIC_POKEMON_TALK
	dw MUSIC_POKEMON_CENTER
	dw MUSIC_TITLE
	dw MUSIC_GAME_CORNER
	dw MUSIC_BUENAS_PASSWORD
	dw MUSIC_VIRIDIAN_CITY
	dw MUSIC_BICYCLE
	dw MUSIC_ROCKET_OVERTURE
	dw MUSIC_POKE_FLUTE_CHANNEL
	dw MUSIC_RUINS_OF_ALPH_RADIO
	dw MUSIC_LAKE_OF_RAGE_ROCKET_RADIO
; b9221

NextRadioLine: ; b9221 (2e:5221)
	push af
	call CopyRadioTextToRAM
	pop af
	jp PrintRadioLine
; b9229
