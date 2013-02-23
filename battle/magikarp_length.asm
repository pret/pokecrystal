CalcMagikarpLength: ; fbbfc
; Return Magikarp's length (in mm) in MagikarpLength (big endian)
;
; input:
;   de: EnemyMonDVs
;   bc: PlayerID

; This function is needlessly convoluted, and poorly commented.
; Reading is discouraged.

; In short, it generates a value between 190 and 1786 using
; a Magikarp's DVs and its trainer ID. This value is further
; scrutinized in GetEnemyMon to make longer Magikarp even rarer.

; This is done by calculating the value using operands from
; a conversion lookup table.

; Our index is calculated by xoring DVs with the trainer ID:

; bc = rrc(rrc(dvs)) xor rrc(id)

; if bc < $a:     MagikarpLength = c + 190
; if bc >= $ff00: MagikarpLength = c + 1370
; else:           MagikarpLength = z*100 + (bc-x)/y

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

; These values represent arbitrary conversion points.


; b = rrcrrc(atkdefdv) xor rrc(id[0])
	
; id
	ld h, b
	ld l, c
	ld a, [hli]
	ld b, a
	ld c, [hl]
	rrc b
	rrc c
	
; dvs
	ld a, [de]
	inc de
	rrca
	rrca
	xor b
	ld b, a
	
; c = rrcrrc(spdspcdv) xor rrc(id[1])
	
	ld a, [de]
	rrca
	rrca
	xor c
	ld c, a
	
; if bc < $000a:
	ld a, b
	and a
	jr nz, .loadtable
	ld a, c
	cp a, $a
	jr nc, .loadtable
	
; de = hl = bc + $be
	ld hl, $be
	add hl, bc
	ld d, h
	ld e, l
	jr .endtable
	
.loadtable
	ld hl, .MagikarpLengthTable
	ld a, $02
	ld [$d265], a
	
.readtable
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call .BLessThanD
	jr nc, .advancetable
	
; c = bc / [hl]
	call .BCMinusDE
	ld a, b
	ld [$ffb3], a
	ld a, c
	ld [$ffb4], a
	ld a, [hl]
	ld [$ffb7], a
	ld b, $02
	call Divide
	ld a, [$ffb6]
	ld c, a
	
; de = c + 100 * (2 + number of rows down the table)
	xor a
	ld [$ffb4], a
	ld [$ffb5], a
	ld a, $64
	ld [$ffb6], a
	ld a, [$d265]
	ld [$ffb7], a
	call Multiply
	ld b, $00
	ld a, [$ffb6]
	add c
	ld e, a
	ld a, [$ffb5]
	adc b
	ld d, a
	jr .endtable
	
.advancetable
	inc hl ; align to next triplet
	ld a, [$d265]
	inc a
	ld [$d265], a
	cp a, $10
	jr c, .readtable
	
	call .BCMinusDE
	ld hl, $0640
	add hl, bc
	ld d, h
	ld e, l
	
.endtable
	ld h, d
	ld l, e
	add hl, hl
	add hl, hl
	add hl, de
	add hl, hl ; hl = de * 10
	
	ld de, $ff02
	ld a, $ff
.loop
	inc a
	add hl, de ; - 254
	jr c, .loop
	
	ld d, $00
	
; mod $0c
.modloop
	cp a, $0c
	jr c, .done
	sub a, $0c
	inc d
	jr .modloop
	
.done
	ld e, a
	ld hl, MagikarpLength
	ld [hl], d
	inc hl
	ld [hl], e
	ret
; fbc9a

.BLessThanD ; fbc9a
; return carry if b < d
	ld a, b
	cp d
	ret c
	ret nc
; fbc9e

.CLessThanE ; fbc9e
; unused
	ld a, c
	cp e
	ret
; fbca1

.BCMinusDE ; fbca1
; bc -= de
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc d
	ld b, a
	ret
; fbca8

.MagikarpLengthTable ; fbca8
;	     ????, divisor
	dwb $006e, $01
	dwb $0136, $02
	dwb $02c6, $04
	dwb $0a96, $14
	dwb $1e1e, $32
	dwb $452e, $64
	dwb $7fc6, $96
	dwb $ba5e, $96
	dwb $e16e, $64
	dwb $f4f6, $32
	dwb $fcc6, $14
	dwb $feba, $05
	dwb $ff82, $02
; fbccf

