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
	dw UnownRadio ; $09
	dw EvolutionRadio ; $0a
; OaksPkmnTalk
	dw OaksPkmnTalk2  ; $0b
	dw OaksPkmnTalk3  ; $0c
	dw OaksPkmnTalk4  ; $0d
	dw OaksPkmnTalk5  ; $0e
	dw OaksPkmnTalk6  ; $0f
	dw OaksPkmnTalk7  ; $10
	dw OaksPkmnTalk8  ; $11
	dw OaksPkmnTalk9  ; $12
	dw PokedexShow2 ; $13
	dw PokedexShow3 ; $14
	dw PokedexShow4 ; $15
	dw PokedexShow5 ; $16
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
; People & Places
	dw PeoplePlaces2 ; $2c
	dw PeoplePlaces3 ; $2d
	dw PeoplePlaces4 ; $2e
	dw PeoplePlaces5 ; $2f
	dw PeoplePlaces6 ; $30
	dw PeoplePlaces7 ; $31
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
	dw OaksPkmnTalk10 ; $3b
	dw OaksPkmnTalk11 ; $3c
	dw OaksPkmnTalk12 ; $3d
	dw OaksPkmnTalk13 ; $3e
	dw OaksPkmnTalk14 ; $3f
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
	dw PokedexShow6 ; $55
	dw PokedexShow7 ; $56
	dw PokedexShow8 ; $57


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
	ld a, RADIO_SCROLL
	ld [wd002], a
	ld a, 100
	ld [wd004], a
	ret
; b8718 (2e:4718)

ReplacePeriodsWithSpaces: ; b8718
	push hl
	ld b, SCREEN_WIDTH * 2
.loop
	ld a, [hl]
	cp "."
	jr nz, .next
	ld [hl], " "

.next
	inc hl
	dec b
	jr nz, .loop
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
	ld a, OAKS_POKEMON_TALK_2
	jp NextRadioLine

OaksPkmnTalk2: ; b8752 (2e:4752)
	ld hl, UnknownText_0xb8825
	ld a, OAKS_POKEMON_TALK_3
	jp NextRadioLine

OaksPkmnTalk3: ; b875a (2e:475a)
	ld hl, UnknownText_0xb882a
	ld a, OAKS_POKEMON_TALK_4
	jp NextRadioLine

OaksPkmnTalk4: ; b8762 (2e:4762)
; Choose a random route, and a random Pokemon from that route.
	call Random
	and $1f
	cp $f
	jr nc, OaksPkmnTalk4
	; We now have a number between 0 and 14.
	ld hl, .routes
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld b, [hl]
	inc hl
	ld c, [hl]
	; bc now contains the chosen map's group and number indices.
	push bc

	; Search the JohtoGrassWildMons array for the chosen map.
	ld hl, JohtoGrassWildMons
.loop
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp -1
	jr z, .overflow
	inc hl
	cp b
	jr nz, .next
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp c
	jr z, .done
.next
	dec hl
	ld de, WILDMON_GRASS_STRUCTURE_LENGTH
	add hl, de
	jr .loop

.done
rept 4
	inc hl
endr
	; Generate a number, either 0, 1, or 2, to choose a time of day.
.loop2
	call Random
	and 3
	cp 3
	jr z, .loop2

	ld bc, 2 * NUM_WILDMONS_PER_AREA_TIME_OF_DAY
	call AddNTimes
.loop3
	; Choose one of the middle three Pokemon.
	call Random
	and NUM_WILDMONS_PER_AREA_TIME_OF_DAY
	cp 2
	jr c, .loop3
	cp 5
	jr nc, .loop3
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	inc hl ; skip level
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	ld [wNamedObjectIndexBuffer], a
	ld [CurPartySpecies], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wd050
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	; Now that we've chosen our wild Pokemon,
	; let's recover the map index info and get its name.
	pop bc
	call GetWorldMapLocation
	ld e, a
	callba GetLandmarkName
	ld hl, UnknownText_0xb882f
	call CopyRadioTextToRAM
	ld a, OAKS_POKEMON_TALK_5
	jp PrintRadioLine

.overflow
	pop bc
	ld a, $0
	jp PrintRadioLine
; b87f2 (2e:47f2)

.routes: ; b87f2
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
	ld a, OAKS_POKEMON_TALK_6
	jp NextRadioLine

OaksPkmnTalk6: ; b8818 (2e:4818)
	ld hl, UnknownText_0xb8839
	ld a, OAKS_POKEMON_TALK_7
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
	ld a, OAKS_POKEMON_TALK_8
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
	ld hl, .Descriptors
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, OAKS_POKEMON_TALK_9
	jp NextRadioLine
; b8869 (2e:4869)

.Descriptors: ; b8869
	dw .sweetadorably
	dw .wigglyslickly
	dw .aptlynamed
	dw .undeniablykindof
	dw .unbearably
	dw .wowimpressively
	dw .almostpoisonously
	dw .sensually
	dw .mischievously
	dw .topically
	dw .addictively
	dw .looksinwater
	dw .evolutionmustbe
	dw .provocatively
	dw .flippedout
	dw .heartmeltingly
; b8889

.sweetadorably: ; 0xb8889
	; sweet and adorably
	text_jump UnknownText_0x1bc885
	db "@"
; 0xb888e

.wigglyslickly: ; 0xb888e
	; wiggly and slickly
	text_jump UnknownText_0x1bc89a
	db "@"
; 0xb8893

.aptlynamed: ; 0xb8893
	; aptly named and
	text_jump UnknownText_0x1bc8af
	db "@"
; 0xb8898

.undeniablykindof: ; 0xb8898
	; undeniably kind of
	text_jump UnknownText_0x1bc8c1
	db "@"
; 0xb889d

.unbearably: ; 0xb889d
	; so, so unbearably
	text_jump UnknownText_0x1bc8d6
	db "@"
; 0xb88a2

.wowimpressively: ; 0xb88a2
	; wow, impressively
	text_jump UnknownText_0x1bc8ea
	db "@"
; 0xb88a7

.almostpoisonously: ; 0xb88a7
	; almost poisonously
	text_jump UnknownText_0x1bc8fe
	db "@"
; 0xb88ac

.sensually: ; 0xb88ac
	; ooh, so sensually
	text_jump UnknownText_0x1bc913
	db "@"
; 0xb88b1

.mischievously: ; 0xb88b1
	; so mischievously
	text_jump UnknownText_0x1bc927
	db "@"
; 0xb88b6

.topically: ; 0xb88b6
	; so very topically
	text_jump UnknownText_0x1bc93a
	db "@"
; 0xb88bb

.addictively: ; 0xb88bb
	; sure addictively
	text_jump UnknownText_0x1bc94e
	db "@"
; 0xb88c0

.looksinwater: ; 0xb88c0
	; looks in water is
	text_jump UnknownText_0x1bc961
	db "@"
; 0xb88c5

.evolutionmustbe: ; 0xb88c5
	; evolution must be
	text_jump UnknownText_0x1bc975
	db "@"
; 0xb88ca

.provocatively: ; 0xb88ca
	; provocatively
	text_jump UnknownText_0x1bc989
	db "@"
; 0xb88cf

.flippedout: ; 0xb88cf
	; so flipped out and
	text_jump UnknownText_0x1bc999
	db "@"
; 0xb88d4

.heartmeltingly: ; 0xb88d4
	; heart-meltingly
	text_jump UnknownText_0x1bc9ae
	db "@"
; 0xb88d9

OaksPkmnTalk9: ; b88d9 (2e:48d9)
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, .Descriptors
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd006]
	dec a
	ld [wd006], a
	ld a, OAKS_POKEMON_TALK_4
	jr nz, .ok
	ld a, $5
	ld [wd006], a
	ld a, OAKS_POKEMON_TALK_10
.ok
	jp NextRadioLine
; b88fe (2e:48fe)

.Descriptors: ; b88fe
	dw .cute
	dw .weird
	dw .pleasant
	dw .boldsortof
	dw .frightening
	dw .suavedebonair
	dw .powerful
	dw .exciting
	dw .groovy
	dw .inspiring
	dw .friendly
	dw .hothothot
	dw .stimulating
	dw .guarded
	dw .lovely
	dw .speedy
; b891e

.cute: ; 0xb891e
	; cute.
	text_jump UnknownText_0x1bc9c0
	db "@"
; 0xb8923

.weird: ; 0xb8923
	; weird.
	text_jump UnknownText_0x1bc9c8
	db "@"
; 0xb8928

.pleasant: ; 0xb8928
	; pleasant.
	text_jump UnknownText_0x1bc9d1
	db "@"
; 0xb892d

.boldsortof: ; 0xb892d
	; bold, sort of.
	text_jump UnknownText_0x1bc9dd
	db "@"
; 0xb8932

.frightening: ; 0xb8932
	; frightening.
	text_jump UnknownText_0x1bc9ee
	db "@"
; 0xb8937

.suavedebonair: ; 0xb8937
	; suave & debonair!
	text_jump UnknownText_0x1bc9fd
	db "@"
; 0xb893c

.powerful: ; 0xb893c
	; powerful.
	text_jump UnknownText_0x1bca11
	db "@"
; 0xb8941

.exciting: ; 0xb8941
	; exciting.
	text_jump UnknownText_0x1bca1d
	db "@"
; 0xb8946

.groovy: ; 0xb8946
	; groovy!
	text_jump UnknownText_0x1bca29
	db "@"
; 0xb894b

.inspiring: ; 0xb894b
	; inspiring.
	text_jump UnknownText_0x1bca33
	db "@"
; 0xb8950

.friendly: ; 0xb8950
	; friendly.
	text_jump UnknownText_0x1bca40
	db "@"
; 0xb8955

.hothothot: ; 0xb8955
	; hot, hot, hot!
	text_jump UnknownText_0x1bca4c
	db "@"
; 0xb895a

.stimulating: ; 0xb895a
	; stimulating.
	text_jump UnknownText_0x1bca5d
	db "@"
; 0xb895f

.guarded: ; 0xb895f
	; guarded.
	text_jump UnknownText_0x1bca6c
	db "@"
; 0xb8964

.lovely: ; 0xb8964
	; lovely.
	text_jump UnknownText_0x1bca77
	db "@"
; 0xb8969

.speedy: ; 0xb8969
	; speedy.
	text_jump UnknownText_0x1bca81
	db "@"
; 0xb896e

OaksPkmnTalk10: ; b896e (2e:496e)
	callba RadioMusicRestartPokemonChannel
	ld hl, UnknownText_0xb8993
	call PrintText
	call WaitBGMap
	ld hl, UnknownText_0xb898e
	call PrintText
	ld a, OAKS_POKEMON_TALK_11
	ld [wd002], a
	ld a, 100
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

OaksPkmnTalk11: ; b8994 (2e:4994)
	ld hl, wd004
	dec [hl]
	ret nz
	hlcoord 9, 14
	ld de, .pokemon_string
	ld a, OAKS_POKEMON_TALK_12
	jp PlaceRadioString
; b89a4 (2e:49a4)

.pokemon_string:
	db "#MON@"
; b89a9

OaksPkmnTalk12: ; b89a9 (2e:49a9)
	ld hl, wd004
	dec [hl]
	ret nz
	hlcoord 1, 16
	ld de, .pokemon_channel_string
	ld a, OAKS_POKEMON_TALK_13
	jp PlaceRadioString
; b89b9 (2e:49b9)

.pokemon_channel_string:
	db "#MON Channel@"
; b89c6

OaksPkmnTalk13: ; b89c6 (2e:49c6)
	ld hl, wd004
	dec [hl]
	ret nz
	hlcoord 12, 16
	ld de, .terminator
	ld a, OAKS_POKEMON_TALK_14
	jp PlaceRadioString
; b89d6 (2e:49d6)

.terminator:
	db "@"
; b89d7

OaksPkmnTalk14: ; b89d7 (2e:49d7)
	ld hl, wd004
	dec [hl]
	ret nz
	ld de, $1d
	callab RadioMusicRestartDE
	ld hl, .terminator
	call PrintText
	ld a, OAKS_POKEMON_TALK_4
	ld [wd003], a
	xor a
	ld [wd005], a
	ld a, RADIO_SCROLL
	ld [wd002], a
	ld a, 10
	ld [wd004], a
	ret
; b89ff (2e:49ff)

.terminator: ; 0xb89ff
	db "@"
; 0xb8a00

PlaceRadioString: ; b8a00 (2e:4a00)
	ld [wd002], a
	ld a, 100
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

PokedexShow_GetDexEntryBank: ; b8a2d (2e:4a2d)
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
.loop
	call Random
	cp CELEBI
	jr nc, .loop
	ld c, a
	push bc
	ld a, c
	call CheckCaughtMon
	pop bc
	jr z, .loop
	inc c
	ld a, c
	ld [CurPartySpecies], a
	ld [wd265], a
	call GetPokemonName
	ld hl, UnknownText_0xb8b30
	ld a, POKEDEX_SHOW_2
	jp NextRadioLine

PokedexShow2: ; b8a6c (2e:4a6c)
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
	call PokedexShow_GetDexEntryBank
	push af
	push hl
	call CopyDexEntryPart1
	dec hl
	ld [hl], $57
	ld hl, wd26b
	call CopyRadioTextToRAM
	pop hl
	pop af
	call CopyDexEntryPart2
rept 4
	inc hl
endr
	ld a, l
	ld [wd26b], a
	ld a, h
	ld [wd26c], a
	ld a, POKEDEX_SHOW_3
	jp PrintRadioLine

PokedexShow3: ; b8aa4 (2e:4aa4)
	call CopyDexEntry
	ld a, POKEDEX_SHOW_4
	jp PrintRadioLine

PokedexShow4: ; b8aac (2e:4aac)
	call CopyDexEntry
	ld a, POKEDEX_SHOW_5
	jp PrintRadioLine

PokedexShow5: ; b8ab4 (2e:4ab4)
	call CopyDexEntry
	ld a, POKEDEX_SHOW_6
	jp PrintRadioLine

PokedexShow6: ; b8abc (2e:4abc)
	call CopyDexEntry
	ld a, POKEDEX_SHOW_7
	jp PrintRadioLine

PokedexShow7: ; b8ac4 (2e:4ac4)
	call CopyDexEntry
	ld a, POKEDEX_SHOW_8
	jp PrintRadioLine

PokedexShow8: ; b8acc (2e:4acc)
	call CopyDexEntry
	ld a, POKEDEX_SHOW
	jp PrintRadioLine

CopyDexEntry: ; b8ad4 (2e:4ad4)
	ld a, [wd26b]
	ld l, a
	ld a, [wd26c]
	ld h, a
	ld a, [wd26d]
	push af
	push hl
	call CopyDexEntryPart1
	dec hl
	ld [hl], "<DONE>"
	ld hl, wd26b
	call CopyRadioTextToRAM
	pop hl
	pop af
	call CopyDexEntryPart2
	ret

CopyDexEntryPart1: ; b8af3 (2e:4af3)
	ld de, wd26d
	ld bc, SCREEN_WIDTH - 1
	call FarCopyBytes
	ld hl, wd26b
	ld [hl], "<START>"
	inc hl
	ld [hl], "<LINE>"
	inc hl
.loop
	ld a, [hli]
	cp "@"
	ret z
	cp "<NEXT>"
	ret z
	cp "<DEXEND>"
	ret z
	jr .loop

CopyDexEntryPart2: ; b8b11 (2e:4b11)
	ld d, a
.loop
	ld a, d
	call GetFarByte
	inc hl
	cp "@"
	jr z, .okay
	cp "<NEXT>"
	jr z, .okay
	cp "<DEXEND>"
	jr nz, .loop
.okay
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
	call StartPokemonMusicChannel
	ld hl, UnknownText_0xb8baa
	ld a, POKEMON_MUSIC_2
	jp NextRadioLine

BenMonMusic2: ; b8b40 (2e:4b40)
	ld hl, UnknownText_0xb8baf
	ld a, POKEMON_MUSIC_3
	jp NextRadioLine

BenMonMusic3: ; b8b48 (2e:4b48)
	ld hl, UnknownText_0xb8bb4
	ld a, POKEMON_MUSIC_4
	jp NextRadioLine

FernMonMusic1: ; b8b50 (2e:4b50)
	call StartPokemonMusicChannel
	ld hl, UnknownText_0xb8bb9
	ld a, LETS_ALL_SING_2
	jp NextRadioLine

FernMonMusic2: ; b8b5b (2e:4b5b)
	ld hl, UnknownText_0xb8bbe
	ld a, POKEMON_MUSIC_4
	jp NextRadioLine

BenFernMusic4: ; b8b63 (2e:4b63)
	ld hl, UnknownText_0xb8bc3
	ld a, POKEMON_MUSIC_5
	jp NextRadioLine

BenFernMusic5: ; b8b6b (2e:4b6b)
	call GetWeekday
	and 1
	ld hl, UnknownText_0xb8bc8
	jr z, .SunTueThurSun
	ld hl, UnknownText_0xb8bcd
.SunTueThurSun
	ld a, POKEMON_MUSIC_6
	jp NextRadioLine

BenFernMusic6: ; b8b7d (2e:4b7d)
	call GetWeekday
	and 1
	ld hl, UnknownText_0xb8bd2
	jr z, .SunTueThurSun
	ld hl, UnknownText_0xb8bd7
.SunTueThurSun
	ld a, POKEMON_MUSIC_7
	jp NextRadioLine

BenFernMusic7: ; b8b8f (2e:4b8f)
	ret

StartPokemonMusicChannel: ; b8b90 (2e:4b90)
	call RadioTerminator
	call PrintText
	ld de, MUSIC_POKEMON_MARCH
	call GetWeekday
	and 1
	jr z, .SunTueThurSun
	ld de, MUSIC_POKEMON_LULLABY
.SunTueThurSun
	callab RadioMusicRestartDE
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
	callab Special_CheckLuckyNumberShowFlag
	jr nc, .dontreset
	callab Special_ResetLuckyNumberShowFlag
.dontreset
	ld hl, UnknownText_0xb8c7e
	ld a, LUCKY_NUMBER_SHOW_2
	jp NextRadioLine

LuckyNumberShow2: ; b8bf5 (2e:4bf5)
	ld hl, UnknownText_0xb8c83
	ld a, LUCKY_NUMBER_SHOW_3
	jp NextRadioLine

LuckyNumberShow3: ; b8bfd (2e:4bfd)
	ld hl, UnknownText_0xb8c88
	ld a, LUCKY_NUMBER_SHOW_4
	jp NextRadioLine

LuckyNumberShow4: ; b8c05 (2e:4c05)
	ld hl, UnknownText_0xb8c8d
	ld a, LUCKY_NUMBER_SHOW_5
	jp NextRadioLine

LuckyNumberShow5: ; b8c0d (2e:4c0d)
	ld hl, UnknownText_0xb8c92
	ld a, LUCKY_NUMBER_SHOW_6
	jp NextRadioLine

LuckyNumberShow6: ; b8c15 (2e:4c15)
	ld hl, UnknownText_0xb8c97
	ld a, LUCKY_NUMBER_SHOW_7
	jp NextRadioLine

LuckyNumberShow7: ; b8c1d (2e:4c1d)
	ld hl, UnknownText_0xb8c9c
	ld a, LUCKY_NUMBER_SHOW_8
	jp NextRadioLine

LuckyNumberShow8: ; b8c25 (2e:4c25)
	ld hl, StringBuffer1
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, "@"
	ld [StringBuffer1 + 5], a
	ld hl, UnknownText_0xb8ca1
	ld a, LUCKY_NUMBER_SHOW_9
	jp NextRadioLine

LuckyNumberShow9: ; b8c3e (2e:4c3e)
	ld hl, UnknownText_0xb8ca6
	ld a, LUCKY_NUMBER_SHOW_10
	jp NextRadioLine

LuckyNumberShow10: ; b8c46 (2e:4c46)
	ld hl, UnknownText_0xb8c9c
	ld a, LUCKY_NUMBER_SHOW_11
	jp NextRadioLine

LuckyNumberShow11: ; b8c4e (2e:4c4e)
	ld hl, UnknownText_0xb8ca1
	ld a, LUCKY_NUMBER_SHOW_12
	jp NextRadioLine

LuckyNumberShow12: ; b8c56 (2e:4c56)
	ld hl, UnknownText_0xb8cab
	ld a, LUCKY_NUMBER_SHOW_13
	jp NextRadioLine

LuckyNumberShow13: ; b8c5e (2e:4c5e)
	ld hl, UnknownText_0xb8cb0
	call Random
	and a
	ld a, LUCKY_CHANNEL
	jr nz, .okay
	ld a, LUCKY_NUMBER_SHOW_14
.okay
	jp NextRadioLine

LuckyNumberShow14: ; b8c6e (2e:4c6e)
	ld hl, UnknownText_0xb8cb5
	ld a, LUCKY_NUMBER_SHOW_15
	jp NextRadioLine

LuckyNumberShow15: ; b8c76 (2e:4c76)
	ld hl, UnknownText_0xb8cba
	ld a, LUCKY_CHANNEL
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
	ld a, PLACES_AND_PEOPLE_2
	jp NextRadioLine

PeoplePlaces2: ; b8cca (2e:4cca)
	ld hl, UnknownText_0xb8ce8
	ld a, PLACES_AND_PEOPLE_3
	jp NextRadioLine

PeoplePlaces3: ; b8cd2 (2e:4cd2)
	ld hl, UnknownText_0xb8ced
	call Random
	cp $7b ; 48 percent
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
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

PeoplePlaces4: ; People
	call Random
	and $7f
	inc a
	cp NUM_TRAINER_CLASSES - 1
	jr nc, PeoplePlaces4
	push af
	ld hl, .E4Names
	ld a, [StatusFlags]
	bit 6, a ; ENGINE_CREDITS_SKIP
	jr z, .ok
	ld hl, .KantoLeaderNames
	ld a, [KantoBadges]
	cp %11111111
	jr nz, .ok
	ld hl, .MiscNames
.ok
	pop af
	ld c, a
	ld de, 1
	push bc
	call IsInArray
	pop bc
	jr c, PeoplePlaces4
	push bc
	callab GetTrainerClassName
	ld de, StringBuffer1
	call CopyName1
	pop bc
	ld b, 1
	callab GetTrainerName
	ld hl, UnknownText_0xb8d51
	ld a, PLACES_AND_PEOPLE_5
	jp NextRadioLine
; b8d3e (2e:4d3e)

.E4Names:          db WILL, BRUNO, KAREN, KOGA, CHAMPION ; $0b, $0d, $0e, $0f, $10
.KantoLeaderNames: db BROCK, MISTY, LT_SURGE, ERIKA, JANINE, SABRINA, BLAINE, BLUE ; $11, $12, $13, $15, $1a, $23, $2e, $40
.MiscNames:        db RIVAL1, POKEMON_PROF, CAL, RIVAL2, RED ; $09, $0a, $0c, $2a, $3f
                   db -1
; b8d51

UnknownText_0xb8d51: ; 0xb8d51
	; @  @ @
	text_jump UnknownText_0x1bcc72
	db "@"
; 0xb8d56

PeoplePlaces5: ; b8d56 (2e:4d56)
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, .Descriptors
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	cp $a ; 6.25 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp $7b ; 48 percent
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp NextRadioLine
; b8d7d (2e:4d7d)

.Descriptors: ; b8d7d
	dw PnP_cute
	dw PnP_lazy
	dw PnP_happy
	dw PnP_noisy
	dw PnP_precocious
	dw PnP_bold
	dw PnP_picky
	dw PnP_sortofok
	dw PnP_justsoso
	dw PnP_actuallygreat
	dw PnP_justmytype
	dw PnP_socool
	dw PnP_inspiring
	dw PnP_weird
	dw PnP_rightforme
	dw PnP_odd
; b8d9d

PnP_cute: ; 0xb8d9d
	; is cute.
	text_jump UnknownText_0x1bcc80
	db "@"
; 0xb8da2

PnP_lazy: ; 0xb8da2
	; is sort of lazy.
	text_jump UnknownText_0x1bcc8b
	db "@"
; 0xb8da7

PnP_happy: ; 0xb8da7
	; is always happy.
	text_jump UnknownText_0x1bcc9e
	db "@"
; 0xb8dac

PnP_noisy: ; 0xb8dac
	; is quite noisy.
	text_jump UnknownText_0x1bccb1
	db "@"
; 0xb8db1

PnP_precocious: ; 0xb8db1
	; is precocious.
	text_jump UnknownText_0x1bccc3
	db "@"
; 0xb8db6

PnP_bold: ; 0xb8db6
	; is somewhat bold.
	text_jump UnknownText_0x1bccd4
	db "@"
; 0xb8dbb

PnP_picky: ; 0xb8dbb
	; is too picky!
	text_jump UnknownText_0x1bcce8
	db "@"
; 0xb8dc0

PnP_sortofok: ; 0xb8dc0
	; is sort of OK.
	text_jump UnknownText_0x1bccf8
	db "@"
; 0xb8dc5

PnP_justsoso: ; 0xb8dc5
	; is just so-so.
	text_jump UnknownText_0x1bcd09
	db "@"
; 0xb8dca

PnP_actuallygreat: ; 0xb8dca
	; is actually great.
	text_jump UnknownText_0x1bcd1a
	db "@"
; 0xb8dcf

PnP_justmytype: ; 0xb8dcf
	; is just my type.
	text_jump UnknownText_0x1bcd2f
	db "@"
; 0xb8dd4

PnP_socool: ; 0xb8dd4
	; is so cool, no?
	text_jump UnknownText_0x1bcd42
	db "@"
; 0xb8dd9

PnP_inspiring: ; 0xb8dd9
	; is inspiring!
	text_jump UnknownText_0x1bcd54
	db "@"
; 0xb8dde

PnP_weird: ; 0xb8dde
	; is kind of weird.
	text_jump UnknownText_0x1bcd64
	db "@"
; 0xb8de3

PnP_rightforme: ; 0xb8de3
	; is right for me?
	text_jump UnknownText_0x1bcd78
	db "@"
; 0xb8de8

PnP_odd: ; 0xb8de8
	; is definitely odd!
	text_jump UnknownText_0x1bcd8b
	db "@"
; 0xb8ded

PeoplePlaces6: ; Places
	call Random
	cp 9
	jr nc, PeoplePlaces6
	ld hl, .Maps
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
	ld a, PLACES_AND_PEOPLE_7
	jp NextRadioLine
; b8e11 (2e:4e11)

.Maps: ; b8e11
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

PeoplePlaces7: ; b8e28 (2e:4e28)
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, .Descriptors
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyRadioTextToRAM
	call Random
	cp $a ; 6.25 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp $7b ; 48 percent
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp PrintRadioLine
; b8e52 (2e:4e52)

.Descriptors: ; b8e52
	dw PnP_cute
	dw PnP_lazy
	dw PnP_happy
	dw PnP_noisy
	dw PnP_precocious
	dw PnP_bold
	dw PnP_picky
	dw PnP_sortofok
	dw PnP_justsoso
	dw PnP_actuallygreat
	dw PnP_justmytype
	dw PnP_socool
	dw PnP_inspiring
	dw PnP_weird
	dw PnP_rightforme
	dw PnP_odd
; b8e72

RocketRadio1: ; b8e72 (2e:4e72)
	call StartRadioStation
	ld hl, UnknownText_0xb8ec5
	ld a, ROCKET_RADIO_2
	jp NextRadioLine

RocketRadio2: ; b8e7d (2e:4e7d)
	ld hl, UnknownText_0xb8eca
	ld a, ROCKET_RADIO_3
	jp NextRadioLine

RocketRadio3: ; b8e85 (2e:4e85)
	ld hl, UnknownText_0xb8ecf
	ld a, ROCKET_RADIO_4
	jp NextRadioLine

RocketRadio4: ; b8e8d (2e:4e8d)
	ld hl, UnknownText_0xb8ed4
	ld a, ROCKET_RADIO_5
	jp NextRadioLine

RocketRadio5: ; b8e95 (2e:4e95)
	ld hl, UnknownText_0xb8ed9
	ld a, ROCKET_RADIO_6
	jp NextRadioLine

RocketRadio6: ; b8e9d (2e:4e9d)
	ld hl, UnknownText_0xb8ede
	ld a, ROCKET_RADIO_7
	jp NextRadioLine

RocketRadio7: ; b8ea5 (2e:4ea5)
	ld hl, UnknownText_0xb8ee3
	ld a, ROCKET_RADIO_8
	jp NextRadioLine

RocketRadio8: ; b8ead (2e:4ead)
	ld hl, UnknownText_0xb8ee8
	ld a, ROCKET_RADIO_9
	jp NextRadioLine

RocketRadio9: ; b8eb5 (2e:4eb5)
	ld hl, UnknownText_0xb8eed
	ld a, ROCKET_RADIO_10
	jp NextRadioLine

RocketRadio10: ; b8ebd (2e:4ebd)
	ld hl, UnknownText_0xb8ef2
	ld a, ROCKET_RADIO
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
	ld a, 1
	ld [wd005], a
	ret

UnownRadio: ; b8f00 (2e:4f00)
	call StartRadioStation
	ld a, 1
	ld [wd005], a
	ret

EvolutionRadio: ; b8f09 (2e:4f09)
	call StartRadioStation
	ld a, 1
	ld [wd005], a
	ret

BuenasPassword1: ; b8f12 (2e:4f12)
; Determine if we need to be here
	call BuenasPasswordCheckMidnight
	jp nc, .PlayPassword
	ld a, [wd005]
	and a
	jp z, BuenasPassword20
	jp BuenasPassword8

.PlayPassword: ; b8f22 (2e:4f22)
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
	ld a, BUENAS_PASSWORD_2
	jp NextRadioLine

BuenasPassword2: ; b8f3f (2e:4f3f)
	ld hl, UnknownText_0xb9187
	ld a, BUENAS_PASSWORD_3
	jp NextRadioLine

BuenasPassword3: ; b8f47 (2e:4f47)
	call BuenasPasswordCheckMidnight
	ld hl, UnknownText_0xb918c
	jp c, BuenasPasswordAfterMidnight
	ld a, BUENAS_PASSWORD_4
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
	ld a, BUENAS_PASSWORD_5
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
	ld a, BUENAS_PASSWORD_6
	jp NextRadioLine

BuenasPassword6: ; b90a4 (2e:50a4)
	ld hl, UnknownText_0xb919b
	ld a, BUENAS_PASSWORD_7
	jp NextRadioLine

BuenasPassword7: ; b90ac (2e:50ac)
	call BuenasPasswordCheckMidnight
	ld hl, UnknownText_0xb91a0
	jr c, BuenasPasswordAfterMidnight
	ld a, BUENAS_PASSWORD
	jp NextRadioLine

BuenasPasswordAfterMidnight: ; b90b9 (2e:50b9)
	push hl
	ld hl, WeeklyFlags
	res 7, [hl]
	pop hl
	ld a, BUENAS_PASSWORD_8
	jp NextRadioLine

BuenasPassword8: ; b90c5 (2e:50c5)
	ld hl, WeeklyFlags
	res 7, [hl]
	ld hl, UnknownText_0xb91d2
	ld a, BUENAS_PASSWORD_9
	jp NextRadioLine

BuenasPassword9: ; b90d2 (2e:50d2)
	ld hl, UnknownText_0xb91a5
	ld a, BUENAS_PASSWORD_10
	jp NextRadioLine

BuenasPassword10: ; b90da (2e:50da)
	ld hl, UnknownText_0xb91aa
	ld a, BUENAS_PASSWORD_11
	jp NextRadioLine

BuenasPassword11: ; b90e2 (2e:50e2)
	ld hl, UnknownText_0xb91af
	ld a, BUENAS_PASSWORD_12
	jp NextRadioLine

BuenasPassword12: ; b90ea (2e:50ea)
	ld hl, UnknownText_0xb91b4
	ld a, BUENAS_PASSWORD_13
	jp NextRadioLine

BuenasPassword13: ; b90f2 (2e:50f2)
	ld hl, UnknownText_0xb91b9
	ld a, BUENAS_PASSWORD_14
	jp NextRadioLine

BuenasPassword14: ; b90fa (2e:50fa)
	ld hl, UnknownText_0xb91be
	ld a, BUENAS_PASSWORD_15
	jp NextRadioLine

BuenasPassword15: ; b9102 (2e:5102)
	ld hl, UnknownText_0xb91c3
	ld a, BUENAS_PASSWORD_16
	jp NextRadioLine

BuenasPassword16: ; b910a (2e:510a)
	ld hl, UnknownText_0xb91c8
	ld a, BUENAS_PASSWORD_17
	jp NextRadioLine

BuenasPassword17: ; b9112 (2e:5112)
	ld hl, UnknownText_0xb91cd
	ld a, BUENAS_PASSWORD_18
	jp NextRadioLine

BuenasPassword18: ; b911a (2e:511a)
	ld hl, UnknownText_0xb91d2
	ld a, BUENAS_PASSWORD_19
	jp NextRadioLine

BuenasPassword19: ; b9122 (2e:5122)
	ld hl, UnknownText_0xb91d2
	ld a, BUENAS_PASSWORD_20
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
	ld a, BUENAS_PASSWORD_21
	jp NextRadioLine

BuenasPassword21: ; b9152 (2e:5152)
	ld a, $4
	ld [wd002], a
	xor a
	ld [wd005], a
	call BuenasPasswordCheckMidnight
	jp nc, BuenasPassword1
	ld hl, UnknownText_0xb91d7
	ld a, BUENAS_PASSWORD_21
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
	callab RadioMusicRestartDE
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
