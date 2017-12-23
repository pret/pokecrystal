SwapTextboxPalettes:: ; 4c000
	hlcoord 0, 0
	decoord 0, 0, AttrMap
	ld b, SCREEN_HEIGHT
.loop
	push bc
	ld c, SCREEN_WIDTH
.innerloop
	ld a, [hl]
	push hl
	srl a
	jr c, .UpperNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	and $f
	jr .next

.UpperNybble:
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	swap a
	and $f

.next
	pop hl
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .innerloop
	pop bc
	dec b
	jr nz, .loop
	ret

ScrollBGMapPalettes:: ; 4c03f
	ld hl, BGMapBuffer
	ld de, BGMapPalBuffer
.loop
	ld a, [hl]
	push hl
	srl a
	jr c, .UpperNybble

; .LowerNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	and $f
	jr .next

.UpperNybble:
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	swap a
	and $f

.next
	pop hl
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .loop
	ret
