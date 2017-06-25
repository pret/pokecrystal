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
	ld a, [wNumHits]
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
	call PlayHitSound
	call RunBattleAnimScript

.done
	call BattleAnim_RevertPals
	ret
; cc163

RunBattleAnimScript: ; cc163

	call ClearBattleAnims

.playframe
	call RunBattleAnimCommand
	call _ExecuteBGEffects
	call BattleAnim_UpdateOAM_All
	call PushLYOverrides
	call BattleAnimRequestPals

; Speed up Rollout's animation.
	ld a, [FXAnimIDHi]
	or a
	jr nz, .not_rollout

	ld a, [FXAnimIDLo]
	cp ROLLOUT
	jr nz, .not_rollout

	ld a, $2e
	ld b, 5
	ld de, 4
	ld hl, ActiveBGEffects
.find
	cp [hl]
	jr z, .done
	add hl, de
	dec b
	jr nz, .find

.not_rollout
	call BattleAnimDelayFrame

.done
	ld a, [BattleAnimFlags]
	bit 0, a
	jr z, .playframe

	call BattleAnim_ClearCGB_OAMFlags
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
	ld a, [wBGP]
	cp b
	call nz, BattleAnim_SetBGPals

	ld a, [rOBP0]
	ld b, a
	ld a, [wOBP0]
	cp b
	call nz, BattleAnim_SetOBPals
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
	call WaitBGMap2
	ld a, $60
	ld [hWY], a
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	call BattleAnimDelayFrame
	ret
; cc23d


BattleAnim_ClearCGB_OAMFlags: ; cc23d

	ld a, [BattleAnimFlags]
	bit 3, a
	jr z, .delete

	ld hl, Sprites + 3
	ld c, (SpritesEnd - Sprites) / 4
.loop
	ld a, [hl]
	and $f0
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret

.delete
	ld hl, Sprites
	ld c, SpritesEnd - Sprites
	xor a
.loop2
	ld [hli], a
	dec c
	jr nz, .loop2
	ret
; cc25f

RunBattleAnimCommand: ; cc25f
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
	add hl, de
	add hl, de

	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
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
	dw BattleAnimCmd_IfParamAnd
	dw BattleAnimCmd_JumpUntil
	dw BattleAnimCmd_BGEffect
	dw BattleAnimCmd_BGP
	dw BattleAnimCmd_OBP0
	dw BattleAnimCmd_OBP1
	dw BattleAnimCmd_ClearSprites
	dw BattleAnimCmd_F5
	dw BattleAnimCmd_F6
	dw BattleAnimCmd_F7
	dw BattleAnimCmd_IfParamEqual
	dw BattleAnimCmd_SetVar
	dw BattleAnimCmd_IncVar
	dw BattleAnimCmd_IfVarEqual
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
	jr nz, .continue_loop
	and a
	jr z, .perpetual
	dec a
	set 2, [hl]
	ld [BattleAnimLoops], a
.continue_loop
	ld hl, BattleAnimLoops
	ld a, [hl]
	and a
	jr z, .return_from_loop
	dec [hl]
.perpetual
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.return_from_loop
	ld hl, BattleAnimFlags
	res 2, [hl]
	ld hl, BattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret

BattleAnimCmd_JumpUntil: ; cc383 (33:4383)
	ld hl, wBattleAnimParam
	ld a, [hl]
	and a
	jr z, .dont_jump

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

.dont_jump
	ld hl, BattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
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

BattleAnimCmd_IfVarEqual: ; cc3b2 (33:43b2)
	call GetBattleAnimByte
	ld hl, BattleAnimVar
	cp [hl]
	jr z, .jump

	ld hl, BattleAnimAddress
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
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_IfParamEqual: ; cc3d6 (33:43d6)
	call GetBattleAnimByte
	ld hl, wBattleAnimParam
	cp [hl]
	jr z, .jump

	ld hl, BattleAnimAddress
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
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_IfParamAnd: ; cc3fa (33:43fa)
	call GetBattleAnimByte
	ld e, a
	ld a, [wBattleAnimParam]
	and e
	jr nz, .jump

	ld hl, BattleAnimAddress
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
	ld hl, BattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_Obj: ; cc41f (33:441f)
; index, x, y, param
	call GetBattleAnimByte
	ld [wBattleAnimTemp0], a
	call GetBattleAnimByte
	ld [wBattleAnimTemp1], a
	call GetBattleAnimByte
	ld [wBattleAnimTemp2], a
	call GetBattleAnimByte
	ld [wBattleAnimTemp3], a
	call QueueBattleAnimation
	ret

BattleAnimCmd_BGEffect: ; cc43b (33:443b)
	call GetBattleAnimByte
	ld [wBattleAnimTemp0], a
	call GetBattleAnimByte
	ld [wBattleAnimTemp1], a
	call GetBattleAnimByte
	ld [wBattleAnimTemp2], a
	call GetBattleAnimByte
	ld [wBattleAnimTemp3], a
	call _QueueBGEffect
	ret

BattleAnimCmd_BGP: ; cc457 (33:4457)
	call GetBattleAnimByte
	ld [wBGP], a
	ret

BattleAnimCmd_OBP0: ; cc45e (33:445e)
	call GetBattleAnimByte
	ld [wOBP0], a
	ret

BattleAnimCmd_OBP1: ; cc465 (33:4465)
	call GetBattleAnimByte
	ld [wOBP1], a
	ret

BattleAnimCmd_ResetObp0: ; cc46c (33:446c)
	ld a, [hSGB]
	and a
	ld a, $e0
	jr z, .not_sgb
	ld a, $f0
.not_sgb
	ld [wOBP0], a
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
	ld hl, wBattleAnimTileDict
	xor a
	ld [wBattleAnimTemp0], a
.loop
	ld a, [wBattleAnimTemp0]
	cp (VTiles1 - VTiles0) / $10 - $31
	ret nc
	call GetBattleAnimByte
	ld [hli], a
	ld a, [wBattleAnimTemp0]
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
	call LoadBattleAnimObj
	ld a, [wBattleAnimTemp0]
	add c
	ld [wBattleAnimTemp0], a
	pop hl
	pop bc
	dec c
	jr nz, .loop
	ret

BattleAnimCmd_IncObj: ; cc4c0 (33:44c0)
	call GetBattleAnimByte
	ld e, 10
	ld bc, ActiveAnimObjects
.loop
	ld hl, BATTLEANIMSTRUCT_INDEX
	add hl, bc
	ld d, [hl]
	ld a, [BattleAnimByte]
	cp d
	jr z, .found
	ld hl, BATTLEANIMSTRUCT_LENGTH
	add hl, bc
	ld c, l
	ld b, h
	dec e
	jr nz, .loop
	ret

.found
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	inc [hl]
	ret

BattleAnimCmd_IncBGEffect: ; cc4e3 (33:44e3)
	call GetBattleAnimByte
	ld e, 5
	ld bc, ActiveBGEffects
.loop
	ld hl, $0
	add hl, bc
	ld d, [hl]
	ld a, [BattleAnimByte]
	cp d
	jr z, .found
	ld hl, 4
	add hl, bc
	ld c, l
	ld b, h
	dec e
	jr nz, .loop
	ret

.found
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	inc [hl]
	ret

BattleAnimCmd_SetObj: ; cc506 (33:4506)
	call GetBattleAnimByte
	ld e, 10
	ld bc, ActiveAnimObjects
.loop
	ld hl, BATTLEANIMSTRUCT_INDEX
	add hl, bc
	ld d, [hl]
	ld a, [BattleAnimByte]
	cp d
	jr z, .found
	ld hl, BATTLEANIMSTRUCT_LENGTH
	add hl, bc
	ld c, l
	ld b, h
	dec e
	jr nz, .loop
	ret

.found
	call GetBattleAnimByte
	ld hl, BATTLEANIMSTRUCT_ANON_JT_INDEX
	add hl, bc
	ld [hl], a
	ret

BattleAnimCmd_EnemyFeetObj: ; cc52c (33:452c)

	ld hl, wBattleAnimTileDict
.loop
	ld a, [hl]
	and a
	jr z, .okay
	inc hl
	inc hl
	jr .loop

.okay
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
	ld [wBattleAnimTemp0], a
	ld a, $7
	call .LoadFootprint
	ld de, VTiles2 tile $31
	ld a, $60
	ld [wBattleAnimTemp0], a
	ld a, $6
	call .LoadFootprint
	ret

.LoadFootprint: ; cc561 (33:4561)
	push af
	push hl
	push de
	lb bc, BANK(BattleAnimCmd_EnemyFeetObj), 1
	call Request2bpp
	pop de
	ld a, [wBattleAnimTemp0]
	ld l, a
	ld h, 0
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld bc, 1 tiles
	add hl, bc
	pop af
	dec a
	jr nz, .LoadFootprint
	ret

BattleAnimCmd_PlayerHeadObj: ; cc57e (33:457e)

	ld hl, wBattleAnimTileDict
.loop
	ld a, [hl]
	and a
	jr z, .okay
	inc hl
	inc hl
	jr .loop

.okay
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
	ld [wBattleAnimTemp0], a
	ld a, $7
	call .LoadHead
	ld de, VTiles2 tile $31
	ld a, $60
	ld [wBattleAnimTemp0], a
	ld a, $6
	call .LoadHead
	ret

.LoadHead: ; cc5b3 (33:45b3)
	push af
	push hl
	push de
	lb bc, BANK(BattleAnimCmd_EnemyFeetObj), 2
	call Request2bpp
	pop de
	ld a, [wBattleAnimTemp0]
	ld l, a
	ld h, 0
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld bc, 2 tiles
	add hl, bc
	pop af
	dec a
	jr nz, .LoadHead
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
	ld bc, (7 * 7) tiles
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

	ld hl, MonsterSpriteGFX + 0 tiles
	ld de, sScratch + (2 * 7 + 5) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 1 tiles
	ld de, sScratch + (3 * 7 + 5) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 2 tiles
	ld de, sScratch + (2 * 7 + 6) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 3 tiles
	ld de, sScratch + (3 * 7 + 6) tiles
	call .CopyTile

	ld hl, VTiles2 tile $00
	ld de, sScratch
	lb bc, BANK(GetSubstitutePic), 7 * 7
	call Request2bpp
	jr .done

.player
	ld hl, MonsterSpriteGFX + 4 tiles
	ld de, sScratch + (2 * 6 + 4) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 5 tiles
	ld de, sScratch + (3 * 6 + 4) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 6 tiles
	ld de, sScratch + (2 * 6 + 5) tiles
	call .CopyTile
	ld hl, MonsterSpriteGFX + 7 tiles
	ld de, sScratch + (3 * 6 + 5) tiles
	call .CopyTile

	ld hl, VTiles2 tile $31
	ld de, sScratch
	lb bc, BANK(GetSubstitutePic), 6 * 6
	call Request2bpp

.done
	call CloseSRAM
	pop af
	ld [rSVBK], a
	ret

.CopyTile: ; cc6c6 (33:46c6)
	ld bc, 1 tiles
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
	ld bc, $31 tiles
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

	ld de, sScratch + $1a tiles
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

	callab DropEnemySub
	jr .done

.player
	callab DropPlayerSub

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

	ld a, [wBattleAnimParam]
	ld [CurPartySpecies], a ; CurPartySpecies

	ld a, [hBattleTurn]
	and a
	jr z, .player

	ld hl, BattleMonDVs
	predef GetUnownLetter
	ld de, VTiles2 tile $00
	predef GetFrontpic
	jr .done

.player
	ld hl, EnemyMonDVs
	predef GetUnownLetter
	ld de, VTiles2 tile $31
	predef GetBackpic

.done
	pop af
	ld [CurPartySpecies], a ; CurPartySpecies
	ld b, SCGB_BATTLE_COLORS
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
	ld [wSFXDuration], a
	call .GetCryTrack
	and 3
	ld [CryTracks], a ; CryTracks

	ld e, a
	ld d, 0
	ld hl, .GetPanning
	add hl, de
	ld a, [hl]
	ld [wStereoPanningMask], a

	call GetBattleAnimByte
	ld e, a
	ld d, 0
	callab PlayStereoSFX

	ret
; cc7f8 (33:47f8)

.GetPanning: ; cc7f8
	db $f0, $0f, $f0, $0f
; cc7fc

.GetCryTrack: ; cc7fc (33:47fc)
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
	ld hl, .CryData
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
	jr .done_cry_tracks

.enemy
	ld a, $0f
	ld [CryTracks], a ; CryTracks
	ld a, [EnemyMonSpecies] ; EnemyMon

.done_cry_tracks
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
	ld [wStereoPanningMask], a

	callab _PlayCryHeader

.done
	pop af
	ld [rSVBK], a
	ret
; cc871 (33:4871)

.CryData: ; cc871
; +pitch, +length
	dw $0000, $00c0
	dw $0000, $0040
	dw $0000, $0000
	dw $0000, $0000
; cc881


PlayHitSound: ; cc881
	ld a, [wNumHits]
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
	ld [wOBP0], a
	ld a, %11100100
	ld [wBGP], a
	ld [wOBP1], a
	ret

.cgb
	ld a, %11100100
	ld [wBGP], a
	ld [wOBP0], a
	ld [wOBP1], a
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	ret
; cc8d3

ClearBattleAnims: ; cc8d3
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
	add hl, de
	add hl, de
	call GetBattleAnimPointer
	call BattleAnimAssignPals
	call BattleAnimDelayFrame
	ret
; cc8f6

BattleAnim_RevertPals: ; cc8f6
	call WaitTop
	ld a, %11100100
	ld [wBGP], a
	ld [wOBP0], a
	ld [wOBP1], a
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

BattleAnim_SetBGPals: ; cc91a
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

BattleAnim_SetOBPals: ; cc94b
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

BattleAnim_UpdateOAM_All: ; cc96e
	ld a, $0
	ld [wBattleAnimOAMPointerLo], a
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
	call DoBattleAnimFrame
	call BattleAnimOAMUpdate
	pop de
	pop hl
	jr c, .done

.next
	ld bc, BATTLEANIMSTRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop
	ld a, [wBattleAnimOAMPointerLo]
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
