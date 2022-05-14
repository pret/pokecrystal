BattleCommand_Spikes:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens

; Fails if spikes are already down!

	bit SCREENS_SPIKES, [hl]
	jr nz, .failed

; Nothing else stops it from working.

	set SCREENS_SPIKES, [hl]

	call AnimateCurrentMove

	ld hl, SpikesText
	jp StdBattleTextbox

.failed
	jp FailMove
