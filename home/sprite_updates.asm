DisableSpriteUpdates::
	xor a
	ld [hMapAnims], a
	ld a, [wVramState]
	res 0, a
	ld [wVramState], a
	ld a, $0
	ld [wSpriteUpdatesEnabled], a
	ret

EnableSpriteUpdates::
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wVramState]
	set 0, a
	ld [wVramState], a
	ld a, $1
	ld [hMapAnims], a
	ret
