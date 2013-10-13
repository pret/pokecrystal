GetHiddenPower: ; fbced
; Override Hidden Power's type and power based on the actor's DVs.

	ld hl, BattleMonDVs
	ld a, [hBattleTurn]
	and a
	jr z, .GotDVs
	ld hl, EnemyMonDVs
.GotDVs


; Power:

; Take the top bit from...

; Atk
	ld a, [hl]
	swap a
	and 8
	ld b, a
; Def
	ld a, [hli]
	and 8
	srl a
	or b
	ld b, a
; Spd
	ld a, [hl]
	swap a
	and 8
	srl a
	srl a
	or b
	ld b, a
; Spc
	ld a, [hl]
	and 8
	srl a
	srl a
	srl a
	or b
	ld b, a

; * 5
	add a
	add a
	add b
	ld b, a

; + (Spc & 3)
	ld a, [hld]
	and 3
	add b

; / 2
	srl a

; + 30
	add 30
; + 1
	inc a
	ld d, a


; Type:

; Def & 3
	ld a, [hl]
	and 3
	ld b, a

; + (Atk & 3) << 2
	ld a, [hl]
	and 3 << 4
	swap a
	add a
	add a
	or b

; Skip Normal
	inc a

; Skip type 6 (unused)
	cp 6
	jr c, .GotType
	inc a

; Skip unused types between Steel and Fire
	cp STEEL + 1
	jr c, .GotType
	add FIRE - (STEEL + 1)


.GotType
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
	call _GetBattleVar
	pop af
	ld [hl], a

	ld a, d
	push af
	callba BattleCommand06
	pop af
	ld d, a
	ret
; fbd54

