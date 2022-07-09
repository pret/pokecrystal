_SwitchPartyMons:
	ld a, [wSwitchMon]
	dec a
	ld [wSwitchMonFrom], a
	ld b, a
	ld a, [wMenuCursorY]
	dec a
	ld [wSwitchMonTo], a
	cp b
	jr z, .skip
	call .SwapMonAndMail
	ld a, [wSwitchMonFrom]
	call .ClearSprite
	ld a, [wSwitchMonTo]
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
	ld hl, wShadowOAMSprite00
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
	ld a, [wSwitchMonTo]
	ld l, a
	ld h, 0
	add hl, bc
	ld d, h
	ld e, l
	ld a, [wSwitchMonFrom]
	ld l, a
	ld h, 0
	add hl, bc
	ld a, [hl]
	push af
	ld a, [de]
	ld [hl], a
	pop af
	ld [de], a
	ld a, [wSwitchMonTo]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wSwitchMonBuffer
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wSwitchMonFrom]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wSwitchMonBuffer
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wSwitchMonTo]
	ld hl, wPartyMonOTs
	call SkipNames
	push hl
	call .CopyNameToSwitchMonBuffer
	ld a, [wSwitchMonFrom]
	ld hl, wPartyMonOTs
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wSwitchMonBuffer
	call .CopyName
	ld hl, wPartyMonNicknames
	ld a, [wSwitchMonTo]
	call SkipNames
	push hl
	call .CopyNameToSwitchMonBuffer
	ld hl, wPartyMonNicknames
	ld a, [wSwitchMonFrom]
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wSwitchMonBuffer
	call .CopyName
	ld hl, sPartyMail
	ld a, [wSwitchMonTo]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wSwitchMonBuffer
	ld bc, MAIL_STRUCT_LENGTH
	ld a, BANK(sPartyMail)
	call OpenSRAM
	call CopyBytes
	ld hl, sPartyMail
	ld a, [wSwitchMonFrom]
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wSwitchMonBuffer
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM
	pop bc
	pop de
	pop hl
	ret

.CopyNameToSwitchMonBuffer:
	ld de, wSwitchMonBuffer

.CopyName:
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
