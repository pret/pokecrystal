; pic + oam animations

frame: MACRO
	db \1
x = \2
if _NARG > 2
rept _NARG - 2
x = x | (1 << (\3 + 1))
	shift
endr
endc
	db x
ENDM

	const_def $fc

	const delanim_command ; $fc
delanim: MACRO
; Removes the object from the screen, as opposed to `endanim` which just stops all motion
	db delanim_command
ENDM

	const dowait_command ; $fd
dowait: MACRO
	db dowait_command
	db \1 ; frames
ENDM

	const dorestart_command ; $fe
dorestart: MACRO
	db dorestart_command
ENDM

	const endanim_command ; $ff
endanim: MACRO
	db endanim_command
ENDM


; Used for pic animations
const_value = $fd

	const dorepeat_command ; $fd
dorepeat: MACRO
	db dorepeat_command
	db \1 ; command offset to jump to
ENDM

	const setrepeat_command ; $fe
setrepeat: MACRO
	db setrepeat_command
	db \1 ; amount of times to repeat
ENDM
