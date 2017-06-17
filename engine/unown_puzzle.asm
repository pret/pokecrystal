puzcoord EQUS "* 6 +"
PUZZLE_BORDER EQU $ee
PUZZLE_VOID   EQU $ef

UnownPuzzle: ; e1190
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	call DisableLCD
	ld hl, wMisc
	ld bc, wMiscEnd - wMisc
	xor a
	call ByteFill
	ld hl, UnownPuzzleCursorGFX
	ld de, VTiles1 tile $60
	ld bc, 4 tiles
	call CopyBytes
	ld hl, UnownPuzzleStartCancelLZ
	ld de, VTiles1 tile $6d
	call Decompress
	call LoadUnownPuzzlePiecesGFX
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, PUZZLE_BORDER
	call ByteFill
	hlcoord 4, 3
	lb bc, 12, 12
	ld a, PUZZLE_VOID
	call UnownPuzzle_FillBox
	call InitUnownPuzzlePiecePositions
	call UnownPuzzle_UpdateTilemap
	call PlaceStartCancelBox
	xor a
	ld [hSCY], a
	ld [hSCX], a
	ld [rWY], a
	ld [wJumptableIndex], a
	ld [wHoldingUnownPuzzlePiece], a
	ld [wUnownPuzzleCursorPosition], a
	ld [wUnownPuzzleHeldPiece], a
	ld a, $93
	ld [rLCDC], a
	call WaitBGMap
	ld b, SCGB_UNOWN_PUZZLE
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $24
	call DmgToCgbObjPal0
	xor a
	ld [wSolvedUnownPuzzle], a
	call DelayFrame
.loop
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .quit
	call UnownPuzzleJumptable
	ld a, [wHoldingUnownPuzzlePiece]
	and a
	jr nz, .holding_piece
	ld a, [hVBlankCounter]
	and $10
	jr z, .clear
.holding_piece
	call RedrawUnownPuzzlePieces
	jr .next

.clear
	call ClearSprites
.next
	call DelayFrame
	jr .loop

.quit
	pop af
	ld [hInMenu], a
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld a, $e3
	ld [rLCDC], a
	ret
; e124e

InitUnownPuzzlePiecePositions: ; e124e
	ld c,  1
	ld b, 16
.load_loop
	call Random
	and $f
	ld hl, .PuzzlePieceInitialPositions
	ld e, a
	ld d, $0
	add hl, de
	ld e, [hl]
	ld hl, wPuzzlePieces
	add hl, de
	ld a, [hl]
	and a
	jr nz, .load_loop
	ld [hl], c
	inc c
	dec b
	jr nz, .load_loop
	ret
; e126d

.PuzzlePieceInitialPositions: ; e126d
initpuzcoord: macro
rept _NARG / 2
	db \1 puzcoord \2
	shift
	shift
endr
endm
	initpuzcoord 0,0, 0,1, 0,2, 0,3, 0,4, 0,5
	initpuzcoord 1,0,                     1,5
	initpuzcoord 2,0,                     2,5
	initpuzcoord 3,0,                     3,5
	initpuzcoord 4,0,                     4,5
	initpuzcoord 5,0,                     5,5
	                   ; START > CANCEL
; e127d

PlaceStartCancelBox: ; e127d
	call PlaceStartCancelBoxBorder
	hlcoord 5, 16
	ld a, $f6
	ld c, 10
.loop
	ld [hli], a
	inc a
	dec c
	jr nz, .loop
	ret
; e128d

PlaceStartCancelBoxBorder: ; e128d
	hlcoord 4, 15
	ld a, $f0
	ld [hli], a
	ld bc, 10
	ld a, $f1
	call ByteFill
	hlcoord 15, 15
	ld a, $f2
	ld [hli], a
	hlcoord 4, 16
	ld a, $f3
	ld [hli], a
	ld bc, 10
	ld a, $ef
	call ByteFill
	hlcoord 15, 16
	ld a, $f3
	ld [hli], a
	hlcoord 4, 17
	ld a, $f4
	ld [hli], a
	ld bc, 10
	ld a, $f1
	call ByteFill
	hlcoord 15, 17
	ld a, $f5
	ld [hl], a
	ret
; e12ca

UnownPuzzleJumptable: ; e12ca
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; e12d9

.Jumptable: ; e12d9

	dw .Function
; e12db

.Function: ; e12db
	ld a, [hJoyPressed]
	and START
	jp nz, UnownPuzzle_Quit
	ld a, [hJoyPressed]
	and A_BUTTON
	jp nz, UnownPuzzle_A
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	ld a, [hl]
	and D_LEFT
	jr nz, .d_left
	ld a, [hl]
	and D_RIGHT
	jr nz, .d_right
	ret

.d_up
	ld hl, wUnownPuzzleCursorPosition
	ld a, [hl]
	cp 1 puzcoord 0
	ret c
	sub $6
	ld [hl], a
	jr .done_joypad

.d_down
	ld hl, wUnownPuzzleCursorPosition
	ld a, [hl]
	cp 4 puzcoord 1
	ret z
	cp 4 puzcoord 2
	ret z
	cp 4 puzcoord 3
	ret z
	cp 4 puzcoord 4
	ret z
	cp 5 puzcoord 0
	ret nc
	add $6
	ld [hl], a
	jr .done_joypad

.d_left
	ld hl, wUnownPuzzleCursorPosition
	ld a, [hl]
	and a
	ret z
	cp 1 puzcoord 0
	ret z
	cp 2 puzcoord 0
	ret z
	cp 3 puzcoord 0
	ret z
	cp 4 puzcoord 0
	ret z
	cp 5 puzcoord 0
	ret z
	cp 5 puzcoord 5
	jr z, .left_overflow
	dec [hl]
	jr .done_joypad

.left_overflow
	ld [hl], 5 puzcoord 0
	jr .done_joypad

.d_right
	ld hl, wUnownPuzzleCursorPosition
	ld a, [hl]
	cp 0 puzcoord 5
	ret z
	cp 1 puzcoord 5
	ret z
	cp 2 puzcoord 5
	ret z
	cp 3 puzcoord 5
	ret z
	cp 4 puzcoord 5
	ret z
	cp 5 puzcoord 5
	ret z
	cp 5 puzcoord 0
	jr z, .right_overflow
	inc [hl]
	jr .done_joypad

.right_overflow
	ld [hl], 5 puzcoord 5

.done_joypad
	ld a, [wHoldingUnownPuzzlePiece]
	and a
	jr nz, .holding_piece
	ld de, SFX_POUND
	jr .play_sfx

.holding_piece
	ld de, SFX_MOVE_PUZZLE_PIECE

.play_sfx
	call PlaySFX
	ret
; e1376

UnownPuzzle_A: ; e1376
	ld a, [wHoldingUnownPuzzlePiece]
	and a
	jr nz, .TryPlacePiece
	call UnownPuzzle_CheckCurrentTileOccupancy
	and a
	jr z, UnownPuzzle_InvalidAction
	ld de, SFX_MEGA_KICK
	call PlaySFX
	ld [hl], 0
	ld [wUnownPuzzleHeldPiece], a
	call RedrawUnownPuzzlePieces
	call FillUnoccupiedPuzzleSpace
	call WaitBGMap
	call WaitSFX
	ld a, TRUE
	ld [wHoldingUnownPuzzlePiece], a
	ret

.TryPlacePiece:
	call UnownPuzzle_CheckCurrentTileOccupancy
	and a
	jr nz, UnownPuzzle_InvalidAction
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
	ld a, [wUnownPuzzleHeldPiece]
	ld [hl], a
	call PlaceUnownPuzzlePieceGFX
	call WaitBGMap
	xor a
	ld [wUnownPuzzleHeldPiece], a
	call RedrawUnownPuzzlePieces
	xor a
	ld [wHoldingUnownPuzzlePiece], a
	call WaitSFX
	call CheckSolvedUnownPuzzle
	ret nc

; You solved the puzzle!
	call PlaceStartCancelBoxBorder
	call ClearSprites
	ld de, SFX_1ST_PLACE
	call PlaySFX
	call WaitSFX
	call SimpleWaitPressAorB
	ld a, TRUE
	ld [wSolvedUnownPuzzle], a
UnownPuzzle_Quit: ; e13de
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

UnownPuzzle_InvalidAction: ; e13e4
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	ret
; e13ee

UnownPuzzle_FillBox: ; e13ee
	ld de, SCREEN_WIDTH
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret
; e13fe

UnownPuzzle_UpdateTilemap: ; e13fe
	xor a
	ld [wUnownPuzzleCursorPosition], a
	ld c, 6 * 6
.loop
	push bc
	call UnownPuzzle_CheckCurrentTileOccupancy
	ld [wUnownPuzzleHeldPiece], a
	and a
	jr z, .not_holding_piece
	call PlaceUnownPuzzlePieceGFX
	jr .next

.not_holding_piece
	call FillUnoccupiedPuzzleSpace

.next
	ld hl, wUnownPuzzleCursorPosition
	inc [hl]
	pop bc
	dec c
	jr nz, .loop
	ret
; e141f

PlaceUnownPuzzlePieceGFX: ; e141f
	ld a, $2 ; tilemap coords
	call GetUnownPuzzleCoordData
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	call GetCurrentPuzzlePieceVTileCorner
	pop hl
	ld de, SCREEN_WIDTH
	ld b, 3
.row
	ld c, 3
	push hl
.col
	ld [hli], a
	inc a
	dec c
	jr nz, .col
	add 9
	pop hl
	add hl, de
	dec b
	jr nz, .row
	ret
; e1441

FillUnoccupiedPuzzleSpace: ; e1441
	ld a, 2 ; tilemap coords
	call GetUnownPuzzleCoordData
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, 4 ; tile
	call GetUnownPuzzleCoordData
	ld a, [hl]
	pop hl
	ld de, SCREEN_WIDTH
	ld b, 3
.row
	ld c, 3
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	dec b
	jr nz, .row
	ret
; e1463

GetUnownPuzzleCoordData: ; e1463
	ld e, a
	ld d, 0
	ld hl, UnownPuzzleCoordData
	add hl, de
	ld a, [wUnownPuzzleCursorPosition]
	ld e, a
rept 6
	add hl, de
endr
	ret
; e1475

UnownPuzzle_CheckCurrentTileOccupancy: ; e1475
	ld hl, wPuzzlePieces
	ld a, [wUnownPuzzleCursorPosition]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ret
; e1481

GetCurrentPuzzlePieceVTileCorner: ; e1481
	ld a, [wUnownPuzzleHeldPiece]
	ld hl, .Corners
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ret
; e148f

.Corners: ; e148f
; 00, 01, 02
; 0c, 0d, 0e
; 18, 19, 1a
	db $e0 ; no piece selected
	db $00, $03, $06, $09
	db $24, $27, $2a, $2d
	db $48, $4b, $4e, $51
	db $6c, $6f, $72, $75
; e14a0

CheckSolvedUnownPuzzle: ; e14a0
	ld hl, .SolvedPuzzleConfiguration
	ld de, wPuzzlePieces
	ld c, 6 * 6
.loop
	ld a, [de]
	cp [hl]
	jr nz, .not_solved
	inc de
	inc hl
	dec c
	jr nz, .loop
	scf
	ret

.not_solved
	and a
	ret
; e14b5

.SolvedPuzzleConfiguration: ; e14b5
	db $00, $00, $00, $00, $00, $00
	db $00, $01, $02, $03, $04, $00
	db $00, $05, $06, $07, $08, $00
	db $00, $09, $0a, $0b, $0c, $00
	db $00, $0d, $0e, $0f, $10, $00
	db $00, $00, $00, $00, $00, $00
; e14d9

RedrawUnownPuzzlePieces: ; e14d9
	call GetCurrentPuzzlePieceVTileCorner
	ld [wd002], a
	xor a
	call GetUnownPuzzleCoordData ; get pixel positions
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, [wd002]
	cp $e0
	jr z, .NoPiece
	ld hl, .OAM_HoldingPiece
	jr .load

.NoPiece:
	ld hl, .OAM_NotHoldingPiece

.load
	ld de, Sprites
.loop
	ld a, [hli]
	cp -1
	ret z
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [wd002]
	add [hl]
	ld [de], a
	inc hl
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .loop
; e150f

.OAM_HoldingPiece: ; e150f
	dsprite -1, -4, -1, -4, $00, $00
	dsprite -1, -4,  0, -4, $01, $00
	dsprite -1, -4,  0,  4, $02, $00
	dsprite  0, -4, -1, -4, $0c, $00
	dsprite  0, -4,  0, -4, $0d, $00
	dsprite  0, -4,  0,  4, $0e, $00
	dsprite  0,  4, -1, -4, $18, $00
	dsprite  0,  4,  0, -4, $19, $00
	dsprite  0,  4,  0,  4, $1a, $00
	db -1

.OAM_NotHoldingPiece: ; e1534
	dsprite -1, -4, -1, -4, $00, $00
	dsprite -1, -4,  0, -4, $01, $00
	dsprite -1, -4,  0,  4, $00, $20 ; xflip
	dsprite  0, -4, -1, -4, $02, $00
	dsprite  0, -4,  0, -4, $03, $00
	dsprite  0, -4,  0,  4, $02, $20 ; xflip
	dsprite  0,  4, -1, -4, $00, $40 ; yflip
	dsprite  0,  4,  0, -4, $01, $40 ; yflip
	dsprite  0,  4,  0,  4, $00, $60 ; xflip, yflip
	db -1

UnownPuzzleCoordData: ; e1559

puzzle_coords: macro
	dbpixel \1, \2, \3, \4
	dwcoord \5, \6
	db \7, \8
endm
; OAM coords, tilemap coords, vacant tile, filler
	puzzle_coords  3,  3, 4, 4,  1,  0, PUZZLE_BORDER, 0
	puzzle_coords  6,  3, 4, 4,  4,  0, PUZZLE_BORDER, 0
	puzzle_coords  9,  3, 4, 4,  7,  0, PUZZLE_BORDER, 0
	puzzle_coords 12,  3, 4, 4, 10,  0, PUZZLE_BORDER, 0
	puzzle_coords 15,  3, 4, 4, 13,  0, PUZZLE_BORDER, 0
	puzzle_coords 18,  3, 4, 4, 16,  0, PUZZLE_BORDER, 0

	puzzle_coords  3,  6, 4, 4,  1,  3, PUZZLE_BORDER, 0
	puzzle_coords  6,  6, 4, 4,  4,  3, PUZZLE_VOID,   0
	puzzle_coords  9,  6, 4, 4,  7,  3, PUZZLE_VOID,   0
	puzzle_coords 12,  6, 4, 4, 10,  3, PUZZLE_VOID,   0
	puzzle_coords 15,  6, 4, 4, 13,  3, PUZZLE_VOID,   0
	puzzle_coords 18,  6, 4, 4, 16,  3, PUZZLE_BORDER, 0

	puzzle_coords  3,  9, 4, 4,  1,  6, PUZZLE_BORDER, 0
	puzzle_coords  6,  9, 4, 4,  4,  6, PUZZLE_VOID,   0
	puzzle_coords  9,  9, 4, 4,  7,  6, PUZZLE_VOID,   0
	puzzle_coords 12,  9, 4, 4, 10,  6, PUZZLE_VOID,   0
	puzzle_coords 15,  9, 4, 4, 13,  6, PUZZLE_VOID,   0
	puzzle_coords 18,  9, 4, 4, 16,  6, PUZZLE_BORDER, 0

	puzzle_coords  3, 12, 4, 4,  1,  9, PUZZLE_BORDER, 0
	puzzle_coords  6, 12, 4, 4,  4,  9, PUZZLE_VOID,   0
	puzzle_coords  9, 12, 4, 4,  7,  9, PUZZLE_VOID,   0
	puzzle_coords 12, 12, 4, 4, 10,  9, PUZZLE_VOID,   0
	puzzle_coords 15, 12, 4, 4, 13,  9, PUZZLE_VOID,   0
	puzzle_coords 18, 12, 4, 4, 16,  9, PUZZLE_BORDER, 0

	puzzle_coords  3, 15, 4, 4,  1, 12, PUZZLE_BORDER, 0
	puzzle_coords  6, 15, 4, 4,  4, 12, PUZZLE_VOID,   0
	puzzle_coords  9, 15, 4, 4,  7, 12, PUZZLE_VOID,   0
	puzzle_coords 12, 15, 4, 4, 10, 12, PUZZLE_VOID,   0
	puzzle_coords 15, 15, 4, 4, 13, 12, PUZZLE_VOID,   0
	puzzle_coords 18, 15, 4, 4, 16, 12, PUZZLE_BORDER, 0

	puzzle_coords  3, 18, 4, 4,  1, 15, PUZZLE_BORDER, 0
	puzzle_coords  6, 18, 4, 4,  4, 15, PUZZLE_BORDER, 0
	puzzle_coords  9, 18, 4, 4,  7, 15, PUZZLE_BORDER, 0
	puzzle_coords 12, 18, 4, 4, 10, 15, PUZZLE_BORDER, 0
	puzzle_coords 15, 18, 4, 4, 13, 15, PUZZLE_BORDER, 0
	puzzle_coords 18, 18, 4, 4, 16, 15, PUZZLE_BORDER, 0

ConvertLoadedPuzzlePieces: ; e1631
	ld hl, VTiles2
	ld de, VTiles0
	ld b, 6
.loop
	push bc
	push hl
	push hl
	call .EnlargePuzzlePieceTiles
	pop hl
	ld bc, 1 tiles / 2
	add hl, bc
	call .EnlargePuzzlePieceTiles
	pop hl
	ld bc, 6 tiles
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	call UnownPuzzle_AddPuzzlePieceBorders
	ret
; e1654

.EnlargePuzzlePieceTiles: ; e1654
; double size
	ld c, 6
.loop1
	push bc
	push hl
	push hl
	ld c, 4
.loop2
	push bc
	ld a, [hli]
	and $f0
	swap a
	call .GetEnlargedTile
	ld c, a
	ld a, [hli]
	and $f0
	swap a
	call .GetEnlargedTile
	ld b, a
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	pop bc
	dec c
	jr nz, .loop2
	pop hl
	ld c, 4
.loop3
	push bc
	ld a, [hli]
	and $f
	call .GetEnlargedTile
	ld c, a
	ld a, [hli]
	and $f
	call .GetEnlargedTile
	ld b, a
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	pop bc
	dec c
	jr nz, .loop3
	pop hl
	ld bc, 1 tiles
	add hl, bc
	pop bc
	dec c
	jr nz, .loop1
	ret
; e16aa

.GetEnlargedTile: ; e16aa
	push hl
	ld hl, .EnlargedTiles
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]
	pop hl
	ret
; e16b7

.EnlargedTiles: ; e16b7

x = 0
rept 16
	db ((x & %1000) * %11000) + ((x & %0100) * %1100) + ((x & %0010) * %110) + ((x & %0001) * %11)
x = x + 1
endr
; e16c7

UnownPuzzle_AddPuzzlePieceBorders: ; e16c7
	ld hl, GFXHeaders
	ld a, 8
.loop
	push af
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call .LoadGFX
	pop hl
rept 4
	inc hl
endr
	pop af
	dec a
	jr nz, .loop
	ret
; e16e2

.LoadGFX: ; e16e2
	lb bc, 4, 4
.loop1
	push bc

.loop2
	push de
	push hl

	ld b, 1 tiles
.loop3
	ld a, [de]
	or [hl]
	ld [hli], a
	inc de
	dec b
	jr nz, .loop3

	pop hl
	ld de, 3 tiles
	add hl, de
	pop de
	dec c
	jr nz, .loop2

	ld bc, 24 tiles
	add hl, bc
	pop bc
	dec b
	jr nz, .loop1
	ret
; e1703

GFXHeaders: ; e1703
	dw .TileBordersGFX + 0 tiles, VTiles0 tile $00
	dw .TileBordersGFX + 1 tiles, VTiles0 tile $01
	dw .TileBordersGFX + 2 tiles, VTiles0 tile $02
	dw .TileBordersGFX + 3 tiles, VTiles0 tile $0c
	dw .TileBordersGFX + 4 tiles, VTiles0 tile $0e
	dw .TileBordersGFX + 5 tiles, VTiles0 tile $18
	dw .TileBordersGFX + 6 tiles, VTiles0 tile $19
	dw .TileBordersGFX + 7 tiles, VTiles0 tile $1a
; e1723

.TileBordersGFX: ; e1723
INCBIN "gfx/unown_puzzle/tile_borders.2bpp"

LoadUnownPuzzlePiecesGFX: ; e17a3
	ld a, [ScriptVar]
	and 3
	ld e, a
	ld d, 0
	ld hl, .LZPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTiles2
	call Decompress
	call ConvertLoadedPuzzlePieces
	ret
; e17bd

.LZPointers: ; e17bd
	dw KabutoPuzzleLZ
	dw OmanytePuzzleLZ
	dw AerodactylPuzzleLZ
	dw HoOhPuzzleLZ
; e17c5

UnownPuzzleCursorGFX: ; e17c5
INCBIN "gfx/unown_puzzle/cursor.2bpp"

UnownPuzzleStartCancelLZ: ; e1805
INCBIN "gfx/unown_puzzle/start_cancel.2bpp.lz"

HoOhPuzzleLZ: ; e18ab
INCBIN "gfx/unown_puzzle/hooh.2bpp.lz"

AerodactylPuzzleLZ: ; e19fb
INCBIN "gfx/unown_puzzle/aerodactyl.2bpp.lz"

KabutoPuzzleLZ: ; e1bab
INCBIN "gfx/unown_puzzle/kabuto.2bpp.lz"

OmanytePuzzleLZ: ; e1c9b
INCBIN "gfx/unown_puzzle/omanyte.2bpp.lz"
