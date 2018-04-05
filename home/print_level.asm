PrintLevel:: ; 382d
; Print wTempMonLevel at hl

	ld a, [wTempMonLevel]
	ld [hl], "<LV>"
	inc hl

; How many digits?
	ld c, 2
	cp 100 ; This is distinct from MAX_LEVEL.
	jr c, Print8BitNumRightAlign

; 3-digit numbers overwrite the :L.
	dec hl
	inc c
	jr Print8BitNumRightAlign
; 383d

PrintLevel_Force3Digits:: ; 383d
; Print :L and all 3 digits
	ld [hl], "<LV>"
	inc hl
	ld c, 3
; 3842

Print8BitNumRightAlign:: ; 3842
	ld [wd265], a
	ld de, wd265
	ld b, PRINTNUM_RIGHTALIGN | 1
	jp PrintNum
; 384d
