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
	ld hl, hVBlank
	ld a, [hl]
	push af

	ld [hl], c
	call BattleAnimRunScript

	pop af
	ld [hVBlank], a

	ld a, $1
	ld [hBGMapMode], a

	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call WaitSFX
	ret
; cc11c

BattleAnimRunScript: ; cc11c

	ld a, [FXAnimIDHi]
	and a
	jr nz, .hi_byte

	callba CheckBattleScene
	jr c, .disabled

	call BattleAnimClearHud
	call RunBattleAnimScript

	call BattleAnimAssignPals
	call BattleAnimRequestPals

	xor a
	ld [hSCX], a
	ld [hSCY], a
	call BattleAnimDelayFrame
	call BattleAnimRestoreHuds

.disabled
	ld a, [wcfca]
	and a
	jr z, .done

	ld l, a
	ld h, 0
	ld de, ANIM_MISS
	add hl, de
	ld a, l
	ld [FXAnimIDLo], a
	ld a, h
	ld [FXAnimIDHi], a

.hi_byte
	call WaitSFX
	call Functioncc881
	call RunBattleAnimScript

.done
	call Functioncc8f6
	ret
; cc163

RunBattleAnimScript: ; cc163

	call Functioncc8d3

.playframe
	call Functioncc25f
	call _ExecuteBGEffects
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
	ld a, [BattleAnimFlags]
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
	ld a, BANK(UpdatePlayerHUD)
	rst FarCall ; Why the heck is this a callab?

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
	ld a, [wcfc7]
	cp b
	call nz, Functioncc91a

	ld a, [rOBP0]
	ld b, a
	ld a, [wcfc8]
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
	ld a, (VBGMap0 tile $28) % $100
	ld [hBGMapAddress], a
	ld a, (VBGMap0 tile $28) / $100
	ld [hBGMapAddress + 1], a
	call Function3200
	ld a, $60
	ld [hWY], a
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	call BattleAnimDelayFrame
	ret
; cc23d


Functioncc23d: ; cc23d

	ld a, [BattleAnimFlags]
	bit 3, a
	jr z, .skip

	ld hl, Sprites + 3
	ld c, (SpritesEnd - Sprites) / 4
.loop
	ld a, [hl]
	and $f0
	ld [hli], a
rept 3
	inc hl
endr
	dec c
	jr nz, .loop
	ret

.skip
	ld hl, Sprites
	ld c, SpritesEnd - Sprites
	xor a
.loop2
	ld [hli], a
	dec c
	jr nz, .loop2
	ret
; cc25f

Functioncc25f: ; cc25f
	call .CheckTimer
	ret nc
	call .RunScript
	ret
; cc267

.CheckTimer: ; cc267
	ld a, [BattleAnimDuration]
	and a
	jr z, .done

	dec a
	ld [BattleAnimDuration], a
	and a
	ret

.done
	scf
	ret
; cc275

.RunScript: ; cc275
.loop
	call GetBattleAnimByte

	cp $ff
	jr nz, .not_done_with_anim

; Return from a subroutine.
	ld hl, BattleAnimFlags
	bit 1, [hl]
	jr nz, .do_anim

	set 0, [hl]
	ret

.not_done_with_anim
	cp $d0
	jr nc, .do_anim

	ld [BattleAnimDuration], a
	ret

.do_anim
	call .DoCommand

	jr .loop
; cc293

.DoCommand: ; cc293
; Execute battle animation command in [BattleAnimByte].
	ld a, [BattleAnimByte]
	sub $d0

	ld e, a
	ld d, 0
	ld hl, BattleAnimCommands
rept 2
	add hl, de
endr

	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; cc2a4


BattleAnimCommands:: ; cc2a4 (33:42a4)
	dw BattleAnimCmd_Obj
	dw BattleAnimCmd_1GFX
	dw BattleAnimCmd_2GFX
	dw BattleAnimCmd_3GFX
	dw BattleAnimCmd_4GFX
	dw BattleAnimCmd_5GFX
	dw BattleAnimCmd_IncObj
	dw BattleAnimCmd_SetObj
	dw BattleAnimCmd_IncBGEffect
	dw BattleAnimCmd_EnemyFeetObj
	dw BattleAnimCmd_PlayerHeadObj
	dw BattleAnimCmd_CheckPokeball
	dw BattleAnimCmd_Transform
	dw BattleAnimCmd_RaiseSub
	dw BattleAnimCmd_DropSub
	dw BattleAnimCmd_ResetObp0
	dw BattleAnimCmd_Sound
	dw BattleAnimCmd_Cry
	dw BattleAnimCmd_MinimizeOpp
	dw BattleAnimCmd_OAMOn
	dw BattleAnimCmd_OAMOff
	dw BattleAnimCmd_ClearObjs
	dw BattleAnimCmd_BeatUp
	dw BattleAnimCmd_E7
	dw BattleAnimCmd_UpdateActorPic
	dw BattleAnimCmd_Minimize
	dw BattleAnimCmd_EA ; dummy
	dw BattleAnimCmd_EB ; dummy
	dw BattleAnimCmd_EC ; dummy
	dw BattleAnimCmd_ED ; dummy
	dw BattleAnimCmd_JumpAnd
	dw BattleAnimCmd_JumpUntil
	dw BattleAnimCmd_BGEffect
	dw BattleAnimCmd_BGP
	dw BattleAnimCmd_OBP0
	dw BattleAnimCmd_OBP1
	dw BattleAnimCmd_ClearSprites
	dw BattleAnimCmd_F5
	dw BattleAnimCmd_F6
	dw BattleAnimCmd_F7
	dw BattleAnimCmd_JumpIf
	dw BattleAnimCmd_SetVar
	dw BattleAnimCmd_IncVar
	dw BattleAnimCmd_JumpVar
	dw BattleAnimCmd_Jump
	dw BattleAnimCmd_Loop
	dw BattleAnimCmd_Call
	dw BattleAnimCmd_Ret


BattleAnimCmd_EA:
BattleAnimCmd_EB:
BattleAnimCmd_EC:
BattleAnimCmd_ED: ; cc304 (33:4304)
	ret

BattleAnimCmd_Ret: ; cc305 (33:4305)
	ld hl, BattleAnimFlags
	res 1, [hl]
	ld hl, BattleAnimParent
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_Call: ; cc317 (33:4317)
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	push de
	ld hl, BattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, BattleAnimParent
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, BattleAnimFlags
	set 1, [hl]
	ret

BattleAnimCmd_Jump: ; cc339 (33:4339)
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_Loop: ; cc348 (33:4348)
	call GetBattleAnimByte
	ld hl, BattleAnimFlags
	bit 2, [hl]
	jr nz, .asm_cc35b
	and a
	jr z, .asm_cc363
	dec a
	set 2, [hl]
	ld [BattleAnimLoops], a
.asm_cc35b
	ld hl, BattleAnimLoops
	ld a, [hl]
	and a
	jr z, .asm_cc372
	dec [hl]
.asm_cc363
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret
.asm_cc372
	ld hl, BattleAnimFlags
	res 2, [hl]
	ld hl, BattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
rept 2
	inc de
endr
	ld [hl], d
	dec hl
	ld [hl], e
	ret

BattleAnimCmd_JumpUntil: ; cc383 (33:4383)
	ld hl, wKickCounter
	ld a, [hl]
	and a
	jr z, .asm_cc39a

	dec [hl]
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.asm_cc39a
	ld hl, BattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
rept 2
	inc de
endr
	ld [hl], d
	dec hl
	ld [hl], e
	ret

BattleAnimCmd_SetVar: ; cc3a6 (33:43a6)
	call GetBattleAnimByte
	ld [BattleAnimVar], a
	ret

BattleAnimCmd_IncVar: ; cc3ad (33:43ad)
	ld hl, BattleAnimVar
	inc [hl]
	ret

BattleAnimCmd_JumpVar: ; cc3b2 (33:43b2)
	call GetBattleAnimByte
	ld hl, BattleAnimVar
	cp [hl]
	jr z, .jump

	ld hl, BattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
rept 2
	inc de
endr
	ld [hl], d
	dec hl
	ld [hl], e
	ret

.jump
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_JumpIf: ; cc3d6 (33:43d6)
	call GetBattleAnimByte
	ld hl, wKickCounter
	cp [hl]
	jr z, .jump

	ld hl, BattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
rept 2
	inc de
endr
	ld [hl], d
	dec hl
	ld [hl], e
	ret

.jump
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_JumpAnd: ; cc3fa (33:43fa)
	call GetBattleAnimByte
	ld e, a
	ld a, [wKickCounter]
	and e
	jr nz, .jump

	ld hl, BattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
rept 2
	inc de
endr
	ld [hl], d
	dec hl
	ld [hl], e
	ret
.jump
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_Obj: ; cc41f (33:441f)
	call GetBattleAnimByte
	ld [BattleAnimTemps], a
	call GetBattleAnimByte
	ld [BattleAnimTemps + 1], a
	call GetBattleAnimByte
	ld [BattleAnimTemps + 2], a
	call GetBattleAnimByte
	ld [BattleAnimTemps + 3], a
	call QueueBattleAnimation
	ret

BattleAnimCmd_BGEffect: ; cc43b (33:443b)
	call GetBattleAnimByte
	ld [BattleAnimTemps], a
	call GetBattleAnimByte
	ld [BattleAnimTemps + 1], a
	call GetBattleAnimByte
	ld [BattleAnimTemps + 2], a
	call GetBattleAnimByte
	ld [BattleAnimTemps + 3], a
	call _QueueBGEffect
	ret

BattleAnimCmd_BGP: ; cc457 (33:4457)
	call GetBattleAnimByte
	ld [wcfc7], a
	ret

BattleAnimCmd_OBP0: ; cc45e (33:445e)
	call GetBattleAnimByte
	ld [wcfc8], a
	ret

BattleAnimCmd_OBP1: ; cc465 (33:4465)
	call GetBattleAnimByte
	ld [wcfc9], a
	ret

BattleAnimCmd_ResetObp0: ; cc46c (33:446c)
	ld a, [hSGB]
	and a
	ld a, $e0
	jr z, .not_sgb
	ld a, $f0
.not_sgb
	ld [wcfc8], a
	ret

BattleAnimCmd_ClearObjs: ; cc479 (33:4479)
	ld hl, ActiveAnimObjects
	ld a, $a0
.loop
	ld [hl], $0
	inc hl
	dec a
	jr nz, .loop
	ret

BattleAnimCmd_1GFX:
BattleAnimCmd_2GFX:
BattleAnimCmd_3GFX:
BattleAnimCmd_4GFX:
BattleAnimCmd_5GFX: ; cc485 (33:4485)
	ld a, [BattleAnimByte]
	and $f
	ld c, a
	ld hl, w5_d300
	xor a
	ld [BattleAnimTemps], a
.asm_cc492
	ld a, [BattleAnimTemps]
	cp $4f
	ret nc
	call GetBattleAnimByte
	ld [hli], a
	ld a, [BattleAnimTemps]
	ld [hli], a
	push bc
	push hl
	ld l, a
	ld h, $0
rept 4
	add hl, hl
endr
	ld de, VTiles0 tile $31
	add hl, de
	ld a, [BattleAnimByte]
	call Functionce846
	ld a, [BattleAnimTemps]
	add c
	ld [BattleAnimTemps], a
	pop hl
	pop bc
	dec c
	jr nz, .asm_cc492
	ret

BattleAnimCmd_IncObj: ; cc4c0 (33:44c0)
	call GetBattleAnimByte
	ld e, $a
	ld bc, ActiveAnimObjects
.asm_cc4c8
	ld hl, $0
	add hl, bc
	ld d, [hl]
	ld a, [BattleAnimByte]
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

BattleAnimCmd_IncBGEffect: ; cc4e3 (33:44e3)
	call GetBattleAnimByte
	ld e, $5
	ld bc, ActiveBGEffects
.asm_cc4eb
	ld hl, $0
	add hl, bc
	ld d, [hl]
	ld a, [BattleAnimByte]
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

BattleAnimCmd_SetObj: ; cc506 (33:4506)
	call GetBattleAnimByte
	ld e, $a
	ld bc, ActiveAnimObjects
.asm_cc50e
	ld hl, $0
	add hl, bc
	ld d, [hl]
	ld a, [BattleAnimByte]
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

BattleAnimCmd_EnemyFeetObj: ; cc52c (33:452c)

	ld hl, w5_d300
.asm_cc52f
	ld a, [hl]
	and a
	jr z, .asm_cc537
rept 2
	inc hl
endr
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

	ld hl, VTiles0 tile $73
	ld de, VTiles2 tile $06
	ld a, $70
	ld [BattleAnimTemps], a
	ld a, $7
	call Functioncc561
	ld de, VTiles2 tile $31
	ld a, $60
	ld [BattleAnimTemps], a
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
	ld a, [BattleAnimTemps]
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

BattleAnimCmd_PlayerHeadObj: ; cc57e (33:457e)

	ld hl, w5_d300
.asm_cc581
	ld a, [hl]
	and a
	jr z, .asm_cc589
rept 2
	inc hl
endr
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

	ld hl, VTiles0 tile $66
	ld de, VTiles2 tile $05
	ld a, $70
	ld [BattleAnimTemps], a
	ld a, $7
	call Functioncc5b3
	ld de, VTiles2 tile $31
	ld a, $60
	ld [BattleAnimTemps], a
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
	ld a, [BattleAnimTemps]
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

BattleAnimCmd_CheckPokeball: ; cc5d0 (33:45d0)
	callab GetPokeBallWobble
	ld a, c
	ld [BattleAnimVar], a
	ret

BattleAnimCmd_E7: ; cc5db (33:45db)
	ret

BattleAnimCmd_Transform: ; cc5dc (33:45dc)
	ld a, [rSVBK]
	push af
	ld a, 1
	ld [rSVBK], a
	ld a, [CurPartySpecies] ; CurPartySpecies
	push af

	ld a, [hBattleTurn]
	and a
	jr z, .player

	ld a, [TempBattleMonSpecies] ; TempBattleMonSpecies
	ld [CurPartySpecies], a ; CurPartySpecies
	ld hl, BattleMonDVs ; BattleMonDVs
	predef GetUnownLetter
	ld de, VTiles0 tile $00
	predef GetFrontpic
	jr .done

.player
	ld a, [TempEnemyMonSpecies] ; TempEnemyMonSpecies
	ld [CurPartySpecies], a ; CurPartySpecies
	ld hl, EnemyMonDVs ; EnemyMonDVs
	predef GetUnownLetter
	ld de, VTiles0 tile $00
	predef GetBackpic

.done
	pop af
	ld [CurPartySpecies], a ; CurPartySpecies
	pop af
	ld [rSVBK], a
	ret

BattleAnimCmd_UpdateActorPic: ; cc622 (33:4622)

	ld de, VTiles0 tile $00
	ld a, [hBattleTurn]
	and a
	jr z, .player

	ld hl, VTiles2 tile $00
	ld b, 0
	ld c, $31
	call Request2bpp
	ret

.player
	ld hl, VTiles2 tile $31
	ld b, 0
	ld c, $24
	call Request2bpp
	ret

BattleAnimCmd_RaiseSub: ; cc640 (33:4640)

	ld a, [rSVBK]
	push af
	ld a, 1
	ld [rSVBK], a
	xor a
	call GetSRAMBank

GetSubstitutePic: ; cc64c

	ld hl, sScratch
	ld bc, $310
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop

	ld a, [hBattleTurn]
	and a
	jr z, .player

	ld hl, MonsterSpriteGFX
	ld de, sScratch + $130
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $10
	ld de, sScratch + $1a0
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $20
	ld de, sScratch + $140
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $30
	ld de, sScratch + $1b0
	call CopyMonsterSpriteTile

	ld hl, VTiles2 tile $00
	ld de, sScratch
	lb bc, BANK(GetSubstitutePic), 7 * 7
	call Request2bpp
	jr .done

.player
	ld hl, MonsterSpriteGFX + $40
	ld de, sScratch + $100
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $50
	ld de, sScratch + $160
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $60
	ld de, sScratch + $110
	call CopyMonsterSpriteTile
	ld hl, MonsterSpriteGFX + $70
	ld de, sScratch + $170
	call CopyMonsterSpriteTile

	ld hl, VTiles2 tile $31
	ld de, sScratch
	lb bc, BANK(GetSubstitutePic), 6 * 6
	call Request2bpp

.done
	call CloseSRAM
	pop af
	ld [rSVBK], a
	ret

CopyMonsterSpriteTile: ; cc6c6 (33:46c6)
	ld bc, $10
	ld a, BANK(MonsterSpriteGFX)
	call FarCopyBytes
	ret

BattleAnimCmd_MinimizeOpp: ; cc6cf (33:46cf)
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	xor a
	call GetSRAMBank
	call GetMinimizePic
	call Request2bpp
	call CloseSRAM
	pop af
	ld [rSVBK], a
	ret

GetMinimizePic: ; cc6e7 (33:46e7)
	ld hl, sScratch
	ld bc, $310
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop

	ld a, [hBattleTurn]
	and a
	jr z, .player

	ld de, sScratch + $1a0
	call CopyMinimizePic
	ld hl, VTiles2 tile $00
	ld de, sScratch
	lb bc, BANK(GetMinimizePic), $31
	ret

.player
	ld de, sScratch + $160
	call CopyMinimizePic
	ld hl, VTiles2 tile $31
	ld de, sScratch
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

BattleAnimCmd_Minimize: ; cc735 (33:4735)
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	xor a
	call GetSRAMBank
	call GetMinimizePic
	ld hl, VTiles0 tile $00
	call Request2bpp
	call CloseSRAM
	pop af
	ld [rSVBK], a
	ret

BattleAnimCmd_DropSub: ; cc750 (33:4750)
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a

	ld a, [CurPartySpecies] ; CurPartySpecies
	push af
	ld a, [hBattleTurn]
	and a
	jr z, .player

	callab Function3f486
	jr .done

.player
	callab Function3f447

.done
	pop af
	ld [CurPartySpecies], a ; CurPartySpecies
	pop af
	ld [rSVBK], a
	ret

BattleAnimCmd_BeatUp: ; cc776 (33:4776)
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [CurPartySpecies] ; CurPartySpecies
	push af

	ld a, [wKickCounter]
	ld [CurPartySpecies], a ; CurPartySpecies

	ld a, [hBattleTurn]
	and a
	jr z, .player

	ld hl, BattleMonDVs ; BattleMonDVs
	predef GetUnownLetter
	ld de, VTiles2 tile $00
	predef GetFrontpic
	jr .done

.player
	ld hl, EnemyMonDVs ; EnemyMonDVs
	predef GetUnownLetter
	ld de, VTiles2 tile $31
	predef GetBackpic

.done
	pop af
	ld [CurPartySpecies], a ; CurPartySpecies
	ld b, SCGB_01
	call GetSGBLayout
	pop af
	ld [rSVBK], a
	ret

BattleAnimCmd_OAMOn: ; cc7bb (33:47bb)
	xor a
	ld [hOAMUpdate], a
	ret

BattleAnimCmd_OAMOff: ; cc7bf (33:47bf)
	ld a, $1
	ld [hOAMUpdate], a
	ret

BattleAnimCmd_ClearSprites: ; cc7c4 (33:47c4)
	ld hl, BattleAnimFlags
	set 3, [hl]
	ret

BattleAnimCmd_F5: ; cc7ca (33:47ca)
	ret

BattleAnimCmd_F6: ; cc7cb (33:47cb)
	ret

BattleAnimCmd_F7: ; cc7cc (33:47cc)
	ret

BattleAnimCmd_Sound: ; cc7cd (33:47cd)
	call GetBattleAnimByte
	ld e, a
	srl a
	srl a
	ld [wc2be], a
	call Functioncc7fc
	and 3
	ld [CryTracks], a ; CryTracks

	ld e, a
	ld d, 0
	ld hl, Datacc7f8
	add hl, de
	ld a, [hl]
	ld [wc2bc], a

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
	ld a, [hBattleTurn]
	and a
	jr nz, .enemy

	ld a, e
	ret

.enemy
	ld a, e
	xor 1
	ret

BattleAnimCmd_Cry: ; cc807 (33:4807)
	call GetBattleAnimByte
	and 3
	ld e, a
	ld d, 0
	ld hl, Datacc871
rept 4
	add hl, de
endr

	ld a, [rSVBK]
	push af
	ld a, 1
	ld [rSVBK], a

	ld a, [hBattleTurn]
	and a
	jr nz, .enemy

	ld a, $f0
	ld [CryTracks], a ; CryTracks
	ld a, [BattleMonSpecies] ; BattleMonSpecies
	jr .asm_cc834

.enemy
	ld a, $0f
	ld [CryTracks], a ; CryTracks
	ld a, [EnemyMonSpecies] ; EnemyMon

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
	ld hl, CryLength ; CryLength
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc

	ld a, l
	ld [CryLength], a ; CryLength
	ld a, h
	ld [CryLength + 1], a
	ld a, 1
	ld [wc2bc], a

	callab _PlayCryHeader

.done
	pop af
	ld [rSVBK], a
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
	ld a, [wcfca]
	cp $1
	jr z, .okay
	cp $4
	ret nz

.okay
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
	jr nz, .cgb
	ld a, [hSGB]
	and a
	ld a, %11100000
	jr z, .sgb
	ld a, %11110000

.sgb
	ld [wcfc8], a
	ld a, %11100100
	ld [wcfc7], a
	ld [wcfc9], a
	ret

.cgb
	ld a, %11100100
	ld [wcfc7], a
	ld [wcfc8], a
	ld [wcfc9], a
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	ret
; cc8d3

Functioncc8d3: ; cc8d3
; Clear animation block
	ld hl, LYOverrides
	ld bc, wBattleAnimEnd - LYOverrides
.loop
	ld [hl], $0
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop

	ld hl, FXAnimIDLo
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, BattleAnimations
rept 2
	add hl, de
endr
	call GetBattleAnimPointer
	call BattleAnimAssignPals
	call BattleAnimDelayFrame
	ret
; cc8f6

Functioncc8f6: ; cc8f6
	call WaitTop
	ld a, %11100100
	ld [wcfc7], a
	ld [wcfc8], a
	ld [wcfc9], a
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
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
	ld hl, BGPals
	ld de, UnknBGPals
	ld a, [rBGP]
	ld b, a
	ld c, $7
	call CopyPals
	ld hl, OBPals
	ld de, UnknOBPals
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
	ld hl, OBPals + $10
	ld de, UnknOBPals + $10
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
	ld [w5_d418], a
	ld hl, ActiveAnimObjects
	ld e, 10
.loop
	ld a, [hl]
	and a
	jr z, .next
	ld c, l
	ld b, h
	push hl
	push de
	call Functionccfbe
	call Functioncca09
	pop de
	pop hl
	jr c, .done

.next
	ld bc, $0018
	add hl, bc
	dec e
	jr nz, .loop
	ld a, [w5_d418]
	ld l, a
	ld h, Sprites / $100
.loop2
	ld a, l
	cp SpritesEnd % $100
	jr nc, .done
	xor a
	ld [hli], a
	jr .loop2

.done
	ret
; cc9a1
