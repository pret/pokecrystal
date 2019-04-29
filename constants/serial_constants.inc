; link types
	const_def
	const LINK_NULL        ; 0
	const LINK_TIMECAPSULE ; 1
	const LINK_TRADECENTER ; 2
	const LINK_COLOSSEUM   ; 3
	const LINK_MOBILE      ; 4

; hSerialReceive high nybbles
SERIAL_TIMECAPSULE EQU $60
SERIAL_TRADECENTER EQU $70
SERIAL_BATTLE      EQU $80

ESTABLISH_CONNECTION_WITH_INTERNAL_CLOCK EQU $01
ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK EQU $02

START_TRANSFER_EXTERNAL_CLOCK EQU $80 ; 1 << rSC_ON
START_TRANSFER_INTERNAL_CLOCK EQU $81 ; (1 << rSC_ON) | 1

; hSerialConnectionStatus
USING_EXTERNAL_CLOCK       EQU $01
USING_INTERNAL_CLOCK       EQU $02
CONNECTION_NOT_ESTABLISHED EQU $ff

; signals the start of an array of bytes transferred over the link cable
SERIAL_PREAMBLE_BYTE              EQU $fd
; this byte is used when there is no data to send
SERIAL_NO_DATA_BYTE               EQU $fe
; signals the end of one part of a patch list (there are two parts) for player/enemy party data
SERIAL_PATCH_LIST_PART_TERMINATOR EQU $ff
