BattleCommand34: ; 37418
; metronome

	call Function372d8
	call Function34548
	jr nz, .asm_3742b

	ld a, [wc689]
	push af
	call BattleCommand0a
	pop af
	ld [wc689], a

.asm_3742b
	call Function37e36

.GetMove
	call BattleRandom

; No invalid moves.
	cp NUM_ATTACKS + 1
	jr nc, .GetMove

; None of the moves in MetronomeExcepts.
	push af
	ld de, 1
	ld hl, MetronomeExcepts
	call IsInArray
	pop bc
	jr c, .GetMove

; No moves the user already has.
	ld a, b
	call CheckUserMove
	jr z, .GetMove


	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld [hl], b
	call UpdateMoveData
	jp ResetTurn
; 37454


MetronomeExcepts: ; 37454
	db NO_MOVE
	db METRONOME
	db STRUGGLE
	db SKETCH
	db MIMIC
	db COUNTER
	db MIRROR_COAT
	db PROTECT
	db DETECT
	db ENDURE
	db DESTINY_BOND
	db SLEEP_TALK
	db THIEF
	db -1
; 37462
