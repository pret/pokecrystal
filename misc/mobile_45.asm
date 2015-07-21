
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
	ld hl, wdc07
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
	ld hl, wdc07
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
	ld a, [wdc23]
	and a
	jp z, Function11425c
	jr .asm_114e76

.asm_114e6f
	xor a
	ld [wdc23], a
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
	ld [wdc23], a
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
	ld a, [wdc23]
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
	ld [wdc23], a

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
	ld a, [wdc23]
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
	ld a, [wdc23]
	inc a
	cp $4
	jr nz, .asm_1150ae
	ld a, $2

.asm_1150ae
	ld [wdc23], a
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
	ld [wdc23], a
	ld a, [wdc03]
	cp $6
	jr nz, .asm_1152ca

.asm_115335
	call Function1153b5
	xor a
	ld [wdc23], a
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
	ld [wdc23], a
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
	ld [wdc23], a
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
	ld [wdc23], a
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
	ld [wdc1c], a
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
	ld [wdc1c], a
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
	ld a, [wdc1c]
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
	ld a, [wdc0a]
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
	ld a, [wdc0a]
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
	ld [wdc0a], a
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
	ld hl, wdc07
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wdc24
	call Function115d6a
	ld hl, wdc07
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
	ld a, [wdc23]
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
	ld a, [wdc23]
	cp $5
	jr z, .asm_115716
	ld a, [Poster]
	ld h, a
	ld a, [Plant]
	ld l, a
	xor a
	jp Function11425c

.asm_115716
	ld hl, wdc0a
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
	ld [wdc23], a
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
	ld [wdc23], a
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
	ld [wdc23], a
	ret

.asm_11580f
	pop bc
	ld a, c
	ld [wdc0e], a
	ld a, b
	ld [Bed], a
	ld a, $3
	ld [wdc23], a
	ret
; 11581e

Function11581e: ; 11581e
	ld a, [wdc23]
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
	ld a, [wdc0a]
	ld l, a
	ld a, [wdc0b]
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
	ld [wdc0a], a
	ld a, h
	ld [wdc0b], a
	pop bc
	pop hl
	ld hl, wdc07
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, PartyMon5Speed
	call Function115d6a
	ld hl, wdc07
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, [wdc23]
	cp $3
	jr z, .asm_1158b4
	cp $4
	jr z, .asm_1158ad
	jr .asm_1158bc

.asm_1158ad
	ld a, $5
	ld [wdc23], a
	jr .asm_1158b9

.asm_1158b4
	ld a, $2
	ld [wdc23], a

.asm_1158b9
	xor a
	ret

.asm_1158bb
	pop hl

.asm_1158bc
	ld a, $ff
	ld [wdc23], a
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
	ld a, [wdc23]
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
	ld a, [wdc23]
	cp $5
	jr z, .asm_115a45
	ld a, [Poster]
	ld h, a
	ld a, [Plant]
	ld l, a
	xor a
	jp Function11425c

.asm_115a45
	ld hl, wdc0a
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
	ld [wdc23], a
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
	ld [wdc23], a
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
	ld [wdc23], a
	xor a
	ret

.asm_115af0
	pop bc
	ld a, c
	ld [wdc0e], a
	ld a, b
	ld [Bed], a
	ld a, $3
	ld [wdc23], a
	xor a
	ret
; 115b00

Function115b00: ; 115b00
	ld a, [wdc23]
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
	ld a, [wdc23]
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
	ld [wdc23], a
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
	ld a, [wdc0a]
	ld l, a
	ld a, [wdc0b]
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
	ld [wdc0a], a
	ld a, h
	ld [wdc0b], a
	pop bc
	pop hl
	ld hl, wdc07
	ld a, [hli]
	ld [wCurrentMapSignpostCount], a
	ld [$ff8c], a
	ld [$4000], a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wdc26
	call Function115d6a
	ld hl, wdc07
	ld a, [wCurrentMapSignpostCount]
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, [wdc23]
	cp $3
	jr z, .asm_115bc1
	cp $4
	jr z, .asm_115bba
	jr .asm_115b3b

.asm_115bba
	ld a, $5
	ld [wdc23], a
	jr .asm_115bc6

.asm_115bc1
	ld a, $2
	ld [wdc23], a

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
	ld a, [wdc23]
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
	ld [wdc23], a
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
	ld [wdc23], a
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
	ld hl, $8600
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
	ld [wc319], a
	ld [wc310], a
	ld [wc311], a
	ld [wc312], a
	ld [wc313], a
	ld [wc314], a
	ld [wc315], a
	ld [wc318], a
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
	ld a, [wc319]
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
	ld a, [wc319]
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
	ld a, [wc319]
	inc a
	ld [wc319], a
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
	ld a, [wc319]
	inc a
	ld [wc319], a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, wd030
	ld de, wc320
	ld bc, $0010
	call CopyBytes
	ld hl, Palette_11734e
	ld de, Unkn1Pals + 8 * 7
	ld bc, $0008
	call CopyBytes
	call Function32f9
	pop af
	ld [rSVBK], a
	ld a, $30
	ld [hWY], a
	ret
; 1162cb

Function1162cb: ; 1162cb
	callba Function170cc6
	ld a, [wc319]
	inc a
	ld [wc319], a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_11730e
	ld de, wd050
	ld bc, $0030
	call CopyBytes
	call Function32f9
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
	ld a, [wc318]
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
	call Function32f9
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
	call DrawOnMap
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
	ld [wc319], a
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
	ld hl, wc320
	ld de, wd030
	ld bc, $0010
	call CopyBytes
	pop af
	ld [rSVBK], a
	call Function32f9
	call DelayFrame
	ld a, $90
	ld [hWY], a
	call DrawOnMap
	callba Function14157
	pop af
	ld [rSVBK], a
	callba Function104061
	ld a, [InLinkBattle]
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
	ld [wc319], a
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
	ld [wc319], a
	ld [wc30d], a
	ret
; 116468

Function116468: ; 116468
	call Function116567
	ld a, [wc314]
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
	ld a, [wc314]
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
	ld [wc314], a
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
	ld [wc314], a
	ret
; 116655

Function116655: ; 116655
	xor a
	ld [wc317], a
	call Function11678e

Function11665c:
	ld hl, wc317
	ld a, $1
	xor [hl]
	ld [hl], a
	add $4
	ld c, a
	call Function11679c
	ld a, [wc317]
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
	ld [wc314], a
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
	ld [wc316], a
	xor a
	ld [wc317], a
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
	ld [wc316], a

.asm_1166e4
	ld a, [wc311]
	cp $ff
	ret nz
	ld a, $4
	ld [wc319], a
	xor a
	ld [wc314], a
	ret
; 1166f4

Function1166f4: ; 1166f4
	ld [wc30e], a
	ld a, b
	ld [wc316], a
	xor a
	ld [wc317], a
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
	ld [wc317], a
	xor a
	ld [wc316], a
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
	ld a, [wc316]
	add [hl]
	ld [hl], a
	ld hl, wc30f
	ld a, [wc317]
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
	ld [wc318], a
	ret
; 11677e

Function11677e: ; 11677e
	ld a, $0

Function116780:
	ld hl, wc315
	cp [hl]
	jr z, .asm_11678c
	ld a, [hl]
	ld [wc314], a
	scf
	ret

.asm_11678c
	and a
	ret
; 11678e

Function11678e: ; 11678e
	ld hl, wc314
	ld a, [hl]
	ld [wc315], a
	inc [hl]
	ret
; 116797

Function116797: ; 116797
	ld hl, wc314
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
	ld a, [$ffaa]
	push af
	ld a, $1
	ld [$ffaa], a
	call Function11766b
	pop af
	ld [$ffaa], a
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
	call Functiona57
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
	ld hl, $ffa9
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
	call Function1cfd
	ld hl, MenuDataHeader_1179bd
	call LoadMenuDataHeader
	call Function1cbb
	call Function1cfd
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
	call Function1cfd
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
	ld a, [$ffaa]
	push af
	ld a, $1
	ld [$ffaa], a
	call Function117a8d
	pop af
	ld [$ffaa], a
	ret
; 0x117a8d

Function117a8d: ; 0x117a8d
	call Function117a94
	call Function117acd
	ret
; 0x117a94

Function117a94: ; 0x117a94
	xor a
	ld [wcf63], a
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
	call Functiona57
	ld a, [wcf63]
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
	ld a, [wcf63]
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
	call Function1cfd
	jp Function117cdd

Function117b28:
	ld hl, MobileStadiumEntryText
	call PrintText
	jp Function117cdd

Function117b31:
	ld hl, Data117cc4
	call LoadMenuDataHeader
	call Function1cbb
	call Function1cfd
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
	ld [wcf63], a
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
	ld [wcf63], a
	ret
.asm_117be1
	ld a, $80
	ld [wcf63], a
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
	ld hl, wdfec
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
	call Function1cfd
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
	ld [wcf63], a
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
	TX_FAR _MobileStadiumEntryText
	db "@"

MobileStadiumSuccessText: ; 0x117cd8
	TX_FAR _MobileStadiumSuccessText
	db "@"

Function117cdd: ; 0x117cdd
	ld hl, wcf63
	inc [hl]
	ret


SECTION "bank46", ROMX, BANK[$46]

Function118000: ; 118000
	ld a, $1
	ld [wcd38], a
	jr asm_11800b

Function118007: ; 118007
	xor a
	ld [wcd38], a

asm_11800b
	call Function1183cb
	ld a, $18
	ld [wcd33], a
	ld a, $19
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_118024
	call Functiona57
	call Function118473
	ld a, [wcf66]
	cp $1b
	jr c, .asm_118037
	ld a, [wcd34]
	ld [wcf66], a

.asm_118037
	call Function1184a5
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_118024
	pop af
	ld [rSVBK], a
	call Function118452
	call Function222a
Function11805e: ; 11805e (46:405e)
	ret
; 11805f

Function11805f: ; 11805f
	ld a, $1
	ld [wcd38], a
	call Function1183cb
	ld a, $18
	ld [wcd33], a
	ld a, $19
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_11807d
	call Functiona57
	call Function118473
	ld a, [wcf66]
	cp $1b
	jr c, .asm_118090
	ld a, [wcd34]
	ld [wcf66], a

.asm_118090
	call Function11857c
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11807d
	pop af
	ld [rSVBK], a
	call Function118452
	call Function222a
	ret
; 1180b8

Function1180b8: ; 1180b8
	call Function1183cb
	ld a, $22
	ld [wcd33], a
	ld a, $23
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_1180d1
	call Functiona57
	call Function118473
	ld a, [wcf66]
	cp $28
	jr c, .asm_1180e4
	ld a, [wcd34]
	ld [wcf66], a

.asm_1180e4
	ld a, [wcf66]
	cp $10
	jr c, .asm_1180f2
	cp $16
	jr nc, .asm_1180f2
	call Function11884c

.asm_1180f2
	call Function1184ec
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_1180d1
	pop af
	ld [rSVBK], a
	call Function118452
	call Function222a
	ret
; 11811a

Function11811a: ; 11811a
	ld a, 1
	ld [wcd38], a
	jr Function118125

Function118121: ; 118121
	xor a
	ld [wcd38], a

Function118125: ; 118125
	call Function1183cb
	ld a, $3
	ld [wcd33], a
	ld a, $d
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_11813e
	call Functiona57
	call Function118473
	ld a, [wcf66]
	cp $f
	jr c, .asm_118151
	ld a, [wcd34]
	ld [wcf66], a

.asm_118151
	call Function11854d
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11813e
	xor a
	ld [Unkn1Pals], a
	pop af
	ld [rSVBK], a
	call Function118452
	call Function118180
	call Function222a
	ret
; 118180

Function118180: ; 118180
	ld a, [ScriptVar]
	and a
	ret nz
	ld a, [wcd38]
	and a
	ret z
	ld a, $5
	call GetSRAMBank
	ld hl, wcd69
	ld de, $a89c
	ld bc, $0016
	call CopyBytes
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld de, $d202
	ld c, $96
	callba Function17d0b3
	jr c, .asm_1181d0
	ld de, $d202
	ld bc, $0196
	callba Function17d1e1
	jr c, .asm_1181d0
	ld hl, $d202
	ld de, $a8b2
	ld bc, $0096
	call CopyBytes
.asm_1181c9
	pop af
	ld [rSVBK], a
	call CloseSRAM
	ret

.asm_1181d0
	ld a, $d3
	ld [wc300], a
	ld [ScriptVar], a
	jr .asm_1181c9
; 1181da

Function1181da: ; 1181da
	call Function1183cb
	ld a, $2
	ld [wcd38], a
	ld a, $21
	ld [wcd33], a
	ld a, $22
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_1181f8
	call Functiona57
	call Function118473
	ld a, [wcf66]
	cp $28
	jr c, .asm_11820b
	ld a, [wcd34]
	ld [wcf66], a

.asm_11820b
	call Function1185c3
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_1181f8
	pop af
	ld [rSVBK], a
	call Function118452
	call Function222a
	ret
; 118233

Function118233: ; 118233
	call Function1183cb
	ld a, $1b
	ld [wcd33], a
	ld a, $1c
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_11824c
	call Functiona57
	call Function118473
	ld a, [wcf66]
	cp $1e
	jr c, .asm_11825f
	ld a, [wcd34]
	ld [wcf66], a

.asm_11825f
	call Function118624
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11824c
	pop af
	ld [rSVBK], a
	call Function118452
	ret
; 118284

Function118284: ; 118284
	call Function1183cb
	ld a, $19
	ld [wcd33], a
	ld a, $1e
	ld [wcd34], a
	ld a, $5
	ld [wc3f0], a
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $3
	ld [rSVBK], a ; $ff00+$70
.asm_11829d
	call Functiona57
	call Function118473
	ld a, [wcf66]
	cp $20
	jr c, .asm_1182b0
	ld a, [wcd34]
	ld [wcf66], a
.asm_1182b0
	call Function1186f5
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_11829d
	pop af
	ld [rSVBK], a ; $ff00+$70
	call Function118452
	ret
; 1182d5 (46:42d5)


Function1182d5: ; 1182d5
	call Function1183cb
	ld a, $18
	ld [wcd33], a
	ld a, $19
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_1182ee
	call Functiona57
	call Function118473
	ld a, [wcf66]
	cp $1b
	jr c, .asm_118301
	ld a, [wcd34]
	ld [wcf66], a

.asm_118301
	call Function118746
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_1182ee
	pop af
	ld [rSVBK], a
	call Function118452
	call Function222a
	ret
; 118329

Function118329: ; 118329
	call Function1183cb
	ld a, $15
	ld [wcd33], a
	ld a, $16
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_118342
	call Functiona57
	call Function118473
	ld a, [wcf66]
	cp $18
	jr c, .asm_118355
	ld a, [wcd34]
	ld [wcf66], a

.asm_118355
	call Function118671
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_118342
	pop af
	ld [rSVBK], a
	call Function118452
	ret
; 11837a

Function11837a: ; 11837a
	call Function1183cb
	ld a, $16
	ld [wcd33], a
	ld a, $17
	ld [wcd34], a
	ld a, $6
	ld [wc3f0], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
.asm_118393
	call Functiona57
	call Function118473
	ld a, [wcf66]
	cp $19
	jr c, .asm_1183a6
	ld a, [wcd34]
	ld [wcf66], a

.asm_1183a6
	call Function1186b2
	call Function11a8fa
	callba Function115dd3
	callba Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .asm_118393
	pop af
	ld [rSVBK], a
	call Function118452
	ret
; 1183cb

Function1183cb: ; 1183cb
	di
	ld a, [rIE]
	ld [wcd32], a
	call DoubleSpeed
	xor a
	ld [rIF], a
	ld [wc300], a
	ld [wc301], a
	ld [wc302], a
	ld [wcd80], a
	ld [wcd65], a
	ld [wcd66], a
	ld [wcd67], a
	ld [wcd68], a
	ld [wc31a], a
	ld [wcd89], a
	ld [wcd8a], a
	ld [wcd8b], a
	ld [wc3ec], a
	ld [wc3ed], a
	ld [wc3ee], a
	ld [wc3ef], a
	ld hl, VramState
	ld a, [hl]
	ld [wcd7f], a
	set 1, [hl]
	ld a, $f
	ld [rIE], a
	ld a, $1
	ld [$ffc9], a
	ld [$ffe9], a
	ei
	callba Function106462
	callba Function106464
	callba Function115d99
	callba Function11615a
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$bfff], a
	call CloseSRAM
	ret
; 118440

Function118440: ; 118440
	push af
	ld a, $5
	call GetSRAMBank
	ld a, [$bfff]
	inc a
	ld [$bfff], a
	call CloseSRAM
	pop af
	ret
; 118452

Function118452: ; 118452
	di
	xor a
	ld [$ffc9], a
	ld [$ffe9], a
	ld [hVBlank], a
	call NormalSpeed
	xor a
	ld [rIF], a
	ld a, [wcd32]
	ld [rIE], a
	ei
	ld a, [wcd7f]
	ld [VramState], a
	ld a, [wc300]
	ld [ScriptVar], a
	ret
; 118473

Function118473: ; 118473
	ld a, [wcd65]
	and a
	ret z
	ld a, [wcd66]
	inc a
	ld [wcd66], a
	cp $3c
	ret nz
	xor a
	ld [wcd66], a
	ld a, [wcd67]
	inc a
	ld [wcd67], a
	cp $3c
	ret nz
	ld a, [wcd68]
	inc a
	ld [wcd68], a
	cp $63
	jr z, .asm_1184a0
	xor a
	ld [wcd67], a
	ret

.asm_1184a0
	xor a
	ld [wcd65], a
	ret
; 1184a5

Function1184a5: ; 1184a5
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_1184b4
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1184b4

Jumptable_1184b4: ; 1184b4
	dw Function11886e
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118a8f
	dw Function11878d
	dw Function118d80
	dw Function118d9b
	dw Function11878d
	dw Function118ded
	dw Function118e6d
	dw Function11878d
	dw Function11984e
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 1184ec

Function1184ec: ; 1184ec
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_1184fb
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1184fb

Jumptable_1184fb: ; 1184fb
	dw Function11886e
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function119954
	dw Function11878d
	dw Function119973
	dw Function11878d
	dw Function119987
	dw Function11878d
	dw Function1199b4
	dw Function1199ca
	dw Function11878d
	dw Function1199e2
	dw Function119b0d
	dw Function11878d
	dw Function119b6b
	dw Function119b3b
	dw Function11878d
	dw Function119b52
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function119b45
	dw Function11878d
	dw Function119ac9
	dw Function118e76
; 11854d

Function11854d: ; 11854d
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11855c
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11855c

Jumptable_11855c: ; 11855c
	dw Function118922
	dw Function118936
	dw Function118982
	dw Function11805e
	dw Function119ca2
	dw Function119cab
	dw Function119cb8
	dw Function119cc3
	dw Function119cdf
	dw Function119cec
	dw Function119c97
	dw Function119cab
	dw Function119cb8
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 11857c

Function11857c: ; 11857c
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11858b
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11858b

Jumptable_11858b: ; 11858b
	dw Function11886e
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118a7a
	dw Function11878d
	dw Function11891c
	dw Function1198ee
	dw Function1198f7
	dw Function11878d
	dw Function119937
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 1185c3

Function1185c3: ; 1185c3
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_1185d2
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1185d2

Jumptable_1185d2: ; 1185d2
	dw Function11886e
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118aa4
	dw Function11878d
	dw Function118e92
	dw Function11878d
	dw Function118eb0
	dw Function118ec6
	dw Function118f0d
	dw Function118f14
	dw Function118f5e
	dw Function11878d
	dw Function118fc0
	dw Function11878d
	dw Function119054
	dw Function1190d0
	dw Function11878d
	dw Function1190ec
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function119cc3
	dw Function119cdf
	dw Function119cec
	dw Function11914e
	dw Function118e76
; 118624

Function118624: ; 118624
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_118633
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 118633

Jumptable_118633: ; 118633
	dw Function118866
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118aa4
	dw Function11878d
	dw Function118e92
	dw Function11878d
	dw Function11915d
	dw Function118f68
	dw Function11878d
	dw Function119009
	dw Function11878d
	dw Function119054
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 118671

Function118671: ; 118671
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_118680
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 118680

Jumptable_118680: ; 118680
	dw Function118866
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function119380
	dw Function119388
	dw Function1193a0
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 1186b2

Function1186b2: ; 1186b2
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_1186c1
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 1186c1

Jumptable_1186c1: ; 1186c1
	dw Function118866
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function119380
	dw Function1193e3
	dw Function1193fb
	dw Function11878d
	dw Function119413
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 1186f5

Function1186f5: ; 1186f5 (46:46f5)
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_118704
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 118704 (46:4704)

Jumptable_118704: ; 118704 (46:4704)
	dw Function11886a
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118abc
	dw Function11878d
	dw Function119451
	dw Function1195f8
	dw Function119612
	dw Function119629
	dw Function119648
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function11967d
	dw Function119685
	dw Function119665
	dw Function11966d
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 118746 (46:4746)

Function118746: ; 118746
	ld a, [wcf66]
	ld e, a
	ld d, 0
	ld hl, Jumptable_118755
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 118755

Jumptable_118755: ; 118755
	dw Function11886e
	dw Function118880
	dw Function11878d
	dw Function1188b0
	dw Function11878d
	dw Function1188b8
	dw Function11878d
	dw Function1188c0
	dw Function11878d
	dw Function1188c8
	dw Function11878d
	dw Function118903
	dw Function118ad0
	dw Function11878d
	dw Function1196f2
	dw Function1197c9
	dw Function1197dc
	dw Function11878d
	dw Function118e6d
	dw Function11878d
	dw Function119800
	dw Function118e76
	dw Function118e7e
	dw Function11878d
	dw Function11805e
	dw Function118e76
	dw Function118e87
	dw Function118e76
; 11878d

Function11878d: ; 11878d (46:478d)
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_1187af
	bit 2, a
	jr nz, .asm_1187d1
	bit 0, a
	jr nz, .asm_1187aa
	ld a, [wcd89]
	and $1
	jr z, .asm_1187a7
	ld a, $3
	ld [rSVBK], a ; $ff00+$70
.asm_1187a7
	jp Function119e2e
.asm_1187aa
	call Function118821
	ret c
	ret
.asm_1187af
	ld a, $0
	call Function3e32
	ld [wc300], a
	ld a, l
	ld [wc301], a
	ld a, h
	ld [wc302], a
	ld a, $a
	call Function3e32
	ld a, [wc3f0]
	ld [wc319], a
	ld a, [wcd34]
	ld [wcf66], a
	ret
.asm_1187d1
	ld hl, wcd89
	bit 0, [hl]
	jr nz, .asm_118803
	set 0, [hl]
	ld a, $6
	ld [rSVBK], a ; $ff00+$70
	ld de, Unkn1Pals
	ld bc, $1000
	ld a, [hl]
	sla a
	jr c, .asm_1187f9
	sla a
	jr c, .asm_1187fd
	sla a
	jr c, .asm_1187f5
	ld a, $24
	jr .asm_1187ff
.asm_1187f5
	ld a, $28
	jr .asm_1187ff
.asm_1187f9
	ld a, $2a
	jr .asm_1187ff
.asm_1187fd
	ld a, $2c
.asm_1187ff
	call Function3e32
	ret
.asm_118803
	ld a, $d3

Function118805: ; 118805 (46:4805)
	ld [wc300], a
	xor a
	ld [wc301], a
	ld [wc302], a
	ld a, $a
	call Function3e32
	ld a, [wc3f0]
	ld [wc319], a
	ld a, [wcd34]
	ld [wcf66], a
	ret

Function118821: ; 118821 (46:4821)
	ld a, [wc319]
	cp $3
	jr c, .asm_11884a
	cp $4
	jr z, .asm_11884a
	ld a, [hJoyDown] ; $ff00+$a8
	cp $5
	jr nz, .asm_11884a
	ld a, $a
	call Function3e32
	ld a, $a
	ld [wc300], a
	ld a, [wc3f0]
	ld [wc319], a
	ld a, [wcd34]
	ld [wcf66], a
	scf
	ret
.asm_11884a
	and a
	ret
; 11884c (46:484c)

Function11884c: ; 11884c
	ld a, [hJoyDown]
	cp $5
	jr nz, .asm_118864
	ld a, $a
	call Function3e32
	ld a, $a
	ld [wc300], a
	ld a, [wcd34]
	ld [wcf66], a
	scf
	ret

.asm_118864
	and a
	ret
; 118866

Function118866:
	ld a, 2
	jr asm_11886f

Function11886a: ; 11886a (46:486a)
	ld a, 1
	jr asm_11886f
; 11886e (46:486e)

Function11886e:
	xor a

asm_11886f
	ld [BGMapPalBuffer], a
	ld a, $0
	ld [wcd3c], a
	call Function119e2e
	ld a, [wcd33]
	ld [wcd45], a

Function118880: ; 118880 (46:4880)
	call Function119ed8
	ret c
	xor a
	ld [wcf64], a
	ld [wc807], a
	ld de, wcd81
	ld hl, $46
	ld a, $2
	jp Function119e2b
; 118896 (46:4896)

Function118896: ; 118896
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_1188a5
	bit 2, a
	jr nz, .asm_1188a5
	bit 0, a
	jr z, .asm_1188aa

.asm_1188a5
	ld a, $34
	jp Function119e2b

.asm_1188aa
	call Function119e2e
	jp Function119e2e
; 1188b0

Function1188b0: ; 1188b0 (46:48b0)
	ld de, wc346
	ld a, $c
	jp Function119e2b

Function1188b8: ; 1188b8 (46:48b8)
	ld de, wc3ac
	ld a, $e
	jp Function119e2b

Function1188c0: ; 1188c0 (46:48c0)
	ld de, wc3cd
	ld a, $10
	jp Function119e2b

Function1188c8: ; 1188c8 (46:48c8)
	ld a, $1
	ld [wcd65], a
	call Function1188e7
	ld hl, wc708
.asm_1188d3
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .asm_1188d3
	call Function119eb4
	call Function119ec2
	ld hl, wc708
	ld a, $6
	jp Function119e2b

Function1188e7: ; 1188e7 (46:48e7)
	ld de, wc346
	ld a, $5
	call GetSRAMBank
	ld a, [$aa4a]
	call CloseSRAM
	and a
	ret z
	sla a
	ld c, a
.asm_1188fa
	ld a, [de]
	inc de
	and a
	jr nz, .asm_1188fa
	dec c
	jr nz, .asm_1188fa
	ret

Function118903: ; 118903 (46:4903)
	ld a, [wc3f0]
	ld [wc319], a
	ld c, $1
	callba Function115e18
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	jp Function119e2e
; 11891c (46:491c)

Function11891c: ; 11891c
	call Function118b42
	jp Function119e2e
; 118922

Function118922: ; 118922
	ld a, [wcd38]
	and a
	jr nz, .asm_11892d
	ld hl, UnknownText_0x11aba5
	jr .asm_118930

.asm_11892d
	ld hl, UnknownText_0x11abcb

.asm_118930
	call Function11a9c0
	call Function119e2e

Function118936:
	ld a, [wc31a]
	and a
	ret nz
	ld hl, MenuDataHeader_119cf7
	call LoadMenuDataHeader
	call Function1cbb
	call Function1cfd
	call Function321c
	hlcoord 16, 8, AttrMap
	ld a, $40
	or [hl]
	ld [hl], a
	call Function3200
	ld a, $1
	ld [wcd4f], a
	ld a, $1
	ld [rSVBK], a
	ld a, [StatusFlags]
	bit 6, a
	jr nz, .asm_11896b
	ld hl, Strings_119d64
	ld a, $5
	jr .asm_118970

.asm_11896b
	ld hl, Strings_119d0c
	ld a, $b

.asm_118970
	ld [wcd4a], a
	ld a, l
	ld [wcd4b], a
	ld a, h
	ld [wcd4c], a
	ld a, $3
	ld [rSVBK], a
	call Function119e2e

Function118982:
	hlcoord 13, 8
	ld de, String_119d07
	call PlaceString
	hlcoord 13, 10
	ld de, String_119d07
	call PlaceString
	ld a, [wcd4b]
	ld l, a
	ld a, [wcd4c]
	ld h, a
	ld d, $0
	ld a, [wcd4f]
	dec a
	rlca
	rlca
	rlca
	ld e, a
	add hl, de
	ld a, l
	ld e, a
	ld a, h
	ld d, a
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld bc, StringBuffer3
.asm_1189b5
	ld a, [hli]
	cp $50
	jr z, .asm_1189c4
	cp $7f
	jr z, .asm_1189c2
	ld [bc], a
	inc bc
	jr .asm_1189b5

.asm_1189c2
	ld a, $50

.asm_1189c4
	ld [bc], a
	pop af
	ld [rSVBK], a
	hlcoord 13, 9
	call PlaceString
	ld hl, hJoyPressed
	ld a, [hl]
	and $2
	jr nz, .asm_118a39
	ld a, [hl]
	and $1
	jr nz, .asm_118a01
	ld a, [hl]
	and $80
	jr nz, .asm_1189e6
	ld a, [hl]
	and $40
	jr nz, .asm_1189f2
.asm_1189e5
	ret

.asm_1189e6
	ld hl, wcd4f
	dec [hl]
	jr nz, .asm_1189e5
	ld a, [wcd4a]
	ld [hl], a
	jr .asm_1189e5

.asm_1189f2
	ld a, [wcd4a]
	ld hl, wcd4f
	inc [hl]
	cp [hl]
	jr nc, .asm_1189e5
	ld a, $1
	ld [hl], a
	jr .asm_1189e5

.asm_118a01
	call PlayClickSFX
	ld a, [wcd4f]
	ld hl, wcd4a
	cp [hl]
	jr z, .asm_118a3c
	dec a
	and $fe
	srl a
	ld [wcf65], a
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	call WriteBackup
	pop af
	ld [rSVBK], a
	ld a, [wcd38]
	and a
	jr nz, .asm_118a30
	call Function119d93
	ret c
	call Function119dd1
	ret c

.asm_118a30
	ld a, [wcd4f]
	ld [wd000 + $800], a
	jp Function119e2e

.asm_118a39
	call PlayClickSFX

.asm_118a3c
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	call WriteBackup
	pop af
	ld [rSVBK], a
	ld a, $7
	ld [wcf66], a
	ld a, $0
	ld [wcd46], a
	ret
; 118a54

Function118a54: ; 118a54
	ld a, [wcd55]
	ld l, a
	ld a, [wcd56]
	ld h, a
	ld de, wc3ec
	ld bc, $0004
	jp Function118ae4
; 118a65

Function118a65: ; 118a65
	ld hl, BattleDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, Unkn1Pals
	ld bc, $1000
	jp Function118b10
; 118a7a

Function118a7a: ; 118a7a
	ld hl, BattleDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, Unkn1Pals
	ld bc, $1000
	jp Function118b10
; 118a8f

Function118a8f: ; 118a8f
	ld hl, ExchangeDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, Unkn1Pals
	ld bc, $1000
	jp Function118b10
; 118aa4

Function118aa4: ; 118aa4
	ld hl, NewsDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld a, $5
	ld [rSVBK], a
	ld de, LYOverrides
	ld bc, $e00
	jr Function118b10
; 118abc

Function118abc: ; 118abc (46:4abc)
	ld hl, MenuDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, Unkn1Pals
	ld bc, $1000
	jr Function118b10
; 118ad0 (46:4ad0)

Function118ad0:
	ld hl, IndexDownloadURL
	ld de, wcc60
	ld bc, $80
	call CopyBytes
	ld de, Unkn1Pals
	ld bc, $1000
	jr Function118b10

Function118ae4:
	push bc
	push de
	push hl
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	pop hl
	ld c, $0
	ld de, wcc60
.asm_118af5
	ld a, [hli]
	ld [de], a
	inc de
	and a
	jr z, .asm_118b06
	inc c
	ld a, c
	cp $a6
	jr c, .asm_118af5
	ld a, $da
	jp Function118805

.asm_118b06
	call Function118b24
	pop de
	pop bc
	ld a, $2a
	jp Function119e2b
; 118b10

Function118b10:
	push de
	push bc
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	call Function118b24
	pop bc
	pop de
	ld a, $2a
	jp Function119e2b

Function118b24: ; 118b24 (46:4b24)
	ld hl, wc346
	ld a, $8
	ld [hli], a
	ld a, $c7
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $80
	ld [wcd89], a
	ld hl, wc346
	ret
; 118b42 (46:4b42)

Function118b42: ; 118b42
	ld hl, DefaultFlypoint
	ld a, l
	ld [wcd51], a
	ld a, h
	ld [wcd52], a
	call Function118b8c
	ld a, l
	ld [wcd55], a
	ld [wcd59], a
	ld a, h
	ld [wcd56], a
	ld [wcd5a], a
	call Function118b8c
	ld a, l
	ld [wcd53], a
	ld [wcd5d], a
	ld a, h
	ld [wcd54], a
	ld [wcd5e], a
	call Function118b8c
	ld a, l
	ld [wcd57], a
	ld [wcd5b], a
	ld a, h
	ld [wcd58], a
	ld [wcd5c], a
	call Function118b8c
	ld a, l
	ld [wcd5f], a
	ld a, h
	ld [wcd60], a
	ret
; 118b8c

Function118b8c: ; 118b8c
.asm_118b8c
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_118b8c
	dec hl
	xor a
rept 2
	ld [hli], a
endr
	ret
; 118b9a

Function118b9a: ; 118b9a
	ld a, h
	cp $e0
	ret c
	ld a, $d3
	call Function118805
	and a
	ret
; 118ba5


	charmap " ", $20 ; revert to ascii

ExchangeDownloadURL: ; 0x118ba5
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/exchange/index.txt", 0

BattleDownloadURL: ; 0x118bf7
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/battle/index.txt", 0

NewsDownloadURL: ; 0x118c47
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/news/index.txt", 0

MenuDownloadURL: ; 0x118c95
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/POKESTA/menu.cgb", 0

IndexDownloadURL: ; 0x118ce5
	db "http://gameboy.datacenter.ne.jp/cgb/download?name=/01/CGB-BXTJ/tamago/index.txt", 0


Function118d35: ; 118d35
	ld hl, LYOverridesBackup
	ld a, [wcd38]
	and a
	jr nz, .asm_118d6e
	ld a, [hli]
	cp $94
	jr nz, .asm_118d7b
	ld a, [hl]
	cp $5
	jr nz, .asm_118d7b
	ld a, [wcd4f]
	sla a
	ld b, a
	sla a
	sla a
	add b
	ld b, a
	ld a, $5
	call GetSRAMBank
	ld a, b
	ld [$b2fb], a
	call CloseSRAM
	callba Function170be4
	callba Function1700c4
	jr .asm_118d78

.asm_118d6e
	ld a, [hli]
	cp $96
	jr nz, .asm_118d7b
	ld a, [hl]
	cp $0
	jr nz, .asm_118d7b

.asm_118d78
	jp Function119e2e

.asm_118d7b
	ld a, $d3
	jp Function118805
; 118d80

Function118d80: ; 118d80
	call Function118e06
	ld a, [wcd38]
	and a
	jr z, .asm_118d8e
	call Function119e2e
	jr asm_118d9f

.asm_118d8e
	ld a, $9
	ld [wcd3c], a
	ld a, $12
	ld [wcd45], a
	call Function119e2e

Function118d9b:
	call Function119ed8
	ret c

asm_118d9f
	ld hl, $c608
	call Function119940
	ld a, [wcd38]
	and a
	jr nz, .asm_118db2
	ld a, $8f
	ld [wcd3b], a
	jr .asm_118db7

.asm_118db2
	ld a, $26
	ld [wcd3b], a

.asm_118db7
	ld hl, $d800
	ld a, $8
	ld [hli], a
	ld a, $c6
	ld [hli], a
	ld a, [wcd3b]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $8
	ld [hli], a
	ld a, $c7
	ld [hli], a
	ld a, [wcd39]
	ld [hli], a
	ld a, [wcd3a]
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, $d800
	ld de, $de00
	ld bc, $0200
	ld a, $2c
	jp Function119e2b
; 118ded

Function118ded: ; 118ded
	ld a, [wcd38]
	and a
	jr z, .asm_118e03
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba Function11b93b
	pop af
	ld [rSVBK], a

.asm_118e03
	jp Function119e2e
; 118e06

Function118e06: ; 118e06
	ld hl, DefaultFlypoint
	ld a, [wcd38]
	and a
	jr z, .asm_118e1d
.asm_118e0f
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_118e0f
	ld a, [hli]
	cp $a
	jr nz, .asm_118e0f

.asm_118e1d
	ld a, l
	ld [wcd39], a
	ld a, h
	ld [wcd3a], a
.asm_118e25
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_118e25
	ld a, [hli]
	cp $a
	jr nz, .asm_118e25
	dec hl
	xor a
	ld [hld], a
	ld [hl], a
	jr asm_118e3e

Function118e39: ; 118e39 (46:4e39)
.asm_118e39
	ld a, [hli]
	and a
	jr nz, .asm_118e39
	dec hl
asm_118e3e
.asm_118e3e
	ld a, [hld]
	cp $2f
	jr nz, .asm_118e3e
rept 2
	inc hl
endr
	ld de, wcd85
	ld c, $4
.asm_118e4a
	ld a, [hli]
	cp $2e
	jr z, .asm_118e63
	cp $30
	jr c, .asm_118e67
	cp $3a
	jr nc, .asm_118e67
	sub $30
	add $f6
	ld [de], a
	inc de
	dec c
	jr nz, .asm_118e4a
	ld de, wcd85
.asm_118e63
	ld a, $50
	ld [de], a
	ret
.asm_118e67
	ld a, $f3
	ld [de], a
	inc de
	jr .asm_118e63

Function118e6d: ; 118e6d (46:4e6d)
	xor a
	ld [wcd65], a
	ld a, $a
	jp Function119e2b

Function118e76: ; 118e76 (46:4e76)
	ld a, $c
	ld [wcd3c], a
	jp Function119e2e

Function118e7e: ; 118e7e (46:4e7e)
	call Function119ed8
	ret c
	ld a, $36
	jp Function119e2b

Function118e87: ; 118e87 (46:4e87)
	call Function119ed8
	ret c
	ld a, [wcd33]
	ld [wcf66], a
	ret
; 118e92 (46:4e92)

Function118e92: ; 118e92
	call Function118440
	call Function1191d3
	ld a, [wcd53]
	ld l, a
	ld a, [wcd54]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld de, $d800
	ld bc, $0800
	jp Function118b10
; 118eb0

Function118eb0: ; 118eb0
	call Function118440
	ld hl, $d802
	ld de, BGMapBuffer
	ld bc, $000c
	call CopyBytes
	call Function1192cc
	ret c
	jp Function119e2e
; 118ec6

Function118ec6: ; 118ec6
	call Function118440
	call SpeechTextBox
	ld hl, $d80e
	ld de, wc320
	ld bc, $0026
	call CopyBytes
	xor a
	ld [wc31f], a
	ld a, $20
	ld [wc31b], a
	ld a, $c3
	ld [wc31c], a
	hlcoord 1, 14
	ld a, l
	ld [wc31d], a
	ld a, h
	ld [wc31e], a
	ld a, $2
	ld [wc31a], a
	ld a, $1d
	ld [wcd3c], a
	ld a, $24
	ld [wcd45], a
	ld a, $11
	ld [wcd46], a
	ld a, $1c
	ld [wcd47], a
	jp Function119e2e
; 118f0d

Function118f0d: ; 118f0d
	call Function119ed8
	ret c
	call Function118440

Function118f14:
	call Function118440
	ld a, [wcd51]
	ld l, a
	ld a, [wcd52]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld a, [wcc60]
	and a
	jr z, .asm_118f32
	ld hl, UnknownText_0x11aa13
	call Function11a9c0

.asm_118f32
	ld a, [wcd57]
	ld l, a
	ld a, [wcd58]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld hl, wcc60
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $24
	ld [wcd45], a
	ld a, $13
	ld [wcd46], a
	ld a, $1c
	ld [wcd47], a
	jp Function119e2e
; 118f5e

Function118f5e: ; 118f5e
	call Function119ed8
	ret c
	call Function118440
	call DelayFrame

Function118f68:
	call Function119223
	ret c
	call Function118440
	ld a, [wcd51]
	ld l, a
	ld a, [wcd52]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld a, [wcc60]
	and a
	jr z, .asm_118fba
	ld hl, wc346
	ld a, $c608 % $100
	ld [hli], a
	ld a, $c608 / $100
	ld [hli], a
	ld a, [wcd4b]
	ld [hli], a
	ld a, [wcd4c]
	ld [hli], a
	ld a, wc708 % $100
	ld [hli], a
	ld a, wc708 / $100
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, wc346
	ld de, $de00
	ld bc, $0200
	ld a, $2c
	jp Function119e2b

.asm_118fba
	call Function119e2e
	jp Function119e2e
; 118fc0

Function118fc0: ; 118fc0
	call Function118440
	ld a, [wcd55]
	ld l, a
	ld a, [wcd56]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld a, [wcc60]
	and a
	jr z, .asm_118ffa
	ld a, [wcd51]
	ld l, a
	ld a, [wcd52]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld a, [wcc60]
	and a
	jr z, .asm_118ff2
	ld hl, UnknownText_0x11aa2c
	jr .asm_118ff5

.asm_118ff2
	ld hl, UnknownText_0x11aa4b

.asm_118ff5
	call Function11a9c0
	jr Function119009

.asm_118ffa
	ld hl, UnknownText_0x11aa4b
	call Function11a9c0
	call Function119e2e
	call Function119e2e
	jp Function119e2e

Function119009:
	call Function118440
	call Function119300
	ld a, [wcd55]
	ld l, a
	ld a, [wcd56]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld hl, wc346
	ld a, $8
	ld [hli], a
	ld a, $c6
	ld [hli], a
	ld a, [wcd4b]
	ld [hli], a
	ld a, [wcd4c]
	ld [hli], a
	ld a, $8
	ld [hli], a
	ld a, $c7
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, wc346
	ld de, Unkn1Pals
	ld bc, $1000
	ld a, $2c
	jp Function119e2b
; 119054

Function119054: ; 119054
	ld a, $6
	call GetSRAMBank
	ld hl, DefaultFlypoint
	ld a, [wcd4f]
	ld e, a
	ld a, [wcd50]
	ld d, a
	ld a, [Unkn1Pals]
	ld c, a
	ld a, [wd001]
	ld b, a
	call Function119192
	ret c
	ld a, [wcd89]
	and $1
	jr z, .asm_11908a
	ld a, $6
	ld [rSVBK], a
	ld hl, DefaultFlypoint
	ld a, [Unkn1Pals]
	ld c, a
	ld a, [wd001]
	ld b, a
	call Function119192
	ret c

.asm_11908a
	call CloseSRAM
	ld a, $3
	ld [rSVBK], a
	ld a, $5
	call GetSRAMBank
	ld a, [wcd4f]
	ld [$b1b3], a
	ld a, [wcd50]
	ld [$b1b4], a
	ld hl, BGMapBuffer
	ld de, $aa7f
	ld bc, $000c
	call CopyBytes
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [wd474]
	ld [$b2f3], a
	ld hl, wd475
	ld de, $b2f4
	ld bc, $0004
	call CopyBytes
	pop af
	ld [rSVBK], a
	call CloseSRAM
	jp Function119e2e
; 1190d0

Function1190d0: ; 1190d0
	ld a, $3
	ld [rSVBK], a
	ld a, [wcd57]
	ld l, a
	ld a, [wcd58]
	ld h, a
	ld de, wcc60
	call Function1191ad
	ret c
	ld de, Unkn1Pals
	ld bc, $1000
	jp Function118b10
; 1190ec

Function1190ec: ; 1190ec
	ld a, $5
	call GetSRAMBank
	ld hl, BGMapBuffer
	ld de, $aa73
	ld bc, $000c
	call CopyBytes
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	ld a, $1
	ld [$aa72], a
	call CloseSRAM
	ld a, $6
	call GetSRAMBank
	ld a, [Unkn1Pals]
	ld c, a
	ld a, [wd001]
	ld b, a
	ld hl, DefaultFlypoint
	ld de, $a000
	call Function119192
	ret c
	ld a, [wcd89]
	and $1
	jr z, .asm_11913e
	ld a, $6
	ld [rSVBK], a
	ld a, [Unkn1Pals]
	ld c, a
	ld a, [wd001]
	ld b, a
	ld hl, DefaultFlypoint
	call Function119192
	ret c

.asm_11913e
	ld a, $3
	ld [rSVBK], a
	call CloseSRAM
	ld hl, UnknownText_0x11aa5a
	call Function11a9c0
	jp Function119e2e
; 11914e

Function11914e: ; 11914e
	call Function119ed8
	ret c
	ld a, $1c
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	ret
; 11915d

Function11915d: ; 11915d
	ld hl, $d802
	ld de, BGMapBuffer
	ld bc, $000c
	call CopyBytes
	ld a, $5
	call GetSRAMBank
	ld hl, BGMapBuffer
	ld de, $aa7f
	ld c, $c
.asm_119176
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_119184
	inc hl
	dec c
	jr nz, .asm_119176
	call Function119e2e
	jr .asm_11918e

.asm_119184
	ld a, $16
	ld [wcf66], a
	ld a, $b
	ld [wc300], a

.asm_11918e
	call CloseSRAM
	ret
; 119192

Function119192: ; 119192
	inc b
	inc c
	jr .asm_11919e

.asm_119196
	ld a, [hli]
	ld [de], a
	inc de
	ld a, $bf
	cp d
	jr c, .asm_1191a6

.asm_11919e
	dec c
	jr nz, .asm_119196
	dec b
	jr nz, .asm_119196
	and a
	ret

.asm_1191a6
	ld a, $d3
	call Function118805
	scf
	ret
; 1191ad

Function1191ad: ; 1191ad
	push bc
	ld c, $0
	ld a, $5
	ld [rSVBK], a
.asm_1191b4
	ld a, [hli]
	ld [de], a
	inc de
	and a
	jr z, .asm_1191cc
	inc c
	ld a, c
	cp $a6
	jr c, .asm_1191b4
	ld a, $da
	call Function118805
	ld a, $3
	ld [rSVBK], a
	pop bc
	scf
	ret

.asm_1191cc
	ld a, $3
	ld [rSVBK], a
	pop bc
	and a
	ret
; 1191d3

Function1191d3: ; 1191d3
	ld hl, wd102
	ld a, l
	ld [wcd53], a
	ld a, h
	ld [wcd54], a
	call Function11920f
	ld a, l
	ld [wcd51], a
	ld a, [wcd4a]
	ld a, h
	ld [wcd52], a
	call Function11920f
	ld a, l
	ld [wcd55], a
	ld a, [wcd4a]
	ld a, h
	ld [wcd56], a
	call Function11920f
	ld a, [wcd49]
	ld a, l
	ld [wcd57], a
	ld a, [wcd4a]
	ld a, h
	ld [wcd58], a
	call Function11920f
	ret
; 11920f

Function11920f: ; 11920f
.asm_11920f
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_11920f
	ld a, [hli]
	cp $a
	jr nz, .asm_11920f
	dec hl
	xor a
	ld [hld], a
	ld [hli], a
	inc hl
	ret
; 119223

Function119223: ; 119223
	xor a
	ld [wcd4b], a
	ld [wcd4c], a
	ld a, $5
	call GetSRAMBank
	ld hl, wc3cd
	ld de, $b092
	ld bc, $001f
	call CopyBytes
	dec de
	xor a
	ld [de], a
	ld hl, $d810
.asm_119241
	ld a, [hli]
	cp $50
	jr nz, .asm_119241
	ld a, [hli]
	ld [wcd4f], a
	ld a, [hli]
	ld [wcd50], a
	ld a, [hli]
	ld [$b1b1], a
	ld c, a
	ld a, [hli]
	ld [$b1b2], a
	ld b, a
	ld de, $b1d3
	call CopyBytes
	call CloseSRAM
	ld e, l
	ld d, h
	ld hl, $c608
.asm_119266
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_1192c2
	cp $fe
	jr z, .asm_1192a5
	call GetSRAMBank
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	inc de
	ld b, a
	ld a, [de]
	inc de
	push de
	push af
	ld a, [wcd4b]
	ld e, a
	ld a, [wcd4c]
	ld d, a
	pop af
.asm_119286
	push af
	ld a, [bc]
	inc bc
	ld [hli], a
	inc de
	pop af
	dec a
	jr nz, .asm_119286
	call CloseSRAM
	ld a, e
	ld [wcd4b], a
	ld a, d
	ld [wcd4c], a
	pop de
.asm_11929b
	and a
	jr z, .asm_119266
	ld a, $d3
	call Function118805
	scf
	ret

.asm_1192a5
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4c]
	ld b, a
	ld a, [de]
	inc de
.asm_1192af
	push af
	ld a, [de]
	inc de
	ld [hli], a
	inc bc
	pop af
	dec a
	jr nz, .asm_1192af
	ld a, c
	ld [wcd4b], a
	ld a, b
	ld [wcd4c], a
	jr .asm_11929b

.asm_1192c2
	ld a, e
	ld [wcd4d], a
	ld a, d
	ld [wcd4e], a
	and a
	ret
; 1192cc

Function1192cc: ; 1192cc
	ld a, $5
	call GetSRAMBank
	ld hl, $aa73
	ld de, $c608
	ld bc, $000c
	call CopyBytes
	call CloseSRAM
	ld hl, $c608
	ld de, BGMapBuffer
	ld c, $c
.asm_1192e8
	ld a, [de]
	inc de
	ld b, a
	ld a, [hli]
	cp b
	jr nz, .asm_1192fe
	dec c
	jr nz, .asm_1192e8
	ld a, $1f
	ld [wcd3c], a
	ld a, $27
	ld [wcf66], a
	scf
	ret

.asm_1192fe
	and a
	ret
; 119300

Function119300: ; 119300
	xor a
	ld [wcd4b], a
	ld [wcd4c], a
	ld a, [wcd4d]
	ld e, a
	ld a, [wcd4e]
	ld d, a
	ld hl, $c608
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4c]
	ld b, a
.asm_11931a
	ld a, [de]
	inc de
	cp $50
	jr z, .asm_119324
	ld [hli], a
	inc bc
	jr .asm_11931a

.asm_119324
	ld a, $3d
	ld [hli], a
	inc bc
	ld a, c
	ld [wcd4b], a
	ld a, b
	ld [wcd4c], a
	ld a, [de]
	inc de
	call GetSRAMBank
	ld a, [de]
	inc de
	ld c, a
	ld a, [de]
	inc de
	ld b, a
	ld a, [de]
	inc de
	push de
	push af
	ld a, [wcd4b]
	ld e, a
	ld a, [wcd4c]
	ld d, a
	pop af
.asm_119348
	push af
	ld a, [bc]
	and $f0
	swap a
	call Function1197bf
	ld [hli], a
	inc de
	ld a, [bc]
	inc bc
	and $f
	call Function1197bf
	ld [hli], a
	inc de
	pop af
	dec a
	jr nz, .asm_119348
	call CloseSRAM
	ld a, e
	ld [wcd4b], a
	ld a, d
	ld [wcd4c], a
	pop de
	ld a, [de]
	cp $50
	jr z, .asm_11937f
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4c]
	ld b, a
	ld a, $26
	ld [hli], a
	inc bc
	jr .asm_11931a

.asm_11937f
	ret
; 119380

Function119380: ; 119380
	ld a, $80
	ld [wcd49], a
	jp Function119e2e
; 119388

Function119388: ; 119388
	ld hl, wcd49
	dec [hl]
	ret nz
	ld hl, wcc60
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $10
	ld [wcd45], a
	call Function119e2e

Function1193a0:
	call Function119ed8
	ret c
	call DelayFrame
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	ld hl, wc346
	ld a, wd000 % $100
	ld [hli], a
	ld a, wd000 / $100
	ld [hli], a
	ld a, [wcd3b]
	ld [hli], a
	xor a
	ld [hli], a
	ld a, wc708 % $100
	ld [hli], a
	ld a, wc708 / $100
	ld [hli], a
	ld a, $60
	ld [hli], a
	ld a, $cc
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, wc346
	ld de, $de00
	ld bc, $0200
	ld a, $2c
	jp Function119e2b
; 1193e3

Function1193e3: ; 1193e3
	ld hl, wcd49
	dec [hl]
	ret nz
	ld hl, wcc60
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $11
	ld [wcd45], a
	call Function119e2e

Function1193fb:
	call Function119ed8
	ret c
	call DelayFrame
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	ld de, Unkn1Pals
	ld bc, $1000
	jp Function118b10
; 119413

Function119413: ; 119413
	ld a, $6
	call GetSRAMBank
	ld a, [Unkn1Pals]
	ld c, a
	ld a, [wd001]
	ld b, a
rept 2
	dec bc
endr
	ld hl, wd002
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call Function119192
	ret c
	ld a, [wcd89]
	and $1
	jr z, .asm_119447
	ld a, $6
	ld [rSVBK], a
	ld a, [wd000]
	ld c, a
	ld a, [wd001]
	ld b, a
	ld hl, wd002
	call Function119192
	ret c

.asm_119447
	ld a, $3
	ld [rSVBK], a
	call CloseSRAM
	jp Function119e2e
; 119451

Function119451: ; 119451 (46:5451)
	ld a, [wcd89]
	and $1
	jr z, .asm_11945d
	ld a, $d3
	jp Function118805
.asm_11945d
	xor a
	ld [wcd50], a
	call Function119694
	ld a, b
	ld [wcd49], a
	call Function1196cd
	ld a, [DefaultFlypoint]
	ld hl, wd003

Function119471: ; 119471 (46:5471)
	push af
	ld a, [hli]
	ld [$c608], a
	ld a, [hli]
	ld [$c608 + 3], a
	ld a, [hli]
	ld [$c608 + 1], a
	ld a, [hli]
	ld [$c608 + 2], a
	ld a, [hli]
	ld [$c608 + 4], a
	ld a, [hli]
	ld [$c608 + 5], a ; $c608 + 5
	push hl
	ld a, [$c608]
	cp $ff
	jr z, .asm_1194a7
	ld a, [$c608 + 2]
	cp $ff
	jr z, .asm_1194a7
	ld a, [$c608 + 1]
	cp $ff
	jr nz, .asm_1194a7
	call Function119584
	jr c, .asm_11950c
	jr .asm_1194f0
.asm_1194a7
	ld hl, $c608
	ld de, $c608 + 3
	ld c, $3
.asm_1194af
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr c, .asm_1194f3
	jr z, .asm_1194b9
	jr nc, .asm_1194bc
.asm_1194b9
	dec c
	jr nz, .asm_1194af
.asm_1194bc
	ld c, $3
	ld hl, wcd49
	ld de, $c608
.asm_1194c4
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_1194d1
	cp [hl]
	jr z, .asm_1194d1
	jr c, .asm_1194d5
	jr nc, .asm_1194f0
.asm_1194d1
	inc hl
	dec c
	jr nz, .asm_1194c4
.asm_1194d5
	ld c, $3
	ld hl, wcd49
	ld de, $c608 + 3
.asm_1194dd
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_1194ea
	cp [hl]
	jr c, .asm_1194f0
	jr z, .asm_1194ea
	jr nc, .asm_11950c
.asm_1194ea
	inc hl
	dec c
	jr nz, .asm_1194dd
	jr .asm_11950c
.asm_1194f0
	pop hl
	jr .asm_119557
.asm_1194f3
	ld c, $3
	ld hl, wcd49
	ld de, $c608
.asm_1194fb
	ld a, [de]
	inc de
	cp $ff
	jr z, .asm_119508
	cp [hl]
	jr c, .asm_11950c
	jr z, .asm_119508
	jr nc, .asm_1194d5
.asm_119508
	inc hl
	dec c
	jr nz, .asm_1194fb
.asm_11950c
	pop hl
	ld a, $1
	ld [wcd50], a
	ld a, l
	ld [$c608], a
	ld a, h
	ld [$c608 + 1], a
	ld de, wcd69
	ld c, $10
	ld b, $0
.asm_119521
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_119528
	inc b
.asm_119528
	dec c
	jr nz, .asm_119521
	ld a, $10
	cp b
	jr z, .asm_119536
rept 4
	inc hl
endr
	jr .asm_11957a
.asm_119536
	ld a, [hli]
	cp $50
	jr nz, .asm_119552
	ld a, [hli]
	cp $33
	jr nz, .asm_119553
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [wcd83]
	cp c
	jr nz, .asm_119576
	ld a, [wcd84]
	cp b
	jr nz, .asm_119576
	jr .asm_11955b
.asm_119552
	inc hl
.asm_119553
rept 2
	inc hl
endr
	jr .asm_11955b
.asm_119557
	ld de, $14
	add hl, de
.asm_11955b
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	add hl, de
	pop af
	dec a
	jp nz, Function119471
	ld a, [wcd50]
	and a
	jr z, .asm_119571
	ld a, $1a
	ld [wcf66], a
	ret
.asm_119571
	ld a, $d8
	jp Function118805
.asm_119576
	ld a, $10
	jr .asm_11957c
.asm_11957a
	ld a, $f
.asm_11957c
	ld [wcf66], a
	pop af
	call Function1195c4
	ret

Function119584: ; 119584 (46:5584)
	ld a, [$c608]
	ld b, a
	ld a, [$c608 + 3]
	ld c, a
	cp b
	jr c, .asm_11959c
	ld a, [wcd49]
	cp b
	jr c, .asm_1195c2
.asm_119595
	cp c
	jr c, .asm_1195a2
	jr z, .asm_1195a2
	jr .asm_1195c2
.asm_11959c
	ld a, [wcd49]
	cp b
	jr c, .asm_119595
.asm_1195a2
	ld a, [$c608 + 2]
	ld b, a
	ld a, [$c608 + 5] ; $c608 + 5
	ld c, a
	cp b
	jr c, .asm_1195ba
	ld a, [wcd4b]
	cp b
	jr c, .asm_1195c2
.asm_1195b3
	cp c
	jr c, .asm_1195c0
	jr z, .asm_1195c0
	jr .asm_1195c2
.asm_1195ba
	ld a, [wcd4b]
	cp b
	jr c, .asm_1195b3
.asm_1195c0
	scf
	ret
.asm_1195c2
	and a
	ret

Function1195c4: ; 1195c4 (46:55c4)
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, $a5
	ld a, b
	cp d
	jr c, .asm_1195d9
	jr z, .asm_1195d3
	jr nc, .asm_1195f3
.asm_1195d3
	ld a, c
	cp e
	jr z, .asm_1195d9
	jr nc, .asm_1195f3
.asm_1195d9
	ld de, wcc60
	call CopyBytes
	xor a
	ld [de], a
	ld a, [$c608]
	ld l, a
	ld a, [$c608 + 1]
	ld h, a
	ld de, wcd69
	ld bc, $10
	call CopyBytes
	ret
.asm_1195f3
	ld a, $d8
	jp Function118805

Function1195f8: ; 1195f8 (46:55f8)
	ld a, $11
	ld [wcd3c], a
	ld a, $1c
	ld [wcd45], a
	ld a, $f
	ld [wcd46], a
	ld a, $14
	ld [wcd47], a
	call Function119e2e
	jp Function119e2e

Function119612: ; 119612 (46:5612)
	ld a, $14
	ld [wcd3c], a
	ld a, $1c
	ld [wcd45], a
	ld a, $10
	ld [wcd46], a
	ld a, $14
	ld [wcd47], a
	jp Function119e2e

Function119629: ; 119629 (46:5629)
	call Function119ed8
	ret c
	ld a, $60
	ld l, a
	ld a, $cc
	ld h, a
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $1c
	ld [wcd45], a
	ld a, $14
	ld [wcd47], a
	call Function119e2e

Function119648: ; 119648 (46:5648)
	call Function119ed8
	ret c
	call DelayFrame
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	call Function118b24
	ld de, Unkn1Pals
	ld bc, $1000
	ld a, $2a
	jp Function119e2b

Function119665: ; 119665 (46:5665)
	ld a, $1a
	ld [wcd3c], a
	call Function119e2e

Function11966d: ; 11966d (46:566d)
	call Function119ed8
	ret c
	ld a, [wcd47]
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	ret

Function11967d: ; 11967d (46:567d)
	ld a, $18
	ld [wcd3c], a
	call Function119e2e

Function119685: ; 119685 (46:5685)
	call Function119ed8
	ret c
	ld a, $14
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	ret

Function119694: ; 119694 (46:5694)
	ld b, 0
	ld hl, Unknown_1196b8
.asm_119699
	ld de, wc708
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_1196af
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_1196b0
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_1196b1
	ret
.asm_1196af
	inc hl
.asm_1196b0
	inc hl
.asm_1196b1
	inc b
	ld a, b
	cp $7
	jr nz, .asm_119699
	ret
; 1196b8 (46:56b8)

Unknown_1196b8: ; 1196b8
	db "Mon"
	db "Tue"
	db "Wed"
	db "Thu"
	db "Fri"
	db "Sat"
	db "Sun"
; 1196cd

SECTION "bank46_2", ROMX, BANK[$46]
; A hack to use ascii above.

Function1196cd: ; 1196cd (46:56cd)
	ld de, wc719
	call Function1196de
	ld [wcd4a], a
	inc de
	call Function1196de
	ld [wcd4b], a
	ret

Function1196de: ; 1196de (46:56de)
	ld a, [de]
	inc de
	sub $30
	sla a
	ld b, a
	sla a
	sla a
	add b
	ld c, a
	add hl, bc
	ld a, [de]
	inc de
	sub $30
	add c
	ret
; 1196f2 (46:56f2)

Function1196f2: ; 1196f2
	ld hl, DefaultFlypoint
.asm_1196f5
	call Function118b9a
	ret nc
	ld a, [hli]
	cp $d
	jr nz, .asm_1196f5
	ld a, [hl]
	cp $a
	jr nz, .asm_1196f5
	xor a
	ld [hld], a
	ld [hli], a
	ld a, l
	ld [wcd5b], a
	ld a, h
	ld [wcd5c], a
	inc hl
	ld e, l
	ld d, h
	ld a, [de]
	inc de
	cp $d
	jr nz, .asm_119722
	ld a, [de]
	inc de
	cp $a
	jr nz, .asm_119722
	ld a, $b
	jp Function118805

.asm_119722
	call Random
	ld c, $0
	ld b, c
.asm_119728
	call Function119798
	ld a, d
	cp $ff
	jr nz, .asm_119735
	ld a, e
	cp $ff
	jr z, .asm_11974c

.asm_119735
	ld a, [hRandomSub]
	cp d
	jr c, .asm_11974c
	jr z, .asm_11973e
	jr .asm_119745

.asm_11973e
	ld a, [hRandomAdd]
	cp e
	jr c, .asm_11974c
	jr z, .asm_11974c

.asm_119745
	inc bc
	ld a, c
	or b
	jr z, .asm_119770
	jr .asm_119728

.asm_11974c
	ld a, [wcd5b]
	ld l, a
	ld a, [wcd5c]
	ld h, a
.asm_119754
	ld a, [hld]
	cp $58
	jr nz, .asm_119754
	ld d, $0
.asm_11975b
	inc d
	ld a, [hld]
	cp $58
	jr z, .asm_11975b
rept 2
	inc hl
endr
	ld a, d
	dec a
	jr z, .asm_11978e
	dec a
	jr z, .asm_119785
	dec a
	jr z, .asm_11977e
	dec a
	jr z, .asm_119775

.asm_119770
	ld a, $d3
	jp Function118805

.asm_119775
	ld a, b
	and $f0
	swap a
	call Function1197bf
	ld [hli], a

.asm_11977e
	ld a, b
	and $f
	call Function1197bf
	ld [hli], a

.asm_119785
	ld a, c
	and $f0
	swap a
	call Function1197bf
	ld [hli], a

.asm_11978e
	ld a, c
	and $f
	call Function1197bf
	ld [hli], a
	jp Function119e2e
; 119798

Function119798: ; 119798
	ld d, $0
	ld e, d
	call Function1197b4
	swap a
	or d
	ld d, a
	call Function1197b4
	or d
	ld d, a
	call Function1197b4
	swap a
	or e
	ld e, a
	call Function1197b4
	or e
	ld e, a
	ret
; 1197b4

Function1197b4: ; 1197b4
	ld a, [hli]
	cp $61
	jr nc, .asm_1197bc
	sub $30
	ret

.asm_1197bc
	sub $57
	ret
; 1197bf

Function1197bf: ; 1197bf
	cp $a
	jr nc, .asm_1197c6
	add $30
	ret

.asm_1197c6
	add $57
	ret
; 1197c9

Function1197c9: ; 1197c9
	ld hl, DefaultFlypoint
	call Function118e39
	ld a, $9
	ld [wcd3c], a
	ld a, $12
	ld [wcd45], a
	call Function119e2e

Function1197dc:
	call Function119ed8
	ret c
	call DelayFrame
	ld hl, DefaultFlypoint
	ld de, wcc60
	ld bc, $0080
	call CopyBytes
	dec de
	xor a
	ld [de], a
	call Function118b24
	ld de, Unkn1Pals
	ld bc, $1000
	ld a, $2a
	jp Function119e2b
; 119800

Function119800: ; 119800
	ld a, $fd
	ld [$c6d0], a
	ld [wc702], a
	ld a, [wcd81]
	ld [wc74e], a
	ld a, [wcf63]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcf65]
	push af
	ld a, [wcf66]
	push af
	ld a, $1
	ld [rSVBK], a
	call FadeToMenu
	callba Function10803d
	call Function11a9ce
	call RestartMapMusic
	ld a, $3
	ld [rSVBK], a
	pop af
	ld [wcf66], a
	pop af
	ld [wcf65], a
	pop af
	ld [wcf64], a
	pop af
	ld [wcf63], a
	callba Function115dc3
	jp Function119e2e
; 11984e

Function11984e: ; 11984e
	ld a, [wcd80]
	and a
	jr nz, .asm_1198a0
	ld a, [wcd38]
	and a
	jr nz, .asm_1198a8
	callba Function170000
	ld a, [wcf63]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcf65]
	push af
	ld a, [wcf66]
	push af
	ld a, $1
	ld [rSVBK], a
	call FadeToMenu
	callba Function108000
	call Function11a9ce
	call RestartMapMusic
	ld a, $3
	ld [rSVBK], a
	pop af
	ld [wcf66], a
	pop af
	ld [wcf65], a
	pop af
	ld [wcf64], a
	pop af
	ld [wcf63], a
	callba Function115dc3
	jp Function119e2e

.asm_1198a0
	ld a, $a
	ld [wc300], a
	jp Function119e2e

.asm_1198a8
	callba Function17005a
	ld a, [wcf63]
	push af
	ld a, [wcf64]
	push af
	ld a, [wcf65]
	push af
	ld a, [wcf66]
	push af
	ld a, $1
	ld [rSVBK], a
	call FadeToMenu
	callba Function108012
	call Function11a9ce
	call RestartMapMusic
	ld a, $3
	ld [rSVBK], a
	pop af
	ld [wcf66], a
	pop af
	ld [wcf65], a
	pop af
	ld [wcf64], a
	pop af
	ld [wcf63], a
	callba Function115dc3
	jp Function119e2e
; 1198ee

Function1198ee: ; 1198ee
	ld hl, UnknownText_0x11aab2
	call Function11a9c0
	call Function119e2e

Function1198f7:
	ld a, [wc31a]
	and a
	ret nz
	ld hl, $c608 + 2
	call Function119940
	ld hl, $d800
	ld a, $c608 % $100
	ld [hli], a
	ld a, $c608 / $100
	ld [hli], a
	ld a, $f6
	ld [hli], a
	xor a
	ld [hli], a
	ld a, wc708 % $100
	ld [hli], a
	ld a, wc708 / $100
	ld [hli], a
	ld a, [wcd51]
	ld [hli], a
	ld a, [wcd52]
	ld [hli], a
	call Function119eb4
	call Function119ec2
	ld a, $40
	ld [wcd89], a
	ld hl, $d800
	ld de, $de00
	ld bc, $0200
	ld a, $2c
	jp Function119e2b
; 119937

Function119937: ; 119937
	callba Function1707f4
	jp Function119e2e
; 119940

Function119940: ; 119940
	ld de, wc3cd
	ld c, $1e
.asm_119945
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr z, .asm_119953
	and a
	jr nz, .asm_119945
	xor a
.asm_11994f
	ld [hli], a
	dec c
	jr nz, .asm_11994f

.asm_119953
	ret
; 119954

Function119954: ; 119954
	ld a, $1c
	ld [wcd3c], a
	call Function119ed8
	ld hl, $c608
	ld de, wc3cd
.asm_119962
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .asm_119962
	call Function119ec2
	ld hl, $c608
	ld a, $1e
	jp Function119e2b
; 119973

Function119973: ; 119973
	ld a, $1
	ld [wcf64], a
	xor a
	ld [wcf65], a
	ld [StringBuffer2 + 10], a
	ld de, Unkn1Pals
	ld a, $20
	jp Function119e2b
; 119987

Function119987: ; 119987
	ld hl, wd001
	ld a, [Unkn1Pals]
	or [hl]
	jr z, .asm_1199a0
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a
	ld de, BGPals
	ld a, $22
	jp Function119e2b

.asm_1199a0
	ld a, [StringBuffer2 + 10]
	and a
	jr z, .asm_1199ae
	ld a, $16
	ld [wcf66], a
	jp Function119b0d

.asm_1199ae
	ld a, $1b
	ld [wcf66], a
	ret
; 1199b4

Function1199b4: ; 1199b4
	ld a, [wd000 + 130]
	and a
	jr nz, .asm_1199c7
	ld a, [wd000 + 129]
	cp $7
	jr nc, .asm_1199c7
	call Function119e2e
	jp Function1199ca

.asm_1199c7
	jp Function119ac9
; 1199ca

Function1199ca: ; 1199ca
	ld a, $20
	ld [wcd89], a
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a
	ld de, LYOverrides
	ld bc, $0700
	ld a, $28
	jp Function119e2b
; 1199e2

Function1199e2: ; 1199e2
	ld c, $c
	ld de, Unknown_119e33
	call Function119e4f
	jp c, Function119ac9
	ld a, c
	cp $1
	jp nz, Function119ac9
	ld hl, $d880
	ld bc, Unknown_119af1
.asm_1199f9
	ld a, [bc]
	and a
	jr z, .asm_119a05
	cp [hl]
	jp nz, Function119ac9
	inc bc
	inc hl
	jr .asm_1199f9

.asm_119a05
	ld c, $17
	ld de, Unknown_119e40
	call Function119e4f
	jp c, .asm_119aa7
	ld a, c
	cp $1
	jp nz, .asm_119aa7
	ld a, [wd000 + $880]
	cp $31
	jp nz, .asm_119aa7
	ld a, [wd000 + $881]
	cp $20
	jp nz, .asm_119aa7
	ld a, [wd000 + $88a]
	cp $20
	jp nz, .asm_119aa7
	ld a, [wd000 + $894]
	cp $20
	jp nz, .asm_119aa7
	xor a
	ld [wd000 + $8a0], a
	ld [wd000 + $8a1], a
	ld [wd000 + $8a2], a
	ld [wd000 + $8a3], a
	ld hl, $d8a0
	ld bc, $d889
	call Function119e98
	call Function119e98
	ld hl, $d8a0
	ld a, [wcd2d]
	cp [hl]
	jr nz, Function119ac9
	inc hl
	ld a, [wcd2c]
	cp [hl]
	jr nz, Function119ac9
	inc hl
	ld a, [wcd2b]
	cp [hl]
	jr nz, Function119ac9
	inc hl
	ld a, [wcd2a]
	cp [hl]
	jr nz, Function119ac9
	xor a
	ld [wd000 + $8a0], a
	ld [wd000 + $8a1], a
	ld [wd000 + $8a2], a
	ld [wd000 + $8a3], a
	ld hl, $d8a0
	ld bc, $d88e
	call Function119e98
	ld bc, $d893
	call Function119e98
	ld hl, $d8a0
	ld a, [wcd2f]
	cp [hl]
	jr nz, .asm_119aa7
	inc hl
	ld a, [wcd2e]
	cp [hl]
	jr nz, .asm_119aa7
	inc hl
	ld a, [wcd31]
	cp [hl]
	jr nz, .asm_119aa7
	inc hl
	ld a, [wcd30]
	cp [hl]
	jr z, .asm_119aaf

.asm_119aa7
	ld a, $25
	ld [wcf66], a
	jp Function119b45

.asm_119aaf
	ld a, [StringBuffer2 + 10]
	and a
	jr nz, .asm_119aa7
	ld a, [wd000 + $895]
	sub $30
	ld [StringBuffer2 + 10], a
	ld a, [wcf64]
	ld [StringBuffer2 + 11], a
	ld a, [wcf65]
	ld [StringBuffer2 + 12], a

Function119ac9:
	ld a, [Unkn1Pals]
	ld l, a
	ld a, [wd001]
	ld h, a
	dec hl
	ld a, l
	ld [Unkn1Pals], a
	ld a, h
	ld [wd001], a
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a
	inc hl
	ld a, l
	ld [wcf64], a
	ld a, h
	ld [wcf65], a
	ld a, $10
	ld [wcf66], a
	ret
; 119af1

Unknown_119af1:
	INCBIN "data/mobile/x-game-code.txt"
	INCBIN "data/mobile/x-game-result.txt"
; 119b0d

Function119b0d: ; 119b0d
	ld a, $8
	ld [wcd3c], a
	call Function119ed8
	ld a, [StringBuffer2 + 10]
	cp $1
	jr z, .asm_119b23
	ld a, $19
	ld [wcf66], a
	jr Function119b3b

.asm_119b23
	ld a, $10
	ld [wcd89], a
	ld a, [StringBuffer2 + 11]
	ld l, a
	ld a, [StringBuffer2 + 12]
	ld h, a
	ld de, LYOverrides
	ld bc, $0700
	ld a, $24
	jp Function119e2b

Function119b3b:
	ld a, [StringBuffer2 + 11]
	ld l, a
	ld a, [StringBuffer2 + 12]
	ld h, a
	jr asm_119b4d

Function119b45:
	ld a, [wcf64]
	ld l, a
	ld a, [wcf65]
	ld h, a

asm_119b4d
	ld a, $26
	jp Function119e2b
; 119b52

Function119b52: ; 119b52
	ld a, [StringBuffer2 + 10]
	cp $1
	jr nz, .asm_119b66
	ld a, $5
	call GetSRAMBank
	ld a, $4
	ld [$a800], a
	call CloseSRAM

.asm_119b66
	ld a, $1c
	jp Function119e2b
; 119b6b

Function119b6b: ; 119b6b
	ld a, [StringBuffer2 + 10]
	cp $1
	jr z, .asm_119b75
	jp Function119e2e

.asm_119b75
	ld a, [LYOverrides]
	ld b, a
	ld a, [wd101]
	or b
	jr z, .asm_119be3
	ld hl, $d800
	ld de, wd102
.asm_119b85
	ld a, [de]
	inc de
	cp $d
	jr nz, .asm_119b85
	inc de
	ld a, [de]
	cp $d
	jr nz, .asm_119b85
rept 2
	inc de
endr
.asm_119b93
	ld a, [de]
	inc de
	cp $d
	jr z, .asm_119bfa
	call Function119c3e
	ret c
	ld [hli], a
	ld a, [de]
	inc de
	call Function119c3e
	ret c
	ld [hli], a
	ld a, [de]
	inc de
	call Function119c3e
	ret c
	ld [hli], a
	ld a, [de]
	inc de
	call Function119c3e
	ret c
	ld [hl], a
	push de
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
rept 3
	inc hl
endr
	ld a, h
	cp $e0
	jr c, .asm_119b93

.asm_119be3
	ld a, $19
	ld [wcf66], a
	ld a, $5
	call GetSRAMBank
	ld a, $1
	ld [$a800], a
	call CloseSRAM
	xor a
	ld [StringBuffer2 + 10], a
	ret

.asm_119bfa
	inc de
	ld a, [de]
	cp $d
	jr nz, .asm_119b93
	ld a, l
	cp (wd000 + $800 + $69) % $100
	jr nz, .asm_119be3
	ld a, h
	cp (wd000 + $800 + $69) / $100
	jr nz, .asm_119be3
	ld a, $5
	call GetSRAMBank
	ld a, [wcf64]
	ld [$b090], a
	ld a, [wcf65]
	ld [$b091], a
	ld hl, $d800
	ld de, $b023
	ld bc, $0069
	call CopyBytes
	ld a, $3
	ld [$a800], a
	call CloseSRAM
	ld hl, $d800
	ld de, $c608
	ld bc, $0069
	call CopyBytes
	jp Function119e2e
; 119c3e

Function119c3e: ; 119c3e
	cp $2b
	jr c, .asm_119c68
	jr z, .asm_119c80
	cp $2f
	jr c, .asm_119c68
	jr z, .asm_119c84
	cp $30
	jr c, .asm_119c68
	cp $3a
	jr c, .asm_119c88
	cp $3d
	jr c, .asm_119c68
	jr z, .asm_119c8c
	cp $41
	jr c, .asm_119c68
	cp $5b
	jr c, .asm_119c8f
	cp $61
	jr c, .asm_119c68
	cp $7b
	jr c, .asm_119c93

.asm_119c68
	ld a, $19
	ld [wcf66], a
	ld a, $5
	call GetSRAMBank
	ld a, $1
	ld [$a800], a
	call CloseSRAM
	xor a
	ld [StringBuffer2 + 10], a
	scf
	ret

.asm_119c80
	ld a, $3e
	and a
	ret

.asm_119c84
	ld a, $3f
	and a
	ret

.asm_119c88
	add $4
	and a
	ret

.asm_119c8c
	xor a
	and a
	ret

.asm_119c8f
	sub $41
	and a
	ret

.asm_119c93
	sub $47
	and a
	ret
; 119c97

Function119c97: ; 119c97
	ld hl, UnknownText_0x11ab0f
	call Function11a9c0
	call Function119e2e
	jr Function119cab

Function119ca2:
	ld hl, UnknownText_0x11aaf0
	call Function11a9c0
	call Function119e2e

Function119cab:
	ld a, [wc31a]
	and a
	ret nz
	ld a, $80
	ld [wcd50], a
	call Function119e2e

Function119cb8:
	ld hl, wcd50
	dec [hl]
	ret nz
	ld a, $0
	ld [wcf66], a
	ret
; 119cc3

Function119cc3: ; 119cc3
	ld a, [wcd38]
	and a
	jr z, .asm_119cd1
	dec a
	jr z, .asm_119cd6
	ld hl, UnknownText_0x11aa6a
	jr .asm_119cd9

.asm_119cd1
	ld hl, UnknownText_0x11ab4a
	jr .asm_119cd9

.asm_119cd6
	ld hl, UnknownText_0x11ab6e

.asm_119cd9
	call Function11a9c0
	call Function119e2e

Function119cdf:
	ld a, [wc31a]
	and a
	ret nz
	ld a, $f
	ld [wcd3c], a
	call Function119e2e

Function119cec:
	call Function119ed8
	ret c
	ld a, [wcd46]
	ld [wcf66], a
	ret
; 119cf7

MenuDataHeader_119cf7: ; 119cf7
	db $40 ; flags
	db  7, 12 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 0 ; default option
; 119cff

MenuData_119cff: ; 119cff
	db $40 ; flags
	db  7, 15 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 0 ; default option
; 119d07

String_119d07:
	db "   ▼@"

Strings_119d0c:
	db " L:10 @@"
	db " L:20 @@"
	db " L:30 @@"
	db " L:40 @@"
	db " L:50 @@"
	db " L:60 @@"
	db " L:70 @@"
	db " L:80 @@"
	db " L:90 @@"
	db " L:100@@"
	db "CANCEL@@"

Strings_119d64:
	db " L:10 @@"
	db " L:20 @@"
	db " L:30 @@"
	db " L:40 @@"
	db "CANCEL@@"

String_119d8c:
	db "CANCEL@"
; 119d93

Function119d93: ; 119d93 (46:5d93)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $1
	ld [rSVBK], a ; $ff00+$70
	ld a, [wcd4f]
	ld c, 10
	call SimpleMultiply
	ld hl, wcd50
	ld [hl], a
	ld bc, PartyMon2 - PartyMon1
	ld de, PartyMon1Level
	ld a, [PartyCount]
.asm_119daf
	push af
	ld a, [de]
	push hl
	push de
	pop hl
	add hl, bc
	push hl
	pop de
	pop hl
	cp [hl]
	jr z, .asm_119dbd
	jr nc, .asm_119dc6
.asm_119dbd
	pop af
	dec a
	jr nz, .asm_119daf
	pop af
	ld [rSVBK], a ; $ff00+$70
	and a
	ret
.asm_119dc6
	pop af
	ld a, $4
	ld [wcf66], a
	pop af
	ld [rSVBK], a ; $ff00+$70
	scf
	ret

Function119dd1: ; 119dd1 (46:5dd1)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, [wcd4f]
	cp 70 / 10
	jr nc, .asm_119e08
	ld a, $1
	ld [rSVBK], a ; $ff00+$70
	ld hl, PartyMon1Level
	ld bc, PartyMon2 - PartyMon1
	ld de, PartySpecies
	ld a, [PartyCount]
.asm_119deb
	push af
	ld a, [de]
	cp MEWTWO
	jr z, .asm_119dfd
	cp MEW
	jr z, .asm_119dfd
	cp LUGIA
	jr c, .asm_119e02
	cp NUM_POKEMON + 1
	jr nc, .asm_119e02
.asm_119dfd
	ld a, [hl]
	cp 70
	jr c, .asm_119e0d
.asm_119e02
	add hl, bc
	inc de
	pop af
	dec a
	jr nz, .asm_119deb
.asm_119e08
	pop af
	ld [rSVBK], a ; $ff00+$70
	and a
	ret
.asm_119e0d
	pop af
	ld a, [de]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wcd49
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld a, $a
	ld [wcf66], a
	pop af
	ld [rSVBK], a ; $ff00+$70
	scf
	ret
; 119e2b (46:5e2b)

Function119e2b: ; 119e2b (46:5e2b)
	call Function3e32

Function119e2e: ; 119e2e (46:5e2e)
	ld hl, wcf66
	inc [hl]
	ret
; 119e33 (46:5e33)

Unknown_119e33: ; 119e33
	INCBIN "data/mobile/x-game-code-prefix.txt"
Unknown_119e40:
	INCBIN "data/mobile/x-game-result-prefix.txt"
; 119e4f

Function119e4f: ; 119e4f
	push bc
	ld hl, LYOverrides
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.asm_119e57
	ld a, [de]
	cp [hl]
	jr z, .asm_119e64
.asm_119e5b
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_119e57
.asm_119e61
	pop bc
	scf
	ret

.asm_119e64
	push de
.asm_119e65
	ld a, [de]
	inc de
	cp "\n"
	jr z, .asm_119e7a
	cp [hl]
	jr nz, .asm_119e77
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_119e65
	pop de
	jr .asm_119e61

.asm_119e77
	pop de
	jr .asm_119e5b

.asm_119e7a
	pop de
	pop bc
	inc hl
	ld de, $d880
.asm_119e80
	ld a, [hli]
	ld [de], a
	inc de
	cp $d
	jr z, .asm_119e8c
	dec c
	jr nz, .asm_119e80
	scf
	ret

.asm_119e8c
	and a
	ret
; 119e8e

Function119e8e: ; 119e8e
	cp $60
	jr c, .asm_119e95
	sub $57
	ret

.asm_119e95
	sub $30
	ret
; 119e98

Function119e98: ; 119e98
	ld a, $2
.asm_119e9a
	push af
	ld a, [bc]
	dec bc
	call Function119e8e
	or [hl]
	ld [hl], a
	ld a, [bc]
	dec bc
	call Function119e8e
	rlca
	rlca
	rlca
	rlca
	or [hl]
	ld [hl], a
	inc hl
	pop af
	dec a
	and a
	jr nz, .asm_119e9a
	ret
; 119eb4

Function119eb4: ; 119eb4 (46:5eb4)
	xor a
	ld [wc3cc], a
	ld de, wc3ac
.asm_119ebb
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .asm_119ebb
	ret

Function119ec2: ; 119ec2 (46:5ec2)
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$aa5c], a
	ld de, $aa4c
.asm_119ece
	ld a, [de]
	inc de
	ld [hli], a
	and a
	jr nz, .asm_119ece
	call CloseSRAM
	ret

Function119ed8: ; 119ed8 (46:5ed8)
	ld a, [rSVBK] ; $ff00+$70
	ld [wcd8c], a
	ld a, $1
	ld [rSVBK], a ; $ff00+$70
	call Function119eee
	ld a, [wcd8c]
	ld [rSVBK], a ; $ff00+$70
	ld a, $1
	ld [hBGMapMode], a ; $ff00+$d4
	ret

Function119eee: ; 119eee (46:5eee)
	ld a, [wcd3c]
	ld e, a
	ld d, 0
	ld hl, Jumptable_119efd
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 119efd (46:5efd)

Jumptable_119efd: ; 119efd
	dw Function119f3f
	dw Function119f45
	dw Function119f56
	dw Function119f76
	dw Function119f98
	dw Function11a113
	dw Function11a129
	dw Function11a131
	dw Function11a13d
	dw Function11a14b
	dw Function11a16d
	dw Function11a192
	dw Function11a2e6
	dw Function11a302
	dw Function11a33a
	dw Function11a207
	dw Function11a235
	dw Function11a357
	dw Function11a36b
	dw Function11a38d
	dw Function11a3c5
	dw Function11a3d9
	dw Function11a3f9
	dw Function11a41b
	dw Function11a452
	dw Function11a47a
	dw Function11a488
	dw Function11a49e
	dw Function11a4db
	dw Function11a4e8
	dw Function11a4fe
	dw Function11a466
	dw Function11a47a
; 119f3f

Function119f3f: ; 119f3f
	call Function11a5b9
	jp Function11a5b0
; 119f45

Function119f45: ; 119f45
	hlcoord 4, 2
	ld de, String_11a661
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 119f56

Function119f56: ; 119f56
	ld a, [wcd44]
	and a
	jr z, .asm_119f62
	dec a
	ld [wcd44], a
	scf
	ret

.asm_119f62
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6aa
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 119f76

Function119f76: ; 119f76
	ld a, [wcd44]
	and a
	jr z, .asm_119f82
	dec a
	ld [wcd44], a
	scf
	ret

.asm_119f82
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a679
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 119f98

Function119f98: ; 119f98
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_119fef
	call ExitMenu
	call Function11a63c
	xor a
	ld [ScriptVar], a
	call Function11a00e
	ld a, [ScriptVar]
	and a
	jr z, .asm_119fd4
	call ExitMenu
	callba Function104061
	callba Function115dc3
	ld a, [wcd33]
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	scf
	ret

.asm_119fd4
	hlcoord 4, 2
	ld de, String_11a692
	call PlaceString
	ld a, $1
	ld [wc30d], a
	ld a, $1
	ld [wc314], a
	callba Function104061
	and a
	ret

.asm_119fef
	call ExitMenu
	call ExitMenu
	callba Function104061
	ld a, [wcd45]
	ld [wcf66], a
	callba Function115dc3
	ld a, $a
	ld [wc300], a
	scf
	ret
; 11a00e

Function11a00e: ; 11a00e
	ld a, $5
	call GetSRAMBank
	ld a, [$aa4b]
	and a
	jr z, .asm_11a02a
	ld a, [$aa4c]
	call CloseSRAM
	and a
	ret nz
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$aa4b], a

.asm_11a02a
	call CloseSRAM
	ld a, [BGMapPalBuffer]
	and a
	jr z, .asm_11a039
	dec a
	jr z, .asm_11a081
	jp Function11a0ca

.asm_11a039
	ld a, $3
	ld [rSVBK], a
	ld hl, $c608
	ld de, $d800
	ld bc, $00f6
	call CopyBytes
	ld a, $1
	ld [rSVBK], a
	call FadeToMenu
	callba Function11765d
	call Function11a9ce
	ld a, $3
	ld [rSVBK], a
	ld hl, $d800
	ld de, $c608
	ld bc, $00f6
	call CopyBytes
	ld a, $1
	ld [rSVBK], a
	callba Function115d99
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret

.asm_11a081
	xor a
	ld [wcf83], a
	ld [wcf82], a
	ld a, $13
	ld [wcf85], a
	ld a, $5
	ld [wcf84], a
	call Function1c00
	callba Function11765d
	callba Function117ab4
	callba Function106462
	callba Function106464
	call ExitMenu
	callba Function104061
	callba Function115d99
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret
; 11a0ca

Function11a0ca: ; 11a0ca
	xor a
	ld [wcf83], a
	ld [wcf82], a
	ld a, $13
	ld [wcf85], a
	ld a, $11
	ld [wcf84], a
	call Function1c00
	callba Function11765d
	callba Function17d3f6
	callba Function106462
	callba Function106464
	call ExitMenu
	callba Function104061
	callba Function115d99
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret
; 11a113

Function11a113: ; 11a113
	call Function11a63c
	ld c, $1
	callba Function115e18
	hlcoord 4, 2
	ld de, String_11a6c8
	call PlaceString
	and a
	ret
; 11a129

Function11a129: ; 11a129
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a131

Function11a131: ; 11a131
	ld hl, wcd44
	dec [hl]
	ret nz
	ld a, [wcd3c]
	inc a
	ld [wcd3c], a

Function11a13d:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret
; 11a14b

Function11a14b: ; 11a14b
	ld hl, wcd85
	ld a, [hl]
	cp $f3
	jr nz, .asm_11a155
	and a
	ret

.asm_11a155
	call Function11a1d6
	ret c
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6f1
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a16d

Function11a16d: ; 11a16d
	ld a, [wcd44]
	and a
	jr z, .asm_11a179
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a179
	call Function11a63c
	call Function11a1e6
	hlcoord 4, 2
	ld de, wc346
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a192

Function11a192: ; 11a192
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a1b6
	call ExitMenu
	callba Function104061
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a1b6
	call ExitMenu
	callba Function104061
	ld a, [wcd45]
	ld [wcf66], a
	ld [wcd80], a
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	scf
	ret
; 11a1d6

Function11a1d6: ; 11a1d6
	ld a, [wcd85]
	cp $50
	jr nz, .asm_11a1e4
	ld a, $d3
	call Function118805
	scf
	ret

.asm_11a1e4
	and a
	ret
; 11a1e6

Function11a1e6: ; 11a1e6
	ld hl, String_11a706
	ld de, wc346
	call Function11a1ff
	ld hl, wcd85
	call Function11a1ff
	ld hl, String_11a70b
	call Function11a1ff
	ld a, $50
	ld [de], a
	ret
; 11a1ff

Function11a1ff: ; 11a1ff
.asm_11a1ff
	ld a, [hli]
	cp $50
	ret z
	ld [de], a
	inc de
	jr .asm_11a1ff
; 11a207

Function11a207: ; 11a207
	ld hl, MenuDataHeader_11a2de
	call LoadMenuDataHeader
	call Function1cbb
	call Function1cfd
	call Function321c
	hlcoord 16, 8
	ld de, String_11a2cf
	call PlaceString
	hlcoord 16, 10
	ld de, String_11a2d3
	call PlaceString
	hlcoord 15, 8
	ld a, $ed
	ld [hl], a
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a235

Function11a235: ; 11a235
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11a28f
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_11a2c1
	ld a, [hl]
	and D_UP
	jr nz, .asm_11a251
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11a270
.asm_11a24c
	call Function11a9f0
	scf
	ret

.asm_11a251
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wcd44]
	and a
	jr z, .asm_11a24c
	xor a
	ld [wcd44], a
	hlcoord 15, 8
	ld a, $ed
	ld [hl], a
	hlcoord 15, 10
	ld a, $7f
	ld [hl], a
	jr .asm_11a24c

.asm_11a270
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wcd44]
	and a
	jr nz, .asm_11a24c
	inc a
	ld [wcd44], a
	hlcoord 15, 8
	ld a, $7f
	ld [hl], a
	hlcoord 15, 10
	ld a, $ed
	ld [hl], a
	jr .asm_11a24c

.asm_11a28f
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a2c4
	call ExitMenu
	callba Function104061
	ld a, [wcd46]
	cp $0
	jr z, .asm_11a2b4
	ld a, [wcd47]
	jr .asm_11a2b7

.asm_11a2b4
	ld a, [wcd33]

.asm_11a2b7
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	scf
	ret

.asm_11a2c1
	call PlayClickSFX

.asm_11a2c4
	call ExitMenu
	callba Function104061
	and a
	ret
; 11a2cf

String_11a2cf: ; 11a2cf
	db "YES@"
; 11a2d3

String_11a2d3: ; 11a2d3
	db "NO@"
; 11a2d6

MenuDataHeader_11a2d6: ; 11a2d6
	db $40 ; flags
	db  6, 14 ; start coords
	db 10, 19 ; end coords
	dw NULL
	db 0 ; default option
; 11a2de

MenuDataHeader_11a2de: ; 11a2de
	db $40 ; flags
	db  7, 14 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 0 ; default option
; 11a2e6

Function11a2e6: ; 11a2e6
	call Function11a63c
	ld c, $2
	callba Function115e18
	hlcoord 4, 2
	ld de, String_11a71e
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a302

Function11a302: ; 11a302
	ld a, [wcd44]
	and a
	jr z, .asm_11a30e
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a30e
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a72a
	call PlaceString
	hlcoord 9, 4
	ld de, wcd68
	ld bc, $8102
	call PrintNum
	hlcoord 14, 4
	ld de, wcd67
	ld bc, $8102
	call PrintNum
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a33a

Function11a33a: ; 11a33a
	ld a, [wcd44]
	and a
	jr z, .asm_11a346
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a346
	call ExitMenu
	callba Function104061
	callba Function115dc3
	and a
	ret
; 11a357

Function11a357: ; 11a357
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a743
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a36b

Function11a36b: ; 11a36b
	ld a, [wcd44]
	and a
	jr z, .asm_11a377
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a377
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a755
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a38d

Function11a38d: ; 11a38d
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a3b1
	call ExitMenu
	callba Function104061
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a3b1
	call ExitMenu
	callba Function104061
	ld a, [wcd45]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a3c5

Function11a3c5: ; 11a3c5
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a762
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a3d9

Function11a3d9: ; 11a3d9
	ld a, [wcd44]
	and a
	jr z, .asm_11a3e5
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a3e5
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a779
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a3f9

Function11a3f9: ; 11a3f9
	ld a, [wcd44]
	and a
	jr z, .asm_11a405
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a405
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a755
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a41b

Function11a41b: ; 11a41b
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a43f
	call ExitMenu
	callba Function104061
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a43f
	call ExitMenu
	callba Function104061
	ld a, $1c
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a452

Function11a452: ; 11a452
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a791
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a466

Function11a466: ; 11a466
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7c1
	call PlaceString
	ld a, $80
	ld [wcd44], a
	jp Function11a5b0
; 11a47a

Function11a47a: ; 11a47a
	ld a, [wcd44]
	and a
	jr z, .asm_11a486
	dec a
	ld [wcd44], a
	scf
	ret

.asm_11a486
	and a
	ret
; 11a488

Function11a488: ; 11a488
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7ac
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a49e

Function11a49e: ; 11a49e
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a4c7
	call ExitMenu
	callba Function104061
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	ld a, $14
	ld [wcf66], a
	and a
	ret

.asm_11a4c7
	call ExitMenu
	callba Function104061
	ld a, [wcd46]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a4db

Function11a4db: ; 11a4db
	call Function11a63c
	ld de, String_11a6db
	hlcoord 4, 2
	call PlaceString
	ret
; 11a4e8

Function11a4e8: ; 11a4e8
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7d7
	call PlaceString
	call Function11a5f5
	xor a
	ld [wcd44], a
	jp Function11a5b0
; 11a4fe

Function11a4fe: ; 11a4fe
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wcd44]
	and a
	jr nz, .asm_11a522
	call ExitMenu
	callba Function104061
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a522
	call ExitMenu
	callba Function104061
	ld a, [wcd45]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret
; 11a536

Function11a536: ; 11a536
	ld hl, hJoyPressed
	ld a, [hl]
	and $1
	jr nz, .asm_11a5a7
	ld a, [hl]
	and $2
	jr nz, .asm_11a5a2
	ld a, [hl]
	and $40
	jr nz, .asm_11a564
	ld a, [hl]
	and $80
	jr nz, .asm_11a583
.asm_11a54d
	ld a, [wcd3c]
	cp $4
	jr z, .asm_11a562
	call Function11a9f0
	jr nz, .asm_11a562
	call ExitMenu
	callba Function104061

.asm_11a562
	scf
	ret

.asm_11a564
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wcd44]
	and a
	jr z, .asm_11a54d
	xor a
	ld [wcd44], a
	hlcoord 15, 7
	ld a, $ed
	ld [hl], a
	hlcoord 15, 9
	ld a, $7f
	ld [hl], a
	jr .asm_11a54d

.asm_11a583
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wcd44]
	and a
	jr nz, .asm_11a54d
	inc a
	ld [wcd44], a
	hlcoord 15, 7
	ld a, $7f
	ld [hl], a
	hlcoord 15, 9
	ld a, $ed
	ld [hl], a
	jr .asm_11a54d

.asm_11a5a2
	ld a, $1
	ld [wcd44], a

.asm_11a5a7
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	and a
	ret
; 11a5b0

Function11a5b0: ; 11a5b0
	ld a, [wcd3c]
	inc a
	ld [wcd3c], a
	scf
	ret
; 11a5b9

Function11a5b9: ; 11a5b9
	xor a
	ld [wcf83], a
	ld [wcf82], a
	ld a, $13
	ld [wcf85], a
	ld a, $5
	ld [wcf84], a
	call Function1c00
	ld hl, AttrMap
	ld b, $6
	ld c, $14
	ld hl, TileMap
	ld b, $4
	ld c, $12
	call Function3eea
	callba Function104061
	call DrawOnMap
	ld c, $0
	callba Function115e18
	ld a, $1
	ld [wc305], a
	ret
; 11a5f5

Function11a5f5: ; 11a5f5
	ld a, $e
	ld [wcf83], a
	ld a, $13
	ld [wcf85], a
	ld a, $6
	ld [wcf82], a
	ld a, $a
	ld [wcf84], a
	call Function1c00
	hlcoord 14, 6, AttrMap
	ld b, $5
	ld c, $6
	hlcoord 14, 6
	ld b, $3
	ld c, $4
	call Function3eea
	hlcoord 16, 7
	ld de, String_11a2cf
	call PlaceString
	hlcoord 16, 9
	ld de, String_11a2d3
	call PlaceString
	hlcoord 15, 7
	ld a, $ed
	ld [hl], a
	callba Function104061
	ret
; 11a63c

Function11a63c: ; 11a63c
	hlcoord 4, 1
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 2
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 3
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 4
	ld de, String_11a7f4
	call PlaceString
	ret
; 11a661

String_11a661: ; 11a661
	db   "これから モバイルセンターに"
	next "でんわ", $1f, "かけます@"
; 11a679

String_11a679: ; 11a679
	db   "モバイルアダプタ", $25, "じゅんびは"
	next "できて いますか?@"
; 11a692

String_11a692: ; 11a692
	db   "でんわ", $1f, "かけています"
	next "しばらく おまちください@"
; 11a6aa

String_11a6aa: ; 11a6aa
	db   "でんわをかけると つうわりょう"
	next "せつぞくりょう", $4a, "かかります@"
; 11a6c8

String_11a6c8: ; 11a6c8
	db   "せつぞく しました@"
; 11a6d2

String_11a6d2: ; 11a6d2
	db   "つうしん ちゅう@"
; 11a6db

String_11a6db: ; 11a6db
	db   "つうしん ちゅう"
	next "セレクト エーでちゅうし@"
; 11a6f1

String_11a6f1: ; 11a6f1
	db   "この サービスには"
	next "つうわりょう", $25, "ほかに@"
; 11a706

String_11a706: ; 11a706
	db   "おかね", $4a, "@"
; 11a70b

String_11a70b: ; 11a70b
	db   "えん"
	next "かかります よろしい ですか?@"
; 11a71e

String_11a71e: ; 11a71e
	db   "つうしん しゅうりょう@"
; 11a72a

String_11a72a: ; 11a72a
	db   "つないだ じかん"
	next "  やく   ふん   びょう@"
; 11a743

String_11a743: ; 11a743
	db   "もっていない データが"
	next "あります!@"
; 11a755

String_11a755: ; 11a755
	db   "データ", $1f, "よみこみますか?@"
; 11a762

String_11a762: ; 11a762
	db   "おなじ データ", $1f, "よみこんだ"
	next "こと", $4a, "ありますが@"
; 11a779

String_11a779: ; 11a779
	db   "そのデータ", $24, "なくなっているか"
	next "こわれて います@"
; 11a791

String_11a791: ; 11a791
	db   "もっている データと"
	next "おなじデータしか ありません!@"
; 11a7ac

String_11a7ac: ; 11a7ac
	db   "データ", $25, "よみこみを"
	next "ちゅうし しますか?@"
; 11a7c1

String_11a7c1: ; 11a7c1
	db   "あたらしい ニュースは"
	next "ありません でした@"
; 11a7d7

String_11a7d7: ; 11a7d7
	db   "あたらしいニュース", $4a, "あります"
	next "ニュース", $1f, "よみこみますか?@"
; 11a7f4

String_11a7f4: ; 11a7f4
	db   "               @"
; 11a804

MenuDataHeader_11a804: ; 11a804
	db $40 ; flags
	db  0,  0 ; start coords
	db  5, 19 ; end coords
	dw NULL
	db 0 ; default option
; 11a80c

Function11a80c: ; 11a80c
	ld de, hDivisor
	ld bc, hDividend
	ld hl, Unknown_11a89a
	call Function11a88c
	ld bc, hQuotient
	ld hl, Unknown_11a8ba
	call Function11a88c
	ld bc, $ffb5
	ld hl, Unknown_11a8da
	call Function11a88c
	xor a
	ld b, a
	ld a, [hDivisor]
	and $f
	ld e, a
	ld a, [$ffb9]
	and $f
	call Function11a884
	ld e, a
	ld a, [$ffbb]
	and $f
	call Function11a884
	ld [wcd62], a
	ld e, b
	xor a
	ld b, a
	ld a, [hDivisor]
	and $f0
	swap a
	call Function11a884
	ld e, a
	ld a, [$ffb9]
	and $f0
	swap a
	call Function11a884
	ld e, a
	ld a, [$ffbb]
	and $f0
	swap a
	call Function11a884
	ld [wcd63], a
	ld e, b
	xor a
	ld b, a
	ld a, [hMathBuffer]
	and $f
	call Function11a884
	ld e, a
	ld a, [$ffba]
	and $f
	call Function11a884
	ld e, a
	ld a, [$ffbc]
	and $f
	call Function11a884
	ld [wcd64], a
	ret
; 11a884

Function11a884: ; 11a884
	add e
	cp $a
	ret c
	sub $a
	inc b
	ret
; 11a88c

Function11a88c: ; 11a88c
	ld a, [bc]
	sla a
	ld c, a
	xor a
	ld b, a
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ret
; 11a89a

Unknown_11a89a: ; 11a89a
x = 0
rept 16
	bcd x % 100, x / 100
x = x + 1
endr

Unknown_11a8ba: ; 11a8ba
x = 0
rept 16
	bcd x % 100, x / 100
x = x + 16
endr

Unknown_11a8da: ; 11a8da
x = 0
rept 16
	bcd x % 100, x / 100
x = x + 256
endr
; 11a8fa

Function11a8fa: ; 11a8fa
	ld a, [wc31a]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11a909
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11a909

Jumptable_11a909: ; 11a909
	dw Function11a970
	dw Function11a90f
	dw Function11a971
; 11a90f

Function11a90f: ; 11a90f
	ld a, $1
	ld [rSVBK], a
	call SpeechTextBox
	ld a, $50
	ld hl, wc320
	ld bc, $008c
	call ByteFill
	ld a, [wc31b]
	ld l, a
	ld a, [wc31c]
	ld h, a
	ld de, wc320
.asm_11a92c
	ld a, [hli]
	cp $57
	jr z, .asm_11a94f
	cp $0
	jr z, .asm_11a92c
	cp $50
	jr z, .asm_11a92c
	cp $1
	jr z, .asm_11a941
	ld [de], a
	inc de
	jr .asm_11a92c

.asm_11a941
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.asm_11a945
	ld a, [bc]
	inc bc
	cp $50
	jr z, .asm_11a92c
	ld [de], a
	inc de
	jr .asm_11a945

.asm_11a94f
	xor a
	ld [wc31f], a
	ld a, $20
	ld [wc31b], a
	ld a, $c3
	ld [wc31c], a
	hlcoord 1, 14
	ld a, l
	ld [wc31d], a
	ld a, h
	ld [wc31e], a
	ld hl, wc31a
	inc [hl]
	ld a, $3
	ld [rSVBK], a

Function11a970:
	ret
; 11a971

Function11a971: ; 11a971
	ld hl, wc31f
	ld a, [hJoyDown]
	and a
	jr nz, .asm_11a97f
	ld a, [hl]
	and a
	jr z, .asm_11a97f
	dec [hl]
	ret

.asm_11a97f
	ld a, [Options]
	and $7
	ld [hl], a
	ld hl, wcd8d
	ld a, [wc31b]
	ld e, a
	ld a, [wc31c]
	ld d, a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, e
	ld [wc31b], a
	ld a, d
	ld [wc31c], a
	ld a, $50
	ld [hl], a
	ld a, [wc31d]
	ld l, a
	ld a, [wc31e]
	ld h, a
	ld de, wcd8d
	call PlaceString
	ld a, c
	ld [wc31d], a
	ld a, b
	ld [wc31e], a
	ld a, [wcd8d]
	cp $50
	jr nz, .asm_11a9bf
	xor a
	ld [wc31a], a

.asm_11a9bf
	ret
; 11a9c0

Function11a9c0: ; 11a9c0
	ld a, l
	ld [wc31b], a
	ld a, h
	ld [wc31c], a
	ld a, $1
	ld [wc31a], a
	ret
; 11a9ce

Function11a9ce: ; 11a9ce
	call WhiteBGMap
	call Function2bae
	call Function1d7d
	callba Function106462
	callba Function106464
	call Functiond90
	callba Function2b5c
	call DrawOnMap
	ret
; 11a9f0

Function11a9f0: ; 11a9f0
	ld a, $1
	and a
	ret
; 11a9f4

Function11a9f4: ; 11a9f4
	ld a, [wcd8a]
	ld l, a
	ld a, [wcd8b]
	ld h, a
	inc hl
	ld a, l
	ld [wcd8a], a
	ld a, h
	ld [wcd8b], a
	ld de, $d5d0
	add hl, de
	bit 7, h
	ret nz
	ld a, $d6
	call Function118805
	and a
	ret
; 11aa13

UnknownText_0x11aa13: ; 0x11aa13
	text "SAVE FILE will be"
	line "sent."
	done
; 0x11aa2c

UnknownText_0x11aa2c: ; 0x11aa2c
	text "Sent SAVE FILE."
	line "Reading NEWS…"
	done
; 0x11aa4b

UnknownText_0x11aa4b: ; 0x11aa4b
	text "Reading NEWS…"
	done
; 0x11aa5a

UnknownText_0x11aa5a: ; 0x11aa5a
	text "Received NEWS!"
	done
; 0x11aa6a

UnknownText_0x11aa6a: ; 0x11aa6a
	text "Quit reading NEWS?"
	done
; 0x11aa7e

UnknownText_0x11aa7e: ; 0x11aa7e
	text "Canceled sending"
	line "SAVE FILE."
	done
; 0x11aa9b

UnknownText_0x11aa9b: ; 0x11aa9b
	text "ODD EGG"
	line "was received!"
	done
; 0x11aab2

UnknownText_0x11aab2: ; 0x11aab2
	text "Registering your"
	line "record…"
	done
; 0x11aacc

UnknownText_0x11aacc: ; 0x11aacc
	text "One visit per day"
	line "per BATTLE ROOM!"
	done
; 0x11aaf0

UnknownText_0x11aaf0: ; 0x11aaf0
	text "A party #MON"
	line "tops this level."
	done
; 0x11ab0f

UnknownText_0x11ab0f: ; 0x11ab0f
	text_from_ram wcd49
	text " may go"
	line "only to BATTLE"

	para "ROOMS that are"
	line "Lv.70 or higher."
	done
; 0x11ab4a

UnknownText_0x11ab4a: ; 0x11ab4a
	text "Cancel your BATTLE"
	line "ROOM challenge?"
	done
; 0x11ab6e

UnknownText_0x11ab6e: ; 0x11ab6e
	text "Exit GYM LEADER"
	line "HONOR ROLL?"
	done
; 0x11ab8b

UnknownText_0x11ab8b: ; 0x11ab8b
	text "Linking with the"
	line "CENTER…"
	done
; 0x11aba5

UnknownText_0x11aba5: ; 0x11aba5
	text "What level do you"
	line "want to challenge?"
	done
; 0x11abcb

UnknownText_0x11abcb: ; 0x11abcb
	text "Check BATTLE ROOM"
	line "list by max level?"
	done
; 0x11abf1

UnknownText_0x11abf1: ; 0x11abf1
	text "Enter which"
	line "BATTLE ROOM?"
	done
; 0x11ac0b

UnknownText_0x11ac0b: ; 0x11ac0b
	text "Which BATTLE ROOM?"
	done
; 0x11ac1f

UnknownText_0x11ac1f: ; 0x11ac1f
	text_from_ram StringBuffer3
	text "'s ROOM"
	line "@"
	text_from_ram StringBuffer4
	text "?"
	cont "Please wait…"
	done
; 0x11ac3e

Function11ac3e: ; 11ac3e
	call SpeechTextBox
	call FadeToMenu
	callab Function8e814
	call Function11ac51
	call Function2b3c
	ret
; 11ac51

Function11ac51: ; 11ac51
	xor a
	ld [hBGMapMode], a
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	ld a, [$ffaa]
	push af
	ld a, $1
	ld [$ffaa], a
	xor a
	ld [$ffde], a
	ld [wcd49], a
	ld [wcd4a], a
	ld [wcd4c], a
	ld [wcd4d], a
	ld [wcd4e], a
	call Function11ad1b
	call DelayFrame
.asm_11ac82
	call Functiona57
	ld a, [wcf63]
	bit 7, a
	jr nz, .asm_11aca8
	call Function11b314
	call Function11acb7
	call Function11ad6e
	ld a, $78
	ld [wc3b5], a
	callba Function8cf7a
	callba Function104061
	jr .asm_11ac82

.asm_11aca8
	call ClearSprites
	pop af
	ld [$ffaa], a
	pop af
	ld [VramState], a
	pop af
	ld [Options], a
	ret
; 11acb7

Function11acb7: ; 11acb7
	ld hl, Unknown_11ba44
	ld a, [wcd49]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	decoord 6, 6
	ld a, [hli]
	ld [de], a
	decoord 0, 7
	ld bc, $0007
	call CopyBytes
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ld a, [hl]
	cp $ff
	jr nz, .asm_11aceb
	xor a
	ld [wcd49], a

.asm_11aceb
	ld hl, Unknown_11bb7d
	ld a, [wcd4a]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	decoord 3, 9
	ld bc, $0007
	call CopyBytes
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	inc hl
	ld a, [hl]
	cp $ff
	ret nz
	xor a
	ld [wcd4a], a
	ret
; 11ad1b

Function11ad1b: ; 11ad1b
	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	callba Function17c000
	ld a, [wcfa9]
	ld [wcd82], a
	dec a
	ld [$ffb0], a
	ld a, $10
	ld [wc3b7], a
	ld hl, Function8e83f
	ld a, BANK(Function8e83f)
	ld e, $4
	rst FarCall
	ld hl, Function8e83f
	ld a, BANK(Function8e83f)
	ld e, $5
	rst FarCall
	ld hl, $c6d0
	ld bc, $0115
	xor a
	call ByteFill
	xor a
	ld [wcf63], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wcd30], a
	ld a, $2
	ld [wc7d4], a
	callba Function40bdc
	ret
; 11ad6e

Function11ad6e: ; 11ad6e
	ld a, [wcf63]
	ld hl, Jumptable_11ad78
	call Function11b239
	jp [hl]
; 11ad78

Jumptable_11ad78: ; 11ad78
	dw Function11b082
	dw Function11b0ff
	dw Function11ad95
	dw Function11adc4
	dw Function11ae4e
	dw Function11ae98
	dw Function11ad8f
	dw Function11af04
	dw Function11af4e
; 11ad8a

Function11ad8a: ; 11ad8a
	ld hl, wcf63
	inc [hl]
	ret
; 11ad8f

Function11ad8f: ; 11ad8f
	ld hl, wcf63
	set 7, [hl]
	ret
; 11ad95

Function11ad95: ; 11ad95
	ld hl, MenuDataHeader_11ae38
	call LoadMenuDataHeader
	call Function1cbb
	hlcoord 12, 12
	ld de, String_11ae40
	call PlaceString
	hlcoord 10, 10, AttrMap
	ld bc, $0808
	call Function11afd6
	callba Function104061
	call Function11ad8a
	ld a, $1
	ld [wcfa9], a
	ld hl, Unknown_11afcc
	call Function11afb7

Function11adc4:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and $40
	jr nz, .asm_11ade6
	ld a, [hl]
	and $80
	jr nz, .asm_11aded
	ld a, [hl]
	and $1
	jr nz, .asm_11ae06
	ld a, [hl]
	and $2
	ret z
	call PlayClickSFX
	xor a
	ld [wcf63], a
	jr .asm_11ae2e

.asm_11ade6
	ld a, [wcfa9]
	dec a
	ret z
	jr .asm_11adf4

.asm_11aded
	ld a, [wcfa9]
	inc a
	cp $4
	ret z

.asm_11adf4
	push af
	ld hl, Unknown_11afcc
	call Function11afbb
	pop af
	ld [wcfa9], a
	ld hl, Unknown_11afcc
	call Function11afb7
	ret

.asm_11ae06
	call PlayClickSFX
	ld a, [wcfa9]
	dec a
	ld hl, wcd30
	ld [hl], a
	and a
	jr z, .asm_11ae28
	hlcoord 2, 14
	ld a, [wcfa9]
	cp $2
	jr z, .asm_11ae23
	call Function11b272
	jr .asm_11ae2b

.asm_11ae23
	call Function11b267
	jr .asm_11ae2b

.asm_11ae28
	ld a, $3
	ld [hl], a

.asm_11ae2b
	call Function11ad8a

.asm_11ae2e
	call ExitMenu
	callba Function104061
	ret
; 11ae38

MenuDataHeader_11ae38: ; 11ae38
	db $40 ; flags
	db 10, 10 ; start coords
	db 17, 17 ; end coords
	dw NULL
	db 0 ; default option
; 11ae40

String_11ae40: ; 11ae40
	db   "どちらでも"
	next "♂ォス"
	next "♀メス"
	db   "@"
; 11ae4e

Function11ae4e: ; 11ae4e
	ld hl, MenuDataHeader_11afe8
	call LoadMenuDataHeader
	call Function1cbb
	hlcoord 10, 14
	ld de, String_11aff0
	call PlaceString
	ld hl, MenuDataHeader_11b013
	call LoadMenuDataHeader
	call Function1cbb
	hlcoord 16, 8
	ld de, String_11b01b
	call PlaceString
	hlcoord 14, 7, AttrMap
	lb bc, 5, 6
	call Function11afd6
	hlcoord 9, 12, AttrMap
	lb bc, 6, 11
	call Function11afd6
	callba Function104061
	call Function11ad8a
	ld a, $1
	ld [wcfa9], a
	ld hl, Unknown_11afd2
	call Function11afb7

Function11ae98:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and D_UP
	jr nz, .asm_11aec1
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11aec8
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11aee1
	ld a, [hl]
	and B_BUTTON
	ret z
	call PlayClickSFX
.asm_11aeb4
	hlcoord 2, 14
	ld a, $7f
	ld [hl], a
	ld a, $1
	ld [wcf63], a
	jr .asm_11aef7

.asm_11aec1
	ld a, [wcfa9]
	dec a
	ret z
	jr .asm_11aecf

.asm_11aec8
	ld a, [wcfa9]
	inc a
	cp $3
	ret z

.asm_11aecf
	push af
	ld hl, Unknown_11afd2
	call Function11afbb
	pop af
	ld [wcfa9], a
	ld hl, Unknown_11afd2
	call Function11afb7
	ret

.asm_11aee1
	call PlayClickSFX
	ld a, [wcfa9]
	cp $2
	jr z, .asm_11aeb4
	ld a, [wcd4b]
	ld [ScriptVar], a
	call Function11b022
	call Function11ad8a

.asm_11aef7
	call ExitMenu
	call ExitMenu
	callba Function104061
	ret
; 11af04

Function11af04: ; 11af04
	ld hl, MenuDataHeader_11afe8
	call LoadMenuDataHeader
	call Function1cbb
	hlcoord 10, 14
	ld de, String_11b003
	call PlaceString
	ld hl, MenuDataHeader_11b013
	call LoadMenuDataHeader
	call Function1cbb
	hlcoord 16, 8
	ld de, String_11b01b
	call PlaceString
	hlcoord 14, 7, AttrMap
	lb bc, 5, 6
	call Function11afd6
	hlcoord 9, 12, AttrMap
	lb bc, 6, 11
	call Function11afd6
	callba Function104061
	call Function11ad8a
	ld a, $2
	ld [wcfa9], a
	ld hl, Unknown_11afd2
	call Function11afb7

Function11af4e:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and D_UP
	jr nz, .asm_11af77
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11af7e
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11af97
	ld a, [hl]
	and B_BUTTON
	ret z
	call PlayClickSFX
.asm_11af6a
	hlcoord 2, 14
	ld a, $7f
	ld [hl], a
	ld a, $1
	ld [wcf63], a
	jr .asm_11afaa

.asm_11af77
	ld a, [wcfa9]
	dec a
	ret z
	jr .asm_11af85

.asm_11af7e
	ld a, [wcfa9]
	inc a
	cp $3
	ret z

.asm_11af85
	push af
	ld hl, Unknown_11afd2
	call Function11afbb
	pop af
	ld [wcfa9], a
	ld hl, Unknown_11afd2
	call Function11afb7
	ret

.asm_11af97
	call PlayClickSFX
	ld a, [wcfa9]
	cp $2
	jr z, .asm_11af6a
	ld a, $6
	ld [wcf63], a
	xor a
	ld [ScriptVar], a

.asm_11afaa
	call ExitMenu
	call ExitMenu
	callba Function104061
	ret
; 11afb7

Function11afb7: ; 11afb7
	ld e, $ed
	jr asm_11afbd

Function11afbb:
	ld e, $7f

asm_11afbd:
	ld a, [wcfa9]
	dec a
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, e
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld [de], a
	ret
; 11afcc

Unknown_11afcc:
	dwcoord 11, 12
	dwcoord 11, 14
	dwcoord 11, 16

Unknown_11afd2:
	dwcoord 15,  8
	dwcoord 15, 10
; 11afd6

Function11afd6: ; 11afd6
	ld de, $0014
	ld a, $3
.asm_11afdb
	push bc
	push hl
.asm_11afdd
	ld [hli], a
	dec c
	jr nz, .asm_11afdd
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .asm_11afdb
	ret
; 11afe8

MenuDataHeader_11afe8: ; 11afe8
	db $40 ; flags
	db 12,  9 ; start coords
	db 17, 19 ; end coords
	dw NULL
	db 0 ; default option
; 11aff0

String_11aff0: ; 11aff0
	db   "この じょうけんで"
	next "よろしいですか?@"
; 11b003

String_11b003: ; 11b003
	db   "こうかんを"
	next "ちゅうししますか?@"
; 11b013

MenuDataHeader_11b013: ; 11b013
	db $40 ; flags
	db  7, 14 ; start coords
	db 11, 19 ; end coords
	dw NULL
	db 1 ; default option
; 11b01b

String_11b01b:
	db   "はい"
	next "いいえ@"
; 11b022

Function11b022: ; 11b022
	ld a, [wcd2e]
	and a
	jr z, .asm_11b02e
	ld hl, StringBuffer3
	call Function11b03d

.asm_11b02e
	ld a, [wcd30]
	and a
	ret z
	cp $3
	ret z
	ld hl, StringBuffer4
	call Function11b03d
	ret
; 11b03d

Function11b03d: ; 11b03d
	push hl
	push af
	ld c, $1
.asm_11b041
	ld a, [hli]
	cp $ef
	jr z, .asm_11b051
	cp $f5
	jr z, .asm_11b051
	cp $50
	jr z, .asm_11b055
	inc c
	jr .asm_11b041

.asm_11b051
	dec hl
	ld a, $50
	ld [hli], a

.asm_11b055
	dec hl
	push hl
	ld e, $4
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	pop hl
.asm_11b05f
	ld a, [hld]
	ld [de], a
	dec de
	dec c
	jr nz, .asm_11b05f
	pop af
	pop de
	cp $1
	jr nz, .asm_11b070
	ld hl, String_11b07a
	jr .asm_11b073

.asm_11b070
	ld hl, String_11b07e

.asm_11b073
	ld bc, 4
	call CopyBytes
	ret
; 11b07a

String_11b07a: db "ォスの "
String_11b07e: db "メスの "

Function11b082: ; 11b082
	call Function11b242
	ld a, $7
	ld [wc7d3], a
	call Function11b099
	call Function11b295
	call Function11b275
	call Function32f9
	jp Function11ad8a
; 11b099

Function11b099: ; 11b099
	ld c, $6
	hlcoord 11, 1
	ld a, [wc7d3]
	add a
	ld b, a
	xor a
	call Function11b236
	ld a, [wc7d0]
	ld e, a
	ld d, $0
	ld hl, $c6d0
	add hl, de
	ld e, l
	ld d, h
	hlcoord 11, 2
	ld a, [wc7d3]
.asm_11b0b9
	push af
	ld a, [de]
	ld [wd265], a
	push de
	push hl
	call Function11b0cf
	pop hl
	ld de, $0028
	add hl, de
	pop de
	inc de
	pop af
	dec a
	jr nz, .asm_11b0b9
	ret
; 11b0cf

Function11b0cf: ; 11b0cf
	and a
	ret z
	call Function11b0ec
	ret c
	call Function11b0e1
	push hl
	call GetPokemonName
	pop hl
	call PlaceString
	ret
; 11b0e1

Function11b0e1: ; 11b0e1
	call Function11b21e
	jr nz, .asm_11b0e8
	inc hl
	ret

.asm_11b0e8
	ld a, $1
	ld [hli], a
	ret
; 11b0ec

Function11b0ec: ; 11b0ec
	call Function11b22a
	ret nz
	inc hl
	ld de, String_11b0f9
	call PlaceString
	scf
	ret
; 11b0f9

String_11b0f9: ; 11b0f9
	db "ーーーーー@"
; 11b0ff

Function11b0ff: ; 11b0ff
	ld hl, hJoyPressed
	ld a, [hl]
	and $2
	jr nz, .asm_11b141
	ld a, [hl]
	and $1
	jr nz, .asm_11b131
	call Function11b175
	jr nc, .asm_11b125
	ld a, [wcd4c]
	inc a
	and $3
	ld [wcd4c], a
	xor a
	ld [hBGMapMode], a
	call Function11b099
	ld a, $1
	ld [hBGMapMode], a
	ret

.asm_11b125
	ld a, [wcd4c]
	and a
	ret z
	inc a
	and $3
	ld [wcd4c], a
	ret

.asm_11b131
	call Function11b20b
	call Function11b22a
	jr z, .asm_11b13d
	ld a, $1
	jr .asm_11b148

.asm_11b13d
	ld a, $2
	jr .asm_11b148

.asm_11b141
	ld hl, wcf63
	ld a, $7
	ld [hl], a
	ret

.asm_11b148
	call PlayClickSFX
	ld [wcd4b], a
	and a
	jr z, .asm_11b16c
	ld a, [wcf65]
	cp $0
	jr z, .asm_11b163
	cp $fe
	jr z, .asm_11b167
	cp $ff
	jr z, .asm_11b16b
	jp Function11ad8a

.asm_11b163
	ld a, $1
	jr .asm_11b16c

.asm_11b167
	ld a, $2
	jr .asm_11b16c

.asm_11b16b
	xor a

.asm_11b16c
	ld [wcd30], a
	ld a, $4
	ld [wcf63], a
	ret
; 11b175

Function11b175: ; 11b175
	ld a, [wc7d3]
	ld d, a
	ld a, [wc7d2]
	ld e, a
	ld hl, $ffa9
	ld a, [hl]
	and $40
	jr nz, .asm_11b19a
	ld a, [hl]
	and $80
	jr nz, .asm_11b1ae
	ld a, d
	cp e
	jr nc, .asm_11b1ed
	ld a, [hl]
	and $20
	jr nz, .asm_11b1c6
	ld a, [hl]
	and $10
	jr nz, .asm_11b1d8
	jr .asm_11b1ed

.asm_11b19a
	ld hl, wc7d1
	ld a, [hl]
	and a
	jr z, .asm_11b1a4
	dec [hl]
	jr .asm_11b1ef

.asm_11b1a4
	ld hl, wc7d0
	ld a, [hl]
	and a
	jr z, .asm_11b1ed
	dec [hl]
	jr .asm_11b1ef

.asm_11b1ae
	ld hl, wc7d1
	ld a, [hl]
	inc a
	cp e
	jr nc, .asm_11b1ed
	cp d
	jr nc, .asm_11b1bc
	inc [hl]
	jr .asm_11b1ef

.asm_11b1bc
	ld hl, wc7d0
	add [hl]
	cp e
	jr nc, .asm_11b1ed
	inc [hl]
	jr .asm_11b1ef

.asm_11b1c6
	ld hl, wc7d0
	ld a, [hl]
	and a
	jr z, .asm_11b1ed
	cp d
	jr nc, .asm_11b1d4
	xor a
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1d4
	sub d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1d8
	ld hl, wc7d0
	ld a, d
	add a
	add [hl]
	jr c, .asm_11b1e3
	cp e
	jr c, .asm_11b1e8

.asm_11b1e3
	ld a, e
	sub d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1e8
	ld a, [hl]
	add d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1ed
	and a
	ret

.asm_11b1ef
	call Function11b295
	call Function11b275
	scf
	ret
; 11b1f7

Function11b1f7: ; 11b1f7
	ld hl, TileMap
	ld a, $32
	ld bc, $0168
	call ByteFill
	ret
; 11b203

Function11b203: ; 11b203
.asm_11b203
	ld a, [de]
	cp $ff
	ret z
	inc de
	ld [hli], a
	jr .asm_11b203
; 11b20b

Function11b20b: ; 11b20b
	ld a, [wc7d1]
	ld hl, wc7d0
	add [hl]
	ld e, a
	ld d, $0
	ld hl, $c6d0
	add hl, de
	ld a, [hl]
	ld [wd265], a
	ret
; 11b21e

Function11b21e: ; 11b21e
	push de
	push hl
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	pop hl
	pop de
	ret
; 11b22a

Function11b22a: ; 11b22a
	push de
	push hl
	ld a, [wd265]
	dec a
	call CheckSeenMon
	pop hl
	pop de
	ret
; 11b236

Function11b236: ; 11b236
	jp Functionfb8
; 11b239

Function11b239: ; 11b239
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 11b242

Function11b242: ; 11b242
	hlcoord 3, 4
	ld de, StringBuffer3
	call PlaceString
	xor a
	ld [MonType], a
	callba GetGender
	hlcoord 1, 4
	ld a, [CurPartySpecies]
	ld bc, wcd2f
	ld [bc], a
	dec bc
	jr c, asm_11b26a
	jr z, asm_11b26f
	ld a, $1
	ld [bc], a

Function11b267:
	ld [hl], $ef
	ret

asm_11b26a
	xor a
	ld [bc], a
	ld [hl], $7f
	ret

asm_11b26f
	ld a, $2
	ld [bc], a

Function11b272:
	ld [hl], $f5
	ret
; 11b275

Function11b275: ; 11b275
	call Function11b279
	ret
; 11b279

Function11b279: ; 11b279
	ld a, [wd265]
	ld [CurSpecies], a
	call Function11b22a
	jr z, .asm_11b28f
	call GetBaseData
	ld a, [BaseGender]
	ld [wcf65], a
	jr .asm_11b294

.asm_11b28f
	ld a, $ff
	ld [wcf65], a

.asm_11b294
	ret
; 11b295

Function11b295: ; 11b295
	hlcoord 4, 13
	ld de, String_11b308
	call PlaceString
	hlcoord 4, 14
	ld de, String_11b308
	call PlaceString
	call Function11b20b
	call Function11b22a
	jr z, .asm_11b2d1
	ld a, [$c608]
	ld c, a
	ld a, [$c608 + 1]
	ld b, a
	ld hl, $0007
	add hl, bc
	xor a
	ld [hl], a
	ld hl, $0003
	add hl, bc
	ld e, [hl]
	callba Function8e9bc
	hlcoord 4, 14
	push hl
	call GetPokemonName
	jr .asm_11b2e7

.asm_11b2d1
	ld a, [$c608]
	ld c, a
	ld a, [$c608 + 1]
	ld b, a
	ld hl, $0007
	add hl, bc
	ld a, $50
	ld [hl], a
	hlcoord 4, 13
	push hl
	ld de, String_11b30e

.asm_11b2e7
	ld a, $6
	ld bc, StringBuffer4
.asm_11b2ec
	push af
	ld a, [de]
	ld [bc], a
	inc de
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b2ec
	pop hl
	ld de, StringBuffer4
	call PlaceString
	ret
; 11b2fe

String_11b2fe: ; 11b2fe
	db "あげる#@"
; 11b303

String_11b303: ; 11b303
	db "ほしい#@"
; 11b308

String_11b308: ; 11b308
	db "     @"
; 11b30e

String_11b30e: ; 11b30e
	db "みはっけん@"
; 11b314

Function11b314: ; 11b314
	call Function11b31b
	call Function11b3d9
	ret
; 11b31b

Function11b31b: ; 11b31b
	ld hl, Unknown_11b350
	ld a, [wcf63]
	cp $2
	jr c, .asm_11b349
	ld a, [wc7d1]
	cp $4
	jr nc, .asm_11b344
	cp $3
	jr c, .asm_11b349
	ld a, [wcf63]
	cp $2
	jr z, .asm_11b349
	cp $3
	jr z, .asm_11b349
	cp $6
	jr z, .asm_11b349

	ld bc, Unknown_11b37b
	jr .asm_11b34c

.asm_11b344
	ld bc, Unknown_11b389
	jr .asm_11b34c

.asm_11b349
	ld bc, Unknown_11b36d

.asm_11b34c
	call Function11b397
	ret
; 11b350

Unknown_11b350:
	db $1a, $5e, $1a, $66, $1a, $6e, $1a, $76, $1a, $7e, $1a, $86, $1a, $8e
	db $22, $5e, $22, $66, $22, $6e, $22, $76, $22, $7e, $22, $86, $22, $8e
	db $ff

Unknown_11b36d:
	db $30, $31, $31, $31, $31, $31, $32, $40, $41, $41, $41, $41, $41, $42
Unknown_11b37b:
	db $30, $31, $31, $39, $39, $39, $39, $40, $41, $41, $39, $39, $39, $39
Unknown_11b389:
	db $39, $39, $39, $39, $39, $39, $39, $39, $39, $39, $39, $39, $39, $39

Function11b397: ; 11b397
	ld de, Sprites
.asm_11b39a
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wc7d1]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [bc]
	inc bc
	ld [de], a
	inc de
	ld a, $5
	ld [de], a
	inc de
	jr .asm_11b39a
; 11b3b6

Function11b3b6: ; 11b3b6
.asm_11b3b6
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wcd4d]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	push hl
	ld l, c
	ld h, b
	ld a, [wcd4e]
	add [hl]
	inc bc
	ld [de], a
	inc de
	pop hl
	ld a, $5
	ld [de], a
	inc de
	jr .asm_11b3b6
; 11b3d9

Function11b3d9: ; 11b3d9
	ld de, Sprites + $70
	push de
	ld a, [wc7d2]
	dec a
	ld e, a
	ld a, [wc7d1]
	ld hl, wc7d0
	add [hl]
	cp e
	jr z, .asm_11b40d
	ld hl, $0000
	ld bc, $0070
	call AddNTimes
	ld e, l
	ld d, h
	ld b, $0
	ld a, d
	or e
	jr z, .asm_11b40f
	ld a, [wc7d2]
	ld c, a
.asm_11b401
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr c, .asm_11b40f
	inc b
	jr .asm_11b401

.asm_11b40d
	ld b, $70

.asm_11b40f
	ld a, $15
	add b
	pop hl
	ld [hli], a
	cp $41
	jr c, .asm_11b42b
	ld a, [wcf63]
	cp $4
	jr z, .asm_11b43b
	cp $5
	jr z, .asm_11b43b
	cp $7
	jr z, .asm_11b43b
	cp $8
	jr z, .asm_11b43b

.asm_11b42b
	ld a, $9b
	ld [hli], a
	ld a, [wcd4c]
	add $3c
	ld [hli], a
	ld a, [wcd4c]
	add $1
	ld [hl], a
	ret

.asm_11b43b
	ld a, $9b
	ld [hli], a
	ld a, $39
	ld [hli], a
	xor a
	ld [hl], a
	ret
; 11b444

Function11b444: ; 11b444
	call Function11b44b
	call Function11b45c
	ret
; 11b44b

Function11b44b: ; 11b44b
	xor a
	ld [wcf63], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	call UpdateTime
	ret
; 11b45c

Function11b45c: ; 11b45c
.asm_11b45c
	call Function11b46a
	call DelayFrame
	ld a, [wcf63]
	cp $4
	jr nz, .asm_11b45c
	ret
; 11b46a

Function11b46a: ; 11b46a
	ld a, [wcf63]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11b479
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11b479

Jumptable_11b479: ; 11b479
	dw Function11b483
	dw Function11b570
	dw Function11b5c0
	dw Function11b5e0
	dw Function11b5e7
; 11b483

Function11b483: ; 11b483
	call Function11b538
	ld hl, PlayerName
	ld a, $5
.asm_11b48b
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b48b
	ld de, $0030
	ld hl, PartyMon1Species
	ld a, [wcd82]
	dec a
	push af
.asm_11b49f
	and a
	jr z, .asm_11b4a6
	add hl, de
	dec a
	jr .asm_11b49f

.asm_11b4a6
	push bc
	ld a, $30
.asm_11b4a9
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b4a9
	pop de
	push bc
	ld a, [de]
	ld [CurSpecies], a
	call GetBaseData
	ld hl, $001f
	add hl, de
	ld a, [hl]
	ld [CurPartyLevel], a
	ld hl, $0024
	add hl, de
	push hl
	ld hl, $000a
	add hl, de
	pop de
	push de
	ld b, $1
	predef Functione167
	pop de
	ld h, d
	ld l, e
rept 2
	dec hl
endr
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	pop bc
	ld de, $000b
	ld hl, PartyMonOT
	pop af
	push af
.asm_11b4e8
	and a
	jr z, .asm_11b4ef
	add hl, de
	dec a
	jr .asm_11b4e8

.asm_11b4ef
	ld a, $a
.asm_11b4f1
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b4f1
	ld de, $000b
	ld hl, PartyMonNicknames
	pop af
	push af
.asm_11b502
	and a
	jr z, .asm_11b509
	add hl, de
	dec a
	jr .asm_11b502

.asm_11b509
	ld a, $a
.asm_11b50b
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b50b
	ld de, $002f
	ld hl, $a600
	pop af
.asm_11b51b
	and a
	jr z, .asm_11b522
	add hl, de
	dec a
	jr .asm_11b51b

.asm_11b522
	ld a, $0
	call GetSRAMBank
	ld a, $2f
.asm_11b529
	push af
	ld a, [hli]
	ld [bc], a
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b529
	call CloseSRAM
	jp Function11ad8a
; 11b538

Function11b538: ; 11b538
	ld bc, BattleMonNick + 5
	ld a, [PlayerID]
	ld [wcd2a], a
	ld [bc], a
	inc bc
	ld a, [PlayerID + 1]
	ld [wcd2b], a
	ld [bc], a
	inc bc
	ld a, [wd84a]
	ld [wcd2c], a
	ld [bc], a
	inc bc
	ld a, [wd84b]
	ld [wcd2d], a
	ld [bc], a
	inc bc
	ld a, [wcd2e]
	ld [bc], a
	inc bc
	ld a, [wcd2f]
	ld [bc], a
	inc bc
	ld a, [wcd30]
	ld [bc], a
	inc bc
	ld a, [wd265]
	ld [bc], a
	inc bc
	ret
; 11b570

Function11b570: ; 11b570
	call Function118007
	ld a, [ScriptVar]
	and a
	jr nz, .asm_11b57f
	call Function11b585
	jp Function11ad8a

.asm_11b57f
	ld a, $4
	ld [wcf63], a
	ret
; 11b585

Function11b585: ; 11b585
	ld a, $3
	ld [rSVBK], a
	ld hl, $d800
	ld de, $c608
	ld bc, $008f
	call CopyBytes
	ld a, $1
	ld [rSVBK], a
	ld a, $5
	call GetSRAMBank
	ld de, $a800
	ld a, $1
	ld [de], a
	inc de
	ld hl, $c608
	ld bc, $008f
	call CopyBytes
	push de
	pop hl
	ld a, [hRTCMinutes]
	ld [hli], a
	ld a, [hRTCHours]
	ld [hli], a
	ld a, [hRTCDayLo]
	ld [hli], a
	ld a, [hRTCDayHi]
	ld [hl], a
	call CloseSRAM
	ret
; 11b5c0

Function11b5c0: ; 11b5c0
	ld a, [wcd82]
	dec a
	ld [CurPartyMon], a
	xor a
	ld [wd10b], a
	callba Functione039
	callba Function170807
	callba Function14a58
	jp Function11ad8a
; 11b5e0

Function11b5e0: ; 11b5e0
	xor a
	ld [ScriptVar], a
	jp Function11ad8a
; 11b5e7

Function11b5e7: ; 11b5e7
	ret
; 11b5e8

Function11b5e8: ; 11b5e8
	ld a, $0
	call GetSRAMBank
	ld hl, wRTC
	ld de, $c608
	ld bc, $0004
	call CopyBytes
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	ld hl, $c608
	ld de, $b08c
	ld bc, $0004
	call CopyBytes
	ld a, $2
	ld [$a800], a
	ld a, [$a81f]
	ld [wcd2a], a
	ld a, [$a820]
	ld [wcd2b], a
	ld a, [$a821]
	ld [wcd2c], a
	ld a, [$a822]
	ld [wcd2d], a
	ld a, [$a823]
	ld [wcd2e], a
	ld a, [$a824]
	ld [wcd2f], a
	ld a, [$a825]
	ld [wcd30], a
	ld a, [$a826]
	ld [wcd31], a
	call CloseSRAM
	call Function11b44b
	call Function11b64c
	ret
; 11b64c

Function11b64c: ; 11b64c
.asm_11b64c
	call Function11b65a
	call DelayFrame
	ld a, [wcf63]
	cp $1
	jr nz, .asm_11b64c
	ret
; 11b65a

Function11b65a: ; 11b65a
	ld a, [wcf63]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11b669
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11b669

Jumptable_11b669: ; 11b669
	dw Function11b66d
	dw Function11b6b3
; 11b66d

Function11b66d: ; 11b66d
	call Function1180b8
	ld a, [ScriptVar]
	and a
	jr nz, .asm_11b6b0
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, [StringBuffer2 + 10]
	ld b, a
	pop af
	ld [rSVBK], a
	ld a, b
	and a
	jr z, .asm_11b691
	cp $1
	jr nz, .asm_11b6b0
	call Function11b6b4
	jr .asm_11b6b0

.asm_11b691
	callba Function17081d
	ld a, [ScriptVar]
	and a
	jr z, .asm_11b6b0
	xor a
	ld [ScriptVar], a
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, $2
	ld [StringBuffer2 + 10], a
	pop af
	ld [rSVBK], a

.asm_11b6b0
	jp Function11ad8a
; 11b6b3

Function11b6b3: ; 11b6b3
	ret
; 11b6b4

Function11b6b4: ; 11b6b4
	ld a, $5
	call GetSRAMBank
	ld a, [wcd30]
	ld [wc708], a
	ld a, [wcd31]
	ld [wc709], a
	ld a, $8
	ld [BGMapBuffer], a
	ld a, $c7
	ld [wcd21], a
	ld a, $d
	ld [CreditsTimer], a
	ld a, $c6
	ld [wcd23], a
	ld a, $3d
	ld [wcd24], a
	ld a, $c6
	ld [wcd25], a
	ld a, $42
	ld [wcd26], a
	ld a, $c6
	ld [wcd27], a
	ld a, $47
	ld [wcd28], a
	ld a, $c6
	ld [wcd29], a
	ld a, $46
	ld [$c628], a
	ld de, $c63d
	ld c, $5
	callba Function17d073
	jr nc, .asm_11b70f
	callba Function17d187

.asm_11b70f
	ld de, $c63d
	ld bc, $0105
	callba Function17d1e1
	jr nc, .asm_11b723
	callba Function17d187

.asm_11b723
	ld de, $c642
	ld c, $5
	callba Function17d073
	jr nc, .asm_11b736
	callba Function17d199

.asm_11b736
	ld de, $c642
	ld bc, $0105
	callba Function17d1e1
	jr nc, .asm_11b74a
	callba Function17d199

.asm_11b74a
	ld de, $c647
	ld c, $21
	callba Function17d073
	jr nc, .asm_11b75d
	callba Function17d1ab

.asm_11b75d
	ld de, $c647
	ld bc, $0221
	callba Function17d1e1
	jr c, .asm_11b770
	ld a, b
	cp $2
	jr nz, .asm_11b776

.asm_11b770
	callba Function17d1ab

.asm_11b776
	ld de, $c668
	ld c, $5
	callba Function17d073
	jr nc, .asm_11b789
	callba Function17d1c9

.asm_11b789
	ld de, $c668
	ld bc, $0105
	callba Function17d1e1
	jr nc, .asm_11b79d
	callba Function17d1c9

.asm_11b79d
	ld a, [$c608 + 6]
	cp $ff
	jr nz, .asm_11b7a8
	xor a
	ld [$c608 + 6], a

.asm_11b7a8
	ld a, [wcd31]
	ld [$c608 + 5], a
	ld [CurSpecies], a
	call GetBaseData

	ld hl, $c62c
	ld a, [hl]
	cp MIN_LEVEL
	ld a, MIN_LEVEL
	jr c, .asm_11b7c5
	ld a, [hl]
	cp MAX_LEVEL
	jr c, .asm_11b7c6
	ld a, MAX_LEVEL
.asm_11b7c5
	ld [hl], a
.asm_11b7c6
	ld [CurPartyLevel], a

	ld hl, $c616 + 1
	ld de, $c62c + 5
	ld b, $1
	predef Functione167
	ld de, $c62c + 5
	ld hl, $c62c + 3
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	call Function11b98f
	ret
; 11b7e5

Function11b7e5: ; 11b7e5
	ld a, [$c608 + 5]
	ld [wc702], a
	ld [CurPartySpecies], a
	ld a, [wcd81]
	ld [wc74e], a
	ld hl, $c63d
	ld de, wc724
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld a, [$c608 + 11]
	ld [wc731], a
	ld a, [$c608 + 12]
	ld [wc732], a
	ld hl, $c608 + 26
	ld a, [hli]
	ld [wc72f], a
	ld a, [hl]
	ld [wc730], a
	ld bc, $c608 + 5
	callba GetCaughtGender
	ld a, c
	ld [wc733], a
	call SpeechTextBox
	call FadeToMenu
	callba Function108016
	callba Function17d1f1
	ld a, $1
	ld [wd1e9], a
	ld a, $2
	ld [InLinkBattle], a
	callba Function421d8
	xor a
	ld [InLinkBattle], a
	callba Function14a58
	ld a, $5
	call GetSRAMBank
	ld a, $5
	ld [$a800], a
	call CloseSRAM
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetMapTrigger
	ld a, d
	or e
	jr z, .asm_11b872
	ld a, $1
	ld [de], a

.asm_11b872
	call Function2b3c
	call RestartMapMusic
	ret
; 11b879

Function11b879: ; 11b879
	callba Function17089a
	ld a, [ScriptVar]
	and a
	ret z
	ld a, $5
	call GetSRAMBank
	ld a, [$a800]
	ld [ScriptVar], a
	ld a, [$a890]
	ld [wcd49], a
	ld a, [$a891]
	ld [wcd4a], a
	ld a, [$a892]
	ld [wcd4b], a
	ld a, [$a893]
	ld [wcd4c], a
	call CloseSRAM
	ld a, [ScriptVar]
	and a
	ret z
	ld hl, wcd4c
	ld a, [hRTCDayHi]
	cp [hl]
	ret nz
	dec hl
	ld a, [hRTCDayLo]
	cp [hl]
	ret nz
	ld hl, wcd4a
	ld a, [hRTCHours]
	cp [hl]
	jr nc, .asm_11b8d8
	ld a, $18
	sub [hl]
	ld hl, hRTCHours
	add [hl]
	ld [wcd4c], a
	ld a, [hRTCMinutes]
	ld [wcd4b], a
	xor a
	ld [wcd4a], a
	jr .asm_11b8e2

.asm_11b8d8
	ld a, [hRTCMinutes]
	ld [wcd4b], a
	ld a, [hRTCHours]
	ld [wcd4c], a

.asm_11b8e2
	xor a
	ld l, a
	ld h, a
	ld b, a
	ld d, a
	ld a, [wcd4b]
	ld e, a
	ld a, [wcd4c]
	ld c, $3c
	call AddNTimes
	add hl, de
	push hl
	xor a
	ld l, a
	ld h, a
	ld b, a
	ld d, a
	ld a, [wcd49]
	ld e, a
	ld a, [wcd4a]
	ld c, $3c
	call AddNTimes
	add hl, de
	ld a, l
	cpl
	add $1
	ld e, a
	ld a, h
	cpl
	adc $0
	ld d, a
	pop hl
	add hl, de
	ld de, $ff88
	add hl, de
	bit 7, h
	ret z
	ld a, $2
	ld [ScriptVar], a
	ret
; 11b920

Function11b920: ; 11b920
	call Function11b44b
	ld a, $5
	call GetSRAMBank
	ld hl, $a81f
	ld de, BattleMonNick + 5
	ld bc, $0008
	call CopyBytes
	call CloseSRAM
	call Function118000
	ret
; 11b93b

Function11b93b: ; 11b93b
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$a800], a
	ld hl, $a823
	ld de, $c608
	ld bc, $008f
	call CopyBytes
	call CloseSRAM
	ld a, $8
	ld [BGMapBuffer], a
	ld a, $c6
	ld [wcd21], a
	ld a, $11
	ld [CreditsTimer], a
	ld a, $c6
	ld [wcd23], a
	ld a, $41
	ld [wcd24], a
	ld a, $c6
	ld [wcd25], a
	ld a, $46
	ld [wcd26], a
	ld a, $c6
	ld [wcd27], a
	ld a, $4b
	ld [wcd28], a
	ld a, $c6
	ld [wcd29], a
	call Function11b98f
	callba Function14a58
	ret
; 11b98f

Function11b98f: ; 11b98f
	ld hl, PartyCount
	ld a, [hl]
	ld e, a
	inc [hl]
	ld a, [BGMapBuffer]
	ld l, a
	ld a, [wcd21]
	ld h, a
	inc hl
	ld bc, PartySpecies
	ld d, e
.asm_11b9a2
	inc bc
	dec d
	jr nz, .asm_11b9a2
	ld a, e
	ld [CurPartyMon], a
	ld a, [hl]
	ld [bc], a
	inc bc
	ld a, $ff
	ld [bc], a
	ld hl, PartyMon1Species
	ld bc, PartyMon2 - PartyMon1
	ld a, e
	ld [wcd2a], a
.asm_11b9ba
	add hl, bc
	dec a
	and a
	jr nz, .asm_11b9ba
	ld e, l
	ld d, h
	ld a, [CreditsTimer]
	ld l, a
	ld a, [wcd23]
	ld h, a
	ld bc, PartyMon2 - PartyMon1
	call CopyBytes
	ld hl, PartyMonOT
	ld bc, $000b
	ld a, [wcd2a]
.asm_11b9d8
	add hl, bc
	dec a
	and a
	jr nz, .asm_11b9d8
	ld e, l
	ld d, h
	ld a, [wcd24]
	ld l, a
	ld a, [wcd25]
	ld h, a
	ld bc, $000a
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, PartyMonNicknames
	ld bc, $000b
	ld a, [wcd2a]
.asm_11b9f9
	add hl, bc
	dec a
	and a
	jr nz, .asm_11b9f9
	ld e, l
	ld d, h
	ld a, [wcd26]
	ld l, a
	ld a, [wcd27]
	ld h, a
	ld bc, $000a
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $a600
	ld bc, $002f
	ld a, [wcd2a]
.asm_11ba1a
	add hl, bc
	dec a
	and a
	jr nz, .asm_11ba1a
	ld a, $0
	call GetSRAMBank
	ld e, l
	ld d, h
	ld a, [wcd28]
	ld l, a
	ld a, [wcd29]
	ld h, a
	ld bc, $002f
	call CopyBytes
	call CloseSRAM
	ret
; 11ba38

Function11ba38: ; 11ba38
	callba Functione538
	ret c
	xor a
	ld [ScriptVar], a
	ret
; 11ba44

Unknown_11ba44:
	db $47, $30, $0a, $0a, $0a, $0a, $0a, $56
	db $46, $2f, $0a, $0a, $0a, $0a, $0a, $55
	db $45, $3d, $0a, $0a, $0a, $0a, $0a, $54
	db $44, $30, $0a, $0a, $0a, $0a, $0a, $53
	db $43, $2f, $0a, $0a, $0a, $0a, $0a, $52
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $51
	db $4a, $30, $0a, $0a, $0a, $0a, $0a, $50
	db $4a, $2f, $0a, $0a, $0a, $0a, $0a, $4f
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $4e
	db $4a, $30, $0a, $0a, $0a, $0a, $4d, $42
	db $4a, $2f, $0a, $0a, $0a, $0a, $6b, $58
	db $4a, $3d, $0a, $0a, $0a, $0a, $6a, $58
	db $4a, $30, $0a, $0a, $0a, $0a, $69, $58
	db $4a, $2f, $0a, $0a, $0a, $0a, $68, $58
	db $4a, $3d, $0a, $0a, $0a, $66, $67, $58
	db $4a, $30, $0a, $0a, $0a, $65, $0a, $58
	db $4a, $2f, $0a, $0a, $0a, $64, $0a, $58
	db $4a, $3d, $0a, $0a, $0a, $63, $0a, $58
	db $4a, $30, $0a, $0a, $61, $62, $0a, $58
	db $4a, $2f, $0a, $0a, $5f, $60, $0a, $58
	db $4a, $3d, $0a, $61, $62, $0a, $0a, $58
	db $4a, $30, $0a, $63, $0a, $0a, $0a, $58
	db $4a, $2f, $69, $0a, $0a, $0a, $0a, $58
	db $4a, $3d, $81, $0a, $0a, $0a, $0a, $58
	db $4a, $30, $80, $0a, $0a, $0a, $0a, $58
	db $4a, $2f, $7f, $0a, $0a, $0a, $0a, $58
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $58
	db $4a, $30, $0a, $0a, $0a, $0a, $0a, $58
	db $4a, $2f, $68, $87, $88, $89, $0a, $58
	db $4a, $3d, $6e, $6f, $70, $75, $76, $58
	db $4a, $30, $75, $76, $5c, $5d, $5e, $58
	db $4a, $2f, $71, $72, $73, $74, $6d, $58
	db $4a, $3d, $75, $76, $77, $8a, $8b, $58
	db $4a, $30, $66, $67, $65, $0a, $6a, $58
	db $4a, $2f, $83, $84, $0a, $83, $84, $58
	db $4a, $3d, $0a, $85, $82, $84, $0a, $58
	db $4a, $30, $41, $80, $40, $0a, $0a, $58
	db $4a, $2f, $83, $0a, $0a, $0a, $0a, $58
	db $4a, $3d, $40, $0a, $0a, $0a, $0a, $58
	db $ff

Unknown_11bb7d:
	db $0a, $0a, $0a, $0a, $0a, $0a, $16, $00
	db $78, $0a, $0a, $0a, $0a, $0a, $8c, $00
	db $79, $0a, $0a, $0a, $0a, $0a, $8d, $00
	db $7a, $0a, $0a, $0a, $0a, $0a, $8e, $00
	db $7b, $0a, $0a, $0a, $0a, $0a, $8c, $00
	db $7c, $0a, $0a, $0a, $0a, $0a, $8d, $00
	db $7d, $0a, $0a, $0a, $0a, $0a, $8e, $00
	db $2e, $7e, $0a, $0a, $0a, $0a, $8c, $00
	db $2e, $80, $0a, $0a, $0a, $0a, $8d, $00
	db $2e, $81, $0a, $0a, $0a, $0a, $8e, $00
	db $2e, $82, $0a, $0a, $0a, $0a, $8c, $00
	db $2e, $69, $0a, $0a, $0a, $0a, $8d, $00
	db $2e, $6a, $0a, $0a, $0a, $0a, $8e, $00
	db $2e, $6b, $0a, $0a, $0a, $0a, $8c, $00
	db $2e, $0a, $68, $0a, $0a, $0a, $8d, $00
	db $2e, $0a, $69, $0a, $0a, $0a, $8e, $00
	db $2e, $0a, $0a, $6a, $0a, $0a, $8c, $00
	db $2e, $0a, $0a, $6b, $0a, $0a, $8d, $00
	db $2e, $0a, $0a, $0a, $80, $0a, $8e, $00
	db $2e, $0a, $0a, $0a, $82, $0a, $8c, $00
	db $2e, $0a, $0a, $0a, $6c, $0a, $8d, $00
	db $2e, $0a, $0a, $0a, $0a, $83, $8e, $00
	db $2e, $0a, $6b, $0a, $0a, $0a, $8c, $00
	db $2e, $0a, $0a, $69, $0a, $0a, $8d, $00
	db $2e, $0a, $0a, $6a, $0a, $0a, $8e, $00
	db $2e, $0a, $0a, $0a, $68, $0a, $8c, $00
	db $2e, $0a, $0a, $0a, $63, $0a, $8d, $00
	db $2e, $0a, $0a, $61, $62, $0a, $8e, $00
	db $2e, $0a, $0a, $0a, $5f, $60, $8c, $00
	db $2e, $0a, $0a, $0a, $63, $0a, $8d, $00
	db $2e, $0a, $0a, $0a, $0a, $69, $8c, $00
	db $2e, $0a, $0a, $0a, $0a, $6b, $8d, $00
	db $2e, $0a, $0a, $0a, $0a, $83, $8e, $00
	db $2e, $0a, $0a, $0a, $0a, $86, $8c, $00
	db $2e, $0a, $85, $0a, $0a, $0a, $8d, $00
	db $2e, $0a, $0a, $84, $0a, $0a, $8e, $00
	db $ff


SECTION "bank47", ROMX, BANK[$47]

StoreText:: ; 11c000
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
IF DEF(CRYSTAL11)
	ld hl, wd10a
ELSE
	ld hl, wd105
ENDC
	ld a, [hl]
	dec a
	ld e, a
	ld d, 0
	ld hl, Unknown_11f2f0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_11c026
	ld a, [hRandomAdd]
	and $1f
	cp $19
	jr c, .asm_11c021
	sub $19

.asm_11c021
	ld hl, Unknown_11f332
	jr .asm_11c033

.asm_11c026
	ld a, [hRandomAdd]
	and $f
	cp $f
	jr c, .asm_11c030
	sub $f

.asm_11c030
	ld hl, Unknown_11f3ce

.asm_11c033
	ld b, 0
	dec c
	jr nz, .asm_11c03d
	ld [wd000 + $200], a
	jr .asm_11c040

.asm_11c03d
	ld a, [wd000 + $200]

.asm_11c040
	push af
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld h, a
	ld l, c
	pop af
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld l, c
	ld h, a
	bccoord 1, 14
	pop af
	ld [rSVBK], a
	call Function13e5
	ret
; 11c05d

Function11c05d: ; 11c05d
	ld a, e
	or d
	jr z, .asm_11c071
	ld a, e
	and d
	cp $ff
	jr z, .asm_11c071
	push hl
	call Function11c156
	pop hl
	call PlaceString
	and a
	ret

.asm_11c071
	ld c, l
	ld b, h
	scf
	ret
; 11c075

Function11c075: ; 11c075
	push de
	ld a, c
	call Function11c254
	pop de
	ld bc, wcd36
	call Function11c08f
	ret
; 11c082

Function11c082: ; 11c082
	push de
	ld a, c
	call Function11c254
	pop de
	ld bc, wcd36
	call Function11c0c6
	ret
; 11c08f

Function11c08f: ; 11c08f
	ld l, e
	ld h, d
	push hl
	ld a, $3
.asm_11c094
	push af
	ld a, [bc]
	ld e, a
	inc bc
	ld a, [bc]
	ld d, a
	inc bc
	push bc
	call Function11c05d
	jr c, .asm_11c0a2
	inc bc

.asm_11c0a2
	ld l, c
	ld h, b
	pop bc
	pop af
	dec a
	jr nz, .asm_11c094
	pop hl
	ld de, $0028
	add hl, de
	ld a, $3
.asm_11c0b0
	push af
	ld a, [bc]
	ld e, a
	inc bc
	ld a, [bc]
	ld d, a
	inc bc
	push bc
	call Function11c05d
	jr c, .asm_11c0be
	inc bc

.asm_11c0be
	ld l, c
	ld h, b
	pop bc
	pop af
	dec a
	jr nz, .asm_11c0b0
	ret
; 11c0c6


Function11c0c6: ; 11c0c6
	ld a, [wcf63]
	ld l, a
	ld a, [wcf64]
	ld h, a
	push hl
	ld hl, $c608 + 16
	ld a, $0
	ld [hli], a
	push de
	xor a
	ld [wcf63], a
	ld a, $12
	ld [wcf64], a
	ld a, $6
.asm_11c0e1
	push af
	ld a, [bc]
	ld e, a
	inc bc
	ld a, [bc]
	ld d, a
	inc bc
	or e
	jr z, .asm_11c133
	push hl
	push bc
	call Function11c156
	call Function11c14a
	ld e, c
	pop bc
	pop hl
	ld a, e
	or a
	jr z, .asm_11c133
.asm_11c0fa
	ld a, [wcf64]
	cp $12
	jr z, .asm_11c102
	inc e

.asm_11c102
	cp e
	jr nc, .asm_11c11c
	ld a, [wcf63]
	inc a
	ld [wcf63], a
	ld [hl], $4e
	rra
	jr c, .asm_11c113
	ld [hl], $55

.asm_11c113
	inc hl
	ld a, $12
	ld [wcf64], a
	dec e
	jr .asm_11c0fa

.asm_11c11c
	cp $12
	jr z, .asm_11c123
	ld [hl], $7f
	inc hl

.asm_11c123
	sub e
	ld [wcf64], a
	ld de, $c608
.asm_11c12a
	ld a, [de]
	cp $50
	jr z, .asm_11c133
	inc de
	ld [hli], a
	jr .asm_11c12a

.asm_11c133
	pop af
	dec a
	jr nz, .asm_11c0e1
	ld [hl], $57
	pop bc
	ld hl, $c608 + 16
	call Function13e5
	pop hl
	ld a, l
	ld [wcf63], a
	ld a, h
	ld [wcf64], a
	ret
; 11c14a

Function11c14a: ; 11c14a
	ld c, $0
	ld hl, $c608
.asm_11c14f
	ld a, [hli]
	cp $50
	ret z
	inc c
	jr .asm_11c14f
; 11c156

Function11c156: ; 11c156
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, $50
	ld hl, $c608
	ld bc, $000b
	call ByteFill
	ld a, d
	and a
	jr z, .asm_11c19c
	ld hl, Unknown_11daac
	dec d
	sla d
	ld c, d
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	push bc
	pop hl
	ld c, e
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld bc, $0005
.asm_11c18f
	ld de, $c608
	call CopyBytes
	ld de, $c608
	pop af
	ld [rSVBK], a
	ret

.asm_11c19c
	ld a, e
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld bc, $000a
	jr .asm_11c18f
; 11c1ab

Function11c1ab: ; 11c1ab
	ld a, [$ffaa]
	push af
	ld a, $1
	ld [$ffaa], a
	call Function11c1b9
	pop af
	ld [$ffaa], a
	ret
; 11c1b9

Function11c1b9: ; 11c1b9
	call Function11c1ca
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	call Function11c283
	pop af
	ld [rSVBK], a
	ret
; 11c1ca

Function11c1ca: ; 11c1ca
	xor a
	ld [wcf63], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wcd23], a
	ld [BGMapBuffer], a
	ld [wcd21], a
	ld [CreditsTimer], a
	ld [wcd35], a
	ld [wcd2b], a
	ld a, $ff
	ld [wcd24], a
	ld a, [wcfa9]
	dec a
	call Function11c254
	call WhiteBGMap
	call ClearSprites
	call ClearScreen
	call Function11d323
	call Function32f9
	call DisableLCD
	ld hl, GFX_11d67e
	ld de, VTiles2
	ld bc, $60
	call CopyBytes
	ld hl, LZ_11d6de
	ld de, VTiles0
	call Decompress
	call EnableLCD
	callba Function104061
	callba Function8cf53
	callba Function1500c
	callba Function40c30
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, $c6d0
	ld de, LYOverrides
	ld bc, $100
	call CopyBytes
	pop af
	ld [rSVBK], a
	call Function11d4aa
	call Function11d3ba
	ret
; 11c254

Function11c254: ; 11c254
	push af
	ld a, $4
	call GetSRAMBank
	ld hl, $a007
	pop af
	sla a
	sla a
	ld c, a
	sla a
	add c
	ld c, a
	ld b, $0
	add hl, bc
	ld de, wcd36
	ld bc, $000c
	call CopyBytes
	call CloseSRAM
	ret
; 11c277


Function11c277: ; 11c277 (47:4277)
	ld a, $7f
	hlcoord 0, 6
	ld bc, $f0
	call ByteFill
	ret

Function11c283: ; 11c283
.asm_11c283
	call Functiona57
	ld a, [hJoyPressed]
	ld [hJoypadPressed], a
	ld a, [wcf63]
	bit 7, a
	jr nz, .asm_11c2a2
	call Function11c2ac
	callba Function8cf69
	callba Function104061
	jr .asm_11c283

.asm_11c2a2
	callba Function8cf53
	call ClearSprites
	ret
; 11c2ac

Function11c2ac: ; 11c2ac
	ld a, [wcf63]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11c2bb
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11c2bb


Jumptable_11c2bb: ; 11c2bb (47:42bb)
	dw Function11c2e9
	dw Function11c346
	dw Function11c35f
	dw Function11c373
	dw Function11c3c2
	dw Function11c3ed
	dw Function11c52c
	dw Function11c53d
	dw Function11c658
	dw Function11c675
	dw Function11c9bd
	dw Function11c9c3
	dw Function11caad
	dw Function11cab3
	dw Function11cb52
	dw Function11cb66
	dw Function11cbf5
	dw Function11ccef
	dw Function11cd04
	dw Function11cd20
	dw Function11cd54
	dw Function11ce0b
	dw Function11ce2b


Function11c2e9: ; 11c2e9 (47:42e9)
	lb de, $1a, $0d
	ld a, $1d
	call Function3b2a
	lb de, $42, $0d
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $1
	ld [hl], a
	lb de, $4a, $10
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $3
	ld [hl], a
	lb de, $50, $80
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $4
	ld [hl], a
	lb de, $50, $20
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $5
	ld [hl], a
	lb de, $50, $10
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $2
	ld [hl], a
	ld hl, wcd23
	set 1, [hl]
	set 2, [hl]
	jp Function11cfb5

Function11c346: ; 11c346 (47:4346)
	ld a, $9
	ld [wcd2d], a
	ld a, $2
	ld [wcd2e], a
	ld [wcd2f], a
	ld [wcd30], a
	ld de, wcd2d
	call Function11cfce
	jp Function11cfb5

Function11c35f: ; 11c35f (47:435f)
	ld hl, wcd2f
rept 2
	inc [hl]
endr
rept 2
	dec hl
endr
	dec [hl]
	push af
	ld de, wcd2d
	call Function11cfce
	pop af
	ret nz
	jp Function11cfb5

Function11c373: ; 11c373 (47:4373)
	ld hl, wcd30
rept 2
	inc [hl]
endr
rept 2
	dec hl
endr
	dec [hl]
	push af
	ld de, wcd2d
	call Function11cfce
	pop af
	ret nz
	call Function11c38a
	jp Function11cfb5

Function11c38a: ; 11c38a (47:438a)
	ld hl, Unknown_11c986
	ld bc, wcd36
	ld a, $6
.asm_11c392
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	push de
	pop hl
	ld a, [bc]
	inc bc
	ld e, a
	ld a, [bc]
	inc bc
	ld d, a
	push bc
	or e
	jr z, .asm_11c3af
	ld a, e
	and d
	cp $ff
	jr z, .asm_11c3af
	call Function11c05d
	jr .asm_11c3b5
.asm_11c3af
	ld de, String_11c3bc
	call PlaceString
.asm_11c3b5
	pop bc
	pop hl
	pop af
	dec a
	jr nz, .asm_11c392
	ret
; 11c3bc (47:43bc)

String_11c3bc: ; 11c3bc
	db "ーーーーー@"
; 11c3c2

Function11c3c2: ; 11c3c2 (47:43c2)
	call Function11c277
	ld de, Unknown_11cfbe
	call Function11d035
	hlcoord 1, 7
	ld de, String_11c4db
	call PlaceString
	hlcoord 1, 16
	ld de, String_11c51b
	call PlaceString
	call Function11c4be
	ld hl, wcd23
	set 0, [hl]
	ld hl, wcd24
	res 0, [hl]
	call Function11cfb5

Function11c3ed: ; 11c3ed (47:43ed)
	ld hl, BGMapBuffer ; wcd20 (aliases: CreditsPos)
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and $8
	jr nz, .asm_11c426
	ld a, [de]
	and $2
	jr nz, .asm_11c41a
	ld a, [de]
	and $1
	jr nz, .asm_11c42c
	ld de, $ffa9
	ld a, [de]
	and $40
	jr nz, .asm_11c47c
	ld a, [de]
	and $80
	jr nz, .asm_11c484
	ld a, [de]
	and $20
	jr nz, .asm_11c48c
	ld a, [de]
	and $10
	jr nz, .asm_11c498
	ret
.asm_11c41a
	call PlayClickSFX
.asm_11c41d
	ld hl, wcd24
	set 0, [hl]
	ld a, $c
	jr .asm_11c475
.asm_11c426
	ld a, $8
	ld [BGMapBuffer], a ; wcd20 (aliases: CreditsPos)
	ret
.asm_11c42c
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	cp $6
	jr c, .asm_11c472
	sub $6
	jr z, .asm_11c469
	dec a
	jr z, .asm_11c41d
	ld hl, wcd36
	ld c, $c
	xor a
.asm_11c440
	or [hl]
	inc hl
	dec c
	jr nz, .asm_11c440
	and a
	jr z, .asm_11c460
	ld de, Unknown_11cfba
	call Function11cfce
	decoord 1, 2
	ld bc, wcd36
	call Function11c08f
	ld hl, wcd24
	set 0, [hl]
	ld a, $e
	jr .asm_11c475
.asm_11c460
	ld hl, wcd24
	set 0, [hl]
	ld a, $11
	jr .asm_11c475
.asm_11c469
	ld hl, wcd24
	set 0, [hl]
	ld a, $a
	jr .asm_11c475
.asm_11c472
	call Function11c4a5
.asm_11c475
	ld [wcf63], a
	call PlayClickSFX
	ret
.asm_11c47c
	ld a, [hl]
	cp $3
	ret c
	sub $3
	jr .asm_11c4a3
.asm_11c484
	ld a, [hl]
	cp $6
	ret nc
	add $3
	jr .asm_11c4a3
.asm_11c48c
	ld a, [hl]
	and a
	ret z
	cp $3
	ret z
	cp $6
	ret z
	dec a
	jr .asm_11c4a3
.asm_11c498
	ld a, [hl]
	cp $2
	ret z
	cp $5
	ret z
	cp $8
	ret z
	inc a
.asm_11c4a3
	ld [hl], a
	ret

Function11c4a5: ; 11c4a5 (47:44a5)
	ld hl, wcd23
	res 0, [hl]
	ld a, [wcd2b]
	and a
	jr nz, .asm_11c4b7
	xor a
	ld [wcd21], a
	ld a, $6
	ret
.asm_11c4b7
	xor a
	ld [CreditsTimer], a
	ld a, $15
	ret

Function11c4be: ; 11c4be (47:44be)
	ld a, $1
	hlcoord 0, 6, AttrMap
	ld bc, $a0
	call ByteFill
	ld a, $7
	hlcoord 0, 14, AttrMap
	ld bc, $28
	call ByteFill
	callba Function104061
	ret
; 11c4db (47:44db)

String_11c4db: ; 11c4db
	db   "6つのことば", $1f, "くみあわせます"
	next "かえたいところ", $1f, "えらぶと でてくる"
	next "ことばのグループから いれかえたい"
	next "たんご", $1f, "えらんでください"
	db   "@"
; 11c51b

String_11c51b: ; 11c51b
	db "ぜんぶけす やめる   けってい@"
; 11c52c

Function11c52c: ; 11c52c (47:452c)
	call Function11c277
	call Function11c5f0
	call Function11c618
	ld hl, wcd24
	res 1, [hl]
	call Function11cfb5

Function11c53d: ; 11c53d (47:453d)
	ld hl, wcd21
	ld de, hJoypadPressed ; $ffa3

	ld a, [de]
	and START
	jr nz, .start

	ld a, [de]
	and SELECT
	jr nz, .select

	ld a, [de]
	and B_BUTTON
	jr nz, .b

	ld a, [de]
	and A_BUTTON
	jr nz, .a

	ld de, $ffa9

	ld a, [de]
	and D_UP
	jr nz, .up

	ld a, [de]
	and D_DOWN
	jr nz, .down

	ld a, [de]
	and D_LEFT
	jr nz, .left

	ld a, [de]
	and D_RIGHT
	jr nz, .right

	ret

.a
	ld a, [wcd21]
	cp $f
	jr c, .asm_11c59d
	sub $f
	jr z, .asm_11c5ab
	dec a
	jr z, .asm_11c599
	jr .b

.start
	ld hl, wcd24
	set 0, [hl]
	ld a, $8
	ld [BGMapBuffer], a ; wcd20 (aliases: CreditsPos)

.b
	ld a, $4
	jr .asm_11c59f

.select
	ld a, [wcd2b]
	xor $1
	ld [wcd2b], a
	ld a, $15
	jr .asm_11c59f

.asm_11c599
	ld a, $13
	jr .asm_11c59f

.asm_11c59d
	ld a, $8

.asm_11c59f
	ld hl, wcd24
	set 1, [hl]
	ld [wcf63], a
	call PlayClickSFX
	ret

.asm_11c5ab
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	call Function11ca6a
	call PlayClickSFX
	ret

.up
	ld a, [hl]
	cp $3
	ret c
	sub $3
	jr .asm_11c5ee

.down
	ld a, [hl]
	cp $f
	ret nc
	add $3
	jr .asm_11c5ee

.left
	ld a, [hl]
	and a
	ret z
	cp $3
	ret z
	cp $6
	ret z
	cp $9
	ret z
	cp $c
	ret z
	cp $f
	ret z
	dec a
	jr .asm_11c5ee

.right
	ld a, [hl]
	cp $2
	ret z
	cp $5
	ret z
	cp $8
	ret z
	cp $b
	ret z
	cp $e
	ret z
	cp $11
	ret z
	inc a

.asm_11c5ee
	ld [hl], a
	ret
; 11c5f0

Function11c5f0: ; 11c5f0 (47:45f0)
	ld de, Strings_11da52
	ld bc, Unknown_11c63a
	ld a, $f
.asm_11c5f8
	push af
	ld a, [bc]
	inc bc
	ld l, a
	ld a, [bc]
	inc bc
	ld h, a
	push bc
	call PlaceString
.asm_11c603
	inc de
	ld a, [de]
	cp $50
	jr z, .asm_11c603
	pop bc
	pop af
	dec a
	jr nz, .asm_11c5f8
	hlcoord 1, 17
	ld de, String_11c62a
	call PlaceString
	ret

Function11c618: ; 11c618 (47:4618)
	ld a, $2
	hlcoord 0, 6, AttrMap
	ld bc, $c8
	call ByteFill
	callba Function104061
	ret
; 11c62a (47:462a)

String_11c62a: ; 11c62a
	db "けす    モード   やめる@"
; 11c63a

Unknown_11c63a: ; 11c63a
	dwcoord  1,  7
	dwcoord  7,  7
	dwcoord 13,  7
	dwcoord  1,  9
	dwcoord  7,  9
	dwcoord 13,  9
	dwcoord  1, 11
	dwcoord  7, 11
	dwcoord 13, 11
	dwcoord  1, 13
	dwcoord  7, 13
	dwcoord 13, 13
	dwcoord  1, 15
	dwcoord  7, 15
	dwcoord 13, 15
; 11c658

Function11c658: ; 11c658 (47:4658)
	call Function11c277
	call Function11c770
	ld de, Unknown_11cfc2
	call Function11d035
	call Function11c9ab
	call Function11c7bc
	call Function11c86e
	ld hl, wcd24
	res 3, [hl]
	call Function11cfb5

Function11c675: ; 11c675 (47:4675)
	ld hl, wcd25
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and A_BUTTON
	jr nz, .a
	ld a, [de]
	and B_BUTTON
	jr nz, .b
	ld a, [de]
	and START
	jr nz, .start
	ld a, [de]
	and SELECT
	jr z, .select

	ld a, [wcd26]
	and a
	ret z
	sub $c
	jr nc, .asm_11c699
	xor a
.asm_11c699
	ld [wcd26], a
	jr .asm_11c6c4

.start
	ld hl, wcd28
	ld a, [wcd26]
	add $c
	cp [hl]
	ret nc
	ld [wcd26], a
	ld a, [hl]
	ld b, a
	ld hl, wcd25
	ld a, [wcd26]
	add [hl]
	jr c, .asm_11c6b9
	cp b
	jr c, .asm_11c6c4
.asm_11c6b9
	ld a, [wcd28]
	ld hl, wcd26
	sub [hl]
	dec a
	ld [wcd25], a
.asm_11c6c4
	call Function11c992
	call Function11c7bc
	call Function11c86e
	ret

.select
	ld de, $ffa9
	ld a, [de]
	and D_UP
	jr nz, .asm_11c708
	ld a, [de]
	and D_DOWN
	jr nz, .asm_11c731
	ld a, [de]
	and D_LEFT
	jr nz, .asm_11c746
	ld a, [de]
	and D_RIGHT
	jr nz, .asm_11c755
	ret

.a
	call Function11c8f6
	ld a, $4
	ld [wcd35], a
	jr .asm_11c6fc
.b
	ld a, [wcd2b]
	and a
	jr nz, .asm_11c6fa
	ld a, $6
	jr .asm_11c6fc
.asm_11c6fa
	ld a, $15
.asm_11c6fc
	ld [wcf63], a
	ld hl, wcd24
	set 3, [hl]
	call PlayClickSFX
	ret
.asm_11c708
	ld a, [hl]
	cp $3
	jr c, .asm_11c711
	sub $3
	jr .asm_11c76e
.asm_11c711
	ld a, [wcd26]
	sub $3
	ret c
	ld [wcd26], a
	jr .asm_11c6c4
.asm_11c71c
	ld hl, wcd28
	ld a, [wcd26]
	add $c
	ret c
	cp [hl]
	ret nc
	ld a, [wcd26]
	add $3
	ld [wcd26], a
	jr .asm_11c6c4
.asm_11c731
	ld a, [wcd28]
	ld b, a
	ld a, [wcd26]
	add [hl]
	add $3
	cp b
	ret nc
	ld a, [hl]
	cp $9
	jr nc, .asm_11c71c
	add $3
	jr .asm_11c76e
.asm_11c746
	ld a, [hl]
	and a
	ret z
	cp $3
	ret z
	cp $6
	ret z
	cp $9
	ret z
	dec a
	jr .asm_11c76e
.asm_11c755
	ld a, [wcd28]
	ld b, a
	ld a, [wcd26]
	add [hl]
	inc a
	cp b
	ret nc
	ld a, [hl]
	cp $2
	ret z
	cp $5
	ret z
	cp $8
	ret z
	cp $b
	ret z
	inc a
.asm_11c76e
	ld [hl], a
	ret

Function11c770: ; 11c770 (47:4770)
	xor a
	ld [wcd25], a
	ld [wcd26], a
	ld [wcd27], a
	ld a, [wcd2b]
	and a
	jr nz, .asm_11c7ab
	ld a, [wcd21]
	and a
	jr z, .asm_11c799
	dec a
	sla a
	ld hl, Unknown_11f220
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld [wcd28], a
	ld a, [hl]
.asm_11c795
	ld [wcd29], a
	ret
.asm_11c799
	ld a, [wc7d2]
	ld [wcd28], a
.asm_11c79f
	ld c, $c
	call SimpleDivide
	and a
	jr nz, .asm_11c7a8
	dec b
.asm_11c7a8
	ld a, b
	jr .asm_11c795
.asm_11c7ab
	ld hl, $c68a + 30
	ld a, [CreditsTimer]
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hl]
	ld [wcd28], a
	jr .asm_11c79f

Function11c7bc: ; 11c7bc (47:47bc)
	ld bc, Unknown_11c854
	ld a, [wcd2b]
	and a
	jr nz, .asm_11c814
	ld a, [wcd21]
	ld d, a
	and a
	jr z, .asm_11c7e9
	ld a, [wcd26]
	ld e, a
.asm_11c7d0
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	and l
	cp $ff
	ret z
	push bc
	push de
	call Function11c05d
	pop de
	pop bc
	inc e
	ld a, [wcd28]
	cp e
	jr nz, .asm_11c7d0
	ret
.asm_11c7e9
	ld hl, wd100
	ld a, [wcd26]
	ld e, a
	add hl, de
.asm_11c7f1
	push de
	ld a, [hli]
	ld e, a
	ld d, $0
	push hl
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	and l
	cp $ff
	jr z, .asm_11c811
	push bc
	call Function11c05d
	pop bc
	pop hl
	pop de
	inc e
	ld a, [wcd28]
	cp e
	jr nz, .asm_11c7f1
	ret
.asm_11c811
	pop hl
	pop de
	ret
.asm_11c814
	ld hl, $c648
	ld a, [wcd22]
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld a, [wcd26]
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [wcd26]
	ld e, a
.asm_11c831
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	and l
	cp $ff
	jr z, .asm_11c851
	push bc
	call Function11c05d
	pop bc
	pop hl
	pop de
	inc e
	ld a, [wcd28]
	cp e
	jr nz, .asm_11c831
	ret
.asm_11c851
	pop hl
	pop de
	ret
; 11c854 (47:4854)

Unknown_11c854: ; 11c854
	dwcoord  2,  8
	dwcoord  8,  8
	dwcoord 14,  8
	dwcoord  2, 10
	dwcoord  8, 10
	dwcoord 14, 10
	dwcoord  2, 12
	dwcoord  8, 12
	dwcoord 14, 12
	dwcoord  2, 14
	dwcoord  8, 14
	dwcoord 14, 14
	dw -1
; 11c86e

Function11c86e: ; 11c86e (47:486e)
	ld a, [wcd26]
	and a
	jr z, .asm_11c88a
	hlcoord 2, 17
	ld de, String_11c8f0
	call PlaceString
	hlcoord 6, 17
	ld c, $3
	xor a
.asm_11c883
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_11c883
	jr .asm_11c895
.asm_11c88a
	hlcoord 2, 17
	ld c, $7
	ld a, $7f
.asm_11c891
	ld [hli], a
	dec c
	jr nz, .asm_11c891
.asm_11c895
	ld hl, wcd28
	ld a, [wcd26]
	add $c
	jr c, .asm_11c8b7
	cp [hl]
	jr nc, .asm_11c8b7
	hlcoord 16, 17
	ld de, String_11c8f3
	call PlaceString
	hlcoord 11, 17
	ld a, $3
	ld c, a
.asm_11c8b1
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_11c8b1
	ret
.asm_11c8b7
	hlcoord 17, 16
	ld a, $7f
	ld [hl], a
	hlcoord 11, 17
	ld c, $7
.asm_11c8c2
	ld [hli], a
	dec c
	jr nz, .asm_11c8c2
	ret
; 11c8c7 (47:48c7)

Function11c8c7: ; 11c8c7
	inc a
	push af
	and $f
	ld [hDividend], a
	pop af
	and $f0
	swap a
	ld [hQuotient], a
	xor a
	ld [$ffb5], a
	push hl
	callba Function11a80c
	pop hl
	ld a, [wcd63]
	add $f6
	ld [hli], a
	ld a, [wcd62]
	add $f6
	ld [hli], a
	ret
; 11c8ec

String_11c8ec: ; 11c8ec
	db "ぺージ@"
; 11c8f0

String_11c8f0: ; 11c8f0
	db "まえ@"
; 11c8f3

String_11c8f3: ; 11c8f3
	db "つぎ@"
; 11c8f6

Function11c8f6: ; 11c8f6 (47:48f6)
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	call Function11c95d
	push hl
	ld a, [wcd2b]
	and a
	jr nz, .asm_11c938
	ld a, [wcd21]
	ld d, a
	and a
	jr z, .asm_11c927
	ld hl, wcd26
	ld a, [wcd25]
	add [hl]
.asm_11c911
	ld e, a
.asm_11c912
	pop hl
	push de
	call Function11c05d
	pop de
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	ld c, a
	ld b, $0
	ld hl, wcd36
rept 2
	add hl, bc
endr
	ld [hl], e
	inc hl
	ld [hl], d
	ret
.asm_11c927
	ld hl, wcd26
	ld a, [wcd25]
	add [hl]
	ld c, a
	ld b, $0
	ld hl, wd100
	add hl, bc
	ld a, [hl]
	jr .asm_11c911
.asm_11c938
	ld hl, $c648
	ld a, [wcd22]
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld a, [wcd26]
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [wcd25]
	ld e, a
rept 2
	add hl, de
endr
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	jr .asm_11c912

Function11c95d: ; 11c95d (47:495d)
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_11c986
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	push bc
	push bc
	pop hl
	ld a, $5
	ld c, a
	ld a, $7f
.asm_11c972
	ld [hli], a
	dec c
	jr nz, .asm_11c972
	dec hl
	ld bc, -20
	add hl, bc
	ld a, $5
	ld c, a
	ld a, $7f
.asm_11c980
	ld [hld], a
	dec c
	jr nz, .asm_11c980
	pop hl
	ret
; 11c986 (47:4986)

Unknown_11c986:
	dwcoord  1,  2
	dwcoord  7,  2
	dwcoord 13,  2
	dwcoord  1,  4
	dwcoord  7,  4
	dwcoord 13,  4
; 11c992

Function11c992: ; 11c992 (47:4992)
	ld a, $8
	hlcoord 2, 7
.asm_11c997
	push af
	ld a, $7f
	push hl
	ld bc, $11
	call ByteFill
	pop hl
	ld bc, $14
	add hl, bc
	pop af
	dec a
	jr nz, .asm_11c997
	ret

Function11c9ab: ; 11c9ab (47:49ab)
	ld a, $7
	hlcoord 0, 6, AttrMap
	ld bc, $c8
	call ByteFill
	callba Function104061
	ret

Function11c9bd: ; 11c9bd (47:49bd)
	ld de, String_11ca38
	call Function11ca7f

Function11c9c3: ; 11c9c3 (47:49c3)
	ld hl, wcd2a
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and $1
	jr nz, .asm_11c9de
	ld a, [de]
	and $2
	jr nz, .asm_11c9e9
	ld a, [de]
	and $40
	jr nz, .asm_11c9f7
	ld a, [de]
	and $80
	jr nz, .asm_11c9fc
	ret
.asm_11c9de
	ld a, [hl]
	and a
	jr nz, .asm_11c9e9
	call Function11ca5e
	xor a
	ld [BGMapBuffer], a ; wcd20 (aliases: CreditsPos)
.asm_11c9e9
	ld hl, wcd24
	set 4, [hl]
	ld a, $4
	ld [wcf63], a
	call PlayClickSFX
	ret
.asm_11c9f7
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
.asm_11c9fc
	ld a, [hl]
	and a
	ret nz
	inc [hl]
	ret

Function11ca01: ; 11ca01 (47:4a01)
	hlcoord 14, 7, AttrMap
	ld de, $14
	ld a, $5
	ld c, a
.asm_11ca0a
	push hl
	ld a, $6
	ld b, a
	ld a, $7
.asm_11ca10
	ld [hli], a
	dec b
	jr nz, .asm_11ca10
	pop hl
	add hl, de
	dec c
	jr nz, .asm_11ca0a

Function11ca19: ; 11ca19 (47:4a19)
	hlcoord 0, 12, AttrMap
	ld de, $14
	ld a, $6
	ld c, a
.asm_11ca22
	push hl
	ld a, $14
	ld b, a
	ld a, $7
.asm_11ca28
	ld [hli], a
	dec b
	jr nz, .asm_11ca28
	pop hl
	add hl, de
	dec c
	jr nz, .asm_11ca22
	callba Function104061
	ret
; 11ca38 (47:4a38)

String_11ca38: ; 11ca38
	db   "とうろくちゅう", $25, "あいさつ", $1f, "ぜんぶ"
	next "けしても よろしいですか?@"
; 11ca57

String_11ca57: ; 11ca57
	db   "はい"
	next "いいえ@"
; 11ca5e

Function11ca5e: ; 11ca5e (47:4a5e)
	xor a
.asm_11ca5f
	push af
	call Function11ca6a
	pop af
	inc a
	cp $6
	jr nz, .asm_11ca5f
	ret

Function11ca6a: ; 11ca6a (47:4a6a)
	ld hl, wcd36
	ld c, a
	ld b, $0
rept 2
	add hl, bc
endr
	ld [hl], b
	inc hl
	ld [hl], b
	call Function11c95d
	ld de, String_11c3bc
	call PlaceString
	ret

Function11ca7f: ; 11ca7f (47:4a7f)
	push de
	ld de, Unknown_11cfc6
	call Function11cfce
	ld de, Unknown_11cfca
	call Function11cfce
	hlcoord 1, 14
	pop de
	call PlaceString
	hlcoord 16, 8
	ld de, String_11ca57
	call PlaceString
	call Function11ca01
	ld a, $1
	ld [wcd2a], a
	ld hl, wcd24
	res 4, [hl]
	call Function11cfb5
	ret

Function11caad: ; 11caad (47:4aad)
	ld de, String_11cb1c
	call Function11ca7f

Function11cab3: ; 11cab3 (47:4ab3)
	ld hl, wcd2a
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and $1
	jr nz, .asm_11cace
	ld a, [de]
	and $2
	jr nz, .asm_11caf9
	ld a, [de]
	and $40
	jr nz, .asm_11cb12
	ld a, [de]
	and $80
	jr nz, .asm_11cb17
	ret
.asm_11cace
	call PlayClickSFX
	ld a, [hl]
	and a
	jr nz, .asm_11cafc
	ld a, [wcd35]
	and a
	jr z, .asm_11caf3
	cp $ff
	jr z, .asm_11caf3
	ld a, $ff
	ld [wcd35], a
	hlcoord 1, 14
	ld de, String_11cb31
	call PlaceString
	ld a, $1
	ld [wcd2a], a
	ret
.asm_11caf3
	ld hl, wcf63
	set 7, [hl]
	ret
.asm_11caf9
	call PlayClickSFX
.asm_11cafc
	ld hl, wcd24
	set 4, [hl]
	ld a, $4
	ld [wcf63], a
	ld a, [wcd35]
	cp $ff
	ret nz
	ld a, $1
	ld [wcd35], a
	ret
.asm_11cb12
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
.asm_11cb17
	ld a, [hl]
	and a
	ret nz
	inc [hl]
	ret
; 11cb1c (47:4b1c)

String_11cb1c: ; 11cb1c
	db   "あいさつ", $25, "とうろく", $1f, "ちゅうし"
	next "しますか?@"
; 11cb31

String_11cb31: ; 11cb31
	db   "とうろくちゅう", $25, "あいさつ", $24, "ほぞん"
	next "されません", $4a, "よろしい ですか?@"
; 11cb52

Function11cb52: ; 11cb52 (47:4b52)
	ld hl, Unknown_11cc01
	ld a, [wcfa9]
.asm_11cb58
	dec a
	jr z, .asm_11cb5f
rept 2
	inc hl
endr
	jr .asm_11cb58
.asm_11cb5f
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	call Function11ca7f

Function11cb66: ; 11cb66 (47:4b66)
	ld hl, wcd2a
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and $1
	jr nz, .asm_11cb81
	ld a, [de]
	and $2
	jr nz, .asm_11cbd7
	ld a, [de]
	and $40
	jr nz, .asm_11cbeb
	ld a, [de]
	and $80
	jr nz, .asm_11cbf0
	ret
.asm_11cb81
	ld a, [hl]
	and a
	jr nz, .asm_11cbd4
	ld a, $4
	call GetSRAMBank
	ld hl, $a007
	ld a, [wcfa9]
	dec a
	sla a
	sla a
	ld c, a
	sla a
	add c
	ld c, a
	ld b, $0
	add hl, bc
	ld de, wcd36
	ld c, $c
.asm_11cba2
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_11cba2
	call CloseSRAM
	call PlayClickSFX
	ld de, Unknown_11cfc6
	call Function11cfce
	ld hl, Unknown_11cc7e
	ld a, [wcfa9]
.asm_11cbba
	dec a
	jr z, .asm_11cbc1
rept 2
	inc hl
endr
	jr .asm_11cbba
.asm_11cbc1
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	hlcoord 1, 14
	call PlaceString
	ld hl, wcf63
	inc [hl]
	inc hl
	ld a, $10
	ld [hl], a
	ret
.asm_11cbd4
	call PlayClickSFX
.asm_11cbd7
	ld de, Unknown_11cfba
	call Function11cfce
	call Function11c38a
	ld hl, wcd24
	set 4, [hl]
	ld a, $4
	ld [wcf63], a
	ret
.asm_11cbeb
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
.asm_11cbf0
	ld a, [hl]
	and a
	ret nz
	inc [hl]
	ret

Function11cbf5: ; 11cbf5 (47:4bf5)
	call WaitSFX
	ld hl, wcf64
	dec [hl]
	ret nz
	dec hl
	set 7, [hl]
	ret
; 11cc01 (47:4c01)

Unknown_11cc01: ; 11cc01
	dw String_11cc09
	dw String_11cc23
	dw String_11cc42
	dw String_11cc60

String_11cc09: ; 11cc09
	db   "じこしょうかい は"
	next "この あいさつで いいですか?@"

String_11cc23: ; 11cc23
	db   "たいせん ", $4a, "はじまるとき は"
	next "この あいさつで いいですか?@"

String_11cc42: ; 11cc42
	db   "たいせん ", $1d, "かったとき は"
	next "この あいさつで いいですか?@"

String_11cc60: ; 11cc60
	db   "たいせん ", $1d, "まけたとき は"
	next "この あいさつで いいですか?@"
; 11cc7e

Unknown_11cc7e: ; 11cc7e
	dw String_11cc86
	dw String_11cc9d
	dw String_11ccb9
	dw String_11ccd4

String_11cc86: ; 11cc86
	db   "じこしょうかい の"
	next "あいさつ", $1f, "とうろくした!@"

String_11cc9d: ; 11cc9d
	db   "たいせん ", $4a, "はじまるとき の"
	next "あいさつ", $1f, "とうろくした!@"

String_11ccb9: ; 11ccb9
	db   "たいせん ", $1d, "かったとき の"
	next "あいさつ", $1f, "とうろくした!@"

String_11ccd4: ; 11ccd4
	db   "たいせん ", $1d, "まけたとき の"
	next "あいさつ", $1f, "とうろくした!@"
; 11ccef

Function11ccef: ; 11ccef (47:4cef)
	ld de, Unknown_11cfc6
	call Function11cfce
	hlcoord 1, 14
	ld de, String_11cd10
	call PlaceString
	call Function11ca19
	call Function11cfb5

Function11cd04: ; 11cd04 (47:4d04)
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and a
	ret z
	ld a, $4
	ld [wcf63], a
	ret
; 11cd10 (47:4d10)

String_11cd10: ; 11cd10
	db "なにか ことば", $1f, "いれてください@"
; 11cd20

Function11cd20: ; 11cd20 (47:4d20)
	call Function11c277
	ld de, Unknown_11cfc6
	call Function11cfce
	hlcoord 1, 14
	ld a, [wcd2b]
	ld [wcd2c], a
	and a
	jr nz, .asm_11cd3a
	ld de, String_11cdc7
	jr .asm_11cd3d
.asm_11cd3a
	ld de, String_11cdd9
.asm_11cd3d
	call PlaceString
	hlcoord 4, 8
	ld de, String_11cdf5
	call PlaceString
	call Function11cdaa
	ld hl, wcd24
	res 5, [hl]
	call Function11cfb5

Function11cd54: ; 11cd54 (47:4d54)
	ld hl, wcd2c
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and A_BUTTON
	jr nz, .asm_11cd6f
	ld a, [de]
	and B_BUTTON
	jr nz, .asm_11cd73
	ld a, [de]
	and D_UP
	jr nz, .asm_11cd8b
	ld a, [de]
	and D_DOWN
	jr nz, .asm_11cd94
	ret

.asm_11cd6f
	ld a, [hl]
	ld [wcd2b], a
.asm_11cd73
	ld a, [wcd2b]
	and a
	jr nz, .asm_11cd7d
	ld a, $6
	jr .asm_11cd7f

.asm_11cd7d
	ld a, $15
.asm_11cd7f
	ld [wcf63], a
	ld hl, wcd24
	set 5, [hl]
	call PlayClickSFX
	ret

.asm_11cd8b
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ld de, String_11cdc7
	jr .asm_11cd9b

.asm_11cd94
	ld a, [hl]
	and a
	ret nz
	inc [hl]
	ld de, String_11cdd9
.asm_11cd9b
	push de
	ld de, Unknown_11cfc6
	call Function11cfce
	pop de
	hlcoord 1, 14
	call PlaceString
	ret

Function11cdaa: ; 11cdaa (47:4daa)
	ld a, $2
	hlcoord 0, 6, AttrMap
	ld bc, $78
	call ByteFill
	ld a, $7
	hlcoord 0, 12, AttrMap
	ld bc, $50
	call ByteFill
	callba Function104061
	ret
; 11cdc7 (47:4dc7)

String_11cdc7: ; 11cdc7
	db   "ことば", $1f, "しゅるいべつに"
	next "えらべます@"
; 11cdd9

String_11cdd9: ; 11cdd9
	db   "ことば", $1f, "アイウエォ の"
	next "じゅんばんで ひょうじ します@"
; 11cdf5

String_11cdf5: ; 11cdf5
	db "しゅるいべつ モード"
	next "アイウエォ  モード@"
; 11ce0b

Function11ce0b: ; 11ce0b (47:4e0b)
	call Function11c277
	hlcoord 1, 7
	ld de, String_11cf79
	call PlaceString
	hlcoord 1, 17
	ld de, String_11c62a
	call PlaceString
	call Function11c618
	ld hl, wcd24
	res 2, [hl]
	call Function11cfb5

Function11ce2b: ; 11ce2b (47:4e2b)
	ld a, [CreditsTimer]
	sla a
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_11ceb9
	add hl, bc

	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and START
	jr nz, .start
	ld a, [de]
	and SELECT
	jr nz, .select
	ld a, [de]
	and A_BUTTON
	jr nz, .a
	ld a, [de]
	and B_BUTTON
	jr nz, .b

	ld de, $ffa9
	ld a, [de]
	and D_UP
	jr nz, .up
	ld a, [de]
	and D_DOWN
	jr nz, .down
	ld a, [de]
	and D_LEFT
	jr nz, .left
	ld a, [de]
	and D_RIGHT
	jr nz, .right

	ret

.a
	ld a, [CreditsTimer]
	cp $2d
	jr c, .asm_11ce92
	sub $2d
	jr z, .asm_11cea4
	dec a
	jr z, .asm_11ce96
	jr .b

.start
	ld hl, wcd24
	set 0, [hl]
	ld a, $8
	ld [BGMapBuffer], a ; wcd20 (aliases: CreditsPos)
.b
	ld a, $4
	jr .asm_11ce98
.select
	ld a, [wcd2b]
	xor $1
	ld [wcd2b], a
	ld a, $6
	jr .asm_11ce98

.asm_11ce92
	ld a, $8
	jr .asm_11ce98

.asm_11ce96
	ld a, $13
.asm_11ce98
	ld [wcf63], a
	ld hl, wcd24
	set 2, [hl]
	call PlayClickSFX
	ret
.asm_11cea4
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	call Function11ca6a
	call PlayClickSFX
	ret

.left
	inc hl
.down
	inc hl
.right
	inc hl
.up
	ld a, [hl]
	cp $ff
	ret z
	ld [CreditsTimer], a
	ret
; 11ceb9 (47:4eb9)

Unknown_11ceb9: ; 11ceb9
	; up left down right
	db $ff, $01, $05, $ff
	db $ff, $02, $06, $00
	db $ff, $03, $07, $01
	db $ff, $04, $08, $02
	db $ff, $14, $09, $03
	db $00, $06, $0a, $ff
	db $01, $07, $0b, $05
	db $02, $08, $0c, $06
	db $03, $09, $0d, $07
	db $04, $19, $0e, $08
	db $05, $0b, $0f, $ff
	db $06, $0c, $10, $0a
	db $07, $0d, $11, $0b
	db $08, $0e, $12, $0c
	db $09, $1e, $13, $0d
	db $0a, $10, $2d, $ff
	db $0b, $11, $2d, $0f
	db $0c, $12, $2d, $10
	db $0d, $13, $2d, $11
	db $0e, $26, $2d, $12
	db $ff, $15, $19, $04
	db $ff, $16, $1a, $14
	db $ff, $17, $1b, $15
	db $ff, $18, $1c, $16
	db $ff, $23, $1d, $17
	db $14, $1a, $1e, $09
	db $15, $1b, $1f, $19
	db $16, $1c, $20, $1a
	db $17, $1d, $21, $1b
	db $18, $2b, $22, $1c
	db $19, $1f, $26, $0e
	db $1a, $20, $27, $1e
	db $1b, $21, $28, $1f
	db $1c, $22, $29, $20
	db $1d, $2c, $2a, $21
	db $ff, $24, $2b, $18
	db $ff, $25, $2b, $23
	db $ff, $ff, $2b, $24
	db $1e, $27, $2e, $13
	db $1f, $28, $2e, $26
	db $20, $29, $2e, $27
	db $21, $2a, $2e, $28
	db $22, $ff, $2e, $29
	db $23, $ff, $2c, $1d
	db $2b, $ff, $2f, $22
	db $0f, $2e, $ff, $ff
	db $26, $2f, $ff, $2d
	db $2c, $ff, $ff, $2e
; 11cf79

String_11cf79: ; 11cf79
	db   "あいうえお なにぬねの や ゆ よ"
	next "かきくけこ はひふへほ わ"
	next "さしすせそ まみむめも そのた"
	next "たちつてと らりるれろ"
	db   "@"
; 11cfb5

Function11cfb5: ; 11cfb5 (47:4fb5)
	ld hl, wcf63
	inc [hl]
	ret
; 11cfba (47:4fba)

Unknown_11cfba:
	db  0,  0 ; start coords
	db 20,  6 ; end coords

Unknown_11cfbe:
	db  0, 14 ; start coords
	db 20,  4 ; end coords

Unknown_11cfc2:
	db  0,  6 ; start coords
	db 20, 10 ; end coords

Unknown_11cfc6:
	db  0, 12 ; start coords
	db 20,  6 ; end coords

Unknown_11cfca:
	db 14,  7 ; start coords
	db  6,  5 ; end coords
; 11cfce

Function11cfce: ; 11cfce (47:4fce)
	ld hl, TileMap
	ld bc, $14
	ld a, [de]
	inc de
	push af
	ld a, [de]
	inc de
	and a
.asm_11cfda
	jr z, .asm_11cfe0
	add hl, bc
	dec a
	jr .asm_11cfda
.asm_11cfe0
	pop af
	ld c, a
	ld b, 0
	add hl, bc
	push hl
	ld a, $79
	ld [hli], a
	ld a, [de]
	inc de
rept 2
	dec a
endr
	jr z, .asm_11cff6
	ld c, a
	ld a, $7a
.asm_11cff2
	ld [hli], a
	dec c
	jr nz, .asm_11cff2
.asm_11cff6
	ld a, $7b
	ld [hl], a
	pop hl
	ld bc, $14
	add hl, bc
	ld a, [de]
	dec de
rept 2
	dec a
endr
	jr z, .asm_11d022
	ld b, a
.asm_11d005
	push hl
	ld a, $7c
	ld [hli], a
	ld a, [de]
rept 2
	dec a
endr
	jr z, .asm_11d015
	ld c, a
	ld a, $7f
.asm_11d011
	ld [hli], a
	dec c
	jr nz, .asm_11d011
.asm_11d015
	ld a, $7c
	ld [hl], a
	pop hl
	push bc
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_11d005
.asm_11d022
	ld a, $7d
	ld [hli], a
	ld a, [de]
rept 2
	dec a
endr
	jr z, .asm_11d031
	ld c, a
	ld a, $7a
.asm_11d02d
	ld [hli], a
	dec c
	jr nz, .asm_11d02d
.asm_11d031
	ld a, $7e
	ld [hl], a
	ret

Function11d035: ; 11d035 (47:5035)
	ld hl, TileMap
	ld bc, $14
	ld a, [de]
	inc de
	push af
	ld a, [de]
	inc de
	and a
.asm_11d041
	jr z, .asm_11d047
	add hl, bc
	dec a
	jr .asm_11d041
.asm_11d047
	pop af
	ld c, a
	ld b, $0
	add hl, bc
	push hl
	ld a, $79
	ld [hl], a
	pop hl
	push hl
	ld a, [de]
	dec a
	inc de
	ld c, a
	add hl, bc
	ld a, $7b
	ld [hl], a
	call Function11d0ac
	ld a, $7e
	ld [hl], a
	pop hl
	push hl
	call Function11d0ac
	ld a, $7d
	ld [hl], a
	pop hl
	push hl
	inc hl
	push hl
	call Function11d0ac
	pop bc
	dec de
	ld a, [de]
	cp $2
	jr z, .asm_11d082
rept 2
	dec a
endr
.asm_11d078
	push af
	ld a, $7a
	ld [hli], a
	ld [bc], a
	inc bc
	pop af
	dec a
	jr nz, .asm_11d078
.asm_11d082
	pop hl
	ld bc, $14
	add hl, bc
	push hl
	ld a, [de]
	dec a
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	inc de
	ld a, [de]
	cp $2
	ret z
	push bc
rept 2
	dec a
endr
	ld c, a
	ld b, a
	ld de, $14
.asm_11d09c
	ld a, $7c
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_11d09c
	pop hl
.asm_11d0a4
	ld a, $7c
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_11d0a4
	ret

Function11d0ac: ; 11d0ac (47:50ac)
	ld a, [de]
	dec a
	ld bc, $14
.asm_11d0b1
	add hl, bc
	dec a
	jr nz, .asm_11d0b1
	ret

Function11d0b6: ; 11d0b6 (47:50b6)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11d0c7
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_11d0c7: ; 11d0c7 (47:50c7)
	dw Function11d0dd
	dw Function11d0e9
	dw Function11d0f5
	dw Function11d10f
	dw Function11d134
	dw Function11d145
	dw Function11d156
	dw Function11d175
	dw Function11d1d7
	dw Function11d1d1
	dw Function11d1fc


Function11d0dd: ; 11d0dd (47:50dd)
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	sla a
	ld hl, Unknown_11d208
	ld e, $1
	jr asm_11d11e

Function11d0e9: ; 11d0e9 (47:50e9)
	ld a, [wcd21]
	sla a
	ld hl, Unknown_11d21a
	ld e, $2
	jr asm_11d11e

Function11d0f5: ; 11d0f5 (47:50f5)
	ld hl, Unknown_11d2be
	ld a, [CreditsTimer]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	call Function3b3c
	ld a, [CreditsTimer]
	sla a
	ld hl, Unknown_11d23e
	ld e, $4
	jr asm_11d11e

Function11d10f: ; 11d10f (47:510f)
	ld a, $27
	call Function3b3c
	ld a, [wcd25]
	sla a
	ld hl, Unknown_11d29e
	ld e, $8

asm_11d11e: ; 11d11e (47:511e)
	push de
	ld e, a
	ld d, $0
	add hl, de
	push hl
	pop de
	ld hl, $4
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	pop de
	ld a, e
	call Function11d2ee
	ret

Function11d134: ; 11d134 (47:5134)
	ld a, $27
	call Function3b3c
	ld a, [wcd2a]
	sla a
	ld hl, Unknown_11d2b6
	ld e, $10
	jr asm_11d11e

Function11d145: ; 11d145 (47:5145)
	ld a, $27
	call Function3b3c
	ld a, [wcd2c]
	sla a
	ld hl, Unknown_11d2ba
	ld e, $20
	jr asm_11d11e

Function11d156: ; 11d156 (47:5156)
	ld a, $2a
	call Function3b3c
	ld a, [wcd4a]
	sla a
	sla a
	sla a
	add $18
	ld hl, $4
	add hl, bc
	ld [hli], a
	ld a, $30
	ld [hl], a
	ld a, $1
	ld e, a
	call Function11d2ee
	ret

Function11d175: ; 11d175 (47:5175)
	ld a, [wcd4d]
	cp $4
	jr z, .asm_11d180
	ld a, $28
	jr .asm_11d182
.asm_11d180
	ld a, $26
.asm_11d182
	call Function3b3c
	ld a, [wcd4d]
	cp $4
	jr z, .asm_11d1b1
	ld a, [wcd4c]
	sla a
	sla a
	sla a
	add $20
	ld hl, $4
	add hl, bc
	ld [hli], a
	ld a, [wcd4d]
	sla a
	sla a
	sla a
	sla a
	add $48
	ld [hl], a
	ld a, $2
	ld e, a
	call Function11d2ee
	ret
.asm_11d1b1
	ld a, [wcd4c]
	sla a
	sla a
	sla a
	ld e, a
	sla a
	sla a
	add e
	add $18
	ld hl, $4
	add hl, bc
	ld [hli], a
	ld a, $8a
	ld [hl], a
	ld a, $2
	ld e, a
	call Function11d2ee
	ret

Function11d1d1: ; 11d1d1 (47:51d1)
	ld d, $98
	ld a, $2c
	jr asm_11d1db

Function11d1d7: ; 11d1d7 (47:51d7)
	ld d, $10
	ld a, $2b

asm_11d1db: ; 11d1db (47:51db)
	push de
	call Function3b3c
	ld a, [wcd4a]
	sla a
	sla a
	sla a
	ld e, a
	sla a
	add e
	add $40
	ld hl, $5
	add hl, bc
	ld [hld], a
	pop af
	ld [hl], a
	ld a, $4
	ld e, a
	call Function11d2ee
	ret

Function11d1fc: ; 11d1fc (47:51fc)
	ld a, $26
	call Function3b3c
	ld a, $8
	ld e, a
	call Function11d2ee
	ret
; 11d208 (47:5208)

Unknown_11d208: ; 11d208
	db $0d, $1a
	db $3d, $1a
	db $6d, $1a
	db $0d, $2a
	db $3d, $2a
	db $6d, $2a
	db $0d, $8a
	db $3d, $8a
	db $6d, $8a

Unknown_11d21a: ; 11d21a
	db $0d, $42
	db $3d, $42
	db $6d, $42
	db $0d, $52
	db $3d, $52
	db $6d, $52
	db $0d, $62
	db $3d, $62
	db $6d, $62
	db $0d, $72
	db $3d, $72
	db $6d, $72
	db $0d, $82
	db $3d, $82
	db $6d, $82
	db $0d, $92
	db $3d, $92
	db $6d, $92

Unknown_11d23e: ; 11d23e
	db $10, $48
	db $18, $48
	db $20, $48
	db $28, $48
	db $30, $48
	db $10, $58
	db $18, $58
	db $20, $58
	db $28, $58
	db $30, $58
	db $10, $68
	db $18, $68
	db $20, $68
	db $28, $68
	db $30, $68
	db $10, $78
	db $18, $78
	db $20, $78
	db $28, $78
	db $30, $78
	db $40, $48
	db $48, $48
	db $50, $48
	db $58, $48
	db $60, $48
	db $40, $58
	db $48, $58
	db $50, $58
	db $58, $58
	db $60, $58
	db $40, $68
	db $48, $68
	db $50, $68
	db $58, $68
	db $60, $68
	db $70, $48
	db $80, $48
	db $90, $48
	db $40, $78
	db $48, $78
	db $50, $78
	db $58, $78
	db $60, $78
	db $70, $58
	db $70, $68
	db $0d, $92
	db $3d, $92
	db $6d, $92

Unknown_11d29e: ; 11d29e
	db $10, $50
	db $40, $50
	db $70, $50
	db $10, $60
	db $40, $60
	db $70, $60
	db $10, $70
	db $40, $70
	db $70, $70
	db $10, $80
	db $40, $80
	db $70, $80

Unknown_11d2b6: ; 11d2b6
	db $80, $50
	db $80, $60

Unknown_11d2ba: ; 11d2ba
	db $20, $50
	db $20, $60

Unknown_11d2be: ; 11d2be
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $29, $26
	db $26, $26

Function11d2ee: ; 11d2ee (47:52ee)
	ld hl, wcd24
	and [hl]
	jr nz, .asm_11d316
	ld a, e
	ld hl, wcd23
	and [hl]
	jr z, .asm_11d30f
	ld hl, $e
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_11d305
	dec [hl]
	ret
.asm_11d305
	ld a, $0
	ld [hld], a
	ld a, $1
	xor [hl]
	ld [hl], a
	and a
	jr nz, .asm_11d316
.asm_11d30f
	ld hl, $7
	add hl, bc
	xor a
	ld [hl], a
	ret
.asm_11d316
	ld hl, $5
	add hl, bc
	ld a, $b0
	sub [hl]
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

Function11d323: ; 11d323
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_11d33a
	ld de, Unkn1Pals
	ld bc, $0080
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 11d33a

Palette_11d33a:
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 16, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 23, 17, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
; 11d3ba

Function11d3ba: ; 11d3ba
	ld a, [rSVBK]
	push af
	ld hl, BattleMonSpclDef
	ld a, $0
	ld [wcd2d], a
	ld [hli], a
	ld a, $d8
	ld [wcd2e], a
	ld [hl], a
	ld a, $fe
	ld [wcd2f], a
	ld a, $54
	ld [wcd30], a
	ld a, $a8
	ld [wcd31], a
	ld a, $c6
	ld [wcd32], a
	ld a, $4a
	ld [wcd33], a
	ld a, $c6
	ld [wcd34], a
	ld hl, Unknown_11f23c
	ld a, $2d

Function11d3ef: ; 11d3ef
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	push hl
	ld hl, Unkn1Pals
	add hl, de
	ld a, [wcd2d]
	ld e, a
	ld a, [wcd2e]
	ld d, a
	push bc
.asm_11d406
	ld a, $3
	ld [rSVBK], a
	ld a, [hli]
	push af
	ld a, $5
	ld [rSVBK], a
	pop af
	ld [de], a
	inc de
	ld a, $3
	ld [rSVBK], a
	ld a, [hli]
	push af
	ld a, $5
	ld [rSVBK], a
	pop af
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_11d406
	ld a, [wcd2f]
	ld l, a
	ld a, [wcd30]
	ld h, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, l
	ld [wcd2f], a
	ld a, h
	ld [wcd30], a
	push bc
	pop hl
	ld c, $0
.asm_11d43d
	ld a, [hl]
	cp $ff
	jr z, .asm_11d453
	call Function11d493
	jr nz, .asm_11d44a
	inc hl
	jr .asm_11d43d

.asm_11d44a
	ld a, [hli]
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	inc c
	jr .asm_11d43d

.asm_11d453
	pop hl
	ld b, $0
	add hl, bc
	push hl
	pop bc
	ld a, [wcd31]
	ld l, a
	ld a, [wcd32]
	ld h, a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, l
	ld [wcd31], a
	ld a, h
	ld [wcd32], a
	ld a, [wcd33]
	ld l, a
	ld a, [wcd34]
	ld h, a
	ld a, e
	ld [wcd2d], a
	ld [hli], a
	ld a, d
	ld [wcd2e], a
	ld [hli], a
	ld a, l
	ld [wcd33], a
	ld a, h
	ld [wcd34], a
	pop hl
	pop af
	dec a
	jr z, .asm_11d48f
	jp Function11d3ef

.asm_11d48f
	pop af
	ld [rSVBK], a
	ret
; 11d493

Function11d493: ; 11d493
	push hl
	push bc
	push de
	dec a
	ld hl, rSVBK
	ld e, $1
	ld [hl], e
	call CheckSeenMon
	ld hl, rSVBK
	ld e, $5
	ld [hl], e
	pop de
	pop bc
	pop hl
	ret
; 11d4aa

Function11d4aa: ; 11d4aa
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld hl, Unknown_11daac
	ld bc, Unknown_11f220
	xor a
	ld [wcd2d], a
	inc a
	ld [wcd2e], a
	ld a, $e
.asm_11d4c1
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld hl, $0005
	add hl, de
	ld a, [bc]
rept 2
	inc bc
endr
	push bc
.asm_11d4cf
	push af
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld hl, wd000
	add hl, de
	ld a, [wcd2d]
	ld [hli], a
	inc a
	ld [wcd2d], a
	ld a, [wcd2e]
	ld [hl], a
	pop hl
	ld de, $0008
	add hl, de
	pop af
	dec a
	jr nz, .asm_11d4cf
	ld hl, wcd2d
	xor a
	ld [hli], a
	inc [hl]
	pop bc
	pop hl
	pop af
	dec a
	jr nz, .asm_11d4c1
	pop af
	ld [rSVBK], a
	ret
; 11d4fe


Unknown_11d4fe:
; Pokemon sorted by kana.
; Notably, Rhydon is missing.

	dw Unknown_11d558
	dw Unknown_11d55f
	dw Unknown_11d565
	dw Unknown_11d56c
	dw Unknown_11d574
	dw Unknown_11d57f
	dw Unknown_11d58e
	dw Unknown_11d598
	dw Unknown_11d59f
	dw Unknown_11d5a3
	dw Unknown_11d5b2
	dw Unknown_11d5bb
	dw Unknown_11d5c0
	dw Unknown_11d5c8
	dw Unknown_11d5cb
	dw Unknown_11d5cd
	dw Unknown_11d5d1
	dw Unknown_11d5d4
	dw Unknown_11d5d6
	dw Unknown_11d5dc
	dw Unknown_11d5e7
	dw Unknown_11d5ea
	dw Unknown_11d5f7
	dw Unknown_11d5f9
	dw Unknown_11d5fc
	dw Unknown_11d5fe
	dw Unknown_11d60e
	dw Unknown_11d61d
	dw Unknown_11d62e
	dw Unknown_11d636
	dw Unknown_11d63e
	dw Unknown_11d649
	dw Unknown_11d64e
	dw Unknown_11d651
	dw Unknown_11d656
	dw Unknown_11d65a
	dw Unknown_11d660
	dw Unknown_11d662
	dw Unknown_11d665
	dw Unknown_11d66d
	dw Unknown_11d671
	dw Unknown_11d674
	dw Unknown_11d678
	dw Unknown_11d67a
	dw Unknown_11d67d

Unknown_11d558:	db EKANS, ARBOK, SEAKING, ARIADOS, CROCONAW, UNOWN, $ff
Unknown_11d55f:	db EEVEE, GEODUDE, SPINARAK, PILOSWINE, ONIX, $ff
Unknown_11d565:	db ARCANINE, SUDOWOODO, WEEPINBELL, VICTREEBEL, WOOPER, SWINUB, $ff
Unknown_11d56c:	db SKARMORY, AIPOM, ESPEON, HITMONCHAN, ELEKID, ELECTABUZZ, ENTEI, $ff
Unknown_11d574:	db FERALIGATR, FURRET, OCTILLERY, PRIMEAPE, SENTRET, STANTLER, SPEAROW, FEAROW, OMASTAR, OMANYTE, $ff
Unknown_11d57f:	db GROWLITHE, MACHAMP, DRAGONITE, PINSIR, SNORLAX, KABUTO, KABUTOPS, HITMONTOP, WARTORTLE, BLASTOISE, FARFETCH_D, CUBONE, MAROWAK, KANGASKHAN, $ff
Unknown_11d58e:	db SUNFLORA, CATERPIE, GYARADOS, RAPIDASH, NINETALES, GIRAFARIG, BELLOSSOM, KINGDRA, KINGLER, $ff
Unknown_11d598:	db GLOOM, PINECO, GLIGAR, KRABBY, GRANBULL, CROBAT, $ff
Unknown_11d59f:	db ABRA, GENGAR, TAUROS, $ff
Unknown_11d5a3:	db MAGIKARP, MAGNEMITE, GASTLY, HAUNTER, MACHOKE, KAKUNA, PSYDUCK, PHANPY, RATTATA, GOLDUCK, GOLBAT, GOLEM, GRAVELER, VENONAT, $ff
Unknown_11d5b2:	db RHYHORN, PUPITAR, CORSOLA, HITMONLEE, ZAPDOS, JOLTEON, SANDSHREW, SANDSLASH, $ff
Unknown_11d5bb:	db SEADRA, SHELLDER, VAPOREON, DEWGONG, $ff
Unknown_11d5c0:	db SUICUNE, STARMIE, SCYTHER, ZUBAT, BEEDRILL, HYPNO, DROWZEE, $ff
Unknown_11d5c8:	db SQUIRTLE, CELEBI, $ff
Unknown_11d5cb:	db WOBBUFFET, $ff
Unknown_11d5cd:	db DUGTRIO, HORSEA, EXEGGCUTE, $ff
Unknown_11d5d1:	db CHIKORITA, CHINCHOU, $ff
Unknown_11d5d4:	db SHUCKLE, $ff
Unknown_11d5d6:	db DIGLETT, REMORAID, DELIBIRD, HOUNDOUR, AMPHAROS, $ff
Unknown_11d5dc:	db DODUO, DODRIO, SMEARGLE, KOFFING, TENTACRUEL, TOGETIC, TOGEPI, GOLDEEN, METAPOD, DONPHAN, $ff
Unknown_11d5e7:	db ODDISH, EXEGGUTOR, $ff
Unknown_11d5ea:	db NIDOKING, NIDOQUEEN, NIDORAN_M, NIDORAN_F, NIDORINA, NIDORINO, MEOWTH, SNEASEL, POLIWHIRL, POLITOED, POLIWRATH, POLIWAG, $ff
Unknown_11d5f7:	db QUAGSIRE, $ff
Unknown_11d5f9:	db NATU, XATU, $ff
Unknown_11d5fc:	db DUNSPARCE, $ff
Unknown_11d5fe:	db SEEL, STEELIX, TYPHLOSION, DRAGONAIR, BUTTERFREE, SCIZOR, HOPPIP, BLISSEY, PARAS, PARASECT, QWILFISH, MR__MIME, TYROGUE, CLOYSTER, TYRANITAR, $ff
Unknown_11d60e:	db CLEFFA, WEEDLE, PIKACHU, CLEFABLE, PIDGEOT, PIDGEOTTO, PICHU, CLEFAIRY, CHARMANDER, STARYU, CYNDAQUIL, SUNKERN, TEDDIURSA, VOLTORB, $ff
Unknown_11d61d:	db MOLTRES, FLAREON, ALAKAZAM, MAGMAR, FORRETRESS, WIGGLYTUFF, IVYSAUR, BULBASAUR, VENUSAUR, AERODACTYL, MAGBY, IGGLYBUFF, UMBREON, ARTICUNO, JIGGLYPUFF, SNUBBULL, $ff
Unknown_11d62e:	db BAYLEEF, GRIMER, MUK, HERACROSS, HOUNDOOM, PERSIAN, LICKITUNG, $ff
Unknown_11d636:	db HO_OH, HOOTHOOT, PIDGEY, PONYTA, SKIPLOOM, PORYGON, PORYGON2, $ff
Unknown_11d63e:	db MAGCARGO, SLUGMA, QUILAVA, BELLSPROUT, WEEZING, MARILL, AZUMARILL, ELECTRODE, MANKEY, MANTINE, $ff
Unknown_11d649:	db DRATINI, MEW, MEWTWO, MILTANK, $ff
Unknown_11d64e:	db MISDREAVUS, SMOOCHUM, $ff
Unknown_11d651:	db MEGANIUM, DITTO, TENTACOOL, MAREEP, $ff
Unknown_11d656:	db FLAAFFY, VENOMOTH, TANGELA, $ff
Unknown_11d65a:	db SLOWKING, SLOWBRO, SLOWPOKE, MURKROW, YANMA, $ff
Unknown_11d660:	db KADABRA, $ff
Unknown_11d662:	db LARVITAR, NOCTOWL, $ff
Unknown_11d665:	db RAIKOU, RAICHU, CHANSEY, RATICATE, LAPRAS, VILEPLUME, LANTURN, $ff
Unknown_11d66d:	db CHARMELEON, CHARIZARD, URSARING, $ff
Unknown_11d671:	db JYNX, LUGIA, $ff
Unknown_11d674:	db MAGNETON, LEDIAN, LEDYBA, $ff
Unknown_11d678:	db VULPIX, $ff
Unknown_11d67a:	db JUMPLUFF, TOTODILE, MACHOP
Unknown_11d67d:	db $ff
; 11d67e

GFX_11d67e:
INCBIN "gfx/pokedex/select_start.2bpp"
; 11d6de

LZ_11d6de:
INCBIN "gfx/pokedex/slowpoke.2bpp.lz"
; 11da52

Strings_11da52: ; 11da52
	db "ポケモン@@"
	db "タイプ@@@"
	db "あいさつ@@"
	db "ひと@@@@"
	db "バトル@@@"
	db "こえ@@@@"
	db "かいわ@@@"
	db "きもち@@@"
	db "じょうたい@"
	db "せいかつ@@"
	db "しゅみ@@@"
	db "こうどう@@"
	db "じかん@@@"
	db "むすび@@@"
	db "あれこれ@@"
; 11daac

Unknown_11daac: ; 11daac
	dw Unknown_11dac8
	dw Unknown_11db58
	dw Unknown_11dc78
	dw Unknown_11dea0
	dw Unknown_11e0c8
	dw Unknown_11e2d8
	dw Unknown_11e4e8
	dw Unknown_11e710
	dw Unknown_11e920
	dw Unknown_11ea58
	dw Unknown_11eb90
	dw Unknown_11edb8
	dw Unknown_11eef0
	dw Unknown_11f100

Unknown_11dac8: ; 11dac8
	db "あく@@@", $26, $0, $0
	db "いわ@@@", $aa, $0, $0
	db "エスパー@", $da, $0, $0
	db "かくとう@", $4e, $1, $0
	db "くさ@@@", $ba, $1, $0
	db "ゴースト@", $e4, $1, $0
	db "こおり@@", $e6, $1, $0
	db "じめん@@", $68, $2, $0
	db "タイプ@@", $e8, $2, $0
	db "でんき@@", $8e, $3, $0
	db "どく@@@", $ae, $3, $0
	db "ドラゴン@", $bc, $3, $0
	db "ノーマル@", $22, $4, $0
	db "はがね@@", $36, $4, $0
	db "ひこう@@", $5e, $4, $0
	db "ほのお@@", $b2, $4, $0
	db "みず@@@", $f4, $4, $0
	db "むし@@@", $12, $5, $0

Unknown_11db58: ; 11db58
	db "ありがと@", $58, $0, $0
	db "ありがとう", $5a, $0, $0
	db "いくぜ!@", $80, $0, $0
	db "いくよ!@", $82, $0, $0
	db "いくわよ!", $84, $0, $0
	db "いやー@@", $a6, $0, $0
	db "おっす@@", $a, $1, $0
	db "おはつです", $22, $1, $0
	db "おめでとう", $2a, $1, $0
	db "ごめん@@", $f8, $1, $0
	db "ごめんよ@", $fa, $1, $0
	db "こらっ@@", $fc, $1, $0
	db "こんちは!", $a, $2, $0
	db "こんにちは", $10, $2, $0
	db "さようなら", $28, $2, $0
	db "サンキュー", $2e, $2, $0
	db "さんじょう", $30, $2, $0
	db "しっけい@", $48, $2, $0
	db "しつれい@", $4c, $2, $0
	db "じゃーね@", $6c, $2, $0
	db "すいません", $8c, $2, $0
	db "それじゃ@", $ca, $2, $0
	db "どうも@@", $a6, $3, $0
	db "なんじゃ@", $ee, $3, $0
	db "ハーイ@@", $2c, $4, $0
	db "はいはい@", $32, $4, $0
	db "バイバイ@", $34, $4, $0
	db "へイ@@@", $8a, $4, $0
	db "またね@@", $de, $4, $0
	db "もしもし@", $32, $5, $0
	db "やあ@@@", $3e, $5, $0
	db "やっほー@", $4e, $5, $0
	db "よう@@@", $62, $5, $0
	db "ようこそ@", $64, $5, $0
	db "よろしく@", $80, $5, $0
	db "らっしゃい", $94, $5, $0

Unknown_11dc78: ; 11dc78
	db "あいて@@", $1c, $0, $0
	db "あたし@@", $36, $0, $0
	db "あなた@@", $40, $0, $0
	db "あなたが@", $42, $0, $0
	db "あなたに@", $44, $0, $0
	db "あなたの@", $46, $0, $0
	db "あなたは@", $48, $0, $0
	db "あなたを@", $4a, $0, $0
	db "おかあさん", $e8, $0, $0
	db "おじいさん", $fc, $0, $0
	db "おじさん@", $2, $1, $0
	db "おとうさん", $e, $1, $0
	db "おとこのこ", $10, $1, $0
	db "おとな@@", $14, $1, $0
	db "おにいさん", $16, $1, $0
	db "おねえさん", $18, $1, $0
	db "おばあさん", $1c, $1, $0
	db "おばさん@", $20, $1, $0
	db "おれさま@", $34, $1, $0
	db "おんなのこ", $3a, $1, $0
	db "ガール@@", $40, $1, $0
	db "かぞく@@", $52, $1, $0
	db "かのじょ@", $72, $1, $0
	db "かれ@@@", $7c, $1, $0
	db "きみ@@@", $9a, $1, $0
	db "きみが@@", $9c, $1, $0
	db "きみに@@", $9e, $1, $0
	db "きみの@@", $a0, $1, $0
	db "きみは@@", $a2, $1, $0
	db "きみを@@", $a4, $1, $0
	db "ギャル@@", $ae, $1, $0
	db "きょうだい", $b2, $1, $0
	db "こども@@", $f0, $1, $0
	db "じぶん@@", $54, $2, $0
	db "じぶんが@", $56, $2, $0
	db "じぶんに@", $58, $2, $0
	db "じぶんの@", $5a, $2, $0
	db "じぶんは@", $5c, $2, $0
	db "じぶんを@", $5e, $2, $0
	db "だれ@@@", $18, $3, $0
	db "だれか@@", $1a, $3, $0
	db "だれが@@", $1c, $3, $0
	db "だれに@@", $1e, $3, $0
	db "だれの@@", $20, $3, $0
	db "だれも@@", $22, $3, $0
	db "だれを@@", $24, $3, $0
	db "ちゃん@@", $38, $3, $0
	db "ともだち@", $b8, $3, $0
	db "なかま@@", $d4, $3, $0
	db "ひと@@@", $62, $4, $0
	db "ボーイ@@", $98, $4, $0
	db "ボク@@@", $a0, $4, $0
	db "ボクが@@", $a2, $4, $0
	db "ボクに@@", $a4, $4, $0
	db "ボクの@@", $a6, $4, $0
	db "ボクは@@", $a8, $4, $0
	db "ボクを@@", $aa, $4, $0
	db "みんな@@", $4, $5, $0
	db "みんなが@", $6, $5, $0
	db "みんなに@", $8, $5, $0
	db "みんなの@", $a, $5, $0
	db "みんなは@", $c, $5, $0
	db "ライバル@", $8a, $5, $0
	db "わたし@@", $c2, $5, $0
	db "わたしが@", $c4, $5, $0
	db "わたしに@", $c6, $5, $0
	db "わたしの@", $c8, $5, $0
	db "わたしは@", $ca, $5, $0
	db "わたしを@", $cc, $5, $0

Unknown_11dea0: ; 11dea0
	db "あいしょう", $18, $0, $0
	db "いけ!@@", $88, $0, $0
	db "いちばん@", $96, $0, $0
	db "かくご@@", $4c, $1, $0
	db "かたせて@", $54, $1, $0
	db "かち@@@", $56, $1, $0
	db "かつ@@@", $58, $1, $0
	db "かった@@", $60, $1, $0
	db "かったら@", $62, $1, $0
	db "かって@@", $64, $1, $0
	db "かてない@", $66, $1, $0
	db "かてる@@", $68, $1, $0
	db "かなわない", $70, $1, $0
	db "きあい@@", $84, $1, $0
	db "きめた@@", $a8, $1, $0
	db "きりふだ@", $b6, $1, $0
	db "くらえ@@", $c2, $1, $0
	db "こい!@@", $da, $1, $0
	db "こうげき@", $e0, $1, $0
	db "こうさん@", $e2, $1, $0
	db "こんじょう", $8, $2, $0
	db "さいのう@", $16, $2, $0
	db "さくせん@", $1a, $2, $0
	db "さばき@@", $22, $2, $0
	db "しょうぶ@", $7e, $2, $0
	db "しょうり@", $80, $2, $0
	db "せめ@@@", $b4, $2, $0
	db "センス@@", $b6, $2, $0
	db "たいせん@", $e6, $2, $0
	db "たたかい@", $f6, $2, $0
	db "ちから@@", $32, $3, $0
	db "チャレンジ", $36, $3, $0
	db "つよい@@", $58, $3, $0
	db "つよすぎ@", $5a, $3, $0
	db "つらい@@", $5c, $3, $0
	db "つらかった", $5e, $3, $0
	db "てかげん@", $6c, $3, $0
	db "てき@@@", $6e, $3, $0
	db "てんさい@", $90, $3, $0
	db "でんせつ@", $94, $3, $0
	db "トレーナー", $c6, $3, $0
	db "にげ@@@", $4, $4, $0
	db "ぬるい@@", $10, $4, $0
	db "ねらう@@", $16, $4, $0
	db "バトル@@", $4a, $4, $0
	db "ファイト@", $72, $4, $0
	db "ふっかつ@", $78, $4, $0
	db "ポイント@", $94, $4, $0
	db "ポケモン@", $ac, $4, $0
	db "ほんき@@", $bc, $4, $0
	db "まいった!", $c4, $4, $0
	db "まけ@@@", $c8, $4, $0
	db "まけたら@", $ca, $4, $0
	db "まけて@@", $cc, $4, $0
	db "まける@@", $ce, $4, $0
	db "まもり@@", $ea, $4, $0
	db "みかた@@", $f2, $4, $0
	db "みとめない", $fe, $4, $0
	db "みとめる@", $0, $5, $0
	db "むてき@@", $16, $5, $0
	db "もらった!", $3c, $5, $0
	db "よゆう@@", $7a, $5, $0
	db "よわい@@", $82, $5, $0
	db "よわすぎ@", $84, $5, $0
	db "らくしょう", $8e, $5, $0
	db "りーダー@", $9e, $5, $0
	db "ルール@@", $a0, $5, $0
	db "レべル@@", $a6, $5, $0
	db "わざ@@@", $be, $5, $0

Unknown_11e0c8: ; 11e0c8
	db "!@@@@", $0, $0, $0
	db "!!@@@", $2, $0, $0
	db "!?@@@", $4, $0, $0
	db "?@@@@", $6, $0, $0
	db "…@@@@", $8, $0, $0
	db "…!@@@", $a, $0, $0
	db "………@@", $c, $0, $0
	db "ー@@@@", $e, $0, $0
	db "ーーー@@", $10, $0, $0
	db "あーあ@@", $14, $0, $0
	db "あーん@@", $16, $0, $0
	db "あははー@", $52, $0, $0
	db "あら@@@", $54, $0, $0
	db "いえ@@@", $72, $0, $0
	db "イエス@@", $74, $0, $0
	db "うう@@@", $ac, $0, $0
	db "うーん@@", $ae, $0, $0
	db "うおー!@", $b0, $0, $0
	db "うおりゃー", $b2, $0, $0
	db "うひょー@", $bc, $0, $0
	db "うふふ@@", $be, $0, $0
	db "うわー@@", $ca, $0, $0
	db "うわーん@", $cc, $0, $0
	db "ええ@@@", $d2, $0, $0
	db "えー@@@", $d4, $0, $0
	db "えーん@@", $d6, $0, $0
	db "えへへ@@", $dc, $0, $0
	db "おいおい@", $e0, $0, $0
	db "おお@@@", $e2, $0, $0
	db "おっと@@", $c, $1, $0
	db "がーん@@", $42, $1, $0
	db "キャー@@", $aa, $1, $0
	db "ギャー@@", $ac, $1, $0
	db "ぐふふふふ", $bc, $1, $0
	db "げっ@@@", $ce, $1, $0
	db "しくしく@", $3e, $2, $0
	db "ちえっ@@", $2e, $3, $0
	db "てへ@@@", $86, $3, $0
	db "ノー@@@", $20, $4, $0
	db "はあー@@", $2a, $4, $0
	db "はい@@@", $30, $4, $0
	db "はっはっは", $48, $4, $0
	db "ひいー@@", $56, $4, $0
	db "ひゃあ@@", $6a, $4, $0
	db "ふっふっふ", $7c, $4, $0
	db "ふにゃ@@", $7e, $4, $0
	db "ププ@@@", $80, $4, $0
	db "ふふん@@", $82, $4, $0
	db "ふん@@@", $88, $4, $0
	db "へっへっへ", $8e, $4, $0
	db "へへー@@", $90, $4, $0
	db "ほーほほほ", $9c, $4, $0
	db "ほら@@@", $b6, $4, $0
	db "まあ@@@", $c0, $4, $0
	db "むきー!!", $10, $5, $0
	db "むふー@@", $18, $5, $0
	db "むふふ@@", $1a, $5, $0
	db "むむ@@@", $1c, $5, $0
	db "よーし@@", $6a, $5, $0
	db "よし!@@", $72, $5, $0
	db "ラララ@@", $98, $5, $0
	db "わーい@@", $ac, $5, $0
	db "わーん!!", $b0, $5, $0
	db "ワォ@@@", $b2, $5, $0
	db "わっ!!@", $ce, $5, $0
	db "わははは!", $d0, $5, $0

Unknown_11e2d8: ; 11e2d8
	db "あのね@@", $50, $0, $0
	db "あんまり@", $6e, $0, $0
	db "いじわる@", $8e, $0, $0
	db "うそ@@@", $b6, $0, $0
	db "うむ@@@", $c4, $0, $0
	db "おーい@@", $e4, $0, $0
	db "おすすめ@", $6, $1, $0
	db "おばかさん", $1e, $1, $0
	db "かなり@@", $6e, $1, $0
	db "から@@@", $7a, $1, $0
	db "きぶん@@", $98, $1, $0
	db "けど@@@", $d6, $1, $0
	db "こそ@@@", $ea, $1, $0
	db "こと@@@", $ee, $1, $0
	db "さあ@@@", $12, $2, $0
	db "さっぱり@", $1e, $2, $0
	db "さて@@@", $20, $2, $0
	db "じゅうぶん", $72, $2, $0
	db "すぐ@@@", $94, $2, $0
	db "すごく@@", $98, $2, $0
	db "すこしは@", $9a, $2, $0
	db "すっっごい", $a0, $2, $0
	db "ぜーんぜん", $b0, $2, $0
	db "ぜったい@", $b2, $2, $0
	db "それで@@", $ce, $2, $0
	db "だけ@@@", $f2, $2, $0
	db "だって@@", $fc, $2, $0
	db "たぶん@@", $6, $3, $0
	db "たら@@@", $14, $3, $0
	db "ちょー@@", $3a, $3, $0
	db "ちょっと@", $3c, $3, $0
	db "ったら@@", $4e, $3, $0
	db "って@@@", $50, $3, $0
	db "ていうか@", $62, $3, $0
	db "でも@@@", $88, $3, $0
	db "どうしても", $9c, $3, $0
	db "とうぜん@", $a0, $3, $0
	db "どうぞ@@", $a2, $3, $0
	db "とりあえず", $be, $3, $0
	db "なあ@@@", $cc, $3, $0
	db "なんて@@", $f4, $3, $0
	db "なんでも@", $fc, $3, $0
	db "なんとか@", $fe, $3, $0
	db "には@@@", $8, $4, $0
	db "バッチり@", $46, $4, $0
	db "ばりばり@", $52, $4, $0
	db "ほど@@@", $b0, $4, $0
	db "ほんと@@", $be, $4, $0
	db "まさに@@", $d0, $4, $0
	db "マジ@@@", $d2, $4, $0
	db "マジで@@", $d4, $4, $0
	db "まったく@", $e4, $4, $0
	db "まで@@@", $e6, $4, $0
	db "まるで@@", $ec, $4, $0
	db "ムード@@", $e, $5, $0
	db "むしろ@@", $14, $5, $0
	db "めちゃ@@", $24, $5, $0
	db "めっぽう@", $28, $5, $0
	db "もう@@@", $2c, $5, $0
	db "モード@@", $2e, $5, $0
	db "もっと@@", $36, $5, $0
	db "もはや@@", $38, $5, $0
	db "やっと@@", $4a, $5, $0
	db "やっぱり@", $4c, $5, $0
	db "より@@@", $7c, $5, $0
	db "れば@@@", $a4, $5, $0

Unknown_11e4e8: ; 11e4e8
	db "あいたい@", $1a, $0, $0
	db "あそびたい", $32, $0, $0
	db "いきたい@", $7c, $0, $0
	db "うかれて@", $b4, $0, $0
	db "うれしい@", $c6, $0, $0
	db "うれしさ@", $c8, $0, $0
	db "エキサイト", $d8, $0, $0
	db "えらい@@", $de, $0, $0
	db "おかしい@", $ec, $0, $0
	db "ォッケー@", $8, $1, $0
	db "かえりたい", $48, $1, $0
	db "がっくし@", $5a, $1, $0
	db "かなしい@", $6c, $1, $0
	db "がんばって", $80, $1, $0
	db "きがしない", $86, $1, $0
	db "きがする@", $88, $1, $0
	db "ききたい@", $8a, $1, $0
	db "きになる@", $90, $1, $0
	db "きのせい@", $96, $1, $0
	db "きらい@@", $b4, $1, $0
	db "くやしい@", $be, $1, $0
	db "くやしさ@", $c0, $1, $0
	db "さみしい@", $24, $2, $0
	db "ざんねん@", $32, $2, $0
	db "しあわせ@", $36, $2, $0
	db "したい@@", $44, $2, $0
	db "したくない", $46, $2, $0
	db "しまった@", $64, $2, $0
	db "しょんぼり", $82, $2, $0
	db "すき@@@", $92, $2, $0
	db "だいきらい", $da, $2, $0
	db "たいくつ@", $dc, $2, $0
	db "だいじ@@", $de, $2, $0
	db "だいすき@", $e4, $2, $0
	db "たいへん@", $ea, $2, $0
	db "たのしい@", $0, $3, $0
	db "たのしすぎ", $2, $3, $0
	db "たべたい@", $8, $3, $0
	db "ダメダメ@", $e, $3, $0
	db "たりない@", $16, $3, $0
	db "ちくしょー", $34, $3, $0
	db "どうしよう", $9e, $3, $0
	db "ドキドキ@", $ac, $3, $0
	db "ナイス@@", $d0, $3, $0
	db "のみたい@", $26, $4, $0
	db "びっくり@", $60, $4, $0
	db "ふあん@@", $74, $4, $0
	db "ふらふら@", $86, $4, $0
	db "ほしい@@", $ae, $4, $0
	db "ボロボロ@", $b8, $4, $0
	db "まだまだ@", $e0, $4, $0
	db "まてない@", $e8, $4, $0
	db "まんぞく@", $f0, $4, $0
	db "みたい@@", $f8, $4, $0
	db "めずらしい", $22, $5, $0
	db "メラメラ@", $2a, $5, $0
	db "やだ@@@", $46, $5, $0
	db "やったー@", $48, $5, $0
	db "やばい@@", $50, $5, $0
	db "やばすぎる", $52, $5, $0
	db "やられた@", $54, $5, $0
	db "やられて@", $56, $5, $0
	db "よかった@", $6e, $5, $0
	db "ラブラブ@", $96, $5, $0
	db "ロマン@@", $a8, $5, $0
	db "ろんがい@", $aa, $5, $0
	db "わから@@", $b4, $5, $0
	db "わかり@@", $b6, $5, $0
	db "わくわく@", $ba, $5, $0

Unknown_11e710: ; 11e710
	db "あつい@@", $38, $0, $0
	db "あった@@", $3a, $0, $0
	db "あり@@@", $56, $0, $0
	db "ある@@@", $5e, $0, $0
	db "あわてて@", $6a, $0, $0
	db "いい@@@", $70, $0, $0
	db "いか@@@", $76, $0, $0
	db "イカス@@", $78, $0, $0
	db "いきおい@", $7a, $0, $0
	db "いける@@", $8a, $0, $0
	db "いじょう@", $8c, $0, $0
	db "いそがしい", $90, $0, $0
	db "いっしょに", $9a, $0, $0
	db "いっぱい@", $9c, $0, $0
	db "いない@@", $a0, $0, $0
	db "いや@@@", $a4, $0, $0
	db "いる@@@", $a8, $0, $0
	db "うまい@@", $c0, $0, $0
	db "うまく@@", $c2, $0, $0
	db "おおきい@", $e6, $0, $0
	db "おくれ@@", $f2, $0, $0
	db "おしい@@", $fa, $0, $0
	db "おもしろい", $2c, $1, $0
	db "おもしろく", $2e, $1, $0
	db "かっこいい", $5c, $1, $0
	db "かわいい@", $7e, $1, $0
	db "かんぺき@", $82, $1, $0
	db "けっこう@", $d0, $1, $0
	db "げんき@@", $d8, $1, $0
	db "こわい@@", $6, $2, $0
	db "さいこう@", $14, $2, $0
	db "さむい@@", $26, $2, $0
	db "さわやか@", $2c, $2, $0
	db "しかたない", $38, $2, $0
	db "すごい@@", $96, $2, $0
	db "すごすぎ@", $9c, $2, $0
	db "すてき@@", $a4, $2, $0
	db "たいした@", $e0, $2, $0
	db "だいじょぶ", $e2, $2, $0
	db "たかい@@", $ec, $2, $0
	db "ただしい@", $f8, $2, $0
	db "だめ@@@", $c, $3, $0
	db "ちいさい@", $2c, $3, $0
	db "ちがう@@", $30, $3, $0
	db "つかれ@@", $48, $3, $0
	db "とくい@@", $b0, $3, $0
	db "とまらない", $b6, $3, $0
	db "ない@@@", $ce, $3, $0
	db "なかった@", $d2, $3, $0
	db "なし@@@", $d8, $3, $0
	db "なって@@", $dc, $3, $0
	db "はやい@@", $50, $4, $0
	db "ひかる@@", $5a, $4, $0
	db "ひくい@@", $5c, $4, $0
	db "ひどい@@", $64, $4, $0
	db "ひとりで@", $66, $4, $0
	db "ひま@@@", $68, $4, $0
	db "ふそく@@", $76, $4, $0
	db "へた@@@", $8c, $4, $0
	db "まちがって", $e2, $4, $0
	db "やさしい@", $42, $5, $0
	db "よく@@@", $70, $5, $0
	db "よわって@", $86, $5, $0
	db "らく@@@", $8c, $5, $0
	db "らしい@@", $90, $5, $0
	db "わるい@@", $d4, $5, $0

Unknown_11e920: ; 11e920
	db "アルバイト", $64, $0, $0
	db "うち@@@", $ba, $0, $0
	db "おかね@@", $ee, $0, $0
	db "おこづかい", $f4, $0, $0
	db "おふろ@@", $24, $1, $0
	db "がっこう@", $5e, $1, $0
	db "きねん@@", $92, $1, $0
	db "グループ@", $c6, $1, $0
	db "ゲット@@", $d2, $1, $0
	db "こうかん@", $de, $1, $0
	db "しごと@@", $40, $2, $0
	db "しゅぎょう", $74, $2, $0
	db "じゅぎょう", $76, $2, $0
	db "じゅく@@", $78, $2, $0
	db "しんか@@", $88, $2, $0
	db "ずかん@@", $90, $2, $0
	db "せいかつ@", $ae, $2, $0
	db "せんせい@", $b8, $2, $0
	db "センター@", $ba, $2, $0
	db "タワー@@", $28, $3, $0
	db "つうしん@", $40, $3, $0
	db "テスト@@", $7e, $3, $0
	db "テレビ@@", $8c, $3, $0
	db "でんわ@@", $96, $3, $0
	db "どうぐ@@", $9a, $3, $0
	db "トレード@", $c4, $3, $0
	db "なまえ@@", $e8, $3, $0
	db "ニュース@", $a, $4, $0
	db "にんき@@", $c, $4, $0
	db "パーティー", $2e, $4, $0
	db "べんきょう", $92, $4, $0
	db "マシン@@", $d6, $4, $0
	db "めいし@@", $1e, $5, $0
	db "メッセージ", $26, $5, $0
	db "もようがえ", $3a, $5, $0
	db "ゆめ@@@", $5a, $5, $0
	db "ようちえん", $66, $5, $0
	db "ラジォ@@", $92, $5, $0
	db "ワールド@", $ae, $5, $0

Unknown_11ea58: ; 11ea58
	db "アイドル@", $1e, $0, $0
	db "アニメ@@", $4c, $0, $0
	db "うた@@@", $b8, $0, $0
	db "えいが@@", $d0, $0, $0
	db "おかし@@", $ea, $0, $0
	db "おしゃべり", $4, $1, $0
	db "おままごと", $28, $1, $0
	db "おもちゃ@", $30, $1, $0
	db "おんがく@", $38, $1, $0
	db "カード@@", $3e, $1, $0
	db "かいもの@", $46, $1, $0
	db "グルメ@@", $c8, $1, $0
	db "ゲーム@@", $cc, $1, $0
	db "ざっし@@", $1c, $2, $0
	db "さんぽ@@", $34, $2, $0
	db "じてんしゃ", $50, $2, $0
	db "しゅみ@@", $7a, $2, $0
	db "スポーツ@", $a8, $2, $0
	db "ダイエット", $d8, $2, $0
	db "たからもの", $f0, $2, $0
	db "たび@@@", $4, $3, $0
	db "ダンス@@", $2a, $3, $0
	db "つり@@@", $60, $3, $0
	db "デート@@", $6a, $3, $0
	db "でんしゃ@", $92, $3, $0
	db "ぬいぐるみ", $e, $4, $0
	db "パソコン@", $3e, $4, $0
	db "はな@@@", $4c, $4, $0
	db "ヒーロー@", $58, $4, $0
	db "ひるね@@", $6e, $4, $0
	db "ヒロイン@", $70, $4, $0
	db "ぼうけん@", $96, $4, $0
	db "ボード@@", $9a, $4, $0
	db "ボール@@", $9e, $4, $0
	db "ほん@@@", $ba, $4, $0
	db "マンガ@@", $ee, $4, $0
	db "やくそく@", $40, $5, $0
	db "やすみ@@", $44, $5, $0
	db "よてい@@", $74, $5, $0

Unknown_11eb90: ; 11eb90
	db "あう@@@", $20, $0, $0
	db "あきらめ@", $24, $0, $0
	db "あげる@@", $28, $0, $0
	db "あせる@@", $2e, $0, $0
	db "あそび@@", $30, $0, $0
	db "あそぶ@@", $34, $0, $0
	db "あつめ@@", $3e, $0, $0
	db "あるき@@", $60, $0, $0
	db "あるく@@", $62, $0, $0
	db "いく@@@", $7e, $0, $0
	db "いけ@@@", $86, $0, $0
	db "おき@@@", $f0, $0, $0
	db "おこり@@", $f6, $0, $0
	db "おこる@@", $f8, $0, $0
	db "おしえ@@", $fe, $0, $0
	db "おしえて@", $0, $1, $0
	db "おねがい@", $1a, $1, $0
	db "おぼえ@@", $26, $1, $0
	db "かえる@@", $4a, $1, $0
	db "がまん@@", $74, $1, $0
	db "きく@@@", $8c, $1, $0
	db "きたえ@@", $8e, $1, $0
	db "きめ@@@", $a6, $1, $0
	db "くる@@@", $c4, $1, $0
	db "さがし@@", $18, $2, $0
	db "さわぎ@@", $2a, $2, $0
	db "した@@@", $42, $2, $0
	db "しって@@", $4a, $2, $0
	db "して@@@", $4e, $2, $0
	db "しない@@", $52, $2, $0
	db "しまう@@", $60, $2, $0
	db "じまん@@", $66, $2, $0
	db "しらない@", $84, $2, $0
	db "しる@@@", $86, $2, $0
	db "しんじて@", $8a, $2, $0
	db "する@@@", $aa, $2, $0
	db "たべる@@", $a, $3, $0
	db "つかう@@", $42, $3, $0
	db "つかえ@@", $44, $3, $0
	db "つかって@", $46, $3, $0
	db "できない@", $70, $3, $0
	db "できる@@", $72, $3, $0
	db "でない@@", $84, $3, $0
	db "でる@@@", $8a, $3, $0
	db "なげる@@", $d6, $3, $0
	db "なやみ@@", $ea, $3, $0
	db "ねられ@@", $18, $4, $0
	db "ねる@@@", $1a, $4, $0
	db "のがし@@", $24, $4, $0
	db "のむ@@@", $28, $4, $0
	db "はしり@@", $3a, $4, $0
	db "はしる@@", $3c, $4, $0
	db "はたらき@", $40, $4, $0
	db "はたらく@", $42, $4, $0
	db "はまって@", $4e, $4, $0
	db "ぶつけ@@", $7a, $4, $0
	db "ほめ@@@", $b4, $4, $0
	db "みせて@@", $f6, $4, $0
	db "みて@@@", $fc, $4, $0
	db "みる@@@", $2, $5, $0
	db "めざす@@", $20, $5, $0
	db "もって@@", $34, $5, $0
	db "ゆずる@@", $58, $5, $0
	db "ゆるす@@", $5c, $5, $0
	db "ゆるせ@@", $5e, $5, $0
	db "られない@", $9a, $5, $0
	db "られる@@", $9c, $5, $0
	db "わかる@@", $b8, $5, $0
	db "わすれ@@", $c0, $5, $0

Unknown_11edb8: ; 11edb8
	db "あき@@@", $22, $0, $0
	db "あさ@@@", $2a, $0, $0
	db "あした@@", $2c, $0, $0
	db "いちにち@", $94, $0, $0
	db "いつか@@", $98, $0, $0
	db "いつも@@", $9e, $0, $0
	db "いま@@@", $a2, $0, $0
	db "えいえん@", $ce, $0, $0
	db "おととい@", $12, $1, $0
	db "おわり@@", $36, $1, $0
	db "かようび@", $78, $1, $0
	db "きのう@@", $94, $1, $0
	db "きょう@@", $b0, $1, $0
	db "きんようび", $b8, $1, $0
	db "げつようび", $d4, $1, $0
	db "このあと@", $f4, $1, $0
	db "このまえ@", $f6, $1, $0
	db "こんど@@", $c, $2, $0
	db "じかん@@", $3c, $2, $0
	db "じゅうねん", $70, $2, $0
	db "すいようび", $8e, $2, $0
	db "スタート@", $9e, $2, $0
	db "ずっと@@", $a2, $2, $0
	db "ストップ@", $a6, $2, $0
	db "そのうち@", $c4, $2, $0
	db "ついに@@", $3e, $3, $0
	db "つぎ@@@", $4a, $3, $0
	db "どようび@", $ba, $3, $0
	db "なつ@@@", $da, $3, $0
	db "にちようび", $6, $4, $0
	db "はじめ@@", $38, $4, $0
	db "はる@@@", $54, $4, $0
	db "ひる@@@", $6c, $4, $0
	db "ふゆ@@@", $84, $4, $0
	db "まいにち@", $c6, $4, $0
	db "もくようび", $30, $5, $0
	db "よなか@@", $76, $5, $0
	db "よる@@@", $7e, $5, $0
	db "らいしゅう", $88, $5, $0

Unknown_11eef0: ; 11eef0
	db "いたします", $92, $0, $0
	db "おります@", $32, $1, $0
	db "か!?@@", $3c, $1, $0
	db "かい?@@", $44, $1, $0
	db "かしら?@", $50, $1, $0
	db "かな?@@", $6a, $1, $0
	db "かも@@@", $76, $1, $0
	db "くれ@@@", $ca, $1, $0
	db "ございます", $e8, $1, $0
	db "しがち@@", $3a, $2, $0
	db "します@@", $62, $2, $0
	db "じゃ@@@", $6a, $2, $0
	db "じゃん@@", $6e, $2, $0
	db "しよう@@", $7c, $2, $0
	db "ぜ!@@@", $ac, $2, $0
	db "ぞ!@@@", $bc, $2, $0
	db "た@@@@", $d4, $2, $0
	db "だ@@@@", $d6, $2, $0
	db "だからね@", $ee, $2, $0
	db "だぜ@@@", $f4, $2, $0
	db "だった@@", $fa, $2, $0
	db "だね@@@", $fe, $2, $0
	db "だよ@@@", $10, $3, $0
	db "だよねー!", $12, $3, $0
	db "だわ@@@", $26, $3, $0
	db "ッス@@@", $4c, $3, $0
	db "ってかんじ", $52, $3, $0
	db "っぱなし@", $54, $3, $0
	db "つもり@@", $56, $3, $0
	db "ていない@", $64, $3, $0
	db "ている@@", $66, $3, $0
	db "でーす!@", $68, $3, $0
	db "でした@@", $74, $3, $0
	db "でしょ?@", $76, $3, $0
	db "でしょー!", $78, $3, $0
	db "です@@@", $7a, $3, $0
	db "ですか?@", $7c, $3, $0
	db "ですよ@@", $80, $3, $0
	db "ですわ@@", $82, $3, $0
	db "どうなの?", $a4, $3, $0
	db "どうよ?@", $a8, $3, $0
	db "とかいって", $aa, $3, $0
	db "なの@@@", $e0, $3, $0
	db "なのか@@", $e2, $3, $0
	db "なのだ@@", $e4, $3, $0
	db "なのよ@@", $e6, $3, $0
	db "なんだね@", $f2, $3, $0
	db "なんです@", $f8, $3, $0
	db "なんてね@", $fa, $3, $0
	db "ね@@@@", $12, $4, $0
	db "ねー@@@", $14, $4, $0
	db "の@@@@", $1c, $4, $0
	db "の?@@@", $1e, $4, $0
	db "ばっかり@", $44, $4, $0
	db "まーす!@", $c2, $4, $0
	db "ます@@@", $d8, $4, $0
	db "ますわ@@", $da, $4, $0
	db "ません@@", $dc, $4, $0
	db "みたいな@", $fa, $4, $0
	db "よ!@@@", $60, $5, $0
	db "よー@@@", $68, $5, $0
	db "よーん@@", $6c, $5, $0
	db "よね@@@", $78, $5, $0
	db "るよ@@@", $a2, $5, $0
	db "わけ@@@", $bc, $5, $0
	db "わよ!@@", $d2, $5, $0

Unknown_11f100: ; 11f100
	db "ああ@@@", $12, $0, $0
	db "あっち@@", $3c, $0, $0
	db "あの@@@", $4e, $0, $0
	db "ありゃ@@", $5c, $0, $0
	db "あれ@@@", $66, $0, $0
	db "あれは@@", $68, $0, $0
	db "あんな@@", $6c, $0, $0
	db "こう@@@", $dc, $1, $0
	db "こっち@@", $ec, $1, $0
	db "この@@@", $f2, $1, $0
	db "こりゃ@@", $fe, $1, $0
	db "これ@@@", $0, $2, $0
	db "これだ!@", $2, $2, $0
	db "これは@@", $4, $2, $0
	db "こんな@@", $e, $2, $0
	db "そう@@@", $be, $2, $0
	db "そっち@@", $c0, $2, $0
	db "その@@@", $c2, $2, $0
	db "そりゃ@@", $c6, $2, $0
	db "それ@@@", $c8, $2, $0
	db "それだ!@", $cc, $2, $0
	db "それは@@", $d0, $2, $0
	db "そんな@@", $d2, $2, $0
	db "どう@@@", $98, $3, $0
	db "どっち@@", $b2, $3, $0
	db "どの@@@", $b4, $3, $0
	db "どりゃ@@", $c0, $3, $0
	db "どれ@@@", $c2, $3, $0
	db "どれを@@", $c8, $3, $0
	db "どんな@@", $ca, $3, $0
	db "なに@@@", $de, $3, $0
	db "なんか@@", $ec, $3, $0
	db "なんだ@@", $f0, $3, $0
	db "なんで@@", $f6, $3, $0
	db "なんなんだ", $0, $4, $0
	db "なんの@@", $2, $4, $0
; 11f220

Unknown_11f220:
	db $12, $01, $24, $02
	db $45, $05, $45, $05
	db $42, $05, $42, $05
	db $45, $05, $42, $05
	db $27, $03, $27, $03
	db $45, $05, $27, $03
	db $42, $05, $24, $02

Unknown_11f23c:
	db $12, $00, $2f, $00
	db $70, $00, $1e, $00
	db $ac, $00, $11, $00
	db $ce, $00, $09, $00
	db $e0, $00, $2e, $00
	db $3c, $01, $24, $00
	db $84, $01, $1b, $00
	db $ba, $01, $09, $00
	db $cc, $01, $07, $00
	db $da, $01, $1c, $00
	db $12, $02, $12, $00
	db $36, $02, $2b, $00
	db $8c, $02, $10, $00
	db $ac, $02, $08, $00
	db $bc, $02, $0c, $00
	db $d4, $02, $2c, $00
	db $2c, $03, $09, $00
	db $3e, $03, $12, $00
	db $62, $03, $1b, $00
	db $98, $03, $1a, $00
	db $cc, $03, $1c, $00
	db $04, $04, $05, $00
	db $0e, $04, $02, $00
	db $12, $04, $05, $00
	db $1c, $04, $07, $00
	db $2a, $04, $16, $00
	db $56, $04, $0e, $00
	db $72, $04, $0c, $00
	db $8a, $04, $05, $00
	db $94, $04, $16, $00
	db $c0, $04, $19, $00
	db $f2, $04, $0e, $00
	db $0e, $05, $08, $00
	db $1e, $05, $07, $00
	db $2c, $05, $09, $00
	db $3e, $05, $0d, $00
	db $58, $05, $04, $00
	db $60, $05, $14, $00
	db $88, $05, $0b, $00
	db $9e, $05, $01, $00
	db $a0, $05, $02, $00
	db $a4, $05, $02, $00
	db $a8, $05, $02, $00
	db $ac, $05, $15, $00
	db $00, $00, $09, $00

Unknown_11f2f0:
	db $00, $01, $01, $00, $00, $01
	db $00, $01, $00, $00, $01, $00
	db $00, $01, $00, $00, $00, $01
	db $00, $00, $01, $00, $00, $00
	db $01, $01, $00, $01, $01, $00
	db $00, $00, $01, $01, $01, $00
	db $00, $00, $01, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $01, $00
	db $01, $00, $01, $00, $00, $01
	db $01, $01, $00, $00, $00, $01


Unknown_11f332:
	dw Unknown_11f338
	dw Unknown_11f36a
	dw Unknown_11f39c

Unknown_11f338: ; 11f338
	dw UnknownText_0x11f42e
	dw UnknownText_0x11f43d
	dw UnknownText_0x11f44c
	dw UnknownText_0x11f45b
	dw UnknownText_0x11f46a
	dw UnknownText_0x11f479
	dw UnknownText_0x11f488
	dw UnknownText_0x11f497
	dw UnknownText_0x11f4a6
	dw UnknownText_0x11f4b5
	dw UnknownText_0x11f4c4
	dw UnknownText_0x11f4d3
	dw UnknownText_0x11f4e2
	dw UnknownText_0x11f4f1
	dw UnknownText_0x11f500
	dw UnknownText_0x11f50f
	dw UnknownText_0x11f51e
	dw UnknownText_0x11f52d
	dw UnknownText_0x11f53c
	dw UnknownText_0x11f54b
	dw UnknownText_0x11f55a
	dw UnknownText_0x11f569
	dw UnknownText_0x11f578
	dw UnknownText_0x11f587
	dw UnknownText_0x11f596

Unknown_11f36a: ; 11f36a
	dw UnknownText_0x11f433
	dw UnknownText_0x11f442
	dw UnknownText_0x11f451
	dw UnknownText_0x11f460
	dw UnknownText_0x11f46f
	dw UnknownText_0x11f47e
	dw UnknownText_0x11f48d
	dw UnknownText_0x11f49c
	dw UnknownText_0x11f4ab
	dw UnknownText_0x11f4ba
	dw UnknownText_0x11f4c9
	dw UnknownText_0x11f4d8
	dw UnknownText_0x11f4e7
	dw UnknownText_0x11f4f6
	dw UnknownText_0x11f505
	dw UnknownText_0x11f514
	dw UnknownText_0x11f523
	dw UnknownText_0x11f532
	dw UnknownText_0x11f541
	dw UnknownText_0x11f550
	dw UnknownText_0x11f55f
	dw UnknownText_0x11f56e
	dw UnknownText_0x11f57d
	dw UnknownText_0x11f58c
	dw UnknownText_0x11f59b

Unknown_11f39c: ; 11f39c
	dw UnknownText_0x11f438
	dw UnknownText_0x11f447
	dw UnknownText_0x11f456
	dw UnknownText_0x11f465
	dw UnknownText_0x11f474
	dw UnknownText_0x11f483
	dw UnknownText_0x11f492
	dw UnknownText_0x11f4a1
	dw UnknownText_0x11f4b0
	dw UnknownText_0x11f4bf
	dw UnknownText_0x11f4ce
	dw UnknownText_0x11f4dd
	dw UnknownText_0x11f4ec
	dw UnknownText_0x11f4fb
	dw UnknownText_0x11f50a
	dw UnknownText_0x11f519
	dw UnknownText_0x11f528
	dw UnknownText_0x11f537
	dw UnknownText_0x11f546
	dw UnknownText_0x11f555
	dw UnknownText_0x11f564
	dw UnknownText_0x11f573
	dw UnknownText_0x11f582
	dw UnknownText_0x11f591
	dw UnknownText_0x11f5a0


Unknown_11f3ce:
	dw Unknown_11f3d4
	dw Unknown_11f3f2
	dw Unknown_11f410

Unknown_11f3d4: ; 11f3d4
	dw UnknownText_0x11f5a5
	dw UnknownText_0x11f5b4
	dw UnknownText_0x11f5c3
	dw UnknownText_0x11f5d2
	dw UnknownText_0x11f5e1
	dw UnknownText_0x11f5f0
	dw UnknownText_0x11f5ff
	dw UnknownText_0x11f60e
	dw UnknownText_0x11f61d
	dw UnknownText_0x11f62c
	dw UnknownText_0x11f63b
	dw UnknownText_0x11f64a
	dw UnknownText_0x11f659
	dw UnknownText_0x11f668
	dw UnknownText_0x11f677

Unknown_11f3f2: ; 11f3f2
	dw UnknownText_0x11f5aa
	dw UnknownText_0x11f5b9
	dw UnknownText_0x11f5c8
	dw UnknownText_0x11f5d7
	dw UnknownText_0x11f5e6
	dw UnknownText_0x11f5f5
	dw UnknownText_0x11f604
	dw UnknownText_0x11f613
	dw UnknownText_0x11f622
	dw UnknownText_0x11f631
	dw UnknownText_0x11f640
	dw UnknownText_0x11f64f
	dw UnknownText_0x11f65e
	dw UnknownText_0x11f66d
	dw UnknownText_0x11f67c

Unknown_11f410: ; 11f410
	dw UnknownText_0x11f5af
	dw UnknownText_0x11f5be
	dw UnknownText_0x11f5cd
	dw UnknownText_0x11f5dc
	dw UnknownText_0x11f5eb
	dw UnknownText_0x11f5fa
	dw UnknownText_0x11f609
	dw UnknownText_0x11f618
	dw UnknownText_0x11f627
	dw UnknownText_0x11f636
	dw UnknownText_0x11f645
	dw UnknownText_0x11f654
	dw UnknownText_0x11f663
	dw UnknownText_0x11f672
	dw UnknownText_0x11f681


UnknownText_0x11f42e: ; 0x11f42e
	text_jump UnknownText_0x1ec000
	db "@"

UnknownText_0x11f433: ; 0x11f433
	text_jump UnknownText_0x1ec03b
	db "@"

UnknownText_0x11f438: ; 0x11f438
	text_jump UnknownText_0x1ec060
	db "@"

UnknownText_0x11f43d: ; 0x11f43d
	text_jump UnknownText_0x1ec080
	db "@"

UnknownText_0x11f442: ; 0x11f442
	text_jump UnknownText_0x1ec0a3
	db "@"

UnknownText_0x11f447: ; 0x11f447
	text_jump UnknownText_0x1ec0c4
	db "@"

UnknownText_0x11f44c: ; 0x11f44c
	text_jump UnknownText_0x1ec0e1
	db "@"

UnknownText_0x11f451: ; 0x11f451
	text_jump UnknownText_0x1ec108
	db "@"

UnknownText_0x11f456: ; 0x11f456
	text_jump UnknownText_0x1ec12a
	db "@"

UnknownText_0x11f45b: ; 0x11f45b
	text_jump UnknownText_0x1ec14d
	db "@"

UnknownText_0x11f460: ; 0x11f460
	text_jump UnknownText_0x1ec16f
	db "@"

UnknownText_0x11f465: ; 0x11f465
	text_jump UnknownText_0x1ec190
	db "@"

UnknownText_0x11f46a: ; 0x11f46a
	text_jump UnknownText_0x1ec1ae
	db "@"

UnknownText_0x11f46f: ; 0x11f46f
	text_jump UnknownText_0x1ec1d0
	db "@"

UnknownText_0x11f474: ; 0x11f474
	text_jump UnknownText_0x1ec1f4
	db "@"

UnknownText_0x11f479: ; 0x11f479
	text_jump UnknownText_0x1ec216
	db "@"

UnknownText_0x11f47e: ; 0x11f47e
	text_jump UnknownText_0x1ec238
	db "@"

UnknownText_0x11f483: ; 0x11f483
	text_jump UnknownText_0x1ec259
	db "@"

UnknownText_0x11f488: ; 0x11f488
	text_jump UnknownText_0x1ec27b
	db "@"

UnknownText_0x11f48d: ; 0x11f48d
	text_jump UnknownText_0x1ec2a0
	db "@"

UnknownText_0x11f492: ; 0x11f492
	text_jump UnknownText_0x1ec2c0
	db "@"

UnknownText_0x11f497: ; 0x11f497
	text_jump UnknownText_0x1ec2d9
	db "@"

UnknownText_0x11f49c: ; 0x11f49c
	text_jump UnknownText_0x1ec2fe
	db "@"

UnknownText_0x11f4a1: ; 0x11f4a1
	text_jump UnknownText_0x1ec320
	db "@"

UnknownText_0x11f4a6: ; 0x11f4a6
	text_jump UnknownText_0x1ec33f
	db "@"

UnknownText_0x11f4ab: ; 0x11f4ab
	text_jump UnknownText_0x1ec36c
	db "@"

UnknownText_0x11f4b0: ; 0x11f4b0
	text_jump UnknownText_0x1ec389
	db "@"

UnknownText_0x11f4b5: ; 0x11f4b5
	text_jump UnknownText_0x1ec3ad
	db "@"

UnknownText_0x11f4ba: ; 0x11f4ba
	text_jump UnknownText_0x1ec3c5
	db "@"

UnknownText_0x11f4bf: ; 0x11f4bf
	text_jump UnknownText_0x1ec3e5
	db "@"

UnknownText_0x11f4c4: ; 0x11f4c4
	text_jump UnknownText_0x1ec402
	db "@"

UnknownText_0x11f4c9: ; 0x11f4c9
	text_jump UnknownText_0x1ec411
	db "@"

UnknownText_0x11f4ce: ; 0x11f4ce
	text_jump UnknownText_0x1ec41f
	db "@"

UnknownText_0x11f4d3: ; 0x11f4d3
	text_jump UnknownText_0x1ec42e
	db "@"

UnknownText_0x11f4d8: ; 0x11f4d8
	text_jump UnknownText_0x1ec461
	db "@"

UnknownText_0x11f4dd: ; 0x11f4dd
	text_jump UnknownText_0x1ec4a0
	db "@"

UnknownText_0x11f4e2: ; 0x11f4e2
	text_jump UnknownText_0x1ec4d6
	db "@"

UnknownText_0x11f4e7: ; 0x11f4e7
	text_jump UnknownText_0x1ec4f5
	db "@"

UnknownText_0x11f4ec: ; 0x11f4ec
	text_jump UnknownText_0x1ec512
	db "@"

UnknownText_0x11f4f1: ; 0x11f4f1
	text_jump UnknownText_0x1ec532
	db "@"

UnknownText_0x11f4f6: ; 0x11f4f6
	text_jump UnknownText_0x1ec54b
	db "@"

UnknownText_0x11f4fb: ; 0x11f4fb
	text_jump UnknownText_0x1ec565
	db "@"

UnknownText_0x11f500: ; 0x11f500
	text_jump UnknownText_0x1ec580
	db "@"

UnknownText_0x11f505: ; 0x11f505
	text_jump UnknownText_0x1ec59d
	db "@"

UnknownText_0x11f50a: ; 0x11f50a
	text_jump UnknownText_0x1ec5b5
	db "@"

UnknownText_0x11f50f: ; 0x11f50f
	text_jump UnknownText_0x1ec5d3
	db "@"

UnknownText_0x11f514: ; 0x11f514
	text_jump UnknownText_0x1ec5ee
	db "@"

UnknownText_0x11f519: ; 0x11f519
	text_jump UnknownText_0x1ec60d
	db "@"

UnknownText_0x11f51e: ; 0x11f51e
	text_jump UnknownText_0x1ec631
	db "@"

UnknownText_0x11f523: ; 0x11f523
	text_jump UnknownText_0x1ec651
	db "@"

UnknownText_0x11f528: ; 0x11f528
	text_jump UnknownText_0x1ec68f
	db "@"

UnknownText_0x11f52d: ; 0x11f52d
	text_jump UnknownText_0x1ec6b1
	db "@"

UnknownText_0x11f532: ; 0x11f532
	text_jump UnknownText_0x1ec6d0
	db "@"

UnknownText_0x11f537: ; 0x11f537
	text_jump UnknownText_0x1ec708
	db "@"

UnknownText_0x11f53c: ; 0x11f53c
	text_jump UnknownText_0x1ec720
	db "@"

UnknownText_0x11f541: ; 0x11f541
	text_jump UnknownText_0x1ec73e
	db "@"

UnknownText_0x11f546: ; 0x11f546
	text_jump UnknownText_0x1ec75b
	db "@"

UnknownText_0x11f54b: ; 0x11f54b
	text_jump UnknownText_0x1ec77f
	db "@"

UnknownText_0x11f550: ; 0x11f550
	text_jump UnknownText_0x1ec798
	db "@"

UnknownText_0x11f555: ; 0x11f555
	text_jump UnknownText_0x1ec7bb
	db "@"

UnknownText_0x11f55a: ; 0x11f55a
	text_jump UnknownText_0x1ec7d8
	db "@"

UnknownText_0x11f55f: ; 0x11f55f
	text_jump UnknownText_0x1ec818
	db "@"

UnknownText_0x11f564: ; 0x11f564
	text_jump UnknownText_0x1ec837
	db "@"

UnknownText_0x11f569: ; 0x11f569
	text_jump UnknownText_0x1ec858
	db "@"

UnknownText_0x11f56e: ; 0x11f56e
	text_jump UnknownText_0x1ec876
	db "@"

UnknownText_0x11f573: ; 0x11f573
	text_jump UnknownText_0x1ec898
	db "@"

UnknownText_0x11f578: ; 0x11f578
	text_jump UnknownText_0x1ec8b1
	db "@"

UnknownText_0x11f57d: ; 0x11f57d
	text_jump UnknownText_0x1ec8d5
	db "@"

UnknownText_0x11f582: ; 0x11f582
	text_jump UnknownText_0x1ec8f0
	db "@"

UnknownText_0x11f587: ; 0x11f587
	text_jump UnknownText_0x1ec911
	db "@"

UnknownText_0x11f58c: ; 0x11f58c
	text_jump UnknownText_0x1ec928
	db "@"

UnknownText_0x11f591: ; 0x11f591
	text_jump UnknownText_0x1ec949
	db "@"

UnknownText_0x11f596: ; 0x11f596
	text_jump UnknownText_0x1ec969
	db "@"

UnknownText_0x11f59b: ; 0x11f59b
	text_jump UnknownText_0x1ec986
	db "@"

UnknownText_0x11f5a0: ; 0x11f5a0
	text_jump UnknownText_0x1ec99b
	db "@"




UnknownText_0x11f5a5: ; 0x11f5a5
	text_jump UnknownText_0x1ec9bd
	db "@"

UnknownText_0x11f5aa: ; 0x11f5aa
	text_jump UnknownText_0x1ec9d9
	db "@"

UnknownText_0x11f5af: ; 0x11f5af
	text_jump UnknownText_0x1ec9f7
	db "@"

UnknownText_0x11f5b4: ; 0x11f5b4
	text_jump UnknownText_0x1eca0a
	db "@"

UnknownText_0x11f5b9: ; 0x11f5b9
	text_jump UnknownText_0x1eca2a
	db "@"

UnknownText_0x11f5be: ; 0x11f5be
	text_jump UnknownText_0x1eca47
	db "@"

UnknownText_0x11f5c3: ; 0x11f5c3
	text_jump UnknownText_0x1eca64
	db "@"

UnknownText_0x11f5c8: ; 0x11f5c8
	text_jump UnknownText_0x1eca82
	db "@"

UnknownText_0x11f5cd: ; 0x11f5cd
	text_jump UnknownText_0x1eca9d
	db "@"

UnknownText_0x11f5d2: ; 0x11f5d2
	text_jump UnknownText_0x1ecabf
	db "@"

UnknownText_0x11f5d7: ; 0x11f5d7
	text_jump UnknownText_0x1ecade
	db "@"

UnknownText_0x11f5dc: ; 0x11f5dc
	text_jump UnknownText_0x1ecafa
	db "@"

UnknownText_0x11f5e1: ; 0x11f5e1
	text_jump UnknownText_0x1ecb19
	db "@"

UnknownText_0x11f5e6: ; 0x11f5e6
	text_jump UnknownText_0x1ecb37
	db "@"

UnknownText_0x11f5eb: ; 0x11f5eb
	text_jump UnknownText_0x1ecb55
	db "@"

UnknownText_0x11f5f0: ; 0x11f5f0
	text_jump UnknownText_0x1ecb70
	db "@"

UnknownText_0x11f5f5: ; 0x11f5f5
	text_jump UnknownText_0x1ecb92
	db "@"

UnknownText_0x11f5fa: ; 0x11f5fa
	text_jump UnknownText_0x1ecbb6
	db "@"

UnknownText_0x11f5ff: ; 0x11f5ff
	text_jump UnknownText_0x1ecbd9
	db "@"

UnknownText_0x11f604: ; 0x11f604
	text_jump UnknownText_0x1ecbf3
	db "@"

UnknownText_0x11f609: ; 0x11f609
	text_jump UnknownText_0x1ecc15
	db "@"

UnknownText_0x11f60e: ; 0x11f60e
	text_jump UnknownText_0x1ecc39
	db "@"

UnknownText_0x11f613: ; 0x11f613
	text_jump UnknownText_0x1ecc55
	db "@"

UnknownText_0x11f618: ; 0x11f618
	text_jump UnknownText_0x1ecc75
	db "@"

UnknownText_0x11f61d: ; 0x11f61d
	text_jump UnknownText_0x1ecc92
	db "@"

UnknownText_0x11f622: ; 0x11f622
	text_jump UnknownText_0x1ecca7
	db "@"

UnknownText_0x11f627: ; 0x11f627
	text_jump UnknownText_0x1eccc1
	db "@"

UnknownText_0x11f62c: ; 0x11f62c
	text_jump UnknownText_0x1eccd7
	db "@"

UnknownText_0x11f631: ; 0x11f631
	text_jump UnknownText_0x1eccef
	db "@"

UnknownText_0x11f636: ; 0x11f636
	text_jump UnknownText_0x1ecd0e
	db "@"

UnknownText_0x11f63b: ; 0x11f63b
	text_jump UnknownText_0x1ecd2b
	db "@"

UnknownText_0x11f640: ; 0x11f640
	text_jump UnknownText_0x1ecd4d
	db "@"

UnknownText_0x11f645: ; 0x11f645
	text_jump UnknownText_0x1ecd6b
	db "@"

UnknownText_0x11f64a: ; 0x11f64a
	text_jump UnknownText_0x1ecd8d
	db "@"

UnknownText_0x11f64f: ; 0x11f64f
	text_jump UnknownText_0x1ecdaf
	db "@"

UnknownText_0x11f654: ; 0x11f654
	text_jump UnknownText_0x1ecdcf
	db "@"

UnknownText_0x11f659: ; 0x11f659
	text_jump UnknownText_0x1ecded
	db "@"

UnknownText_0x11f65e: ; 0x11f65e
	text_jump UnknownText_0x1ece0d
	db "@"

UnknownText_0x11f663: ; 0x11f663
	text_jump UnknownText_0x1ece2a
	db "@"

UnknownText_0x11f668: ; 0x11f668
	text_jump UnknownText_0x1ece4b
	db "@"

UnknownText_0x11f66d: ; 0x11f66d
	text_jump UnknownText_0x1ece70
	db "@"

UnknownText_0x11f672: ; 0x11f672
	text_jump UnknownText_0x1ece8a
	db "@"

UnknownText_0x11f677: ; 0x11f677
	text_jump UnknownText_0x1ecea8
	db "@"

UnknownText_0x11f67c: ; 0x11f67c
	text_jump UnknownText_0x1ecec9
	db "@"

UnknownText_0x11f681: ; 0x11f681
	text_jump UnknownText_0x1ecee8
	db "@"


SECTION "bank5B", ROMX, BANK[$5B]

Function16c000: ; 16c000
	ld a, [hCGB]
	and a
	ret z
	ld a, [$ffea]
	and a
	ret z
	ld a, [wcfbe]
	push af
	set 7, a
	ld [wcfbe], a
	call Function16c108
	callba Function100063
	callba Function100082
	call Function16c031
	callba Function1000a4
	xor a
	ld [$ffea], a
	pop af
	ld [wcfbe], a
	ret
; 16c031

Function16c031: ; 16c031
	xor a
	ld [wcf63], a
	ld [wcf64], a
	ld [DefaultFlypoint], a
	ld [wd003], a
.asm_16c03e
	call DelayFrame
	callba Function10635c
	ld a, [DefaultFlypoint]
	ld hl, Jumptable_16c05c
	rst JumpTable
	call Function16cb2e
	call Function16cbae
	ld a, [DefaultFlypoint]
	cp $ff
	jr nz, .asm_16c03e
	ret
; 16c05c

Jumptable_16c05c: ; 16c05c
	dw Function16c074
	dw Function16c0ba
	dw Function16c089
	dw Function16c09e
	dw Function16c0a8
	dw Function16c0dc
	dw Function16c0ec
	dw Function16c0ba
	dw Function16c0ca
	dw Function16c0dc
	dw Function16c0ec
	dw Function16c081
; 16c074

Function16c074: ; 16c074
	ld a, [wcf64]
	and a
	ret z
	ld [DefaultFlypoint], a
	xor a
	ld [wd003], a
	ret
; 16c081

Function16c081: ; 16c081
	push af
	ld a, $ff
	ld [DefaultFlypoint], a
	pop af
	ret
; 16c089

Function16c089: ; 16c089
	ld a, $1
	ld [Buffer2], a
	ld [wd1f1], a
	xor a
	ld [hWY], a
	call Function16c0fa
	ld a, [DefaultFlypoint]
	ld [wcf64], a
	ret
; 16c09e

Function16c09e: ; 16c09e
	ld a, [wcf64]
	cp $4
	ret nz
	call Function16c0fa
	ret
; 16c0a8

Function16c0a8: ; 16c0a8
	xor a
	ld [Buffer2], a
	ld [wd1f1], a
	call ClearSprites
	ld a, $90
	ld [hWY], a
	call Function16c0fa
	ret
; 16c0ba

Function16c0ba: ; 16c0ba
	call Function16c943
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call c, Function16c0fa
	ret
; 16c0ca

Function16c0ca: ; 16c0ca
	ld a, [wd003]
	cp $28
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call z, Function16c0fa
	ret
; 16c0dc

Function16c0dc: ; 16c0dc
	call Function16ca11
	push af
	ld a, [wd003]
	inc a
	ld [wd003], a
	pop af
	call c, Function16c0fa
	ret
; 16c0ec

Function16c0ec: ; 16c0ec
	call WhiteBGMap
	call ClearScreen
	push af
	ld a, $ff
	ld [DefaultFlypoint], a
	pop af
	ret
; 16c0fa

Function16c0fa: ; 16c0fa
	push af
	ld a, [DefaultFlypoint]
	inc a
	ld [DefaultFlypoint], a
	xor a
	ld [wd003], a
	pop af
	ret
; 16c108

Function16c108: ; 16c108
	call DisableLCD
	ld hl, VTiles2
	ld de, GFX_16c173
	lb bc, BANK(GFX_16c173), $68
	call Get2bpp
	call Function16c130
	call Function16c145
	call Function16c15c
	ld hl, VBGMap0
	call Function16cc73
	call Function16cc02
	xor a
	ld [hBGMapMode], a
	call EnableLCD
	ret
; 16c130

Function16c130: ; 16c130
	ld de, Unkn1Pals
	ld hl, Unknown_16c903
	ld bc, 8
	ld a, $5
	call FarCopyWRAM
	callba Function96a4
	ret
; 16c145

Function16c145: ; 16c145
	ld hl, TileMap
	ld bc, 20
	xor a
	call ByteFill
	ld hl, Tilemap_16c633
	decoord 0, 1
	ld bc, $0154
	call CopyBytes
	ret
; 16c15c

Function16c15c: ; 16c15c
	ld hl, AttrMap
	ld bc, $0014
	xor a
	call ByteFill
	ld hl, Tilemap_16c79b
	decoord 0, 1, AttrMap
	ld bc, $0154
	call CopyBytes
	ret
; 16c173

GFX_16c173:
INCBIN "gfx/unknown/16c173.2bpp"

Tilemap_16c633:
INCBIN "gfx/unknown/16c633.tilemap"

Tilemap_16c79b:
INCBIN "gfx/unknown/16c79b.tilemap"

Unknown_16c903:
	RGB 31, 31, 31
	RGB 04, 10, 20
	RGB 16, 19, 25
	RGB 25, 27, 29
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
; 16c943

Function16c943: ; 16c943
	ld a, [wd003]
	and a
	jr nz, .asm_16c95e
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, $ff
	ld bc, $0008
	ld hl, Unkn1Pals
	call ByteFill
	pop af
	ld [rSVBK], a

.asm_16c95e
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld e, $0
	ld a, $0
.asm_16c969
	ld hl, Unknown_16c903
	call Function16cab6
	call Function16cabb
	ld d, a
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cabb
	cp d
	jr z, .asm_16c991
	ld b, $1
.asm_16c981
	dec a
	cp d
	jr z, .asm_16c988
	dec b
	jr nz, .asm_16c981

.asm_16c988
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cadc

.asm_16c991
	ld hl, Unknown_16c903
	call Function16cab6
	call Function16cad8
	ld d, a
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cad8
	cp d
	jr z, .asm_16c9b9
	ld b, $1
.asm_16c9a9
	dec a
	cp d
	jr z, .asm_16c9b0
	dec b
	jr nz, .asm_16c9a9

.asm_16c9b0
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cb08

.asm_16c9b9
	ld hl, Unknown_16c903
	call Function16cab6
	call Function16cac4
	ld d, a
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cac4
	cp d
	jr z, .asm_16c9e1
	ld b, $1
.asm_16c9d1
	dec a
	cp d
	jr z, .asm_16c9d8
	dec b
	jr nz, .asm_16c9d1

.asm_16c9d8
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cae8

.asm_16c9e1
rept 2
	inc e
endr
	ld a, e
	cp $8
	jr nz, .asm_16c969
	callba Function96a4
	call Function32f9
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [wd003]
	cp $1f
	jr z, .asm_16ca09
	pop af
	ld [rSVBK], a
	ld e, $0
	pop af
	ld [rSVBK], a
	and a
	ret

.asm_16ca09
	pop af
	ld [rSVBK], a
	pop af
	ld [rSVBK], a
	scf
	ret
; 16ca11

Function16ca11: ; 16ca11
	ld a, [wd003]
	and a
	jr nz, .asm_16ca1d
	callba Function96a4

.asm_16ca1d
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld e, $0
	ld a, $0
.asm_16ca28
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cabb
	cp $1f
	jr z, .asm_16ca48
	ld b, $1
.asm_16ca37
	inc a
	cp $1f
	jr z, .asm_16ca3f
	dec b
	jr nz, .asm_16ca37

.asm_16ca3f
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cadc

.asm_16ca48
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cad8
	cp $1f
	jr z, .asm_16ca68
	ld b, $1
.asm_16ca57
	inc a
	cp $1f
	jr z, .asm_16ca5f
	dec b
	jr nz, .asm_16ca57

.asm_16ca5f
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cb08

.asm_16ca68
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cac4
	cp $1f
	jr z, .asm_16ca88
	ld b, $1
.asm_16ca77
	inc a
	cp $1f
	jr z, .asm_16ca7f
	dec b
	jr nz, .asm_16ca77

.asm_16ca7f
	ld hl, Unkn1Pals
	call Function16cab6
	call Function16cae8

.asm_16ca88
rept 2
	inc e
endr
	ld a, e
	cp $8
	jr nz, .asm_16ca28
	callba Function96a4
	call Function32f9
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [wd003]
	cp $1f
	jr z, .asm_16caae
	pop af
	ld [rSVBK], a
	pop af
	ld [rSVBK], a
	and a
	ret

.asm_16caae
	pop af
	ld [rSVBK], a
	pop af
	ld [rSVBK], a
	scf
	ret
; 16cab6

Function16cab6: ; 16cab6
	ld b, $0
	ld c, e
	add hl, bc
	ret
; 16cabb

Function16cabb: ; 16cabb
	inc hl
	ld a, [hl]
	srl a
	srl a
	and $1f
	ret
; 16cac4

Function16cac4: ; 16cac4
	inc hl
	ld a, [hld]
	and $3
	ld b, a
	ld a, [hl]
	sla a
	rl b
	sla a
	rl b
	sla a
	rl b
	ld a, b
	ret
; 16cad8

Function16cad8: ; 16cad8
	ld a, [hl]
	and $1f
	ret
; 16cadc

Function16cadc: ; 16cadc
	sla a
	sla a
	ld b, a
	inc hl
	ld a, [hl]
	and $83
	or b
	ld [hl], a
	ret
; 16cae8

Function16cae8: ; 16cae8
	ld c, a
	srl a
	srl a
	srl a
	ld b, a
	inc hl
	ld a, [hl]
	and $fc
	or b
	ld [hld], a
	ld a, c
	sla a
	sla a
	sla a
	sla a
	sla a
	ld b, a
	ld a, [hl]
	and $1f
	or b
	ld [hl], a
	ret
; 16cb08

Function16cb08: ; 16cb08
	ld b, a
	ld a, [hl]
	and $e0
	or b
	ld [hl], a
	ret
; 16cb0f

Function16cb0f: ; 16cb0f
	xor a
	ld [Buffer1], a
	ld [Buffer2], a
	xor a
	ld [wd1ec], a
	ld a, $70
	ld [wd1ee], a
	ld a, $4
	ld [wd1ed], a
	ld a, $a0
	ld [wd1ef], a
	xor a
	ld [wd1f0], a
	ret
; 16cb2e

Function16cb2e: ; 16cb2e
	ld a, [Buffer2]
	and a
	ret z
	call Function16cb40
	ld hl, Unknown_16cb86
	ld de, Sprites
	call Function16cb5d
	ret
; 16cb40

Function16cb40: ; 16cb40
	ld hl, wd1ec
	inc [hl]
	ld a, [hl]
	cp $18
	ret c
	xor a
	ld [hl], a
	ld a, [wd1ef]
	cp $a0
	jr nz, .asm_16cb57
	ld a, $a7
	ld [wd1ef], a
	ret

.asm_16cb57
	ld a, $a0
	ld [wd1ef], a
	ret
; 16cb5d

Function16cb5d: ; 16cb5d
	ld a, [hli]
	and a
	ret z
.asm_16cb60
	push af
	ld a, [wd1ee]
	add [hl]
	add $10
	ld [de], a
	inc hl
	inc de
	ld a, [wd1ed]
	add [hl]
	add $8
	ld [de], a
	inc hl
	inc de
	ld a, [wd1ef]
	add [hl]
	ld [de], a
	inc hl
	inc de
	ld a, [wd1f0]
	or [hl]
	ld [de], a
	inc hl
	inc de
	pop af
	dec a
	jr nz, .asm_16cb60
	ret
; 16cb86

Unknown_16cb86:
	db 7
	db  0,  0, 0, 1
	db  8,  0, 1, 1
	db  8,  8, 2, 0
	db  8, 16, 3, 0
	db 16,  0, 4, 1
	db 16,  8, 5, 0
	db 16, 16, 6, 0
; 16cba3

Function16cba3: ; 16cba3
	xor a
	ld [wd1f1], a
	ld [wd1f2], a
	ld [wd1f3], a
	ret
; 16cbae

Function16cbae: ; 16cbae
	ld a, [wd1f1]
	and a
	ret z
	call Function16cbba
	call Function16cbd1
	ret
; 16cbba

Function16cbba: ; 16cbba
	ld hl, wd1f2
	inc [hl]
	ld a, [hl]
	cp $c
	ret c
	xor a
	ld [hl], a
	ld a, [wd1f3]
	inc a
	cp $4
	jr c, .asm_16cbcd
	xor a

.asm_16cbcd
	ld [wd1f3], a
	ret
; 16cbd1

Function16cbd1: ; 16cbd1
	ld a, [wd1f3]
	ld c, a
	ld b, 0
	ld hl, Unknown_16cbfb
	add hl, bc
	ld a, [hl]
	ld bc, $0002
	ld hl, Unknown_16cfa3
	call AddNTimes
	ld de, wd00c
	ld bc, $0002
	ld a, $5
	call FarCopyWRAM
	callba Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 16cbfb

Unknown_16cbfb:
	db 0, 1, 2, 1, 0, 1, 2
; 16cc02

Function16cc02: ; 16cc02
	call Function16cc18
	call Function16cc49
	call Function16cc62
	call Function16cc25
	call Function16cc6e
	call Function16cb0f
	call Function16cba3
	ret
; 16cc18

Function16cc18: ; 16cc18
	ld hl, VTiles1
	ld de, GFX_16cca3
	lb bc, BANK(GFX_16cca3), $2e
	call Get2bpp
	ret
; 16cc25

Function16cc25: ; 16cc25
	ld hl, Unknown_16cfa9
	ld de, wd008
	call Function16cc41
	ld hl, Unknown_16cfb1
	ld de, Unkn2Pals
	call Function16cc41
	ld hl, Unknown_16cfb9
	ld de, wd048
	call Function16cc41
	ret
; 16cc41

Function16cc41: ; 16cc41
	ld bc, $0008
	ld a, $5
	jp FarCopyWRAM
; 16cc49

Function16cc49: ; 16cc49
	hlcoord 4, 15
	ld a, $80
	call Function16cc5a
	hlcoord 4, 16
	ld a, $90
	call Function16cc5a
	ret
; 16cc5a

Function16cc5a: ; 16cc5a
	ld c, $10
.asm_16cc5c
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_16cc5c
	ret
; 16cc62

Function16cc62: ; 16cc62
	hlcoord 0, 15, AttrMap
	ld bc, $0028
	ld a, $1
	call ByteFill
	ret
; 16cc6e

Function16cc6e: ; 16cc6e
	ld hl, VBGMap1
	jr Function16cc73

Function16cc73:
	ld a, [rVBK]
	push af
	ld a, $0
	ld [rVBK], a
	push hl
	ld de, TileMap
	call Function16cc90
	pop hl
	ld a, $1
	ld [rVBK], a
	ld de, AttrMap
	call Function16cc90
	pop af
	ld [rVBK], a
	ret
; 16cc90

Function16cc90: ; 16cc90
	ld bc, $1214
.asm_16cc93
	push bc
.asm_16cc94
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_16cc94
	ld bc, $000c
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_16cc93
	ret
; 16cca3

GFX_16cca3:
INCBIN "gfx/unknown/16cca3.2bpp"

Unknown_16cfa3:
	RGB 31, 31, 31
	RGB 25, 27, 29
	RGB 16, 19, 25

Unknown_16cfa9:
	RGB 31, 31, 31
	RGB 25, 27, 29
	RGB 31, 31, 31
	RGB 07, 07, 07

Unknown_16cfb1:
	RGB 31, 31, 31
	RGB 13, 09, 18
	RGB 26, 21, 16
	RGB 07, 07, 07

Unknown_16cfb9:
	RGB 31, 31, 31
	RGB 18, 05, 02
	RGB 27, 11, 12
	RGB 07, 07, 07
; 16cfc1

GFX_16cfc1:
INCBIN "gfx/unknown/16cfc1.2bpp"

Function16d421: ; 16d421
	ld de, GFX_16cfc1
	ld hl, VTiles2
	lb bc, BANK(GFX_16cfc1), $46
	call Get2bpp
	ret
; 16d42e

Function16d42e: ; 16d42e
	ld hl, Tilemap_16d465
	ld de, TileMap
	ld bc, $0168
	call CopyBytes
	ret
; 16d43b

Function16d43b: ; 16d43b
	call Function1d6e
	call WhiteBGMap
	call ClearTileMap
	call ClearSprites
	callba Function16d421
	callba Function16d42e
	ld b, $8
	call GetSGBLayout
	call Function32f9
	call WaitBGMap
	call Functiona36
	call Function1d7d
	ret
; 16d465

Tilemap_16d465:
INCBIN "gfx/unknown/16d465.tilemap"

Tilemap_16d5cd:
INCBIN "gfx/unknown/16d5cd.tilemap"

Tilemap_16d5f5:
INCBIN "gfx/unknown/16d5f5.tilemap"

Function16d61d: ; 16d61d
	ld h, d
	ld l, e
	push bc
	push hl
	call Function16d640
	pop hl
	pop bc
	ld de, AttrMap - TileMap
	add hl, de
rept 2
	inc b
endr
rept 2
	inc c
endr
	ld a, $7
.asm_16d630
	push bc
	push hl
.asm_16d632
	ld [hli], a
	dec c
	jr nz, .asm_16d632
	pop hl
	ld de, $0014
	add hl, de
	pop bc
	dec b
	jr nz, .asm_16d630
	ret
; 16d640

Function16d640: ; 16d640
	push hl
	ld a, $30
	ld [hli], a
	inc a
	call Function16d66d
	inc a
	ld [hl], a
	pop hl
	ld de, $0014
	add hl, de
.asm_16d64f
	push hl
	ld a, $33
	ld [hli], a
	ld a, $7f
	call Function16d66d
	ld [hl], $34
	pop hl
	ld de, $0014
	add hl, de
	dec b
	jr nz, .asm_16d64f
	ld a, $35
	ld [hli], a
	ld a, $36
	call Function16d66d
	ld [hl], $37
	ret
; 16d66d

Function16d66d: ; 16d66d
	ld d, c
.asm_16d66e
	ld [hli], a
	dec d
	jr nz, .asm_16d66e
	ret
; 16d673

Function16d673: ; 16d673
	call Function16d696
	call Function16d6ae
	callba Function49856
	callba Functionfb60d
	hlcoord 10, 17
	ld de, String_16d68f
	call PlaceString
	ret
; 16d68f

String_16d68f: ; 16d68f
	db "CANCEL@"
; 16d696

Function16d696: ; 16d696
	call Function16d421
	ret
; 16d69a


Function16d69a: ; 16d69a
	ld de, GFX_16cfc1 + $300
	ld hl, $9760
	lb bc, BANK(GFX_16cfc1), 8
	call Get2bpp
	ret
; 16d6a7

Function16d6a7: ; 16d6a7
	callba Function49811
	ret
; 16d6ae

Function16d6ae: ; 16d6ae
	call Function16d42e
	ld hl, Tilemap_16d5cd
	ld de, TileMap
	ld bc, $0028
	call CopyBytes
	ld hl, Tilemap_16d5f5
	decoord 0, 16
	ld bc, $0028
	call CopyBytes
	ret
; 16d6ca

Function16d6ca: ; 16d6ca
	call Function16d61d
	ret
; 16d6ce

Function16d6ce: ; 16d6ce
	call Function1d6e
	call Function16d6e1
	callba Function87d
	call Function1d7d
	call Function3200
	ret
; 16d6e1

Function16d6e1: ; 16d6e1
	hlcoord 4, 10
	ld b, $1
	ld c, $a
	predef Function28eef
	hlcoord 5, 11
	ld de, String_16d701
	call PlaceString
	call WaitBGMap
	call Function3200
	ld c, $32
	jp DelayFrames
; 16d701

String_16d701: ; 16d701
	db "WAITING..!@"
; 16d70c

Function16d70c: ; 16d70c
	call Function16d725
	call Function16d713
	ret
; 16d713

Function16d713: ; 16d713
	push bc
	push af
	ld a, [$ffa9]
	and $f0
	ld b, a
	ld a, [hJoyPressed]
	and $f
	or b
	ld b, a
	pop af
	ld a, b
	pop bc
	ld d, a
	ret
; 16d725

Function16d725: ; 16d725
	ld hl, wcfa6
	res 7, [hl]
	ld a, [hBGMapMode]
	push af
	call Function16d734
	pop af
	ld [hBGMapMode], a
	ret
; 16d734

Function16d734: ; 16d734
.asm_16d734
	call Function16d77a
	call Function16d759
	call Function16d76a
	jr nc, .asm_16d758
	callba Function24270
	jr c, .asm_16d758
	ld a, [wcfa5]
	bit 7, a
	jr nz, .asm_16d758
	call Function16d713
	ld b, a
	ld a, [wcfa8]
	and b
	jr z, .asm_16d734

.asm_16d758
	ret
; 16d759

Function16d759: ; 16d759
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
; 16d76a

Function16d76a: ; 16d76a
.asm_16d76a
	call RTC
	call Function16d7e7
	ret c
	ld a, [wcfa5]
	bit 7, a
	jr z, .asm_16d76a
	and a
	ret
; 16d77a

Function16d77a: ; 16d77a
	ld hl, wcfac
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp $1f
	jr nz, .asm_16d792
	ld a, [wcfab]
	ld [hl], a
	push hl
	push bc
	ld bc, $000b
	add hl, bc
	ld [hl], a
	pop bc
	pop hl

.asm_16d792
	ld a, [wcfa1]
	ld b, a
	ld a, [wcfa2]
	ld c, a
	call GetTileCoord
	ld a, [wcfa7]
	swap a
	and $f
	ld c, a
	ld a, [wcfa9]
	ld b, a
	xor a
	dec b
	jr z, .asm_16d7b1
.asm_16d7ad
	add c
	dec b
	jr nz, .asm_16d7ad

.asm_16d7b1
	ld c, $14
	call AddNTimes
	ld a, [wcfa7]
	and $f
	ld c, a
	ld a, [wcfaa]
	ld b, a
	xor a
	dec b
	jr z, .asm_16d7c8
.asm_16d7c4
	add c
	dec b
	jr nz, .asm_16d7c4

.asm_16d7c8
	ld c, a
	add hl, bc
	ld a, [hl]
	cp $1f
	jr z, .asm_16d7de
	ld [wcfab], a
	ld [hl], $1f
	push hl
	push bc
	ld bc, $000b
	add hl, bc
	ld [hl], $1f
	pop bc
	pop hl

.asm_16d7de
	ld a, l
	ld [wcfac], a
	ld a, h
	ld [wcfad], a
	ret
; 16d7e7

Function16d7e7: ; 16d7e7
	ld a, [wcfa5]
	bit 6, a
	jr z, .asm_16d7f4
	callba Function8cf62

.asm_16d7f4
	call Functiona57
	call Function16d713
	and a
	ret z
	scf
	ret
; 16d7fe


SECTION "bank5C", ROMX, BANK[$5C]

Function170000: ; 170000
	ld a, [$c62b]
	ld [$c6d0], a
	ld hl, $c62e
	ld de, $c6e7
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $c663
	ld de, $c6f2
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $c648
	ld a, [hli]
	ld [$c6fd], a
	ld a, [hl]
	ld [$c6fe], a
	ld hl, $c639
	ld a, [hli]
	ld [$c6ff], a
	ld a, [hl]
	ld [wc700], a
	ld bc, $c633
	callba GetCaughtGender
	ld a, c
	ld [wc701], a
	ld a, [wcd81]
	ld [wc74e], a
	ld hl, $c608
	ld de, $d800
	ld bc, $008f
	call CopyBytes
	ret
; 17005a

Function17005a: ; 17005a
	ld a, $5
	call GetSRAMBank
	ld a, [$a824]
	ld [wc702], a
	ld hl, $a827
	ld de, wc719
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $a85c
	ld de, wc724
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $a841
	ld a, [hli]
	ld [wc72f], a
	ld a, [hl]
	ld [wc730], a
	ld hl, $a832
	ld a, [hli]
	ld [wc731], a
	ld a, [hl]
	ld [wc732], a
	ld bc, $a82c
	callba GetCaughtGender
	ld a, c
	ld [wc733], a
	ld a, [wcd81]
	ld [wc74e], a
	call CloseSRAM
	ret
; 1700b0

Function1700b0: ; 1700b0
	call Function17021e
	callba Function118121
	ret
; 1700ba

Function1700ba: ; 1700ba
	call Function17021e
	callba Function11811a
	ret
; 1700c4

Function1700c4: ; 1700c4
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	call Function17042c
	ld a, $5
	call GetSRAMBank
	ld a, $1
	ld [$be45], a
	xor a
	ld [$be46], a
	ld hl, $dffc
	ld de, $aa41
	ld bc, $0004
	call CopyBytes
	ld hl, $d202
	ld de, $aa8e
	ld bc, $0594
	call CopyBytes
	ld hl, $aa5d
	ld a, [hl]
	inc [hl]
	inc hl
	sla a
	sla a
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld hl, $dffc
	ld bc, $0004
	call CopyBytes
	call CloseSRAM
	pop af
	ld [rSVBK], a
	ret
; 170114

Function170114: ; 170114
	call Function17021e
	call Function170121
	callba Function11805f
	ret
; 170121

Function170121: ; 170121
	ld a, $5
	call GetSRAMBank
	ld hl, $a948
	ld de, $c608
	ld bc, $00f6
	call CopyBytes
	call CloseSRAM
	call Function170c8b
	ret
; 170139

Function170139: ; 170139
	ld a, $5
	call GetSRAMBank
	ld de, $aa41
	ld h, $0
	ld l, h
	ld bc, $03e8
	call Function17020c
	ld bc, $0064
	call Function17020c
	ld bc, $000a
	call Function17020c
	ld a, [de]
	ld c, a
	ld b, $0
	add hl, bc
	call CloseSRAM
	ld a, h
	ld [$c608], a
	ld a, l
	ld [$c608 + 1], a
	ld hl, $c628
	ld a, [PlayerID]
	ld [hli], a
	ld a, [PlayerID + 1]
	ld [hli], a
	ld a, [wd84a]
	ld [hli], a
	ld a, [wd84b]
	ld [hli], a
	ld e, l
	ld d, h
	ld hl, PlayerName
	ld bc, $0005
	call CopyBytes
	ld bc, PlayerID
	ld de, PlayerGender
	callba Function4e929
	ld de, $c62c + 5
	ld a, c
	ld [de], a
	inc de
	ld a, $df
	ld [wcd49], a
	ld a, $dc
	ld [wcd4a], a
	ld a, $41
	ld [wcd4b], a
	ld a, $de
	ld [wcd4c], a
	ld a, $3
.asm_1701ac
	push af
	ld a, [wcd49]
	ld l, a
	ld a, [wcd4a]
	ld h, a
	ld bc, $0030
	call CopyBytes
	ld a, l
	ld [wcd49], a
	ld a, h
	ld [wcd4a], a
	ld a, [wcd4b]
	ld l, a
	ld a, [wcd4c]
	ld h, a
	ld bc, $0006
	call CopyBytes
	ld a, l
	ld [wcd4b], a
	ld a, h
	ld [wcd4c], a
	pop af
	dec a
	jr nz, .asm_1701ac
	ld a, $4
	call GetSRAMBank
	ld hl, $a013
	ld bc, $0024
	call CopyBytes
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	ld hl, $a894
	ld bc, $0006
	call CopyBytes
	ld hl, $c608
	ld de, $a948
	ld bc, $00f6
	call CopyBytes
	call CloseSRAM
	ret
; 17020c

Function17020c: ; 17020c
	ld a, [de]
	inc de
	and a
	ret z
.asm_170210
	add hl, bc
	dec a
	jr nz, .asm_170210
	ret
; 170215

Function170215: ; 170215
	xor a
	ld [wcf63], a
	call Function17022c
	ret
; 17021d

Function17021d: ; 17021d
	ret
; 17021e

Function17021e: ; 17021e
	xor a
	ld [wcf63], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ret
; 17022c

Function17022c: ; 17022c
.asm_17022c
	call Function17023a
	call DelayFrame
	ld a, [wcf63]
	cp $1
	jr nz, .asm_17022c
	ret
; 17023a

Function17023a: ; 17023a
	ld a, [wcf63]
	ld e, a
	ld d, 0
	ld hl, Jumptable_170249
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 170249

Jumptable_170249: ; 170249
	dw Function17024d
	dw Function1704c9
; 17024d

Function17024d: ; 17024d
	ld a, [Options]
	push af
	ld hl, Options
	set 6, [hl]
	ld a, [wcfc0]
	push af
	or $1
	ld [wcfc0], a
	xor a
	ld [InLinkBattle], a
	callba Mobile_HealParty
	callba HealParty
	call Function1702b7
	call Function170bf7
	predef StartBattle
	callba Function1500c
	callba HealParty
	ld a, [wd0ee]
	ld [ScriptVar], a
	and a
	jr nz, .asm_1702a9
	ld a, $1
	call GetSRAMBank
	ld a, [$be46]
	ld [wcf64], a
	call CloseSRAM
	ld hl, StringBuffer3
	ld a, [wcf64]
	add $f7
	ld [hli], a
	ld a, $50
	ld [hl], a

.asm_1702a9
	pop af
	ld [wcfc0], a
	pop af
	ld [Options], a
	ld a, $1
	ld [wcf63], a
	ret
; 1702b7

Function1702b7: ; 1702b7
	call Function1704a2
	ld de, $c643
	ld c, $b
	callba Function17d073
	jr nc, .asm_1702db
	ld a, [$c608 + 11]
	ld [wd265], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, $c643
	ld bc, $000b
	call CopyBytes

.asm_1702db
	ld de, $c67e
	ld c, $b
	callba Function17d073
	jr nc, .asm_1702fc
	ld a, [$c64e]
	ld [wd265], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, $c67e
	ld bc, $000b
	call CopyBytes

.asm_1702fc
	ld de, $c686 + 51
	ld c, $b
	callba Function17d073
	jr nc, .asm_17031d
	ld a, [$c689]
	ld [wd265], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, $c686 + 51
	ld bc, $000b
	call CopyBytes

.asm_17031d
	ld a, $50
	ld [$c64d], a
	ld [$c688], a
	ld [$c68a + 57], a
	call Function170c98
	ld de, $c608
	ld c, $a
	callba Function17d073
	jr nc, .asm_17033d
	ld hl, String_170426
	jr .asm_170340

.asm_17033d
	ld hl, $c608

.asm_170340
	ld de, wd26b
	ld bc, $000a
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $c608 + 10
	ld a, [hli]
	ld [OtherTrainerClass], a
	ld a, $ea
	ld [BGMapBuffer], a
	ld a, $d3
	ld [wcd21], a
	ld de, OTPartyMon1Species
	ld bc, OTPartyCount
	ld a, $3
	ld [bc], a
	inc bc
.asm_170367
	push af
	ld a, [hl]
	ld [bc], a
	inc bc
	push bc
	ld bc, $0030
	call CopyBytes
	push de
	ld a, [BGMapBuffer]
	ld e, a
	ld a, [wcd21]
	ld d, a
	ld bc, $000b
	call CopyBytes
	ld a, e
	ld [BGMapBuffer], a
	ld a, d
	ld [wcd21], a
	pop de
	pop bc
	pop af
	dec a
	and a
	jr nz, .asm_170367
	ld a, $ff
	ld [bc], a
	ret
; 170394

Function170394: ; 170394
	ld hl, $c608 + 11
	ld d, $3
.asm_170399
	push de
	push hl
	ld b, h
	ld c, l
	ld a, [hl]
	and a
	jr z, .asm_1703b1
	cp $ff
	jr z, .asm_1703b1
	cp $fe
	jr z, .asm_1703b1
	cp $fd
	jr z, .asm_1703b1
	cp $fc
	jr nz, .asm_1703b4

.asm_1703b1
	ld a, $eb
	ld [hl], a

.asm_1703b4
	ld [CurSpecies], a
	call GetBaseData
	ld a, $5
	call GetSRAMBank
	ld a, [$b2fb]
	call CloseSRAM
	ld e, a
	ld hl, $001f
	add hl, bc
	ld a, [hl]
	cp $2
	ld a, $2
	jr c, .asm_1703d6
	ld a, [hl]
	cp e
	jr c, .asm_1703d7
	ld a, e

.asm_1703d6
	ld [hl], a

.asm_1703d7
	ld [CurPartyLevel], a
	ld hl, $0002
	add hl, bc
	ld d, $3
	ld a, [hli]
	and a
	jr z, .asm_1703ea
	cp $fc
	jr nc, .asm_1703ea
	jr .asm_1703f4

.asm_1703ea
	dec hl
	ld a, $1
	ld [hli], a
	xor a
rept 2
	ld [hli], a
endr
	ld [hl], a
	jr .asm_1703ff

.asm_1703f4
	ld a, [hl]
	cp $fc
	jr c, .asm_1703fb
	ld [hl], $0

.asm_1703fb
	inc hl
	dec d
	jr nz, .asm_1703f4

.asm_1703ff
	ld hl, $0024
	add hl, bc
	ld d, h
	ld e, l
	push hl
	push de
	ld hl, $000a
	add hl, bc
	ld b, $1
	predef Functione167
	pop de
	pop hl
rept 2
	dec de
endr
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop hl
	ld bc, $003b
	add hl, bc
	pop de
	dec d
	jp nz, .asm_170399
	ret
; 170426

String_170426: ; 170426
	db "CHRIS@"
; 17042c

Function17042c: ; 17042c
	ld hl, OTPartyMon2ID
	ld a, $7
.asm_170431
	push af
	push hl
	ld c, $12
.asm_170435
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jr z, .asm_170451
	cp $f
	jr nc, .asm_17045b
	push hl
	ld hl, Unknown_170470
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	pop hl
	cp b
	jr c, .asm_17045b
	jr z, .asm_17045b
	jr .asm_170456

.asm_170451
	ld a, b
	cp $fc
	jr nc, .asm_17045b

.asm_170456
	dec c
	jr nz, .asm_170435
	jr .asm_170466

.asm_17045b
	pop de
	push de
	ld hl, Unknown_17047e
	ld bc, $0024
	call CopyBytes

.asm_170466
	pop hl
	ld de, $00e0
	add hl, de
	pop af
	dec a
	jr nz, .asm_170431
	ret
; 170470

Unknown_170470:
	db $12, $24, $45, $45, $42, $42, $45, $42, $27, $27, $45, $27, $42, $24

Unknown_17047e:
	db $03, $04, $05, $08
	db $03, $05, $0e, $06
	db $03, $02, $00, $00
	db $39, $07, $07, $04
	db $00, $05, $04, $07
	db $01, $05, $00, $00
	db $0f, $05, $14, $07
	db $05, $05, $11, $0c
	db $0c, $06, $06, $04
; 1704a2

Function1704a2: ; 1704a2
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld hl, LYOverrides
	ld de, $c608
	ld bc, $00e0
	call CopyBytes
	pop af
	ld [rSVBK], a
	ld a, $1
	call GetSRAMBank
	ld a, $2
	ld [$be45], a
	ld hl, $be46
	inc [hl]
	call CloseSRAM
Function1704c9:
	ret
; 1704ca

Function1704ca: ; 1704ca
	ld a, [$be46]
	cp $7
	jr c, .asm_1704d3
	ld a, $6

.asm_1704d3
	ld hl, $afce
	ld de, -$e0
.asm_1704d9
	and a
	jr z, .asm_1704e0
	add hl, de
	dec a
	jr .asm_1704d9

.asm_1704e0
	ret
; 1704e1

Function1704e1: ; 1704e1
	call SpeechTextBox
	call FadeToMenu
	call Function17021e
	call Function1704f1
	call Function2b3c
	ret
; 1704f1

Function1704f1: ; 1704f1
	call WhiteBGMap
	call ClearSprites
	call ClearScreen
.asm_1704fa
	call Functiona57
	ld a, [wcf63]
	bit 7, a
	jr nz, .asm_17050f
	call Function170510
	callba Function104061
	jr .asm_1704fa

.asm_17050f
	ret
; 170510

Function170510: ; 170510
	ld a, [wcf63]
	ld e, a
	ld d, 0
	ld hl, Jumptable_17051f
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 17051f

Jumptable_17051f: ; 17051f
	dw Function170525
	dw Function170571
	dw Function170577
; 170525

Function170525: ; 170525
	ld a, $5
	call GetSRAMBank
	ld hl, $a89c
	ld de, StringBuffer3
	ld bc, $0016
	call CopyBytes
	ld hl, $a8b2
	ld de, $c608
	ld bc, $0096
	call CopyBytes
	call CloseSRAM
	hlcoord 1, 1
	ld de, StringBuffer3
	call PlaceString
	hlcoord 1, 3
	ld de, String_170676
	call PlaceString
	hlcoord 4, 3
	ld de, StringBuffer4
	call PlaceString
	hlcoord 8, 3
	ld de, String_17067a
	call PlaceString
	call Function1705b7
	call Function1705f0
	jr Function1705b2

Function170571:
	call Function32f9
	call Function1705b2

Function170577:
	ld hl, hJoyPressed
	ld a, [hl]
	and $1
	jr nz, .asm_1705ac
	ld a, [hl]
	and $2
	jr nz, .asm_1705ac
	ld a, [hl]
	and $40
	jr nz, .asm_17058f
	ld a, [hl]
	and $80
	jr nz, .asm_17059d
	ret

.asm_17058f
	ld a, [wcf64]
	and a
	ret z
	sub $f
	ld [wcf64], a
	call Function1705f0
	ret

.asm_17059d
	ld a, [wcf64]
	cp $3c
	ret z
	add $f
	ld [wcf64], a
	call Function1705f0
	ret

.asm_1705ac
	ld hl, wcf63
	set 7, [hl]
	ret

Function1705b2:
	ld hl, wcf63
	inc [hl]
	ret
; 1705b7

Function1705b7: ; 1705b7
	hlcoord 0, 4
	ld a, $79
	ld [hli], a
	ld c, $12
.asm_1705bf
	ld a, $7a
	ld [hli], a
	dec c
	jr nz, .asm_1705bf
	ld a, $7b
	ld [hli], a
	ld de, $0014
	ld c, $c
.asm_1705cd
	ld a, $7c
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_1705cd
	ld a, $7d
	ld [hli], a
	ld c, $12
.asm_1705d9
	ld a, $7a
	ld [hli], a
	dec c
	jr nz, .asm_1705d9
	ld a, $7e
	ld [hl], a
	ld de, $ffec
	add hl, de
	ld c, $c
.asm_1705e8
	ld a, $7c
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_1705e8
	ret
; 1705f0

Function1705f0: ; 1705f0
	call Function17064b
	call Function17065d
	ld a, $50
	ld [wcd4e], a
	ld hl, $c608
	ld a, [wcf64]
	ld c, a
	xor a
	ld b, a
	add hl, bc
	push hl
	pop bc
	hlcoord 1, 6
	ld a, $6
.asm_17060c
	push af
	push hl
	ld a, $3
.asm_170610
	push af
	ld de, wcd49
	ld a, [bc]
	and a
	jr z, .asm_170625
	ld a, $5
.asm_17061a
	push af
	ld a, [bc]
	ld [de], a
	inc bc
	inc de
	pop af
	dec a
	jr nz, .asm_17061a
	jr .asm_170631

.asm_170625
	ld a, $5
.asm_170627
	push af
	ld a, $e3
	ld [de], a
	inc de
	inc bc
	pop af
	dec a
	jr nz, .asm_170627

.asm_170631
	ld de, wcd49
	push bc
	call PlaceString
	ld de, $0006
	add hl, de
	pop bc
	pop af
	dec a
	jr nz, .asm_170610
	pop hl
	ld de, $0028
	add hl, de
	pop af
	dec a
	jr nz, .asm_17060c
	ret
; 17064b

Function17064b: ; 17064b
	hlcoord 1, 5
	xor a
	ld b, $c
.asm_170651
	ld c, $12
.asm_170653
	ld [hli], a
	dec c
	jr nz, .asm_170653
rept 2
	inc hl
endr
	dec b
	jr nz, .asm_170651
	ret
; 17065d

Function17065d: ; 17065d
	ld a, [wcf64]
	and a
	jr z, .asm_170669
	hlcoord 18, 5
	ld a, $61
	ld [hl], a

.asm_170669
	ld a, [wcf64]
	cp $3c
	ret z
	hlcoord 18, 16
	ld a, $ee
	ld [hl], a
	ret
; 170676

String_170676: ; 170676
	db "ルーム@"
; 17067a

String_17067a: ; 17067a
	db "れきだいりーダーいちらん@"
; 170687

Function170687: ; 170687
	ld a, [ScriptVar]
	ld e, a
	ld d, 0
	ld hl, Jumptable_170696
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 170696


Jumptable_170696: ; 170696 (5c:4696)
	dw Function17075f
	dw Function170788
	dw Function170778
	dw Function170799
	dw Function17079d
	dw Function1707ac
	dw Function1707f4
	dw Function170868
	dw Function170881
	dw Function17089a
	dw Function1708b1
	dw Function1708b9
	dw Function1708c8
	dw Function1708f0
	dw Function17093c
	dw Function1709aa
	dw Function1709bb
	dw Function170a9c
	dw Function170aa0
	dw Function170aaf
	dw Function170abe
	dw Function170ad7
	dw Function170807
	dw Function17081d
	dw Function170ae8
	dw Function170b16
	dw Function1706d6
	dw Function1706ee
	dw Function17071b
	dw Function170729
	dw Function17073e
	dw Function170737


Function1706d6: ; 1706d6 (5c:46d6)
	ld a, $1
	call GetSRAMBank
	ld a, $ff
	ld hl, $be48
	ld bc, $7
	call ByteFill
	xor a
	ld [$be46], a
	call CloseSRAM
	ret

Function1706ee: ; 1706ee (5c:46ee)
	ld a, $1
	call GetSRAMBank
	ld a, [$be50]
	call CloseSRAM
	ld [ScriptVar], a
	ld hl, NumItems
	ld a, [hli]
	cp $14
	ret c
	ld b, $14
	ld a, [ScriptVar]
	ld c, a
.asm_170709
	ld a, [hli]
	cp c
	jr nz, .asm_170711
	ld a, [hl]
	cp $5f
	ret c
.asm_170711
	inc hl
	dec b
	jr nz, .asm_170709
	ld a, $12
	ld [ScriptVar], a
	ret

Function17071b: ; 17071b (5c:471b)
	ld a, $1
	call GetSRAMBank
	ld a, $3
	ld [$be45], a
	call CloseSRAM
	ret

Function170729: ; 170729 (5c:4729)
	ld a, $1
	call GetSRAMBank
	ld a, $4
	ld [$be45], a
	call CloseSRAM
	ret

Function170737: ; 170737 (5c:4737)
	callba SaveOptionsSelection
	ret

Function17073e: ; 17073e (5c:473e)
	call Random
	ld a, [hRandomAdd] ; $ff00+$e1
	and $7
	cp $6
	jr c, .asm_17074b
	sub $6
.asm_17074b
	add $1a
	cp $1e
	jr z, Function17073e
	push af
	ld a, $1
	call GetSRAMBank
	pop af
	ld [$be50], a
	call CloseSRAM
	ret

Function17075f: ; 17075f (5c:475f)
	call Function17089a
	ld a, [ScriptVar]
	and a
	ret z
	ld a, $1
	call GetSRAMBank
	ld a, [$be4f]
	and $2
	ld [ScriptVar], a
	call CloseSRAM
	ret

Function170778: ; 170778 (5c:4778)
	ld hl, $be45
	ld a, $1
	call GetSRAMBank
	ld a, [hl]
	ld [ScriptVar], a
	call CloseSRAM
	ret

Function170788: ; 170788 (5c:4788)
	ld a, $1
	call GetSRAMBank
	ld a, [$be4f]
	or $2
	ld [$be4f], a
	call CloseSRAM
	ret

Function170799: ; 170799 (5c:4799)
	ld c, $1
	jr asm_17079f

Function17079d: ; 17079d (5c:479d)
	ld c, $0
asm_17079f: ; 17079f (5c:479f)
	ld a, $1
	call GetSRAMBank
	ld a, c
	ld [$be45], a
	call CloseSRAM
	ret

Function1707ac: ; 1707ac (5c:47ac)
	ld a, $5
	call GetSRAMBank
	ld a, [$aa8c]
	ld b, a
	ld a, [$be46]
	ld [ScriptVar], a
	call CloseSRAM
	and a
	ret z
	ld a, b
	cp $2
	jr nc, .asm_1707ef
	push bc
	call UpdateTime
	pop bc
	ld a, $5
	call GetSRAMBank
	ld a, [$aa8b]
	call CloseSRAM
	ld c, a
	ld a, [CurDay]
	sub c
	jr c, .asm_1707e5
	cp $8
	jr nc, .asm_1707ef
	ld a, b
	and a
	jr nz, .asm_1707ef
	ret
.asm_1707e5
	ld hl, CurDay
	ld a, $8c
	sub c
	add [hl]
	cp $8
	ret c
.asm_1707ef
	ld a, $8
	ld [ScriptVar], a

Function1707f4: ; 1707f4 (5c:47f4)
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$be46], a
	ld [$aa8b], a
	ld [$aa8c], a
	call CloseSRAM
	ret

Function170807: ; 170807 (5c:4807)
	call UpdateTime
	ld a, $5
	call GetSRAMBank
	ld a, [CurDay]
	ld [$b2f9], a
	xor a
	ld [$b2fa], a
	call CloseSRAM
	ret

Function17081d: ; 17081d (5c:481d)
	xor a
	ld [ScriptVar], a
	ld a, $5
	call GetSRAMBank
	ld a, [$b2f9]
	ld c, a
	ld a, [$b2fa]
	ld b, a
	call CloseSRAM
	cp $2
	jr nc, .asm_170853
	push bc
	call UpdateTime
	pop bc
	ld a, [CurDay]
	sub c
	jr c, .asm_170849
	cp $b
	jr nc, .asm_170853
	ld a, b
	and a
	jr nz, .asm_170853
	ret
.asm_170849
	ld hl, CurDay
	ld a, $8c
	sub c
	add [hl]
	cp $b
	ret c
.asm_170853
	ld a, $1
	ld [ScriptVar], a
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$b2f9], a
	ld [$b2fa], a
	call CloseSRAM
	ret

Function170868: ; 170868 (5c:4868)
	ld a, $1
	call GetSRAMBank
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $3
	ld [rSVBK], a ; $ff00+$70
	ld a, [wd000 + $800]
	ld [$be47], a
	pop af
	ld [rSVBK], a ; $ff00+$70
	call CloseSRAM
	ret

Function170881: ; 170881 (5c:4881)
	ld a, $1
	call GetSRAMBank
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $3
	ld [rSVBK], a ; $ff00+$70
	ld a, [$be47]
	ld [wd000 + $800], a
	pop af
	ld [rSVBK], a ; $ff00+$70
	call CloseSRAM
	ret

Function17089a: ; 17089a
	ld a, [wcfcd]
	and a
	jr z, .asm_1708ad
	callba Function14bcb
	jr z, .asm_1708ab
	xor a
	jr .asm_1708ad

.asm_1708ab
	ld a, $1

.asm_1708ad
	ld [ScriptVar], a
	ret
; 1708b1


Function1708b1: ; 1708b1 (5c:48b1)
	xor a
	ld [MusicFade], a
	call MaxVolume
	ret

Function1708b9: ; 1708b9 (5c:48b9)
	ld a, $1
	call GetSRAMBank
	ld a, [$be3c]
	ld [ScriptVar], a
	call CloseSRAM
	ret

Function1708c8: ; 1708c8 (5c:48c8)
	call UpdateTime
	ld a, $5
	call GetSRAMBank
	ld a, [CurDay]
	ld [$aa8b], a
	xor a
	ld [$aa8c], a
	ld a, [$aa5d]
	cp $2
	jr nc, .asm_1708ec
	ld a, [CurDay]
	ld [$aa48], a
	ld a, $1
	ld [$aa47], a
.asm_1708ec
	call CloseSRAM
	ret

Function1708f0: ; 1708f0 (5c:48f0)
	xor a
	ld [ScriptVar], a
	call UpdateTime
	ld a, $5
	call GetSRAMBank
	ld a, [$aa48]
	ld c, a
	ld a, [$aa47]
	call CloseSRAM
	and a
	ret z
	ld hl, CurDay
	ld a, c
	cp [hl]
	jr nz, Function170923
	ld a, $5
	call GetSRAMBank
	ld a, [$aa5d]
	call CloseSRAM
	cp $5
	ret c
	ld a, $1
	ld [ScriptVar], a
	ret


Function170923: ; 170923
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$aa48], a
	ld [$aa47], a
	ld hl, $aa5d
	ld bc, $0011
	call ByteFill
	call CloseSRAM
	ret
; 17093c


Function17093c: ; 17093c (5c:493c)
	xor a
	ld [ScriptVar], a
	ld a, EGG_TICKET
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	ret nc
	ld a, [PartyCount]
	ld b, 0
	ld c, a
	ld hl, PartySpecies
.asm_170955
	ld a, [hli]
	cp EGG
	jr nz, .asm_17099f
	push hl
	ld hl, PartyMonOT ; wddff (aliases: PartyMonOT)
	ld de, $6
	ld a, b
	and a
	jr z, .asm_170969
.asm_170965
	add hl, de
	dec a
	jr nz, .asm_170965
.asm_170969
	ld de, String_1709a4
	ld a, $6
.asm_17096e
	push af
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_17099d
	pop af
	dec a
	jr nz, .asm_17096e
rept 4
	dec hl
endr
	ld a, $50
rept 2
	ld [hli], a
endr
	pop hl
	ld a, EGG_TICKET
	ld [CurItem], a
	ld a, $1
	ld [wd10c], a
	ld a, $ff
	ld [wd107], a
	ld hl, NumItems
	call TossItem
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_17099d
	pop af
	pop hl
.asm_17099f
	inc b
	dec c
	jr nz, .asm_170955
	ret
; 1709a4 (5c:49a4)

String_1709a4: ; 1709a4
	db "なぞナゾ@@"

Function1709aa: ; 1709aa (5c:49aa)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $3
	ld [rSVBK], a ; $ff00+$70
	ld a, [StringBuffer2 + 10]
	ld [ScriptVar], a
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

Function1709bb: ; 1709bb (5c:49bb)
	xor a
	ld [ScriptVar], a
	ld a, $5
	call GetSRAMBank
	ld a, [$a800]
	call CloseSRAM
	cp 6
	jr nc, .asm_1709da
	ld e, a
	ld d, 0
	ld hl, Jumptable_1709e7
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
.asm_1709da
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$a800], a
	call CloseSRAM
	ret
; 1709e7 (5c:49e7)

Jumptable_1709e7: ; 1709e7
	dw Function170a00
	dw Function170a00
	dw Function1709f3
	dw Function1709f3
	dw Function170a01
	dw Function170a33
; 1709f3

Function1709f3: ; 1709f3
	ld a, $5
	call GetSRAMBank
	ld a, $1
	ld [$a800], a
	call CloseSRAM

Function170a00: ; 170a00
	ret
; 170a01

Function170a01: ; 170a01
	ld a, $5
	call GetSRAMBank
	ld hl, $b023
	ld de, $c608
	ld bc, $0069
	call CopyBytes
	ld a, [$a825]
	ld [wcd30], a
	ld a, [$a826]
	ld [wcd31], a
	call CloseSRAM
	callba Function11b6b4
	callba Function17d0f3
	ld a, $1
	ld [ScriptVar], a
	ret
; 170a33

Function170a33: ; 170a33
	ld a, $0
	call GetSRAMBank
	ld hl, wRTC
	ld de, $c608
	ld bc, $0004
	call CopyBytes
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	ld hl, $b08c
	ld de, $c608
	ld c, $4
.asm_170a54
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_170a78
	inc hl
	dec c
	jr nz, .asm_170a54
	call CloseSRAM
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetMapTrigger
	ld a, d
	or e
	jr z, .asm_170a72
	ld a, [de]
	and a
	ret nz

.asm_170a72
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_170a78
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$a800], a
	call CloseSRAM
	ld [ScriptVar], a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetMapTrigger
	ld a, d
	or e
	jr z, .asm_170a9b
	xor a
	ld [de], a

.asm_170a9b
	ret
; 170a9c

Function170a9c: ; 170a9c (5c:4a9c)
	ld c, $0
	jr asm_170aa2

Function170aa0: ; 170aa0 (5c:4aa0)
	ld c, $1
asm_170aa2: ; 170aa2 (5c:4aa2)
	ld a, $5
	call GetSRAMBank
	ld a, c
	ld [$aa8d], a
	call CloseSRAM
	ret

Function170aaf: ; 170aaf (5c:4aaf)
	ld a, $5
	call GetSRAMBank
	ld a, [$aa8d]
	ld [ScriptVar], a
	call CloseSRAM
	ret

Function170abe: ; 170abe (5c:4abe)
	call Function17089a
	ld a, [ScriptVar]
	and a
	ret z
	ld a, $1
	call GetSRAMBank
	ld a, [$be4f]
	and $1
	ld [ScriptVar], a
	call CloseSRAM
	ret

Function170ad7: ; 170ad7 (5c:4ad7)
	ld a, $1
	call GetSRAMBank
	ld a, [$be4f]
	or $1
	ld [$be4f], a
	call CloseSRAM
	ret

Function170ae8: ; 170ae8 (5c:4ae8)
	ld a, $5
	call GetSRAMBank
	ld a, [$b2fb]
	call CloseSRAM
	ld c, $a
	call SimpleDivide
	ld a, b
	ld [wcd4f], a
	xor a
	ld [ScriptVar], a
	callba Function119d93
	ret nc
	ld a, $5
	call GetSRAMBank
	ld a, [$b2fb]
	call CloseSRAM
	ld [ScriptVar], a
	ret

Function170b16: ; 170b16 (5c:4b16)
	ld a, $5
	call GetSRAMBank
	ld a, [$b2fb]
	call CloseSRAM
	ld c, 10
	call SimpleDivide
	ld a, b
	ld [wcd4f], a
	xor a
	ld [ScriptVar], a
	callba Function119dd1
	ret nc
	ld a, $5
	call GetSRAMBank
	ld a, [$b2fb]
	call CloseSRAM
	ld [ScriptVar], a
	ret

Function170b44: ; 170b44
	callba Function1f8000
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld hl, wd10a
	ld a, [hl]
	dec a
	ld c, a
	ld b, $0
	pop af
	ld [rSVBK], a
	ld hl, Unknown_170b90
	add hl, bc
	ld a, [hl]
	ld [wcd49], a
	ld a, [ScriptVar]
	dec a
	sla a
	ld e, a
	sla a
	sla a
	sla a
	ld c, a
	ld b, $0
	ld d, $0
	ld hl, MapObjects
	add hl, bc
	inc hl
	ld a, [wcd49]
	ld [hl], a
	ld hl, UsedSprites
	add hl, de
	ld [hli], a
	ld [$ffbd], a
	ld a, [hl]
	ld [$ffbe], a
	callba Function143c8
	ret
; 170b90

Unknown_170b90:
	db $12, $13, $14, $15, $18, $17
	db $16, $19, $04, $05, $11, $01
	db $1c, $1b, $21, $1e, $1a, $1d
	db $1f, $3c, $20, $27, $27, $27
	db $28, $0a, $23, $24, $2a, $2b
	db $35, $40, $2a, $29, $22, $25
	db $3a, $2b, $24, $49, $2b, $07
	db $2c, $2d, $4a, $0d, $4b, $3a
	db $2b, $41, $35, $27, $28, $27
	db $36, $3e, $30, $2c, $2d, $3d
	db $26, $2e, $06, $07, $43, $36

Function170bd2: ; 170bd2
	ret
; 170bd3

Function170bd3: ; 170bd3
	callba Function8b201
	jr c, .asm_170bde
	xor a
	jr .asm_170be0

.asm_170bde
	ld a, $1

.asm_170be0
	ld [ScriptVar], a
	ret
; 170be4

Function170be4: ; 170be4
	ld a, $5
	call GetSRAMBank
	xor a
	ld hl, $a894
	ld bc, $0008
	call ByteFill
	call CloseSRAM
	ret
; 170bf7

Function170bf7: ; 170bf7
	ld a, $5
	call GetSRAMBank
	ld hl, $a89a
	xor a
	ld [hli], a
	ld [hl], a
	call CloseSRAM
	ret
; 170c06

Function170c06: ; 170c06
	ld a, $5
	call GetSRAMBank
	ld hl, $a894
	ld a, [wd0ee]
	and a
	jr nz, .asm_170c15
	inc [hl]

.asm_170c15
rept 2
	inc hl
endr
	ld a, [$a89b]
	add [hl]
	ld [hld], a
	ld a, [$a89a]
	adc [hl]
	ld [hli], a
	jr nc, .asm_170c27
	ld a, $ff
	ld [hld], a
	ld [hli], a

.asm_170c27
	inc hl
	push hl
	ld de, 0
	xor a
	ld [wd265], a
.asm_170c30
	ld hl, PartyMon1HP
	ld a, [wd265]
	call GetPartyLocation
	ld a, [hli]
	ld b, a
	ld c, [hl]
rept 2
	inc hl
endr
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	push de
	pop hl
	add hl, bc
	push hl
	pop de
	jr c, .asm_170c58
	ld a, [wd265]
	inc a
	ld [wd265], a
	cp $3
	jr c, .asm_170c30
	jr .asm_170c5b

.asm_170c58
	ld de, -1

.asm_170c5b
	pop hl
	inc hl
	ld a, e
	add [hl]
	ld [hld], a
	ld a, d
	adc [hl]
	ld [hli], a
	jr nc, .asm_170c69
	ld a, $ff
	ld [hld], a
	ld [hli], a

.asm_170c69
	inc hl
	push hl
	ld b, $0
	ld c, $0
.asm_170c6f
	ld hl, PartyMon1HP
	ld a, b
	push bc
	call GetPartyLocation
	pop bc
	ld a, [hli]
	or [hl]
	jr nz, .asm_170c7d
	inc c

.asm_170c7d
	inc b
	ld a, b
	cp $3
	jr c, .asm_170c6f
	pop hl
	ld a, [hl]
	add c
	ld [hl], a
	call CloseSRAM
	ret
; 170c8b

Function170c8b: ; 170c8b
	ld hl, LastPlayerCounterMove
	ld b, $5
.asm_170c90
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec b
	jr nz, .asm_170c90
	ret
; 170c98

Function170c98: ; 170c98
	ld c, $3
	ld hl, $c608 + 13
.asm_170c9d
	push hl
	ld a, [hl]
	cp $fc
	jr c, .asm_170ca6
	ld a, $1
	ld [hl], a

.asm_170ca6
	inc hl
	ld b, $3
.asm_170ca9
	ld a, [hl]
	and a
	jr z, .asm_170cb1
	cp $fc
	jr c, .asm_170cb9

.asm_170cb1
	xor a
	ld [hl], a
	inc hl
	dec b
	jr nz, .asm_170cb1
	jr .asm_170cbd

.asm_170cb9
	inc hl
	dec b
	jr nz, .asm_170ca9

.asm_170cbd
	pop hl
	ld de, $003b
	add hl, de
	dec c
	jr nz, .asm_170c9d
	ret
; 170cc6

Function170cc6: ; 170cc6
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld hl, LZ_170d16
	ld de, wd000
	call Decompress
	ld a, $1
	ld [rVBK], a
	ld de, wd000
	ld hl, VTiles0
	lb bc, $6, $c1
	call Get2bpp
	xor a
	ld [rVBK], a
	ld hl, LZ_1715a4
	ld de, wd000
	call Decompress
	ld de, Unkn1Pals
	ld hl, VTiles0
	lb bc, $6, $53
	call Get2bpp
	pop af
	ld [rSVBK], a
	ret
; 170d02

Function170d02: ; 170d02
	ld a, $1
	ld [rVBK], a
	ld de, GFX_171848
	ld hl, $8c10
	lb bc, BANK(GFX_171848), $18
	call Get2bpp
	xor a
	ld [rVBK], a
	ret
; 170d16

LZ_170d16:
INCBIN "gfx/unknown/170d16.2bpp.lz"

LZ_1715a4:
INCBIN "gfx/unknown/1715a4.2bpp.lz"

GFX_171848:
INCBIN "gfx/unknown/171848.2bpp"

Function1719c8: ; 1719c8 (5c:59c8)
	ld a, [$ffaa]
	push af
	ld a, $1
	ld [$ffaa], a
	call Function1719d6
	pop af
	ld [$ffaa], a
	ret

Function1719d6: ; 1719d6 (5c:59d6)
	callba Function1183cb
	call Function1719ed
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	call Function171a11
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

Function1719ed: ; 1719ed (5c:59ed)
	xor a
	ld [wcd49], a
	ld [wcd4a], a
	dec a
	ld [wcd4b], a
	call WhiteBGMap
	call ClearSprites
	callba Function171d2b
	callba Function104061
	callba Function8cf53
	ret

Function171a11: ; 171a11 (5c:5a11)
	call Functiona57
	ld a, [wcd49]
	bit 7, a
	jr nz, .asm_171a2c
	call Function171a36
	callba Function8cf69
	callba Function104061
	jr Function171a11
.asm_171a2c
	callba Function8cf53
	call ClearSprites
	ret

Function171a36: ; 171a36 (5c:5a36)
	ld a, [wcd49]
	ld e, a
	ld d, 0
	ld hl, Jumptable_171a45
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_171a45: ; 171a45 (5c:5a45)
	dw Function171a95
	dw Function171ac9
	dw Function171a5d
	dw Function171ad7
	dw Function171a5d
	dw Function171aec
	dw Function171b4b
	dw Function171b85
	dw Function171bcc
	dw Function171c2c
	dw Function171c39
	dw Function171c41


Function171a5d: ; 171a5d (5c:5a5d)
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_171a6a
	bit 0, a
	ret nz
	jp Function171c66
.asm_171a6a
	ld a, $0
	call Function3e32
	ld [wc300], a
	ld a, l
	ld [wc301], a
	ld a, h
	ld [wc302], a
	ld a, $a
	call Function3e32
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $1
	ld [rSVBK], a ; $ff00+$70
	callba Function118452
	pop af
	ld [rSVBK], a ; $ff00+$70
	ld a, $a
	ld [wcd49], a
	ret

Function171a95: ; 171a95 (5c:5a95)
	callba Function171ccd
	hlcoord 2, 8
	ld de, String_171aa7
	call PlaceString
	jp Function171c66
; 171aa7 (5c:5aa7)

String_171aa7: ; 171aa7
	db   "モバイルアダプタに"
	next "せつぞく しています"
	next "しばらく おまちください"
	db   "@"
; 171ac9

Function171ac9: ; 171ac9 (5c:5ac9)
	ld de, wcd81
	ld hl, $5c
	ld a, $2
	call Function3e32
	jp Function171c66

Function171ad7: ; 171ad7 (5c:5ad7)
	xor a
	ld hl, $c608
	ld bc, $66
	call ByteFill
	ld de, $c608
	ld a, $c
	call Function3e32
	jp Function171c66

Function171aec: ; 171aec (5c:5aec)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $1
	ld [rSVBK], a ; $ff00+$70
	callba Function118452
	pop af
	ld [rSVBK], a ; $ff00+$70
	hlcoord 2, 6
	ld a, $8
.asm_171b01
	push af
	push hl
	xor a
	ld bc, $10
	call ByteFill
	pop hl
	ld de, $14
	add hl, de
	pop af
	dec a
	jr nz, .asm_171b01
	hlcoord 2, 7
	ld a, $3
	ld de, $c608
.asm_171b1b
	push af
	push hl
	ld a, [de]
	and a
	jr z, .asm_171b34
	ld a, [wcd4b]
	inc a
	ld [wcd4b], a
	push hl
	call Function171b42
	pop hl
	ld bc, $ffec
	add hl, bc
	call Function171b42
.asm_171b34
	pop hl
	ld bc, $14
rept 3
	add hl, bc
endr
	pop af
	dec a
	jr nz, .asm_171b1b
	jp Function171c66

Function171b42: ; 171b42 (5c:5b42)
	ld a, [de]
	inc de
	and a
	ret z
	sub $20
	ld [hli], a
	jr Function171b42

Function171b4b: ; 171b4b (5c:5b4b)
	lb de, $40, $10
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $8
	ld [hl], a
	lb de, $40, $98
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $9
	ld [hl], a
	lb de, $8a, $70
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $a
	ld [hl], a
	ld a, $4
	ld [wcd23], a
	ld a, $8
	ld [wcd24], a
	jp Function171c66

Function171b85: ; 171b85 (5c:5b85)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and $2
	jp nz, Function171b9f
	ld a, [hl]
	and $1
	jp nz, Function171bbd
	ld a, [hl]
	and $40
	jr nz, asm_171ba5
	ld a, [hl]
	and $80
	jr nz, asm_171baf
	ret

Function171b9f: ; 171b9f (5c:5b9f)
	ld a, $80
	ld [wcd49], a
	ret
asm_171ba5: ; 171ba5 (5c:5ba5)
	ld a, [wcd4a]
	and a
	ret z
	dec a
	ld [wcd4a], a
	ret
asm_171baf: ; 171baf (5c:5baf)
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4a]
	cp c
	ret z
	inc a
	ld [wcd4a], a
	ret

Function171bbd: ; 171bbd (5c:5bbd)
	call PlayClickSFX
	ld a, $8
	ld [wcd23], a
	xor a
	ld [wcd24], a
	jp Function171c66

Function171bcc: ; 171bcc (5c:5bcc)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and $2
	jp nz, Function171bdc
	ld a, [hl]
	and $1
	jp nz, Function171beb
	ret

Function171bdc: ; 171bdc (5c:5bdc)
	ld a, $4
	ld [wcd23], a
	ld a, $8
	ld [wcd24], a
	ld hl, wcd49
	dec [hl]
	ret

Function171beb: ; 171beb (5c:5beb)
	ld a, $5
	call GetSRAMBank
	ld a, [wcd4a]
	ld [$aa4a], a
	call CloseSRAM
	ld hl, MenuDataHeader_171c6b
	call LoadMenuDataHeader
	call Function1cbb
	call Function1cfd
	callba Function104061
	hlcoord 1, 14
	ld de, String_171c73
	call PlaceString
	ld a, [wcd4a]
	cp $2
	jr z, .asm_171c1f
	ld a, $8
	jr .asm_171c21
.asm_171c1f
	ld a, $c
.asm_171c21
	ld [wcd24], a
	ld a, $1e
	ld [wcd4c], a
	call Function171c66

Function171c2c: ; 171c2c (5c:5c2c)
	ld hl, wcd4c
	dec [hl]
	ret nz
	call ExitMenu
	call WhiteBGMap
	jr asm_171c60

Function171c39: ; 171c39 (5c:5c39)
	ld a, $28
	ld [wcd4c], a
	call Function171c66

Function171c41: ; 171c41 (5c:5c41)
	ld hl, wcd4c
	dec [hl]
	ret nz
	call WhiteBGMap
	callba Function106462
	callba Function106464
	ld a, $2
	ld [wc303], a
	callba Function17f555
asm_171c60: ; 171c60 (5c:5c60)
	ld a, $80
	ld [wcd49], a
	ret

Function171c66: ; 171c66 (5c:5c66)
	ld hl, wcd49
	inc [hl]
	ret
; 171c6b (5c:5c6b)

MenuDataHeader_171c6b: ; 171c6b
	db $40 ; flags
	db 12,  0 ; start coords
	db 17, 19 ; end coords
	dw NULL
	db 0 ; default option
; 171c73

String_171c73: ; 171c73
	db   "モバイルセンターを けってい"
	next "しました@"
; 171c87

Function171c87: ; 171c87 (5c:5c87)
	call DisableLCD
	ld hl, GFX_171db1
	ld de, $9000
	ld bc, $6e0
	call CopyBytes
	ld hl, LZ_172abd
	ld de, $8000
	call Decompress
	call EnableLCD
	ld hl, Tilemap_172491
	ld de, TileMap
	ld bc, $168
	call CopyBytes
	ld hl, Attrmap_1727ed
	ld de, AttrMap
	ld bc, $168
	call CopyBytes
	hlcoord 3, 2
	ld de, String_172e31
	call PlaceString
	hlcoord 3, 16
	ld de, String_172e3f
	call PlaceString
	ret

Function171ccd: ; 171ccd (5c:5ccd)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	ld hl, Palette_171d71
	ld de, Unkn1Pals
	ld bc, $40
	call CopyBytes
	ld hl, MovementAnimation
	ld a, $ff
	ld [hli], a
	ld a, $7f
	ld [hl], a
	call Function32f9
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

Function171cf0: ; 171cf0 (5c:5cf0)
	xor a
	hlcoord 4, 15
rept 2
	ld [hli], a
endr
	ld a, [wcd4b]
	xor $1
	ld [wcd4b], a
	and a
	jr nz, .asm_171d16
	ld hl, Tilemap_17251d
	decoord 0, 7
	ld bc, $8c
	call CopyBytes
	hlcoord 3, 16
	ld de, String_172e3f
	jp PlaceString
.asm_171d16
	ld hl, Tilemap_1725f9
	decoord 0, 7
	ld bc, $8c
	call CopyBytes
	hlcoord 3, 16
	ld de, String_172e4e
	jp PlaceString

Function171d2b: ; 171d2b (5c:5d2b)
	call DisableLCD
	ld hl, GFX_171db1
	ld de, $9000
	ld bc, $6e0
	call CopyBytes
	ld hl, LZ_172abd
	ld de, $8000
	call Decompress
	call EnableLCD
	ld hl, Tilemap_172685
	ld de, TileMap
	ld bc, $168
	call CopyBytes
	ld hl, Attrmap_172955
	ld de, AttrMap
	ld bc, $168
	call CopyBytes
	hlcoord 2, 2
	ld de, String_172e5d
	call PlaceString
	hlcoord 14, 16
	ld de, String_172e58
	call PlaceString
	ret
; 171d71 (5c:5d71)

Palette_171d71:
	RGB  0,  0,  0
	RGB  3,  0,  0
	RGB  5,  0,  0
	RGB 31, 31, 29
	RGB  0,  2, 10
	RGB  2, 10, 21
	RGB  0,  0,  0
	RGB 10, 26, 31
	RGB  0,  0,  0
	RGB  0,  7,  8
	RGB 31,  8,  0
	RGB  1, 17, 15
	RGB 31, 16,  0
	RGB 31, 22,  0
	RGB 31, 27,  0
	RGB 31, 31,  0
	RGB 31, 18,  6
	RGB  0,  3,  0
	RGB  0,  9,  0
	RGB  0, 12,  0
	RGB  0, 16,  0
	RGB  0, 22,  0
	RGB  0, 25,  0
	RGB  0, 27,  0
	RGB  5,  5, 16
	RGB  8, 19, 28
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 31, 29
	RGB 21, 21, 20
	RGB 11, 11, 10
	RGB  0,  0,  0
GFX_171db1:
INCBIN "gfx/unknown/171db1.2bpp"
Tilemap_172491:
INCBIN "gfx/unknown/172491.tilemap"
Tilemap_17251d:
INCBIN "gfx/unknown/17251d.tilemap"
Tilemap_1725f9:
INCBIN "gfx/unknown/1725f9.tilemap"
Tilemap_172685:
INCBIN "gfx/unknown/172685.tilemap"
Attrmap_1727ed:
INCBIN "gfx/unknown/1727ed.attrmap"
Attrmap_172955:
INCBIN "gfx/unknown/172955.attrmap"
LZ_172abd:
INCBIN "gfx/pokedex/slowpoke.2bpp.lz"

String_172e31: ; 172e31
	db "パスワード", $1f, "いれてください@"
String_172e3f: ; 172e3f
	db "きりかえ やめる  けってい@"
String_172e4e: ; 172e4e
	db "きりかえ やめる  "
String_172e58:
	db "けってい@"
String_172e5d: ; 172e5d
	db "せつぞくする モバイルセンターを"
	next "えらんで ください@"
; 172e78


Function172e78: ; 172e78 (5c:6e78)
	ld a, $7f
	ld hl, TileMap
	ld bc, $168
	call ByteFill
	ld a, $7
	ld hl, AttrMap
	ld bc, $168
	call ByteFill
	call DisableLCD
	ld hl, GFX_172f1f
	ld de, $9000
	ld bc, $610
	call CopyBytes
	call EnableLCD
	ld hl, Tilemap_1733af
	ld de, TileMap
	ld bc, $168
	call CopyBytes
	ld hl, Attrmap_173517
	ld de, AttrMap
	ld bc, $168
	call CopyBytes
	ret
; 172eb9 (5c:6eb9)

Function172eb9:
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $5
	ld [rSVBK], a ; $ff00+$70
	ld hl, Palette_172edf
	ld de, Unkn1Pals
	ld bc, $40
	call CopyBytes
	ld hl, Palette_172edf
	ld de, BGPals
	ld bc, $40
	call CopyBytes
	call Function32f9
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret
; 172edf (5c:6edf)

Palette_172edf:
	RGB  5, 12, 17
	RGB 31, 31, 31
	RGB 18, 25, 28
	RGB 10, 17, 21
	RGB  6, 13, 18
	RGB 31, 31, 31
	RGB 20, 26, 28
	RGB 12, 19, 23
	RGB  3, 10, 16
	RGB 31, 31, 31
	RGB  6, 13, 18
	RGB 20, 26, 28
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  5,  5, 16
	RGB  8, 19, 28
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

GFX_172f1f:
INCBIN "gfx/unknown/172f1f.2bpp"

Tilemap_1733af:
IF DEF(CORRUPT_TILES)
INCBIN "gfx/unknown/1733af_corrupt.tilemap"
ELSE
INCBIN "gfx/unknown/1733af.tilemap"
ENDC

Attrmap_173517:
INCBIN "gfx/unknown/173517.attrmap"
