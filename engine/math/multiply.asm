SECTION "engine/math/multiply.asm", ROMX

_Multiply::
; hMultiplier is one byte.
	ld a, 8
	ld b, a

	xor a
	ldh [hMultiplicand - 1], a
	ldh [hMathBuffer + 1], a
	ldh [hMathBuffer + 2], a
	ldh [hMathBuffer + 3], a
	ldh [hMathBuffer + 4], a

.loop
	ldh a, [hMultiplier]
	srl a
	ldh [hMultiplier], a
	jr nc, .next

	ldh a, [hMathBuffer + 4]
	ld c, a
	ldh a, [hMultiplicand + 2]
	add c
	ldh [hMathBuffer + 4], a

	ldh a, [hMathBuffer + 3]
	ld c, a
	ldh a, [hMultiplicand + 1]
	adc c
	ldh [hMathBuffer + 3], a

	ldh a, [hMathBuffer + 2]
	ld c, a
	ldh a, [hMultiplicand + 0]
	adc c
	ldh [hMathBuffer + 2], a

	ldh a, [hMathBuffer + 1]
	ld c, a
	ldh a, [hMultiplicand - 1]
	adc c
	ldh [hMathBuffer + 1], a

.next
	dec b
	jr z, .done

; hMultiplicand <<= 1

	ldh a, [hMultiplicand + 2]
	add a
	ldh [hMultiplicand + 2], a

	ldh a, [hMultiplicand + 1]
	rla
	ldh [hMultiplicand + 1], a

	ldh a, [hMultiplicand + 0]
	rla
	ldh [hMultiplicand + 0], a

	ldh a, [hMultiplicand - 1]
	rla
	ldh [hMultiplicand - 1], a

	jr .loop

.done
	ldh a, [hMathBuffer + 4]
	ldh [hProduct + 3], a

	ldh a, [hMathBuffer + 3]
	ldh [hProduct + 2], a

	ldh a, [hMathBuffer + 2]
	ldh [hProduct + 1], a

	ldh a, [hMathBuffer + 1]
	ldh [hProduct + 0], a

	ret
