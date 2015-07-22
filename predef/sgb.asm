Predef_LoadSGBLayout: ; 864c
; LoadSGBLayout
	call CheckCGB
	jp nz, Predef_LoadSGBLayoutCGB

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
	ld de, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .Finish
	push de
	jp [hl]
; 866f

.Jumptable: ; 866f
	dw .SGB00
	dw .SGB01
	dw .SGB02
	dw .SGB03
	dw .SGB04
	dw .SGB05
	dw .SGB06
	dw .SGB07
	dw .SGB08_1d
	dw .SGB09
	dw .SGB0a
	dw .SGB0b
	dw .SGB0c
	dw .SGB0d_15
	dw .SGB0e
	dw .SGB0f
	dw .SGB10
	dw .SGB11
	dw .SGB12
	dw .SGB13
	dw .SGB14
	dw .SGB0d_15
	dw .SGB16
	dw .SGB17
	dw .SGB18
	dw .SGB19
	dw .SGB1a
	dw .SGB1b
	dw .SGB1c
	dw .SGB08_1d
	dw .SGB1e
; 86ad

.SGB00: ; 86ad
	ld hl, PalPacket_9c66
	ld de, BlkPacket_9aa6
	ret
; 86b4

.SGB01: ; 86b4
	ld hl, BlkPacket_9aa6
	call Function9809
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	ld a, [PlayerHPPal]
	ld l, a
	ld h, 0
rept 2
	add hl, hl
endr
	ld de, Palettes_a8be
	add hl, de
	ld a, [hli]
	ld [wcda9 + 3], a
	ld a, [hli]
	ld [wcda9 + 4], a
	ld a, [hli]
	ld [wcda9 + 5], a
	ld a, [hl]
	ld [wcda9 + 6], a
	ld a, [EnemyHPPal]
	ld l, a
	ld h, $0
rept 2
	add hl, hl
endr
	ld de, Palettes_a8be
	add hl, de
	ld a, [hli]
	ld [wcda9 + 9], a
	ld a, [hli]
	ld [wcda9 + 10], a
	ld a, [hli]
	ld [wcda9 + 11], a
	ld a, [hl]
	ld [wcda9 + 12], a
	ld hl, PalPacket_9cf6
	ld de, wcda9 + $10
	ld bc, $0010
	call CopyBytes
	call Function9729
	ld a, [hli]
	ld [wcda9 + $13], a
	ld a, [hli]
	ld [wcda9 + $14], a
	ld a, [hli]
	ld [wcda9 + $15], a
	ld a, [hl]
	ld [wcda9 + $16], a
	call Function973a
	ld a, [hli]
	ld [wcda9 + $19], a
	ld a, [hli]
	ld [wcda9 + $1a], a
	ld a, [hli]
	ld [wcda9 + $1b], a
	ld a, [hl]
	ld [wcda9 + $1c], a
	ld hl, wcda9
	ld de, wcda9 + $10
	ld a, $1
	ld [SGBPredef], a
	ret
; 873c

.SGB0e: ; 873c
	ld hl, PalPacket_9bd6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	ld hl, wcda9 + 1
	ld [hl], $10
rept 2
	inc hl
endr
	ld a, [PlayerHPPal]
	add $2f
	ld [hl], a
	ld hl, wcda9
	ld de, BlkPacket_9ad6
	ret
; 875c

.SGB02: ; 875c
	ld hl, PalPacket_9c76
	ld de, BlkPacket_9a86
	ret
; 8763

.SGB03: ; 8763
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	ld a, [wcda1]
	ld l, a
	ld h, $0
rept 2
	add hl, hl
endr
	ld de, Palettes_a8be
	add hl, de
	ld a, [hli]
	ld [wcda9 + 3], a
	ld a, [hli]
	ld [wcda9 + 4], a
	ld a, [hli]
	ld [wcda9 + 5], a
	ld a, [hl]
	ld [wcda9 + 6], a
	ld a, [CurPartySpecies]
	ld bc, wd10e + 21
	call Function974b
	ld a, [hli]
	ld [wcda9 + 9], a
	ld a, [hli]
	ld [wcda9 + 10], a
	ld a, [hli]
	ld [wcda9 + 11], a
	ld a, [hl]
	ld [wcda9 + 12], a
	ld hl, wcda9
	ld de, BlkPacket_9ac6
	ret
; 87ab

.SGB0a: ; 87ab
	ld hl, PalPacket_9c56
	ld de, wcda9 + 1
	ret
; 87b2

.SGB04: ; 87b2
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	ld hl, wcda9 + 3
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
	ld [wcda9 + 9], a
	ld a, [hli]
	ld [wcda9 + 10], a
	ld a, [hli]
	ld [wcda9 + 11], a
	ld a, [hl]
	ld [wcda9 + 12], a
	ld hl, wcda9
	ld de, BlkPacket_9ae6
	ret
; 87e9

.SGB17: ; 87e9
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	ld hl, wcda9 + 3
	ld [hl], $9f
	inc hl
	ld [hl], $2a
	inc hl
	ld [hl], $5a
	inc hl
	ld [hl], $19
	ld a, [CurPartySpecies]
	ld bc, wd10e + 21
	call Function974b
	ld a, [hli]
	ld [wcda9 + 9], a
	ld a, [hli]
	ld [wcda9 + 10], a
	ld a, [hli]
	ld [wcda9 + 11], a
	ld a, [hl]
	ld [wcda9 + 12], a
	ld hl, wcda9
	ld de, BlkPacket_9ae6
	ret
; 8823

.SGB16: ; 8823
	call .SGB04
	ld de, BlkPacket_9af6
	ret
; 882a

.SGB10: ; 882a
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	ld hl, wcda9 + 3
	ld [hl], $9f
	inc hl
	ld [hl], $2a
	inc hl
	ld [hl], $5a
	inc hl
	ld [hl], $19
	ld hl, wcda9
	ld de, BlkPacket_9a86
	ret
; 884b

.SGB14: ; 884b
	ld hl, PalPacket_9c36
	ld de, BlkPacket_9a86
	ret
; 8852

.SGB05: ; 8852
	ld hl, PalPacket_9c96
	ld de, BlkPacket_9b06
	ret
; 8859

.SGB06: ; 8859
	ld hl, PalPacket_9ca6
	ld de, BlkPacket_9b76
	ret
; 8860

.SGB08_1d: ; 8860
	ld hl, PalPacket_9cb6
	ld de, BlkPacket_9a86
	ret
; 8867

.SGB07: ; 8867
	ld b, 0
	ld hl, .BlkPacketTable_SGB07
rept 4
	add hl, bc
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 8878

.BlkPacketTable_SGB07: ; 8878
	dw BlkPacket_9a86, PalPacket_9be6
	dw BlkPacket_9a96, PalPacket_9c06
	dw BlkPacket_9a86, PalPacket_9c16
; 8884

.SGB0c: ; 8884
	ld hl, PalPacket_9b96
	ld de, BlkPacket_9b56
	ld a, $8
	ld [SGBPredef], a
	ret
; 8890

.SGB13: ; 8890
	ld hl, PalPacket_9ba6
	ld de, BlkPacket_9b86
	ret
; 8897

.SGB0f: ; 8897
	ld hl, PalPacket_9c46
	ld de, BlkPacket_9a86
	ret
; 889e

.SGB11: ; 889e
	ld hl, BlkPacket_9a86
	ld de, PlayerLightScreenCount
	ld bc, $0010
	call CopyBytes
	ld hl, PalPacket_9bb6
	ld de, BlkPacket_9a86
	ret
; 88b1

.SGB09: ; 88b1
	ld hl, PalPacket_9bd6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	call .GetPermission
	ld hl, wcda9 + 1
	ld [hld], a
	ld de, BlkPacket_9a86
	ld a, $9
	ld [SGBPredef], a
	ret
; 88cd

.SGB0b: ; 88cd
	push bc
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	pop bc
	ld a, c
	and a
	jr z, .asm_88ef
	ld hl, wcda9 + 3
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
	ld [wcda9 + 3], a
	ld a, [hli]
	ld [wcda9 + 4], a
	ld a, [hli]
	ld [wcda9 + 5], a
	ld a, [hl]
	ld [wcda9 + 6], a

.asm_8913
	ld hl, wcda9
	ld de, BlkPacket_9a86
	ret
; 891a

.SGB0d_15: ; 891a
	ld hl, PalPacket_9cb6
	ld de, BlkPacket_9a86
	ret
; 8921

.SGB18: ; 8921
	ld hl, PalPacket_9bc6
	ld de, BlkPacket_9a86
	ret
; 8928

.SGB12: ; 8928
	ld hl, PalPacket_9bd6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	ld hl, BlkPacket_9a86
	ld de, wcda9 + $10
	ld bc, $0010
	call CopyBytes
	call .GetPermission
	ld hl, wcda9 + 1
	ld [hl], a
	ld hl, wcda9 + 3
	ld [hl], $2e
	ld hl, wcda9 + $13
	ld a, $5
	ld [hli], a
	ld a, [wcf83]
	ld [hli], a
	ld a, [wcf82]
	ld [hli], a
	ld a, [wcf85]
	ld [hli], a
	ld a, [wcf84]
	ld [hl], a
	ld hl, wcda9
	ld de, wcda9 + $10
	ret
; 8969

.SGB1e: ; 8969
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	ld a, [CurPartySpecies]
	ld l, a
	ld h, 0
rept 3
	add hl, hl
endr
	ld de, PokemonPalettes
	add hl, de
	ld a, [wcf65]
	and 3
	sla a
	sla a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld [wcda9 + 3], a
	ld a, [hli]
	ld [wcda9 + 4], a
	ld a, [hli]
	ld [wcda9 + 5], a
	ld a, [hl]
	ld [wcda9 + 6], a
	ld hl, wcda9
	ld de, BlkPacket_9a86
	ret
; 89a6

.SGB19: ; 89a6
	ld hl, PalPacket_9cd6
	ld de, BlkPacket_9a86
	ret
; 89ad

.SGB1a: ; 89ad
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	ld a, [CurPartySpecies]
	ld bc, wd10e + 21
	call Function974b
	ld a, [hli]
	ld [wcda9 + 3], a
	ld a, [hli]
	ld [wcda9 + 4], a
	ld a, [hli]
	ld [wcda9 + 5], a
	ld a, [hl]
	ld [wcda9 + 6], a
	ld hl, wcda9
	ld de, BlkPacket_9a86
	ret
; 89d9

.SGB1b: ; 89d9
	ld hl, PalPacket_9cc6
	ld de, BlkPacket_9a86
	ret
; 89e0

.SGB1c: ; 89e0
	ld hl, PalPacket_9ce6
	ld de, wcda9
	ld bc, $0010
	call CopyBytes
	ld a, [CurPartySpecies]
	ld bc, wd10e + 21
	call Function9764
	ld a, [hli]
	ld [wcda9 + 3], a
	ld a, [hli]
	ld [wcda9 + 4], a
	ld a, [hli]
	ld [wcda9 + 5], a
	ld a, [hl]
	ld [wcda9 + 6], a
	ld hl, wcda9
	ld de, BlkPacket_9a86
	ret
; 8a0c

.GetPermission: ; 8a0c
	ld a, [TimeOfDayPal]
	cp $2
	jr c, .asm_8a16
	ld a, $19
	ret

.asm_8a16
	ld a, [wPermission]
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
	ld hl, .Unknown_8a45
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

.Unknown_8a45: ; 8a45
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

.Finish: ; 8a60
	push de
	call Function9809
	pop hl
	jp Function9809
; 8a68
