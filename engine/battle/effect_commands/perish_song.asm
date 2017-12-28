BattleCommand_PerishSong: ; 376c2
; perishsong


	ld hl, PlayerSubStatus1
	ld de, EnemySubStatus1
	bit SUBSTATUS_PERISH, [hl]
	jr z, .ok

	ld a, [de]
	bit SUBSTATUS_PERISH, a
	jr nz, .failed

.ok
	bit SUBSTATUS_PERISH, [hl]
	jr nz, .enemy

	set SUBSTATUS_PERISH, [hl]
	ld a, 4
	ld [PlayerPerishCount], a

.enemy
	ld a, [de]
	bit SUBSTATUS_PERISH, a
	jr nz, .done

	set SUBSTATUS_PERISH, a
	ld [de], a
	ld a, 4
	ld [EnemyPerishCount], a

.done
	call AnimateCurrentMove
	ld hl, StartPerishText
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
; 376f8
