CompareBytes::
; Compare c bytes at de and hl.
; Return z if they all match.
.loop
	ld a, [de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec c
	jr nz, .loop
	ret

CompareBytesLong::
; Compare bc bytes at de and hl.
; Return carry if they all match.
.loop
	ld a, [de]
	cp [hl]
	jr nz, .diff

	inc de
	inc hl
	dec bc

	ld a, b
	or c
	jr nz, .loop

	scf
	ret

.diff:
	and a
	ret
