WriteOAMDMACodeToHRAM::
	ld c, LOW(hTransferShadowOAM)
	ld b, OAMDMACodeEnd - OAMDMACode
	ld hl, OAMDMACode
.copy
	ld a, [hli]
	ldh [c], a
	inc c
	dec b
	jr nz, .copy
	ret

OAMDMACode:
; This code is defined in ROM, but
; copied to and called from HRAM.
LOAD "OAM DMA", HRAM
hTransferShadowOAM::
	; initiate DMA
	ld a, HIGH(wShadowOAM)
	ldh [rDMA], a
	; wait for DMA to finish
	ld a, NUM_SPRITE_OAM_STRUCTS
.wait
	dec a
	jr nz, .wait
	ret
ENDL
OAMDMACodeEnd:
