INCLUDE "macros/enum.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/floating_constants.inc"
INCLUDE "constants/hardware_constants.inc"


SECTION "engine/gfx/load_push_oam.asm", ROMX, BANK[BANK_GAME_INIT]

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
