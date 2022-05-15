_PrintNum::
; Print c digits of the b-byte value from de to hl.
; Allows 2 to 7 digits. For 1-digit numbers, add
; the value to char "0" instead of calling PrintNum.
; The high nybble of the c register specifies how many of the total amount of
; digits will be in front of the decimal point.
; Some extra flags can be given in bits 5-7 of b.
; Bit 5: money if set (unless left-aligned without leading zeros)
; Bit 6: left-aligned if set
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
	ldh [hPrintNumBuffer + 0], a
	ldh [hPrintNumBuffer + 1], a
	ldh [hPrintNumBuffer + 2], a
	ld a, b
	and $f
	cp 1
	jr z, .byte
	cp 2
	jr z, .word
; maximum 3 bytes
	ld a, [de]
	ldh [hPrintNumBuffer + 1], a
	inc de
	ld a, [de]
	ldh [hPrintNumBuffer + 2], a
	inc de
	ld a, [de]
	ldh [hPrintNumBuffer + 3], a
	jr .start

.word
	ld a, [de]
	ldh [hPrintNumBuffer + 2], a
	inc de
	ld a, [de]
	ldh [hPrintNumBuffer + 3], a
	jr .start

.byte
	ld a, [de]
	ldh [hPrintNumBuffer + 3], a

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

; seven
	ld a, HIGH(1000000 >> 8)
	ldh [hPrintNumBuffer + 4], a
	ld a, HIGH(1000000) ; mid
	ldh [hPrintNumBuffer + 5], a
	ld a, LOW(1000000)
	ldh [hPrintNumBuffer + 6], a
	call .PrintDigit
	call .AdvancePointer

.six
	ld a, HIGH(100000 >> 8)
	ldh [hPrintNumBuffer + 4], a
	ld a, HIGH(100000) ; mid
	ldh [hPrintNumBuffer + 5], a
	ld a, LOW(100000)
	ldh [hPrintNumBuffer + 6], a
	call .PrintDigit
	call .AdvancePointer

.five
	xor a ; HIGH(10000 >> 8)
	ldh [hPrintNumBuffer + 4], a
	ld a, HIGH(10000) ; mid
	ldh [hPrintNumBuffer + 5], a
	ld a, LOW(10000)
	ldh [hPrintNumBuffer + 6], a
	call .PrintDigit
	call .AdvancePointer

.four
	xor a ; HIGH(1000 >> 8)
	ldh [hPrintNumBuffer + 4], a
	ld a, HIGH(1000) ; mid
	ldh [hPrintNumBuffer + 5], a
	ld a, LOW(1000)
	ldh [hPrintNumBuffer + 6], a
	call .PrintDigit
	call .AdvancePointer

.three
	xor a ; HIGH(100 >> 8)
	ldh [hPrintNumBuffer + 4], a
	xor a ; HIGH(100) ; mid
	ldh [hPrintNumBuffer + 5], a
	ld a, LOW(100)
	ldh [hPrintNumBuffer + 6], a
	call .PrintDigit
	call .AdvancePointer

.two
	dec e
	jr nz, .two_skip
	ld a, "0"
	ldh [hPrintNumBuffer + 0], a
.two_skip

	ld c, 0
	ldh a, [hPrintNumBuffer + 3]
.mod_10
	cp 10
	jr c, .modded_10
	sub 10
	inc c
	jr .mod_10
.modded_10

	ld b, a
	ldh a, [hPrintNumBuffer + 0]
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
	ldh [hPrintNumBuffer + 0], a
	inc e
	dec e
	jr nz, .money_leading_zero
	inc hl
	ld [hl], "<DOT>"

.money_leading_zero
	call .AdvancePointer
	call .PrintYen
	ld a, "0"
	add b
	ld [hli], a

	pop de
	pop bc
	ret

.PrintYen:
	push af
	ldh a, [hPrintNumBuffer + 0]
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

.PrintDigit:
	dec e
	jr nz, .ok
	ld a, "0"
	ldh [hPrintNumBuffer + 0], a
.ok
	ld c, 0
.loop
	ldh a, [hPrintNumBuffer + 4]
	ld b, a
	ldh a, [hPrintNumBuffer + 1]
	ldh [hPrintNumBuffer + 7], a
	cp b
	jr c, .skip1
	sub b
	ldh [hPrintNumBuffer + 1], a
	ldh a, [hPrintNumBuffer + 5]
	ld b, a
	ldh a, [hPrintNumBuffer + 2]
	ldh [hPrintNumBuffer + 8], a
	cp b
	jr nc, .skip2
	ldh a, [hPrintNumBuffer + 1]
	or 0
	jr z, .skip3
	dec a
	ldh [hPrintNumBuffer + 1], a
	ldh a, [hPrintNumBuffer + 2]
.skip2
	sub b
	ldh [hPrintNumBuffer + 2], a
	ldh a, [hPrintNumBuffer + 6]
	ld b, a
	ldh a, [hPrintNumBuffer + 3]
	ldh [hPrintNumBuffer + 9], a
	cp b
	jr nc, .skip4
	ldh a, [hPrintNumBuffer + 2]
	and a
	jr nz, .skip5
	ldh a, [hPrintNumBuffer + 1]
	and a
	jr z, .skip6
	dec a
	ldh [hPrintNumBuffer + 1], a
	xor a
.skip5
	dec a
	ldh [hPrintNumBuffer + 2], a
	ldh a, [hPrintNumBuffer + 3]
.skip4
	sub b
	ldh [hPrintNumBuffer + 3], a
	inc c
	jr .loop
.skip6
	ldh a, [hPrintNumBuffer + 8]
	ldh [hPrintNumBuffer + 2], a
.skip3
	ldh a, [hPrintNumBuffer + 7]
	ldh [hPrintNumBuffer + 1], a
.skip1
	ldh a, [hPrintNumBuffer + 0]
	or c
	jr z, .PrintLeadingZero
	ldh a, [hPrintNumBuffer + 0]
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
	ldh [hPrintNumBuffer + 0], a
	inc e
	dec e
	ret nz
	inc hl
	ld [hl], "<DOT>"
	ret

.PrintLeadingZero:
; prints a leading zero unless they are turned off in the flags
	bit 7, d ; print leading zeroes?
	ret z
	ld [hl], "0"
	ret

.AdvancePointer:
; increments the pointer unless leading zeroes are not being printed,
; the number is left-aligned, and no nonzero digits have been printed yet
	bit 7, d ; print leading zeroes?
	jr nz, .inc
	bit 6, d ; left alignment or right alignment?
	jr z, .inc
	ldh a, [hPrintNumBuffer + 0]
	and a
	ret z
.inc
	inc hl
	ret
