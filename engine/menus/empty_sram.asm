INCLUDE "constants/hardware_constants.inc"


SECTION "engine/menus/empty_sram.asm", ROMX

EmptyAllSRAMBanks::
	ld a, 0
	call .EmptyBank
	ld a, 1
	call .EmptyBank
	ld a, 2
	call .EmptyBank
	ld a, 3
	call .EmptyBank
	ret

.EmptyBank:
	call GetSRAMBank
	ld hl, SRAM_Begin
	ld bc, SRAM_End - SRAM_Begin
	xor a
	call ByteFill
	call CloseSRAM
	ret
