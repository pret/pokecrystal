ResetWindow:: ; 2dba

	call Function1fbf
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


Function2dcf:: ; 2dcf
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call Function2de2
	pop af
	ld [hOAMUpdate], a
	ld hl, VramState
	res 6, [hl]
	ret
; 2de2

Function2de2:: ; 2de2
	call Function1fbf
	xor a
	ld [hBGMapMode], a
	call Function2173
	call Function2e20
	xor a
	ld [hBGMapMode], a
	call Function2e31
	ld a, $90
	ld [hWY], a
	call Special_ReplaceKrisSprite
	callba ReturnFromMapSetupScript
	callba Function106594
	ret
; 2e08

Function2e08:: ; 2e08
	call Function1fbf
	ld a, [hROMBank]
	push af
	ld a, BANK(Function6454) ; and BANK(Function64bf)
	rst Bankswitch

	call Function6454
	call SpeechTextBox
	call Function2e20
	call Function64bf
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
	call DrawOnMap
	xor a
	ld [hOAMUpdate], a
	call DelayFrame
	pop af
	ld [hBGMapMode], a
	pop af
	ld [hOAMUpdate], a
	ret
; 2e4e
