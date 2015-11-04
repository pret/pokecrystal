
SECTION "bank45", ROMX, BANK[$45]

	charmap " ", $20 ; revert to ascii

String_114000:
	db "---", 0
String_114004:
	db "CGB-AAAA-00", 0, 0

Unknown_114011: ; 114011
	dw String_114033
	dw String_11403a
	dw String_114043
	dw String_11404e
	dw String_114053
	dw String_114058
	dw String_114062
	dw String_114074
	dw String_11408d
	dw String_11409f
	dw String_1140b8
	dw String_1140e6
	dw String_114110
	dw String_11413f
	dw String_114160
	dw String_114160
	dw String_114163

String_114033: ; 114033
	db "From: ", 0
String_11403a: ; 11403a
	db "Sender: ", 0
String_114043: ; 114043
	db "Reply-To: ", 0
String_11404e: ; 11404e
	db "To: ", 0
String_114053: ; 114053
	db "Cc: ", 0
String_114058: ; 114058
	db "Subject: ", 0
String_114062: ; 114062
	db "MIME-Version: 1.0", 0
String_114074: ; 114074
	db "X-Game-title: XXXXXXXXXX", 0
String_11408d: ; 11408d
	db "X-Game-code: CGB-", 0
String_11409f: ; 11409f
	db "X-GBmail-type: exclusive", 0
String_1140b8: ; 1140b8
	db "Content-Type: text/plain; charset=iso-2022-jp", 0
String_1140e6: ; 1140e6
	db "Content-Type: multipart/mixed; boundary=\"", 0
String_114110: ; 114110
	db "Content-Type: Application/Octet-Stream; name=\"", 0
String_11413f: ; 11413f
	db "Content-Transfer-Encoding:Base64", 0
String_114160: ; 114160
	db "--", 0
String_114163: ; 114163
	db ".", 0
; 114165

Jumptable_114165: ; 114165
	dw Function114268
	dw Function114269
	dw Function11433c
	dw Function1143b7
	dw Function1144d1
	dw Function114b55
	dw Function114bbc
	dw Function114cd9
	dw Function114e62
	dw Function1152b8
	dw Function1154d4
	dw Function1156cc
	dw Function1159fb
; 11417f

Unknown_11417f: ; 11417f
	dw String_114199
	dw String_11419f
	dw String_1141a7
	dw String_1141b1
	dw String_1141b5
	dw String_1141b9
	dw String_1141c2
	dw String_1141c8
	dw String_1141d6
	dw String_1141e4
	dw String_1141ee
	dw String_1141fc
	dw String_114209

String_114199: ; 114199
	db "FROM:", 0
String_11419f: ; 11419f
	db "SENDER:", 0
String_1141a7: ; 1141a7
	db "REPLY-TO:", 0
String_1141b1: ; 1141b1
	db "TO:", 0
String_1141b5: ; 1141b5
	db "CC:", 0
String_1141b9: ; 1141b9
	db "SUBJECT:", 0
String_1141c2: ; 1141c2
	db "DATE:", 0
String_1141c8: ; 1141c8
	db "CONTENT-TYPE:", 0
String_1141d6: ; 1141d6
	db "MIME-VERSION:", 0
String_1141e4: ; 1141e4
	db "X-MAILER:", 0
String_1141ee: ; 1141ee
	db "X-GAME-TITLE:", 0
String_1141fc: ; 1141fc
	db "X-GAME-CODE:", 0
String_114209: ; 114209
	db "X-GBMAIL-TYPE:", 0
; 114218

String_114218: ; 114218
	db "NAME=", 0
String_11421e: ; 11421e
	db "MULTIPART", 0
String_114228: ; 114228
	db "BOUNDARY=", 0
String_114232: ; 114232
	db "=?ISO-2022-JP?B?", 0
; 114243

Function114243:: ; 114243
	ld a, $a
	ld [MBC3SRamEnable], a
	ld a, [$ff8c]
	push af
	push de
	ld a, [wdc02]
	add a
	ld e, a
	ld d, 0
	ld hl, Jumptable_114165
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	jp [hl]
; 11425c

Function11425c: ; 11425c
	ld [wdc02], a
	pop af
rept 2
	ld [$ff8c], a
endr
	ld [$4000], a
	ret
; 114268

Function114268: ; 114268
	ret
; 114269

Function114269: ; 114269
	ld h, d
	ld l, e
	xor a
	ld [wdc02], a
	ld [wdc03], a
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
.asm_114282
	ld a, [de]
	and a
	jr z, .asm_1142a4
	ld h, a
	ld a, [wdc03]
	and a
	jr nz, .asm_114292
	ld a, h
	cp $80
	jr nc, .asm_1142ae

.asm_114292
	ld a, h
	cp $d
	jr z, .asm_1142bb
	xor a
	ld [wdc02], a
.asm_11429b
	inc e
	call z, Function114333
	dec bc
	ld a, b
	or c
	jr nz, .asm_114282

.asm_1142a4
	ld a, [wdc03]
	and a
	jr nz, .asm_114303
	ld b, $80
	jr .asm_1142b0

.asm_1142ae
	ld b, $81

.asm_1142b0
	ld a, [wdc00]
	ld c, a
	ld a, $1
	ld h, d
	ld l, e
	jp Function11425c

.asm_1142bb
	and a
	jr z, .asm_1142a4
	inc e
	call z, Function114333
	dec bc
	ld a, b
	or c
	jr z, .asm_1142a4
	ld a, [de]
	ld h, a
	ld a, [wdc03]
	and a
	jr nz, .asm_1142d4
	ld a, h
	cp $80
	jr nc, .asm_1142ae

.asm_1142d4
	ld a, h
	cp $a
	jr nz, .asm_1142ae
	ld a, [wdc03]
	and a
	jr nz, .asm_11430d
	ld a, [wdc02]
	and a
	jr nz, .asm_114309
	ld a, $1
	ld [wdc02], a
	inc e
	call z, Function114333
	dec bc
	ld a, b
	or c
	jr z, .asm_1142a4
	ld a, [de]
	cp $20
	jr z, .asm_11429b
	cp $9
	jr z, .asm_11429b
	jr .asm_114282

.asm_1142fe
	xor a
	ld b, a
	jp Function11425c

.asm_114303
	xor a
	ld b, $1
	jp Function11425c

.asm_114309
	xor a
	ld [wdc02], a

.asm_11430d
	ld a, [wdc02]
	and a
	jr nz, .asm_1142fe
	ld a, $1
	ld [wdc03], a
	inc e
	call z, Function114333
	dec bc
	ld a, b
	or c
	jr z, .asm_1142a4
	ld a, [de]
	and a
	jp z, .asm_1142a4
	cp $2e
	jp nz, .asm_114282
	ld a, $1
	ld [wdc02], a
	jp .asm_11429b
; 114333

Function114333: ; 114333
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	ret
; 11433c

Function11433c: ; 11433c
	push de
	ld h, d
	ld l, e
	ld c, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, $b
	call Function1143f3
	cp $2
	jr z, .asm_114358
	and a
	jr z, .asm_114360
	pop hl
.asm_114351
	xor a
	ld b, $3
	jp Function11425c

.asm_114357
	pop hl

.asm_114358
	pop hl
	ld a, $1
	ld b, $82
	jp Function11425c

.asm_114360
	ld a, h
	ld [wdc03], a
	pop hl
	push bc
	push de
	ld c, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld b, $c
	call Function1143f3
	cp $2
	jr z, .asm_114357
	and a
	jr z, .asm_114381
	xor a
	ld b, $2
	pop hl
	pop hl
	jp Function11425c

.asm_114381
	pop de
	pop bc
	ld a, [wdc03]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	call Function114c0b
	ld hl, String_114004
.asm_114394
	ld de, wdc24
.asm_114397
	ld a, [hli]
	and a
	jr z, .asm_1143ad
	ld b, a
	ld a, [de]
	inc de
	cp b
	jr z, .asm_114397
.asm_1143a1
	ld a, [hli]
	and a
	jr nz, .asm_1143a1
	ld a, [hl]
	and a
	jr nz, .asm_114394
	ld b, a
	jp Function11425c

.asm_1143ad
	ld a, [de]
	and a
	jr nz, .asm_114351
	xor a
	ld b, $1
	jp Function11425c
; 1143b7

Function1143b7: ; 1143b7
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld h, a
	inc de
	ld a, [de]
	inc de
	push de
	ld d, a
	ld e, h
	call Function1143f3
	cp $2
	jr z, .asm_1143eb
	and a
	jr nz, .asm_1143ed
	ld a, h
	pop hl
	push af
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld [hl], b
	xor a
	jp Function11425c

.asm_1143eb
	ld b, $82

.asm_1143ed
	ld a, $1
	pop hl
	jp Function11425c
; 1143f3

Function1143f3: ; 1143f3
	call Function114412
	and a
	jr nz, .asm_11440d
	ld a, $4
	cp b
	jr c, .asm_114407
	jr z, .asm_114402
.asm_114400
	xor a
	ret

.asm_114402
	ld a, $0
	cp c
	jr nc, .asm_114400

.asm_114407
	ld bc, VBlank5
	ld a, $2
	ret

.asm_11440d
	ld a, $1
	ld b, $84
	ret
; 114412

Function114412: ; 114412
	ld a, c
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld hl, Unknown_11417f
	ld a, b
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, $0
	jr .asm_11444a

.asm_11442b
	ld a, [de]
	and a
	jp z, .asm_1144c2
	inc e
	call z, Function1144c8
	cp $d
	jr nz, .asm_11442b
	ld a, [de]
	inc e
	call z, Function1144c8
	cp $a
	jr nz, .asm_11442b
	ld a, [de]
	cp $2e
	jr z, .asm_1144ae
	cp $d
	jr z, .asm_1144b8

.asm_11444a
	ld a, [wdc00]
	ld [wdc02], a
	ld a, [de]
	and a
	jr z, .asm_1144c2
	inc e
	call z, Function1144c8
	cp $61
	jr c, .asm_114462
	cp $7b
	jr nc, .asm_114462
	sub $20

.asm_114462
	ld b, a
	ld a, [hl]
	and a
	jr z, .asm_114476
	cp b
	jr nz, .asm_11446e
	inc c
	inc hl
	jr .asm_11444a

.asm_11446e
	ld a, c
	and a
	jr z, .asm_11442b
	dec c
	dec hl
	jr .asm_11446e

.asm_114476
	ld a, $20
	cp b
	jr z, .asm_114481
	ld a, $a
	cp b
	jr z, .asm_114481
	dec de

.asm_114481
	ld h, d
	ld l, e
	ld bc, NULL
.asm_114486
	ld a, [de]
	and a
	jr z, .asm_1144c2
	inc bc
	inc e
	call z, Function1144c8
	cp $d
	jr nz, .asm_114486
	ld a, [de]
	inc bc
	inc e
	call z, Function1144c8
	cp $a
	jr nz, .asm_114486
	ld a, [de]
	cp $20
	jr z, .asm_114486
	cp $9
	jr z, .asm_114486
	ld d, h
	ld e, l
	ld a, [wdc02]
	ld h, a
	xor a
	ret

.asm_1144ae
	inc e
	call z, Function1144c8
	ld a, [de]
	cp $d
	jp nz, .asm_11442b

.asm_1144b8
	inc e
	call z, Function1144c8
	ld a, [de]
	cp $a
	jp nz, .asm_11442b

.asm_1144c2
	ld a, $0
	ld [hl], a
	ld a, $1
	ret
; 1144c8

Function1144c8: ; 1144c8
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	ret
; 1144d1

Function1144d1: ; 1144d1
	call Function114561
rept 2
	dec de
endr
	push de
rept 3
	inc de
endr
	inc hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc hl
	ld a, [de]
	ld [hld], a
	dec de
	ld a, [de]
	ld [hl], a
	xor a
	ld [BigDoll], a
	ld [wdc17], a
	ld a, $2
	ld [wdc0e], a
	ld hl, wdc03
	ld c, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Function114576
	cp $2
	jr z, .asm_11455b
	and a
	jr z, .asm_114511
	ld a, $1
	ld [wdc0d], a
	call Function1146fa
	and a
	jr nz, .asm_11455b
	jr .asm_11451c

.asm_114511
	call Function1146a4
	and a
	jr nz, .asm_11455b
	ld a, $2
	ld [wdc0d], a

.asm_11451c
	pop hl
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [wdc0d]
	ld [de], a
	ld b, $0
	ld a, [BigDoll]
	and a
	jr z, .asm_114537
	ld b, $1

.asm_114537
	ld hl, wdc06
	ld a, [hl]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld hl, wdc09
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec de
	ld a, d
	or e
	jr z, .asm_114559
	ld hl, wCurrMapTriggerCount
	ld e, [hl]
	inc hl
	ld d, [hl]
	xor a
	ld [de], a
	jp Function11425c

.asm_114559
	ld b, $83

.asm_11455b
	pop hl
	ld a, $1
	jp Function11425c
; 114561

Function114561: ; 114561
	ld hl, wdc03
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ret
; 114576

Function114576: ; 114576
	xor a
	ld [Bed], a
	ld b, $7
	call Function1143f3
	cp $2
	jr z, .asm_1145b6
	and a
	jr nz, .asm_1145b4
	ld a, h
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	push hl
	push de
	push bc
	ld hl, wdc24
	call Function115d53
	call Function1145c5
	pop bc
	pop de
	pop hl
	and a
	jr z, .asm_1145bf
	ld a, b
	and a
	jr nz, .asm_1145ba
	ld a, h
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld hl, String_114218
	call Function114acf

.asm_1145b4
	xor a
	ret

.asm_1145b6
	ld b, $82
	jr .asm_1145bc

.asm_1145ba
	ld b, $81

.asm_1145bc
	ld a, $2
	ret

.asm_1145bf
	ld a, $1
	ld [Bed], a
	ret
; 1145c5

Function1145c5: ; 1145c5
	ld hl, wdc24
	ld de, String_11421e
	ld c, $0
.asm_1145cd
	ld a, [hli]
	and a
	jr z, .asm_1145ef
	cp $20
	jr z, .asm_1145cd
	cp $d
	jr z, .asm_1145f8
	cp $61
	jr c, .asm_1145e3
	cp $7b
	jr nc, .asm_1145e3
	sub $20

.asm_1145e3
	ld b, a
	ld a, [de]
	and a
	jr z, .asm_11460e
	inc de
	cp b
	jr z, .asm_1145cd
	dec de
	jr .asm_1145cd

.asm_1145ef
	ld b, $0
	jr .asm_1145f5

.asm_1145f3
	ld b, $81

.asm_1145f5
	ld a, $1
	ret

.asm_1145f8
	ld a, [hli]
	and a
	jr z, .asm_1145f3
	cp $a
	jr nz, .asm_1145f3
	ld a, [hli]
	and a
	jr z, .asm_1145f3
	cp $20
	jr z, .asm_1145cd
	cp $9
	jr z, .asm_1145cd
	jr .asm_1145f3

.asm_11460e
	ld a, c
	and a
	jr nz, .asm_114619
	ld c, $1
	ld de, String_114228
	jr .asm_1145cd

.asm_114619
	dec hl
	ld a, [hl]
	cp $22
	jr nz, .asm_114620
	inc hl

.asm_114620
	ld de, $ddc8
	ld b, $0
	ld c, $40
.asm_114627
	ld a, [hli]
	cp $22
	jr z, .asm_114636
	cp $d
	jr z, .asm_114636
	ld [de], a
	inc de
	inc b
	dec c
	jr nz, .asm_114627

.asm_114636
	ld a, b
	ld [PartyMon5Defense], a
	xor a
	ret
; 11463c

Function11463c: ; 11463c
	ld a, [wdc00]
	push af
	push de
	ld hl, $ddc8
	ld a, [PartyMon5Defense]
	ld b, a
.asm_114648
	ld a, [de]
	ld c, a
	ld a, [hli]
	cp c
	jr nz, .asm_11468a
	inc e
	call z, Function11469b
	dec b
	jr nz, .asm_114648
	ld a, [de]
	cp $2d
	jr z, .asm_114673
	cp $d
	jr nz, .asm_11468a
	xor a
	ld [Carpet], a
.asm_114662
	inc e
	call z, Function11469b
	ld a, [de]
	cp $a
	jr nz, .asm_11468a
	inc e
	call z, Function11469b
	xor a
	pop hl
	pop hl
	ret

.asm_114673
	inc e
	call z, Function11469b
	ld a, [de]
	cp $2d
	jr nz, .asm_11468a
	inc e
	call z, Function11469b
	ld a, $1
	ld [Carpet], a
	ld a, [de]
	cp $d
	jr z, .asm_114662

.asm_11468a
	pop de
	pop af
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	xor a
	ld [Carpet], a
	ld a, $1
	ret
; 11469b

Function11469b: ; 11469b
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	ret
; 1146a4

Function1146a4: ; 1146a4
	call Function114867
	and a
	jr nz, .asm_1146e4
	ld hl, wdc03
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Function114a18
	and a
	jr nz, .asm_1146e8
	call Function1148c2
	and a
	jr nz, .asm_1146e4
	ld hl, wdc03
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Function114a7a
	and a
	jr nz, .asm_1146e8
.asm_1146da
rept 2
	dec bc
endr
	call Function1149cc
	and a
	jr nz, .asm_1146e4
	xor a
	ret

.asm_1146e4
	ld b, $83
	jr .asm_1146f7

.asm_1146e8
	ld a, [wdc17]
	and a
	jr z, .asm_1146f5
	ld a, $1
	ld [BigDoll], a
	jr .asm_1146da

.asm_1146f5
	ld b, $81

.asm_1146f7
	ld a, $1
	ret
; 1146fa

Function1146fa: ; 1146fa
	call Function114867
	and a
	jp nz, .asm_11478a
	ld hl, wdc03
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Function114a18
	and a
	jp nz, .asm_11478e
	call Function1149cc
	and a
	jp nz, .asm_11478a
	ld a, $1
	ld [wdc0e], a
	ld a, [wdc00]
	ld [$ff8c], a
	ld [$4000], a
	ld a, $1
	ld [RightOrnament], a
	call Function1147cd
	and a
	jp nz, .asm_1147b7
.asm_114737
	call Function114843
	cp $1
	jr nz, .asm_114749
	ld a, [wdc17]
	and a
	jr z, .asm_114794
	ld a, $1
	ld [BigDoll], a

.asm_114749
	call Function11494d
	and a
	jr nz, .asm_11478a
	ld a, [BigDoll]
	and a
	jr nz, .asm_114786
	ld hl, wdc03
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Function1147cd
	and a
	jr nz, .asm_1147b7
	ld a, [wdc0e]
	cp $3
	jr nz, .asm_114773
rept 2
	dec bc
endr

.asm_114773
	call Function1149cc
	and a
	jr nz, .asm_11478a
	ld a, [wdc0d]
	inc a
	ld [wdc0d], a
	ld a, [BigDoll]
	and a
	jr z, .asm_114799

.asm_114786
	ld b, $1
	jr .asm_1147cb

.asm_11478a
	ld b, $83
	jr .asm_114796

.asm_11478e
	ld a, [wdc17]
	and a
	jr nz, .asm_114796

.asm_114794
	ld b, $81

.asm_114796
	ld a, $1
	ret

.asm_114799
	ld a, [Carpet]
	and a
	jr z, .asm_114737
	jr .asm_1147cb

	ld hl, wdc03
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	call Function114a7a
	and a
	jr z, .asm_1147cb
	xor a
	ld [BigDoll], a

.asm_1147b7
	ld a, [wdc17]
	and a
	jr z, .asm_114794
	ld a, $1
	ld [BigDoll], a
	ld a, [wdc0d]
	cp $1
	jr nz, .asm_114773
	ld b, $1

.asm_1147cb
	xor a
	ret
; 1147cd

Function1147cd: ; 1147cd
	ld bc, NULL
	ld a, [RightOrnament]
	and a
	jr nz, .asm_11480c
.asm_1147d6
	ld a, [de]
	and a
	jr z, .asm_11482f
	inc e
	call z, Function11483a
	inc bc
	cp $d
	jr nz, .asm_1147d6
	ld a, [de]
	cp $a
	jr nz, .asm_11482f
.asm_1147e8
	inc bc
	inc e
	call z, Function11483a
	ld a, [de]
	cp $20
	jr z, .asm_114827
	cp $9
	jr z, .asm_114827
	cp $d
	jr nz, .asm_11482b
	inc e
	call z, Function11483a
	ld a, [de]
	cp $a
	jr nz, .asm_11482f
	inc e
	call z, Function11483a
	ld a, h
	and a
	jr z, .asm_11480c
	dec bc

.asm_11480c
	ld a, [de]
	cp $2d
	jr nz, .asm_1147d6
	inc e
	call z, Function11483a
	ld a, [de]
	cp $2d
	jr nz, .asm_1147d6
	inc e
	call z, Function11483a
	push bc
	call Function11463c
	pop bc
	and a
	jr nz, .asm_1147d6
	ret

.asm_114827
	ld h, $1
	jr .asm_1147e8

.asm_11482b
	ld h, $0
	jr .asm_11480c

.asm_11482f
	and a
	jr nz, .asm_114837
	ld a, $1
	ld [wdc17], a

.asm_114837
	ld a, $1
	ret
; 11483a

Function11483a: ; 11483a
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	ret
; 114843

Function114843: ; 114843
	ld a, [wdc00]
	push af
	push de
	ld [$ff8c], a
	ld [$4000], a
	call Function114a18
	and a
	jr nz, .asm_11485f
	pop de
	pop af
	ld [wdc00], a
	ld hl, String_114218
	call Function114acf
	ret

.asm_11485f
	pop de
	pop af
	ld [wdc00], a
	ld a, $1
	ret
; 114867

Function114867: ; 114867
	ld hl, wdc06
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, $2
	ld [de], a
	inc e
	call z, Function1148b9
	ld a, $1
	ld [de], a
	inc e
	call z, Function1148b9
	ld hl, wdc03
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function1148b9
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function1148b9
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function1148b9
	ld hl, wdc06
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld d, $5
.asm_1148a9
	dec bc
	ld a, b
	or c
	jr z, .asm_1148b6
	dec d
	jr nz, .asm_1148a9
	ld [hl], b
	dec hl
	ld [hl], c
	xor a
	ret

.asm_1148b6
	ld a, $1
	ret
; 1148b9

Function1148b9: ; 1148b9
	push bc
	ld bc, wCurrentMapSignpostCount
	call Function115d80
	pop bc
	ret
; 1148c2

Function1148c2: ; 1148c2
	ld hl, wdc06
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, c
	ld [de], a
	inc e
	call z, Function114944
	ld a, b
	ld [de], a
	inc e
	call z, Function114944
	ld a, [wdc0e]
	ld [de], a
	inc e
	call z, Function114944
	cp $3
	jr nz, .asm_114904
	ld hl, Plant
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function114944
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function114944
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function114944
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function114944

.asm_114904
	ld hl, wdc03
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function114944
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function114944
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function114944
	ld hl, wdc06
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, [wdc0e]
	cp $3
	jr z, .asm_114932
	ld d, $6
	jr .asm_114934

.asm_114932
	ld d, $a

.asm_114934
	dec bc
	ld a, b
	or c
	jr z, .asm_114941
	dec d
	jr nz, .asm_114934
	ld [hl], b
	dec hl
	ld [hl], c
	xor a
	ret

.asm_114941
	ld a, $1
	ret
; 114944

Function114944: ; 114944
	push bc
	ld bc, wCurrentMapSignpostCount
	call Function115d80
	pop bc
	ret
; 11494d

Function11494d: ; 11494d
	ld hl, wdc06
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [wdc0e]
	ld [de], a
	inc e
	call z, Function1149c3
	cp $3
	jr nz, .asm_114983
	ld hl, Plant
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function1149c3
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function1149c3
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function1149c3
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function1149c3

.asm_114983
	ld hl, wdc03
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function1149c3
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function1149c3
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function1149c3
	ld hl, wdc06
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, [wdc0e]
	cp $3
	jr z, .asm_1149b1
	ld d, $4
	jr .asm_1149b3

.asm_1149b1
	ld d, $8

.asm_1149b3
	dec bc
	ld a, b
	or c
	jr z, .asm_1149c0
	dec d
	jr nz, .asm_1149b3
	ld [hl], b
	dec hl
	ld [hl], c
	xor a
	ret

.asm_1149c0
	ld a, $1
	ret
; 1149c3

Function1149c3: ; 1149c3
	push bc
	ld bc, wCurrentMapSignpostCount
	call Function115d80
	pop bc
	ret
; 1149cc

Function1149cc: ; 1149cc
	ld hl, wdc06
	ld a, [hl]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	push de
	ld hl, wdc09
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec de
	ld a, d
	or e
	jr z, .asm_114a0b
	dec de
	ld a, d
	or e
	jr z, .asm_114a0b
	ld [hl], d
	dec hl
	ld [hl], e
	ld hl, wCurrMapTriggerCount
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, c
	ld [de], a
	inc e
	call z, Function114a0f
	ld a, b
	ld [de], a
	inc e
	call z, Function114a0f
	ld hl, wdc06
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	xor a
	ret

.asm_114a0b
	pop de
	ld a, $1
	ret
; 114a0f

Function114a0f: ; 114a0f
	push bc
	ld bc, wCurrentMapSignpostCount
	call Function115d80
	pop bc
	ret
; 114a18

Function114a18: ; 114a18
	ld bc, NULL
	ld h, b
.asm_114a1c
	inc bc
	ld a, [de]
	and a
	jr z, .asm_114a66
	inc e
	call z, Function114a71
	cp $d
	jr nz, .asm_114a1c
	ld a, [de]
	cp $a
	jr nz, .asm_114a66
.asm_114a2e
	inc bc
	inc e
	call z, Function114a71
	ld a, [de]
	cp $20
	jr z, .asm_114a5e
	cp $9
	jr z, .asm_114a5e
	cp $d
	jr nz, .asm_114a62
	inc e
	call z, Function114a71
	ld a, [de]
	cp $a
	jr nz, .asm_114a66
	inc e
	call z, Function114a71
	ld a, h
	and a
	jr z, .asm_114a52
	dec bc

.asm_114a52
	ld hl, wdc03
	ld a, [wdc00]
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ret

.asm_114a5e
	ld h, $1
	jr .asm_114a2e

.asm_114a62
	ld h, $0
	jr .asm_114a1c

.asm_114a66
	and a
	jr nz, .asm_114a6e
	ld a, $1
	ld [wdc17], a

.asm_114a6e
	ld a, $1
	ret
; 114a71

Function114a71: ; 114a71
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	ret
; 114a7a

Function114a7a: ; 114a7a
	ld bc, NULL
.asm_114a7d
	inc bc
	ld a, [de]
	and a
	jr z, .asm_114abb
	inc e
	call z, Function114ac6
	cp $d
	jr nz, .asm_114a7d
	ld a, [de]
	cp $a
	jr nz, .asm_114abb
	inc e
	call z, Function114ac6
	inc bc
	ld a, [de]
	cp $2e
	jr nz, .asm_114a7d
	inc e
	call z, Function114ac6
	ld a, [de]
	cp $d
	jr nz, .asm_114a7d
	inc e
	call z, Function114ac6
	ld a, [de]
	cp $a
	jr nz, .asm_114abb
	inc e
	call z, Function114ac6
	ld hl, wdc03
	ld a, [wdc00]
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ret

.asm_114abb
	and a
	jr nz, .asm_114ac3
	ld a, $1
	ld [wdc17], a

.asm_114ac3
	ld a, $1
	ret
; 114ac6

Function114ac6: ; 114ac6
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	ret
; 114acf

Function114acf: ; 114acf
.asm_114acf
	push hl
	push bc
.asm_114ad1
	ld a, [hl]
	ld b, a
	ld a, [de]
	inc e
	call z, Function114b4c
	cp $61
	jr c, .asm_114ae2
	cp $7b
	jr nc, .asm_114ae2
	sub $20

.asm_114ae2
	cp b
	jr z, .asm_114af4
	pop bc
	dec bc
	push bc
	ld a, b
	or c
	jr nz, .asm_114ad1
.asm_114aec
	ld a, $2
	ld [wdc0e], a
	pop bc
	pop hl
	ret

.asm_114af4
	inc hl
.asm_114af5
	ld a, [hli]
	and a
	jr z, .asm_114b19
	ld b, a
	ld a, [de]
	inc e
	call z, Function114b4c
	cp $61
	jr c, .asm_114b09
	cp $7b
	jr nc, .asm_114b09
	sub $20

.asm_114b09
	cp b
	jr nz, .asm_114b15
	pop bc
	dec bc
	push bc
	ld a, b
	or c
	jr nz, .asm_114af5
	jr .asm_114aec

.asm_114b15
	pop bc
	pop hl
	jr .asm_114acf

.asm_114b19
	ld b, $0
	ld c, $40
	ld a, [de]
	cp $22
	jr nz, .asm_114b26
	inc e
	call z, Function114b4c

.asm_114b26
	ld hl, Plant
	ld a, [wdc00]
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
.asm_114b31
	ld a, [de]
	cp $22
	jr z, .asm_114b42
	cp $d
	jr z, .asm_114b42
	inc e
	call z, Function114b4c
	inc b
	dec c
	jr nz, .asm_114b31

.asm_114b42
	ld [hl], b
	pop bc
	pop hl
	ld a, $3
	ld [wdc0e], a
	xor a
	ret
; 114b4c

Function114b4c: ; 114b4c
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	ret
; 114b55

Function114b55: ; 114b55
	call Function114561
	ld b, $0
	ld hl, wdc03
	ld c, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wdc24
.asm_114b65
	push de
	push bc
	push hl
	call Function1143f3
	cp $2
	jr z, .asm_114bb2
	and a
	jr nz, .asm_114b8c
	ld a, h
	pop hl
	inc hl
	ld [hld], a
	ld a, $1
	ld [hli], a
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], c
	inc hl
	ld [hl], b
	inc hl
.asm_114b82
	pop bc
	pop de
	inc b
	ld a, b
	cp $d
	jr z, .asm_114b96
	jr .asm_114b65

.asm_114b8c
	pop hl
	xor a
rept 6
	ld [hli], a
endr
	jr .asm_114b82

.asm_114b96
	ld hl, wdc06
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld bc, $004e
	ld hl, wdc24
	call Function115d6a
	jp Function11425c

.asm_114bb2
	ld a, $1
	pop bc
	pop bc
	pop bc
	ld b, $82
	jp Function11425c
; 114bbc

Function114bbc: ; 114bbc
	ld h, d
	ld l, e
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	inc hl
	push hl
	call Function1143f3
	cp $2
	jr z, .asm_114c03
	and a
	jr nz, .asm_114bff
	ld a, h
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	call Function114c0b
	ld hl, wdc24
	call Function114c5e
	ld a, b
	or c
	jr z, .asm_114bff
	pop hl
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wdc24
	push bc
	call Function115d6a
	pop hl
	jp Function11425c

.asm_114bff
	ld b, $84
	jr .asm_114c05

.asm_114c03
	ld b, $82

.asm_114c05
	ld a, $1
	pop hl
	jp Function11425c
; 114c0b

Function114c0b: ; 114c0b
	ld hl, wdc24
	push bc
	call Function115d53
	pop bc
	ld hl, wdc24
	ld d, h
	ld e, l
.asm_114c18
	ld a, [hli]
	cp $d
	jr z, .asm_114c34
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_114c18
.asm_114c24
	xor a
	ld [de], a
	ld hl, wdc24
	ld bc, NULL
.asm_114c2c
	ld a, [hli]
	inc bc
	and a
	jr nz, .asm_114c2c
	dec bc
	xor a
	ret

.asm_114c34
	dec bc
	ld a, b
	or c
	jr z, .asm_114c24
	ld a, [hli]
	cp $a
	jr nz, .asm_114c18
	dec bc
	ld a, b
	or c
	jr z, .asm_114c24
	ld a, [hli]
	cp $20
	jr z, .asm_114c4e
	cp $9
	jr z, .asm_114c4e
	jr .asm_114c24

.asm_114c4e
	dec bc
	ld a, b
	or c
	jr z, .asm_114c24
	jr .asm_114c18
; 114c55

Function114c55: ; 114c55
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	ret
; 114c5e

Function114c5e: ; 114c5e
	ld de, PartyMon5Defense
	push hl
.asm_114c62
	ld a, [hli]
	ld [de], a
	inc de
	and a
	jr z, .asm_114cc6
	cp $3d
	jr nz, .asm_114c62
	ld a, [hli]
	ld [de], a
	inc de
	cp $3f
	jr nz, .asm_114c62
rept 2
	dec de
endr
.asm_114c75
	ld a, [hli]
	cp $3f
	jr nz, .asm_114c75
	ld a, [hli]
	cp $42
	jr nz, .asm_114cb8
	inc hl
	ld bc, NULL
	push hl
.asm_114c84
	inc bc
	ld a, [hli]
	cp $3f
	jr nz, .asm_114c84
	inc bc
	ld a, [hli]
	cp $3d
	jr nz, .asm_114c84
rept 2
	dec bc
endr
	ld a, l
	ld [wdc03], a
	ld a, h
	ld [wdc04], a
	pop hl
	push de
	call Function115c49
	pop de
	ld h, d
	ld l, e
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.asm_114ca6
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_114ca6
	ld a, [wdc03]
	ld l, a
	ld a, [wdc04]
	ld h, a
	jr .asm_114c62

.asm_114cb8
	ld a, $3d
	ld [de], a
	inc de
	ld a, $3f
	ld [de], a
	inc de
.asm_114cc0
	ld a, [hli]
	ld [de], a
	inc de
	and a
	jr nz, .asm_114cc0

.asm_114cc6
	ld [de], a
	pop hl
	ld de, PartyMon5Defense
	ld bc, NULL
.asm_114cce
	inc bc
	ld a, [de]
	ld [hli], a
	inc de
	and a
	jr z, .asm_114cd7
	jr .asm_114cce

.asm_114cd7
	dec bc
	ret
; 114cd9

Function114cd9: ; 114cd9
	ld h, d
	ld l, e
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	push hl
	call Function1143f3
	and a
	jr nz, .asm_114d33
	ld [wdc03], a
	ld [wdc04], a
	ld a, h
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld hl, wdc24
	call Function114d39
	ld hl, wdc24
	call Function114d99
	pop hl
	push hl
rept 4
	inc hl
endr
	ld a, [hld]
	cp b
	jr c, .asm_114d2d
	jr z, .asm_114d29
.asm_114d11
	pop hl
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, PartyMon5Defense
	call Function115d6a
	xor a
	jp Function11425c

.asm_114d29
	ld a, [hli]
	cp c
	jr nc, .asm_114d11

.asm_114d2d
	ld b, $83
	jr .asm_114d33

	ld b, $82

.asm_114d33
	pop hl
	ld a, $1
	jp Function11425c
; 114d39

Function114d39: ; 114d39
.asm_114d39
	ld a, [wdc04]
	and a
	jr nz, .asm_114d4a
	ld a, [de]
	cp $28
	jr z, .asm_114d55
	cp $22
	jr z, .asm_114d55
	jr .asm_114d7f

.asm_114d4a
	ld a, [de]
	cp $29
	jr z, .asm_114d5f
	cp $22
	jr z, .asm_114d6f
	jr .asm_114d84

.asm_114d55
	ld [wdc03], a
	ld a, $1
	ld [wdc04], a
	jr .asm_114d84

.asm_114d5f
	ld a, [wdc03]
	cp $28
	jr nz, .asm_114d84
	xor a
	ld [wdc03], a
	ld [wdc04], a
	jr .asm_114d84

.asm_114d6f
	ld a, [wdc03]
	cp $22
	jr nz, .asm_114d84
	xor a
	ld [wdc03], a
	ld [wdc04], a
	jr .asm_114d84

.asm_114d7f
	cp $20
	jr z, .asm_114d84
	ld [hli], a

.asm_114d84
	dec bc
	ld a, b
	or c
	jr z, .asm_114d96
	inc e
	jr nz, .asm_114d39
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	jr .asm_114d39

.asm_114d96
	xor a
	ld [hli], a
	ret
; 114d99

Function114d99: ; 114d99
	ld de, PartyMon5Defense
	xor a
	ld [de], a
.asm_114d9e
	ld a, [hli]
	call Function114df1
	and a
	jr z, .asm_114dde
	cp $40
	jr nz, .asm_114d9e
	dec hl
.asm_114daa
	dec hl
	ld a, [hl]
	call Function114e2d
	and a
	jr z, .asm_114daa
	inc hl
	push hl
	ld b, $0
.asm_114db6
	ld a, [hli]
	cp $40
	jr z, .asm_114dc1
	call Function114e2d
	and a
	jr nz, .asm_114dc4

.asm_114dc1
	inc b
	jr .asm_114db6

.asm_114dc4
	pop hl
	ld a, [PartyMon5Defense]
	and a
	jr z, .asm_114dd2
	ld a, $2c
	inc de
	ld [de], a
	ld a, [PartyMon5Defense]

.asm_114dd2
	inc a
	ld [PartyMon5Defense], a
.asm_114dd6
	inc de
	ld a, [hli]
	ld [de], a
	dec b
	jr nz, .asm_114dd6
	jr .asm_114d9e

.asm_114dde
	inc de
	xor a
	ld [de], a
	ld a, $dd
	cpl
	ld h, a
	ld a, $c8
	cpl
	ld l, a
	inc hl
	add hl, de
	ld b, h
	ld c, l
rept 2
	inc bc
endr
	xor a
	ret
; 114df1

Function114df1: ; 114df1
	cp $1b
	ret nz
	ld a, [hli]
	and a
	jr z, .asm_114e2b
	cp $24
	jr nz, .asm_114e09
	ld a, [hli]
	and a
	jr z, .asm_114e2b
	cp $42
	jr z, .asm_114e0b
	cp $40
	jr z, .asm_114e0b
	dec hl

.asm_114e09
	dec hl
	ret

.asm_114e0b
	ld a, [hli]
	and a
	jr z, .asm_114e2b
	cp $1b
	jr nz, .asm_114e0b
	ld a, [hli]
	and a
	jr z, .asm_114e2b
	cp $28
	jr nz, .asm_114e0b
	ld a, [hli]
	and a
	jr z, .asm_114e2b
	cp $42
	jr z, .asm_114e29
	cp $4a
	jr z, .asm_114e29
	jr .asm_114e0b

.asm_114e29
	ld a, [hli]
	ret

.asm_114e2b
	xor a
	ret
; 114e2d

Function114e2d: ; 114e2d
	cp $30
	jr c, .asm_114e45
	cp $40
	jr c, .asm_114e58
	cp $41
	jr c, .asm_114e45
	cp $5b
	jr c, .asm_114e58
	cp $61
	jr c, .asm_114e45
	cp $7b
	jr c, .asm_114e58

.asm_114e45
	cp $20
	jr z, .asm_114e58
	cp $2d
	jr z, .asm_114e58
	cp $2e
	jr z, .asm_114e58
	cp $5f
	jr z, .asm_114e58
.asm_114e55
	ld a, $1
	ret

.asm_114e58
	cp $3c
	jr z, .asm_114e55
	cp $3e
	jr z, .asm_114e55
	xor a
	ret
; 114e62

Function114e62: ; 114e62
	ld a, c
	and a
	jr nz, .asm_114e6f
	ld a, [wStartDay]
	and a
	jp z, Function11425c
	jr .asm_114e76

.asm_114e6f
	xor a
	ld [wStartDay], a
	call Function114ee9

.asm_114e76
	call Function114f0a
	cp $ff
	jp z, Function11425c
	and a
	jr nz, .asm_114e99
	call Function114ea0
	and a
	jr nz, .asm_114e99
	ld hl, wdc09
	ld a, [hli]
	cpl
	ld e, a
	ld a, [hli]
	cpl
	ld d, a
	inc de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	xor a
	jp Function11425c

.asm_114e99
	ld a, $1
	ld b, $83
	jp Function11425c
; 114ea0

Function114ea0: ; 114ea0
	ld hl, wdc06
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, $d
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_114edb
	inc e
	call z, Function114ee0
	ld a, $a
	ld [de], a
	dec bc
	inc e
	call z, Function114ee0
	ld hl, wdc06
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld [hl], b
	xor a
	ld [wStartDay], a
	ret

.asm_114edb
	ld a, $1
	ld b, $83
	ret
; 114ee0

Function114ee0: ; 114ee0
	push bc
	ld bc, wCurrentMapSignpostCount
	call Function115d80
	pop bc
	ret
; 114ee9

Function114ee9: ; 114ee9
	ld hl, wdc03
	ld a, b
	ld [hli], a
	ld a, c
rept 2
	ld [hli], a
endr
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld c, a
	ld [hli], a
	inc de
	ld a, [de]
	ld b, a
	ld [hli], a
	inc de
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], d
	ret
; 114f0a

Function114f0a: ; 114f0a
	call Function114f39
	and a
	jr nz, .asm_114f26
	ld a, [wdc03]
	cp $6
	jr c, .asm_114f21
	cp $c
	jr z, .asm_114f23
	call Function114f59
	and a
	jr nz, .asm_114f23

.asm_114f21
	xor a
	ret

.asm_114f23
	ld a, $1
	ret

.asm_114f26
	call Function114f59
	and a
	jr nz, .asm_114f23
	ld hl, wdc0d
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	and a
	jr z, .asm_114f21
	ld a, $ff
	ret
; 114f39

Function114f39: ; 114f39
	ld hl, wdc0d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [de]
	and a
	jr z, .asm_114f58
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld hl, wdc0d
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, $1
	ret

.asm_114f58
	ret
; 114f59

Function114f59: ; 114f59
	ld a, [wStartDay]
	and a
	jr nz, .asm_114f7c
	ld a, [wdc03]
	cp $11
	jr z, .asm_114fa7
	add a
	ld e, a
	ld d, 0
	ld hl, Unknown_114011
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Function115020
	and a
	jr nz, .asm_114fe7
	ld a, $1
	ld [wStartDay], a

.asm_114f7c
	ld a, [wdc03]
	cp $5
	jr c, .asm_114fc9
	jr z, .asm_114fec
	cp $8
	jr c, .asm_114fa5
	jr z, .asm_114ff4
	cp $b
	jr c, .asm_114fa5
	jr z, .asm_114ffc
	cp $c
	jr z, .asm_115007
	cp $d
	jr z, .asm_114fa5
	cp $10
	jr c, .asm_115015
	jr z, .asm_114fa5
	cp $12
	jr c, .asm_114fa5
	jr .asm_114fe7

.asm_114fa5
	xor a
	ret

.asm_114fa7
	ld hl, Bed
	ld c, [hl]
	inc hl
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wdc24
	call Function115d53
	ld hl, wdc24
	call Function115020
	and a
	jr nz, .asm_114fe7
	jr .asm_11501e

.asm_114fc9
	call Function115062
	and a
	jr nz, .asm_114fe7
	ld a, [wdc04]
	dec a
	ld [wdc04], a
	and a
	jr z, .asm_114fdf
	call Function114f39
	and a
	jr nz, .asm_114fc9

.asm_114fdf
	ld a, [wdc05]
	ld [wdc04], a
	jr .asm_11501e

.asm_114fe7
	ld a, $1
	ld b, $83
	ret

.asm_114fec
	call Function115062
	and a
	jr nz, .asm_114fe7
	jr .asm_11501e

.asm_114ff4
	call Function115179
	and a
	jr nz, .asm_114fe7
	jr .asm_11501e

.asm_114ffc
	ld hl, String_114000
	call Function115217
	and a
	jr nz, .asm_114fe7
	jr .asm_11501e

.asm_115007
	call Function11528f
	ld hl, wdc24
	call Function115217
	and a
	jr nz, .asm_114fe7
	jr .asm_11501e

.asm_115015
	ld hl, String_114000
	call Function115217
	and a
	jr nz, .asm_114fe7

.asm_11501e
	xor a
	ret
; 115020

Function115020: ; 115020
	push hl
	ld hl, wdc06
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
.asm_115036
	ld a, [hli]
	and a
	jr z, .asm_115046
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_115056
	inc e
	call z, Function115059
	jr .asm_115036

.asm_115046
	ld hl, wdc06
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld [hl], b
	xor a
	ret

.asm_115056
	ld a, $1
	ret
; 115059

Function115059: ; 115059
	push bc
	ld bc, wCurrentMapSignpostCount
	call Function115d80
	pop bc
	ret
; 115062

Function115062: ; 115062
	ld hl, Bed
	ld a, [hli]
	and a
	jr z, .asm_1150ae
	ld c, a
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, $0
	ld hl, wdc24
	ld a, [wStartDay]
	cp $1
	jr z, .asm_11509b
	cp $2
	jr z, .asm_115098
	cp $3
	jr nz, .asm_1150b2
	ld a, $2c
	ld [hli], a
	ld a, $d
	ld [hli], a
	ld a, $a
	ld [hli], a
	ld a, $9
	ld [hli], a
	jr .asm_11509b

.asm_115098
	ld a, $2c
	ld [hli], a

.asm_11509b
	call Function115d53
	call Function1150b3
	call Function115136
	ld a, [wStartDay]
	inc a
	cp $4
	jr nz, .asm_1150ae
	ld a, $2

.asm_1150ae
	ld [wStartDay], a
	xor a

.asm_1150b2
	ret
; 1150b3

Function1150b3: ; 1150b3
	ld hl, wdc24
	ld de, PartyMon5Defense
	ld b, $0
.asm_1150bb
	ld c, $0
	ld a, [hli]
	cp $1b
	jr z, .asm_1150c9
	ld [de], a
	inc de
	and a
	jr z, .asm_115133
	jr .asm_1150bb

.asm_1150c9
	inc c
	ld a, [hl]
	cp $24
	jr nz, .asm_1150bb
	inc hl
	inc c
	ld a, [hl]
	cp $42
	jr z, .asm_1150dc
	cp $40
	jr z, .asm_1150dc
	jr .asm_1150bb

.asm_1150dc
	push hl
.asm_1150dd
	inc c
	ld a, [hli]
	and a
	jr z, .asm_115133
	cp $1b
	jr nz, .asm_1150dd
	inc c
	ld a, [hli]
	cp $28
	jr nz, .asm_1150dd
	inc c
	ld a, [hli]
	cp $42
	jr z, .asm_1150f8
	cp $4a
	jr z, .asm_1150f8
	jr .asm_1150dd

.asm_1150f8
	ld a, l
	ld [Console], a
	ld a, h
	ld [LeftOrnament], a
	ld hl, String_114232
.asm_115103
	ld a, [hli]
	and a
	jr z, .asm_11510b
	ld [de], a
	inc de
	jr .asm_115103

.asm_11510b
	pop hl
rept 2
	dec hl
endr
	push de
	call Function1158c2
	pop de
	ld h, d
	ld l, e
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
.asm_115119
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_115119
	ld a, $3f
	ld [de], a
	inc de
	ld a, $3d
	ld [de], a
	inc de
	ld a, [Console]
	ld l, a
	ld a, [LeftOrnament]
	ld h, a
	jr .asm_1150bb

.asm_115133
	xor a
	ld [de], a
	ret
; 115136

Function115136: ; 115136
	ld hl, wdc06
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld hl, PartyMon5Defense
.asm_11514d
	ld a, [hli]
	and a
	jr z, .asm_11515d
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_11516d
	inc e
	call z, Function115170
	jr .asm_11514d

.asm_11515d
	ld hl, wdc06
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld [hl], b
	xor a
	ret

.asm_11516d
	ld a, $1
	ret
; 115170

Function115170: ; 115170
	push bc
	ld bc, wCurrentMapSignpostCount
	call Function115d80
	pop bc
	ret
; 115179

Function115179: ; 115179
	ld hl, wdc06
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld hl, $013f
	ld a, [hli]
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_1151ef
	inc e
	call z, Function11520e
	ld a, [hli]
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_1151ef
	inc e
	call z, Function11520e
	ld a, [hli]
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_1151ef
	inc e
	call z, Function11520e
	ld a, [hli]
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_1151ef
	inc e
	call z, Function11520e
	ld a, $2d
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_1151ef
	inc e
	call z, Function11520e
	ld a, [$014c]
	ld h, a
	and $f0
	swap a
	cp $a
	jr nc, .asm_1151d8
	add $30
	jr .asm_1151da

.asm_1151d8
	add $37

.asm_1151da
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_1151ef
	inc e
	call z, Function11520e
	ld a, h
	and $f
	cp $a
	jr nc, .asm_1151f2
	add $30
	jr .asm_1151f4

.asm_1151ef
	ld a, $1
	ret

.asm_1151f2
	add $37

.asm_1151f4
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_1151ef
	inc e
	call z, Function11520e
	ld hl, wdc06
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld [hl], b
	xor a
	ret
; 11520e

Function11520e: ; 11520e
	push bc
	ld bc, wCurrentMapSignpostCount
	call Function115d80
	pop bc
	ret
; 115217

Function115217: ; 115217
	push hl
	ld hl, wdc06
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
.asm_11522d
	ld a, [hli]
	and a
	jr z, .asm_11523d
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_115262
	inc e
	call z, Function115286
	jr .asm_11522d

.asm_11523d
	ld a, [wdc03]
	cp $b
	jr z, .asm_115278
	cp $c
	jr z, .asm_115278
	cp $e
	jr z, .asm_115252
	cp $f
	jr z, .asm_115265
	jr .asm_115262

.asm_115252
	ld hl, wdc06
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld [hl], b
	xor a
	ret

.asm_115262
	ld a, $1
	ret

.asm_115265
	ld h, $2
.asm_115267
	ld a, $2d
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_115262
	inc e
	call z, Function115286
	dec h
	jr nz, .asm_115267
	jr .asm_115252

.asm_115278
	ld a, $22
	ld [de], a
	dec bc
	ld a, b
	or c
	jr z, .asm_115262
	inc e
	call z, Function115286
	jr .asm_115252
; 115286

Function115286: ; 115286
	push bc
	ld bc, wCurrentMapSignpostCount
	call Function115d80
	pop bc
	ret
; 11528f

Function11528f: ; 11528f
	ld hl, Bed
	ld c, [hl]
	inc hl
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, wdc24
.asm_1152a4
	ld a, [de]
	ld [hli], a
	inc e
	call z, Function1152af
	dec c
	jr nz, .asm_1152a4
	ld [hl], c
	ret
; 1152af

Function1152af: ; 1152af
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	ret
; 1152b8

Function1152b8: ; 1152b8
	push bc
	call Function11537d
	push de
	ld h, d
	ld l, e
	ld a, [hli]
	ld b, a
	ld c, $1
	call Function1153d2
	pop de
	and a
	jr nz, .asm_1152f9
.asm_1152ca
	ld hl, wdc0d
	ld e, [hl]
	inc hl
	ld d, [hl]
.asm_1152d0
	ld a, [wdc03]
	cp $3
	jr nz, .asm_1152d8
	push de

.asm_1152d8
	cp $5
	jr nz, .asm_1152e7
	pop hl
	ld a, [hli]
	ld b, a
	ld c, $3
	call Function1153d2
	and a
	jr nz, .asm_1152f9

.asm_1152e7
	ld a, [de]
	inc de
	and a
	jr nz, .asm_115301
	ld a, [wdc03]
	cp $6
	jr z, .asm_115335
	inc a
	ld [wdc03], a
	jr .asm_1152d0

.asm_1152f9
	pop hl
	ld a, $1
	ld b, $83
	jp Function11425c

.asm_115301
	ld hl, wdc0d
	ld [hl], e
	inc hl
	ld [hl], d
.asm_115307
	ld [wdc05], a
	ld a, $1
	ld [wdc04], a
	call Function1153b5
	call Function114f59
	and a
	jr nz, .asm_1152f9
	ld a, [wdc05]
	dec a
	jr nz, .asm_115307
	ld a, [wdc03]
	inc a
	ld [wdc03], a
	call Function114ea0
	and a
	jr nz, .asm_1152f9
	ld [wStartDay], a
	ld a, [wdc03]
	cp $6
	jr nz, .asm_1152ca

.asm_115335
	call Function1153b5
	xor a
	ld [wStartDay], a
	call Function114f59
	and a
	jr nz, .asm_1152f9
	call Function114ea0
	and a
	jr nz, .asm_1152f9
	ld a, [wdc03]
	inc a
	ld [wdc03], a
	cp $9
	jr nz, .asm_115335
	pop bc
	ld a, b
	and a
	jr z, .asm_11536b
	call Function1153b5
	xor a
	ld [wStartDay], a
	call Function114f59
	and a
	jr nz, .asm_1152f9
	call Function114ea0
	and a
	jr nz, .asm_1152f9

.asm_11536b
	ld hl, wdc09
	ld a, [hli]
	cpl
	ld e, a
	ld a, [hli]
	cpl
	ld d, a
	inc de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	xor a
	jp Function11425c
; 11537d

Function11537d: ; 11537d
	ld hl, wdc06
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	ld b, a
	inc de
	ld a, [de]
	ld [hli], a
	inc hl
	ld a, [de]
	ld [hld], a
	ld a, b
	ld [hli], a
	inc de
	ld hl, RightOrnament
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld hl, wdc0d
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ld [wdc03], a
	ld [wStartDay], a
	ret
; 1153b5

Function1153b5: ; 1153b5
	ld hl, wdc0d
	ld e, [hl]
	inc hl
	ld d, [hl]
rept 2
	inc hl
endr
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	inc de
	ld a, [de]
	ld [Bed], a
	inc de
	ld hl, wdc0d
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; 1153d2

Function1153d2: ; 1153d2
	ld a, [wdc03]
	ld d, a
	ld a, [wdc04]
	ld e, a
	push de
	xor a
	ld [wdc03], a
	ld [wdc04], a
	ld a, $24
	ld [Console], a
	ld a, $dc
	ld [LeftOrnament], a
	push bc
	jr .asm_1153f4

.asm_1153ef
	ld a, [hli]
	and a
	jr z, .asm_115426
	ld b, a

.asm_1153f4
	push bc
.asm_1153f5
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld c, [hl]
	inc hl
	push hl
	ld a, [Console]
	ld l, a
	ld a, [LeftOrnament]
	ld h, a
	push bc
	ld b, $0
	call Function115d53
	inc hl
	ld [hl], a
	pop bc
	ld a, l
	ld e, a
	ld [Console], a
	ld a, h
	ld d, a
	ld [LeftOrnament], a
	dec b
	jr z, .asm_11542b
	pop hl
	jr .asm_1153f5

.asm_115426
	dec c
	jr nz, .asm_1153ef
	jr .asm_115430

.asm_11542b
	pop hl
	pop bc
	dec c
	jr nz, .asm_1153ef

.asm_115430
	ld a, l
	ld [Console], a
	ld a, h
	ld [LeftOrnament], a
	xor a
	ld [de], a
	ld hl, wdc24
.asm_11543d
	ld a, [hli]
	and a
	jr nz, .asm_11543d
	ld a, [hl]
	and a
	jr z, .asm_115457
	dec hl
	ld a, $2c
	ld [hli], a
	jr .asm_11543d

.asm_11544b
	pop hl
	ld a, h
	ld [wdc03], a
	ld a, l
	ld [wdc04], a
	ld a, $1
	ret

.asm_115457
	ld hl, wdc24
	call Function114d99
	ld hl, $ddc8
.asm_115460
	ld a, [hli]
	and a
	jr z, .asm_11546d
	cp $2c
	jr nz, .asm_115460
	dec hl
	xor a
	ld [hli], a
	jr .asm_115460

.asm_11546d
	pop de
	ld a, e
	cp $1
	jr z, .asm_115477
	xor a
	ld [hli], a
	jr .asm_115478

.asm_115477
	dec bc

.asm_115478
	ld hl, $dc18
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	cp h
	jr c, .asm_11548c
	jr nz, .asm_11544b
	ld a, c
	cp l
	jr c, .asm_11548c
	jr z, .asm_11548c
	jr .asm_11544b

.asm_11548c
	ld hl, $dc18
	ld a, c
	cpl
	ld e, a
	ld a, b
	cpl
	ld d, a
	inc de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld de, $dc18
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	ld hl, RightOrnament
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ddc8
	call Function115d6a
	ld hl, RightOrnament
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [Console]
	ld e, a
	ld a, [LeftOrnament]
	ld d, a
	pop hl
	ld a, h
	ld [wdc03], a
	ld a, l
	ld [wdc04], a
	xor a
	ret
; 1154d4

Function1154d4: ; 1154d4
	xor a
	ld [wStartDay], a
	call Function1155af
	call Function11560a
	and a
	jr nz, .asm_11552c
	call Function1155d1
	ld a, [RightOrnament]
	dec a
	ld [RightOrnament], a
	and a
	jp z, .asm_115577
	cp $1
	jr nz, .asm_115531
	xor a
	ld [wDailyResetTimer], a
.asm_1154f7
	ld a, [BigDoll]
	cp $2
	jr z, .asm_115502
	cp $3
	jr z, .asm_11550f

.asm_115502
	ld a, $a
	ld [wdc03], a
	call Function114f59
	and a
	jr z, .asm_11551a
	jr .asm_11552c

.asm_11550f
	ld a, $c
	ld [wdc03], a
	call Function114f59
	and a
	jr nz, .asm_11552c

.asm_11551a
	call Function114ea0
	and a
	jr nz, .asm_11552c
	call Function114ea0
	and a
	jr nz, .asm_11552c
	call Function11560a
	and a
	jr z, .asm_1155a0

.asm_11552c
	ld a, $1
	jp Function11425c

.asm_115531
	ld a, $1
	ld [wDailyResetTimer], a
	ld a, $b
	ld [wdc03], a
	call Function114f59
	and a
	jr nz, .asm_11552c
	call Function114ea0
	and a
	jr nz, .asm_11552c
.asm_115547
	call Function114ea0
	and a
	jr nz, .asm_11552c
	ld a, $e
	ld [wdc03], a
	call Function114f59
	and a
	jr nz, .asm_11552c
	call Function114ea0
	and a
	jr nz, .asm_11552c
	jr .asm_1154f7

.asm_115560
	call Function114ea0
	and a
	jr nz, .asm_11552c
	ld a, [wDailyResetTimer]
	and a
	jr z, .asm_11557d
	ld a, $f
	ld [wdc03], a
	call Function114f59
	and a
	jr nz, .asm_11552c

.asm_115577
	call Function114ea0
	and a
	jr nz, .asm_11552c

.asm_11557d
	ld a, $10
	ld [wdc03], a
	call Function114f59
	and a
	jr nz, .asm_11552c
	call Function114ea0
	and a
	jr nz, .asm_11552c
	ld hl, wdc09
	ld a, [hli]
	cpl
	ld e, a
	ld a, [hli]
	cpl
	ld d, a
	inc de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	xor a
	jp Function11425c

.asm_1155a0
	ld a, [RightOrnament]
	dec a
	ld [RightOrnament], a
	and a
	jr z, .asm_115560
	call Function1155d1
	jr .asm_115547
; 1155af

Function1155af: ; 1155af
	ld hl, wdc06
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	ld b, a
	inc de
	ld a, [de]
	ld [hli], a
	ld [hl], b
	inc hl
	ld [hli], a
	inc de
	ld a, [de]
	ld [RightOrnament], a
	inc de
	ld a, e
	ld [hli], a
	ld [hl], d
	call Function1155d1
	ret
; 1155d1

Function1155d1: ; 1155d1
	ld a, [wdc0d]
	ld l, a
	ld a, [wdc0e]
	ld h, a
	ld a, [hli]
	ld [BigDoll], a
	cp $3
	jr nz, .asm_1155f0
	ld de, Carpet
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [hli]
	ld [Bed], a

.asm_1155f0
	ld de, wdc17
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, l
	ld [wdc0d], a
	ld a, h
	ld [wdc0e], a
	ret
; 11560a

Function11560a: ; 11560a
	ld a, [wdc06]
	ld [wCurrentMapSignpostCount], a
	ld a, [wdc17]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld hl, wdc1a
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, [wCurrMapCallbackCount]
	cp b
	jp c, .asm_1156b1
	jr nz, .asm_115631
	ld a, [wdc09]
	cp c
	jp c, .asm_1156b1

.asm_115631
	ld a, b
	or c
	jr z, .asm_1156a9
	ld a, [wdc09]
	ld l, a
	ld a, [wCurrMapCallbackCount]
	ld h, a
	ld a, c
	cpl
	ld e, a
	ld a, b
	cpl
	ld d, a
	inc de
	add hl, de
	ld a, l
	ld [wdc09], a
	ld a, h
	ld [wCurrMapCallbackCount], a
.asm_11564d
	ld a, $3
	cp b
	jr c, .asm_1156b6
	jr nz, .asm_115659
	ld a, $db
	cp c
	jr c, .asm_1156b6

.asm_115659
	ld a, [wdc1a]
	ld e, a
	ld a, [wdc1b]
	ld d, a
	ld a, c
	cpl
	ld l, a
	ld a, b
	cpl
	ld h, a
	inc hl
	add hl, de
	ld a, l
	ld [wdc1a], a
	ld a, h
	ld [wdc1b], a
	push bc
	ld hl, $dc18
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wdc24
	call Function115d53
	ld hl, $dc18
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	ld a, [wCurrentMapSignpostCount]
	ld [$ff8c], a
	ld [$4000], a
	ld hl, wCurrMapTriggerCount
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wdc24
	call Function115d6a
	ld hl, wCurrMapTriggerCount
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wdc1a
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, b
	or c
	jr nz, .asm_11564d

.asm_1156a9
	ld a, [wCurrentMapSignpostCount]
	ld [wdc06], a
	xor a
	ret

.asm_1156b1
	ld a, $1
	ld b, $83
	ret

.asm_1156b6
	ld a, $3
	cpl
	ld h, a
	ld a, $db
	cpl
	ld l, a
	add hl, bc
	ld de, wdc1a
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	ld bc, $03db
	jr .asm_115659
; 1156cc

Function1156cc: ; 1156cc
	ld a, [wStartDay]
	and a
	jp z, Function11425c
	cp $2
	jr z, .asm_1156fa
	cp $3
	jr z, .asm_1156fd
	cp $4
	jr z, .asm_1156fd
	cp $5
	jr z, .asm_115716
	cp $ff
	jr z, .asm_11572b
	cp $1
	jp nz, Function11425c
	call Function115732
	call Function11575c
	ld a, h
	ld [Poster], a
	ld a, l
	ld [Plant], a

.asm_1156fa
	call Function1157d0

.asm_1156fd
	call Function11581e
	and a
	jr nz, .asm_11572b
	ld a, [wStartDay]
	cp $5
	jr z, .asm_115716
	ld a, [Poster]
	ld h, a
	ld a, [Plant]
	ld l, a
	xor a
	jp Function11425c

.asm_115716
	ld hl, wCurrMapCallbackCount
	ld a, [hli]
	cpl
	ld e, a
	ld a, [hli]
	cpl
	ld d, a
	inc de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	xor a
	ld [wStartDay], a
	jp Function11425c

.asm_11572b
	ld a, $1
	ld b, $83
	jp Function11425c
; 115732

Function115732: ; 115732
	ld hl, wdc02
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	dec de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	ld a, c
	ld [hli], a
	ld [hl], b
	ret
; 11575c

Function11575c: ; 11575c
	ld hl, wdc05
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, $10
	ld b, $0
	ld c, b
	ld d, b
	ld a, $3
.asm_11576a
	rl l
	rl h
	rl d
	cp d
	jr c, .asm_11577c
	rl c
	rl b
	dec e
	jr nz, .asm_11576a
	jr .asm_11578a

.asm_11577c
	ld a, d
	sub $3
	ld d, a
	ld a, $3
	scf
	rl c
	rl b
	dec e
	jr nz, .asm_11576a

.asm_11578a
	ld a, d
	and a
	jr z, .asm_11578f
	inc bc

.asm_11578f
	sla c
	rl b
	sla c
	rl b
	ld h, b
	ld l, c
	push hl
	ld e, $10
	ld b, $0
	ld c, b
	ld d, b
	ld a, $40
.asm_1157a2
	rl l
	rl h
	rl d
	cp d
	jr c, .asm_1157b4
	rl c
	rl b
	dec e
	jr nz, .asm_1157a2
	jr .asm_1157c3

.asm_1157b4
	ld a, d
	sub $40
	ld d, a
	ld a, $40
	scf
	rl c
	rl b
	dec e
	jr nz, .asm_1157a2
	inc bc

.asm_1157c3
	and a
	sla c
	rl b
	pop hl
	add hl, bc
	ld a, $2
	ld [wStartDay], a
	ret
; 1157d0

Function1157d0: ; 1157d0
	ld hl, wdc05
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wdc0e]
	ld c, a
	ld a, [Bed]
	ld b, a
	cp h
	jr c, .asm_1157eb
	jr nz, .asm_1157e9
	ld a, c
	cp l
	jr c, .asm_1157eb
	jr z, .asm_1157eb

.asm_1157e9
	ld b, h
	ld c, l

.asm_1157eb
	push bc
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	add hl, bc
	ld a, l
	ld [wdc05], a
	ld a, h
	ld [wdc06], a
	ld a, h
	or l
	jr nz, .asm_11580f
	pop bc
	ld a, c
	ld [wdc0e], a
	ld a, b
	ld [Bed], a
	ld a, $4
	ld [wStartDay], a
	ret

.asm_11580f
	pop bc
	ld a, c
	ld [wdc0e], a
	ld a, b
	ld [Bed], a
	ld a, $3
	ld [wStartDay], a
	ret
; 11581e

Function11581e: ; 11581e
	ld a, [wStartDay]
	and a
	ret z
	ld a, [wdc0e]
	ld c, a
	ld a, [Bed]
	ld b, a
	ld hl, wdc02
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wdc24
	push bc
	call Function115d53
	pop bc
	ld hl, wdc02
	ld a, [wdc00]
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wdc24
	ld de, PartyMon5Defense
	call Function1158c2
	ld hl, PartyMon5Defense
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	push hl
	ld a, [wCurrMapCallbackCount]
	ld l, a
	ld a, [wCurrMapCallbackHeaderPointer]
	ld h, a
	cp b
	jr c, .asm_1158bb
	jr nz, .asm_11586e
	ld a, l
	cp c
	jr c, .asm_1158bb

.asm_11586e
	push bc
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	add hl, bc
	ld a, l
	ld [wCurrMapCallbackCount], a
	ld a, h
	ld [wCurrMapCallbackHeaderPointer], a
	pop bc
	pop hl
	ld hl, wCurrMapTriggerCount
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, PartyMon5Speed
	call Function115d6a
	ld hl, wCurrMapTriggerCount
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, [wStartDay]
	cp $3
	jr z, .asm_1158b4
	cp $4
	jr z, .asm_1158ad
	jr .asm_1158bc

.asm_1158ad
	ld a, $5
	ld [wStartDay], a
	jr .asm_1158b9

.asm_1158b4
	ld a, $2
	ld [wStartDay], a

.asm_1158b9
	xor a
	ret

.asm_1158bb
	pop hl

.asm_1158bc
	ld a, $ff
	ld [wStartDay], a
	ret
; 1158c2

Function1158c2: ; 1158c2
	ld a, e
	ld [SwarmFlags], a
	ld a, d
	ld [wdc21], a
	xor a
	ld [wdc22], a
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, c
	ld [wdc19], a
	ld a, b
	ld [wdc1a], a
	ld c, e
	ld b, d
	ld e, l
	ld d, h
	ld l, c
	ld h, b
	xor a
	ld [WeeklyFlags], a

.asm_1158e5
	ld b, $3
	push hl
	ld hl, wdc1b
.asm_1158eb
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_1158eb
	ld a, [wdc19]
	ld c, a
	ld a, [wdc1a]
	ld b, a
	xor a
	or b
	jr nz, .asm_115914
	ld a, $2
	cp c
	jr c, .asm_115914
	push hl
	dec hl
	ld a, c
	ld [WeeklyFlags], a
.asm_115908
	xor a
	ld [hld], a
	inc c
	ld a, $3
	cp c
	jr nz, .asm_115908
	pop hl
	ld bc, $0003

.asm_115914
rept 3
	dec bc
endr
	ld a, c
	ld [wdc19], a
	ld a, b
	ld [wdc1a], a
	push de
	push hl
	ld hl, SwarmFlags
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, [hl]
	inc hl
	ld d, [hl]
rept 4
	inc de
endr
	ld [hl], d
	dec hl
	ld [hl], e
	pop hl
	dec hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld a, [hl]
	ld d, a
	srl a
	srl a
	ld [hli], a
	ld a, $3
	and d
	ld d, a
	ld a, $f0
	and b
	or d
	swap a
	ld [hli], a
	ld a, $f
	and b
	ld d, a
	ld a, c
	and $c0
	or d
	rlca
	rlca
	ld [hli], a
	ld a, $3f
	and c
	ld [hld], a
rept 2
	dec hl
endr
	pop de
	ld b, h
	ld c, l
	pop hl
	ld a, [bc]
	inc bc
	call Function1159dc
	ld [hli], a
	ld a, [bc]
	inc bc
	call Function1159dc
	ld [hli], a
	ld a, [bc]
	inc bc
	call Function1159dc
	ld [hli], a
	ld a, [bc]
	inc bc
	call Function1159dc
	ld [hli], a
	ld a, [wdc22]
	inc a
	cp $10
	jr nz, .asm_1159b1
	push af
	push bc
	ld a, [wdc19]
	ld b, a
	ld a, [wdc1a]
	or b
	jr nz, .asm_115998
	ld a, [wdc05]
	ld b, a
	ld a, [wdc06]
	or b
	jr nz, .asm_115998
	pop bc
	pop af
	jr .asm_1159c4

.asm_115998
	pop bc
	pop af
	ld a, $d
	ld [hli], a
	ld a, $a
	ld [hli], a
	push hl
	ld hl, SwarmFlags
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld c, a
	ld b, [hl]
rept 2
	inc bc
endr
	ld a, b
	ld [hld], a
	ld [hl], c
	pop hl
	xor a

.asm_1159b1
	ld [wdc22], a
	ld a, [wdc19]
	cp $0
	jp nz, .asm_1158e5
	ld a, [wdc1a]
	cp $0
	jp nz, .asm_1158e5

.asm_1159c4
	ld a, [WeeklyFlags]
	cp $0
	jr z, .asm_1159d8
	push hl
	dec hl
	ld b, a
.asm_1159ce
	ld a, $3d
	ld [hld], a
	inc b
	ld a, $3
	cp b
	jr nz, .asm_1159ce
	pop hl

.asm_1159d8
	ld a, $0
	ld [hl], a
	ret
; 1159dc

Function1159dc: ; 1159dc
	cp $1a
	jr c, .asm_1159ef
	cp $34
	jr c, .asm_1159f2
	cp $3e
	jr c, .asm_1159f5
	cp $3e
	jr z, .asm_1159f8
	ld a, $2f
	ret

.asm_1159ef
	add $41
	ret

.asm_1159f2
	add $47
	ret

.asm_1159f5
	sub $4
	ret

.asm_1159f8
	ld a, $2b
	ret
; 1159fb

Function1159fb: ; 1159fb
	ld a, [wStartDay]
	and a
	jp z, Function11425c
	cp $2
	jr z, .asm_115a29
	cp $3
	jr z, .asm_115a2c
	cp $4
	jr z, .asm_115a2c
	cp $5
	jr z, .asm_115a45
	cp $ff
	jr z, .asm_115a5a
	cp $1
	jp nz, Function11425c
	call Function115732
	call Function115a5f
	ld a, h
	ld [Plant], a
	ld a, l
	ld [Poster], a

.asm_115a29
	call Function115ab0

.asm_115a2c
	call Function115b00
	and a
	jr nz, .asm_115a5a
	ld a, [wStartDay]
	cp $5
	jr z, .asm_115a45
	ld a, [Poster]
	ld h, a
	ld a, [Plant]
	ld l, a
	xor a
	jp Function11425c

.asm_115a45
	ld hl, wCurrMapCallbackCount
	ld a, [hli]
	cpl
	ld e, a
	ld a, [hli]
	cpl
	ld d, a
	inc de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	xor a
	ld [wStartDay], a
	jp Function11425c

.asm_115a5a
	ld a, $1
	jp Function11425c
; 115a5f

Function115a5f: ; 115a5f
	ld hl, wdc05
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld e, $10
	ld b, $0
	ld c, b
	ld d, b
	ld a, $42
.asm_115a6e
	rl l
	rl h
	rl d
	cp d
	jr c, .asm_115a80
	rl c
	rl b
	dec e
	jr nz, .asm_115a6e
	jr .asm_115a8e

.asm_115a80
	ld a, d
	sub $42
	ld d, a
	ld a, $42
	scf
	rl c
	rl b
	dec e
	jr nz, .asm_115a6e

.asm_115a8e
	sla c
	rl b
	pop hl
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	add hl, bc
	srl h
	rr l
	srl h
	rr l
	ld b, h
	ld c, l
	sla c
	rl b
	add hl, bc
	ld a, $2
	ld [wStartDay], a
	ret
; 115ab0

Function115ab0: ; 115ab0
	ld hl, wdc05
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wdc0e]
	ld c, a
	ld a, [Bed]
	ld b, a
	cp h
	jr c, .asm_115acb
	jr nz, .asm_115ac9
	ld a, c
	cp l
	jr c, .asm_115acb
	jr z, .asm_115acb

.asm_115ac9
	ld b, h
	ld c, l

.asm_115acb
	push bc
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	add hl, bc
	ld a, l
	ld [wdc05], a
	ld a, h
	ld [wdc06], a
	ld a, h
	or l
	jr nz, .asm_115af0
	pop bc
	ld a, c
	ld [wdc0e], a
	ld a, b
	ld [Bed], a
	ld a, $4
	ld [wStartDay], a
	xor a
	ret

.asm_115af0
	pop bc
	ld a, c
	ld [wdc0e], a
	ld a, b
	ld [Bed], a
	ld a, $3
	ld [wStartDay], a
	xor a
	ret
; 115b00

Function115b00: ; 115b00
	ld a, [wStartDay]
	and a
	ret z
	ld a, [wdc0e]
	ld c, a
	ld a, [Bed]
	ld b, a
	ld hl, wdc02
	ld a, [hli]
	ld [wdc00], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, PartyMon5Defense
	push bc
	call Function115bc8
	pop hl
	and a
	jr z, .asm_115b43
	cp $2
	jr z, .asm_115b3b
	ld a, [wStartDay]
	cp $4
	jr z, .asm_115b43
rept 2
	inc hl
endr
	jr .asm_115b43

.asm_115b36
	pop hl
	ld b, $83
	jr .asm_115b3d

.asm_115b3b
	ld b, $81

.asm_115b3d
	ld a, $ff
	ld [wStartDay], a
	ret

.asm_115b43
	ld a, [Carpet]
	add a
	cpl
	ld c, a
	ld b, $ff
	inc bc
	add hl, bc
	ld b, h
	ld c, l
	ld hl, wdc02
	ld a, [wdc00]
	ld [hli], a
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, PartyMon5Defense
	ld de, wdc24
	call Function115c49
	ld hl, wdc24
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	push hl
	ld a, [wCurrMapCallbackCount]
	ld l, a
	ld a, [wCurrMapCallbackHeaderPointer]
	ld h, a
	cp b
	jr c, .asm_115b36
	jr nz, .asm_115b7b
	ld a, l
	cp c
	jr c, .asm_115b36

.asm_115b7b
	push bc
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	add hl, bc
	ld a, l
	ld [wCurrMapCallbackCount], a
	ld a, h
	ld [wCurrMapCallbackHeaderPointer], a
	pop bc
	pop hl
	ld hl, wCurrMapTriggerCount
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wdc26
	call Function115d6a
	ld hl, wCurrMapTriggerCount
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, [wStartDay]
	cp $3
	jr z, .asm_115bc1
	cp $4
	jr z, .asm_115bba
	jr .asm_115b3b

.asm_115bba
	ld a, $5
	ld [wStartDay], a
	jr .asm_115bc6

.asm_115bc1
	ld a, $2
	ld [wStartDay], a

.asm_115bc6
	xor a
	ret
; 115bc8

Function115bc8: ; 115bc8
	xor a
	ld [Carpet], a
.asm_115bcc
	ld a, [de]
	ld [hli], a
	inc e
	call z, .Function115c3d
	dec bc
	ld a, b
	or c
	jr z, .asm_115c46
	ld a, [de]
	ld [hli], a
	inc e
	call z, .Function115c3d
	dec bc
	ld a, b
	or c
	jr z, .asm_115c1b
	ld a, [de]
	ld [hli], a
	inc e
	call z, .Function115c3d
	dec bc
	ld a, b
	or c
	jr z, .asm_115c46
	ld a, [de]
	ld [hli], a
	inc e
	call z, .Function115c3d
	dec bc
	ld a, b
	or c
	jr z, .asm_115c3a
	ld a, [de]
	cp $d
	jr nz, .asm_115bcc
	inc e
	call z, .Function115c3d
	ld a, [de]
	cp $a
	jr nz, .asm_115c46
	inc e
	call z, .Function115c3d
	dec bc
	ld a, b
	or c
	jr z, .asm_115c46
	ld a, [Carpet]
	inc a
	ld [Carpet], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_115bcc

.asm_115c1b
	ld a, [wStartDay]
	cp $4
	jr z, .asm_115c33
	ld a, [de]
	ld [hli], a
	inc e
	call z, .Function115c3d
	ld a, [de]
	ld [hli], a
	inc e
	call z, .Function115c3d
	xor a
	ld [hl], a
	ld a, $1
	ret

.asm_115c33
rept 2
	dec hl
endr
	xor a
	ld [hl], a
	ld a, $1
	ret

.asm_115c3a
	xor a
	ld [hl], a
	ret

.Function115c3d:
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	ret

.asm_115c46
	ld a, $2
	ret
; 115c49

Function115c49: ; 115c49
	ld a, e
	ld [WeeklyFlags], a
	ld a, d
	ld [SwarmFlags], a
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de

	ld a, c
	ld [wdc19], a
	ld a, b
	ld [wdc1a], a
	ld c, e
	ld b, d
	ld e, l
	ld d, h
	ld l, c
	ld h, b

.asm_115c64
	ld a, [wdc1a]
	or a
	jr nz, .asm_115c71
	ld a, [wdc19]
	cp $4
	jr c, .asm_115c99

.asm_115c71
	ld b, $4
	push hl
	ld hl, wdc1b
.asm_115c77
	ld a, [de]
	inc de
	call Function115cfd
	ld [hli], a
	dec b
	jr nz, .asm_115c77
	ld a, [wdc19]
	ld c, a
	ld a, [wdc1a]
	ld b, a
rept 4
	dec bc
endr
.asm_115c8c
	ld a, [de]
	cp $d
	jr z, .asm_115c95
	cp $a
	jr nz, .asm_115c9f

.asm_115c95
	inc de
	dec bc
	jr .asm_115c8c

.asm_115c99
	ld a, $ff
	ld [wStartDay], a
	ret

.asm_115c9f
	ld a, c
	ld [wdc19], a
	ld a, b
	ld [wdc1a], a
	push de
	push hl
	ld hl, WeeklyFlags
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, [hl]
	inc hl
	ld d, [hl]
rept 3
	inc de
endr
	ld [hl], d
	dec hl
	ld [hl], e
	pop hl
	dec hl
	ld d, [hl]
	dec hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld a, [hl]
	sla b
	sla b
	sla b
	rla
	sla b
	rla
	ld [hli], a
	ld [hl], b
	inc hl
	rrc c
	rrc c
	ld [hl], c
	dec hl
	ld a, $f
	and c
	or [hl]
	ld [hli], a
	ld a, [hli]
	and $c0
	or [hl]
	dec hl
	ld [hld], a
	dec hl
	pop de
	ld b, h
	ld c, l
	pop hl
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hli], a
	ld a, [wdc19]
	cp $0
	jp nz, .asm_115c64
	ld a, [wdc1a]
	cp $0
	jp nz, .asm_115c64
	ret
; 115cfd

Function115cfd: ; 115cfd
	cp $2b
	jr c, .asm_115d27
	jr z, .asm_115d2f
	cp $2f
	jr c, .asm_115d27
	jr z, .asm_115d32
	cp $30
	jr c, .asm_115d27
	cp $3a
	jr c, .asm_115d35
	cp $3d
	jr c, .asm_115d27
	jr z, .asm_115d38
	cp $41
	jr c, .asm_115d27
	cp $5b
	jr c, .asm_115d4d
	cp $61
	jr c, .asm_115d27
	cp $7b
	jr c, .asm_115d50

.asm_115d27
	pop hl
	pop hl
	ld a, $ff
	ld [wStartDay], a
	ret

.asm_115d2f
	ld a, $3e
	ret

.asm_115d32
	ld a, $3f
	ret

.asm_115d35
	add $4
	ret

.asm_115d38
	push de
	push hl
	ld a, [WeeklyFlags]
	ld l, a
	ld a, [SwarmFlags]
	ld h, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec de
	ld [hl], d
	dec hl
	ld [hl], e
	pop hl
	pop de
	xor a
	ret

.asm_115d4d
	sub $41
	ret

.asm_115d50
	sub $47
	ret
; 115d53

Function115d53: ; 115d53
.asm_115d53
	ld a, [de]
	ld [hli], a
	inc e
	call z, Function115d61
	dec bc
	ld a, b
	or c
	jr nz, .asm_115d53
	xor a
	ld [hl], a
	ret
; 115d61

Function115d61: ; 115d61
	push bc
	ld bc, wdc00
	call Function115d80
	pop bc
	ret
; 115d6a

Function115d6a: ; 115d6a
.asm_115d6a
	ld a, [hli]
	ld [de], a
	inc e
	call z, Function115d77
	dec bc
	ld a, b
	or c
	jr nz, .asm_115d6a
	xor a
	ret
; 115d77

Function115d77: ; 115d77
	push bc
	ld bc, wCurrentMapSignpostCount
	call Function115d80
	pop bc
	ret
; 115d80

Function115d80: ; 115d80
	ld e, a
	ld a, d
	cp $bf
	jr z, .asm_115d8b
	inc d
	ld a, e
	ld e, $0
	ret

.asm_115d8b
	ld a, [bc]
	inc a
	ld [bc], a
	ld [$ff8c], a
	ld [$4000], a
	ld a, e
	ld d, $a0
	ld e, $0
	ret
; 115d99

Function115d99: ; 115d99
	ld de, GFX_11601a
	ld hl, VTiles0 tile $60
	lb bc, BANK(GFX_11601a), $14
	call Get2bpp
	xor a
	ld [wc305], a
	ld [wc306], a
	ld [wc309], a
	ld [wc30a], a
	ld [wc30b], a
	ld [wc30c], a
	ld a, $10
	ld [wc307], a
	ld a, $18
	ld [wc308], a
	ret
; 115dc3

Function115dc3: ; 115dc3
	xor a
	ld [wc305], a
	ld a, $a0
	ld hl, Sprites + $7c
	ld bc, $0020
	call ByteFill
	ret
; 115dd3

Function115dd3: ; 115dd3
	ld a, [wc305]
	and a
	ret z
	ld a, $a0
	ld hl, Sprites + $7c
	ld bc, $0020
	call ByteFill
	call Function115e22
	ld a, [wc309]
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_115e86
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld de, Sprites + $7c
	ld a, [wc307]
	ld c, a
	ld a, [wc308]
	ld b, a
	ld a, [hli]
.asm_115e04
	push af
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .asm_115e04
	ret
; 115e18

Function115e18: ; 115e18
	ld a, c
	ld [wc30a], a
	xor a
	ld [wc30b], a
	jr Function115e2b
; 115e22

Function115e22: ; 115e22
	ld hl, wc30c
	dec [hl]
	ret nz
	ld hl, wc30b
	inc [hl]

Function115e2b: ; 115e2b
	ld a, [wc30a]
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_115e59
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	pop hl
	ld a, [wc30b]
	sla a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	cp $ff
	jr nz, .asm_115e51
	xor a
	ld [wc30b], a
	jr Function115e2b

.asm_115e51
	ld [wc309], a
	ld a, [hl]
	ld [wc30c], a
	ret
; 115e59

Unknown_115e59:
	dw Unknown_115e61
	dw Unknown_115e6c
	dw Unknown_115e76
	dw Unknown_115e79

Unknown_115e61: ; 115e61
	db $4, $8
	db $5, $8
	db $6, $8
	db $7, $8
	db $8, $8
	db $ff

Unknown_115e6c: ; 115e6c
	db $1, $8
	db $2, $8
	db $3, $8
	db $9, $8
	db $a, $8

Unknown_115e76: ; 115e76
	db $0, $8
	db $ff

Unknown_115e79: ; 115e79
	db $b, $8
	db $c, $8
	db $d, $8
	db $e, $8
	db $f, $8
	db $0, $8
	db $ff
; 115e86

Unknown_115e86:
	dw Unknown_115ea6
	dw Unknown_115eb7
	dw Unknown_115ecc
	dw Unknown_115ee1
	dw Unknown_115ef6
	dw Unknown_115f13
	dw Unknown_115f30
	dw Unknown_115f4d
	dw Unknown_115f6a
	dw Unknown_115f87
	dw Unknown_115f9c
	dw Unknown_115fb1
	dw Unknown_115fc6
	dw Unknown_115fdb
	dw Unknown_115ff0
	dw Unknown_116005

Unknown_115ea6: ; 115ea6
	db $4
	db $8, $0, $60, $1
	db $8, $8, $61, $1
	db $10, $0, $62, $1
	db $10, $8, $63, $1

Unknown_115eb7: ; 115eb7
	db $5
	db $0, $8, $64, $0
	db $8, $0, $60, $1
	db $8, $8, $61, $1
	db $10, $0, $62, $1
	db $10, $8, $63, $1

Unknown_115ecc: ; 115ecc
	db $5
	db $0, $8, $65, $0
	db $8, $0, $60, $1
	db $8, $8, $61, $1
	db $10, $0, $62, $1
	db $10, $8, $63, $1

Unknown_115ee1: ; 115ee1
	db $5
	db $0, $8, $66, $0
	db $8, $0, $60, $1
	db $8, $8, $61, $1
	db $10, $0, $62, $1
	db $10, $8, $63, $1

Unknown_115ef6: ; 115ef6
	db $7
	db $0, $0, $67, $1
	db $8, $0, $68, $1
	db $10, $0, $6d, $0
	db $10, $8, $69, $0
	db $10, $10, $6a, $0
	db $18, $8, $6b, $0
	db $18, $10, $6c, $0

Unknown_115f13: ; 115f13
	db $7
	db $0, $0, $67, $1
	db $8, $0, $68, $1
	db $10, $0, $6e, $0
	db $10, $8, $69, $0
	db $10, $10, $6a, $0
	db $18, $8, $6b, $0
	db $18, $10, $6c, $0

Unknown_115f30: ; 115f30
	db $7
	db $0, $0, $67, $1
	db $8, $0, $68, $1
	db $10, $0, $6f, $0
	db $10, $8, $69, $0
	db $10, $10, $6a, $0
	db $18, $8, $6b, $0
	db $18, $10, $6c, $0

Unknown_115f4d: ; 115f4d
	db $7
	db $0, $0, $67, $1
	db $8, $0, $68, $1
	db $10, $0, $70, $0
	db $10, $8, $69, $0
	db $10, $10, $6a, $0
	db $18, $8, $6b, $0
	db $18, $10, $6c, $0

Unknown_115f6a: ; 115f6a
	db $7
	db $0, $0, $67, $1
	db $8, $0, $68, $1
	db $10, $0, $71, $0
	db $10, $8, $69, $0
	db $10, $10, $6a, $0
	db $18, $8, $6b, $0
	db $18, $10, $6c, $0

Unknown_115f87: ; 115f87
	db $5
	db $0, $8, $72, $0
	db $8, $0, $60, $1
	db $8, $8, $61, $1
	db $10, $0, $62, $1
	db $10, $8, $63, $1

Unknown_115f9c: ; 115f9c
	db $5
	db $0, $8, $73, $0
	db $8, $0, $60, $1
	db $8, $8, $61, $1
	db $10, $0, $62, $1
	db $10, $8, $63, $1

Unknown_115fb1: ; 115fb1
	db $5
	db $1, $8, $64, $60
	db $8, $0, $60, $1
	db $8, $8, $61, $1
	db $10, $0, $62, $1
	db $10, $8, $63, $1

Unknown_115fc6: ; 115fc6
	db $5
	db $1, $8, $65, $60
	db $8, $0, $60, $1
	db $8, $8, $61, $1
	db $10, $0, $62, $1
	db $10, $8, $63, $1

Unknown_115fdb: ; 115fdb
	db $5
	db $1, $8, $66, $60
	db $8, $0, $60, $1
	db $8, $8, $61, $1
	db $10, $0, $62, $1
	db $10, $8, $63, $1

Unknown_115ff0: ; 115ff0
	db $5
	db $1, $8, $72, $60
	db $8, $0, $60, $1
	db $8, $8, $61, $1
	db $10, $0, $62, $1
	db $10, $8, $63, $1

Unknown_116005: ; 116005
	db $5
	db $1, $8, $73, $60
	db $8, $0, $60, $1
	db $8, $8, $61, $1
	db $10, $0, $62, $1
	db $10, $8, $63, $1
; 11601a

GFX_11601a:: ; 11601a
INCBIN "gfx/unknown/11601a.2bpp"

Function11615a: ; 11615a
	xor a
	ld [wc30d], a
	ld [wPartyMonMenuIconAnims + 5], a
	ld [wc310], a
	ld [wc311], a
	ld [wc312], a
	ld [wc313], a
	ld [wPartyMonMenuIconAnims], a
	ld [wPartyMonMenuIconAnims + 1], a
	ld [wPartyMonMenuIconAnims + 4], a
	ld [wc3f6], a
	ld [wc3f8], a
	ld [wc3f2], a
	ld [wc3f4], a
	ld a, $24
	ld [wc3f5], a
	ld a, $7
	ld [wc3f7], a
	ld a, $b0
	ld [wc30e], a
	ld [wc3f1], a
	ld a, $48
	ld [wc30f], a
	ld [wc3f3], a
	ret
; 11619d

Function11619d: ; 11619d
	ld a, [wc30d]
	and a
	ret z
	ld a, [wPartyMonMenuIconAnims + 5]
	cp $2
	jr c, .asm_1161b4
	ld a, $a0
	ld hl, Sprites
	ld bc, $0064
	call ByteFill

.asm_1161b4
	call Function1161b8
	ret
; 1161b8

Function1161b8: ; 1161b8
	ld a, [wPartyMonMenuIconAnims + 5]
	ld e, a
	ld d, 0
	ld hl, Jumptable_1161c7
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1161c7

Jumptable_1161c7: ; 1161c7
	dw Function1161d5
	dw Function116294
	dw Function1162cb
	dw Function1162f2
	dw Function1163c0
	dw Function11636e
	dw Function116441
; 1161d5

Function1161d5: ; 1161d5
	ld a, [rSVBK]
	push af

	ld a, $6
	ld [rSVBK], a

	ld hl, Unknown_117356
	ld de, w6_d000
	ld bc, $0300
	call CopyBytes

	di

.asm_1161e9
	ld a, [rLY]
	cp $91
	jr nz, .asm_1161e9

	ld a, $d0
	ld [rHDMA1], a
	ld a, $0
	ld [rHDMA2], a
	ld a, $1c
	ld [rHDMA3], a
	xor a
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	ld a, $d0
	ld [rHDMA1], a
	ld a, $80
	ld [rHDMA2], a
	ld a, $1c
	ld [rHDMA3], a
	ld a, $80
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	ld a, $d1
	ld [rHDMA1], a
	ld a, $0
	ld [rHDMA2], a
	ld a, $1d
	ld [rHDMA3], a
	xor a
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	ld a, $1
	ld [rVBK], a

	ld a, $d1
	ld [rHDMA1], a
	ld a, $80
	ld [rHDMA2], a
	ld a, $1c
	ld [rHDMA3], a
	xor a
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	ld a, $d2
	ld [rHDMA1], a
	ld a, $0
	ld [rHDMA2], a
	ld a, $1c
	ld [rHDMA3], a
	ld a, $80
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	ld a, $d2
	ld [rHDMA1], a
	ld a, $80
	ld [rHDMA2], a
	ld a, $1d
	ld [rHDMA3], a
	xor a
	ld [rHDMA4], a
	ld a, $8
	ld [rHDMA5], a

	xor a
	ld [rVBK], a

	ei

	pop af
	ld [rSVBK], a

	callba Function104061
	ld a, $8
	ld [MusicFade], a
	ld de, MUSIC_MOBILE_ADAPTER
	ld a, e
	ld [wc2a9], a
	ld a, d
	ld [wc2aa], a
	ld a, [wPartyMonMenuIconAnims + 5]
	inc a
	ld [wPartyMonMenuIconAnims + 5], a
	ret
; 11628c

MenuDataHeader_11628c: ; 11628c
	db $40 ; flags
	db  6,  0 ; start coords
	db 17, 19 ; end coords
	dw NULL
	db 0 ; default option
; 116294

Function116294: ; 116294
	callba Function170d02
	ld a, [wPartyMonMenuIconAnims + 5]
	inc a
	ld [wPartyMonMenuIconAnims + 5], a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, wd030
	ld de, wPartyMonMenuIconAnims + 12
	ld bc, $0010
	call CopyBytes
	ld hl, Palette_11734e
	ld de, Unkn1Pals + 8 * 7
	ld bc, $0008
	call CopyBytes
	call SetPalettes
	pop af
	ld [rSVBK], a
	ld a, $30
	ld [hWY], a
	ret
; 1162cb

Function1162cb: ; 1162cb
	callba Function170cc6
	ld a, [wPartyMonMenuIconAnims + 5]
	inc a
	ld [wPartyMonMenuIconAnims + 5], a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_11730e
	ld de, wd050
	ld bc, $0030
	call CopyBytes
	call SetPalettes
	pop af
	ld [rSVBK], a
	ret
; 1162f2

Function1162f2: ; 1162f2
	call Function11659d
	call Function116758
	call Function1167a6
	ld a, [wc310]
	cp $fd
	ret z
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_1168c5
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld a, [wc30e]
	ld c, a
	ld a, [wc30f]
	ld b, a
	ld a, [wPartyMonMenuIconAnims + 4]
	ld e, a
	ld a, [hli]
	sub e
	ld de, Sprites + $24
.asm_116321
	push af
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .asm_116321
	call Function116468
	ld a, [wc3f5]
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_1168c5
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld a, [wc3f1]
	ld c, a
	ld a, [wc3f3]
	ld b, a
	ld a, [wc3f8]
	ld e, a
	ld a, [hli]
	sub e
	ld de, Sprites
.asm_11635a
	push af
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .asm_11635a
	ret
; 11636e

Function11636e: ; 11636e
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld de, Unkn1Pals
	ld bc, $0040
	call CopyBytes
	pop af
	ld [rSVBK], a
	call SetPalettes
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, $a0
	ld hl, Sprites
	ld bc, $0040
	call ByteFill
	ld a, $90
	ld [hWY], a
	call UpdateSprites
	pop af
	ld [rSVBK], a
	callba Function104061
	ld a, $8
	ld [MusicFade], a
	ld a, [wc2c0]
	ld [wc2a9], a
	xor a
	ld [wc2aa], a
	xor a
	ld [wPartyMonMenuIconAnims + 5], a
	ld [wc30d], a
	ret
; 1163c0

Function1163c0: ; 1163c0
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, $a0
	ld hl, Sprites
	ld bc, $0040
	call ByteFill
	call DelayFrame
	callba Function14146
	ld b, $9
	call GetSGBLayout
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, wPartyMonMenuIconAnims + 12
	ld de, wd030
	ld bc, $0010
	call CopyBytes
	pop af
	ld [rSVBK], a
	call SetPalettes
	call DelayFrame
	ld a, $90
	ld [hWY], a
	call UpdateSprites
	callba Function14157
	pop af
	ld [rSVBK], a
	callba Function104061
	ld a, [wLinkMode]
	cp $4
	jr z, .asm_11642a
	ld a, $8
	ld [MusicFade], a
	ld a, [wc2c0]
	ld [wc2a9], a
	xor a
	ld [wc2aa], a
	jr .asm_116439

.asm_11642a
	ld a, $8
	ld [MusicFade], a
	ld a, $0
	ld [wc2a9], a
	ld a, $0
	ld [wc2aa], a

.asm_116439
	xor a
	ld [wPartyMonMenuIconAnims + 5], a
	ld [wc30d], a
	ret
; 116441

Function116441: ; 116441
	callba Function17d405
	ld a, $90
	ld [hWY], a
	callba Function104061
	ld a, $8
	ld [MusicFade], a
	ld a, [wc2c0]
	ld [wc2a9], a
	xor a
	ld [wc2aa], a
	xor a
	ld [wPartyMonMenuIconAnims + 5], a
	ld [wc30d], a
	ret
; 116468

Function116468: ; 116468
	call Function116567
	ld a, [wPartyMonMenuIconAnims]
	cp $d
	jr nz, .asm_1164a8
	ld hl, wc30e
	ld a, [hl]
	cp $50
	jr nc, .asm_116484
	ld a, $50
	sub [hl]
	add $50
	ld [wc3f1], a
	jr .asm_11648d

.asm_116484
	sub $50
	ld c, a
	ld a, $50
	sub c
	ld [wc3f1], a

.asm_11648d
	ld hl, wc30f
	ld a, [hl]
	cp $60
	jr nc, .asm_11649e
	ld a, $60
	sub [hl]
	add $60
	ld [wc3f3], a
	ret

.asm_11649e
	sub $60
	ld c, a
	ld a, $60
	sub c
	ld [wc3f3], a
	ret

.asm_1164a8
	ld hl, wc30e
	ld a, $b0
	cp [hl]
	jr nc, .asm_1164b8
	ld a, [wc3f1]
	and a
	jr z, .asm_11650b
	jr .asm_1164f2

.asm_1164b8
	ld a, [wc3f1]
	sub [hl]
	jr nc, .asm_1164c1
	xor $ff
	inc a

.asm_1164c1
	ld b, a
	ld c, $0
	ld a, $5
.asm_1164c6
	srl b
	rr c
	dec a
	jr nz, .asm_1164c6
	ld a, c
	ld [wc3fa], a
	ld a, b
	ld [wc3f9], a
	ld a, [wc3f1]
	sub [hl]
	jr c, .asm_1164f2
	ld c, $0
	ld a, [wc3fa]
	xor $ff
	add $1
	rl c
	ld [wc3fa], a
	ld a, [wc3f9]
	xor $ff
	add c
	ld [wc3f9], a

.asm_1164f2
	ld a, [wc3f2]
	ld l, a
	ld a, [wc3f1]
	ld h, a
	ld a, [wc3fa]
	ld e, a
	ld a, [wc3f9]
	ld d, a
	add hl, de
	ld a, l
	ld [wc3f2], a
	ld a, h
	ld [wc3f1], a

.asm_11650b
	ld hl, wc30f
	ld a, $b0
	cp [hl]
	jr c, .asm_11654d
	ld a, [wc3f3]
	sub [hl]
	jr nc, .asm_11651c
	xor $ff
	inc a

.asm_11651c
	ld b, a
	ld c, $0
	ld a, $5
.asm_116521
	srl b
	rr c
	dec a
	jr nz, .asm_116521
	ld a, c
	ld [wc3fc], a
	ld a, b
	ld [wc3fb], a
	ld a, [wc3f3]
	sub [hl]
	jr c, .asm_11654d
	ld c, $0
	ld a, [wc3fc]
	xor $ff
	add $1
	rl c
	ld [wc3fc], a
	ld a, [wc3fb]
	xor $ff
	add c
	ld [wc3fb], a

.asm_11654d
	ld a, [wc3f4]
	ld l, a
	ld a, [wc3f3]
	ld h, a
	ld a, [wc3fc]
	ld e, a
	ld a, [wc3fb]
	ld d, a
	add hl, de
	ld a, l
	ld [wc3f4], a
	ld a, h
	ld [wc3f3], a
	ret
; 116567

Function116567: ; 116567
	ld hl, wc3f7
	dec [hl]
	ret nz
	ld hl, wc3f6
	inc [hl]
.asm_116570
	ld a, $7
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_1167eb
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	pop hl
	ld a, [wc3f6]
	sla a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	cp $fe
	jr nz, .asm_116595
	xor a
	ld [wc3f6], a
	jr .asm_116570

.asm_116595
	ld [wc3f5], a
	ld a, [hl]
	ld [wc3f7], a
	ret
; 11659d

Function11659d: ; 11659d
	ld a, [wPartyMonMenuIconAnims]
	cp $12
	ret nc
	ld e, a
	ld d, 0
	ld hl, Jumptable_1165af
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1165af

Jumptable_1165af: ; 1165af
	dw Function11677e
	dw Function1165d5
	dw Function1165d8
	dw Function1165e3
	dw Function1165f5
	dw Function116600
	dw Function116615
	dw Function116618
	dw Function116623
	dw Function116635
	dw Function116640
	dw Function116655
	dw Function11665c
	dw Function11668d
	dw Function11669f
	dw Function1166a2
	dw Function1166c4
	dw Function1166d6
	dw Function1166d6
; 1165d5

Function1165d5: ; 1165d5
	call Function11678e

Function1165d8:
	ld a, $0
	ld c, a
	ld a, $ff
	ld b, a
	ld a, $a8
	call Function1166f4

Function1165e3:
	call Function116747
	ld a, [wc30e]
	cp $e8
	ret nz
	ld a, $1
	call Function116780
	ret c
	jp Function116797
; 1165f5

Function1165f5: ; 1165f5
	ld a, $1
	ld c, a
	ld a, $1
	ld b, a
	ld a, $e8
	call Function1166f4

Function116600:
	call Function116747
	ld a, [wc30e]
	cp $a8
	ret nz
	ld a, $1
	call Function116780
	ret c
	ld a, $2
	ld [wPartyMonMenuIconAnims], a
	ret
; 116615

Function116615: ; 116615
	call Function11678e

Function116618:
	ld a, $3
	ld c, a
	ld a, $1
	ld b, a
	ld a, $28
	call Function11671f

Function116623:
	call Function116747
	ld a, [wc30f]
	cp $a0
	ret nz
	ld a, $6
	call Function116780
	ret c
	jp Function116797
; 116635

Function116635: ; 116635
	ld a, $2
	ld c, a
	ld a, $ff
	ld b, a
	ld a, $a0
	call Function11671f

Function116640:
	call Function116747
	ld a, [wc30f]
	cp $28
	ret nz
	ld a, $6
	call Function116780
	ret c
	ld a, $7
	ld [wPartyMonMenuIconAnims], a
	ret
; 116655

Function116655: ; 116655
	xor a
	ld [wPartyMonMenuIconAnims + 3], a
	call Function11678e

Function11665c:
	ld hl, wPartyMonMenuIconAnims + 3
	ld a, $1
	xor [hl]
	ld [hl], a
	add $4
	ld c, a
	call Function11679c
	ld a, [wPartyMonMenuIconAnims + 3]
	and a
	jr nz, .asm_116673
	ld a, $48
	jr .asm_116675

.asm_116673
	ld a, $78

.asm_116675
	ld [wc30f], a
	call Random
	ld a, [hRandomAdd]
	and $7
	sla a
	sla a
	sla a
	add $30
	ld [wc30e], a
	call Function116797

Function11668d:
	ld a, [wc311]
	cp $ff
	ret nz
	ld a, $b
	call Function116780
	ret c
	ld a, $c
	ld [wPartyMonMenuIconAnims], a
	ret
; 11669f

Function11669f: ; 11669f
	call Function11678e

Function1166a2:
	ld a, $a8
	ld [wc30e], a
	ld [wc3f1], a
	ld a, $60
	ld [wc30f], a
	ld [wc3f3], a
	ld a, $ff
	ld [wPartyMonMenuIconAnims + 2], a
	xor a
	ld [wPartyMonMenuIconAnims + 3], a
	ld a, $0
	ld c, a
	call Function11679c
	call Function116797

Function1166c4:
	call Function116747
	ld a, [wc30e]
	cp $58
	ret nz
	ld a, $6
	ld c, a
	call Function11679c
	call Function116797

Function1166d6:
	call Function116747
	ld a, [wc30e]
	cp $48
	jr nz, .asm_1166e4
	xor a
	ld [wPartyMonMenuIconAnims + 2], a

.asm_1166e4
	ld a, [wc311]
	cp $ff
	ret nz
	ld a, $4
	ld [wPartyMonMenuIconAnims + 5], a
	xor a
	ld [wPartyMonMenuIconAnims], a
	ret
; 1166f4

Function1166f4: ; 1166f4
	ld [wc30e], a
	ld a, b
	ld [wPartyMonMenuIconAnims + 2], a
	xor a
	ld [wPartyMonMenuIconAnims + 3], a
	ld hl, wc30f
.asm_116702
	call Random
	ld a, [hRandomAdd]
	and $7
	jr z, .asm_11670c
	dec a

.asm_11670c
	sla a
	sla a
	sla a
	add $48
	cp [hl]
	jr z, .asm_116702
	ld [hl], a
	call Function11679c
	call Function116797
	ret
; 11671f

Function11671f: ; 11671f
	ld [wc30f], a
	ld a, b
	ld [wPartyMonMenuIconAnims + 3], a
	xor a
	ld [wPartyMonMenuIconAnims + 2], a
	ld hl, wc30e
.asm_11672d
	call Random
	ld a, [hRandomAdd]
	and $7
	sla a
	sla a
	sla a
	add $30
	cp [hl]
	jr z, .asm_11672d
	ld [hl], a
	call Function11679c
	call Function116797
	ret
; 116747

Function116747: ; 116747
	ld hl, wc30e
	ld a, [wPartyMonMenuIconAnims + 2]
	add [hl]
	ld [hl], a
	ld hl, wc30f
	ld a, [wPartyMonMenuIconAnims + 3]
	add [hl]
	ld [hl], a
	ret
; 116758

Function116758: ; 116758
	ld a, [wc30f]
	cp $30
	jr c, .asm_116770
	jr z, .asm_116770
	cp $38
	jr c, .asm_116774
	jr z, .asm_116774
	cp $40
	jr c, .asm_116778
	jr z, .asm_116778
	xor a
	jr .asm_11677a

.asm_116770
	ld a, $c
	jr .asm_11677a

.asm_116774
	ld a, $8
	jr .asm_11677a

.asm_116778
	ld a, $4

.asm_11677a
	ld [wPartyMonMenuIconAnims + 4], a
	ret
; 11677e

Function11677e: ; 11677e
	ld a, $0

Function116780:
	ld hl, wPartyMonMenuIconAnims + 1
	cp [hl]
	jr z, .asm_11678c
	ld a, [hl]
	ld [wPartyMonMenuIconAnims], a
	scf
	ret

.asm_11678c
	and a
	ret
; 11678e

Function11678e: ; 11678e
	ld hl, wPartyMonMenuIconAnims
	ld a, [hl]
	ld [wPartyMonMenuIconAnims + 1], a
	inc [hl]
	ret
; 116797

Function116797: ; 116797
	ld hl, wPartyMonMenuIconAnims
	inc [hl]
	ret
; 11679c

Function11679c:
	ld a, c
	ld [wc311], a
	xor a
	ld [wc312], a
	jr asm_1167af

Function1167a6: ; 1167a6
	ld hl, wc313
	dec [hl]
	ret nz
	ld hl, wc312
	inc [hl]

asm_1167af
.asm_1167af
	ld a, [wc311]
	cp $ff
	ret z
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_1167eb
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	pop hl
	ld a, [wc312]
	sla a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	cp $ff
	jr z, .asm_1167dc
	cp $fe
	jr nz, .asm_1167e3
	xor a
	ld [wc312], a
	jr .asm_1167af

.asm_1167dc
	ld a, $ff
	ld [wc311], a
	ld a, $fd

.asm_1167e3
	ld [wc310], a
	ld a, [hl]
	ld [wc313], a
	ret
; 1167eb

Unknown_1167eb:
	dw Unknown_1167fb
	dw Unknown_116808
	dw Unknown_116867
	dw Unknown_116870
	dw Unknown_116815
	dw Unknown_11683e
	dw Unknown_116881
	dw Unknown_1168ae

Unknown_1167fb: ; 1167fb
	db $0, $6
	db $1, $4
	db $2, $4
	db $3, $6
	db $2, $4
	db $1, $4
	db $fe

Unknown_116808: ; 116808
	db $4, $6
	db $5, $4
	db $6, $4
	db $7, $6
	db $6, $4
	db $5, $4
	db $fe

Unknown_116815: ; 116815
	db $fd, $20
	db $8, $c
	db $9, $24
	db $a, $4
	db $b, $8
	db $a, $4
	db $9, $6
	db $c, $4
	db $d, $8
	db $c, $5
	db $9, $24
	db $a, $4
	db $b, $8
	db $a, $4
	db $9, $6
	db $c, $4
	db $d, $8
	db $c, $5
	db $9, $8
	db $8, $4
	db $ff

Unknown_11683e: ; 11683e
	db $fd, $20
	db $e, $c
	db $f, $24
	db $10, $4
	db $11, $8
	db $10, $4
	db $f, $6
	db $12, $4
	db $13, $8
	db $12, $5
	db $f, $24
	db $10, $4
	db $11, $8
	db $10, $4
	db $f, $6
	db $12, $4
	db $13, $8
	db $12, $5
	db $f, $8
	db $e, $4
	db $ff

Unknown_116867: ; 116867
	db $14, $8
	db $15, $8
	db $16, $8
	db $15, $8
	db $fe

Unknown_116870: ; 116870
	db $17, $5
	db $18, $5
	db $19, $5
	db $1a, $5
	db $1b, $5
	db $1a, $5
	db $19, $5
	db $18, $5
	db $fe

Unknown_116881: ; 116881
	db $1c, $7
	db $1d, $7
	db $1e, $a
	db $1f, $a
	db $20, $5
	db $21, $5
	db $20, $5
	db $21, $5
	db $20, $18
	db $22, $4
	db $23, $2
	db $22, $2
	db $23, $2
	db $22, $1
	db $23, $1
	db $22, $1
	db $23, $4
	db $fd, $1
	db $23, $1
	db $fd, $2
	db $23, $2
	db $fd, $40
	db $ff

Unknown_1168ae: ; 1168ae
	db $24, $4
	db $25, $4
	db $26, $4
	db $27, $4
	db $28, $4
	db $29, $4
	db $2a, $4
	db $2b, $4
	db $2c, $4
	db $2d, $4
	db $2e, $4
	db $fe
; 1168c5

Unknown_1168c5:
	dw Unknown_116923
	dw Unknown_116960
	dw Unknown_1169a1
	dw Unknown_1169de
	dw Unknown_116a1b
	dw Unknown_116a58
	dw Unknown_116a99
	dw Unknown_116ad6
	dw Unknown_116d1b
	dw Unknown_116d4c
	dw Unknown_116d85
	dw Unknown_116dbe
	dw Unknown_116df7
	dw Unknown_116e30
	dw Unknown_116e69
	dw Unknown_116e9a
	dw Unknown_116ed3
	dw Unknown_116f0c
	dw Unknown_116f45
	dw Unknown_116f7e
	dw Unknown_116b13
	dw Unknown_116b54
	dw Unknown_116b95
	dw Unknown_116bd6
	dw Unknown_116c17
	dw Unknown_116c58
	dw Unknown_116c99
	dw Unknown_116cda
	dw Unknown_116fb7
	dw Unknown_116fec
	dw Unknown_117025
	dw Unknown_117056
	dw Unknown_117083
	dw Unknown_1170c0
	dw Unknown_1170fd
	dw Unknown_11713a
	dw Unknown_117177
	dw Unknown_11719c
	dw Unknown_1171c1
	dw Unknown_1171e6
	dw Unknown_11720b
	dw Unknown_117230
	dw Unknown_117255
	dw Unknown_11727a
	dw Unknown_11729f
	dw Unknown_1172c4
	dw Unknown_1172e9

Unknown_116923: ; 116923
	db $f
	db $0, $0, $1, $a
	db $0, $8, $2, $d
	db $0, $10, $3, $d
	db $0, $18, $4, $d
	db $8, $0, $11, $a
	db $8, $8, $12, $a
	db $8, $10, $13, $a
	db $8, $18, $14, $d
	db $10, $0, $21, $a
	db $10, $8, $22, $a
	db $10, $10, $23, $a
	db $10, $18, $24, $a
	db $18, $0, $31, $a
	db $18, $8, $32, $a
	db $18, $10, $33, $a

Unknown_116960: ; 116960
	db $10
	db $1, $0, $1, $a
	db $1, $8, $2, $d
	db $1, $10, $3, $d
	db $1, $18, $4, $d
	db $9, $0, $11, $a
	db $9, $8, $12, $a
	db $9, $10, $13, $a
	db $9, $18, $14, $d
	db $11, $0, $5, $a
	db $11, $8, $6, $a
	db $11, $10, $7, $a
	db $11, $18, $34, $a
	db $19, $0, $15, $a
	db $19, $8, $16, $a
	db $19, $10, $17, $a
	db $19, $18, $35, $a

Unknown_1169a1: ; 1169a1
	db $f
	db $1, $0, $1, $a
	db $1, $8, $2, $d
	db $1, $10, $3, $d
	db $1, $18, $4, $d
	db $9, $0, $11, $a
	db $9, $8, $12, $a
	db $9, $10, $13, $a
	db $9, $18, $14, $d
	db $11, $0, $25, $a
	db $11, $8, $26, $a
	db $11, $10, $27, $a
	db $11, $18, $34, $a
	db $19, $8, $36, $a
	db $19, $10, $37, $a
	db $19, $18, $35, $a

Unknown_1169de: ; 1169de
	db $f
	db $0, $0, $1, $a
	db $0, $8, $2, $d
	db $0, $10, $3, $d
	db $0, $18, $4, $d
	db $8, $0, $11, $a
	db $8, $8, $12, $a
	db $8, $10, $13, $a
	db $8, $18, $14, $d
	db $10, $0, $10, $a
	db $10, $8, $20, $a
	db $10, $10, $30, $a
	db $10, $18, $24, $a
	db $18, $0, $31, $a
	db $18, $8, $32, $a
	db $18, $10, $33, $a

Unknown_116a1b: ; 116a1b
	db $f
	db $0, $0, $4, $2d
	db $0, $8, $3, $2d
	db $0, $10, $2, $2d
	db $0, $18, $1, $2a
	db $8, $0, $14, $2d
	db $8, $8, $13, $2a
	db $8, $10, $12, $2a
	db $8, $18, $11, $2a
	db $10, $0, $24, $2a
	db $10, $8, $23, $2a
	db $10, $10, $22, $2a
	db $10, $18, $21, $2a
	db $18, $8, $33, $2a
	db $18, $10, $32, $2a
	db $18, $18, $31, $2a

Unknown_116a58: ; 116a58
	db $10
	db $1, $0, $4, $2d
	db $1, $8, $3, $2d
	db $1, $10, $2, $2d
	db $1, $18, $1, $2a
	db $9, $0, $14, $2d
	db $9, $8, $13, $2a
	db $9, $10, $12, $2a
	db $9, $18, $11, $2a
	db $11, $0, $34, $2a
	db $11, $8, $7, $2a
	db $11, $10, $6, $2a
	db $11, $18, $5, $2a
	db $19, $0, $35, $2a
	db $19, $8, $17, $2a
	db $19, $10, $16, $2a
	db $19, $18, $15, $2a

Unknown_116a99: ; 116a99
	db $f
	db $1, $0, $4, $2d
	db $1, $8, $3, $2d
	db $1, $10, $2, $2d
	db $1, $18, $1, $2a
	db $9, $0, $14, $2d
	db $9, $8, $13, $2a
	db $9, $10, $12, $2a
	db $9, $18, $11, $2a
	db $11, $0, $34, $2a
	db $11, $8, $27, $2a
	db $11, $10, $26, $2a
	db $11, $18, $25, $2a
	db $19, $0, $35, $2a
	db $19, $8, $37, $2a
	db $19, $10, $36, $2a

Unknown_116ad6: ; 116ad6
	db $f
	db $0, $0, $4, $2d
	db $0, $8, $3, $2d
	db $0, $10, $2, $2d
	db $0, $18, $1, $2a
	db $8, $0, $14, $2d
	db $8, $8, $13, $2a
	db $8, $10, $12, $2a
	db $8, $18, $11, $2a
	db $10, $0, $24, $2a
	db $10, $8, $30, $2a
	db $10, $10, $20, $2a
	db $10, $18, $10, $2a
	db $18, $8, $33, $2a
	db $18, $10, $32, $2a
	db $18, $18, $31, $2a

Unknown_116b13: ; 116b13
	db $10
	db $18, $0, $0, $b
	db $18, $8, $8, $b
	db $18, $10, $5c, $b
	db $18, $18, $0, $b
	db $10, $0, $0, $b
	db $10, $8, $5d, $b
	db $10, $10, $5e, $b
	db $10, $18, $0, $b
	db $8, $0, $50, $b
	db $8, $8, $51, $b
	db $8, $10, $52, $b
	db $8, $18, $50, $2b
	db $0, $0, $43, $b
	db $0, $8, $44, $b
	db $0, $10, $44, $2b
	db $0, $18, $43, $2b

Unknown_116b54: ; 116b54
	db $10
	db $19, $0, $0, $b
	db $19, $8, $18, $b
	db $19, $10, $c, $b
	db $19, $18, $0, $b
	db $11, $0, $42, $b
	db $11, $8, $3a, $b
	db $11, $10, $3a, $2b
	db $11, $18, $42, $2b
	db $9, $0, $58, $b
	db $9, $8, $45, $b
	db $9, $10, $45, $2b
	db $9, $18, $58, $2b
	db $1, $0, $d, $b
	db $1, $8, $44, $b
	db $1, $10, $44, $2b
	db $1, $18, $d, $2b

Unknown_116b95: ; 116b95
	db $10
	db $18, $0, $0, $b
	db $18, $8, $5c, $2b
	db $18, $10, $8, $2b
	db $18, $18, $0, $b
	db $10, $0, $0, $b
	db $10, $8, $5e, $2b
	db $10, $10, $5d, $2b
	db $10, $18, $0, $b
	db $8, $0, $50, $b
	db $8, $8, $52, $2b
	db $8, $10, $51, $2b
	db $8, $18, $50, $2b
	db $0, $0, $43, $b
	db $0, $8, $44, $b
	db $0, $10, $44, $2b
	db $0, $18, $43, $2b

Unknown_116bd6: ; 116bd6
	db $10
	db $18, $0, $0, $a
	db $18, $8, $56, $a
	db $18, $10, $57, $a
	db $18, $18, $0, $a
	db $10, $0, $64, $a
	db $10, $8, $4a, $a
	db $10, $10, $4b, $a
	db $10, $18, $71, $a
	db $8, $0, $54, $a
	db $8, $8, $55, $a
	db $8, $10, $55, $2a
	db $8, $18, $54, $2a
	db $0, $0, $48, $a
	db $0, $8, $49, $a
	db $0, $10, $49, $2a
	db $0, $18, $48, $2a

Unknown_116c17: ; 116c17
	db $10
	db $19, $0, $0, $a
	db $19, $8, $76, $a
	db $19, $10, $77, $a
	db $19, $18, $0, $a
	db $11, $0, $64, $a
	db $11, $8, $69, $a
	db $11, $10, $6a, $a
	db $11, $18, $6b, $a
	db $9, $0, $6f, $a
	db $9, $8, $70, $a
	db $9, $10, $70, $2a
	db $9, $18, $6f, $2a
	db $1, $0, $63, $a
	db $1, $8, $19, $a
	db $1, $10, $19, $2a
	db $1, $18, $63, $2a

Unknown_116c58: ; 116c58
	db $10
	db $1a, $0, $6c, $a
	db $1a, $8, $6d, $a
	db $1a, $10, $6e, $a
	db $1a, $18, $0, $a
	db $12, $0, $5f, $a
	db $12, $8, $60, $a
	db $12, $10, $61, $a
	db $12, $18, $62, $a
	db $a, $0, $53, $a
	db $a, $8, $55, $a
	db $a, $10, $55, $2a
	db $a, $18, $53, $2a
	db $2, $0, $46, $a
	db $2, $8, $47, $a
	db $2, $10, $47, $2a
	db $2, $18, $46, $2a

Unknown_116c99: ; 116c99
	db $10
	db $19, $0, $0, $2a
	db $19, $8, $77, $2a
	db $19, $10, $76, $2a
	db $19, $18, $0, $2a
	db $11, $0, $6b, $2a
	db $11, $8, $6a, $2a
	db $11, $10, $69, $2a
	db $11, $18, $64, $2a
	db $9, $0, $6f, $a
	db $9, $8, $70, $a
	db $9, $10, $70, $2a
	db $9, $18, $6f, $2a
	db $1, $0, $63, $a
	db $1, $8, $19, $a
	db $1, $10, $19, $2a
	db $1, $18, $63, $2a

Unknown_116cda: ; 116cda
	db $10
	db $18, $0, $0, $a
	db $18, $8, $57, $2a
	db $18, $10, $56, $2a
	db $18, $18, $0, $a
	db $10, $0, $71, $2a
	db $10, $8, $4b, $2a
	db $10, $10, $4a, $2a
	db $10, $18, $64, $2a
	db $8, $0, $54, $a
	db $8, $8, $55, $a
	db $8, $10, $55, $2a
	db $8, $18, $54, $2a
	db $0, $0, $48, $a
	db $0, $8, $49, $a
	db $0, $10, $49, $2a
	db $0, $18, $48, $2a

Unknown_116d1b: ; 116d1b
	db $c
	db $0, $0, $38, $4a
	db $0, $8, $39, $4a
	db $0, $10, $39, $6a
	db $0, $18, $38, $6a
	db $8, $0, $28, $4a
	db $8, $8, $29, $4a
	db $8, $10, $29, $6a
	db $8, $18, $28, $6a
	db $10, $0, $9, $4d
	db $10, $8, $19, $4a
	db $10, $10, $19, $6a
	db $10, $18, $9, $6d

Unknown_116d4c: ; 116d4c
	db $e
	db $0, $8, $3b, $4a
	db $0, $10, $3b, $6a
	db $8, $0, $2a, $4a
	db $8, $8, $2b, $4a
	db $8, $10, $2b, $6a
	db $8, $18, $2a, $6a
	db $10, $0, $1a, $4a
	db $10, $8, $1b, $4a
	db $10, $10, $1b, $6a
	db $10, $18, $1a, $6a
	db $18, $0, $a, $4a
	db $18, $8, $b, $4a
	db $18, $10, $b, $6a
	db $18, $18, $a, $6a

Unknown_116d85: ; 116d85
	db $e
	db $0, $0, $35, $2a
	db $0, $8, $3c, $4a
	db $0, $10, $3d, $4a
	db $0, $18, $3e, $4a
	db $8, $0, $2c, $4a
	db $8, $8, $2d, $4a
	db $8, $10, $2e, $4a
	db $8, $18, $2f, $4a
	db $10, $0, $1c, $4a
	db $10, $8, $1d, $4a
	db $10, $10, $1e, $4d
	db $10, $18, $1f, $4d
	db $18, $10, $e, $4d
	db $18, $18, $f, $4a

Unknown_116dbe: ; 116dbe
	db $e
	db $0, $0, $65, $4a
	db $0, $8, $66, $4a
	db $0, $10, $67, $4a
	db $0, $18, $68, $4a
	db $8, $8, $59, $4a
	db $8, $10, $5a, $4a
	db $8, $18, $5b, $4a
	db $10, $0, $4c, $4a
	db $10, $8, $4d, $4d
	db $10, $10, $4e, $4d
	db $10, $18, $4f, $4a
	db $18, $0, $3f, $4d
	db $18, $8, $40, $4d
	db $18, $10, $41, $4d

Unknown_116df7: ; 116df7
	db $e
	db $0, $0, $3e, $6a
	db $0, $8, $3d, $6a
	db $0, $10, $3c, $6a
	db $0, $18, $35, $a
	db $8, $0, $2f, $6a
	db $8, $8, $2e, $6a
	db $8, $10, $2d, $6a
	db $8, $18, $2c, $6a
	db $10, $0, $1f, $6d
	db $10, $8, $1e, $6d
	db $10, $10, $1d, $6a
	db $10, $18, $1c, $6a
	db $18, $0, $f, $6a
	db $18, $8, $e, $6d

Unknown_116e30: ; 116e30
	db $e
	db $0, $0, $68, $6a
	db $0, $8, $67, $6a
	db $0, $10, $66, $6a
	db $0, $18, $65, $6a
	db $8, $0, $5b, $6a
	db $8, $8, $5a, $6a
	db $8, $10, $59, $6a
	db $10, $0, $4f, $6a
	db $10, $8, $4e, $6d
	db $10, $10, $4d, $6d
	db $10, $18, $4c, $6a
	db $18, $8, $41, $6d
	db $18, $10, $40, $6d
	db $18, $18, $3f, $6d

Unknown_116e69: ; 116e69
	db $c
	db $8, $0, $9, $d
	db $8, $8, $19, $a
	db $8, $10, $19, $2a
	db $8, $18, $9, $2d
	db $10, $0, $28, $a
	db $10, $8, $29, $a
	db $10, $10, $29, $2a
	db $10, $18, $28, $2a
	db $18, $0, $38, $a
	db $18, $8, $39, $a
	db $18, $10, $39, $2a
	db $18, $18, $38, $2a

Unknown_116e9a: ; 116e9a
	db $e
	db $0, $0, $a, $a
	db $0, $8, $b, $a
	db $0, $10, $b, $2a
	db $0, $18, $a, $2a
	db $8, $0, $1a, $a
	db $8, $8, $1b, $a
	db $8, $10, $1b, $2a
	db $8, $18, $1a, $2a
	db $10, $0, $2a, $a
	db $10, $8, $2b, $a
	db $10, $10, $2b, $2a
	db $10, $18, $2a, $2a
	db $18, $8, $3b, $a
	db $18, $10, $3b, $2a

Unknown_116ed3: ; 116ed3
	db $e
	db $0, $10, $e, $d
	db $0, $18, $f, $a
	db $8, $0, $1c, $a
	db $8, $8, $1d, $a
	db $8, $10, $1e, $d
	db $8, $18, $1f, $d
	db $10, $0, $2c, $a
	db $10, $8, $2d, $a
	db $10, $10, $2e, $a
	db $10, $18, $2f, $a
	db $18, $0, $35, $6a
	db $18, $8, $3c, $a
	db $18, $10, $3d, $a
	db $18, $18, $3e, $a

Unknown_116f0c: ; 116f0c
	db $e
	db $0, $0, $3f, $d
	db $0, $8, $40, $d
	db $0, $10, $41, $d
	db $8, $0, $4c, $a
	db $8, $8, $4d, $d
	db $8, $10, $4e, $d
	db $8, $18, $4f, $a
	db $10, $8, $59, $a
	db $10, $10, $5a, $a
	db $10, $18, $5b, $a
	db $18, $0, $65, $a
	db $18, $8, $66, $a
	db $18, $10, $67, $a
	db $18, $18, $68, $a

Unknown_116f45: ; 116f45
	db $e
	db $0, $0, $f, $2a
	db $0, $8, $e, $2d
	db $8, $0, $1f, $2d
	db $8, $8, $1e, $2d
	db $8, $10, $1d, $2a
	db $8, $18, $1c, $2a
	db $10, $0, $2f, $2a
	db $10, $8, $2e, $2a
	db $10, $10, $2d, $2a
	db $10, $18, $2c, $2a
	db $18, $0, $3e, $2a
	db $18, $8, $3d, $2a
	db $18, $10, $3c, $2a
	db $18, $18, $35, $4a

Unknown_116f7e: ; 116f7e
	db $e
	db $0, $8, $41, $2d
	db $0, $10, $40, $2d
	db $0, $18, $3f, $2d
	db $8, $0, $4f, $2a
	db $8, $8, $4e, $2d
	db $8, $10, $4d, $2d
	db $8, $18, $4c, $2a
	db $10, $0, $5b, $2a
	db $10, $8, $5a, $2a
	db $10, $10, $59, $2a
	db $18, $0, $68, $2a
	db $18, $8, $67, $2a
	db $18, $10, $66, $2a
	db $18, $18, $65, $2a

Unknown_116fb7: ; 116fb7
	db $d
	db $fa, $0, $72, $a
	db $fa, $8, $73, $d
	db $fa, $10, $74, $d
	db $fa, $18, $75, $d
	db $2, $0, $81, $a
	db $2, $8, $82, $a
	db $2, $10, $83, $a
	db $2, $18, $84, $a
	db $a, $0, $91, $a
	db $a, $8, $92, $a
	db $a, $10, $93, $a
	db $a, $18, $94, $a
	db $12, $10, $a3, $a

Unknown_116fec: ; 116fec
	db $e
	db $fd, $0, $85, $d
	db $fd, $8, $86, $d
	db $5, $0, $95, $d
	db $5, $8, $96, $a
	db $5, $10, $97, $a
	db $5, $18, $98, $a
	db $d, $0, $a5, $a
	db $d, $8, $a6, $a
	db $d, $10, $a7, $a
	db $d, $18, $a8, $a
	db $15, $0, $b3, $a
	db $15, $8, $b4, $a
	db $15, $10, $b5, $a
	db $15, $18, $b6, $a

Unknown_117025: ; 117025
	db $c
	db $8, $0, $79, $d
	db $8, $8, $7a, $d
	db $8, $10, $7b, $a
	db $8, $18, $7c, $a
	db $10, $0, $89, $d
	db $10, $8, $8a, $a
	db $10, $10, $8b, $a
	db $10, $18, $8c, $a
	db $18, $0, $99, $a
	db $18, $8, $9a, $a
	db $18, $10, $9b, $a
	db $18, $18, $9c, $a

Unknown_117056: ; 117056
	db $b
	db $8, $0, $7d, $a
	db $8, $8, $7e, $d
	db $8, $10, $7f, $d
	db $8, $18, $80, $a
	db $10, $0, $8d, $a
	db $10, $8, $8e, $a
	db $10, $10, $8f, $a
	db $10, $18, $90, $a
	db $18, $8, $9e, $a
	db $18, $10, $9f, $a
	db $18, $18, $a0, $a

Unknown_117083: ; 117083
	db $f
	db $0, $0, $a1, $a
	db $0, $8, $a2, $a
	db $0, $10, $a2, $2a
	db $0, $18, $a1, $2a
	db $8, $0, $b1, $a
	db $8, $8, $b2, $d
	db $8, $10, $b2, $2d
	db $8, $18, $b1, $2a
	db $10, $0, $ab, $a
	db $10, $8, $ac, $a
	db $10, $10, $ac, $2a
	db $10, $18, $ab, $2a
	db $18, $8, $a4, $a
	db $18, $10, $87, $a
	db $18, $18, $88, $a

Unknown_1170c0: ; 1170c0
	db $f
	db $0, $0, $a1, $a
	db $0, $8, $a2, $d
	db $0, $10, $a2, $2a
	db $0, $18, $a1, $2a
	db $8, $0, $b1, $a
	db $8, $8, $78, $d
	db $8, $10, $78, $2d
	db $8, $18, $b1, $2a
	db $10, $0, $ab, $a
	db $10, $8, $ac, $a
	db $10, $10, $ac, $2a
	db $10, $18, $ab, $2a
	db $18, $8, $a4, $a
	db $18, $10, $87, $a
	db $18, $18, $88, $a

Unknown_1170fd: ; 1170fd
	db $f
	db $0, $0, $a9, $a
	db $0, $8, $aa, $a
	db $0, $10, $aa, $2a
	db $0, $18, $a9, $2a
	db $8, $0, $b7, $a
	db $8, $8, $b8, $a
	db $8, $10, $b8, $2a
	db $8, $18, $b7, $2a
	db $10, $0, $ab, $a
	db $10, $8, $ac, $a
	db $10, $10, $ac, $2a
	db $10, $18, $ad, $a
	db $18, $8, $a4, $a
	db $18, $10, $ba, $a
	db $18, $18, $bb, $a

Unknown_11713a: ; 11713a
	db $f
	db $0, $0, $ae, $c
	db $0, $8, $af, $c
	db $0, $10, $af, $2c
	db $0, $18, $ae, $2c
	db $8, $0, $bc, $c
	db $8, $8, $bd, $c
	db $8, $10, $bd, $2c
	db $8, $18, $bc, $2c
	db $10, $0, $bf, $c
	db $10, $8, $9d, $c
	db $10, $10, $9d, $2c
	db $10, $18, $b0, $c
	db $18, $8, $b9, $c
	db $18, $10, $c0, $c
	db $18, $18, $be, $c

Unknown_117177: ; 117177
	db $9
	db $14, $0, $1f, $6
	db $14, $8, $20, $6
	db $14, $10, $21, $6
	db $c, $0, $10, $6
	db $c, $8, $11, $6
	db $c, $10, $12, $6
	db $4, $0, $1, $6
	db $4, $8, $2, $6
	db $4, $10, $3, $6

Unknown_11719c: ; 11719c
	db $9
	db $14, $0, $22, $6
	db $14, $8, $23, $6
	db $14, $10, $24, $6
	db $c, $0, $13, $6
	db $c, $8, $14, $6
	db $c, $10, $15, $6
	db $4, $0, $4, $6
	db $4, $8, $5, $6
	db $4, $10, $6, $6

Unknown_1171c1: ; 1171c1
	db $9
	db $14, $0, $25, $6
	db $14, $8, $26, $6
	db $14, $10, $27, $6
	db $c, $0, $16, $6
	db $c, $8, $17, $6
	db $c, $10, $18, $6
	db $4, $0, $7, $6
	db $4, $8, $8, $6
	db $4, $10, $9, $6

Unknown_1171e6: ; 1171e6
	db $9
	db $14, $0, $28, $6
	db $14, $8, $29, $6
	db $14, $10, $2a, $6
	db $c, $0, $19, $6
	db $c, $8, $1a, $6
	db $c, $10, $1b, $6
	db $4, $0, $a, $6
	db $4, $8, $b, $6
	db $4, $10, $c, $6

Unknown_11720b: ; 11720b
	db $9
	db $14, $0, $2b, $6
	db $14, $8, $2c, $6
	db $14, $10, $2d, $6
	db $c, $0, $1c, $6
	db $c, $8, $1d, $6
	db $c, $10, $1e, $6
	db $4, $0, $d, $6
	db $4, $8, $e, $6
	db $4, $10, $f, $6

Unknown_117230: ; 117230
	db $9
	db $14, $0, $47, $6
	db $14, $8, $48, $6
	db $14, $10, $49, $6
	db $c, $0, $3b, $6
	db $c, $8, $3c, $6
	db $c, $10, $3b, $26
	db $4, $0, $2e, $6
	db $4, $8, $2f, $6
	db $4, $10, $30, $6

Unknown_117255: ; 117255
	db $9
	db $14, $0, $35, $6
	db $14, $8, $4a, $6
	db $14, $10, $35, $6
	db $c, $0, $3d, $6
	db $c, $8, $35, $6
	db $c, $10, $3d, $26
	db $4, $0, $31, $6
	db $4, $8, $32, $6
	db $4, $10, $31, $26

Unknown_11727a: ; 11727a
	db $9
	db $14, $0, $4b, $6
	db $14, $8, $4c, $6
	db $14, $10, $4d, $6
	db $c, $0, $3e, $6
	db $c, $8, $3f, $6
	db $c, $10, $40, $6
	db $4, $0, $33, $6
	db $4, $8, $34, $6
	db $4, $10, $35, $6

Unknown_11729f: ; 11729f
	db $9
	db $14, $0, $4e, $6
	db $14, $8, $4f, $6
	db $14, $10, $50, $6
	db $c, $0, $41, $6
	db $c, $8, $42, $6
	db $c, $10, $43, $6
	db $4, $0, $35, $6
	db $4, $8, $36, $6
	db $4, $10, $37, $6

Unknown_1172c4: ; 1172c4
	db $9
	db $14, $0, $51, $6
	db $14, $8, $52, $6
	db $14, $10, $35, $6
	db $c, $0, $44, $6
	db $c, $8, $45, $6
	db $c, $10, $46, $6
	db $4, $0, $38, $6
	db $4, $8, $39, $6
	db $4, $10, $3a, $6

Unknown_1172e9: ; 1172e9
	db $9
	db $10, $0, $0, $2
	db $10, $8, $0, $2
	db $10, $10, $0, $2
	db $8, $0, $0, $2
	db $8, $8, $0, $2
	db $c, $10, $1f, $6
	db $0, $0, $0, $2
	db $0, $8, $0, $2
	db $4, $10, $10, $6
; 11730e

Palette_11730e:
	RGB 31, 31, 31
	RGB  7,  5,  4
	RGB 31, 28,  4
	RGB 31,  5,  5
	RGB 31, 31, 31
	RGB  7,  5,  4
	RGB 31, 23,  0
	RGB 31, 28,  4
	RGB 31, 31, 31
	RGB 16, 19, 31
	RGB 17, 31, 31
	RGB 31, 31, 31
	RGB  5,  5,  5
	RGB  7,  5,  4
	RGB 31, 28,  4
	RGB 19, 11,  6
	RGB 31, 31, 31
	RGB  3, 15, 31
	RGB  4, 25, 25
	RGB  0,  7, 12
	RGB 31, 31, 31
	RGB  0, 16,  0
	RGB  0, 16,  0
	RGB  0, 16,  0
	RGB  4, 11, 22
	RGB  0, 16,  0
	RGB  0, 16,  0
	RGB  0, 16,  0
	RGB 22, 11,  8
	RGB  0, 16,  0
	RGB  0, 16,  0
	RGB  0, 16,  0

Palette_11734e:
	RGB 31, 30, 30
	RGB  2,  0,  0
	RGB 10,  9,  9
	RGB 15, 14, 14

Unknown_117356:
	db $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9
	db $c9, $c9, $c9, $c9, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c5, $c6, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c6, $c5, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c3, $c4, $c2, $c2, $c2, $c2, $c2, $c2, $c2, $d8, $c2, $c2, $d8, $c2, $c2, $c2
	db $c2, $c2, $c4, $c3, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c7, $c8, $ca, $cb, $cc, $cd, $ce, $c2, $cf, $d0, $d1, $d2, $d3, $c2, $d4, $d5
	db $d6, $d7, $c8, $c7, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1
	db $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9, $c9
	db $c9, $c9, $c9, $c9, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1, $c1

	db $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
	db $8f, $8f, $8f, $8f, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $0f, $0f, $0f, $0f, $0f, $0f, $0f, $8f, $0f, $0f, $8f, $0f, $0f, $0f
	db $0f, $0f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $8f, $8f, $8f, $8f, $8f, $0f, $8f, $8f, $8f, $8f, $8f, $0f, $8f, $8f
	db $8f, $8f, $af, $af, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
	db $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f, $8f
	db $8f, $8f, $8f, $8f, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08
; 117656


SECTION "Mobile Stadium", ROMX, BANK[$45]

Function117656: ; 117656
	callba GiveOddEgg
	ret
; 11765d

Function11765d: ; 11765d (45:765d)
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call Function11766b
	pop af
	ld [hInMenu], a
	ret

Function11766b: ; 11766b (45:766b)
	call Function117699
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	call Function1176ee
	ld a, $5
	call GetSRAMBank
	ld hl, $b1f3
	ld de, wcd49
	ld bc, $8
	call CopyBytes
	ld de, wc708
	ld bc, $11
	call CopyBytes
	call CloseSRAM
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

Function117699: ; 117699 (45:7699)
	ld a, $5
	call GetSRAMBank
	ld hl, wcd49
	ld de, $b1f3
	ld bc, $8
	call CopyBytes
	ld hl, wc708
	ld bc, $11
	call CopyBytes
	call CloseSRAM
	xor a
	ld [wcd49], a
	ld [wcd4a], a
	ld [wcd4b], a
	ld [wcd4c], a
	ld [wcd4d], a
	ld [wcd4e], a
	ld [wcd4f], a
	ld hl, wc708
	ld bc, $11
	call ByteFill
	call WhiteBGMap
	call ClearSprites
	callba Function171c87
	callba Function104061
	callba Function8cf53
	ret

Function1176ee: ; 1176ee (45:76ee)
	call JoyTextDelay
	ld a, [wcd49]
	bit 7, a
	jr nz, .asm_117709
	call Function117719
	callba Function8cf69
	callba Function104061
	jr Function1176ee
.asm_117709
	callba Function8cf53
	call WhiteBGMap
	call ClearScreen
	call ClearSprites
	ret

Function117719: ; 117719 (45:7719)
	ld a, [wcd49]
	ld e, a
	ld d, 0
	ld hl, Jumptable_117728
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_117728: ; 117728 (45:7728)
	dw Function117738
	dw Function117764
	dw Function1178aa
	dw Function1178e8
	dw Function117942
	dw Function117976
	dw Function117984
	dw Function1179a7


Function117738: ; 117738 (45:7738)
	callba Function171ccd
	lb de, $30, $18
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $6
	ld [hl], a
	lb de, $48, $20
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $7
	ld [hl], a
	ld a, $3
	ld [wcd23], a
	jp Function117a0a

Function117764: ; 117764 (45:7764)
	ld a, [wcd4a]
	cp $10
	jr nz, .asm_11776f
	ld a, $1
	jr .asm_117770
.asm_11776f
	xor a
.asm_117770
	ld [wcd24], a
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and $4
	jr nz, Function1177a5
	ld a, [hl]
	and $8
	jr nz, Function1177ac
	ld a, [hl]
	and $1
	jp nz, Function11784c
	ld a, [hl]
	and $2
	jr nz, asm_1177d6
	ld hl, hJoyLast
	ld a, [hl]
	and $40
	jr nz, asm_1177f1
	ld a, [hl]
	and $80
	jr nz, asm_11780a
	ld a, [hl]
	and $20
	jp nz, Function11782d
	ld a, [hl]
	and $10
	jp nz, Function117837
	ret

Function1177a5: ; 1177a5 (45:77a5)
	callba Function171cf0
	ret

Function1177ac: ; 1177ac (45:77ac)
	ld a, $2
	ld [wcd4c], a
	ld a, $4
	ld [wcd4d], a
	ret

Function1177b7: ; 1177b7 (45:77b7)
	ld a, $3
	ld [wcd24], a
	ld a, [wcd4a]
	and a
	jr z, .asm_1177c5
	jp Function117a0a
.asm_1177c5
	ld a, $6
	ld [wcd49], a
	ret

Function1177cb: ; 1177cb (45:77cb)
	ld a, $80
	ld [wcd49], a
	ld [ScriptVar], a
	jp Function117a0a
asm_1177d6: ; 1177d6 (45:77d6)
	call PlayClickSFX
	ld a, [wcd4a]
	and a
	ret z
	dec a
	ld [wcd4a], a
	ld e, a
	ld d, $0
	ld hl, wc708
	add hl, de
	xor a
	ld [hl], a
	hlcoord 2, 4
	add hl, de
	ld [hl], a
	ret
asm_1177f1: ; 1177f1 (45:77f1)
	ld a, [wcd4d]
	and a
	ret z
	dec a
	ld [wcd4d], a
	cp $3
	ret nz
	ld a, [wcd4c]
	ld e, a
	sla a
	sla a
	add e
asm_117806: ; 117806 (45:7806)
	ld [wcd4c], a
	ret
asm_11780a: ; 11780a (45:780a)
	ld a, [wcd4d]
	cp $4
	ret z
	inc a
	ld [wcd4d], a
	cp $4
	ret nz
	ld a, [wcd4c]
	cp $a
	jr nc, .asm_117825
	cp $5
	jr nc, .asm_117829
	xor a
	jr asm_117806
.asm_117825
	ld a, $2
	jr asm_117806
.asm_117829
	ld a, $1
	jr asm_117806

Function11782d: ; 11782d (45:782d)
	ld a, [wcd4c]
	and a
	ret z
	dec a
	ld [wcd4c], a
	ret

Function117837: ; 117837 (45:7837)
	ld e, $d
	ld a, [wcd4d]
	cp $4
	jr nz, .asm_117842
	ld e, $2
.asm_117842
	ld a, [wcd4c]
	cp e
	ret z
	inc a
	ld [wcd4c], a
	ret

Function11784c: ; 11784c (45:784c)
	call PlayClickSFX
	ld a, [wcd4d]
	cp $4
	jr nz, .asm_117866
	ld a, [wcd4c]
	cp $2
	jp z, Function1177b7
	cp $1
	jp z, Function1177cb
	jp Function1177a5
.asm_117866
	ld a, [wcd4a]
	ld e, a
	cp $10
	jp z, Function1177ac
	inc a
	ld [wcd4a], a
	ld d, $0
	ld a, [wcd4b]
	and a
	jr nz, .asm_117880
	ld hl, Unknown_117a0f
	jr .asm_117883
.asm_117880
	ld hl, Unknown_117a47
.asm_117883
	push de
	ld a, [wcd4c]
	ld b, a
	ld a, [wcd4d]
	ld c, $e
	call SimpleMultiply
	add b
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld hl, wc708
	add hl, de
	ld [hl], a
	pop de
	hlcoord 2, 4
	add hl, de
	sub $20
	ld [hl], a
	ld a, e
	cp $f
	ret nz
	jp Function1177ac

Function1178aa: ; 1178aa (45:78aa)
	ld hl, MenuDataHeader_1179b5
	call LoadMenuDataHeader
	call Function1cbb
	call GetMemTileCoord
	ld hl, MenuDataHeader_1179bd
	call LoadMenuDataHeader
	call Function1cbb
	call GetMemTileCoord
	callba Function104061
	hlcoord 16, 8
	ld de, String_1179c5
	call PlaceString
	hlcoord 15, 10
	ld a, $ed
	ld [hl], a
	hlcoord 1, 14
	ld de, String_1179cc
	call PlaceString
	ld a, $1
	ld [wcd4e], a
	jp Function117a0a

Function1178e8: ; 1178e8 (45:78e8)
	ld a, [hJoyPressed] ; $ff00+$a7
	cp $2
	jr z, .asm_117939
	cp $1
	jr z, .asm_117925
	cp $80
	jr z, .asm_11790f
	cp $40
	ret nz
	ld a, [wcd4e]
	and a
	ret z
	dec a
	ld [wcd4e], a
	hlcoord 15, 8
	ld a, $ed
	ld [hl], a
	hlcoord 15, 10
	ld a, $7f
	ld [hl], a
	ret
.asm_11790f
	ld a, [wcd4e]
	and a
	ret nz
	inc a
	ld [wcd4e], a
	hlcoord 15, 8
	ld a, $7f
	ld [hl], a
	hlcoord 15, 10
	ld a, $ed
	ld [hl], a
	ret
.asm_117925
	call PlayClickSFX
	ld a, [wcd4e]
	and a
	jr nz, .asm_117939
	call ExitMenu
	ld a, $1
	ld [wcd4f], a
	jp Function117a0a
.asm_117939
	call ExitMenu
	call ExitMenu
	jp Function117a0a

Function117942: ; 117942 (45:7942)
	call SpeechTextBox
	hlcoord 1, 14
	ld de, String_1179f7
	call PlaceString
	ld a, $1e
	ld [wcd4e], a
	ld a, $5
	call GetSRAMBank
	ld a, [wcd4f]
	ld [$aa4b], a
	ld hl, wc708
	ld de, $aa4c
	ld bc, $11
	call CopyBytes
	call CloseSRAM
	ld a, [wcd4f]
	and a
	jr z, asm_11797e
	call Function117a0a

Function117976: ; 117976 (45:7976)
	ld hl, wcd4e
	dec [hl]
	ret nz
	call ExitMenu
asm_11797e: ; 11797e (45:797e)
	ld a, $80
	ld [wcd49], a
	ret

Function117984: ; 117984 (45:7984)
	ld hl, MenuDataHeader_1179b5
	call LoadMenuDataHeader
	call Function1cbb
	call GetMemTileCoord
	callba Function104061
	hlcoord 1, 14
	ld de, String_1179e1
	call PlaceString
	ld a, $1e
	ld [wcd4e], a
	call Function117a0a

Function1179a7: ; 1179a7 (45:79a7)
	ld hl, wcd4e
	dec [hl]
	ret nz
	call ExitMenu
	ld a, $1
	ld [wcd49], a
	ret
; 1179b5 (45:79b5)

MenuDataHeader_1179b5: ; 1179b5
	db $40 ; flags
	db 12,  0 ; start coords
	db 17, 19 ; end coords
	dw NULL
	db 0 ; default option
; 1179bd

MenuDataHeader_1179bd: ; 1179bd
	db $40 ; flags
	db  7, 14 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 0 ; default option
; 1179c5


String_1179c5: ; 1179c5
	db   "はい"
	next "いいえ@"
; 1179cc

String_1179cc: ; 1179cc
	db   "こ", $25, "パスワード", $1f, "ほぞんして"
	line "おきますか?@"
; 1179e1

String_1179e1: ; 1179e1
	db   "パスワード", $4a, "にゅうりょく"
	line "されていません!@"
; 1179f7

String_1179f7: ; 1179f7
	db   "ログインパスワード", $1f, "ほぞん"
	line "しました@"
; 117a0a

Function117a0a: ; 117a0a (45:7a0a)
	ld hl, wcd49
	inc [hl]
	ret
; 117a0f (45:7a0f)

Unknown_117a0f:
INCBIN "data/mobile/ascii-alpha.txt"

Unknown_117a47:
INCBIN "data/mobile/ascii-sym.txt"
; 117a7f


; everything from here to the end of the bank is related to the
; Mobile Stadium option from the continue/newgame menu.
; XXX better function names
MobileStudium: ; 0x117a7f
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call Function117a8d
	pop af
	ld [hInMenu], a
	ret
; 0x117a8d

Function117a8d: ; 0x117a8d
	call Function117a94
	call Function117acd
	ret
; 0x117a94

Function117a94: ; 0x117a94
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	call WhiteBGMap
	call ClearSprites
	callba Function172e78
	callba Function104000
	ret
; 0x117ab4

Function117ab4: ; 0x117ab4
	call WhiteBGMap
	call ClearSprites
	callba Function172e78
	callba Function172eb9
	callba Function104061
	ret
; 0x117acd

Function117acd: ; 0x117acd
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_117ae2 ; 0x117ad5 $b
	call Function117ae9
	callba Function104000
	jr Function117acd
.asm_117ae2
	call WhiteBGMap
	call ClearSprites
	ret

Function117ae9: ; 0x117ae9
	ld a, [wJumptableIndex]
	ld e, a
	ld d, $0
	ld hl, Pointers117af8
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers117af8: ; 0x117af8
	dw Function117b06
	dw Function117b14
	dw Function117b28
	dw Function117b31
	dw Function117b4f
	dw Function117bb6
	dw Function117c4a

Function117b06:
	callba Function172eb9
	ld a, $10
	ld [wcf64], a
	jp Function117cdd

Function117b14:
	ld hl, wcf64
	dec [hl]
	ret nz
	ld hl, Data117cbc
	call LoadMenuDataHeader
	call Function1cbb
	call GetMemTileCoord
	jp Function117cdd

Function117b28:
	ld hl, MobileStadiumEntryText
	call PrintText
	jp Function117cdd

Function117b31:
	ld hl, Data117cc4
	call LoadMenuDataHeader
	call Function1cbb
	call GetMemTileCoord
	hlcoord 16, 8
	ld de, YesNo117ccc
	call PlaceString
	hlcoord 15, 8
	ld a, "▶"
	ld [hl], a
	jp Function117cdd

Function117b4f:
	ld a, [hJoyPressed]
	cp $2
	jr z, .asm_117ba4 ; 0x117b53 $4f
	cp $1
	jr z, .asm_117b8c ; 0x117b57 $33
	cp $80
	jr z, .asm_117b76 ; 0x117b5b $19
	cp $40
	ret nz
	ld a, [wcf64]
	and a
	ret z
	dec a
	ld [wcf64], a
	hlcoord 15, 8
	ld a, "▶"
	ld [hl], a
	hlcoord 15, 10
	ld a, " "
	ld [hl], a
	ret
.asm_117b76
	ld a, [wcf64]
	and a
	ret nz
	inc a
	ld [wcf64], a
	hlcoord 15, 8
	ld a, " "
	ld [hl], a
	hlcoord 15, 10
	ld a, "▶"
	ld [hl], a
	ret
.asm_117b8c
	call PlayClickSFX
	ld a, [wcf64]
	and a
	jr nz, .asm_117ba4 ; 0x117b93 $f
	call ExitMenu
	call ExitMenu
	callba Function104061
	jp Function117cdd
.asm_117ba4
	call ExitMenu
	call ExitMenu
	callba Function104061
	ld a, $80
	ld [wJumptableIndex], a
	ret

Function117bb6:
	call Function117c89
	ld a, $1
	ld [hBGMapMode], a
	callba Function118284
	call ClearSprites
	ld a, [wc300]
	and a
	jr z, .asm_117be7 ; 0x117bca $1b
	cp $a
	jr z, .asm_117be1 ; 0x117bce $11
.asm_117bd0
	ld a, $2
	ld [wc303], a
	callba Function17f555
	ld a, $80
	ld [wJumptableIndex], a
	ret
.asm_117be1
	ld a, $80
	ld [wJumptableIndex], a
	ret
.asm_117be7
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, [wcd89]
	and $1
	jr nz, .asm_117c16 ; 0x117bf3 $21
	ld a, [wd000]
	cp $fe
	jr nz, .asm_117c16 ; 0x117bfa $1a
	ld a, [wd001]
	cp $f
	jr nz, .asm_117c16 ; 0x117c01 $13
	ld hl, $e000 - 20
	ld de, wcd69
	ld c, $10
.asm_117c0b
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_117c16 ; 0x117c0e $6
	inc hl
	dec c
	jr nz, .asm_117c0b ; 0x117c12 $f7
	jr .asm_117c20 ; 0x117c14 $a
.asm_117c16
	pop af
	ld [rSVBK], a
	ld a, $d3
	ld [wc300], a
	jr .asm_117bd0 ; 0x117c1e $b0
.asm_117c20
	pop af
	ld [rSVBK], a
	callba Function172eb9
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, $7
	call GetSRAMBank
	ld hl, DefaultFlypoint
	ld de, $b000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	pop af
	ld [rSVBK], a
	jp Function117cdd

Function117c4a:
	ld hl, Data117cbc
	call LoadMenuDataHeader
	call Function1cbb
	call GetMemTileCoord
	callba Function104061
	ld hl, MobileStadiumSuccessText
	call PrintText
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, wd000
	ld de, $0008
	ld c, $8
.asm_117c71
	push hl
	ld a, $ff
	ld [hli], a
	ld a, " "
	ld [hl], a
	pop hl
	add hl, de
	dec c
	jr nz, .asm_117c71 ; 0x117c7b $f4
	call FadeToWhite
	pop af
	ld [rSVBK], a
	ld a, $80
	ld [wJumptableIndex], a
	ret

Function117c89:
	ld a, $7
	call GetSRAMBank
	ld l, $0
	ld h, l
	ld de, $b000
	ld bc, $0ffc
.asm_117c97
	push bc
	ld a, [de]
	inc de
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .asm_117c97 ; 0x117ca2 $f3
	ld a, l
	ld [wcd83], a
	ld a, h
	ld [wcd84], a
	ld hl, $bfea
	ld de, wcd69
	ld bc, $0010
	call CopyBytes
	call CloseSRAM
	ret

Data117cbc: ; 0x117cbc
	db $40, $0c, $00, $11, $13, $00, $00, $00

Data117cc4: ; 0x117cc4
	db $40, $07, $0e, $0b, $13, $00, $00, $00 ; XXX what is this

YesNo117ccc: ; 0x117ccc
	db   "はい"
	next "いいえ"
	db   "@"

MobileStadiumEntryText: ; 0x117cd3
	text_jump _MobileStadiumEntryText
	db "@"

MobileStadiumSuccessText: ; 0x117cd8
	text_jump _MobileStadiumSuccessText
	db "@"

Function117cdd: ; 0x117cdd
	ld hl, wJumptableIndex
	inc [hl]
	ret


