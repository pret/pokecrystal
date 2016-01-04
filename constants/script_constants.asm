; script vars
PLAYER      EQU  0
LAST_TALKED EQU -2

	const_def
	const VAR_STRINGBUFFER2    ; 00
	const VAR_PARTYCOUNT       ; 01
	const VAR_BATTLERESULT     ; 02
	const VAR_BATTLETYPE       ; 03
	const VAR_TIMEOFDAY        ; 04
	const VAR_DEXCAUGHT        ; 05
	const VAR_DEXSEEN          ; 06
	const VAR_BADGES           ; 07
	const VAR_MOVEMENT         ; 08
	const VAR_FACING           ; 09
	const VAR_HOUR             ; 0a
	const VAR_WEEKDAY          ; 0b
	const VAR_MAPGROUP         ; 0c
	const VAR_MAPNUMBER        ; 0d
	const VAR_UNOWNCOUNT       ; 0e
	const VAR_ROOFPALETTE      ; 0f
	const VAR_BOXSPACE         ; 10
	const VAR_CONTESTMINUTES   ; 11
	const VAR_XCOORD           ; 12
	const VAR_YCOORD           ; 13
	const VAR_SPECIALPHONECALL ; 14
	const VAR_BT_WIN_STREAK    ; 15
	const VAR_KURT_APRICORNS   ; 16
	const VAR_CALLERID         ; 17
	const VAR_BLUECARDBALANCE  ; 18
	const VAR_BUENASPASSWORD   ; 19
	const VAR_KENJI_BREAK      ; 1a
NUM_VARS EQU const_value       ; 1b

RETVAR_STRBUF2 EQU (0 << 6)
RETVAR_ADDR_DE EQU (1 << 6)
RETVAR_EXECUTE EQU (2 << 6)

const_value SET -1
	const PLAYEREVENT_MAPSCRIPT
	const PLAYEREVENT_NONE
	const PLAYEREVENT_SEENBYTRAINER
	const PLAYEREVENT_TALKTOTRAINER
	const PLAYEREVENT_ITEMBALL
	const PLAYEREVENT_CONNECTION
	const PLAYEREVENT_WARP
	const PLAYEREVENT_FALL
	const PLAYEREVENT_WHITEOUT
	const PLAYEREVENT_HATCH
	const PLAYEREVENT_JOYCHANGEFACING
NUM_PLAYER_EVENTS EQU const_value
