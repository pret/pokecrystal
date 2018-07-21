ApplyPokerusTick:
; decreases all pokemon's pokerus counter by b. if the lower nybble reaches zero, the pokerus is cured.
	ld hl, wPartyMon1PokerusStatus ; wPartyMon1 + MON_PKRS
	ld a, [wPartyCount]
	and a
	ret z ; make sure it's not wasting time on an empty party
	ld c, a
.loop
	ld a, [hl]
	and $f ; lower nybble is the number of days remaining
	jr z, .next ; if already 0, skip
	sub b ; subtract the number of days
	jr nc, .ok ; max(result, 0)
	xor a
.ok
	ld d, a ; back up this value because we need to preserve the strain (upper nybble)
	ld a, [hl]
	and $f0
	add d
	ld [hl], a ; this prevents a cured pokemon from recontracting pokerus
.next
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	dec c
	jr nz, .loop
	ret
