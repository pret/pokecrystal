CheckForHiddenItems: ; b8172
; Checks to see if there are hidden items on the screen that have not yet been found.  If it finds one, returns carry.
	call GetMapScriptHeaderBank
	ld [Buffer1], a
; Get the coordinate of the bottom right corner of the screen, and load it in Buffer3/Buffer4.
	ld a, [XCoord]
	add SCREEN_WIDTH / 4
	ld [Buffer4], a
	ld a, [YCoord]
	add SCREEN_HEIGHT / 4
	ld [Buffer3], a
; Get the pointer for the first BG event header in the map...
	ld hl, wCurrMapBGEventHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
; ... before even checking to see if there are any BG events on this map.
	ld a, [wCurrMapBGEventCount]
	and a
	jr z, .nobgeventitems
; For i = 1:wCurrMapBGEventCount...
.loop
; Store the counter in Buffer2, and store the BG event header pointer in the stack.
	ld [Buffer2], a
	push hl
; Get the Y coordinate of the BG event.
	call .GetFarByte
	ld e, a
; Is the Y coordinate of the BG event on the screen?  If not, go to the next BG event.
	ld a, [Buffer3]
	sub e
	jr c, .next
	cp SCREEN_HEIGHT / 2
	jr nc, .next
; Is the X coordinate of the BG event on the screen?  If not, go to the next BG event.
	call .GetFarByte
	ld d, a
	ld a, [Buffer4]
	sub d
	jr c, .next
	cp SCREEN_WIDTH / 2
	jr nc, .next
; Is this BG event a hidden item?  If not, go to the next BG event.
	call .GetFarByte
	cp BGEVENT_ITEM
	jr nz, .next
; Has this item already been found?  If not, set off the Itemfinder.
	ld a, [Buffer1]
	call GetFarHalfword
	ld a, [Buffer1]
	call GetFarHalfword
	ld d, h
	ld e, l
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .itemnearby

.next
; Restore the BG event header pointer and increment it by the length of a BG event header.
	pop hl
	ld bc, 5
	add hl, bc
; Restore the BG event counter and decrement it.  If it hits zero, there are no hidden items in range.
	ld a, [Buffer2]
	dec a
	jr nz, .loop

.nobgeventitems
	xor a
	ret

.itemnearby
	pop hl
	scf
	ret
; b81e2

.GetFarByte: ; b81e2
	ld a, [Buffer1]
	call GetFarByte
	inc hl
	ret
; b81ea
