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

Function8cf62: ; 8cf62
	call PlaySpriteAnimations
	call DelayFrame
	ret
; 8cf69

PlaySpriteAnimations: ; 8cf69
	push hl
	push de
	push bc
	push af

	ld a, $0
	ld [wc3b5], a
	call DoNextFrameForAllSprites

	pop af
	pop bc
	pop de
	pop hl
	ret
; 8cf7a

DoNextFrameForAllSprites: ; 8cf7a
	ld hl, wSpriteAnimationStructs
	ld e, 10 ; There are 10 structs here.

.loop
	ld a, [hl]
	and a
	jr z, .next ; This struct is deinitialized.
	ld c, l
	ld b, h
	push hl
	push de
	call DoAnimFrame ; Uses a massive jumptable
	call Function8d04c
	pop de
	pop hl
	jr c, .done

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop

	ld a, [wc3b5]
	ld l, a
	ld h, Sprites / $0100

.loop2 ; Clear (Sprites + [wc3b5] --> SpritesEnd)
	ld a, l
	cp SpritesEnd % $100
	jr nc, .done
	xor a
	ld [hli], a
	jr .loop2

.done
	ret
; 8cfa8

DoNextFrameForFirst16Sprites: ; 8cfa8 (23:4fa8)
	ld hl, wSpriteAnimationStructs
	ld e, 10

.loop
	ld a, [hl]
	and a
	jr z, .next
	ld c, l
	ld b, h
	push hl
	push de
	call DoAnimFrame ; Uses a massive jumptable
	call Function8d04c
	pop de
	pop hl
	jr c, .done

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop

	ld a, [wc3b5]
	ld l, a
	ld h, (Sprites + $40) / $100

.loop2 ; Clear (Sprites + [wc3b5] --> Sprites + $40)
	ld a, l
	cp (Sprites + 16 * 4) % $100
	jr nc, .done
	xor a
	ld [hli], a
	jr .loop2

.done
	ret

InitSpriteAnimStruct:: ; 8cfd6
; Find if there's any room in the wSpriteAnimationStructs array, which is 10x16
	push de
	push af
	ld hl, wSpriteAnimationStructs
	ld e, 10
.loop
	ld a, [hl]
	and a
	jr z, .found
	ld bc, $10
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
; Value [wc3b4] is initially set to -1. Set it to
; the number of objects loaded into this array.
	ld hl, wc3b4
	inc [hl]
	ld a, [hl]
	and a
	jr nz, .initialized
	inc [hl]

.initialized
; Get row a of Unknown_8d1c4, copy the pointer into de
	pop af
	ld e, a
	ld d, 0
	ld hl, Unknown_8d1c4
rept 3
	add hl, de
endr
	ld e, l
	ld d, h
; Set hl to the first field (field 0) in the current structure.
	ld hl, 0
	add hl, bc
; Load the index.
	ld a, [wc3b4]
	ld [hli], a
; Copy the table entry to the next two fields.
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
; Look up the third field from the table in the wc300 array (10x2).
; Take the value and load it in 
	ld a, [de]
	call LookUpInwSpriteAnimDict
	ld [hli], a
	pop de
; Set hl to field 4.  Kinda pointless, because we're presumably already here.
	ld hl, $4
	add hl, bc
; Load the original value of de into here.
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
; load 0 into the next four fields
	xor a
rept 2
	ld [hli], a
endr
	xor a
rept 2
	ld [hli], a
endr
; load -1 into the next field
	dec a
	ld [hli], a
; load 0 into the last five fields
	xor a
rept 4
	ld [hli], a
endr
	ld [hl], a
; back up the address of the first field to wc3b8
	ld a, c
	ld [wc3b8], a
	ld a, b
	ld [wc3b8 + 1], a
	ret
; 8d036

Function8d036: ; 8d036
; Clear the index field of the struct in bc.
	ld hl, 0
	add hl, bc
	ld [hl], $0
	ret
; 8d03d


Function8d03d: ; 8d03d (23:503d)
; Clear the index field of every struct in the wSpriteAnimationStructs array.
	ld hl, wSpriteAnimationStructs
	ld bc, $10
	ld e, 10
	xor a
.loop
	ld [hl], a
	add hl, bc
	dec e
	jr nz, .loop
	ret


Function8d04c: ; 8d04c
	call Function8d0ec ; init WRAM
	call Function8d132 ; read from a memory array
	cp -3
	jr z, .done
	cp -4
	jr z, .almost
	call Function8d1a2 ; OAM?
	ld a, [wc3ba]
	add [hl]
	ld [wc3ba], a
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	ld a, [wc3b5]
	ld e, a
	ld d, Sprites / $100
	ld a, [hli]
	ld c, a
.loop
	ld a, [wc3bc]
	ld b, a
	ld a, [wc3be]
	add b
	ld b, a
	ld a, [wc3bf]
	add b
	ld b, a
	call Function8d0be
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [wc3bb]
	ld b, a
	ld a, [wc3bd]
	add b
	ld b, a
	ld a, [wc3c0]
	add b
	ld b, a
	call Function8d0ce
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [wc3ba]
	add [hl]
	ld [de], a
	inc hl
	inc de
	call Function8d0de
	ld [de], a
	inc hl
	inc de
	ld a, e
	ld [wc3b5], a
	cp SpritesEnd % $100
	jr nc, .outofroom
	dec c
	jr nz, .loop
	pop bc
	jr .done

.almost
	call Function8d036

.done
	and a
	ret

.outofroom
	pop bc
	scf
	ret
; 8d0be

Function8d0be: ; 8d0be
	push hl
	ld a, [hl]
	ld hl, wc3b8
	bit 6, [hl]
	jr z, .ok
	add $8
	xor $ff
	inc a

.ok
	pop hl
	ret
; 8d0ce

Function8d0ce: ; 8d0ce
	push hl
	ld a, [hl]
	ld hl, wc3b8
	bit 5, [hl]
	jr z, .ok
	add $8
	xor $ff
	inc a

.ok
	pop hl
	ret
; 8d0de

Function8d0de: ; 8d0de
	ld a, [wc3b8]
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

Function8d0ec: ; 8d0ec
	xor a
	ld [wc3b8], a
	ld hl, $3
	add hl, bc
	ld a, [hli]
	ld [wc3ba], a
	ld a, [hli]
	ld [wc3bb], a
	ld a, [hli]
	ld [wc3bc], a
	ld a, [hli]
	ld [wc3bd], a
	ld a, [hli]
	ld [wc3be], a
	ret
; 8d109

LookUpInwSpriteAnimDict: ; 8d109
; a = wSpriteAnimDict[a] if a in wSpriteAnimDict else 0
	push hl
	push bc
	ld hl, wSpriteAnimDict
	ld b, a
	ld c, 10
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

Function8d120:: ; 8d120
	ld hl, $1
	add hl, bc
	ld [hl], a
	ld hl, $8
	add hl, bc
	ld [hl], $0
	ld hl, $a
	add hl, bc
	ld [hl], $ff
	ret
; 8d132


Function8d132: ; 8d132
.loop
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done ; finished the current sequence
	dec [hl]
	call Function8d189 ; load pointer from Unknown_8d6e6
	ld a, [hli]
	push af
	jr .okay

.done
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	inc [hl]
	call Function8d189 ; load pointer from Unknown_8d6e6
	ld a, [hli]
	cp $fe
	jr z, .minus_2
	cp $ff
	jr z, .minus_1

	push af
	ld a, [hl]
	push hl
	and $3f
	ld hl, SPRITEANIMSTRUCT_09
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
	ld [wc3b8], a
	pop af
	ret

.minus_1
	xor a
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
rept 2
	dec [hl]
endr
	jr .loop

.minus_2
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

Function8d189: ; 8d189
	; Get the data for the current frame for the current animation sequence

	; Unknown_8d6e6 + 2 * SpriteAnim[SPRITEANIMSTRUCT_01] + 3 * SpriteAnim[SPRITEANIMSTRUCT_FRAME]
	ld hl, SPRITEANIMSTRUCT_01
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, Unknown_8d6e6
rept 2
	add hl, de
endr
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

Function8d1a2: ; 8d1a2
	ld e, a
	ld d, 0
	ld hl, Unknown_8d94d
rept 3
	add hl, de
endr
	ret
; 8d1ac

Function8d1ac: ; unreferenced
	push hl
	ld l, a
	ld h, 0
rept 2
	add hl, hl
endr
	ld de, Unknown_8e706 ; broken 2bpp pointers
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

Unknown_8d1c4: ; 8d1c4
	db $01, SPRITE_ANIM_SEQ_01, $00 ; 00
	db $07, SPRITE_ANIM_SEQ_04, $00 ; 01
	db $08, SPRITE_ANIM_SEQ_05, $05 ; 02
	db $0a, SPRITE_ANIM_SEQ_06, $00 ; 03
	db $0b, SPRITE_ANIM_SEQ_07, $06 ; 04
	db $0c, SPRITE_ANIM_SEQ_08, $06 ; 05
	db $0d, SPRITE_ANIM_SEQ_09, $07 ; 06
	db $0e, SPRITE_ANIM_SEQ_0A, $07 ; 07
	db $10, SPRITE_ANIM_SEQ_0B, $07 ; 08
	db $08, SPRITE_ANIM_SEQ_0C, $05 ; 09
	db $11, SPRITE_ANIM_SEQ_00, $00 ; 0a
	db $12, SPRITE_ANIM_SEQ_0D, $08 ; 0b
	db $12, SPRITE_ANIM_SEQ_0E, $08 ; 0c
	db $12, SPRITE_ANIM_SEQ_0F, $08 ; 0d
	db $13, SPRITE_ANIM_SEQ_10, $00 ; 0e
	db $15, SPRITE_ANIM_SEQ_00, $00 ; 0f
	db $16, SPRITE_ANIM_SEQ_11, $00 ; 10
	db $17, SPRITE_ANIM_SEQ_12, $00 ; 11
	db $18, SPRITE_ANIM_SEQ_12, $00 ; 12
	db $19, SPRITE_ANIM_SEQ_13, $00 ; 13
	db $1a, SPRITE_ANIM_SEQ_14, $00 ; 14
	db $1b, SPRITE_ANIM_SEQ_00, $00 ; 15
	db $1d, SPRITE_ANIM_SEQ_15, $00 ; 16
	db $1e, SPRITE_ANIM_SEQ_00, $00 ; 17
	db $1d, SPRITE_ANIM_SEQ_17, $00 ; 18
	db $1f, SPRITE_ANIM_SEQ_00, $00 ; 19
	db $24, SPRITE_ANIM_SEQ_19, $00 ; 1a
	db $25, SPRITE_ANIM_SEQ_00, $00 ; 1b
	db $20, SPRITE_ANIM_SEQ_13, $00 ; 1c
	db $26, SPRITE_ANIM_SEQ_1A, $00 ; 1d
	db $2d, SPRITE_ANIM_SEQ_00, $00 ; 1e
	db $2e, SPRITE_ANIM_SEQ_00, $00 ; 1f
	db $2f, SPRITE_ANIM_SEQ_00, $00 ; 20
	db $30, SPRITE_ANIM_SEQ_00, $00 ; 21
	db $31, SPRITE_ANIM_SEQ_00, $00 ; 22
	db $32, SPRITE_ANIM_SEQ_1B, $00 ; 23
	db $33, SPRITE_ANIM_SEQ_1C, $00 ; 24
	db $34, SPRITE_ANIM_SEQ_00, $00 ; 25
	db $35, SPRITE_ANIM_SEQ_1D, $00 ; 26
	db $37, SPRITE_ANIM_SEQ_1E, $00 ; 27
	db $38, SPRITE_ANIM_SEQ_1E, $00 ; 28
	db $39, SPRITE_ANIM_SEQ_20, $00 ; 29
	db $3f, SPRITE_ANIM_SEQ_21, $00 ; 2a
	db $3e, SPRITE_ANIM_SEQ_22, $00 ; 2b
	db $40, SPRITE_ANIM_SEQ_00, $00 ; 2c
; 8d24b

INCLUDE "engine/sprite_anims.asm" ; DoAnimFrame

INCLUDE "data/sprite_engine.asm"
; Unknown_8d6e6
; Unknown_8d94d

ApplyXOffset: ; 8e72a
	add $10
ApplyYOffset: ; 8e72c
	and $3f
	cp $20
	jr nc, .xflip
	call Function8e741
	ld a, h
	ret

.xflip
	and $1f
	call Function8e741
	ld a, h
	xor $ff ; cpl
	inc a
	ret
; 8e741

Function8e741: ; 8e741
	ld e, a
	ld a, d
	ld d, 0
	ld hl, .sinewave
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0
.loop
	srl a
	jr nc, .skip_add
	add hl, de

.skip_add
	sla e
	rl d
	and a
	jr nz, .loop
	ret
; 8e75d

.sinewave: ; 8e75d
	sine_wave $100


AnimateEndOfExpBar: ; 8e79d
	ld a, [hSGB]
	ld de, EndOfExpBarGFX
	and a
	jr z, .load
	ld de, SGBEndOfExpBarGFX

.load
	ld hl, VTiles0 tile $00
	lb bc, BANK(EndOfExpBarGFX), 1
	call Request2bpp
	ld c, $8
	ld d, $0
.loop
	push bc
	call .AnimateFrame
	call DelayFrame
	pop bc
rept 2
	inc d
endr
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
	sla a
	sla a
	sla a
	push af

	push de
	push hl
	call ApplyYOffset
	pop hl
	pop de
	add 13 * 8
	ld [hli], a

	pop af
	push de
	push hl
	call ApplyXOffset
	pop hl
	pop de
	add 10 * 8 + 4
	ld [hli], a

	ld a, $0
	ld [hli], a
	ld a, $6 ; OBJ 6
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
	ld [hl], $0
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

Function8e82b: ; 8e82b
	ld a, e
	call ReadMonMenuIcon
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld b, BANK(Icons)
	ld c, 8
	ret
; 8e83f

Function8e83f: ; 8e83f
	push hl
	push de
	push bc
	call Function8e849
	pop bc
	pop de
	pop hl
	ret
; 8e849

Function8e849: ; 8e849
	ld d, 0
	ld hl, Jumptable_8e854
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8e854


Jumptable_8e854: ; 8e854 (23:6854)
	dw Function8e8d5
	dw Function8e961
	dw Function8e97d
	dw Function8e99a
	dw Function8e898
	dw Function8e8b1
	dw Function8e862


Function8e862: ; 8e862 (23:6862)
	call Function8e908
	call Function8e86c
	call Function8e936
	ret

Function8e86c: ; 8e86c (23:686c)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	jr z, .asm_8e890
	push hl
	push bc
	ld d, a
	callab ItemIsMail
	pop bc
	pop hl
	jr c, .asm_8e88e
	ld a, $6
	jr .asm_8e892
.asm_8e88e
	ld a, $5
.asm_8e890
	ld a, $4
.asm_8e892
	ld hl, $1
	add hl, bc
	ld [hl], a
	ret

Function8e898: ; 8e898 (23:6898)
	call Function8e8d5
	ld hl, $2
	add hl, bc
	ld a, $0
	ld [hl], a
	ld hl, $4
	add hl, bc
	ld a, $48
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, $48
	ld [hl], a
	ret

Function8e8b1: ; 8e8b1 (23:68b1)
	call Function8e908
	call Function8e936
	ld hl, $2
	add hl, bc
	ld a, $0
	ld [hl], a
	ld hl, $4
	add hl, bc
	ld a, $18
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, $60
	ld [hl], a
	ld a, c
	ld [wc608], a
	ld a, b
	ld [wc608 + 1], a
	ret

Function8e8d5: ; 8e8d5 (23:68d5)
	call Function8e908
	call Function8e8df
	call Function8e936
	ret

Function8e8df: ; 8e8df (23:68df)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartyMon1Item
	ld bc, $30
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	ret z
	push hl
	push bc
	ld d, a
	callab ItemIsMail
	pop bc
	pop hl
	jr c, .asm_8e900
	ld a, $3
	jr .asm_8e902
.asm_8e900
	ld a, $2
.asm_8e902
	ld hl, $1
	add hl, bc
	ld [hl], a
	ret

Function8e908: ; 8e908 (23:6908)
	ld a, [wc3b7]
	push af
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartySpecies
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	call ReadMonMenuIcon
	ld [CurIcon], a
	call Function8e9db
	ld a, [hObjectStructIndexBuffer]
; y coord
rept 4
	add a
endr
	add $1c
	ld d, a
; x coord
	ld e, $10
; type is partymon icon
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	pop af
	ld hl, $3
	add hl, bc
	ld [hl], a
	ret

Function8e936: ; 8e936 (23:6936)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld b, a
	call Function8e94c
	ld a, b
	pop bc
	ld hl, $9
	add hl, bc
	ld [hl], a
	rlca
	rlca
	ld hl, $d
	add hl, bc
	ld [hl], a
	ret

Function8e94c: ; 8e94c (23:694c)
	callba PlacePartymonHPBar
	call GetHPPal
	ld e, d
	ld d, 0
	ld hl, Unknown_8e95e
	add hl, de
	ld b, [hl]
	ret
; 8e95e (23:695e)

Unknown_8e95e: ; 8e95e
	db $00, $40, $80
; 8e961

Function8e961: ; 8e961 (23:6961)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	xor a
	call GetIconGFX
	lb de, $24, $20
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	ld hl, $2
	add hl, bc
	ld [hl], $0
	ret

Function8e97d: ; 8e97d (23:697d)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	xor a
	call GetIconGFX
	ld d, $1a
	ld e, $24
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	ld hl, $2
	add hl, bc
	ld [hl], $0
	ret

Function8e99a: ; 8e99a (23:699a)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	ld a, $62
	ld [wc3b7], a
	call Function8e9db
	ret

GetSpeciesIcon: ; 8e9ac
; Load species icon into VRAM at tile a
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	ld a, e
	call GetIconGFX
	ret
; 8e9bc


Function8e9bc: ; 8e9bc (23:69bc)
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	ld a, e
	call GetIcon_a
	ret
; 8e9cc (23:69cc)

Function8e9cc: ; 8e9cc
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	call GetIcon_de
	ret
; 8e9db

Function8e9db: ; 8e9db (23:69db)
	ld a, [wc3b7]

GetIconGFX: ; 8e9de
	call GetIcon_a
	ld de, $80 ; 8 tiles
	add hl, de
	ld de, HeldItemIcons
	lb bc, BANK(HeldItemIcons), 2
	call GetGFXUnlessMobile
	ld a, [wc3b7]
	add 10
	ld [wc3b7], a
	ret

HeldItemIcons:
INCBIN "gfx/icon/mail.2bpp"
INCBIN "gfx/icon/item.2bpp"
; 8ea17

GetIcon_de: ; 8ea17
; Load icon graphics into VRAM starting from tile de.
	ld l, e
	ld h, d
	jr GetIcon

GetIcon_a: ; 8ea1b
; Load icon graphics into VRAM starting from tile a.
	ld l, a
	ld h, 0

GetIcon: ; 8ea1e
; Load icon graphics into VRAM starting from tile hl.

; One tile is 16 bytes long.
rept 4
	add hl, hl
endr

	ld de, VTiles0
	add hl, de
	push hl

; The icons are contiguous, in order and of the same
; size, so the pointer table is somewhat redundant.
	ld a, [CurIcon]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	lb bc, BANK(Icons), 8
	call GetGFXUnlessMobile

	pop hl
	ret
; 8ea3f

GetGFXUnlessMobile: ; 8ea3f
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jp nz, Request2bpp
	jp Get2bpp_2
; 8ea4a

Function8ea4a: ; 8ea4a
	ld hl, wSpriteAnimationStructs
	ld e, $6
	ld a, [MenuSelection2]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .loadwithtwo
	ld a, $0
	jr .ok

.loadwithtwo
	ld a, $2

.ok
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], a
	pop hl

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret
; 8ea71

Function8ea71: ; 8ea71
	ld hl, wSpriteAnimationStructs
	ld e, $6
.loop
	ld a, [hl]
	and a
	jr z, .zero
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], $1
	pop hl
.zero
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret
; 8ea8c (23:6a8c)

Function8ea8c: ; 8ea8c
	ld hl, wSpriteAnimationStructs
	ld e, $6
	ld a, [wd0e3]
	ld d, a
.asm_8ea95
	ld a, [hl]
	and a
	jr z, .asm_8eaab
	cp d
	jr z, .asm_8eaa0
	ld a, $3
	jr .asm_8eaa2
.asm_8eaa0
	ld a, $2
.asm_8eaa2
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], a
	pop hl
.asm_8eaab
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .asm_8ea95
	ret

INCLUDE "menu/mon_icons.asm"
