; These functions seem to be related to backwards compatibility

ValidateOTTrademon: ; fb57e
	ld a, [wd003]
	ld hl, OTPartyMon1Species
	call GetPartyLocation
	push hl
	ld a, [wd003]
	inc a
	ld c, a
	ld b, 0
	ld hl, OTPartyCount
	add hl, bc
	ld a, [hl]
	pop hl
	cp EGG
	jr z, .matching_or_egg
	cp [hl]
	jr nz, .abnormal

.matching_or_egg
	ld b, h
	ld c, l
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp MAX_LEVEL + 1
	jr nc, .abnormal
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr nz, .normal
	ld hl, OTPartySpecies
	ld a, [wd003]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]

	; Magnemite and Magneton's types changed
	; from Electric to Electric/Steel.
	cp MAGNEMITE
	jr z, .normal
	cp MAGNETON
	jr z, .normal

	ld [CurSpecies], a
	call GetBaseData
	ld hl, wLinkOTPartyMonTypes
	add hl, bc
	add hl, bc
	ld a, [BaseType1]
	cp [hl]
	jr nz, .abnormal
	inc hl
	ld a, [BaseType2]
	cp [hl]
	jr nz, .abnormal

.normal
	and a
	ret

.abnormal
	scf
	ret
; fb5dd

Functionfb5dd: ; fb5dd
	ld a, [wd002]
	ld d, a
	ld a, [PartyCount]
	ld b, a
	ld c, $0
.loop
	ld a, c
	cp d
	jr z, .next
	push bc
	ld a, c
	ld hl, PartyMon1HP
	call GetPartyLocation
	pop bc
	ld a, [hli]
	or [hl]
	jr nz, .done

.next
	inc c
	dec b
	jr nz, .loop
	ld a, [wd003]
	ld hl, OTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	jr nz, .done
	scf
	ret

.done
	and a
	ret
; fb60d

PlaceTradePartnerNamesAndParty: ; fb60d
	hlcoord 4, 0
	ld de, PlayerName
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 4, 8
	ld de, OTPlayerName
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 7, 1
	ld de, PartySpecies
	call .PlaceSpeciesNames
	hlcoord 7, 9
	ld de, OTPartySpecies
.PlaceSpeciesNames: ; fb634
	ld c, $0
.loop
	ld a, [de]
	cp -1
	ret z
	ld [wd265], a
	push bc
	push hl
	push de
	push hl
	ld a, c
	ld [hProduct], a
	call GetPokemonName
	pop hl
	call PlaceString
	pop de
	inc de
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	inc c
	jr .loop
; fb656

KantoMonSpecials: ; fb656
; The original special base stat for
; each Kanto monster from Red/Blue.
	db  65 ; BULBASAUR
	db  80 ; IVYSAUR
	db 100 ; VENUSAUR
	db  50 ; CHARMANDER
	db  65 ; CHARMELEON
	db  85 ; CHARIZARD
	db  50 ; SQUIRTLE
	db  65 ; WARTORTLE
	db  85 ; BLASTOISE
	db  20 ; CATERPIE
	db  25 ; METAPOD
	db  80 ; BUTTERFREE
	db  20 ; WEEDLE
	db  25 ; KAKUNA
	db  45 ; BEEDRILL
	db  35 ; PIDGEY
	db  50 ; PIDGEOTTO
	db  70 ; PIDGEOT
	db  25 ; RATTATA
	db  50 ; RATICATE
	db  31 ; SPEAROW
	db  61 ; FEAROW
	db  40 ; EKANS
	db  65 ; ARBOK
	db  50 ; PIKACHU
	db  90 ; RAICHU
	db  30 ; SANDSHREW
	db  55 ; SANDSLASH
	db  40 ; NIDORAN_F
	db  55 ; NIDORINA
	db  75 ; NIDOQUEEN
	db  40 ; NIDORAN_M
	db  55 ; NIDORINO
	db  75 ; NIDOKING
	db  60 ; CLEFAIRY
	db  85 ; CLEFABLE
	db  65 ; VULPIX
	db 100 ; NINETALES
	db  25 ; JIGGLYPUFF
	db  50 ; WIGGLYTUFF
	db  40 ; ZUBAT
	db  75 ; GOLBAT
	db  75 ; ODDISH
	db  85 ; GLOOM
	db 100 ; VILEPLUME
	db  55 ; PARAS
	db  80 ; PARASECT
	db  40 ; VENONAT
	db  90 ; VENOMOTH
	db  45 ; DIGLETT
	db  70 ; DUGTRIO
	db  40 ; MEOWTH
	db  65 ; PERSIAN
	db  50 ; PSYDUCK
	db  80 ; GOLDUCK
	db  35 ; MANKEY
	db  60 ; PRIMEAPE
	db  50 ; GROWLITHE
	db  80 ; ARCANINE
	db  40 ; POLIWAG
	db  50 ; POLIWHIRL
	db  70 ; POLIWRATH
	db 105 ; ABRA
	db 120 ; KADABRA
	db 135 ; ALAKAZAM
	db  35 ; MACHOP
	db  50 ; MACHOKE
	db  65 ; MACHAMP
	db  70 ; BELLSPROUT
	db  85 ; WEEPINBELL
	db 100 ; VICTREEBEL
	db 100 ; TENTACOOL
	db 120 ; TENTACRUEL
	db  30 ; GEODUDE
	db  45 ; GRAVELER
	db  55 ; GOLEM
	db  65 ; PONYTA
	db  80 ; RAPIDASH
	db  40 ; SLOWPOKE
	db  80 ; SLOWBRO
	db  95 ; MAGNEMITE
	db 120 ; MAGNETON
	db  58 ; FARFETCH_D
	db  35 ; DODUO
	db  60 ; DODRIO
	db  70 ; SEEL
	db  95 ; DEWGONG
	db  40 ; GRIMER
	db  65 ; MUK
	db  45 ; SHELLDER
	db  85 ; CLOYSTER
	db 100 ; GASTLY
	db 115 ; HAUNTER
	db 130 ; GENGAR
	db  30 ; ONIX
	db  90 ; DROWZEE
	db 115 ; HYPNO
	db  25 ; KRABBY
	db  50 ; KINGLER
	db  55 ; VOLTORB
	db  80 ; ELECTRODE
	db  60 ; EXEGGCUTE
	db 125 ; EXEGGUTOR
	db  40 ; CUBONE
	db  50 ; MAROWAK
	db  35 ; HITMONLEE
	db  35 ; HITMONCHAN
	db  60 ; LICKITUNG
	db  60 ; KOFFING
	db  85 ; WEEZING
	db  30 ; RHYHORN
	db  45 ; RHYDON
	db 105 ; CHANSEY
	db 100 ; TANGELA
	db  40 ; KANGASKHAN
	db  70 ; HORSEA
	db  95 ; SEADRA
	db  50 ; GOLDEEN
	db  80 ; SEAKING
	db  70 ; STARYU
	db 100 ; STARMIE
	db 100 ; MR__MIME
	db  55 ; SCYTHER
	db  95 ; JYNX
	db  85 ; ELECTABUZZ
	db  85 ; MAGMAR
	db  55 ; PINSIR
	db  70 ; TAUROS
	db  20 ; MAGIKARP
	db 100 ; GYARADOS
	db  95 ; LAPRAS
	db  48 ; DITTO
	db  65 ; EEVEE
	db 110 ; VAPOREON
	db 110 ; JOLTEON
	db 110 ; FLAREON
	db  75 ; PORYGON
	db  90 ; OMANYTE
	db 115 ; OMASTAR
	db  45 ; KABUTO
	db  70 ; KABUTOPS
	db  60 ; AERODACTYL
	db  65 ; SNORLAX
	db 125 ; ARTICUNO
	db 125 ; ZAPDOS
	db 125 ; MOLTRES
	db  50 ; DRATINI
	db  70 ; DRAGONAIR
	db 100 ; DRAGONITE
	db 154 ; MEWTWO
	db 100 ; MEW
; fb6ed


INCLUDE "event/name_rater.asm"


PlaySlowCry: ; fb841
	ld a, [ScriptVar]
	call LoadCryHeader
	jr c, .done

	ld hl, CryPitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, -$140
	add hl, bc
	ld a, l
	ld [CryPitch], a
	ld a, h
	ld [CryPitch + 1], a
	ld hl, CryLength
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $60
	add hl, bc
	ld a, l
	ld [CryLength], a
	ld a, h
	ld [CryLength + 1], a
	callba _PlayCryHeader
	call WaitSFX

.done
	ret
; fb877

NewPokedexEntry: ; fb877
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	call LowVolume
	call ClearBGPalettes
	call ClearTileMap
	call UpdateSprites
	call ClearSprites
	ld a, [wPokedexStatus]
	push af
	ld a, [hSCX]
	add $5
	ld [hSCX], a
	xor a
	ld [wPokedexStatus], a
	callba _NewPokedexEntry
	call WaitPressAorB_BlinkCursor
	ld a, $1
	ld [wPokedexStatus], a
	callba DisplayDexEntry
	call WaitPressAorB_BlinkCursor
	pop af
	ld [wPokedexStatus], a
	call MaxVolume
	call RotateThreePalettesRight
	ld a, [hSCX]
	add -5 ; 251 ; NUM_POKEMON
	ld [hSCX], a
	call .ReturnFromDexRegistration
	pop af
	ld [hMapAnims], a
	ret
; fb8c8

.ReturnFromDexRegistration: ; fb8c8
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	callba Pokedex_PlaceFrontpicTopLeftCorner
	call WaitBGMap2
	callba GetEnemyMonDVs
	ld a, [hli]
	ld [TempMonDVs], a
	ld a, [hl]
	ld [TempMonDVs + 1], a
	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call SetPalettes
	ret
; fb8f1

ConvertMon_2to1: ; fb8f1
; Takes the Gen-2 Pokemon number stored in wd265, finds it in the Pokered_MonIndices table, and returns its index in wd265.
	push bc
	push hl
	ld a, [wd265]
	ld b, a
	ld c, 0
	ld hl, Pokered_MonIndices
.loop
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop
	ld a, c
	ld [wd265], a
	pop hl
	pop bc
	ret
; fb908

ConvertMon_1to2: ; fb908
; Takes the Gen-1 Pokemon number stored in wd265 and returns the corresponding value from Pokered_MonIndices in wd265.
	push bc
	push hl
	ld a, [wd265]
	dec a
	ld hl, Pokered_MonIndices
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wd265], a
	pop hl
	pop bc
	ret
; fb91c

Pokered_MonIndices: ; fb91c
	db RHYDON
	db KANGASKHAN
	db NIDORAN_M
	db CLEFAIRY
	db SPEAROW
	db VOLTORB
	db NIDOKING
	db SLOWBRO
	db IVYSAUR
	db EXEGGUTOR
	db LICKITUNG
	db EXEGGCUTE
	db GRIMER
	db GENGAR
	db NIDORAN_F
	db NIDOQUEEN
	db CUBONE
	db RHYHORN
	db LAPRAS
	db ARCANINE
	db MEW
	db GYARADOS
	db SHELLDER
	db TENTACOOL
	db GASTLY
	db SCYTHER
	db STARYU
	db BLASTOISE
	db PINSIR
	db TANGELA
	db SCIZOR
	db SHUCKLE
	db GROWLITHE
	db ONIX
	db FEAROW
	db PIDGEY
	db SLOWPOKE
	db KADABRA
	db GRAVELER
	db CHANSEY
	db MACHOKE
	db MR__MIME
	db HITMONLEE
	db HITMONCHAN
	db ARBOK
	db PARASECT
	db PSYDUCK
	db DROWZEE
	db GOLEM
	db HERACROSS
	db MAGMAR
	db HO_OH
	db ELECTABUZZ
	db MAGNETON
	db KOFFING
	db SNEASEL
	db MANKEY
	db SEEL
	db DIGLETT
	db TAUROS
	db TEDDIURSA
	db URSARING
	db SLUGMA
	db FARFETCH_D
	db VENONAT
	db DRAGONITE
	db MAGCARGO
	db SWINUB
	db PILOSWINE
	db DODUO
	db POLIWAG
	db JYNX
	db MOLTRES
	db ARTICUNO
	db ZAPDOS
	db DITTO
	db MEOWTH
	db KRABBY
	db CORSOLA
	db REMORAID
	db OCTILLERY
	db VULPIX
	db NINETALES
	db PIKACHU
	db RAICHU
	db DELIBIRD
	db MANTINE
	db DRATINI
	db DRAGONAIR
	db KABUTO
	db KABUTOPS
	db HORSEA
	db SEADRA
	db SKARMORY
	db HOUNDOUR
	db SANDSHREW
	db SANDSLASH
	db OMANYTE
	db OMASTAR
	db JIGGLYPUFF
	db WIGGLYTUFF
	db EEVEE
	db FLAREON
	db JOLTEON
	db VAPOREON
	db MACHOP
	db ZUBAT
	db EKANS
	db PARAS
	db POLIWHIRL
	db POLIWRATH
	db WEEDLE
	db KAKUNA
	db BEEDRILL
	db HOUNDOOM
	db DODRIO
	db PRIMEAPE
	db DUGTRIO
	db VENOMOTH
	db DEWGONG
	db KINGDRA
	db PHANPY
	db CATERPIE
	db METAPOD
	db BUTTERFREE
	db MACHAMP
	db DONPHAN
	db GOLDUCK
	db HYPNO
	db GOLBAT
	db MEWTWO
	db SNORLAX
	db MAGIKARP
	db PORYGON2
	db STANTLER
	db MUK
	db SMEARGLE
	db KINGLER
	db CLOYSTER
	db TYROGUE
	db ELECTRODE
	db CLEFABLE
	db WEEZING
	db PERSIAN
	db MAROWAK
	db HITMONTOP
	db HAUNTER
	db ABRA
	db ALAKAZAM
	db PIDGEOTTO
	db PIDGEOT
	db STARMIE
	db BULBASAUR
	db VENUSAUR
	db TENTACRUEL
	db SMOOCHUM
	db GOLDEEN
	db SEAKING
	db ELEKID
	db MAGBY
	db MILTANK
	db BLISSEY
	db PONYTA
	db RAPIDASH
	db RATTATA
	db RATICATE
	db NIDORINO
	db NIDORINA
	db GEODUDE
	db PORYGON
	db AERODACTYL
	db RAIKOU
	db MAGNEMITE
	db ENTEI
	db SUICUNE
	db CHARMANDER
	db SQUIRTLE
	db CHARMELEON
	db WARTORTLE
	db CHARIZARD
	db LARVITAR
	db PUPITAR
	db TYRANITAR
	db LUGIA
	db ODDISH
	db GLOOM
	db VILEPLUME
	db BELLSPROUT
	db WEEPINBELL
	db VICTREEBEL
	db CHIKORITA
	db BAYLEEF
	db MEGANIUM
	db CYNDAQUIL
	db QUILAVA
	db TYPHLOSION
	db TOTODILE
	db CROCONAW
	db FERALIGATR
	db SENTRET
	db FURRET
	db HOOTHOOT
	db NOCTOWL
	db LEDYBA
	db LEDIAN
	db SPINARAK
	db ARIADOS
	db CROBAT
	db CHINCHOU
	db LANTURN
	db PICHU
	db CLEFFA
	db IGGLYBUFF
	db TOGEPI
	db TOGETIC
	db NATU
	db XATU
	db MAREEP
	db FLAAFFY
	db AMPHAROS
	db BELLOSSOM
	db MARILL
	db AZUMARILL
	db SUDOWOODO
	db POLITOED
	db HOPPIP
	db SKIPLOOM
	db JUMPLUFF
	db AIPOM
	db SUNKERN
	db SUNFLORA
	db YANMA
	db WOOPER
	db QUAGSIRE
	db ESPEON
	db UMBREON
	db MURKROW
	db SLOWKING
	db MISDREAVUS
	db UNOWN
	db WOBBUFFET
	db GIRAFARIG
	db PINECO
	db FORRETRESS
	db DUNSPARCE
	db GLIGAR
	db STEELIX
	db SNUBBULL
	db GRANBULL
	db QWILFISH
	db WOBBUFFET
	db WOBBUFFET
; fba18
