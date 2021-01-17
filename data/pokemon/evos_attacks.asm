INCLUDE "constants.asm"


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
	db 1, TACKLE
	db 1, GROWL
	db 4, SMOG
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 16, ACID
	db 20, RAZOR_LEAF
	db 24, HEADBUTT
	db 27, GROWTH
	db 27, GIGA_DRAIN
	db 31, SYNTHESIS
	db 36, TOXIC
	db 42, SLUDGE_BOMB
	db 48, SOLARBEAM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, SMOG
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 16, ACID
	db 22, RAZOR_LEAF
	db 26, HEADBUTT
	db 29, GROWTH
	db 29, GIGA_DRAIN
	db 33, SYNTHESIS
	db 38, TOXIC
	db 44, SLUDGE_BOMB
	db 50, SOLARBEAM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 4, SMOG
	db 7, LEECH_SEED
	db 10, VINE_WHIP
	db 13, POISONPOWDER
	db 13, SLEEP_POWDER
	db 16, ACID
	db 23, RAZOR_LEAF
	db 26, HEADBUTT
	db 29, GROWTH
	db 29, GIGA_DRAIN
	db 35, SYNTHESIS
	db 40, TOXIC
	db 46, SLUDGE_BOMB
	db 52, SOLARBEAM
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 4, FIRE_SPIN
	db 7, SMOKESCREEN
	db 10, EMBER
	db 13, GLARE
	db 16, METAL_CLAW
	db 20, DRAGONBREATH
	db 24, FIRE_PUNCH
	db 27, SUNNY_DAY
	db 31, SLASH
	db 36, FLAMETHROWER
	db 42, OUTRAGE
	db 48, FIRE_BLAST
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 4, FIRE_SPIN
	db 7, SMOKESCREEN
	db 10, EMBER
	db 13, GLARE
	db 16, METAL_CLAW
	db 22, DRAGONBREATH
	db 26, FIRE_PUNCH
	db 29, SUNNY_DAY
	db 33, SLASH
	db 38, FLAMETHROWER
	db 44, OUTRAGE
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 4, FIRE_SPIN
	db 7, SMOKESCREEN
	db 10, EMBER
	db 13, GLARE
	db 16, METAL_CLAW
	db 22, DRAGONBREATH
	db 26, FIRE_PUNCH
	db 29, SUNNY_DAY
	db 33, SLASH
	db 38, WING_ATTACK
	db 40, FLAMETHROWER
	db 46, OUTRAGE
	db 52, FIRE_BLAST
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WITHDRAW
	db 4, BUBBLE
	db 7, HAZE
	db 10, WATER_GUN
	db 13, RAPID_SPIN
	db 16, PROTECT
	db 20, BITE
	db 24, BUBBLEBEAM
	db 27, CRUNCH
	db 31, ICE_BEAM
	db 36, RAIN_DANCE
	db 42, SKULL_BASH
	db 48, HYDRO_PUMP
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WITHDRAW
	db 4, BUBBLE
	db 7, HAZE
	db 10, WATER_GUN
	db 13, RAPID_SPIN
	db 16, PROTECT
	db 22, BITE
	db 26, BUBBLEBEAM
	db 29, CRUNCH
	db 33, ICE_BEAM
	db 38, RAIN_DANCE
	db 44, SKULL_BASH
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WITHDRAW
	db 4, BUBBLE
	db 7, HAZE
	db 10, WATER_GUN
	db 13, RAPID_SPIN
	db 16, PROTECT
	db 22, BITE
	db 26, BUBBLEBEAM
	db 29, CRUNCH
	db 33, ICE_BEAM
	db 40, RAIN_DANCE
	db 46, SKULL_BASH
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 10, ABSORB
	db 15, FURY_CUTTER
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 1, HARDEN
	db 7, HARDEN
	db 13, ABSORB
	db 17, FURY_CUTTER
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, STRING_SHOT
	db 1, CONFUSION
	db 10, CONFUSION
	db 13, STUN_SPORE
	db 18, GUST
	db 23, LEECH_LIFE
	db 28, PSYBEAM
	db 34, WING_ATTACK
	db 38, MOONLIGHT
	db 42, SPORE
	db 46, DREAM_EATER
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 10, ABSORB
	db 15, FURY_CUTTER
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 1, HARDEN
	db 7, HARDEN
	db 13, ABSORB
	db 17, FURY_CUTTER
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 10, FURY_ATTACK
	db 13, FOCUS_ENERGY
	db 18, TWINEEDLE
	db 23, SLUDGE
	db 28, RAGE
	db 34, SWORDS_DANCE
	db 38, PIN_MISSILE
	db 42, PAIN_SPLIT
	db 46, SLUDGE_BOMB
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, SCRATCH 
	db 3, SAND_ATTACK
	db 5, GUST
	db 9, WHIRLWIND
	db 13, SING
	db 17, PURSUIT
	db 21, WING_ATTACK
	db 26, STEEL_WING
	db 30, AGILITY
	db 35, PERISH_SONG
	db 39, TAKE_DOWN
	db 43, MIRROR_MOVE
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, SCRATCH 
	db 3, SAND_ATTACK
	db 5, GUST
	db 9, WHIRLWIND
	db 13, SING
	db 17, PURSUIT
	db 23, WING_ATTACK
	db 28, STEEL_WING
	db 32, AGILITY
	db 37, PERISH_SONG
	db 41, TAKE_DOWN
	db 45, MIRROR_MOVE
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH 
	db 3, SAND_ATTACK
	db 5, GUST
	db 9, WHIRLWIND
	db 13, SING
	db 17, PURSUIT
	db 23, WING_ATTACK
	db 28, STEEL_WING
	db 32, AGILITY
	db 39, PERISH_SONG
	db 43, TAKE_DOWN
	db 47, MIRROR_MOVE
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, QUICK_ATTACK
	db 9, FOCUS_ENERGY
	db 13, BITE
	db 18, HYPER_FANG
	db 22, SWAGGER
	db 27, CRUNCH
	db 30, AGILITY
	db 34, PSYCH_UP
	db 39, DOUBLE_EDGE
	db 41, SUPER_FANG
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 5, QUICK_ATTACK
	db 9, FOCUS_ENERGY
	db 13, BITE
	db 18, HYPER_FANG
	db 24, SWAGGER
	db 29, CRUNCH
	db 32, AGILITY
	db 36, PSYCH_UP
	db 41, DOUBLE_EDGE
	db 43, SUPER_FANG
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, PECK
	db 3, GROWL
	db 5, FALSE_SWIPE
	db 9, LEER
	db 13, QUICK_ATTACK
	db 17, WING_ATTACK
	db 21, SCREECH
	db 26, STEEL_WING
	db 30, DRILL_PECK
	db 35, MEAN_LOOK
	db 39, TWISTER
	db 43, MIRROR_MOVE
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 3, GROWL
	db 5, FALSE_SWIPE
	db 9, LEER
	db 13, QUICK_ATTACK
	db 17, WING_ATTACK
	db 23, SCREECH
	db 28, STEEL_WING
	db 32, DRILL_PECK
	db 37, MEAN_LOOK
	db 41, TWISTER
	db 45, MIRROR_MOVE
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 5, POISON_STING
	db 8, MEAN_LOOK
	db 14, BITE
	db 17, GLARE
	db 22, SLUDGE
	db 26, SCREECH
	db 30, CRUNCH
	db 34, SLUDGE_BOMB
	db 38, SUPER_FANG
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 5, POISON_STING
	db 8, MEAN_LOOK
	db 14, BITE
	db 17, GLARE
	db 22, SLUDGE
	db 28, SCREECH
	db 32, CRUNCH
	db 36, SLUDGE_BOMB
	db 40, SUPER_FANG
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 3, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 9, THUNDER_WAVE
	db 12, SWIFT
	db 15, DOUBLE_TEAM
	db 19, SPARK
	db 23, LIGHT_SCREEN
	db 23, REFLECT
	db 26, SLAM
	db 30, THUNDERBOLT
	db 35, AGILITY
	db 41, EXTREMESPEED
	db 47, THUNDER
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERBOLT
	db 1, SWIFT
	db 1, DOUBLE_TEAM
	db 1, AGILITY
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 5, MUD_SLAP
	db 8, FURY_SWIPES
	db 14, DIG
	db 17, ROLLOUT
	db 22, METAL_CLAW
	db 26, SLASH
	db 30, EARTHQUAKE
	db 34, SANDSTORM
	db 38, FISSURE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 5, MUD_SLAP
	db 8, FURY_SWIPES
	db 14, DIG
	db 17, ROLLOUT
	db 22, METAL_CLAW
	db 28, SLASH
	db 32, EARTHQUAKE
	db 36, SANDSTORM
	db 40, FISSURE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 3, GROWL
	db 7, SCRATCH
	db 9, MEAN_LOOK
	db 12, ACID
	db 15, ENDURE
	db 19, SLUDGE
	db 23, MAGNITUDE
	db 26, SLAM
	db 30, ROAR
	db 35, PAIN_SPLIT
	db 41, EARTHQUAKE
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 3, GROWL
	db 7, SCRATCH
	db 9, MEAN_LOOK
	db 12, ACID
	db 15, ENDURE
	db 21, SLUDGE
	db 25, MAGNITUDE
	db 28, SLAM
	db 32, ROAR
	db 37, PAIN_SPLIT
	db 43, EARTHQUAKE
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, MAGNITUDE
	db 1, SLUDGE
	db 1, ROAR
	db 1, ENDURE
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 3, LEER
	db 7, SCRATCH
	db 9, ACID
	db 12, DOUBLE_KICK
	db 15, HORN_ATTACK
	db 19, SCARY_FACE
	db 23, SLUDGE
	db 26, IRON_TAIL
	db 30, EARTHQUAKE
	db 35, SLUDGE_BOMB
	db 41, HORN_DRILL
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 3, LEER
	db 7, SCRATCH
	db 9, ACID
	db 12, DOUBLE_KICK
	db 15, HORN_ATTACK
	db 21, SCARY_FACE
	db 25, SLUDGE
	db 28, IRON_TAIL
	db 32, EARTHQUAKE
	db 37, SLUDGE_BOMB
	db 43, HORN_DRILL
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, SLUDGE
	db 1, HORN_ATTACK
	db 1, IRON_TAIL
	db 1, SCARY_FACE
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, POUND
	db 3, GROWL
	db 7, DOUBLESLAP
	db 9, LOVELY_KISS
	db 12, CONFUSION
	db 15, DEFENSE_CURL
	db 19, PSYWAVE
	db 23, METRONOME
	db 26, MOONLIGHT
	db 30, PROTECT
	db 35, BODY_SLAM
	db 41, HEAL_BELL
	db 47, DREAM_EATER
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, DOUBLESLAP
	db 1, METRONOME
	db 1, MOONLIGHT
	db 1, BODY_SLAM
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, LICK
	db 1, TAIL_WHIP
	db 5, GROWL
	db 8, EMBER
	db 14, SMOKESCREEN
	db 17, FIRE_SPIN
	db 22, NIGHT_SHADE
	db 26, FLAME_WHEEL
	db 29, CONFUSE_RAY
	db 32, SHADOW_BALL
	db 36, FLAMETHROWER
	db 40, SPITE
	db 42, DESTINY_BOND
	db 45, FIRE_BLAST
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SHADE
	db 1, FLAMETHROWER
	db 1, CONFUSE_RAY
	db 1, SMOKESCREEN
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, POUND
	db 3, DEFENSE_CURL
	db 7, BEAT_UP
	db 9, SING
	db 12, DOUBLESLAP
	db 15, SONICBOOM
	db 19, REST
	db 19, SLEEP_TALK
	db 23, SWEET_KISS
	db 26, DIZZY_PUNCH
	db 30, MEGA_PUNCH
	db 35, BODY_SLAM
	db 41, PERISH_SONG
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, DIZZY_PUNCH
	db 1, SING
	db 1, REST
	db 1, SLEEP_TALK
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, SMOG
	db 3, SUPERSONIC
	db 7, GUST
	db 9, BITE
	db 12, LEECH_LIFE
	db 15, SCARY_FACE
	db 19, SLUDGE
	db 23, WING_ATTACK
	db 26, SCREECH
	db 30, CRUNCH
	db 35, CONFUSE_RAY
	db 41, SLUDGE_BOMB
	db 47, TOXIC
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	db 1, SMOG
	db 3, SUPERSONIC
	db 7, GUST
	db 9, BITE
	db 12, LEECH_LIFE
	db 15, SCARY_FACE
	db 19, SLUDGE
	db 25, WING_ATTACK
	db 28, SCREECH
	db 32, CRUNCH
	db 37, CONFUSE_RAY
	db 43, SLUDGE_BOMB
	db 49, TOXIC
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 3, SMOG
	db 7, SWEET_SCENT
	db 9, ACID
	db 12, POISONPOWDER
	db 12, SLEEP_POWDER
	db 12, STUN_SPORE
	db 15, SWIFT
	db 19, MEGA_DRAIN
	db 23, MOONLIGHT
	db 26, SLUDGE
	db 30, GIGA_DRAIN
	db 35, SLUDGE_BOMB
	db 41, SOLARBEAM
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	db 1, ABSORB
	db 3, SMOG
	db 7, SWEET_SCENT
	db 9, ACID
	db 12, POISONPOWDER
	db 12, SLEEP_POWDER
	db 12, STUN_SPORE
	db 15, SWIFT
	db 19, MEGA_DRAIN
	db 25, MOONLIGHT
	db 28, SLUDGE
	db 32, GIGA_DRAIN
	db 37, SLUDGE_BOMB
	db 43, SOLARBEAM
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, MEGA_DRAIN
	db 1, MOONLIGHT
	db 1, SLUDGE
	db 1, PETAL_DANCE
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, ABSORB
	db 5, POISON_STING
	db 8, COTTON_SPORE
	db 14, FURY_CUTTER
	db 17, SLEEP_POWDER
	db 17, POISONPOWDER
	db 22, MEGA_DRAIN
	db 26, SLASH
	db 29, MOONLIGHT
	db 32, TWINEEDLE
	db 36, SWORDS_DANCE
	db 40, SPORE
	db 42, SLUDGE_BOMB
	db 45, GIGA_DRAIN
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, ABSORB
	db 5, POISON_STING
	db 8, COTTON_SPORE
	db 14, FURY_CUTTER
	db 17, SLEEP_POWDER
	db 17, POISONPOWDER
	db 22, MEGA_DRAIN
	db 28, SLASH
	db 31, MOONLIGHT
	db 34, TWINEEDLE
	db 38, SWORDS_DANCE
	db 42, SPORE
	db 44, SLUDGE_BOMB
	db 47, GIGA_DRAIN
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 6, LEER
	db 10, PSYWAVE
	db 15, LEECH_LIFE
	db 19, ACID
	db 23, CONFUSION
	db 29, SLUDGE
	db 32, CONFUSE_RAY
	db 35, SLEEP_POWDER
	db 35, POISONPOWDER
	db 38, PSYCHIC_M
	db 41, SLUDGE_BOMB
	db 45, MORNING_SUN
	db 47, DREAM_EATER
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DISABLE
	db 6, LEER
	db 10, PSYWAVE
	db 15, LEECH_LIFE
	db 19, ACID
	db 23, CONFUSION
	db 29, SLUDGE
	db 33, CONFUSE_RAY
	db 37, SLEEP_POWDER
	db 37, POISONPOWDER
	db 40, PSYCHIC_M
	db 43, SLUDGE_BOMB
	db 47, MORNING_SUN
	db 49, DREAM_EATER
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 1, SAND_ATTACK
	db 5, SCRATCH
	db 8, MAGNITUDE
	db 14, FURY_SWIPES
	db 17, FAINT_ATTACK
	db 22, DIG
	db 26, SLASH
	db 29, FOCUS_ENERGY
	db 32, ANCIENTPOWER
	db 36, EARTHQUAKE
	db 40, SCREECH
	db 42, SANDSTORM
	db 45, FISSURE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, MUD_SLAP
	db 1, SAND_ATTACK
	db 5, SCRATCH
	db 8, MAGNITUDE
	db 14, FURY_SWIPES
	db 17, FAINT_ATTACK
	db 22, DIG
	db 26, SLASH
	db 31, FOCUS_ENERGY
	db 34, ANCIENTPOWER
	db 38, EARTHQUAKE
	db 42, SCREECH
	db 44, SANDSTORM
	db 47, FISSURE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 5, GROWL
	db 8, FURY_SWIPES
	db 14, PAY_DAY
	db 17, BITE
	db 22, SCREECH
	db 26, METAL_CLAW
	db 29, SLASH
	db 32, FOCUS_ENERGY
	db 36, AGILITY
	db 40, CRUNCH
	db 42, DOUBLE_EDGE
	db 45, SUPER_FANG
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 5, GROWL
	db 8, FURY_SWIPES
	db 14, PAY_DAY
	db 17, BITE
	db 22, SCREECH
	db 26, METAL_CLAW
	db 31, SLASH
	db 34, FOCUS_ENERGY
	db 38, AGILITY
	db 42, CRUNCH
	db 44, DOUBLE_EDGE
	db 47, SUPER_FANG
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 5, PSYWAVE
	db 8, WATER_GUN
	db 14, DISABLE
	db 17, CONFUSION
	db 22, AMNESIA
	db 26, BUBBLEBEAM
	db 29, PSYCH_UP
	db 32, PSYBEAM
	db 36, RAIN_DANCE
	db 40, SURF
	db 42, PSYCHIC_M
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 5, PSYWAVE
	db 8, WATER_GUN
	db 14, DISABLE
	db 17, CONFUSION
	db 22, AMNESIA
	db 26, BUBBLEBEAM
	db 29, PSYCH_UP
	db 32, PSYBEAM
	db 38, RAIN_DANCE
	db 42, SURF
	db 44, PSYCHIC_M
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 6, ROCK_SMASH
	db 10, BEAT_UP
	db 15, RAGE
	db 19, LOW_KICK
	db 23, FOCUS_ENERGY
	db 29, KARATE_CHOP
	db 32, SCREECH
	db 35, SWORDS_DANCE
	db 38, MEGA_PUNCH
	db 41, SUBMISSION
	db 45, CROSS_CHOP
	db 47, MEGA_KICK
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 6, ROCK_SMASH
	db 10, BEAT_UP
	db 15, RAGE
	db 19, LOW_KICK
	db 23, FOCUS_ENERGY
	db 31, KARATE_CHOP
	db 34, SCREECH
	db 37, SWORDS_DANCE
	db 40, MEGA_PUNCH
	db 43, SUBMISSION
	db 47, CROSS_CHOP
	db 49, MEGA_KICK
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, LICK
	db 1, GROWL
	db 5, EMBER
	db 8, BITE
	db 14, ROAR
	db 17, HEADBUTT
	db 22, FLAME_WHEEL
	db 26, SCARY_FACE
	db 29, SUNNY_DAY
	db 32, EXTREMESPEED
	db 36, FLAMETHROWER
	db 40, CRUNCH
	db 42, DOUBLE_EDGE
	db 45, FIRE_BLAST
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, EXTREMESPEED
	db 1, FLAME_WHEEL
	db 1, SUNNY_DAY
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, CHARM
	db 9, WATER_GUN
	db 13, HYPNOSIS
	db 18, MIMIC
	db 24, BUBBLEBEAM
	db 27, PSYBEAM
	db 30, RAIN_DANCE
	db 34, BODY_SLAM
	db 38, REFLECT
	db 41, IRON_TAIL
	db 46, DOUBLE_EDGE
	db 49, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_TRADE, KINGS_ROCK, POLITOED
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 5, CHARM
	db 9, WATER_GUN
	db 13, HYPNOSIS
	db 18, MIMIC
	db 24, BUBBLEBEAM
	db 29, PSYBEAM
	db 32, RAIN_DANCE
	db 36, BODY_SLAM
	db 40, REFLECT
	db 43, IRON_TAIL
	db 49, DOUBLE_EDGE
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLEBEAM
	db 1, SUBMISSION
	db 1, DIZZY_PUNCH
	db 1, RAIN_DANCE
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_TRADE, -1, ALAKAZAM ; Change to Energy Stone
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 5, PSYWAVE
	db 9, POUND
	db 13, ENDURE
	db 16, CONFUSION
	db 18, KINESIS
	db 24, HYPNOSIS
	db 27, PSYBEAM
	db 30, FORESIGHT
	db 34, FUTURE_SIGHT
	db 38, RECOVER
	db 41, PSYCHIC_M
	db 46, MIND_READER
	db 49, DREAM_EATER
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, FUTURE_SIGHT
	db 1, RECOVER
	db 1, PSYBEAM
	db 1, MIND_READER
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, POUND
	db 5, LEER
	db 9, MACH_PUNCH
	db 13, SEISMIC_TOSS
	db 18, COUNTER
	db 24, KARATE_CHOP
	db 27, DETECT
	db 30, DIZZY_PUNCH
	db 34, MEDITATE
	db 38, REVERSAL
	db 41, SUBMISSION
	db 46, MEGA_KICK
	db 49, CROSS_CHOP
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_TRADE, -1, MACHAMP ; Change to Energy Stone
	db 0 ; no more evolutions
	db 1, POUND
	db 5, LEER
	db 9, MACH_PUNCH
	db 13, SEISMIC_TOSS
	db 18, COUNTER
	db 24, KARATE_CHOP
	db 27, DETECT
	db 32, DIZZY_PUNCH
	db 36, MEDITATE
	db 40, REVERSAL
	db 43, SUBMISSION
	db 48, MEGA_KICK
	db 51, CROSS_CHOP
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, COUNTER
	db 1, KARATE_CHOP
	db 1, DETECT
	db 1, MEGA_KICK
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 3, GROWTH
	db 7, VINE_WHIP
	db 9, FURY_CUTTER
	db 12, ACID
	db 15, SWEET_SCENT
	db 19, RAZOR_LEAF
	db 23, SLASH
	db 26, SLUDGE
	db 30, GIGA_DRAIN
	db 35, SYNTHESIS
	db 41, SLUDGE_BOMB
	db 47, SOLARBEAM
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 3, GROWTH
	db 7, VINE_WHIP
	db 9, FURY_CUTTER
	db 12, ACID
	db 15, SWEET_SCENT
	db 19, RAZOR_LEAF
	db 25, SLASH
	db 27, SLUDGE
	db 32, GIGA_DRAIN
	db 37, SYNTHESIS
	db 43, SLUDGE_BOMB
	db 49, SOLARBEAM
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, ACID
	db 1, RAZOR_LEAF
	db 1, SLASH
	db 1, SYNTHESIS
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, POISON_STING
	db 5, SUPERSONIC
	db 8, WATER_GUN
	db 14, HAZE
	db 17, ACID
	db 22, BUBBLEBEAM
	db 26, CONFUSE_RAY
	db 29, LIGHT_SCREEN
	db 29, REFLECT
	db 32, SLUDGE
	db 36, SURF
	db 40, TOXIC
	db 42, SLUDGE_BOMB
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, POISON_STING
	db 5, SUPERSONIC
	db 8, WATER_GUN
	db 14, HAZE
	db 17, ACID
	db 22, BUBBLEBEAM
	db 26, CONFUSE_RAY
	db 29, LIGHT_SCREEN
	db 29, REFLECT
	db 34, SLUDGE
	db 38, SURF
	db 42, TOXIC
	db 44, SLUDGE_BOMB
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, POUND
	db 5, DEFENSE_CURL
	db 9, MUD_SLAP
	db 13, SAND_ATTACK
	db 18, ROLLOUT
	db 24, MAGNITUDE
	db 27, SELFDESTRUCT
	db 30, ROCK_THROW
	db 34, SPIKES
	db 38, BODY_SLAM
	db 41, ROCK_SLIDE
	db 46, EARTHQUAKE
	db 49, EXPLOSION
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_TRADE, -1, GOLEM ; Change to Energy Stone
	db 0 ; no more evolutions
	db 1, POUND
	db 5, DEFENSE_CURL
	db 9, MUD_SLAP
	db 13, SAND_ATTACK
	db 18, ROLLOUT
	db 24, MAGNITUDE
	db 29, SELFDESTRUCT
	db 32, ROCK_THROW
	db 36, SPIKES
	db 40, BODY_SLAM
	db 43, ROCK_SLIDE
	db 48, EARTHQUAKE
	db 51, EXPLOSION
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, MAGNITUDE
	db 1, SELFDESTRUCT
	db 1, ROCK_THROW
	db 1, BODY_SLAM
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, TAIL_WHIP
	db 6, FIRE_SPIN
	db 10, EMBER
	db 15, SMOKESCREEN
	db 19, CONFUSE_RAY
	db 23, FLAME_WHEEL
	db 29, STOMP
	db 32, PSYBEAM
	db 35, FLAMETHROWER
	db 38, AGILITY
	db 41, EXTREMESPEED
	db 45, TAKE_DOWN
	db 47, FIRE_BLAST
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, TAIL_WHIP
	db 6, FIRE_SPIN
	db 10, EMBER
	db 15, SMOKESCREEN
	db 19, CONFUSE_RAY
	db 23, FLAME_WHEEL
	db 29, STOMP
	db 32, PSYBEAM
	db 35, FLAMETHROWER
	db 38, AGILITY
	db 43, EXTREMESPEED
	db 47, TAKE_DOWN
	db 49, FIRE_BLAST
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 37, SLOWBRO
	db EVOLVE_TRADE, KINGS_ROCK, SLOWKING ; Change to levelup while holding
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, CURSE
	db 5, PSYWAVE
	db 8, WATER_GUN
	db 14, MIST
	db 17, HEADBUTT
	db 22, CONFUSION
	db 26, REFLECT
	db 26, LIGHT_SCREEN
	db 30, BUBBLEBEAM
	db 34, AMNESIA
	db 38, BODY_SLAM
	db 42, PSYCHIC_M
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, CURSE
	db 5, PSYWAVE
	db 8, WATER_GUN
	db 14, MIST
	db 17, HEADBUTT
	db 22, CONFUSION
	db 26, REFLECT
	db 26, LIGHT_SCREEN
	db 30, BUBBLEBEAM
	db 34, AMNESIA
	db 40, BODY_SLAM
	db 44, PSYCHIC_M
	db 47, HYDRO_PUMP
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, THUNDER_WAVE
	db 5, THUNDERSHOCK
	db 8, SUPERSONIC
	db 14, SWIFT
	db 17, MIRROR_SHOT
	db 22, SONICBOOM
	db 26, FLASH
	db 29, THUNDERBOLT
	db 32, LOCK_ON
	db 36, FLASH_CANNON
	db 40, ZAP_CANNON
	db 44, THUNDER
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, THUNDER_WAVE
	db 5, THUNDERSHOCK
	db 8, SUPERSONIC
	db 14, SWIFT
	db 17, MIRROR_SHOT
	db 22, SONICBOOM
	db 26, FLASH
	db 29, THUNDERBOLT
	db 34, LOCK_ON
	db 38, FLASH_CANNON
	db 42, ZAP_CANNON
	db 46, THUNDER
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, LEER
	db 5, FALSE_SWIPE
	db 8, SAND_ATTACK
	db 14, FURY_SWIPES
	db 17, KARATE_CHOP
	db 22, WING_ATTACK
	db 26, SLASH
	db 29, SWAGGER
	db 32, SWORDS_DANCE
	db 36, REVERSAL
	db 40, SCREECH
	db 42, MIRROR_MOVE
	db 45, CROSS_CHOP
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, PECK
	db 5, GROWL
	db 9, PURSUIT
	db 13, FURY_ATTACK
	db 18, DOUBLE_TEAM
	db 24, RAGE
	db 27, AGILITY
	db 30, DRILL_PECK
	db 34, TRI_ATTACK
	db 38, SWAGGER
	db 41, MEGA_KICK
	db 46, SKY_ATTACK
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 5, GROWL
	db 9, PURSUIT
	db 13, FURY_ATTACK
	db 18, DOUBLE_TEAM
	db 24, RAGE
	db 27, AGILITY
	db 30, DRILL_PECK
	db 36, TRI_ATTACK
	db 40, SWAGGER
	db 43, MEGA_KICK
	db 48, SKY_ATTACK
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, TACKLE 
	db 1, GROWL
	db 6, WATER_GUN
	db 10, POWDER_SNOW
	db 15, MIST
	db 19, BUBBLEBEAM
	db 23, HEADBUTT
	db 29, ICY_WIND
	db 32, RAIN_DANCE
	db 35, SURF
	db 38, ICE_BEAM
	db 41, IRON_TAIL
	db 45, BLIZZARD
	db 47, HORN_DRILL
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE 
	db 1, GROWL
	db 6, WATER_GUN
	db 10, POWDER_SNOW
	db 15, MIST
	db 19, BUBBLEBEAM
	db 23, HEADBUTT
	db 29, ICY_WIND
	db 32, RAIN_DANCE
	db 37, SURF
	db 40, ICE_BEAM
	db 43, IRON_TAIL
	db 47, BLIZZARD
	db 49, HORN_DRILL
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, HARDEN
	db 6, POUND
	db 10, POISON_GAS
	db 15, BEAT_UP
	db 19, ACID
	db 23, ACID_ARMOR
	db 29, SLAM
	db 32, MINIMIZE
	db 35, SLUDGE
	db 38, SCREECH
	db 41, TOXIC
	db 45, DOUBLE_EDGE
	db 47, SLUDGE_BOMB
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	; moves are not sorted by level
	db 1, SMOG
	db 1, HARDEN
	db 6, POUND
	db 10, POISON_GAS
	db 15, BEAT_UP
	db 19, ACID
	db 23, ACID_ARMOR
	db 29, SLAM
	db 32, MINIMIZE
	db 35, SLUDGE
	db 38, SCREECH
	db 43, TOXIC
	db 47, DOUBLE_EDGE
	db 49, SLUDGE_BOMB
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WITHDRAW
	db 5, CLAMP
	db 8, MIST
	db 14, WATER_GUN
	db 17, BIDE
	db 22, HARDEN
	db 26, BUBBLEBEAM
	db 29, AURORA_BEAM
	db 32, BARRIER
	db 36, ICE_BEAM
	db 40, WHIRLPOOL
	db 42, DOUBLE_EDGE
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKE_CANNON
	db 1, AURORA_BEAM
	db 1, BUBBLEBEAM
	db 1, WITHDRAW
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, LICK
	db 3, SPITE
	db 7, SMOKESCREEN
	db 9, ACID
	db 12, FAINT_ATTACK
	db 15, POISON_GAS
	db 19, NIGHT_SHADE
	db 23, HYPNOSIS
	db 23, NIGHTMARE
	db 26, CONFUSE_RAY
	db 30, MINIMIZE
	db 35, SHADOW_BALL
	db 41, SLUDGE_BOMB
	db 47, DESTINY_BOND
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_TRADE, -1, GENGAR ; Change to Energy Stone
	db 0 ; no more evolutions
	db 1, LICK
	db 3, SPITE
	db 7, SMOKESCREEN
	db 9, ACID
	db 12, FAINT_ATTACK
	db 15, POISON_GAS
	db 19, NIGHT_SHADE
	db 23, HYPNOSIS
	db 23, NIGHTMARE
	db 28, CONFUSE_RAY
	db 32, MINIMIZE
	db 37, SHADOW_BALL
	db 43, SLUDGE_BOMB
	db 49, DESTINY_BOND
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, NIGHTMARE
	db 1, SLUDGE_BOMB
	db 1, DESTINY_BOND
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_TRADE, METAL_COAT, STEELIX ; Change to Level Up While Holding
	db 0 ; no more evolutions
	db 1, WRAP
	db 5, HARDEN
	db 9, MAGNITUDE
	db 13, ROCK_THROW
	db 18, SHARPEN
	db 24, SCREECH
	db 27, DIG
	db 30, ANCIENTPOWER
	db 34, AGILITY
	db 38, ROCK_SLIDE
	db 41, EARTHQUAKE
	db 46, THRASH
	db 49, IRON_TAIL
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DISABLE
	db 5, BEAT_UP
	db 9, HYPNOSIS
	db 13, CONFUSION
	db 18, SPITE
	db 24, HEADBUTT
	db 27, PSYBEAM
	db 30, CONFUSE_RAY
	db 34, SHADOW_BALL
	db 38, PSYCHIC_M
	db 41, MIND_READER
	db 46, NIGHTMARE
	db 49, DREAM_EATER
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, DISABLE
	db 5, BEAT_UP
	db 9, HYPNOSIS
	db 13, CONFUSION
	db 18, SPITE
	db 24, HEADBUTT
	db 29, PSYBEAM
	db 32, CONFUSE_RAY
	db 36, SHADOW_BALL
	db 40, PSYCHIC_M
	db 43, MIND_READER
	db 48, NIGHTMARE
	db 51, DREAM_EATER
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, HARDEN
	db 5, WATER_GUN
	db 8, FURY_SWIPES
	db 14, VICEGRIP
	db 17, STOMP
	db 22, BUBBLEBEAM
	db 26, MIST
	db 29, SHARPEN
	db 32, CRABHAMMER
	db 36, DETECT
	db 40, WATERFALL
	db 42, CROSS_CHOP
	db 45, GUILLOTINE
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, HARDEN
	db 5, WATER_GUN
	db 8, FURY_SWIPES
	db 14, VICEGRIP
	db 17, STOMP
	db 22, BUBBLEBEAM
	db 26, MIST
	db 31, SHARPEN
	db 34, CRABHAMMER
	db 38, DETECT
	db 42, WATERFALL
	db 44, CROSS_CHOP
	db 47, GUILLOTINE
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, THUNDER_WAVE
	db 5, QUICK_ATTACK
	db 8, HARDEN
	db 14, SPARK
	db 17, SUPERSONIC
	db 22, SONICBOOM
	db 26, ROLLOUT
	db 29, LIGHT_SCREEN
	db 29, REFLECT
	db 32, THUNDERBOLT
	db 36, SWIFT
	db 40, MIRROR_COAT
	db 42, THUNDER
	db 45, EXPLOSION
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, THUNDER_WAVE
	db 5, QUICK_ATTACK
	db 8, HARDEN
	db 14, SPARK
	db 17, SUPERSONIC
	db 22, SONICBOOM
	db 26, ROLLOUT
	db 29, LIGHT_SCREEN
	db 29, REFLECT
	db 34, THUNDERBOLT
	db 38, SWIFT
	db 42, MIRROR_COAT
	db 44, THUNDER
	db 47, EXPLOSION
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, BARRAGE
	db 1, ABSORB
	db 5, LEECH_SEED
	db 9, CONFUSION
	db 13, REFLECT
	db 13, LIGHT_SCREEN
	db 18, MEGA_DRAIN
	db 24, SWEET_SCENT
	db 27, SYNTHESIS
	db 30, PSYBEAM
	db 34, GIGA_DRAIN
	db 38, MIND_READER
	db 41, PSYCHIC_M
	db 46, EGG_BOMB
	db 49, SOLARBEAM
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, LIGHT_SCREEN
	db 1, MEGA_DRAIN
	db 1, SYNTHESIS
	db 1, PSYBEAM
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, SAND_ATTACK
	db 1, TAIL_WHIP
	db 5, SCRATCH
	db 14, LEER
	db 17, BONEMERANG
	db 22, METAL_CLAW
	db 26, SCREECH
	db 30, HEADBUTT
	db 34, BONE_CLUB
	db 38, ROCK_SLIDE
	db 42, SANDSTORM
	db 45, EARTHQUAKE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, SAND_ATTACK
	db 1, TAIL_WHIP
	db 5, SCRATCH
	db 14, LEER
	db 17, BONEMERANG
	db 22, METAL_CLAW
	db 26, SCREECH
	db 32, HEADBUTT
	db 36, BONE_CLUB
	db 40, ROCK_SLIDE
	db 44, SANDSTORM
	db 47, EARTHQUAKE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 6, DOUBLE_KICK
	db 10, MEDITATE
	db 15, LOW_KICK
	db 19, SCREECH
	db 23, STOMP
	db 29, ROLLING_KICK
	db 32, DETECT
	db 35, JUMP_KICK
	db 38, SWAGGER
	db 41, HI_JUMP_KICK
	db 45, DOUBLE_EDGE
	db 47, MEGA_KICK
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LEER
	db 6, MACH_PUNCH
	db 10, COMET_PUNCH
	db 15, MEDITATE
	db 19, SEISMIC_TOSS
	db 23, ICE_PUNCH
	db 23, FIRE_PUNCH
	db 23, THUNDERPUNCH
	db 29, SWORDS_DANCE
	db 32, VITAL_THROW
	db 35, LOCK_ON
	db 38, MEGA_PUNCH
	db 41, SWAGGER
	db 45, DETECT
	db 47, DYNAMICPUNCH
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, LICK
	db 1, TAIL_WHIP
	db 5, WRAP
	db 8, SUPERSONIC
	db 14, PURSUIT
	db 17, FOCUS_ENERGY
	db 22, HEADBUTT
	db 26, SCREECH
	db 29, MEGA_PUNCH
	db 32, CONFUSE_RAY
	db 36, BODY_SLAM
	db 40, BIDE
	db 42, PROTECT
	db 45, MEGA_KICK
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, SMOG
	db 6, SMOKESCREEN
	db 10, ACID
	db 15, HAZE
	db 19, ROLLOUT
	db 23, SCREECH
	db 29, SELFDESTRUCT
	db 32, SLUDGE
	db 35, ENDURE
	db 38, BODY_SLAM
	db 41, TOXIC
	db 45, SLUDGE_BOMB
	db 47, EXPLOSION
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_GAS
	db 1, SMOG
	db 6, SMOKESCREEN
	db 10, ACID
	db 15, HAZE
	db 19, ROLLOUT
	db 23, SCREECH
	db 29, SELFDESTRUCT
	db 32, SLUDGE
	db 35, ENDURE
	db 40, BODY_SLAM
	db 43, TOXIC
	db 47, SLUDGE_BOMB
	db 49, EXPLOSION
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, MUD_SLAP
	db 10, ROCK_THROW
	db 15, HORN_ATTACK
	db 19, SCARY_FACE
	db 23, MAGNITUDE
	db 29, ENCORE
	db 32, ROCK_SLIDE
	db 35, SCREECH
	db 38, EARTHQUAKE
	db 41, SANDSTORM
	db 45, IRON_TAIL
	db 47, HORN_DRILL
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, MUD_SLAP
	db 10, ROCK_THROW
	db 15, HORN_ATTACK
	db 19, SCARY_FACE
	db 23, MAGNITUDE
	db 29, ENCORE
	db 32, ROCK_SLIDE
	db 35, SCREECH
	db 38, EARTHQUAKE
	db 41, SANDSTORM
	db 47, IRON_TAIL
	db 49, HORN_DRILL
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 6, SWEET_KISS
	db 10, COMET_PUNCH
	db 15, SOFTBOILED
	db 19, HEADBUTT
	db 23, LIGHT_SCREEN
	db 29, PRESENT
	db 32, SING
	db 35, MEGA_PUNCH
	db 38, SUBSTITUTE
	db 41, EGG_BOMB
	db 45, HEAL_BELL
	db 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, GROWTH
	db 5, VINE_WHIP
	db 8, STUN_SPORE
	db 14, SWEET_SCENT
	db 17, SLEEP_POWDER
	db 22, MEGA_DRAIN
	db 26, SLASH
	db 29, REFLECT
	db 32, GIGA_DRAIN
	db 36, SYNTHESIS
	db 40, SLAM
	db 42, SOLARBEAM
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, COMET_PUNCH
	db 1, TAIL_WHIP
	db 5, BEAT_UP
	db 8, GROWL
	db 14, BITE
	db 17, SCARY_FACE
	db 22, RAGE
	db 26, FOCUS_ENERGY
	db 29, DIZZY_PUNCH
	db 32, MEGA_PUNCH
	db 36, FLAIL
	db 40, GLARE
	db 42, OUTRAGE
	db 45, HYPER_BEAM
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_TRADE, DRAGON_SCALE, KINGDRA ; Change to Level Up While Holding
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, PECK
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 7, WATER_GUN
	db 13, RAPID_SPIN
	db 19, RECOVER
	db 25, SWIFT
	db 31, BUBBLEBEAM
	db 37, MINIMIZE
	db 43, LIGHT_SCREEN
	db 50, HYDRO_PUMP
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
	db 6, CONFUSION
	db 11, SUBSTITUTE
	db 16, MEDITATE
	db 21, DOUBLESLAP
	db 26, LIGHT_SCREEN
	db 26, REFLECT
	db 31, ENCORE
	db 36, PSYBEAM
	db 41, BATON_PASS
	db 46, SAFEGUARD
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_TRADE, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FALSE_SWIPE
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
	db 1, LOVELY_KISS
	db 1, POWDER_SNOW
	db 9, LOVELY_KISS
	db 13, POWDER_SNOW
	db 21, DOUBLESLAP
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
	db 1, SMOG
	db 1, FIRE_PUNCH
	db 7, LEER
	db 13, SMOG
	db 19, FIRE_PUNCH
	db 25, SMOKESCREEN
	db 33, SUNNY_DAY
	db 41, FLAMETHROWER
	db 49, CONFUSE_RAY
	db 57, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, VICEGRIP
	db 7, FOCUS_ENERGY
	db 19, SEISMIC_TOSS
	db 25, HARDEN
	db 31, GUILLOTINE
	db 37, SUBMISSION
	db 43, SWORDS_DANCE
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 8, RAGE
	db 13, HORN_ATTACK
	db 19, SCARY_FACE
	db 26, PURSUIT
	db 34, REST
	db 43, THRASH
	db 53, TAKE_DOWN
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
	db 20, BITE
	db 25, DRAGON_RAGE
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
	db 1, SING
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
	db EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	db EVOLVE_HAPPINESS, TR_NITE, UMBREON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, GROWL
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, BATON_PASS
	db 42, TAKE_DOWN
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, WATER_GUN
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, AURORA_BEAM
	db 42, HAZE
	db 47, ACID_ARMOR
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
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
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, EMBER
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, FIRE_SPIN
	db 42, SMOG
	db 47, LEER
	db 52, FLAMETHROWER
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_TRADE, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	db 1, CONVERSION2
	db 1, TACKLE
	db 1, CONVERSION
	db 9, AGILITY
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, SHARPEN
	db 32, LOCK_ON
	db 36, TRI_ATTACK
	db 44, ZAP_CANNON
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 13, BITE
	db 19, WATER_GUN
	db 31, LEER
	db 37, PROTECT
	db 49, ANCIENTPOWER
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, WITHDRAW
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
	db 1, SCRATCH
	db 1, HARDEN
	db 10, ABSORB
	db 19, LEER
	db 28, SAND_ATTACK
	db 37, ENDURE
	db 46, MEGA_DRAIN
	db 55, ANCIENTPOWER
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, HARDEN
	db 1, ABSORB
	db 10, ABSORB
	db 19, LEER
	db 28, SAND_ATTACK
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
	db 22, SUPERSONIC
	db 29, ANCIENTPOWER
	db 36, SCARY_FACE
	db 43, TAKE_DOWN
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
	db 1, GUST
	db 1, POWDER_SNOW
	db 13, MIST
	db 25, AGILITY
	db 37, MIND_READER
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
	db 73, SKY_ATTACK
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
	db 22, DRAGON_RAGE
	db 29, SLAM
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
	db 22, DRAGON_RAGE
	db 29, SLAM
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
	db 20, MEGA_PUNCH
	db 30, METRONOME
	db 40, PSYCHIC_M
	db 50, ANCIENTPOWER
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	db EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 15, POISONPOWDER
	db 22, SYNTHESIS
	db 29, BODY_SLAM
	db 36, LIGHT_SCREEN
	db 43, SAFEGUARD
	db 50, SOLARBEAM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	db EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, RAZOR_LEAF
	db 1, REFLECT
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 15, POISONPOWDER
	db 23, SYNTHESIS
	db 31, BODY_SLAM
	db 39, LIGHT_SCREEN
	db 47, SAFEGUARD
	db 55, SOLARBEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, RAZOR_LEAF
	db 1, REFLECT
	db 8, RAZOR_LEAF
	db 12, REFLECT
	db 15, POISONPOWDER
	db 23, SYNTHESIS
	db 31, BODY_SLAM
	db 41, LIGHT_SCREEN
	db 51, SAFEGUARD
	db 61, SOLARBEAM
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	db EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, SMOKESCREEN
	db 12, EMBER
	db 19, QUICK_ATTACK
	db 27, FLAME_WHEEL
	db 36, SWIFT
	db 46, FLAMETHROWER
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	db EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 1, SMOKESCREEN
	db 6, SMOKESCREEN
	db 12, EMBER
	db 21, QUICK_ATTACK
	db 31, FLAME_WHEEL
	db 42, SWIFT
	db 54, FLAMETHROWER
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 1, SMOKESCREEN
	db 1, EMBER
	db 6, SMOKESCREEN
	db 12, EMBER
	db 21, QUICK_ATTACK
	db 31, FLAME_WHEEL
	db 45, SWIFT
	db 60, FLAMETHROWER
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	db EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 7, RAGE
	db 13, WATER_GUN
	db 20, BITE
	db 27, SCARY_FACE
	db 35, SLASH
	db 43, SCREECH
	db 52, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	db EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, RAGE
	db 7, RAGE
	db 13, WATER_GUN
	db 21, BITE
	db 28, SCARY_FACE
	db 37, SLASH
	db 45, SCREECH
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, RAGE
	db 1, WATER_GUN
	db 7, RAGE
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
	db 1, TACKLE
	db 5, DEFENSE_CURL
	db 11, QUICK_ATTACK
	db 17, FURY_SWIPES
	db 25, SLAM
	db 33, REST
	db 41, AMNESIA
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, DEFENSE_CURL
	db 1, QUICK_ATTACK
	db 5, DEFENSE_CURL
	db 11, QUICK_ATTACK
	db 18, FURY_SWIPES
	db 28, SLAM
	db 38, REST
	db 48, AMNESIA
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 6, FORESIGHT
	db 11, PECK
	db 16, HYPNOSIS
	db 22, REFLECT
	db 28, TAKE_DOWN
	db 34, CONFUSION
	db 48, DREAM_EATER
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, FORESIGHT
	db 1, PECK
	db 6, FORESIGHT
	db 11, PECK
	db 16, HYPNOSIS
	db 25, REFLECT
	db 33, TAKE_DOWN
	db 41, CONFUSION
	db 57, DREAM_EATER
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	db EVOLVE_LEVEL, 18, LEDIAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, SUPERSONIC
	db 15, COMET_PUNCH
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
	db 1, TACKLE
	db 1, SUPERSONIC
	db 8, SUPERSONIC
	db 15, COMET_PUNCH
	db 24, LIGHT_SCREEN
	db 24, REFLECT
	db 24, SAFEGUARD
	db 33, BATON_PASS
	db 42, SWIFT
	db 51, AGILITY
	db 60, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	db EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 6, SCARY_FACE
	db 11, CONSTRICT
	db 17, NIGHT_SHADE
	db 23, LEECH_LIFE
	db 30, FURY_SWIPES
	db 37, SPIDER_WEB
	db 45, AGILITY
	db 53, PSYCHIC_M
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, STRING_SHOT
	db 1, SCARY_FACE
	db 1, CONSTRICT
	db 6, SCARY_FACE
	db 11, CONSTRICT
	db 17, NIGHT_SHADE
	db 25, LEECH_LIFE
	db 34, FURY_SWIPES
	db 43, SPIDER_WEB
	db 53, AGILITY
	db 63, PSYCHIC_M
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCREECH
	db 1, LEECH_LIFE
	db 1, SUPERSONIC
	db 6, SUPERSONIC
	db 12, BITE
	db 19, CONFUSE_RAY
	db 30, WING_ATTACK
	db 42, MEAN_LOOK
	db 55, HAZE
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, THUNDER_WAVE
	db 5, SUPERSONIC
	db 13, FLAIL
	db 17, WATER_GUN
	db 25, SPARK
	db 29, CONFUSE_RAY
	db 37, TAKE_DOWN
	db 41, HYDRO_PUMP
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, THUNDER_WAVE
	db 1, SUPERSONIC
	db 5, SUPERSONIC
	db 13, FLAIL
	db 17, WATER_GUN
	db 25, SPARK
	db 33, CONFUSE_RAY
	db 45, TAKE_DOWN
	db 53, HYDRO_PUMP
	db 0 ; no more level-up moves

PichuEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, CHARM
	db 6, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 11, SWEET_KISS
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CHARM
	db 4, ENCORE
	db 8, SING
	db 13, SWEET_KISS
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	db 0 ; no more evolutions
	db 1, SING
	db 1, CHARM
	db 4, DEFENSE_CURL
	db 9, POUND
	db 14, SWEET_KISS
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM
	db 7, METRONOME
	db 18, SWEET_KISS
	db 25, ENCORE
	db 31, SAFEGUARD
	db 38, DOUBLE_EDGE
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CHARM
	db 7, METRONOME
	db 18, SWEET_KISS
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
	db 1, TACKLE
	db 1, GROWL
	db 9, THUNDERSHOCK
	db 16, THUNDER_WAVE
	db 23, COTTON_SPORE
	db 30, LIGHT_SCREEN
	db 37, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 9, THUNDERSHOCK
	db 18, THUNDER_WAVE
	db 27, COTTON_SPORE
	db 36, LIGHT_SCREEN
	db 45, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 1, THUNDERSHOCK
	db 1, THUNDER_WAVE
	db 9, THUNDERSHOCK
	db 18, THUNDER_WAVE
	db 27, COTTON_SPORE
	db 30, THUNDERPUNCH
	db 42, LIGHT_SCREEN
	db 57, THUNDER
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
	db 3, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 21, BUBBLEBEAM
	db 28, DOUBLE_EDGE
	db 36, RAIN_DANCE
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, DEFENSE_CURL
	db 1, TAIL_WHIP
	db 1, WATER_GUN
	db 3, DEFENSE_CURL
	db 6, TAIL_WHIP
	db 10, WATER_GUN
	db 15, ROLLOUT
	db 25, BUBBLEBEAM
	db 36, DOUBLE_EDGE
	db 48, RAIN_DANCE
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROCK_THROW
	db 1, MIMIC
	db 10, FLAIL
	db 19, LOW_KICK
	db 28, ROCK_SLIDE
	db 37, FAINT_ATTACK
	db 46, SLAM
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, HYPNOSIS
	db 1, DOUBLESLAP
	db 1, PERISH_SONG
	db 35, PERISH_SONG
	db 51, SWAGGER
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	db EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	db 1, SPLASH
	db 5, SYNTHESIS
	db 5, TAIL_WHIP
	db 10, TACKLE
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 20, LEECH_SEED
	db 25, COTTON_SPORE
	db 30, MEGA_DRAIN
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	db EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, SYNTHESIS
	db 1, TAIL_WHIP
	db 1, TACKLE
	db 5, SYNTHESIS
	db 5, TAIL_WHIP
	db 10, TACKLE
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 22, LEECH_SEED
	db 29, COTTON_SPORE
	db 36, MEGA_DRAIN
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, SYNTHESIS
	db 1, TAIL_WHIP
	db 1, TACKLE
	db 5, SYNTHESIS
	db 5, TAIL_WHIP
	db 10, TACKLE
	db 13, POISONPOWDER
	db 15, STUN_SPORE
	db 17, SLEEP_POWDER
	db 22, LEECH_SEED
	db 33, COTTON_SPORE
	db 44, MEGA_DRAIN
	db 0 ; no more level-up moves

AipomEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, TAIL_WHIP
	db 6, SAND_ATTACK
	db 12, BATON_PASS
	db 19, FURY_SWIPES
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
	db 31, SYNTHESIS
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
	db 1, TACKLE
	db 1, FORESIGHT
	db 7, QUICK_ATTACK
	db 13, DOUBLE_TEAM
	db 19, SONICBOOM
	db 25, DETECT
	db 31, SUPERSONIC
	db 37, WING_ATTACK
	db 43, SCREECH
	db 0 ; no more level-up moves

WooperEvosAttacks:
	db EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 11, SLAM
	db 21, AMNESIA
	db 31, EARTHQUAKE
	db 41, RAIN_DANCE
	db 51, MIST
	db 51, HAZE
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, TAIL_WHIP
	db 11, SLAM
	db 23, AMNESIA
	db 35, EARTHQUAKE
	db 47, RAIN_DANCE
	db 59, MIST
	db 59, HAZE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
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
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, SAND_ATTACK
	db 16, PURSUIT
	db 23, QUICK_ATTACK
	db 30, CONFUSE_RAY
	db 36, FAINT_ATTACK
	db 42, MEAN_LOOK
	db 47, SCREECH
	db 52, MOONLIGHT
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
	db 1, TACKLE
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
	db 1, PSYWAVE
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
	db 1, TACKLE
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
	db 1, TACKLE
	db 1, PROTECT
	db 8, SELFDESTRUCT
	db 15, TAKE_DOWN
	db 22, RAPID_SPIN
	db 29, BIDE
	db 36, EXPLOSION
	db 43, SPIKES
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PROTECT
	db 1, SELFDESTRUCT
	db 8, SELFDESTRUCT
	db 15, TAKE_DOWN
	db 22, RAPID_SPIN
	db 29, BIDE
	db 39, EXPLOSION
	db 49, SPIKES
	db 59, DOUBLE_EDGE
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 5, DEFENSE_CURL
	db 13, GLARE
	db 18, SPITE
	db 26, PURSUIT
	db 30, SCREECH
	db 38, TAKE_DOWN
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 6, SAND_ATTACK
	db 13, HARDEN
	db 20, QUICK_ATTACK
	db 28, FAINT_ATTACK
	db 36, SLASH
	db 44, SCREECH
	db 52, GUILLOTINE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCREECH
	db 14, ROCK_THROW
	db 23, HARDEN
	db 27, RAGE
	db 36, SANDSTORM
	db 40, SLAM
	db 49, CRUNCH
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	db EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCARY_FACE
	db 4, TAIL_WHIP
	db 8, CHARM
	db 13, BITE
	db 19, LICK
	db 26, ROAR
	db 34, RAGE
	db 43, TAKE_DOWN
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, SCARY_FACE
	db 4, TAIL_WHIP
	db 8, CHARM
	db 13, BITE
	db 19, LICK
	db 28, ROAR
	db 38, RAGE
	db 51, TAKE_DOWN
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPIKES
	db 1, TACKLE
	db 1, POISON_STING
	db 10, HARDEN
	db 10, MINIMIZE
	db 19, WATER_GUN
	db 28, PIN_MISSILE
	db 37, TAKE_DOWN
	db 46, HYDRO_PUMP
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, PURSUIT
	db 18, FALSE_SWIPE
	db 24, AGILITY
	db 30, METAL_CLAW
	db 36, SLASH
	db 42, SWORDS_DANCE
	db 48, DOUBLE_TEAM
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONSTRICT
	db 1, WITHDRAW
	db 9, WRAP
	db 14, ENCORE
	db 23, SAFEGUARD
	db 28, BIDE
	db 37, REST
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, LEER
	db 6, HORN_ATTACK
	db 12, ENDURE
	db 19, FURY_ATTACK
	db 27, COUNTER
	db 35, TAKE_DOWN
	db 44, REVERSAL
	db 54, MEGAHORN
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 9, QUICK_ATTACK
	db 17, SCREECH
	db 25, FAINT_ATTACK
	db 33, FURY_SWIPES
	db 41, AGILITY
	db 49, SLASH
	db 57, BEAT_UP
	db 65, METAL_CLAW
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 8, LICK
	db 15, FURY_SWIPES
	db 22, FAINT_ATTACK
	db 29, REST
	db 36, SLASH
	db 43, SNORE
	db 50, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 1, LICK
	db 1, FURY_SWIPES
	db 8, LICK
	db 15, FURY_SWIPES
	db 22, FAINT_ATTACK
	db 29, REST
	db 39, SLASH
	db 49, SNORE
	db 59, THRASH
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	db EVOLVE_LEVEL, 38, MAGCARGO
	db 0 ; no more evolutions
	db 1, SMOG
	db 8, EMBER
	db 15, ROCK_THROW
	db 22, HARDEN
	db 29, AMNESIA
	db 36, FLAMETHROWER
	db 43, ROCK_SLIDE
	db 50, BODY_SLAM
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	db 1, SMOG
	db 1, EMBER
	db 1, ROCK_THROW
	db 8, EMBER
	db 15, ROCK_THROW
	db 22, HARDEN
	db 29, AMNESIA
	db 36, FLAMETHROWER
	db 48, ROCK_SLIDE
	db 60, BODY_SLAM
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 10, POWDER_SNOW
	db 19, ENDURE
	db 28, TAKE_DOWN
	db 37, MIST
	db 46, BLIZZARD
	db 55, AMNESIA
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, POWDER_SNOW
	db 1, ENDURE
	db 10, POWDER_SNOW
	db 19, ENDURE
	db 28, TAKE_DOWN
	db 33, FURY_ATTACK
	db 42, MIST
	db 56, BLIZZARD
	db 70, AMNESIA
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 7, HARDEN
	db 13, BUBBLE
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
	db 11, CONSTRICT
	db 22, PSYBEAM
	db 22, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 25, OCTAZOOKA
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
	db 1, TACKLE
	db 1, BUBBLE
	db 10, SUPERSONIC
	db 18, BUBBLEBEAM
	db 25, TAKE_DOWN
	db 32, AGILITY
	db 40, WING_ATTACK
	db 49, CONFUSE_RAY
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 13, SAND_ATTACK
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
	db 13, SMOG
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
	db 13, SMOG
	db 20, BITE
	db 30, FAINT_ATTACK
	db 41, FLAMETHROWER
	db 52, CRUNCH
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, SMOKESCREEN
	db 1, LEER
	db 1, WATER_GUN
	db 8, SMOKESCREEN
	db 15, LEER
	db 22, WATER_GUN
	db 29, TWISTER
	db 40, AGILITY
	db 51, HYDRO_PUMP
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	db EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 17, FLAIL
	db 25, TAKE_DOWN
	db 33, ROLLOUT
	db 41, ENDURE
	db 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, GROWL
	db 9, DEFENSE_CURL
	db 17, FLAIL
	db 25, FURY_ATTACK
	db 33, ROLLOUT
	db 41, RAPID_SPIN
	db 49, EARTHQUAKE
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
	db 32, LOCK_ON
	db 36, TRI_ATTACK
	db 44, ZAP_CANNON
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, LEER
	db 15, HYPNOSIS
	db 23, STOMP
	db 31, SAND_ATTACK
	db 40, TAKE_DOWN
	db 49, CONFUSE_RAY
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
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	db 1, ROLLING_KICK
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
	db 9, SWEET_KISS
	db 13, POWDER_SNOW
	db 21, CONFUSION
	db 25, SING
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
	db 13, SMOG
	db 19, FIRE_PUNCH
	db 25, SMOKESCREEN
	db 31, SUNNY_DAY
	db 37, FLAMETHROWER
	db 43, CONFUSE_RAY
	db 49, FIRE_BLAST
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 8, DEFENSE_CURL
	db 13, STOMP
	db 19, MILK_DRINK
	db 26, BIDE
	db 34, ROLLOUT
	db 43, BODY_SLAM
	db 53, HEAL_BELL
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 4, GROWL
	db 7, TAIL_WHIP
	db 10, SOFTBOILED
	db 13, DOUBLESLAP
	db 18, MINIMIZE
	db 23, SING
	db 28, EGG_BOMB
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
	db 77, WHIRLWIND
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
	db 77, WHIRLWIND
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
