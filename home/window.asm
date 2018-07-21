RefreshScreen::
	call ClearWindowData
	ld a, [hROMBank]
	push af
	ld a, BANK(ReanchorBGMap_NoOAMUpdate) ; and BANK(LoadFonts_NoOAMUpdate)
	rst Bankswitch

	call ReanchorBGMap_NoOAMUpdate
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	call LoadFonts_NoOAMUpdate

	pop af
	rst Bankswitch
	ret

CloseText::
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a

	call .CloseText

	pop af
	ld [hOAMUpdate], a
	ld hl, wVramState
	res 6, [hl]
	ret

.CloseText:
	call ClearWindowData
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	xor a
	ld [hBGMapMode], a
	call SafeUpdateSprites
	ld a, $90
	ld [hWY], a
	call ReplaceKrisSprite
	farcall ReturnFromMapSetupScript
	farcall LoadOverworldFont
	ret

OpenText::
	call ClearWindowData
	ld a, [hROMBank]
	push af
	ld a, BANK(ReanchorBGMap_NoOAMUpdate) ; and BANK(LoadFonts_NoOAMUpdate)
	rst Bankswitch

	call ReanchorBGMap_NoOAMUpdate ; clear bgmap
	call SpeechTextBox
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap ; anchor bgmap
	call LoadFonts_NoOAMUpdate ; load font
	pop af
	rst Bankswitch

	ret

_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap::
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a

	farcall OpenAndCloseMenu_HDMATransferTileMapAndAttrMap

	pop af
	ld [hOAMUpdate], a
	ret

SafeUpdateSprites::
	ld a, [hOAMUpdate]
	push af
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [hOAMUpdate], a

	call UpdateSprites

	xor a
	ld [hOAMUpdate], a
	call DelayFrame
	pop af
	ld [hBGMapMode], a
	pop af
	ld [hOAMUpdate], a
	ret

; unused
	scf
	ret
