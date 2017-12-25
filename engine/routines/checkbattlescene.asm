CheckBattleScene: ; 4ea44
; Return carry if battle scene is turned off.

	ld a, 0
	ld hl, wLinkMode
	call GetFarWRAMByte
	cp LINK_MOBILE
	jr z, .mobile

	ld a, [Options]
	bit BATTLE_SCENE, a
	jr nz, .off

	and a
	ret

.mobile
	ld a, [wcd2f]
	and a
	jr nz, .from_wram

	ld a, $4
	call GetSRAMBank
	ld a, [$a60c]
	ld c, a
	call CloseSRAM

	ld a, c
	bit 0, c
	jr z, .off

	and a
	ret

.from_wram
	ld a, $5
	ld hl, w5_dc00
	call GetFarWRAMByte
	bit 0, a
	jr z, .off

	and a
	ret

.off
	scf
	ret
