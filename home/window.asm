RefreshScreen:: ; 2dba

	call ClearWindowData
	ld a, [hROMBank]
	push af
	ld a, BANK(Function6454) ; and BANK(Function64bf)
	rst Bankswitch

	call Function6454
	call Function2e20
	call Function64bf

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

.CloseText ; 2de2
	call ClearWindowData
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	call Function2e20
	xor a
	ld [hBGMapMode], a
	call Function2e31
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
	ld a, BANK(Function6454) ; and BANK(Function64bf)
	rst Bankswitch

	call Function6454 ; clear bgmap
	call SpeechTextBox
	call Function2e20 ; anchor bgmap
	call Function64bf ; load font
	pop af
	rst Bankswitch

	ret
; 2e20

Function2e20:: ; 2e20
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a

	callba Function104110

	pop af
	ld [hOAMUpdate], a
	ret
; 2e31

Function2e31:: ; 2e31
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
; 2e4e
