CalcMagikarpLength: ; fbbfc
; Return Magikarp's length (in mm) at MagikarpLength (big endian).
;
; input:
;   de: EnemyMonDVs
;   bc: PlayerID

; This function is poorly commented.

; In short, it generates a value between 190 and 1786 using
; a Magikarp's DVs and its trainer ID. This value is further
; filtered in LoadEnemyMon to make longer Magikarp even rarer.

; The value is generated from a lookup table.
; The index is determined by the dv xored with the player's trainer id.

; bc = rrc(dv[0]) ++ rrc(dv[1]) ^ rrc(id)

; if bc < 10:     [MagikarpLength] = c + 190
; if bc >= $ff00: [MagikarpLength] = c + 1370
; else:           [MagikarpLength] = z * 100 + (bc - x) / y

; X, Y, and Z depend on the value of b as follows:

; if b = 0:        x =   310,  y =   2,  z =  3
; if b = 1:        x =   710,  y =   4,  z =  4
; if b = 2-9:      x =  2710,  y =  20,  z =  5
; if b = 10-29:    x =  7710,  y =  50,  z =  6
; if b = 30-68:    x = 17710,  y = 100,  z =  7
; if b = 69-126:   x = 32710,  y = 150,  z =  8
; if b = 127-185:  x = 47710,  y = 150,  z =  9
; if b = 186-224:  x = 57710,  y = 100,  z = 10
; if b = 225-243:  x = 62710,  y =  50,  z = 11
; if b = 244-251:  x = 64710,  y =  20,  z = 12
; if b = 252-253:  x = 65210,  y =   5,  z = 13
; if b = 254:      x = 65410,  y =   2,  z = 14


	; bc = rrc(dv[0]) ++ rrc(dv[1]) ^ rrc(id)

	; id
	ld h, b
	ld l, c
	ld a, [hli]
	ld b, a
	ld c, [hl]
	rrc b
	rrc c

	; dv
	ld a, [de]
	inc de
	rrca
	rrca
	xor b
	ld b, a

	ld a, [de]
	rrca
	rrca
	xor c
	ld c, a

	; if bc < 10:
	;     de = bc + 190
	;     break

	ld a, b
	and a
	jr nz, .no
	ld a, c
	cp 10
	jr nc, .no

	ld hl, 190
	add hl, bc
	ld d, h
	ld e, l
	jr .done

.no

	ld hl, .Lengths
	ld a, 2
	ld [wd265], a

.read
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call .BCLessThanDE
	jr nc, .next

	; c = (bc - de) / [hl]
	call .BCMinusDE
	ld a, b
	ld [hDividend + 0], a
	ld a, c
	ld [hDividend + 1], a
	ld a, [hl]
	ld [hDivisor], a
	ld b, 2
	call Divide
	ld a, [hQuotient + 2]
	ld c, a

	; de = c + 100 * (2 + i)
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, 100
	ld [hMultiplicand + 2], a
	ld a, [wd265]
	ld [hMultiplier], a
	call Multiply
	ld b, 0
	ld a, [hProduct + 3]
	add c
	ld e, a
	ld a, [hProduct + 2]
	adc b
	ld d, a
	jr .done

.next
	inc hl ; align to next triplet
	ld a, [wd265]
	inc a
	ld [wd265], a
	cp 16
	jr c, .read

	call .BCMinusDE
	ld hl, 1600
	add hl, bc
	ld d, h
	ld e, l

.done
	; hl = de * 10
	ld h, d
	ld l, e
	add hl, hl
	add hl, hl
	add hl, de
	add hl, hl

	; hl = hl / 254
	ld de, -254
	ld a, -1
.div_254
	inc a
	add hl, de
	jr c, .div_254

	; d, e = hl / 12, hl % 12
	ld d, 0
.mod_12
	cp 12
	jr c, .ok
	sub 12
	inc d
	jr .mod_12
.ok
	ld e, a

	ld hl, MagikarpLength
	ld [hl], d
	inc hl
	ld [hl], e
	ret
; fbc9a

.BCLessThanDE: ; fbc9a
; Intention: Return bc < de.
; Reality: Return b < d.
	ld a, b
	cp d
	ret c
	ret nc ; whoops
	ld a, c
	cp e
	ret
; fbca1

.BCMinusDE: ; fbca1
; bc -= de
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc d
	ld b, a
	ret
; fbca8

.Lengths: ; fbca8
;	     ????, divisor
	dwb   110, 1
	dwb   310, 2
	dwb   710, 4
	dwb  2710, 20
	dwb  7710, 50
	dwb 17710, 100
	dwb 32710, 150
	dwb 47710, 150
	dwb 57710, 100
	dwb 62710, 50
	dwb 64710, 20
	dwb 65210, 5
	dwb 65410, 2
	dwb 65510, 1 ; not used
; fbcd2
