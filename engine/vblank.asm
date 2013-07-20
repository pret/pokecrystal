; VBlank is the interrupt responsible for updating VRAM.

; In Pokemon Crystal, VBlank has been hijacked to act as the
; main loop. After time-sensitive graphics operations have been
; performed, joypad input and sound functions are executed.

; This prevents the display and audio output from lagging.

	push af
	push bc
	push de
	push hl
	
; get vblank type
	ld a, [$ff9e]
	and $7
	
; get fn pointer
	ld e, a
	ld d, $0
	ld hl, .VBlanks
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
; down to business
	call JpHl
	
; since this is called once per frame
	call GameTimer
	
	pop hl
	pop de
	pop bc
	pop af
	reti
; 2a1

.VBlanks ; 2a1
	dw VBlank0 ; 0
	dw VBlank1 ; 1
	dw VBlank2 ; 2
	dw VBlank3 ; 3
	dw VBlank4 ; 4
	dw VBlank5 ; 5
	dw VBlank6 ; 6
	dw VBlank0 ; 7
; 2b1


VBlank0: ; 2b1
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
	ld hl, $ff9b
	inc [hl]
	
; advance rng
	ld a, [rDIV]
	ld b, a
	ld a, [$ffe1]
	adc b
	ld [$ffe1], a
	
	ld a, [rDIV]
	ld b, a
	ld a, [$ffe2]
	sbc b
	ld [$ffe2], a
	
; save bank
	ld a, [$ff9d] ; current bank
	ld [$ff8a], a
	
; scroll x
	ld a, [$ffcf]
	ld [rSCX], a
; scroll y
	ld a, [$ffd0]
	ld [rSCY], a
; window y
	ld a, [$ffd2]
	ld [rWY], a
; window x + 7
	ld a, [$ffd1]
	ld [rWX], a
	
; some time management is in order
; only have time for one of these during vblank
	
; bg map buffer has priority
	call UpdateBGMapBuffer
	jr c, .doneframeaction
	
; then pals
	call UpdatePalsIfCGB
	jr c, .doneframeaction
	
; dma transfer
	call DMATransfer
	jr c, .doneframeaction
	
; bg map
	call UpdateBGMap
	
; these have their own timing checks
	call SafeLoadTiles
	call SafeLoadTiles2
	call SafeTileAnimation
	
.doneframeaction
; oam update off?
	ld a, [$ffd8]
	and a
	jr nz, .vblankoccurred
	
; update oam by dma transfer
	call hPushOAM
;	403f:
;		ld a, $c4
;		ld [rDMA], a
;		ld a, $28
;	.loop
;		dec a
;		jr nz, .loop
;		ret


; vblank-sensitive operations are done
	
.vblankoccurred
; tell other fns vblank happened
	xor a
	ld [VBlankOccurred], a
	
; dec OverworldDelay until 0
	ld a, [OverworldDelay]
	and a
	jr z, .textdelay
	dec a
	ld [OverworldDelay], a
	
.textdelay
; dec text delay counter until 0
	ld a, [TextDelayFrames]
	and a
	jr z, .joypad
	dec a
	ld [TextDelayFrames], a
	
.joypad
	call Joypad
	
; update sound
	ld a, BANK(UpdateSound)
	rst Bankswitch ; bankswitch
	call UpdateSound
	ld a, [$ff8a]
	rst Bankswitch ; restore bank
	
; 
	ld a, [$ff98]
	ld [$ffe3], a
	
	ret
; 325


VBlank2: ; 325
; sound only

; save bank
	ld a, [$ff9d]
	ld [$ff8a], a
	
; update sound
	ld a, BANK(UpdateSound)
	rst Bankswitch ; bankswitch
	call UpdateSound
	
; restore bank
	ld a, [$ff8a]
	rst Bankswitch
	
; tell other fns vblank happened
	xor a
	ld [VBlankOccurred], a
	ret
; 337


VBlank1: ; 337
; scx, scy
; palettes
; bg map
; tiles
; oam
; sound / lcd stat

; save bank
	ld a, [$ff9d]
	ld [$ff8a], a
	
; scroll x
	ld a, [$ffcf]
	ld [rSCX], a
	
; scroll y
	ld a, [$ffd0]
	ld [rSCY], a
	
; time-sensitive fns
	call UpdatePals
	jr c, .vblankoccurred
	
; these have their own timing checks
	call UpdateBGMap
	call LoadTiles
; update oam by dma transfer
	call hPushOAM
;	403f:
;		ld a, $c4
;		ld [rDMA], a
;		ld a, $28
;	.loop
;		dec a
;		jr nz, .loop
;		ret
	
.vblankoccurred
; tell other fns vblank happened
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
; update sound
	ld a, BANK(UpdateSound)
	rst Bankswitch ; bankswitch
	call UpdateSound
; restore bank
	ld a, [$ff8a]
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


UpdatePals: ; 37f
; update pals for either dmg or cgb

; check cgb
	ld a, [$ffe6]
	and a
	jp nz, UpdateCGBPals
	
; update gb pals
	ld a, [$cfc7]
	ld [rBGP], a
	
	ld a, [$cfc8]
	ld [rOBP0], a
	
	ld a, [$cfc9]
	ld [rOBP1], a
	
	and a
	ret
; 396


VBlank3: ; 396
; scx, scy
; palettes
; bg map
; tiles
; oam
; sound / lcd stat

; save bank
	ld a, [$ff9d]
	ld [$ff8a], a
	
; scroll x
	ld a, [$ffcf]
	ld [rSCX], a
; scroll y
	ld a, [$ffd0]
	ld [rSCY], a
	
; any pals to update?
	ld a, [$ffe5]
	and a
	call nz, ForceUpdateCGBPals
	jr c, .vblankoccurred
; else
	call UpdateBGMap
	call LoadTiles
	
; update oam by dma transfer
	call hPushOAM
;	403f:
;		ld a, $c4 ; Sprites / $100
;		ld [rDMA], a
;		ld a, $28
;	.loop
;		dec a
;		jr nz, .loop
;		ret
	
.vblankoccurred
; tell other fns vblank happened
	xor a
	ld [VBlankOccurred], a
	
; save int flag
	ld a, [rIF]
	push af
; reset ints
	xor a
	ld [rIF], a
; force lcdstat int during sound update
	ld a, %10 ; lcd stat
	ld [rIE], a
	ld [rIF], a
	
	ei
; update sound
	ld a, BANK(UpdateSound)
	rst Bankswitch ; bankswitch
	call UpdateSound
; restore bank
	ld a, [$ff8a]
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


VBlank4: ; 3df
; bg map
; tiles
; oam
; joypad
; serial
; sound

; save bank
	ld a, [$ff9d]
	ld [$ff8a], a
	
	call UpdateBGMap
	call SafeLoadTiles
	
; update oam by dma transfer
	call hPushOAM
;	403f:
;		ld a, $c4
;		ld [rDMA], a
;		ld a, $28
;	.loop
;		dec a
;		jr nz, .loop
;		ret
	
; update joypad
	call Joypad
	
; tell other fns vblank happened
	xor a
	ld [VBlankOccurred], a
	
; handshake
	call AskSerial
	
; update sound
	ld a, BANK(UpdateSound)
	rst Bankswitch ; bankswitch
	call UpdateSound
; restore bank
	ld a, [$ff8a]
	rst Bankswitch
	ret
; 400


VBlank5: ; 400
; scx
; palettes
; bg map
; tiles
; joypad
; 

; save bank
	ld a, [$ff9d]
	ld [$ff8a], a
	
; scroll x
	ld a, [$ffcf]
	ld [rSCX], a
	
; if we can update pals, skip this part
	call UpdatePalsIfCGB
	jr c, .vblankoccurred
	
	call UpdateBGMap
	call SafeLoadTiles
	
.vblankoccurred
; tell other fns vblank happened
	xor a
	ld [VBlankOccurred], a
	
; joypad
	call Joypad
	
; discard requested ints
	xor a
	ld [rIF], a
; enable lcd stat
	ld a, %10 ; lcd stat
	ld [rIE], a
; request lcd stat
	ld [rIF], a
	
	ei
; update sound
	ld a, BANK(UpdateSound)
	rst Bankswitch ; bankswitch
	call UpdateSound
; restore bank
	ld a, [$ff8a]
	rst Bankswitch
	di
	
; discard requested ints
	xor a
	ld [rIF], a
; enable ints besides joypad
	ld a, %1111 ; serial timer lcdstat vblank
	ld [rIE], a
	ret
; 436


VBlank6: ; 436
; palettes
; tiles
; dma transfer
; sound

; save bank
	ld a, [$ff9d]
	ld [$ff8a], a
	
; inc frame counter
	ld hl, $ff9b
	inc [hl]
	
	call UpdateCGBPals
	jr c, .vblankoccurred
	
	call SafeLoadTiles
	call SafeLoadTiles2
	call DMATransfer
	
.vblankoccurred
; tell other fns vblank happened
	xor a
	ld [VBlankOccurred], a
	
; update sound
	ld a, BANK(UpdateSound)
	rst Bankswitch ; bankswitch
	call UpdateSound
; restore bank
	ld a, [$ff8a]
	rst Bankswitch
	ret
; 45a
