LoadTilemapToTempTilemap::
; Load wTilemap into wTempTilemap
	ldh a, [rWBK]
	push af
	ld a, BANK(wTempTilemap)
	ldh [rWBK], a
	hlcoord 0, 0
	decoord 0, 0, wTempTilemap
	ld bc, wTilemapEnd - wTilemap
	call CopyBytes
	pop af
	ldh [rWBK], a
	ret

SafeLoadTempTilemapToTilemap::
	xor a
	ldh [hBGMapMode], a
	call LoadTempTilemapToTilemap
	ld a, 1
	ldh [hBGMapMode], a
	ret

LoadTempTilemapToTilemap::
; Load wTempTilemap into wTilemap
	ldh a, [rWBK]
	push af
	ld a, BANK(wTempTilemap)
	ldh [rWBK], a
	hlcoord 0, 0, wTempTilemap
	decoord 0, 0
	ld bc, wTilemapEnd - wTilemap
	call CopyBytes
	pop af
	ldh [rWBK], a
	ret
