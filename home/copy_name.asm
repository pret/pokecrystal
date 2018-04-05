CopyName1:: ; 30d6
; Copies the name from de to wStringBuffer2
	ld hl, wStringBuffer2

CopyName2:: ; 30d9
; Copies the name from de to hl
.loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .loop
	ret
; 30e1
