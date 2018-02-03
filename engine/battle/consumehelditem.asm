ConsumeHeldItem: ; 27192
	push hl
	push de
	push bc
	ld a, [hBattleTurn]
	and a
	ld hl, wOTPartyMon1Item
	ld de, wEnemyMonItem
	ld a, [wCurOTMon]
	jr z, .theirturn
	ld hl, wPartyMon1Item
	ld de, wBattleMonItem
	ld a, [wCurBattleMon]

.theirturn
	push hl
	push af
	ld a, [de]
	ld b, a
	farcall GetItemHeldEffect
	ld hl, .ConsumableEffects
.loop
	ld a, [hli]
	cp b
	jr z, .ok
	inc a
	jr nz, .loop
	pop af
	pop hl
	pop bc
	pop de
	pop hl
	ret

.ok
	xor a
	ld [de], a
	pop af
	pop hl
	call GetPartyLocation
	ld a, [hBattleTurn]
	and a
	jr nz, .ourturn
	ld a, [wBattleMode]
	dec a
	jr z, .done

.ourturn
	ld [hl], $0

.done
	pop bc
	pop de
	pop hl
	ret

.ConsumableEffects: ; 271de
; Consumable items?
	db HELD_BERRY
	db HELD_2
	db HELD_5
	db HELD_HEAL_POISON
	db HELD_HEAL_FREEZE
	db HELD_HEAL_BURN
	db HELD_HEAL_SLEEP
	db HELD_HEAL_PARALYZE
	db HELD_HEAL_STATUS
	db HELD_30
	db HELD_ATTACK_UP
	db HELD_DEFENSE_UP
	db HELD_SPEED_UP
	db HELD_SP_ATTACK_UP
	db HELD_SP_DEFENSE_UP
	db HELD_ACCURACY_UP
	db HELD_EVASION_UP
	db HELD_38
	db HELD_71
	db HELD_ESCAPE
	db HELD_CRITICAL_UP
	db -1
