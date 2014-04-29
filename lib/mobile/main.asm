; A library included as part of the Mobile Adapter GB SDK.

INCLUDE "gbhw.asm"


SECTION "Main", ROMX

; known jump sources: 110004 (44:4004), 111bdd (44:5bdd), 111bfd (44:5bfd), 111c0e (44:5c0e), 111c7d (44:5c7d), 111cbd (44:5cbd), 111cf4 (44:5cf4), 111d30 (44:5d30)
Function110000: ; 110000 (44:4000)
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, Function110000
	ret
; 110007 (44:4007)

INCBIN "baserom.gbc",$110007,$110029 - $110007

; known jump sources: 111aa8 (44:5aa8), 111ad4 (44:5ad4)
Function110029: ; 110029 (44:4029)
	xor a
	ld hl, $ca3a
	ld [hli], a
	ld [hl], a
	ret

; known jump sources: 3e5d (0:3e5d)
Function110030:: ; 110030 (44:4030)
	push de
	ld a, [$c988]
	cp $c
	jr z, .asm_110047
	cp $e
	jr z, .asm_110047
	cp $10
	jr z, .asm_110047
	xor a
	ld [$c835], a
	ld a, [$c988]
.asm_110047
	ld d, $0
	ld e, a
	ld hl, $4070
	add hl, de
	ld a, [hli]
	ld [$c988], a
	ld a, [hl]
	pop de
	ld hl, $3e60
	push hl
	ld h, a
	ld a, [$c988]
	ld l, a
	push hl
	ld a, $36
	cp l
	jr nz, .asm_110066
	ld a, $42
	cp h
.asm_110066
	call nz, Function1100b4
	ld hl, $c986
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 110070 (44:4070)

INCBIN "baserom.gbc",$110070,$1100b4 - $110070

; known jump sources: 110066 (44:4066), 111f07 (44:5f07)
Function1100b4: ; 1100b4 (44:40b4)
	push bc
.asm_1100b5
	di
	ld a, [OverworldMap] ; $c800
	ld b, a
	ld a, [$c80b]
	ld c, a
	ld a, [$c822]
	ei
	or a
	bit 0, a
	jr z, .asm_1100da
	ld a, b
	or a
	jr nz, .asm_1100b5
	ld a, c
	cp $4
	jr z, .asm_1100b5
	xor a
	ld [$c80f], a
	ld hl, $c821
	set 1, [hl]
	scf
.asm_1100da
	pop bc
	ret
; 1100dc (44:40dc)

INCBIN "baserom.gbc",$1100dc,$110226 - $1100dc

; known jump sources: 111f12 (44:5f12)
Function110226: ; 110226 (44:4226)
	ld a, $21
	ld [$c80f], a
	ld hl, $c821
	set 1, [hl]
	ret
; 110231 (44:4231)

INCBIN "baserom.gbc", $110231, $110fad - $110231

URIPrefix: ; 0x110fad
	ascii "http://"
HTTPDownloadURL: ; 0x110fb4
	ascii "gameboy.datacenter.ne.jp/cgb/download"
HTTPUploadURL: ; 0x110fd9
	ascii "gameboy.datacenter.ne.jp/cgb/upload"
HTTPUtilityURL: ; 0x110ffc
	ascii "gameboy.datacenter.ne.jp/cgb/utility"
HTTPRankingURL: ; 0x111020
	ascii "gameboy.datacenter.ne.jp/cgb/ranking"

INCBIN "baserom.gbc", $111044, $11164f - $111044

; known jump sources: 111aab (44:5aab)
Function11164f: ; 11164f (44:564f)
	ld hl, $c815
	xor a
	ld [hli], a
	ld a, [$c81f]
	ld b, a
	ld a, [$c818]
	ld a, b
	srl a
	srl a
	add b
	add b
	ld [hl], a
	ret

; known jump sources: 111895 (44:5895), 1118d6 (44:58d6)
Function111664: ; 111664 (44:5664)
	ld hl, $ca3a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [$c81e]
	cp $ff
	jr z, .asm_111679
	ld a, [$c822]
	bit 0, a
	jr z, .asm_11167c
.asm_111679
	ld hl, $ca2f
.asm_11167c
	add hl, de
	ld [hl], c
	inc de
	ld hl, $ca3a
	ld a, e
	ld [hli], a
	ld [hl], d
	ret

; known jump sources: 11198b (44:598b), 111996 (44:5996)
Function111686: ; 111686 (44:5686)
	xor a
	ld [rTAC], a ; $ff00+$7
	ld c, $ff
	ld a, [$ff00+c]
	and $f3
	ld [$ff00+c], a
	ld a, [$cb48]
	ld [$c86a], a
	ld a, [$cb47]
	ld c, a
	ld hl, $c821
	ld a, [hl]
	or c
	ld [hl], a
	ret
; 1116a0 (44:56a0)

INCBIN "baserom.gbc",$1116a0,$1116c5 - $1116a0

; known jump sources: 3e89 (0:3e89)
Function1116c5:: ; 1116c5 (44:56c5)
	ld a, [OverworldMap] ; $c800
	rrca
	jp nc, Function1118bc
	rrca
	jp c, Function1117e7
	ld hl, $c801
	ld a, [hli]
	ld d, [hl]
	ld e, a
	dec de
	ld a, d
	ld [hld], a
	ld a, e
	ld [hl], a
	cp $2
	jp nc, Function1118bc
	ld a, d
	or a
	jp nz, Function1118bc
	ld hl, $c808
	add hl, de
	ld a, [rSB] ; $ff00+$1
	ld [hl], a
	ld a, $8
	cp l
	jp nz, Function1118bc
	ld a, [$c81e]
	cp $ff
	jr z, .asm_111716
	ld a, $f2
	cp [hl]
	jp z, Function111796
	dec a
	cp [hl]
	jp z, Function1117a0
	dec a
	cp [hl]
	jp z, Function1117a0
	ld a, [$c807]
	cp $1
	jr nz, .asm_111716
	ld a, [$c806]
	or a
	jr z, .asm_111778
.asm_111716
	ld a, [$c81e]
	cp $ff
	jr z, .asm_111730
	cp $ee
	jr z, .asm_111727
	cp $9f
	jr nz, .asm_111727
	ld a, $95
.asm_111727
	cp [hl]
	jr nz, asm_11179a
	ld a, [$c818]
	or a
	jr z, .asm_111730
.asm_111730
	xor a
	ld [$c819], a
	ld a, $3
	ld [OverworldMap], a ; $c800
	xor a
	ld hl, $c80a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld hl, $c81f
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld hl, $c815
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, [$c822]
	bit 0, a
	jr z, .asm_111757
	ld a, $b
	jr .asm_111774
.asm_111757
	ld a, [$c81e]
	cp $ff
	jr z, .asm_11176e
	cp $92
	jr z, .asm_111772
	cp $a3
	jr z, .asm_111772
	cp $a8
	jr z, .asm_111772
	ld a, $20
	jr .asm_111774
.asm_11176e
	ld a, $3
	jr .asm_111774
.asm_111772
	ld a, $60
.asm_111774
	ld [hl], a
	jp Function1118bc
.asm_111778
	xor a
	ld [OverworldMap], a ; $c800

; known jump sources: 111861 (44:5861)
Function11177c: ; 11177c (44:577c)
	ld hl, $c820
	ld a, [hld]
	ld e, a
	ld a, [hl]
	dec a
	ld b, $3
.asm_111785
	or a
	rra
	rr e
	dec b
	jr nz, .asm_111785
	or a
	inc a
	ld hl, $c816
	ld [hld], a
	ld [hl], e
	jp Function1118bc

; known jump sources: 1116fc (44:56fc)
Function111796: ; 111796 (44:5796)
	ld b, $a
	jr asm_1117a2
asm_11179a: ; 11179a (44:579a)
	xor a
	ld [hli], a
	ld [hl], a
	jp Function1118bc

; known jump sources: 111701 (44:5701), 111706 (44:5706)
Function1117a0: ; 1117a0 (44:57a0)
	ld b, $3
asm_1117a2: ; 1117a2 (44:57a2)
	ld hl, $c822
	set 3, [hl]
	ld hl, $c815
	ld a, [$c820]
	ld [hli], a
	ld a, [$c81f]
	ld [hl], a
	xor a
	ld [OverworldMap], a ; $c800
	ld hl, $c819
	inc [hl]
	ld a, b
	cp [hl]
	jp nc, Function1118bc
	xor a
	ld hl, $c806
	ld [hli], a
	ld [OverworldMap], a ; $c800
	ld a, $6
	ld [hl], a
	ld hl, $c821
	set 1, [hl]
	ld a, $15
	ld [$c80f], a
	ld hl, $c810
	ld a, [$c808]
	and $f
	cp $2
	jr nz, .asm_1117e1
	inc a
.asm_1117e1
	ld [hli], a
	xor a
	ld [hl], a
	jp Function1118bc

; known jump sources: 1116cd (44:56cd)
Function1117e7: ; 1117e7 (44:57e7)
	ld a, [$c80b]
	or a
	jr z, .asm_1117f8
	dec a
	jp z, Function11186e
	dec a
	jp z, Function111884
	jp Function111892
.asm_1117f8
	ld hl, $c80a
	ld a, [hl]
	or a
	jr nz, .asm_111803
	ld b, $99
	jr .asm_111805
.asm_111803
	ld b, $66
.asm_111805
	ld a, [rSB] ; $ff00+$1
	cp b
	jr z, .asm_111840
	cp $d2
	jr nz, .asm_111817
	xor a
	ld [$c9ae], a
.asm_111812
	xor a
	ld [hl], a
	jp Function1118bc
.asm_111817
	ld a, [$c9ae]
	inc a
	ld [$c9ae], a
	cp $14
	jr c, .asm_111812
	ld a, $6
	ld [$c807], a
	ld a, $10
	ld [$c80f], a
	xor a
	ld [OverworldMap], a ; $c800
	ld hl, $c822
	res 0, [hl]
	ld hl, $c821
	ld a, [hl]
	set 1, a
	and $f
	ld [hl], a
	jr Function1118bc
.asm_111840
	inc [hl]
	ld a, $2
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	inc [hl]
	ld hl, $c812
	ld b, $3
.asm_11184e
	ld [hli], a
	dec b
	jr nz, .asm_11184e
	ld a, [$c822]
	bit 4, a
	jr z, .asm_111864
	ld b, a
	ld a, [$c821]
	bit 3, a
	jr nz, .asm_111864
	jp Function11177c
.asm_111864
	ld a, [$c820]
	ld [hli], a
	ld a, [$c81f]
	ld [hl], a
	jr Function1118bc

; known jump sources: 1117ee (44:57ee)
Function11186e: ; 11186e (44:586e)
	call Function1118c2
	ld a, $4
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	ld a, [rSB] ; $ff00+$1
	ld [$c80c], a
	inc [hl]
	or a
	jr nz, Function1118bc
	inc [hl]
	jr Function1118bc

; known jump sources: 1117f2 (44:57f2)
Function111884: ; 111884 (44:5884)
	call Function1118c2
	ld a, [$c80c]
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	inc [hl]
	jr Function1118bc

; known jump sources: 1117f5 (44:57f5)
Function111892: ; 111892 (44:5892)
	ld a, [rSB] ; $ff00+$1
	ld c, a
	call Function111664
	ld hl, $c80a
	inc [hl]
	ld a, $2
	cp [hl]
	jr c, .asm_1118b4
	ld a, [$c80a]
	add $11
	ld e, a
	ld d, $c8
	ld a, [de]
	cp c
	jr z, Function1118bc
	ld a, $1
	ld [$c814], a
	jr Function1118bc
.asm_1118b4
	ld a, $4
	cp [hl]
	jr nz, Function1118bc
	xor a
	ld [hli], a
	inc [hl]

; known jump sources: 1116c9 (44:56c9), 1116dd (44:56dd), 1116e2 (44:56e2), 1116ef (44:56ef), 111775 (44:5775), 111793 (44:5793), 11179d (44:579d), 1117bc (44:57bc), 1117e4 (44:57e4), 111814 (44:5814), 11183e (44:583e), 111844 (44:5844), 11186c (44:586c), 111874 (44:5874), 11187f (44:587f), 111882 (44:5882), 11188b (44:588b), 111890 (44:5890), 1118ab (44:58ab), 1118b2 (44:58b2), 1118b7 (44:58b7)
Function1118bc: ; 1118bc (44:58bc)
	ld hl, $c822
	res 1, [hl]
	ret

; known jump sources: 11186e (44:586e), 111884 (44:5884)
Function1118c2: ; 1118c2 (44:58c2)
	ld a, [rSB] ; $ff00+$1
	ld c, a
	ld b, $0
	ld hl, $c812
	ld a, [hli]
	ld l, [hl]
	ld h, a
	add hl, bc
	ld a, h
	ld [$c812], a
	ld a, l
	ld [$c813], a
	call Function111664
	ld hl, $c80a
	inc [hl]
	ret

; known jump sources: 3ec1 (0:3ec1)
Function1118de:: ; 1118de (44:58de)
	ld a, [$c80b]
	cp $4
	call z, Function111b3c
	call Function11214e
	ld hl, $c807
	ld a, [hli]
	cp $2
	jr c, .asm_111927
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	and b
	cp $ff
	jr z, .asm_1118fe
	ld a, c
	or b
	jr nz, .asm_111927
.asm_1118fe
	ld hl, $c807
	ld a, $6
	cp [hl]
	jp z, Function111b3b
	ld [hl], a
	ld a, $10
	ld [$c80f], a
	xor a
	ld [OverworldMap], a ; $c800
	ld hl, $c822
	res 0, [hl]
	ld hl, $c821
	ld a, [hl]
	and $f
	or $2
	ld [hl], a
	ld a, $10
	ld [$c80f], a
	jp Function111b3b
.asm_111927
	ld a, [OverworldMap] ; $c800
	cp $1
	jp z, Function111b21
	cp $3
	jp z, Function111a2a
	ld a, [$c807]
	cp $1
	jp c, Function111b3b
	ld hl, $c815
	dec [hl]
	jp nz, Function111b3b
	inc hl
	dec [hl]
	jp nz, Function111b3b
	ld hl, $c807
	ld a, [$c822]
	bit 3, a
	jp nz, Function111a0b
	bit 4, a
	jr nz, .asm_11199c
	ld a, [hl]
	cp $1
	jp z, Function1119f0
	cp $a
	jr z, .asm_111984
	cp $8
	jr z, .asm_11197d
	ld a, [$c86a]
	cp $2a
	jr z, .asm_111991
	cp $d
	jr nz, .asm_111977
	ld a, [$c86b]
	cp $4
	jr nc, .asm_11199c
.asm_111977
	call Function111f97
	jp Function111b3b
.asm_11197d
	ld a, [$c805]
	ld [hl], a
	jp Function111b3b
.asm_111984
	xor a
	ld [hl], a
	ld hl, $c821
	res 0, [hl]
	call Function111686
	jp Function111b3b
.asm_111991
	xor a
	ld [hl], a
	ld [$c821], a
	call Function111686
	jp Function111b3b
.asm_11199c
	ld b, a
	ld [hl], a
	or a
	jp z, Function111b3b
	ld a, [$c822]
	bit 7, a
	jr nz, .asm_1119be
.asm_1119a9
	ld a, [$c821]
	bit 3, a
	jr nz, .asm_111977
	ld de, $b
	ld hl, $6072
	ld a, $95
	call Function111f02
	jp Function111b3b
.asm_1119be
	ld a, [$c821]
	bit 3, a
	jr nz, .asm_1119dd
	ld a, [$cb4c]
	add $a
	ld e, a
	ld d, $0
	ld a, $95
	ld [$c81e], a
	ld hl, $cb47
	ld b, $5
	call Function111f07
	jp Function111b3b
.asm_1119dd
	ld hl, $c821
	set 1, [hl]
	res 0, [hl]
	ld hl, $c822
	res 7, [hl]
	ld a, $21
	ld [$c80f], a
	jr .asm_1119a9

; known jump sources: 11195a (44:595a)
Function1119f0: ; 1119f0 (44:59f0)
	ld a, $90
	ld [$c81e], a
	ld [$c808], a
	ld b, $5
	ld de, $12
	ld hl, $6001
	call Function111f07
	ld a, $1
	ld [$c806], a
	jp Function111b3b

; known jump sources: 111950 (44:5950)
Function111a0b: ; 111a0b (44:5a0b)
	ld a, [hl]
	cp $6
	jp z, Function111b3b
	ld hl, $c822
	res 3, [hl]
	res 0, [hl]
	ld hl, $c81a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $5
	call Function111f07
	jp Function111b3b

; known jump sources: 111931 (44:5931)
Function111a2a: ; 111a2a (44:5a2a)
	ld hl, $c80b
	ld a, [hld]
	or a
	jr z, asm_111a47
	cp $3
	jr nz, asm_111a40
	ld a, [hl]
	cp $2
	jp z, Function111ab9
	cp $3
	jp z, Function111abd
asm_111a40: ; 111a40 (44:5a40)
	ld a, $4b

; known jump sources: 111abb (44:5abb), 111ac8 (44:5ac8), 111b1e (44:5b1e)
Function111a42: ; 111a42 (44:5a42)
	ld [rSB], a ; $ff00+$1
	jp Function111b2e
asm_111a47: ; 111a47 (44:5a47)
	ld hl, $c815
	dec [hl]
	jr nz, asm_111a40
	inc hl
	dec [hl]
	jr nz, asm_111a40
	inc hl
	dec [hl]
	jr z, .asm_111a63
	ld hl, $c81f
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld hl, $c815
	ld [hli], a
	ld a, d
	ld [hli], a
	jr asm_111a40
.asm_111a63
	di
	ld a, [$c86a]
	cp $2a
	jr z, .asm_111aa8
	ld hl, $c9b2
	inc [hl]
	ld a, [hl]
	cp $1
	jr z, .asm_111a91
	ld hl, $c822
	res 5, [hl]
	res 0, [hl]
	ld hl, $c821
	res 4, [hl]
	ld a, $0
	ld [$c805], a
	ld a, $29
	ld [$c86a], a
	ld a, $1
	ld [$c806], a
	jr .asm_111aa8
.asm_111a91
	ld a, $29
	ld [$c86a], a
	xor a
	ld [$c806], a
	ld [$c86b], a
	ld [$c80b], a
	ld [OverworldMap], a ; $c800
	ld a, $8
	ld [$c807], a
.asm_111aa8
	call Function110029
	call Function11164f
	ld hl, $c822
	res 5, [hl]
	res 0, [hl]
	ei
	jp Function111b3b

; known jump sources: 111a38 (44:5a38)
Function111ab9: ; 111ab9 (44:5ab9)
	ld a, $80
	jr Function111a42

; known jump sources: 111a3d (44:5a3d)
Function111abd: ; 111abd (44:5abd)
	ld a, [$c814]
	or a
	jr nz, .asm_111acb
	ld a, [$ca3c]
	xor $80
	jp Function111a42
.asm_111acb
	ld hl, $c819
	inc [hl]
	ld a, $3
	cp [hl]
	jr z, .asm_111afe
	call Function110029
	ld a, $3
	ld [OverworldMap], a ; $c800
	xor a
	ld hl, $c80a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $c815
	ld a, [$c820]
	ld [hli], a
	ld a, [$c81f]
	ld [hli], a
	ld a, [$c822]
	bit 0, a
	jr z, .asm_111af9
	ld a, $b
	jr .asm_111afb
.asm_111af9
	ld a, $20
.asm_111afb
	ld [hli], a
	jr .asm_111b1c
.asm_111afe
	ld hl, $c806
	xor a
	ld [hli], a
	ld [OverworldMap], a ; $c800
	ld a, $6
	ld [hl], a
	ld hl, $c821
	set 1, [hl]
	ld a, $15
	ld [$c80f], a
	ld a, $2
	ld [$c810], a
	xor a
	ld [$c811], a
.asm_111b1c
	ld a, $f1
	jp Function111a42

; known jump sources: 11192c (44:592c)
Function111b21: ; 111b21 (44:5b21)
	ld hl, $c803
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [de]
	ld [rSB], a ; $ff00+$1
	inc de
	ld a, d
	ld [hld], a
	ld [hl], e

; known jump sources: 111a44 (44:5a44)
Function111b2e: ; 111b2e (44:5b2e)
	ld hl, $c822
	set 1, [hl]
	ld a, $3
	ld [rSC], a ; $ff00+$2
	ld a, $83
	ld [rSC], a ; $ff00+$2

; known jump sources: 111904 (44:5904), 111924 (44:5924), 111939 (44:5939), 111940 (44:5940), 111945 (44:5945), 11197a (44:597a), 111981 (44:5981), 11198e (44:598e), 111999 (44:5999), 11199f (44:599f), 1119bb (44:59bb), 1119da (44:59da), 111a08 (44:5a08), 111a0e (44:5a0e), 111a27 (44:5a27), 111ab6 (44:5ab6)
Function111b3b: ; 111b3b (44:5b3b)
	ret

; known jump sources: 1118e3 (44:58e3)
Function111b3c: ; 111b3c (44:5b3c)
	xor a
	ld [$c819], a
	ld [$c80b], a
	ld hl, $c9b1
	ld [hli], a
	ld [hl], a
	ld [OverworldMap], a ; $c800
	ld hl, $c822
	res 5, [hl]
	bit 0, [hl]
	jr z, .asm_111b59
	ld a, [$ca2f]
	jr .asm_111b5c
.asm_111b59
	ld a, [$ca3c]
.asm_111b5c
	cp $9f
	jr nz, .asm_111b62
	ld a, $95
.asm_111b62
	ld b, a
	ld hl, $5e28
	push hl
	cp $ee
	jp z, Function111e2b
	ld a, [$c81e]
	cp $ff
	jp z, Function111ef8
	cp $95
	jp z, Function111c17
	cp $a8
	jp z, Function111d23
	cp $a3
	jr z, .asm_111bbe
	cp $a4
	jr z, .asm_111bbe
	cp $93
	jr z, .asm_111be0
	cp $99
	jr z, .asm_111bf0
	cp $9a
	jp z, Function111c06
	cp $97
	jp z, Function111d70
	cp $a1
	jr z, .asm_111bd0
	cp $a2
	jr z, .asm_111bca
	cp $90
	jp z, Function111d39
	cp $94
	jp z, Function111d65
	cp $92
	jp z, Function111d65
	ld hl, $c822
	res 0, [hl]
	ld a, $a
	ld [$c807], a
	xor a
	ld [OverworldMap], a ; $c800
	ret
.asm_111bbe
	ld a, [$ca40]
	ld [$c86c], a
	ld a, $4
	ld [$c807], a
	ret
.asm_111bca
	ld a, $3
	ld [$c807], a
	ret
.asm_111bd0
	ld a, $4
	ld [$c807], a
	ld de, $c823
	ld hl, $ca40
	ld b, $4
	jp Function110000
.asm_111be0
	ld a, $2
	ld [$c807], a
	ld hl, $c822
	res 4, [hl]
	ld hl, $c821
	res 4, [hl]
	ret
.asm_111bf0
	ld hl, $c829
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, $ca3f
	ld a, [hli]
	dec a
	ld b, a
	inc hl
	call Function110000
	ld a, $2
	ld [$c807], a
	ret

; known jump sources: 111b90 (44:5b90)
Function111c06: ; 111c06 (44:5c06)
	ld de, $c872
	ld hl, $ca40
	ld b, $2
	call Function110000
	ld a, $2
	ld [$c807], a
	ret

; known jump sources: 111b76 (44:5b76)
Function111c17: ; 111c17 (44:5c17)
	ld a, [$ca3c]
	cp $9f
	jp z, Function111d07
	ld a, [$c86f]
	ld b, a
	ld a, [$c86e]
	or b
	jp z, Function111d07
	ld hl, $c82b
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, [$ca3f]
	dec a
	jp z, Function111d07
	ld c, a
	ld a, [$c822]
	bit 4, a
	jp z, Function111cc2
	ld a, [$c992]
	or a
	jr nz, .asm_111c89
	ld a, [$ca41]
	or a
	jr z, .asm_111c50
	cp $81
	jr c, .asm_111c52
.asm_111c50
	ld a, $80
.asm_111c52
	ld b, a
	ld a, [$ca3f]
	dec a
	dec a
	cp b
	jr c, .asm_111c6e
.asm_111c5b
	ld hl, $c821
	set 3, [hl]
	ld hl, $c993
	ld a, $1
	ld [hli], a
	ld a, [$ca3f]
	dec a
	ld [hl], a
	jp Function111d07
.asm_111c6e
	ld hl, $c992
	or a
	jr z, .asm_111c83
	ld [hld], a
	ld [hl], b
	ld b, a
	ld hl, $ca42
	ld de, $c880
	call Function110000
	jp Function111d07
.asm_111c83
	ld a, $ff
	ld [hld], a
	ld [hl], b
	jr Function111d07
.asm_111c89
	cp $ff
	jr nz, .asm_111c9d
	ld hl, $c991
	ld a, [hli]
	ld b, a
	ld a, [$ca3f]
	dec a
	cp b
	jr nc, .asm_111c5b
	jr z, .asm_111c5b
	xor a
	ld [hl], a
.asm_111c9d
	ld hl, $c991
	ld a, [hli]
	sub [hl]
	ld b, a
	ld a, [$ca3f]
	dec a
	cp b
	jr nc, .asm_111c5b
	jr z, .asm_111c5b
	ld b, a
	ld l, [hl]
	ld h, $0
	add l
	ld [$c992], a
	ld de, $c880
	add hl, de
	ld e, l
	ld d, h
	ld hl, $ca41
	call Function110000
	jr Function111d07

; known jump sources: 111c3d (44:5c3d)
Function111cc2: ; 111cc2 (44:5cc2)
	xor a
	cp d
	jr nz, .asm_111cda
	ld a, c
	cp e
	jr c, .asm_111cda
	jr z, .asm_111cda
	ld a, [$c821]
	set 2, a
	ld [$c821], a
	ld a, c
	sub e
	ld c, e
	ld e, a
	jr .asm_111ce1
.asm_111cda
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc $0
	ld d, a
.asm_111ce1
	ld a, d
	ld [hld], a
	ld [hl], e
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	ld hl, $ca41
	ld a, c
	or a
	jr z, Function111d07
	ld b, a
	call Function110000
	ld hl, $c829
	ld a, e
	ld [hli], a
	ld [hl], d
	ld de, $3
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	jr nc, Function111d07
	inc [hl]

; known jump sources: 111c1c (44:5c1c), 111c27 (44:5c27), 111c34 (44:5c34), 111c6b (44:5c6b), 111c80 (44:5c80), 111c87 (44:5c87), 111cc0 (44:5cc0), 111cf1 (44:5cf1), 111d04 (44:5d04)
Function111d07: ; 111d07 (44:5d07)
	ld a, [$c822]
	bit 4, a
	jr z, .asm_111d1c
	bit 7, a
	jr z, .asm_111d1c
	ld hl, $c822
	res 7, [hl]
	ld hl, $c821
	res 0, [hl]
.asm_111d1c
	ld a, [$c805]
	ld [$c807], a
	ret

; known jump sources: 111b7b (44:5b7b)
Function111d23: ; 111d23 (44:5d23)
	ld a, [$c829]
	ld e, a
	ld a, [$c82a]
	ld d, a
	ld hl, $ca40
	ld b, $4
	call Function110000
	ld a, $4
	ld [$c807], a
	ret

; known jump sources: 111ba2 (44:5ba2)
Function111d39: ; 111d39 (44:5d39)
	ld de, $ca3f
	ld hl, $6006
	ld b, $9
.asm_111d41
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_111d4a
	inc hl
	dec b
	jr nz, .asm_111d41
.asm_111d4a
	ld a, b
	or a
	jr nz, .asm_111d59
	ld a, [$ca4a]
	cp $80
	jr c, .asm_111d62
	cp $90
	jr nc, .asm_111d62
.asm_111d59
	ld [$c818], a
	ld a, $2
	ld [$c807], a
	ret
.asm_111d62
	xor a
	jr .asm_111d59

; known jump sources: 111ba7 (44:5ba7), 111bac (44:5bac)
Function111d65: ; 111d65 (44:5d65)
	ld a, $3
	ld [$c807], a
	ld hl, $c821
	set 4, [hl]
	ret

; known jump sources: 111b95 (44:5b95)
Function111d70: ; 111d70 (44:5d70)
	ld hl, $c822
	bit 0, [hl]
	jr z, .asm_111dc0
	ld a, [$c805]
	ld [$c807], a
	ld a, [$ca33]
	ld b, a
	call Function111dd9
	call Function111e15
	res 0, [hl]
	ld a, b
	cp $7
	jr z, .asm_111da9
	or a
	ret nz
	ld hl, $c821
	res 4, [hl]
	set 1, [hl]
	ld a, [$c822]
	bit 4, a
	jr nz, .asm_111dbb
	ld a, $23
	ld [$c80f], a
	ld a, $6
	ld [$c807], a
	ret
.asm_111da9
	ld hl, $c821
	res 4, [hl]
	set 1, [hl]
	ld a, $11
	ld [$c80f], a
	ld a, $6
	ld [$c807], a
	ret
.asm_111dbb
	xor a
	ld [$c807], a
	ret
.asm_111dc0
	ld hl, $c86e
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$ca40]
	ld b, a
	call Function111dd9
	call Function111e15
	ld a, b
	ld [hl], a
	ld a, [$c805]
	ld [$c807], a
	ret

; known jump sources: 111d81 (44:5d81), 111dca (44:5dca)
Function111dd9: ; 111dd9 (44:5dd9)
	cp $ff
	jr z, .asm_111de7
	or a
	ret z
	cp $4
	jr z, .asm_111dea
	cp $5
	jr z, .asm_111e12
.asm_111de7
	ld b, $7
	ret
.asm_111dea
	ld b, $5
	ld a, [$c822]
	bit 0, a
	jr z, .asm_111df8
	ld a, [$c86a]
	jr .asm_111dfb
.asm_111df8
	ld a, [$c985]
.asm_111dfb
	cp $4
	ret z
	cp $1c
	ret z
	cp $1a
	ret z
	dec b
	cp $3
	ret z
	ld b, $1
	ld a, [$c822]
	bit 4, a
	ret z
	inc b
	ret
.asm_111e12
	ld b, $3
	ret

; known jump sources: 111d84 (44:5d84), 111dcd (44:5dcd)
Function111e15: ; 111e15 (44:5e15)
	ld a, b
	and $7
	rrca
	rrca
	rrca
	push hl
	ld l, a
	ld a, [$c821]
	and $1f
	or l
	ld [$c821], a
	pop hl
	ret
; 111e28 (44:5e28)

INCBIN "baserom.gbc",$111e28,$111e2b - $111e28

; known jump sources: 111b69 (44:5b69)
Function111e2b: ; 111e2b (44:5e2b)
	ld a, [$c81e]
	cp $ff
	jp z, Function111ef8
	ld a, [$c86a]
	cp $d
	jr z, .asm_111e48
	cp $2a
	jr z, .asm_111e48
	ld a, $6
	ld [$c807], a
	ld hl, $c821
	set 1, [hl]
.asm_111e48
	ld a, [$c822]
	bit 0, a
	jr z, .asm_111e54
	ld hl, $ca33
	jr .asm_111e57
.asm_111e54
	ld hl, $ca40
.asm_111e57
	ld a, [hli]
	ld [$c80e], a
	cp $10
	jr z, .asm_111e88
	cp $12
	jr z, .asm_111e8c
	cp $13
	jr z, .asm_111ea1
	cp $15
	jr z, .asm_111eae
	cp $19
	jr z, .asm_111edc
	cp $21
	jr z, .asm_111ee0
	cp $22
	jr z, .asm_111ea1
	cp $23
	jr z, .asm_111ee4
	cp $24
	jr z, .asm_111eed
	cp $28
	jr z, .asm_111ee9
	ld a, [hl]
.asm_111e84
	ld [$c80f], a
	ret
.asm_111e88
	ld a, $10
	jr .asm_111e84
.asm_111e8c
	ld a, [hl]
	or $0
	jr z, .asm_111e9d
	cp $2
	jr z, .asm_111e99
	ld a, $13
	jr .asm_111e84
.asm_111e99
	ld a, $17
	jr .asm_111e84
.asm_111e9d
	ld a, $12
	jr .asm_111e84
.asm_111ea1
	ld hl, $c821
	res 1, [hl]
	res 4, [hl]
	ld a, $2
	ld [$c807], a
	ret
.asm_111eae
	ld a, [hl]
	cp $1
	jr nz, .asm_111ed3
	ld a, [$c822]
	bit 4, a
	jr z, .asm_111ed3
	res 4, a
	ld [$c822], a
	ld hl, $c821
	ld a, [hl]
	and $f
	or $2
	ld [hl], a
	ld a, $23
	ld [$c80f], a
	ld a, $6
	ld [$c807], a
	ret
.asm_111ed3
	ld hl, $c822
	res 5, [hl]
	ld a, $24
	jr .asm_111e84
.asm_111edc
	ld a, $14
	jr .asm_111e84
.asm_111ee0
	ld a, $22
	jr .asm_111e84
.asm_111ee4
	ld hl, $c821
	res 1, [hl]
.asm_111ee9
	ld a, $24
	jr .asm_111e84
.asm_111eed
	ld hl, $c821
	res 1, [hl]
	ld a, $3
	ld [$c807], a
	ret

; known jump sources: 111b71 (44:5b71), 111e30 (44:5e30)
Function111ef8: ; 111ef8 (44:5ef8)
	ld a, [$c805]
	ld [$c807], a
	ret
; 111eff (44:5eff)

INCBIN "baserom.gbc",$111eff,$111f02 - $111eff

; known jump sources: 1119b8 (44:59b8)
Function111f02: ; 111f02 (44:5f02)
	ld [$c81e], a
	ld b, $5

; known jump sources: 1119d7 (44:59d7), 111a00 (44:5a00), 111a24 (44:5a24), 111fe0 (44:5fe0), 111fef (44:5fef)
Function111f07: ; 111f07 (44:5f07)
	call Function1100b4
	ret c
	ld a, [OverworldMap] ; $c800
	cp $0
	jr z, .asm_111f17
	call Function110226
	scf
	ret
.asm_111f17
	ld a, [rSC] ; $ff00+$2
	and $80
	jr nz, .asm_111f17
	di
	ld a, [$c81e]
	cp $ff
	jr z, .asm_111f35
	ld a, l
	ld [$c81c], a
	ld a, h
	ld [$c81d], a
	ld a, e
	ld [$c81a], a
	ld a, d
	ld [$c81b], a
.asm_111f35
	ld a, e
	ld [$c801], a
	ld a, d
	ld [$c802], a
	ld a, l
	ld [$c803], a
	ld a, h
	ld [$c804], a
	ld hl, $c807
	ld a, [hl]
	cp b
	jr z, .asm_111f4f
	ld [$c805], a
.asm_111f4f
	ld a, b
	ld [$c807], a
	xor a
	ld [$c806], a
	ld a, $1
	ld [OverworldMap], a ; $c800
	ld hl, $c822
	set 5, [hl]
	ei
	ret
; 111f63 (44:5f63)

INCBIN "baserom.gbc",$111f63,$111f97 - $111f63

; known jump sources: 111977 (44:5977)
Function111f97: ; 111f97 (44:5f97)
	ld hl, $c822
	bit 0, [hl]
	ret nz
	ld a, [$c807]
	cp $2
	jr c, .asm_111fcb
	cp $5
	jr z, .asm_111fcb
	cp $6
	jr nz, .asm_111fcd
	ld a, [$c80f]
	cp $22
	jr z, .asm_111fcb
	cp $23
	jr z, .asm_111fcb
	cp $26
	jr z, .asm_111fcb
	swap a
	and $f
	cp $1
	jr z, .asm_111fcb
	cp $0
	jr z, .asm_111fcb
	cp $8
	jr nz, .asm_111fcd
.asm_111fcb
	scf
	ret
.asm_111fcd
	ld b, $5
	ld hl, $c81e
	ld a, [hl]
	cp $ff
	jr z, .asm_111fe9
	ld a, $97
	ld [hl], a
	ld hl, $602d
	ld de, $a
	call Function111f07
	ld hl, $c822
	set 0, [hl]
	ret
.asm_111fe9
	ld hl, $6001
	ld de, $12
	jp Function111f07
; 111ff2 (44:5ff2)

INCBIN "baserom.gbc",$111ff2,$11214e - $111ff2

; known jump sources: 1118e6 (44:58e6)
Function11214e: ; 11214e (44:614e)
	ld a, [$c822]
	bit 5, a
	ret nz
	ld a, [$c86a]
	cp $a
	ret c
	ld c, a
	cp $d
	jr z, .asm_112187
	cp $f
	jr z, .asm_112196
	cp $29
	jr z, .asm_112175
	cp $2a
	jr z, .asm_112175
	cp $28
	jr z, .asm_112175
.asm_11216f
	ld a, [$c807]
	cp $6
	ret z
.asm_112175
	ld b, $0
	sla c
	ld hl, $6198
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, $c86b
	inc [hl]
	ld a, [hl]
	ret
.asm_112187
	ld c, a
	ld a, [$c86b]
	cp $1
	jr nz, .asm_11216f
	ld hl, $c821
	res 1, [hl]
	jr .asm_112175
.asm_112196
	ld c, a
	ld a, [$c80f]
	cp $24
	jr nz, .asm_11216f
	ld a, [$c86b]
	cp $1
	jr nz, .asm_11216f
	ld hl, $c821
	res 1, [hl]
	jr .asm_112175
; 1121ac (44:61ac)

INCBIN "baserom.gbc",$1121ac,$113f84 - $1121ac

