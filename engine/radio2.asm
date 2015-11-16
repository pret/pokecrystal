_UpdateRadioStation: ; 9163e (24:563e)
	jr UpdateRadioStation

Function91640: ; 91640 (24:5640)
	push bc
	call .TuningKnob
	pop bc
	ld a, [wRadioTuningKnob]
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.TuningKnob: ; 9164e (24:564e)
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ld a, [hl]
	and D_UP
	jr nz, .up
	ret

.down
	ld hl, wRadioTuningKnob
	ld a, [hl]
	and a
	ret z
rept 2
	dec [hl]
endr
	jr .update

.up
	ld hl, wRadioTuningKnob
	ld a, [hl]
	cp 80
	ret nc
rept 2
	inc [hl]
endr

.update

UpdateRadioStation: ; 9166f (24:566f)
	ld hl, wRadioTuningKnob
	ld d, [hl]
	ld hl, RadioChannels
.loop
	ld a, [hli]
	cp -1
	jr z, .nostation
	cp d
	jr z, .foundstation
rept 2
	inc hl
endr
	jr .loop

.nostation
	call NoRadioStation
	ret

.foundstation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .returnafterstation
	push de
	jp [hl]
.returnafterstation
	ld a, [wc6d9]
	and a
	ret z
	xor a
	ld [hBGMapMode], a
	hlcoord 2, 9
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret
; 916a1 (24:56a1)

Function916a1: ; 916a1
	ld [wc6d9], a
	ld a, [hli]
	ld [wc6da], a
	ld a, [hli]
	ld [wc6db], a
	ret
; 916ad


RadioChannels:
; frequencies and the shows that play on them.
; frequency value given here = 4 × ingame_frequency − 2
	dbw 16, .PkmnTalkAndPokedexShow
	dbw 28, .PokemonMusic
	dbw 32, .LuckyChannel
	dbw 40, .BuenasPassword
	dbw 52, .RuinsOfAlphRadio
	dbw 64, .PlacesAndPeople
	dbw 72, .LetsAllSing
	dbw 78, .PokeFluteRadio
	dbw 80, .EvolutionRadio
	db $ff

.PkmnTalkAndPokedexShow
; Pokédex Show in the morning
; Oak's Pokémon Talk in the afternoon and evening
	call .InJohto
	jr nc, .NoSignal
	ld a, [TimeOfDay]
	and a
	jp z, LoadStation_PokedexShow
	jp LoadStation_OaksPokemonTalk

.PokemonMusic
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_PokemonMusic

.LuckyChannel
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_LuckyChannel

.BuenasPassword
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_BuenasPassword

.RuinsOfAlphRadio
	ld a, [wc6d8]
	cp RUINS_OF_ALPH
	jr nz, .NoSignal
	jp LoadStation_UnownRadio

.PlacesAndPeople
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit 3, a
	jr z, .NoSignal
	jp LoadStation_PlacesAndPeople

.LetsAllSing
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit 3, a
	jr z, .NoSignal
	jp LoadStation_LetsAllSing

.PokeFluteRadio
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit 3, a
	jr z, .NoSignal
	jp LoadStation_PokeFluteRadio

.EvolutionRadio
; This station airs in the Lake of Rage area when Rocket are still in Mahogany.

	ld a, [StatusFlags]
	bit 4, a
	jr z, .NoSignal

	ld a, [wc6d8]
	cp MAHOGANY_TOWN
	jr z, .ok
	cp ROUTE_43
	jr z, .ok
	cp LAKE_OF_RAGE
	jr nz, .NoSignal
.ok
	jp LoadStation_EvolutionRadio

.NoSignal
	call NoRadioStation
	ret

.InJohto
; if in Johto or on the S.S. Aqua, set carry
; otherwise clear carry
	ld a, [wc6d8]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr c, .johto
.kanto
	and a
	ret
.johto
	scf
	ret



LoadStation_OaksPokemonTalk: ; 91753 (24:5753)
	xor a ; OAKS_POKEMON_TALK
	ld [wd002], a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, OaksPkmnTalkName
	ret

LoadStation_PokedexShow: ; 91766 (24:5766)
	ld a, POKEDEX_SHOW
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokedexShowName
	ret

LoadStation_PokemonMusic: ; 9177b (24:577b)
	ld a, POKEMON_MUSIC
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokemonMusicName
	ret

LoadStation_LuckyChannel: ; 91790 (24:5790)
	ld a, LUCKY_CHANNEL
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LuckyChannelName
	ret

LoadStation_BuenasPassword: ; 917a5 (24:57a5)
	ld a, BUENAS_PASSWORD
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, NotBuenasPasswordName
	ld a, [StatusFlags2]
	bit 0, a
	ret z
	ld de, BuenasPasswordName
	ret
; 917c3 (24:57c3)

BuenasPasswordName:    db "BUENA'S PASSWORD@"
NotBuenasPasswordName: db "@"

LoadStation_UnownRadio: ; 917d5 (24:57d5)
	ld a, UNOWN_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, UnknownStationName
	ret

LoadStation_PlacesAndPeople: ; 917ea (24:57ea)
	ld a, PLACES_AND_PEOPLE
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PlacesAndPeopleName
	ret

LoadStation_LetsAllSing: ; 917ff (24:57ff)
	ld a, LETS_ALL_SING
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LetsAllSingName
	ret
; 91814 (24:5814)

LoadStation_RocketRadio: ; 91814
	ld a, ROCKET_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LetsAllSingName
	ret
; 91829

LoadStation_PokeFluteRadio: ; 91829 (24:5829)
	ld a, POKE_FLUTE_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokeFluteStationName
	ret

LoadStation_EvolutionRadio: ; 9183e (24:583e)
	ld a, EVOLUTION_RADIO
	ld [wd002], a
	xor a
	ld [wd005], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, UnknownStationName
	ret
; 91853 (24:5853)

LoadStation_Dummy: ; 91853
	ret

RadioMusicRestartDE: ; 91854 (24:5854)
	push de
	ld a, e
	ld [wc6dc], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	ret

RadioMusicRestartPokemonChannel: ; 91868 (24:5868)
	push de
	ld a, $fe
	ld [wc6dc], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld de, MUSIC_POKEMON_CHANNEL
	call PlayMusic
	ret

Radio_BackUpFarCallParams: ; 9187c (24:587c)
	ld [wc6d9], a
	ld a, l
	ld [wc6da], a
	ld a, h
	ld [wc6db], a
	ret

NoRadioStation: ; 91888 (24:5888)
	call NoRadioMusic
	call NoRadioName
	xor a
	ld [wc6d9], a
	ld [wc6da], a
	ld [wc6db], a
	ld a, $1
	ld [hBGMapMode], a
	ret

NoRadioMusic: ; 9189d (24:589d)
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, $ff
	ld [wc6dc], a
	ret

NoRadioName: ; 918a9 (24:58a9)
	xor a
	ld [hBGMapMode], a
	hlcoord 1, 8
	lb bc, 3, 18
	call ClearBox
	hlcoord 0, 12
	ld bc, $412
	call TextBox
	ret
; 918bf

OaksPkmnTalkName:     db "OAK's <PK><MN> Talk@"
PokedexShowName:      db "#DEX Show@"
PokemonMusicName:     db "#MON Music@"
LuckyChannelName:     db "Lucky Channel@"
UnknownStationName:   db "?????@"
PlacesAndPeopleName:  db "Places & People@"
LetsAllSingName:      db "Let's All Sing!@"
PokeFluteStationName: db "# FLUTE@"
; 9191c


Function9191c: ; 9191c
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call Function90c4e
	callba Function8cf53
	ld a, 8
	call SkipMusic
	ld a, $e3
	ld [rLCDC], a
	call Function90d56
	ld [wd002], a
	ld [wd003], a
	xor a
	ld [hBGMapMode], a
	call Function91a04
	call Function3200
	ld a, [wd002]
	call Function9106a
	ld a, [wd003]
	call Function91098
	ld a, c
	ld [wd004], a
	ld a, b
	ld [wd005], a
	ld b, SCGB_02
	call GetSGBLayout
	call SetPalettes
	ld a, [hCGB]
	and a
	jr z, .asm_9198b
	ld a, $e4
	call Functioncf8
	call DelayFrame

.asm_9198b
	ld a, [wd002]
	cp KANTO_LANDMARK
	jr nc, .asm_9199b
	ld d, KANTO_LANDMARK - 1
	ld e, 1
	call Function919b0
	jr .asm_919a1

.asm_9199b
	call Function910e8
	call Function919b0

.asm_919a1
	pop af
	ld [VramState], a
	pop af
	ld [hInMenu], a
	pop af
	ld [Options], a
	call ClearBGPalettes
	ret
; 919b0

Function919b0: ; 919b0
.asm_919b0
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	ret nz
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_919d4
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_919e1
.asm_919c7
	push de
	callba Function8cf69
	pop de
	call DelayFrame
	jr .asm_919b0

.asm_919d4
	ld hl, wd003
	ld a, [hl]
	cp d
	jr c, .asm_919de
	ld a, e
	dec a
	ld [hl], a

.asm_919de
	inc [hl]
	jr .asm_919ec

.asm_919e1
	ld hl, wd003
	ld a, [hl]
	cp e
	jr nz, .asm_919eb
	ld a, d
	inc a
	ld [hl], a

.asm_919eb
	dec [hl]

.asm_919ec
	push de
	ld a, [wd003]
	call Function910b4
	ld a, [wd004]
	ld c, a
	ld a, [wd005]
	ld b, a
	ld a, [wd003]
	call Function910d4
	pop de
	jr .asm_919c7
; 91a04

Function91a04: ; 91a04
	ld a, [wd002]
	cp KANTO_LANDMARK
	jr nc, .asm_91a0f
	ld e, $0
	jr .asm_91a11

.asm_91a0f
	ld e, $1

.asm_91a11
	callba Function91ae1
	ld a, $7
	ld bc, 6
	hlcoord 1, 0
	call ByteFill
	hlcoord 0, 0
	ld [hl], $6
	hlcoord 7, 0
	ld [hl], $17
	hlcoord 7, 1
	ld [hl], $16
	hlcoord 7, 2
	ld [hl], $26
	ld a, $7
	ld bc, NAME_LENGTH
	hlcoord 8, 2
	call ByteFill
	hlcoord 19, 2
	ld [hl], $17
	ld a, [wd003]
	call Function910b4
	callba TownMapPals
	ret
; 91a53

PlayRadio: ; 91a53
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call .PlayStation
	ld c, 100
	call DelayFrames
.loop
	call JoyTextDelay
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	jr nz, .stop
	ld a, [wc6da]
	ld l, a
	ld a, [wc6db]
	ld h, a
	ld a, [wc6d9]
	and a
	jr z, .zero
	rst FarCall

.zero
	call DelayFrame
	jr .loop

.stop
	pop af
	ld [Options], a
	call Function91492
	ret
; 91a87

.PlayStation: ; 91a87
	ld a, -1
	ld [EnemyTurnsTaken], a
	ld hl, .StationPointers
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .jump_return
	push de
	jp [hl]

.jump_return
	push de
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	hlcoord 1, 14
	ld [hl], $72
	pop de
	hlcoord 2, 14
	call PlaceString
	ld h, b
	ld l, c
	ld [hl], $73
	call WaitBGMap
	ret
; 91ab9

.StationPointers: ; 91ab9
	dw .OakOrPnP
	dw LoadStation_OaksPokemonTalk
	dw LoadStation_PokedexShow
	dw LoadStation_PokemonMusic
	dw LoadStation_LuckyChannel
	dw LoadStation_UnownRadio
	dw LoadStation_PlacesAndPeople
	dw LoadStation_LetsAllSing
	dw LoadStation_RocketRadio
; 91acb

.OakOrPnP: ; 91acb
	call IsInJohto
	and a
	jr nz, .kanto
	call UpdateTime
	ld a, [TimeOfDay]
	and a
	jp z, LoadStation_PokedexShow
	jp LoadStation_OaksPokemonTalk

.kanto
	jp LoadStation_PlacesAndPeople
; 91ae1
