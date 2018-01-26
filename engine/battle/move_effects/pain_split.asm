BattleCommand_PainSplit: ; 35926
; painsplit

	ld a, [AttackMissed]
	and a
	jp nz, .ButItFailed
	call CheckSubstituteOpp
	jp nz, .ButItFailed
	call AnimateCurrentMove
	ld hl, BattleMonMaxHP + 1
	ld de, EnemyMonMaxHP + 1
	call .PlayerShareHP
	ld a, $1
	ld [wWhichHPBar], a
	hlcoord 10, 9
	predef AnimateHPBar
	ld hl, EnemyMonHP
	ld a, [hli]
	ld [Buffer4], a
	ld a, [hli]
	ld [Buffer3], a
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hl]
	ld [Buffer1], a
	call .EnemyShareHP
	xor a
	ld [wWhichHPBar], a
	call ResetDamage
	hlcoord 2, 2
	predef AnimateHPBar
	farcall _UpdateBattleHUDs

	ld hl, SharedPainText
	jp StdBattleTextBox

.PlayerShareHP:
	ld a, [hld]
	ld [Buffer1], a
	ld a, [hld]
	ld [Buffer2], a
	ld a, [hld]
	ld b, a
	ld [Buffer3], a
	ld a, [hl]
	ld [Buffer4], a
	dec de
	dec de
	ld a, [de]
	dec de
	add b
	ld [CurDamage + 1], a
	ld b, [hl]
	ld a, [de]
	adc b
	srl a
	ld [CurDamage], a
	ld a, [CurDamage + 1]
	rr a
	ld [CurDamage + 1], a
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de

.EnemyShareHP: ; 359ac
	ld c, [hl]
	dec hl
	ld a, [CurDamage + 1]
	sub c
	ld b, [hl]
	dec hl
	ld a, [CurDamage]
	sbc b
	jr nc, .skip

	ld a, [CurDamage]
	ld b, a
	ld a, [CurDamage + 1]
	ld c, a
.skip
	ld a, c
	ld [hld], a
	ld [Buffer5], a
	ld a, b
	ld [hli], a
	ld [Buffer6], a
	ret

; 359cd

.ButItFailed:
	jp PrintDidntAffect2

; 359d0
