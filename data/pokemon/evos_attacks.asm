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
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_ITEM, KINGS_ROCK, SLOWKING
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, POUND
	db 6, GROWL
	db 15, WATER_GUN
	db 20, CONFUSION
	db 29, DISABLE
	db 34, HEADBUTT
	db 43, AMNESIA
	db 48, PSYCHIC_M
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, POUND
	db 1, GROWL
	db 1, WATER_GUN
	db 6, GROWL
	db 15, WATER_GUN
	db 20, CONFUSION
	db 29, DISABLE
	db 34, HEADBUTT
	db 37, DEFENSE_CURL
	db 46, AMNESIA
	db 54, PSYCHIC_M
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, POUND
	db 6, THUNDERSHOCK
	db 11, CONFUSE_RAY
	db 16, SONICBOOM
	db 21, THUNDER_WAVE
	db 27, LOCK_ON
	db 33, SWIFT
	db 39, SCREECH
	db 45, ZAP_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, THUNDERSHOCK
	db 1, CONFUSE_RAY
	db 1, SONICBOOM
	db 6, THUNDERSHOCK
	db 11, CONFUSE_RAY
	db 16, SONICBOOM
	db 21, THUNDER_WAVE
	db 27, LOCK_ON
	db 35, TRI_ATTACK
	db 43, SCREECH
	db 53, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 7, GROWL
	db 13, LEER
	db 19, FURY_ATTACK
	db 25, SWORDS_DANCE
	db 31, AGILITY
	db 37, SLASH
	db 44, BULK_UP
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 9, PURSUIT
	db 13, FURY_ATTACK
	db 21, TRI_ATTACK
	db 25, POUND
	db 33, DRILL_PECK
	db 37, AGILITY
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, PURSUIT
	db 1, FURY_ATTACK
	db 9, PURSUIT
	db 13, FURY_ATTACK
	db 21, TRI_ATTACK
	db 25, POUND
	db 38, DRILL_PECK
	db 47, AGILITY
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 5, GROWL
	db 16, AURORA_BEAM
	db 21, REST
	db 32, BODY_SLAM
	db 37, ICE_BEAM
	db 48, SAFEGUARD
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, GROWL
	db 1, AURORA_BEAM
	db 5, GROWL
	db 16, AURORA_BEAM
	db 21, REST
	db 32, BODY_SLAM
	db 43, ICE_BEAM
	db 60, SAFEGUARD
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, POUND
	db 5, DEFENSE_CURL
	db 10, DISABLE
	db 16, SLUDGE
	db 23, DEFENSE_CURL
	db 31, SCREECH
	db 40, BARRIER
	db 50, SLUDGE_BOMB
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	; moves are not sorted by level
	db 1, TOXIC
	db 1, POUND
	db 1, DEFENSE_CURL
	db 33, DEFENSE_CURL
	db 37, DISABLE
	db 45, SLUDGE
	db 23, DEFENSE_CURL
	db 31, SCREECH
	db 45, BARRIER
	db 60, SLUDGE_BOMB
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 9, CONFUSE_RAY
	db 17, AURORA_BEAM
	db 25, PROTECT
	db 33, LEER
	db 41, WHIRLPOOL
	db 49, ICE_BEAM
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL
	db 1, CONFUSE_RAY
	db 1, AURORA_BEAM
	db 1, PROTECT
	db 33, SPIKES
	db 41, SPIKE_CANNON
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 8, SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 28, CONFUSE_RAY
	db 33, DREAM_EATER
	db 36, DESTINY_BOND
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_LEVEL, 38, GENGAR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, SPITE
	db 8, SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 31, CONFUSE_RAY
	db 39, DREAM_EATER
	db 48, DESTINY_BOND
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, SPITE
	db 8, SPITE
	db 13, MEAN_LOOK
	db 16, CURSE
	db 21, NIGHT_SHADE
	db 31, CONFUSE_RAY
	db 39, DREAM_EATER
	db 48, DESTINY_BOND
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SCREECH
	db 10, WRAP
	db 14, ROCK_THROW
	db 23, DEFENSE_CURL
	db 27, POUND
	db 36, SANDSTORM
	db 40, BODY_SLAM
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 10, DISABLE
	db 18, CONFUSION
	db 25, HEADBUTT
	db 31, TOXIC
	db 36, MEDITATE
	db 40, PSYCHIC_M
	db 43, PSYCH_UP
	db 45, FUTURE_SIGHT
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 1, DISABLE
	db 1, CONFUSION
	db 10, DISABLE
	db 18, CONFUSION
	db 25, HEADBUTT
	db 33, TOXIC
	db 40, MEDITATE
	db 49, PSYCHIC_M
	db 55, PSYCH_UP
	db 60, FUTURE_SIGHT
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 5, LEER
	db 12, VICEGRIP
	db 16, DEFENSE_CURL
	db 23, STOMP
	db 27, AQUA_JET
	db 34, PROTECT
	db 41, CRABHAMMER
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, LEER
	db 1, VICEGRIP
	db 5, LEER
	db 12, VICEGRIP
	db 16, DEFENSE_CURL
	db 23, STOMP
	db 27, AQUA_JET
	db 38, PROTECT
	db 49, CRABHAMMER
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, POUND
	db 9, SCREECH
	db 17, SONICBOOM
	db 23, RAZOR_LEAF
	db 29, ROLLOUT
	db 33, LIGHT_SCREEN
	db 37, SWIFT
	db 39, EXPLOSION
	db 41, MIRROR_COAT
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SCREECH
	db 1, SONICBOOM
	db 1, RAZOR_LEAF
	db 9, SCREECH
	db 17, SONICBOOM
	db 23, RAZOR_LEAF
	db 29, ROLLOUT
	db 34, LIGHT_SCREEN
	db 40, SWIFT
	db 44, EXPLOSION
	db 48, MIRROR_COAT
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, FURY_ATTACK
	db 1, HYPNOSIS
	db 7, REFLECT
	db 13, LEECH_SEED
	db 19, CONFUSION
	db 25, STUN_SPORE
	db 31, POISONPOWDER
	db 37, SLEEP_POWDER
	db 43, SOLARBEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, FURY_ATTACK
	db 1, HYPNOSIS
	db 1, CONFUSION
	db 19, STOMP
	db 31, BODY_SLAM
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, GROWL
	db 5, LEER
	db 9, BULLDOZE
	db 13, HEADBUTT
	db 17, LEER
	db 21, FOCUS_ENERGY
	db 25, BONEMERANG
	db 29, POUND
	db 33, BULK_UP
	db 37, THRASH
	db 41, DIG
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, LEER
	db 1, BULLDOZE
	db 1, HEADBUTT
	db 5, LEER
	db 9, BULLDOZE
	db 13, HEADBUTT
	db 17, LEER
	db 21, FOCUS_ENERGY
	db 25, BONEMERANG
	db 32, POUND
	db 39, BULK_UP
	db 46, THRASH
	db 53, DIG
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK
	db 6, MEDITATE
	db 11, ROCK_SMASH
	db 16, PURSUIT
	db 21, FOCUS_ENERGY
	db 26, HI_JUMP_KICK
	db 31, FORESIGHT
	db 36, FORESIGHT
	db 41, SWAGGER
	db 46, DETECT
	db 51, REVERSAL
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 7, AGILITY
	db 13, PURSUIT
	db 26, THUNDERPUNCH
	db 26, ICE_PUNCH
	db 26, FIRE_PUNCH
	db 32, MACH_PUNCH
	db 38, BODY_SLAM
	db 44, DETECT
	db 50, COUNTER
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 7, CONFUSE_RAY
	db 13, DEFENSE_CURL
	db 19, STOMP
	db 25, WRAP
	db 31, DISABLE
	db 37, BODY_SLAM
	db 43, SCREECH
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, POUND
	db 9, ACID
	db 17, FAIRY_WIND
	db 21, SLUDGE
	db 25, EMBER
	db 33, HAZE
	db 41, EXPLOSION
	db 45, DESTINY_BOND
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TOXIC
	db 1, POUND
	db 1, ACID
	db 1, FAIRY_WIND
	db 9, ACID
	db 17, FAIRY_WIND
	db 21, SLUDGE
	db 25, EMBER
	db 33, HAZE
	db 44, EXPLOSION
	db 51, DESTINY_BOND
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 13, STOMP
	db 19, FURY_ATTACK
	db 31, SCARY_FACE
	db 37, ROCK_SLIDE
	db 49, BODY_SLAM
	db 55, EARTHQUAKE
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 1, STOMP
	db 1, FURY_ATTACK
	db 13, STOMP
	db 19, FURY_ATTACK
	db 31, SCARY_FACE
	db 37, ROCK_SLIDE
	db 54, BODY_SLAM
	db 65, EARTHQUAKE
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, POUND
	db 5, GROWL
	db 9, LEER
	db 13, SOFTBOILED
	db 17, FURY_ATTACK
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
	db 4, SLEEP_POWDER
	db 10, ABSORB
	db 13, POISONPOWDER
	db 19, VINE_WHIP
	db 25, WRAP
	db 31, MEGA_DRAIN
	db 34, STUN_SPORE
	db 40, BODY_SLAM
	db 46, GROWTH
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 7, LEER
	db 13, BITE
	db 19, LEER
	db 25, BODY_SLAM
	db 31, POUND
	db 37, AGILITY
	db 43, DIZZY_PUNCH
	db 49, REVERSAL
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 8, EMBER
	db 15, LEER
	db 22, WATER_GUN
	db 29, TWISTER
	db 36, AGILITY
	db 43, HYDRO_PUMP
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_ITEM, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, EMBER
	db 1, LEER
	db 1, WATER_GUN
	db 8, EMBER
	db 15, LEER
	db 22, WATER_GUN
	db 29, TWISTER
	db 40, AGILITY
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 10, CONFUSE_RAY
	db 15, AQUA_JET
	db 24, REVERSAL
	db 29, FURY_ATTACK
	db 38, WATERFALL
	db 43, SWORDS_DANCE
	db 52, AGILITY
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 1, LEER
	db 10, CONFUSE_RAY
	db 15, AQUA_JET
	db 24, REVERSAL
	db 29, FURY_ATTACK
	db 41, WATERFALL
	db 49, SWORDS_DANCE
	db 61, AGILITY
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 7, WATER_GUN
	db 13, RAPID_SPIN
	db 19, RECOVER
	db 25, SWIFT
	db 31, BUBBLEBEAM
	db 37, DEFENSE_CURL
	db 43, LIGHT_SCREEN
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, RAPID_SPIN
	db 1, RECOVER
	db 1, BUBBLEBEAM
	db 37, CONFUSE_RAY
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 6, CONFUSION
	db 11, SUBSTITUTE
	db 16, MEDITATE
	db 21, FURY_ATTACK
	db 26, LIGHT_SCREEN
	db 26, REFLECT
	db 31, ENCORE
	db 36, PSYBEAM
	db 41, BATON_PASS
	db 46, SAFEGUARD
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, BULK_UP
	db 24, AGILITY
	db 30, WING_ATTACK
	db 36, SLASH
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 1, HYPNOSIS
	db 1, POWDER_SNOW
	db 9, HYPNOSIS
	db 13, POWDER_SNOW
	db 21, FURY_ATTACK
	db 25, ICE_PUNCH
	db 35, MEAN_LOOK
	db 41, BODY_SLAM
	db 51, PERISH_SONG
	db 57, BLIZZARD
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 1, THUNDERPUNCH
	db 9, THUNDERPUNCH
	db 17, LIGHT_SCREEN
	db 25, SWIFT
	db 36, SCREECH
	db 47, THUNDERBOLT
	db 58, THUNDER
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 1, ACID
	db 1, FIRE_PUNCH
	db 7, LEER
	db 13, ACID
	db 19, FIRE_PUNCH
	db 25, EMBER
	db 33, SUNNY_DAY
	db 41, FLAMETHROWER
	db 49, CONFUSE_RAY
	db 57, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, VICEGRIP
	db 7, FOCUS_ENERGY
	db 13, WRAP
	db 19, SEISMIC_TOSS
	db 25, DEFENSE_CURL
	db 31, BULLDOZE
	db 37, DRAIN_PUNCH
	db 43, SWORDS_DANCE
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 4, LEER
	db 8, POUND
	db 13, STOMP
	db 19, SCARY_FACE
	db 26, PURSUIT
	db 34, REST
	db 43, THRASH
	db 53, BODY_SLAM
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
	db 1, THRASH
	db 20, BITE
	db 25, DRAGON_CLAW
	db 30, LEER
	db 35, TWISTER
	db 40, HYDRO_PUMP
	db 45, RAIN_DANCE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, GROWL
	db 1, HYPNOSIS
	db 8, MIST
	db 15, BODY_SLAM
	db 22, CONFUSE_RAY
	db 29, PERISH_SONG
	db 36, ICE_BEAM
	db 43, RAIN_DANCE
	db 50, SAFEGUARD
	db 57, HYDRO_PUMP
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
	db 8, LEER
	db 16, GROWL
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, BATON_PASS
	db 42, BODY_SLAM
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 8, LEER
	db 16, WATER_GUN
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, AURORA_BEAM
	db 42, HAZE
	db 47, BARRIER
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 8, LEER
	db 16, THUNDERSHOCK
	db 23, QUICK_ATTACK
	db 30, DOUBLE_KICK
	db 36, PIN_MISSILE
	db 42, THUNDER_WAVE
	db 47, AGILITY
	db 52, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 8, LEER
	db 16, EMBER
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, FIRE_SPIN
	db 42, ACID
	db 47, LEER
	db 52, FLAMETHROWER
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_ITEM, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, FLASH
	db 1, POUND
	db 1, PSYCH_UP
	db 9, AGILITY
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, MEDITATE
	db 32, LOCK_ON
	db 36, TRI_ATTACK
	db 44, ZAP_CANNON
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, DEFENSE_CURL
	db 13, BITE
	db 19, WATER_GUN
	db 31, LEER
	db 37, PROTECT
	db 49, ANCIENTPOWER
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, DEFENSE_CURL
	db 1, BITE
	db 13, BITE
	db 19, WATER_GUN
	db 31, LEER
	db 37, PROTECT
	db 40, SPIKE_CANNON
	db 54, ANCIENTPOWER
	db 65, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 10, ABSORB
	db 19, LEER
	db 28, ROCK_THROW
	db 37, ENDURE
	db 46, MEGA_DRAIN
	db 55, ANCIENTPOWER
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 1, ABSORB
	db 10, ABSORB
	db 19, LEER
	db 28, ROCK_THROW
	db 37, ENDURE
	db 40, SLASH
	db 51, MEGA_DRAIN
	db 65, ANCIENTPOWER
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 8, AGILITY
	db 15, BITE
	db 22, CONFUSE_RAY
	db 29, ANCIENTPOWER
	db 36, SCARY_FACE
	db 43, BODY_SLAM
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 8, AMNESIA
	db 15, DEFENSE_CURL
	db 22, BELLY_DRUM
	db 29, HEADBUTT
	db 36, SNORE
	db 36, REST
	db 43, BODY_SLAM
	db 50, ROLLOUT
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, POWDER_SNOW
	db 13, MIST
	db 25, AGILITY
	db 37, FORESIGHT
	db 49, ICE_BEAM
	db 61, REFLECT
	db 73, BLIZZARD
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 25, AGILITY
	db 37, DETECT
	db 49, DRILL_PECK
	db 61, LIGHT_SCREEN
	db 73, THUNDER
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 1, EMBER
	db 13, FIRE_SPIN
	db 25, AGILITY
	db 37, ENDURE
	db 49, FLAMETHROWER
	db 61, SAFEGUARD
	db 73, HURRICANE
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_CLAW
	db 29, BODY_SLAM
	db 36, AGILITY
	db 43, SAFEGUARD
	db 50, OUTRAGE
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 1, TWISTER
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_CLAW
	db 29, BODY_SLAM
	db 38, AGILITY
	db 47, SAFEGUARD
	db 56, OUTRAGE
	db 65, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 1, TWISTER
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_CLAW
	db 29, BODY_SLAM
	db 38, AGILITY
	db 47, SAFEGUARD
	db 55, WING_ATTACK
	db 61, OUTRAGE
	db 75, HYPER_BEAM
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, DISABLE
	db 11, BARRIER
	db 22, SWIFT
	db 33, PSYCH_UP
	db 44, FUTURE_SIGHT
	db 55, MIST
	db 66, PSYCHIC_M
	db 77, AMNESIA
	db 88, RECOVER
	db 99, SAFEGUARD
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 10, TRANSFORM
	db 20, BODY_SLAM
	db 30, METRONOME
	db 40, PSYCHIC_M
	db 50, ANCIENTPOWER
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 15, POISONPOWDER
	db 22, MORNING_SUN
	db 29, BODY_SLAM
	db 36, LIGHT_SCREEN
	db 43, SAFEGUARD
	db 50, SOLARBEAM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 36, MEGANIUM
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 1, RAZOR_LEAF
	db 1, REFLECT
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 15, POISONPOWDER
	db 23, MORNING_SUN
	db 31, BODY_SLAM
	db 39, LIGHT_SCREEN
	db 47, SAFEGUARD
	db 55, SOLARBEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 1, RAZOR_LEAF
	db 1, REFLECT
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 15, POISONPOWDER
	db 23, MORNING_SUN
	db 31, BODY_SLAM
	db 41, LIGHT_SCREEN
	db 51, SAFEGUARD
	db 61, SOLARBEAM
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 16, QUILAVA
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 6, EMBER
	db 12, EMBER
	db 19, QUICK_ATTACK
	db 27, FLAME_WHEEL
	db 36, SWIFT
	db 46, FLAMETHROWER
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 1, EMBER
	db 6, EMBER
	db 12, EMBER
	db 21, QUICK_ATTACK
	db 31, FLAME_WHEEL
	db 42, SWIFT
	db 54, FLAMETHROWER
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 1, EMBER
	db 1, EMBER
	db 6, EMBER
	db 12, EMBER
	db 21, QUICK_ATTACK
	db 31, FLAME_WHEEL
	db 45, SWIFT
	db 60, FLAMETHROWER
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 16, CROCONAW
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 7, POUND
	db 13, WATER_GUN
	db 20, BITE
	db 27, SCARY_FACE
	db 35, SLASH
	db 43, SCREECH
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 36, FERALIGATR
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 1, POUND
	db 7, POUND
	db 13, WATER_GUN
	db 21, BITE
	db 28, SCARY_FACE
	db 37, SLASH
	db 45, SCREECH
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 1, POUND
	db 1, WATER_GUN
	db 7, POUND
	db 13, WATER_GUN
	db 21, BITE
	db 28, SCARY_FACE
	db 38, SLASH
	db 47, SCREECH
	db 58, HYDRO_PUMP
	db 0 ; no more level-up moves

SentretEvosAttacks:
	db EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	db 1, POUND
	db 5, DEFENSE_CURL
	db 11, QUICK_ATTACK
	db 17, FURY_ATTACK
	db 25, BODY_SLAM
	db 33, REST
	db 41, AMNESIA
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 1, QUICK_ATTACK
	db 5, DEFENSE_CURL
	db 11, QUICK_ATTACK
	db 18, FURY_ATTACK
	db 28, BODY_SLAM
	db 38, REST
	db 48, AMNESIA
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 6, FORESIGHT
	db 11, PECK
	db 16, HYPNOSIS
	db 22, REFLECT
	db 28, BODY_SLAM
	db 34, CONFUSION
	db 48, DREAM_EATER
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 1, FORESIGHT
	db 1, PECK
	db 6, FORESIGHT
	db 11, PECK
	db 16, HYPNOSIS
	db 25, REFLECT
	db 33, BODY_SLAM
	db 41, CONFUSION
	db 57, DREAM_EATER
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 18, LEDIAN
	db 0 ; no more evolutions
	db 1, POUND
	db 8, CONFUSE_RAY
	db 15, POUND
	db 22, LIGHT_SCREEN
	db 22, REFLECT
	db 22, SAFEGUARD
	db 29, BATON_PASS
	db 36, SWIFT
	db 43, AGILITY
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CONFUSE_RAY
	db 8, CONFUSE_RAY
	db 15, POUND
	db 24, LIGHT_SCREEN
	db 24, REFLECT
	db 24, SAFEGUARD
	db 33, BATON_PASS
	db 42, SWIFT
	db 51, AGILITY
	db 60, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 18, ARIADOS
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, SCARY_FACE
	db 6, SCARY_FACE
	db 11, WRAP
	db 17, NIGHT_SHADE
	db 23, LEECH_LIFE
	db 30, FURY_ATTACK
	db 37, MEAN_LOOK
	db 45, AGILITY
	db 53, PSYCHIC_M
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, SCARY_FACE
	db 1, SCARY_FACE
	db 1, WRAP
	db 6, SCARY_FACE
	db 11, WRAP
	db 17, NIGHT_SHADE
	db 25, LEECH_LIFE
	db 34, FURY_ATTACK
	db 43, MEAN_LOOK
	db 53, AGILITY
	db 63, PSYCHIC_M
	db 0 ; no more level-up moves

CrobatEvosAttacks:
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

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, THUNDER_WAVE
	db 5, CONFUSE_RAY
	db 13, REVERSAL
	db 17, WATER_GUN
	db 25, SPARK
	db 29, CONFUSE_RAY
	db 37, BODY_SLAM
	db 41, HYDRO_PUMP
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, THUNDER_WAVE
	db 1, CONFUSE_RAY
	db 5, CONFUSE_RAY
	db 13, REVERSAL
	db 17, WATER_GUN
	db 25, SPARK
	db 33, CONFUSE_RAY
	db 45, BODY_SLAM
	db 53, HYDRO_PUMP
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
	db 1, GROWL
	db 1, CHARM
	db 7, METRONOME
	db 18, CONFUSE_RAY
	db 25, ENCORE
	db 31, SAFEGUARD
	db 38, DOUBLE_EDGE
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM
	db 7, METRONOME
	db 18, CONFUSE_RAY
	db 25, ENCORE
	db 31, SAFEGUARD
	db 38, DOUBLE_EDGE
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 10, NIGHT_SHADE
	db 20, TELEPORT
	db 30, FUTURE_SIGHT
	db 40, CONFUSE_RAY
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 1, NIGHT_SHADE
	db 10, NIGHT_SHADE
	db 20, TELEPORT
	db 35, FUTURE_SIGHT
	db 50, CONFUSE_RAY
	db 65, PSYCHIC_M
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 9, THUNDERSHOCK
	db 16, THUNDER_WAVE
	db 23, SCARY_FACE
	db 30, LIGHT_SCREEN
	db 37, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 9, THUNDERSHOCK
	db 18, THUNDER_WAVE
	db 27, SCARY_FACE
	db 36, LIGHT_SCREEN
	db 45, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 1, THUNDER_WAVE
	db 9, THUNDERSHOCK
	db 18, THUNDER_WAVE
	db 27, SCARY_FACE
	db 30, THUNDERPUNCH
	db 42, LIGHT_SCREEN
	db 57, THUNDER
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
	db 3, DEFENSE_CURL
	db 6, LEER
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 21, BUBBLEBEAM
	db 28, DOUBLE_EDGE
	db 36, RAIN_DANCE
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DEFENSE_CURL
	db 1, LEER
	db 1, WATER_GUN
	db 3, DEFENSE_CURL
	db 6, LEER
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 25, BUBBLEBEAM
	db 36, DOUBLE_EDGE
	db 48, RAIN_DANCE
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, LEER
	db 10, REVERSAL
	db 19, LOW_KICK
	db 28, ROCK_SLIDE
	db 37, FAINT_ATTACK
	db 46, BODY_SLAM
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
	db 5, MORNING_SUN
	db 5, LEER
	db 10, POUND
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, LEECH_SEED
	db 25, SCARY_FACE
	db 30, MEGA_DRAIN
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, MORNING_SUN
	db 1, LEER
	db 1, POUND
	db 5, MORNING_SUN
	db 5, LEER
	db 10, POUND
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 22, LEECH_SEED
	db 29, SCARY_FACE
	db 36, MEGA_DRAIN
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, MORNING_SUN
	db 1, LEER
	db 1, POUND
	db 5, MORNING_SUN
	db 5, LEER
	db 10, POUND
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 22, LEECH_SEED
	db 33, SCARY_FACE
	db 44, MEGA_DRAIN
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 6, LEER
	db 12, BATON_PASS
	db 19, FURY_ATTACK
	db 27, SWIFT
	db 36, SCREECH
	db 46, AGILITY
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 4, GROWTH
	db 10, MEGA_DRAIN
	db 19, SUNNY_DAY
	db 31, MORNING_SUN
	db 46, GIGA_DRAIN
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, POUND
	db 4, GROWTH
	db 10, RAZOR_LEAF
	db 19, SUNNY_DAY
	db 31, PETAL_DANCE
	db 46, SOLARBEAM
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, FORESIGHT
	db 7, QUICK_ATTACK
	db 13, DOUBLE_TEAM
	db 19, SONICBOOM
	db 25, DETECT
	db 31, CONFUSE_RAY
	db 37, WING_ATTACK
	db 43, SCREECH
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER
	db 11, BODY_SLAM
	db 21, AMNESIA
	db 31, EARTHQUAKE
	db 41, RAIN_DANCE
	db 51, MIST
	db 51, HAZE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, LEER
	db 11, BODY_SLAM
	db 23, AMNESIA
	db 35, EARTHQUAKE
	db 47, RAIN_DANCE
	db 59, MIST
	db 59, HAZE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 8, LEER
	db 16, CONFUSION
	db 23, QUICK_ATTACK
	db 30, SWIFT
	db 36, PSYBEAM
	db 42, PSYCH_UP
	db 47, PSYCHIC_M
	db 52, MORNING_SUN
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 8, LEER
	db 16, PURSUIT
	db 23, QUICK_ATTACK
	db 30, CONFUSE_RAY
	db 36, FAINT_ATTACK
	db 42, MEAN_LOOK
	db 47, SCREECH
	db 52, MORNING_SUN
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 11, PURSUIT
	db 16, HAZE
	db 26, NIGHT_SHADE
	db 31, FAINT_ATTACK
	db 41, MEAN_LOOK
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, POUND
	db 6, GROWL
	db 15, WATER_GUN
	db 20, CONFUSION
	db 29, DISABLE
	db 34, HEADBUTT
	db 43, SWAGGER
	db 48, PSYCHIC_M
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CONFUSION
	db 6, SPITE
	db 12, CONFUSE_RAY
	db 19, MEAN_LOOK
	db 27, PSYBEAM
	db 36, PAIN_SPLIT
	db 46, PERISH_SONG
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, HIDDEN_POWER
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	db 1, COUNTER
	db 1, MIRROR_COAT
	db 1, SAFEGUARD
	db 1, DESTINY_BOND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 1, CONFUSION
	db 1, STOMP
	db 7, CONFUSION
	db 13, STOMP
	db 20, AGILITY
	db 30, BATON_PASS
	db 41, PSYBEAM
	db 54, CRUNCH
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, POUND
	db 1, PROTECT
	db 8, CURSE
	db 15, BODY_SLAM
	db 22, RAPID_SPIN
	db 29, NIGHT_SHADE
	db 36, EXPLOSION
	db 43, SPIKES
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, PROTECT
	db 1, CURSE
	db 8, CURSE
	db 15, BODY_SLAM
	db 22, RAPID_SPIN
	db 29, NIGHT_SHADE
	db 39, EXPLOSION
	db 49, SPIKES
	db 59, DOUBLE_EDGE
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 5, DEFENSE_CURL
	db 13, GLARE
	db 18, SPITE
	db 26, PURSUIT
	db 30, SCREECH
	db 38, BODY_SLAM
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 6, MUD_SLAP
	db 13, DEFENSE_CURL
	db 20, QUICK_ATTACK
	db 28, FAINT_ATTACK
	db 36, SLASH
	db 44, SCREECH
	db 52, BULLDOZE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SCREECH
	db 10, WRAP
	db 14, ROCK_THROW
	db 23, DEFENSE_CURL
	db 27, POUND
	db 36, SANDSTORM
	db 40, BODY_SLAM
	db 49, CRUNCH
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SCARY_FACE
	db 4, LEER
	db 8, CHARM
	db 13, BITE
	db 19, LICK
	db 26, ROAR
	db 34, POUND
	db 43, BODY_SLAM
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SCARY_FACE
	db 4, LEER
	db 8, CHARM
	db 13, BITE
	db 19, LICK
	db 28, ROAR
	db 38, POUND
	db 51, BODY_SLAM
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, POUND
	db 1, POISON_STING
	db 10, DEFENSE_CURL
	db 10, DEFENSE_CURL
	db 19, WATER_GUN
	db 28, PIN_MISSILE
	db 37, BODY_SLAM
	db 46, HYDRO_PUMP
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, BULK_UP
	db 24, AGILITY
	db 30, METAL_CLAW
	db 36, SLASH
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, DEFENSE_CURL
	db 9, WRAP
	db 14, ENCORE
	db 23, SAFEGUARD
	db 28, TOXIC
	db 37, REST
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 6, VICEGRIP
	db 12, ENDURE
	db 19, FURY_ATTACK
	db 27, COUNTER
	db 35, BODY_SLAM
	db 44, REVERSAL
	db 54, MEGAHORN
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 9, QUICK_ATTACK
	db 17, SCREECH
	db 25, FAINT_ATTACK
	db 33, FURY_ATTACK
	db 41, AGILITY
	db 49, SLASH
	db 57, BEAT_UP
	db 65, METAL_CLAW
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 40, URSARING
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 8, LICK
	db 15, FURY_ATTACK
	db 22, FAINT_ATTACK
	db 29, REST
	db 36, SLASH
	db 43, SNORE
	db 50, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 1, LICK
	db 1, FURY_ATTACK
	db 8, LICK
	db 15, FURY_ATTACK
	db 22, FAINT_ATTACK
	db 29, REST
	db 39, SLASH
	db 49, SNORE
	db 59, THRASH
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGCARGO
	db 0 ; no more evolutions
	db 1, ACID
	db 8, EMBER
	db 15, ROCK_THROW
	db 22, DEFENSE_CURL
	db 29, AMNESIA
	db 36, FLAMETHROWER
	db 43, ROCK_SLIDE
	db 50, BODY_SLAM
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ACID
	db 1, EMBER
	db 1, ROCK_THROW
	db 8, EMBER
	db 15, ROCK_THROW
	db 22, DEFENSE_CURL
	db 29, AMNESIA
	db 36, FLAMETHROWER
	db 48, ROCK_SLIDE
	db 60, BODY_SLAM
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, POUND
	db 10, POWDER_SNOW
	db 19, ENDURE
	db 28, BODY_SLAM
	db 37, MIST
	db 46, BLIZZARD
	db 55, AMNESIA
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, POWDER_SNOW
	db 1, ENDURE
	db 10, POWDER_SNOW
	db 19, ENDURE
	db 28, BODY_SLAM
	db 33, FURY_ATTACK
	db 42, MIST
	db 56, BLIZZARD
	db 70, AMNESIA
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 7, DEFENSE_CURL
	db 13, BUBBLEBEAM
	db 19, RECOVER
	db 25, BUBBLEBEAM
	db 31, SPIKE_CANNON
	db 37, MIRROR_COAT
	db 43, ANCIENTPOWER
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 11, LOCK_ON
	db 22, PSYBEAM
	db 22, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 33, FOCUS_ENERGY
	db 44, ICE_BEAM
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 11, WRAP
	db 22, PSYBEAM
	db 22, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 25, SURF
	db 38, FOCUS_ENERGY
	db 54, ICE_BEAM
	db 70, HYPER_BEAM
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, PRESENT
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, BUBBLEBEAM
	db 10, CONFUSE_RAY
	db 18, BUBBLEBEAM
	db 25, BODY_SLAM
	db 32, AGILITY
	db 40, WING_ATTACK
	db 49, CONFUSE_RAY
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 13, MUD_SLAP
	db 19, SWIFT
	db 25, AGILITY
	db 37, FURY_ATTACK
	db 49, STEEL_WING
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 7, ROAR
	db 13, ACID
	db 20, BITE
	db 27, FAINT_ATTACK
	db 35, FLAMETHROWER
	db 43, CRUNCH
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 7, ROAR
	db 13, ACID
	db 20, BITE
	db 30, FAINT_ATTACK
	db 41, FLAMETHROWER
	db 52, CRUNCH
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, EMBER
	db 1, LEER
	db 1, WATER_GUN
	db 8, EMBER
	db 15, LEER
	db 22, WATER_GUN
	db 29, TWISTER
	db 40, AGILITY
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 17, REVERSAL
	db 25, BODY_SLAM
	db 33, ROLLOUT
	db 41, ENDURE
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 17, REVERSAL
	db 25, FURY_ATTACK
	db 33, ROLLOUT
	db 41, RAPID_SPIN
	db 49, EARTHQUAKE
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	db 1, FLASH
	db 1, POUND
	db 1, PSYCH_UP
	db 9, AGILITY
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, DEFENSE_CURL
	db 32, LOCK_ON
	db 36, TRI_ATTACK
	db 44, ZAP_CANNON
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 8, LEER
	db 15, HYPNOSIS
	db 23, STOMP
	db 31, MUD_SLAP
	db 40, BODY_SLAM
	db 49, CONFUSE_RAY
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	db EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, POUND
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_SMASH
	db 7, FOCUS_ENERGY
	db 13, PURSUIT
	db 19, QUICK_ATTACK
	db 25, RAPID_SPIN
	db 31, COUNTER
	db 37, AGILITY
	db 43, DETECT
	db 49, TRIPLE_KICK
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	db EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 9, CONFUSE_RAY
	db 13, POWDER_SNOW
	db 21, CONFUSION
	db 25, HYPNOSIS
	db 33, MEAN_LOOK
	db 37, PSYCHIC_M
	db 45, PERISH_SONG
	db 49, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 9, THUNDERPUNCH
	db 17, LIGHT_SCREEN
	db 25, SWIFT
	db 33, SCREECH
	db 41, THUNDERBOLT
	db 49, THUNDER
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, EMBER
	db 7, LEER
	db 13, ACID
	db 19, FIRE_PUNCH
	db 25, EMBER
	db 31, SUNNY_DAY
	db 37, FLAMETHROWER
	db 43, CONFUSE_RAY
	db 49, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 8, DEFENSE_CURL
	db 13, STOMP
	db 19, MILK_DRINK
	db 26, FURY_ATTACK
	db 34, ROLLOUT
	db 43, BODY_SLAM
	db 53, HEAL_BELL
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, LEER
	db 10, SOFTBOILED
	db 13, FURY_ATTACK
	db 18, DEFENSE_CURL
	db 23, HYPNOSIS
	db 28, BODY_SLAM
	db 33, DEFENSE_CURL
	db 40, LIGHT_SCREEN
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 11, THUNDERSHOCK
	db 21, ROAR
	db 31, QUICK_ATTACK
	db 41, SPARK
	db 51, REFLECT
	db 61, CRUNCH
	db 71, THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 11, EMBER
	db 21, ROAR
	db 31, FIRE_SPIN
	db 41, STOMP
	db 51, FLAMETHROWER
	db 61, SWAGGER
	db 71, FIRE_BLAST
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 11, BUBBLEBEAM
	db 21, RAIN_DANCE
	db 31, GUST
	db 41, AURORA_BEAM
	db 51, MIST
	db 61, MIRROR_COAT
	db 71, HYDRO_PUMP
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 8, SANDSTORM
	db 15, SCREECH
	db 22, ROCK_SLIDE
	db 29, THRASH
	db 36, SCARY_FACE
	db 43, CRUNCH
	db 50, EARTHQUAKE
	db 57, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, SANDSTORM
	db 1, SCREECH
	db 8, SANDSTORM
	db 15, SCREECH
	db 22, ROCK_SLIDE
	db 29, THRASH
	db 38, SCARY_FACE
	db 47, CRUNCH
	db 56, EARTHQUAKE
	db 65, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, SANDSTORM
	db 1, SCREECH
	db 8, SANDSTORM
	db 15, SCREECH
	db 22, ROCK_SLIDE
	db 29, THRASH
	db 38, SCARY_FACE
	db 47, CRUNCH
	db 61, EARTHQUAKE
	db 75, HYPER_BEAM
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, AEROBLAST
	db 11, SAFEGUARD
	db 22, GUST
	db 33, RECOVER
	db 44, HYDRO_PUMP
	db 55, RAIN_DANCE
	db 66, SWIFT
	db 77, PSYBEAM
	db 88, ANCIENTPOWER
	db 99, FUTURE_SIGHT
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, SACRED_FIRE
	db 11, SAFEGUARD
	db 22, GUST
	db 33, RECOVER
	db 44, FIRE_BLAST
	db 55, SUNNY_DAY
	db 66, SWIFT
	db 77, MOONBLAST
	db 88, ANCIENTPOWER
	db 99, FUTURE_SIGHT
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, CONFUSION
	db 1, RECOVER
	db 1, HEAL_BELL
	db 10, SAFEGUARD
	db 20, ANCIENTPOWER
	db 30, FUTURE_SIGHT
	db 40, BATON_PASS
	db 50, PERISH_SONG
	db 0 ; no more level-up moves
