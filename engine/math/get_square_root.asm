DEF NUM_SQUARE_ROOTS EQU 255

GetSquareRoot:
; Return the square root of de in b.

; Rather than calculating the result, we take the index of the
; first value in a table of squares that isn't lower than de.

	ld hl, .Squares
	ld b, 0
.loop
; Make sure we don't go past the end of the table.
	inc b
	ld a, b
	cp NUM_SQUARE_ROOTS
	ret z

; Iterate over the table until b**2 >= de.
	ld a, [hli]
	sub e
	ld a, [hli]
	sbc d

	jr c, .loop
	ret

.Squares:
for x, 1, NUM_SQUARE_ROOTS + 1
	dw x**2
endr
