
_TownMap: ; 9191c
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a

	ld a, [VramState]
	push af
	xor a
	ld [VramState], a

	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call Function90c4e
	callba ClearSpriteAnims
	ld a, 8
	call SkipMusic
	ld a, $e3
	ld [rLCDC], a
	call Function90d56
	ld [wd002], a
	ld [wd003], a
	xor a
	ld [hBGMapMode], a
	call Function91a04
	call WaitBGMap2
	ld a, [wd002]
	call Function9106a
	ld a, [wd003]
	call Function91098
	ld a, c
	ld [wd004], a
	ld a, b
	ld [wd005], a
	ld b, SCGB_02
	call GetSGBLayout
	call SetPalettes
	ld a, [hCGB]
	and a
	jr z, .sgb
	ld a, $e4
	call DmgToCgbObjPal0
	call DelayFrame

.sgb
	ld a, [wd002]
	cp KANTO_LANDMARK
	jr nc, .kanto
	ld d, KANTO_LANDMARK - 1
	ld e, 1
	call Function919b0
	jr .resume

.kanto
	call Function910e8
	call Function919b0

.resume
	pop af
	ld [VramState], a
	pop af
	ld [hInMenu], a
	pop af
	ld [Options], a
	call ClearBGPalettes
	ret
; 919b0

Function919b0: ; 919b0
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	ret nz

	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .pressed_up

	ld a, [hl]
	and D_DOWN
	jr nz, .pressed_down
.loop2
	push de
	callba PlaySpriteAnimations
	pop de
	call DelayFrame
	jr .loop

.pressed_up
	ld hl, wd003
	ld a, [hl]
	cp d
	jr c, .okay
	ld a, e
	dec a
	ld [hl], a

.okay
	inc [hl]
	jr .next

.pressed_down
	ld hl, wd003
	ld a, [hl]
	cp e
	jr nz, .okay2
	ld a, d
	inc a
	ld [hl], a

.okay2
	dec [hl]

.next
	push de
	ld a, [wd003]
	call Function910b4
	ld a, [wd004]
	ld c, a
	ld a, [wd005]
	ld b, a
	ld a, [wd003]
	call Function910d4
	pop de
	jr .loop2
; 91a04

Function91a04: ; 91a04
	ld a, [wd002]
	cp KANTO_LANDMARK
	jr nc, .kanto
	ld e, $0
	jr .okay

.kanto
	ld e, $1

.okay
	callba PokegearMap
	ld a, $7
	ld bc, 6
	hlcoord 1, 0
	call ByteFill
	hlcoord 0, 0
	ld [hl], $6
	hlcoord 7, 0
	ld [hl], $17
	hlcoord 7, 1
	ld [hl], $16
	hlcoord 7, 2
	ld [hl], $26
	ld a, $7
	ld bc, NAME_LENGTH
	hlcoord 8, 2
	call ByteFill
	hlcoord 19, 2
	ld [hl], $17
	ld a, [wd003]
	call Function910b4
	callba TownMapPals
	ret
; 91a53
