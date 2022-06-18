; Modern support for legacy pokecrystal and fanhacks that use older codebase
; Allows porting scripts with as few edits as possible.

; macros/rst.asm
DEF farcall EQUS "callba"
DEF callfar EQUS "callab"

; macros/scripts/audio.asm

transpose: MACRO
	pitchoffset \1, \2 + 1
ENDM
