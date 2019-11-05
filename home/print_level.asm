PrintLevel::
; Print wTempMonLevel at hl

	ld a, [wTempMonLevel]
	ld [hl], "<LV>"
	inc hl

; How many digits?
	ld c, 2
	cp 100 ; This is distinct from MAX_LEVEL.
	jr c, Print8BitNumLeftAlign

; 3-digit numbers overwrite the :L.
	dec hl
	inc c
	jr Print8BitNumLeftAlign

PrintLevel_Force3Digits::
; Print :L and all 3 digits
	ld [hl], "<LV>"
	inc hl
	ld c, 3

Print8BitNumLeftAlign::
	ld [wDeciramBuffer], a
	ld de, wDeciramBuffer
	ld b, PRINTNUM_LEFTALIGN | 1
	jp PrintNum
