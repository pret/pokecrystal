BattleCommand_BellyDrum:

	callfar GetHalfMaxHP
	callfar CheckUserHasEnoughHP
	jr nc, .failed
	
	push bc
	call BattleCommand_AttackUp2
	pop bc
	ld a, [wAttackMissed]
	and a
	jr nz, .failed

	push bc
	call AnimateCurrentMove
	pop bc
	callfar SubtractHPFromUser
	call UpdateUserInParty
	ld a, MAX_STAT_LEVEL - BASE_STAT_LEVEL - 1

.max_attack_loop
	push af
	call BattleCommand_AttackUp2
	pop af
	dec a
	jr nz, .max_attack_loop

	ld hl, BellyDrumText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
