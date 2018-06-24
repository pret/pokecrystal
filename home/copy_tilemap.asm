LoadTileMapToTempTileMap::
; Load wTileMap into wTempTileMap
	ld a, [rSVBK]
	push af
	ld a, BANK(wTempTileMap)
	ld [rSVBK], a
	hlcoord 0, 0
	decoord 0, 0, wTempTileMap
	ld bc, wTileMapEnd - wTileMap
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret

Call_LoadTempTileMapToTileMap::
	xor a
	ld [hBGMapMode], a
	call LoadTempTileMapToTileMap
	ld a, 1
	ld [hBGMapMode], a
	ret

LoadTempTileMapToTileMap::
; Load wTempTileMap into wTileMap
	ld a, [rSVBK]
	push af
	ld a, BANK(wTempTileMap)
	ld [rSVBK], a
	hlcoord 0, 0, wTempTileMap
	decoord 0, 0
	ld bc, wTileMapEnd - wTileMap
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
