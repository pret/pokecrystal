; base data struct members (see data/pokemon/base_stats/*.asm)
rsreset
DEF BASE_DEX_NO      rb
DEF BASE_STATS       rb NUM_STATS
rsset BASE_STATS
DEF BASE_HP          rb
DEF BASE_ATK         rb
DEF BASE_DEF         rb
DEF BASE_SPD         rb
DEF BASE_SAT         rb
DEF BASE_SDF         rb
DEF BASE_TYPES       rw
rsset BASE_TYPES
DEF BASE_TYPE_1      rb
DEF BASE_TYPE_2      rb
DEF BASE_CATCH_RATE  rb
DEF BASE_EXP         rb
DEF BASE_ITEMS       rw
rsset BASE_ITEMS
DEF BASE_ITEM_1      rb
DEF BASE_ITEM_2      rb
DEF BASE_GENDER      rb
                     rb_skip
DEF BASE_EGG_STEPS   rb
                     rb_skip
DEF BASE_PIC_SIZE    rb
DEF BASE_FRONTPIC    rw
DEF BASE_BACKPIC     rw
DEF BASE_GROWTH_RATE rb
DEF BASE_EGG_GROUPS  rb
DEF BASE_TMHM        rb (NUM_TM_HM_TUTOR + 7) / 8
DEF BASE_DATA_SIZE EQU _RS

; gender ratio constants
DEF GENDER_F0      EQU   0 percent
DEF GENDER_F12_5   EQU  12 percent + 1
DEF GENDER_F25     EQU  25 percent
DEF GENDER_F50     EQU  50 percent
DEF GENDER_F75     EQU  75 percent
DEF GENDER_F100    EQU 100 percent - 1
DEF GENDER_UNKNOWN EQU -1

; wBaseGrowthRate values
; GrowthRates indexes (see data/growth_rates.asm)
	const_def
	const GROWTH_MEDIUM_FAST
	const GROWTH_SLIGHTLY_FAST
	const GROWTH_SLIGHTLY_SLOW
	const GROWTH_MEDIUM_SLOW
	const GROWTH_FAST
	const GROWTH_SLOW
DEF NUM_GROWTH_RATES EQU const_value

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

; party_struct members (see macros/ram.asm)
rsreset
DEF MON_SPECIES            rb
DEF MON_ITEM               rb
DEF MON_MOVES              rb NUM_MOVES
DEF MON_ID                 rw
DEF MON_EXP                rb 3
DEF MON_STAT_EXP           rw NUM_EXP_STATS
rsset MON_STAT_EXP
DEF MON_HP_EXP             rw
DEF MON_ATK_EXP            rw
DEF MON_DEF_EXP            rw
DEF MON_SPD_EXP            rw
DEF MON_SPC_EXP            rw
DEF MON_DVS                rw
DEF MON_PP                 rb NUM_MOVES
DEF MON_HAPPINESS          rb
DEF MON_POKERUS            rb
DEF MON_CAUGHTDATA         rw
rsset MON_CAUGHTDATA
DEF MON_CAUGHTTIME         rb
DEF MON_CAUGHTGENDER       rb
rsset MON_CAUGHTDATA
DEF MON_CAUGHTLEVEL        rb
DEF MON_CAUGHTLOCATION     rb
DEF MON_LEVEL              rb
DEF BOXMON_STRUCT_LENGTH EQU _RS
DEF MON_STATUS             rb
                           rb_skip
DEF MON_HP                 rw
DEF MON_MAXHP              rw
DEF MON_STATS              rw NUM_BATTLE_STATS
rsset MON_STATS
DEF MON_ATK                rw
DEF MON_DEF                rw
DEF MON_SPD                rw
DEF MON_SAT                rw
DEF MON_SDF                rw
DEF PARTYMON_STRUCT_LENGTH EQU _RS

DEF NICKNAMED_MON_STRUCT_LENGTH EQU PARTYMON_STRUCT_LENGTH + MON_NAME_LENGTH
DEF REDMON_STRUCT_LENGTH EQU 44

; caught data

DEF CAUGHT_TIME_MASK  EQU %11000000
DEF CAUGHT_LEVEL_MASK EQU %00111111

DEF CAUGHT_GENDER_MASK   EQU %10000000
DEF CAUGHT_LOCATION_MASK EQU %01111111

DEF CAUGHT_BY_UNKNOWN EQU 0
DEF CAUGHT_BY_GIRL    EQU 1
DEF CAUGHT_BY_BOY     EQU 2

DEF CAUGHT_EGG_LEVEL EQU 1

DEF MON_CRY_LENGTH EQU 6

; maximum number of party pokemon
DEF PARTY_LENGTH EQU 6

; boxes
DEF MONS_PER_BOX EQU 20
; box: count, species, mons, OTs, nicknames, padding
DEF BOX_LENGTH EQU 1 + MONS_PER_BOX + 1 + (BOXMON_STRUCT_LENGTH + NAME_LENGTH + MON_NAME_LENGTH) * MONS_PER_BOX + 2 ; $450
DEF NUM_BOXES EQU 14

; hall of fame
; hof_mon: species, id, dvs, level, nicknames
DEF HOF_MON_LENGTH EQU 1 + 2 + 2 + 1 + (MON_NAME_LENGTH - 1) ; $10
; hall_of_fame: win count, party, terminator
DEF HOF_LENGTH EQU 1 + HOF_MON_LENGTH * PARTY_LENGTH + 1 ; $62
DEF NUM_HOF_TEAMS EQU 30

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

DEF NUM_GRASSMON EQU 7 ; data/wild/*_grass.asm table size
DEF NUM_WATERMON EQU 3 ; data/wild/*_water.asm table size

DEF GRASS_WILDDATA_LENGTH EQU 2 + 3 + NUM_GRASSMON * 2 * 3
DEF WATER_WILDDATA_LENGTH EQU 2 + 1 + NUM_WATERMON * 2
DEF FISHGROUP_DATA_LENGTH EQU 1 + 2 * 3

DEF NUM_ROAMMON_MAPS EQU 16 ; RoamMaps table size (see data/wild/roammon_maps.asm)

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
DEF NUM_TREEMON_SETS EQU const_value

; treemon scores
	const_def
	const TREEMON_SCORE_BAD  ; 0
	const TREEMON_SCORE_GOOD ; 1
	const TREEMON_SCORE_RARE ; 2

; ChangeHappiness arguments (see data/events/happiness_changes.asm)
	const_def 1
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
DEF NUM_HAPPINESS_CHANGES EQU const_value - 1

; significant happiness values
DEF BASE_HAPPINESS        EQU 70
DEF FRIEND_BALL_HAPPINESS EQU 200
DEF HAPPINESS_TO_EVOLVE   EQU 220
DEF HAPPINESS_THRESHOLD_1 EQU 100
DEF HAPPINESS_THRESHOLD_2 EQU 200

; PP
DEF PP_UP_MASK EQU %11000000
DEF PP_UP_ONE  EQU %01000000
DEF PP_MASK    EQU %00111111
