BattleCommand_Teleport:
	ld a, [wBattleType]
	cp BATTLETYPE_SHINY
	jr z, .failed
	cp BATTLETYPE_TRAP
	jr z, .failed
	cp BATTLETYPE_CELEBI
	jr z, .failed
	cp BATTLETYPE_SUICUNE
	jr z, .failed

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_CANT_RUN, a
	jr nz, .failed
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_turn

	; Can't teleport from a trainer battle
	ld a, [wBattleMode]
	dec a
	jr nz, .failed
	; b = player level
	ld a, [wCurPartyLevel]
	ld b, a
	; If player level >= enemy level, Teleport will succeed
	ld a, [wBattleMonLevel]
	cp b
	jr nc, .run_away
	; c = player level + enemy level + 1
	add b
	ld c, a
	inc c
	; Generate a number less than c
.loop_player
	call BattleRandom
	cp c
	jr nc, .loop_player
	; b = enemy level / 4
	srl b
	srl b
	; If the random number >= enemy level / 4, Teleport will succeed
	cp b
	jr nc, .run_away

.failed
	call AnimateFailedMove
	jp PrintButItFailed

.enemy_turn
	; Can't teleport from a trainer battle
	ld a, [wBattleMode]
	dec a
	jr nz, .failed
	; b = enemy level
	ld a, [wBattleMonLevel]
	ld b, a
	; If enemy level >= player level, Teleport will succeed
	ld a, [wCurPartyLevel]
	cp b
	jr nc, .run_away
	; c = enemy level + player level + 1
	add b
	ld c, a
	inc c
	; Generate a number less than c
.loop_enemy
; BUG: Wild Pokémon can always Teleport regardless of level difference (see docs/bugs_and_glitches.md)
	call BattleRandom
	cp c
	jr nc, .loop_enemy
	; b = player level / 4
	srl b
	srl b
	cp b
	jr nc, .run_away

.run_away
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	ld [wBattleAnimParam], a
	call SetBattleDraw
	call BattleCommand_LowerSub
	call LoadMoveAnim
	ld c, 20
	call DelayFrames
	call SetBattleDraw

	ld hl, FledFromBattleText
	jp StdBattleTextbox
