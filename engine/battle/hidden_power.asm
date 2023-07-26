HiddenPowerDamage:
; Override Hidden Power's type and power based on the user's DVs.

	ld hl, wBattleMonDVs
	ldh a, [hBattleTurn]
	and a
	jr z, .got_dvs
	ld hl, wEnemyMonDVs
.got_dvs

	call GetHiddenPowerType

; Overwrite the current move type.
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	pop af
	or SPECIAL
	ld [hl], a

; Get the damage formula variables based on the new type
; Base Power is set by this command (always 60)
	farcall BattleCommand_DamageStats ; damagestats
	ret
	
GetHiddenPowerType::
; return Hidden Power type in a from DVs at hl
	; push de
	; ld bc, 3
	; ld de, 1
; .loop
	; ld a, [hli]
	; swap a
	; and %00010001
	; srl a
	; call c, .add_bit
	; sla e
	; and a
	; call nz, .add_bit
	; sla e
	; dec c
	; jr nz, .loop
	; ; b = %00fedcba (SpD, SpA, Spe, Def, Atk, HP)
; ; type = %fedcba * 16 / 63 + 1 (1-17, Fighting-Fairy)
	; ld a, b
	; cp 63
	; ld e, 17
	; jr z, .got_type
	; srl a
	; srl a
	; inc a
	; ld e, a

; .got_type
	; ld a, e
	; pop de
	; ret

; .add_bit
	; ld a, b
	; or e
	; ld b, a
	; ret
; Power:

; Take the top bit from each stat

	; Attack
	ld a, [hl]
	swap a
	and %1000

	; Defense
	ld b, a
	ld a, [hli]
	and %1000
	srl a
	or b

	; Speed
	ld b, a
	ld a, [hl]
	swap a
	and %1000
	srl a
	srl a
	or b

	; Special
	ld b, a
	ld a, [hl]
	and %1000
	srl a
	srl a
	srl a
	or b

; Multiply by 5
	ld b, a
	add a
	add a
	add b

; Add Special & 3
	ld b, a
	ld a, [hld]
	and %0011
	add b

; Divide by 2 and add 30 + 1
	srl a
	add 30
	inc a

	ld d, a

; Type:

	; Def & 3
	ld a, [hl]
	and %0011
	ld b, a

	; + (Atk & 3) << 2
	ld a, [hl]
	and %0011 << 4
	swap a
	add a
	add a
	or b

; Skip Normal
	inc a

; Skip Bird
	cp BIRD
	jr c, .done
	inc a

; Skip unused types
	cp UNUSED_TYPES
	jr c, .done
	add UNUSED_TYPES_END - UNUSED_TYPES

.done
	ret