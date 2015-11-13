
Function1dd702: ; 1dd702
	call Function1dd709
	call WaitPressAorB_BlinkCursor
	ret
; 1dd709

Function1dd709: ; 1dd709
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	ld hl, LZ_1dd805
	ld de, VTiles2
	call Decompress
	ld hl, Tilemap_1ddc4b
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ld de, String_1dd760
	hlcoord 2, 5
	call PlaceString
	ld de, String_1dd767
	hlcoord 15, 5
	call PlaceString
	ld de, PlayerName
	hlcoord 9, 5
	call PlaceString
	ld de, String_1dd768
	hlcoord 2, 8
	call PlaceString
	call EnableLCD
	call WaitBGMap
	ld b, $8
	call GetSGBLayout
	call SetPalettes
	call DelayFrame
	ret
; 1dd760

String_1dd760:
	db "PLAYER@"

String_1dd767:
	db "@"

String_1dd768:
	db   "This certifies"
	next "that you have"
	next "completed the"
	next "new #DEX."
	next "Congratulations!"
	db   "@"
; 1dd7ae

Function1dd7ae: ; 1dd7ae
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $7f
	call ByteFill
	ld hl, Tilemap_1dddb3
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ld de, String_1dd7fa
	hlcoord 8, 0
	call PlaceString
	ld de, String_1dd7f0
	hlcoord 3, 15
	call PlaceString
	hlcoord 12, 15
	ld de, GameTimeHours
	lb bc, 2, 4
	call PrintNum
	ld [hl], $67
	inc hl
	ld de, GameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
; 1dd7f0

String_1dd7f0: db "PLAY TIME@"
String_1dd7fa: db "GAME FREAK@"
; 1dd805

LZ_1dd805: ; 1dd805
INCBIN "gfx/unknown/1dd805.2bpp.lz"

Tilemap_1ddc4b: ; 1ddc4b
INCBIN "gfx/unknown/1ddc4b.tilemap"

Tilemap_1dddb3: ; 1dddb3
INCBIN "gfx/unknown/1dddb3.tilemap"
