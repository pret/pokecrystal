INCLUDE "macros/event.asm"
INCLUDE "macros/sound.asm"
INCLUDE "macros/text.asm"
INCLUDE "macros/charmap.asm"
INCLUDE "macros/move_effect.asm"
INCLUDE "macros/move_anim.asm"
INCLUDE "macros/movement.asm"
INCLUDE "macros/map.asm"


RGB: MACRO
	dw ((\3) << 10) + ((\2) << 5) + (\1)
	ENDM


percent EQUS "* $ff / 100"

; macros require rst vectors to be defined
FarCall    EQU $08
Bankswitch EQU $10
JumpTable  EQU $28

farcall: MACRO ; bank, address
	ld a, BANK(\1)
	ld hl, \1
	rst FarCall
	ENDM

callba EQUS "farcall"

callab: MACRO ; address, bank
	ld hl, \1
	ld a, BANK(\1)
	rst FarCall
	ENDM


NONE EQU 0


dwb: MACRO
	dw \1
	db \2
	ENDM

dbw: MACRO
	db \1
	dw \2
	ENDM

dbbw: MACRO
	db \1, \2
	dw \3
	ENDM

dbwww: MACRO
	db \1
	dw \2, \3, \4
	ENDM

dn: MACRO
	rept _NARG / 2
	db (\1) << 4 + (\2)
	shift
	shift
	endr
	ENDM

dt: MACRO ; three-byte (big-endian)
	db ((\1) >> 16) & $ff
	db ((\1) >> 8)  & $ff
	db (\1)         & $ff
	ENDM

bigdw: MACRO ; big-endian word
	db (\1) / $100
	db (\1) % $100
	ENDM


lb: MACRO ; r, hi, lo
	ld \1, (\2) << 8 + (\3)
	ENDM

bccoord: MACRO
	coord bc, \1, \2
	ENDM

decoord: MACRO
	coord de, \1, \2
	ENDM

hlcoord: MACRO
	coord hl, \1, \2
	ENDM

coord: MACRO
	ld \1, TileMap + SCREEN_WIDTH * (\3) + (\2)
	ENDM


; pic animations
frame: MACRO
	db \1
	db \2
	ENDM
setrepeat: MACRO
	db $fe
	db \1
	ENDM
dorepeat: MACRO
	db $fd
	db \1
	ENDM
endanim: MACRO
	db $ff
	ENDM


; Constant enumeration

const_def: MACRO
const_value SET 0
ENDM

const: MACRO
\1 EQU const_value
const_value SET const_value + 1
ENDM



note: MACRO
	dn (\1), (\2) - 1
	ENDM

sound: macro
	db \1 ; duration
	db \2 ; intensity
	dw \3 ; frequency
	endm

noise: macro
	db \1 ; duration
	db \2 ; intensity
	db \3 ; frequency
	endm

; pitch
__ EQU 0
C_ EQU 1
C# EQU 2
D_ EQU 3
D# EQU 4
E_ EQU 5
F_ EQU 6
F# EQU 7
G_ EQU 8
G# EQU 9
A_ EQU 10
A# EQU 11
B_ EQU 12



; maps

map: MACRO
; This is a really silly hack to get around an rgbds bug.

; Ideally:
;	db GROUP_\1, MAP_\1

\1\@  EQUS "GROUP_\1"
\1\@2 EQUS "MAP_\1"
	db \1\@, \1\@2
ENDM

roam_map: MACRO
; A map and an arbitrary number of some more maps.

	map \1
	db  \2

	rept \2
	map \3
	shift
	endr

	db 0
ENDM


sine_wave: MACRO
; \1: amplitude

x = 0
	rept $20
	; Round up.
	dw (sin(x) + (sin(x) & $ff)) >> 8
x = x + (\1) * $40000
	endr
ENDM


add_predef: MACRO
\1Predef::
	dw \1
	db BANK(\1)
ENDM

predef_id: MACRO
; Some functions load the predef id
; without immediately calling Predef.
	ld a, (\1Predef - PredefPointers) / 3
ENDM

predef: MACRO
	predef_id \1
	call Predef
ENDM

predef_jump: MACRO
	predef_id \1
	jp Predef
ENDM
