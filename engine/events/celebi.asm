SPECIALCELEBIEVENT_CELEBI EQU $84

Special_CelebiShrineEvent: ; 4989a
	call DelayFrame
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	call LoadCelebiGFX
	depixel 0, 10, 7, 0
	ld a, SPRITE_ANIM_INDEX_CELEBI
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], SPECIALCELEBIEVENT_CELEBI
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_CELEBI
	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld a, $80
	ld [hl], a
	ld a, 160 ; frame count
	ld [wFrameCounter], a
	ld d, $0
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	push bc
	call GetCelebiSpriteTile
	inc d
	push de
	ld a, $90
	ld [wCurrSpriteOAMAddr], a
	farcall DoNextFrameForAllSprites
	call CelebiEvent_CountDown
	ld c, 2
	call DelayFrames
	pop de
	pop bc
	jr .loop


.done
	pop af
	ld [wVramState], a
	call .RestorePlayerSprite_DespawnLeaves
	call CelebiEvent_SetBattleType
	ret

; 498f9

.RestorePlayerSprite_DespawnLeaves: ; 498f9
	ld hl, wVirtualOAMSprite00TileID
	xor a
	ld c, 4
.OAMloop:
	ld [hli], a ; tile id
rept SPRITEOAMSTRUCT_LENGTH +- 1
	inc hl
endr
	inc a
	dec c
	jr nz, .OAMloop
	ld hl, wVirtualOAMSprite04
	ld bc, wVirtualOAMEnd - wVirtualOAMSprite04
	xor a
	call ByteFill
	ret

; 49912

LoadCelebiGFX: ; 49912
	farcall ClearSpriteAnims
	ld de, SpecialCelebiLeafGFX
	ld hl, vTiles1
	lb bc, BANK(SpecialCelebiLeafGFX), 4
	call Request2bpp
	ld de, SpecialCelebiGFX
	ld hl, vTiles0 tile SPECIALCELEBIEVENT_CELEBI
	lb bc, BANK(SpecialCelebiGFX), 4 * 4
	call Request2bpp
	xor a
	ld [wJumptableIndex], a
	ret

; 49935

CelebiEvent_CountDown: ; 49935
	ld hl, wFrameCounter
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret


.done
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

; 49944

CelebiEvent_SpawnLeaf: ; 49944
; unused
	ld hl, wcf65
	ld a, [hl]
	inc [hl]
	and $7
	ret nz
	ld a, [hl]
	and $18
	sla a
	add $40
	ld d, a
	ld e, $0
	ld a, SPRITE_ANIM_INDEX_FLY_LEAF ; fly land
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $80
	ret

; 49962

SpecialCelebiLeafGFX: ; 49962
INCBIN "gfx/overworld/cut_grass.2bpp"

SpecialCelebiGFX: ; 499a2
INCBIN "gfx/overworld/celebi/1.2bpp"
INCBIN "gfx/overworld/celebi/2.2bpp"
INCBIN "gfx/overworld/celebi/3.2bpp"
INCBIN "gfx/overworld/celebi/4.2bpp"


UpdateCelebiPosition: ; 49aa2 (12:5aa2)
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	push af
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp 8 * 10 + 2
	jp nc, .FreezeCelebiPosition
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $3a
	jr c, .skip
	jr z, .skip
	sub $3
	ld [hl], a
.skip
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hl]
	inc [hl]
	call CelebiEvent_Cosine
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ld d, a
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	cp 8 * 11 + 4
	jr nc, .ShiftY
	cp 8 *  8 + 4
	jr nc, .ReinitSpriteAnimFrame
.ShiftY:
	pop af
	push af
	cp d
	jr nc, .moving_left
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	cp 8 * 10
	jr c, .float_up
	jr .float_down

.moving_left
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	cp 8 * 10
	jr nc, .float_up
.float_down
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	sub $2
	ld [hl], a
	jr .ReinitSpriteAnimFrame

.float_up
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	add $1
	ld [hl], a
.ReinitSpriteAnimFrame:
	pop af
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	add [hl]
	cp 8 * 10
	jr c, .left
	cp -(8 * 3 + 2)
	jr nc, .left
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, SPRITE_ANIM_FRAMESET_CELEBI_RIGHT
	call ReinitSpriteAnimFrame
	jr .done

.left
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, SPRITE_ANIM_FRAMESET_CELEBI_LEFT
	call ReinitSpriteAnimFrame
.done
	ret


.FreezeCelebiPosition: ; 49b30 (12:5b30)
	pop af
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, SPRITE_ANIM_FRAMESET_CELEBI_LEFT
	call ReinitSpriteAnimFrame
	ret


CelebiEvent_Cosine: ; 49b3b (12:5b3b)
; a = d * cos(a * pi/32)
	add %010000
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

.ApplySineWave: ; 49b52 (12:5b52)
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
; 49b6e (12:5b6e)

.sinewave ; 49b6e
	sine_wave $100
; 49bae

GetCelebiSpriteTile: ; 49bae
	push hl
	push bc
	push de
	ld a, d
	ld d, $3
	ld e, d
	cp $0
	jr z, .Frame1
	cp d
	jr z, .Frame2
	call .AddE
	cp d
	jr z, .Frame3
	call .AddE
	cp d
	jr z, .Frame4
	call .AddE
	cp d
	jr c, .done
	jr .restart


.Frame1:
	ld a, SPECIALCELEBIEVENT_CELEBI
	jr .load_tile


.Frame2:
	ld a, SPECIALCELEBIEVENT_CELEBI + 4
	jr .load_tile


.Frame3:
	ld a, SPECIALCELEBIEVENT_CELEBI + 8
	jr .load_tile


.Frame4:
	ld a, SPECIALCELEBIEVENT_CELEBI + 12

.load_tile
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], a
	jr .done


.restart
	pop de
	ld d, $ff
	push de

.done
	pop de
	pop bc
	pop hl
	ret

; 49bed

.AddE: ; 49bed
	push af
	ld a, d
	add e
	ld d, a
	pop af
	ret

; 49bf3

CelebiEvent_SetBattleType: ; 49bf3
	ld a, BATTLETYPE_CELEBI
	ld [wBattleType], a
	ret

; 49bf9

Special_CheckCaughtCelebi: ; 49bf9
	ld a, [wBattleResult]
	bit 6, a
	jr z, .false
	ld a, $1
	ld [wScriptVar], a
	jr .done


.false
	xor a
	ld [wScriptVar], a

.done
	ret

; 49c0c
