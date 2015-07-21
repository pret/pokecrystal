PlayRadioShow: ; b8612
	ld a, [wd002]
	cp 8
	jr nc, .ok
	ld a, [StatusFlags2]
	bit 0, a
	jr z, .ok
	call IsInJohto
	and a
	jr nz, .ok
	ld a, 7
	ld [wd002], a
.ok
	ld a, [wd002]
	ld e, a
	ld d, 0
	ld hl, RadioJumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

RadioJumptable: ; b863a (2e:463a)
	dw MaryOakShow1
	dw MaryOakShow2
	dw BenMonMusic1
	dw DJReed1
	dw Functionb8f12
	dw Functionb8cbf
	dw Functionb8b50
	dw Functionb8e72
	dw Functionb8ef7
	dw Functionb8f00
	dw Functionb8f09
	dw Functionb8752
	dw Functionb875a
	dw Functionb8762
	dw Functionb8810
	dw Functionb8818
	dw Functionb883e
	dw Functionb8854
	dw Functionb88d9
	dw Functionb8a6c
	dw Functionb8aa4
	dw Functionb8aac
	dw Functionb8ab4
	dw Functionb8b40
	dw Functionb8b48
	dw Functionb8b63
	dw Functionb8b6b
	dw Functionb8b7d
	dw Functionb8b8f
	dw Functionb8b5b
	dw Functionb8bf5
	dw Functionb8bfd
	dw Functionb8c05
	dw Functionb8c0d
	dw Functionb8c15
	dw Functionb8c1d
	dw Functionb8c25
	dw Functionb8c3e
	dw Functionb8c46
	dw Functionb8c4e
	dw Functionb8c56
	dw Functionb8c5e
	dw Functionb8c6e
	dw Functionb8c76
	dw Functionb8cca
	dw Functionb8cd2
	dw Functionb8cf2
	dw Functionb8d56
	dw Functionb8ded
	dw Functionb8e28
	dw Functionb8e7d
	dw Functionb8e85
	dw Functionb8e8d
	dw Functionb8e95
	dw Functionb8e9d
	dw Functionb8ea5
	dw Functionb8ead
	dw Functionb8eb5
	dw Functionb8ebd
	dw Functionb896e
	dw Functionb8994
	dw Functionb89a9
	dw Functionb89c6
	dw Functionb89d7
	dw Functionb8f3f
	dw Functionb8f47
	dw Functionb8f55
	dw Functionb909c
	dw Functionb90a4
	dw Functionb90ac
	dw Functionb90c5
	dw Functionb90d2
	dw Functionb90da
	dw Functionb90e2
	dw Functionb90ea
	dw Functionb90f2
	dw Functionb90fa
	dw Functionb9102
	dw Functionb910a
	dw Functionb9112
	dw Functionb911a
	dw Functionb9122
	dw Functionb912a
	dw Functionb9152
	dw Functionb8728
	dw Functionb8abc
	dw Functionb8ac4
	dw Functionb8acc


Functionb86ea: ; b86ea (2e:46ea)
	ld [wd003], a
	ld hl, wd00c
	ld a, [wd005]
	cp $2
	jr nc, .asm_b870a
	inc hl
	ld [hl], $0
	inc a
	ld [wd005], a
	cp $2
	jr nz, .asm_b870a
	bccoord 1, 16
	call Function13e5
	jr .asm_b870d
.asm_b870a
	call PrintTextBoxText
.asm_b870d
	ld a, $54
	ld [wd002], a
	ld a, $64
	ld [wd004], a
	ret
; b8718 (2e:4718)

Functionb8718: ; b8718
	push hl
	ld b, $28
.asm_b871b
	ld a, [hl]
	cp $e8
	jr nz, .asm_b8722
	ld [hl], $7f

.asm_b8722
	inc hl
	dec b
	jr nz, .asm_b871b
	pop hl
	ret
; b8728

Functionb8728: ; b8728 (2e:4728)
	ld hl, wd004
	ld a, [hl]
	and a
	jr z, .asm_b8731
	dec [hl]
	ret
.asm_b8731
	ld a, [wd003]
	ld [wd002], a
	ld a, [wd005]
	cp $1
	call nz, Functionb8a0b
	jp Functionb8a17

MaryOakShow1: ; b8742 (2e:4742)
	ld a, $5
	ld [wd006], a
	call Functionb91eb
	ld hl, UnknownText_0xb8820
	ld a, $b
	jp NextRadioLine

Functionb8752: ; b8752 (2e:4752)
	ld hl, UnknownText_0xb8825
	ld a, $c
	jp NextRadioLine

Functionb875a: ; b875a (2e:475a)
	ld hl, UnknownText_0xb882a
	ld a, $d
	jp NextRadioLine

Functionb8762: ; b8762 (2e:4762)
	call Random
	and $1f
	cp $f
	jr nc, Functionb8762
	ld hl, Unknown_b87f2
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld b, [hl]
	inc hl
	ld c, [hl]
	push bc

	ld hl, WildMons1
.loop
	ld a, BANK(WildMons1)
	call GetFarByte
	cp $ff
	jr z, .done2
	inc hl
	cp b
	jr nz, .next
	ld a, BANK(WildMons1)
	call GetFarByte
	cp c
	jr z, .done
.next
	dec hl
	ld de, $2f
	add hl, de
	jr .loop

.done
rept 4
	inc hl
endr

.not3
	call Random
	and 3
	cp 3
	jr z, .not3

	ld bc, $e
	call AddNTimes
.loop2
	call Random
	and 7
	cp 2
	jr c, .loop2
	cp 5
	jr nc, .loop2
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	inc hl
	ld a, BANK(WildMons1)
	call GetFarByte
	ld [wd265], a
	ld [CurPartySpecies], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wd050
	ld bc, $b
	call CopyBytes

	pop bc
	call GetWorldMapLocation
	ld e, a
	callba GetLandmarkName
	ld hl, UnknownText_0xb882f
	call Functionb91dc
	ld a, $e
	jp Functionb86ea

.done2
	pop bc
	ld a, $0
	jp Functionb86ea
; b87f2 (2e:47f2)

Unknown_b87f2: ; b87f2
	map ROUTE_29
	map ROUTE_46
	map ROUTE_30
	map ROUTE_32
	map ROUTE_34
	map ROUTE_35
	map ROUTE_37
	map ROUTE_38
	map ROUTE_39
	map ROUTE_42
	map ROUTE_43
	map ROUTE_44
	map ROUTE_45
	map ROUTE_36
	map ROUTE_31
; b8810

Functionb8810: ; b8810 (2e:4810)
	ld hl, UnknownText_0xb8834
	ld a, $f
	jp NextRadioLine

Functionb8818: ; b8818 (2e:4818)
	ld hl, UnknownText_0xb8839
	ld a, $10
	jp NextRadioLine
; b8820 (2e:4820)

UnknownText_0xb8820: ; 0xb8820
	; MARY: PROF.OAK'S
	text_jump UnknownText_0x1bc81a
	db "@"
; 0xb8825

UnknownText_0xb8825: ; 0xb8825
	; #MON TALK!
	text_jump UnknownText_0x1bc82d
	db "@"
; 0xb882a

UnknownText_0xb882a: ; 0xb882a
	; With me, MARY!
	text_jump UnknownText_0x1bc83a
	db "@"
; 0xb882f

UnknownText_0xb882f: ; 0xb882f
	; OAK: @ @
	text_jump UnknownText_0x1bc84b
	db "@"
; 0xb8834

UnknownText_0xb8834: ; 0xb8834
	; may be seen around
	text_jump UnknownText_0x1bc858
	db "@"
; 0xb8839

UnknownText_0xb8839: ; 0xb8839
	; @ .
	text_jump UnknownText_0x1bc86d
	db "@"
; 0xb883e

Functionb883e: ; b883e (2e:483e)
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, UnknownText_0xb884f
	ld a, $11
	jp NextRadioLine
; b884f (2e:484f)

UnknownText_0xb884f: ; 0xb884f
	; MARY: @ 's
	text_jump UnknownText_0x1bc876
	db "@"
; 0xb8854

Functionb8854: ; b8854 (2e:4854)
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, Unknown_b8869
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $12
	jp NextRadioLine
; b8869 (2e:4869)

Unknown_b8869: ; b8869
	dw UnknownText_0xb8889
	dw UnknownText_0xb888e
	dw UnknownText_0xb8893
	dw UnknownText_0xb8898
	dw UnknownText_0xb889d
	dw UnknownText_0xb88a2
	dw UnknownText_0xb88a7
	dw UnknownText_0xb88ac
	dw UnknownText_0xb88b1
	dw UnknownText_0xb88b6
	dw UnknownText_0xb88bb
	dw UnknownText_0xb88c0
	dw UnknownText_0xb88c5
	dw UnknownText_0xb88ca
	dw UnknownText_0xb88cf
	dw UnknownText_0xb88d4
; b8889

UnknownText_0xb8889: ; 0xb8889
	; sweet and adorably
	text_jump UnknownText_0x1bc885
	db "@"
; 0xb888e

UnknownText_0xb888e: ; 0xb888e
	; wiggly and slickly
	text_jump UnknownText_0x1bc89a
	db "@"
; 0xb8893

UnknownText_0xb8893: ; 0xb8893
	; aptly named and
	text_jump UnknownText_0x1bc8af
	db "@"
; 0xb8898

UnknownText_0xb8898: ; 0xb8898
	; undeniably kind of
	text_jump UnknownText_0x1bc8c1
	db "@"
; 0xb889d

UnknownText_0xb889d: ; 0xb889d
	; so, so unbearably
	text_jump UnknownText_0x1bc8d6
	db "@"
; 0xb88a2

UnknownText_0xb88a2: ; 0xb88a2
	; wow, impressively
	text_jump UnknownText_0x1bc8ea
	db "@"
; 0xb88a7

UnknownText_0xb88a7: ; 0xb88a7
	; almost poisonously
	text_jump UnknownText_0x1bc8fe
	db "@"
; 0xb88ac

UnknownText_0xb88ac: ; 0xb88ac
	; ooh, so sensually
	text_jump UnknownText_0x1bc913
	db "@"
; 0xb88b1

UnknownText_0xb88b1: ; 0xb88b1
	; so mischievously
	text_jump UnknownText_0x1bc927
	db "@"
; 0xb88b6

UnknownText_0xb88b6: ; 0xb88b6
	; so very topically
	text_jump UnknownText_0x1bc93a
	db "@"
; 0xb88bb

UnknownText_0xb88bb: ; 0xb88bb
	; sure addictively
	text_jump UnknownText_0x1bc94e
	db "@"
; 0xb88c0

UnknownText_0xb88c0: ; 0xb88c0
	; looks in water is
	text_jump UnknownText_0x1bc961
	db "@"
; 0xb88c5

UnknownText_0xb88c5: ; 0xb88c5
	; evolution must be
	text_jump UnknownText_0x1bc975
	db "@"
; 0xb88ca

UnknownText_0xb88ca: ; 0xb88ca
	; provocatively
	text_jump UnknownText_0x1bc989
	db "@"
; 0xb88cf

UnknownText_0xb88cf: ; 0xb88cf
	; so flipped out and
	text_jump UnknownText_0x1bc999
	db "@"
; 0xb88d4

UnknownText_0xb88d4: ; 0xb88d4
	; heart-meltingly
	text_jump UnknownText_0x1bc9ae
	db "@"
; 0xb88d9

Functionb88d9: ; b88d9 (2e:48d9)
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, Unknown_b88fe
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd006]
	dec a
	ld [wd006], a
	ld a, $d
	jr nz, .asm_b88fb
	ld a, $5
	ld [wd006], a
	ld a, $3b
.asm_b88fb
	jp NextRadioLine
; b88fe (2e:48fe)

Unknown_b88fe: ; b88fe
	dw UnknownText_0xb891e
	dw UnknownText_0xb8923
	dw UnknownText_0xb8928
	dw UnknownText_0xb892d
	dw UnknownText_0xb8932
	dw UnknownText_0xb8937
	dw UnknownText_0xb893c
	dw UnknownText_0xb8941
	dw UnknownText_0xb8946
	dw UnknownText_0xb894b
	dw UnknownText_0xb8950
	dw UnknownText_0xb8955
	dw UnknownText_0xb895a
	dw UnknownText_0xb895f
	dw UnknownText_0xb8964
	dw UnknownText_0xb8969
; b891e

UnknownText_0xb891e: ; 0xb891e
	; cute.
	text_jump UnknownText_0x1bc9c0
	db "@"
; 0xb8923

UnknownText_0xb8923: ; 0xb8923
	; weird.
	text_jump UnknownText_0x1bc9c8
	db "@"
; 0xb8928

UnknownText_0xb8928: ; 0xb8928
	; pleasant.
	text_jump UnknownText_0x1bc9d1
	db "@"
; 0xb892d

UnknownText_0xb892d: ; 0xb892d
	; bold, sort of.
	text_jump UnknownText_0x1bc9dd
	db "@"
; 0xb8932

UnknownText_0xb8932: ; 0xb8932
	; frightening.
	text_jump UnknownText_0x1bc9ee
	db "@"
; 0xb8937

UnknownText_0xb8937: ; 0xb8937
	; suave & debonair!
	text_jump UnknownText_0x1bc9fd
	db "@"
; 0xb893c

UnknownText_0xb893c: ; 0xb893c
	; powerful.
	text_jump UnknownText_0x1bca11
	db "@"
; 0xb8941

UnknownText_0xb8941: ; 0xb8941
	; exciting.
	text_jump UnknownText_0x1bca1d
	db "@"
; 0xb8946

UnknownText_0xb8946: ; 0xb8946
	; groovy!
	text_jump UnknownText_0x1bca29
	db "@"
; 0xb894b

UnknownText_0xb894b: ; 0xb894b
	; inspiring.
	text_jump UnknownText_0x1bca33
	db "@"
; 0xb8950

UnknownText_0xb8950: ; 0xb8950
	; friendly.
	text_jump UnknownText_0x1bca40
	db "@"
; 0xb8955

UnknownText_0xb8955: ; 0xb8955
	; hot, hot, hot!
	text_jump UnknownText_0x1bca4c
	db "@"
; 0xb895a

UnknownText_0xb895a: ; 0xb895a
	; stimulating.
	text_jump UnknownText_0x1bca5d
	db "@"
; 0xb895f

UnknownText_0xb895f: ; 0xb895f
	; guarded.
	text_jump UnknownText_0x1bca6c
	db "@"
; 0xb8964

UnknownText_0xb8964: ; 0xb8964
	; lovely.
	text_jump UnknownText_0x1bca77
	db "@"
; 0xb8969

UnknownText_0xb8969: ; 0xb8969
	; speedy.
	text_jump UnknownText_0x1bca81
	db "@"
; 0xb896e

Functionb896e: ; b896e (2e:496e)
	callba Function91868
	ld hl, UnknownText_0xb8993
	call PrintText
	call WaitBGMap
	ld hl, UnknownText_0xb898e
	call PrintText
	ld a, $3c
	ld [wd002], a
	ld a, $64
	ld [wd004], a
	ret
; b898e (2e:498e)

UnknownText_0xb898e: ; 0xb898e
	; #MON
	text_jump UnknownText_0x1bca8b
	db "@"
; 0xb8993

UnknownText_0xb8993: ; 0xb8993
	db "@"
; 0xb8994

Functionb8994: ; b8994 (2e:4994)
	ld hl, wd004
	dec [hl]
	ret nz
	hlcoord 9, 14
	ld de, String_b89a4
	ld a, $3d
	jp Functionb8a00
; b89a4 (2e:49a4)

String_b89a4:
	db "#MON@"
; b89a9

Functionb89a9: ; b89a9 (2e:49a9)
	ld hl, wd004
	dec [hl]
	ret nz
	hlcoord 1, 16
	ld de, String_b89b9
	ld a, $3e
	jp Functionb8a00
; b89b9 (2e:49b9)

String_b89b9:
	db "#MON Channel@"
; b89c6

Functionb89c6: ; b89c6 (2e:49c6)
	ld hl, wd004
	dec [hl]
	ret nz
	hlcoord 12, 16
	ld de, String_b89d6
	ld a, $3f
	jp Functionb8a00
; b89d6 (2e:49d6)

String_b89d6:
	db "@"
; b89d7

Functionb89d7: ; b89d7 (2e:49d7)
	ld hl, wd004
	dec [hl]
	ret nz
	ld de, $1d
	callab Function91854
	ld hl, UnknownText_0xb89ff
	call PrintText
	ld a, $d
	ld [wd003], a
	xor a
	ld [wd005], a
	ld a, $54
	ld [wd002], a
	ld a, $a
	ld [wd004], a
	ret
; b89ff (2e:49ff)

UnknownText_0xb89ff: ; 0xb89ff
	db "@"
; 0xb8a00

Functionb8a00: ; b8a00 (2e:4a00)
	ld [wd002], a
	ld a, $64
	ld [wd004], a
	jp PlaceString

Functionb8a0b: ; b8a0b (2e:4a0b)
	hlcoord 0, 15
	decoord 0, 13
	ld bc, $28
	jp CopyBytes

Functionb8a17: ; b8a17 (2e:4a17)
	hlcoord 1, 15
	ld bc, $12
	ld a, $7f
	call ByteFill
	hlcoord 1, 16
	ld bc, $12
	ld a, $7f
	jp ByteFill

Functionb8a2d: ; b8a2d (2e:4a2d)
	push hl
	push de
	ld a, [CurPartySpecies]
	dec a
	rlca
	rlca
	and 3
	ld hl, .pokedexbanks
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret
; b8a42 (2e:4a42)

.pokedexbanks
	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)
; b8a46

MaryOakShow2: ; b8a46 (2e:4a46)
	call Functionb91eb
.asm_b8a49
	call Random
	cp CELEBI
	jr nc, .asm_b8a49
	ld c, a
	push bc
	ld a, c
	call CheckCaughtMon
	pop bc
	jr z, .asm_b8a49
	inc c
	ld a, c
	ld [CurPartySpecies], a
	ld [wd265], a
	call GetPokemonName
	ld hl, UnknownText_0xb8b30
	ld a, $13
	jp NextRadioLine

Functionb8a6c: ; b8a6c (2e:4a6c)
	ld a, [CurPartySpecies]
	dec a
	ld hl, PokedexDataPointerTable
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, BANK(PokedexDataPointerTable)
	call GetFarHalfword
	call Functionb8a2d
	push af
	push hl
	call Functionb8af3
	dec hl
	ld [hl], $57
	ld hl, wd26b
	call Functionb91dc
	pop hl
	pop af
	call Functionb8b11
rept 4
	inc hl
endr
	ld a, l
	ld [wd26b], a
	ld a, h
	ld [wd26c], a
	ld a, $14
	jp Functionb86ea

Functionb8aa4: ; b8aa4 (2e:4aa4)
	call Functionb8ad4
	ld a, $15
	jp Functionb86ea

Functionb8aac: ; b8aac (2e:4aac)
	call Functionb8ad4
	ld a, $16
	jp Functionb86ea

Functionb8ab4: ; b8ab4 (2e:4ab4)
	call Functionb8ad4
	ld a, $55
	jp Functionb86ea

Functionb8abc: ; b8abc (2e:4abc)
	call Functionb8ad4
	ld a, $56
	jp Functionb86ea

Functionb8ac4: ; b8ac4 (2e:4ac4)
	call Functionb8ad4
	ld a, $57
	jp Functionb86ea

Functionb8acc: ; b8acc (2e:4acc)
	call Functionb8ad4
	ld a, $1
	jp Functionb86ea

Functionb8ad4: ; b8ad4 (2e:4ad4)
	ld a, [wd26b]
	ld l, a
	ld a, [wd26c]
	ld h, a
	ld a, [wd26d]
	push af
	push hl
	call Functionb8af3
	dec hl
	ld [hl], $57
	ld hl, wd26b
	call Functionb91dc
	pop hl
	pop af
	call Functionb8b11
	ret

Functionb8af3: ; b8af3 (2e:4af3)
	ld de, wd26d
	ld bc, $13
	call FarCopyBytes
	ld hl, wd26b
	ld [hl], $0
	inc hl
	ld [hl], $4f
	inc hl
.asm_b8b05
	ld a, [hli]
	cp $50
	ret z
	cp $4e
	ret z
	cp $5f
	ret z
	jr .asm_b8b05

Functionb8b11: ; b8b11 (2e:4b11)
	ld d, a
.asm_b8b12
	ld a, d
	call GetFarByte
	inc hl
	cp $50
	jr z, .asm_b8b23
	cp $4e
	jr z, .asm_b8b23
	cp $5f
	jr nz, .asm_b8b12
.asm_b8b23
	ld a, l
	ld [wd26b], a
	ld a, h
	ld [wd26c], a
	ld a, d
	ld [wd26d], a
	ret
; b8b30 (2e:4b30)

UnknownText_0xb8b30: ; 0xb8b30
	; @ @
	text_jump UnknownText_0x1bca91
	db "@"
; 0xb8b35

BenMonMusic1: ; b8b35 (2e:4b35)
	call Functionb8b90
	ld hl, UnknownText_0xb8baa
	ld a, $17
	jp NextRadioLine

Functionb8b40: ; b8b40 (2e:4b40)
	ld hl, UnknownText_0xb8baf
	ld a, $18
	jp NextRadioLine

Functionb8b48: ; b8b48 (2e:4b48)
	ld hl, UnknownText_0xb8bb4
	ld a, $19
	jp NextRadioLine

Functionb8b50: ; b8b50 (2e:4b50)
	call Functionb8b90
	ld hl, UnknownText_0xb8bb9
	ld a, $1d
	jp NextRadioLine

Functionb8b5b: ; b8b5b (2e:4b5b)
	ld hl, UnknownText_0xb8bbe
	ld a, $19
	jp NextRadioLine

Functionb8b63: ; b8b63 (2e:4b63)
	ld hl, UnknownText_0xb8bc3
	ld a, $1a
	jp NextRadioLine

Functionb8b6b: ; b8b6b (2e:4b6b)
	call GetWeekday
	and 1
	ld hl, UnknownText_0xb8bc8
	jr z, .asm_b8b78
	ld hl, UnknownText_0xb8bcd
.asm_b8b78
	ld a, $1b
	jp NextRadioLine

Functionb8b7d: ; b8b7d (2e:4b7d)
	call GetWeekday
	and 1
	ld hl, UnknownText_0xb8bd2
	jr z, .asm_b8b8a
	ld hl, UnknownText_0xb8bd7
.asm_b8b8a
	ld a, $1c
	jp NextRadioLine

Functionb8b8f: ; b8b8f (2e:4b8f)
	ret

Functionb8b90: ; b8b90 (2e:4b90)
	call Function1052
	call PrintText
	ld de, MUSIC_POKEMON_MARCH
	call GetWeekday
	and 1
	jr z, .done
	ld de, MUSIC_POKEMON_LULLABY
.done
	callab Function91854
	ret
; b8baa (2e:4baa)

UnknownText_0xb8baa: ; 0xb8baa
	; BEN: #MON MUSIC
	text_jump UnknownText_0x1bca99
	db "@"
; 0xb8baf

UnknownText_0xb8baf: ; 0xb8baf
	; CHANNEL!
	text_jump UnknownText_0x1bcaab
	db "@"
; 0xb8bb4

UnknownText_0xb8bb4: ; 0xb8bb4
	; It's me, DJ BEN!
	text_jump UnknownText_0x1bcab6
	db "@"
; 0xb8bb9

UnknownText_0xb8bb9: ; 0xb8bb9
	; FERN: #MUSIC!
	text_jump UnknownText_0x1bcac8
	db "@"
; 0xb8bbe

UnknownText_0xb8bbe: ; 0xb8bbe
	; With DJ FERN!
	text_jump UnknownText_0x1bcad8
	db "@"
; 0xb8bc3

UnknownText_0xb8bc3: ; 0xb8bc3
	; Today's @ ,
	text_jump UnknownText_0x1bcae8
	db "@"
; 0xb8bc8

UnknownText_0xb8bc8: ; 0xb8bc8
	; so let us jam to
	text_jump UnknownText_0x1bcaf6
	db "@"
; 0xb8bcd

UnknownText_0xb8bcd: ; 0xb8bcd
	; so chill out to
	text_jump UnknownText_0x1bcb09
	db "@"
; 0xb8bd2

UnknownText_0xb8bd2: ; 0xb8bd2
	; #MON March!
	text_jump UnknownText_0x1bcb1b
	db "@"
; 0xb8bd7

UnknownText_0xb8bd7: ; 0xb8bd7
	; #MON Lullaby!
	text_jump UnknownText_0x1bcb29
	db "@"
; 0xb8bdc

DJReed1: ; b8bdc (2e:4bdc)
	call Functionb91eb
	callab Functionc434
	jr nc, .asm_b8bed
	callab Functionc422
.asm_b8bed
	ld hl, UnknownText_0xb8c7e
	ld a, $1e
	jp NextRadioLine

Functionb8bf5: ; b8bf5 (2e:4bf5)
	ld hl, UnknownText_0xb8c83
	ld a, $1f
	jp NextRadioLine

Functionb8bfd: ; b8bfd (2e:4bfd)
	ld hl, UnknownText_0xb8c88
	ld a, $20
	jp NextRadioLine

Functionb8c05: ; b8c05 (2e:4c05)
	ld hl, UnknownText_0xb8c8d
	ld a, $21
	jp NextRadioLine

Functionb8c0d: ; b8c0d (2e:4c0d)
	ld hl, UnknownText_0xb8c92
	ld a, $22
	jp NextRadioLine

Functionb8c15: ; b8c15 (2e:4c15)
	ld hl, UnknownText_0xb8c97
	ld a, $23
	jp NextRadioLine

Functionb8c1d: ; b8c1d (2e:4c1d)
	ld hl, UnknownText_0xb8c9c
	ld a, $24
	jp NextRadioLine

Functionb8c25: ; b8c25 (2e:4c25)
	ld hl, StringBuffer1
	ld de, wdc9f
	ld bc, $8205
	call PrintNum
	ld a, $50
	ld [StringBuffer1 + 5], a
	ld hl, UnknownText_0xb8ca1
	ld a, $25
	jp NextRadioLine

Functionb8c3e: ; b8c3e (2e:4c3e)
	ld hl, UnknownText_0xb8ca6
	ld a, $26
	jp NextRadioLine

Functionb8c46: ; b8c46 (2e:4c46)
	ld hl, UnknownText_0xb8c9c
	ld a, $27
	jp NextRadioLine

Functionb8c4e: ; b8c4e (2e:4c4e)
	ld hl, UnknownText_0xb8ca1
	ld a, $28
	jp NextRadioLine

Functionb8c56: ; b8c56 (2e:4c56)
	ld hl, UnknownText_0xb8cab
	ld a, $29
	jp NextRadioLine

Functionb8c5e: ; b8c5e (2e:4c5e)
	ld hl, UnknownText_0xb8cb0
	call Random
	and a
	ld a, $3
	jr nz, .asm_b8c6b
	ld a, $2a
.asm_b8c6b
	jp NextRadioLine

Functionb8c6e: ; b8c6e (2e:4c6e)
	ld hl, UnknownText_0xb8cb5
	ld a, $2b
	jp NextRadioLine

Functionb8c76: ; b8c76 (2e:4c76)
	ld hl, UnknownText_0xb8cba
	ld a, $3
	jp NextRadioLine
; b8c7e (2e:4c7e)

UnknownText_0xb8c7e: ; 0xb8c7e
	; REED: Yeehaw! How
	text_jump UnknownText_0x1bcb39
	db "@"
; 0xb8c83

UnknownText_0xb8c83: ; 0xb8c83
	; y'all doin' now?
	text_jump UnknownText_0x1bcb4d
	db "@"
; 0xb8c88

UnknownText_0xb8c88: ; 0xb8c88
	; Whether you're up
	text_jump UnknownText_0x1bcb60
	db "@"
; 0xb8c8d

UnknownText_0xb8c8d: ; 0xb8c8d
	; or way down low,
	text_jump UnknownText_0x1bcb73
	db "@"
; 0xb8c92

UnknownText_0xb8c92: ; 0xb8c92
	; don't you miss the
	text_jump UnknownText_0x1bcb86
	db "@"
; 0xb8c97

UnknownText_0xb8c97: ; 0xb8c97
	; LUCKY NUMBER SHOW!
	text_jump UnknownText_0x1bcb9a
	db "@"
; 0xb8c9c

UnknownText_0xb8c9c: ; 0xb8c9c
	; This week's Lucky
	text_jump UnknownText_0x1bcbaf
	db "@"
; 0xb8ca1

UnknownText_0xb8ca1: ; 0xb8ca1
	; Number is @ !
	text_jump UnknownText_0x1bcbc2
	db "@"
; 0xb8ca6

UnknownText_0xb8ca6: ; 0xb8ca6
	; I'll repeat that!
	text_jump UnknownText_0x1bcbd6
	db "@"
; 0xb8cab

UnknownText_0xb8cab: ; 0xb8cab
	; Match it and go to
	text_jump UnknownText_0x1bcbe9
	db "@"
; 0xb8cb0

UnknownText_0xb8cb0: ; 0xb8cb0
	; the RADIO TOWER!
	text_jump UnknownText_0x1bcbfe
	db "@"
; 0xb8cb5

UnknownText_0xb8cb5: ; 0xb8cb5
	; …Repeating myself
	text_jump UnknownText_0x1bcc11
	db "@"
; 0xb8cba

UnknownText_0xb8cba: ; 0xb8cba
	; gets to be a drag…
	text_jump UnknownText_0x1bcc25
	db "@"
; 0xb8cbf

Functionb8cbf: ; b8cbf (2e:4cbf)
	call Functionb91eb
	ld hl, UnknownText_0xb8ce3
	ld a, $2c
	jp NextRadioLine

Functionb8cca: ; b8cca (2e:4cca)
	ld hl, UnknownText_0xb8ce8
	ld a, $2d
	jp NextRadioLine

Functionb8cd2: ; b8cd2 (2e:4cd2)
	ld hl, UnknownText_0xb8ced
	call Random
	cp $7b
	ld a, $2e
	jr c, .asm_b8ce0
	ld a, $30
.asm_b8ce0
	jp NextRadioLine
; b8ce3 (2e:4ce3)

UnknownText_0xb8ce3: ; 0xb8ce3
	; PLACES AND PEOPLE!
	text_jump UnknownText_0x1bcc3a
	db "@"
; 0xb8ce8

UnknownText_0xb8ce8: ; 0xb8ce8
	; Brought to you by
	text_jump UnknownText_0x1bcc4f
	db "@"
; 0xb8ced

UnknownText_0xb8ced: ; 0xb8ced
	; me, DJ LILY!
	text_jump UnknownText_0x1bcc63
	db "@"
; 0xb8cf2

Functionb8cf2: ; b8cf2 (2e:4cf2)
	call Random
	and $7f
	inc a
	cp $43
	jr nc, Functionb8cf2
	push af
	ld hl, Unknown_b8d3e
	ld a, [StatusFlags]
	bit 6, a
	jr z, .NotMet
	ld hl, Unknown_b8d43
	ld a, [KantoBadges]
	cp %11111111
	jr nz, .NotMet
	ld hl, Unknown_b8d4b
.NotMet
	pop af
	ld c, a
	ld de, $1
	push bc
	call IsInArray
	pop bc
	jr c, Functionb8cf2
	push bc
	callab Function3952d
	ld de, StringBuffer1
	call CopyName1
	pop bc
	ld b, $1
	callab GetTrainerName
	ld hl, UnknownText_0xb8d51
	ld a, $2f
	jp NextRadioLine
; b8d3e (2e:4d3e)

Unknown_b8d3e: db $0b, $0d, $0e, $0f, $10
Unknown_b8d43: db $11, $12, $13, $15, $1a, $23, $2e, $40
Unknown_b8d4b: db $09, $0a, $0c, $2a, $3f
               db $ff
; b8d51

UnknownText_0xb8d51: ; 0xb8d51
	; @  @ @
	text_jump UnknownText_0x1bcc72
	db "@"
; 0xb8d56

Functionb8d56: ; b8d56 (2e:4d56)
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, Unknown_b8d7d
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	cp $a
	ld a, $5
	jr c, .asm_b8d7a
	call Random
	cp $7b
	ld a, $2e
	jr c, .asm_b8d7a
	ld a, $30
.asm_b8d7a
	jp NextRadioLine
; b8d7d (2e:4d7d)

Unknown_b8d7d: ; b8d7d
	dw UnknownText_0xb8d9d
	dw UnknownText_0xb8da2
	dw UnknownText_0xb8da7
	dw UnknownText_0xb8dac
	dw UnknownText_0xb8db1
	dw UnknownText_0xb8db6
	dw UnknownText_0xb8dbb
	dw UnknownText_0xb8dc0
	dw UnknownText_0xb8dc5
	dw UnknownText_0xb8dca
	dw UnknownText_0xb8dcf
	dw UnknownText_0xb8dd4
	dw UnknownText_0xb8dd9
	dw UnknownText_0xb8dde
	dw UnknownText_0xb8de3
	dw UnknownText_0xb8de8
; b8d9d

UnknownText_0xb8d9d: ; 0xb8d9d
	; is cute.
	text_jump UnknownText_0x1bcc80
	db "@"
; 0xb8da2

UnknownText_0xb8da2: ; 0xb8da2
	; is sort of lazy.
	text_jump UnknownText_0x1bcc8b
	db "@"
; 0xb8da7

UnknownText_0xb8da7: ; 0xb8da7
	; is always happy.
	text_jump UnknownText_0x1bcc9e
	db "@"
; 0xb8dac

UnknownText_0xb8dac: ; 0xb8dac
	; is quite noisy.
	text_jump UnknownText_0x1bccb1
	db "@"
; 0xb8db1

UnknownText_0xb8db1: ; 0xb8db1
	; is precocious.
	text_jump UnknownText_0x1bccc3
	db "@"
; 0xb8db6

UnknownText_0xb8db6: ; 0xb8db6
	; is somewhat bold.
	text_jump UnknownText_0x1bccd4
	db "@"
; 0xb8dbb

UnknownText_0xb8dbb: ; 0xb8dbb
	; is too picky!
	text_jump UnknownText_0x1bcce8
	db "@"
; 0xb8dc0

UnknownText_0xb8dc0: ; 0xb8dc0
	; is sort of OK.
	text_jump UnknownText_0x1bccf8
	db "@"
; 0xb8dc5

UnknownText_0xb8dc5: ; 0xb8dc5
	; is just so-so.
	text_jump UnknownText_0x1bcd09
	db "@"
; 0xb8dca

UnknownText_0xb8dca: ; 0xb8dca
	; is actually great.
	text_jump UnknownText_0x1bcd1a
	db "@"
; 0xb8dcf

UnknownText_0xb8dcf: ; 0xb8dcf
	; is just my type.
	text_jump UnknownText_0x1bcd2f
	db "@"
; 0xb8dd4

UnknownText_0xb8dd4: ; 0xb8dd4
	; is so cool, no?
	text_jump UnknownText_0x1bcd42
	db "@"
; 0xb8dd9

UnknownText_0xb8dd9: ; 0xb8dd9
	; is inspiring!
	text_jump UnknownText_0x1bcd54
	db "@"
; 0xb8dde

UnknownText_0xb8dde: ; 0xb8dde
	; is kind of weird.
	text_jump UnknownText_0x1bcd64
	db "@"
; 0xb8de3

UnknownText_0xb8de3: ; 0xb8de3
	; is right for me?
	text_jump UnknownText_0x1bcd78
	db "@"
; 0xb8de8

UnknownText_0xb8de8: ; 0xb8de8
	; is definitely odd!
	text_jump UnknownText_0x1bcd8b
	db "@"
; 0xb8ded

Functionb8ded: ; b8ded (2e:4ded)
	call Random
	cp $9
	jr nc, Functionb8ded
	ld hl, Unknown_b8e11
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld b, [hl]
	inc hl
	ld c, [hl]
	call GetWorldMapLocation
	ld e, a
	callba GetLandmarkName
	ld hl, UnknownText_0xb8e23
	ld a, $31
	jp NextRadioLine
; b8e11 (2e:4e11)

Unknown_b8e11: ; b8e11
	map PALLET_TOWN
	map ROUTE_22
	map PEWTER_CITY
	map CERULEAN_POLICE_STATION
	map ROUTE_12
	map ROUTE_11
	map ROUTE_16
	map ROUTE_14
	map CINNABAR_POKECENTER_2F_BETA
; b8e23

UnknownText_0xb8e23: ; 0xb8e23
	; @ @
	text_jump UnknownText_0x1bcda0
	db "@"
; 0xb8e28

Functionb8e28: ; b8e28 (2e:4e28)
	call Random
	and $f
	ld e, a
	ld d, 0
	ld hl, Unknown_b8e52
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Functionb91dc
	call Random
	cp $a
	ld a, $5
	jr c, .asm_b8e4f
	call Random
	cp $7b
	ld a, $2e
	jr c, .asm_b8e4f
	ld a, $30
.asm_b8e4f
	jp Functionb86ea
; b8e52 (2e:4e52)

Unknown_b8e52: ; b8e52
	dw UnknownText_0xb8d9d
	dw UnknownText_0xb8da2
	dw UnknownText_0xb8da7
	dw UnknownText_0xb8dac
	dw UnknownText_0xb8db1
	dw UnknownText_0xb8db6
	dw UnknownText_0xb8dbb
	dw UnknownText_0xb8dc0
	dw UnknownText_0xb8dc5
	dw UnknownText_0xb8dca
	dw UnknownText_0xb8dcf
	dw UnknownText_0xb8dd4
	dw UnknownText_0xb8dd9
	dw UnknownText_0xb8dde
	dw UnknownText_0xb8de3
	dw UnknownText_0xb8de8
; b8e72

Functionb8e72: ; b8e72 (2e:4e72)
	call Functionb91eb
	ld hl, UnknownText_0xb8ec5
	ld a, $32
	jp NextRadioLine

Functionb8e7d: ; b8e7d (2e:4e7d)
	ld hl, UnknownText_0xb8eca
	ld a, $33
	jp NextRadioLine

Functionb8e85: ; b8e85 (2e:4e85)
	ld hl, UnknownText_0xb8ecf
	ld a, $34
	jp NextRadioLine

Functionb8e8d: ; b8e8d (2e:4e8d)
	ld hl, UnknownText_0xb8ed4
	ld a, $35
	jp NextRadioLine

Functionb8e95: ; b8e95 (2e:4e95)
	ld hl, UnknownText_0xb8ed9
	ld a, $36
	jp NextRadioLine

Functionb8e9d: ; b8e9d (2e:4e9d)
	ld hl, UnknownText_0xb8ede
	ld a, $37
	jp NextRadioLine

Functionb8ea5: ; b8ea5 (2e:4ea5)
	ld hl, UnknownText_0xb8ee3
	ld a, $38
	jp NextRadioLine

Functionb8ead: ; b8ead (2e:4ead)
	ld hl, UnknownText_0xb8ee8
	ld a, $39
	jp NextRadioLine

Functionb8eb5: ; b8eb5 (2e:4eb5)
	ld hl, UnknownText_0xb8eed
	ld a, $3a
	jp NextRadioLine

Functionb8ebd: ; b8ebd (2e:4ebd)
	ld hl, UnknownText_0xb8ef2
	ld a, $7
	jp NextRadioLine
; b8ec5 (2e:4ec5)

UnknownText_0xb8ec5: ; 0xb8ec5
	; … …Ahem, we are
	text_jump UnknownText_0x1bcda8
	db "@"
; 0xb8eca

UnknownText_0xb8eca: ; 0xb8eca
	; TEAM ROCKET!
	text_jump UnknownText_0x1bcdba
	db "@"
; 0xb8ecf

UnknownText_0xb8ecf: ; 0xb8ecf
	; After three years
	text_jump UnknownText_0x1bcdc9
	db "@"
; 0xb8ed4

UnknownText_0xb8ed4: ; 0xb8ed4
	; of preparation, we
	text_jump UnknownText_0x1bcddd
	db "@"
; 0xb8ed9

UnknownText_0xb8ed9: ; 0xb8ed9
	; have risen again
	text_jump UnknownText_0x1bcdf2
	db "@"
; 0xb8ede

UnknownText_0xb8ede: ; 0xb8ede
	; from the ashes!
	text_jump UnknownText_0x1bce05
	db "@"
; 0xb8ee3

UnknownText_0xb8ee3: ; 0xb8ee3
	; GIOVANNI! @ Can you
	text_jump UnknownText_0x1bce17
	db "@"
; 0xb8ee8

UnknownText_0xb8ee8: ; 0xb8ee8
	; hear?@  We did it!
	text_jump UnknownText_0x1bce2e
	db "@"
; 0xb8eed

UnknownText_0xb8eed: ; 0xb8eed
	; @ Where is our boss?
	text_jump UnknownText_0x1bce44
	db "@"
; 0xb8ef2

UnknownText_0xb8ef2: ; 0xb8ef2
	; @ Is he listening?
	text_jump UnknownText_0x1bce5c
	db "@"
; 0xb8ef7

Functionb8ef7: ; b8ef7 (2e:4ef7)
	call Functionb91eb
	ld a, $1
	ld [wd005], a
	ret

Functionb8f00: ; b8f00 (2e:4f00)
	call Functionb91eb
	ld a, $1
	ld [wd005], a
	ret

Functionb8f09: ; b8f09 (2e:4f09)
	call Functionb91eb
	ld a, $1
	ld [wd005], a
	ret

Functionb8f12: ; b8f12 (2e:4f12)
	call Functionb9169
	jp nc, Functionb8f22
	ld a, [wd005]
	and a
	jp z, Functionb912a
	jp Functionb90c5

Functionb8f22: ; b8f22 (2e:4f22)
	call Functionb91eb
	ld a, [hBGMapMode] ; $ff00+$d4
	push af
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld de, String_b9171
	hlcoord 2, 9
	call PlaceString
	pop af
	ld [hBGMapMode], a ; $ff00+$d4
	ld hl, UnknownText_0xb9182
	ld a, $40
	jp NextRadioLine

Functionb8f3f: ; b8f3f (2e:4f3f)
	ld hl, UnknownText_0xb9187
	ld a, $41
	jp NextRadioLine

Functionb8f47: ; b8f47 (2e:4f47)
	call Functionb9169
	ld hl, UnknownText_0xb918c
	jp c, Functionb90b9
	ld a, $42
	jp NextRadioLine

Functionb8f55: ; b8f55 (2e:4f55)
	call Functionb9169
	jp c, Functionb90c5
	ld a, [wdc4a]
	ld hl, WeeklyFlags
	bit 7, [hl]
	jr nz, .asm_b8f83
.asm_b8f65
	call Random
	and $f
	cp $b
	jr nc, .asm_b8f65
	swap a
	ld e, a
.asm_b8f71
	call Random
	and $3
	cp $3
	jr nc, .asm_b8f71
	add e
	ld [wdc4a], a
	ld hl, WeeklyFlags
	set 7, [hl]
.asm_b8f83
	ld c, a
	call Functionb8f8f
	ld hl, UnknownText_0xb9191
	ld a, $43
	jp NextRadioLine

Functionb8f8f: ; b8f8f
	ld a, c
	swap a
	and $f
	ld hl, Unknown_b8ff9
	ld d, 0
	ld e, a
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	push hl
	inc hl
	ld a, c
	and $f
	ld c, a
	push hl
	ld hl, Jumptable_b8fb8
	ld e, b
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	call _hl_
	pop hl
	ld c, [hl]
	ret
; b8fb8


Jumptable_b8fb8: ; b8fb8 (2e:4fb8)
	dw Functionb8fc0
	dw Functionb8fc7
	dw Functionb8fce
	dw Functionb8fde


Functionb8fc0: ; b8fc0 (2e:4fc0)
	call Functionb8fd5
	call GetPokemonName
	ret

Functionb8fc7: ; b8fc7 (2e:4fc7)
	call Functionb8fd5
	call GetItemName
	ret

Functionb8fce: ; b8fce (2e:4fce)
	call Functionb8fd5
	call GetMoveName
	ret

Functionb8fd5: ; b8fd5 (2e:4fd5)
	ld h, 0
	ld l, c
	add hl, de
	ld a, [hl]
	ld [wd265], a
	ret

Functionb8fde: ; b8fde (2e:4fde)
	ld a, c
	and a
	jr z, .asm_b8feb
.asm_b8fe2
	ld a, [de]
	inc de
	cp $50
	jr nz, .asm_b8fe2
	dec c
	jr nz, .asm_b8fe2
.asm_b8feb
	ld hl, StringBuffer1
.asm_b8fee
	ld a, [de]
	inc de
	ld [hli], a
	cp $50
	jr nz, .asm_b8fee
	ld de, StringBuffer1
	ret
; b8ff9 (2e:4ff9)

Unknown_b8ff9: ; b8ff9
	dw Unknown_b900f
	dw Unknown_b9014
	dw Unknown_b9019
	dw Unknown_b901e
	dw Unknown_b9023
	dw Unknown_b9028
	dw Unknown_b902d
	dw Unknown_b905a
	dw Unknown_b906d
	dw Unknown_b9072
	dw Unknown_b9077
; b900f

Unknown_b900f: db 0, 10, CYNDAQUIL, TOTODILE, CHIKORITA
Unknown_b9014: db 1, 12, FRESH_WATER, SODA_POP, LEMONADE
Unknown_b9019: db 1, 12, POTION, ANTIDOTE, PARLYZ_HEAL
Unknown_b901e: db 1, 12, POKE_BALL, GREAT_BALL, ULTRA_BALL
Unknown_b9023: db 0, 10, PIKACHU, RATTATA, GEODUDE
Unknown_b9028: db 0, 10, HOOTHOOT, SPINARAK, DROWZEE
Unknown_b902d: db 3, 16, "NEW BARK TOWN@", "CHERRYGROVE CITY@", "AZALEA TOWN@"
Unknown_b905a: db 3,  6, "FLYING@", "BUG@", "GRASS@"
Unknown_b906d: db 2, 12, TACKLE, GROWL, MUD_SLAP
Unknown_b9072: db 1, 12, X_ATTACK, X_DEFEND, X_SPEED
Unknown_b9077: db 3, 13, "#MON Talk@", "#MON Music@", "Lucky Channel@"
; b909c

Functionb909c: ; b909c (2e:509c)
	ld hl, UnknownText_0xb9196
	ld a, $44
	jp NextRadioLine

Functionb90a4: ; b90a4 (2e:50a4)
	ld hl, UnknownText_0xb919b
	ld a, $45
	jp NextRadioLine

Functionb90ac: ; b90ac (2e:50ac)
	call Functionb9169
	ld hl, UnknownText_0xb91a0
	jr c, Functionb90b9
	ld a, $4
	jp NextRadioLine

Functionb90b9: ; b90b9 (2e:50b9)
	push hl
	ld hl, WeeklyFlags
	res 7, [hl]
	pop hl
	ld a, $46
	jp NextRadioLine

Functionb90c5: ; b90c5 (2e:50c5)
	ld hl, WeeklyFlags
	res 7, [hl]
	ld hl, UnknownText_0xb91d2
	ld a, $47
	jp NextRadioLine

Functionb90d2: ; b90d2 (2e:50d2)
	ld hl, UnknownText_0xb91a5
	ld a, $48
	jp NextRadioLine

Functionb90da: ; b90da (2e:50da)
	ld hl, UnknownText_0xb91aa
	ld a, $49
	jp NextRadioLine

Functionb90e2: ; b90e2 (2e:50e2)
	ld hl, UnknownText_0xb91af
	ld a, $4a
	jp NextRadioLine

Functionb90ea: ; b90ea (2e:50ea)
	ld hl, UnknownText_0xb91b4
	ld a, $4b
	jp NextRadioLine

Functionb90f2: ; b90f2 (2e:50f2)
	ld hl, UnknownText_0xb91b9
	ld a, $4c
	jp NextRadioLine

Functionb90fa: ; b90fa (2e:50fa)
	ld hl, UnknownText_0xb91be
	ld a, $4d
	jp NextRadioLine

Functionb9102: ; b9102 (2e:5102)
	ld hl, UnknownText_0xb91c3
	ld a, $4e
	jp NextRadioLine

Functionb910a: ; b910a (2e:510a)
	ld hl, UnknownText_0xb91c8
	ld a, $4f
	jp NextRadioLine

Functionb9112: ; b9112 (2e:5112)
	ld hl, UnknownText_0xb91cd
	ld a, $50
	jp NextRadioLine

Functionb911a: ; b911a (2e:511a)
	ld hl, UnknownText_0xb91d2
	ld a, $51
	jp NextRadioLine

Functionb9122: ; b9122 (2e:5122)
	ld hl, UnknownText_0xb91d2
	ld a, $52
	jp NextRadioLine

Functionb912a: ; b912a (2e:512a)
	ld a, [hBGMapMode] ; $ff00+$d4
	push af
	callba NoRadioMusic
	callba NoRadioName
	pop af
	ld [hBGMapMode], a ; $ff00+$d4
	ld hl, WeeklyFlags
	res 7, [hl]
	ld a, $4
	ld [wd002], a
	xor a
	ld [wd005], a
	ld hl, UnknownText_0xb91d7
	ld a, $53
	jp NextRadioLine

Functionb9152: ; b9152 (2e:5152)
	ld a, $4
	ld [wd002], a
	xor a
	ld [wd005], a
	call Functionb9169
	jp nc, Functionb8f12
	ld hl, UnknownText_0xb91d7
	ld a, $53
	jp NextRadioLine

Functionb9169: ; b9169 (2e:5169)
	call UpdateTime
	ld a, [hHours] ; $ff00+$94
	cp $12
	ret
; b9171 (2e:5171)

String_b9171:
	db "BUENA'S PASSWORD@"
; b9182

UnknownText_0xb9182: ; 0xb9182
	; BUENA: BUENA here!
	text_jump UnknownText_0x1bce72
	db "@"
; 0xb9187

UnknownText_0xb9187: ; 0xb9187
	; Today's password!
	text_jump UnknownText_0x1bce87
	db "@"
; 0xb918c

UnknownText_0xb918c: ; 0xb918c
	; Let me think… It's
	text_jump UnknownText_0x1bce9a
	db "@"
; 0xb9191

UnknownText_0xb9191: ; 0xb9191
	; @ !
	text_jump UnknownText_0x1bceae
	db "@"
; 0xb9196

UnknownText_0xb9196: ; 0xb9196
	; Don't forget it!
	text_jump UnknownText_0x1bceb7
	db "@"
; 0xb919b

UnknownText_0xb919b: ; 0xb919b
	; I'm in GOLDENROD's
	text_jump UnknownText_0x1bcec9
	db "@"
; 0xb91a0

UnknownText_0xb91a0: ; 0xb91a0
	; RADIO TOWER!
	text_jump UnknownText_0x1bcedc
	db "@"
; 0xb91a5

UnknownText_0xb91a5: ; 0xb91a5
	; BUENA: Oh my…
	text_jump UnknownText_0x1bceeb
	db "@"
; 0xb91aa

UnknownText_0xb91aa: ; 0xb91aa
	; It's midnight! I
	text_jump UnknownText_0x1bcefb
	db "@"
; 0xb91af

UnknownText_0xb91af: ; 0xb91af
	; have to shut down!
	text_jump UnknownText_0x1bcf0d
	db "@"
; 0xb91b4

UnknownText_0xb91b4: ; 0xb91b4
	; Thanks for tuning
	text_jump UnknownText_0x1bcf22
	db "@"
; 0xb91b9

UnknownText_0xb91b9: ; 0xb91b9
	; in to the end! But
	text_jump UnknownText_0x1bcf36
	db "@"
; 0xb91be

UnknownText_0xb91be: ; 0xb91be
	; don't stay up too
	text_jump UnknownText_0x1bcf4b
	db "@"
; 0xb91c3

UnknownText_0xb91c3: ; 0xb91c3
	; late! Presented to
	text_jump UnknownText_0x1bcf5e
	db "@"
; 0xb91c8

UnknownText_0xb91c8: ; 0xb91c8
	; you by DJ BUENA!
	text_jump UnknownText_0x1bcf73
	db "@"
; 0xb91cd

UnknownText_0xb91cd: ; 0xb91cd
	; I'm outta here!
	text_jump UnknownText_0x1bcf86
	db "@"
; 0xb91d2

UnknownText_0xb91d2: ; 0xb91d2
	; …
	text_jump UnknownText_0x1bcf96
	db "@"
; 0xb91d7

UnknownText_0xb91d7: ; 0xb91d7
	;
	text_jump UnknownText_0x1bcf99
	db "@"
; 0xb91dc

Functionb91dc: ; b91dc (2e:51dc)
	ld a, [hl]
	cp $16 ; TX_FAR
	jp z, FarJumpText
	ld de, wd00c
	ld bc, $28
	jp CopyBytes

Functionb91eb: ; b91eb (2e:51eb)
	ld a, [wd005]
	and a
	ret nz
	call Function1052
	call PrintText
	ld hl, RadioChannelSongs
	ld a, [wd002]
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	callab Function91854
	ret
; b920b (2e:520b)

RadioChannelSongs: ; b920b
	dw MUSIC_POKEMON_TALK
	dw MUSIC_POKEMON_CENTER
	dw MUSIC_TITLE
	dw MUSIC_GAME_CORNER
	dw MUSIC_BUENAS_PASSWORD
	dw MUSIC_VIRIDIAN_CITY
	dw MUSIC_BICYCLE
	dw MUSIC_ROCKET_OVERTURE
	dw MUSIC_POKE_FLUTE_CHANNEL
	dw MUSIC_RUINS_OF_ALPH_RADIO
	dw MUSIC_LAKE_OF_RAGE_ROCKET_RADIO
; b9221

NextRadioLine: ; b9221 (2e:5221)
	push af
	call Functionb91dc
	pop af
	jp Functionb86ea
; b9229
