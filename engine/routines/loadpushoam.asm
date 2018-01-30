WriteOAMDMACodeToHRAM:: ; 4031
	ld c, hTransferVirtualOAM - $ff00
	ld b, .PushOAMEnd - .PushOAM
	ld hl, .PushOAM
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	ret

.PushOAM: ; 403f
	ld a, HIGH(wVirtualOAM)
	ld [rDMA], a
	ld a, NUM_SPRITE_OAM_STRUCTS
.pushoam_loop
	dec a
	jr nz, .pushoam_loop
	ret
.PushOAMEnd
