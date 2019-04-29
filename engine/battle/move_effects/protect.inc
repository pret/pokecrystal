BattleCommand_Protect:
; protect
	call ProtectChance
	ret c

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	set SUBSTATUS_PROTECT, [hl]

	call AnimateCurrentMove

	ld hl, ProtectedItselfText
	jp StdBattleTextbox

ProtectChance:
	ld de, wPlayerProtectCount
	ldh a, [hBattleTurn]
	and a
	jr z, .asm_37637
	ld de, wEnemyProtectCount
.asm_37637

	call CheckOpponentWentFirst
	jr nz, .failed

; Can't have a substitute.

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .failed

; Halve the chance of a successful Protect for each consecutive use.

	ld b, $ff
	ld a, [de]
	ld c, a
.loop
	ld a, c
	and a
	jr z, .done
	dec c

	srl b
	ld a, b
	and a
	jr nz, .loop
	jr .failed
.done

.rand
	call BattleRandom
	and a
	jr z, .rand

	dec a
	cp b
	jr nc, .failed

; Another consecutive Protect use.

	ld a, [de]
	inc a
	ld [de], a

	and a
	ret

.failed
	xor a
	ld [de], a
	call AnimateFailedMove
	call PrintButItFailed
	scf
	ret
