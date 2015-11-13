_CardKey: ; 50779
; Are we even in the right map to use this?
	ld a, [MapGroup]
	cp GROUP_RADIO_TOWER_3F
	jr nz, .nope

	ld a, [MapNumber]
	cp MAP_RADIO_TOWER_3F
	jr nz, .nope
; Are we facing the slot?
	ld a, [PlayerDirection]
	and $c
	cp OW_UP
	jr nz, .nope

	call GetFacingTileCoord
	ld a, d
	cp 18
	jr nz, .nope
	ld a, e
	cp 6
	jr nz, .nope
; Let's use the Card Key.
	ld hl, .CardKeyScript
	call QueueScript
	ld a, $1
	ld [wd0ec], a
	ret

.nope
	ld a, $0
	ld [wd0ec], a
	ret
; 507af

.CardKeyScript: ; 0x507af
	loadmovesprites
	farjump MapRadioTower3FSignpost2Script
; 0x507b4
