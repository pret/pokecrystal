ReanchorBGMap_NoOAMUpdate:: ; 6454
	call DelayFrame
	ldh a, [hOAMUpdate]
	push af

	ld a, $1
	ldh [hOAMUpdate], a
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	call .ReanchorBGMap

	pop af
	ldh [hBGMapMode], a
	pop af
	ldh [hOAMUpdate], a
	ld hl, wVramState
	set 6, [hl]
	ret

.ReanchorBGMap:
	xor a
	ldh [hLCDCPointer], a
	ldh [hBGMapMode], a
	ld a, $90
	ldh [hWY], a
	call OverworldTextModeSwitch
	ld a, HIGH(vBGMap1)
	call .LoadBGMapAddrIntoHRAM
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	farcall LoadOW_BGPal7
	farcall ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	xor a
	ldh [hBGMapMode], a
	ldh [hWY], a
	farcall HDMATransfer_FillBGMap0WithBlack ; no need to farcall
	ld a, HIGH(vBGMap0)
	call .LoadBGMapAddrIntoHRAM
	xor a ; LOW(vBGMap0)
	ld [wBGMapAnchor], a
	ld a, HIGH(vBGMap0)
	ld [wBGMapAnchor + 1], a
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	call ApplyBGMapAnchorToObjects
	ret

.LoadBGMapAddrIntoHRAM: ; 64b9
	ldh [hBGMapAddress + 1], a
	xor a
	ldh [hBGMapAddress], a
	ret

LoadFonts_NoOAMUpdate:: ; 64bf
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	call .LoadGFX

	pop af
	ldh [hOAMUpdate], a
	ret

.LoadGFX:
	call LoadFontsExtra
	ld a, $90
	ldh [hWY], a
	call SafeUpdateSprites
	call LoadStandardFont
	ret

HDMATransfer_FillBGMap0WithBlack: ; 64db
	ld a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ld [rSVBK], a

	ld a, "■"
	ld hl, wDecompressScratch
	ld bc, wScratchAttrMap - wDecompressScratch
	call ByteFill
	ld a, HIGH(wDecompressScratch)
	ld [rHDMA1], a
	ld a, LOW(wDecompressScratch)
	ld [rHDMA2], a
	ld a, HIGH(vBGMap0 % $8000)
	ld [rHDMA3], a
	ld a, LOW(vBGMap0 % $8000)
	ld [rHDMA4], a
	ld a, $3f
	ldh [hDMATransfer], a
	call DelayFrame

	pop af
	ld [rSVBK], a
	ret
