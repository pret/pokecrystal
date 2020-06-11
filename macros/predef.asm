lda_predef: MACRO
; Some functions load the predef id
; without immediately calling Predef.
	ld a, (\1Predef - PredefPointers) / 3
ENDM

predef: MACRO
	lda_predef \1
	call Predef
ENDM

predef_jump: MACRO
	lda_predef \1
	jp Predef
ENDM
