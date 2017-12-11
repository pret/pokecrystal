; MonType: ; cf5f
	const_def
	const PARTYMON   ; 0
	const OTPARTYMON ; 1
	const BOXMON     ; 2
	const TEMPMON    ; 3
	const WILDMON    ; 4

; Options: (bits) ; cfcc
const_value SET 5
	const STEREO       ; 5
	const BATTLE_SHIFT ; 6
	const BATTLE_SCENE ; 7

; Options: (bits 0-2 values) ; cfcc
FAST_TEXT      EQU 0
MED_TEXT       EQU 1
SLOW_TEXT      EQU 2
NO_TEXT_SCROLL EQU 4

; Options2:
	const_def
	const MENU_ACCOUNT ; 0

; GBPrinter:
PRINT_LIGHTEST EQU $00
PRINT_LIGHTER  EQU $20
PRINT_NORMAL   EQU $40
PRINT_DARKER   EQU $60
PRINT_DARKEST  EQU $7f

; WalkingDirection: ; d043
const_value SET -1
	const STANDING ; -1
	const DOWN     ; 0
	const UP       ; 1
	const LEFT     ; 2
	const RIGHT    ; 3

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
PLAYER_SLIP      EQU 2
PLAYER_SURF      EQU 4
PLAYER_SURF_PIKA EQU 8

OBJECT_STRUCT_LENGTH EQU 40
NUM_OBJECT_STRUCTS EQU 13

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

; JohtoBadges:
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

; KantoBadges:
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
