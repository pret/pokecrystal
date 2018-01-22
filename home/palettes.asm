; Functions dealing with palettes.


UpdatePalsIfCGB:: ; c2f
; update bgp data from wBGPals2
; update obp data from wOBPals2
; return carry if successful

; check cgb
	ld a, [hCGB]
	and a
	ret z


UpdateCGBPals:: ; c33
; return carry if successful
; any pals to update?
	ld a, [hCGBPalUpdate]
	and a
	ret z


ForceUpdateCGBPals:: ; c37

	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ld [rSVBK], a

	ld hl, wBGPals2

; copy 8 pals to bgpd
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ld [rBGPI], a
	ld c, LOW(rBGPD)
	ld b, 8 / 2
.bgp
rept (1 palettes) * 2
	ld a, [hli]
	ld [$ff00+c], a
endr

	dec b
	jr nz, .bgp

; hl is now wOBPals2

; copy 8 pals to obpd
	ld a, 1 << rOBPI_AUTO_INCREMENT
	ld [rOBPI], a
	ld c, LOW(rOBPD)
	ld b, 8 / 2
.obp
rept (1 palettes) * 2
	ld a, [hli]
	ld [$ff00+c], a
endr

	dec b
	jr nz, .obp

	pop af
	ld [rSVBK], a

; clear pal update queue
	xor a
	ld [hCGBPalUpdate], a

	scf
	ret
; c9f


DmgToCgbBGPals:: ; c9f
; exists to forego reinserting cgb-converted image data

; input: a -> bgp

	ld [rBGP], a
	push af

; Don't need to be here if DMG
	ld a, [hCGB]
	and a
	jr z, .end

	push hl
	push de
	push bc
	ld a, [rSVBK]
	push af

	ld a, BANK(wBGPals2)
	ld [rSVBK], a

; copy & reorder bg pal buffer
	ld hl, wBGPals2 ; to
	ld de, wBGPals1 ; from
; order
	ld a, [rBGP]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, 1
	ld [hCGBPalUpdate], a

	pop af
	ld [rSVBK], a
	pop bc
	pop de
	pop hl
.end
	pop af
	ret
; ccb


DmgToCgbObjPals:: ; ccb
; exists to forego reinserting cgb-converted image data

; input: d -> obp1
;        e -> obp2

	ld a, e
	ld [rOBP0], a
	ld a, d
	ld [rOBP1], a

	ld a, [hCGB]
	and a
	ret z

	push hl
	push de
	push bc
	ld a, [rSVBK]
	push af

	ld a, BANK(wOBPals2)
	ld [rSVBK], a

; copy & reorder obj pal buffer
	ld hl, wOBPals2 ; to
	ld de, wOBPals1 ; from
; order
	ld a, [rOBP0]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, 1
	ld [hCGBPalUpdate], a

	pop af
	ld [rSVBK], a
	pop bc
	pop de
	pop hl
	ret
; cf8


DmgToCgbObjPal0:: ; cf8
	ld [rOBP0], a
	push af

; Don't need to be here if not CGB
	ld a, [hCGB]
	and a
	jr z, .dmg

	push hl
	push de
	push bc

	ld a, [rSVBK]
	push af
	ld a, BANK(wOBPals2)
	ld [rSVBK], a

	ld hl, wOBPals2 palette 0
	ld de, wOBPals1 palette 0
	ld a, [rOBP0]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, 1
	ld [hCGBPalUpdate], a

	pop af
	ld [rSVBK], a

	pop bc
	pop de
	pop hl

.dmg
	pop af
	ret
; d24

DmgToCgbObjPal1:: ; d24
	ld [rOBP1], a
	push af

	ld a, [hCGB]
	and a
	jr z, .dmg

	push hl
	push de
	push bc

	ld a, [rSVBK]
	push af
	ld a, BANK(wOBPals2)
	ld [rSVBK], a

	ld hl, wOBPals2 palette 1
	ld de, wOBPals1 palette 1
	ld a, [rOBP1]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, 1
	ld [hCGBPalUpdate], a

	pop af
	ld [rSVBK], a

	pop bc
	pop de
	pop hl

.dmg
	pop af
	ret
; d50



CopyPals:: ; d50
; copy c palettes in order b from de to hl

	push bc
	ld c, NUM_PAL_COLORS
.loop
	push de
	push hl

; get pal color
	ld a, b
	and %11 ; color
; 2 bytes per color
	add a
	ld l, a
	ld h, 0
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]

; dest
	pop hl
; write color
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
; next pal color
	srl b
	srl b
; source
	pop de
; done pal?
	dec c
	jr nz, .loop

; de += 8 (next pal)
	ld a, NUM_PAL_COLORS * 2
	add e
	jr nc, .ok
	inc d
.ok
	ld e, a

; how many more pals?
	pop bc
	dec c
	jr nz, CopyPals
	ret
; d79


ClearVBank1:: ; d79
	ld a, [hCGB]
	and a
	ret z

	ld a, 1
	ld [rVBK], a

	ld hl, VRAM_Begin
	ld bc, VRAM_End - VRAM_Begin
	xor a
	call ByteFill

	ld a, 0
	ld [rVBK], a
	ret
; d90


ret_d90:: ; d90
	ret
; d91


ReloadSpritesNoPalettes:: ; d91
	ld a, [hCGB]
	and a
	ret z
	ld a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ld [rSVBK], a
	ld hl, wBGPals2
	ld bc, (8 palettes) + (2 palettes)
	xor a
	call ByteFill
	pop af
	ld [rSVBK], a
	ld a, 1
	ld [hCGBPalUpdate], a
	call DelayFrame
	ret
; db1


FarCallSwapTextboxPalettes:: ; db1
	homecall SwapTextboxPalettes
	ret
; dbd

FarCallScrollBGMapPalettes:: ; dbd
	homecall ScrollBGMapPalettes
	ret
; dc9
