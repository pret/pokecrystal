DisableSpriteUpdates::
	xor a
	ldh [hMapAnims], a
	ld a, [wStateFlags]
	res SPRITE_UPDATES_DISABLED_F, a
	ld [wStateFlags], a
	ld a, FALSE
	ld [wSpriteUpdatesEnabled], a
	ret

EnableSpriteUpdates::
	ld a, TRUE
	ld [wSpriteUpdatesEnabled], a
	ld a, [wStateFlags]
	set SPRITE_UPDATES_DISABLED_F, a
	ld [wStateFlags], a
	ld a, TRUE
	ldh [hMapAnims], a
	ret
