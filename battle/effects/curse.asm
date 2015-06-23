BattleCommand54: ; 37588
; curse

	ld de, BattleMonType1
	ld bc, PlayerStatLevels
	ld a, [hBattleTurn]
	and a
	jr z, .go
	ld de, EnemyMonType1
	ld bc, EnemyStatLevels

.go

; Curse is different for Ghost-types.

	ld a, [de]
	cp GHOST
	jr z, .ghost
	inc de
	ld a, [de]
	cp GHOST
	jr z, .ghost


; If no stats can be increased, don't.

; Attack
	ld a, [bc]
	cp 13 ; max
	jr c, .raise

; Defense
	inc bc
	ld a, [bc]
	cp 13 ; max
	jr nc, .cantraise

.raise

; Raise Attack and Defense, and lower Speed.

	ld a, $1
	ld [wc689], a
	call AnimateCurrentMove
	ld a, $2
	call Function36532
	call SwitchTurn
	call BattleCommand8d
	call ResetMiss
	call SwitchTurn
	call BattleCommand70
	call BattleCommand8c
	call ResetMiss
	call BattleCommand71
	jp BattleCommand8c


.ghost

; Cut HP in half and put a curse on the opponent.

	call CheckHiddenOpponent
	jr nz, .failed

	call CheckSubstituteOpp
	jr nz, .failed

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CURSE, [hl]
	jr nz, .failed

	set SUBSTATUS_CURSE, [hl]
	call AnimateCurrentMove
	ld hl, GetHalfMaxHP
	call CallBattleCore
	ld hl, Function3cc3f
	call CallBattleCore
	call UpdateUserInParty
	ld hl, PutACurseText
	jp StdBattleTextBox

.failed
	call AnimateFailedMove
	jp PrintButItFailed


.cantraise

; Can't raise either stat.

	ld b, $8 ; ABILITY
	call GetStatName
	call AnimateFailedMove
	ld hl, WontRiseAnymoreText
	jp StdBattleTextBox
; 37618
