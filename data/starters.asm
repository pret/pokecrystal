NUM_STARTER_CATEGORIES EQU 9

NUM_BASIC_STARTERS EQU 8
NUM_ROCKET_STARTERS EQU 3
NUM_ANIME_STARTERS EQU 3
NUM_COMMON_STARTERS EQU 13
NUM_UNCOMMON_STARTERS EQU 69
NUM_TRADE_STARTERS EQU 4
NUM_PSEUDO_LEGEND_STARTERS EQU 2
NUM_BABY_STARTERS EQU 9
NUM_CHALLENGE_STARTERS EQU 6

GetStarter:
	; store mon in hl
	ld a, [wStarterCursorPositionMon]
	ld e, a
	ld d, 0
 	call GetStartersInCategory
	add hl, de
	add hl, de
	ret

GetStartersInCategory:
	ld a, [wStarterCursorPositionCategory]
	maskbits NUM_STARTER_CATEGORIES
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable
	dw GetBasicStarters
	dw GetRocketStarters
	dw GetAnimeStarters
	dw GetCommonStarters
	dw GetUncommonStarters
	dw GetTradeStarters
	dw GetPseudoLegendaryStarters
	dw GetBabyStarters
	dw GetChallengeStarters


GetBasicStarters:
	ld hl, BasicStarters
	ld a, NUM_BASIC_STARTERS
	ld [wNumStartersInCategory], a
	ret

GetRocketStarters:
	ld hl, RocketStarters
	ld a, NUM_ROCKET_STARTERS
	ld [wNumStartersInCategory], a
	ret


GetAnimeStarters:
	ld hl, AnimeStarters
	ld a, NUM_ANIME_STARTERS
	ld [wNumStartersInCategory], a
	ret

GetCommonStarters:
	ld hl, CommonStarters
	ld a, NUM_COMMON_STARTERS
	ld [wNumStartersInCategory], a
	ret

GetUncommonStarters:
	ld hl, UncommonStarters
	ld a, NUM_UNCOMMON_STARTERS
	ld [wNumStartersInCategory], a
	ret

GetTradeStarters:
	ld hl, TradeStarters
    ld a, NUM_TRADE_STARTERS
	ld [wNumStartersInCategory], a
	ret

GetPseudoLegendaryStarters:
	ld hl, PseudoLegendStarters
    ld a, NUM_PSEUDO_LEGEND_STARTERS
	ld [wNumStartersInCategory], a
	ret

GetBabyStarters:
	ld hl, BabyStarters
	ld a, NUM_BABY_STARTERS
	ld [wNumStartersInCategory], a
	ret

GetChallengeStarters:
	ld hl, ChallengeStarters
    ld a, NUM_CHALLENGE_STARTERS
	ld [wNumStartersInCategory], a
	ret

BasicStarters:
	dw CHIKORITA
	dw CYNDAQUIL
	dw TOTODILE
	dw BULBASAUR
	dw CHARMANDER
	dw SQUIRTLE
	dw PIKACHU
	dw EEVEE

RocketStarters:
	dw MEOWTH
	dw EKANS
	dw KOFFING

AnimeStarters:
	dw PSYDUCK
	dw MAGIKARP
	dw MANKEY

CommonStarters:
	dw CATERPIE
	dw WEEDLE
	dw SPINARAK
	dw LEDYBA
	dw PIDGEY
	dw SPEAROW
	dw HOOTHOOT
	dw RATTATA
	dw SPEAROW
	dw NIDORAN_M
	dw NIDORAN_F
	dw ZUBAT
	dw TENTACOOL

UncommonStarters:
	dw SANDSHREW
	dw VULPIX
	dw ODDISH
	dw PARAS
	dw VENONAT
	dw DIGLETT
	dw GROWLITHE
	dw POLIWAG
	dw BELLSPROUT
	dw PONYTA
	dw SLOWPOKE
	dw MAGNEMITE
	dw DODUO
	dw SEEL
	dw GRIMER
	dw SHELLDER
	dw ONIX
	dw KRABBY
	dw VOLTORB
	dw EXEGGCUTE
	dw CUBONE
	dw LICKITUNG
	dw RHYHORN
	dw CHANSEY
	dw TANGELA
	dw KANGASKHAN
	dw HORSEA
	dw GOLDEEN
	dw STARYU
	dw MR__MIME
	dw SCYTHER
	dw PINSIR
	dw TAUROS
	dw LAPRAS
	dw SNORLAX
	dw PORYGON
	dw OMANYTE
	dw KABUTO
	dw AERODACTYL
	dw CHINCHOU
	dw NATU
	dw MAREEP
	dw MARILL
	dw SUDOWOODO
	dw HOPPIP
	dw AIPOM
	dw YANMA
	dw WOOPER
	dw MURKROW
	dw MISDREAVUS
	dw GIRAFARIG
	dw PINECO
	dw GLIGAR
	dw SNUBBULL
	dw QWILFISH
	dw HERACROSS
	dw SNEASEL
	dw TEDDIURSA
	dw SLUGMA
	dw SWINUB
	dw CORSOLA
	dw REMORAID
	dw DELIBIRD
	dw MANTINE
	dw SKARMORY
	dw HOUNDOUR
	dw PHANPY
	dw STANTLER
	dw MILTANK

TradeStarters
	dw ABRA
	dw MACHOP
	dw GEODUDE
	dw GASTLY

PseudoLegendStarters
	dw DRATINI
	dw LARVITAR

BabyStarters
	dw PICHU
	dw TOGEPI
	dw TYROGUE
	dw MAGBY
	dw ELEKID
	dw CLEFFA
	dw IGGLYBUFF
	dw SMOOCHUM
	dw SUNKERN

ChallengeStarters
	dw FARFETCH_D
	dw SHUCKLE
	dw WOBBUFFET
	dw SMEARGLE
	dw DITTO
	dw UNOWN