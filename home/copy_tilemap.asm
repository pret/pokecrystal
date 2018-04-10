LoadTileMapToTempTileMap:: ; 309d
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
; 30b4

Call_LoadTempTileMapToTileMap:: ; 30b4
	xor a
	ld [hBGMapMode], a
	call LoadTempTileMapToTileMap
	ld a, 1
	ld [hBGMapMode], a
	ret
; 30bf

LoadTempTileMapToTileMap:: ; 30bf
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
; 30d6
