; TrainerClassAttributes struct members (see data/trainers/attributes.asm)
rsreset
DEF TRNATTR_ITEM1           rb ; 0
DEF TRNATTR_ITEM2           rb ; 1
DEF TRNATTR_BASEMONEY       rb ; 2
DEF TRNATTR_AI_MOVE_WEIGHTS rw ; 3
DEF TRNATTR_AI_ITEM_SWITCH  rw ; 5
DEF NUM_TRAINER_ATTRIBUTES EQU _RS

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
DEF NO_AI EQU 0

; TRNATTR_AI_ITEM_SWITCH bit flags
	const_def
	shift_const SWITCH_OFTEN     ; 0
	shift_const SWITCH_RARELY    ; 1
	shift_const SWITCH_SOMETIMES ; 2
	const_skip
	shift_const ALWAYS_USE       ; 4
	shift_const UNKNOWN_USE      ; 5
	shift_const CONTEXT_USE      ; 6

; TrainerTypes indexes (see engine/battle/read_trainer_party.asm)
	const_def
	const TRAINERTYPE_NORMAL
	const TRAINERTYPE_MOVES
	const TRAINERTYPE_ITEM
	const TRAINERTYPE_ITEM_MOVES
