ClearSpriteAnims:
	ld hl, wSpriteAnimData
	ld bc, wSpriteAnimDataEnd - wSpriteAnimData
.loop
	ld [hl], 0
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

PlaySpriteAnimationsAndDelayFrame:
	call PlaySpriteAnimations
	call DelayFrame
	ret

PlaySpriteAnimations:
	push hl
	push de
	push bc
	push af

	ld a, LOW(wShadowOAM)
	ld [wCurSpriteOAMAddr], a
	call DoNextFrameForAllSprites

	pop af
	pop bc
	pop de
	pop hl
	ret

DoNextFrameForAllSprites:
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

	ld a, [wCurSpriteOAMAddr]
	ld l, a
	ld h, HIGH(wShadowOAM)

.loop2 ; Clear (wShadowOAM + [wCurSpriteOAMAddr] --> wShadowOAMEnd)
	ld a, l
	cp LOW(wShadowOAMEnd)
	jr nc, .done
	xor a
	ld [hli], a
	jr .loop2

.done
	ret

DoNextFrameForFirst16Sprites:
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

	ld a, [wCurSpriteOAMAddr]
	ld l, a
	ld h, HIGH(wShadowOAMSprite16)

.loop2 ; Clear (wShadowOAM + [wCurSpriteOAMAddr] --> Sprites + $40)
	ld a, l
	cp LOW(wShadowOAMSprite16)
	jr nc, .done
	xor a
	ld [hli], a
	jr .loop2

.done
	ret

_InitSpriteAnimStruct::
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

; Increment [wSpriteAnimCount], skipping a 0 value.
	ld hl, wSpriteAnimCount
	inc [hl]
	ld a, [hl]
	and a
	jr nz, .nonzero
	inc [hl]
.nonzero

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
	ld [hli], a ; SPRITEANIMSTRUCT_INDEX
; Copy the table entry to the next two fields.
	ld a, [de]
	ld [hli], a ; SPRITEANIMSTRUCT_FRAMESET_ID
	inc de
	ld a, [de]
	ld [hli], a ; SPRITEANIMSTRUCT_ANIM_SEQ_ID
	inc de
; Look up the third field in the wSpriteAnimDict mapping.
; Take the mapped value and load it in.
	ld a, [de]
	call GetSpriteAnimVTile
	ld [hli], a ; SPRITEANIMSTRUCT_TILE_ID
	pop de
; Set hl to field 4 (X coordinate).  Kinda pointless, because we're presumably already here.
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
; Load the original value of de into here.
	ld a, e
	ld [hli], a ; SPRITEANIMSTRUCT_XCOORD
	ld a, d
	ld [hli], a ; SPRITEANIMSTRUCT_YCOORD
; load 0 into the next four fields
	xor a
	ld [hli], a ; SPRITEANIMSTRUCT_XOFFSET
	ld [hli], a ; SPRITEANIMSTRUCT_YOFFSET
	xor a
	ld [hli], a ; SPRITEANIMSTRUCT_DURATION
	ld [hli], a ; SPRITEANIMSTRUCT_DURATIONOFFSET
; load -1 into the next field
	dec a
	ld [hli], a ; SPRITEANIMSTRUCT_FRAME
; load 0 into the last five fields
	xor a
	ld [hli], a ; SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	ld [hli], a ; SPRITEANIMSTRUCT_VAR1
	ld [hli], a ; SPRITEANIMSTRUCT_VAR2
	ld [hli], a ; SPRITEANIMSTRUCT_VAR3
	ld [hl], a  ; SPRITEANIMSTRUCT_VAR4
; back up the address of the first field to wSpriteAnimAddrBackup
	ld a, c
	ld [wSpriteAnimAddrBackup], a
	ld a, b
	ld [wSpriteAnimAddrBackup + 1], a
	ret

DeinitializeSprite:
; Clear the index field of the struct in bc.
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], 0
	ret

DeinitializeAllSprites:
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

UpdateAnimFrame:
	call InitSpriteAnimBuffer ; init WRAM
	call GetSpriteAnimFrame ; read from a memory array
	cp oamwait_command
	jr z, .done
	cp oamdelete_command
	jr z, .delete
	call GetFrameOAMPointer
	; add byte to [wCurAnimVTile]
	ld a, [wCurAnimVTile]
	add [hl]
	ld [wCurAnimVTile], a
	inc hl
	; load pointer into hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	ld a, [wCurSpriteOAMAddr]
	ld e, a
	ld d, HIGH(wShadowOAM)
	ld a, [hli]
	ld c, a ; number of objects
.loop
	; first byte: y (px)
	; [de] = [wCurAnimYCoord] + [wCurAnimYOffset] + [wGlobalAnimYOffset] + AddOrSubtractY([hl])
	ld a, [wCurAnimYCoord]
	ld b, a
	ld a, [wCurAnimYOffset]
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
	; [de] = [wCurAnimXCoord] + [wCurAnimXOffset] + [wGlobalAnimXOffset] + AddOrSubtractX([hl])
	ld a, [wCurAnimXCoord]
	ld b, a
	ld a, [wCurAnimXOffset]
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
	; [de] = [wCurAnimVTile] + [hl]
	ld a, [wCurAnimVTile]
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
	ld [wCurSpriteOAMAddr], a
	cp LOW(wShadowOAMEnd)
	jr nc, .reached_the_end
	dec c
	jr nz, .loop
	pop bc
	jr .done

.delete
; Removes the object from the screen, as opposed to `oamend` which just stops all motion
	call DeinitializeSprite
.done
	and a
	ret

.reached_the_end
	pop bc
	scf
	ret

AddOrSubtractY:
	push hl
	ld a, [hl]
	ld hl, wCurSpriteOAMFlags
	bit OAM_Y_FLIP, [hl]
	jr z, .ok
	; -8 - a
	add 8
	xor $ff
	inc a

.ok
	pop hl
	ret

AddOrSubtractX:
	push hl
	ld a, [hl]
	ld hl, wCurSpriteOAMFlags
	bit OAM_X_FLIP, [hl]
	jr z, .ok
	; -8 - a
	add 8
	xor $ff
	inc a

.ok
	pop hl
	ret

GetSpriteOAMAttr:
	ld a, [wCurSpriteOAMFlags]
	ld b, a
	ld a, [hl]
	xor b
	and PRIORITY | Y_FLIP | X_FLIP
	ld b, a
	ld a, [hl]
	and ~(PRIORITY | Y_FLIP | X_FLIP)
	or b
	ret

InitSpriteAnimBuffer:
	xor a
	ld [wCurSpriteOAMFlags], a
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld a, [hli]
	ld [wCurAnimVTile], a
	ld a, [hli]
	ld [wCurAnimXCoord], a
	ld a, [hli]
	ld [wCurAnimYCoord], a
	ld a, [hli]
	ld [wCurAnimXOffset], a
	ld a, [hli]
	ld [wCurAnimYOffset], a
	ret

GetSpriteAnimVTile:
; a = wSpriteAnimDict[a] if a in wSpriteAnimDict else vtile offset $00
	push hl
	push bc
	ld hl, wSpriteAnimDict
	ld b, a
	ld c, NUM_SPRITEANIMDICT_ENTRIES
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

_ReinitSpriteAnimFrame::
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

GetSpriteAnimFrame:
.loop
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next_frame
	dec [hl]
	call .GetPointer
	ld a, [hli]
	push af
	jr .okay

.next_frame
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	inc [hl]
	call .GetPointer
	ld a, [hli]
	cp oamrestart_command
	jr z, .restart
	cp oamend_command
	jr z, .repeat_last

	push af
	ld a, [hl]
	push hl
	and ~(Y_FLIP << 1 | X_FLIP << 1)
	ld hl, SPRITEANIMSTRUCT_DURATIONOFFSET
	add hl, bc
	add [hl]
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a
	pop hl
.okay
	ld a, [hl]
	and Y_FLIP << 1 | X_FLIP << 1 ; The << 1 is compensated in the "oamframe" macro
	srl a
	ld [wCurSpriteOAMFlags], a
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

.GetPointer:
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

GetFrameOAMPointer:
	ld e, a
	ld d, 0
	ld hl, SpriteAnimOAMData
	add hl, de
	add hl, de
	add hl, de
	ret

UnusedLoadSpriteAnimGFX: ; unreferenced
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, UnusedSpriteAnimGFX
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

INCLUDE "data/sprite_anims/sequences.asm"

INCLUDE "engine/gfx/sprite_anims.asm"

INCLUDE "data/sprite_anims/framesets.asm"

INCLUDE "data/sprite_anims/oam.asm"

INCLUDE "data/sprite_anims/unused_gfx.asm"

Sprites_Cosine:
; a = d * cos(a * pi/32)
	add %010000 ; cos(x) = sin(x + pi/2)
	; fallthrough
Sprites_Sine:
; a = d * sin(a * pi/32)
	calc_sine_wave

AnimateEndOfExpBar:
	ldh a, [hSGB]
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

.AnimateFrame:
	ld hl, wShadowOAMSprite00
	ld c, 8 ; number of animated circles
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
	add 13 * TILE_WIDTH
	ld [hli], a ; y

	pop af
	push de
	push hl
	call Sprites_Cosine
	pop hl
	pop de
	add 10 * TILE_WIDTH + 4
	ld [hli], a ; x

	ld a, $0
	ld [hli], a ; tile id
	ld a, PAL_BATTLE_OB_BLUE
	ld [hli], a ; attributes
	jr .anim_loop

EndOfExpBarGFX:
INCBIN "gfx/battle/expbarend.2bpp"
SGBEndOfExpBarGFX:
INCBIN "gfx/battle/expbarend_sgb.2bpp"

ClearSpriteAnims2:
	push hl
	push de
	push bc
	push af
	ld hl, wSpriteAnimData
	ld bc, wSpriteAnimDataEnd - wSpriteAnimData
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
