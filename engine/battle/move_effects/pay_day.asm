BattleCommand_PayDay: ; 3705c
; payday

	xor a
	ld hl, StringBuffer1
	ld [hli], a

	ld a, [hBattleTurn]
	and a
	ld a, [BattleMonLevel]
	jr z, .ok
	ld a, [EnemyMonLevel]
.ok

	add a
	ld hl, wPayDayMoney + 2
	add [hl]
	ld [hld], a
	jr nc, .done
	inc [hl]
	dec hl
	jr nz, .done
	inc [hl]
.done
	ld hl, CoinsScatteredText
	jp StdBattleTextBox

; 3707f
