; VBlank is the interrupt responsible for updating VRAM.

; In Pokemon Crystal, VBlank has been hijacked to act as the
; main loop. After time-sensitive graphics operations have been
; performed, joypad input and sound functions are executed.

; This prevents the display and audio output from lagging.


VBlank:: ; 283
	push af
	push bc
	push de
	push hl

	ld a, [hVBlank]
	and 7

	ld e, a
	ld d, 0
	ld hl, .VBlanks
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	call _hl_

	call GameTimer

	pop hl
	pop de
	pop bc
	pop af
	reti
; 2a1

.VBlanks: ; 2a1
	dw VBlank0
	dw VBlank1
	dw VBlank2
	dw VBlank3
	dw VBlank4
	dw VBlank5
	dw VBlank6
	dw VBlank0 ; just in case
; 2b1


VBlank0:: ; 2b1
; normal operation

; rng
; scx, scy, wy, wx
; bg map buffer
; palettes
; dma transfer
; bg map
; tiles
; oam
; joypad
; sound

	; inc frame counter
	ld hl, hVBlankCounter
	inc [hl]

	; advance random variables
	ld a, [rDIV]
	ld b, a
	ld a, [hRandomAdd]
	adc b
	ld [hRandomAdd], a

	ld a, [rDIV]
	ld b, a
	ld a, [hRandomSub]
	sbc b
	ld [hRandomSub], a

	ld a, [hROMBank]
	ld [hROMBankBackup], a

	ld a, [hSCX]
	ld [rSCX], a
	ld a, [hSCY]
	ld [rSCY], a
	ld a, [hWY]
	ld [rWY], a
	ld a, [hWX]
	ld [rWX], a

	; There's only time to call one of these in one vblank.
	; Calls are in order of priority.

	call UpdateBGMapBuffer
	jr c, .done
	call UpdatePalsIfCGB
	jr c, .done
	call DMATransfer
	jr c, .done
	call UpdateBGMap

	; These have their own timing checks.

	call Serve2bppRequest
	call Serve1bppRequest
	call AnimateTileset

.done

	ld a, [hOAMUpdate]
	and a
	jr nz, .done_oam
	call hPushOAM
.done_oam


	; vblank-sensitive operations are done

	xor a
	ld [VBlankOccurred], a

	ld a, [OverworldDelay]
	and a
	jr z, .ok
	dec a
	ld [OverworldDelay], a
.ok

	ld a, [TextDelayFrames]
	and a
	jr z, .ok2
	dec a
	ld [TextDelayFrames], a
.ok2

	call Joypad

	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound
	ld a, [hROMBankBackup]
	rst Bankswitch

	ld a, [hSeconds]
	ld [hSecondsBackup], a

	ret
; 325


VBlank2:: ; 325
; sound only

	ld a, [hROMBank]
	ld [hROMBankBackup], a

	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound

	ld a, [hROMBankBackup]
	rst Bankswitch

	xor a
	ld [VBlankOccurred], a
	ret
; 337


VBlank1:: ; 337
; scx, scy
; palettes
; bg map
; tiles
; oam
; sound / lcd stat

	ld a, [hROMBank]
	ld [hROMBankBackup], a

	ld a, [hSCX]
	ld [rSCX], a
	ld a, [hSCY]
	ld [rSCY], a

	call UpdatePals
	jr c, .done

	call UpdateBGMap
	call Serve2bppRequest@VBlank

	call hPushOAM
.done

	xor a
	ld [VBlankOccurred], a

	; get requested ints
	ld a, [rIF]
	ld b, a
	; discard requested ints
	xor a
	ld [rIF], a
	; enable lcd stat
	ld a, %10 ; lcd stat
	ld [rIE], a
	; rerequest serial int if applicable (still disabled)
	; request lcd stat
	ld a, b
	and %1000 ; serial
	or %10 ; lcd stat
	ld [rIF], a

	ei
	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound
	ld a, [hROMBankBackup]
	rst Bankswitch
	di

	; get requested ints
	ld a, [rIF]
	ld b, a
	; discard requested ints
	xor a
	ld [rIF], a
	; enable ints besides joypad
	ld a, %1111 ; serial timer lcdstat vblank
	ld [rIE], a
	; rerequest ints
	ld a, b
	ld [rIF], a
	ret
; 37f


UpdatePals:: ; 37f
; update pals for either dmg or cgb

	ld a, [hCGB]
	and a
	jp nz, UpdateCGBPals

	; update gb pals
	ld a, [wBGP]
	ld [rBGP], a
	ld a, [wOBP0]
	ld [rOBP0], a
	ld a, [wOBP1]
	ld [rOBP1], a

	and a
	ret
; 396


VBlank3:: ; 396
; scx, scy
; palettes
; bg map
; tiles
; oam
; sound / lcd stat

	ld a, [hROMBank]
	ld [hROMBankBackup], a

	ld a, [hSCX]
	ld [rSCX], a
	ld a, [hSCY]
	ld [rSCY], a

	ld a, [hCGBPalUpdate]
	and a
	call nz, ForceUpdateCGBPals
	jr c, .done

	call UpdateBGMap
	call Serve2bppRequest@VBlank

	call hPushOAM
.done

	xor a
	ld [VBlankOccurred], a

	ld a, [rIF]
	push af
	xor a
	ld [rIF], a
	ld a, %10 ; lcd stat
	ld [rIE], a
	ld [rIF], a

	ei
	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound
	ld a, [hROMBankBackup]
	rst Bankswitch
	di

	; request lcdstat
	ld a, [rIF]
	ld b, a
	; and any other ints
	pop af
	or b
	ld b, a
	; reset ints
	xor a
	ld [rIF], a
	; enable ints besides joypad
	ld a, %1111 ; serial timer lcdstat vblank
	ld [rIE], a
	; request ints
	ld a, b
	ld [rIF], a
	ret
; 3df


VBlank4:: ; 3df
; bg map
; tiles
; oam
; joypad
; serial
; sound

	ld a, [hROMBank]
	ld [hROMBankBackup], a

	call UpdateBGMap
	call Serve2bppRequest

	call hPushOAM

	call Joypad

	xor a
	ld [VBlankOccurred], a

	call AskSerial

	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound

	ld a, [hROMBankBackup]
	rst Bankswitch
	ret
; 400


VBlank5:: ; 400
; scx
; palettes
; bg map
; tiles
; joypad
;

	ld a, [hROMBank]
	ld [hROMBankBackup], a

	ld a, [hSCX]
	ld [rSCX], a

	call UpdatePalsIfCGB
	jr c, .done

	call UpdateBGMap
	call Serve2bppRequest
.done

	xor a
	ld [VBlankOccurred], a

	call Joypad

	xor a
	ld [rIF], a
	ld a, %10 ; lcd stat
	ld [rIE], a
	; request lcd stat
	ld [rIF], a

	ei
	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound
	ld a, [hROMBankBackup]
	rst Bankswitch
	di

	xor a
	ld [rIF], a
	; enable ints besides joypad
	ld a, %1111 ; serial timer lcdstat vblank
	ld [rIE], a
	ret
; 436


VBlank6:: ; 436
; palettes
; tiles
; dma transfer
; sound

	ld a, [hROMBank]
	ld [hROMBankBackup], a

	; inc frame counter
	ld hl, hVBlankCounter
	inc [hl]

	call UpdateCGBPals
	jr c, .done

	call Serve2bppRequest
	call Serve1bppRequest
	call DMATransfer
.done

	xor a
	ld [VBlankOccurred], a

	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound

	ld a, [hROMBankBackup]
	rst Bankswitch
	ret
; 45a
