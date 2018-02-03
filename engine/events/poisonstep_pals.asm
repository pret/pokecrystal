LoadPoisonBGPals: ; cbcdd
	call .LoadPals
	ld a, [hCGB]
	and a
	ret nz
	ret ; ????

.LoadPals: ; cbce5
	ld a, [hCGB]
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
	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ld [rSVBK], a
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
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ld c, 4
	call DelayFrames
	farcall _UpdateTimePals
	ret
