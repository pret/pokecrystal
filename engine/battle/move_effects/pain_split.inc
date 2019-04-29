BattleCommand_PainSplit:
; painsplit

	ld a, [wAttackMissed]
	and a
	jp nz, .ButItFailed
	call CheckSubstituteOpp
	jp nz, .ButItFailed
	call AnimateCurrentMove
	ld hl, wBattleMonMaxHP + 1
	ld de, wEnemyMonMaxHP + 1
	call .PlayerShareHP
	ld a, $1
	ld [wWhichHPBar], a
	hlcoord 10, 9
	predef AnimateHPBar
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wBuffer4], a
	ld a, [hli]
	ld [wBuffer3], a
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer1], a
	call .EnemyShareHP
	xor a
	ld [wWhichHPBar], a
	call ResetDamage
	hlcoord 2, 2
	predef AnimateHPBar
	farcall _UpdateBattleHUDs

	ld hl, SharedPainText
	jp StdBattleTextbox

.PlayerShareHP:
	ld a, [hld]
	ld [wBuffer1], a
	ld a, [hld]
	ld [wBuffer2], a
	ld a, [hld]
	ld b, a
	ld [wBuffer3], a
	ld a, [hl]
	ld [wBuffer4], a
	dec de
	dec de
	ld a, [de]
	dec de
	add b
	ld [wCurDamage + 1], a
	ld b, [hl]
	ld a, [de]
	adc b
	srl a
	ld [wCurDamage], a
	ld a, [wCurDamage + 1]
	rr a
	ld [wCurDamage + 1], a
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de

.EnemyShareHP:
	ld c, [hl]
	dec hl
	ld a, [wCurDamage + 1]
	sub c
	ld b, [hl]
	dec hl
	ld a, [wCurDamage]
	sbc b
	jr nc, .skip

	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	ld c, a
.skip
	ld a, c
	ld [hld], a
	ld [wBuffer5], a
	ld a, b
	ld [hli], a
	ld [wBuffer6], a
	ret

.ButItFailed:
	jp PrintDidntAffect2
