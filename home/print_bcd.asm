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
	jr z, .done ; skip currency symbol
	bit PRINTNUM_LEFTALIGN_F, b
	jr nz, .skipCurrencySymbol
	dec hl
.skipCurrencySymbol
	ld [hl], "0"
	call PrintLetterDelay
	inc hl
.done
	ld a, "¥"
	ld [hli], a
	ret

PrintBCDDigit::
	and %00001111
	and a
	jr z, .zeroDigit
	res PRINTNUM_LEADINGZEROS_F, b
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
