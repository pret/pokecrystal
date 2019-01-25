_AnimateTileset::
; Iterate over a given pointer array of
; animation functions (one per frame).

; Typically in wra1, vra0

	ld a, [wTilesetAnim]
	ld e, a
	ld a, [wTilesetAnim + 1]
	ld d, a

	ldh a, [hTileAnimFrame]
	ld l, a
	inc a
	ldh [hTileAnimFrame], a

	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de

; 2-byte parameter
; All functions take input de.
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Function address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	jp hl

Tileset0Anim:
TilesetJohtoModernAnim:
TilesetKantoAnim:
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetParkAnim:
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw vTiles2 tile $5f, AnimateFountain
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetForestAnim:
	dw NULL,  ForestTreeLeftAnimation
	dw NULL,  ForestTreeRightAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  ForestTreeLeftAnimation2
	dw NULL,  ForestTreeRightAnimation2
	dw NULL,  AnimateFlowerTile
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  AnimateWaterPalette
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetJohtoAnim:
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw WhirlpoolFrames1, AnimateWhirlpoolTile
	dw WhirlpoolFrames2, AnimateWhirlpoolTile
	dw WhirlpoolFrames3, AnimateWhirlpoolTile
	dw WhirlpoolFrames4, AnimateWhirlpoolTile
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim_fc0d7:
	dw vTiles2 tile $03, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $03, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim_fc103:
	dw vTiles2 tile $14, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetPortAnim:
	dw vTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateWaterPalette
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

TilesetEliteFourRoomAnim:
	dw NULL,  LavaBubbleAnim2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  LavaBubbleAnim1
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim_fc17f:
	dw vTiles2 tile $53, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $53, WriteTileFromBuffer
	dw vTiles2 tile $03, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $03, WriteTileFromBuffer
	dw vTiles2 tile $53, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $53, WriteTileFromBuffer
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim_fc1af:
	dw vTiles2 tile $54, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $54, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw vTiles2 tile $03, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $03, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw vTiles2 tile $54, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileDown
	dw wTileAnimBuffer, ScrollTileDown
	dw vTiles2 tile $54, WriteTileFromBuffer
	dw NULL,  DoneTileAnimation

TilesetCaveAnim:
TilesetDarkCaveAnim:
	dw vTiles2 tile $14, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  AnimateWaterPalette
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $40, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $40, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  DoneTileAnimation

TilesetIcePathAnim:
	dw vTiles2 tile $35, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $35, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  AnimateWaterPalette
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $31, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw vTiles2 tile $31, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  DoneTileAnimation

TilesetTowerAnim:
	dw TowerPillarTilePointer9,  AnimateTowerPillarTile
	dw TowerPillarTilePointer10, AnimateTowerPillarTile
	dw TowerPillarTilePointer7,  AnimateTowerPillarTile
	dw TowerPillarTilePointer8,  AnimateTowerPillarTile
	dw TowerPillarTilePointer5,  AnimateTowerPillarTile
	dw TowerPillarTilePointer6,  AnimateTowerPillarTile
	dw TowerPillarTilePointer3,  AnimateTowerPillarTile
	dw TowerPillarTilePointer4,  AnimateTowerPillarTile
	dw TowerPillarTilePointer1,  AnimateTowerPillarTile
	dw TowerPillarTilePointer2,  AnimateTowerPillarTile
	dw NULL,  StandingTileFrame
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

UnusedTilesetAnim_fc2bf:
	dw vTiles2 tile $4f, WriteTileToBuffer
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw vTiles2 tile $4f, WriteTileFromBuffer
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

TilesetBattleTowerOutsideAnim:
TilesetHouseAnim:
TilesetPlayersHouseAnim:
TilesetPokecenterAnim:
TilesetGateAnim:
TilesetLabAnim:
TilesetFacilityAnim:
TilesetMartAnim:
TilesetMansionAnim:
TilesetGameCornerAnim:
TilesetTraditionalHouseAnim:
TilesetTrainStationAnim:
TilesetChampionsRoomAnim:
TilesetLighthouseAnim:
TilesetPlayersRoomAnim:
TilesetPokeComCenterAnim:
TilesetBattleTowerAnim:
TilesetRuinsOfAlphAnim:
TilesetRadioTowerAnim:
TilesetUndergroundAnim:
TilesetBetaWordRoomAnim:
TilesetHoOhWordRoomAnim:
TilesetKabutoWordRoomAnim:
TilesetOmanyteWordRoomAnim:
TilesetAerodactylWordRoomAnim:
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation

DoneTileAnimation:
; Reset the animation command loop.
	xor a
	ldh [hTileAnimFrame], a

WaitTileAnimation:
; Do nothing this frame.
	ret

StandingTileFrame8:
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	ret

ScrollTileRightLeft:
; Scroll right for 4 ticks, then left for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	and %100
	jr nz, ScrollTileLeft
	jr ScrollTileRight

ScrollTileUpDown:
; Scroll up for 4 ticks, then down for 4 ticks.
	ld a, [wTileAnimationTimer]
	inc a
	and %111
	ld [wTileAnimationTimer], a
	and %100
	jr nz, ScrollTileDown
	jr ScrollTileUp

ScrollTileLeft:
	ld h, d
	ld l, e
	ld c, 4
.loop
rept 4
	ld a, [hl]
	rlca
	ld [hli], a
endr
	dec c
	jr nz, .loop
	ret

ScrollTileRight:
	ld h, d
	ld l, e
	ld c, 4
.loop
rept 4
	ld a, [hl]
	rrca
	ld [hli], a
endr
	dec c
	jr nz, .loop
	ret

ScrollTileUp:
	ld h, d
	ld l, e
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld bc, TILE_WIDTH * 2 - 2
	add hl, bc
	ld a, TILE_WIDTH / 2
.loop
	ld c, [hl]
	ld [hl], e
	dec hl
	ld b, [hl]
	ld [hl], d
	dec hl
	ld e, [hl]
	ld [hl], c
	dec hl
	ld d, [hl]
	ld [hl], b
	dec hl
	dec a
	jr nz, .loop
	ret

ScrollTileDown:
	ld h, d
	ld l, e
	ld de, TILE_WIDTH * 2 - 2
	push hl
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	pop hl
	ld a, TILE_WIDTH / 2
.loop
	ld b, [hl]
	ld [hl], d
	inc hl
	ld c, [hl]
	ld [hl], e
	inc hl
	ld d, [hl]
	ld [hl], b
	inc hl
	ld e, [hl]
	ld [hl], c
	inc hl
	dec a
	jr nz, .loop
	ret

AnimateFountain:
	ld hl, sp+0
	ld b, h
	ld c, l
	ld hl, .frames
	ld a, [wTileAnimationTimer]
	and %111
	add a
	add l
	ld l, a
	jr nc, .okay
	inc h
.okay
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.frames
	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame1

.frame1 INCBIN "gfx/tilesets/fountain/1.2bpp"
.frame2 INCBIN "gfx/tilesets/fountain/2.2bpp"
.frame3 INCBIN "gfx/tilesets/fountain/3.2bpp"
.frame4 INCBIN "gfx/tilesets/fountain/4.2bpp"
.frame5 INCBIN "gfx/tilesets/fountain/5.2bpp"

AnimateWaterTile:
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and %110

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add LOW(WaterTileFrames)
	ld l, a
	ld a, 0
	adc HIGH(WaterTileFrames)
	ld h, a

; The stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile

WaterTileFrames:
	INCBIN "gfx/tilesets/water/water.2bpp"

ForestTreeLeftAnimation:
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .asm_fc46c
	ld hl, ForestTreeLeftFrames
	jr .asm_fc47d

.asm_fc46c
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a

.asm_fc47d
	ld sp, hl
	ld hl, vTiles2 tile $0c
	jp WriteTile

ForestTreeLeftFrames:
	INCBIN "gfx/tilesets/forest-tree/1.2bpp"
	INCBIN "gfx/tilesets/forest-tree/2.2bpp"

ForestTreeRightFrames:
	INCBIN "gfx/tilesets/forest-tree/3.2bpp"
	INCBIN "gfx/tilesets/forest-tree/4.2bpp"

ForestTreeRightAnimation:
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .asm_fc4d4
	ld hl, ForestTreeRightFrames
	jr .asm_fc4eb

.asm_fc4d4
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.asm_fc4eb
	ld sp, hl
	ld hl, vTiles2 tile $0f
	jp WriteTile

ForestTreeLeftAnimation2:
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .asm_fc502
	ld hl, ForestTreeLeftFrames
	jr .asm_fc515

.asm_fc502
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	xor 2
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a

.asm_fc515
	ld sp, hl
	ld hl, vTiles2 tile $0c
	jp WriteTile

ForestTreeRightAnimation2:
	ld hl, sp+0
	ld b, h
	ld c, l

; Only during the Celebi event.
	ld a, [wCelebiEvent]
	bit CELEBIEVENT_FOREST_IS_RESTLESS_F, a
	jr nz, .asm_fc52c
	ld hl, ForestTreeRightFrames
	jr .asm_fc545

.asm_fc52c
	ld a, [wTileAnimationTimer]
	call GetForestTreeFrame
	xor 2
	add a
	add a
	add a
	add LOW(ForestTreeLeftFrames)
	ld l, a
	ld a, 0
	adc HIGH(ForestTreeLeftFrames)
	ld h, a
	push bc
	ld bc, ForestTreeRightFrames - ForestTreeLeftFrames
	add hl, bc
	pop bc

.asm_fc545
	ld sp, hl
	ld hl, vTiles2 tile $0f
	jp WriteTile

GetForestTreeFrame:
; Return 0 if a is even, or 2 if odd.
	and a
	jr z, .even
	cp 1
	jr z, .odd
	cp 2
	jr z, .even
	cp 3
	jr z, .odd
	cp 4
	jr z, .even
	cp 5
	jr z, .odd
	cp 6
	jr z, .even
.odd
	ld a, 2
	scf
	ret
.even
	xor a
	ret

AnimateFlowerTile:
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

; Alternate tile graphic every other frame
	ld a, [wTileAnimationTimer]
	and %10

; CGB has different color mappings for flowers.
	ld e, a
	ldh a, [hCGB]
	and 1
	add e

	swap a
	ld e, a
	ld d, 0
	ld hl, FlowerTileFrames
	add hl, de
	ld sp, hl

	ld hl, vTiles2 tile $03

	jp WriteTile

FlowerTileFrames:
	INCBIN "gfx/tilesets/flower/dmg_1.2bpp"
	INCBIN "gfx/tilesets/flower/cgb_1.2bpp"
	INCBIN "gfx/tilesets/flower/dmg_2.2bpp"
	INCBIN "gfx/tilesets/flower/cgb_2.2bpp"

LavaBubbleAnim1:
; Splash in the bottom-right corner of the fountain.
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	and %110
	srl a
	inc a
	inc a
	and %011
	swap a
	ld e, a
	ld d, 0
	ld hl, LavaBubbleFrames
	add hl, de
	ld sp, hl
	ld hl, vTiles2 tile $5b
	jp WriteTile

LavaBubbleAnim2:
; Splash in the top-left corner of the fountain.
	ld hl, sp+0
	ld b, h
	ld c, l
	ld a, [wTileAnimationTimer]
	and %110
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, LavaBubbleFrames
	add hl, de
	ld sp, hl
	ld hl, vTiles2 tile $38
	jp WriteTile

LavaBubbleFrames:
	INCBIN "gfx/tilesets/lava/1.2bpp"
	INCBIN "gfx/tilesets/lava/2.2bpp"
	INCBIN "gfx/tilesets/lava/3.2bpp"
	INCBIN "gfx/tilesets/lava/4.2bpp"

AnimateTowerPillarTile:
; Read from struct at de:
; 	Destination (VRAM)
;	Address of the first tile in the frame array

	ld hl, sp+0
	ld b, h
	ld c, l

	ld a, [wTileAnimationTimer]
	and %111

; Get frame index a
	ld hl, .frames
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]

; Destination
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Add the frame index to the starting address
	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

	ld sp, hl
	ld l, e
	ld h, d
	jr WriteTile

.frames
	db $00, $10, $20, $30, $40, $30, $20, $10

StandingTileFrame:
	ld hl, wTileAnimationTimer
	inc [hl]
	ret

AnimateWhirlpoolTile:
; Update whirlpool tile using struct at de.

; Struct:
; 	VRAM address
;	Address of the first tile

; Only does one of 4 tiles at a time.

; Save sp in bc (see WriteTile).
	ld hl, sp+0
	ld b, h
	ld c, l

; de = VRAM address
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
; Tile address is now at hl.

; Get the tile for this frame.
	ld a, [wTileAnimationTimer]
	and %11 ; 4 frames x2
	swap a  ; * 16 bytes per tile

	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	ld a, 0
	adc h
	ld h, a

; The stack now points to the desired frame.
	ld sp, hl

	ld l, e
	ld h, d

	jr WriteTile

WriteTileFromBuffer:
; Write tiledata at wTileAnimBuffer to de.
; wTileAnimBuffer is loaded to sp for WriteTile.

	ld hl, sp+0
	ld b, h
	ld c, l

	ld hl, wTileAnimBuffer
	ld sp, hl

	ld h, d
	ld l, e
	jr WriteTile

WriteTileToBuffer:
; Write tiledata de to wTileAnimBuffer.
; de is loaded to sp for WriteTile.

	ld hl, sp+0
	ld b, h
	ld c, l

	ld h, d
	ld l, e
	ld sp, hl

	ld hl, wTileAnimBuffer

	; fallthrough

WriteTile:
; Write one 8x8 tile ($10 bytes) from sp to hl.

; Warning: sp is saved in bc so we can abuse pop.
; sp is restored to address bc. Save sp in bc before calling.

	pop de
	ld [hl], e
	inc hl
	ld [hl], d

rept 7
	pop de
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
endr

; restore sp
	ld h, b
	ld l, c
	ld sp, hl
	ret

AnimateWaterPalette:
; Transition between color values 0-2 for color 0 in palette 3.

; No palette changes on DMG.
	ldh a, [hCGB]
	and a
	ret z

; We don't want to mess with non-standard palettes.
	ldh a, [rBGP] ; BGP
	cp %11100100
	ret nz

; Only update on even frames.
	ld a, [wTileAnimationTimer]
	ld l, a
	and 1 ; odd
	ret nz

; Ready for BGPD input...

	ld a, (1 << rBGPI_AUTO_INCREMENT) palette PAL_BG_WATER
	ldh [rBGPI], a

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

; Update color 0 in order 0 1 2 1
	ld a, l
	and %110 ; frames 0 2 4 6
	jr z, .color0
	cp %100 ; frame 4
	jr z, .color2

.color1
	ld hl, wBGPals1 palette PAL_BG_WATER color 1
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color0
	ld hl, wBGPals1 palette PAL_BG_WATER color 0
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a
	jr .end

.color2
	ld hl, wBGPals1 palette PAL_BG_WATER color 2
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

.end
	pop af
	ldh [rSVBK], a
	ret

FlickeringCaveEntrancePalette:
; No palette changes on DMG.
	ldh a, [hCGB]
	and a
	ret z
; We don't want to mess with non-standard palettes.
	ldh a, [rBGP]
	cp %11100100
	ret nz
; We only want to be here if we're in a dark cave.
	ld a, [wTimeOfDayPalset]
	cp %11111111 ; 3,3,3,3
	ret nz

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
; Ready for BGPD input...
	ld a, (1 << rBGPI_AUTO_INCREMENT) palette PAL_BG_YELLOW
	ldh [rBGPI], a
	ldh a, [hVBlankCounter]
	and %10
	jr nz, .bit1set
	ld hl, wBGPals1 palette PAL_BG_YELLOW
	jr .okay

.bit1set
	ld hl, wBGPals1 palette PAL_BG_YELLOW color 1

.okay
	ld a, [hli]
	ldh [rBGPD], a
	ld a, [hli]
	ldh [rBGPD], a

	pop af
	ldh [rSVBK], a
	ret

TowerPillarTilePointer1:  dw vTiles2 tile $2d, TowerPillarTile1
TowerPillarTilePointer2:  dw vTiles2 tile $2f, TowerPillarTile2
TowerPillarTilePointer3:  dw vTiles2 tile $3d, TowerPillarTile3
TowerPillarTilePointer4:  dw vTiles2 tile $3f, TowerPillarTile4
TowerPillarTilePointer5:  dw vTiles2 tile $3c, TowerPillarTile5
TowerPillarTilePointer6:  dw vTiles2 tile $2c, TowerPillarTile6
TowerPillarTilePointer7:  dw vTiles2 tile $4d, TowerPillarTile7
TowerPillarTilePointer8:  dw vTiles2 tile $4f, TowerPillarTile8
TowerPillarTilePointer9:  dw vTiles2 tile $5d, TowerPillarTile9
TowerPillarTilePointer10: dw vTiles2 tile $5f, TowerPillarTile10

TowerPillarTile1:  INCBIN "gfx/tilesets/tower-pillar/1.2bpp"
TowerPillarTile2:  INCBIN "gfx/tilesets/tower-pillar/2.2bpp"
TowerPillarTile3:  INCBIN "gfx/tilesets/tower-pillar/3.2bpp"
TowerPillarTile4:  INCBIN "gfx/tilesets/tower-pillar/4.2bpp"
TowerPillarTile5:  INCBIN "gfx/tilesets/tower-pillar/5.2bpp"
TowerPillarTile6:  INCBIN "gfx/tilesets/tower-pillar/6.2bpp"
TowerPillarTile7:  INCBIN "gfx/tilesets/tower-pillar/7.2bpp"
TowerPillarTile8:  INCBIN "gfx/tilesets/tower-pillar/8.2bpp"
TowerPillarTile9:  INCBIN "gfx/tilesets/tower-pillar/9.2bpp"
TowerPillarTile10: INCBIN "gfx/tilesets/tower-pillar/10.2bpp"

WhirlpoolFrames1: dw vTiles2 tile $32, WhirlpoolTiles1
WhirlpoolFrames2: dw vTiles2 tile $33, WhirlpoolTiles2
WhirlpoolFrames3: dw vTiles2 tile $42, WhirlpoolTiles3
WhirlpoolFrames4: dw vTiles2 tile $43, WhirlpoolTiles4

WhirlpoolTiles1: INCBIN "gfx/tilesets/whirlpool/1.2bpp"
WhirlpoolTiles2: INCBIN "gfx/tilesets/whirlpool/2.2bpp"
WhirlpoolTiles3: INCBIN "gfx/tilesets/whirlpool/3.2bpp"
WhirlpoolTiles4: INCBIN "gfx/tilesets/whirlpool/4.2bpp"
