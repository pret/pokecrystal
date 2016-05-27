AddNTimes:: ; 0x30fe
; Add bc * a to hl.
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret
; 0x3105

SimpleMultiply:: ; 3105
; Return a * c.
	and a
	ret z

	push bc
	ld b, a
	xor a
.loop
	add c
	dec b
	jr nz, .loop
	pop bc
	ret
; 3110


SimpleDivide:: ; 3110
; Divide a by c. Return quotient b and remainder a.
	ld b, 0
.loop
	inc b
	sub c
	jr nc, .loop
	dec b
	add c
	ret
; 3119


Multiply:: ; 3119
; Multiply hMultiplicand (3 bytes) by hMultiplier. Result in hProduct.
; All values are big endian.
	push hl
	push bc

	callab _Multiply

	pop bc
	pop hl
	ret
; 3124


Divide:: ; 3124
; Divide hDividend length b (max 4 bytes) by hDivisor. Result in hQuotient.
; All values are big endian.
	push hl
	push de
	push bc
	homecall _Divide
	pop bc
	pop de
	pop hl
	ret
; 3136


SubtractSigned:: ; 3136
; Return a - b, sign in carry.
	sub b
	ret nc
	cpl
	add 1
	scf
	ret
; 313d
