JoypadInt: ; 92e
; Replaced by Joypad, called from VBlank instead of the useless
; joypad interrupt.

; This is a placeholder in case the interrupt is somehow enabled.
	reti
; 92f

ClearJoypadPublic: ; 92f
	xor a
; Pressed this frame (delta)
	ld [hJoyPressed], a
; Currently pressed
	ld [hJoyDown], a
	ret
; 935

Joypad: ; 935
; Read the joypad register and translate it to something more
; workable for use in-game. There are 8 buttons, so we can use
; one byte to contain all player input.

; Updates:

; hJoypadReleased: released this frame (delta)
; hJoypadPressed: pressed this frame (delta)
; hJoypadDown: currently pressed
; hJoypadSum: pressed so far

; Any of these three bits can be used to disable input.
	ld a, [$cfbe]
	and %11010000
	ret nz
	
; If we're saving, input is disabled.
	ld a, [$c2cd]
	and a
	ret nz
	
; We can only get four inputs at a time.
; We take d-pad first for no particular reason.
	ld a, D_PAD
	ld [rJOYP], a
; Read twice to give the request time to take.
	ld a, [rJOYP]
	ld a, [rJOYP]
	
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
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
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
	and BUTTON_A | BUTTON_B | SELECT | START
	cp  BUTTON_A | BUTTON_B | SELECT | START
	jp z, Reset
	
	ret
; 984


GetJoypadPublic: ; 984
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
	dec hl
	dec hl
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


StartAutoInput: ; 9ee
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


StopAutoInput: ; a0a
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

