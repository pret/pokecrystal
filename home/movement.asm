InitMovementBuffer::
	ld [wMovementBufferObject], a
	xor a
	ld [wMovementBufferCount], a
	ld a, $0 ; was BANK(wMovementBuffer) in G/S
	ld [wUnusedMovementBufferBank], a
	ld a, LOW(wMovementBuffer)
	ld [wUnusedMovementBufferPointer], a
	ld a, HIGH(wMovementBuffer)
	ld [wUnusedMovementBufferPointer + 1], a
	ret

DecrementMovementBufferCount::
	ld a, [wMovementBufferCount]
	and a
	ret z
	dec a
	ld [wMovementBufferCount], a
	ret

AppendToMovementBuffer::
	push hl
	push de
	ld hl, wMovementBufferCount
	ld e, [hl]
	inc [hl]
	ld d, 0
	ld hl, wMovementBuffer
	add hl, de
	ld [hl], a
	pop de
	pop hl
	ret

AppendToMovementBufferNTimes::
	push af
	ld a, c
	and a
	jr nz, .okay
	pop af
	ret

.okay
	pop af
.loop
	call AppendToMovementBuffer
	dec c
	jr nz, .loop
	ret

ComputePathToWalkToPlayer::
	push af
; compare x coords, load left/right into h, and x distance into d
	ld a, b
	sub d
	ld h, LEFT
	jr nc, .got_x_distance
	dec a
	cpl
	ld h, RIGHT

.got_x_distance
	ld d, a
; compare y coords, load up/down into l, and y distance into e
	ld a, c
	sub e
	ld l, UP
	jr nc, .got_y_distance
	dec a
	cpl
	ld l, DOWN

.got_y_distance
	ld e, a
; if the x distance is less than the y distance, swap h and l, and swap d and e
	cp d
	jr nc, .done
	ld a, h
	ld h, l
	ld l, a
	ld a, d
	ld d, e
	ld e, a

.done
	pop af
	ld b, a
; Add movement in the longer direction first...
	ld a, h
	call .GetMovementData
	ld c, d
	call AppendToMovementBufferNTimes
; ... then add the shorter direction.
	ld a, l
	call .GetMovementData
	ld c, e
	call AppendToMovementBufferNTimes
	ret

.GetMovementData:
	push de
	push hl
	ld l, b
	ld h, 0
	add hl, hl
	add hl, hl
	ld e, a
	ld d, 0
	add hl, de
	ld de, .MovementData
	add hl, de
	ld a, [hl]
	pop hl
	pop de
	ret

.MovementData:
	slow_step DOWN
	slow_step UP
	slow_step LEFT
	slow_step RIGHT
	step DOWN
	step UP
	step LEFT
	step RIGHT
	big_step DOWN
	big_step UP
	big_step LEFT
	big_step RIGHT
