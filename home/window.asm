RefreshScreen::
	call ClearWindowData
	ldh a, [hROMBank]
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
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	call .CloseText

	pop af
	ldh [hOAMUpdate], a
	ld hl, wVramState
	res 6, [hl]
	ret

.CloseText:
	call ClearWindowData
	xor a
	ldh [hBGMapMode], a
	call OverworldTextModeSwitch
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	xor a
	ldh [hBGMapMode], a
	call SafeUpdateSprites
	ld a, $90
	ldh [hWY], a
	call ReplaceKrisSprite
	farcall ReturnFromMapSetupScript
	farcall LoadOverworldFont
	ret

OpenText::
	call ClearWindowData
	ldh a, [hROMBank]
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
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	farcall OpenAndCloseMenu_HDMATransferTileMapAndAttrMap

	pop af
	ldh [hOAMUpdate], a
	ret

SafeUpdateSprites::
	ldh a, [hOAMUpdate]
	push af
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [hOAMUpdate], a

	call UpdateSprites

	xor a
	ldh [hOAMUpdate], a
	call DelayFrame
	pop af
	ldh [hBGMapMode], a
	pop af
	ldh [hOAMUpdate], a
	ret

; unused
	scf
	ret
