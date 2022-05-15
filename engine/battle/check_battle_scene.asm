CheckBattleScene:
; Return carry if battle scene is turned off.

	ld a, BANK(wLinkMode)
	ld hl, wLinkMode
	call GetFarWRAMByte
	cp LINK_MOBILE
	jr z, .mobile

	ld a, [wOptions]
	bit BATTLE_SCENE, a
	jr nz, .off

	and a
	ret

.mobile
	ld a, [wcd2f]
	and a
	jr nz, .from_wram

	ld a, BANK(s4_a60c) ; MBC30 bank used by JP Crystal; inaccessible by MBC3
	call OpenSRAM
	ld a, [s4_a60c]
	ld c, a
	call CloseSRAM

	ld a, c
	bit 0, c
	jr z, .off

	and a
	ret

.from_wram
	ld a, BANK(w5_dc00)
	ld hl, w5_dc00
	call GetFarWRAMByte
	bit 0, a
	jr z, .off

	and a
	ret

.off
	scf
	ret
