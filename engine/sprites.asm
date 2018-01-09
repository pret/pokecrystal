ClearSpriteAnims: ; 8cf53
	ld hl, wSpriteAnimDict
	ld bc, wSpriteAnimsEnd - wSpriteAnimDict
.loop
	ld [hl], $0
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret
; 8cf62

PlaySpriteAnimationsAndDelayFrame: ; 8cf62
	call PlaySpriteAnimations
	call DelayFrame
	ret
; 8cf69

PlaySpriteAnimations: ; 8cf69
	push hl
	push de
	push bc
	push af

	ld a, LOW(Sprites)
	ld [wCurrSpriteOAMAddr], a
	call DoNextFrameForAllSprites

	pop af
	pop bc
	pop de
	pop hl
	ret
; 8cf7a

DoNextFrameForAllSprites: ; 8cf7a
	ld hl, wSpriteAnimationStructs
	ld e, NUM_SPRITE_ANIM_STRUCTS

.loop
	ld a, [hl]
	and a
	jr z, .next ; This struct is deinitialized.
	ld c, l
	ld b, h
	push hl
	push de
	call DoAnimFrame ; Uses a massive dw
	call UpdateAnimFrame
	pop de
	pop hl
	jr c, .done

.next
	ld bc, SPRITEANIMSTRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop

	ld a, [wCurrSpriteOAMAddr]
	ld l, a
	ld h, HIGH(Sprites)

.loop2 ; Clear (Sprites + [wCurrSpriteOAMAddr] --> SpritesEnd)
	ld a, l
	cp LOW(SpritesEnd)
	jr nc, .done
	xor a
	ld [hli], a
	jr .loop2

.done
	ret
; 8cfa8

DoNextFrameForFirst16Sprites: ; 8cfa8 (23:4fa8)
	ld hl, wSpriteAnimationStructs
	ld e, NUM_SPRITE_ANIM_STRUCTS

.loop
	ld a, [hl]
	and a
	jr z, .next
	ld c, l
	ld b, h
	push hl
	push de
	call DoAnimFrame ; Uses a massive dw
	call UpdateAnimFrame
	pop de
	pop hl
	jr c, .done

.next
	ld bc, SPRITEANIMSTRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop

	ld a, [wCurrSpriteOAMAddr]
	ld l, a
	ld h, HIGH(Sprites + 16 * 4)

.loop2 ; Clear (Sprites + [wCurrSpriteOAMAddr] --> Sprites + $40)
	ld a, l
	cp LOW(Sprites + 16 * 4)
	jr nc, .done
	xor a
	ld [hli], a
	jr .loop2

.done
	ret

InitSpriteAnimStruct:: ; 8cfd6
; Initialize animation a at pixel x=e, y=d
; Find if there's any room in the wSpriteAnimationStructs array, which is 10x16
	push de
	push af
	ld hl, wSpriteAnimationStructs
	ld e, NUM_SPRITE_ANIM_STRUCTS
.loop
	ld a, [hl]
	and a
	jr z, .found
	ld bc, SPRITEANIMSTRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop
; We've reached the end.  There is no more room here.
; Return carry.
	pop af
	pop de
	scf
	ret

.found
; Back up the structure address to bc.
	ld c, l
	ld b, h
; Value [wSpriteAnimCount] is initially set to -1. Set it to
; the number of objects loaded into this array.
	ld hl, wSpriteAnimCount
	inc [hl]
	ld a, [hl]
	and a
	jr nz, .initialized
	inc [hl]

.initialized
; Get row a of SpriteAnimSeqData, copy the pointer into de
	pop af
	ld e, a
	ld d, 0
	ld hl, SpriteAnimSeqData
	add hl, de
	add hl, de
	add hl, de
	ld e, l
	ld d, h
; Set hl to the first field (field 0) in the current structure.
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
; Load the index.
	ld a, [wSpriteAnimCount]
	ld [hli], a
; Copy the table entry to the next two fields.
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
; Look up the third field from the table in the wSpriteAnimDict array (10x2).
; Take the value and load it in
	ld a, [de]
	call GetSpriteAnimVTile
	ld [hli], a
	pop de
; Set hl to field 4 (X coordinate).  Kinda pointless, because we're presumably already here.
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
; Load the original value of de into here.
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
; load 0 into the next four fields
	xor a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
; load -1 into the next field
	dec a
	ld [hli], a
; load 0 into the last five fields
	xor a
rept 4
	ld [hli], a
endr
	ld [hl], a
; back up the address of the first field to wSpriteAnimAddrBackup
	ld a, c
	ld [wSpriteAnimAddrBackup], a
	ld a, b
	ld [wSpriteAnimAddrBackup + 1], a
	ret
; 8d036

DeinitializeSprite: ; 8d036
; Clear the index field of the struct in bc.
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret
; 8d03d


DeinitializeAllSprites: ; 8d03d (23:503d)
; Clear the index field of every struct in the wSpriteAnimationStructs array.
	ld hl, wSpriteAnimationStructs
	ld bc, SPRITEANIMSTRUCT_LENGTH
	ld e, NUM_SPRITE_ANIM_STRUCTS
	xor a
.loop
	ld [hl], a
	add hl, bc
	dec e
	jr nz, .loop
	ret


UpdateAnimFrame: ; 8d04c
	call InitSpriteAnimBuffer ; init WRAM
	call GetSpriteAnimFrame ; read from a memory array
	cp -3
	jr z, .done
	cp -4
	jr z, .delete
	call GetFrameOAMPointer
	; add byte to [wCurrAnimVTile]
	ld a, [wCurrAnimVTile]
	add [hl]
	ld [wCurrAnimVTile], a
	inc hl
	; load pointer into hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	ld a, [wCurrSpriteOAMAddr]
	ld e, a
	ld d, HIGH(Sprites)
	ld a, [hli]
	ld c, a ; number of objects
.loop
	; first byte: y (px)
	; [de] = [wCurrAnimYCoord] + [wCurrAnimYOffset] + [wGlobalAnimYOffset] + AddOrSubtractY([hl])
	ld a, [wCurrAnimYCoord]
	ld b, a
	ld a, [wCurrAnimYOffset]
	add b
	ld b, a
	ld a, [wGlobalAnimYOffset]
	add b
	ld b, a
	call AddOrSubtractY
	add b
	ld [de], a
	inc hl
	inc de
	; second byte: x (px)
	; [de] = [wCurrAnimXCoord] + [wCurrAnimXOffset] + [wGlobalAnimXOffset] + AddOrSubtractX([hl])
	ld a, [wCurrAnimXCoord]
	ld b, a
	ld a, [wCurrAnimXOffset]
	add b
	ld b, a
	ld a, [wGlobalAnimXOffset]
	add b
	ld b, a
	call AddOrSubtractX
	add b
	ld [de], a
	inc hl
	inc de
	; third byte: vtile
	; [de] = [wCurrAnimVTile] + [hl]
	ld a, [wCurrAnimVTile]
	add [hl]
	ld [de], a
	inc hl
	inc de
	; fourth byte: attributes
	; [de] = GetSpriteOAMAttr([hl])
	call GetSpriteOAMAttr
	ld [de], a
	inc hl
	inc de
	ld a, e
	ld [wCurrSpriteOAMAddr], a
	cp LOW(SpritesEnd)
	jr nc, .reached_the_end
	dec c
	jr nz, .loop
	pop bc
	jr .done

.delete
	call DeinitializeSprite
.done
	and a
	ret

.reached_the_end
	pop bc
	scf
	ret
; 8d0be

AddOrSubtractY: ; 8d0be
	push hl
	ld a, [hl]
	ld hl, wCurrSpriteAddSubFlags
	bit 6, [hl]
	jr z, .ok
	; 8 - a
	add $8
	xor $ff
	inc a

.ok
	pop hl
	ret
; 8d0ce

AddOrSubtractX: ; 8d0ce
	push hl
	ld a, [hl]
	ld hl, wCurrSpriteAddSubFlags
	bit 5, [hl] ; x flip
	jr z, .ok
	; 8 - a
	add $8
	xor $ff
	inc a

.ok
	pop hl
	ret
; 8d0de

GetSpriteOAMAttr: ; 8d0de
	ld a, [wCurrSpriteAddSubFlags]
	ld b, a
	ld a, [hl]
	xor b
	and $e0
	ld b, a
	ld a, [hl]
	and $1f
	or b
	ret
; 8d0ec

InitSpriteAnimBuffer: ; 8d0ec
	xor a
	ld [wCurrSpriteAddSubFlags], a
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld a, [hli]
	ld [wCurrAnimVTile], a
	ld a, [hli]
	ld [wCurrAnimXCoord], a
	ld a, [hli]
	ld [wCurrAnimYCoord], a
	ld a, [hli]
	ld [wCurrAnimXOffset], a
	ld a, [hli]
	ld [wCurrAnimYOffset], a
	ret
; 8d109

GetSpriteAnimVTile: ; 8d109
; a = wSpriteAnimDict[a] if a in wSpriteAnimDict else 0
; vTiles offset
	push hl
	push bc
	ld hl, wSpriteAnimDict
	ld b, a
	ld c, NUM_SPRITE_ANIM_STRUCTS
.loop
	ld a, [hli]
	cp b
	jr z, .ok
	inc hl
	dec c
	jr nz, .loop
	xor a
	jr .done

.ok
	ld a, [hl]

.done
	pop bc
	pop hl
	ret
; 8d120

_ReinitSpriteAnimFrame:: ; 8d120
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], 0
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], -1
	ret
; 8d132


GetSpriteAnimFrame: ; 8d132
.loop
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next_frame ; finished the current sequence
	dec [hl]
	call .GetPointer ; load pointer from SpriteAnimFrameData
	ld a, [hli]
	push af
	jr .okay

.next_frame
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	inc [hl]
	call .GetPointer ; load pointer from SpriteAnimFrameData
	ld a, [hli]
	cp dorestart_command
	jr z, .restart
	cp endanim_command
	jr z, .repeat_last

	push af
	ld a, [hl]
	push hl
	and $3f
	ld hl, SPRITEANIMSTRUCT_DURATIONOFFSET
	add hl, bc
	add [hl]
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a
	pop hl
.okay
	ld a, [hl]
	and $c0
	srl a
	ld [wCurrSpriteAddSubFlags], a
	pop af
	ret

.repeat_last
	xor a
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	dec [hl]
	dec [hl]
	jr .loop

.restart
	xor a
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a

	dec a
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], a
	jr .loop
; 8d189

.GetPointer: ; 8d189
	; Get the data for the current frame for the current animation sequence

	; SpriteAnimFrameData[SpriteAnim[SPRITEANIMSTRUCT_FRAMESET_ID]][SpriteAnim[SPRITEANIMSTRUCT_FRAME]]
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, SpriteAnimFrameData
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, hl
	add hl, de
	ret
; 8d1a2

GetFrameOAMPointer: ; 8d1a2
; Load OAM data pointer
	ld e, a
	ld d, 0
	ld hl, SpriteAnimOAMData
	add hl, de
	add hl, de
	add hl, de
	ret
; 8d1ac

BrokenGetStdGraphics: ; 8d1ac
; dummied out
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, BrokenStdGFXPointers ; broken 2bpp pointers
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	push bc
	call Request2bpp
	pop bc
	ret
; 8d1c4


INCLUDE "data/sprite_anims/sequences.asm"

INCLUDE "engine/sprite_anims.asm"

INCLUDE "data/sprite_anims/framesets.asm"

INCLUDE "data/sprite_anims/oam.asm"


BrokenStdGFXPointers: ; Broken 2bpp pointers
	dbbw $80, $01, .deleted ; 128-tile 2bpp at 1:672a (inside Multiply)
	dbbw $80, $01, .deleted
	dbbw $80, $01, .deleted
	dbbw $80, $01, .deleted
	dbbw $10, $37, .deleted ; 16-tile 2bpp at 37:672a (within TilesetTrainStationGFX)
	dbbw $10, $11, .deleted ; 16-tile 2bpp at 11:672a (empty data)
	dbbw $10, $39, .deleted ; 16-tile 2bpp at 39:672a (empty data)
	dbbw $10, $24, .deleted ; 16-tile 2bpp at 24:672a (inside Function926f7)
	dbbw $10, $21, .deleted ; 16-tile 2bpp at 21:672a (inside Function8671c)

.deleted
; 8e72a (23:672a)


Sprites_Cosine: ; 8e72a
; a = d * cos(a * pi/32)
	add %010000
Sprites_Sine: ; 8e72c
; a = d * sin(a * pi/32)
	and %111111
	cp %100000
	jr nc, .negative
	call .ApplySineWave
	ld a, h
	ret

.negative
	and %011111
	call .ApplySineWave
	ld a, h
	xor $ff
	inc a
	ret
; 8e741

.ApplySineWave: ; 8e741
	ld e, a
	ld a, d
	ld d, 0
	ld hl, .sinewave
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0
.multiply
	srl a
	jr nc, .even
	add hl, de
.even
	sla e
	rl d
	and a
	jr nz, .multiply
	ret
; 8e75d

.sinewave ; 8e75d
	sine_wave $100


AnimateEndOfExpBar: ; 8e79d
	ld a, [hSGB]
	ld de, EndOfExpBarGFX
	and a
	jr z, .load
	ld de, SGBEndOfExpBarGFX

.load
	ld hl, vTiles0 tile $00
	lb bc, BANK(EndOfExpBarGFX), 1
	call Request2bpp
	ld c, 8
	ld d, 0
.loop
	push bc
	call .AnimateFrame
	call DelayFrame
	pop bc
	inc d
	inc d
	dec c
	jr nz, .loop
	call ClearSprites
	ret
; 8e7c6

.AnimateFrame: ; 8e7c6
	ld hl, Sprites
	ld c, $8
.anim_loop
	ld a, c
	and a
	ret z
	dec c
	ld a, c
; multiply by 8
	sla a
	sla a
	sla a
	push af

	push de
	push hl
	call Sprites_Sine
	pop hl
	pop de
	add 13 * 8
	ld [hli], a

	pop af
	push de
	push hl
	call Sprites_Cosine
	pop hl
	pop de
	add 10 * 8 + 4
	ld [hli], a

	ld a, $0
	ld [hli], a
	ld a, PAL_BATTLE_OB_BLUE
	ld [hli], a
	jr .anim_loop
; 8e7f4

EndOfExpBarGFX: ; 8e7f4
INCBIN "gfx/battle/expbarend.2bpp"
SGBEndOfExpBarGFX: ; 8e804
INCBIN "gfx/battle/expbarend_sgb.2bpp"

ClearSpriteAnims2: ; 8e814
	push hl
	push de
	push bc
	push af
	ld hl, wSpriteAnimDict
	ld bc, wSpriteAnimsEnd - wSpriteAnimDict
.loop
	ld [hl], 0
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop
	pop af
	pop bc
	pop de
	pop hl
	ret
; 8e82b
