RefreshScreen:: ; 2dba

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
; 2dcf


CloseText:: ; 2dcf
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a

	call .CloseText

	pop af
	ld [hOAMUpdate], a
	ld hl, VramState
	res 6, [hl]
	ret
; 2de2

.CloseText: ; 2de2
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
	callba ReturnFromMapSetupScript
	callba LoadOverworldFont
	ret
; 2e08

OpenText:: ; 2e08
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
; 2e20

_OpenAndCloseMenu_HDMATransferTileMapAndAttrMap:: ; 2e20
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a

	callba OpenAndCloseMenu_HDMATransferTileMapAndAttrMap

	pop af
	ld [hOAMUpdate], a
	ret
; 2e31

SafeUpdateSprites:: ; 2e31
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

; XXX
	scf
	ret
; 2e50
