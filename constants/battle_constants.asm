; significant level values
MAX_LEVEL EQU 100
MIN_LEVEL EQU 2
EGG_LEVEL EQU 5

; maximum moves known per mon
NUM_MOVES EQU 4

; significant stat values
BASE_STAT_LEVEL EQU 7
MAX_STAT_LEVEL EQU 13

; minimum damage before type effectiveness
MIN_NEUTRAL_DAMAGE EQU 2

; turns that sleep lasts
REST_SLEEP_TURNS EQU 2
TREEMON_SLEEP_TURNS EQU 7

; default move priority
BASE_PRIORITY EQU 1

; type effectiveness factors, scaled by 10
SUPER_EFFECTIVE    EQU 20
MORE_EFFECTIVE     EQU 15
EFFECTIVE          EQU 10
NOT_VERY_EFFECTIVE EQU 05
NO_EFFECT          EQU 00

; wPlayerStatLevels and wEnemyStatLevels indexes (see wram.asm)
; GetStatName arguments (see data/battle/stat_names.asm)
	const_def
	const ATTACK
	const DEFENSE
	const SPEED
	const SP_ATTACK
	const SP_DEFENSE
	const ACCURACY
	const EVASION
	const ABILITY ; used for BattleCommand_Curse
NUM_LEVEL_STATS EQU const_value

; move struct members (see data/moves/moves.asm)
	const_def
	const MOVE_ANIM   ; 0
	const MOVE_EFFECT ; 1
	const MOVE_POWER  ; 2
	const MOVE_TYPE   ; 3
	const MOVE_ACC    ; 4
	const MOVE_PP     ; 5
	const MOVE_CHANCE ; 6
MOVE_LENGTH EQU const_value

; stat constants
; indexes for:
; - wPlayerStats and wEnemyStats (see wram.asm)
; - party_struct and battle_struct members (see macros/wram.asm)
	const_def 1
	const STAT_HP
	const STAT_ATK
	const STAT_DEF
	const STAT_SPD
	const STAT_SATK
NUM_EXP_STATS EQU const_value + -1
	const STAT_SDEF
NUM_STATS EQU const_value + -1
NUM_BATTLE_STATS EQU NUM_STATS + -1 ; don't count HP

; stat formula constants
STAT_MIN_NORMAL EQU 5
STAT_MIN_HP EQU 10

MAX_STAT_VALUE EQU 999

; shiny dvs
ATKDEFDV_SHINY EQU $EA
SPDSPCDV_SHINY EQU $AA

; battle classes (wBattleMode values)
	const_def 1
	const WILD_BATTLE
	const TRAINER_BATTLE

; battle types (wBattleType values)
	const_def
	const BATTLETYPE_NORMAL
	const BATTLETYPE_CANLOSE
	const BATTLETYPE_DEBUG
	const BATTLETYPE_TUTORIAL
	const BATTLETYPE_FISH
	const BATTLETYPE_ROAMING
	const BATTLETYPE_CONTEST
	const BATTLETYPE_SHINY
	const BATTLETYPE_TREE
	const BATTLETYPE_TRAP
	const BATTLETYPE_FORCEITEM
	const BATTLETYPE_CELEBI
	const BATTLETYPE_SUICUNE

; BattleVarPairs indexes (see home/battle.asm)
	const_def
	const BATTLE_VARS_SUBSTATUS1
	const BATTLE_VARS_SUBSTATUS2
	const BATTLE_VARS_SUBSTATUS3
	const BATTLE_VARS_SUBSTATUS4
	const BATTLE_VARS_SUBSTATUS5
	const BATTLE_VARS_SUBSTATUS1_OPP
	const BATTLE_VARS_SUBSTATUS2_OPP
	const BATTLE_VARS_SUBSTATUS3_OPP
	const BATTLE_VARS_SUBSTATUS4_OPP
	const BATTLE_VARS_SUBSTATUS5_OPP
	const BATTLE_VARS_STATUS
	const BATTLE_VARS_STATUS_OPP
	const BATTLE_VARS_MOVE_ANIM
	const BATTLE_VARS_MOVE_EFFECT
	const BATTLE_VARS_MOVE_POWER
	const BATTLE_VARS_MOVE_TYPE
	const BATTLE_VARS_MOVE
	const BATTLE_VARS_LAST_COUNTER_MOVE
	const BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	const BATTLE_VARS_LAST_MOVE
	const BATTLE_VARS_LAST_MOVE_OPP

; BattleVarLocations indexes (see home/battle.asm)
	const_def
	const PLAYER_SUBSTATUS_1
	const ENEMY_SUBSTATUS_1
	const PLAYER_SUBSTATUS_2
	const ENEMY_SUBSTATUS_2
	const PLAYER_SUBSTATUS_3
	const ENEMY_SUBSTATUS_3
	const PLAYER_SUBSTATUS_4
	const ENEMY_SUBSTATUS_4
	const PLAYER_SUBSTATUS_5
	const ENEMY_SUBSTATUS_5
	const PLAYER_STATUS
	const ENEMY_STATUS
	const PLAYER_MOVE_ANIMATION
	const ENEMY_MOVE_ANIMATION
	const PLAYER_MOVE_EFFECT
	const ENEMY_MOVE_EFFECT
	const PLAYER_MOVE_POWER
	const ENEMY_MOVE_POWER
	const PLAYER_MOVE_TYPE
	const ENEMY_MOVE_TYPE
	const PLAYER_CUR_MOVE
	const ENEMY_CUR_MOVE
	const PLAYER_COUNTER_MOVE
	const ENEMY_COUNTER_MOVE
	const PLAYER_LAST_MOVE
	const ENEMY_LAST_MOVE

; status condition bit flags
SLP EQU %111 ; 0-7 turns
	const_def 3
	const PSN
	const BRN
	const FRZ
	const PAR

ALL_STATUS EQU (1 << PSN) | (1 << BRN) | (1 << FRZ) | (1 << PAR) | SLP

; wPlayerSubStatus1 or wEnemySubStatus1 bit flags
	enum_start 7, -1
	enum SUBSTATUS_IN_LOVE
	enum SUBSTATUS_ROLLOUT
	enum SUBSTATUS_ENDURE
	enum SUBSTATUS_PERISH
	enum SUBSTATUS_IDENTIFIED
	enum SUBSTATUS_PROTECT
	enum SUBSTATUS_CURSE
	enum SUBSTATUS_NIGHTMARE

; wPlayerSubStatus2 or wEnemySubStatus2 bit flags
SUBSTATUS_CURLED EQU 0

; wPlayerSubStatus3 or wEnemySubStatus3 bit flags
	enum_start 7, -1
	enum SUBSTATUS_CONFUSED
	enum SUBSTATUS_FLYING
	enum SUBSTATUS_UNDERGROUND
	enum SUBSTATUS_CHARGED
	enum SUBSTATUS_FLINCHED
	enum SUBSTATUS_IN_LOOP
	enum SUBSTATUS_RAMPAGE
	enum SUBSTATUS_BIDE

; wPlayerSubStatus4 or wEnemySubStatus4 bit flags
	enum_start 7, -1
	enum SUBSTATUS_LEECH_SEED
	enum SUBSTATUS_RAGE
	enum SUBSTATUS_RECHARGE
	enum SUBSTATUS_SUBSTITUTE
	enum SUBSTATUS_UNKNOWN_1
	enum SUBSTATUS_FOCUS_ENERGY
	enum SUBSTATUS_MIST
	enum SUBSTATUS_X_ACCURACY

; wPlayerSubStatus5 or wEnemySubStatus5 bit flags
	enum_start 7, -1
	enum SUBSTATUS_CANT_RUN
	enum SUBSTATUS_DESTINY_BOND
	enum SUBSTATUS_LOCK_ON
	enum SUBSTATUS_ENCORED
	enum SUBSTATUS_TRANSFORMED
	enum SUBSTATUS_UNKNOWN_2
	enum SUBSTATUS_UNKNOWN_3
	enum SUBSTATUS_TOXIC

; wPlayerScreens or wEnemyScreens bit flags
	enum_start 4, -1
	enum SCREENS_REFLECT
	enum SCREENS_LIGHT_SCREEN
	enum SCREENS_SAFEGUARD
	enum SCREENS_UNUSED
	enum SCREENS_SPIKES

; values in wBattleWeather
	const_def
	const WEATHER_NONE
	const WEATHER_RAIN
	const WEATHER_SUN
	const WEATHER_SANDSTORM
	const WEATHER_RAIN_END
	const WEATHER_SUN_END
	const WEATHER_SANDSTORM_END

; wBattleAction
	const_def
	const BATTLEACTION_MOVE1
	const BATTLEACTION_MOVE2
	const BATTLEACTION_MOVE3
	const BATTLEACTION_MOVE4
	const BATTLEACTION_SWITCH1
	const BATTLEACTION_SWITCH2
	const BATTLEACTION_SWITCH3
	const BATTLEACTION_SWITCH4
	const BATTLEACTION_SWITCH5
	const BATTLEACTION_SWITCH6
	const BATTLEACTION_A
	const BATTLEACTION_B
	const BATTLEACTION_C
	const BATTLEACTION_SKIPTURN
	const BATTLEACTION_STRUGGLE
	const BATTLEACTION_FORFEIT

; wBattlePlayerAction
	const_def
	const BATTLEPLAYERACTION_USEMOVE
	const BATTLEPLAYERACTION_USEITEM
	const BATTLEPLAYERACTION_SWITCH

; wBattleResult
	const_def
	const WIN
	const LOSE
	const DRAW

BATTLERESULT_CAUGHT_CELEBI EQU 6
BATTLERESULT_BOX_FULL EQU 7
BATTLERESULT_BITMASK EQU (1 << BATTLERESULT_CAUGHT_CELEBI) | (1 << BATTLERESULT_BOX_FULL)
