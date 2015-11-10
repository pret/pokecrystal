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
