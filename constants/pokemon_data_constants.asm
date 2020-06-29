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
BASE_FRONTPIC    EQUS "(wBaseUnusedFrontpic - wCurBaseData)"
BASE_BACKPIC     EQUS "(wBaseUnusedBackpic - wCurBaseData)"
BASE_GROWTH_RATE EQUS "(wBaseGrowthRate - wCurBaseData)"
BASE_EGG_GROUPS  EQUS "(wBaseEggGroups - wCurBaseData)"
BASE_TMHM        EQUS "(wBaseTMHM - wCurBaseData)"
BASE_DATA_SIZE   EQUS "(wCurBaseDataEnd - wCurBaseData)"

; gender ratio constants
GENDER_F0      EQU   0 percent
GENDER_F12_5   EQU  12 percent + 1
GENDER_F25     EQU  25 percent
GENDER_F50     EQU  50 percent
GENDER_F75     EQU  75 percent
GENDER_F100    EQU 100 percent - 1
GENDER_UNKNOWN EQU -1

; wBaseGrowthRate values
; GrowthRates indexes (see data/growth_rates.asm)
	const_def
	const GROWTH_MEDIUM_FAST
	const GROWTH_SLIGHTLY_FAST
	const GROWTH_SLIGHTLY_SLOW
	const GROWTH_MEDIUM_SLOW
	const GROWTH_FAST
	const GROWTH_SLOW

; wBaseEggGroups values
	const_def 1
	const EGG_MONSTER       ; 1
	const EGG_WATER_1       ; 2 (Amphibian)
	const EGG_BUG           ; 3
	const EGG_FLYING        ; 4
	const EGG_GROUND        ; 5 (Field)
	const EGG_FAIRY         ; 6
	const EGG_PLANT         ; 7 (Grass)
	const EGG_HUMANSHAPE    ; 8 (Human-Like)
	const EGG_WATER_3       ; 9 (Invertebrate)
	const EGG_MINERAL       ; a
	const EGG_INDETERMINATE ; b (Amorphous)
	const EGG_WATER_2       ; c (Fish)
	const EGG_DITTO         ; d
	const EGG_DRAGON        ; e
	const EGG_NONE          ; f (Undiscovered)

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
BOXMON_STRUCT_LENGTH   EQUS "(wPartyMon1BoxEnd - wPartyMon1)"
PARTYMON_STRUCT_LENGTH EQUS "(wPartyMon1StructEnd - wPartyMon1)"

NICKNAMED_MON_STRUCT_LENGTH EQUS "(PARTYMON_STRUCT_LENGTH + MON_NAME_LENGTH)"
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

; boxes
MONS_PER_BOX EQU 20
NUM_BOXES    EQU 14

; hall of fame
HOF_MON_LENGTH EQU 1 + 2 + 2 + 1 + (MON_NAME_LENGTH - 1) ; species, id, dvs, level, nick
HOF_LENGTH EQU 1 + HOF_MON_LENGTH * PARTY_LENGTH + 1 ; win count, party, terminator
NUM_HOF_TEAMS EQU 30

; evolution types (used in data/pokemon/evos_attacks.asm)
	const_def 1
	const EVOLVE_LEVEL
	const EVOLVE_ITEM
	const EVOLVE_TRADE
	const EVOLVE_HAPPINESS
	const EVOLVE_STAT

; EVOLVE_HAPPINESS triggers
	const_def 1
	const TR_ANYTIME
	const TR_MORNDAY
	const TR_NITE

; EVOLVE_STAT triggers
	const_def 1
	const ATK_GT_DEF
	const ATK_LT_DEF
	const ATK_EQ_DEF

; wild data

NUM_GRASSMON EQU 7 ; data/wild/*_grass.asm table size
NUM_WATERMON EQU 3 ; data/wild/*_water.asm table size

GRASS_WILDDATA_LENGTH EQU 2 + (1 + NUM_GRASSMON * 2) * 3
WATER_WILDDATA_LENGTH EQU 2 + (1 + NUM_WATERMON * 2) * 1
FISHGROUP_DATA_LENGTH EQU 1 + 2 * 3

NUM_ROAMMON_MAPS EQU 16 ; RoamMaps table size (see data/wild/roammon_maps.asm)

; treemon sets
; TreeMons indexes (see data/wild/treemons.asm)
	const_def
	const TREEMON_SET_CITY
	const TREEMON_SET_CANYON
	const TREEMON_SET_TOWN
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

; ChangeHappiness arguments (see data/happiness_changes.asm)
const_value = 1
	const HAPPINESS_GAINLEVEL         ; 01
	const HAPPINESS_USEDITEM          ; 02
	const HAPPINESS_USEDXITEM         ; 03
	const HAPPINESS_GYMBATTLE         ; 04
	const HAPPINESS_LEARNMOVE         ; 05
	const HAPPINESS_FAINTED           ; 06
	const HAPPINESS_POISONFAINT       ; 07
	const HAPPINESS_BEATENBYSTRONGFOE ; 08
	const HAPPINESS_OLDERCUT1         ; 09
	const HAPPINESS_OLDERCUT2         ; 0a
	const HAPPINESS_OLDERCUT3         ; 0b
	const HAPPINESS_YOUNGCUT1         ; 0c
	const HAPPINESS_YOUNGCUT2         ; 0d
	const HAPPINESS_YOUNGCUT3         ; 0e
	const HAPPINESS_BITTERPOWDER      ; 0f
	const HAPPINESS_ENERGYROOT        ; 10
	const HAPPINESS_REVIVALHERB       ; 11
	const HAPPINESS_GROOMING          ; 12
	const HAPPINESS_GAINLEVELATHOME   ; 13

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
