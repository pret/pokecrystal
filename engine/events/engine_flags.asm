EngineFlagAction::
; Do action b on engine flag de
;
;   b = 0: reset flag
;     = 1: set flag
;     > 1: check flag, result in c
;
; Setting/resetting does not return a result.

; 16-bit flag ids are considered invalid, but it's nice
; to know that the infrastructure is there.

	ld a, d
	cp HIGH(NUM_ENGINE_FLAGS)
	jr z, .ceiling
	jr c, .read ; cp 0 can't set carry!
	jr .invalid

; There are only NUM_ENGINE_FLAGS engine flags, so
; anything beyond that is invalid too.

.ceiling
	ld a, e
	cp LOW(NUM_ENGINE_FLAGS)
	jr c, .read

; Invalid flags are treated as flag 00.

.invalid
	xor a
	ld e, a
	ld d, a

; Get this flag's location.

.read
	ld hl, EngineFlags
; location
	add hl, de
	add hl, de
; bit
	add hl, de

; location
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
; bit
	ld c, [hl]

; What are we doing with this flag?

	ld a, b
	cp 1
	jr c, .reset ; b = 0
	jr z, .set   ; b = 1

; Return the given flag in c.
.check
	ld a, [de]
	and c
	ld c, a
	ret

; Set the given flag.
.set
	ld a, [de]
	or c
	ld [de], a
	ret

; Reset the given flag.
.reset
	ld a, c
	cpl ; AND all bits except the one in question
	ld c, a
	ld a, [de]
	and c
	ld [de], a
	ret

INCLUDE "data/engine_flags.asm"
