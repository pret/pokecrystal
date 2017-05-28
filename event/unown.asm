

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
	ld hl, .MenuDataHeader_Escape
	and a
	jr z, .load

	ld d, $0
	ld e, $5
.loop
	add hl, de
	dec a
	jr nz, .loop

.load
	call LoadMenuDataHeader
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call ApplyTilemap
	call MenuBoxCoord2Tile
	inc hl
	ld d, 0
	ld e, SCREEN_WIDTH
	add hl, de
	add hl, de
	ld a, [ScriptVar]
	ld c, a
	ld de, .UnownText
	and a
	jr z, .copy
.loop2
	ld a, [de]
	inc de
	cp $ff
	jr nz, .loop2
	dec c
	jr nz, .loop2
.copy
	call .CopyWord
	ld bc, AttrMap - TileMap
	add hl, bc
	call .FillAttr
	call WaitBGMap2
	call JoyWaitAorB
	call PlayClickSFX
	call CloseWindow
	ret
; 8aebc

.UnownText: ; 8aebc

unownwall: MACRO
rept _NARG
if \1 == "-"
x = $64
else
if \1 >= "Y"
x = 2 * (\1 - "Y") + $60
else
if \1 >= "Q"
x = 2 * (\1 - "Q") + $40
else
if \1 >= "I"
x = 2 * (\1 - "I") + $20
else
x = 2 * (\1 - "A")
endc
endc
endc
endc
	db x
shift
endr
	db $ff
endm

.UnownText_Escape:
	; db      $08, $44, $04, $00, $2e, $08, $ff
	unownwall "E", "S", "C", "A", "P", "E"
.UnownText_Light:
	; db      $26, $20, $0c, $0e, $46, $ff
	unownwall "L", "I", "G", "H", "T"
.UnownText_Water:
	; db      $4c, $00, $46, $08, $42, $ff
	unownwall "W", "A", "T", "E", "R"
.UnownText_Ho_Oh:
	; db      $0e, $2c, $64, $2c, $0e, $ff
	unownwall "H", "O", "-", "O", "H"
; 8aed5

.MenuDataHeader_Escape: ; 0x8aed5
	db $40 ; flags
	db 04, 03 ; start coords
	db 09, 16 ; end coords

.MenuDataHeader_Light: ; 0x8aeda
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords

.MenuDataHeader_Water: ; 0x8aedf
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords

.MenuDataHeader_Ho_Oh: ; 0x8aee4
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords
; 8aee9

.FillAttr: ; 8aee9
	ld a, [de]
	cp $ff
	ret z
	cp $60
	ld a, (1 << 3) | PAL_BG_BROWN
	jr c, .got_pal
	ld a, PAL_BG_BROWN

.got_pal
	call .PlaceSquare
	inc hl
	inc hl
	inc de
	jr .FillAttr
; 8aefd

.PlaceSquare: ; 8aefd
	push hl
	ld [hli], a
	ld [hld], a
	ld b, 0
	ld c, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	ld [hl], a
	pop hl
	ret
; 8af09

.CopyWord: ; 8af09
	push hl
	push de
.word_loop
	ld a, [de]
	cp $ff
	jr z, .word_done
	ld c, a
	call .ConvertChar
	inc hl
	inc hl
	inc de
	jr .word_loop

.word_done
	pop de
	pop hl
	ret
; 8af1c

.ConvertChar: ; 8af1c
	push hl
	ld a, c
	cp $60
	jr z, .Tile60
	cp $62
	jr z, .Tile62
	cp $64
	jr z, .Tile64
	ld [hli], a
	inc a
	ld [hld], a
	dec a
	ld b, 0
	ld c, SCREEN_WIDTH
	add hl, bc
	ld c, $10
	add c
	ld [hli], a
	inc a
	ld [hl], a
	pop hl
	ret

.Tile60:
	ld [hl], $5b
	inc hl
	ld [hl], $5c
	ld bc, SCREEN_WIDTH - 1
	add hl, bc
	ld [hl], $4d
	inc hl
	ld [hl], $5d
	pop hl
	ret

.Tile62:
	ld [hl], $4e
	inc hl
	ld [hl], $4f
	ld bc, SCREEN_WIDTH - 1
	add hl, bc
	ld [hl], $5e
	inc hl
	ld [hl], $5f
	pop hl
	ret

.Tile64:
	ld [hl], $2
	inc hl
	ld [hl], $3
	ld bc, SCREEN_WIDTH - 1
	add hl, bc
	ld [hl], $3
	inc hl
	ld [hl], $2
	pop hl
	ret
; 8af6b
