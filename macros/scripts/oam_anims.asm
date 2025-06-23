; Battle and sprite OAM animations

MACRO oamframe
	db \1 ; duration
	DEF x = \2
	assert !(x & (1 << (B_OAM_XFLIP + 1) | 1 << (B_OAM_YFLIP + 1))), \
		"oamframe duration overflows into X/Y flip bits"
	if _NARG > 2
		rept _NARG - 2
			DEF x |= 1 << (\3 + 1)
			shift
		endr
	endc
	db x ; flags
ENDM

	const_def -1, -1

	const oamend_command ; $ff
MACRO oamend
	db oamend_command
ENDM

	const oamrestart_command ; $fe
MACRO oamrestart
	db oamrestart_command
ENDM

	const oamwait_command ; $fd
MACRO oamwait
	db oamwait_command
	db \1 ; frames
ENDM

	const oamdelete_command ; $fc
MACRO oamdelete
	db oamdelete_command
ENDM

DEF FIRST_OAM_CMD EQU LOW(const_value + 1)
