; MonType: ; cf5f
	const_def
	const PARTYMON   ; 0
	const OTPARTYMON ; 1
	const BOXMON     ; 2
	const TEMPMON    ; 3
	const WILDMON    ; 4

; Options: (bits) ; cfcc
const_value set 4
	const NO_TEXT_SCROLL ; 4
	const STEREO         ; 5
	const BATTLE_SHIFT   ; 6
	const BATTLE_SCENE   ; 7

; Options: (bits 0-2)
TEXT_DELAY_FAST EQU 1
TEXT_DELAY_MED  EQU 3
TEXT_DELAY_SLOW EQU 5

; TextBoxFrame: ; cfce
	const_def
	const FRAME_1 ; 0
	const FRAME_2 ; 1
	const FRAME_3 ; 2
	const FRAME_4 ; 3
	const FRAME_5 ; 4
	const FRAME_6 ; 5
	const FRAME_7 ; 6
	const FRAME_8 ; 7
NUM_FRAMES EQU const_value

; TextBoxFlags:
	const_def
	const FAST_TEXT_DELAY_F ; 0
	const NO_TEXT_DELAY_F   ; 1

; Options2:
	const_def
	const MENU_ACCOUNT ; 0

; GBPrinter:
GBPRINTER_LIGHTEST EQU $00
GBPRINTER_LIGHTER  EQU $20
GBPRINTER_NORMAL   EQU $40
GBPRINTER_DARKER   EQU $60
GBPRINTER_DARKEST  EQU $7f

; WalkingDirection: ; d043
const_value set -1
	const STANDING ; -1
	const DOWN     ; 0
	const UP       ; 1
	const LEFT     ; 2
	const RIGHT    ; 3
NUM_DIRECTIONS EQU const_value

DOWN_MASK  EQU 1 << DOWN
UP_MASK    EQU 1 << UP
LEFT_MASK  EQU 1 << LEFT
RIGHT_MASK EQU 1 << RIGHT

; FacingDirection: ; d044
FACE_CURRENT EQU 0
FACE_DOWN  EQU 8
FACE_UP    EQU 4
FACE_LEFT  EQU 2
FACE_RIGHT EQU 1

; TimeOfDay: ; d269
	const_def
	const MORN_F     ; 0
	const DAY_F      ; 1
	const NITE_F     ; 2
	const DARKNESS_F ; 3
NUM_DAYTIMES EQU const_value

MORN     EQU 1 << MORN_F
DAY      EQU 1 << DAY_F
NITE     EQU 1 << NITE_F
DARKNESS EQU 1 << DARKNESS_F

; ScriptFlags: ; d434
SCRIPT_RUNNING EQU 2

; ScriptMode: ; d437
SCRIPT_OFF EQU 0
SCRIPT_READ EQU 1
SCRIPT_WAIT_MOVEMENT EQU 2
SCRIPT_WAIT EQU 3

; CurDay: ; d4cb
	const_def
	const SUNDAY    ; 0
	const MONDAY    ; 1
	const TUESDAY   ; 2
	const WEDNESDAY ; 3
	const THURSDAY  ; 4
	const FRIDAY    ; 5
	const SATURDAY  ; 6

; MapObjects: ; d71e

PLAYER_OBJECT EQU 0

NUM_OBJECTS   EQU $10

; InputType: ; c2c7
AUTO_INPUT EQU $ff

; WhichRegisteredItem: ; d95b
REGISTERED_POCKET EQU %11000000
REGISTERED_NUMBER EQU %00111111

; PlayerState: ; d95d
PLAYER_NORMAL    EQU 0
PLAYER_BIKE      EQU 1
PLAYER_SKATE     EQU 2
PLAYER_SURF      EQU 4
PLAYER_SURF_PIKA EQU 8

; After-Champion Spawn
SPAWN_LANCE EQU 1
SPAWN_RED   EQU 2

; wPokemonWithdrawDepositParameter
PC_WITHDRAW       EQU 0
PC_DEPOSIT        EQU 1
DAY_CARE_WITHDRAW EQU 2
DAY_CARE_DEPOSIT  EQU 3

; wCurrentDexMode
	const_def
	const DEXMODE_NEW
	const DEXMODE_OLD
	const DEXMODE_ABC
	const DEXMODE_UNOWN

; wJohtoBadges:
	const_def
	const ZEPHYRBADGE
	const HIVEBADGE
	const PLAINBADGE
	const FOGBADGE
	const MINERALBADGE
	const STORMBADGE
	const GLACIERBADGE
	const RISINGBADGE
NUM_JOHTO_BADGES EQU const_value

; wKantoBadges:
	const_def
	const BOULDERBADGE
	const CASCADEBADGE
	const THUNDERBADGE
	const RAINBOWBADGE
	const SOULBADGE
	const MARSHBADGE
	const VOLCANOBADGE
	const EARTHBADGE
NUM_KANTO_BADGES EQU const_value
NUM_BADGES EQU NUM_JOHTO_BADGES + NUM_KANTO_BADGES

; wInitListType:
INIT_ENEMYOT_LIST    EQU 1
INIT_BAG_ITEM_LIST   EQU 2
INIT_OTHER_ITEM_LIST EQU 3
INIT_PLAYEROT_LIST   EQU 4
INIT_MON_LIST        EQU 5
