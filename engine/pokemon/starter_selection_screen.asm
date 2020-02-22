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
	call ClearTilemap
	call UpdateSprites
	farcall StatsScreen_LoadFont
	pop hl
	call _hl_
	call ClearBGPalettes
	call ClearTilemap
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
	ld [wStarterCursorPositionMon], a
	ld [wStarterCursorPositionCategory], a
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
	bit 4, a ; StarterSelectionScreen_Exit
	jr z, .loop
	ret

StarterSelectionScreenPointerTable:
	dw StarterStatsInit                ; 0
	dw StarterSelectionScreen_LoadPage ; 1
	dw StarterSelectionScreenWaitCry   ; 2
	dw StarterStatsJoypad              ; 3
	dw StarterSelectionScreen_Exit     ; 4

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
	farcall HDMATransferTilemapToWRAMBank3
	ret

StarterSelectionScreen_SetJumptableIndex:
	ld a, [wJumptableIndex]
	and $80
	or h
	ld [wJumptableIndex], a
	ret

StarterSelectionScreen_Exit:
	ld hl, wJumptableIndex
	set 4, [hl] ; StarterSelectionScreen_Exit
	ret

StarterStatsInit:
	ld hl, wcf64
	res 6, [hl]

	call ClearBGPalettes
	call ClearTilemap
	farcall HDMATransferTilemapToWRAMBank3

	call PopulateStarterInfo
	ld a, [hl]
	ld [wTempSpecies], a
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a

	call PlaceNavigationArrows
	call PlaceMonName
	call PlaceStarterCategory

	ld hl, wcf64
	set 4, [hl]
	ld h, 1 ; StarterSelectionScreen_LoadPage
	call StarterSelectionScreen_SetJumptableIndex
	ret

PlaceNavigationArrows:
	hlcoord 4, 7
	ld [hl], "◀"
	hlcoord 15, 7
	ld [hl], "▶"
	ret

PlaceMonName:
	ld a, MON_NAME
	ld [wNamedObjectTypeBuffer], a
	farcall GetName
	ld de, wStringBuffer1
	hlcoord 2, 0
	call PlaceString
	ret

PlaceStarterCategory:
	ld de, .category_label
	hlcoord 2, 11
	call PlaceString
	ld de, .mon_label
	hlcoord 2, 12
	call PlaceString

	call GetStarterCategoryName
	hlcoord 3, 1
	call PlaceString
	ret
.category_label
	db "CATEGORY: UP/DOWN@"
.mon_label
	db "MON: LEFT/RIGHT@"

StarterSelectionScreen_LoadPage:
	call StarterSelectionScreen_LoadGFX
	ld hl, wcf64
	res 4, [hl]
	ld a, [wJumptableIndex]
	inc a ; StarterSelectionScreenWaitCry
	ld [wJumptableIndex], a
	ret

StarterStatsJoypad:
	call StarterSelectionScreen_GetJoypad
	jr nc, .next
	ld h, 0 ; StarterStatsInit
	call StarterSelectionScreen_SetJumptableIndex
	ret

.next
	and D_DOWN | D_UP | D_LEFT | D_RIGHT | A_BUTTON
	jp StarterSelectionScreen_JoypadAction

StarterSelectionScreenWaitCry:
	call IsSFXPlaying
	ret nc
	ld a, [wJumptableIndex]
	inc a ; StarterStatsJoypad
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
	and D_LEFT | D_RIGHT | D_UP | D_DOWN
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
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit A_BUTTON_F, a
	jr nz, .a_button
	jr .done

.d_right
	ld a, [wNumStartersInCategory]
	sub a, 1
	ld e, a
	ld a, [wStarterCursorPositionMon]
	cp e ; last page
	jr z, .d_down
	ld a, [wStarterCursorPositionMon]
	add a, 1
	ld [wStarterCursorPositionMon], a
	call .load_mon
	ret

.d_left
	ld a, [wStarterCursorPositionMon]
	cp 0 ; first page
	;jr z, .go_to_last_starter
	jr z, .go_to_last_starter_in_prev_category
	ld a, [wStarterCursorPositionMon]
	sub a, 1
	ld [wStarterCursorPositionMon], a
	call .load_mon
	ret

.d_up
	xor a
	ld [wStarterCursorPositionMon], a ; start from first mon in category

	ld a, [wStarterCursorPositionCategory]
	cp 0 ; first category
	jr z, .done
	ld a, [wStarterCursorPositionCategory]
	sub a, 1
	ld [wStarterCursorPositionCategory], a
	call .load_mon
	ret

.d_down
	xor a
	ld [wStarterCursorPositionMon], a ; start from first mon in category

	ld a, [wStarterCursorPositionCategory]
	cp NUM_STARTER_CATEGORIES - 1 ; last category
	jr z, .done
	ld a, [wStarterCursorPositionCategory]
	add a, 1
	ld [wStarterCursorPositionCategory], a
	call .load_mon
	ret

.a_button
	ld hl, IsThisYourPartnerText
	call PrintText
	call YesNoBox
	jr c, .load_mon
	jr .mon_selected
.done
	ret

.set_page
	ld a, [wcf64]
	and %11111100
	or c
	ld [wcf64], a
	ld h, 1 ; StarterSelectionScreen_LoadPage
	call StarterSelectionScreen_SetJumptableIndex
	ret

.go_to_last_starter_in_prev_category
	call .d_up
	call GetStarterCategory
.go_to_last_starter
	ld a, [wNumStartersInCategory]
	sub a, 1
	ld [wStarterCursorPositionMon], a
.load_mon
	ld h, 0 ; StarterStatsInit
	call StarterSelectionScreen_SetJumptableIndex
	ret

.mon_selected
	ld h, 4 ; StarterSelectionScreen_Exit
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
	maskbits NUM_STAT_PAGES
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
	ld hl, wTempMonDVs
	predef GetUnownLetter
	call StarterSelectionScreen_GetAnimationParam
	call SetPalettes
	call .AnimateMon
	ret

.AnimateMon:
	ld hl, wcf64
	set 5, [hl]

	hlcoord 6, 2
	call PrepMonFrontpic
	ret

StarterSelectionScreen_GetAnimationParam:
	ld bc, wTempMonSpecies
	xor a
	ret

IsThisYourPartnerText:
	text_far _IsThisYourPartnerText
	text_end
