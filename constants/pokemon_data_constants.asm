; base data struct members (see data/pokemon/base_stats/*.asm)
BASE_DEX_NO      EQUS "(BaseDexNo - CurBaseData)"
BASE_STATS       EQUS "(BaseStats - CurBaseData)"
BASE_HP          EQUS "(BaseHP - CurBaseData)"
BASE_ATK         EQUS "(BaseAttack - CurBaseData)"
BASE_SPD         EQUS "(BaseSpeed - CurBaseData)"
BASE_SAT         EQUS "(BaseSpecialAttack - CurBaseData)"
BASE_SDF         EQUS "(BaseSpecialDefense - CurBaseData)"
BASE_TYPES       EQUS "(BaseType - CurBaseData)"
BASE_TYPE_1      EQUS "(BaseType1 - CurBaseData)"
BASE_TYPE_2      EQUS "(BaseType2 - CurBaseData)"
BASE_CATCH_RATE  EQUS "(BaseCatchRate - CurBaseData)"
BASE_EXP         EQUS "(BaseExp - CurBaseData)"
BASE_ITEMS       EQUS "(BaseItems - CurBaseData)"
BASE_ITEM_1      EQUS "(BaseItem1 - CurBaseData)"
BASE_ITEM_2      EQUS "(BaseItem2 - CurBaseData)"
BASE_GENDER      EQUS "(BaseGender - CurBaseData)"
BASE_UNKNOWN_1   EQUS "(BaseUnknown1 - CurBaseData)"
BASE_EGG_STEPS   EQUS "(BaseEggSteps - CurBaseData)"
BASE_UNKNOWN_2   EQUS "(BaseUnknown2 - CurBaseData)"
BASE_PIC_SIZE    EQUS "(BasePicSize - CurBaseData)"
BASE_PADDING     EQUS "(BasePadding - CurBaseData)"
BASE_GROWTH_RATE EQUS "(BaseGrowthRate - CurBaseData)"
BASE_EGG_GROUPS  EQUS "(BaseEggGroups - CurBaseData)"
BASE_TMHM        EQUS "(BaseTMHM - CurBaseData)"
BASE_DATA_SIZE   EQUS "(CurBaseDataEnd - CurBaseData)"

; gender ratio constants
GENDER_F0    EQU 0 percent
GENDER_F12_5 EQU 31 ; 12.5 percent
GENDER_F25   EQU 25 percent
GENDER_F50   EQU 50 percent
GENDER_F75   EQU 75 percent
GENDER_F100  EQU 254 ; 100 percent
GENDERLESS   EQU 255

; BaseGrowthRate values
; GrowthRates indexes (see data/growth_rates.asm)
	const_def
	const MEDIUM_FAST
	const SLIGHTLY_FAST
	const SLIGHTLY_SLOW
	const MEDIUM_SLOW
	const FAST
	const SLOW

; BaseEggGroups values
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


; party_struct members (see macros/wram.asm)
MON_SPECIES            EQUS "(PartyMon1Species - PartyMon1)"
MON_ITEM               EQUS "(PartyMon1Item - PartyMon1)"
MON_MOVES              EQUS "(PartyMon1Moves - PartyMon1)"
MON_ID                 EQUS "(PartyMon1ID - PartyMon1)"
MON_EXP                EQUS "(PartyMon1Exp - PartyMon1)"
MON_STAT_EXP           EQUS "(PartyMon1StatExp - PartyMon1)"
MON_HP_EXP             EQUS "(PartyMon1HPExp - PartyMon1)"
MON_ATK_EXP            EQUS "(PartyMon1AtkExp - PartyMon1)"
MON_DEF_EXP            EQUS "(PartyMon1DefExp - PartyMon1)"
MON_SPD_EXP            EQUS "(PartyMon1SpdExp - PartyMon1)"
MON_SPC_EXP            EQUS "(PartyMon1SpcExp - PartyMon1)"
MON_DVS                EQUS "(PartyMon1DVs - PartyMon1)"
MON_PP                 EQUS "(PartyMon1PP - PartyMon1)"
MON_HAPPINESS          EQUS "(PartyMon1Happiness - PartyMon1)"
MON_PKRUS              EQUS "(PartyMon1PokerusStatus - PartyMon1)"
MON_CAUGHTDATA         EQUS "(PartyMon1CaughtData - PartyMon1)"
MON_CAUGHTLEVEL        EQUS "(PartyMon1CaughtLevel - PartyMon1)"
MON_CAUGHTTIME         EQUS "(PartyMon1CaughtTime - PartyMon1)"
MON_CAUGHTGENDER       EQUS "(PartyMon1CaughtGender - PartyMon1)"
MON_CAUGHTLOCATION     EQUS "(PartyMon1CaughtLocation - PartyMon1)"
MON_LEVEL              EQUS "(PartyMon1Level - PartyMon1)"
MON_STATUS             EQUS "(PartyMon1Status - PartyMon1)"
MON_HP                 EQUS "(PartyMon1HP - PartyMon1)"
MON_MAXHP              EQUS "(PartyMon1MaxHP - PartyMon1)"
MON_ATK                EQUS "(PartyMon1Attack - PartyMon1)"
MON_DEF                EQUS "(PartyMon1Defense - PartyMon1)"
MON_SPD                EQUS "(PartyMon1Speed - PartyMon1)"
MON_SAT                EQUS "(PartyMon1SpclAtk - PartyMon1)"
MON_SDF                EQUS "(PartyMon1SpclDef - PartyMon1)"
BOXMON_STRUCT_LENGTH   EQUS "(PartyMon1End - PartyMon1)"
PARTYMON_STRUCT_LENGTH EQUS "(PartyMon1StatsEnd - PartyMon1)"
REDMON_STRUCT_LENGTH EQU 44


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


; PP
PP_UP_MASK EQU %11000000
PP_UP_ONE  EQU %01000000
PP_MASK    EQU %00111111


; significant happiness values
BASE_HAPPINESS        EQU 70
FRIEND_BALL_HAPPINESS EQU 200
HAPPINESS_TO_EVOLVE   EQU 220
HAPPINESS_THRESHOLD_1 EQU 100
HAPPINESS_THRESHOLD_2 EQU 200


; wild data

NUM_GRASSMON EQU 7 ; data/wild/*_grass.asm table size
NUM_WATERMON EQU 3 ; data/wild/*_water.asm table size

GRASS_WILDDATA_LENGTH EQU (NUM_GRASSMON * 2 + 1) * 3 + 2
WATER_WILDDATA_LENGTH EQU (NUM_WATERMON * 2 + 1) * 1 + 2


; swarms

SWARM_DUNSPARCE EQU 0
SWARM_YANMA     EQU 1

FISHSWARM_QWILFISH EQU 1
FISHSWARM_REMORAID EQU 2


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
