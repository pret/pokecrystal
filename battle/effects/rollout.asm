BattleCommand5b: ; 37718
; checkcurl

	ld de, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37723
	ld de, EnemyRolloutCount

.asm_37723
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVar
	bit SUBSTATUS_ENCORED, a
	jr z, .asm_37731

	ld b, $4 ; doturn
	jp SkipToBattleCommand

.asm_37731
	xor a
	ld [de], a
	ret
; 37734


BattleCommand5c: ; 37734
; rolloutpower

	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and 7
	ret nz

	ld hl, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .asm_37747
	ld hl, EnemyRolloutCount

.asm_37747
	ld a, [hl]
	and a
	jr nz, .asm_37750
	ld a, 1
	ld [$c73e], a

.asm_37750
	ld a, [AttackMissed]
	and a
	jr z, .hit

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res 6, [hl]
	ret

.hit
	inc [hl]
	ld a, [hl]
	ld b, a
	cp $5
	jr c, .asm_3776e

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res 6, [hl]
	jr .asm_37775

.asm_3776e
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	set 6, [hl]

.asm_37775
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVar
	bit 0, a
	jr z, .asm_3777f
	inc b
.asm_3777f
	dec b
	jr z, .asm_37790

	ld hl, CurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .asm_3777f

	ld a, $ff
	ld [hli], a
	ld [hl], a

.asm_37790
	ret
; 37791

