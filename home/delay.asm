DelayFrame:: ; 45a
; Wait for one frame
	ld a, 1
	ld [VBlankOccurred], a

; Wait for the next VBlank, halting to conserve battery
.halt
	halt ; rgbasm adds a nop after this instruction by default
	ld a, [VBlankOccurred]
	and a
	jr nz, .halt
	ret
; 468


DelayFrames:: ; 468
; Wait c frames
	call DelayFrame
	dec c
	jr nz, DelayFrames
	ret
; 46f
