Function113d6: ; 113d6
	call Function114dd
	ret
; 113da

Function113da: ; 113da
	xor a
	ld [wdc2d], a
	ld [wdc3a], a
	ld [wdc1c], a
	ret
; 113e5

Function113e5:: ; 113e5
	xor a
	ld [wd464], a

Function113e9: ; 113e9
	ld a, [wd464]
	cp 3
	jr c, .asm_113f2
	ld a, 3

.asm_113f2
	ld e, a
	ld d, 0
	ld hl, .data_113fd
	add hl, de
	ld a, [hl]
	jp Function1142e
; 113fd

.data_113fd
	db 20, 10, 5, 3
; 11401

Function11401: ; 11401
	call Function1143c
	ret nc
	ld hl, wd464
	ld a, [hl]
	cp 3
	jr nc, .asm_1140e
	inc [hl]

.asm_1140e
	call Function113e9
	scf
	ret
; 11413

Function11413: ; 11413
	ld a, 1

Function11415: ; 11415
	ld [hl], a
	push hl
	call UpdateTime
	pop hl
	inc hl
	call Function11621
	ret
; 11420

Function11420: ; 11420
	inc hl
	push hl
	call Function115cf
	call Function115c8
	pop hl
	dec hl
	call Function11586
	ret
; 1142e

Function1142e: ; 1142e
	ld hl, wd465
	ld [hl], a
	call UpdateTime
	ld hl, wd466
	call Function1162e
	ret
; 1143c

Function1143c: ; 1143c
	ld hl, wd466
	call Function115d6
	call Function115ae
	ld hl, wd465
	call Function11586
	ret
; 1144c

Function1144c: ; 1144c
	ld hl, wdc1c
	jp Function11413
; 11452

Function11452:: ; 11452
	ld hl, wdc1c
	call Function11420
	ret nc
	xor a
	ld hl, DailyFlags
rept 3
	ld [hli], a
endr
	ld [hl], a
	ld hl, wDailyRematchFlags
rept 4
	ld [hli], a
endr
	ld hl, wDailyPhoneItemFlags
rept 4
	ld [hli], a
endr
	ld hl, wDailyPhoneTimeOfDayFlags
rept 4
	ld [hli], a
endr
	ld hl, wdc58
	ld a, [hl]
	and a
	jr z, .asm_11480
	dec [hl]
	jr nz, .asm_11483

.asm_11480
	call Function11485

.asm_11483
	jr Function1144c
; 11485

Function11485: ; 11485
	call Random
	and 3
	add 3
	ld [wdc58], a
	ret
; 11490

Function11490: ; 11490
	ld a, $14
	ld [wd46c], a
	ld a, $0
	ld [wd46d], a
	call UpdateTime
	ld hl, wdc35
	call Function11613
	ret
; 114a4


Function114a4:: ; 114a4 (4:54a4)
	ld hl, wdc35
	call Function115db
	ld a, [wcfd7]
	and a
	jr nz, .asm_114d4
	ld a, [wcfd6]
	and a
	jr nz, .asm_114d4
	ld a, [wcfd4]
	ld b, a
	ld a, [wd46d]
	sub b
	jr nc, .asm_114c2
	add $3c
.asm_114c2
	ld [wd46d], a
	ld a, [wcfd5]
	ld b, a
	ld a, [wd46c]
	sbc b
	ld [wd46c], a
	jr c, .asm_114d4
	and a
	ret
.asm_114d4
	xor a
	ld [wd46c], a
	ld [wd46d], a
	scf
	ret


Function114dd: ; 114dd
	call UpdateTime
	ld hl, wdc23
	call Function11621
	ret
; 114e7

Function114e7:: ; 114e7
	ld hl, wdc23
	call Function115cf
	call Function115c8
	and a
	jr z, .asm_114fa

	ld b, a
	callba ApplyPokerusTick

.asm_114fa
	xor a
	ret
; 114fc

Function114fc: ; 114fc
	ld a, $2
	ld hl, wdc3a
	ld [hl], a
	call UpdateTime
	ld hl, wdc3b
	call Function11621
	ret
; 1150c

Function1150c: ; 1150c
	ld hl, wdc3b
	call Function115cf
	call Function115c8
	ld hl, wdc3a
	call Function11586
	ret
; 1151c

Function1151c: ; 1151c
	ld hl, DailyFlags
	set 2, [hl]
	ret
; 11522

Function11522: ; 11522
	and a
	ld hl, DailyFlags
	bit 2, [hl]
	ret nz
	scf
	ret
; 1152b

Function1152b: ; 1152b
	call Function11534
	ld hl, wdc2d
	jp Function11415
; 11534

Function11534: ; 11534
	call GetWeekday
	ld c, a
	ld a, $5
	sub c
	jr z, .asm_1153f
	jr nc, .asm_11541

.asm_1153f
	add $7

.asm_11541
	ret
; 11542

Function11542: ; 11542
	ld hl, wdc2d
	jp Function11420
; 11548

Function11548: ; 11548
	ld a, BANK(s0_abfa)
	call GetSRAMBank
	ld hl, s0_abfa
	ld a, [hli]
	ld [Buffer1], a
	ld a, [hl]
	ld [Buffer2], a
	call CloseSRAM
	ld hl, Buffer1
	call Function11420
	jr nc, .asm_11572
	ld hl, Buffer1
	call Function11413
	call CloseSRAM
	callba Function1050c8

.asm_11572
	ld a, BANK(s0_abfa)
	call GetSRAMBank
	ld hl, Buffer1
	ld a, [hli]
	ld [s0_abfa], a
	ld a, [hl]
	ld [s0_abfa + 1], a
	call CloseSRAM
	ret
; 11586

Function11586: ; 11586
	cp $ff
	jr z, .asm_11595
	ld c, a
	ld a, [hl]
	sub c
	jr nc, .asm_11590
	xor a

.asm_11590
	ld [hl], a
	jr z, .asm_11595
	xor a
	ret

.asm_11595
	xor a
	ld [hl], a
	scf
	ret
; 11599

Function11599: ; 11599
	ld a, [wcfd7]
	and a
	jr nz, Function115cc
	ld a, [wcfd6]
	and a
	jr nz, Function115cc
	ld a, [wcfd5]
	jr nz, Function115cc
	ld a, [wcfd4]
	ret
; 115ae

Function115ae: ; 115ae
	ld a, [wcfd7]
	and a
	jr nz, Function115cc
	ld a, [wcfd6]
	and a
	jr nz, Function115cc
	ld a, [wcfd5]
	ret
; 115be

Function115be: ; 115be
	ld a, [wcfd7]
	and a
	jr nz, Function115cc
	ld a, [wcfd6]
	ret
; 115c8

Function115c8: ; 115c8
	ld a, [wcfd7]
	ret
; 115cc

Function115cc: ; 115cc
	ld a, $ff
	ret
; 115cf

Function115cf: ; 115cf
	xor a
	jr Function11605
; 115d2

Function115d2: ; 115d2
	inc hl
	xor a
	jr Function115f8
; 115d6

Function115d6: ; 115d6
rept 2
	inc hl
endr
	xor a
	jr Function115eb
; 115db

Function115db: ; 115db
rept 3
	inc hl
endr
	ld a, [hSeconds]
	ld c, a
	sub [hl]
	jr nc, .asm_115e6
	add 60
.asm_115e6
	ld [hl], c
	dec hl
	ld [wcfd4], a

Function115eb: ; 115eb
	ld a, [hMinutes]
	ld c, a
	sbc [hl]
	jr nc, .asm_115f3
	add 60
.asm_115f3
	ld [hl], c
	dec hl
	ld [wcfd5], a

Function115f8: ; 115f8
	ld a, [hHours]
	ld c, a
	sbc [hl]
	jr nc, .asm_11600
	add 24
.asm_11600
	ld [hl], c
	dec hl
	ld [wcfd6], a

Function11605
	ld a, [CurDay]
	ld c, a
	sbc [hl]
	jr nc, .skip
	add 20 * 7
.skip
	ld [hl], c
	ld [wcfd7], a
	ret
; 11613

Function11613: ; 11613
	ld a, [CurDay]
	ld [hli], a
	ld a, [hHours]
	ld [hli], a
	ld a, [hMinutes]
	ld [hli], a
	ld a, [hSeconds]
	ld [hli], a
	ret
; 11621

Function11621: ; 11621
	ld a, [CurDay]
	ld [hl], a
	ret
; 11626

Function11626: ; 11626
	ld a, [CurDay]
	ld [hli], a
	ld a, [hHours]
	ld [hli], a
	ret
; 1162e

Function1162e: ; 1162e
	ld a, [CurDay]
	ld [hli], a
	ld a, [hHours]
	ld [hli], a
	ld a, [hMinutes]
	ld [hli], a
	ret
; 11639