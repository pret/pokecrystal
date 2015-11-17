Elevator:: ; 1342d
	call Function1344a
	call Function1347d
	jr c, .asm_13448
	ld [wd041], a
	call Function134dd
	jr c, .asm_13448
	ld hl, wd041
	cp [hl]
	jr z, .asm_13448
	call Function134c0
	and a
	ret

.asm_13448
	scf
	ret
; 1344a

Function1344a: ; 1344a
	ld a, b
	ld [EngineBuffer1], a
	ld a, e
	ld [wd03f], a
	ld a, d
	ld [wd040], a
	call Function1345a
	ret
; 1345a

Function1345a: ; 1345a
	ld de, OBPals + 8 * 6
	ld bc, 4
	ld hl, wd03f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [EngineBuffer1]
	call GetFarByte
	inc hl
	ld [de], a
	inc de
.asm_1346f
	ld a, [EngineBuffer1]
	call GetFarByte
	ld [de], a
	inc de
	add hl, bc
	cp $ff
	jr nz, .asm_1346f
	ret
; 1347d

Function1347d: ; 1347d
	ld hl, wd03f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [EngineBuffer1]
	call GetFarByte
	ld c, a
	inc hl
	ld a, [BackupMapGroup]
	ld d, a
	ld a, [BackupMapNumber]
	ld e, a
	ld b, $0
.asm_13495
	ld a, [EngineBuffer1]
	call GetFarByte
	cp $ff
	jr z, .asm_134be
rept 2
	inc hl
endr
	ld a, [EngineBuffer1]
	call GetFarByte
	inc hl
	cp d
	jr nz, .asm_134b7
	ld a, [EngineBuffer1]
	call GetFarByte
	inc hl
	cp e
	jr nz, .asm_134b8
	jr .asm_134bb

.asm_134b7
	inc hl

.asm_134b8
	inc b
	jr .asm_13495

.asm_134bb
	xor a
	ld a, b
	ret

.asm_134be
	scf
	ret
; 134c0

Function134c0: ; 134c0
	push af
	ld hl, wd03f
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	pop af
	ld bc, 4
	call AddNTimes
	inc hl
	ld de, BackupWarpNumber
	ld a, [EngineBuffer1]
	ld bc, 3
	call FarCopyBytes
	ret
; 134dd

Function134dd: ; 134dd
	call LoadStandardMenuDataHeader
	ld hl, Elevator_WhichFloorText
	call PrintText
	call Elevator_GetCurrentFloorText
	ld hl, Elevator_MenuDataHeader
	call CopyMenuDataHeader
	call InitScrollingMenu
	call UpdateSprites
	xor a
	ld [wd0e4], a
	call HandleScrollingMenu
	call WriteBackup
	ld a, [wcf73]
	cp $2
	jr z, .asm_1350b
	xor a
	ld a, [wcf77]
	ret

.asm_1350b
	scf
	ret
; 1350d

Elevator_WhichFloorText: ; 0x1350d
	; Which floor?
	text_jump UnknownText_0x1bd2bc
	db "@"
; 0x13512


Elevator_GetCurrentFloorText: ; 13512
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	hlcoord 0, 0
	ld b, 4
	ld c, 8
	call TextBox
	hlcoord 1, 2
	ld de, Elevator_CurrentFloorText
	call PlaceString
	hlcoord 4, 4
	call Elevator_GetCurrentFloorString
	pop af
	ld [Options], a
	ret
; 13537

Elevator_CurrentFloorText: ; 13537
	db "Now on:@"
; 1353f


Elevator_GetCurrentFloorString: ; 1353f
	push hl
	ld a, [wd041]
	ld e, a
	ld d, 0
	ld hl, wd0f1
	add hl, de
	ld a, [hl]
	pop de
	call GetFloorString
	ret
; 13550

Elevator_MenuDataHeader: ; 0x13550
	db $40 ; flags
	db 01, 12 ; start coords
	db 09, 18 ; end coords
	dw Elevator_MenuData2
	db 1 ; default option
; 0x13558

Elevator_MenuData2: ; 0x13558
	db $10 ; flags
	db 4, 0 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, OBPals + 8 * 6
	dba GetElevatorFlorStrings
	dba NULL
	dba NULL
; 13568

GetElevatorFlorStrings: ; 13568
	ld a, [MenuSelection]

GetFloorString: ; 1356b
	push de
	call FloorToString
	ld d, h
	ld e, l
	pop hl
	jp PlaceString
; 13575

FloorToString: ; 13575
	push de
	ld e, a
	ld d, 0
	ld hl, .floors
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	ret
; 13583

.floors
	dw .b4f
	dw .b3f
	dw .b2f
	dw .b1f
	dw ._1f
	dw ._2f
	dw ._3f
	dw ._4f
	dw ._5f
	dw ._6f
	dw ._7f
	dw ._8f
	dw ._9f
	dw ._10f
	dw ._11f
	dw .roof

.b4f
	db "B4F@"
.b3f
	db "B3F@"
.b2f
	db "B2F@"
.b1f
	db "B1F@"
._1f
	db "1F@"
._2f
	db "2F@"
._3f
	db "3F@"
._4f
	db "4F@"
._5f
	db "5F@"
._6f
	db "6F@"
._7f
	db "7F@"
._8f
	db "8F@"
._9f
	db "9F@"
._10f
	db "10F@"
._11f
	db "11F@"
.roof
	db "ROOF@"
; 135db
