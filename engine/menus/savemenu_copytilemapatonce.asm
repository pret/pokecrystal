SaveMenu_CopyTilemapAtOnce:
	ldh a, [hCGB]
	and a
	jp z, WaitBGMap

; The following is a modified version of _CopyTilemapAtOnce
; that waits for [rLY] to be $60 instead of $80 - 1.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a

.wait
	ldh a, [rLY]
	cp $60
	jr c, .wait

	di
	ld a, BANK(vBGMap2)
	ldh [rVBK], a
	hlcoord 0, 0, wAttrmap
	call .CopyBGMapViaStack
	ld a, BANK(vBGMap0)
	ldh [rVBK], a
	hlcoord 0, 0
	call .CopyBGMapViaStack

.wait2
	ldh a, [rLY]
	cp $60
	jr c, .wait2
	ei

	pop af
	ldh [hMapAnims], a
	pop af
	ldh [hBGMapMode], a
	ret

.CopyBGMapViaStack:
; Copy all tiles to vBGMap
	ld [hSPBuffer], sp
	ld sp, hl
	ldh a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ldh [hTilesPerCycle], a
	ld b, STAT_BUSY
	ld c, LOW(rSTAT)

.loop
rept SCREEN_WIDTH / 2
	pop de
; if in v/hblank, wait until not in v/hblank
.loop\@
	ldh a, [c]
	and b
	jr nz, .loop\@
; load vBGMap
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, TILEMAP_WIDTH - SCREEN_WIDTH
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
