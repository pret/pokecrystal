WriteOAMDMACodeToHRAM::
	ld c, LOW(hTransferVirtualOAM)
	ld b, .PushOAMEnd - .PushOAM
	ld hl, .PushOAM
.loop
	ld a, [hli]
	ldh [c], a
	inc c
	dec b
	jr nz, .loop
	ret

.PushOAM:
	ld a, HIGH(wVirtualOAM)
	ldh [rDMA], a
	ld a, NUM_SPRITE_OAM_STRUCTS
.pushoam_loop
	dec a
	jr nz, .pushoam_loop
	ret
.PushOAMEnd
