EmptyAllSRAMBanks:
for BANKNO, NUM_SRAM_BANKS
	ld a, BANKNO
	call .EmptyBank
endr
	ret

.EmptyBank:
	call OpenSRAM
	ld hl, SRAM_Begin
	ld bc, SRAM_End - SRAM_Begin
	xor a
	call ByteFill
	call CloseSRAM
	ret
