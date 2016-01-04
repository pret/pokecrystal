_BasementKey: ; 507b4
; Are we even in the right map to use this?
	ld a, [MapGroup]
	cp GROUP_WAREHOUSE_ENTRANCE
	jr nz, .nope

	ld a, [MapNumber]
	cp MAP_WAREHOUSE_ENTRANCE
	jr nz, .nope
; Are we on the tile in front of the door?
	call GetFacingTileCoord
	ld a, d
	cp 22
	jr nz, .nope
	ld a, e
	cp 10
	jr nz, .nope
; Let's use the Basement Key
	ld hl, .BasementKeyScript
	call QueueScript
	ld a, TRUE
	ld [wItemEffectSucceeded], a
	ret

.nope
	ld a, FALSE
	ld [wItemEffectSucceeded], a
	ret
; 507e1

.BasementKeyScript: ; 0x507e1
	closetext
	farjump BasementDoorScript
; 0x507e6
