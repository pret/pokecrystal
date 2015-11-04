

SpecialHoOhChamber: ; 0x8addb
	ld hl, PartySpecies
	ld a, [hl]
	cp HO_OH ; is Ho-oh the first Pokémon in the party?
	jr nz, .done ; if not, we're done
	call GetSecondaryMapHeaderPointer
	ld de, EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	ld b, SET_FLAG
	call EventFlagAction
.done
	ret
; 0x8adef

SpecialOmanyteChamber: ; 8adef
	call GetSecondaryMapHeaderPointer
	ld de, EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr nz, .nope

	ld a, WATER_STONE
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	jr c, .open

	ld a, [PartyCount]
	ld b, a
	inc b
.loop
	dec b
	jr z, .nope
	ld a, b
	dec a
	ld [CurPartyMon], a
	push bc
	ld a, MON_ITEM
	call GetPartyParamLocation
	pop bc
	ld a, [hl]
	cp WATER_STONE
	jr nz, .loop

.open
	call GetSecondaryMapHeaderPointer
	ld de, EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	ld b, SET_FLAG
	call EventFlagAction

.nope
	ret
; 8ae30

SpecialAerodactylChamber: ; 8ae30
	push de
	push bc

	call GetSecondaryMapHeaderPointer
	ld a, h
	cp RuinsofAlphAerodactylChamber_SecondMapHeader / $100
	jr nz, .nope
	ld a, l
	cp RuinsofAlphAerodactylChamber_SecondMapHeader % $100
	jr nz, .nope

	ld de, EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	ld b, SET_FLAG
	call EventFlagAction

	scf
	jr .done

.nope
	and a

.done
	pop bc
	pop de
	ret
; 8ae4e

SpecialKabutoChamber: ; 8ae4e
	push hl
	push de

	call GetSecondaryMapHeaderPointer
	ld a, h
	cp RuinsofAlphKabutoChamber_SecondMapHeader / $100
	jr nz, .done
	ld a, l
	cp RuinsofAlphKabutoChamber_SecondMapHeader % $100
	jr nz, .done

	ld de, EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	ld b, SET_FLAG
	call EventFlagAction

.done
	pop de
	pop hl
	ret
; 8ae68

Special_DisplayUnownWords: ; 8ae68
	ld a, [ScriptVar]
	ld hl, MenuDataHeader_0x8aed5
	and a
	jr z, .asm_8ae79

	ld d, $0
	ld e, $5
.asm_8ae75
	add hl, de
	dec a
	jr nz, .asm_8ae75

.asm_8ae79
	call LoadMenuDataHeader
	xor a
	ld [hBGMapMode], a
	call Function1cbb
	call UpdateSprites
	call Function321c
	call GetMemTileCoord
	inc hl
	ld d, $0
	ld e, $14
rept 2
	add hl, de
endr
	ld a, [ScriptVar]
	ld c, a
	ld de, Unknown_8aebc
	and a
	jr z, .asm_8aea5
.asm_8ae9c
	ld a, [de]
	inc de
	cp $ff
	jr nz, .asm_8ae9c
	dec c
	jr nz, .asm_8ae9c

.asm_8aea5
	call Function8af09
	ld bc, AttrMap - TileMap
	add hl, bc
	call Function8aee9
	call Function3200
	call JoyWaitAorB
	call PlayClickSFX
	call WriteBackup
	ret
; 8aebc

Unknown_8aebc: ; 8aebc
	db $08, $44, $04, $00, $2e, $08, $ff
	db $26, $20, $0c, $0e, $46, $ff
	db $4c, $00, $46, $08, $42, $ff
	db $0e, $2c, $64, $2c, $0e, $ff
; 8aed5

MenuDataHeader_0x8aed5: ; 0x8aed5
	db $40 ; flags
	db 04, 03 ; start coords
	db 09, 16 ; end coords

MenuDataHeader_0x8aeda: ; 0x8aeda
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords

MenuDataHeader_0x8aedf: ; 0x8aedf
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords

MenuDataHeader_0x8aee4: ; 0x8aee4
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords
; 8aee9

Function8aee9: ; 8aee9
.asm_8aee9
	ld a, [de]
	cp $ff
	ret z
	cp $60
	ld a, $d
	jr c, .asm_8aef5
	ld a, $5

.asm_8aef5
	call Function8aefd
rept 2
	inc hl
endr
	inc de
	jr .asm_8aee9
; 8aefd

Function8aefd: ; 8aefd
	push hl
	ld [hli], a
	ld [hld], a
	ld b, $0
	ld c, $14
	add hl, bc
	ld [hli], a
	ld [hl], a
	pop hl
	ret
; 8af09

Function8af09: ; 8af09
	push hl
	push de
.asm_8af0b
	ld a, [de]
	cp $ff
	jr z, .asm_8af19
	ld c, a
	call Function8af1c
rept 2
	inc hl
endr
	inc de
	jr .asm_8af0b

.asm_8af19
	pop de
	pop hl
	ret
; 8af1c

Function8af1c: ; 8af1c
	push hl
	ld a, c
	cp $60
	jr z, .asm_8af3b
	cp $62
	jr z, .asm_8af4b
	cp $64
	jr z, .asm_8af5b
	ld [hli], a
	inc a
	ld [hld], a
	dec a
	ld b, $0
	ld c, $14
	add hl, bc
	ld c, $10
	add c
	ld [hli], a
	inc a
	ld [hl], a
	pop hl
	ret

.asm_8af3b
	ld [hl], $5b
	inc hl
	ld [hl], $5c
	ld bc, $0013
	add hl, bc
	ld [hl], $4d
	inc hl
	ld [hl], $5d
	pop hl
	ret

.asm_8af4b
	ld [hl], $4e
	inc hl
	ld [hl], $4f
	ld bc, $0013
	add hl, bc
	ld [hl], $5e
	inc hl
	ld [hl], $5f
	pop hl
	ret

.asm_8af5b
	ld [hl], $2
	inc hl
	ld [hl], $3
	ld bc, $0013
	add hl, bc
	ld [hl], $3
	inc hl
	ld [hl], $2
	pop hl
	ret
; 8af6b
