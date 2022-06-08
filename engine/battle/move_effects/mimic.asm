BattleCommand_Mimic:
	call ClearLastMove
	call BattleCommand_MoveDelay
	ld a, [wAttackMissed]
	and a
	jr nz, .fail
	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .player_turn
	ld hl, wEnemyMonMoves
.player_turn
	call CheckHiddenOpponent
	jr nz, .fail
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .fail
	cp STRUGGLE
	jr z, .fail
	ld b, a
	ld c, NUM_MOVES
.check_already_knows_move
	ld a, [hli]
	cp b
	jr z, .fail
	dec c
	jr nz, .check_already_knows_move
	dec hl
.find_mimic
	ld a, [hld]
	cp MIMIC
	jr nz, .find_mimic
	inc hl
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [hl], a
	ld [wNamedObjectIndex], a
	ld bc, wBattleMonPP - wBattleMonMoves
	add hl, bc
	ld [hl], 5
	call GetMoveName
	call AnimateCurrentMove
	ld hl, MimicLearnedMoveText
	jp StdBattleTextbox

.fail
	jp FailMimic
