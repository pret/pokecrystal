; pic + oam animations

frame: MACRO
	db \1
x = \2
if _NARG > 2
rept _NARG +- 2
x = x | (1 << (\3 + 1))
	shift
endr
endc
	db x
ENDM

	enum_start $fc

	enum delanim_command ; $fc
delanim: MACRO ; used for oam
	db delanim_command
ENDM

	enum dorepeat_command ; $fd
dorepeat: MACRO
	db dorepeat_command
	db \1 ; #
ENDM

	enum setrepeat_command ; $fe
setrepeat: MACRO
	db setrepeat_command
	db \1 ; #
ENDM

	enum endanim_command ; $ff
endanim: MACRO
	db endanim_command
ENDM

__enum__ = $fe

	enum dorestart_command ; $fe
dorestart: MACRO ; used for oam
	db dorestart_command
ENDM
