Function864c: ; 864c
; LoadSGBLayout
	call CheckCGB
	jp nz, Function8d59

	ld a, b
	cp $ff
	jr nz, .asm_865a
	ld a, [SGBPredef]

.asm_865a
	cp $fc
	jp z, Function8ade
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Table866f
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, Function8a60
	push de
	jp [hl]
; 866f

Table866f: ; 866f
	dw Function86ad
	dw Function86b4
	dw Function875c
	dw Function8763
	dw Function87b2
	dw Function8852
	dw Function8859
	dw Function8867
	dw Function8860
	dw Function88b1
	dw Function87ab
	dw Function88cd
	dw Function8884
	dw Function891a
	dw Function873c
	dw Function8897
	dw Function882a
	dw Function889e
	dw Function8928
	dw Function8890
	dw Function884b
	dw Function891a
	dw Function8823
	dw Function87e9
	dw Function8921
	dw Function89a6
	dw Function89ad
	dw Function89d9
	dw Function89e0
	dw Function8860
	dw Function8969
; 86ad

Function86ad: ; 86ad
	ld hl, PalPacket_9c66
	ld de, BlkPacket_9aa6
	ret
; 86b4

Function86b4: ; 86b4
	ld hl, BlkPacket_9aa6
	call Function9809
	ld hl, PalPacket_9ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	ld a, [PlayerHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, Palettes_a8be
	add hl, de
	ld a, [hli]
	ld [$cdac], a
	ld a, [hli]
	ld [$cdad], a
	ld a, [hli]
	ld [$cdae], a
	ld a, [hl]
	ld [$cdaf], a
	ld a, [EnemyHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, $68be
	add hl, de
	ld a, [hli]
	ld [$cdb2], a
	ld a, [hli]
	ld [$cdb3], a
	ld a, [hli]
	ld [$cdb4], a
	ld a, [hl]
	ld [$cdb5], a
	ld hl, PalPacket_9cf6
	ld de, $cdb9
	ld bc, $0010
	call CopyBytes
	call Function9729
	ld a, [hli]
	ld [$cdbc], a
	ld a, [hli]
	ld [$cdbd], a
	ld a, [hli]
	ld [$cdbe], a
	ld a, [hl]
	ld [$cdbf], a
	call Function973a
	ld a, [hli]
	ld [$cdc2], a
	ld a, [hli]
	ld [$cdc3], a
	ld a, [hli]
	ld [$cdc4], a
	ld a, [hl]
	ld [$cdc5], a
	ld hl, $cda9
	ld de, $cdb9
	ld a, $1
	ld [SGBPredef], a
	ret
; 873c

Function873c: ; 873c
	ld hl, PalPacket_9bd6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	ld hl, $cdaa
	ld [hl], $10
	inc hl
	inc hl
	ld a, [PlayerHPPal]
	add $2f
	ld [hl], a
	ld hl, $cda9
	ld de, BlkPacket_9ad6
	ret
; 875c

Function875c: ; 875c
	ld hl, PalPacket_9c76
	ld de, BlkPacket_9a86
	ret
; 8763

Function8763: ; 8763
	ld hl, PalPacket_9ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	ld a, [$cda1]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Palettes_a8be
	add hl, de
	ld a, [hli]
	ld [$cdac], a
	ld a, [hli]
	ld [$cdad], a
	ld a, [hli]
	ld [$cdae], a
	ld a, [hl]
	ld [$cdaf], a
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
	call Function974b
	ld a, [hli]
	ld [$cdb2], a
	ld a, [hli]
	ld [$cdb3], a
	ld a, [hli]
	ld [$cdb4], a
	ld a, [hl]
	ld [$cdb5], a
	ld hl, $cda9
	ld de, BlkPacket_9ac6
	ret
; 87ab

Function87ab: ; 87ab
	ld hl, PalPacket_9c56
	ld de, $cdaa
	ret
; 87b2

Function87b2: ; 87b2
	ld hl, PalPacket_9ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	ld hl, $cdac
	ld [hl], $9f
	inc hl
	ld [hl], $2a
	inc hl
	ld [hl], $5a
	inc hl
	ld [hl], $19
	ld a, [CurPartySpecies]
	call Function9775
	ld a, [hli]
	ld [$cdb2], a
	ld a, [hli]
	ld [$cdb3], a
	ld a, [hli]
	ld [$cdb4], a
	ld a, [hl]
	ld [$cdb5], a
	ld hl, $cda9
	ld de, BlkPacket_9ae6
	ret
; 87e9

Function87e9: ; 87e9
	ld hl, PalPacket_9ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	ld hl, $cdac
	ld [hl], $9f
	inc hl
	ld [hl], $2a
	inc hl
	ld [hl], $5a
	inc hl
	ld [hl], $19
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
	call Function974b
	ld a, [hli]
	ld [$cdb2], a
	ld a, [hli]
	ld [$cdb3], a
	ld a, [hli]
	ld [$cdb4], a
	ld a, [hl]
	ld [$cdb5], a
	ld hl, $cda9
	ld de, BlkPacket_9ae6
	ret
; 8823

Function8823: ; 8823
	call Function87b2
	ld de, BlkPacket_9af6
	ret
; 882a

Function882a: ; 882a
	ld hl, PalPacket_9ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	ld hl, $cdac
	ld [hl], $9f
	inc hl
	ld [hl], $2a
	inc hl
	ld [hl], $5a
	inc hl
	ld [hl], $19
	ld hl, $cda9
	ld de, BlkPacket_9a86
	ret
; 884b

Function884b: ; 884b
	ld hl, PalPacket_9c36
	ld de, BlkPacket_9a86
	ret
; 8852

Function8852: ; 8852
	ld hl, PalPacket_9c96
	ld de, BlkPacket_9b06
	ret
; 8859

Function8859: ; 8859
	ld hl, PalPacket_9ca6
	ld de, BlkPacket_9b76
	ret
; 8860

Function8860: ; 8860
	ld hl, PalPacket_9cb6
	ld de, BlkPacket_9a86
	ret
; 8867

Function8867: ; 8867
	ld b, 0
	ld hl, Unknown_8878
	add hl, bc
	add hl, bc
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 8878

Unknown_8878: ; 8878
	dw BlkPacket_9a86, PalPacket_9be6
	dw BlkPacket_9a96, PalPacket_9c06
	dw BlkPacket_9a86, PalPacket_9c16
; 8884

Function8884: ; 8884
	ld hl, PalPacket_9b96
	ld de, BlkPacket_9b56
	ld a, $8
	ld [SGBPredef], a
	ret
; 8890

Function8890: ; 8890
	ld hl, PalPacket_9ba6
	ld de, BlkPacket_9b86
	ret
; 8897

Function8897: ; 8897
	ld hl, PalPacket_9c46
	ld de, BlkPacket_9a86
	ret
; 889e

Function889e: ; 889e
	ld hl, BlkPacket_9a86
	ld de, PlayerLightScreenCount
	ld bc, $0010
	call CopyBytes
	ld hl, PalPacket_9bb6
	ld de, BlkPacket_9a86
	ret
; 88b1

Function88b1: ; 88b1
	ld hl, PalPacket_9bd6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	call Function8a0c
	ld hl, $cdaa
	ld [hld], a
	ld de, BlkPacket_9a86
	ld a, $9
	ld [SGBPredef], a
	ret
; 88cd

Function88cd: ; 88cd
	push bc
	ld hl, PalPacket_9ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	pop bc
	ld a, c
	and a
	jr z, .asm_88ef
	ld hl, $cdac
	ld [hl], $e7
	inc hl
	ld [hl], $1c
	inc hl
	ld [hl], $62
	inc hl
	ld [hl], $c
	jr .asm_8913

.asm_88ef
	ld hl, PartyMon1DVs
	ld bc, $0030
	ld a, [CurPartyMon]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [PlayerHPPal]
	call Function974b
	ld a, [hli]
	ld [$cdac], a
	ld a, [hli]
	ld [$cdad], a
	ld a, [hli]
	ld [$cdae], a
	ld a, [hl]
	ld [$cdaf], a

.asm_8913
	ld hl, $cda9
	ld de, BlkPacket_9a86
	ret
; 891a

Function891a: ; 891a
	ld hl, PalPacket_9cb6
	ld de, BlkPacket_9a86
	ret
; 8921

Function8921: ; 8921
	ld hl, PalPacket_9bc6
	ld de, BlkPacket_9a86
	ret
; 8928

Function8928: ; 8928
	ld hl, PalPacket_9bd6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	ld hl, BlkPacket_9a86
	ld de, $cdb9
	ld bc, $0010
	call CopyBytes
	call Function8a0c
	ld hl, $cdaa
	ld [hl], a
	ld hl, $cdac
	ld [hl], $2e
	ld hl, $cdbc
	ld a, $5
	ld [hli], a
	ld a, [$cf83]
	ld [hli], a
	ld a, [$cf82]
	ld [hli], a
	ld a, [$cf85]
	ld [hli], a
	ld a, [$cf84]
	ld [hl], a
	ld hl, $cda9
	ld de, $cdb9
	ret
; 8969

Function8969: ; 8969
	ld hl, PalPacket_9ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	ld a, [CurPartySpecies]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, PokemonPalettes
	add hl, de
	ld a, [$cf65]
	and 3
	sla a
	sla a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld [$cdac], a
	ld a, [hli]
	ld [$cdad], a
	ld a, [hli]
	ld [$cdae], a
	ld a, [hl]
	ld [$cdaf], a
	ld hl, $cda9
	ld de, BlkPacket_9a86
	ret
; 89a6

Function89a6: ; 89a6
	ld hl, PalPacket_9cd6
	ld de, BlkPacket_9a86
	ret
; 89ad

Function89ad: ; 89ad
	ld hl, PalPacket_9ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
	call Function974b
	ld a, [hli]
	ld [$cdac], a
	ld a, [hli]
	ld [$cdad], a
	ld a, [hli]
	ld [$cdae], a
	ld a, [hl]
	ld [$cdaf], a
	ld hl, $cda9
	ld de, BlkPacket_9a86
	ret
; 89d9

Function89d9: ; 89d9
	ld hl, PalPacket_9cc6
	ld de, BlkPacket_9a86
	ret
; 89e0

Function89e0: ; 89e0
	ld hl, PalPacket_9ce6
	ld de, $cda9
	ld bc, $0010
	call CopyBytes
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
	call Function9764
	ld a, [hli]
	ld [$cdac], a
	ld a, [hli]
	ld [$cdad], a
	ld a, [hli]
	ld [$cdae], a
	ld a, [hl]
	ld [$cdaf], a
	ld hl, $cda9
	ld de, BlkPacket_9a86
	ret
; 8a0c

Function8a0c: ; 8a0c
	ld a, [TimeOfDayPal]
	cp $2
	jr c, .asm_8a16
	ld a, $19
	ret

.asm_8a16
	ld a, [$d19a]
	cp $2
	jr z, .asm_8a39
	cp $4
	jr z, .asm_8a3c
	cp $7
	jr z, .asm_8a3c
	cp $5
	jr z, .asm_8a3f
	cp $6
	jr z, .asm_8a42
	ld a, [MapGroup]
	ld e, a
	ld d, 0
	ld hl, Unknown_8a45
	add hl, de
	ld a, [hl]
	ret

.asm_8a39
	ld a, $0
	ret

.asm_8a3c
	ld a, $18
	ret

.asm_8a3f
	ld a, $6
	ret

.asm_8a42
	ld a, $3
	ret
; 8a45

Unknown_8a45: ; 8a45
	db $00
	db $12
	db $14
	db $18
	db $11
	db $15
	db $09
	db $04
	db $0f
	db $16
	db $0e
	db $10
	db $06
	db $01
	db $03
	db $06
	db $0b
	db $08
	db $05
	db $17
	db $08
	db $07
	db $13
	db $02
	db $0c
	db $0a
	db $0d
; 8a60

Function8a60: ; 8a60
	push de
	call Function9809
	pop hl
	jp Function9809
; 8a68

