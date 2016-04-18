GBCOnlyScreen: ; 4ea82

	ld a, [hCGB]
	and a
	ret nz

	ld de, MUSIC_NONE
	call PlayMusic

	call ClearTileMap

	ld hl, GBCOnlyGFX
	ld de, $d000
	ld a, [rSVBK]
	push af
	ld a, 0
	ld [rSVBK], a
	call Decompress
	pop af
	ld [rSVBK], a

	ld de, $d000
	ld hl, VTiles2
	lb bc, BANK(GBCOnlyGFX), $54
	call Get2bpp

	ld de, Font
	ld hl, VTiles1
	lb bc, BANK(Font), $80
	call Get1bpp

	call DrawGBCOnlyScreen

	call WaitBGMap

; better luck next time
.loop
	call DelayFrame
	jr .loop
; 4eac5


DrawGBCOnlyScreen: ; 4eac5

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
; 4eaea


DrawGBCOnlyBorder: ; 4eaea

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
; 4eb15

.FillRow: ; 4eb15
	ld c, SCREEN_WIDTH - 2
.next_column
	ld [hli], a
	dec c
	jr nz, .next_column
	ret
; 4eb1c

.FillColumn: ; 4eb1c
	ld de, SCREEN_WIDTH
	ld c, SCREEN_HEIGHT - 2
.next_row
	ld [hl], a
	add hl, de
	dec c
	jr nz, .next_row
	ret
; 4eb27


DrawGBCOnlyGraphic: ; 4eb27
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
; 4eb38


GBCOnlyString: ; 4eb38
	db   "This Game Pak is"
	next "designed only for"
	next "use on the"
	next "Game Boy Color.@"
; 4eb76


GBCOnlyGFX: ; 4eb76
INCBIN "gfx/misc/gbc_only.w112.2bpp.lz"
; 4f0bc
