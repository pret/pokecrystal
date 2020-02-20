	const_def
	const CHIKORITA_PAGE	; 0
	const CYNDAQUIL_PAGE 	; 1
	const TOTODILE_PAGE		; 2	
	const BULBASAUR_PAGE	; 3
	const CHARMANDER_PAGE	; 4
	const SQUIRTLE_PAGE		; 5
	const PIKACHU_PAGE		; 6
	const EEVEE_PAGE		; 7

NUM_STARTER_PAGES EQU const_value

INCLUDE "data/starters.asm"

StarterSelectionScreenInit:
	ld hl, StarterSelectionScreenMain
	jr StarterSelectionScreenInit_gotaddress

StarterSelectionScreenInit_gotaddress:
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a ; disable overworld tile animations
	ld a, [wBoxAlignment] ; whether sprite is to be mirrorred
	push af
	ld a, [wJumptableIndex]
	ld b, a
	ld a, [wcf64]
	ld c, a

	push bc
	push hl
	call ClearBGPalettes
	call ClearTileMap
	call UpdateSprites
	farcall StatsScreen_LoadFont
	pop hl
	call _hl_
	call ClearBGPalettes
	call ClearTileMap
	pop bc

	; restore old values
	ld a, b
	ld [wJumptableIndex], a
	ld a, c
	ld [wcf64], a
	pop af
	ld [wBoxAlignment], a
	pop af
	ldh [hMapAnims], a
	ret

StarterSelectionScreenMain:
	xor a
	ld [wStarterCursorPosition], a
	ld [wJumptableIndex], a
	; stupid interns
	ld [wcf64], a
.loop
	ld a, [wJumptableIndex]
	and $7f
	ld hl, StarterSelectionScreenPointerTable
	rst JumpTable
	call StarterSelectionScreen_WaitAnim ; check for keys?
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop
	ret

StarterSelectionScreenPointerTable:
	dw StarterStatsInit       ; regular pokémon
	dw REMOVEME       ; egg
	dw StarterSelectionScreenWaitCry
	dw REMOVEMEJOYPAD
	dw StarterSelectionScreen_LoadPage
	dw StarterSelectionScreenWaitCry
	dw StarterStatsJoypad
	dw StarterSelectionScreen_Exit

StarterSelectionScreen_WaitAnim:
	ld hl, wcf64
	bit 6, [hl]
	jr nz, .try_anim
	bit 5, [hl]
	jr nz, .finish
	call DelayFrame
	ret

.try_anim
	farcall SetUpPokeAnim
	jr nc, .finish
	ld hl, wcf64
	res 6, [hl]
.finish
	ld hl, wcf64
	res 5, [hl]
	farcall HDMATransferTileMapToWRAMBank3
	ret

StarterSelectionScreen_SetJumptableIndex:
	ld a, [wJumptableIndex]
	and $80
	or h
	ld [wJumptableIndex], a
	ret

StarterSelectionScreen_Exit:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

REMOVEME:
	ret

StarterStatsInit:
	ld hl, wcf64
	res 6, [hl]

	call ClearBGPalettes
	call ClearTileMap
	farcall HDMATransferTileMapToWRAMBank3

	ld a, [wStarterCursorPosition]
	ld e, a
	ld d, 0
	ld hl, Starters
	add hl, de
	add hl, de

	ld a, [hl]
	ld [wTempSpecies], a
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a

	hlcoord 4, 9
	ld [hl], "◀"
	hlcoord 15, 9
	ld [hl], "▶"

	ld hl, wcf64
	set 4, [hl]
	ld h, 4
	call StarterSelectionScreen_SetJumptableIndex
	ret

REMOVEMEJOYPAD:
	ret

StarterSelectionScreen_LoadPage:
	call StarterSelectionScreen_LoadGFX
	ld hl, wcf64
	res 4, [hl]
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

StarterStatsJoypad:
	call StarterSelectionScreen_GetJoypad
	jr nc, .next
	ld h, 0
	call StarterSelectionScreen_SetJumptableIndex
	ret

.next
	and D_DOWN | D_UP | D_LEFT | D_RIGHT | A_BUTTON | B_BUTTON
	jp StarterSelectionScreen_JoypadAction

StarterSelectionScreenWaitCry:
	call IsSFXPlaying
	ret nc
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

StarterSelectionScreen_GetJoypad:
	call GetJoypad
	ld a, [wMonType]
	cp TEMPMON
	jr nz, .notbreedmon
	push hl
	push de
	push bc
	farcall StatsScreenDPad
	pop bc
	pop de
	pop hl
	ld a, [wMenuJoypad]
	and D_DOWN | D_UP
	jr nz, .set_carry
	ld a, [wMenuJoypad]
	jr .clear_flags

.notbreedmon
	ldh a, [hJoyPressed]
.clear_flags
	and a
	ret

.set_carry
	scf
	ret

StarterSelectionScreen_JoypadAction:
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit A_BUTTON_F, a
	jr nz, .a_button
	jr .done

.d_right
	ld a, [wStarterCursorPosition]
	cp EEVEE_PAGE
	jr z, .done

	ld a, [wStarterCursorPosition]
	add a, 1
	ld [wStarterCursorPosition], a
	call .load_mon
	ret

.d_left
	ld a, [wStarterCursorPosition]
	cp CHIKORITA_PAGE
	jr z, .done
	ld a, [wStarterCursorPosition]
	sub a, 1
	ld [wStarterCursorPosition], a
	call .load_mon
	ret
	ret

.a_button
	call .exit_starter_selection_screen

.done
	ret

.set_page
	ld a, [wcf64]
	and %11111100
	or c
	ld [wcf64], a
	ld h, 4
	call StarterSelectionScreen_SetJumptableIndex
	ret

.load_mon
	ld h, 0
	call StarterSelectionScreen_SetJumptableIndex
	ret

.exit_starter_selection_screen
	ld h, 7
	call StarterSelectionScreen_SetJumptableIndex
	ret

StarterSelectionScreen_LoadGFX:
	ld a, [wBaseDexNo]
	ld [wTempSpecies], a
	ld [wCurSpecies], a
	xor a
	ldh [hBGMapMode], a

	call .LoadPals

	ld hl, wcf64
	bit 4, [hl]

	jr nz, .place_frontpic
	call SetPalettes
	ret

.place_frontpic
	call StarterSelectionScreen_PlaceFrontpic
	ret

.LoadPals:
	ld a, [wcf64]
	maskbits NUM_STARTER_PAGES
	ld c, a

	; calling both of these is a hack
	; TODO: figure out why both need to be called
	farcall LoadStatsScreenPals
	farcall LoadMonPaletteAsNthBGPal
	call DelayFrame

	ld hl, wcf64
	set 5, [hl]
	ret

StarterSelectionScreen_PlaceFrontpic:
	call StarterSelectionScreen_GetAnimationParam
	jr .cry

.cry
	call SetPalettes
	call .AnimateMon
	ld a, [wCurPartySpecies]
	call PlayMonCry2
	ret

.AnimateMon:
	ld hl, wcf64
	set 5, [hl]

	hlcoord 6, 4
	call PrepMonFrontpic
	ret

.AnimateEgg:
ret

StarterSelectionScreen_GetAnimationParam:
	ld bc, wTempMonSpecies
	xor a
	ret
