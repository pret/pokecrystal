LoadPoisonBGPals:
	call .LoadPals
	ldh a, [hCGB]
	and a
	ret nz
	; code was probably dummied out here
	ret

.LoadPals:
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	cp DARKNESS_F
	ld a, %00000000
	jr z, .convert_pals
	ld a, %10101010

.convert_pals
	call DmgToCgbBGPals
	ld c, 4
	call DelayFrames
	farcall _UpdateTimePals
	ret

.cgb
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a
	ld hl, wBGPals2
	ld c, 4 palettes
.loop
	ld a, LOW(palred 28 + palgreen 21 + palblue 31)
	ld [hli], a
	ld a, HIGH(palred 28 + palgreen 21 + palblue 31)
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ld c, 4
	call DelayFrames
	farcall _UpdateTimePals
	ret
