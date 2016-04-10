BattleCommand_Present: ; 37874
; present

	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .colosseum_skippush
	push bc
	push de
.colosseum_skippush

	call BattleCommand_Stab

	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .colosseum_skippop
	pop de
	pop bc
.colosseum_skippop

	ld a, [wTypeMatchup]
	and a
	jp z, AnimateFailedMove
	ld a, [AttackMissed]
	and a
	jp nz, AnimateFailedMove

	push bc
	call BattleRandom
	ld b, a
	ld hl, .PresentPower
	ld c, 0
.next
	ld a, [hli]
	cp $ff
	jr z, .heal_effect ; 378a4 $11
	cp b
	jr nc, .got_power ; 378a7 $4
	inc c
	inc hl
	jr .next ; 378ab $f4

.got_power
	ld a, c
	ld [wPresentPower], a
	call AnimateCurrentMoveEitherSide
	ld d, [hl]
	pop bc
	ret

.heal_effect
	pop bc
	ld a, $3
	ld [wPresentPower], a
	call AnimateCurrentMove
	call BattleCommand_SwitchTurn
	ld hl, AICheckPlayerMaxHP
	ld a, [hBattleTurn]
	and a
	jr z, .got_hp_fn_pointer ; 378c9 $3
	ld hl, AICheckEnemyMaxHP
.got_hp_fn_pointer
	ld a, BANK(AICheckPlayerMaxHP)
	rst FarCall
	jr c, .already_fully_healed ; 378d1 $20

	ld hl, GetQuarterMaxHP
	call CallBattleCore
	call BattleCommand_SwitchTurn
	ld hl, RestoreHP
	call CallBattleCore
	call BattleCommand_SwitchTurn
	ld hl, RegainedHealthText
	call StdBattleTextBox
	call BattleCommand_SwitchTurn
	call UpdateOpponentInParty
	jr .do_animation ; 378f1 $11

.already_fully_healed
	call BattleCommand_SwitchTurn
	call _CheckBattleScene
	jr nc, .do_animation ; 378f9 $9
	call AnimateFailedMove
	ld hl, RefusedGiftText
	call StdBattleTextBox
.do_animation
	jp EndMoveEffect

.PresentPower:
	db 40 percent,     40
	db 70 percent + 1, 80
	db 80 percent,    120
	db $ff
; 3790e
