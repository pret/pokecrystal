FarCall_de:: ; 2d54
; Call a:de.
; Preserves other registers.

	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch
	call .de
	jr ReturnFarCall

.de
	push de
	ret
; 2d63


FarCall_hl:: ; 2d63
; Call a:hl.
; Preserves other registers.

	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch
	call Function2d82
; 2d6e

ReturnFarCall:: ; 2d6e
; We want to retain the contents of f.
; To do this, we can pop to bc instead of af.
	
	ld a, b
	ld [PredefAddress + 2], a
	ld a, c
	ld [PredefAddress + 3], a
	
; Restore the working bank.
	pop bc
	ld a, b
	rst Bankswitch
	
	ld a, [PredefAddress + 2]
	ld b, a
	ld a, [PredefAddress + 3]
	ld c, a
	ret
; 2d82

Function2d82:: ; 2d82
	jp [hl]
; 2d83
