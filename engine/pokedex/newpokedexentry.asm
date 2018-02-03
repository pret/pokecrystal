NewPokedexEntry: ; fb877
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	call LowVolume
	call ClearBGPalettes
	call ClearTileMap
	call UpdateSprites
	call ClearSprites
	ld a, [wPokedexStatus]
	push af
	ld a, [hSCX]
	add POKEDEX_SCX
	ld [hSCX], a
	xor a
	ld [wPokedexStatus], a
	farcall _NewPokedexEntry
	call WaitPressAorB_BlinkCursor
	ld a, 1 ; page 2
	ld [wPokedexStatus], a
	farcall DisplayDexEntry
	call WaitPressAorB_BlinkCursor
	pop af
	ld [wPokedexStatus], a
	call MaxVolume
	call RotateThreePalettesRight
	ld a, [hSCX]
	add -POKEDEX_SCX
	ld [hSCX], a
	call .ReturnFromDexRegistration
	pop af
	ld [hMapAnims], a
	ret
; fb8c8

.ReturnFromDexRegistration: ; fb8c8
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	farcall Pokedex_PlaceFrontpicTopLeftCorner
	call WaitBGMap2
	farcall GetEnemyMonDVs
	ld a, [hli]
	ld [wTempMonDVs], a
	ld a, [hl]
	ld [wTempMonDVs + 1], a
	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call SetPalettes
	ret
; fb8f1
