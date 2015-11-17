Special_CelebiShrineEvent: ; 4989a
	call DelayFrame
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	call LoadCelebiGFX
	lb de, $07, $50
	ld a, SPRITE_ANIM_INDEX_2C
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $84
	ld hl, $2
	add hl, bc
	ld [hl], $1f
	ld hl, $f
	add hl, bc
	ld a, $80
	ld [hl], a
	ld a, $a0
	ld [wcf64], a
	ld d, $0
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	push bc
	call Function49bae
	inc d
	push de
	ld a, $90
	ld [wc3b5], a
	callba Function8cf7a
	call Function49935
	ld c, 2
	call DelayFrames
	pop de
	pop bc
	jr .loop

.done
	pop af
	ld [VramState], a
	call Function498f9
	call Function49bf3
	ret
; 498f9

Function498f9: ; 498f9
	ld hl, Sprites + 2
	xor a
	ld c, $4
.loop
	ld [hli], a
rept 3
	inc hl
endr
	inc a
	dec c
	jr nz, .loop
	ld hl, Sprites + $10
	ld bc, $90
	xor a
	call ByteFill
	ret
; 49912

LoadCelebiGFX: ; 49912
	callba Function8cf53
	ld de, SpecialCelebiLeafGFX
	ld hl, VTiles1
	lb bc, BANK(SpecialCelebiLeafGFX), 4
	call Request2bpp
	ld de, SpecialCelebiGFX
	ld hl, VTiles1 tile $04
	lb bc, BANK(SpecialCelebiGFX), $10
	call Request2bpp
	xor a
	ld [wJumptableIndex], a
	ret
; 49935

Function49935: ; 49935
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .asm_4993e
	dec [hl]
	ret

.asm_4993e
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 49944

Function49944: ; 49944
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
	ld a, SPRITE_ANIM_INDEX_18 ; fly land
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $80
	ret
; 49962

SpecialCelebiLeafGFX: ; 49962
INCBIN "gfx/special/celebi/leaf.2bpp"
SpecialCelebiGFX: ; 499a2
INCBIN "gfx/special/celebi/1.2bpp"
INCBIN "gfx/special/celebi/2.2bpp"
INCBIN "gfx/special/celebi/3.2bpp"
INCBIN "gfx/special/celebi/4.2bpp"


Function49aa2: ; 49aa2 (12:5aa2)
	ld hl, $6
	add hl, bc
	ld a, [hl]
	push af
	ld hl, $5
	add hl, bc
	ld a, [hl]
	cp $52
	jp nc, Function49b30
	ld hl, $5
	add hl, bc
	inc [hl]
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $3a
	jr c, .asm_49ac6
	jr z, .asm_49ac6
	sub $3
	ld [hl], a
.asm_49ac6
	ld hl, $e
	add hl, bc
	ld a, [hl]
	inc [hl]
	call Function49b3b
	ld hl, $6
	add hl, bc
	ld [hl], a
	ld d, a
	ld hl, $4
	add hl, bc
	add [hl]
	cp $5c
	jr nc, .asm_49ae2
	cp $44
	jr nc, .asm_49b0d
.asm_49ae2
	pop af
	push af
	cp d
	jr nc, .asm_49af2
	ld hl, $4
	add hl, bc
	add [hl]
	cp $50
	jr c, .asm_49b05
	jr .asm_49afb
.asm_49af2
	ld hl, $4
	add hl, bc
	add [hl]
	cp $50
	jr nc, .asm_49b05
.asm_49afb
	ld hl, $5
	add hl, bc
	ld a, [hl]
	sub $2
	ld [hl], a
	jr .asm_49b0d
.asm_49b05
	ld hl, $5
	add hl, bc
	ld a, [hl]
	add $1
	ld [hl], a
.asm_49b0d
	pop af
	ld hl, $4
	add hl, bc
	add [hl]
	cp $50
	jr c, .asm_49b26
	cp $e6
	jr nc, .asm_49b26
	ld hl, $1
	add hl, bc
	ld a, $41
	call Function3b3c
	jr .asm_49b2f
.asm_49b26
	ld hl, $1
	add hl, bc
	ld a, $40
	call Function3b3c
.asm_49b2f
	ret

Function49b30: ; 49b30 (12:5b30)
	pop af
	ld hl, $1
	add hl, bc
	ld a, $40
	call Function3b3c
	ret

Function49b3b: ; 49b3b (12:5b3b)
	add $10
	and $3f
	cp $20
	jr nc, .asm_49b48
	call Function49b52
	ld a, h
	ret
.asm_49b48
	and $1f
	call Function49b52
	ld a, h
	xor $ff
	inc a
	ret

Function49b52: ; 49b52 (12:5b52)
	ld e, a
	ld a, d
	ld d, $0
	ld hl, Unknown_49b6e
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0
.asm_49b61
	srl a
	jr nc, .asm_49b66
	add hl, de
.asm_49b66
	sla e
	rl d
	and a
	jr nz, .asm_49b61
	ret
; 49b6e (12:5b6e)

Unknown_49b6e: ; 49b6e
	sine_wave $100
; 49bae

Function49bae: ; 49bae
	push hl
	push bc
	push de
	ld a, d
	ld d, $3
	ld e, d
	cp $0
	jr z, .asm_49bd0
	cp d
	jr z, .asm_49bd4
	call Function49bed
	cp d
	jr z, .asm_49bd8
	call Function49bed
	cp d
	jr z, .asm_49bdc
	call Function49bed
	cp d
	jr c, .asm_49be9
	jr .asm_49be5

.asm_49bd0
	ld a, $84
	jr .asm_49bde

.asm_49bd4
	ld a, $88
	jr .asm_49bde

.asm_49bd8
	ld a, $8c
	jr .asm_49bde

.asm_49bdc
	ld a, $90

.asm_49bde
	ld hl, $3
	add hl, bc
	ld [hl], a
	jr .asm_49be9

.asm_49be5
	pop de
	ld d, $ff
	push de

.asm_49be9
	pop de
	pop bc
	pop hl
	ret
; 49bed

Function49bed: ; 49bed
	push af
	ld a, d
	add e
	ld d, a
	pop af
	ret
; 49bf3

Function49bf3: ; 49bf3
	ld a, BATTLETYPE_CELEBI
	ld [BattleType], a
	ret
; 49bf9

Function49bf9: ; 49bf9
	ld a, [wBattleResult]
	bit 6, a
	jr z, .asm_49c07
	ld a, $1
	ld [ScriptVar], a
	jr .asm_49c0b

.asm_49c07
	xor a
	ld [ScriptVar], a

.asm_49c0b
	ret
; 49c0c
