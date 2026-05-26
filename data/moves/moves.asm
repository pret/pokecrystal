; Characteristics of each move.

MACRO move_category
	if \1 < SPECIAL
		db PHYSICAL
	else
		db SPECIAL
	endc
ENDM

MACRO move
	db \1 ; animation
	db \2 ; effect
	db \3 ; power
	db \4 ; type
	db \5 percent ; accuracy
	db \6 ; pp
	db \7 percent ; effect chance
	if _NARG == 8
		db \8 ; category
	else
		move_category \4
	endc
	assert \6 <= 40, "PP must be 40 or less"
ENDM

Moves:
; entries correspond to move ids (see constants/move_constants.asm)
	table_width MOVE_LENGTH
	move POUND,        EFFECT_NORMAL_HIT,         40, NORMAL,       100, 35,   0, PHYSICAL
	move KARATE_CHOP,  EFFECT_NORMAL_HIT,         50, FIGHTING,     100, 25,   0, PHYSICAL
	move DOUBLESLAP,   EFFECT_MULTI_HIT,          15, NORMAL,        85, 10,   0, PHYSICAL
	move COMET_PUNCH,  EFFECT_MULTI_HIT,          18, NORMAL,        85, 15,   0, PHYSICAL
	move MEGA_PUNCH,   EFFECT_NORMAL_HIT,         80, NORMAL,        85, 20,   0, PHYSICAL
	move PAY_DAY,      EFFECT_PAY_DAY,            40, NORMAL,       100, 20,   0, PHYSICAL
	move FIRE_PUNCH,   EFFECT_BURN_HIT,           75, FIRE,         100, 15,  10, PHYSICAL
	move ICE_PUNCH,    EFFECT_FREEZE_HIT,         75, ICE,          100, 15,  10, PHYSICAL
	move THUNDERPUNCH, EFFECT_PARALYZE_HIT,       75, ELECTRIC,     100, 15,  10, PHYSICAL
	move SCRATCH,      EFFECT_NORMAL_HIT,         40, NORMAL,       100, 35,   0, PHYSICAL
	move VICEGRIP,     EFFECT_NORMAL_HIT,         55, NORMAL,       100, 30,   0, PHYSICAL
	move GUILLOTINE,   EFFECT_OHKO,                0, NORMAL,        30,  5,   0, PHYSICAL
	move RAZOR_WIND,   EFFECT_RAZOR_WIND,         80, NORMAL,        75, 10,   0, SPECIAL
	move SWORDS_DANCE, EFFECT_ATTACK_UP_2,         0, NORMAL,       100, 30,   0
	move CUT,          EFFECT_NORMAL_HIT,         65, BUG,	        95,  30,   0, PHYSICAL
	move GUST,         EFFECT_GUST,               40, FLYING,       100, 35,   0, SPECIAL
	move WING_ATTACK,  EFFECT_NORMAL_HIT,         60, FLYING,       100, 35,   0, PHYSICAL
	move WHIRLWIND,    EFFECT_FORCE_SWITCH,        0, NORMAL,       100, 20,   0
	move FLY,          EFFECT_NORMAL_HIT,         70, FLYING,        95, 15,   0, PHYSICAL
	move BIND,         EFFECT_TRAP_TARGET,        55, DARK,        95, 20,   0, PHYSICAL
	move SLAM,         EFFECT_NORMAL_HIT,         80, DRAGON,        80, 20,   0, PHYSICAL
	move VINE_WHIP,    EFFECT_NORMAL_HIT,         35, GRASS,        100, 10,   0, PHYSICAL
	move STOMP,        EFFECT_STOMP,              65, GROUND,       100, 20,  30, PHYSICAL
	move DOUBLE_KICK,  EFFECT_DOUBLE_HIT,         35, FIGHTING,     100, 30,   0, PHYSICAL
	move MEGA_KICK,    EFFECT_NORMAL_HIT,        120, NORMAL,        75,  5,   0, PHYSICAL
	move JUMP_KICK,    EFFECT_JUMP_KICK,          70, FIGHTING,      95, 25,   0, PHYSICAL
	move ROLLING_KICK, EFFECT_FLINCH_HIT,         60, FIGHTING,      85, 15,  30, PHYSICAL
	move SAND_ATTACK,  EFFECT_ACCURACY_DOWN,       0, GROUND,       100, 15,   0
	move HEADBUTT,     EFFECT_FLINCH_HIT,         70, NORMAL,       100, 15,  30, PHYSICAL
	move HORN_ATTACK,  EFFECT_NORMAL_HIT,         65, NORMAL,       100, 25,   0, PHYSICAL
	move FURY_ATTACK,  EFFECT_MULTI_HIT,          25, NORMAL,        90, 20,   0, PHYSICAL
	move HORN_DRILL,   EFFECT_OHKO,                1, NORMAL,        30,  5,   0
	move TACKLE,       EFFECT_NORMAL_HIT,         35, NORMAL,        95, 35,   0, PHYSICAL
	move BODY_SLAM,    EFFECT_PARALYZE_HIT,       85, NORMAL,       100, 15,  30, PHYSICAL
	move WRAP,         EFFECT_TRAP_TARGET,        65, POISON,        95, 20,   0, PHYSICAL
	move TAKE_DOWN,    EFFECT_RECOIL_HIT,         90, NORMAL,        85, 20,   0, PHYSICAL
	move THRASH,       EFFECT_RAMPAGE,            90, NORMAL,       100, 20,   0, PHYSICAL
	move DOUBLE_EDGE,  EFFECT_RECOIL_HIT,        120, NORMAL,       100, 15,   0, PHYSICAL
	move TAIL_WHIP,    EFFECT_DEFENSE_DOWN,        0, NORMAL,       100, 30,   0
	move POISON_STING, EFFECT_POISON_HIT,         50, POISON,       100, 35,  30, PHYSICAL
	move TWINEEDLE,    EFFECT_POISON_MULTI_HIT,   40, BUG,          100, 20,  20, PHYSICAL
	move PIN_MISSILE,  EFFECT_MULTI_HIT,          30, BUG,           85, 20,   0, PHYSICAL
	move LEER,         EFFECT_DEFENSE_DOWN,        0, NORMAL,       100, 30,   0
	move BITE,         EFFECT_FLINCH_HIT,         60, DARK,         100, 25,  30
	move GROWL,        EFFECT_ATTACK_DOWN,         0, NORMAL,       100, 40,   0
	move ROAR,         EFFECT_FORCE_SWITCH,        0, NORMAL,       100, 20,   0
	move SING,         EFFECT_SLEEP,               0, NORMAL,        55, 15,   0
	move SUPERSONIC,   EFFECT_CONFUSE,             0, NORMAL,        55, 20,   0
	move SONICBOOM,    EFFECT_STATIC_DAMAGE,      20, NORMAL,        90, 20,   0, SPECIAL
	move DISABLE,      EFFECT_DISABLE,             0, NORMAL,        55, 20,   0
	move ACID,         EFFECT_DEFENSE_DOWN_HIT,   40, POISON,       100, 30,  10, SPECIAL
	move EMBER,        EFFECT_BURN_HIT,           40, FIRE,         100, 25,  10, SPECIAL
	move FLAMETHROWER, EFFECT_BURN_HIT,           95, FIRE,         100, 15,  10, SPECIAL
	move MIST,         EFFECT_MIST,                0, ICE,          100, 30,   0
	move WATER_GUN,    EFFECT_NORMAL_HIT,         40, WATER,        100, 25,   0, SPECIAL
	move HYDRO_PUMP,   EFFECT_NORMAL_HIT,        120, WATER,         80,  5,   0, SPECIAL
	move SURF,         EFFECT_NORMAL_HIT,         95, WATER,        100, 15,   0, SPECIAL
	move ICE_BEAM,     EFFECT_FREEZE_HIT,         95, ICE,          100, 10,  10, SPECIAL
	move BLIZZARD,     EFFECT_FREEZE_HIT,        120, ICE,           70,  5,  10, SPECIAL
	move PSYBEAM,      EFFECT_CONFUSE_HIT,        65, PSYCHIC_TYPE, 100, 20,  10, SPECIAL
	move BUBBLEBEAM,   EFFECT_SPEED_DOWN_HIT,     65, WATER,        100, 20,  10, SPECIAL
	move AURORA_BEAM,  EFFECT_ATTACK_DOWN_HIT,    65, ICE,          100, 20,  10, SPECIAL
	move HYPER_BEAM,   EFFECT_RECOIL_HIT,        150, NORMAL,        90,  5,   0, SPECIAL
	move PECK,         EFFECT_NORMAL_HIT,         35, FLYING,       100, 35,   0, PHYSICAL
	move DRILL_PECK,   EFFECT_NORMAL_HIT,         80, FLYING,       100, 20,   0, PHYSICAL
	move SUBMISSION,   EFFECT_TRAP_TARGET,        80, FIGHTING,      80, 25,   0, PHYSICAL
	move LOW_KICK,     EFFECT_FLINCH_HIT,         50, FIGHTING,      90, 20,  30, PHYSICAL
	move COUNTER,      EFFECT_COUNTER,             1, FIGHTING,     100, 20,   0, PHYSICAL
	move SEISMIC_TOSS, EFFECT_LEVEL_DAMAGE,        1, FIGHTING,     100, 20,   0, PHYSICAL
	move STRENGTH,     EFFECT_NORMAL_HIT,         80, ROCK,         100, 15,   0, PHYSICAL
	move ABSORB,       EFFECT_LEECH_HIT,          60, DARK,         100, 20,   0, SPECIAL
	move MEGA_DRAIN,   EFFECT_LEECH_HIT,          70, GRASS,        100, 10,   0, SPECIAL
	move LEECH_SEED,   EFFECT_LEECH_SEED,          0, GRASS,         90, 10,   0
	move GROWTH,       EFFECT_SP_ATK_UP,           0, NORMAL,       100, 40,   0
	move RAZOR_LEAF,   EFFECT_NORMAL_HIT,         55, GRASS,         95, 25,   0, SPECIAL
	move SOLARBEAM,    EFFECT_SOLARBEAM,         120, GRASS,        100, 10,   0, SPECIAL
	move POISONPOWDER, EFFECT_POISON,              0, POISON,        75, 35,   0
	move STUN_SPORE,   EFFECT_PARALYZE,            0, GRASS,         75, 30,   0
	move SLEEP_POWDER, EFFECT_SLEEP,               0, GRASS,         75, 15,   0
	move PETAL_DANCE,  EFFECT_RAMPAGE,            70, GRASS,        100, 20,   0, SPECIAL
	move STRING_SHOT,  EFFECT_SPEED_DOWN,          0, BUG,           95, 40,   0
	move DRAGON_RAGE,  EFFECT_STATIC_DAMAGE,      40, DRAGON,       100, 10,   0
	move FIRE_SPIN,    EFFECT_TRAP_TARGET,        70, FIRE,          95, 15,   0, SPECIAL
	move THUNDERSHOCK, EFFECT_PARALYZE_HIT,       60, ELECTRIC,     100, 30,  10, SPECIAL
	move THUNDERBOLT,  EFFECT_PARALYZE_HIT,       95, ELECTRIC,     100, 15,  10, SPECIAL
	move THUNDER_WAVE, EFFECT_PARALYZE,            0, ELECTRIC,     100, 20,   0, SPECIAL
	move THUNDER,      EFFECT_THUNDER,           120, ELECTRIC,      70, 10,  30, SPECIAL
	move ROCK_THROW,   EFFECT_NORMAL_HIT,         60, ROCK,          95, 15,   0, PHYSICAL
	move EARTHQUAKE,   EFFECT_EARTHQUAKE,        100, GROUND,       100, 10,   0, PHYSICAL
	move FISSURE,      EFFECT_OHKO,                1, GROUND,        30,  5,   0
	move DIG,          EFFECT_NORMAL_HIT,         60, GROUND,       100, 10,   0, PHYSICAL
	move TOXIC,        EFFECT_TOXIC,               0, POISON,        85, 10,   0
	move CONFUSION,    EFFECT_CONFUSE_HIT,        60, PSYCHIC_TYPE, 100, 25,  10, SPECIAL
	move PSYCHIC_M,    EFFECT_SP_DEF_DOWN_HIT,    90, PSYCHIC_TYPE, 100, 10,  10, SPECIAL
	move HYPNOSIS,     EFFECT_SLEEP,               0, PSYCHIC_TYPE,  60, 20,   0
	move MEDITATE,     EFFECT_ATTACK_UP,           0, PSYCHIC_TYPE, 100, 40,   0
	move AGILITY,      EFFECT_SPEED_UP_2,          0, PSYCHIC_TYPE, 100, 30,   0
	move QUICK_ATTACK, EFFECT_PRIORITY_HIT,       40, NORMAL,       100, 30,   0, PHYSICAL
	move RAGE,         EFFECT_RAGE,               40, NORMAL,       100, 20,   0, PHYSICAL
	move TELEPORT,     EFFECT_TELEPORT,            0, PSYCHIC_TYPE, 100, 20,   0
	move NIGHT_SHADE,  EFFECT_LEVEL_DAMAGE,        1, GHOST,        100, 15,   0
	move MIMIC,        EFFECT_MIMIC,               0, NORMAL,       100, 10,   0
	move SCREECH,      EFFECT_DEFENSE_DOWN_2,      0, NORMAL,        85, 40,   0
	move DOUBLE_TEAM,  EFFECT_EVASION_UP,          0, NORMAL,       100, 15,   0
	move RECOVER,      EFFECT_HEAL,                0, NORMAL,       100, 20,   0
	move HARDEN,       EFFECT_DEFENSE_UP,          0, NORMAL,       100, 30,   0
	move MINIMIZE,     EFFECT_EVASION_UP,          0, NORMAL,       100, 20,   0
	move SMOKESCREEN,  EFFECT_ACCURACY_DOWN,       0, NORMAL,       100, 20,   0
	move CONFUSE_RAY,  EFFECT_CONFUSE,             0, GHOST,        100, 10,   0
	move WITHDRAW,     EFFECT_DEFENSE_UP,          0, WATER,        100, 40,   0
	move DEFENSE_CURL, EFFECT_DEFENSE_CURL,        0, NORMAL,       100, 40,   0
	move BARRIER,      EFFECT_DEFENSE_UP_2,        0, PSYCHIC_TYPE, 100, 30,   0
	move LIGHT_SCREEN, EFFECT_LIGHT_SCREEN,        0, PSYCHIC_TYPE, 100, 30,   0
	move HAZE,         EFFECT_RESET_STATS,         0, ICE,          100, 30,   0
	move REFLECT,      EFFECT_REFLECT,             0, PSYCHIC_TYPE, 100, 20,   0
	move FOCUS_ENERGY, EFFECT_FOCUS_ENERGY,        0, NORMAL,       100, 30,   0
	move BIDE,         EFFECT_BIDE,                0, NORMAL,       100, 10,   0
	move METRONOME,    EFFECT_METRONOME,           0, NORMAL,       100, 10,   0
	move MIRROR_MOVE,  EFFECT_MIRROR_MOVE,         0, FLYING,       100, 20,   0
	move SELFDESTRUCT, EFFECT_SELFDESTRUCT,      200, NORMAL,       100,  5,   0, PHYSICAL
	move EGG_BOMB,     EFFECT_NORMAL_HIT,        100, NORMAL,        85, 10,   0, SPECIAL
	move LICK,         EFFECT_PARALYZE_HIT,       40, GHOST,        100, 30,  30, PHYSICAL
	move SMOG,         EFFECT_POISON_HIT,         20, POISON,        70, 20,  40
	move SLUDGE,       EFFECT_POISON_HIT,         65, POISON,       100, 20,  30, SPECIAL
	move BONE_CLUB,    EFFECT_FLINCH_HIT,         65, GROUND,       100, 20,  10, PHYSICAL
	move FIRE_BLAST,   EFFECT_BURN_HIT,          120, FIRE,          85,  5,  10, SPECIAL
	move WATERFALL,    EFFECT_FLINCH_HIT,         80, WATER,        100, 15,   0, PHYSICAL
	move CLAMP,        EFFECT_TRAP_TARGET,        60, WATER,        100, 10,   0, PHYSICAL
	move SWIFT,        EFFECT_ALWAYS_HIT,         60, NORMAL,       100, 20,   0, SPECIAL
	move SKULL_BASH,   EFFECT_NORMAL_HIT,        100, NORMAL,       100, 15,   0, PHYSICAL
	move SPIKE_CANNON, EFFECT_MULTI_HIT,          30, NORMAL,       100, 15,   0, PHYSICAL
	move CONSTRICT,    EFFECT_SPEED_DOWN_HIT,     40, NORMAL,       100, 35,  10, PHYSICAL
	move AMNESIA,      EFFECT_SP_DEF_UP_2,         0, PSYCHIC_TYPE, 100, 20,   0
	move KINESIS,      EFFECT_ACCURACY_DOWN,       0, PSYCHIC_TYPE,  80, 15,   0
	move SOFTBOILED,   EFFECT_HEAL,                0, NORMAL,       100, 10,   0
	move HI_JUMP_KICK, EFFECT_JUMP_KICK,         100, FIGHTING,      90, 20,   0, PHYSICAL
	move GLARE,        EFFECT_PARALYZE,            0, NORMAL,        75, 30,   0
	move DREAM_EATER,  EFFECT_DREAM_EATER,       100, PSYCHIC_TYPE, 100, 15,   0, SPECIAL
	move POISON_GAS,   EFFECT_POISON,              0, POISON,        55, 40,   0
	move BARRAGE,      EFFECT_MULTI_HIT,          20, NORMAL,        85, 20,   0, PHYSICAL
	move LEECH_LIFE,   EFFECT_LEECH_HIT,          80, BUG,          100, 15,   0, PHYSICAL
	move LOVELY_KISS,  EFFECT_SLEEP,               0, NORMAL,        75, 10,   0
	move SKY_ATTACK,   EFFECT_RECOIL_HIT,        140, FLYING,        90,  5,   0, PHYSICAL
	move TRANSFORM,    EFFECT_TRANSFORM,           0, NORMAL,       100, 10,   0
	move BUBBLE,       EFFECT_SPEED_DOWN_HIT,     40, WATER,        100, 30,  10, SPECIAL
	move DIZZY_PUNCH,  EFFECT_CONFUSE_HIT,        70, NORMAL,       100, 10,  20, PHYSICAL
	move SPORE,        EFFECT_SLEEP,               0, GRASS,        100, 15,   0
	move FLASH,        EFFECT_ACCURACY_DOWN,       0, NORMAL,        70, 20,   0
	move PSYWAVE,      EFFECT_PSYWAVE,             1, PSYCHIC_TYPE,  80, 15,   0, SPECIAL
	move SPLASH,       EFFECT_SPLASH,              0, NORMAL,       100, 40,   0
	move ACID_ARMOR,   EFFECT_DEFENSE_UP_2,        0, POISON,       100, 40,   0
	move CRABHAMMER,   EFFECT_NORMAL_HIT,         90, WATER,        100, 10,   0, PHYSICAL
	move EXPLOSION,    EFFECT_SELFDESTRUCT,      250, NORMAL,       100,  5,   0, PHYSICAL
	move FURY_SWIPES,  EFFECT_MULTI_HIT,          25, NORMAL,        90, 15,   0, PHYSICAL
	move BONEMERANG,   EFFECT_DOUBLE_HIT,         60, GROUND,        95, 10,   0, PHYSICAL
	move REST,         EFFECT_HEAL,                0, PSYCHIC_TYPE, 100, 10,   0
	move ROCK_SLIDE,   EFFECT_FLINCH_HIT,         95, ROCK,          95, 10,  30, PHYSICAL
	move HYPER_FANG,   EFFECT_FLINCH_HIT,         80, NORMAL,        90, 15,  10, PHYSICAL
	move SHARPEN,      EFFECT_ATTACK_UP,           0, NORMAL,       100, 30,   0
	move CONVERSION,   EFFECT_CONVERSION,          0, NORMAL,       100, 30,   0
	move TRI_ATTACK,   EFFECT_TRI_ATTACK,         90, NORMAL,       100, 10,  20, SPECIAL
	move SUPER_FANG,   EFFECT_SUPER_FANG,          1, NORMAL,        90, 10,   0
	move SLASH,        EFFECT_NORMAL_HIT,         70, STEEL,        100, 20,   0, PHYSICAL
	move SUBSTITUTE,   EFFECT_SUBSTITUTE,          0, NORMAL,       100, 10,   0
	move STRUGGLE,     EFFECT_RECOIL_HIT,         50, NORMAL,       100,  1,   0, PHYSICAL
	move SKETCH,       EFFECT_SKETCH,              0, NORMAL,       100,  1,   0
	move TRIPLE_KICK,  EFFECT_TRIPLE_KICK,        20, FIGHTING,      90, 10,   0, PHYSICAL
	move THIEF,        EFFECT_THIEF,              60, DARK,         100, 10, 100, PHYSICAL
	move SPIDER_WEB,   EFFECT_MEAN_LOOK,           0, BUG,          100, 10,   0
	move MIND_READER,  EFFECT_LOCK_ON,             0, NORMAL,       100,  5,   0
	move NIGHTMARE,    EFFECT_NIGHTMARE,           0, GHOST,        100, 15,   0
	move FLAME_WHEEL,  EFFECT_FLAME_WHEEL,        70, FIRE,         100, 25,  10, PHYSICAL
	move SNORE,        EFFECT_SNORE,              40, NORMAL,       100, 15,  30, SPECIAL
	move CURSE,        EFFECT_CURSE,               0, CURSE_TYPE,   100, 10,   0
	move FLAIL,        EFFECT_REVERSAL,            1, NORMAL,       100, 15,   0, PHYSICAL
	move CONVERSION2,  EFFECT_CONVERSION2,         0, NORMAL,       100, 30,   0
	move AEROBLAST,    EFFECT_NORMAL_HIT,        100, FLYING,        95,  5,   0, SPECIAL
	move COTTON_SPORE, EFFECT_SPEED_DOWN_2,        0, GRASS,         85, 40,   0
	move REVERSAL,     EFFECT_REVERSAL,            1, FIGHTING,     100, 15,   0
	move SPITE,        EFFECT_SPITE,               0, GHOST,        100, 10,   0
	move POWDER_SNOW,  EFFECT_FREEZE_HIT,         50, ICE,          100, 25,  10, SPECIAL
	move PROTECT,      EFFECT_PROTECT,             0, NORMAL,       100, 10,   0
	move MACH_PUNCH,   EFFECT_PRIORITY_HIT,       40, FIGHTING,     100, 30,   0, PHYSICAL
	move SCARY_FACE,   EFFECT_SPEED_DOWN_2,        0, NORMAL,        90, 10,   0
	move FAINT_ATTACK, EFFECT_ALWAYS_HIT,         60, DARK,         100, 20,   0, PHYSICAL
	move SWEET_KISS,   EFFECT_CONFUSE,             0, NORMAL,        75, 10,   0
	move BELLY_DRUM,   EFFECT_BELLY_DRUM,          0, NORMAL,       100, 10,   0
	move SLUDGE_BOMB,  EFFECT_POISON_HIT,         95, POISON,       100, 10,  30, SPECIAL
	move MUD_SLAP,     EFFECT_ACCURACY_DOWN_HIT,  40, GROUND,       100, 10, 100, SPECIAL
	move OCTAZOOKA,    EFFECT_ACCURACY_DOWN_HIT,  95, WATER,        100, 10,  50, SPECIAL
	move SPIKES,       EFFECT_SPIKES,              0, GROUND,       100, 20,   0
	move ZAP_CANNON,   EFFECT_PARALYZE_HIT,      120, ELECTRIC,      50,  5, 100, SPECIAL
	move FORESIGHT,    EFFECT_FORESIGHT,           0, NORMAL,       100, 40,   0
	move DESTINY_BOND, EFFECT_DESTINY_BOND,        0, GHOST,        100,  5,   0
	move PERISH_SONG,  EFFECT_PERISH_SONG,         0, NORMAL,       100,  5,   0
	move ICY_WIND,     EFFECT_SPEED_DOWN_HIT,     65, ICE,           95, 15, 100, SPECIAL
	move DETECT,       EFFECT_PROTECT,             0, FIGHTING,     100,  5,   0
	move BONE_RUSH,    EFFECT_PRIORITY_HIT,       40, GROUND,       100, 10,   0, PHYSICAL
	move LOCK_ON,      EFFECT_LOCK_ON,             0, NORMAL,       100,  5,   0
	move OUTRAGE,      EFFECT_RAMPAGE,            90, DRAGON,       100, 15,   0, PHYSICAL
	move SANDSTORM,    EFFECT_SANDSTORM,           0, ROCK,         100, 10,   0
	move GIGA_DRAIN,   EFFECT_LEECH_HIT,          75, GRASS,        100,  5,   0, SPECIAL
	move ENDURE,       EFFECT_ENDURE,              0, NORMAL,       100, 10,   0
	move CHARM,        EFFECT_ATTACK_DOWN_2,       0, NORMAL,       100, 20,   0
	move ROLLOUT,      EFFECT_PRIORITY_HIT,       40, ROCK,         100, 20,   0, PHYSICAL
	move FALSE_SWIPE,  EFFECT_FALSE_SWIPE,        55, NORMAL,       100, 30,   0, PHYSICAL
	move SWAGGER,      EFFECT_SWAGGER,             0, NORMAL,        90, 15, 100
	move MILK_DRINK,   EFFECT_HEAL,                0, NORMAL,       100, 10,   0
	move SPARK,        EFFECT_PARALYZE_HIT,       65, ELECTRIC,     100, 20,  30, PHYSICAL
	move FURY_CUTTER,  EFFECT_TRIPLE_KICK,        15, BUG,           95, 20,   0, PHYSICAL
	move STEEL_WING,   EFFECT_DEFENSE_UP_HIT,     75, STEEL,        100, 25,  10, PHYSICAL
	move MEAN_LOOK,    EFFECT_MEAN_LOOK,           0, NORMAL,       100,  5,   0
	move ATTRACT,      EFFECT_ATTRACT,             0, NORMAL,       100, 15,   0
	move SLEEP_TALK,   EFFECT_SLEEP_TALK,          0, NORMAL,       100, 10,   0
	move HEAL_BELL,    EFFECT_HEAL_BELL,           0, NORMAL,       100,  5,   0
	move RETURN,       EFFECT_RETURN,              1, NORMAL,       100, 20,   0, PHYSICAL
	move PRESENT,      EFFECT_PRESENT,             1, NORMAL,        90, 15,   0
	move FRUSTRATION,  EFFECT_FRUSTRATION,         1, NORMAL,       100, 20,   0, PHYSICAL
	move SAFEGUARD,    EFFECT_SAFEGUARD,           0, NORMAL,       100, 25,   0
	move PAIN_SPLIT,   EFFECT_PAIN_SPLIT,          0, NORMAL,       100, 20,   0
	move SACRED_FIRE,  EFFECT_SACRED_FIRE,       100, FIRE,          95,  5,  50, PHYSICAL
	move MAGNITUDE,    EFFECT_MAGNITUDE,           1, GROUND,       100, 30,   0
	move DYNAMICPUNCH, EFFECT_CONFUSE_HIT,       120, FIGHTING,      50,  5, 100, PHYSICAL
	move MEGAHORN,     EFFECT_NORMAL_HIT,        120, BUG,           90, 10,   0, PHYSICAL
	move DRAGONBREATH, EFFECT_PARALYZE_HIT,       60, DRAGON,       100, 20,  30, SPECIAL
	move BATON_PASS,   EFFECT_BATON_PASS,          0, NORMAL,       100, 40,   0
	move ENCORE,       EFFECT_ENCORE,              0, NORMAL,       100,  5,   0
	move PURSUIT,      EFFECT_PURSUIT,            40, DARK,         100, 20,   0, PHYSICAL
	move RAPID_SPIN,   EFFECT_RAPID_SPIN,         50, NORMAL,       100, 40,   0, PHYSICAL
	move SWEET_SCENT,  EFFECT_EVASION_DOWN,        0, NORMAL,       100, 20,   0
	move IRON_TAIL,    EFFECT_DEFENSE_DOWN_HIT,  100, STEEL,         95, 15,  30, PHYSICAL
	move METAL_CLAW,   EFFECT_ATTACK_UP_HIT,      60, STEEL,         95, 35,  10, PHYSICAL
	move VITAL_THROW,  EFFECT_ALWAYS_HIT,         70, FIGHTING,     100, 10,   0, PHYSICAL
	move MORNING_SUN,  EFFECT_MORNING_SUN,         0, NORMAL,       100,  5,   0
	move SYNTHESIS,    EFFECT_SYNTHESIS,           0, GRASS,        100,  5,   0
	move MOONLIGHT,    EFFECT_MOONLIGHT,           0, NORMAL,       100,  5,   0
	move HIDDEN_POWER, EFFECT_HIDDEN_POWER,        1, NORMAL,       100, 15,   0
	move CROSS_CHOP,   EFFECT_NORMAL_HIT,        100, FIGHTING,      90,  5,   0, PHYSICAL
	move TWISTER,      EFFECT_TRAP_TARGET,        60, DRAGON,       100, 20,  20, SPECIAL
	move RAIN_DANCE,   EFFECT_RAIN_DANCE,          0, WATER,         90,  5,   0
	move SUNNY_DAY,    EFFECT_SUNNY_DAY,           0, FIRE,          90,  5,   0
	move CRUNCH,       EFFECT_SP_DEF_DOWN_HIT,    80, DARK,         100, 15,  20, PHYSICAL
	move MIRROR_COAT,  EFFECT_MIRROR_COAT,         1, PSYCHIC_TYPE, 100, 20,   0
	move PSYCH_UP,     EFFECT_PSYCH_UP,            0, NORMAL,       100, 10,   0
	move EXTREMESPEED, EFFECT_PRIORITY_HIT,       80, NORMAL,       100,  5,   0, PHYSICAL
	move ANCIENTPOWER, EFFECT_ALL_UP_HIT,         60, ROCK,         100,  5,  10, SPECIAL
	move SHADOW_BALL,  EFFECT_SP_DEF_DOWN_HIT,    80, GHOST,        100, 15,  20, SPECIAL
	move FUTURE_SIGHT, EFFECT_FUTURE_SIGHT,       80, PSYCHIC_TYPE,  90, 15,   0, SPECIAL
	move ROCK_SMASH,   EFFECT_DEFENSE_DOWN_HIT,   65, FIGHTING,     100, 15,  50, PHYSICAL
	move WHIRLPOOL,    EFFECT_TRAP_TARGET,        55, WATER,        100, 15,   0, SPECIAL
	move BEAT_UP,      EFFECT_BEAT_UP,            25, DARK,         100, 10,   0, PHYSICAL
	assert_table_length NUM_ATTACKS
