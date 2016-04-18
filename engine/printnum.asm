_PrintNum:: ; c4c7
; Print c digits of the b-byte value from de to hl.
; Allows 2 to 7 digits. For 1-digit numbers, add
; the value to char "0" instead of calling PrintNum.
; Some extra flags can be given in bits 5-7 of b.
; Bit 5: money if set (unless left-aligned without leading zeros)
; Bit 6: right-aligned if set
; Bit 7: print leading zeros if set

	push bc

	bit 5, b
	jr z, .main
	bit 7, b
	jr nz, .moneyflag
	bit 6, b
	jr z, .main

.moneyflag ; 101xxxxx or 011xxxxx
	ld a, "¥"
	ld [hli], a
	res 5, b ; 100xxxxx or 010xxxxx

.main
	xor a
	ld [hPrintNum1], a
	ld [hPrintNum2], a
	ld [hPrintNum3], a
	ld a, b
	and $f
	cp 1
	jr z, .byte
	cp 2
	jr z, .word
; maximum 3 bytes
.long
	ld a, [de]
	ld [hPrintNum2], a
	inc de
	ld a, [de]
	ld [hPrintNum3], a
	inc de
	ld a, [de]
	ld [hPrintNum4], a
	jr .start

.word
	ld a, [de]
	ld [hPrintNum3], a
	inc de
	ld a, [de]
	ld [hPrintNum4], a
	jr .start

.byte
	ld a, [de]
	ld [hPrintNum4], a

.start
	push de

	ld d, b
	ld a, c
	swap a
	and $f
	ld e, a
	ld a, c
	and $f
	ld b, a
	ld c, 0
	cp 2
	jr z, .two
	cp 3
	jr z, .three
	cp 4
	jr z, .four
	cp 5
	jr z, .five
	cp 6
	jr z, .six

.seven
	ld a, 1000000 / $10000 % $100
	ld [hPrintNum5], a
	ld a, 1000000 / $100 % $100
	ld [hPrintNum6], a
	ld a, 1000000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.six
	ld a, 100000 / $10000 % $100
	ld [hPrintNum5], a
	ld a, 100000 / $100 % $100
	ld [hPrintNum6], a
	ld a, 100000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.five
	xor a
	ld [hPrintNum5], a
	ld a, 10000 / $100
	ld [hPrintNum6], a
	ld a, 10000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.four
	xor a
	ld [hPrintNum5], a
	ld a, 1000 / $100
	ld [hPrintNum6], a
	ld a, 1000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.three
	xor a
	ld [hPrintNum5], a
	xor a
	ld [hPrintNum6], a
	ld a, 100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.two
	dec e
	jr nz, .two_skip
	ld a, "0"
	ld [hPrintNum1], a
.two_skip

	ld c, 0
	ld a, [hPrintNum4]
.mod_10
	cp 10
	jr c, .modded_10
	sub 10
	inc c
	jr .mod_10
.modded_10

	ld b, a
	ld a, [hPrintNum1]
	or c
	jr nz, .money
	call .PrintLeadingZero
	jr .money_leading_zero

.money
	call .PrintYen
	push af
	ld a, "0"
	add c
	ld [hl], a
	pop af
	ld [hPrintNum1], a
	inc e
	dec e
	jr nz, .money_leading_zero
	inc hl
	ld [hl], $f2 ; XXX

.money_leading_zero
	call .AdvancePointer
	call .PrintYen
	ld a, "0"
	add b
	ld [hli], a

	pop de
	pop bc
	ret

.PrintYen: ; c5ba
	push af
	ld a, [hPrintNum1]
	and a
	jr nz, .stop
	bit 5, d
	jr z, .stop
	ld a, "¥"
	ld [hli], a
	res 5, d

.stop
	pop af
	ret

.PrintDigit: ; c5cb (3:45cb)
	dec e
	jr nz, .ok
	ld a, "0"
	ld [hPrintNum1], a
.ok
	ld c, 0
.loop
	ld a, [hPrintNum5]
	ld b, a
	ld a, [hPrintNum2]
	ld [hPrintNum8], a
	cp b
	jr c, .skip1
	sub b
	ld [hPrintNum2], a
	ld a, [hPrintNum6]
	ld b, a
	ld a, [hPrintNum3]
	ld [hPrintNum9], a
	cp b
	jr nc, .skip2
	ld a, [hPrintNum2]
	or 0
	jr z, .skip3
	dec a
	ld [hPrintNum2], a
	ld a, [hPrintNum3]
.skip2
	sub b
	ld [hPrintNum3], a
	ld a, [hPrintNum7]
	ld b, a
	ld a, [hPrintNum4]
	ld [hPrintNum10], a
	cp b
	jr nc, .skip4
	ld a, [hPrintNum3]
	and a
	jr nz, .skip5
	ld a, [hPrintNum2]
	and a
	jr z, .skip6
	dec a
	ld [hPrintNum2], a
	xor a
.skip5
	dec a
	ld [hPrintNum3], a
	ld a, [hPrintNum4]
.skip4
	sub b
	ld [hPrintNum4], a
	inc c
	jr .loop
.skip6
	ld a, [hPrintNum9]
	ld [hPrintNum3], a
.skip3
	ld a, [hPrintNum8]
	ld [hPrintNum2], a
.skip1
	ld a, [hPrintNum1]
	or c
	jr z, .PrintLeadingZero
	ld a, [hPrintNum1]
	and a
	jr nz, .done
	bit 5, d
	jr z, .done
	ld a, "¥"
	ld [hli], a
	res 5, d
.done
	ld a, "0"
	add c
	ld [hl], a
	ld [hPrintNum1], a
	inc e
	dec e
	ret nz
	inc hl
	ld [hl], "·"
	ret

.PrintLeadingZero: ; c644
; prints a leading zero unless they are turned off in the flags
	bit 7, d ; print leading zeroes?
	ret z
	ld [hl], "0"
	ret

.AdvancePointer: ; c64a
; increments the pointer unless leading zeroes are not being printed,
; the number is left-aligned, and no nonzero digits have been printed yet
	bit 7, d ; print leading zeroes?
	jr nz, .inc
	bit 6, d ; left alignment or right alignment?
	jr z, .inc
	ld a, [hPrintNum1]
	and a
	ret z
.inc
	inc hl
	ret
