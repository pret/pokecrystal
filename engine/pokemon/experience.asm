CalcLevel: ; 50e1b
	ld a, [wTempMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld d, 1
.next_level
	inc d
	ld a, d
	cp LOW(MAX_LEVEL + 1)
	jr z, .got_level
	call CalcExpAtLevel
	push hl
	ld hl, wTempMonExp + 2
	ld a, [hProduct + 3]
	ld c, a
	ld a, [hld]
	sub c
	ld a, [hProduct + 2]
	ld c, a
	ld a, [hld]
	sbc c
	ld a, [hProduct + 1]
	ld c, a
	ld a, [hl]
	sbc c
	pop hl
	jr nc, .next_level

.got_level
	dec d
	ret

CalcExpAtLevel: ; 50e47
; (a/b)*n**3 + c*n**2 + d*n - e
	ld a, [wBaseGrowthRate]
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, GrowthRates
	add hl, bc
; Cube the level
	call .LevelSquared
	ld a, d
	ld [hMultiplier], a
	call Multiply

; Multiply by a
	ld a, [hl]
	and $f0
	swap a
	ld [hMultiplier], a
	call Multiply
; Divide by b
	ld a, [hli]
	and $f
	ld [hDivisor], a
	ld b, 4
	call Divide
; Push the cubic term to the stack
	ld a, [hQuotient + 0]
	push af
	ld a, [hQuotient + 1]
	push af
	ld a, [hQuotient + 2]
	push af
; Square the level and multiply by the lower 7 bits of c
	call .LevelSquared
	ld a, [hl]
	and $7f
	ld [hMultiplier], a
	call Multiply
; Push the absolute value of the quadratic term to the stack
	ld a, [hProduct + 1]
	push af
	ld a, [hProduct + 2]
	push af
	ld a, [hProduct + 3]
	push af
	ld a, [hli]
	push af
; Multiply the level by d
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, d
	ld [hMultiplicand + 2], a
	ld a, [hli]
	ld [hMultiplier], a
	call Multiply
; Subtract e
	ld b, [hl]
	ld a, [hProduct + 3]
	sub b
	ld [hMultiplicand + 2], a
	ld b, $0
	ld a, [hProduct + 2]
	sbc b
	ld [hMultiplicand + 1], a
	ld a, [hProduct + 1]
	sbc b
	ld [hMultiplicand], a
; If bit 7 of c is set, c is negative; otherwise, it's positive
	pop af
	and $80
	jr nz, .subtract
; Add c*n**2 to (d*n - e)
	pop bc
	ld a, [hProduct + 3]
	add b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	adc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	adc b
	ld [hMultiplicand], a
	jr .done_quadratic

.subtract
; Subtract c*n**2 from (d*n - e)
	pop bc
	ld a, [hProduct + 3]
	sub b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	sbc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	sbc b
	ld [hMultiplicand], a

.done_quadratic
; Add (a/b)*n**3 to (d*n - e +/- c*n**2)
	pop bc
	ld a, [hProduct + 3]
	add b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	adc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	adc b
	ld [hMultiplicand], a
	ret

.LevelSquared: ; 50eed
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, d
	ld [hMultiplicand + 2], a
	ld [hMultiplier], a
	jp Multiply

INCLUDE "data/growth_rates.asm"
