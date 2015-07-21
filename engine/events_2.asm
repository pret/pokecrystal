; More overworld event handling.


WarpToSpawnPoint:: ; 97c28
	ld hl, StatusFlags2
	res 1, [hl]
	res 2, [hl]
	ret
; 97c30

Function97c30:: ; 97c30
	ld a, [wd45c]
	and a
	ret z
	ld hl, wd45c + 2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd45c + 1]
	call CallScript
	scf
	push af
	xor a
	ld hl, wd45c
	ld bc, 8
	call ByteFill
	pop af
	ret
; 97c4f

Function97c4f:: ; 97c4f
	ld hl, wd45c
	ld a, [hl]
	and a
	ret nz
	ld [hl], 1
	inc hl
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	scf
	ret
; 97c5f

Function97c5f:: ; 97c5f
	call GetFacingTileCoord
	ld [EngineBuffer1], a
	ld c, a
	callba CheckFacingTileForStd
	jr c, .done

	call CheckCutTreeTile
	jr nz, .whirlpool
	callba TryCutOW
	jr .done

.whirlpool
	ld a, [EngineBuffer1]
	call CheckWhirlpoolTile
	jr nz, .waterfall
	callba TryWhirlpoolOW
	jr .done

.waterfall
	ld a, [EngineBuffer1]
	call CheckWaterfallTile
	jr nz, .headbutt
	callba TryWaterfallOW
	jr .done

.headbutt
	ld a, [EngineBuffer1]
	call CheckHeadbuttTreeTile
	jr nz, .surf
	callba TryHeadbuttOW
	jr c, .done
	jr .noevent

.surf
	callba TrySurfOW
	jr nc, .noevent
	jr .done

.noevent
	xor a
	ret

.done
	call PlayClickSFX
	ld a, $ff
	scf
	ret
; 97cc0


Function97cc0:: ; 97cc0
; Rock Smash encounter

	call Function968c7
	jr c, .asm_97ce2
	call Function97cfd
	jr nc, .asm_97ce2
	ld hl, StatusFlags2
	bit 2, [hl]
	jr nz, .asm_97cdb
	callba Function2a0e7
	jr nz, .asm_97ce2
	jr .asm_97ce6

.asm_97cdb
	call Function97d23
	jr nc, .asm_97ce2
	jr .asm_97ced

.asm_97ce2
	ld a, 1
	and a
	ret

.asm_97ce6
	ld a, BANK(RockSmashBattleScript)
	ld hl, RockSmashBattleScript
	jr .asm_97cf4

.asm_97ced
	ld a, BANK(BugCatchingContestBattleScript)
	ld hl, BugCatchingContestBattleScript
	jr .asm_97cf4

.asm_97cf4
	call CallScript
	scf
	ret
; 97cf9

RockSmashBattleScript: ; 97cf9
	battlecheck
	startbattle
	returnafterbattle
	end
; 97cfd

Function97cfd:: ; 97cfd
	ld hl, StatusFlags
	bit 5, [hl]
	jr nz, .asm_97d21
	ld a, [wPermission]
	cp $4
	jr z, .asm_97d17
	cp $7
	jr z, .asm_97d17
	callba Function149dd
	jr nc, .asm_97d21

.asm_97d17
	ld a, [StandingTile]
	call CheckIceTile
	jr z, .asm_97d21
	scf
	ret

.asm_97d21
	and a
	ret
; 97d23

Function97d23: ; 97d23
	call Function97d64
	ret nc
	call Function97d31
	callba Function2a1df
	ret
; 97d31

Function97d31:: ; 97d31
; Pick a random mon out of ContestMons.

.asm_97d31
	call Random
	cp 100 << 1
	jr nc, .asm_97d31
	srl a

	ld hl, ContestMons
	ld de, 4
.CheckMon
	sub [hl]
	jr c, .GotMon
	add hl, de
	jr .CheckMon

.GotMon
	inc hl

; Species
	ld a, [hli]
	ld [wd22e], a

; Min level
	ld a, [hli]
	ld d, a

; Max level
	ld a, [hl]

	sub d
	jr nz, .RandomLevel

; If min and max are the same.
	ld a, d
	jr .GotLevel

.RandomLevel
; Get a random level between the min and max.
	ld c, a
	inc c
	call Random
	ld a, [hRandomAdd]
	call SimpleDivide
	add d

.GotLevel
	ld [CurPartyLevel], a

	xor a
	ret
; 97d64

Function97d64: ; 97d64
	ld a, [StandingTile]
	call Function188e
	ld b, $66
	jr z, .asm_97d70
	ld b, $33

.asm_97d70
	callba Function2a124
	callba Function2a138
	call Random
	ld a, [hRandomAdd]
	cp b
	ret c
	ld a, 1
	and a
	ret
; 97d87

ContestMons: ; 97d87
	;   %, species,   min, max
	db 20, CATERPIE,    7, 18
	db 20, WEEDLE,      7, 18
	db 10, METAPOD,     9, 18
	db 10, KAKUNA,      9, 18
	db  5, BUTTERFREE, 12, 15
	db  5, BEEDRILL,   12, 15
	db 10, VENONAT,    10, 16
	db 10, PARAS,      10, 17
	db  5, SCYTHER,    13, 14
	db  5, PINSIR,     13, 14
	db -1, VENOMOTH,   30, 40
; 97db3

Function97db3:: ; 97db3
	nop
	nop
	; fallthrough
; 97db5

Function97db5: ; 97db5
	ld hl, StatusFlags2
	bit 4, [hl]
	jr z, .NoCall
	ld a, [PlayerState]
	cp 1
	jr nz, .NoCall
	call GetMapHeaderPhoneServiceNybble
	and a
	jr nz, .NoCall
	ld hl, wdca1 + 1
	ld a, [hli]
	ld d, a
	ld e, [hl]
	cp -1
	jr nz, .asm_97dd8
	ld a, e
	cp -1
	jr z, .asm_97ddc

.asm_97dd8
	inc de
	ld [hl], e
	dec hl
	ld [hl], d

.asm_97ddc
	ld a, d
	cp $4
	jr c, .NoCall
	ld a, [wSpecialPhoneCallID]
	and a
	jr nz, .NoCall
	ld a, 6
	ld [wSpecialPhoneCallID], a
	xor a
	ld [wSpecialPhoneCallID + 1], a
	ld hl, StatusFlags2
	res 4, [hl]
	scf
	ret

.NoCall
	xor a
	ret
; 97df9

Function97df9:: ; 97df9
	ld hl, wd6de
	ld de, 6
	ld c, 4
	xor a
.loop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret
; 97e08

Function97e08:: ; 97e08
	ld hl, wd6de
	xor a
.asm_97e0c
	ld [hConnectionStripLength], a
	ld a, [hl]
	and a
	jr z, .asm_97e19
	push hl
	ld b, h
	ld c, l
	call Function97e79
	pop hl

.asm_97e19
	ld de, $0006
	add hl, de
	ld a, [hConnectionStripLength]
	inc a
	cp $4
	jr nz, .asm_97e0c
	ret
; 97e25

Function97e25: ; 97e25
	ld hl, wd6de
	ld bc, 6
	call AddNTimes
	ld b, h
	ld c, l
	ret
; 97e31

Function97e31:: ; 97e31
	push bc
	push de
	call Function97e45
	ld d, h
	ld e, l
	pop hl
	pop bc
	ret c
	ld a, b
	ld bc, $0005
	call FarCopyBytes
	xor a
	ld [hl], a
	ret
; 97e45

Function97e45: ; 97e45
	ld hl, wd6de
	ld de, $0006
	ld c, $4
.asm_97e4d
	ld a, [hl]
	and a
	jr z, .asm_97e57
	add hl, de
	dec c
	jr nz, .asm_97e4d
	scf
	ret

.asm_97e57
	ld a, $4
	sub c
	and a
	ret
; 97e5c

Function97e5c:: ; 97e5c
	ld hl, wd6de
	ld de, $0006
	ld c, $4
.asm_97e64
	ld a, [hl]
	cp b
	jr z, .asm_97e6e
	add hl, de
	dec c
	jr nz, .asm_97e64
	and a
	ret

.asm_97e6e
	xor a
	ld [hl], a
	scf
	ret
; 97e72

Function97e72: ; 97e72
	ld hl, $0000
	add hl, bc
	ld [hl], 0
	ret
; 97e79

Function97e79: ; 97e79
	ld hl, $0000
	add hl, bc
	ld a, [hl]
	cp 5
	jr c, .asm_97e83
	xor a

.asm_97e83
	ld e, a
	ld d, 0
	ld hl, Table97e94
rept 3
	add hl, de
endr
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	ret
; 97e94

Table97e94: ; 97e94
	dbw BANK(Function97eb7), Function97eb7
	dbw BANK(Function97eb8), Function97eb8
	dbw BANK(Function97f42), Function97f42
	dbw BANK(Function97ef9), Function97ef9
	dbw BANK(Function97ebc), Function97ebc
; 97ea3

Function97ea3: ; 97ea3
	ld hl, $0005
	add hl, bc
	ld a, [hl]
	pop hl
	rst JumpTable
	ret
; 97eab

Function97eab: ; 97eab
	ld hl, $0005
	add hl, bc
	inc [hl]
	ret
; 97eb1

Function97eb1: ; 97eb1
	ld hl, $0005
	add hl, bc
	dec [hl]
	ret
; 97eb7

Function97eb7: ; 97eb7
	ret
; 97eb8

Function97eb8: ; 97eb8
	call Function2f3e
	ret
; 97ebc

Function97ebc: ; 97ebc
	call Function97ea3
	dw Function97ec3
	dw Function97ecd
; 97ec3

Function97ec3: ; 97ec3
	ld a, [hSCY]
	ld hl, $0004
	add hl, bc
	ld [hl], a
	call Function97eab
; 97ecd

Function97ecd: ; 97ecd
	ld hl, $0001
	add hl, bc
	ld a, [hl]
	dec a
	ld [hl], a
	jr z, .asm_97eee
	and $1
	jr z, .asm_97ee4
	ld hl, $0002
	add hl, bc
	ld a, [hSCY]
	sub [hl]
	ld [hSCY], a
	ret

.asm_97ee4
	ld hl, $0002
	add hl, bc
	ld a, [hSCY]
	add [hl]
	ld [hSCY], a
	ret

.asm_97eee
	ld hl, $0004
	add hl, bc
	ld a, [hl]
	ld [hSCY], a
	call Function97e72
	ret
; 97ef9

Function97ef9: ; 97ef9
	call Function97ea3
	dw Function97f02
	dw Function97f0a
	dw Function97f1b
; 97f02

Function97f02: ; 97f02
	call Function97f38
	jr z, Function97f2c
	call Function97eab
; 97f0a

Function97f0a: ; 97f0a
	call Function97f38
	jr z, Function97f2c
	call Function97eab

	ld hl, $0002
	add hl, bc
	ld a, [hl]
	ld [wd173], a
	ret
; 97f1b

Function97f1b: ; 97f1b
	call Function97f38
	jr z, Function97f2c
	call Function97eb1

	ld hl, $0003
	add hl, bc
	ld a, [hl]
	ld [wd173], a
	ret
; 97f2c

Function97f2c: ; 97f2c
	ld a, $7f
	ld [wd173], a
	ld hl, $0005
	add hl, bc
	ld [hl], 0
	ret
; 97f38

Function97f38: ; 97f38
	push bc
	ld bc, PlayerStruct
	call GetSpriteDirection
	and a
	pop bc
	ret
; 97f42

Function97f42: ; 97f42
	ld de, PlayerStruct
	ld a, $d
.asm_97f47
	push af

	ld hl, $0000
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_97f71

	ld hl, $0003
	add hl, de
	ld a, [hl]
	cp $19
	jr nz, .asm_97f71

	ld hl, $000e
	add hl, de
	ld a, [hl]
	call CheckPitTile
	jr nz, .asm_97f71

	ld hl, $0007
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, .asm_97f71
	call Function3567
	jr c, .asm_97f7c

.asm_97f71
	ld hl, $0028
	add hl, de
	ld d, h
	ld e, l

	pop af
	dec a
	jr nz, .asm_97f47
	ret

.asm_97f7c
	pop af
	ret
; 97f7e
