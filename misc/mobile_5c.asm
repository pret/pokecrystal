INCLUDE "misc/battle_tower_5c.asm"

CheckBTMonMovesForErrors: ; 170c98
	ld c, BATTLETOWER_NROFPKMNS
	ld hl, wBT_OTTempPkmn1Moves
.loop
	push hl
	ld a, [hl]
	cp NUM_ATTACKS + 1
	jr c, .okay
	ld a, POUND
	ld [hl], a

.okay
	inc hl
	ld b, NUM_MOVES - 1
.loop2
	ld a, [hl]
	and a
	jr z, .loop3
	cp NUM_ATTACKS + 1
	jr c, .next

.loop3
	xor a
	ld [hl], a
	inc hl
	dec b
	jr nz, .loop3
	jr .done

.next
	inc hl
	dec b
	jr nz, .loop2

.done
	pop hl
	ld de, PARTYMON_STRUCT_LENGTH + PKMN_NAME_LENGTH
	add hl, de
	dec c
	jr nz, .loop
	ret

; 170cc6
