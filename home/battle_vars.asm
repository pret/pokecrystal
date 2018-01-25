GetBattleVar:: ; 39e1
; Preserves hl.
	push hl
	call GetBattleVarAddr
	pop hl
	ret
; 39e7

GetBattleVarAddr:: ; 39e7
; Get variable from pair a, depending on whose turn it is.
; There are 21 variable pairs.

	push bc

	ld hl, BattleVarPairs
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a

; Enemy turn uses the second byte instead.
; This lets battle variable calls be side-neutral.
	ld a, [hBattleTurn]
	and a
	jr z, .getvar
	inc hl

.getvar
; var id
	ld a, [hl]
	ld c, a
	ld b, 0

	ld hl, BattleVarLocations
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [hl]

	pop bc
	ret

BattleVarPairs:
; entries correspond to BATTLE_VARS_* constants
	dw .substatus1
	dw .substatus2
	dw .substatus3
	dw .substatus4
	dw .substatus5
	dw .substatus1opp
	dw .substatus2opp
	dw .substatus3opp
	dw .substatus4opp
	dw .substatus5opp
	dw .status
	dw .statusopp
	dw .animation
	dw .effect
	dw .power
	dw .type
	dw .curmove
	dw .lastcounter
	dw .lastcounteropp
	dw .lastmove
	dw .lastmoveopp

;                   player                 enemy
.substatus1:     db PLAYER_SUBSTATUS_1,    ENEMY_SUBSTATUS_1
.substatus1opp:  db ENEMY_SUBSTATUS_1,     PLAYER_SUBSTATUS_1
.substatus2:     db PLAYER_SUBSTATUS_2,    ENEMY_SUBSTATUS_2
.substatus2opp:  db ENEMY_SUBSTATUS_2,     PLAYER_SUBSTATUS_2
.substatus3:     db PLAYER_SUBSTATUS_3,    ENEMY_SUBSTATUS_3
.substatus3opp:  db ENEMY_SUBSTATUS_3,     PLAYER_SUBSTATUS_3
.substatus4:     db PLAYER_SUBSTATUS_4,    ENEMY_SUBSTATUS_4
.substatus4opp:  db ENEMY_SUBSTATUS_4,     PLAYER_SUBSTATUS_4
.substatus5:     db PLAYER_SUBSTATUS_5,    ENEMY_SUBSTATUS_5
.substatus5opp:  db ENEMY_SUBSTATUS_5,     PLAYER_SUBSTATUS_5
.status:         db PLAYER_STATUS,         ENEMY_STATUS
.statusopp:      db ENEMY_STATUS,          PLAYER_STATUS
.animation:      db PLAYER_MOVE_ANIMATION, ENEMY_MOVE_ANIMATION
.effect:         db PLAYER_MOVE_EFFECT,    ENEMY_MOVE_EFFECT
.power:          db PLAYER_MOVE_POWER,     ENEMY_MOVE_POWER
.type:           db PLAYER_MOVE_TYPE,      ENEMY_MOVE_TYPE
.curmove:        db PLAYER_CUR_MOVE,       ENEMY_CUR_MOVE
.lastcounter:    db PLAYER_COUNTER_MOVE,   ENEMY_COUNTER_MOVE
.lastcounteropp: db ENEMY_COUNTER_MOVE,    PLAYER_COUNTER_MOVE
.lastmove:       db PLAYER_LAST_MOVE,      ENEMY_LAST_MOVE
.lastmoveopp:    db ENEMY_LAST_MOVE,       PLAYER_LAST_MOVE

BattleVarLocations:
; entries correspond to PLAYER_* and ENEMY_* constants
	dw PlayerSubStatus1,           EnemySubStatus1
	dw PlayerSubStatus2,           EnemySubStatus2
	dw PlayerSubStatus3,           EnemySubStatus3
	dw PlayerSubStatus4,           EnemySubStatus4
	dw PlayerSubStatus5,           EnemySubStatus5
	dw BattleMonStatus,            EnemyMonStatus
	dw wPlayerMoveStructAnimation, wEnemyMoveStructAnimation
	dw wPlayerMoveStructEffect,    wEnemyMoveStructEffect
	dw wPlayerMoveStructPower,     wEnemyMoveStructPower
	dw wPlayerMoveStructType,      wEnemyMoveStructType
	dw CurPlayerMove,              CurEnemyMove
	dw LastPlayerCounterMove,      LastEnemyCounterMove
	dw LastPlayerMove,             LastEnemyMove
; 3a90
