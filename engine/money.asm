GiveMoney:: ; 15fd7
	ld a, 3
	call AddMoney
	ld bc, MaxMoney
	ld a, 3
	call CompareMoney
	jr z, .not_maxed_out
	jr c, .not_maxed_out
	ld hl, MaxMoney
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	scf
	ret

.not_maxed_out
	and a
	ret
; 15ff7

MaxMoney: ; 15ff7
	dt 999999
; 15ffa


TakeMoney:: ; 15ffa
	ld a, 3
	call SubtractMoney
	jr nc, .okay
	; leave with 0 money
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	scf
	ret

.okay
	and a
	ret
; 1600b

CompareMoney:: ; 1600b
	ld a, 3
CompareFunds: ; 1600d
; a: number of bytes
; bc: start addr of amount (big-endian)
; de: start addr of account (big-endian)
	push hl
	push de
	push bc
	ld h, b
	ld l, c
	ld c, 0
	ld b, a
.loop1
	dec a
	jr z, .done
	inc de
	inc hl
	jr .loop1

.done
	and a
.loop2
	ld a, [de]
	sbc [hl]
	jr z, .okay
	inc c

.okay
	dec de
	dec hl
	dec b
	jr nz, .loop2
	jr c, .set_carry
	ld a, c
	and a
	jr .skip_carry

.set_carry
	ld a, 1
	and a
	scf
.skip_carry
	pop bc
	pop de
	pop hl
	ret
; 16035

SubtractMoney: ; 16035
	ld a, 3
SubtractFunds: ; 16037
; a: number of bytes
; bc: start addr of amount (big-endian)
; de: start addr of account (big-endian)
	push hl
	push de
	push bc
	ld h, b
	ld l, c
	ld b, a
	ld c, 0
.loop
	dec a
	jr z, .done
	inc de
	inc hl
	jr .loop

.done
	and a
.loop2
	ld a, [de]
	sbc [hl]
	ld [de], a
	dec de
	dec hl
	dec b
	jr nz, .loop2
	pop bc
	pop de
	pop hl
	ret
; 16053

AddMoney: ; 16053
	ld a, 3
AddFunds: ; 16055
; a: number of bytes
; bc: start addr of amount (big-endian)
; de: start addr of account (big-endian)
	push hl
	push de
	push bc

	ld h, b
	ld l, c
	ld b, a
.loop1
	dec a
	jr z, .done
	inc de
	inc hl
	jr .loop1

.done
	and a
.loop2
	ld a, [de]
	adc [hl]
	ld [de], a
	dec de
	dec hl
	dec b
	jr nz, .loop2

	pop bc
	pop de
	pop hl
	ret
; 1606f

GiveCoins:: ; 1606f
	ld a, 2
	ld de, Coins
	call AddFunds
	ld a, 2
	ld bc, .maxcoins
	call CompareFunds
	jr c, .not_maxed
	ld hl, .maxcoins
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	scf
	ret

.not_maxed
	and a
	ret
; 1608d

.maxcoins ; 1608d
	bigdw 9999
; 1608f


TakeCoins:: ; 1608f
	ld a, 2
	ld de, Coins
	call SubtractFunds
	jr nc, .okay
	; leave with 0 coins
	xor a
	ld [de], a
	inc de
	ld [de], a
	scf
	ret

.okay
	and a
	ret
; 160a1

CheckCoins:: ; 160a1
	ld a, 2
	ld de, Coins
	jp CompareFunds
; 160a9
