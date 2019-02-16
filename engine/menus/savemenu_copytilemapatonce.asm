SaveMenu_CopyTilemapAtOnce:
	ldh a, [hCGB]
	and a
	jp z, WaitBGMap

; The following is a modified version of CopyTilemapAtOnce.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a
.WaitLY:
	ldh a, [rLY]
	cp $60
	jr c, .WaitLY

	di
	ld a, BANK(vBGMap2)
	ldh [rVBK], a
	hlcoord 0, 0, wAttrMap
	call .CopyTilemapAtOnce
	ld a, BANK(vBGMap0)
	ldh [rVBK], a
	hlcoord 0, 0
	call .CopyTilemapAtOnce
.WaitLY2:
	ldh a, [rLY]
	cp $60
	jr c, .WaitLY2
	ei

	pop af
	ldh [hMapAnims], a
	pop af
	ldh [hBGMapMode], a
	ret

.CopyTilemapAtOnce:
	ld [hSPBuffer], sp
	ld sp, hl
	ldh a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ldh [hTilesPerCycle], a
	ld b, 1 << 1
	ld c, LOW(rSTAT)

.loop
rept SCREEN_WIDTH / 2
	pop de
.loop\@
	ldh a, [c]
	and b
	jr nz, .loop\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	add hl, de
	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .loop

	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret
