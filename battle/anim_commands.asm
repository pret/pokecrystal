; Battle animation command interpreter.


PlayBattleAnim: ; cc0d6

	ld a, [rSVBK]
	push af

	ld a, 5
	ld [rSVBK], a

	call _PlayBattleAnim

	pop af
	ld [rSVBK], a
	ret
; cc0e4

_PlayBattleAnim: ; cc0e4

	ld c, 6
.wait
	call BattleAnimDelayFrame
	dec c
	jr nz, .wait

	call BattleAnimAssignPals
	call BattleAnimRequestPals
	call BattleAnimDelayFrame

	ld c, 1
	ld a, [rKEY1]
	bit 7, a
	jr nz, .asm_cc0ff
	ld c, 3

.asm_cc0ff
	ld hl, $ff9e
	ld a, [hl]
	push af

	ld [hl], c
	call Functioncc11c

	pop af
	ld [$ff9e], a

	ld a, $1
	ld [hBGMapMode], a

	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call WaitSFX
	ret
; cc11c

Functioncc11c: ; cc11c

	ld a, [FXAnimIDHi]
	and a
	jr nz, .asm_cc156

	callba CheckBattleScene
	jr c, .asm_cc141

	call BattleAnimClearHud
	call Functioncc163

	call BattleAnimAssignPals
	call BattleAnimRequestPals

	xor a
	ld [hSCX], a
	ld [hSCY], a
	call BattleAnimDelayFrame
	call BattleAnimRestoreHuds

.asm_cc141
	ld a, [$cfca]
	and a
	jr z, .asm_cc15f

	ld l, a
	ld h, 0
	ld de, $10e
	add hl, de
	ld a, l
	ld [FXAnimIDLo], a
	ld a, h
	ld [FXAnimIDHi], a

.asm_cc156
	call WaitSFX
	call Functioncc881
	call Functioncc163

.asm_cc15f
	call Functioncc8f6
	ret
; cc163

Functioncc163: ; cc163

	call Functioncc8d3

.playframe
	call Functioncc25f
	call Functionccb48
	call Functioncc96e
	call Function3b0c
	call BattleAnimRequestPals

; Speed up Rollout's animation.
	ld a, [FXAnimIDHi]
	or a
	jr nz, .asm_cc193

	ld a, [FXAnimIDLo]
	cp ROLLOUT
	jr nz, .asm_cc193

	ld a, $2e
	ld b, 5
	ld de, 4
	ld hl, ActiveBGEffects
.asm_cc18c
	cp [hl]
	jr z, .asm_cc196
	add hl, de
	dec b
	jr nz, .asm_cc18c

.asm_cc193
	call BattleAnimDelayFrame

.asm_cc196
	ld a, [$d40f]
	bit 0, a
	jr z, .playframe

	call Functioncc23d
	ret
; cc1a1

BattleAnimClearHud: ; cc1a1

	call BattleAnimDelayFrame
	call WaitTop
	call ClearActorHud
	ld a, $1
	ld [hBGMapMode], a
	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call WaitTop
	ret
; cc1bb

BattleAnimRestoreHuds: ; cc1bb

	call BattleAnimDelayFrame
	call WaitTop

	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a

	ld hl, UpdateBattleHuds
	ld a, $f
	rst FarCall

	pop af
	ld [rSVBK], a

	ld a, $1
	ld [hBGMapMode], a
	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call WaitTop
	ret
; cc1e2

BattleAnimRequestPals: ; cc1e2

	ld a, [hCGB]
	and a
	ret z

	ld a, [rBGP]
	ld b, a
	ld a, [$cfc7]
	cp b
	call nz, Functioncc91a

	ld a, [rOBP0]
	ld b, a
	ld a, [$cfc8]
	cp b
	call nz, Functioncc94b
	ret
; cc1fb

BattleAnimDelayFrame: ; cc1fb
; Like DelayFrame but wastes battery life.

	ld a, 1
	ld [VBlankOccurred], a
.wait
	ld a, [VBlankOccurred]
	and a
	jr nz, .wait
	ret
; cc207

ClearActorHud: ; cc207

	ld a, [hBattleTurn]
	and a
	jr z, .player

	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ret

.player
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ret
; cc220

Functioncc220: ; cc220
; Appears to be unused.
	xor a
	ld [hBGMapMode], a
	ld a, $80
	ld [hBGMapAddress], a
	ld a, $9a
	ld [$ffd7], a
	call Function3200
	ld a, $60
	ld [hWY], a
	xor a
	ld [hBGMapAddress], a
	ld a, $98
	ld [$ffd7], a
	call BattleAnimDelayFrame
	ret
; cc23d


Functioncc23d: ; cc23d

	ld a, [$d40f]
	bit 3, a
	jr z, .asm_cc254

	ld hl, Sprites + 3
	ld c, (SpritesEnd - Sprites) / 4
.asm_cc249
	ld a, [hl]
	and $f0
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .asm_cc249
	ret

.asm_cc254
	ld hl, Sprites
	ld c, SpritesEnd - Sprites
	xor a
.asm_cc25a
	ld [hli], a
	dec c
	jr nz, .asm_cc25a
	ret
; cc25f

Functioncc25f: ; cc25f
	call Functioncc267
	ret nc
	call Functioncc275
	ret
; cc267

Functioncc267: ; cc267
	ld a, [$d412]
	and a
	jr z, .asm_cc273

	dec a
	ld [$d412], a
	and a
	ret

.asm_cc273
	scf
	ret
; cc275

Functioncc275: ; cc275

	call GetBattleAnimByte

	cp $ff
	jr nz, .asm_cc286

; Return from a subroutine.
	ld hl, $d40f
	bit 1, [hl]
	jr nz, .asm_cc28e

	set 0, [hl]
	ret

.asm_cc286
	cp $d0
	jr nc, .asm_cc28e

	ld [$d412], a
	ret

.asm_cc28e
	call Functioncc293

	jr Functioncc275
; cc293

Functioncc293: ; cc293
; Execute battle animation command in [$d417].
	ld a, [$d417]
	sub $d0

	ld e, a
	ld d, 0
	ld hl, BattleAnimCommands
	add hl, de
	add hl, de

	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; cc2a4


BattleAnimCommands:: ; cc2a4 (33:42a4)
	dw BattleAnimCmd_D0
	dw BattleAnimCmd_D1
	dw BattleAnimCmd_D2
	dw BattleAnimCmd_D3
	dw BattleAnimCmd_D4
	dw BattleAnimCmd_D5
	dw BattleAnimCmd_D6
	dw BattleAnimCmd_D7
	dw BattleAnimCmd_D8
	dw BattleAnimCmd_D9
	dw BattleAnimCmd_DA
	dw BattleAnimCmd_DB
	dw BattleAnimCmd_DC
	dw BattleAnimCmd_DD
	dw BattleAnimCmd_DE
	dw BattleAnimCmd_DF
	dw BattleAnimCmd_E0
	dw BattleAnimCmd_E1
	dw BattleAnimCmd_E2
	dw BattleAnimCmd_E3
	dw BattleAnimCmd_E4
	dw BattleAnimCmd_E5
	dw BattleAnimCmd_E6
	dw BattleAnimCmd_E7
	dw BattleAnimCmd_E8
	dw BattleAnimCmd_E9
	dw BattleAnimCmd_EA
	dw BattleAnimCmd_EB
	dw BattleAnimCmd_EC
	dw BattleAnimCmd_ED
	dw BattleAnimCmd_EE
	dw BattleAnimCmd_EF
	dw BattleAnimCmd_F0
	dw BattleAnimCmd_F1
	dw BattleAnimCmd_F2
	dw BattleAnimCmd_F3
	dw BattleAnimCmd_F4
	dw BattleAnimCmd_F5
	dw BattleAnimCmd_F6
	dw BattleAnimCmd_F7
	dw BattleAnimCmd_F8
	dw BattleAnimCmd_F9
	dw BattleAnimCmd_FA
	dw BattleAnimCmd_FB
	dw BattleAnimCmd_FC
	dw BattleAnimCmd_FD
	dw BattleAnimCmd_FE
	dw BattleAnimCmd_FF


BattleAnimCmd_EA:
BattleAnimCmd_EB:
BattleAnimCmd_EC:
BattleAnimCmd_ED: ; cc304 (33:4304)
	ret

BattleAnimCmd_FF: ; cc305 (33:4305)
	ld hl, $d40f
	res 1, [hl]
	ld hl, $d413
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $d410
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_FE: ; cc317 (33:4317)
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	push de
	ld hl, $d410
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $d413
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	ld hl, $d410
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $d40f
	set 1, [hl]
	ret

BattleAnimCmd_FC: ; cc339 (33:4339)
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, $d410
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_FD: ; cc348 (33:4348)
	call GetBattleAnimByte
	ld hl, $d40f
	bit 2, [hl]
	jr nz, .asm_cc35b
	and a
	jr z, .asm_cc363
	dec a
	set 2, [hl]
	ld [$d415], a
.asm_cc35b
	ld hl, $d415
	ld a, [hl]
	and a
	jr z, .asm_cc372
	dec [hl]
.asm_cc363
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, $d410
	ld [hl], e
	inc hl
	ld [hl], d
	ret
.asm_cc372
	ld hl, $d40f
	res 2, [hl]
	ld hl, $d410
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret

BattleAnimCmd_EF: ; cc383 (33:4383)
	ld hl, $c689
	ld a, [hl]
	and a
	jr z, .asm_cc39a

	dec [hl]
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, $d410
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.asm_cc39a
	ld hl, $d410
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret

BattleAnimCmd_F9: ; cc3a6 (33:43a6)
	call GetBattleAnimByte
	ld [$d416], a
	ret

BattleAnimCmd_FA: ; cc3ad (33:43ad)
	ld hl, $d416
	inc [hl]
	ret

BattleAnimCmd_FB: ; cc3b2 (33:43b2)
	call GetBattleAnimByte
	ld hl, $d416
	cp [hl]
	jr z, .jump

	ld hl, $d410
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret

.jump
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, $d410
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_F8: ; cc3d6 (33:43d6)
	call GetBattleAnimByte
	ld hl, $c689
	cp [hl]
	jr z, .jump

	ld hl, $d410
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret

.jump
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, $d410
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_EE: ; cc3fa (33:43fa)
	call GetBattleAnimByte
	ld e, a
	ld a, [$c689]
	and e
	jr nz, .jump

	ld hl, $d410
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret
.jump
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, $d410
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_D0: ; cc41f (33:441f)
	call GetBattleAnimByte
	ld [$d419], a
	call GetBattleAnimByte
	ld [$d41a], a
	call GetBattleAnimByte
	ld [$d41b], a
	call GetBattleAnimByte
	ld [$d41c], a
	call Functioncc9a1
	ret

BattleAnimCmd_F0: ; cc43b (33:443b)
	call GetBattleAnimByte
	ld [$d419], a
	call GetBattleAnimByte
	ld [$d41a], a
	call GetBattleAnimByte
	ld [$d41b], a
	call GetBattleAnimByte
	ld [$d41c], a
	call Functionccb4f
	ret

BattleAnimCmd_F1: ; cc457 (33:4457)
	call GetBattleAnimByte
	ld [$cfc7], a
	ret

BattleAnimCmd_F2: ; cc45e (33:445e)
	call GetBattleAnimByte
	ld [$cfc8], a
	ret

BattleAnimCmd_F3: ; cc465 (33:4465)
	call GetBattleAnimByte
	ld [$cfc9], a
	ret

BattleAnimCmd_DF: ; cc46c (33:446c)
	ld a, [hSGB] ; $ff00+$e7
	and a
	ld a, $e0
	jr z, .asm_cc475
	ld a, $f0
.asm_cc475
	ld [$cfc8], a
	ret

BattleAnimCmd_E5: ; cc479 (33:4479)
	ld hl, $d30a
	ld a, $a0
.asm_cc47e
	ld [hl], $0
	inc hl
	dec a
	jr nz, .asm_cc47e
	ret

BattleAnimCmd_D1:
BattleAnimCmd_D2:
BattleAnimCmd_D3:
BattleAnimCmd_D4:
BattleAnimCmd_D5: ; cc485 (33:4485)
	ld a, [$d417]
	and $f
	ld c, a
	ld hl, $d300
	xor a
	ld [$d419], a
.asm_cc492
	ld a, [$d419]
	cp $4f
	ret nc
	call GetBattleAnimByte
	ld [hli], a
	ld a, [$d419]
	ld [hli], a
	push bc
	push hl
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $8310
	add hl, de
	ld a, [$d417]
	call Functionce846
	ld a, [$d419]
	add c
	ld [$d419], a
	pop hl
	pop bc
	dec c
	jr nz, .asm_cc492
	ret

BattleAnimCmd_D6: ; cc4c0 (33:44c0)
	call GetBattleAnimByte
	ld e, $a
	ld bc, $d30a
.asm_cc4c8
	ld hl, $0
	add hl, bc
	ld d, [hl]
	ld a, [$d417]
	cp d
	jr z, .asm_cc4dd
	ld hl, $18
	add hl, bc
	ld c, l
	ld b, h
	dec e
	jr nz, .asm_cc4c8
	ret
.asm_cc4dd
	ld hl, $e
	add hl, bc
	inc [hl]
	ret

BattleAnimCmd_D8: ; cc4e3 (33:44e3)
	call GetBattleAnimByte
	ld e, $5
	ld bc, $d3fa
.asm_cc4eb
	ld hl, $0
	add hl, bc
	ld d, [hl]
	ld a, [$d417]
	cp d
	jr z, .asm_cc500
	ld hl, $4
	add hl, bc
	ld c, l
	ld b, h
	dec e
	jr nz, .asm_cc4eb
	ret
.asm_cc500
	ld hl, $1
	add hl, bc
	inc [hl]
	ret

BattleAnimCmd_D7: ; cc506 (33:4506)
	call GetBattleAnimByte
	ld e, $a
	ld bc, $d30a
.asm_cc50e
	ld hl, $0
	add hl, bc
	ld d, [hl]
	ld a, [$d417]
	cp d
	jr z, .asm_cc523
	ld hl, $18
	add hl, bc
	ld c, l
	ld b, h
	dec e
	jr nz, .asm_cc50e
	ret
.asm_cc523
	call GetBattleAnimByte
	ld hl, $e
	add hl, bc
	ld [hl], a
	ret

BattleAnimCmd_D9: ; cc52c (33:452c)

	ld hl, $d300
.asm_cc52f
	ld a, [hl]
	and a
	jr z, .asm_cc537
	inc hl
	inc hl
	jr .asm_cc52f

.asm_cc537
	ld a, $28
	ld [hli], a
	ld a, $42
	ld [hli], a
	ld a, $29
	ld [hli], a
	ld a, $49
	ld [hl], a

	ld hl, $8730
	ld de, $9060
	ld a, $70
	ld [$d419], a
	ld a, $7
	call Functioncc561
	ld de, $9310
	ld a, $60
	ld [$d419], a
	ld a, $6
	call Functioncc561
	ret

Functioncc561: ; cc561 (33:4561)
	push af
	push hl
	push de
	ld bc, $3301
	call Request2bpp
	pop de
	ld a, [$d419]
	ld l, a
	ld h, $0
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld bc, $10
	add hl, bc
	pop af
	dec a
	jr nz, Functioncc561
	ret

BattleAnimCmd_DA: ; cc57e (33:457e)

	ld hl, $d300
.asm_cc581
	ld a, [hl]
	and a
	jr z, .asm_cc589
	inc hl
	inc hl
	jr .asm_cc581

.asm_cc589
	ld a, $28
	ld [hli], a
	ld a, $35
	ld [hli], a
	ld a, $29
	ld [hli], a
	ld a, $43
	ld [hl], a

	ld hl, $8660
	ld de, $9050
	ld a, $70
	ld [$d419], a
	ld a, $7
	call Functioncc5b3
	ld de, $9310
	ld a, $60
	ld [$d419], a
	ld a, $6
	call Functioncc5b3
	ret

Functioncc5b3: ; cc5b3 (33:45b3)
	push af
	push hl
	push de
	ld bc, $3302
	call Request2bpp
	pop de
	ld a, [$d419]
	ld l, a
	ld h, $0
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld bc, $20
	add hl, bc
	pop af
	dec a
	jr nz, Functioncc5b3
	ret

BattleAnimCmd_DB: ; cc5d0 (33:45d0)
	callab GetPokeBallWobble
	ld a, c
	ld [$d416], a
	ret

BattleAnimCmd_E7: ; cc5db (33:45db)
	ret

BattleAnimCmd_DC: ; cc5dc (33:45dc)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, 1
	ld [rSVBK], a ; $ff00+$70
	ld a, [CurPartySpecies] ; $d108
	push af

	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr z, .player

	ld a, [TempBattleMonSpecies] ; $d205
	ld [CurPartySpecies], a ; $d108
	ld hl, BattleMonDVs ; $c632
	predef GetUnownLetter
	ld de, $8000
	predef GetFrontpic
	jr .done

.player
	ld a, [TempEnemyMonSpecies] ; $d204
	ld [CurPartySpecies], a ; $d108
	ld hl, EnemyMonDVs ; $d20c
	predef GetUnownLetter
	ld de, $8000
	predef GetBackpic

.done
	pop af
	ld [CurPartySpecies], a ; $d108
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

BattleAnimCmd_E8: ; cc622 (33:4622)

	ld de, $8000
	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr z, .player

	ld hl, $9000
	ld b, 0
	ld c, $31
	call Request2bpp
	ret

.player
	ld hl, $9310
	ld b, 0
	ld c, $24
	call Request2bpp
	ret

BattleAnimCmd_DD: ; cc640 (33:4640)

	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, 1
	ld [rSVBK], a ; $ff00+$70
	xor a
	call GetSRAMBank

GetSubstitutePic: ; cc64c

	ld hl, $a000
	ld bc, $310
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop

	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr z, .player

	ld hl, MonsterSpriteGFX
	ld de, $a000 + $130
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $10
	ld de, $a000 + $1a0
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $20
	ld de, $a000 + $140
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $30
	ld de, $a000 + $1b0
	call CopyMonsterSpriteTile

	ld hl, $9000
	ld de, $a000
	lb bc, BANK(GetSubstitutePic), 7 * 7
	call Request2bpp
	jr .done

.player
	ld hl, MonsterSpriteGFX + $40
	ld de, $a000 + $100
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $50
	ld de, $a000 + $160
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $60
	ld de, $a000 + $110
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $70
	ld de, $a000 + $170
	call CopyMonsterSpriteTile

	ld hl, $9310
	ld de, $a000
	lb bc, BANK(GetSubstitutePic), 6 * 6
	call Request2bpp

.done
	call CloseSRAM
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

CopyMonsterSpriteTile: ; cc6c6 (33:46c6)
	ld bc, $10
	ld a, BANK(MonsterSpriteGFX)
	call FarCopyBytes
	ret

BattleAnimCmd_E2: ; cc6cf (33:46cf)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $1
	ld [rSVBK], a ; $ff00+$70
	xor a
	call GetSRAMBank
	call GetMinimizePic
	call Request2bpp
	call CloseSRAM
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

GetMinimizePic: ; cc6e7 (33:46e7)
	ld hl, $a000
	ld bc, $310
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop

	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr z, .player

	ld de, $a1a0
	call CopyMinimizePic
	ld hl, $9000
	ld de, $a000
	lb bc, BANK(GetMinimizePic), $31
	ret

.player
	ld de, $a160
	call CopyMinimizePic
	ld hl, $9310
	ld de, $a000
	lb bc, BANK(GetMinimizePic), $24
	ret

CopyMinimizePic: ; cc719 (33:4719)
	ld hl, MinimizePic
	ld bc, $10
	ld a, BANK(MinimizePic)
	call FarCopyBytes
	ret
; cc725 (33:4725)

MinimizePic: ; cc725
INCBIN "gfx/battle/minimize.2bpp"
; cc735

BattleAnimCmd_E9: ; cc735 (33:4735)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $1
	ld [rSVBK], a ; $ff00+$70
	xor a
	call GetSRAMBank
	call GetMinimizePic
	ld hl, $8000
	call Request2bpp
	call CloseSRAM
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

BattleAnimCmd_DE: ; cc750 (33:4750)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $1
	ld [rSVBK], a ; $ff00+$70

	ld a, [CurPartySpecies] ; $d108
	push af
	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr z, .player

	callab Function3f486
	jr .done

.player
	callab Function3f447

.done
	pop af
	ld [CurPartySpecies], a ; $d108
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

BattleAnimCmd_E6: ; cc776 (33:4776)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $1
	ld [rSVBK], a ; $ff00+$70
	ld a, [CurPartySpecies] ; $d108
	push af

	ld a, [$c689]
	ld [CurPartySpecies], a ; $d108

	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr z, .player

	ld hl, BattleMonDVs ; $c632
	predef GetUnownLetter
	ld de, $9000
	predef GetFrontpic
	jr .done

.player
	ld hl, EnemyMonDVs ; $d20c
	predef GetUnownLetter
	ld de, $9310
	predef GetBackpic

.done
	pop af
	ld [CurPartySpecies], a ; $d108
	ld b, $1
	call GetSGBLayout
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

BattleAnimCmd_E3: ; cc7bb (33:47bb)
	xor a
	ld [hOAMUpdate], a ; $ff00+$d8
	ret

BattleAnimCmd_E4: ; cc7bf (33:47bf)
	ld a, $1
	ld [hOAMUpdate], a ; $ff00+$d8
	ret

BattleAnimCmd_F4: ; cc7c4 (33:47c4)
	ld hl, $d40f
	set 3, [hl]
	ret

BattleAnimCmd_F5: ; cc7ca (33:47ca)
	ret

BattleAnimCmd_F6: ; cc7cb (33:47cb)
	ret

BattleAnimCmd_F7: ; cc7cc (33:47cc)
	ret

BattleAnimCmd_E0: ; cc7cd (33:47cd)
	call GetBattleAnimByte
	ld e, a
	srl a
	srl a
	ld [$c2be], a
	call Functioncc7fc
	and 3
	ld [CryTracks], a ; $c2bd

	ld e, a
	ld d, 0
	ld hl, Datacc7f8
	add hl, de
	ld a, [hl]
	ld [$c2bc], a

	call GetBattleAnimByte
	ld e, a
	ld d, 0
	callab PlayStereoSFX

	ret
; cc7f8 (33:47f8)

Datacc7f8: ; cc7f8
	db $f0, $0f, $f0, $0f
; cc7fc

Functioncc7fc: ; cc7fc (33:47fc)
	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr nz, .enemy

	ld a, e
	ret

.enemy
	ld a, e
	xor 1
	ret

BattleAnimCmd_E1: ; cc807 (33:4807)
	call GetBattleAnimByte
	and 3
	ld e, a
	ld d, 0
	ld hl, Datacc871
	add hl, de
	add hl, de
	add hl, de
	add hl, de

	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, 1
	ld [rSVBK], a ; $ff00+$70

	ld a, [hBattleTurn] ; $ff00+$e4
	and a
	jr nz, .enemy

	ld a, $f0
	ld [CryTracks], a ; $c2bd
	ld a, [BattleMonSpecies] ; $c62c
	jr .asm_cc834

.enemy
	ld a, $0f
	ld [CryTracks], a ; $c2bd
	ld a, [EnemyMonSpecies] ; $d206

.asm_cc834
	push hl
	call LoadCryHeader
	pop hl
	jr c, .done

	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a

	push hl
	ld hl, CryPitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, l
	ld [CryPitch], a
	ld a, h
	ld [CryPitch + 1], a
	pop hl

	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld hl, CryLength ; $c2b2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc

	ld a, l
	ld [CryLength], a ; $c2b2
	ld a, h
	ld [CryLength + 1], a
	ld a, 1
	ld [$c2bc], a

	callab _PlayCryHeader

.done
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret
; cc871 (33:4871)

Datacc871: ; cc871
; +pitch, +length
	dw 0, $c0
	dw 0, $40
	dw 0, $00
	dw 0, $00
; cc881


Functioncc881: ; cc881
	ld a, [$cfca]
	cp $1
	jr z, .asm_cc88b
	cp $4
	ret nz

.asm_cc88b
	ld a, [TypeModifier]
	and $7f
	ret z

	cp 10
	ld de, SFX_DAMAGE
	jr z, .play

	ld de, SFX_SUPER_EFFECTIVE
	jr nc, .play

	ld de, SFX_NOT_VERY_EFFECTIVE

.play
	call PlaySFX
	ret
; cc8a4

BattleAnimAssignPals: ; cc8a4
	ld a, [hCGB]
	and a
	jr nz, .asm_cc8be
	ld a, [hSGB]
	and a
	ld a, $e0
	jr z, .asm_cc8b2
	ld a, $f0

.asm_cc8b2
	ld [$cfc8], a
	ld a, $e4
	ld [$cfc7], a
	ld [$cfc9], a
	ret

.asm_cc8be
	ld a, $e4
	ld [$cfc7], a
	ld [$cfc8], a
	ld [$cfc9], a
	call DmgToCgbBGPals
	ld de, $e4e4
	call DmgToCgbObjPals
	ret
; cc8d3

Functioncc8d3: ; cc8d3
	ld hl, LYOverrides
	ld bc, $0354
.asm_cc8d9
	ld [hl], $0
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .asm_cc8d9
	ld hl, FXAnimIDLo
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, BattleAnimations
	add hl, de
	add hl, de
	call Function3ae1
	call BattleAnimAssignPals
	call BattleAnimDelayFrame
	ret
; cc8f6

Functioncc8f6: ; cc8f6
	call WaitTop
	ld a, $e4
	ld [$cfc7], a
	ld [$cfc8], a
	ld [$cfc9], a
	call DmgToCgbBGPals
	ld de, $e4e4
	call DmgToCgbObjPals
	xor a
	ld [hSCX], a
	ld [hSCY], a
	call BattleAnimDelayFrame
	ld a, $1
	ld [hBGMapMode], a
	ret
; cc91a

Functioncc91a: ; cc91a
	ld [rBGP], a
	ld a, [hCGB]
	and a
	ret z
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, $d080
	ld de, $d000
	ld a, [rBGP]
	ld b, a
	ld c, $7
	call CopyPals
	ld hl, $d0c0
	ld de, MartPointer
	ld a, [rBGP]
	ld b, a
	ld c, $2
	call CopyPals
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; cc94b

Functioncc94b: ; cc94b
	ld [rOBP0], a
	ld a, [hCGB]
	and a
	ret z
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, $d0d0
	ld de, $d050
	ld a, [rOBP0]
	ld b, a
	ld c, $2
	call CopyPals
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; cc96e

Functioncc96e: ; cc96e
	ld a, $0
	ld [$d418], a
	ld hl, $d30a
	ld e, $a
.asm_cc978
	ld a, [hl]
	and a
	jr z, .asm_cc98a
	ld c, l
	ld b, h
	push hl
	push de
	call Functionccfbe
	call Functioncca09
	pop de
	pop hl
	jr c, .asm_cc9a0

.asm_cc98a
	ld bc, $0018
	add hl, bc
	dec e
	jr nz, .asm_cc978
	ld a, [$d418]
	ld l, a
	ld h, $c4
.asm_cc997
	ld a, l
	cp $a0
	jr nc, .asm_cc9a0
	xor a
	ld [hli], a
	jr .asm_cc997

.asm_cc9a0
	ret
; cc9a1


