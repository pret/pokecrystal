; pic + oam animations

frame: MACRO
	db \1
x = \2
if _NARG > 2
rept _NARG + -2
x = x | (1 << (\3 + 1))
	shift
endr
endc
	db x
ENDM

	enum_start $fc

	enum delanim_command ; $fc
delanim: MACRO
; Removes the object from the screen, as opposed to `endanim` which just stops all motion
	db delanim_command
ENDM

	enum dowait_command ; $fd
dowait: MACRO
	db dowait_command
	db \1 ; frames
ENDM

	enum dorestart_command ; $fe
dorestart: MACRO
	db dorestart_command
ENDM

	enum endanim_command ; $ff
endanim: MACRO
	db endanim_command
ENDM


; Used for pic animations
__enum__ = $fd

	enum dorepeat_command ; $fd
dorepeat: MACRO
	db dorepeat_command
	db \1 ; command offset to jump to
ENDM

	enum setrepeat_command ; $fe
setrepeat: MACRO
	db setrepeat_command
	db \1 ; amount of times to repeat
ENDM
