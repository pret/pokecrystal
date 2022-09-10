; Predef function calls

MACRO lda_predef
; Some functions load the predef id
; without immediately calling Predef.
	ld a, (\1Predef - PredefPointers) / 3
ENDM

MACRO predef
	lda_predef \1
	call Predef
ENDM

MACRO predef_jump
	lda_predef \1
	jp Predef
ENDM
