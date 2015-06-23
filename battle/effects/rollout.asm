MAX_ROLLOUT_COUNT EQU 5


BattleCommand5b: ; 37718
; checkcurl

	ld de, PlayerRolloutCount
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, EnemyRolloutCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVar
	bit SUBSTATUS_ROLLOUT, a
	jr z, .reset

	ld b, $4 ; doturn
	jp SkipToBattleCommand

.reset
	xor a
	ld [de], a
	ret
; 37734


BattleCommand5c: ; 37734
; rolloutpower

	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
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
	ld [wc73e], a

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
	cp MAX_ROLLOUT_COUNT
	jr c, .asm_3776e

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]
	jr .asm_37775

.asm_3776e
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	set SUBSTATUS_ROLLOUT, [hl]

.asm_37775
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVar
	bit SUBSTATUS_CURLED, a
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
