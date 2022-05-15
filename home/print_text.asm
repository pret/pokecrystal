PrintLetterDelay::
; Wait before printing the next letter.

; The text speed setting in wOptions is actually a frame count:
; 	fast: 1 frame
; 	mid:  3 frames
; 	slow: 5 frames

; wTextboxFlags[!0] and A or B override text speed with a one-frame delay.
; wOptions[4] and wTextboxFlags[!1] disable the delay.

	ld a, [wOptions]
	bit NO_TEXT_SCROLL, a
	ret nz

; non-scrolling text?
	ld a, [wTextboxFlags]
	bit NO_TEXT_DELAY_F, a
	ret z

	push hl
	push de
	push bc

	ld hl, hOAMUpdate
	ld a, [hl]
	push af

; orginally turned oam update off...
;	ld a, 1
	ld [hl], a

; force fast scroll?
	ld a, [wTextboxFlags]
	bit FAST_TEXT_DELAY_F, a
	jr z, .fast

; text speed
	ld a, [wOptions]
	and %111
	jr .updatedelay

.fast
	ld a, TEXT_DELAY_FAST

.updatedelay
	ld [wTextDelayFrames], a

.checkjoypad
	call GetJoypad

; input override
	ld a, [wDisableTextAcceleration]
	and a
	jr nz, .wait

; Wait one frame if holding A or B.
	ldh a, [hJoyDown]
	bit A_BUTTON_F, a
	jr z, .checkb
	jr .delay
.checkb
	bit B_BUTTON_F, a
	jr z, .wait

.delay
	call DelayFrame
	jr .end

.wait
	ld a, [wTextDelayFrames]
	and a
	jr nz, .checkjoypad

.end
	pop af
	ldh [hOAMUpdate], a
	pop bc
	pop de
	pop hl
	ret

CopyDataUntil::
; Copy [hl .. bc) to de.

; In other words, the source data is
; from hl up to but not including bc,
; and the destination is de.

	ld a, [hli]
	ld [de], a
	inc de
	ld a, h
	cp b
	jr nz, CopyDataUntil
	ld a, l
	cp c
	jr nz, CopyDataUntil
	ret

PrintNum::
	homecall _PrintNum
	ret

MobilePrintNum::
	homecall _MobilePrintNum
	ret

FarPrintText::
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	call PrintText

	pop af
	rst Bankswitch
	ret

CallPointerAt::
	ldh a, [hROMBank]
	push af
	ld a, [hli]
	rst Bankswitch

	ld a, [hli]
	ld h, [hl]
	ld l, a

	call _hl_

	pop hl
	ld a, h
	rst Bankswitch
	ret
