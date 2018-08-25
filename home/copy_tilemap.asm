LoadTileMapToTempTileMap::
; Load wTileMap into wTempTileMap
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTempTileMap)
	ldh [rSVBK], a
	hlcoord 0, 0
	decoord 0, 0, wTempTileMap
	ld bc, wTileMapEnd - wTileMap
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

Call_LoadTempTileMapToTileMap::
	xor a
	ldh [hBGMapMode], a
	call LoadTempTileMapToTileMap
	ld a, 1
	ldh [hBGMapMode], a
	ret

LoadTempTileMapToTileMap::
; Load wTempTileMap into wTileMap
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTempTileMap)
	ldh [rSVBK], a
	hlcoord 0, 0, wTempTileMap
	decoord 0, 0
	ld bc, wTileMapEnd - wTileMap
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret
