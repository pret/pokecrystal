BattleCommand1b: ; 373c9
; mirrormove

	call Function372d8

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed

	call CheckUserMove
	jr nz, .use

.failed
	call AnimateFailedMove

	ld hl, MirrorMoveFailedText
	call StdBattleTextBox
	jp EndMoveEffect

.use
	ld a, b
	ld [hl], a
	ld [wd265], a

	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld d, h
	ld e, l
	pop af

	dec a
	call GetMoveData
	call GetMoveName
	call CopyName1
	call Function34548
	jr nz, .done

	ld a, [wc689]
	push af
	call BattleCommand0a
	pop af
	ld [wc689], a

.done
	call BattleCommandaa
	jp ResetTurn
; 37418
