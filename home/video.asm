; Functions dealing with VRAM.

DMATransfer:: ; 15d8
; Return carry if the transfer is completed.

	ld a, [hDMATransfer]
	and a
	ret z

; Start transfer
	ld [rHDMA5], a

; Execution is halted until the transfer is complete.

	xor a
	ld [hDMATransfer], a
	scf
	ret
; 15e3


UpdateBGMapBuffer:: ; 15e3
; Copy [hFFDC] 16x8 tiles from BGMapBuffer
; to bg map addresses in BGMapBufferPtrs.

; [hFFDC] must be even since this is done in pairs.

; Return carry on success.

	ld a, [hBGMapUpdate]
	and a
	ret z

	ld a, [rVBK]
	push af
	ld [hSPBuffer], sp

	ld hl, BGMapBufferPtrs
	ld sp, hl

; We can now pop the addresses of affected spots on the BG Map

	ld hl, BGMapPalBuffer
	ld de, BGMapBuffer


.next
; Copy a pair of 16x8 blocks (one 16x16 block)

rept 2
; Get our BG Map address
	pop bc

; Palettes
	ld a, 1
	ld [rVBK], a

	ld a, [hli]
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	dec c

; Tiles
	ld a, 0
	ld [rVBK], a

	ld a, [de]
	inc de
	ld [bc], a
	inc c
	ld a, [de]
	inc de
	ld [bc], a
endr

; We've done 2 16x8 blocks
	ld a, [hFFDC]
	dec a
	dec a
	ld [hFFDC], a

	jr nz, .next


	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl

	pop af
	ld [rVBK], a

	xor a
	ld [hBGMapUpdate], a
	scf
	ret
; 163a


WaitTop:: ; 163a
; Wait until the top third of the BG Map is being updated.

	ld a, [hBGMapMode]
	and a
	ret z

	ld a, [hBGMapThird]
	and a
	jr z, .done

	call DelayFrame
	jr WaitTop

.done
	xor a
	ld [hBGMapMode], a
	ret
; 164c


UpdateBGMap:: ; 164c
; Update the BG Map, in thirds, from TileMap and AttrMap.

	ld a, [hBGMapMode]
	and a
	ret z

; BG Map 0
	dec a ; 1
	jr z, .Tiles
	dec a ; 2
	jr z, .Attr

; BG Map 1
	dec a

	ld a, [hBGMapAddress]
	ld l, a
	ld a, [hBGMapAddress + 1]
	ld h, a
	push hl

	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap1 >> 8
	ld [hBGMapAddress + 1], a

	ld a, [hBGMapMode]
	push af
	cp 3
	call z, .Tiles
	pop af
	cp 4
	call z, .Attr

	pop hl
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a
	ret


.Attr:
	ld a, 1
	ld [rVBK], a

	hlcoord 0, 0, AttrMap
	call .update

	ld a, 0
	ld [rVBK], a
	ret


.Tiles:
	hlcoord 0, 0


.update
	ld [hSPBuffer], sp

; Which third?
	ld a, [hBGMapThird]
	and a ; 0
	jr z, .top
	dec a ; 1
	jr z, .middle
	; 2


THIRD_HEIGHT EQU SCREEN_HEIGHT / 3


.bottom
	ld de, 2 * THIRD_HEIGHT * SCREEN_WIDTH
	add hl, de
	ld sp, hl

	ld a, [hBGMapAddress + 1]
	ld h, a
	ld a, [hBGMapAddress]
	ld l, a

	ld de, 2 * THIRD_HEIGHT * BG_MAP_WIDTH
	add hl, de

; Next time: top third
	xor a
	jr .start


.middle
	ld de, THIRD_HEIGHT * SCREEN_WIDTH
	add hl, de
	ld sp, hl

	ld a, [hBGMapAddress + 1]
	ld h, a
	ld a, [hBGMapAddress]
	ld l, a

	ld de, THIRD_HEIGHT * BG_MAP_WIDTH
	add hl, de

; Next time: bottom third
	ld a, 2
	jr .start


.top
	ld sp, hl

	ld a, [hBGMapAddress + 1]
	ld h, a
	ld a, [hBGMapAddress]
	ld l, a

; Next time: middle third
	ld a, 1


.start
; Which third to update next time
	ld [hBGMapThird], a

; Rows of tiles in a third
	ld a, SCREEN_HEIGHT / 3

; Discrepancy between TileMap and BGMap
	ld bc, BG_MAP_WIDTH - (SCREEN_WIDTH - 1)


.row
; Copy a row of 20 tiles
rept SCREEN_WIDTH / 2 - 1
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr
	pop de
	ld [hl], e
	inc l
	ld [hl], d

	add hl, bc
	dec a
	jr nz, .row


	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret
; 170a


Serve1bppRequest:: ; 170a
; Only call during the first fifth of VBlank

	ld a, [Requested1bpp]
	and a
	ret z

; Back out if we're too far into VBlank
	ld a, [rLY]
	cp 144
	ret c
	cp 146
	ret nc

; Copy [Requested1bpp] 1bpp tiles from [Requested1bppSource] to [Requested1bppDest]

	ld [hSPBuffer], sp

; Source
	ld hl, Requested1bppSource
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl

; Destination
	ld hl, Requested1bppDest
	ld a, [hli]
	ld h, [hl]
	ld l, a

; # tiles to copy
	ld a, [Requested1bpp]
	ld b, a

	xor a
	ld [Requested1bpp], a

.next

rept 3
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d
	inc l
endr
	pop de
	ld [hl], e
	inc l
	ld [hl], e
	inc l
	ld [hl], d
	inc l
	ld [hl], d

	inc hl
	dec b
	jr nz, .next


	ld a, l
	ld [Requested1bppDest], a
	ld a, h
	ld [Requested1bppDest + 1], a

	ld [Requested1bppSource], sp

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret
; 1769


Serve2bppRequest:: ; 1769
; Only call during the first fifth of VBlank

	ld a, [Requested2bpp]
	and a
	ret z

; Back out if we're too far into VBlank
	ld a, [rLY]
	cp 144
	ret c
	cp 146
	ret nc
	jr _Serve2bppRequest


Serve2bppRequest@VBlank:: ; 1778

	ld a, [Requested2bpp]
	and a
	ret z

_Serve2bppRequest:: ; 177d
; Copy [Requested2bpp] 2bpp tiles from [Requested2bppSource] to [Requested2bppDest]

	ld [hSPBuffer], sp

; Source
	ld hl, Requested2bppSource
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl

; Destination
	ld hl, Requested2bppDest
	ld a, [hli]
	ld h, [hl]
	ld l, a

; # tiles to copy
	ld a, [Requested2bpp]
	ld b, a

	xor a
	ld [Requested2bpp], a

.next

rept 7
	pop de
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr
	pop de
	ld [hl], e
	inc l
	ld [hl], d

	inc hl
	dec b
	jr nz, .next


	ld a, l
	ld [Requested2bppDest], a
	ld a, h
	ld [Requested2bppDest + 1], a

	ld [Requested2bppSource], sp

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret
; 17d3


AnimateTileset:: ; 17d3
; Only call during the first fifth of VBlank

	ld a, [hMapAnims]
	and a
	ret z

; Back out if we're too far into VBlank
	ld a, [rLY]
	cp 144
	ret c
	cp 151
	ret nc

	ld a, [hROMBank]
	push af
	ld a, BANK(_AnimateTileset)
	rst Bankswitch

	ld a, [rSVBK]
	push af
	ld a, 1
	ld [rSVBK], a

	ld a, [rVBK]
	push af
	ld a, 0
	ld [rVBK], a

	call _AnimateTileset

	pop af
	ld [rVBK], a
	pop af
	ld [rSVBK], a
	pop af
	rst Bankswitch
	ret
; 17ff
