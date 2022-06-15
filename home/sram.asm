OpenSRAM::
; if invalid bank, sram is disabled
	cp 4 ; NUM_SRAM_BANKS
	jr c, .valid
if DEF(_DEBUG)
	push af
	push bc
	ld b, 1
.loop
	sla b
	dec a
	jr nz, .loop
	ld a, BANK(sOpenedInvalidSRAM)
	call OpenSRAM
	ld a, [sOpenedInvalidSRAM]
	or b
	ld [sOpenedInvalidSRAM], a
	pop bc
	pop af
endc
	jr CloseSRAM

.valid:
; switch to sram bank a
	push af
; latch clock data
	ld a, 1
	ld [$6000], a ; MBC3LatchClock
; enable sram/clock write
	ld a, CART_SRAM_ENABLE
	ld [rRAMG], a ; MBC3SRamEnable
; select sram bank
	pop af
	ld [rRAMB], a ; MBC3SRamBank
	ret

CloseSRAM::
	push af
	ld a, CART_SRAM_DISABLE
; reset clock latch for next time
	ld [$6000], a ; MBC3LatchClock
; disable sram/clock write
	ld [rRAMG], a ; MBC3SRamEnable
	pop af
	ret
