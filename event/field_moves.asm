PlayWhirlpoolSound: ; 8c7d4
	call WaitSFX
	ld de, SFX_SURF
	call PlaySFX
	call WaitSFX
	ret
; 8c7e1

BlindingFlash: ; 8c7e1
	callba FadeOutPalettes
	ld hl, StatusFlags
	set 2, [hl] ; Flash
	callba ReplaceTimeOfDayPals
	callba UpdateTimeOfDayPal
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	callba LoadOW_BGPal7
	callba FadeInPalettes
	ret
; 8c80a

ShakeHeadbuttTree: ; 8c80a
	callba ClearSpriteAnims
	ld de, CutGrassGFX
	ld hl, VTiles1
	lb bc, BANK(CutGrassGFX), 4
	call Request2bpp
	ld de, HeadbuttTreeGFX
	ld hl, VTiles1 tile $04
	lb bc, BANK(HeadbuttTreeGFX), 8
	call Request2bpp
	call Cut_Headbutt_GetPixelFacing
	ld a, SPRITE_ANIM_INDEX_1B
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $84
	ld a, 36 * 4
	ld [wCurrSpriteOAMAddr], a
	callba DoNextFrameForAllSprites
	call HideHeadbuttTree
	ld a, $20
	ld [wcf64], a
	call WaitSFX
	ld de, SFX_SANDSTORM
	call PlaySFX
.loop
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld a, 36 * 4
	ld [wCurrSpriteOAMAddr], a
	callba DoNextFrameForAllSprites
	call DelayFrame
	jr .loop

.done
	call OverworldTextModeSwitch
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	callba ClearSpriteAnims
	ld hl, Sprites + 36 * 4
	ld bc, SpritesEnd - (Sprites + 36 * 4)
	xor a
	call ByteFill
	ld de, Font
	ld hl, VTiles1
	lb bc, BANK(Font), 12
	call Get1bpp
	call ReplaceKrisSprite
	ret
; 8c893

HeadbuttTreeGFX: ; 8c893
INCBIN "gfx/unknown/08c893.2bpp"
; 8c913

HideHeadbuttTree: ; 8c913
	xor a
	ld [hBGMapMode], a
	ld a, [PlayerDirection]
	and %00001100
	srl a
	ld e, a
	ld d, 0
	ld hl, TreeRelativeLocationTable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, $5
	ld [hli], a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	ld [hld], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret
; 8c938

TreeRelativeLocationTable: ; 8c938
	dwcoord 8,     8 + 2 ; RIGHT
	dwcoord 8,     8 - 2 ; LEFT
	dwcoord 8 - 2, 8     ; DOWN
	dwcoord 8 + 2, 8     ; UP
; 8c940

OWCutAnimation: ; 8c940
	; Animation index in e
	; 0: Split tree in half
	; 1: Mow the lawn
	ld a, e
	and $1
	ld [wJumptableIndex], a
	call .LoadCutGFX
	call WaitSFX
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish
	ld a, 36 * 4
	ld [wCurrSpriteOAMAddr], a
	callab DoNextFrameForAllSprites
	call OWCutJumptable
	call DelayFrame
	jr .loop

.finish
	ret
; 8c96d

.LoadCutGFX: ; 8c96d
	callab ClearSpriteAnims ; pointless to farcall
	ld de, CutGrassGFX
	ld hl, VTiles1
	lb bc, BANK(CutGrassGFX), 4
	call Request2bpp
	ld de, CutTreeGFX
	ld hl, VTiles1 tile $4
	lb bc, BANK(CutTreeGFX), 4
	call Request2bpp
	ret
; 8c98c

CutTreeGFX: ; c898c
INCBIN "gfx/misc/cut_tree.2bpp"
; c89cc

CutGrassGFX: ; 8c9cc
INCBIN "gfx/misc/cut_grass.2bpp"
; 8ca0c

OWCutJumptable: ; 8ca0c
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8ca1b


.dw ; 8ca1b (23:4a1b)
	dw Cut_SpawnAnimateTree
	dw Cut_SpawnAnimateLeaves
	dw Cut_StartWaiting
	dw Cut_WaitAnimSFX


Cut_SpawnAnimateTree: ; 8ca23 (23:4a23)
	call Cut_Headbutt_GetPixelFacing
	ld a, SPRITE_ANIM_INDEX_CUT_TREE ; cut tree
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $84
	ld a, 32
	ld [wcf64], a
; Cut_StartWaiting
	ld hl, wJumptableIndex
	inc [hl]
	inc [hl]
	ret

Cut_SpawnAnimateLeaves: ; 8ca3c (23:4a3c)
	call Cut_GetLeafSpawnCoords
	xor a
	call Cut_SpawnLeaf
	ld a, $10
	call Cut_SpawnLeaf
	ld a, $20
	call Cut_SpawnLeaf
	ld a, $30
	call Cut_SpawnLeaf
	ld a, 32 ; frames
	ld [wcf64], a
; Cut_StartWaiting
	ld hl, wJumptableIndex
	inc [hl]
	ret

Cut_StartWaiting: ; 8ca5c (23:4a5c)
	ld a, $1
	ld [hBGMapMode], a
; Cut_WaitAnimSFX
	ld hl, wJumptableIndex
	inc [hl]

Cut_WaitAnimSFX: ; 8ca64 (23:4a64)
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .finished
	dec [hl]
	ret

.finished
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Cut_SpawnLeaf: ; 8ca73 (23:4a73)
	push de
	push af
	ld a, SPRITE_ANIM_INDEX_LEAF ; leaf
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $80
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld [hl], $4
	pop af
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a
	pop de
	ret

Cut_GetLeafSpawnCoords: ; 8ca8e (23:4a8e)
	ld de, 0
	ld a, [wMetatileStandingX]
	bit 0, a
	jr z, .left_side
	set 0, e
.left_side
	ld a, [wMetatileStandingY]
	bit 0, a
	jr z, .top_side
	set 1, e
.top_side
	ld a, [PlayerDirection]
	and %00001100
	add e
	ld e, a
	ld hl, .Coords
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret
; 8cab3 (23:4ab3)

.Coords: ; 8cab3
	dbpixel 11, 12 ; facing down,  top left
	dbpixel  9, 12 ; facing down,  top right
	dbpixel 11, 14 ; facing down,  bottom left
	dbpixel  9, 14 ; facing down,  bottom right

	dbpixel 11,  8 ; facing up,    top left
	dbpixel  9,  8 ; facing up,    top right
	dbpixel 11, 10 ; facing up,    bottom left
	dbpixel  9, 10 ; facing up,    bottom right

	dbpixel  7, 12 ; facing left,  top left
	dbpixel  9, 12 ; facing left,  top right
	dbpixel  7, 10 ; facing left,  bottom left
	dbpixel  9, 10 ; facing left,  bottom right

	dbpixel 11, 12 ; facing right, top left
	dbpixel 13, 12 ; facing right, top right
	dbpixel 11, 10 ; facing right, bottom left
	dbpixel 13, 10 ; facing right, bottom right
; 8cad3

Cut_Headbutt_GetPixelFacing: ; 8cad3 (23:4ad3)
	ld a, [PlayerDirection]
	and %00001100
	srl a
	ld e, a
	ld d, 0
	ld hl, .Coords
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret
; 8cae5 (23:4ae5)

.Coords: ; 8cae5
	dbpixel 10, 13
	dbpixel 10,  9
	dbpixel  8, 11
	dbpixel 12, 11
; 8caed


FlyFromAnim: ; 8caed
	call DelayFrame
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	call FlyFunction_InitGFX
	depixel 10, 10, 4, 0
	ld a, SPRITE_ANIM_INDEX_RED_WALK
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $84
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_FLY_FROM
	ld a, 128
	ld [wcf64], a
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .exit
	ld a, 0 * 4
	ld [wCurrSpriteOAMAddr], a
	callab DoNextFrameForAllSprites
	call FlyFunction_FrameTimer
	call DelayFrame
	jr .loop

.exit
	pop af
	ld [VramState], a
	ret
; 8cb33

FlyToAnim: ; 8cb33
	call DelayFrame
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	call FlyFunction_InitGFX
	depixel 31, 10, 4, 0
	ld a, SPRITE_ANIM_INDEX_RED_WALK
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $84
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_FLY_TO
	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld [hl], 11 * 8
	ld a, 64
	ld [wcf64], a
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .exit
	ld a, 0 * 4
	ld [wCurrSpriteOAMAddr], a
	callab DoNextFrameForAllSprites
	call FlyFunction_FrameTimer
	call DelayFrame
	jr .loop

.exit
	pop af
	ld [VramState], a
	call .RestorePlayerSprite_DespawnLeaves
	ret

.RestorePlayerSprite_DespawnLeaves: ; 8cb82 (23:4b82)
	ld hl, Sprites + 2 ; Tile ID
	xor a
	ld c, $4
.loop2
	ld [hli], a
	inc hl
	inc hl
	inc hl
	inc a
	dec c
	jr nz, .loop2
	ld hl, Sprites + 4 * 4
	ld bc, SpritesEnd - (Sprites + 4 * 4)
	xor a
	call ByteFill
	ret

FlyFunction_InitGFX: ; 8cb9b (23:4b9b)
	callab ClearSpriteAnims
	ld de, CutGrassGFX
	ld hl, VTiles1 tile $00
	lb bc, BANK(CutGrassGFX), 4
	call Request2bpp
	ld a, [CurPartyMon]
	ld hl, PartySpecies
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wd265], a
	ld e, $84
	callba FlyFunction_GetMonIcon
	xor a
	ld [wJumptableIndex], a
	ret

FlyFunction_FrameTimer: ; 8cbc8 (23:4bc8)
	call .SpawnLeaf
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .exit
	dec [hl]
	cp $40
	ret c
	and $7
	ret nz
	ld de, SFX_FLY
	call PlaySFX
	ret

.exit
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.SpawnLeaf: ; 8cbe6 (23:4be6)
	ld hl, wcf65
	ld a, [hl]
	inc [hl]
	and $7
	ret nz
	ld a, [hl]
	and (6 * 8) >> 1
	sla a
	add 8 * 8 ; gives a number in [$40, $50, $60, $70]
	ld d, a
	ld e, $0
	ld a, SPRITE_ANIM_INDEX_FLY_LEAF ; fly land
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $80
	ret
