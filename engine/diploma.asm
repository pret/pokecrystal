
_Diploma: ; 1dd702
	call PlaceDiplomaOnScreen
	call WaitPressAorB_BlinkCursor
	ret
; 1dd709

PlaceDiplomaOnScreen: ; 1dd709
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	ld hl, DiplomaGFX
	ld de, VTiles2
	call Decompress
	ld hl, DiplomaPage1Tilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ld de, .Player
	hlcoord 2, 5
	call PlaceString
	ld de, .EmptyString
	hlcoord 15, 5
	call PlaceString
	ld de, PlayerName
	hlcoord 9, 5
	call PlaceString
	ld de, .Certification
	hlcoord 2, 8
	call PlaceString
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	call DelayFrame
	ret
; 1dd760

.Player:
	db "PLAYER@"

.EmptyString:
	db "@"

.Certification:
	db   "This certifies"
	next "that you have"
	next "completed the"
	next "new #DEX."
	next "Congratulations!"
	db   "@"
; 1dd7ae

PrintDiplomaPage2: ; 1dd7ae
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $7f
	call ByteFill
	ld hl, DiplomaPage2Tilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ld de, .GameFreak
	hlcoord 8, 0
	call PlaceString
	ld de, .PlayTime
	hlcoord 3, 15
	call PlaceString
	hlcoord 12, 15
	ld de, GameTimeHours
	lb bc, 2, 4
	call PrintNum
	ld [hl], $67 ; colon
	inc hl
	ld de, GameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
; 1dd7f0

.PlayTime: db "PLAY TIME@"
.GameFreak: db "GAME FREAK@"
; 1dd805

DiplomaGFX: ; 1dd805
INCBIN "gfx/unknown/1dd805.2bpp.lz"

DiplomaPage1Tilemap: ; 1ddc4b
INCBIN "gfx/unknown/1ddc4b.tilemap"

DiplomaPage2Tilemap: ; 1dddb3
INCBIN "gfx/unknown/1dddb3.tilemap"
