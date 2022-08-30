EmptyAllSRAMBanks:
FOR BANKNO, NUM_SRAM_BANKS
	ld a, BANKNO
	call .EmptyBank
ENDR
	ret

.EmptyBank:
	call OpenSRAM
	ld hl, SRAM_Begin
	ld bc, SRAM_End - SRAM_Begin
	xor a
	call ByteFill
	call CloseSRAM
	ret
