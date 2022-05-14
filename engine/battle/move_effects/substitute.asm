BattleCommand_Substitute:
	call BattleCommand_MoveDelay
	ld hl, wBattleMonMaxHP
	ld de, wPlayerSubstituteHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonMaxHP
	ld de, wEnemySubstituteHP
.got_hp

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	jr nz, .already_has_sub

	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	dec hl
	dec hl
	ld a, b
	ld [de], a
	ld a, [hld]
	sub b
	ld e, a
	ld a, [hl]
	sbc 0
	ld d, a
	jr c, .too_weak_to_sub
	ld a, d
	or e
	jr z, .too_weak_to_sub
	ld [hl], d
	inc hl
	ld [hl], e

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_SUBSTITUTE, [hl]

	ld hl, wPlayerWrapCount
	ld de, wPlayerTrappingMove
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld hl, wEnemyWrapCount
	ld de, wEnemyTrappingMove
.player

	xor a
	ld [hl], a
	ld [de], a
	call _CheckBattleScene
	jr c, .no_anim

	xor a
	ld [wNumHits], a
	ld [wFXAnimID + 1], a
	ld [wBattleAnimParam], a
	ld a, SUBSTITUTE
	call LoadAnim
	jr .finish

.no_anim
	call BattleCommand_RaiseSubNoAnim
.finish
	ld hl, MadeSubstituteText
	call StdBattleTextbox
	jp RefreshBattleHuds

.already_has_sub
	call CheckUserIsCharging
	call nz, BattleCommand_RaiseSub
	ld hl, HasSubstituteText
	jr .jp_stdbattletextbox

.too_weak_to_sub
	call CheckUserIsCharging
	call nz, BattleCommand_RaiseSub
	ld hl, TooWeakSubText
.jp_stdbattletextbox
	jp StdBattleTextbox
