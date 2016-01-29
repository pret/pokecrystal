
BattleCommand_Transform: ; 371cd
; transform

	call ClearLastMove
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jp nz, BattleEffect_ButItFailed
	call CheckHiddenOpponent
	jp nz, BattleEffect_ButItFailed
	xor a
	ld [wNumHits], a
	ld [FXAnimIDHi], a
	ld a, $1
	ld [wKickCounter], a
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_SUBSTITUTE, [hl]
	push af
	jr z, .mimic_substitute
	call CheckUserIsCharging
	jr nz, .mimic_substitute
	ld a, SUBSTITUTE
	call LoadAnim
.mimic_substitute
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_TRANSFORMED, [hl]
	call ResetActorDisable
	ld hl, BattleMonSpecies
	ld de, EnemyMonSpecies
	ld a, [hBattleTurn]
	and a
	jr nz, .got_mon_species
	ld hl, EnemyMonSpecies
	ld de, BattleMonSpecies
	xor a
	ld [CurMoveNum], a
.got_mon_species
	push hl
	ld a, [hli]
	ld [de], a
	inc hl
	inc de
	inc de
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, [hBattleTurn]
	and a
	jr z, .mimic_enemy_backup
	ld a, [de]
	ld [wEnemyBackupDVs], a
	inc de
	ld a, [de]
	ld [wEnemyBackupDVs + 1], a
	dec de
.mimic_enemy_backup
; copy DVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
; move pointer to stats
	ld bc, BattleMonStats - BattleMonPP
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, BattleMonStructEnd - BattleMonStats
	call CopyBytes
; init the power points
	ld bc, BattleMonMoves - BattleMonStructEnd
	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	ld bc, BattleMonPP - BattleMonStructEnd
	add hl, bc
	ld b, NUM_MOVES
.pp_loop
	ld a, [de]
	inc de
	and a
	jr z, .done_move
	cp SKETCH
	ld a, 1
	jr z, .done_move
	ld a, 5
.done_move
	ld [hli], a
	dec b
	jr nz, .pp_loop
	pop hl
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, EnemyStats
	ld de, PlayerStats
	ld bc, 2 * 5
	call BattleSideCopy
	ld hl, EnemyStatLevels
	ld de, PlayerStatLevels
	ld bc, 8
	call BattleSideCopy
	call _CheckBattleScene
	jr c, .mimic_anims
	ld a, [hBattleTurn]
	and a
	ld a, [wPlayerMinimized]
	jr z, .got_byte
	ld a, [wEnemyMinimized]
.got_byte
	and a
	jr nz, .mimic_anims
	call LoadMoveAnim
	jr .after_anim

.mimic_anims
	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSubNoAnim
.after_anim
	xor a
	ld [wNumHits], a
	ld [FXAnimIDHi], a
	ld a, $2
	ld [wKickCounter], a
	pop af
	ld a, SUBSTITUTE
	call nz, LoadAnim
	ld hl, TransformedText
	jp StdBattleTextBox

; 372c6
