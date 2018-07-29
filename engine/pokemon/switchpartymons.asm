_SwitchPartyMons:
	ld a, [wSwitchMon]
	dec a
	ld [wBuffer3], a
	ld b, a
	ld a, [wMenuCursorY]
	dec a
	ld [wBuffer2], a
	cp b
	jr z, .skip
	call .SwapMonAndMail
	ld a, [wBuffer3]
	call .ClearSprite
	ld a, [wBuffer2]
	call .ClearSprite
.skip
	ret

.ClearSprite:
	push af
	hlcoord 0, 1
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld bc, 2 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	pop af
	ld hl, wVirtualOAMSprite00
	ld bc, 4 * SPRITEOAMSTRUCT_LENGTH
	call AddNTimes
	ld de, SPRITEOAMSTRUCT_LENGTH
	ld c, 4
.gfx_loop
	ld [hl], SCREEN_WIDTH_PX ; y (off-screen)
	add hl, de
	dec c
	jr nz, .gfx_loop
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
	ret

.SwapMonAndMail:
	push hl
	push de
	push bc
	ld bc, wPartySpecies
	ld a, [wBuffer2]
	ld l, a
	ld h, $0
	add hl, bc
	ld d, h
	ld e, l
	ld a, [wBuffer3]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, [hl]
	push af
	ld a, [de]
	ld [hl], a
	pop af
	ld [de], a
	ld a, [wBuffer2]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wd002
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wBuffer3]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wd002
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wBuffer2]
	ld hl, wPartyMonOT
	call SkipNames
	push hl
	call .CopyNameTowd002
	ld a, [wBuffer3]
	ld hl, wPartyMonOT
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wd002
	call .CopyName
	ld hl, wPartyMonNicknames
	ld a, [wBuffer2]
	call SkipNames
	push hl
	call .CopyNameTowd002
	ld hl, wPartyMonNicknames
	ld a, [wBuffer3]
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wd002
	call .CopyName
	ld hl, sPartyMail
	ld a, [wBuffer2]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wd002
	ld bc, MAIL_STRUCT_LENGTH
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	call CopyBytes
	ld hl, sPartyMail
	ld a, [wBuffer3]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wd002
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM
	pop bc
	pop de
	pop hl
	ret

.CopyNameTowd002:
	ld de, wd002

.CopyName:
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
