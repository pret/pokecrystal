NUM_STARTER_CATEGORIES EQU 12
NUM_TOTAL_STARTERS EQU 107

NUM_BASIC_STARTERS EQU 8
NUM_ROCKET_STARTERS EQU 4
NUM_ANIME_STARTERS EQU 3
NUM_NEW_EVO_STARTERS EQU 10
NUM_COMMON_STARTERS EQU 13
NUM_UNCOMMON_STARTERS EQU 48
NUM_FOSSIL_STARTERS EQU  3
NUM_SAFARI_STARTERS EQU 7
NUM_TRADE_STARTERS EQU 4
NUM_PSEUDO_LEGEND_STARTERS EQU 2
NUM_BABY_STARTERS EQU 8
NUM_CHALLENGE_STARTERS EQU 7

PopulateStarterInfo:
	push de
	; store mon in hl
	; set wram variables to allow for endless scroll in each category
	ld a, [wStarterCursorPositionMon]
	ld e, a
	ld d, 0
 	call GetStarterCategory
	add hl, de
	add hl, de
	pop de
	ret

GetStarterCategory:
	ld a, [wStarterCursorPositionCategory]
	maskbits NUM_STARTER_CATEGORIES
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable
	dw GetBasicStarters
	dw GetRocketStarters
	dw GetAnimeStarters
	dw GetNewEvoStarters
	dw GetCommonStarters
	dw GetUncommonStarters
	dw GetFossilStarters
	dw GetSafariStarters
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

GetNewEvoStarters
	ld hl, NewEvoStarters
	ld a, NUM_NEW_EVO_STARTERS
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

GetFossilStarters:
	ld hl, FossilStarters
	ld a, NUM_FOSSIL_STARTERS
	ld [wNumStartersInCategory], a
	ret

GetSafariStarters:
	ld hl, SafariStarters
	ld a, NUM_SAFARI_STARTERS
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

GetStarterCategoryName:
	push hl
	ld a, [wStarterCursorPositionCategory]
	ld hl, CategoryNames
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret

CategoryNames:
	dw .basic
	dw .rocket
	dw .anime
	dw .new_evo
	dw .common
	dw .uncommon
	dw .fossil
	dw .safari
	dw .trade
	dw .pseudo_legend
	dw .baby
	dw .challenge
.basic db "BASIC@"
.rocket db "ROCKET@"
.anime db "ANIME@"
.new_evo db "NEW EVO@"
.common db "COMMON@"
.uncommon db "UNCOMMON@"
.fossil db "FOSSIL@"
.safari db "SAFARI@"
.trade db "TRADE@"
.pseudo_legend db "PSEUDO L@"
.baby db "BABY@"
.challenge db "CHALLNGE@"

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
	dw GRIMER

AnimeStarters:
	dw PSYDUCK
	dw MAGIKARP
	dw MANKEY

NewEvoStarters:
	dw GLIGAR
	dw MAGNEMITE
	dw RHYHORN
	dw TANGELA
	dw PORYGON
	dw AIPOM
	dw YANMA
	dw MURKROW
	dw MISDREAVUS
	dw SNEASEL

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
	dw DODUO
	dw SEEL
	dw SHELLDER
	dw ONIX
	dw KRABBY
	dw VOLTORB
	dw CUBONE
	dw HORSEA
	dw GOLDEEN
	dw STARYU
	dw MR__MIME
	dw LAPRAS
	dw SNORLAX
	dw CHINCHOU
	dw NATU 
	dw MAREEP
	dw MARILL
	dw SUDOWOODO
	dw HOPPIP
	dw WOOPER
	dw GIRAFARIG 
	dw PINECO
	dw SNUBBULL
	dw QWILFISH
	dw HERACROSS
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

FossilStarters:
	dw OMANYTE
	dw KABUTO
	dw AERODACTYL

SafariStarters:
	dw TAUROS
	dw SCYTHER
	dw PINSIR
	dw CHANSEY
	dw KANGASKHAN
	dw EXEGGCUTE
	dw LICKITUNG

TradeStarters:
	dw ABRA
	dw MACHOP
	dw GEODUDE
	dw GASTLY

PseudoLegendStarters:
	dw DRATINI
	dw LARVITAR

BabyStarters:
	dw PICHU
	dw TOGEPI
	dw TYROGUE
	dw MAGBY
	dw ELEKID
	dw CLEFFA
	dw IGGLYBUFF
	dw SMOOCHUM

ChallengeStarters:
	dw FARFETCH_D
	dw SUNKERN
	dw SHUCKLE
	dw WOBBUFFET
	dw SMEARGLE
	dw DITTO
	dw UNOWN
