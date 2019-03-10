_CardKey:
; Are we even in the right map to use this?
	ld a, [wMapGroup]
	cp GROUP_RADIO_TOWER_3F
	jr nz, .nope

	ld a, [wMapNumber]
	cp MAP_RADIO_TOWER_3F
	jr nz, .nope
; Are we facing the slot?
	ld a, [wPlayerDirection]
	and %1100
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
	ld a, TRUE
	ld [wItemEffectSucceeded], a
	ret

.nope
	ld a, FALSE
	ld [wItemEffectSucceeded], a
	ret

.CardKeyScript:
	closetext
	farsjump CardKeySlotScript
