SECTION "Evolutions and Attacks", ROMX

; Evos+attacks data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, species
;    * db EVOLVE_TRADE, held item (or -1 for none), species
;    * db EVOLVE_HAPPINESS, TR_* constant (ANYTIME, MORNDAY, NITE), species
;    * db EVOLVE_STAT, level, ATK_*_DEF constant (LT, GT, EQ), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

INCLUDE "data/pokemon/evolution_moves.asm"
INCLUDE "data/pokemon/evos_attacks_pointers.asm"

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, VINE_WHIP
	db 10, MAGNITUDE
	db 15, SLEEP_POWDER
	db 20, RAZOR_LEAF
	db 25, LEECH_SEED
	db 29, BODY_SLAM
	db 32, CURSE
	db 35, SEED_BOMB
	db 39, GROWTH
	db 42, EARTHQUAKE
	db 46, MORNING_SUN
	db 50, LEAF_STORM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 36, VENUSAUR
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, VINE_WHIP
	db 10, MAGNITUDE
	db 15, SLEEP_POWDER
	db 22, RAZOR_LEAF
	db 27, LEECH_SEED
	db 32, BODY_SLAM
	db 35, CURSE
	db 39, SEED_BOMB
	db 43, GROWTH
	db 47, EARTHQUAKE
	db 51, MORNING_SUN
	db 56, LEAF_STORM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, EARTH_POWER
	db 1, POUND
	db 4, GROWL
	db 7, VINE_WHIP
	db 10, MAGNITUDE
	db 15, SLEEP_POWDER
	db 22, RAZOR_LEAF
	db 27, LEECH_SEED
	db 32, BODY_SLAM
	db 35, CURSE
	db 41, SEED_BOMB
	db 46, GROWTH
	db 51, EARTHQUAKE
	db 56, MORNING_SUN
	db 62, LEAF_STORM
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, EMBER
	db 10, METAL_CLAW
	db 15, FIRE_SPIN
	db 20, DRAGON_DANCE
	db 25, FIRE_PUNCH
	db 29, SLASH
	db 32, SCARY_FACE
	db 35, DRAGON_CLAW
	db 39, FLAMETHROWER
	db 42, WILL_O_WISP
	db 46, FLARE_BLITZ
	db 50, OUTRAGE
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, TWISTER
	db 1, POUND
	db 4, GROWL
	db 7, EMBER
	db 10, METAL_CLAW
	db 15, FIRE_SPIN
	db 22, DRAGON_DANCE
	db 27, FIRE_PUNCH
	db 32, SLASH
	db 35, SCARY_FACE
	db 39, DRAGON_CLAW
	db 43, FLAMETHROWER
	db 47, WILL_O_WISP
	db 51, FLARE_BLITZ
	db 56, OUTRAGE
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_SLASH
	db 1, TWISTER
	db 1, POUND
	db 4, GROWL
	db 7, EMBER
	db 10, METAL_CLAW
	db 15, FIRE_SPIN
	db 22, DRAGON_DANCE
	db 27, FIRE_PUNCH
	db 32, SLASH
	db 35, SCARY_FACE
	db 41, DRAGON_CLAW
	db 46, FLAMETHROWER
	db 51, WILL_O_WISP
	db 56, FLARE_BLITZ
	db 62, OUTRAGE
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, WATER_GUN
	db 10, BITE
	db 15, MAGNET_BOMB
	db 20, BUBBLEBEAM
	db 25, BARRIER
	db 29, AQUA_JET
	db 32, MIRROR_COAT
	db 35, PROTECT
	db 39, SPIKE_CANNON
	db 42, RAIN_DANCE
	db 46, BODY_SLAM
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, WATER_GUN
	db 10, BITE
	db 15, MAGNET_BOMB
	db 22, BUBBLEBEAM
	db 27, BARRIER
	db 32, AQUA_JET
	db 35, MIRROR_COAT
	db 39, PROTECT
	db 43, SPIKE_CANNON
	db 47, RAIN_DANCE
	db 51, BODY_SLAM
	db 56, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLASH_CANNON
	db 1, POUND
	db 4, GROWL
	db 7, WATER_GUN
	db 10, BITE
	db 15, MAGNET_BOMB
	db 22, BUBBLEBEAM
	db 27, BARRIER
	db 32, AQUA_JET
	db 35, MIRROR_COAT
	db 41, PROTECT
	db 46, SPIKE_CANNON
	db 51, RAIN_DANCE
	db 56, BODY_SLAM
	db 62, HYDRO_PUMP
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 10, METAPOD
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SCARY_FACE
	db 7, STRUGGLE_BUG
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 20, BUTTERFREE
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL
	db 12, CONFUSION
	db 16, MIRROR_COAT
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, GUST
	db 1, MIRROR_COAT
	db 1, STRUGGLE_BUG
	db 1, SCARY_FACE
	db 21, PSYBEAM
	db 22, SILVER_WIND
	db 24, SLEEP_POWDER
	db 28, AIR_SLASH
	db 33, CALM_MIND
	db 38, BUG_BUZZ
	db 44, HURRICANE
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, SCARY_FACE
	db 7, VICEGRIP
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL
	db 12, POISON_TAIL
	db 16, COUNTER
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_TAIL
	db 1, TWINEEDLE
	db 1, COUNTER
	db 1, VICEGRIP
	db 1, SCARY_FACE
	db 21, PURSUIT
	db 22, AGILITY
	db 24, DRILL_RUN
	db 28, POISON_JAB
	db 33, CUT
	db 38, TOXIC
	db 44, LEECH_LIFE
	db 50, GUNK_SHOT
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, GUST
	db 1, POUND
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 15, AIR_CUTTER
	db 21, SWIFT
	db 27, AIR_SLASH
	db 31, CHARM
	db 37, ROAR
	db 42, SWAGGER
	db 47, HYPER_VOICE
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, GUST
	db 1, POUND
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 15, AIR_CUTTER
	db 23, SWIFT
	db 29, AIR_SLASH
	db 34, CHARM
	db 40, ROAR
	db 46, SWAGGER
	db 51, HYPER_VOICE
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, HURRICANE
	db 1, GUST
	db 1, POUND
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 15, AIR_CUTTER
	db 23, SWIFT
	db 29, AIR_SLASH
	db 34, CHARM
	db 42, ROAR
	db 49, SWAGGER
	db 55, HYPER_VOICE
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 4, QUICK_ATTACK
	db 7, FOCUS_ENERGY
	db 10, BITE
	db 15, HEADBUTT
	db 21, SCREECH
	db 26, CRUNCH
	db 31, BODY_SLAM
	db 36, SWORDS_DANCE
	db 42, SUPER_FANG
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCARY_FACE
	db 1, POUND
	db 1, LEER
	db 4, QUICK_ATTACK
	db 7, FOCUS_ENERGY
	db 10, BITE
	db 15, HEADBUTT
	db 23, SCREECH
	db 28, CRUNCH
	db 34, BODY_SLAM
	db 39, SWORDS_DANCE
	db 46, SUPER_FANG
	db 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 4, LEER
	db 7, PURSUIT
	db 13, WING_ATTACK
	db 18, FOCUS_ENERGY
	db 22, FAINT_ATTACK
	db 27, AGILITY
	db 32, DRILL_PECK
	db 37, NIGHT_SLASH
	db 43, BRAVE_BIRD
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, DRILL_RUN
	db 1, PECK
	db 1, GROWL
	db 4, LEER
	db 7, PURSUIT
	db 13, WING_ATTACK
	db 18, FOCUS_ENERGY
	db 24, FAINT_ATTACK
	db 29, AGILITY
	db 35, DRILL_PECK
	db 41, NIGHT_SLASH
	db 48, BRAVE_BIRD
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 9, POISON_STING
	db 15, BITE
	db 21, POISON_TAIL
	db 26, DETECT
	db 32, CRUNCH
	db 36, POISON_JAB
	db 42, HAZE
	db 50, GUNK_SHOT
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, TAIL_SWIPE
	db 1, WRAP
	db 1, LEER
	db 9, POISON_STING
	db 15, BITE
	db 21, POISON_TAIL
	db 28, DETECT
	db 34, CRUNCH
	db 39, POISON_JAB
	db 46, HAZE
	db 50, OUTRAGE
	db 55, GUNK_SHOT
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 6, LEER
	db 8, ATTRACT
	db 11, QUICK_ATTACK
	db 15, FAIRY_WIND
	db 19, FLASH
	db 24, CHARM
	db 30, ENCORE
	db 36, THUNDERBOLT
	db 44, MOONBLAST
	db 50, THUNDER
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 6, LEER
	db 8, ATTRACT
	db 11, QUICK_ATTACK
	db 15, FAIRY_WIND
	db 19, FLASH
	db 24, CHARM
	db 30, ENCORE
	db 36, THUNDERBOLT
	db 44, MOONBLAST
	db 50, THUNDER
	db 55, PSYCH_UP
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 6, FURY_ATTACK
	db 12, ICE_SHARD
	db 17, METAL_CLAW
	db 23, SLASH
	db 28, ICICLE_CRASH
	db 32, RAPID_SPIN
	db 37, SWORDS_DANCE
	db 43, IRON_TAIL
	db 50, ICE_HAMMER
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLASH
	db 1, POUND
	db 1, DEFENSE_CURL
	db 6, FURY_ATTACK
	db 12, ICE_SHARD
	db 17, METAL_CLAW
	db 30, ICICLE_CRASH
	db 35, RAPID_SPIN
	db 41, SWORDS_DANCE
	db 48, IRON_TAIL
	db 56, ICE_HAMMER
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, POISON_STING
	db 4, POUND
	db 9, LEER
	db 14, DOUBLE_KICK
	db 18, POISON_TAIL
	db 23, BITE
	db 29, HEADBUTT
	db 35, TOXIC
	db 41, MILK_DRINK
	db 47, SLUDGE_BOMB
	db 55, HYPER_VOICE
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, POISON_STING
	db 4, POUND
	db 9, LEER
	db 14, DOUBLE_KICK
	db 20, POISON_TAIL
	db 25, BITE
	db 32, HEADBUTT
	db 38, TOXIC
	db 45, PROTECT
	db 51, SLUDGE_BOMB
	db 60, HYPER_VOICE
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, MILK_DRINK
	db 1, GROWL
	db 1, POISON_STING
	db 4, POUND
	db 9, LEER
	db 14, DOUBLE_KICK
	db 20, POISON_TAIL
	db 25, BITE
	db 32, HEADBUTT
	db 38, TOXIC
	db 45, PROTECT
	db 51, SLUDGE_BOMB
	db 60, HYPER_VOICE
	db 65, SPIKES
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, LEER
	db 1, POISON_STING
	db 4, PECK
	db 9, FOCUS_ENERGY
	db 14, DOUBLE_KICK
	db 18, POISON_TAIL
	db 23, FAINT_ATTACK
	db 29, BULLDOZE
	db 35, SCARY_FACE
	db 41, POISON_JAB
	db 47, CRUNCH
	db 55, CLOSE_COMBAT
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, LEER
	db 1, POISON_STING
	db 4, PECK
	db 9, FOCUS_ENERGY
	db 14, DOUBLE_KICK
	db 20, POISON_TAIL
	db 25, FAINT_ATTACK
	db 32, BULLDOZE
	db 38, SCARY_FACE
	db 45, POISON_JAB
	db 51, CRUNCH
	db 60, CLOSE_COMBAT
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, EARTHQUAKE
	db 1, LEER
	db 1, POISON_STING
	db 4, PECK
	db 9, FOCUS_ENERGY
	db 14, DOUBLE_KICK
	db 20, POISON_TAIL
	db 25, FAINT_ATTACK
	db 32, BULLDOZE
	db 38, SCARY_FACE
	db 45, POISON_JAB
	db 51, CRUNCH
	db 60, CLOSE_COMBAT
	db 65, THRASH
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 4, ENCORE
	db 8, HYPNOSIS
	db 13, FAIRY_WIND
	db 18, DEFENSE_CURL
	db 24, DRAIN_KISS
	db 30, METRONOME
	db 36, MORNING_SUN
	db 42, MOONBLAST
	db 48, ENDURE
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 4, ENCORE
	db 8, HYPNOSIS
	db 13, FAIRY_WIND
	db 18, DEFENSE_CURL
	db 24, DRAIN_KISS
	db 30, METRONOME
	db 36, MORNING_SUN
	db 42, MOONBLAST
	db 48, ENDURE
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 4, QUICK_ATTACK
	db 8, ROAR
	db 12, CONFUSION
	db 17, CONFUSE_RAY
	db 21, WILL_O_WISP
	db 25, FLAME_BURST
	db 30, SAFEGUARD
	db 34, FIRE_SPIN
	db 40, PSYCHIC_M
	db 45, FLAMETHROWER
	db 51, HYPNOSIS
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYCH_UP
	db 1, EMBER
	db 1, LEER
	db 4, QUICK_ATTACK
	db 8, ROAR
	db 12, CONFUSION
	db 17, CONFUSE_RAY
	db 21, WILL_O_WISP
	db 25, FLAME_BURST
	db 30, SAFEGUARD
	db 34, FIRE_SPIN
	db 40, PSYCHIC_M
	db 45, FLAMETHROWER
	db 51, HYPNOSIS
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, CHARM
	db 1, HYPNOSIS
	db 1, FAIRY_WIND
	db 4, DEFENSE_CURL
	db 9, POUND
	db 14, DISABLE
	db 19, ROLLOUT
	db 24, SWIFT
	db 29, COVET
	db 34, REST
	db 39, HYPER_VOICE
	db 44, DOUBLE_EDGE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, MOONBLAST
	db 1, CHARM
	db 1, HYPNOSIS
	db 1, FAIRY_WIND
	db 4, DEFENSE_CURL
	db 9, POUND
	db 14, DISABLE
	db 19, ROLLOUT
	db 24, SWIFT
	db 29, COVET
	db 34, REST
	db 39, HYPER_VOICE
	db 44, DOUBLE_EDGE
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, ABSORB
	db 6, CONFUSE_RAY
	db 12, BITE
	db 17, WING_ATTACK
	db 23, MEAN_LOOK
	db 28, POISON_TAIL
	db 34, HAZE
	db 39, TOXIC
	db 45, POISON_JAB
	db 51, BRAVE_BIRD
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, POISON_STING
	db 1, ABSORB
	db 6, CONFUSE_RAY
	db 12, BITE
	db 17, WING_ATTACK
	db 25, MEAN_LOOK
	db 30, POISON_TAIL
	db 37, HAZE
	db 42, TOXIC
	db 49, POISON_JAB
	db 56, BRAVE_BIRD
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 7, ACID
	db 12, STUN_SPORE
	db 14, SNARL
	db 16, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 25, SWEET_SCENT
	db 29, MORNING_SUN
	db 34, GIGA_DRAIN
	db 40, LEECH_SEED
	db 45, PETAL_DANCE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 7, ACID
	db 12, STUN_SPORE
	db 14, SNARL
	db 16, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 27, SWEET_SCENT
	db 31, MORNING_SUN
	db 37, GIGA_DRAIN
	db 44, LEECH_SEED
	db 50, PETAL_DANCE
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DARK_PULSE
	db 1, ABSORB
	db 1, GROWTH
	db 7, ACID
	db 12, STUN_SPORE
	db 14, SNARL
	db 16, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 27, SWEET_SCENT
	db 31, MORNING_SUN
	db 37, GIGA_DRAIN
	db 44, LEECH_SEED
	db 50, PETAL_DANCE
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CURSE
	db 6, STUN_SPORE
	db 6, POISONPOWDER
	db 12, RAZOR_LEAF
	db 18, VICEGRIP
	db 21, GROWTH
	db 25, SPORE
	db 30, SLASH
	db 36, LEECH_LIFE
	db 42, SWORDS_DANCE
	db 48, WOOD_HAMMER
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, SHADOW_CLAW
	db 1, POUND
	db 1, CURSE
	db 6, STUN_SPORE
	db 6, POISONPOWDER
	db 12, RAZOR_LEAF
	db 18, VICEGRIP
	db 21, GROWTH
	db 27, SPORE
	db 33, SLASH
	db 39, LEECH_LIFE
	db 46, SWORDS_DANCE
	db 53, WOOD_HAMMER
	db 56, POLTERGEIST
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DISABLE
	db 1, FORESIGHT
	db 7, STRUGGLE_BUG
	db 10, CONFUSE_RAY
	db 14, CONFUSION
	db 18, SIGNAL_BEAM
	db 23, STUN_SPORE
	db 27, PSYBEAM
	db 32, SILVER_WIND
	db 36, SLEEP_POWDER
	db 41, PSYCHIC_M
	db 45, BUG_BUZZ
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_SLASH
	db 1, POUND
	db 1, DISABLE
	db 1, FORESIGHT
	db 7, STRUGGLE_BUG
	db 10, CONFUSE_RAY
	db 14, CONFUSION
	db 18, SIGNAL_BEAM
	db 23, STUN_SPORE
	db 27, PSYBEAM
	db 34, SILVER_WIND
	db 39, SLEEP_POWDER
	db 45, PSYCHIC_M
	db 50, BUG_BUZZ
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 6, MAGNITUDE
	db 12, PURSUIT
	db 17, DIG
	db 21, BULLDOZE
	db 27, SPIKES
	db 32, SLASH
	db 37, BEAT_UP
	db 41, SANDSTORM
	db 46, EARTHQUAKE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SLASH
	db 1, POUND
	db 1, GROWL
	db 6, MAGNITUDE
	db 12, PURSUIT
	db 17, DIG
	db 21, BULLDOZE
	db 29, SPIKES
	db 35, SLASH
	db 40, BEAT_UP
	db 45, SANDSTORM
	db 51, EARTHQUAKE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 8, METAL_CLAW
	db 15, BITE
	db 22, FURY_ATTACK
	db 27, SCREECH
	db 31, QUICK_ATTACK
	db 37, IRON_TAIL
	db 42, FOCUS_ENERGY
	db 48, DOUBLE_EDGE
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLASH
	db 1, POUND
	db 1, GROWL
	db 8, METAL_CLAW
	db 15, BITE
	db 22, FURY_ATTACK
	db 27, SCREECH
	db 33, QUICK_ATTACK
	db 40, IRON_TAIL
	db 46, FOCUS_ENERGY
	db 53, DOUBLE_EDGE
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 5, WATER_GUN
	db 10, DISABLE
	db 15, CONFUSION
	db 20, BUBBLEBEAM
	db 25, PSYBEAM
	db 30, NIGHTMARE
	db 35, SURF
	db 40, FUTURE_SIGHT
	db 45, PSYCHIC_M
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYCH_UP
	db 1, POUND
	db 1, LEER
	db 5, WATER_GUN
	db 10, DISABLE
	db 15, CONFUSION
	db 20, BUBBLEBEAM
	db 25, PSYBEAM
	db 30, NIGHTMARE
	db 37, SURF
	db 43, FUTURE_SIGHT
	db 49, PSYCHIC_M
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 4, FOCUS_ENERGY
	db 9, KARATE_CHOP
	db 13, DIZZY_PUNCH
	db 20, ROCK_SMASH
	db 24, SEISMIC_TOSS
	db 30, BULLDOZE
	db 36, DRAIN_PUNCH
	db 41, BULK_UP
	db 45, SCREECH
	db 50, CLOSE_COMBAT
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 1, POUND
	db 1, LEER
	db 4, FOCUS_ENERGY
	db 9, KARATE_CHOP
	db 13, DIZZY_PUNCH
	db 20, ROCK_SMASH
	db 24, SEISMIC_TOSS
	db 32, BULLDOZE
	db 39, DRAIN_PUNCH
	db 45, BULK_UP
	db 50, SCREECH
	db 56, CLOSE_COMBAT
	db 60, THRASH
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, BITE
	db 1, ROAR
	db 1, LEER
	db 7, EMBER
	db 12, ROCK_THROW
	db 17, FLAME_WHEEL
	db 22, STOMP
	db 28, CRUNCH
	db 33, ROCK_SLIDE
	db 39, MORNING_SUN
	db 44, PLAY_ROUGH
	db 50, FLARE_BLITZ
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, EXTREMESPEED
	db 1, BITE
	db 1, ROAR
	db 1, LEER
	db 7, EMBER
	db 12, ROCK_THROW
	db 17, FLAME_WHEEL
	db 22, STOMP
	db 28, CRUNCH
	db 33, ROCK_SLIDE
	db 39, MORNING_SUN
	db 44, PLAY_ROUGH
	db 50, FLARE_BLITZ
	db 56, HEAD_SMASH
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, POUND
	db 7, HYPNOSIS
	db 12, SWIFT
	db 17, BUBBLEBEAM
	db 23, RAIN_DANCE
	db 28, BODY_SLAM
	db 33, HAZE
	db 37, BELLY_DRUM
	db 43, PERISH_SONG
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_ITEM, KINGS_ROCK, POLITOED
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, POUND
	db 7, HYPNOSIS
	db 12, SWIFT
	db 17, BUBBLEBEAM
	db 23, RAIN_DANCE
	db 30, BODY_SLAM
	db 35, HAZE
	db 40, BELLY_DRUM
	db 47, PERISH_SONG
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, CLOSE_COMBAT
	db 1, AQUA_JET
	db 1, POUND
	db 7, HYPNOSIS
	db 12, DIZZY_PUNCH
	db 17, AQUA_CUTTER
	db 23, RAIN_DANCE
	db 30, BODY_SLAM
	db 35, HAZE
	db 40, BELLY_DRUM
	db 47, DRAIN_PUNCH
	db 55, WAVE_CRASH
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_LEVEL, 38, ALAKAZAM
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, TELEPORT
	db 1, GROWL
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, RECOVER
	db 31, REFLECT
	db 36, PSYCHIC_M
	db 40, AURA_SPHERE
	db 45, ZAP_CANNON
	db 50, CALM_MIND
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, FUTURE_SIGHT
	db 1, CONFUSION
	db 1, TELEPORT
	db 1, GROWL
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, RECOVER
	db 31, REFLECT
	db 36, PSYCHIC_M
	db 44, AURA_SPHERE
	db 49, ZAP_CANNON
	db 55, CALM_MIND
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, MACH_PUNCH
	db 1, LEER
	db 7, FOCUS_ENERGY
	db 12, KARATE_CHOP
	db 17, FAINT_ATTACK
	db 22, FORESIGHT
	db 26, HEADBUTT
	db 31, VITAL_THROW
	db 36, ROCK_SMASH
	db 41, SCARY_FACE
	db 48, DRAIN_PUNCH
	db 53, CLOSE_COMBAT
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_LEVEL, 38, MACHAMP
	db 0 ; no more evolutions
	db 1, MACH_PUNCH
	db 1, LEER
	db 7, FOCUS_ENERGY
	db 12, KARATE_CHOP
	db 17, FAINT_ATTACK
	db 22, FORESIGHT
	db 26, HEADBUTT
	db 33, VITAL_THROW
	db 39, ROCK_SMASH
	db 44, SCARY_FACE
	db 52, DRAIN_PUNCH
	db 58, CLOSE_COMBAT
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, DYNAMICPUNCH
	db 1, MACH_PUNCH
	db 1, LEER
	db 7, FOCUS_ENERGY
	db 12, KARATE_CHOP
	db 17, FAINT_ATTACK
	db 22, FORESIGHT
	db 26, HEADBUTT
	db 33, VITAL_THROW
	db 41, ROCK_SMASH
	db 47, SCARY_FACE
	db 56, DRAIN_PUNCH
	db 63, CLOSE_COMBAT
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 4, GROWTH
	db 9, WRAP
	db 13, SLEEP_POWDER
	db 17, RAZOR_LEAF
	db 19, STUN_SPORE
	db 24, SPIKE_CANNON
	db 30, SEED_BOMB
	db 36, BODY_SLAM
	db 42, SPIKES
	db 50, WOOD_HAMMER
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 4, GROWTH
	db 9, WRAP
	db 13, SLEEP_POWDER
	db 17, RAZOR_LEAF
	db 19, STUN_SPORE
	db 26, SPIKE_CANNON
	db 33, SEED_BOMB
	db 39, BODY_SLAM
	db 46, SPIKES
	db 55, WOOD_HAMMER
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, IRON_TAIL
	db 1, VINE_WHIP
	db 4, GROWTH
	db 9, WRAP
	db 13, SLEEP_POWDER
	db 17, RAZOR_LEAF
	db 19, STUN_SPORE
	db 26, SPIKE_CANNON
	db 33, SEED_BOMB
	db 39, BODY_SLAM
	db 46, SPIKES
	db 55, WOOD_HAMMER
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, ACID
	db 1, WATER_GUN
	db 6, CONFUSE_RAY
	db 12, WRAP
	db 17, BUBBLEBEAM
	db 22, RAPID_SPIN
	db 28, HAZE
	db 34, BARRIER
	db 40, SCALD
	db 45, NIGHTMARE
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, ACID
	db 1, WATER_GUN
	db 6, CONFUSE_RAY
	db 12, WRAP
	db 17, BUBBLEBEAM
	db 22, RAPID_SPIN
	db 28, HAZE
	db 36, BARRIER
	db 43, SCALD
	db 49, NIGHTMARE
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 7, ROCK_THROW
	db 13, SPARK
	db 18, AGILITY
	db 23, THUNDER_WAVE
	db 29, THUNDERPUNCH
	db 34, ROCK_BLAST
	db 40, SANDSTORM
	db 45, WILD_CHARGE
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_LEVEL, 38, GOLEM
	db 0 ; no more evolutions
	db 1, ROLLOUT
	db 1, POUND
	db 1, DEFENSE_CURL
	db 7, ROCK_THROW
	db 13, SPARK
	db 18, AGILITY
	db 23, THUNDER_WAVE
	db 31, THUNDERPUNCH
	db 37, ROCK_BLAST
	db 43, SANDSTORM
	db 49, WILD_CHARGE
	db 55, DOUBLE_EDGE
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, EXPLOSION
	db 1, ROLLOUT
	db 1, POUND
	db 1, DEFENSE_CURL
	db 7, ROCK_THROW
	db 13, SPARK
	db 18, AGILITY
	db 23, THUNDER_WAVE
	db 31, THUNDERPUNCH
	db 37, ROCK_BLAST
	db 46, SANDSTORM
	db 53, WILD_CHARGE
	db 60, DOUBLE_EDGE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 34, RAPIDASH
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 1, LEER
	db 5, EMBER
	db 10, COVET
	db 15, FLAME_WHEEL
	db 20, STOMP
	db 25, AGILITY
	db 30, FRUSTRATION
	db 35, FIRE_SPIN
	db 40, BODY_SLAM
	db 45, BATON_PASS
	db 50, FLARE_BLITZ
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, PLAY_ROUGH
	db 1, POUND
	db 1, GROWL
	db 1, LEER
	db 5, EMBER
	db 10, COVET
	db 15, FLAME_WHEEL
	db 20, STOMP
	db 25, AGILITY
	db 30, FRUSTRATION
	db 37, FIRE_SPIN
	db 43, BODY_SLAM
	db 49, BATON_PASS
	db 55, FLARE_BLITZ
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 32, SLOWBRO
	db EVOLVE_ITEM, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, POUND
	db 1, GROWL
	db 8, CONFUSION
	db 12, BUBBLEBEAM
	db 16, DISABLE
	db 20, HEADBUTT
	db 26, PSYBEAM
	db 31, SCALD
	db 36, FUTURE_SIGHT
	db 43, RECOVER
	db 48, PSYCHIC_M
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, AMNESIA
	db 1, CURSE
	db 1, POUND
	db 1, GROWL
	db 8, CONFUSION
	db 12, BUBBLEBEAM
	db 16, DISABLE
	db 20, HEADBUTT
	db 26, PSYBEAM
	db 31, SCALD
	db 35, SLUDGE_BOMB
	db 38, FUTURE_SIGHT
	db 46, RECOVER
	db 52, PSYCHIC_M
	db 60, BARRIER
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, POUND
	db 4, THUNDERSHOCK
	db 9, CONFUSE_RAY
	db 12, THUNDER_WAVE
	db 16, SONICBOOM
	db 21, FLASH
	db 27, MAGNET_BOMB
	db 32, FLASH_CANNON
	db 37, ZAP_CANNON
	db 43, LIGHT_SCREEN
	db 49, THUNDERBOLT
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRI_ATTACK
	db 1, POUND
	db 4, THUNDERSHOCK
	db 9, CONFUSE_RAY
	db 12, THUNDER_WAVE
	db 16, SONICBOOM
	db 21, FLASH
	db 27, MAGNET_BOMB
	db 34, FLASH_CANNON
	db 40, ZAP_CANNON
	db 47, LIGHT_SCREEN
	db 54, THUNDERBOLT
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 5, FURY_CUTTER
	db 10, ROCK_SMASH
	db 15, THIEF
	db 20, WING_ATTACK
	db 25, SLASH
	db 30, BULK_UP
	db 35, NIGHT_SLASH
	db 40, SWORDS_DANCE
	db 45, CLOSE_COMBAT
	db 50, BRAVE_BIRD
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 5, QUICK_ATTACK
	db 9, PURSUIT
	db 13, DOUBLE_KICK
	db 18, WING_ATTACK
	db 24, LOW_KICK
	db 30, DRILL_PECK
	db 35, AGILITY
	db 41, BATON_PASS
	db 48, HI_JUMP_KICK
	db 55, BRAVE_BIRD
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, DRILL_RUN
	db 1, PECK
	db 1, GROWL
	db 5, QUICK_ATTACK
	db 9, PURSUIT
	db 13, DOUBLE_KICK
	db 18, WING_ATTACK
	db 24, LOW_KICK
	db 30, DRILL_PECK
	db 37, AGILITY
	db 44, BATON_PASS
	db 52, HI_JUMP_KICK
	db 60, BRAVE_BIRD
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, WATER_GUN
	db 5, GROWL
	db 10, ICY_WIND
	db 15, BUBBLEBEAM
	db 18, ENCORE
	db 21, REST
	db 21, SLEEP_TALK
	db 27, AQUA_JET
	db 32, BODY_SLAM
	db 37, ICE_BEAM
	db 42, SAFEGUARD
	db 48, WHIRLPOOL
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, BLIZZARD
	db 1, HEADBUTT
	db 1, WATER_GUN
	db 5, GROWL
	db 10, ICY_WIND
	db 15, BUBBLEBEAM
	db 18, ENCORE
	db 21, REST
	db 21, SLEEP_TALK
	db 27, AQUA_JET
	db 32, BODY_SLAM
	db 40, ICE_BEAM
	db 46, SAFEGUARD
	db 53, WHIRLPOOL
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 33, MUK
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, POUND
	db 4, DEFENSE_CURL
	db 7, DISABLE
	db 10, BITE
	db 16, POISON_TAIL
	db 21, BEAT_UP
	db 25, SCREECH
	db 30, SWEET_SCENT
	db 37, CRUNCH
	db 43, BARRIER
	db 50, GUNK_SHOT
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, POUND
	db 4, DEFENSE_CURL
	db 7, DISABLE
	db 10, BITE
	db 16, POISON_TAIL
	db 21, BEAT_UP
	db 25, SCREECH
	db 30, SWEET_SCENT
	db 39, CRUNCH
	db 46, BARRIER
	db 54, GUNK_SHOT
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 1, POWDER_SNOW
	db 9, CONFUSE_RAY
	db 12, ICE_SHARD
	db 17, AURORA_BEAM
	db 21, PROTECT
	db 25, AQUA_CUTTER
	db 30, BARRIER
	db 36, SPIKE_CANNON
	db 42, ROCK_BLAST
	db 50, ICICLE_SPEAR
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, POUND
	db 1, DEFENSE_CURL
	db 1, POWDER_SNOW
	db 9, CONFUSE_RAY
	db 12, ICE_SHARD
	db 17, AURORA_BEAM
	db 21, PROTECT
	db 25, AQUA_CUTTER
	db 30, BARRIER
	db 36, SPIKE_CANNON
	db 42, ROCK_BLAST
	db 50, ICICLE_SPEAR
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 6, CONFUSE_RAY
	db 10, MEAN_LOOK
	db 14, CURSE
	db 19, NIGHT_SHADE
	db 23, OMINOUS_WIND
	db 28, SPITE
	db 33, DREAM_EATER
	db 36, DESTINY_BOND
	db 42, AURA_SPHERE
	db 50, PERISH_SONG
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_LEVEL, 38, GENGAR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 6, CONFUSE_RAY
	db 10, MEAN_LOOK
	db 14, CURSE
	db 19, NIGHT_SHADE
	db 23, OMINOUS_WIND
	db 30, SPITE
	db 36, DREAM_EATER
	db 39, DESTINY_BOND
	db 46, AURA_SPHERE
	db 55, PERISH_SONG
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, SHADOW_BALL
	db 1, HYPNOSIS
	db 1, LICK
	db 6, CONFUSE_RAY
	db 10, MEAN_LOOK
	db 14, CURSE
	db 19, NIGHT_SHADE
	db 23, OMINOUS_WIND
	db 30, SPITE
	db 36, DREAM_EATER
	db 42, DESTINY_BOND
	db 50, AURA_SPHERE
	db 60, PERISH_SONG
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SCREECH
	db 1, DEFENSE_CURL
	db 6, ROCK_THROW
	db 12, WRAP
	db 19, HEADBUTT
	db 25, CURSE
	db 29, ROCK_SLIDE
	db 34, SANDSTORM
	db 40, BODY_SLAM
	db 45, THRASH
	db 50, HEAD_SMASH
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 5, DISABLE
	db 10, CONFUSION
	db 13, KARATE_CHOP
	db 18, PSYBEAM
	db 23, VACUUM_WAVE
	db 27, ZEN_HEADBUTT
	db 31, DRAIN_PUNCH
	db 36, SWAGGER
	db 40, PSYCHIC_M
	db 44, PSYCH_UP
	db 49, FUTURE_SIGHT
	db 53, FOCUS_BLAST
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, AURA_SPHERE
	db 1, POUND
	db 1, HYPNOSIS
	db 5, DISABLE
	db 10, CONFUSION
	db 13, KARATE_CHOP
	db 18, PSYBEAM
	db 23, VACUUM_WAVE
	db 29, ZEN_HEADBUTT
	db 33, DRAIN_PUNCH
	db 39, SWAGGER
	db 43, PSYCHIC_M
	db 48, PSYCH_UP
	db 53, FUTURE_SIGHT
	db 58, FOCUS_BLAST
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, AQUA_JET
	db 1, LEER
	db 9, METAL_CLAW
	db 13, DEFENSE_CURL
	db 18, BULLET_PUNCH
	db 22, STOMP
	db 27, AQUA_CUTTER
	db 32, PROTECT
	db 36, IRON_TAIL
	db 41, SWORDS_DANCE
	db 48, ICE_HAMMER
	db 54, WOOD_HAMMER
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, CRABHAMMER
	db 1, AQUA_JET
	db 1, LEER
	db 9, METAL_CLAW
	db 13, DEFENSE_CURL
	db 18, BULLET_PUNCH
	db 22, STOMP
	db 27, AQUA_CUTTER
	db 34, PROTECT
	db 39, IRON_TAIL
	db 45, SWORDS_DANCE
	db 52, ICE_HAMMER
	db 59, WOOD_HAMMER
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 34, ELECTRODE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, THUNDERSHOCK
	db 7, STUN_SPORE
	db 11, SCREECH
	db 15, SONICBOOM
	db 19, RAZOR_LEAF
	db 24, ZAP_CANNON
	db 29, ROLLOUT
	db 33, GIGA_DRAIN
	db 37, THUNDERBOLT
	db 41, REFLECT
	db 46, EXPLOSION
	db 54, LEAF_STORM
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, CHLOROBLAST
	db 1, POUND
	db 1, THUNDERSHOCK
	db 7, STUN_SPORE
	db 11, SCREECH
	db 15, SONICBOOM
	db 19, RAZOR_LEAF
	db 24, ZAP_CANNON
	db 29, ROLLOUT
	db 33, GIGA_DRAIN
	db 39, THUNDERBOLT
	db 44, REFLECT
	db 50, EXPLOSION
	db 59, LEAF_STORM
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, HYPNOSIS
	db 5, REFLECT
	db 10, LEECH_SEED
	db 15, MEGA_DRAIN
	db 20, CONFUSION
	db 25, MORNING_SUN
	db 30, PSYBEAM
	db 35, GIGA_DRAIN
	db 40, GROWTH
	db 45, PSYCHIC_M
	db 50, LEAF_STORM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, STOMP
	db 1, ABSORB
	db 1, HYPNOSIS
	db 5, REFLECT
	db 10, LEECH_SEED
	db 15, MEGA_DRAIN
	db 20, CONFUSION
	db 25, MORNING_SUN
	db 30, PSYBEAM
	db 35, GIGA_DRAIN
	db 40, GROWTH
	db 45, PSYCHIC_M
	db 50, LEAF_STORM
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 5, LICK
	db 9, BULLDOZE
	db 13, SHADOW_SNEAK
	db 17, HEADBUTT
	db 21, FOCUS_ENERGY
	db 25, BONEMERANG
	db 29, SHADOW_CLAW
	db 33, BULK_UP
	db 37, THRASH
	db 41, POLTERGEIST
	db 48, PERISH_SONG
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWORDS_DANCE
	db 1, POUND
	db 1, GROWL
	db 5, LICK
	db 9, BULLDOZE
	db 13, SHADOW_SNEAK
	db 17, HEADBUTT
	db 21, FOCUS_ENERGY
	db 25, BONEMERANG
	db 31, SHADOW_CLAW
	db 35, BULK_UP
	db 40, THRASH
	db 46, POLTERGEIST
	db 53, PERISH_SONG
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK
	db 1, POUND
	db 1, FOCUS_ENERGY
	db 1, FORESIGHT
	db 1, MACH_PUNCH
	db 21, LOW_KICK
	db 26, STOMP
	db 31, FAINT_ATTACK
	db 36, SWORDS_DANCE
	db 41, EXTREMESPEED
	db 46, REVERSAL
	db 51, HI_JUMP_KICK
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, DIZZY_PUNCH
	db 1, POUND
	db 1, FOCUS_ENERGY
	db 1, FORESIGHT
	db 1, MACH_PUNCH
	db 21, BULLET_PUNCH
	db 26, THUNDERPUNCH
	db 26, ICE_PUNCH
	db 26, FIRE_PUNCH
	db 32, DRAIN_PUNCH
	db 38, DYNAMICPUNCH
	db 44, IRON_TAIL
	db 50, COUNTER
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 1, DEFENSE_CURL
	db 7, CONFUSE_RAY
	db 13, POISON_TAIL
	db 18, STOMP
	db 23, WRAP
	db 28, DISABLE
	db 34, POISON_JAB
	db 40, BODY_SLAM
	db 46, GUNK_SHOT
	db 52, BELLY_DRUM
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, POUND
	db 5, ACID
	db 12, FAIRY_WIND
	db 16, WILL_O_WISP
	db 21, SWEET_SCENT
	db 25, PAIN_SPLIT
	db 30, HAZE
	db 36, SLUDGE_BOMB
	db 41, DESTINY_BOND
	db 47, MOONBLAST
	db 53, EXPLOSION
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, POUND
	db 5, ACID
	db 12, FAIRY_WIND
	db 16, WILL_O_WISP
	db 21, SWEET_SCENT
	db 25, PAIN_SPLIT
	db 30, HAZE
	db 38, SLUDGE_BOMB
	db 44, DESTINY_BOND
	db 51, MOONBLAST
	db 58, EXPLOSION
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 38, RHYDON
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 5, STOMP
	db 10, FURY_ATTACK
	db 15, TAIL_SWIPE
	db 20, ROCK_BLAST
	db 25, CURSE
	db 30, ROCK_SLIDE
	db 35, CRUNCH
	db 40, MEGAHORN
	db 45, OUTRAGE
	db 50, HEAD_SMASH
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, DRILL_RUN
	db 1, POUND
	db 1, LEER
	db 5, STOMP
	db 10, FURY_ATTACK
	db 15, TAIL_SWIPE
	db 20, ROCK_BLAST
	db 25, CURSE
	db 30, ROCK_SLIDE
	db 35, CRUNCH
	db 43, MEGAHORN
	db 49, OUTRAGE
	db 55, HEAD_SMASH
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, POUND
	db 5, GROWL
	db 9, LEER
	db 13, SOFTBOILED
	db 17, METRONOME
	db 23, DEFENSE_CURL
	db 29, HYPNOSIS
	db 35, BODY_SLAM
	db 41, DEFENSE_CURL
	db 49, LIGHT_SCREEN
	db 57, DOUBLE_EDGE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, ABSORB
	db 4, STUN_SPORE
	db 10, GROWTH
	db 13, MEGA_DRAIN
	db 19, VINE_WHIP
	db 25, ANCIENTPOWER
	db 31, GIGA_DRAIN
	db 34, SLEEP_POWDER
	db 40, LEECH_SEED
	db 46, WOOD_HAMMER
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 7, MACH_PUNCH
	db 13, ROCK_THROW
	db 19, STOMP
	db 25, DRAIN_PUNCH
	db 31, ROCK_SLIDE
	db 37, AGILITY
	db 43, DIZZY_PUNCH
	db 49, STRENGTH
	db 55, CLOSE_COMBAT
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER
	db 8, FOCUS_ENERGY
	db 15, BUBBLEBEAM
	db 22, TWISTER
	db 29, AGILITY
	db 36, SWEET_SCENT
	db 43, DRAGON_DANCE
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_ITEM, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER
	db 8, FOCUS_ENERGY
	db 15, BUBBLEBEAM
	db 22, TWISTER
	db 29, AGILITY
	db 39, SWEET_SCENT
	db 47, DRAGON_DANCE
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 5, CONFUSE_RAY
	db 10, AQUA_JET
	db 15, COVET
	db 20, HEADBUTT
	db 25, REVERSAL
	db 30, FRUSTRATION
	db 35, WATERFALL
	db 40, AGILITY
	db 45, PLAY_ROUGH
	db 50, WAVE_CRASH
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, DRILL_RUN
	db 1, PECK
	db 1, LEER
	db 5, CONFUSE_RAY
	db 10, AQUA_JET
	db 15, COVET
	db 20, HEADBUTT
	db 25, AGILITY
	db 30, FRUSTRATION
	db 37, WATERFALL
	db 43, MEGAHORN
	db 49, PLAY_ROUGH
	db 55, WAVE_CRASH
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 6, CONFUSION
	db 12, SWIFT
	db 18, RECOVER
	db 24, ANCIENTPOWER
	db 30, PSYBEAM
	db 36, RAPID_SPIN
	db 42, POWER_GEM
	db 48, PSYCHIC_M
	db 54, LIGHT_SCREEN
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, CALM_MIND
	db 1, POUND
	db 1, DEFENSE_CURL
	db 6, CONFUSION
	db 12, SWIFT
	db 18, RECOVER
	db 24, ANCIENTPOWER
	db 30, PSYBEAM
	db 36, RAPID_SPIN
	db 42, POWER_GEM
	db 48, PSYCHIC_M
	db 54, LIGHT_SCREEN
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 1, CONFUSION
	db 5, FAIRY_WIND
	db 11, SUBSTITUTE
	db 16, ENCORE
	db 21, PSYBEAM
	db 26, LIGHT_SCREEN
	db 26, REFLECT
	db 31, SAFEGUARD
	db 36, PSYCHIC_M
	db 41, MOONBLAST
	db 46, BATON_PASS
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_SHARD
	db 1, LEER
	db 6, FURY_CUTTER
	db 12, PURSUIT
	db 18, DOUBLE_TEAM
	db 24, AGILITY
	db 30, SLASH
	db 36, ICICLE_CRASH
	db 42, SWORDS_DANCE
	db 48, NIGHT_SLASH
	db 54, BATON_PASS
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEAN_LOOK
	db 1, POUND
	db 1, LICK
	db 7, CONFUSION
	db 12, POWDER_SNOW
	db 17, CONFUSE_RAY
	db 22, AURORA_BEAM
	db 27, PSYBEAM
	db 34, HYPNOSIS
	db 40, PSYCHIC_M
	db 45, ICE_BEAM
	db 51, PERISH_SONG
	db 57, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, POUND
	db 1, LEER
	db 7, THUNDERSHOCK
	db 12, THUNDER_WAVE
	db 17, SPARK
	db 22, LOW_KICK
	db 27, BULK_UP
	db 34, THUNDERPUNCH
	db 40, DRAIN_PUNCH
	db 45, LIGHT_SCREEN
	db 51, WILD_CHARGE
	db 57, CLOSE_COMBAT
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHTMARE
	db 1, POUND
	db 1, LEER
	db 7, EMBER
	db 12, WILL_O_WISP
	db 17, SWEET_SCENT
	db 22, FLAME_BURST
	db 27, CALM_MIND
	db 34, SLUDGE
	db 40, FLAMETHROWER
	db 45, REFLECT
	db 51, SLUDGE_BOMB
	db 57, OVERHEAT
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, VICEGRIP
	db 1, FOCUS_ENERGY
	db 7, WRAP
	db 13, BULLDOZE
	db 19, QUICK_ATTACK
	db 25, DIG
	db 31, VITAL_THROW
	db 37, LEECH_LIFE
	db 43, SWORDS_DANCE
	db 50, HEADLONGRUSH
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 5, DOUBLE_KICK
	db 10, STOMP
	db 15, FLAME_WHEEL
	db 20, LOW_KICK
	db 25, SCARY_FACE
	db 30, ZEN_HEADBUTT
	db 35, THRASH
	db 40, BULK_UP
	db 45, FLARE_BLITZ
	db 50, CLOSE_COMBAT
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, LEER
	db 15, POUND
	db 30, REVERSAL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, POUND
	db 1, REVERSAL
	db 1, BITE
	db 21, THRASH
	db 25, DRAGON_CLAW
	db 30, AQUA_CUTTER
	db 35, DRAGON_DANCE
	db 40, CRUNCH
	db 45, OUTRAGE
	db 50, WAVE_CRASH
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, POWDER_SNOW
	db 1, GROWL
	db 1, HYPNOSIS
	db 8, CONFUSE_RAY
	db 15, TWISTER
	db 22, AURORA_BEAM
	db 29, PERISH_SONG
	db 36, ICE_BEAM
	db 43, HAIL
	db 50, BLIZZARD
	db 57, DRACO_METEOR
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_ITEM, SUN_STONE, ESPEON
	db EVOLVE_ITEM, MOON_STONE, UMBREON
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 15, BITE
	db 20, SWIFT
	db 25, CHARM
	db 30, COVET
	db 35, BATON_PASS
	db 40, BODY_SLAM
	db 45, HYPER_VOICE
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, CHARM
	db 1, COVET
	db 1, BATON_PASS
	db 1, HYPER_VOICE
	db 1, DOUBLE_EDGE
	db 1, WATER_GUN
	db 1, POUND
	db 1, LEER
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 15, BITE
	db 20, BUBBLEBEAM
	db 25, HAZE
	db 30, AURORA_BEAM
	db 35, SCALD
	db 40, ICE_BEAM
	db 45, BARRIER
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, CHARM
	db 1, COVET
	db 1, BATON_PASS
	db 1, HYPER_VOICE
	db 1, DOUBLE_EDGE
	db 1, THUNDERSHOCK
	db 1, POUND
	db 1, LEER
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 15, SNARL
	db 20, ZAP_CANNON
	db 25, THUNDER_WAVE
	db 30, MUD_SLAP
	db 35, THUNDERBOLT
	db 40, SHADOW_BALL
	db 45, AGILITY
	db 50, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, CHARM
	db 1, COVET
	db 1, BATON_PASS
	db 1, HYPER_VOICE
	db 1, DOUBLE_EDGE
	db 1, EMBER
	db 1, POUND
	db 1, LEER
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 15, BITE
	db 20, FLAME_WHEEL
	db 25, WILL_O_WISP
	db 30, DOUBLE_KICK
	db 35, FIRE_SPIN
	db 40, PLAY_ROUGH
	db 45, BULK_UP
	db 50, FLARE_BLITZ
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_ITEM, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, FLASH
	db 1, DISABLE
	db 5, POWDER_SNOW
	db 10, HIDDEN_POWER
	db 15, PSYBEAM
	db 20, AURORA_BEAM
	db 25, RECOVER
	db 30, THUNDERBOLT
	db 35, ICE_BEAM
	db 40, AGILITY
	db 45, TRI_ATTACK
	db 50, PSYCH_UP
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 30, OMASTAR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, DEFENSE_CURL
	db 5, WATER_GUN
	db 12, RAIN_DANCE
	db 19, BUBBLEBEAM
	db 26, ANCIENTPOWER
	db 33, HAZE
	db 40, BARRIER
	db 47, POWER_GEM
	db 54, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, WRAP
	db 1, DEFENSE_CURL
	db 5, WATER_GUN
	db 12, RAIN_DANCE
	db 19, BUBBLEBEAM
	db 26, ANCIENTPOWER
	db 35, HAZE
	db 43, BARRIER
	db 51, POWER_GEM
	db 59, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 30, KABUTOPS
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 5, VICEGRIP
	db 12, ROCK_THROW
	db 19, GLARE
	db 26, ROCK_SLIDE
	db 33, AQUA_JET
	db 40, SWORDS_DANCE
	db 47, LEECH_LIFE
	db 54, HEAD_SMASH
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, CUT
	db 1, POUND
	db 1, LEER
	db 5, VICEGRIP
	db 12, ROCK_THROW
	db 19, GLARE
	db 26, ROCK_SLIDE
	db 35, AQUA_JET
	db 43, SWORDS_DANCE
	db 51, LEECH_LIFE
	db 59, HEAD_SMASH
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 5, SCARY_FACE
	db 10, BITE
	db 15, ROAR
	db 20, ROCK_SLIDE
	db 25, SUPER_FANG
	db 30, CRUNCH
	db 35, BODY_SLAM
	db 40, FLY
	db 45, DOUBLE_EDGE
	db 50, BRAVE_BIRD
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 8, DEFENSE_CURL
	db 15, TAIL_SWIPE
	db 22, BELLY_DRUM
	db 29, HEADBUTT
	db 36, SLEEP_TALK
	db 36, REST
	db 43, DRAGON_CLAW
	db 50, BODY_SLAM
	db 57, OUTRAGE
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ICE_BEAM
	db 1, CALM_MIND
	db 1, REFLECT
	db 1, AIR_SLASH
	db 51, ANCIENTPOWER
	db 54, HAIL
	db 57, HURRICANE
	db 60, BLIZZARD
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERBOLT
	db 1, AGILITY
	db 1, LIGHT_SCREEN
	db 1, DRILL_PECK
	db 51, ANCIENTPOWER
	db 54, RAIN_DANCE
	db 57, HURRICANE
	db 60, THUNDER
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAMETHROWER
	db 1, AGILITY
	db 1, PSYCH_UP
	db 1, AIR_SLASH
	db 51, ANCIENTPOWER
	db 54, SUNNY_DAY
	db 57, HURRICANE
	db 60, FIRE_BLAST
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 8, TWISTER
	db 15, AQUA_JET
	db 22, TAIL_SWIPE
	db 29, AGILITY
	db 36, DRAGON_CLAW
	db 43, DRAGON_DANCE
	db 50, OUTRAGE
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 8, TWISTER
	db 15, AQUA_JET
	db 22, TAIL_SWIPE
	db 29, AGILITY
	db 38, DRAGON_CLAW
	db 46, DRAGON_DANCE
	db 54, OUTRAGE
	db 62, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, EXTREMESPEED
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 8, TWISTER
	db 15, AQUA_JET
	db 22, TAIL_SWIPE
	db 29, AGILITY
	db 38, DRAGON_CLAW
	db 46, DRAGON_DANCE
	db 54, OUTRAGE
	db 60, HURRICANE
	db 67, HYPER_BEAM
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYCHIC_M
	db 1, AURA_SPHERE
	db 1, RECOVER
	db 1, CALM_MIND
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYCHIC_M
	db 1, TRANSFORM
	db 1, SUBSTITUTE
	db 1, DRAIN_PUNCH
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, RAZOR_LEAF
	db 10, GROWTH
	db 15, REFLECT
	db 20, TWISTER
	db 25, MEGA_DRAIN
	db 29, BODY_SLAM
	db 32, MORNING_SUN
	db 35, DRAGONBREATH
	db 39, HEAL_BELL
	db 42, LEAF_STORM
	db 46, SLEEP_POWDER
	db 50, DRACO_METEOR
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 36, MEGANIUM
	db 0 ; no more evolutions
	db 1, TAIL_SWIPE
	db 1, POUND
	db 4, GROWL
	db 7, RAZOR_LEAF
	db 10, GROWTH
	db 15, REFLECT
	db 22, TWISTER
	db 27, MEGA_DRAIN
	db 32, BODY_SLAM
	db 35, MORNING_SUN
	db 39, DRAGONBREATH
	db 43, HEAL_BELL
	db 47, LEAF_STORM
	db 51, SLEEP_POWDER
	db 56, DRACO_METEOR
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 1, GIGA_DRAIN
	db 1, TAIL_SWIPE
	db 1, POUND
	db 4, GROWL
	db 7, RAZOR_LEAF
	db 10, GROWTH
	db 15, REFLECT
	db 22, TWISTER
	db 27, MEGA_DRAIN
	db 32, BODY_SLAM
	db 35, MORNING_SUN
	db 41, DRAGONBREATH
	db 46, HEAL_BELL
	db 51, LEAF_STORM
	db 56, SLEEP_POWDER
	db 62, DRACO_METEOR
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 16, QUILAVA
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, EMBER
	db 10, SAND_TOMB
	db 15, DEFENSE_CURL
	db 20, FLAME_BURST
	db 25, SWIFT
	db 29, ROLLOUT
	db 32, SWAGGER
	db 35, FLAMETHROWER
	db 39, PSYCHIC_M
	db 42, WILL_O_WISP
	db 46, EARTH_POWER
	db 50, OVERHEAT
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, EMBER
	db 10, SAND_TOMB
	db 15, DEFENSE_CURL
	db 22, FLAME_BURST
	db 27, SWIFT
	db 32, ROLLOUT
	db 35, SWAGGER
	db 39, FLAMETHROWER
	db 43, PSYCHIC_M
	db 47, WILL_O_WISP
	db 51, EARTH_POWER
	db 56, OVERHEAT
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCORCHD_SAND
	db 1, POUND
	db 4, GROWL
	db 7, EMBER
	db 10, SAND_TOMB
	db 15, DEFENSE_CURL
	db 22, FLAME_BURST
	db 27, SWIFT
	db 32, ROLLOUT
	db 35, SWAGGER
	db 41, FLAMETHROWER
	db 46, PSYCHIC_M
	db 51, WILL_O_WISP
	db 56, EARTH_POWER
	db 62, OVERHEAT
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 16, CROCONAW
	db 0 ; no more evolutions
	db 1, POUND
	db 4, LEER
	db 7, WATER_GUN
	db 10, BITE
	db 15, SCARY_FACE
	db 20, AQUA_JET
	db 25, METAL_CLAW
	db 29, CRUNCH
	db 32, AQUA_CUTTER
	db 35, SCREECH
	db 39, SLASH
	db 42, DRAGON_DANCE
	db 46, THRASH
	db 50, WAVE_CRASH
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 36, FERALIGATR
	db 0 ; no more evolutions
	db 1, POUND
	db 4, LEER
	db 7, WATER_GUN
	db 10, BITE
	db 15, SCARY_FACE
	db 22, AQUA_JET
	db 27, METAL_CLAW
	db 32, CRUNCH
	db 35, AQUA_CUTTER
	db 39, SCREECH
	db 43, SLASH
	db 47, DRAGON_DANCE
	db 51, THRASH
	db 56, WAVE_CRASH
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SLASH
	db 1, POUND
	db 4, LEER
	db 7, WATER_GUN
	db 10, BITE
	db 15, SCARY_FACE
	db 22, AQUA_JET
	db 27, METAL_CLAW
	db 32, CRUNCH
	db 35, AQUA_CUTTER
	db 41, SCREECH
	db 46, SLASH
	db 51, DRAGON_DANCE
	db 56, THRASH
	db 62, WAVE_CRASH
	db 0 ; no more level-up moves

SentretEvosAttacks:
	db EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 1, MEDITATE
	db 7, QUICK_ATTACK
	db 12, FAINT_ATTACK
	db 17, BATON_PASS
	db 22, DIG
	db 25, BODY_SLAM
	db 29, SPIKES
	db 33, REST
	db 37, AMNESIA
	db 41, REVERSAL
	db 45, DOUBLE_EDGE
	db 50, BELLY_DRUM
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, AGILITY
	db 1, POUND
	db 1, DEFENSE_CURL
	db 1, MEDITATE
	db 7, QUICK_ATTACK
	db 12, FAINT_ATTACK
	db 19, BATON_PASS
	db 24, DIG
	db 28, BODY_SLAM
	db 32, SPIKES
	db 37, REST
	db 41, AMNESIA
	db 46, REVERSAL
	db 50, DOUBLE_EDGE
	db 56, BELLY_DRUM
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 6, FORESIGHT
	db 11, CONFUSION
	db 16, HYPNOSIS
	db 21, AIR_CUTTER
	db 26, REFLECT
	db 31, DREAM_EATER
	db 36, MOONBLAST
	db 41, PSYCH_UP
	db 46, HURRICANE
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, OMINOUS_WIND
	db 1, PECK
	db 1, GROWL
	db 6, FORESIGHT
	db 11, CONFUSION
	db 16, HYPNOSIS
	db 23, AIR_CUTTER
	db 28, REFLECT
	db 34, DREAM_EATER
	db 39, MOONBLAST
	db 45, PSYCH_UP
	db 50, HURRICANE
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 22, LEDIAN
	db 0 ; no more evolutions
	db 1, POUND
	db 1, MACH_PUNCH
	db 8, CONFUSE_RAY
	db 12, LIGHT_SCREEN
	db 12, REFLECT
	db 15, THUNDERSHOCK
	db 20, STRUGGLE_BUG
	db 25, BATON_PASS
	db 29, SUBSTITUTE
	db 36, BUG_BUZZ
	db 43, AGILITY
	db 50, THUNDERBOLT
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYCH_UP
	db 1, POUND
	db 1, MACH_PUNCH
	db 8, CONFUSE_RAY
	db 12, LIGHT_SCREEN
	db 12, REFLECT
	db 15, THUNDERSHOCK
	db 20, STRUGGLE_BUG
	db 27, BATON_PASS
	db 32, SUBSTITUTE
	db 39, BUG_BUZZ
	db 47, AGILITY
	db 55, ZAP_CANNON
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, SCARY_FACE
	db 8, PURSUIT
	db 12, TOXIC
	db 12, MEAN_LOOK
	db 15, PIN_MISSILE
	db 20, SHADOW_SNEAK
	db 25, NIGHT_SLASH
	db 29, DISABLE
	db 36, LEECH_LIFE
	db 43, AGILITY
	db 50, MEGAHORN
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 1, SWORDS_DANCE
	db 1, POISON_STING
	db 1, SCARY_FACE
	db 8, PURSUIT
	db 12, TOXIC
	db 12, MEAN_LOOK
	db 15, PIN_MISSILE
	db 20, SHADOW_SNEAK
	db 27, NIGHT_SLASH
	db 32, DISABLE
	db 39, LEECH_LIFE
	db 47, AGILITY
	db 55, MEGAHORN
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, CUT
	db 1, SCREECH
	db 1, POISON_STING
	db 1, ABSORB
	db 6, CONFUSE_RAY
	db 12, BITE
	db 17, WING_ATTACK
	db 25, MEAN_LOOK
	db 30, POISON_TAIL
	db 37, HAZE
	db 42, TOXIC
	db 49, POISON_JAB
	db 56, BRAVE_BIRD
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, THUNDER_WAVE
	db 5, CONFUSE_RAY
	db 11, THUNDERSHOCK
	db 17, BUBBLEBEAM
	db 23, FLASH
	db 29, PSYBEAM
	db 35, THUNDERBOLT
	db 41, MIST
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, THUNDER_WAVE
	db 5, CONFUSE_RAY
	db 11, THUNDERSHOCK
	db 17, BUBBLEBEAM
	db 23, FLASH
	db 31, PSYBEAM
	db 38, THUNDERBOLT
	db 45, MIST
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

PichuEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 6, LEER
	db 8, ATTRACT
	db 11, QUICK_ATTACK
	db 15, FAIRY_WIND
	db 19, FLASH
	db 24, CHARM
	db 30, ENCORE
	db 36, THUNDERBOLT
	db 44, MOONBLAST
	db 50, THUNDER
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 4, ENCORE
	db 8, HYPNOSIS
	db 13, FAIRY_WIND
	db 18, DEFENSE_CURL
	db 24, DRAIN_KISS
	db 30, METRONOME
	db 36, MORNING_SUN
	db 42, MOONBLAST
	db 48, ENDURE
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	db 0 ; no more evolutions
	db 1, CHARM
	db 1, HYPNOSIS
	db 1, FAIRY_WIND
	db 4, DEFENSE_CURL
	db 9, POUND
	db 14, DISABLE
	db 19, ROLLOUT
	db 24, SWIFT
	db 29, COVET
	db 34, REST
	db 39, HYPER_VOICE
	db 44, DOUBLE_EDGE
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	db 1, FAIRY_WIND
	db 1, CHARM
	db 7, METRONOME
	db 12, CONFUSE_RAY
	db 17, ANCIENTPOWER
	db 22, ENCORE
	db 27, HYPNOSIS
	db 32, SAFEGUARD
	db 37, MOONBLAST
	db 42, CALM_MIND
	db 47, BATON_PASS
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_CUTTER
	db 1, FAIRY_WIND
	db 1, CHARM
	db 7, METRONOME
	db 12, CONFUSE_RAY
	db 17, ANCIENTPOWER
	db 22, ENCORE
	db 27, HYPNOSIS
	db 32, SAFEGUARD
	db 37, MOONBLAST
	db 42, CALM_MIND
	db 47, BATON_PASS
	db 52, SOFTBOILED
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 24, XATU
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 5, CONFUSION
	db 10, NIGHT_SHADE
	db 15, TELEPORT
	db 20, PSYBEAM
	db 25, CONFUSE_RAY
	db 30, CALM_MIND
	db 35, PSYCHIC_M
	db 40, MIRROR_COAT
	db 45, AEROBLAST
	db 50, FUTURE_SIGHT
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_SLASH
	db 1, PECK
	db 1, LEER
	db 5, CONFUSION
	db 10, NIGHT_SHADE
	db 15, TELEPORT
	db 20, PSYBEAM
	db 27, CONFUSE_RAY
	db 32, CALM_MIND
	db 38, PSYCHIC_M
	db 43, MIRROR_COAT
	db 49, AEROBLAST
	db 54, FUTURE_SIGHT
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 7, THUNDERSHOCK
	db 11, THUNDER_WAVE
	db 16, CONFUSE_RAY
	db 21, SCARY_FACE
	db 27, POWER_GEM
	db 33, THUNDERBOLT
	db 40, LIGHT_SCREEN
	db 47, BARRIER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 7, THUNDERSHOCK
	db 11, THUNDER_WAVE
	db 18, CONFUSE_RAY
	db 23, SCARY_FACE
	db 29, POWER_GEM
	db 36, THUNDERBOLT
	db 43, LIGHT_SCREEN
	db 50, BARRIER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, DRAGONBREATH
	db 1, POUND
	db 1, GROWL
	db 7, THUNDERSHOCK
	db 11, THUNDER_WAVE
	db 18, CONFUSE_RAY
	db 23, SCARY_FACE
	db 29, POWER_GEM
	db 39, THUNDERBOLT
	db 47, LIGHT_SCREEN
	db 55, BARRIER
	db 60, DRACO_METEOR
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, PLAY_ROUGH
	db 1, BULLET_SEED
	db 1, SWORDS_DANCE
	db 7, POUND
	db 12, STUN_SPORE
	db 14, COVET
	db 16, SLEEP_POWDER
	db 20, RAZOR_LEAF
	db 27, FRUSTRATION
	db 31, MORNING_SUN
	db 37, SEED_BOMB
	db 44, LEECH_SEED
	db 50, WOOD_HAMMER
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 5, CHARM
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 20, BUBBLEBEAM
	db 25, COVET
	db 30, RAIN_DANCE
	db 35, WHIRLPOOL
	db 40, PERISH_SONG
	db 45, MOONBLAST
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 5, CHARM
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 22, BUBBLEBEAM
	db 27, COVET
	db 33, RAIN_DANCE
	db 38, WHIRLPOOL
	db 44, PERISH_SONG
	db 49, MOONBLAST
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, LEER
	db 1, VINE_WHIP
	db 1, LOW_KICK
	db 21, RAZOR_LEAF
	db 28, ROCK_SLIDE
	db 35, SEED_BOMB
	db 42, COUNTER
	db 49, WOOD_HAMMER
	db 56, HEAD_SMASH
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPER_VOICE
	db 1, WATER_GUN
	db 1, POUND
	db 7, HYPNOSIS
	db 12, SWIFT
	db 17, BUBBLEBEAM
	db 23, RAIN_DANCE
	db 30, BODY_SLAM
	db 35, HAZE
	db 40, CALM_MIND
	db 47, PERISH_SONG
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, MORNING_SUN
	db 1, ENCORE
	db 7, GUST
	db 12, POISONPOWDER
	db 12, STUN_SPORE
	db 17, SLEEP_POWDER
	db 19, MEGA_DRAIN
	db 20, LEECH_SEED
	db 25, AIR_CUTTER
	db 30, GIGA_DRAIN
	db 35, GROWTH
	db 40, AIR_SLASH
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, MORNING_SUN
	db 1, ENCORE
	db 7, GUST
	db 12, POISONPOWDER
	db 12, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 22, LEECH_SEED
	db 28, AIR_CUTTER
	db 34, GIGA_DRAIN
	db 40, GROWTH
	db 46, AIR_SLASH
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, MORNING_SUN
	db 1, ENCORE
	db 7, GUST
	db 12, POISONPOWDER
	db 12, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, MEGA_DRAIN
	db 22, LEECH_SEED
	db 30, AIR_CUTTER
	db 37, GIGA_DRAIN
	db 44, GROWTH
	db 51, AIR_SLASH
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 6, VINE_WHIP
	db 12, BATON_PASS
	db 18, RAZOR_LEAF
	db 24, SWORDS_DANCE
	db 30, PSYCH_UP
	db 36, AGILITY
	db 42, SEED_BOMB
	db 48, BODY_SLAM
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 1, LEECH_SEED
	db 10, MEGA_DRAIN
	db 15, SUNNY_DAY
	db 20, MORNING_SUN
	db 25, GIGA_DRAIN
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAME_BURST
	db 1, ABSORB
	db 1, GROWTH
	db 1, LEECH_SEED
	db 10, MEGA_DRAIN
	db 15, SUNNY_DAY
	db 20, MORNING_SUN
	db 25, GIGA_DRAIN
	db 30, FLAMETHROWER
	db 35, HEAL_BELL
	db 40, OVERHEAT
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, STRUGGLE_BUG
	db 7, QUICK_ATTACK
	db 12, SONICBOOM
	db 17, TWISTER
	db 22, DOUBLE_TEAM
	db 27, AIR_CUTTER
	db 32, SIGNAL_BEAM
	db 37, DRAGONBREATH
	db 42, ANCIENTPOWER
	db 47, AIR_SLASH
	db 52, BUG_BUZZ
	db 57, DRACO_METEOR
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER
	db 4, RAIN_DANCE
	db 8, MUD_SLAP
	db 12, HAZE
	db 12, MIST
	db 16, BUBBLEBEAM
	db 21, BODY_SLAM
	db 24, RECOVER
	db 28, AMNESIA
	db 32, WATERFALL
	db 36, TOXIC
	db 40, EARTHQUAKE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, WATER_GUN
	db 1, LEER
	db 4, RAIN_DANCE
	db 8, MUD_SLAP
	db 12, HAZE
	db 12, MIST
	db 16, BUBBLEBEAM
	db 23, BODY_SLAM
	db 28, RECOVER
	db 34, AMNESIA
	db 40, WATERFALL
	db 46, TOXIC
	db 52, EARTHQUAKE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, CHARM
	db 1, COVET
	db 1, BATON_PASS
	db 1, HYPER_VOICE
	db 1, DOUBLE_EDGE
	db 1, CONFUSION
	db 1, POUND
	db 1, LEER
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 15, SNARL
	db 20, PSYBEAM
	db 25, HYPNOSIS
	db 30, DRAIN_KISS
	db 35, PSYCHIC_M
	db 40, POWER_GEM
	db 45, CALM_MIND
	db 50, FUTURE_SIGHT
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, CHARM
	db 1, COVET
	db 1, BATON_PASS
	db 1, HYPER_VOICE
	db 1, DOUBLE_EDGE
	db 1, SNARL
	db 1, POUND
	db 1, LEER
	db 5, GROWL
	db 10, QUICK_ATTACK
	db 15, NIGHTMARE
	db 20, TOXIC
	db 25, CONFUSE_RAY
	db 30, FRUSTRATION
	db 35, DARK_PULSE
	db 40, MORNING_SUN
	db 45, CALM_MIND
	db 50, HEAL_BELL
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, CHARM
	db 5, PURSUIT
	db 11, COVET
	db 16, HAZE
	db 21, FAINT_ATTACK
	db 26, NIGHT_SHADE
	db 31, DISABLE
	db 36, PERISH_SONG
	db 41, MEAN_LOOK
	db 46, FRUSTRATION
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 1, CURSE
	db 1, POUND
	db 1, GROWL
	db 8, CONFUSION
	db 12, BUBBLEBEAM
	db 16, DISABLE
	db 20, HEADBUTT
	db 26, PSYBEAM
	db 31, SCALD
	db 35, SLUDGE_BOMB
	db 38, FUTURE_SIGHT
	db 46, RECOVER
	db 52, PSYCHIC_M
	db 60, AMNESIA
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, POWDER_SNOW
	db 1, SPITE
	db 15, CONFUSE_RAY
	db 20, OMINOUS_WIND
	db 25, AURORA_BEAM
	db 30, DRAIN_KISS
	db 35, PAIN_SPLIT
	db 40, WILL_O_WISP
	db 45, HAIL
	db 50, DESTINY_BOND
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, HIDDEN_POWER
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SHADE
	db 1, SCARY_FACE
	db 6, CURSE
	db 12, SHADOW_SNEAK
	db 18, WILL_O_WISP
	db 24, SWEET_SCENT
	db 30, OMINOUS_WIND
	db 36, MEAN_LOOK
	db 42, SLUDGE_BOMB
	db 48, SHADOW_BALL
	db 54, DESTINY_BOND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CONFUSION
	db 1, STOMP
	db 5, PURSUIT
	db 10, DOUBLE_KICK
	db 15, SNARL
	db 20, AGILITY
	db 25, PSYBEAM
	db 30, BATON_PASS
	db 35, DARK_PULSE
	db 40, PSYCHIC_M
	db 45, HYPER_VOICE
	db 50, PSYCH_UP
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, POUND
	db 1, PROTECT
	db 8, CURSE
	db 15, SHADOW_SNEAK
	db 22, RAPID_SPIN
	db 29, NIGHT_SHADE
	db 36, EXPLOSION
	db 43, SPIKES
	db 50, POLTERGEIST
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLASH_CANNON
	db 1, POUND
	db 1, PROTECT
	db 8, CURSE
	db 15, SHADOW_SNEAK
	db 22, RAPID_SPIN
	db 29, NIGHT_SHADE
	db 38, EXPLOSION
	db 46, SPIKES
	db 54, POLTERGEIST
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL
	db 1, REVERSAL
	db 8, SPITE
	db 13, GLARE
	db 18, ROLLOUT
	db 23, TAIL_SWIPE
	db 28, SCREECH
	db 33, BODY_SLAM
	db 38, ENDURE
	db 43, RECOVER
	db 48, OUTRAGE
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, DEFENSE_CURL
	db 6, MUD_SLAP
	db 12, WING_ATTACK
	db 18, BULLDOZE
	db 24, FAINT_ATTACK
	db 30, SLASH
	db 36, SWORDS_DANCE
	db 42, FLY
	db 48, EARTHQUAKE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SCREECH
	db 1, DEFENSE_CURL
	db 6, METAL_CLAW
	db 12, WRAP
	db 19, BITE
	db 25, CURSE
	db 29, IRON_TAIL
	db 34, GLARE
	db 40, CRUNCH
	db 45, SANDSTORM
	db 50, THRASH
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SCARY_FACE
	db 1, LEER
	db 1, CHARM
	db 7, BITE
	db 13, COVET
	db 19, MAGNITUDE
	db 25, ROAR
	db 31, CRUNCH
	db 37, EARTHQUAKE
	db 43, PLAY_ROUGH
	db 49, HEADLONGRUSH
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SCARY_FACE
	db 1, LEER
	db 1, CHARM
	db 7, BITE
	db 13, COVET
	db 19, MAGNITUDE
	db 27, ROAR
	db 34, CRUNCH
	db 41, EARTHQUAKE
	db 48, PLAY_ROUGH
	db 55, HEADLONGRUSH
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, POUND
	db 1, POISON_STING
	db 5, DEFENSE_CURL
	db 10, POISON_TAIL
	db 20, SPIKE_CANNON
	db 25, PIN_MISSILE
	db 30, TOXIC
	db 35, IRON_TAIL
	db 40, DESTINY_BOND
	db 45, GUNK_SHOT
	db 50, PAIN_SPLIT
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, BULLET_PUNCH
	db 1, LEER
	db 6, FURY_CUTTER
	db 12, PURSUIT
	db 18, DOUBLE_TEAM
	db 24, AGILITY
	db 30, SLASH
	db 36, IRON_TAIL
	db 42, SWORDS_DANCE
	db 48, COUNTER
	db 54, BATON_PASS
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, DEFENSE_CURL
	db 4, STRUGGLE_BUG
	db 9, SAFEGUARD
	db 14, ENCORE
	db 19, TOXIC
	db 24, ROLLOUT
	db 29, REST
	db 29, SLEEP_TALK
	db 34, ANCIENTPOWER
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 5, VICEGRIP
	db 10, LOW_KICK
	db 15, FURY_ATTACK
	db 20, PIN_MISSILE
	db 25, BODY_SLAM
	db 30, COUNTER
	db 35, REVERSAL
	db 40, VITAL_THROW
	db 45, SWORDS_DANCE
	db 50, MEGAHORN
	db 55, CLOSE_COMBAT
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 1, AGILITY
	db 6, ICE_SHARD
	db 12, FAINT_ATTACK
	db 18, METAL_CLAW
	db 24, SCREECH
	db 30, ICE_PUNCH
	db 36, NIGHT_SLASH
	db 42, ICICLE_CRASH
	db 48, BEAT_UP
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 40, URSARING
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 8, LICK
	db 13, BULLDOZE
	db 18, FAINT_ATTACK
	db 23, METAL_CLAW
	db 28, SLASH
	db 33, REST
	db 33, SNORE
	db 38, EARTHQUAKE
	db 43, THRASH
	db 48, PLAY_ROUGH
	db 53, HEADLONGRUSH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 8, LICK
	db 13, BULLDOZE
	db 18, FAINT_ATTACK
	db 23, METAL_CLAW
	db 28, SLASH
	db 33, REST
	db 33, SNORE
	db 38, EARTHQUAKE
	db 46, THRASH
	db 52, PLAY_ROUGH
	db 58, HEADLONGRUSH
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGCARGO
	db 0 ; no more evolutions
	db 1, ACID
	db 1, EMBER
	db 8, ROCK_THROW
	db 12, DEFENSE_CURL
	db 17, FLAME_BURST
	db 22, ANCIENTPOWER
	db 29, AMNESIA
	db 36, FLAMETHROWER
	db 43, RECOVER
	db 50, EARTH_POWER
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, POWER_GEM
	db 1, ACID
	db 1, EMBER
	db 8, ROCK_THROW
	db 12, DEFENSE_CURL
	db 17, FLAME_BURST
	db 22, ANCIENTPOWER
	db 29, AMNESIA
	db 39, FLAMETHROWER
	db 47, RECOVER
	db 55, EARTH_POWER
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, POWDER_SNOW
	db 5, MUD_SLAP
	db 10, REVERSAL
	db 15, ICE_SHARD
	db 20, MIST
	db 25, MAGNITUDE
	db 30, ICICLE_CRASH
	db 35, AMNESIA
	db 40, BODY_SLAM
	db 45, EARTHQUAKE
	db 50, ICE_HAMMER
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, POUND
	db 1, POWDER_SNOW
	db 5, MUD_SLAP
	db 10, REVERSAL
	db 15, ICE_SHARD
	db 20, MIST
	db 25, MAGNITUDE
	db 30, ICICLE_CRASH
	db 37, AMNESIA
	db 43, BODY_SLAM
	db 49, EARTHQUAKE
	db 55, ICE_HAMMER
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 5, DISABLE
	db 10, CURSE
	db 15, NIGHT_SHADE
	db 20, RECOVER
	db 25, ANCIENTPOWER
	db 30, WILL_O_WISP
	db 35, SPIKES
	db 40, POWER_GEM
	db 45, SHADOW_BALL
	db 50, MIRROR_COAT
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, FOCUS_ENERGY
	db 11, BULLET_SEED
	db 22, PSYBEAM
	db 22, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 33, FLAMETHROWER
	db 44, ICE_BEAM
	db 55, HYDRO_PUMP
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 1, FLAME_BURST
	db 1, WATER_GUN
	db 1, FOCUS_ENERGY
	db 11, BULLET_SEED
	db 22, PSYBEAM
	db 22, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 33, FLAMETHROWER
	db 33, ICE_BEAM
	db 44, ROCK_BLAST
	db 44, SPIKE_CANNON
	db 55, HYDRO_PUMP
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, PRESENT
	db 1, POWDER_SNOW
	db 1, FAIRY_WIND
	db 7, HAIL
	db 14, AURORA_BEAM
	db 21, RAPID_SPIN
	db 28, DRILL_PECK
	db 35, MOONBLAST
	db 42, ICE_BEAM
	db 49, AGILITY
	db 56, BLIZZARD
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, ACID
	db 5, CONFUSE_RAY
	db 10, THUNDER_WAVE
	db 15, FLASH
	db 20, SLUDGE
	db 25, AIR_SLASH
	db 30, AGILITY
	db 35, THUNDERBOLT
	db 40, SLUDGE_BOMB
	db 45, TOXIC
	db 50, RECOVER
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 5, METAL_CLAW
	db 10, AGILITY
	db 15, FURY_ATTACK
	db 20, WING_ATTACK
	db 25, SLASH
	db 30, STEEL_WING
	db 35, DRILL_PECK
	db 40, SPIKES
	db 45, BARRIER
	db 50, BRAVE_BIRD
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 7, ROAR
	db 13, BITE
	db 19, FLAME_BURST
	db 25, SNARL
	db 31, FLAMETHROWER
	db 37, PSYCH_UP
	db 43, DARK_PULSE
	db 49, OVERHEAT
	db 55, DESTINY_BOND
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 7, ROAR
	db 13, BITE
	db 19, FLAME_BURST
	db 27, SNARL
	db 33, FLAMETHROWER
	db 40, PSYCH_UP
	db 46, DARK_PULSE
	db 53, OVERHEAT
	db 59, DESTINY_BOND
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, OUTRAGE
	db 1, WATER_GUN
	db 1, LEER
	db 8, FOCUS_ENERGY
	db 15, BUBBLEBEAM
	db 22, TWISTER
	db 29, AGILITY
	db 39, SWEET_SCENT
	db 47, DRAGON_DANCE
	db 55, HYDRO_PUMP
	db 60, DRACO_METEOR
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 1, DEFENSE_CURL
	db 5, REVERSAL
	db 10, ROLLOUT
	db 15, BULLDOZE
	db 20, ICE_SHARD
	db 24, BODY_SLAM
	db 30, CHARM
	db 35, RAPID_SPIN
	db 40, PLAY_ROUGH
	db 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, PLAY_ROUGH
	db 1, DOUBLE_EDGE
	db 1, POUND
	db 1, GROWL
	db 1, DEFENSE_CURL
	db 5, REVERSAL
	db 10, ROLLOUT
	db 15, BULLDOZE
	db 20, ICE_SHARD
	db 24, BODY_SLAM
	db 30, SCARY_FACE
	db 35, RAPID_SPIN
	db 40, ROCK_SLIDE
	db 45, EARTHQUAKE
	db 50, CLOSE_COMBAT
	db 55, HEADLONGRUSH
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	db 1, ZAP_CANNON
	db 1, FLASH
	db 1, DISABLE
	db 5, POWDER_SNOW
	db 10, HIDDEN_POWER
	db 15, PSYBEAM
	db 20, AURORA_BEAM
	db 25, RECOVER
	db 30, THUNDERBOLT
	db 35, ICE_BEAM
	db 40, AGILITY
	db 45, TRI_ATTACK
	db 50, PSYCH_UP
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 5, CONFUSE_RAY
	db 10, CONFUSION
	db 15, HYPNOSIS
	db 20, STOMP
	db 25, PSY_ANTLERS
	db 30, BODY_SLAM
	db 35, DOUBLE_TEAM
	db 40, HI_JUMP_KICK
	db 45, DOUBLE_EDGE
	db 50, MEGAHORN
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SHADE
	db 1, CONFUSE_RAY
	db 5, SPITE
	db 10, DISABLE
	db 15, CHARM
	db 15, DOUBLE_TEAM
	db 15, SCREECH
	db 15, NIGHTMARE
	db 15, SCARY_FACE
	db 20, THUNDER_WAVE
	db 20, ENCORE
	db 25, CURSE
	db 25, MEAN_LOOK
	db 30, HAZE
	db 30, REFLECT
	db 30, LIGHT_SCREEN
	db 35, SUBSTITUTE
	db 40, ROAR
	db 40, SPIKES
	db 45, RECOVER
	db 50, BATON_PASS
	db 55, METRONOME
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	db EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, POUND
	db 1, FOCUS_ENERGY
	db 1, FORESIGHT
	db 1, MACH_PUNCH
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, LOW_KICK	
	db 1, POUND
	db 1, FOCUS_ENERGY
	db 1, FORESIGHT
	db 1, MACH_PUNCH	
	db 21, PURSUIT
	db 25, BULK_UP
	db 29, RAPID_SPIN
	db 33, TRIPLE_KICK
	db 37, AGILITY
	db 43, CRUNCH
	db 49, CLOSE_COMBAT
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	db EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 7, CONFUSION
	db 12, POWDER_SNOW
	db 17, CONFUSE_RAY
	db 22, AURORA_BEAM
	db 27, PSYBEAM
	db 32, HYPNOSIS
	db 37, PSYCHIC_M
	db 42, ICE_BEAM
	db 47, PERISH_SONG
	db 52, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 7, THUNDERSHOCK
	db 12, THUNDER_WAVE
	db 17, SPARK
	db 22, LOW_KICK
	db 27, BULK_UP
	db 32, THUNDERPUNCH
	db 37, DRAIN_PUNCH
	db 42, LIGHT_SCREEN
	db 47, WILD_CHARGE
	db 52, CLOSE_COMBAT
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 7, EMBER
	db 12, WILL_O_WISP
	db 17, SWEET_SCENT
	db 22, FLAME_BURST
	db 27, CALM_MIND
	db 32, SLUDGE
	db 37, FLAMETHROWER
	db 42, REFLECT
	db 47, SLUDGE_BOMB
	db 52, OVERHEAT
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 5, DEFENSE_CURL
	db 10, ROLLOUT
	db 15, STOMP
	db 20, MILK_DRINK
	db 25, HEAL_BELL
	db 30, PSY_ANTLERS
	db 35, CHARM
	db 40, BODY_SLAM
	db 45, PLAY_ROUGH
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 5, GROWL
	db 9, LEER
	db 13, SOFTBOILED
	db 17, METRONOME
	db 23, DEFENSE_CURL
	db 29, HYPNOSIS
	db 35, BODY_SLAM
	db 41, DEFENSE_CURL
	db 49, LIGHT_SCREEN
	db 57, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, SNARL
	db 1, ZAP_CANNON
	db 1, REFLECT
	db 1, CALM_MIND
	db 41, AURA_SPHERE
	db 51, THUNDERBOLT
	db 61, SHADOW_BALL
	db 71, THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, STOMP
	db 1, FLAME_WHEEL
	db 1, CRUNCH
	db 1, BULK_UP
	db 41, EXTREMESPEED
	db 51, SACRED_FIRE
	db 61, POLTERGEIST
	db 71, FLARE_BLITZ
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, AURORA_BEAM
	db 1, BUBBLEBEAM
	db 1, MIST
	db 1, CALM_MIND
	db 41, SCALD
	db 51, ICE_BEAM
	db 61, MIRROR_COAT
	db 71, HYDRO_PUMP
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 5, ROCK_THROW
	db 10, BITE
	db 15, SCARY_FACE
	db 20, ROCK_SLIDE
	db 25, SCREECH
	db 30, BULLDOZE
	db 35, SANDSTORM
	db 40, THRASH
	db 45, EARTHQUAKE
	db 50, DRAGON_DANCE
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL
	db 1, POUND
	db 1, LEER
	db 5, ROCK_THROW
	db 10, BITE
	db 15, SCARY_FACE
	db 20, ROCK_SLIDE
	db 25, SCREECH
	db 32, BULLDOZE
	db 38, SANDSTORM
	db 44, THRASH
	db 50, EARTHQUAKE
	db 56, DRAGON_DANCE
	db 61, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, CRUNCH
	db 1, DEFENSE_CURL
	db 1, POUND
	db 1, LEER
	db 5, ROCK_THROW
	db 10, BITE
	db 15, SCARY_FACE
	db 20, ROCK_SLIDE
	db 25, SCREECH
	db 32, BULLDOZE
	db 38, SANDSTORM
	db 44, THRASH
	db 50, EARTHQUAKE
	db 60, DRAGON_DANCE
	db 65, HYPER_BEAM
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, AEROBLAST
	db 1, CALM_MIND
	db 1, PSYCHIC_M
	db 1, RECOVER
	db 71, FUTURE_SIGHT
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, SACRED_FIRE
	db 1, WILL_O_WISP
	db 1, BRAVE_BIRD
	db 1, RECOVER
	db 71, FLARE_BLITZ
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, HEAL_BELL
	db 1, FUTURE_SIGHT
	db 1, SUBSTITUTE
	db 0 ; no more level-up moves
