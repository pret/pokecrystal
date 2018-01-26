BattleCommand_Safeguard: ; 37939
; safeguard

	ld hl, PlayerScreens
	ld de, PlayerSafeguardCount
	ld a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, EnemyScreens
	ld de, EnemySafeguardCount
.ok
	bit SCREENS_SAFEGUARD, [hl]
	jr nz, .failed
	set SCREENS_SAFEGUARD, [hl]
	ld a, 5
	ld [de], a
	call AnimateCurrentMove
	ld hl, CoveredByVeilText
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

; 37962
