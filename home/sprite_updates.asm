DisableSpriteUpdates:: ; 0x2ed3
	xor a
	ld [hMapAnims], a
	ld a, [wVramState]
	res 0, a
	ld [wVramState], a
	ld a, $0
	ld [wSpriteUpdatesEnabled], a
	ret
; 0x2ee4

EnableSpriteUpdates:: ; 2ee4
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wVramState]
	set 0, a
	ld [wVramState], a
	ld a, $1
	ld [hMapAnims], a
	ret
; 2ef6
