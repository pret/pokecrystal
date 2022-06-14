EmptyAllSRAMBanks:
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
	call OpenSRAM
	ld hl, _SRAM
	ld bc, _RAM - _SRAM
	xor a
	call ByteFill
	call CloseSRAM
	ret
