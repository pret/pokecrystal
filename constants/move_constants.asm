; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - MoveDescriptions (see data/moves/descriptions.asm)
; - BattleAnimations (see data/moves/animations.asm)
	const_def
	const NO_MOVE      ; 00
	const POUND        ; 01
	const KARATE_CHOP  ; 02
	const FLASH_CANNON ; 03 DOUBLESLAP
	const GUNK_SHOT    ; 04 COMET_PUNCH
	const AIR_SLASH    ; 05 MEGA_PUNCH
	const FAIRY_WIND   ; 06 PAY_DAY
	const FIRE_PUNCH   ; 07
	const ICE_PUNCH    ; 08
	const THUNDERPUNCH ; 09
	const AURA_SPHERE  ; 0a SCRATCH
	const VICEGRIP     ; 0b BUG BITE equivalent
	const POISON_JAB   ; 0c GUILLOTINE
	const ROCK_BLAST   ; 0d RAZOR_WIND
	const SWORDS_DANCE ; 0e
	const CUT          ; 0f X-SCISSOR but slash
	const GUST         ; 10
	const WING_ATTACK  ; 11
	const BULLET_SEED  ; 12 WHIRLWIND
	const FLY          ; 13
	const DRAGON_DANCE ; 14 BIND
	const AQUA_JET     ; 15 SLAM
	const VINE_WHIP    ; 16
	const STOMP        ; 17
	const DOUBLE_KICK  ; 18
	const OMINOUS_WIND ; 19 MEGA_KICK
	const AIR_CUTTER   ; 1a JUMP_KICK
	const ZEN_HEADBUTT ; 1b ROLLING_KICK
	const ICICLE_CRASH ; 1c SAND_ATTACK
	const HEADBUTT     ; 1d
	const DARK_PULSE   ; 1e HORN_ATTACK
	const FURY_ATTACK  ; 1f
	const SNARL		   ; 20 HORN_DRILL
	const DRAGON_CLAW  ; 21 TACKLE
	const BODY_SLAM    ; 22
	const WRAP         ; 23
	const DRAIN_PUNCH  ; 24 TAKE_DOWN
	const THRASH       ; 25
	const DOUBLE_EDGE  ; 26
	const BRAVE_BIRD   ; 27 TAIL_WHIP
	const POISON_STING ; 28
	const TWINEEDLE    ; 29
	const PIN_MISSILE  ; 2a
	const LEER         ; 2b
	const BITE         ; 2c
	const GROWL        ; 2d
	const ROAR         ; 2e
	const POISON_TAIL  ; 2f SING
	const BUG_BUZZ     ; 30 SUPERSONIC
	const SONICBOOM    ; 31
	const DISABLE      ; 32
	const ACID         ; 33
	const EMBER        ; 34
	const FLAMETHROWER ; 35
	const MIST         ; 36
	const WATER_GUN    ; 37
	const HYDRO_PUMP   ; 38
	const SURF         ; 39
	const ICE_BEAM     ; 3a
	const BLIZZARD     ; 3b
	const PSYBEAM      ; 3c
	const BUBBLEBEAM   ; 3d
	const AURORA_BEAM  ; 3e
	const HYPER_BEAM   ; 3f
	const PECK         ; 40
	const DRILL_PECK   ; 41
	const SCALD		   ; 42 SUBMISSION
	const LOW_KICK     ; 43 Low Sweep now
	const COUNTER      ; 44
	const SEISMIC_TOSS ; 45
	const STRENGTH     ; 46 Stone Edge now
	const ABSORB       ; 47
	const MEGA_DRAIN   ; 48
	const LEECH_SEED   ; 49
	const GROWTH       ; 4a
	const RAZOR_LEAF   ; 4b
	const SOLARBEAM    ; 4c
	const POISONPOWDER ; 4d
	const STUN_SPORE   ; 4e
	const SLEEP_POWDER ; 4f
	const PETAL_DANCE  ; 50
	const BULLET_PUNCH ; 51 STRING_SHOT
	const FLAME_BURST  ; 52 DRAGON_RAGE
	const FIRE_SPIN    ; 53
	const THUNDERSHOCK ; 54
	const THUNDERBOLT  ; 55
	const THUNDER_WAVE ; 56
	const THUNDER      ; 57
	const ROCK_THROW   ; 58
	const EARTHQUAKE   ; 59
	const FLARE_BLITZ  ; 5a FISSURE
	const DIG          ; 5b
	const TOXIC        ; 5c
	const CONFUSION    ; 5d
	const PSYCHIC_M    ; 5e
	const HYPNOSIS     ; 5f
	const MEDITATE     ; 60
	const AGILITY      ; 61
	const QUICK_ATTACK ; 62
	const RAGE         ; 63
	const TELEPORT     ; 64
	const NIGHT_SHADE  ; 65
	const ICICLE_SPEAR ; 66 MIMIC
	const SCREECH      ; 67
	const DOUBLE_TEAM  ; 68
	const RECOVER      ; 69
	const FOCUS_BLAST  ; 6a HARDEN
	const SIGNAL_BEAM  ; 6b MINIMIZE
	const HEAD_SMASH   ; 6c SMOKESCREEN
	const CONFUSE_RAY  ; 6d
	const SHADOW_SNEAK ; 6e WITHDRAW
	const DEFENSE_CURL ; 6f
	const BARRIER      ; 70
	const LIGHT_SCREEN ; 71
	const HAZE         ; 72
	const REFLECT      ; 73
	const FOCUS_ENERGY ; 74
	const DRILL_RUN    ; 75 BIDE
	const METRONOME    ; 76
	const NIGHT_SLASH  ; 77 MIRROR_MOVE
	const ICE_HAMMER   ; 78 SELFDESTRUCT
	const PLAY_ROUGH   ; 79 EGG_BOMB
	const LICK         ; 7a
	const COVET        ; 7b SMOG
	const SLUDGE       ; 7c
	const POLTERGEIST  ; 7d BONE_CLUB
	const FIRE_BLAST   ; 7e
	const WATERFALL    ; 7f
	const SAND_TOMB    ; 80 CLAMP
	const SWIFT        ; 81
	const CHLOROBLAST  ; 82 SKULL_BASH
	const SPIKE_CANNON ; 83
	const MAGNET_BOMB  ; 84 CONSTRICT
	const AMNESIA      ; 85
	const SCORCHD_SAND ; 86 KINESIS
	const SOFTBOILED   ; 87
	const HI_JUMP_KICK ; 88
	const GLARE        ; 89
	const DREAM_EATER  ; 8a
	const AQUA_CUTTER  ; 8b POISON_GAS
	const SEED_BOMB    ; 8c BARRAGE
	const LEECH_LIFE   ; 8d
	const WILD_CHARGE  ; 8e LOVELY_KISS
	const HURRICANE    ; 8f SKY_ATTACK
	const TRANSFORM    ; 90
	const TAIL_SWIPE   ; 91 BUBBLE
	const DIZZY_PUNCH  ; 92
	const SPORE        ; 93
	const FLASH        ; 94 has shock wave effect
	const CLOSE_COMBAT ; 95 PSYWAVE
	const HEADLONGRUSH ; 96 SPLASH
	const DRACO_METEOR ; 97 ACID_ARMOR
	const CRABHAMMER   ; 98
	const EXPLOSION    ; 99
	const OVERHEAT	   ; 9a FURY_SWIPES
	const BONEMERANG   ; 9b
	const REST         ; 9c
	const ROCK_SLIDE   ; 9d
	const LEAF_STORM   ; 9e HYPER_FANG
	const SHADOW_CLAW  ; 9f SHARPEN
	const CALM_MIND    ; a0 CONVERSION
	const TRI_ATTACK   ; a1
	const SUPER_FANG   ; a2
	const SLASH        ; a3
	const SUBSTITUTE   ; a4
	const STRUGGLE     ; a5
	const VACUUM_WAVE  ; a6 SKETCH
	const TRIPLE_KICK  ; a7
	const THIEF        ; a8
	const WAVE_CRASH   ; a9 SPIDER_WEB
	const ICE_SHARD    ; aa MIND_READER
	const NIGHTMARE    ; ab
	const FLAME_WHEEL  ; ac
	const SNORE        ; ad
	const CURSE        ; ae
	const HYPER_VOICE  ; af FLAIL
	const WILL_O_WISP  ; b0 CONVERSION2
	const AEROBLAST    ; b1
	const EARTH_POWER  ; b2 COTTON_SPORE
	const REVERSAL     ; b3
	const SPITE        ; b4
	const POWDER_SNOW  ; b5
	const PROTECT      ; b6
	const MACH_PUNCH   ; b7
	const SCARY_FACE   ; b8
	const FAINT_ATTACK ; b9
	const BULLDOZE     ; ba SWEET_KISS
	const BELLY_DRUM   ; bb
	const SLUDGE_BOMB  ; bc
	const MUD_SLAP     ; bd works like mud shot now
	const POWER_GEM    ; be OCTAZOOKA
	const SPIKES       ; bf
	const ZAP_CANNON   ; c0
	const FORESIGHT    ; c1
	const DESTINY_BOND ; c2
	const PERISH_SONG  ; c3
	const ICY_WIND     ; c4
	const DETECT       ; c5
	const STRUGGLE_BUG ; c6 BONE_RUSH
	const LOCK_ON      ; c7
	const OUTRAGE      ; c8
	const SANDSTORM    ; c9
	const GIGA_DRAIN   ; ca
	const ENDURE       ; cb
	const CHARM        ; cc
	const ROLLOUT      ; cd
	const BULK_UP	   ; ce FALSE_SWIPE
	const SWAGGER      ; cf works like Work Up
	const MILK_DRINK   ; d0
	const SPARK        ; d1
	const FURY_CUTTER  ; d2
	const STEEL_WING   ; d3
	const MEAN_LOOK    ; d4
	const ATTRACT      ; d5 Nuzzle now
	const SLEEP_TALK   ; d6
	const HEAL_BELL    ; d7
	const RETURN       ; d8
	const PRESENT      ; d9
	const FRUSTRATION  ; da works like Spirt Break
	const SAFEGUARD    ; db
	const PAIN_SPLIT   ; dc
	const SACRED_FIRE  ; dd
	const MAGNITUDE    ; de
	const DYNAMICPUNCH ; df
	const MEGAHORN     ; e0
	const DRAGONBREATH ; e1 works like dragon pulse now
	const BATON_PASS   ; e2
	const ENCORE       ; e3
	const PURSUIT      ; e4
	const RAPID_SPIN   ; e5
	const SWEET_SCENT  ; e6
	const IRON_TAIL    ; e7 works like Iron Head now
	const METAL_CLAW   ; e8
	const VITAL_THROW  ; e9
	const MORNING_SUN  ; ea
	const PSY_ANTLERS  ; eb SYNTHESIS
	const DRAIN_KISS   ; ec MOONLIGHT
	const HIDDEN_POWER ; ed
	const SILVER_WIND  ; ee CROSS_CHOP
	const TWISTER      ; ef
	const RAIN_DANCE   ; f0
	const SUNNY_DAY    ; f1
	const CRUNCH       ; f2
	const MIRROR_COAT  ; f3
	const PSYCH_UP     ; f4 nasty plot effect
	const EXTREMESPEED ; f5
	const ANCIENTPOWER ; f6
	const SHADOW_BALL  ; f7
	const FUTURE_SIGHT ; f8
	const ROCK_SMASH   ; f9 power up punch effect
	const WHIRLPOOL    ; fa
	const BEAT_UP      ; fb
	const HAIL		   ; fc
	const WOOD_HAMMER  ; fd
	const MOONBLAST    ; fe
DEF NUM_ATTACKS EQU const_value - 1

; Battle animations use the same constants as the moves up to this point
	const_next $ff
	const ANIM_SWEET_SCENT_2     ; ff
	const ANIM_THROW_POKE_BALL   ; 100
	const ANIM_SEND_OUT_MON      ; 101
	const ANIM_RETURN_MON        ; 102
	const ANIM_CONFUSED          ; 103
	const ANIM_SLP               ; 104
	const ANIM_BRN               ; 105
	const ANIM_PSN               ; 106
	const ANIM_SAP               ; 107
	const ANIM_FRZ               ; 108
	const ANIM_PAR               ; 109
	const ANIM_IN_LOVE           ; 10a
	const ANIM_IN_SANDSTORM      ; 10b
	const ANIM_IN_NIGHTMARE      ; 10c
	const ANIM_IN_WHIRLPOOL      ; 10d
; battle anims
	const ANIM_MISS              ; 10e
	const ANIM_ENEMY_DAMAGE      ; 10f
	const ANIM_ENEMY_STAT_DOWN   ; 110
	const ANIM_PLAYER_STAT_DOWN  ; 111
	const ANIM_PLAYER_DAMAGE     ; 112
	const ANIM_WOBBLE            ; 113
	const ANIM_SHAKE             ; 114
	const ANIM_HIT_CONFUSION     ; 115
	const ANIM_IN_HAIL           ; 116
DEF NUM_BATTLE_ANIMS EQU const_value - 1

; wNumHits uses offsets from ANIM_MISS
	const_def
	const BATTLEANIM_NONE
	const BATTLEANIM_ENEMY_DAMAGE
	const BATTLEANIM_ENEMY_STAT_DOWN
	const BATTLEANIM_PLAYER_STAT_DOWN
	const BATTLEANIM_PLAYER_DAMAGE
	const BATTLEANIM_WOBBLE
	const BATTLEANIM_SHAKE
	const BATTLEANIM_HIT_CONFUSION
