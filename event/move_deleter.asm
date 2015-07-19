MoveDeletion:
	ld hl, UnknownText_0x2c5ef
	call PrintText
	call YesNoBox
	jr c, .asm_2c5c3
	ld hl, UnknownText_0x2c5f4
	call PrintText
	callba SelectMonFromParty
	jr c, .asm_2c5c3
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_2c5bc
	ld a, [CurPartyMon]
	ld hl, PartyMon1Moves + 1
	ld bc, PartyMon2 - PartyMon1
	call AddNTimes
	ld a, [hl]
	and a
	jr z, .asm_2c5ca
	ld hl, UnknownText_0x2c5ea
	call PrintText
	call Function1d6e
	callba Function12f5b
	push af
	call Function2b74
	pop af
	jr c, .asm_2c5c3
	ld a, [wcfa9]
	push af
	ld a, [CurSpecies]
	ld [wd265], a
	call GetMoveName
	ld hl, UnknownText_0x2c5d6
	call PrintText
	call YesNoBox
	pop bc
	jr c, .asm_2c5c3
	call Function2c5f9
	call WaitSFX
	ld de, SFX_MOVE_DELETED
	call PlaySFX
	call WaitSFX
	ld hl, UnknownText_0x2c5db
	call PrintText
	ret

.asm_2c5bc
	ld hl, UnknownText_0x2c5e0
	call PrintText
	ret

.asm_2c5c3
	ld hl, UnknownText_0x2c5e5
	call PrintText
	ret

.asm_2c5ca
	ld hl, UnknownText_0x2c5d1
	call PrintText
	ret

UnknownText_0x2c5d1: ; 0x2c5d1
	; That #MON knows only one move.
	text_jump UnknownText_0x1c5eba
	db "@"
; 0x2c5d6

UnknownText_0x2c5d6: ; 0x2c5d6
	; Oh, make it forget @ ?
	text_jump UnknownText_0x1c5eda
	db "@"
; 0x2c5db

UnknownText_0x2c5db: ; 0x2c5db
	; Done! Your #MON forgot the move.
	text_jump UnknownText_0x1c5ef5
	db "@"
; 0x2c5e0

UnknownText_0x2c5e0: ; 0x2c5e0
	; An EGG doesn't know any moves!
	text_jump UnknownText_0x1c5f17
	db "@"
; 0x2c5e5

UnknownText_0x2c5e5: ; 0x2c5e5
	; No? Come visit me again.
	text_jump UnknownText_0x1c5f36
	db "@"
; 0x2c5ea

UnknownText_0x2c5ea: ; 0x2c5ea
	; Which move should it forget, then?
	text_jump UnknownText_0x1c5f50
	db "@"
; 0x2c5ef

UnknownText_0x2c5ef: ; 0x2c5ef
	; Um… Oh, yes, I'm the MOVE DELETER. I can make #MON forget moves. Shall I make a #MON forget?
	text_jump UnknownText_0x1c5f74
	db "@"
; 0x2c5f4

UnknownText_0x2c5f4: ; 0x2c5f4
	; Which #MON?
	text_jump UnknownText_0x1c5fd1
	db "@"
; 0x2c5f9

Function2c5f9: ; 2c5f9
	ld a, b
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, PartyMon1Moves
	add hl, bc
	ld a, [CurPartyMon]
	ld bc, PartyMon2 - PartyMon1
	call AddNTimes
	pop bc
	push bc
	inc b
.asm_2c60f
	ld a, b
	cp NUM_MOVES + 1
	jr z, .asm_2c61b
	inc hl
	ld a, [hld]
	ld [hl], a
	inc hl
	inc b
	jr .asm_2c60f

.asm_2c61b
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
	ld bc, PartyMon2 - PartyMon1
	call AddNTimes
	pop bc
	inc b
.asm_2c633
	ld a, b
	cp NUM_MOVES + 1
	jr z, .asm_2c63f
	inc hl
	ld a, [hld]
	ld [hl], a
	inc hl
	inc b
	jr .asm_2c633

.asm_2c63f
	xor a
	ld [hl], a
	ret
