; pic + oam animations

frame: macro
	db \1
x = \2
if _NARG > 2
rept _NARG +- 2
x = x | (1 << (\3 + 1))
	shift
endr
endc
	db x
	endm

	enum_start $fc

	enum delanim_command ; $fc
delanim: macro ; used for oam
	db delanim_command
	endm

	enum dorepeat_command ; $fd
dorepeat: macro
	db dorepeat_command
	db \1 ; #
	endm

	enum setrepeat_command ; $fe
setrepeat: macro
	db setrepeat_command
	db \1 ; #
	endm

	enum endanim_command ; $ff
endanim: macro
	db endanim_command
	endm

__enum__ = $fe

	enum dorestart_command ; $fe
dorestart: macro ; used for oam
	db dorestart_command
	endm
