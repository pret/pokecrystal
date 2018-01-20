; Boolean checks
FALSE EQU 0
TRUE  EQU 1

; genders
MALE   EQU 0
FEMALE EQU 1

; FlagAction arguments (see home/flag.asm)
RESET_FLAG EQU 0
SET_FLAG   EQU 1
CHECK_FLAG EQU 2

; GetHPPal return values (see home.asm)
HP_GREEN  EQU 0
HP_YELLOW EQU 1
HP_RED    EQU 2

; G/S version ID: 0 = Gold, 1 = Silver (used by checkver)
GS_VERSION EQU 0

; save file corruption check values
SAVE_CHECK_VALUE_1 EQU 99
SAVE_CHECK_VALUE_2 EQU 127

; hMenuReturn
HMENURETURN_SCRIPT EQU %10000000
HMENURETURN_ASM    EQU %11111111

; DoPlayerMovement.DoStep arguments (see engine/player_movement.asm)
	const_def
	const STEP_SLOW          ; 0
	const STEP_WALK          ; 1
	const STEP_BIKE          ; 2
	const STEP_LEDGE         ; 3
	const STEP_ICE           ; 4
	const STEP_TURN          ; 5
	const STEP_BACK_LEDGE    ; 6
	const STEP_WALK_IN_PLACE ; 7

; time of day boundaries
MORN_HOUR EQU 4  ; 4 AM
DAY_HOUR  EQU 10 ; 10 AM
NITE_HOUR EQU 18 ; 6 PM
NOON_HOUR EQU 12 ; 12 PM
MAX_HOUR  EQU 24 ; 12 AM

; boxes
MONS_PER_BOX EQU 20
NUM_BOXES    EQU 14

; hall of fame
HOF_MON_LENGTH = 1 + 2 + 2 + 1 + (MON_NAME_LENGTH +- 1) ; species, id, dvs, level, nick
HOF_LENGTH = 1 + HOF_MON_LENGTH * PARTY_LENGTH + 1 ; win count, party, terminator
NUM_HOF_TEAMS = 30

MAX_LINK_RECORD EQU 9999

; significant money values
START_MONEY EQU 3000
MOM_MONEY   EQU 2300
MAX_MONEY   EQU 999999
MAX_COINS   EQU 9999

; ChangeHappiness arguments (see data/happiness_changes.asm)
const_value = 1
	const HAPPINESS_GAINLEVEL         ; 01
	const HAPPINESS_USEDITEM          ; 02
	const HAPPINESS_USEDXITEM         ; 03
	const HAPPINESS_GYMBATTLE         ; 04
	const HAPPINESS_LEARNMOVE         ; 05
	const HAPPINESS_FAINTED           ; 06
	const HAPPINESS_POISONFAINT       ; 07
	const HAPPINESS_BEATENBYSTRONGFOE ; 08
	const HAPPINESS_YOUNGCUT1         ; 09
	const HAPPINESS_YOUNGCUT2         ; 0a
	const HAPPINESS_YOUNGCUT3         ; 0b
	const HAPPINESS_OLDERCUT1         ; 0c
	const HAPPINESS_OLDERCUT2         ; 0d
	const HAPPINESS_OLDERCUT3         ; 0e
	const HAPPINESS_BITTERPOWDER      ; 0f
	const HAPPINESS_ENERGYROOT        ; 10
	const HAPPINESS_REVIVALHERB       ; 11
	const HAPPINESS_MASSAGE           ; 12
	const HAPPINESS_GAINLEVELATHOME   ; 13

; day-care
MAX_DAY_CARE_EXP EQU $500000

; bug-catching contest
BUG_CONTEST_MINUTES EQU 20
BUG_CONTEST_SECONDS EQU 0
BUG_CONTEST_PLAYER EQU 1
NUM_BUG_CONTESTANTS EQU 10 ; not counting the player
BUG_CONTESTANT_SIZE EQU 4
