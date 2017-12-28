BattleIntroSlidingPics: ; 4e980
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	call .subfunction1
	ld a, rSCX - $ff00
	ld [hLCDCPointer], a
	call .subfunction2
	xor a
	ld [hLCDCPointer], a
	pop af
	ld [rSVBK], a
	ret
; 4e998

.subfunction1 ; 4e998
	call .subfunction4
	ld a, $90
	ld [hSCX], a
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	ret
; 4e9ab

.subfunction2 ; 4e9ab
	ld d, $90
	ld e, $72
	ld a, $48
	inc a
.loop1
	push af
.loop2
	ld a, [rLY]
	cp $60
	jr c, .loop2
	ld a, d
	ld [hSCX], a
	call .subfunction5
	inc e
	inc e
	dec d
	dec d
	pop af
	push af
	cp $1
	jr z, .skip1
	push de
	call .subfunction3
	pop de

.skip1
	call DelayFrame
	pop af
	dec a
	jr nz, .loop1
	ret
; 4e9d6

.subfunction3 ; 4e9d6
	ld hl, Sprites + 1 ; x pixel
	ld c, $12 ; 18
	ld de, $4
.loop3
	dec [hl]
	dec [hl]
	add hl, de
	dec c
	jr nz, .loop3
	ret
; 4e9e5

.subfunction4 ; 4e9e5
	ld hl, LYOverrides
	ld a, $90
	ld bc, SCREEN_HEIGHT_PX
	call ByteFill
	ret
; 4e9f1

.subfunction5 ; 4e9f1
	ld hl, LYOverrides
	ld a, d
	ld c, $3e ; 62
.loop4
	ld [hli], a
	dec c
	jr nz, .loop4
	ld a, e
	ld c, $22 ; 34
.loop5
	ld [hli], a
	dec c
	jr nz, .loop5
	xor a
	ld c, $30 ; 48
.loop6
	ld [hli], a
	dec c
	jr nz, .loop6
	ret
; 4ea0a
