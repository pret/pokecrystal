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

INCLUDE "data/pokemon/evos_attacks_pointers.asm"

EvosAttacks::

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, SWEET_SCENT
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 15, STUN_SPORE
	db 20, RAZOR_LEAF
	db 25, PETAL_DANCE
	db 30, GROWTH
	db 35, SYNTHESIS
	db 40, SLUDGE_BOMB
	db 42, BODY_SLAM
	db 44, SOLARBEAM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, SWEET_SCENT
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 15, STUN_SPORE
	db 20, RAZOR_LEAF
	db 25, PETAL_DANCE
	db 30, GROWTH
	db 35, SYNTHESIS
	db 40, SLUDGE_BOMB
	db 42, BODY_SLAM
	db 44, SOLARBEAM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, SWEET_SCENT
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 15, POISONPOWDER
	db 15, SLEEP_POWDER
	db 15, STUN_SPORE
	db 20, RAZOR_LEAF
	db 25, PETAL_DANCE
	db 30, GROWTH
	db 35, SYNTHESIS
	db 40, SLUDGE_BOMB
	db 42, BODY_SLAM
	db 44, SOLARBEAM
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 13, SMOKESCREEN
	db 13, RAGE
	db 17, METAL_CLAW
	db 22, FLAME_WHEEL
	db 26, DRAGON_RAGE
	db 28, FIRE_SPIN
	db 31, FLAMETHROWER
	db 35, SLASH
	db 40, FIRE_BLAST
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 13, SMOKESCREEN
	db 13, RAGE
	db 17, METAL_CLAW
	db 22, FLAME_WHEEL
	db 26, DRAGON_RAGE
	db 28, FIRE_SPIN
	db 31, FLAMETHROWER
	db 35, SLASH
	db 40, FIRE_BLAST
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 13, SMOKESCREEN
	db 13, RAGE
	db 17, METAL_CLAW
	db 22, FLAME_WHEEL
	db 26, DRAGON_RAGE
	db 28, FIRE_SPIN
	db 31, FLAMETHROWER
	db 35, SLASH
	db 36, WING_ATTACK
	db 40, FIRE_BLAST
	db 44, SKY_ATTACK
	db 46, SWORDS_DANCE
	db 48, OUTRAGE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 13, WATER_GUN
	db 16, BITE
	db 20, MIRROR_COAT
	db 20, COUNTER
	db 23, RAPID_SPIN
	db 26, PROTECT
	db 30, RAIN_DANCE
	db 32, CRUNCH
	db 35, REFLECT
	db 35, SEISMIC_TOSS
	db 40, HYDRO_PUMP
	db 40, SKULL_BASH
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 13, WATER_GUN
	db 16, BITE
	db 20, MIRROR_COAT
	db 20, COUNTER
	db 23, RAPID_SPIN
	db 26, PROTECT
	db 30, RAIN_DANCE
	db 32, CRUNCH
	db 35, REFLECT
	db 35, SEISMIC_TOSS
	db 40, HYDRO_PUMP
	db 40, SKULL_BASH
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, BUBBLE
	db 10, WITHDRAW
	db 13, WATER_GUN
	db 16, BITE
	db 20, MIRROR_COAT
	db 20, COUNTER
	db 23, RAPID_SPIN
	db 26, PROTECT
	db 30, RAIN_DANCE
	db 32, CRUNCH
	db 35, REFLECT
	db 35, SEISMIC_TOSS
	db 40, HYDRO_PUMP
	db 40, SKULL_BASH
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, HARDEN
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 10, CONFUSION
	db 13, POISONPOWDER
	db 14, STUN_SPORE
	db 15, SLEEP_POWDER
	db 16, GUST
	db 20, MEGA_DRAIN
	db 22, MORNING_SUN
	db 25, RAZOR_WIND
	db 30, PSYCHIC_M
	db 35, SAFEGUARD
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, HARDEN
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, FURY_ATTACK
	db 10, FURY_ATTACK
	db 10, FOCUS_ENERGY
	db 12, RAGE
	db 15, TWINEEDLE
	db 26, SLUDGE_BOMB
	db 28, SWORDS_DANCE
	db 30, SWIFT
	db 35, AGILITY
	db 40, HYPER_BEAM
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 15, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, SAND_ATTACK
	db 9, GUST
	db 12, QUICK_ATTACK
	db 15, RAZOR_WIND
	db 21, WHIRLWIND
	db 30, EXTREMESPEED
	db 37, AGILITY
	db 42, SKY_ATTACK
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 30, PIDGEOT
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 9, GUST
	db 12, QUICK_ATTACK
	db 15, RAZOR_WIND
	db 21, WHIRLWIND
	db 30, EXTREMESPEED
	db 37, AGILITY
	db 42, SKY_ATTACK
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SAND_ATTACK
	db 9, GUST
	db 12, QUICK_ATTACK
	db 15, RAZOR_WIND
	db 21, WHIRLWIND
	db 30, EXTREMESPEED
	db 37, AGILITY
	db 42, SKY_ATTACK
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 13, HYPER_FANG
	db 20, FOCUS_ENERGY
	db 20, BITE
	db 27, SUPER_FANG
	db 32, CRUNCH
	db 36, BODY_SLAM
	db 40, HYPER_BEAM
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 13, HYPER_FANG
	db 20, FOCUS_ENERGY
	db 20, BITE
	db 27, SUPER_FANG
	db 32, CRUNCH
	db 36, BODY_SLAM
	db 40, HYPER_BEAM
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 7, LEER
	db 13, FURY_ATTACK
	db 20, TRI_ATTACK
	db 26, MIRROR_MOVE
	db 31, DRILL_PECK
	db 36, AGILITY
	db 45, SKY_ATTACK
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 7, LEER
	db 13, FURY_ATTACK
	db 20, TRI_ATTACK
	db 26, MIRROR_MOVE
	db 31, DRILL_PECK
	db 36, AGILITY
	db 45, SKY_ATTACK
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, POISON_STING
	db 9, BITE
	db 13, GLARE
	db 16, ACID
	db 20, SLAM
	db 25, CRUNCH
	db 27, HAZE
	db 32, SLUDGE_BOMB
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, POISON_STING
	db 9, BITE
	db 13, GLARE
	db 16, ACID
	db 20, SLAM
	db 25, CRUNCH
	db 27, HAZE
	db 32, SLUDGE_BOMB
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 6, TAIL_WHIP
	db 11, QUICK_ATTACK
	db 14, DOUBLE_TEAM
	db 18, SLAM
	db 22, BODY_SLAM
	db 26, THUNDERBOLT
	db 30, AGILITY
	db 34, THUNDER
	db 34, EXTREMESPEED
	db 40, LIGHT_SCREEN
	db 40, REFLECT
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, TAIL_WHIP
	db 1, QUICK_ATTACK
	db 1, THUNDERBOLT
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, POISON_STING
	db 4, DEFENSE_CURL
	db 8, SAND_ATTACK
	db 12, MAGNITUDE
	db 20, SLASH
	db 25, METAL_CLAW
	db 32, EARTHQUAKE
	db 40, SWORDS_DANCE
	db 45, FISSURE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, POISON_STING
	db 4, DEFENSE_CURL
	db 8, SAND_ATTACK
	db 12, MAGNITUDE
	db 20, SLASH
	db 25, METAL_CLAW
	db 32, EARTHQUAKE
	db 40, SWORDS_DANCE
	db 45, FISSURE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 8, HORN_ATTACK
	db 12, DOUBLE_KICK
	db 17, POISON_STING
	db 23, FOCUS_ENERGY
	db 26, BODY_SLAM
	db 30, THRASH
	db 34, HORN_DRILL
	db 38, SLUDGE_BOMB
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 8, HORN_ATTACK
	db 12, DOUBLE_KICK
	db 17, POISON_STING
	db 23, FOCUS_ENERGY
	db 26, BODY_SLAM
	db 30, THRASH
	db 34, HORN_DRILL
	db 38, SLUDGE_BOMB
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCRATCH
	db 1, DOUBLE_KICK
	db 1, TAIL_WHIP
	db 23, BODY_SLAM
	db 26, THRASH
	db 34, HORN_DRILL
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 8, HORN_ATTACK
	db 12, DOUBLE_KICK
	db 17, POISON_STING
	db 23, FOCUS_ENERGY
	db 26, BODY_SLAM
	db 30, THRASH
	db 34, HORN_DRILL
	db 38, SLUDGE_BOMB
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, LEER
	db 1, TACKLE
	db 8, HORN_ATTACK
	db 12, DOUBLE_KICK
	db 17, POISON_STING
	db 23, FOCUS_ENERGY
	db 26, BODY_SLAM
	db 30, THRASH
	db 34, HORN_DRILL
	db 38, SLUDGE_BOMB
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HORN_ATTACK
	db 1, DOUBLE_KICK
	db 1, POISON_STING
	db 23, THRASH
	db 26, BODY_SLAM
	db 34, HORN_DRILL
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 8, SING
	db 13, DOUBLESLAP
	db 19, MINIMIZE
	db 23, ENCORE
	db 26, DEFENSE_CURL
	db 30, DOUBLE_EDGE
	db 34, METRONOME
	db 38, MOONLIGHT
	db 42, LIGHT_SCREEN
	db 46, HYPER_BEAM
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DOUBLESLAP
	db 1, METRONOME
	db 1, MOONLIGHT
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 13, ROAR
	db 16, CONFUSE_RAY
	db 20, SAFEGUARD
	db 26, HYPNOSIS
	db 30, FLAMETHROWER
	db 37, SACRED_FIRE
	db 42, PSYCHIC_M
	db 45, SHADOW_BALL
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, QUICK_ATTACK
	db 1, CONFUSE_RAY
	db 1, SAFEGUARD
	db 42, PSYCHIC_M
	db 42, SACRED_FIRE
	db 45, SHADOW_BALL
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, POUND
	db 4, DEFENSE_CURL
	db 9, DISABLE
	db 14, ROLLOUT
	db 20, BODY_SLAM
	db 25, REST
	db 30, DOUBLE_EDGE
	db 35, TRI_ATTACK
	db 40, HYPER_BEAM
	db 45, SOFTBOILED
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, DISABLE
	db 1, DEFENSE_CURL
	db 1, DOUBLESLAP
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 6, SUPERSONIC
	db 10, BITE
	db 16, WING_ATTACK
	db 19, CONFUSE_RAY
	db 24, SCREECH
	db 27, RAZOR_WIND
	db 32, SLUDGE_BOMB
	db 38, HAZE
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_LEVEL, 36, CROBAT
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 6, SUPERSONIC
	db 10, BITE
	db 16, WING_ATTACK
	db 19, CONFUSE_RAY
	db 24, SCREECH
	db 27, RAZOR_WIND
	db 32, SLUDGE_BOMB
	db 38, HAZE
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, SWEET_SCENT
	db 9, MEGA_DRAIN
	db 14, POISONPOWDER
	db 14, STUN_SPORE
	db 16, SLEEP_POWDER
	db 18, ACID
	db 25, MOONLIGHT
	db 29, GIGA_DRAIN
	db 33, PETAL_DANCE
	db 37, SLUDGE_BOMB
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, SWEET_SCENT
	db 9, MEGA_DRAIN
	db 14, POISONPOWDER
	db 14, STUN_SPORE
	db 16, SLEEP_POWDER
	db 18, ACID
	db 25, MOONLIGHT
	db 29, GIGA_DRAIN
	db 33, PETAL_DANCE
	db 37, SLUDGE_BOMB
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, SWEET_SCENT
	db 1, STUN_SPORE
	db 1, PETAL_DANCE
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 20, PARASECT
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 7, STUN_SPORE
	db 7, POISONPOWDER
	db 14, LEECH_LIFE
	db 17, SYNTHESIS
	db 20, SPORE
	db 22, METAL_CLAW
	db 24, SLASH
	db 27, GROWTH
	db 30, GIGA_DRAIN
	db 35, SWORDS_DANCE
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 7, STUN_SPORE
	db 7, POISONPOWDER
	db 14, LEECH_LIFE
	db 17, SYNTHESIS
	db 20, SPORE
	db 22, METAL_CLAW
	db 24, SLASH
	db 27, GROWTH
	db 30, GIGA_DRAIN
	db 35, SWORDS_DANCE
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 30, VENOMOTH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 1, LEECH_LIFE
	db 9, SUPERSONIC
	db 13, CONFUSION
	db 16, POISONPOWDER
	db 20, STUN_SPORE
	db 24, PSYBEAM
	db 27, SLEEP_POWDER
	db 30, PSYCHIC_M
	db 34, GIGA_DRAIN
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 1, FORESIGHT
	db 1, LEECH_LIFE
	db 9, SUPERSONIC
	db 13, CONFUSION
	db 16, POISONPOWDER
	db 20, STUN_SPORE
	db 24, PSYBEAM
	db 27, SLEEP_POWDER
	db 30, PSYCHIC_M
	db 34, GIGA_DRAIN
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 9, MAGNITUDE
	db 14, DIG
	db 17, SAND_ATTACK
	db 24, TRI_ATTACK
	db 28, SLASH
	db 33, EARTHQUAKE
	db 38, ROCK_SLIDE
	db 43, FISSURE
	db 48, REVERSAL
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 9, MAGNITUDE
	db 14, DIG
	db 17, SAND_ATTACK
	db 24, TRI_ATTACK
	db 28, SLASH
	db 33, EARTHQUAKE
	db 38, ROCK_SLIDE
	db 43, FISSURE
	db 48, REVERSAL
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 22, PERSIAN
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 1, FURY_SWIPES
	db 7, BITE
	db 14, PAY_DAY
	db 18, FAINT_ATTACK
	db 22, SCREECH
	db 24, HYPNOSIS
	db 26, SLASH
	db 31, CRUNCH
	db 35, PETAL_DANCE
	db 40, BODY_SLAM
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 1, FURY_SWIPES
	db 7, BITE
	db 14, PAY_DAY
	db 18, FAINT_ATTACK
	db 22, SCREECH
	db 24, HYPNOSIS
	db 26, SLASH
	db 31, CRUNCH
	db 35, PETAL_DANCE
	db 40, BODY_SLAM
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 28, GOLDUCK
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 5, DISABLE
	db 9, WATER_GUN
	db 12, CONFUSION
	db 16, SCREECH
	db 20, PSYCH_UP
	db 24, PSYBEAM
	db 28, FUTURE_SIGHT
	db 34, PSYCHIC_M
	db 37, SEISMIC_TOSS
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 9, WATER_GUN
	db 12, CONFUSION
	db 16, SCREECH
	db 20, PSYCH_UP
	db 24, PSYBEAM
	db 28, FUTURE_SIGHT
	db 34, PSYCHIC_M
	db 37, SEISMIC_TOSS
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 9, FURY_SWIPES
	db 13, LOW_KICK
	db 17, KARATE_CHOP
	db 23, FOCUS_ENERGY
	db 27, MEDITATE
	db 32, CROSS_CHOP
	db 36, SUBMISSION
	db 40, THRASH
	db 44, ROCK_SLIDE
	db 50, OUTRAGE
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, FURY_SWIPES
	db 13, LOW_KICK
	db 17, KARATE_CHOP
	db 23, FOCUS_ENERGY
	db 27, MEDITATE
	db 32, CROSS_CHOP
	db 36, SUBMISSION
	db 40, THRASH
	db 44, ROCK_SLIDE
	db 50, OUTRAGE
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, BITE
	db 1, ROAR
	db 5, EMBER
	db 9, LEER
	db 20, FLAME_WHEEL
	db 26, TAKE_DOWN
	db 30, BODY_SLAM
	db 35, CRUNCH
	DB 40, EXTREMESPEED
	db 40, FLAMETHROWER
	db 45, OUTRAGE
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROAR
	db 1, LEER
	db 1, TAKE_DOWN
	db 1, FLAME_WHEEL
	db 40, EXTREMESPEED
	db 40, DRAGON_RAGE
	db 45, OUTRAGE
	DB 50, FIRE_BLAST
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, HYPNOSIS
	db 10, WATER_GUN
	db 14, DOUBLESLAP
	db 20, RAIN_DANCE
	db 25, BODY_SLAM
	db 30, BELLY_DRUM
	db 40, HYDRO_PUMP
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_LEVEL, 36, POLITOED
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 7, HYPNOSIS
	db 10, WATER_GUN
	db 14, DOUBLESLAP
	db 20, RAIN_DANCE
	db 25, BODY_SLAM
	db 30, BELLY_DRUM
	db 35, SUBMISSION
	db 40, HYDRO_PUMP
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, SUBMISSION
	db 35, SUBMISSION
	db 40, MIND_READER
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_LEVEL, 40, ALAKAZAM
	db 0 ; no more evolutions
	db 1, KINESIS
	db 1, CONFUSION
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 24, LIGHT_SCREEN
	db 26, RECOVER
	db 31, FUTURE_SIGHT
	db 34, REFLECT
	db 38, PSYCHIC_M
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, KINESIS
	db 1, CONFUSION
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 24, LIGHT_SCREEN
	db 26, RECOVER
	db 31, FUTURE_SIGHT
	db 34, REFLECT
	db 38, PSYCHIC_M
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 24, MACHOKE
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, ROCK_SMASH
	db 7, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 16, SEISMIC_TOSS
	db 20, FORESIGHT
	db 24, VITAL_THROW
	db 27, MEGA_PUNCH
	db 30, CROSS_CHOP
	db 37, BODY_SLAM
	db 42, SUBMISSION
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_LEVEL, 35, MACHAMP
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, ROCK_SMASH
	db 7, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 16, SEISMIC_TOSS
	db 20, FORESIGHT
	db 24, VITAL_THROW
	db 27, MEGA_PUNCH
	db 30, CROSS_CHOP
	db 37, BODY_SLAM
	db 42, SUBMISSION
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, ROCK_SMASH
	db 7, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 16, SEISMIC_TOSS
	db 20, FORESIGHT
	db 24, VITAL_THROW
	db 27, MEGA_PUNCH
	db 30, CROSS_CHOP
	db 37, BODY_SLAM
	db 42, SUBMISSION
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, GROWTH
	db 7, WRAP
	db 12, SLEEP_POWDER
	db 15, POISONPOWDER
	db 18, STUN_SPORE
	db 23, SLUDGE
	db 27, RAZOR_LEAF
	db 35, SLUDGE_BOMB
	db 34, SWORDS_DANCE
	db 40, SYNTHESIS
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, GROWTH
	db 7, WRAP
	db 12, SLEEP_POWDER
	db 15, POISONPOWDER
	db 18, STUN_SPORE
	db 23, SLUDGE
	db 27, RAZOR_LEAF
	db 35, SLUDGE_BOMB
	db 34, SWORDS_DANCE
	db 40, SYNTHESIS
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, SLEEP_POWDER
	db 1, SWEET_SCENT
	db 1, RAZOR_LEAF
	db 40, SYNTHESIS
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, SUPERSONIC
	db 1, WRAP
	db 7, CONSTRICT
	db 12, ACID
	db 16, BUBBLEBEAM
	db 22, CONFUSE_RAY
	db 26, MIRROR_COAT
	db 33, BARRIER
	db 36, SAFEGUARD
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, SUPERSONIC
	db 1, WRAP
	db 7, CONSTRICT
	db 12, ACID
	db 16, BUBBLEBEAM
	db 22, CONFUSE_RAY
	db 26, MIRROR_COAT
	db 33, BARRIER
	db 36, SAFEGUARD
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, DEFENSE_CURL
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 21, SELFDESTRUCT
	db 24, ROLLOUT
	db 30, ROCK_SLIDE
	db 36, EARTHQUAKE
	db 41, EXPLOSION
	db 45, SUBMISSION
	db 50, FISSURE
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_LEVEL, 35, GOLEM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, DEFENSE_CURL
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 21, SELFDESTRUCT
	db 24, ROLLOUT
	db 30, ROCK_SLIDE
	db 36, EARTHQUAKE
	db 41, EXPLOSION
	db 45, SUBMISSION
	db 50, FISSURE
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, DEFENSE_CURL
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 21, SELFDESTRUCT
	db 24, ROLLOUT
	db 30, ROCK_SLIDE
	db 36, EARTHQUAKE
	db 41, EXPLOSION
	db 45, SUBMISSION
	db 50, FISSURE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 34, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 5, TAIL_WHIP
	db 9, EMBER
	db 13, STOMP
	db 18, FIRE_SPIN
	db 22, FLAME_WHEEL
	db 27, TAKE_DOWN
	db 34, FLAMETHROWER
	db 34, AGILITY
	db 37, BODY_SLAM
	db 40, FIRE_BLAST
	db 45, MEGAHORN
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 5, TAIL_WHIP
	db 9, EMBER
	db 13, STOMP
	db 18, FIRE_SPIN
	db 22, FLAME_WHEEL
	db 27, TAKE_DOWN
	db 34, FLAMETHROWER
	db 34, AGILITY
	db 37, BODY_SLAM
	db 40, FIRE_BLAST
	db 45, MEGAHORN
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_ITEM, WATER_STONE, SLOWKING
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 8, WATER_GUN
	db 12, CONFUSION
	db 16, DISABLE
	db 20, HEADBUTT
	db 25, PSYBEAM
	db 28, AMNESIA
	db 31, CURSE
	db 34, THUNDER_WAVE
	db 37, PSYCHIC_M
	db 40, BODY_SLAM
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 8, WATER_GUN
	db 12, CONFUSION
	db 16, DISABLE
	db 20, HEADBUTT
	db 25, PSYBEAM
	db 28, AMNESIA
	db 31, CURSE
	db 34, THUNDER_WAVE
	db 37, PSYCHIC_M
	db 40, BODY_SLAM
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 11, SUPERSONIC
	db 13, SONICBOOM
	db 18, THUNDER_WAVE
	db 22, LOCK_ON
	db 26, SWIFT
	db 30, THUNDERBOLT
	db 33, AGILITY
	db 36, TRI_ATTACK
	db 39, REFLECT
	db 45, ZAP_CANNON
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 11, SUPERSONIC
	db 13, SONICBOOM
	db 18, THUNDER_WAVE
	db 22, LOCK_ON
	db 26, SWIFT
	db 30, THUNDERBOLT
	db 33, AGILITY
	db 36, TRI_ATTACK
	db 39, REFLECT
	db 45, ZAP_CANNON
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, SAND_ATTACK
	db 1, LEER
	db 9, FALSE_SWIPE
	db 13, FURY_ATTACK
	db 17, RAZOR_WIND
	db 20, SWORDS_DANCE
	db 25, AGILITY
	db 30, SLASH
	db 35, SKY_ATTACK
	db 39, FLAIL
	db 44, DOUBLE_EDGE
	db 48, SUBSTITUTE
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, PURSUIT
	db 8, FURY_ATTACK
	db 13, TRI_ATTACK
	db 16, RAGE
	db 20, FLAIL
	db 23, DRILL_PECK
	db 27, LOW_KICK
	db 30, BODY_SLAM
	db 33, MIMIC	
	db 37, AGILITY
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, GROWL
	db 1, PURSUIT
	db 8, FURY_ATTACK
	db 13, TRI_ATTACK
	db 16, RAGE
	db 20, FLAIL
	db 23, DRILL_PECK
	db 27, LOW_KICK
	db 30, BODY_SLAM
	db 33, MIMIC	
	db 37, AGILITY
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, GROWL
	db 1, DISABLE
	db 7, AURORA_BEAM
	db 14, WATER_GUN
	db 17, FLAIL
	db 21, REST
	db 27, ENCORE
	db 29, BODY_SLAM
	db 32, ICE_BEAM
	db 38, SAFEGUARD
	db 43, HYDRO_PUMP
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, HEADBUTT
	db 1, GROWL
	db 1, DISABLE
	db 7, AURORA_BEAM
	db 14, WATER_GUN
	db 17, FLAIL
	db 21, REST
	db 27, ENCORE
	db 29, BODY_SLAM
	db 32, ICE_BEAM
	db 38, SAFEGUARD
	db 43, HYDRO_PUMP
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 30, MUK
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, POUND
	db 1, LICK
	db 5, DISABLE
	db 11, SLUDGE
	db 16, MINIMIZE
	db 20, SCREECH
	db 23, BODY_SLAM
	db 25, ACID_ARMOR
	db 30, SLUDGE_BOMB
	db 35, TOXIC
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	; moves are not sorted by level
	db 1, POISON_GAS
	db 1, POUND
	db 1, LICK
	db 5, DISABLE
	db 11, SLUDGE
	db 16, MINIMIZE
	db 20, SCREECH
	db 23, BODY_SLAM
	db 25, ACID_ARMOR
	db 30, SLUDGE_BOMB
	db 35, TOXIC
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WITHDRAW
	db 7, SUPERSONIC
	db 13, AURORA_BEAM
	db 18, PROTECT
	db 25, CLAMP
	db 30, HYDRO_PUMP
	db 36, ICE_BEAM
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, WITHDRAW
	db 1, SUPERSONIC
	db 1, AURORA_BEAM
	db 1, PROTECT
	db 36, SPIKES
	db 41, SPIKE_CANNON
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 8, SPITE
	db 12, MEAN_LOOK
	db 16, NIGHT_SHADE
	db 21, CURSE
	db 29, CONFUSE_RAY
	db 33, DREAM_EATER
	db 36, DESTINY_BOND
	db 40, PSYCHIC_M
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_LEVEL, 40, GENGAR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 8, SPITE
	db 12, MEAN_LOOK
	db 16, NIGHT_SHADE
	db 21, CURSE
	db 29, CONFUSE_RAY
	db 33, DREAM_EATER
	db 36, DESTINY_BOND
	db 40, PSYCHIC_M
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 8, SPITE
	db 12, MEAN_LOOK
	db 16, NIGHT_SHADE
	db 21, CURSE
	db 29, CONFUSE_RAY
	db 33, DREAM_EATER
	db 36, DESTINY_BOND
	db 40, PSYCHIC_M
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_LEVEL, 32, STEELIX
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, RAGE
	db 1, SCREECH
	db 5, BIND
	db 10, ROCK_THROW
	db 16, MAGNITUDE
	db 22, SANDSTORM
	db 26, SLAM
	db 30, EARTHQUAKE
	db 35, ROCK_SLIDE
	db 40, IRON_TAIL
	db 45, CRUNCH
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 7, DISABLE
	db 12, CONFUSION
	db 16, HEADBUTT
	db 20, POISON_GAS
	db 24, PSYBEAM
	db 24, REFLECT
	db 27, GROWTH
	db 32, PSYCHIC_M
	db 36, THUNDER_WAVE
	db 40, FUTURE_SIGHT
	db 45, SEISMIC_TOSS
	db 50, BELLY_DRUM
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, HYPNOSIS
	db 7, DISABLE
	db 12, CONFUSION
	db 16, HEADBUTT
	db 20, POISON_GAS
	db 24, PSYBEAM
	db 24, REFLECT
	db 27, GROWTH
	db 32, PSYCHIC_M
	db 36, THUNDER_WAVE
	db 40, FUTURE_SIGHT
	db 45, SEISMIC_TOSS
	db 50, BELLY_DRUM
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, VICEGRIP
	db 5, LEER
	db 10, HARDEN
	db 16, STOMP
	db 20, PROTECT
	db 23, METAL_CLAW
	db 26, CRABHAMMER
	db 32, HYDRO_PUMP
	db 38, SWORDS_DANCE
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, VICEGRIP
	db 5, LEER
	db 10, HARDEN
	db 16, STOMP
	db 20, PROTECT
	db 23, METAL_CLAW
	db 26, CRABHAMMER
	db 32, HYDRO_PUMP
	db 38, SWORDS_DANCE
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 1, THUNDERSHOCK
	db 7, SONICBOOM
	db 11, THUNDER_WAVE
	db 14, SELFDESTRUCT
	db 17, ROLLOUT
	db 22, LIGHT_SCREEN
	db 22, REFLECT
	db 26, SWIFT
	db 30, EXPLOSION
	db 34, THUNDERBOLT
	db 38, THUNDER
	db 41, MIRROR_COAT
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 1, THUNDERSHOCK
	db 7, SONICBOOM
	db 11, THUNDER_WAVE
	db 14, SELFDESTRUCT
	db 17, ROLLOUT
	db 22, LIGHT_SCREEN
	db 22, REFLECT
	db 26, SWIFT
	db 30, EXPLOSION
	db 34, THUNDERBOLT
	db 38, THUNDER
	db 41, MIRROR_COAT
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, HYPNOSIS
	db 7, REFLECT
	db 13, LEECH_SEED
	db 13, CONFUSION
	db 19, STUN_SPORE
	db 22, POISONPOWDER
	db 25, GIGA_DRAIN
	db 28, SLEEP_POWDER
	db 35, PSYCHIC_M
	db 43, SOLARBEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, HYPNOSIS
	db 1, CONFUSION
	db 19, STOMP
	db 31, EGG_BOMB
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, TAIL_WHIP
	db 1, BONE_CLUB
	db 10, HEADBUTT
	db 14, FOCUS_ENERGY
	db 18, RAGE
	db 21, SING
	db 23, BONEMERANG
	db 28, SKULL_BASH
	db 30, FALSE_SWIPE
	db 33, THRASH
	db 36, SUBMISSION
	db 38, BONE_RUSH
	db 42, EARTHQUAKE
	db 48, ROCK_SLIDE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, TAIL_WHIP
	db 1, BONE_CLUB
	db 10, HEADBUTT
	db 14, FOCUS_ENERGY
	db 18, RAGE
	db 21, SING
	db 23, BONEMERANG
	db 28, SKULL_BASH
	db 30, FALSE_SWIPE
	db 33, THRASH
	db 36, SUBMISSION
	db 38, BONE_RUSH
	db 42, EARTHQUAKE
	db 48, ROCK_SLIDE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLE_KICK
	db 1, FORESIGHT
	db 6, MEDITATE
	db 20, ROLLING_KICK
	db 20, MEGA_KICK
	db 26, HI_JUMP_KICK
	db 30, MIND_READER
	db 34, ENDURE
	db 40, COUNTER
	db 45, REVERSAL
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 1, DETECT
	db 7, AGILITY
	db 13, PURSUIT
	db 20, THUNDERPUNCH
	db 20, ICE_PUNCH
	db 20, FIRE_PUNCH
	db 26, MACH_PUNCH
	db 30, MEGA_PUNCH
	db 34, SUBMISSION
	db 40, COUNTER
	db 45, REVERSAL
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 1, SUPERSONIC
	db 1, WRAP
	db 1, SCREECH
	db 7, DEFENSE_CURL
	db 12, STOMP
	db 18, ROLLOUT
	db 23, DISABLE
	db 27, SLAM
	db 32, SEISMIC_TOSS
	db 36, BODY_SLAM
	db 40, DOUBLE_EDGE
	db 45, HEAL_BELL
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 30, WEEZING
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, TACKLE
	db 1, SMOG
	db 12, SLUDGE
	db 17, SELFDESTRUCT
	db 20, SMOKESCREEN
	db 23, HAZE
	db 30, EXPLOSION
	db 33, DESTINY_BOND
	db 36, SLUDGE_BOMB
	db 40, TOXIC
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, TACKLE
	db 1, SMOG
	db 12, SLUDGE
	db 17, SELFDESTRUCT
	db 20, SMOKESCREEN
	db 23, HAZE
	db 30, EXPLOSION
	db 33, DESTINY_BOND
	db 36, SLUDGE_BOMB
	db 40, TOXIC
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, TAIL_WHIP
	db 1, STOMP
	db 1, FURY_ATTACK
	db 12, ROCK_THROW
	db 16, MAGNITUDE
	db 20, SCARY_FACE
	db 25, BODY_SLAM
	db 30, ROCK_SLIDE
	db 35, MEGAHORN
	db 40, EARTHQUAKE
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, TAIL_WHIP
	db 1, STOMP
	db 1, FURY_ATTACK
	db 12, SCARY_FACE
	db 16, MAGNITUDE
	db 20, ROCK_THROW
	db 25, BODY_SLAM
	db 30, ROCK_SLIDE
	db 35, MEGAHORN
	db 40, EARTHQUAKE
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_LEVEL, 50, BLISSEY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 13, SOFTBOILED
	db 17, DOUBLESLAP
	db 23, MINIMIZE
	db 26, SING
	db 30, EGG_BOMB
	db 35, HEAL_BELL
	db 40, LIGHT_SCREEN
	db 40, REFLECT
	db 46, DOUBLE_EDGE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, SLEEP_POWDER
	db 1, ABSORB
	db 13, POISONPOWDER
	db 13, STUN_SPORE
	db 17, VINE_WHIP
	db 20, SYNTHESIS
	db 22, BIND
	db 25, MEGA_DRAIN
	db 28, SLAM
	db 32, GROWTH
	db 36, GIGA_DRAIN
	db 40, ANCIENTPOWER
	db 40, REFLECT
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 1, LEER
	db 1, TAIL_WHIP
	db 7, BITE
	db 12, RAGE
	db 17, ENDURE
	db 22, MEGA_PUNCH
	db 25, BODY_SLAM
	db 30, REVERSAL
	db 35, CRUNCH
	db 40, OUTRAGE
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, SMOKESCREEN
	db 1, LEER
	db 10, WATER_GUN
	db 14, AURORA_BEAM
	db 17, BUBBLEBEAM
	db 23, TWISTER
	db 23, DRAGON_RAGE
	db 28, AGILITY
	db 32, DRAGONBREATH
	db 40, HYDRO_PUMP
	db 50, OUTRAGE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_LEVEL, 42, KINGDRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, SMOKESCREEN
	db 1, LEER
	db 10, WATER_GUN
	db 14, AURORA_BEAM
	db 17, BUBBLEBEAM
	db 23, TWISTER
	db 23, DRAGON_RAGE
	db 28, AGILITY
	db 32, DRAGONBREATH
	db 40, HYDRO_PUMP
	db 50, OUTRAGE
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 28, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 1, WATER_GUN
	db 7, SUPERSONIC
	db 15, HORN_ATTACK
	db 20, FLAIL
	db 23, FURY_ATTACK
	db 28, WATERFALL
	db 34, MEGAHORN
	db 38, SWORDS_DANCE
	db 43, DRILL_PECK
	db 43, AGILITY
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, TAIL_WHIP
	db 1, WATER_GUN
	db 7, SUPERSONIC
	db 15, HORN_ATTACK
	db 20, FLAIL
	db 23, FURY_ATTACK
	db 28, WATERFALL
	db 34, MEGAHORN
	db 38, SWORDS_DANCE
	db 43, DRILL_PECK
	db 43, AGILITY
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 1, SUPERSONIC
	db 7, WATER_GUN
	db 10, TWISTER
	db 13, RAPID_SPIN
	db 18, RECOVER
	db 22, SWIFT
	db 24, BARRIER
	db 26, BUBBLEBEAM
	db 30, MINIMIZE
	db 35, LIGHT_SCREEN
	db 37, CONFUSE_RAY
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, RAPID_SPIN
	db 1, RECOVER
	db 1, BUBBLEBEAM
	db 37, CONFUSE_RAY
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRIER
	db 5, CONFUSION
	db 5, DOUBLESLAP
	db 5, METRONOME
	db 10, MEDITATE
	db 16, LIGHT_SCREEN
	db 16, REFLECT
	db 20, ENCORE
	db 24, PSYBEAM
	db 27, GROWTH
	db 33, BATON_PASS
	db 36, PSYCHIC_M
	db 40, SAFEGUARD
	db 45, THUNDER_WAVE
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_LEVEL, 40, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, WING_ATTACK
	db 18, FALSE_SWIPE
	db 24, AGILITY
	db 27, RAZOR_WIND
	db 30, SLASH
	db 36, SWORDS_DANCE
	db 40, DOUBLE_TEAM
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 1, SWEET_KISS
	db 7, POWDER_SNOW
	db 13, CONFUSION
	db 18, LOVELY_KISS
	db 22, PETAL_DANCE
	db 25, MEAN_LOOK
	db 30, ICE_PUNCH
	db 30, BODY_SLAM
	db 33, PERISH_SONG
	db 37, PSYCHIC_M
	db 42, BLIZZARD
	db 45, ICE_BEAM
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 5, THUNDERPUNCH
	db 10, LIGHT_SCREEN
	db 14, SWIFT
	db 16, SCREECH
	db 20, KARATE_CHOP
	db 24, THUNDER_WAVE
	db 30, SUBMISSION
	db 30, BODY_SLAM
	db 36, CROSS_CHOP
	db 42, THUNDER
	db 45, THUNDERBOLT
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 7, SMOG
	db 10, FIRE_PUNCH
	db 14, SMOKESCREEN
	db 20, SUNNY_DAY
	db 24, BODY_SLAM
	db 30, CROSS_CHOP
	db 30, CONFUSE_RAY
	db 37, PSYCHIC_M
	db 42, FIRE_BLAST
	db 45, FLAMETHROWER
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, VICEGRIP
	db 1, FOCUS_ENERGY
	db 7, BIND
	db 13, SEISMIC_TOSS
	db 18, HARDEN
	db 25, SUBMISSION
	db 32, SWORDS_DANCE
	db 36, BODY_SLAM
	db 42, ROCK_SLIDE
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, RAGE
	db 13, HORN_ATTACK
	db 16, SCARY_FACE
	db 20, PURSUIT
	db 26, REST
	db 32, THRASH
	db 34, TAKE_DOWN
	db 38, BODY_SLAM
	db 43, OUTRAGE
	db 48, MEGAHORN
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, SPLASH
	db 15, TACKLE
	db 30, FLAIL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THRASH
	db 15, TACKLE
	db 20, BITE
	db 25, DRAGON_RAGE
	db 30, FLAIL
	db 30, RAIN_DANCE
	db 35, CRUNCH
	db 40, HYDRO_PUMP
	db 45, DOUBLE_EDGE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, GROWL
	db 1, SING
	db 7, MIST
	db 13, BODY_SLAM
	db 18, CONFUSE_RAY
	db 22, PERISH_SONG
	db 26, ICE_BEAM
	db 30, RAIN_DANCE
	db 35, SAFEGUARD
	db 40, HYDRO_PUMP
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
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, SAND_ATTACK
	db 1, GROWL
	db 7, QUICK_ATTACK
	db 13, BITE
	db 17, CHARM
	db 20, HEADBUTT
	db 25, BATON_PASS
	db 30, TAKE_DOWN
	db 35, FLAIL
	db 40, REFLECT
	db 45, GROWTH
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 7, QUICK_ATTACK
	db 13, BITE
	db 17, CHARM
	db 20, HEADBUTT
	db 21, WATER_GUN
	db 25, ICY_WIND
	db 30, AURORA_BEAM
	db 33, HAZE
	db 36, ACID_ARMOR
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, SAND_ATTACK
	db 7, QUICK_ATTACK
	db 13, BITE
	db 17, CHARM
	db 17, HEADBUTT
	db 21, THUNDERSHOCK
	db 25, DOUBLE_KICK
	db 28, PIN_MISSILE
	db 30, THUNDER_WAVE
	db 33, AGILITY
	db 36, THUNDERBOLT
	db 45, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, SAND_ATTACK
	db 7, QUICK_ATTACK
	db 13, BITE
	db 17, CHARM
	db 17, HEADBUTT
	db 21, FLAME_WHEEL
	db 28, BODY_SLAM
	db 30, FIRE_SPIN
	db 33, FOCUS_ENERGY
	db 36, FLAMETHROWER
	db 45, FIRE_BLAST
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_LEVEL, 40, PORYGON2
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 9, AGILITY
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, SHARPEN
	db 32, THUNDER_WAVE
	db 36, TRI_ATTACK
	db 44, PSYCHIC_M
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 7, BITE
	db 12, WATER_GUN
	db 16, PROTECT
	db 25, ANCIENTPOWER
	db 30, BUBBLEBEAM
	db 35, ROCK_SLIDE
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 7, BITE
	db 12, WATER_GUN
	db 16, PROTECT
	db 25, ANCIENTPOWER
	db 30, BUBBLEBEAM
	db 35, ROCK_SLIDE
	db 40, HYDRO_PUMP
	db 40, SPIKE_CANNON
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 1, SAND_ATTACK
	db 5, BUBBLE
	db 15, ENDURE
	db 20, MEGA_DRAIN
	db 25, SWORDS_DANCE
	db 30, GIGA_DRAIN
	db 35, ROCK_SLIDE
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 1, SAND_ATTACK
	db 5, BUBBLE
	db 15, ENDURE
	db 20, MEGA_DRAIN
	db 25, SWORDS_DANCE
	db 30, GIGA_DRAIN
	db 35, ROCK_SLIDE
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 8, AGILITY
	db 10, BITE
	db 15, SUPERSONIC
	db 20, ANCIENTPOWER
	db 25, TAKE_DOWN
	db 35, ROCK_SLIDE
	db 40, SKY_ATTACK
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
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
	db 1, POWDER_SNOW
	db 1, AGILITY
	db 13, STEEL_WING
	db 25, REFLECT
	db 37, SKY_ATTACK
	db 49, ICE_BEAM
	db 61, MIND_READER
	db 73, BLIZZARD
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, THUNDERSHOCK
	db 13, DETECT
	db 25, AGILITY
	db 37, THUNDER_WAVE
	db 49, SKY_ATTACK
	db 61, LIGHT_SCREEN
	db 73, THUNDERBOLT
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 1, EMBER
	db 13, SAFEGUARD
	db 25, AGILITY
	db 37, MORNING_SUN
	db 49, FLAMETHROWER
	db 61, SUNNY_DAY
	db 70, SKY_ATTACK
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 36, AGILITY
	db 40, SAFEGUARD
	db 45, OUTRAGE
	db 50, HYPER_BEAM
	db 55, HYDRO_PUMP
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
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 36, AGILITY
	db 40, SAFEGUARD
	db 45, OUTRAGE
	db 50, HYPER_BEAM
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 1, TWISTER
	db 8, THUNDER_WAVE
	db 15, TWISTER
	db 22, DRAGON_RAGE
	db 29, SLAM
	db 36, AGILITY
	db 40, SAFEGUARD
	db 45, OUTRAGE
	db 50, HYPER_BEAM
	db 55, HYDRO_PUMP
	db 55, WING_ATTACK
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, SAFEGUARD
	db 11, BARRIER
	db 22, AMNESIA
	db 33, PSYCH_UP
	db 44, FUTURE_SIGHT
	db 55, MIST
	db 66, PSYCHIC_M
	db 77, SHADOW_BALL
	db 88, RECOVER
	db 99, THUNDERBOLT
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 10, TRANSFORM
	db 20, SOFTBOILED
	db 30, FLAMETHROWER
	db 40, PSYCHIC_M
	db 50, THUNDERBOLT
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 12, POISONPOWDER
	db 15, SLEEP_POWDER
	db 18, STUN_SPORE
	db 20, PETAL_DANCE
	db 22, SYNTHESIS
	db 25, BODY_SLAM
	db 30, LIGHT_SCREEN
	db 33, SAFEGUARD
	db 38, SOLARBEAM
	db 42, OUTRAGE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 12, POISONPOWDER
	db 15, SLEEP_POWDER
	db 18, STUN_SPORE
	db 20, PETAL_DANCE
	db 22, SYNTHESIS
	db 25, BODY_SLAM
	db 30, LIGHT_SCREEN
	db 33, SAFEGUARD
	db 38, SOLARBEAM
	db 42, OUTRAGE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 12, POISONPOWDER
	db 15, SLEEP_POWDER
	db 18, STUN_SPORE
	db 20, PETAL_DANCE
	db 22, SYNTHESIS
	db 25, BODY_SLAM
	db 30, LIGHT_SCREEN
	db 33, SAFEGUARD
	db 38, SOLARBEAM
	db 42, OUTRAGE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 9, EMBER
	db 13, QUICK_ATTACK
	db 18, ROCK_SMASH
	db 22, FLAME_WHEEL
	db 27, BODY_SLAM
	db 30, EXTREMESPEED
	db 33, FLAMETHROWER
	db 36, SUBMISSION
	db 40, FIRE_BLAST
	db 44, DOUBLE_EDGE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 9, EMBER
	db 13, QUICK_ATTACK
	db 18, ROCK_SMASH
	db 22, FLAME_WHEEL
	db 27, BODY_SLAM
	db 30, EXTREMESPEED
	db 33, FLAMETHROWER
	db 36, SUBMISSION
	db 40, FIRE_BLAST
	db 44, DOUBLE_EDGE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 9, EMBER
	db 13, QUICK_ATTACK
	db 18, ROCK_SMASH
	db 22, FLAME_WHEEL
	db 27, BODY_SLAM
	db 30, EXTREMESPEED
	db 33, FLAMETHROWER
	db 36, SUBMISSION
	db 40, FIRE_BLAST
	db 44, DOUBLE_EDGE
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, RAGE
	db 10, WATER_GUN
	db 14, BITE
	db 18, SCARY_FACE
	db 23, SLASH
	db 25, SCREECH
	db 30, CRUNCH
	db 36, RAZOR_WIND
	db 42, HYDRO_PUMP
	DB 50, OUTRAGE
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, RAGE
	db 10, WATER_GUN
	db 14, BITE
	db 18, SCARY_FACE
	db 23, SLASH
	db 25, SCREECH
	db 30, CRUNCH
	db 36, RAZOR_WIND
	db 42, HYDRO_PUMP
	DB 50, OUTRAGE
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 6, RAGE
	db 10, WATER_GUN
	db 14, BITE
	db 18, SCARY_FACE
	db 23, SLASH
	db 25, SCREECH
	db 30, CRUNCH
	db 36, RAZOR_WIND
	db 42, HYDRO_PUMP
	DB 50, OUTRAGE
	db 0 ; no more level-up moves

SentretEvosAttacks:
	db EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, DEFENSE_CURL
	db 11, QUICK_ATTACK
	db 17, PURSUIT
	db 25, BODY_SLAM
	db 29, SUBMISSION
	db 33, REST
	db 41, HYPER_BEAM
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 1, QUICK_ATTACK
	db 5, DEFENSE_CURL
	db 11, QUICK_ATTACK
	db 17, PURSUIT
	db 25, BODY_SLAM
	db 29, SUBMISSION
	db 33, REST
	db 41, HYPER_BEAM
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 7, PECK
	db 12, HYPNOSIS
	db 16, CONFUSION
	db 22, REFLECT
	db 28, FAINT_ATTACK
	db 32, PSYCHIC_M
	db 38, RAZOR_WIND
	db 42, DREAM_EATER
	db 46, SKY_ATTACK
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, PECK
	db 7, PECK
	db 12, HYPNOSIS
	db 16, CONFUSION
	db 22, REFLECT
	db 28, FAINT_ATTACK
	db 32, PSYCHIC_M
	db 38, RAZOR_WIND
	db 42, DREAM_EATER
	db 46, SKY_ATTACK
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 15, LEDIAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, CONFUSION
	db 8, SUPERSONIC
	db 15, PSYBEAM
	db 22, LIGHT_SCREEN
	db 22, REFLECT
	db 22, SAFEGUARD
	db 24, BATON_PASS
	db 27, AGILITY
	db 30, PSYCHIC_M
	db 35, CONFUSE_RAY
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, CONFUSION
	db 8, SUPERSONIC
	db 15, PSYBEAM
	db 22, LIGHT_SCREEN
	db 22, REFLECT
	db 22, SAFEGUARD
	db 24, BATON_PASS
	db 27, AGILITY
	db 30, PSYCHIC_M
	db 35, CONFUSE_RAY
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 18, ARIADOS
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 6, CONSTRICT
	db 11, NIGHT_SHADE
	db 13, LEECH_LIFE
	db 18, SPIDER_WEB
	db 25, SLUDGE_BOMB
	db 30, BODY_SLAM
	db 35, MEGAHORN
	db 40, PSYCHIC_M
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 6, CONSTRICT
	db 11, NIGHT_SHADE
	db 13, LEECH_LIFE
	db 18, SPIDER_WEB
	db 25, SLUDGE_BOMB
	db 30, BODY_SLAM
	db 35, MEGAHORN
	db 40, PSYCHIC_M
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 6, SUPERSONIC
	db 10, BITE
	db 16, WING_ATTACK
	db 19, CONFUSE_RAY
	db 24, SCREECH
	db 27, RAZOR_WIND
	db 32, SLUDGE_BOMB
	db 38, HAZE
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, THUNDER_WAVE
	db 1, SUPERSONIC
	db 1, FLAIL
	db 13, WATER_GUN
	db 18, SPARK
	db 22, LIGHT_SCREEN
	db 24, CONFUSE_RAY
	db 28, TAKE_DOWN
	db 34, THUNDERBOLT
	db 37, THUNDER
	db 41, HYDRO_PUMP
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDER_WAVE
	db 1, SUPERSONIC
	db 1, FLAIL
	db 13, WATER_GUN
	db 18, SPARK
	db 22, LIGHT_SCREEN
	db 24, CONFUSE_RAY
	db 28, TAKE_DOWN
	db 34, THUNDERBOLT
	db 37, THUNDER
	db 41, HYDRO_PUMP
	db 0 ; no more level-up moves

PichuEvosAttacks:
	db EVOLVE_LEVEL, 10, PIKACHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, CHARM
	db 6, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 10, SWEET_KISS
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	db EVOLVE_LEVEL, 10, CLEFAIRY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CHARM
	db 4, ENCORE
	db 8, SING
	db 10, SWEET_KISS
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	db EVOLVE_LEVEL, 10, JIGGLYPUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, CHARM
	db 4, DEFENSE_CURL
	db 9, POUND
	db 10, SWEET_KISS
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_LEVEL, 20, TOGETIC
	db 0 ; no more evolutions
	db 1, CHARM
	db 1, METRONOME
	db 5, POUND
	db 9, SWEET_KISS
	db 15, SOFTBOILED
	db 20, ENCORE
	db 23, RAZOR_WIND
	db 28, ANCIENTPOWER
	db 31, SAFEGUARD
	db 35, DOUBLE_EDGE
	db 40, PSYCHIC_M
	db 44, LOVELY_KISS
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	db 1, CHARM
	db 1, METRONOME
	db 5, POUND
	db 9, SWEET_KISS
	db 15, SOFTBOILED
	db 20, ENCORE
	db 23, RAZOR_WIND
	db 28, ANCIENTPOWER
	db 31, SAFEGUARD
	db 35, DOUBLE_EDGE
	db 40, PSYCHIC_M
	db 44, LOVELY_KISS
	db 50, HYPER_BEAM
	db 0 ; no more level-up moves

NatuEvosAttacks:
	db EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 7, CONFUSION
	db 10, NIGHT_SHADE
	db 15, PSYWAVE
	db 20, FUTURE_SIGHT
	db 25, DRILL_PECK
	db 25, PSYBEAM
	db 30, CONFUSE_RAY
	db 35, PSYCHIC_M
	db 40, SAFEGUARD
	db 44, SKY_ATTACK
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 7, CONFUSION
	db 10, NIGHT_SHADE
	db 15, PSYWAVE
	db 20, FUTURE_SIGHT
	db 25, DRILL_PECK
	db 25, PSYBEAM
	db 30, CONFUSE_RAY
	db 35, PSYCHIC_M
	db 40, SAFEGUARD
	db 44, SKY_ATTACK
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, THUNDERSHOCK
	db 16, THUNDER_WAVE
	db 20, COTTON_SPORE
	db 25, LIGHT_SCREEN
	db 25, REFLECT
	db 32, THUNDERBOLT
	db 38, THUNDER
	db 45, HEAL_BELL
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, THUNDERSHOCK
	db 16, THUNDER_WAVE
	db 20, COTTON_SPORE
	db 25, LIGHT_SCREEN
	db 25, REFLECT
	db 32, THUNDERBOLT
	db 38, THUNDER
	db 45, HEAL_BELL
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, THUNDERSHOCK
	db 16, THUNDER_WAVE
	db 20, COTTON_SPORE
	db 25, LIGHT_SCREEN
	db 25, REFLECT
	db 32, THUNDERBOLT
	db 38, THUNDER
	db 45, HEAL_BELL
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, SWEET_SCENT
	db 1, STUN_SPORE
	db 1, PETAL_DANCE
	db 55, SOLARBEAM
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SING
	db 1, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 18, BUBBLEBEAM
	db 22, ENCORE
	db 26, LIGHT_SCREEN
	db 28, DOUBLE_EDGE
	db 32, RAIN_DANCE
	db 36, SUBMISSION
	db 42, HYDRO_PUMP
	db 46, BELLY_DRUM
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SING
	db 1, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 18, BUBBLEBEAM
	db 22, ENCORE
	db 26, LIGHT_SCREEN
	db 28, DOUBLE_EDGE
	db 32, RAIN_DANCE
	db 36, SUBMISSION
	db 42, HYDRO_PUMP
	db 46, BELLY_DRUM
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, MIMIC
	db 1, ROCK_SMASH
	db 10, FLAIL
	db 13, LOW_KICK
	db 17, PETAL_DANCE
	db 23, ROCK_SLIDE
	db 27, BODY_SLAM
	db 32, FAINT_ATTACK
	db 36, SELFDESTRUCT
	db 40, SEISMIC_TOSS
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, PERISH_SONG
	db 40, PERISH_SONG
	db 40, SWAGGER
	db 45, PSYCHIC_M
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	db 1, SYNTHESIS
	db 1, ABSORB
	db 5, TACKLE
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, LEECH_SEED
	db 25, MEGA_DRAIN
	db 30, GIGA_DRAIN
	db 35, PETAL_DANCE
	db 40, RAZOR_WIND
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, SYNTHESIS
	db 1, ABSORB
	db 1, TACKLE
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, LEECH_SEED
	db 25, MEGA_DRAIN
	db 30, GIGA_DRAIN
	db 35, PETAL_DANCE
	db 40, RAZOR_WIND
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SYNTHESIS
	db 1, ABSORB
	db 1, TACKLE
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, LEECH_SEED
	db 25, MEGA_DRAIN
	db 30, GIGA_DRAIN
	db 35, PETAL_DANCE
	db 40, RAZOR_WIND
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 6, SAND_ATTACK
	db 12, BATON_PASS
	db 19, PURSUIT
	db 23, HEADBUTT
	db 26, AGILITY
	db 31, DOUBLE_EDGE
	db 34, BEAT_UP
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 7, MEGA_DRAIN
	db 12, SUNNY_DAY
	db 19, SYNTHESIS
	db 24, GIGA_DRAIN
	db 27, PETAL_DANCE
	db 30, SOLARBEAM
	db 30, RAZOR_LEAF
	db 34, LEECH_SEED
	db 40, ENCORE
	db 45, SWORDS_DANCE
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWTH
	db 7, MEGA_DRAIN
	db 12, SUNNY_DAY
	db 19, SYNTHESIS
	db 24, GIGA_DRAIN
	db 27, PETAL_DANCE
	db 30, SOLARBEAM
	db 30, RAZOR_LEAF
	db 34, LEECH_SEED
	db 40, ENCORE
	db 45, SWORDS_DANCE
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, FORESIGHT
	db 1, QUICK_ATTACK
	db 8, DOUBLE_TEAM
	db 13, SONICBOOM
	db 19, DETECT
	db 24, RAZOR_WIND
	db 29, CONFUSE_RAY
	db 32, REVERSAL
	db 35, ANCIENTPOWER
	db 40, PSYCHIC_M
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 8, SLAM
	db 14, AMNESIA
	db 18, MIST
	db 18, HAZE
	db 22, DIG
	db 26, BODY_SLAM
	db 30, EARTHQUAKE
	db 36, RAIN_DANCE
	db 40, RECOVER
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 8, SLAM
	db 14, AMNESIA
	db 18, MIST
	db 18, HAZE
	db 22, DIG
	db 26, BODY_SLAM
	db 30, EARTHQUAKE
	db 36, RAIN_DANCE
	db 40, RECOVER
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, SAND_ATTACK
	db 7, QUICK_ATTACK
	db 13, BITE
	db 17, CHARM
	db 17, HEADBUTT
	db 21, CONFUSION
	db 25, SWIFT
	db 28, PSYWAVE
	db 30, PSYBEAM
	db 33, DETECT
	db 36, PSYCHIC_M
	db 45, MORNING_SUN
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 1, SAND_ATTACK
	db 7, QUICK_ATTACK
	db 13, BITE
	db 17, CHARM
	db 17, HEADBUTT
	db 21, CONFUSE_RAY
	db 25, SWIFT
	db 28, THIEF
	db 30, FAINT_ATTACK
	db 33, PROTECT
	db 36, CRUNCH
	db 45, MOONLIGHT
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, PURSUIT
	db 11, HAZE
	db 15, NIGHT_SHADE
	db 18, FAINT_ATTACK
	db 21, WING_ATTACK
	db 24, BEAT_UP
	db 31, MEAN_LOOK
	db 37, SKY_ATTACK
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 15, WATER_GUN
	db 20, CONFUSION
	db 25, DISABLE
	db 34, BODY_SLAM
	db 37, THUNDER_WAVE
	db 37, SWAGGER
	db 40, PSYCHIC_M
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, PSYWAVE
	db 1, SPITE
	db 1, HYPNOSIS
	db 7, CONFUSE_RAY
	db 14, CONFUSION
	db 18, MEAN_LOOK
	db 18, NIGHT_SHADE
	db 21, PSYBEAM
	db 24, PAIN_SPLIT
	db 28, PERISH_SONG
	db 32, PSYCHIC_M
	db 36, SHADOW_BALL
	db 42, DESTINY_BOND
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, HIDDEN_POWER
	db 4, CONFUSION
	db 10, SWIFT
	db 14, ANCIENTPOWER
	db 18, PSYBEAM
	db 30, PSYCHIC_M
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	db 1, COUNTER
	db 1, MIRROR_COAT
	db 1, SAFEGUARD
	db 1, DESTINY_BOND
	db 50, ENCORE
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 7, CONFUSION
	db 13, STOMP
	db 17, AGILITY
	db 23, BATON_PASS
	db 26, PSYBEAM
	db 30, FUTURE_SIGHT
	db 32, CRUNCH
	db 36, PSYCHIC_M
	db 42, DOUBLE_EDGE
	db 0 ; no more level-up moves

PinecoEvosAttacks:
	db EVOLVE_LEVEL, 31, FORRETRESS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, ROLLOUT
	db 8, SELFDESTRUCT
	db 12, TAKE_DOWN
	db 14, PIN_MISSILE
	db 16, RAPID_SPIN
	db 20, SPIKES
	db 26, EXPLOSION
	db 32, DOUBLE_EDGE
	db 36, PROTECT
	db 40, AMNESIA
	db 40, SUBSTITUTE
	db 45, COUNTER
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, ROLLOUT
	db 8, SELFDESTRUCT
	db 12, TAKE_DOWN
	db 14, PIN_MISSILE
	db 16, RAPID_SPIN
	db 20, SPIKES
	db 26, EXPLOSION
	db 32, DOUBLE_EDGE
	db 36, PROTECT
	db 40, AMNESIA
	db 40, SUBSTITUTE
	db 45, COUNTER
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 5, DEFENSE_CURL
	db 13, GLARE
	db 16, BITE
	db 26, ROLLOUT
	db 30, CRUNCH
	db 35, BODY_SLAM
	db 40, CURSE
	db 45, HYPER_BEAM
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, SAND_ATTACK
	db 1, HARDEN
	db 5, QUICK_ATTACK
	db 10, MUD_SLAP
	db 15, WING_ATTACK
	db 21, FAINT_ATTACK
	db 26, SLASH
	db 30, MAGNITUDE
	db 32, RAZOR_WIND
	db 34, SCREECH
	db 38, EARTHQUAKE
	db 45, GUILLOTINE
	db 45, FISSURE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, RAGE
	db 1, SCREECH
	db 5, BIND
	db 10, ROCK_THROW
	db 16, MAGNITUDE
	db 22, SANDSTORM
	db 26, SLAM
	db 30, EARTHQUAKE
	db 35, ROCK_SLIDE
	db 40, IRON_TAIL
	db 45, CRUNCH
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCARY_FACE
	db 1, TAIL_WHIP
	db 1, LICK
	db 8, CHARM
	db 11, BITE
	db 15, RAGE
	db 20, ROAR
	db 24, BODY_SLAM
	db 28, LOVELY_KISS
	db 30, CRUNCH
	db 36, DOUBLE_EDGE
	db 40, HEAL_BELL
	db 45, OUTRAGE
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCARY_FACE
	db 1, TAIL_WHIP
	db 1, LICK
	db 8, CHARM
	db 11, BITE
	db 15, RAGE
	db 20, ROAR
	db 24, BODY_SLAM
	db 28, LOVELY_KISS
	db 30, CRUNCH
	db 36, DOUBLE_EDGE
	db 40, HEAL_BELL
	db 45, OUTRAGE
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, TACKLE
	db 1, POISON_STING
	db 7, WATER_GUN
	db 10, MINIMIZE
	db 14, PIN_MISSILE
	db 17, ROLLOUT
	db 20, BUBBLEBEAM
	db 25, THUNDER_WAVE
	db 30, TAKE_DOWN
	db 30, CRUNCH
	db 35, SLUDGE_BOMB
	db 46, HYDRO_PUMP
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, WING_ATTACK
	db 18, FALSE_SWIPE
	db 24, AGILITY
	db 27, RAZOR_WIND
	db 30, SLASH
	db 36, SWORDS_DANCE
	db 40, METAL_CLAW
	db 40, DOUBLE_TEAM
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 1, WRAP
	db 9, ENCORE
	db 14, BIDE
	db 17, ANCIENTPOWER
	db 20, SAFEGUARD
	db 25, SANDSTORM
	db 30, REST
	db 30, SLEEP_TALK
	db 38, TOXIC
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, HORN_ATTACK
	db 12, ENDURE
	db 15, KARATE_CHOP
	db 19, FURY_ATTACK
	DB 23, SEISMIC_TOSS
	db 27, COUNTER
	db 29, SUBMISSION
	db 35, TAKE_DOWN
	db 39, REVERSAL
	db 44, BODY_SLAM
	db 48, MEGAHORN
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 7, QUICK_ATTACK
	db 12, SCREECH
	db 17, FAINT_ATTACK
	db 23, AGILITY
	db 28, SLASH
	db 32, ICE_BEAM
	db 36, METAL_CLAW
	db 40, SUBMISSION
	db 44, CRUNCH
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 5, LICK
	db 10, FURY_SWIPES
	db 16, FAINT_ATTACK
	db 22, REST
	db 28, SLASH
	db 35, BODY_SLAM
	db 40, SLEEP_TALK
	db 40, THRASH
	db 43, CRUNCH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
		db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 5, LICK
	db 10, FURY_SWIPES
	db 16, FAINT_ATTACK
	db 22, REST
	db 28, SLASH
	db 35, BODY_SLAM
	db 40, SLEEP_TALK
	db 40, THRASH
	db 43, CRUNCH
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGCARGO
	db 0 ; no more evolutions
	db 1, SMOG
	db 5, EMBER
	db 12, ROCK_THROW
	db 20, ACID_ARMOR
	db 25, AMNESIA
	db 30, FLAMETHROWER
	db 38, ROCK_SLIDE
	db 42, BODY_SLAM
	db 46, RECOVER
	db 50, EXPLOSION
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, EMBER
	db 1, ROCK_THROW
	db 5, EMBER
	db 12, ROCK_THROW
	db 20, ACID_ARMOR
	db 25, AMNESIA
	db 30, FLAMETHROWER
	db 38, ROCK_SLIDE
	db 42, BODY_SLAM
	db 46, RECOVER
	db 50, EXPLOSION
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, POWDER_SNOW
	db 1, ENDURE
	db 10, POWDER_SNOW
	db 10, ENDURE
	db 16, TAKE_DOWN
	db 22, FURY_ATTACK
	db 25, MIST
	db 30, BLIZZARD
	db 35, AMNESIA
	db 40, EARTHQUAKE
	db 45, ICE_BEAM
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, POWDER_SNOW
	db 1, ENDURE
	db 10, POWDER_SNOW
	db 10, ENDURE
	db 16, TAKE_DOWN
	db 22, FURY_ATTACK
	db 25, MIST
	db 30, BLIZZARD
	db 35, AMNESIA
	db 40, EARTHQUAKE
	db 45, ICE_BEAM
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 5, BUBBLE
	db 13, SPIKE_CANNON
	db 19, RECOVER
	db 22, BUBBLEBEAM
	db 26, MIRROR_COAT
	db 30, ANCIENTPOWER
	db 30, CONFUSE_RAY
	db 34, MIRROR_COAT
	db 38, LIGHT_SCREEN
	db 38, REFLECT
	db 42, ROCK_SLIDE
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	db EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 12, PSYBEAM
	db 18, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 26, FOCUS_ENERGY
	db 32, ICE_BEAM
	db 40, HYPER_BEAM
	db 44, HYDRO_PUMP
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 12, PSYBEAM
	db 18, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 26, FOCUS_ENERGY
	db 32, ICE_BEAM
	db 40, HYPER_BEAM
	db 44, HYDRO_PUMP
	db 50, PSYCHIC_M
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	db 1, PRESENT
	db 1, PAY_DAY
	db 1, PECK
	db 7, TACKLE
	db 13, AURORA_BEAM
	db 18, THIEF
	db 24, RAZOR_WIND
	db 30, BLIZZARD
	db 35, SKY_ATTACK
	db 40, ICE_BEAM
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, BUBBLE
	db 1, GUST
	db 7, SUPERSONIC
	db 10, HAZE
	db 13, BUBBLEBEAM
	db 17, TAKE_DOWN
	db 22, AGILITY
	db 26, WING_ATTACK
	db 31, CONFUSE_RAY
	db 33, MIRROR_COAT
	db 35, RAZOR_WIND
	db 40, HYDRO_PUMP
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 1, SAND_ATTACK
	db 10, SWIFT
	db 15, AGILITY
	db 20, DRILL_PECK
	db 25, STEEL_WING
	db 30, SPIKES
	db 35, SKY_ATTACK
	db 40, TOXIC
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 1, RAGE
	db 5, ROAR
	db 9, SMOG
	db 13, BITE
	db 17, PURSUIT
	db 21, FIRE_SPIN
	db 24, FAINT_ATTACK
	db 32, FLAMETHROWER
	db 37, CRUNCH
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 1, RAGE
	db 5, ROAR
	db 9, SMOG
	db 13, BITE
	db 17, PURSUIT
	db 21, FIRE_SPIN
	db 24, FAINT_ATTACK
	db 32, FLAMETHROWER
	db 37, CRUNCH
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, SMOKESCREEN
	db 1, LEER
	db 10, WATER_GUN
	db 14, AURORA_BEAM
	db 17, BUBBLEBEAM
	db 23, TWISTER
	db 23, DRAGON_RAGE
	db 28, AGILITY
	db 32, DRAGONBREATH
	db 40, HYDRO_PUMP
	db 50, OUTRAGE
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 13, MAGNITUDE
	db 20, FLAIL
	db 25, TAKE_DOWN
	db 30, ANCIENTPOWER
	db 33, ROLLOUT
	db 36, ENDURE
	db 40, EARTHQUAKE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 13, MAGNITUDE
	db 20, FLAIL
	db 25, FURY_ATTACK
	db 30, ANCIENTPOWER
	db 33, DOUBLE_EDGE
	db 36, RAPID_SPIN
	db 40, EARTHQUAKE
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 9, AGILITY
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, DEFENSE_CURL
	db 32, THUNDER_WAVE
	db 36, TRI_ATTACK
	db 44, PSYCHIC_M
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 5, SAND_ATTACK
	db 8, HYPNOSIS
	db 15, STOMP
	db 19, CONFUSE_RAY
	db 24, BITE
	db 30, TAKE_DOWN
	db 34, CRUNCH
	db 40, PSYCHIC_M
	db 46, MEGAHORN
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKETCH
	db 11, SKETCH
	db 21, SKETCH
	db 31, SKETCH
	db 41, SKETCH
	db 51, SKETCH
	db 61, SKETCH
	db 71, SKETCH
	db 81, SKETCH
	db 91, SKETCH
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	db EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	db EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	db EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, RAGE
	db 5, ROCK_SMASH
	db 10, DIZZY_PUNCH
	db 15, MACH_PUNCH
	db 20, MEGA_KICK
	db 20, MEGA_PUNCH
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROLLING_KICK
	db 1, DETECT
	db 7, FOCUS_ENERGY
	db 13, PURSUIT
	db 20, QUICK_ATTACK
	db 20, ROLLING_KICK
	db 20, RAPID_SPIN
	db 26, HI_JUMP_KICK
	db 30, COUNTER
	db 34, AGILITY
	db 40, TRIPLE_KICK
	db 45, REVERSAL
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	db EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 1, SWEET_KISS
	db 7, POWDER_SNOW
	db 13, CONFUSION
	db 18, LOVELY_KISS
	db 22, PETAL_DANCE
	db 25, MEAN_LOOK
	db 30, ICE_PUNCH
	db 33, PERISH_SONG
	db 37, PSYCHIC_M
	db 42, BLIZZARD
	db 45, ICE_BEAM
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 5, THUNDERPUNCH
	db 10, LIGHT_SCREEN
	db 14, SWIFT
	db 16, SCREECH
	db 20, KARATE_CHOP
	db 24, THUNDER_WAVE
	db 30, SUBMISSION
	db 30, BODY_SLAM
	db 36, CROSS_CHOP
	db 42, THUNDER
	db 45, THUNDERBOLT
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 7, SMOG
	db 10, FIRE_PUNCH
	db 14, SMOKESCREEN
	db 20, SUNNY_DAY
	db 24, BODY_SLAM
	db 30, CROSS_CHOP
	db 30, CONFUSE_RAY
	db 37, PSYCHIC_M
	db 42, FLAMETHROWER
	db 45, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 8, DEFENSE_CURL
	db 13, STOMP
	db 16, MILK_DRINK
	db 23, BIDE
	db 28, ROLLOUT
	db 33, BODY_SLAM
	db 36, MEGA_KICK
	db 40, HEAL_BELL
	db 45, REVERSAL
	db 48, SEISMIC_TOSS
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 13, SOFTBOILED
	db 17, DOUBLESLAP
	db 23, MINIMIZE
	db 26, SING
	db 30, EGG_BOMB
	db 35, HEAL_BELL
	db 40, LIGHT_SCREEN
	db 40, REFLECT
	db 46, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 10, THUNDERSHOCK
	db 20, ROAR
	db 30, QUICK_ATTACK
	db 40, THUNDERBOLT
	db 50, REFLECT
	db 60, CRUNCH
	db 70, THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 10, EMBER
	db 20, ROAR
	db 30, FIRE_SPIN
	db 40, EXTREMESPEED
	db 50, FLAMETHROWER
	db 60, SHADOW_BALL
	db 70, SACRED_FIRE
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, BUBBLEBEAM
	db 1, GUST
	db 1, AURORA_BEAM
	db 15, MIST
	db 60, RAIN_DANCE
	db 60, MIRROR_COAT
	db 60, HYDRO_PUMP
	db 60, BLIZZARD
	db 70, REST
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, SCREECH
	db 5, SANDSTORM
	db 9, ROCK_THROW
	db 16, ROCK_SLIDE
	db 20, THRASH
	db 26, BODY_SLAM
	db 30, CRUNCH
	db 40, EARTHQUAKE
	db 45, HYPER_BEAM
	db 50, OUTRAGE
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, SCREECH
	db 5, SANDSTORM
	db 9, ROCK_THROW
	db 16, ROCK_SLIDE
	db 20, THRASH
	db 26, BODY_SLAM
	db 30, CRUNCH
	db 40, EARTHQUAKE
	db 45, HYPER_BEAM
	db 50, OUTRAGE
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, SCREECH
	db 5, SANDSTORM
	db 9, ROCK_THROW
	db 16, ROCK_SLIDE
	db 20, THRASH
	db 26, BODY_SLAM
	db 30, CRUNCH
	db 40, EARTHQUAKE
	db 45, HYPER_BEAM
	db 50, OUTRAGE
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, AEROBLAST
	db 11, SAFEGUARD
	db 22, GUST
	db 33, FUTURE_SIGHT
	db 44, SWIFT
	db 55, RAIN_DANCE
	db 66, HYDRO_PUMP
	db 77, AEROBLAST
	db 80, PSYCHIC_M
	db 85, RECOVER
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, SACRED_FIRE
	db 11, SAFEGUARD
	db 22, GUST
	db 33, FUTURE_SIGHT
	db 44, FIRE_BLAST
	db 55, SUNNY_DAY
	db 66, SACRED_FIRE
	db 77, THUNDERBOLT
	db 80, PSYCHIC_M
	db 85, RECOVER
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, CONFUSION
	db 1, BATON_PASS
	db 1, HEAL_BELL
	db 10, SAFEGUARD
	db 20, RECOVER
	db 30, PSYCHIC_M
	db 40, ANCIENTPOWER
	db 50, GIGA_DRAIN
	db 75, PERISH_SONG
	db 0 ; no more level-up moves








































