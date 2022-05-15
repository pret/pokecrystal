GetPredefPointer::
; Return the bank and address of wPredefID in a and wPredefAddress.

; Save hl for later (back in Predef)
	ld a, h
	ld [wPredefHL], a
	ld a, l
	ld [wPredefHL + 1], a

	push de
	ld a, [wPredefID]
	ld e, a
	ld d, 0
	ld hl, PredefPointers
	add hl, de
	add hl, de
	add hl, de
	pop de

	ld a, [hli]
	ld [wPredefAddress + 1], a
	ld a, [hli]
	ld [wPredefAddress], a
	ld a, [hl]

	ret

INCLUDE "data/predef_pointers.asm"
