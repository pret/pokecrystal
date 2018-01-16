LearnMove: ; 6508
	call LoadTileMapToTempTileMap
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	ld hl, StringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.loop
	ld hl, PartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld b, NUM_MOVES
; Get the first empty move slot.  This routine also serves to
; determine whether the Pokemon learning the moves already has
; all four slots occupied, in which case one would need to be
; deleted.
.next
	ld a, [hl]
	and a
	jr z, .learn
	inc hl
	dec b
	jr nz, .next
; If we're here, we enter the routine for forgetting a move
; to make room for the new move we're trying to learn.
	push de
	call ForgetMove
	pop de
	jp c, .cancel

	push hl
	push de
	ld [wd265], a

	ld b, a
	ld a, [wBattleMode]
	and a
	jr z, .not_disabled
	ld a, [DisabledMove]
	cp b
	jr nz, .not_disabled
	xor a
	ld [DisabledMove], a
	ld [PlayerDisableCount], a
.not_disabled

	call GetMoveName
	ld hl, Text_1_2_and_Poof ; 1, 2 and…
	call PrintText
	pop de
	pop hl

.learn
	ld a, [wPutativeTMHMMove]
	ld [hl], a
	ld bc, MON_PP - MON_MOVES
	add hl, bc

	push hl
	push de
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop de
	pop hl

	ld [hl], a

	ld a, [wBattleMode]
	and a
	jp z, .learned

	ld a, [CurPartyMon]
	ld b, a
	ld a, [CurBattleMon]
	cp b
	jp nz, .learned

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jp nz, .learned

	ld h, d
	ld l, e
	ld de, BattleMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	ld bc, PartyMon1PP - (PartyMon1Moves + NUM_MOVES)
	add hl, bc
	ld de, BattleMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	jp .learned

.cancel
	ld hl, Text_StopLearning ; Stop learning <MOVE>?
	call PrintText
	call YesNoBox
	jp c, .loop

	ld hl, Text_DidNotLearn ; <MON> did not learn <MOVE>.
	call PrintText
	ld b, 0
	ret

.learned
	ld hl, Text_LearnedMove ; <MON> learned <MOVE>!
	call PrintText
	ld b, 1
	ret
; 65d3

ForgetMove: ; 65d3
	push hl
	ld hl, Text_TryingToLearn
	call PrintText
	call YesNoBox
	pop hl
	ret c
	ld bc, -NUM_MOVES
	add hl, bc
	push hl
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	pop hl
.loop
	push hl
	ld hl, Text_ForgetWhich
	call PrintText
	hlcoord 5, 2
	ld b, NUM_MOVES * 2
	ld c, MOVE_NAME_LENGTH
	call TextBox
	hlcoord 5 + 2, 2 + 2
	ld a, SCREEN_WIDTH * 2
	ld [Buffer1], a
	predef ListMoves
	; wMenuData3
	ld a, $4
	ld [w2DMenuCursorInitY], a
	ld a, $6
	ld [w2DMenuCursorInitX], a
	ld a, [wNumMoves]
	inc a
	ld [w2DMenuNumRows], a
	ld a, $1
	ld [w2DMenuNumCols], a
	ld [wMenuCursorY], a
	ld [wMenuCursorX], a
	ld a, $3
	ld [wMenuJoypadFilter], a
	ld a, $20
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	ld a, $20
	ld [w2DMenuCursorOffsets], a
	call StaticMenuJoypad
	push af
	call Call_LoadTempTileMapToTileMap
	pop af
	pop hl
	bit 1, a
	jr nz, .cancel
	push hl
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	push af
	push bc
	call IsHMMove
	pop bc
	pop de
	ld a, d
	jr c, .hmmove
	pop hl
	add hl, bc
	and a
	ret

.hmmove
	ld hl, Text_CantForgetHM
	call PrintText
	pop hl
	jr .loop

.cancel
	scf
	ret
; 666b

Text_LearnedMove: ; 666b
; <MON> learned <MOVE>!
	text_jump UnknownText_0x1c5660
	db "@"
; 6670

Text_ForgetWhich: ; 6670
; Which move should be forgotten?
	text_jump UnknownText_0x1c5678
	db "@"
; 6675

Text_StopLearning: ; 6675
; Stop learning <MOVE>?
	text_jump UnknownText_0x1c5699
	db "@"
; 667a

Text_DidNotLearn: ; 667a
; <MON> did not learn <MOVE>.
	text_jump UnknownText_0x1c56af
	db "@"
; 667f

Text_TryingToLearn: ; 667f
; <MON> is trying to learn <MOVE>. But <MON> can't learn more than
; four moves. Delete an older move to make room for <MOVE>?
	text_jump UnknownText_0x1c56c9
	db "@"
; 6684

Text_1_2_and_Poof: ; 6684
	text_jump UnknownText_0x1c5740 ; 1, 2 and…
	start_asm
	push de
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	pop de
	ld hl, .PoofForgot
	ret

.PoofForgot:
; Poof! <MON> forgot <MOVE>. And…
	text_jump UnknownText_0x1c574e
	db "@"
; 669a

Text_CantForgetHM: ; 669a
; HM moves can't be forgotten now.
	text_jump UnknownText_0x1c5772
	db "@"
; 669f
