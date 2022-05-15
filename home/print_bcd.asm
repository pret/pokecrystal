PrintBCDNumber::
; function to print a BCD (Binary-coded decimal) number
; de = address of BCD number
; hl = destination address
; c = flags and length
; bit 7: if set, do not print leading zeroes
;        if unset, print leading zeroes
; bit 6: if set, left-align the string (do not pad empty digits with spaces)
;        if unset, right-align the string
; bit 5: if set, print currency symbol at the beginning of the string
;        if unset, do not print the currency symbol
; bits 0-4: length of BCD number in bytes
; Note that bits 5 and 7 are modified during execution. The above reflects
; their meaning at the beginning of the functions's execution.
	ld b, c ; save flags in b
	res PRINTNUM_LEADINGZEROS_F, c
	res PRINTNUM_LEFTALIGN_F, c
	res PRINTNUM_MONEY_F, c ; c now holds the length
	bit PRINTNUM_MONEY_F, b
	jr z, .loop
	bit PRINTNUM_LEADINGZEROS_F, b
	jr nz, .loop ; skip currency symbol
	ld [hl], "¥"
	inc hl
.loop
	ld a, [de]
	swap a
	call PrintBCDDigit ; print upper digit
	ld a, [de]
	call PrintBCDDigit ; print lower digit
	inc de
	dec c
	jr nz, .loop
	bit PRINTNUM_LEADINGZEROS_F, b
	jr z, .done ; if so, we are done
; every digit of the BCD number is zero
	bit PRINTNUM_LEFTALIGN_F, b
	jr nz, .skipLeftAlignmentAdjustment
; the string is left-aligned; it needs to be moved back one space
	dec hl
.skipLeftAlignmentAdjustment
	bit PRINTNUM_MONEY_F, b
	jr z, .skipCurrencySymbol
	ld [hl], "¥" ; currency symbol
	inc hl
.skipCurrencySymbol
	ld [hl], "0"
	call PrintLetterDelay
	inc hl
.done
	ret

PrintBCDDigit::
	and %00001111
	and a
	jr z, .zeroDigit
; nonzero digit
	bit PRINTNUM_LEADINGZEROS_F, b ; have any non-space characters been printed?
	jr z, .outputDigit
; if bit 7 is set, then no numbers have been printed yet
	bit PRINTNUM_MONEY_F, b
	jr z, .skipCurrencySymbol
	ld [hl], "¥"
	inc hl
	res PRINTNUM_MONEY_F, b
.skipCurrencySymbol
	res PRINTNUM_LEADINGZEROS_F, b ; unset 7 to indicate that a nonzero digit has been reached
.outputDigit
	add "0"
	ld [hli], a
	jp PrintLetterDelay

.zeroDigit
	bit PRINTNUM_LEADINGZEROS_F, b ; either printing leading zeroes or already reached a nonzero digit?
	jr z, .outputDigit ; if so, print a zero digit
	bit PRINTNUM_LEFTALIGN_F, b
	ret nz
	ld a, " "
	ld [hli], a ; if right-aligned, "print" a space by advancing the pointer
	ret
