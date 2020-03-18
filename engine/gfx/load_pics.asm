GetUnownLetter:
; Return Unown letter in wUnownLetter based on DVs at hl

; Take the middle 2 bits of each DV and place them in order:
;	atk  def  spd  spc
;	.ww..xx.  .yy..zz.

	; atk
	ld a, [hl]
	and %01100000
	sla a
	ld b, a
	; def
	ld a, [hli]
	and %00000110
	swap a
	srl a
	or b
	ld b, a

	; spd
	ld a, [hl]
	and %01100000
	swap a
	sla a
	or b
	ld b, a
	; spc
	ld a, [hl]
	and %00000110
	srl a
	or b

; Divide by 10 to get 0-25
	ldh [hDividend + 3], a
	xor a
	ldh [hDividend], a
	ldh [hDividend + 1], a
	ldh [hDividend + 2], a
	ld a, $ff / NUM_UNOWN + 1
	ldh [hDivisor], a
	ld b, 4
	call Divide

; Increment to get 1-26
	ldh a, [hQuotient + 3]
	inc a
	ld [wUnownLetter], a
	ret

GetMonFrontpic:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call IsAPokemon
	ret c
	ldh a, [rSVBK]
	push af
	call _GetFrontpic
	pop af
	ldh [rSVBK], a
	jp CloseSRAM

GetAnimatedFrontpic:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call IsAPokemon
	ret c
	ldh a, [rSVBK]
	push af
	xor a
	ldh [hBGMapMode], a
	call _GetFrontpic
	ld a, BANK(vTiles3) ; load bank with animation stuff
	ldh [rVBK], a
	call GetAnimatedEnemyFrontpic
	xor a
	ldh [rVBK], a ; reset bank
	pop af
	ldh [rSVBK], a
	jp CloseSRAM

_GetFrontpic:
	ld a, BANK(sEnemyFrontpicTileCount)
	call GetSRAMBank
	push de
	call GetBaseData
	ld a, [wBasePicSize]
	and $f
	ld b, a
	push bc
	call GetFrontpicPointer
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	ld a, b
	ld de, wDecompressScratch
	call FarDecompress
	; Save decompressed size
	swap e
	swap d
	ld a, d
	and $f0
	or e
	ld [sEnemyFrontpicTileCount], a
	pop bc
	ld hl, sPaddedEnemyFrontpic
	ld de, wDecompressScratch
	call PadFrontpic
	pop hl
	push hl
	ld de, sPaddedEnemyFrontpic
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	ret

GetFrontpicPointer:
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr z, .unown
	ld a, [wCurPartySpecies]
	ld d, BANK(PokemonPicPointers)
	jr .ok

.unown
	ld a, [wUnownLetter]
	ld d, BANK(UnownPicPointers)

.ok
	ld hl, PokemonPicPointers ; UnownPicPointers
	dec a
	ld bc, 6
	call AddNTimes
	ld a, d
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, d
	call GetFarHalfword
	pop bc
	ret

GetAnimatedEnemyFrontpic:
	push hl
	ld de, sPaddedEnemyFrontpic
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	ld de, 7 * 7 tiles
	add hl, de
	push hl
	ld a, BANK(wBasePicSize)
	ld hl, wBasePicSize
	call GetFarWRAMByte
	pop hl
	and $f
	ld de, wDecompressScratch + 5 * 5 tiles
	ld c, 5 * 5
	cp 5
	jr z, .got_dims
	ld de, wDecompressScratch + 6 * 6 tiles
	ld c, 6 * 6
	cp 6
	jr z, .got_dims
	ld de, wDecompressScratch + 7 * 7 tiles
	ld c, 7 * 7
.got_dims
	; Get animation size (total tiles - base sprite size)
	ld a, [sEnemyFrontpicTileCount]
	sub c
	ret z ; Return if there are no animation tiles
	ld c, a
	push hl
	push bc
	call LoadFrontpicTiles
	pop bc
	pop hl
	ld de, wDecompressScratch
	ldh a, [hROMBank]
	ld b, a
	; If we can load it in a single pass, just do it
	ld a, c
	sub 128 - 7 * 7
	jr c, .finish
	; Otherwise, load the first part...
	inc a
	ld [sEnemyFrontpicTileCount], a
	ld c, 127 - 7 * 7
	call Get2bpp
	; then load the rest into vTiles4
	ld de, wDecompressScratch + (127 - 7 * 7) tiles
	ld hl, vTiles4
	ldh a, [hROMBank]
	ld b, a
	ld a, [sEnemyFrontpicTileCount]
	ld c, a
.finish
	jp Get2bpp

LoadFrontpicTiles:
	ld hl, wDecompressScratch
	swap c
	ld a, c
	and $f
	ld b, a
	ld a, c
	and $f0
	ld c, a
	push bc
	call LoadOrientedFrontpic
	pop bc
	ld a, c
	and a
	jr z, .handle_loop
	inc b
	jr .handle_loop
.loop
	push bc
	ld c, 0
	call LoadOrientedFrontpic
	pop bc
.handle_loop
	dec b
	jr nz, .loop
	ret

GetMonBackpic:
	ld a, [wCurPartySpecies]
	call IsAPokemon
	ret c

	ld a, [wCurPartySpecies]
	ld b, a
	ld a, [wUnownLetter]
	ld c, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	push de

	; These are assumed to be at the same address in their respective banks.
	ld hl, PokemonPicPointers ; UnownPicPointers
	ld a, b
	ld d, BANK(PokemonPicPointers)
	cp UNOWN
	jr nz, .ok
	ld a, c
	ld d, BANK(UnownPicPointers)
.ok
	dec a
	ld bc, 6
	call AddNTimes
	ld bc, 3
	add hl, bc
	ld a, d
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, d
	call GetFarHalfword
	ld de, wDecompressScratch
	pop af
	call FarDecompress
	ld hl, wDecompressScratch
	ld c, 6 * 6
	call FixBackpicAlignment
	pop hl
	ld de, wDecompressScratch
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	pop af
	ldh [rSVBK], a
	ret

FixPicBank:
; This is a thing for some reason.

PICS_FIX EQU $36
GLOBAL PICS_FIX

	push hl
	push bc
	sub BANK("Pics 1") - PICS_FIX
	ld c, a
	ld b, 0
	ld hl, .PicsBanks
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	ret

.PicsBanks:
	db BANK("Pics 1")  ; BANK("Pics 1") + 0
	db BANK("Pics 2")  ; BANK("Pics 1") + 1
	db BANK("Pics 3")  ; BANK("Pics 1") + 2
	db BANK("Pics 4")  ; BANK("Pics 1") + 3
	db BANK("Pics 5")  ; BANK("Pics 1") + 4
	db BANK("Pics 6")  ; BANK("Pics 1") + 5
	db BANK("Pics 7")  ; BANK("Pics 1") + 6
	db BANK("Pics 8")  ; BANK("Pics 1") + 7
	db BANK("Pics 9")  ; BANK("Pics 1") + 8
	db BANK("Pics 10") ; BANK("Pics 1") + 9
	db BANK("Pics 11") ; BANK("Pics 1") + 10
	db BANK("Pics 12") ; BANK("Pics 1") + 11
	db BANK("Pics 13") ; BANK("Pics 1") + 12
	db BANK("Pics 14") ; BANK("Pics 1") + 13
	db BANK("Pics 15") ; BANK("Pics 1") + 14
	db BANK("Pics 16") ; BANK("Pics 1") + 15
	db BANK("Pics 17") ; BANK("Pics 1") + 16
	db BANK("Pics 18") ; BANK("Pics 1") + 17
	db BANK("Pics 19") ; BANK("Pics 1") + 18
	db BANK("Pics 20") ; BANK("Pics 1") + 19
	db BANK("Pics 21") ; BANK("Pics 1") + 20
	db BANK("Pics 22") ; BANK("Pics 1") + 21
	db BANK("Pics 23") ; BANK("Pics 1") + 22
	db BANK("Pics 24") ; BANK("Pics 1") + 23

Function511ec:
	ld a, c
	push de
	ld hl, PokemonPicPointers
	dec a
	ld bc, 6
	call AddNTimes
	ld a, BANK(PokemonPicPointers)
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, BANK(PokemonPicPointers)
	call GetFarHalfword
	pop af
	pop de
	call FarDecompress
	ret

GetTrainerPic:
	ld a, [wTrainerClass]
	and a
	ret z
	cp NUM_TRAINER_CLASSES
	ret nc
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a
	ld hl, TrainerPicPointers
	ld a, [wTrainerClass]
	dec a
	ld bc, 3
	call AddNTimes
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
	push de
	ld a, BANK(TrainerPicPointers)
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, BANK(TrainerPicPointers)
	call GetFarHalfword
	pop af
	ld de, wDecompressScratch
	call FarDecompress
	pop hl
	ld de, wDecompressScratch
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	pop af
	ldh [rSVBK], a
	call WaitBGMap
	ld a, $1
	ldh [hBGMapMode], a
	ret

DecompressGet2bpp:
; Decompress lz data from b:hl to scratch space at 6:d000, then copy it to address de.

	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	push de
	push bc
	ld a, b
	ld de, wDecompressScratch
	call FarDecompress
	pop bc
	ld de, wDecompressScratch
	pop hl
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp

	pop af
	ldh [rSVBK], a
	ret

FixBackpicAlignment:
	push de
	push bc
	ld a, [wBoxAlignment]
	and a
	jr z, .keep_dims
	ld a, c
	cp 7 * 7
	ld de, 7 * 7 tiles
	jr z, .got_dims
	cp 6 * 6
	ld de, 6 * 6 tiles
	jr z, .got_dims
	ld de, 5 * 5 tiles

.got_dims
	ld a, [hl]
	ld b, 0
	ld c, 8
.loop
	rra
	rl b
	dec c
	jr nz, .loop
	ld a, b
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .got_dims

.keep_dims
	pop bc
	pop de
	ret

PadFrontpic:
; pads frontpic to fill 7x7 box
	ld a, b
	cp 6
	jr z, .six
	cp 5
	jr z, .five

.seven_loop
	ld c, 7 << 4
	call LoadOrientedFrontpic
	dec b
	jr nz, .seven_loop
	ret

.six
	ld c, 7 << 4
	xor a
	call .Fill
.six_loop
	ld c, (7 - 6) << 4
	xor a
	call .Fill
	ld c, 6 << 4
	call LoadOrientedFrontpic
	dec b
	jr nz, .six_loop
	ret

.five
	ld c, 7 << 4
	xor a
	call .Fill
.five_loop
	ld c, (7 - 5) << 4
	xor a
	call .Fill
	ld c, 5 << 4
	call LoadOrientedFrontpic
	dec b
	jr nz, .five_loop
	ld c, 7 << 4
	xor a
	call .Fill
	ret

.Fill:
	ld [hli], a
	dec c
	jr nz, .Fill
	ret

LoadOrientedFrontpic:
	ld a, [wBoxAlignment]
	and a
	jr nz, .x_flip
.left_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .left_loop
	ret

.x_flip
	push bc
.right_loop
	ld a, [de]
	inc de
	ld b, a
	xor a
rept 8
	rr b
	rla
endr
	ld [hli], a
	dec c
	jr nz, .right_loop
	pop bc
	ret
