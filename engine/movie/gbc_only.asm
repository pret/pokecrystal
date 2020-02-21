GBCOnlyScreen:
	ldh a, [hCGB]
	and a
	ret nz

	ld de, MUSIC_NONE
	call PlayMusic

	call ClearTilemap

	ld hl, GBCOnlyGFX
	ld de, wGBCOnlyDecompressBuffer
	ldh a, [rSVBK]
	push af
	ld a, 0 ; this has the same effect as selecting bank 1
	ldh [rSVBK], a
	call Decompress
	pop af
	ldh [rSVBK], a

	ld de, wGBCOnlyDecompressBuffer
	ld hl, vTiles2
	lb bc, BANK(GBCOnlyGFX), 84
	call Get2bpp

	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), $80
	call Get1bpp

	call DrawGBCOnlyScreen

	call WaitBGMap

; better luck next time
.loop
	call DelayFrame
	jr .loop

DrawGBCOnlyScreen:
	call DrawGBCOnlyBorder

	; Pokemon
	hlcoord 3, 2
	ld b, 14
	ld c, 4
	ld a, $8
	call DrawGBCOnlyGraphic

	; Crystal
	hlcoord 5, 6
	ld b, 10
	ld c, 2
	ld a, $40
	call DrawGBCOnlyGraphic

	ld de, GBCOnlyString
	hlcoord 1, 10
	call PlaceString

	ret

DrawGBCOnlyBorder:
	hlcoord 0, 0
	ld [hl], 0 ; top-left

	inc hl
	ld a, 1 ; top
	call .FillRow

	ld [hl], 2 ; top-right

	hlcoord 0, 1
	ld a, 3 ; left
	call .FillColumn

	hlcoord 19, 1
	ld a, 4 ; right
	call .FillColumn

	hlcoord 0, 17
	ld [hl], 5 ; bottom-left

	inc hl
	ld a, 6 ; bottom
	call .FillRow

	ld [hl], 7 ; bottom-right
	ret

.FillRow:
	ld c, SCREEN_WIDTH - 2
.next_column
	ld [hli], a
	dec c
	jr nz, .next_column
	ret

.FillColumn:
	ld de, SCREEN_WIDTH
	ld c, SCREEN_HEIGHT - 2
.next_row
	ld [hl], a
	add hl, de
	dec c
	jr nz, .next_row
	ret

DrawGBCOnlyGraphic:
	ld de, SCREEN_WIDTH
.y
	push bc
	push hl
.x
	ld [hli], a
	inc a
	dec b
	jr nz, .x
	pop hl
	add hl, de
	pop bc
	dec c
	jr nz, .y
	ret

GBCOnlyString:
	db   "This Game Pak is"
	next "designed only for"
	next "use on the"
	next "Game Boy Color.@"

GBCOnlyGFX:
INCBIN "gfx/sgb/gbc_only.2bpp.lz"
