SECTION "BlankScreen", ROMX

BlankScreen:
	call DisableSpriteUpdates
	xor a
	ldh [hBGMapMode], a
	call ClearBGPalettes
	call ClearSprites
	hlcoord 0, 0
	ld bc, wTileMapEnd - wTileMap
	ld a, " "
	call ByteFill
	hlcoord 0, 0, wAttrMap
	ld bc, wAttrMapEnd - wAttrMap
	ld a, $7
	call ByteFill
	call WaitBGMap2
	call SetPalettes
	ret
