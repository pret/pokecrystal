trainerclass: MACRO
	enum \1
const_value = 1
ENDM

trainer: MACRO
	; flag, group, id, seen text, win text, lost text, talk-again text
	dw \1
	db \2, \3
	dw \4, \5, \6, \7
ENDM
