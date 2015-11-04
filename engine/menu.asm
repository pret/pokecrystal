Function2400e:: ; 2400e
	ld hl, Function1c66
	ld a, [wcf94]
	rst FarCall
	call Function24085
	call UpdateSprites
	call Function321c
	call Function2408f
	ret
; 24022

Function24022:: ; 24022
	ld hl, Function1c66
	ld a, [wcf94]
	rst FarCall
	call Function24085
	callba MobileTextBorder
	call UpdateSprites
	call Function321c
	call Function2408f
	ret
; 2403c

Function2403c:: ; 2403c
	ld hl, Function1c66
	ld a, [wcf94]
	rst FarCall
	call Function24085
	callba MobileTextBorder
	call UpdateSprites
	call Function321c
	call Function2411a
	ld hl, wcfa5
	set 7, [hl]
.asm_2405a
	call DelayFrame
	callba Function10032e
	ld a, [wcd2b]
	and a
	jr nz, .asm_24076
	call Function241ba
	ld a, [wcfa8]
	and c
	jr z, .asm_2405a
	call Function24098
	ret

.asm_24076
	ld a, [wcfa4]
	ld c, a
	ld a, [wcfa3]
	call SimpleMultiply
	ld [wMenuCursorBuffer], a
	and a
	ret
; 24085



Function24085: ; 24085
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call Function240db
	ret
; 2408f

Function2408f: ; 2408f
	call Function2411a
	call Function1bc9
	call Function1ff8

Function24098: ; 24098
	ld a, [wMenuData2Flags]
	bit 1, a
	jr z, .asm_240a6
	call Function1bdd
	bit 2, a
	jr nz, .asm_240c9

.asm_240a6
	ld a, [wMenuData2Flags]
	bit 0, a
	jr nz, .asm_240b4
	call Function1bdd
	bit 1, a
	jr nz, .asm_240cb

.asm_240b4
	ld a, [wcfa4]
	ld c, a
	ld a, [MenuSelection2]
	dec a
	call SimpleMultiply
	ld c, a
	ld a, [wcfaa]
	add c
	ld [wMenuCursorBuffer], a
	and a
	ret

.asm_240c9
	scf
	ret

.asm_240cb
	scf
	ret
; 240cd

Function240cd: ; 240cd
	ld a, [wMenuData2Items]
	and $f
	ret
; 240d3

Function240d3: ; 240d3
	ld a, [wMenuData2Items]
	swap a
	and $f
	ret
; 240db

Function240db: ; 240db
	ld hl, wcf95
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Function1cc6
	call GetTileCoord
	call Function240d3
	ld b, a
.asm_240eb
	push bc
	push hl
	call Function240cd
	ld c, a
.asm_240f1
	push bc
	ld a, [wcf94]
	call Function201c
	inc de
	ld a, [wcf93]
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_240f1
	pop hl
	ld bc, $28
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_240eb
	ld hl, wcf98
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, [wcf97]
	rst FarCall
	ret
; 2411a


Function2411a: ; 2411a (9:411a)
	call Function1cc6
	ld a, b
	ld [wcfa1], a
	dec c
	ld a, c
	ld [wcfa2], a
	call Function240d3
	ld [wcfa3], a
	call Function240cd
	ld [wcfa4], a
	call Function24179
	call Function2418a
	call Function24193
	ld a, [wcfa4]
	ld e, a
	ld a, [wMenuCursorBuffer]
	ld b, a
	xor a
	ld d, $0
.asm_24146
	inc d
	add e
	cp b
	jr c, .asm_24146
	sub e
	ld c, a
	ld a, b
	sub c
	and a
	jr z, .asm_24157
	cp e
	jr z, .asm_24159
	jr c, .asm_24159
.asm_24157
	ld a, $1
.asm_24159
	ld [wcfaa], a
	ld a, [wcfa3]
	ld e, a
	ld a, d
	and a
	jr z, .asm_24169
	cp e
	jr z, .asm_2416b
	jr c, .asm_2416b
.asm_24169
	ld a, $1
.asm_2416b
	ld [MenuSelection2], a
	xor a
	ld [wcfab], a
	ld [wcfac], a
	ld [wcfad], a
	ret
; 24179

Function24179: ; 24179
	xor a
	ld hl, wcfa5
	ld [hli], a
	ld [hld], a
	ld a, [wMenuData2Flags]
	bit 5, a
	ret z
	set 5, [hl]
	set 4, [hl]
	ret
; 2418a

Function2418a: ; 2418a
	ld a, [wcf93]
	or $20
	ld [wcfa7], a
	ret
; 24193

Function24193: ; 24193
	ld hl, wMenuData2Flags
	ld a, $1
	bit 0, [hl]
	jr nz, .asm_2419e
	or $2

.asm_2419e
	bit 1, [hl]
	jr z, .asm_241a4
	or $4

.asm_241a4
	ld [wcfa8], a
	ret
; 241a8


Function241a8:: ; 241a8
	call Function24329
Function241ab:: ; 241ab
	ld hl, wcfa6
	res 7, [hl]
	ld a, [hBGMapMode]
	push af
	call Function24216
	pop af
	ld [hBGMapMode], a
	ret
; 241ba

Function241ba: ; 241ba
	ld hl, wcfa6
	res 7, [hl]
	ld a, [hBGMapMode]
	push af
	call Function2431a
	call Function24249
	jr nc, .asm_241cd
	call Function24270

.asm_241cd
	pop af
	ld [hBGMapMode], a
	call Function1bdd
	ld c, a
	ret
; 241d5


Function241d5: ; 241d5
	call Function24329
.loop
	call Function2431a
	call Function10402d ; BUG: This function is in another bank.
	                    ; Pointer in current bank (9) is bogus.
	call Function241fa
	jr nc, .done
	call Function24270
	jr c, .done
	ld a, [wcfa5]
	bit 7, a
	jr nz, .done
	call Function1bdd
	ld c, a
	ld a, [wcfa8]
	and c
	jr z, .loop

.done
	ret
; 241fa

Function241fa: ; 241fa
.loop
	call Function24259
	ret c
	ld c, 1
	ld b, 3
	call Function10062d ; BUG: This function is in another bank.
	                    ; Pointer in current bank (9) is bogus.
	ret c
	callba Function100337
	ret c
	ld a, [wcfa5]
	bit 7, a
	jr z, .loop
	and a
	ret
; 24216


Function24216: ; 24216
.asm_24216
	call Function2431a
	call Function24238
	call Function24249
	jr nc, .asm_24237
	call Function24270
	jr c, .asm_24237
	ld a, [wcfa5]
	bit 7, a
	jr nz, .asm_24237
	call Function1bdd
	ld b, a
	ld a, [wcfa8]
	and b
	jr z, .asm_24216

.asm_24237
	ret
; 24238

Function24238: ; 24238
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call WaitBGMap
	pop af
	ld [hOAMUpdate], a
	xor a
	ld [hBGMapMode], a
	ret
; 24249

Function24249: ; 24249
.asm_24249
	call RTC
	call Function24259
	ret c
	ld a, [wcfa5]
	bit 7, a
	jr z, .asm_24249
	and a
	ret
; 24259

Function24259: ; 24259
	ld a, [wcfa5]
	bit 6, a
	jr z, .asm_24266
	callab Function8cf62

.asm_24266
	call JoyTextDelay
	call Function1bdd
	and a
	ret z
	scf
	ret
; 24270

Function24270: ; 24270
	call Function1bdd
	bit 0, a
	jp nz, Function24318
	bit 1, a
	jp nz, Function24318
	bit 2, a
	jp nz, Function24318
	bit 3, a
	jp nz, Function24318
	bit 4, a
	jr nz, .asm_242fa
	bit 5, a
	jr nz, .asm_242dc
	bit 6, a
	jr nz, .asm_242be
	bit 7, a
	jr nz, .asm_242a0
	and a
	ret

.asm_24299: ; 24299
	ld hl, wcfa6
	set 7, [hl]
	scf
	ret

.asm_242a0
	ld hl, MenuSelection2
	ld a, [wcfa3]
	cp [hl]
	jr z, .asm_242ac
	inc [hl]
	xor a
	ret

.asm_242ac
	ld a, [wcfa5]
	bit 5, a
	jr nz, .asm_242ba
	bit 3, a
	jp nz, .asm_24299
	xor a
	ret

.asm_242ba
	ld [hl], $1
	xor a
	ret

.asm_242be
	ld hl, MenuSelection2
	ld a, [hl]
	dec a
	jr z, .asm_242c8
	ld [hl], a
	xor a
	ret

.asm_242c8
	ld a, [wcfa5]
	bit 5, a
	jr nz, .asm_242d6
	bit 2, a
	jp nz, .asm_24299
	xor a
	ret

.asm_242d6
	ld a, [wcfa3]
	ld [hl], a
	xor a
	ret

.asm_242dc
	ld hl, wcfaa
	ld a, [hl]
	dec a
	jr z, .asm_242e6
	ld [hl], a
	xor a
	ret

.asm_242e6
	ld a, [wcfa5]
	bit 4, a
	jr nz, .asm_242f4
	bit 1, a
	jp nz, .asm_24299
	xor a
	ret

.asm_242f4
	ld a, [wcfa4]
	ld [hl], a
	xor a
	ret

.asm_242fa
	ld hl, wcfaa
	ld a, [wcfa4]
	cp [hl]
	jr z, .asm_24306
	inc [hl]
	xor a
	ret

.asm_24306
	ld a, [wcfa5]
	bit 4, a
	jr nz, .asm_24314
	bit 0, a
	jp nz, .asm_24299
	xor a
	ret

.asm_24314
	ld [hl], $1
	xor a
	ret
; 24318

Function24318: ; 24318
	xor a
	ret
; 2431a

Function2431a: ; 2431a
	ld hl, wcfac
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp $ed
	jr nz, Function24329
	ld a, [wcfab]
	ld [hl], a

Function24329: ; 24329
	ld a, [wcfa1]
	ld b, a
	ld a, [wcfa2]
	ld c, a
	call GetTileCoord
	ld a, [wcfa7]
	swap a
	and $f
	ld c, a
	ld a, [MenuSelection2]
	ld b, a
	xor a
	dec b
	jr z, .asm_24348
.asm_24344
	add c
	dec b
	jr nz, .asm_24344

.asm_24348
	ld c, $14
	call AddNTimes
	ld a, [wcfa7]
	and $f
	ld c, a
	ld a, [wcfaa]
	ld b, a
	xor a
	dec b
	jr z, .asm_2435f
.asm_2435b
	add c
	dec b
	jr nz, .asm_2435b

.asm_2435f
	ld c, a
	add hl, bc
	ld a, [hl]
	cp $ed
	jr z, .asm_2436b
	ld [wcfab], a
	ld [hl], $ed

.asm_2436b
	ld a, l
	ld [wcfac], a
	ld a, h
	ld [wcfad], a
	ret
; 24374
