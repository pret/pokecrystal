MoveDeletion:
	ld hl, .IntroText
	call PrintText
	call YesNoBox
	jr c, .declined
	ld hl, .AskWhichMonText
	call PrintText
	callba SelectMonFromParty
	jr c, .declined
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	ld a, [CurPartyMon]
	ld hl, PartyMon1Moves + 1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	and a
	jr z, .onlyonemove
	ld hl, .AskWhichMoveText
	call PrintText
	call LoadStandardMenuDataHeader
	callba ChooseMoveToDelete
	push af
	call ReturnToMapWithSpeechTextbox
	pop af
	jr c, .declined
	ld a, [wMenuCursorY]
	push af
	ld a, [CurSpecies]
	ld [wd265], a
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

.OnlyOneMoveText: ; 0x2c5d1
	; That #MON knows only one move.
	text_jump UnknownText_0x1c5eba
	db "@"
; 0x2c5d6

.ConfirmDeleteText: ; 0x2c5d6
	; Oh, make it forget @ ?
	text_jump UnknownText_0x1c5eda
	db "@"
; 0x2c5db

.MoveDeletedText: ; 0x2c5db
	; Done! Your #MON forgot the move.
	text_jump UnknownText_0x1c5ef5
	db "@"
; 0x2c5e0

.EggText: ; 0x2c5e0
	; An EGG doesn't know any moves!
	text_jump UnknownText_0x1c5f17
	db "@"
; 0x2c5e5

.DeclinedDeletionText: ; 0x2c5e5
	; No? Come visit me again.
	text_jump UnknownText_0x1c5f36
	db "@"
; 0x2c5ea

.AskWhichMoveText: ; 0x2c5ea
	; Which move should it forget, then?
	text_jump UnknownText_0x1c5f50
	db "@"
; 0x2c5ef

.IntroText: ; 0x2c5ef
	; Um… Oh, yes, I'm the MOVE DELETER. I can make #MON forget moves. Shall I make a #MON forget?
	text_jump UnknownText_0x1c5f74
	db "@"
; 0x2c5f4

.AskWhichMonText: ; 0x2c5f4
	; Which #MON?
	text_jump UnknownText_0x1c5fd1
	db "@"
; 0x2c5f9

.DeleteMove: ; 2c5f9
	ld a, b
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, PartyMon1Moves
	add hl, bc
	ld a, [CurPartyMon]
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
	ld hl, PartyMon1PP
	add hl, bc
	ld a, [CurPartyMon]
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
