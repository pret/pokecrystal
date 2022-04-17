; Boolean checks
DEF FALSE EQU 0
DEF TRUE  EQU 1

; genders
DEF MALE   EQU 0
DEF FEMALE EQU 1

; FlagAction arguments (see home/flag.asm)
	const_def
	const RESET_FLAG
	const SET_FLAG
	const CHECK_FLAG

; G/S version ID: 0 = Gold, 1 = Silver (used by checkver)
; Mystery Gift uses incremented values 1 and 2
DEF GS_VERSION EQU 0
; Pokémon Pikachu 2, a step counter / virtual pet device (used by Mystery Gift)
DEF POKEMON_PIKACHU_2_VERSION EQU 3
DEF RESERVED_GAME_VERSION EQU 4

; save file corruption check values
DEF SAVE_CHECK_VALUE_1 EQU 99
DEF SAVE_CHECK_VALUE_2 EQU 127

; RTC halted check value
DEF RTC_HALT_VALUE EQU $1234

; time of day boundaries
DEF MORN_HOUR EQU 4  ; 4 AM
DEF DAY_HOUR  EQU 10 ; 10 AM
DEF NITE_HOUR EQU 18 ; 6 PM
DEF NOON_HOUR EQU 12 ; 12 PM
DEF MAX_HOUR  EQU 24 ; 12 AM

; significant money values
DEF START_MONEY EQU 3000
DEF MOM_MONEY   EQU 2300
DEF MAX_MONEY   EQU 999999
DEF MAX_COINS   EQU 9999

; link record
DEF MAX_LINK_RECORD EQU 9999

; day-care
DEF MAX_DAY_CARE_EXP EQU $500000

; hall of fame
DEF HOF_MASTER_COUNT EQU 200
