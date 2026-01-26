MACRO frame
	if _NARG <= 2
		db \1 ; index
		db \2 ; duration
	else
	; LEGACY: Support for the old name of "oamanim"
		oamanim \#
	endc
ENDM

	const_def -1, -1

	const endanim_command ; $ff
	assert endanim_command == oamend_command ; LEGACY: Support for the old name of "oamend"
MACRO endanim
	db endanim_command
ENDM

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
