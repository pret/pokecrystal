; TrainerClassAttributes struct members (see data/trainers/attributes.asm)
	const_def
	const TRNATTR_ITEM1           ; 0
	const TRNATTR_ITEM2           ; 1
	const TRNATTR_BASEMONEY       ; 2
	const TRNATTR_AI_MOVE_WEIGHTS ; 3
	const TRNATTR_AI2             ; 4
	const TRNATTR_AI_ITEM_SWITCH  ; 5
	const TRNATTR_AI4             ; 6
NUM_TRAINER_ATTRIBUTES EQU const_value

; TRNATTR_AI_MOVE_WEIGHTS bit flags (wEnemyTrainerAIFlags)
; AIScoringPointers indexes (see engine/battle/ai/move.asm)
	const_def
	const       NO_AI
const_value = 0
	shift_const AI_BASIC
	shift_const AI_SETUP
	shift_const AI_TYPES
	shift_const AI_OFFENSIVE
	shift_const AI_SMART
	shift_const AI_OPPORTUNIST
	shift_const AI_AGGRESSIVE
	shift_const AI_CAUTIOUS
	shift_const AI_STATUS
	shift_const AI_RISKY
	shift_const AI_10
	shift_const AI_11
	shift_const AI_12
	shift_const AI_13
	shift_const AI_14
	shift_const AI_15

; TRNATTR_AI_ITEM_SWITCH bit flags
CONTEXT_USE_F      EQU 6
UNKNOWN_USE_F      EQU 5
ALWAYS_USE_F       EQU 4
SWITCH_SOMETIMES_F EQU 2
SWITCH_RARELY_F    EQU 1
SWITCH_OFTEN_F     EQU 0

CONTEXT_USE        EQU 1 << CONTEXT_USE_F
UNKNOWN_USE        EQU 1 << UNKNOWN_USE_F
ALWAYS_USE         EQU 1 << ALWAYS_USE_F
SWITCH_SOMETIMES   EQU 1 << SWITCH_SOMETIMES_F
SWITCH_RARELY      EQU 1 << SWITCH_RARELY_F
SWITCH_OFTEN       EQU 1 << SWITCH_OFTEN_F

; TrainerTypes indexes (see engine/battle/read_trainer_party.asm)
	const_def
	const TRAINERTYPE_NORMAL
	const TRAINERTYPE_MOVES
	const TRAINERTYPE_ITEM
	const TRAINERTYPE_ITEM_MOVES
