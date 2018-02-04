; base data struct members (see data/pokemon/base_stats/*.asm)
BASE_DEX_NO      EQUS "(wBaseDexNo - wCurBaseData)"
BASE_STATS       EQUS "(wBaseStats - wCurBaseData)"
BASE_HP          EQUS "(wBaseHP - wCurBaseData)"
BASE_ATK         EQUS "(wBaseAttack - wCurBaseData)"
BASE_SPD         EQUS "(wBaseSpeed - wCurBaseData)"
BASE_SAT         EQUS "(wBaseSpecialAttack - wCurBaseData)"
BASE_SDF         EQUS "(wBaseSpecialDefense - wCurBaseData)"
BASE_TYPES       EQUS "(wBaseType - wCurBaseData)"
BASE_TYPE_1      EQUS "(wBaseType1 - wCurBaseData)"
BASE_TYPE_2      EQUS "(wBaseType2 - wCurBaseData)"
BASE_CATCH_RATE  EQUS "(wBaseCatchRate - wCurBaseData)"
BASE_EXP         EQUS "(wBaseExp - wCurBaseData)"
BASE_ITEMS       EQUS "(wBaseItems - wCurBaseData)"
BASE_ITEM_1      EQUS "(wBaseItem1 - wCurBaseData)"
BASE_ITEM_2      EQUS "(wBaseItem2 - wCurBaseData)"
BASE_GENDER      EQUS "(wBaseGender - wCurBaseData)"
BASE_UNKNOWN_1   EQUS "(wBaseUnknown1 - wCurBaseData)"
BASE_EGG_STEPS   EQUS "(wBaseEggSteps - wCurBaseData)"
BASE_UNKNOWN_2   EQUS "(wBaseUnknown2 - wCurBaseData)"
BASE_PIC_SIZE    EQUS "(wBasePicSize - wCurBaseData)"
BASE_PADDING     EQUS "(wBasePadding - wCurBaseData)"
BASE_GROWTH_RATE EQUS "(wBaseGrowthRate - wCurBaseData)"
BASE_EGG_GROUPS  EQUS "(wBaseEggGroups - wCurBaseData)"
BASE_TMHM        EQUS "(wBaseTMHM - wCurBaseData)"
BASE_DATA_SIZE   EQUS "(wCurBaseDataEnd - wCurBaseData)"

; gender ratio constants
GENDER_F0    EQU 0 percent
GENDER_F12_5 EQU 31 ; 12.5 percent
GENDER_F25   EQU 25 percent
GENDER_F50   EQU 50 percent
GENDER_F75   EQU 75 percent
GENDER_F100  EQU 254 ; 100 percent
GENDERLESS   EQU 255

; wBaseGrowthRate values
; GrowthRates indexes (see data/growth_rates.asm)
	const_def
	const MEDIUM_FAST
	const SLIGHTLY_FAST
	const SLIGHTLY_SLOW
	const MEDIUM_SLOW
	const FAST
	const SLOW

; wBaseEggGroups values
const_value set 1
	const MONSTER      ; 1
	const AMPHIBIAN    ; 2
	const INSECT       ; 3
	const AVIAN        ; 4
	const FIELD        ; 5
	const FAIRY        ; 6
	const PLANT        ; 7
	const HUMANSHAPE   ; 8
	const INVERTEBRATE ; 9
	const INANIMATE    ; a
	const AMORPHOUS    ; b
	const FISH         ; c
	const LADIES_MAN   ; d
	const REPTILE      ; e
	const NO_EGGS      ; f


; pokedex entries (see data/pokemon/dex_entries.asm)
NUM_DEX_ENTRY_BANKS EQU 4


; party_struct members (see macros/wram.asm)
MON_SPECIES            EQUS "(wPartyMon1Species - wPartyMon1)"
MON_ITEM               EQUS "(wPartyMon1Item - wPartyMon1)"
MON_MOVES              EQUS "(wPartyMon1Moves - wPartyMon1)"
MON_ID                 EQUS "(wPartyMon1ID - wPartyMon1)"
MON_EXP                EQUS "(wPartyMon1Exp - wPartyMon1)"
MON_STAT_EXP           EQUS "(wPartyMon1StatExp - wPartyMon1)"
MON_HP_EXP             EQUS "(wPartyMon1HPExp - wPartyMon1)"
MON_ATK_EXP            EQUS "(wPartyMon1AtkExp - wPartyMon1)"
MON_DEF_EXP            EQUS "(wPartyMon1DefExp - wPartyMon1)"
MON_SPD_EXP            EQUS "(wPartyMon1SpdExp - wPartyMon1)"
MON_SPC_EXP            EQUS "(wPartyMon1SpcExp - wPartyMon1)"
MON_DVS                EQUS "(wPartyMon1DVs - wPartyMon1)"
MON_PP                 EQUS "(wPartyMon1PP - wPartyMon1)"
MON_HAPPINESS          EQUS "(wPartyMon1Happiness - wPartyMon1)"
MON_PKRUS              EQUS "(wPartyMon1PokerusStatus - wPartyMon1)"
MON_CAUGHTDATA         EQUS "(wPartyMon1CaughtData - wPartyMon1)"
MON_CAUGHTLEVEL        EQUS "(wPartyMon1CaughtLevel - wPartyMon1)"
MON_CAUGHTTIME         EQUS "(wPartyMon1CaughtTime - wPartyMon1)"
MON_CAUGHTGENDER       EQUS "(wPartyMon1CaughtGender - wPartyMon1)"
MON_CAUGHTLOCATION     EQUS "(wPartyMon1CaughtLocation - wPartyMon1)"
MON_LEVEL              EQUS "(wPartyMon1Level - wPartyMon1)"
MON_STATUS             EQUS "(wPartyMon1Status - wPartyMon1)"
MON_HP                 EQUS "(wPartyMon1HP - wPartyMon1)"
MON_MAXHP              EQUS "(wPartyMon1MaxHP - wPartyMon1)"
MON_ATK                EQUS "(wPartyMon1Attack - wPartyMon1)"
MON_DEF                EQUS "(wPartyMon1Defense - wPartyMon1)"
MON_SPD                EQUS "(wPartyMon1Speed - wPartyMon1)"
MON_SAT                EQUS "(wPartyMon1SpclAtk - wPartyMon1)"
MON_SDF                EQUS "(wPartyMon1SpclDef - wPartyMon1)"
BOXMON_STRUCT_LENGTH   EQUS "(wPartyMon1End - wPartyMon1)"
PARTYMON_STRUCT_LENGTH EQUS "(wPartyMon1StatsEnd - wPartyMon1)"
REDMON_STRUCT_LENGTH EQU 44


; caught data

CAUGHT_TIME_MASK  EQU %11000000
CAUGHT_LEVEL_MASK EQU %00111111

CAUGHT_GENDER_MASK   EQU %10000000
CAUGHT_LOCATION_MASK EQU %01111111

CAUGHT_BY_UNKNOWN EQU 0
CAUGHT_BY_GIRL    EQU 1
CAUGHT_BY_BOY     EQU 2

CAUGHT_EGG_LEVEL EQU 1


; maximum number of party pokemon
PARTY_LENGTH EQU 6


; evolution types (used in data/pokemon/evos_attacks.asm)
const_value set 1
	const EVOLVE_LEVEL
	const EVOLVE_ITEM
	const EVOLVE_TRADE
	const EVOLVE_HAPPINESS
	const EVOLVE_STAT

; EVOLVE_HAPPINESS triggers
const_value set 1
	const TR_ANYTIME
	const TR_MORNDAY
	const TR_NITE

; EVOLVE_STAT triggers
const_value set 1
	const ATK_GT_DEF
	const ATK_LT_DEF
	const ATK_EQ_DEF


; PokeAnims indexes (see engine/pic_animation.asm)
	const_def
	const ANIM_MON_SLOW
	const ANIM_MON_NORMAL
	const ANIM_MON_MENU
	const ANIM_MON_TRADE
	const ANIM_MON_EVOLVE
	const ANIM_MON_HATCH
	const ANIM_MON_UNUSED
	const ANIM_MON_EGG1
	const ANIM_MON_EGG2


; MonMenuOptions indexes (see engine/mon_menu.asm)
const_value set 1
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


; treemon sets
; TreeMons indexes (see data/wild/treemons.asm)
	const_def
	const TREEMON_SET_CITY
	const TREEMON_SET_CANYON
	const TREEMON_SET_AZALEA
	const TREEMON_SET_ROUTE
	const TREEMON_SET_KANTO
	const TREEMON_SET_LAKE
	const TREEMON_SET_FOREST
	const TREEMON_SET_ROCK
NUM_TREEMON_SETS EQU const_value

; treemon scores
	const_def
	const TREEMON_SCORE_BAD  ; 0
	const TREEMON_SCORE_GOOD ; 1
	const TREEMON_SCORE_RARE ; 2


; wild data

NUM_GRASSMON EQU 7 ; data/wild/*_grass.asm table size
NUM_WATERMON EQU 3 ; data/wild/*_water.asm table size

GRASS_WILDDATA_LENGTH EQU (NUM_GRASSMON * 2 + 1) * 3 + 2
WATER_WILDDATA_LENGTH EQU (NUM_WATERMON * 2 + 1) * 1 + 2

NUM_ROAMMON_MAPS EQU 16 ; RoamMaps table size (see data/wild/roammon_maps.asm)


; swarms

SWARM_DUNSPARCE EQU 0
SWARM_YANMA     EQU 1

FISHSWARM_QWILFISH EQU 1
FISHSWARM_REMORAID EQU 2


; significant happiness values
BASE_HAPPINESS        EQU 70
FRIEND_BALL_HAPPINESS EQU 200
HAPPINESS_TO_EVOLVE   EQU 220
HAPPINESS_THRESHOLD_1 EQU 100
HAPPINESS_THRESHOLD_2 EQU 200


; PP
PP_UP_MASK EQU %11000000
PP_UP_ONE  EQU %01000000
PP_MASK    EQU %00111111
