; Functions dealing with palettes.


UpdatePalsIfCGB:: ; c2f
; update bgp data from BGPals
; update obp data from OBPals
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
	ld a, 5 ; BANK(BGPals)
	ld [rSVBK], a

	ld hl, BGPals ; 5:d080

; copy 8 pals to bgpd
	ld a, %10000000 ; auto increment, index 0
	ld [rBGPI], a
	ld c, rBGPD % $100
	ld b, 4 ; NUM_PALS / 2
.bgp
	rept $10
	ld a, [hli]
	ld [$ff00+c], a
	endr

	dec b
	jr nz, .bgp
	
; hl is now 5:d0c0 OBPals
	
; copy 8 pals to obpd
	ld a, %10000000 ; auto increment, index 0
	ld [rOBPI], a
	ld c, rOBPD - rJOYP
	ld b, 4 ; NUM_PALS / 2
.obp
	rept $10
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

	ld a, [hCGB]
	and a
	jr z, .end

	push hl
	push de
	push bc
	ld a, [rSVBK]
	push af

	ld a, 5
	ld [rSVBK], a

; copy & reorder bg pal buffer
	ld hl, BGPals ; to
	ld de, Unkn1Pals ; from
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

	ld a, 5
	ld [rSVBK], a

; copy & reorder obj pal buffer
	ld hl, OBPals ; to
	ld de, Unkn2Pals ; from
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


Functioncf8:: ; cf8
	ld [rOBP0], a
	push af
	ld a, [hCGB]
	and a
	jr z, .asm_d22
	push hl
	push de
	push bc
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, OBPals
	ld de, Unkn2Pals
	ld a, [rOBP0]
	ld b, a
	ld c, $1
	call CopyPals
	ld a, $1
	ld [hCGBPalUpdate], a
	pop af
	ld [rSVBK], a
	pop bc
	pop de
	pop hl

.asm_d22
	pop af
	ret
; d24

Functiond24:: ; d24
	ld [rOBP1], a
	push af
	ld a, [hCGB]
	and a
	jr z, .asm_d4e
	push hl
	push de
	push bc
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, OBPals + 8
	ld de, Unkn2Pals + 8
	ld a, [rOBP1]
	ld b, a
	ld c, $1
	call CopyPals
	ld a, $1
	ld [hCGBPalUpdate], a
	pop af
	ld [rSVBK], a
	pop bc
	pop de
	pop hl

.asm_d4e
	pop af
	ret
; d50



CopyPals:: ; d50
; copy c palettes in order b from de to hl

	push bc
	ld c, 4 ; NUM_PAL_COLORS
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
	ld a, 8 ; NUM_PAL_COLORS * 2 ; bytes per pal
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


Functiond79:: ; d79
	ld a, [hCGB]
	and a
	ret z
	ld a, 1
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, $2000
	xor a
	call ByteFill
	ld a, 0
	ld [rVBK], a
	ret
; d90


Functiond90:: ; d90
	ret
; d91


Special_ReloadSpritesNoPalettes:: ; d91
	ld a, [hCGB]
	and a
	ret z
	ld a, [rSVBK]
	push af
	ld a, 5 ; BANK(BGPals)
	ld [rSVBK], a
	ld hl, BGPals
	ld bc, $40 + $10
	xor a
	call ByteFill
	pop af
	ld [rSVBK], a
	ld a, 1
	ld [hCGBPalUpdate], a
	call DelayFrame
	ret
; db1


Functiondb1:: ; db1
	ld a, [hROMBank]
	push af
	ld a, BANK(Function4c000)
	rst Bankswitch
	call Function4c000
	pop af
	rst Bankswitch
	ret
; dbd

Functiondbd:: ; dbd
	ld a, [hROMBank]
	push af
	ld a, BANK(Function4c03f)
	rst Bankswitch
	call Function4c03f
	pop af
	rst Bankswitch
	ret
; dc9
