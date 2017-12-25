LoadPushOAM:: ; 4031
	ld c, hPushOAM - $ff00
	ld b, .PushOAMEnd - .PushOAM
	ld hl, .PushOAM
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	ret

.PushOAM: ; 403f
	ld a, Sprites / $100
	ld [rDMA], a
	ld a, (SpritesEnd - Sprites) / 4 ; 40
.pushoam_loop
	dec a
	jr nz, .pushoam_loop
	ret
.PushOAMEnd
