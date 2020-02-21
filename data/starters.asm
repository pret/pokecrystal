	const_def
	const BASIC
	const ROCKET
	const ANIME
	const COMMON
	const UNCOMMON
	const TRADE
	const PSEUDO_LEGENDS
	const BABY
	const CHALLENGE
NUM_CATEGORIES EQU 9

GetStartersInCategory:
 	cp BASIC
 	jp z, BasicStarters
 	cp ROCKET
 	jp z, RocketStarters
 	cp ANIME
 	jp z, AnimeStarters
 	cp COMMON
 	jp z, CommonStarters
 	cp UNCOMMON
 	jp z, UncommonStarters
 	cp TRADE
 	jp z, TradeStarters
 	cp PSEUDO_LEGENDS
 	jp z, PseudoLegendStarters
 	cp BABY
 	jp z, BabyStarters
 	cp CHALLENGE
 	jp z, ChallengeStarters
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