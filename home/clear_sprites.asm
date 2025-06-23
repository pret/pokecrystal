ClearSprites::
; Erase OAM data
	ld hl, wShadowOAM
	ld b, wShadowOAMEnd - wShadowOAM
	xor a
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

HideSprites::
; Set all OAM y-positions to 160 to hide them offscreen
	ld hl, wShadowOAMSprite00YCoord
	ld de, OBJ_SIZE
	ld b, OAM_COUNT
	ld a, OAM_YCOORD_HIDDEN
.loop
	ld [hl], a ; y
	add hl, de
	dec b
	jr nz, .loop
	ret
