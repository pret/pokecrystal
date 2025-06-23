InitDisplayForHallOfFame:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	call DisableLCD
	call LoadStandardFont
	call LoadFontsBattleExtra
	hlbgcoord 0, 0
	ld bc, vBGMap1 - vBGMap0
	ld a, " "
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_AREA
	xor a
	call ByteFill
	xor a
	ldh [hSCY], a
	ldh [hSCX], a
	call EnableLCD
	ld hl, .SavingRecordText
	call PrintText
	call WaitBGMap2
	call SetDefaultBGPAndOBP
	ret

.SavingRecordText:
	text_far _SavingRecordText
	text_end

InitDisplayForRedCredits:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	call DisableLCD
	call LoadStandardFont
	call LoadFontsBattleExtra
	hlbgcoord 0, 0
	ld bc, vBGMap1 - vBGMap0
	ld a, " "
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_AREA
	xor a
	call ByteFill
	ld hl, wBGPals1
	ld c, 4 tiles
.load_white_palettes
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	dec c
	jr nz, .load_white_palettes
	xor a
	ldh [hSCY], a
	ldh [hSCX], a
	call EnableLCD
	call WaitBGMap2
	call SetDefaultBGPAndOBP
	ret

ResetDisplayBetweenHallOfFameMons:
	ldh a, [rWBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rWBK], a
	ld hl, wDecompressScratch
	ld bc, wScratchAttrmap - wDecompressScratch
	ld a, " "
	call ByteFill
	hlbgcoord 0, 0
	ld de, wDecompressScratch
	ld b, 0
	ld c, 4 tiles
	call Request2bpp
	pop af
	ldh [rWBK], a
	ret
