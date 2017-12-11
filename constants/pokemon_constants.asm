; pokemon ids
; indexes for:
; - CryHeaders (see audio/cry_headers.asm)
; - BaseData (see data/base_stats.asm)
; - EggMovePointers (see data/egg_move_pointers.asm)
; - EvosAttacksPointers (see data/evos_attacks_pointers.asm)
; - PokemonNames (see data/pokemon_names.asm)
; - PokedexDataPointerTable (see data/pokedex/entry_pointers.asm)
; - AnimationPointers (see gfx/pics/anim_pointers.asm)
; - BitmasksPointers (see gfx/pics/bitmask_pointers.asm)
; - AnimationExtraPointers (see gfx/pics/extra_pointers.asm)
; - FramesPointers (see gfx/pics/frame_pointers.asm)
; - PokemonPalettes (see gfx/pics/palette_pointers.asm)
; - PicPointers (see gfx/pics/pic_pointers.asm)
; - AlphabeticalPokedexOrder (see data/pokedex/order_alpha.asm)
; - NewPokedexOrder (see data/pokedex/order_new.asm)
; - MonMenuIcons (see menu/mon_icons.asm)
; - Pokered_MonIndices (see engine/time_capsule/conversion.asm)
; - SortedPokemon (see misc/fixed_words.asm)
const_value set 1
	const BULBASAUR  ; 01
	const IVYSAUR    ; 02
	const VENUSAUR   ; 03
	const CHARMANDER ; 04
	const CHARMELEON ; 05
	const CHARIZARD  ; 06
	const SQUIRTLE   ; 07
	const WARTORTLE  ; 08
	const BLASTOISE  ; 09
	const CATERPIE   ; 0a
	const METAPOD    ; 0b
	const BUTTERFREE ; 0c
	const WEEDLE     ; 0d
	const KAKUNA     ; 0e
	const BEEDRILL   ; 0f
	const PIDGEY     ; 10
	const PIDGEOTTO  ; 11
	const PIDGEOT    ; 12
	const RATTATA    ; 13
	const RATICATE   ; 14
	const SPEAROW    ; 15
	const FEAROW     ; 16
	const EKANS      ; 17
	const ARBOK      ; 18
	const PIKACHU    ; 19
	const RAICHU     ; 1a
	const SANDSHREW  ; 1b
	const SANDSLASH  ; 1c
	const NIDORAN_F  ; 1d
	const NIDORINA   ; 1e
	const NIDOQUEEN  ; 1f
	const NIDORAN_M  ; 20
	const NIDORINO   ; 21
	const NIDOKING   ; 22
	const CLEFAIRY   ; 23
	const CLEFABLE   ; 24
	const VULPIX     ; 25
	const NINETALES  ; 26
	const JIGGLYPUFF ; 27
	const WIGGLYTUFF ; 28
	const ZUBAT      ; 29
	const GOLBAT     ; 2a
	const ODDISH     ; 2b
	const GLOOM      ; 2c
	const VILEPLUME  ; 2d
	const PARAS      ; 2e
	const PARASECT   ; 2f
	const VENONAT    ; 30
	const VENOMOTH   ; 31
	const DIGLETT    ; 32
	const DUGTRIO    ; 33
	const MEOWTH     ; 34
	const PERSIAN    ; 35
	const PSYDUCK    ; 36
	const GOLDUCK    ; 37
	const MANKEY     ; 38
	const PRIMEAPE   ; 39
	const GROWLITHE  ; 3a
	const ARCANINE   ; 3b
	const POLIWAG    ; 3c
	const POLIWHIRL  ; 3d
	const POLIWRATH  ; 3e
	const ABRA       ; 3f
	const KADABRA    ; 40
	const ALAKAZAM   ; 41
	const MACHOP     ; 42
	const MACHOKE    ; 43
	const MACHAMP    ; 44
	const BELLSPROUT ; 45
	const WEEPINBELL ; 46
	const VICTREEBEL ; 47
	const TENTACOOL  ; 48
	const TENTACRUEL ; 49
	const GEODUDE    ; 4a
	const GRAVELER   ; 4b
	const GOLEM      ; 4c
	const PONYTA     ; 4d
	const RAPIDASH   ; 4e
	const SLOWPOKE   ; 4f
	const SLOWBRO    ; 50
	const MAGNEMITE  ; 51
	const MAGNETON   ; 52
	const FARFETCH_D ; 53
	const DODUO      ; 54
	const DODRIO     ; 55
	const SEEL       ; 56
	const DEWGONG    ; 57
	const GRIMER     ; 58
	const MUK        ; 59
	const SHELLDER   ; 5a
	const CLOYSTER   ; 5b
	const GASTLY     ; 5c
	const HAUNTER    ; 5d
	const GENGAR     ; 5e
	const ONIX       ; 5f
	const DROWZEE    ; 60
	const HYPNO      ; 61
	const KRABBY     ; 62
	const KINGLER    ; 63
	const VOLTORB    ; 64
	const ELECTRODE  ; 65
	const EXEGGCUTE  ; 66
	const EXEGGUTOR  ; 67
	const CUBONE     ; 68
	const MAROWAK    ; 69
	const HITMONLEE  ; 6a
	const HITMONCHAN ; 6b
	const LICKITUNG  ; 6c
	const KOFFING    ; 6d
	const WEEZING    ; 6e
	const RHYHORN    ; 6f
	const RHYDON     ; 70
	const CHANSEY    ; 71
	const TANGELA    ; 72
	const KANGASKHAN ; 73
	const HORSEA     ; 74
	const SEADRA     ; 75
	const GOLDEEN    ; 76
	const SEAKING    ; 77
	const STARYU     ; 78
	const STARMIE    ; 79
	const MR__MIME   ; 7a
	const SCYTHER    ; 7b
	const JYNX       ; 7c
	const ELECTABUZZ ; 7d
	const MAGMAR     ; 7e
	const PINSIR     ; 7f
	const TAUROS     ; 80
	const MAGIKARP   ; 81
	const GYARADOS   ; 82
	const LAPRAS     ; 83
	const DITTO      ; 84
	const EEVEE      ; 85
	const VAPOREON   ; 86
	const JOLTEON    ; 87
	const FLAREON    ; 88
	const PORYGON    ; 89
	const OMANYTE    ; 8a
	const OMASTAR    ; 8b
	const KABUTO     ; 8c
	const KABUTOPS   ; 8d
	const AERODACTYL ; 8e
	const SNORLAX    ; 8f
	const ARTICUNO   ; 90
	const ZAPDOS     ; 91
	const MOLTRES    ; 92
	const DRATINI    ; 93
	const DRAGONAIR  ; 94
	const DRAGONITE  ; 95
	const MEWTWO     ; 96
	const MEW        ; 97
	const CHIKORITA  ; 98
	const BAYLEEF    ; 99
	const MEGANIUM   ; 9a
	const CYNDAQUIL  ; 9b
	const QUILAVA    ; 9c
	const TYPHLOSION ; 9d
	const TOTODILE   ; 9e
	const CROCONAW   ; 9f
	const FERALIGATR ; a0
	const SENTRET    ; a1
	const FURRET     ; a2
	const HOOTHOOT   ; a3
	const NOCTOWL    ; a4
	const LEDYBA     ; a5
	const LEDIAN     ; a6
	const SPINARAK   ; a7
	const ARIADOS    ; a8
	const CROBAT     ; a9
	const CHINCHOU   ; aa
	const LANTURN    ; ab
	const PICHU      ; ac
	const CLEFFA     ; ad
	const IGGLYBUFF  ; ae
	const TOGEPI     ; af
	const TOGETIC    ; b0
	const NATU       ; b1
	const XATU       ; b2
	const MAREEP     ; b3
	const FLAAFFY    ; b4
	const AMPHAROS   ; b5
	const BELLOSSOM  ; b6
	const MARILL     ; b7
	const AZUMARILL  ; b8
	const SUDOWOODO  ; b9
	const POLITOED   ; ba
	const HOPPIP     ; bb
	const SKIPLOOM   ; bc
	const JUMPLUFF   ; bd
	const AIPOM      ; be
	const SUNKERN    ; bf
	const SUNFLORA   ; c0
	const YANMA      ; c1
	const WOOPER     ; c2
	const QUAGSIRE   ; c3
	const ESPEON     ; c4
	const UMBREON    ; c5
	const MURKROW    ; c6
	const SLOWKING   ; c7
	const MISDREAVUS ; c8
	const UNOWN      ; c9
	const WOBBUFFET  ; ca
	const GIRAFARIG  ; cb
	const PINECO     ; cc
	const FORRETRESS ; cd
	const DUNSPARCE  ; ce
	const GLIGAR     ; cf
	const STEELIX    ; d0
	const SNUBBULL   ; d1
	const GRANBULL   ; d2
	const QWILFISH   ; d3
	const SCIZOR     ; d4
	const SHUCKLE    ; d5
	const HERACROSS  ; d6
	const SNEASEL    ; d7
	const TEDDIURSA  ; d8
	const URSARING   ; d9
	const SLUGMA     ; da
	const MAGCARGO   ; db
	const SWINUB     ; dc
	const PILOSWINE  ; dd
	const CORSOLA    ; de
	const REMORAID   ; df
	const OCTILLERY  ; e0
	const DELIBIRD   ; e1
	const MANTINE    ; e2
	const SKARMORY   ; e3
	const HOUNDOUR   ; e4
	const HOUNDOOM   ; e5
	const KINGDRA    ; e6
	const PHANPY     ; e7
	const DONPHAN    ; e8
	const PORYGON2   ; e9
	const STANTLER   ; ea
	const SMEARGLE   ; eb
	const TYROGUE    ; ec
	const HITMONTOP  ; ed
	const SMOOCHUM   ; ee
	const ELEKID     ; ef
	const MAGBY      ; f0
	const MILTANK    ; f1
	const BLISSEY    ; f2
	const RAIKOU     ; f3
	const ENTEI      ; f4
	const SUICUNE    ; f5
	const LARVITAR   ; f6
	const PUPITAR    ; f7
	const TYRANITAR  ; f8
	const LUGIA      ; f9
	const HO_OH      ; fa
	const CELEBI     ; fb
NUM_POKEMON EQU const_value +- 1
	const MON_FC     ; fc
	const EGG        ; fd
	const MON_FE     ; fe

; party_struct members (see macros/wram.asm)
MON_SPECIES              EQUS "(PartyMon1Species - PartyMon1)"
MON_ITEM                 EQUS "(PartyMon1Item - PartyMon1)"
MON_MOVES                EQUS "(PartyMon1Moves - PartyMon1)"
MON_ID                   EQUS "(PartyMon1ID - PartyMon1)"
MON_EXP                  EQUS "(PartyMon1Exp - PartyMon1)"
MON_STAT_EXP             EQUS "(PartyMon1StatExp - PartyMon1)"
MON_HP_EXP               EQUS "(PartyMon1HPExp - PartyMon1)"
MON_ATK_EXP              EQUS "(PartyMon1AtkExp - PartyMon1)"
MON_DEF_EXP              EQUS "(PartyMon1DefExp - PartyMon1)"
MON_SPD_EXP              EQUS "(PartyMon1SpdExp - PartyMon1)"
MON_SPC_EXP              EQUS "(PartyMon1SpcExp - PartyMon1)"
MON_DVS                  EQUS "(PartyMon1DVs - PartyMon1)"
MON_PP                   EQUS "(PartyMon1PP - PartyMon1)"
MON_HAPPINESS            EQUS "(PartyMon1Happiness - PartyMon1)"
MON_PKRUS                EQUS "(PartyMon1PokerusStatus - PartyMon1)"
MON_CAUGHTDATA           EQUS "(PartyMon1CaughtData - PartyMon1)"
MON_CAUGHTLEVEL          EQUS "(PartyMon1CaughtLevel - PartyMon1)"
MON_CAUGHTTIME           EQUS "(PartyMon1CaughtTime - PartyMon1)"
MON_CAUGHTGENDER         EQUS "(PartyMon1CaughtGender - PartyMon1)"
MON_CAUGHTLOCATION       EQUS "(PartyMon1CaughtLocation - PartyMon1)"
MON_LEVEL                EQUS "(PartyMon1Level - PartyMon1)"
MON_STATUS               EQUS "(PartyMon1Status - PartyMon1)"
MON_HP                   EQUS "(PartyMon1HP - PartyMon1)"
MON_MAXHP                EQUS "(PartyMon1MaxHP - PartyMon1)"
MON_ATK                  EQUS "(PartyMon1Attack - PartyMon1)"
MON_DEF                  EQUS "(PartyMon1Defense - PartyMon1)"
MON_SPD                  EQUS "(PartyMon1Speed - PartyMon1)"
MON_SAT                  EQUS "(PartyMon1SpclAtk - PartyMon1)"
MON_SDF                  EQUS "(PartyMon1SpclDef - PartyMon1)"
BOXMON_STRUCT_LENGTH     EQUS "(PartyMon1End - PartyMon1)"
PARTYMON_STRUCT_LENGTH   EQUS "(PartyMon1StatsEnd - PartyMon1)"
REDMON_STRUCT_LENGTH EQU 44

; MonMenuOptions indexes (see engine/mon_menu.asm)
const_value SET 1
; moves
	const MONMENU_CUT        ; 1
	const MONMENU_FLY        ; 2
	const MONMENU_SURF       ; 3
	const MONMENU_STRENGTH   ; 4
	const MONMENU_WATERFALL  ; 5
	const MONMENU_FLASH      ; 6
	const MONMENU_WHIRLPOOL  ; 7
	const MONMENU_DIG        ; 8
	const MONMENU_TELEPORT   ; 9
	const MONMENU_SOFTBOILED ; 10
	const MONMENU_HEADBUTT   ; 11
	const MONMENU_ROCKSMASH  ; 12
	const MONMENU_MILKDRINK  ; 13
	const MONMENU_SWEETSCENT ; 14
; options
	const MONMENU_STATS      ; 15
	const MONMENU_SWITCH     ; 16
	const MONMENU_ITEM       ; 17
	const MONMENU_CANCEL     ; 18
	const MONMENU_MOVE       ; 19
	const MONMENU_MAIL       ; 20
	const MONMENU_ERROR      ; 21

; MonMenuOptions types
MONMENU_FIELD_MOVE EQU 0
MONMENU_MENUOPTION EQU 1

NUM_MONMENU_ITEMS EQU 8

; maximum number of party pokemon
PARTY_LENGTH EQU 6

; number of Unown forms
NUM_UNOWN EQU 26
