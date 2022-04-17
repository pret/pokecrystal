; pic + oam animations

MACRO frame
	db \1
	DEF x = \2
if _NARG > 2
rept _NARG - 2
	DEF x |= 1 << (\3 + 1)
	shift
endr
endc
	db x
ENDM

	const_def -1, -1

	const endanim_command ; $ff
MACRO endanim
	db endanim_command
ENDM

	const dorestart_command ; $fe
MACRO dorestart
	db dorestart_command
ENDM

	const dowait_command ; $fd
MACRO dowait
	db dowait_command
	db \1 ; frames
ENDM

	const delanim_command ; $fc
MACRO delanim
; Removes the object from the screen, as opposed to `endanim` which just stops all motion
	db delanim_command
ENDM


; Used for pic animations
	const_def -2, -1

	const setrepeat_command ; $fe
MACRO setrepeat
	db setrepeat_command
	db \1 ; amount of times to repeat
ENDM

	const dorepeat_command ; $fd
MACRO dorepeat
	db dorepeat_command
	db \1 ; command offset to jump to
ENDM
