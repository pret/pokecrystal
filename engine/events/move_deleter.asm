MoveDeletion:
	ld hl, .IntroText
	call PrintText
	call YesNoBox
	jr c, .declined
	ld hl, .AskWhichMonText
	call PrintText
	farcall SelectMonFromParty
	jr c, .declined
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Moves + 1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	and a
	jr z, .onlyonemove
	ld hl, .AskWhichMoveText
	call PrintText
	call LoadStandardMenuHeader
	farcall ChooseMoveToDelete
	push af
	call ReturnToMapWithSpeechTextbox
	pop af
	jr c, .declined
	ld a, [wMenuCursorY]
	push af
	ld a, [wCurSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	ld hl, .ConfirmDeleteText
	call PrintText
	call YesNoBox
	pop bc
	jr c, .declined
	call .DeleteMove
	call WaitSFX
	ld de, SFX_MOVE_DELETED
	call PlaySFX
	call WaitSFX
	ld hl, .MoveDeletedText
	call PrintText
	ret

.egg
	ld hl, .EggText
	call PrintText
	ret

.declined
	ld hl, .DeclinedDeletionText
	call PrintText
	ret

.onlyonemove
	ld hl, .OnlyOneMoveText
	call PrintText
	ret

.OnlyOneMoveText:
	; That #MON knows only one move.
	text_jump UnknownText_0x1c5eba
	db "@"

.ConfirmDeleteText:
	; Oh, make it forget @ ?
	text_jump UnknownText_0x1c5eda
	db "@"

.MoveDeletedText:
	; Done! Your #MON forgot the move.
	text_jump UnknownText_0x1c5ef5
	db "@"

.EggText:
	; An EGG doesn't know any moves!
	text_jump UnknownText_0x1c5f17
	db "@"

.DeclinedDeletionText:
	; No? Come visit me again.
	text_jump UnknownText_0x1c5f36
	db "@"

.AskWhichMoveText:
	; Which move should it forget, then?
	text_jump UnknownText_0x1c5f50
	db "@"

.IntroText:
	; Um… Oh, yes, I'm the MOVE DELETER. I can make #MON forget moves. Shall I make a #MON forget?
	text_jump UnknownText_0x1c5f74
	db "@"

.AskWhichMonText:
	; Which #MON?
	text_jump UnknownText_0x1c5fd1
	db "@"

.DeleteMove:
	ld a, b
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, wPartyMon1Moves
	add hl, bc
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	push bc
	inc b
.loop
	ld a, b
	cp NUM_MOVES + 1
	jr z, .okay
	inc hl
	ld a, [hld]
	ld [hl], a
	inc hl
	inc b
	jr .loop

.okay
	xor a
	ld [hl], a
	pop bc

	ld a, b
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, wPartyMon1PP
	add hl, bc
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	inc b
.loop2
	ld a, b
	cp NUM_MOVES + 1
	jr z, .done
	inc hl
	ld a, [hld]
	ld [hl], a
	inc hl
	inc b
	jr .loop2

.done
	xor a
	ld [hl], a
	ret
