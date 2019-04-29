GiveMoney::
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

MaxMoney:
	dt MAX_MONEY

TakeMoney::
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

CompareMoney::
	ld a, 3
CompareFunds:
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

SubtractMoney:
	ld a, 3
SubtractFunds:
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

AddMoney:
	ld a, 3
AddFunds:
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

GiveCoins::
	ld a, 2
	ld de, wCoins
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

.maxcoins
	bigdw MAX_COINS

TakeCoins::
	ld a, 2
	ld de, wCoins
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

CheckCoins::
	ld a, 2
	ld de, wCoins
	jp CompareFunds
