JoypadInt:: ; 92e
; Replaced by Joypad, called from VBlank instead of the useless
; joypad interrupt.

; This is a placeholder in case the interrupt is somehow enabled.
	reti
; 92f

ClearJoypad:: ; 92f
	xor a
; Pressed this frame (delta)
	ld [hJoyPressed], a
; Currently pressed
	ld [hJoyDown], a
	ret
; 935

Joypad:: ; 935
; Read the joypad register and translate it to something more
; workable for use in-game. There are 8 buttons, so we can use
; one byte to contain all player input.

; Updates:

; hJoypadReleased: released this frame (delta)
; hJoypadPressed: pressed this frame (delta)
; hJoypadDown: currently pressed
; hJoypadSum: pressed so far

; Any of these three bits can be used to disable input.
	ld a, [wcfbe]
	and %11010000
	ret nz
	
; If we're saving, input is disabled.
	ld a, [wc2cd]
	and a
	ret nz
	
; We can only get four inputs at a time.
; We take d-pad first for no particular reason.
	ld a, D_PAD
	ld [rJOYP], a
; Read twice to give the request time to take.
rept 2
	ld a, [rJOYP]
endr
	
; The Joypad register output is in the lo nybble (inversed).
; We make the hi nybble of our new container d-pad input.
	cpl
	and $f
	swap a
	
; We'll keep this in b for now.
	ld b, a
	
; Buttons make 8 total inputs (A, B, Select, Start).
; We can fit this into one byte.
	ld a, BUTTONS
	ld [rJOYP], a
; Wait for input to stabilize.
rept 6
	ld a, [rJOYP]
endr
; Buttons take the lo nybble.
	cpl
	and $f
	or b
	ld b, a
	
; Reset the joypad register since we're done with it.
	ld a, $30
	ld [rJOYP], a
	
; To get the delta we xor the last frame's input with the new one.
	ld a, [hJoypadDown] ; last frame
	ld e, a
	xor b
	ld d, a
; Released this frame:
	and e
	ld [hJoypadReleased], a
; Pressed this frame:
	ld a, d
	and b
	ld [hJoypadPressed], a
	
; Add any new presses to the list of collective presses:
	ld c, a
	ld a, [hJoypadSum]
	or c
	ld [hJoypadSum], a
	
; Currently pressed:
	ld a, b
	ld [hJoypadDown], a
	
; Now that we have the input, we can do stuff with it.

; For example, soft reset:
	and A_BUTTON | B_BUTTON | SELECT | START
	cp  A_BUTTON | B_BUTTON | SELECT | START
	jp z, Reset
	
	ret
; 984


GetJoypad:: ; 984
; Update mirror joypad input from hJoypadDown (real input)

; hJoyReleased: released this frame (delta)
; hJoyPressed: pressed this frame (delta)
; hJoyDown: currently pressed

; bit 0 A
;     1 B
;     2 SELECT
;     3 START
;     4 RIGHT
;     5 LEFT
;     6 UP
;     7 DOWN

	push af
	push hl
	push de
	push bc
	
; The player input can be automated using an input stream.
; See more below.
	ld a, [InputType]
	cp a, AUTO_INPUT
	jr z, .auto

; To get deltas, take this and last frame's input.
	ld a, [hJoypadDown] ; real input
	ld b, a
	ld a, [hJoyDown] ; last frame mirror
	ld e, a
	
; Released this frame:
	xor b
	ld d, a
	and e
	ld [hJoyReleased], a
	
; Pressed this frame:
	ld a, d
	and b
	ld [hJoyPressed], a
	
; It looks like the collective presses got commented out here.
	ld c, a
	
; Currently pressed:
	ld a, b
	ld [hJoyDown], a ; frame input
	
.quit
	pop bc
	pop de
	pop hl
	pop af
	ret	

.auto
; Use a predetermined input stream (used in the catching tutorial).

; Stream format: [input][duration]
; A value of $ff will immediately end the stream.

; Read from the input stream.
	ld a, [hROMBank]
	push af
	ld a, [AutoInputBank]
	rst Bankswitch
	
	ld hl, AutoInputAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a
	
; We only update when the input duration has expired.
	ld a, [AutoInputLength]
	and a
	jr z, .updateauto
	
; Until then, don't change anything.
	dec a
	ld [AutoInputLength], a
	pop af
	rst Bankswitch
	jr .quit
	
	
.updateauto
; An input of $ff will end the stream.
	ld a, [hli]
	cp a, $ff
	jr z, .stopauto
	ld b, a
	
; A duration of $ff will end the stream indefinitely.
	ld a, [hli]
	ld [AutoInputLength], a
	cp a, $ff
	jr nz, .next
	
; The current input is overwritten.
rept 2
	dec hl
endr
	ld b, NO_INPUT
	jr .finishauto
	
.next
; On to the next input...
	ld a, l
	ld [AutoInputAddress], a
	ld a, h
	ld [AutoInputAddress+1], a
	jr .finishauto
	
.stopauto
	call StopAutoInput
	ld b, NO_INPUT
	
.finishauto
	pop af
	rst Bankswitch
	ld a, b
	ld [hJoyPressed], a ; pressed
	ld [hJoyDown], a ; input
	jr .quit
; 9ee


StartAutoInput:: ; 9ee
; Start reading automated input stream at a:hl.
	
	ld [AutoInputBank], a
	ld a, l
	ld [AutoInputAddress], a
	ld a, h
	ld [AutoInputAddress+1], a
; Start reading the stream immediately.
	xor a
	ld [AutoInputLength], a
; Reset input mirrors.
	xor a
	ld [hJoyPressed], a ; pressed this frame
	ld [hJoyReleased], a ; released this frame
	ld [hJoyDown], a ; currently pressed
	
	ld a, AUTO_INPUT
	ld [InputType], a
	ret
; a0a


StopAutoInput:: ; a0a
; Clear variables related to automated input.
	xor a
	ld [AutoInputBank], a
	ld [AutoInputAddress], a
	ld [AutoInputAddress+1], a
	ld [AutoInputLength], a
; Back to normal input.
	ld [InputType], a
	ret
; a1b


Functiona1b:: ; a1b

	call DelayFrame

	push bc
	call Functiona57
	pop bc

	ld a, [hJoyDown]
	cp D_UP | SELECT | B_BUTTON
	jr z, .asm_a34

	ld a, [$ffa9]
	and START | A_BUTTON
	jr nz, .asm_a34

	dec c
	jr nz, Functiona1b

	and a
	ret

.asm_a34
	scf
	ret
; a36


Functiona36:: ; a36
	call DelayFrame
	call GetJoypad
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret nz
	call RTC
	jr Functiona36
; a46

CloseText:: ; a46
	ld a, [hOAMUpdate]
	push af
	ld a, 1
	ld [hOAMUpdate], a
	call WaitBGMap
	call Functiona36
	pop af
	ld [hOAMUpdate], a
	ret
; a57

Functiona57:: ; a57
	call GetJoypad
	ld a, [$ffaa]
	and a
	ld a, [hJoyPressed]
	jr z, .asm_a63
	ld a, [hJoyDown]
.asm_a63
	ld [$ffa9], a
	ld a, [hJoyPressed]
	and a
	jr z, .asm_a70
	ld a, 15
	ld [TextDelayFrames], a
	ret

.asm_a70
	ld a, [TextDelayFrames]
	and a
	jr z, .asm_a7a
	xor a
	ld [$ffa9], a
	ret

.asm_a7a
	ld a, 5
	ld [TextDelayFrames], a
	ret
; a80

Functiona80:: ; a80
	ld a, [$ffaf]
	push af
	ld a, [$ffb0]
	push af
	xor a
	ld [$ffaf], a
	ld a, $6
	ld [$ffb0], a
.asm_a8d
	push hl
	hlcoord 18, 17
	call Functionb06
	pop hl
	call Functiona57
	ld a, [$ffa9]
	and $3
	jr z, .asm_a8d
	pop af
	ld [$ffb0], a
	pop af
	ld [$ffaf], a
	ret
; aa5

Functionaa5:: ; aa5
	call Functiona57
	ld a, [$ffa9]
	and A_BUTTON | B_BUTTON
	jr z, Functionaa5
	ret
; aaf

KeepTextOpen:: ; aaf
	ld a, [InLinkBattle]
	and a
	jr nz, .asm_ac1
	call Functionac6
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret

.asm_ac1
	ld c, 65
	jp DelayFrames
; ac6

Functionac6:: ; ac6
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	ld a, [InputType]
	or a
	jr z, .asm_ad9
	callba Function1de28a
.asm_ad9
	call Functionaf5
	call Functiona57
	ld a, [hJoyPressed]
	and $3
	jr nz, .asm_af1
	call RTC
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	jr .asm_ad9

.asm_af1
	pop af
	ld [hOAMUpdate], a
	ret
; af5

Functionaf5:: ; af5
	ld a, [$ff9b]
	and $10
	jr z, .asm_aff
	ld a, $ee
	jr .asm_b02

.asm_aff
	ld a, [TileMap + 17 + 17 * SCREEN_WIDTH]

.asm_b02
	ld [TileMap + 18 + 17 * SCREEN_WIDTH], a
	ret
; b06

Functionb06:: ; b06
	push bc
	ld a, [hl]
	ld b, a
	ld a, $ee
	cp b
	pop bc
	jr nz, .asm_b27
	ld a, [$ffaf]
	dec a
	ld [$ffaf], a
	ret nz
	ld a, [$ffb0]
	dec a
	ld [$ffb0], a
	ret nz
	ld a, $7a
	ld [hl], a
	ld a, $ff
	ld [$ffaf], a
	ld a, $6
	ld [$ffb0], a
	ret

.asm_b27
	ld a, [$ffaf]
	and a
	ret z
	dec a
	ld [$ffaf], a
	ret nz
	dec a
	ld [$ffaf], a
	ld a, [$ffb0]
	dec a
	ld [$ffb0], a
	ret nz
	ld a, $6
	ld [$ffb0], a
	ld a, $ee
	ld [hl], a
	ret
; b40
