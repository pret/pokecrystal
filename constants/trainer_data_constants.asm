; TrainerClassAttributes struct members (see data/trainers/attributes.asm)
rsreset
TRNATTR_ITEM1           rb ; 0
TRNATTR_ITEM2           rb ; 1
TRNATTR_BASEMONEY       rb ; 2
TRNATTR_AI_MOVE_WEIGHTS rw ; 3
TRNATTR_AI_ITEM_SWITCH  rw ; 5
NUM_TRAINER_ATTRIBUTES EQU _RS

; TRNATTR_AI_MOVE_WEIGHTS bit flags (wEnemyTrainerAIFlags)
; AIScoringPointers indexes (see engine/battle/ai/move.asm)
	const_def
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
NO_AI EQU 0

; TRNATTR_AI_ITEM_SWITCH bit flags
	const_def
	const SWITCH_OFTEN_F     ; 0
	const SWITCH_RARELY_F    ; 1
	const SWITCH_SOMETIMES_F ; 2
	const_skip               ; 3
	const ALWAYS_USE_F       ; 4
	const UNKNOWN_USE_F      ; 5
	const CONTEXT_USE_F      ; 6

SWITCH_OFTEN       EQU 1 << SWITCH_OFTEN_F
SWITCH_RARELY      EQU 1 << SWITCH_RARELY_F
SWITCH_SOMETIMES   EQU 1 << SWITCH_SOMETIMES_F
ALWAYS_USE         EQU 1 << ALWAYS_USE_F
UNKNOWN_USE        EQU 1 << UNKNOWN_USE_F
CONTEXT_USE        EQU 1 << CONTEXT_USE_F

; TrainerTypes indexes (see engine/battle/read_trainer_party.asm)
	const_def
	const TRAINERTYPE_NORMAL
	const TRAINERTYPE_MOVES
	const TRAINERTYPE_ITEM
	const TRAINERTYPE_ITEM_MOVES
