; Battle animation command interpreter.

PlayBattleAnim:
	ldh a, [rSVBK]
	push af

	ld a, BANK(wActiveAnimObjects)
	ldh [rSVBK], a

	call _PlayBattleAnim

	pop af
	ldh [rSVBK], a
	ret

_PlayBattleAnim:
	ld c, 6
.wait
	call BattleAnimDelayFrame
	dec c
	jr nz, .wait

	call BattleAnimAssignPals
	call BattleAnimRequestPals
	call BattleAnimDelayFrame

	ld c, 1
	ldh a, [rKEY1]
	bit 7, a ; check CGB double speed mode
	jr nz, .got_speed
	ld c, 3

.got_speed
	ld hl, hVBlank
	ld a, [hl]
	push af

	ld [hl], c
	call BattleAnimRunScript

	pop af
	ldh [hVBlank], a

	ld a, 1
	ldh [hBGMapMode], a

	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call WaitSFX
	ret

BattleAnimRunScript:
	ld a, [wFXAnimID + 1]
	and a
	jr nz, .hi_byte

	farcall CheckBattleScene
	jr c, .disabled

; This vc_hook reduces the move animation flashing in the Virtual Console for
; Fissure, Self-Destruct, Thunder, Flash, Explosion, Horn Drill, and Hyper Beam.
	vc_hook Reduce_move_anim_flashing
	call BattleAnimClearHud
	call RunBattleAnimScript

	call BattleAnimAssignPals
	call BattleAnimRequestPals

	vc_hook Stop_reducing_move_anim_flashing
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
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
	ld [wFXAnimID], a
	ld a, h
	ld [wFXAnimID + 1], a

.hi_byte
	call WaitSFX
	call PlayHitSound
	call RunBattleAnimScript

.done
	call BattleAnim_RevertPals
	ret

RunBattleAnimScript:
	call ClearBattleAnims

.playframe
	call RunBattleAnimCommand
	call _ExecuteBGEffects
	call BattleAnim_UpdateOAM_All
	call PushLYOverrides
	call BattleAnimRequestPals

; Speed up Rollout's animation.
	ld a, [wFXAnimID + 1]
	or a
	jr nz, .not_rollout

	ld a, [wFXAnimID]
	cp ROLLOUT
	jr nz, .not_rollout

	ld a, ANIM_BG_ROLLOUT
	ld b, NUM_BG_EFFECTS
	ld de, BG_EFFECT_STRUCT_LENGTH
	ld hl, wBGEffect1Function
.find
	cp [hl]
	jr z, .done
	add hl, de
	dec b
	jr nz, .find

.not_rollout
	call BattleAnimDelayFrame

.done
	ld a, [wBattleAnimFlags]
	bit BATTLEANIM_STOP_F, a
	jr z, .playframe

	call BattleAnim_ClearOAM
	ret

BattleAnimClearHud:
	call BattleAnimDelayFrame
	call WaitTop
	call ClearActorHud
	ld a, $1
	ldh [hBGMapMode], a
	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call WaitTop
	ret

BattleAnimRestoreHuds:
	call BattleAnimDelayFrame
	call WaitTop

	ldh a, [rSVBK]
	push af
	ld a, BANK(wCurBattleMon) ; aka BANK(wTempMon), BANK(wPartyMon1), and several others
	ldh [rSVBK], a

; this block should just be "call UpdateBattleHuds"
	ld hl, UpdateBattleHuds
	ld a, BANK(UpdatePlayerHUD)
	rst FarCall

	pop af
	ldh [rSVBK], a

	ld a, $1
	ldh [hBGMapMode], a
	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call BattleAnimDelayFrame
	call WaitTop
	ret

BattleAnimRequestPals:
	ldh a, [hCGB]
	and a
	ret z

	ldh a, [rBGP]
	ld b, a
	ld a, [wBGP]
	cp b
	call nz, BattleAnim_SetBGPals

	ldh a, [rOBP0]
	ld b, a
	ld a, [wOBP0]
	cp b
	call nz, BattleAnim_SetOBPals
	ret

BattleAnimDelayFrame:
; Like DelayFrame but wastes battery life.

	ld a, 1
	ld [wVBlankOccurred], a
.wait
	ld a, [wVBlankOccurred]
	and a
	jr nz, .wait
	ret

ClearActorHud:
	ldh a, [hBattleTurn]
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

PlaceWindowOverBattleTextbox: ; unreferenced
	xor a
	ldh [hBGMapMode], a
	; bgcoord hBGMapAddress, 0, 20
	ld a, LOW(vBGMap0 + 20 * BG_MAP_WIDTH)
	ldh [hBGMapAddress], a
	ld a, HIGH(vBGMap0 + 20 * BG_MAP_WIDTH)
	ldh [hBGMapAddress + 1], a
	call WaitBGMap2
	ld a, (SCREEN_HEIGHT - TEXTBOX_HEIGHT) * TILE_WIDTH
	ldh [hWY], a
	; bgcoord hBGMapAddress, 0, 0
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	call BattleAnimDelayFrame
	ret

BattleAnim_ClearOAM:
	ld a, [wBattleAnimFlags]
	bit BATTLEANIM_KEEPSPRITES_F, a
	jr z, .delete

	; Instead of deleting the sprites, make them all use PAL_BATTLE_OB_ENEMY
	ld hl, wShadowOAMSprite00Attributes
	ld c, NUM_SPRITE_OAM_STRUCTS
.loop
	ld a, [hl]
	and ~(PALETTE_MASK | VRAM_BANK_1) ; zeros out the palette bits
	assert PAL_BATTLE_OB_ENEMY == 0
	ld [hli], a
rept SPRITEOAMSTRUCT_LENGTH - 1
	inc hl
endr
	dec c
	jr nz, .loop
	ret

.delete
	ld hl, wShadowOAM
	ld c, wShadowOAMEnd - wShadowOAM
	xor a
.loop2
	ld [hli], a
	dec c
	jr nz, .loop2
	ret

RunBattleAnimCommand:
	call .CheckTimer
	ret nc
	call .RunScript
	ret

.CheckTimer:
	ld a, [wBattleAnimDelay]
	and a
	jr z, .done

	dec a
	ld [wBattleAnimDelay], a
	and a
	ret

.done
	scf
	ret

.RunScript:
.loop
	call GetBattleAnimByte

	cp anim_ret_command
	jr nz, .not_done_with_anim

; Return from a subroutine.
	ld hl, wBattleAnimFlags
	bit BATTLEANIM_IN_SUBROUTINE_F, [hl]
	jr nz, .do_anim

	set BATTLEANIM_STOP_F, [hl]
	ret

.not_done_with_anim
	cp anim_obj_command
	jr nc, .do_anim

	ld [wBattleAnimDelay], a
	ret

.do_anim
	call .DoCommand

	jr .loop

.DoCommand:
; Execute battle animation command in [wBattleAnimByte].
	ld a, [wBattleAnimByte]
	sub anim_obj_command

	ld e, a
	ld d, 0
	ld hl, BattleAnimCommands
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

BattleAnimCommands::
; entries correspond to anim_* constants (see macros/scripts/battle_anims.asm)
	table_width 2, BattleAnimCommands
	dw BattleAnimCmd_Obj
	dw BattleAnimCmd_1GFX
	dw BattleAnimCmd_2GFX
	dw BattleAnimCmd_3GFX
	dw BattleAnimCmd_4GFX
	dw BattleAnimCmd_5GFX
	dw BattleAnimCmd_IncObj
	dw BattleAnimCmd_SetObj
	dw BattleAnimCmd_IncBGEffect
	dw BattleAnimCmd_BattlerGFX_1Row
	dw BattleAnimCmd_BattlerGFX_2Row
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
	dw BattleAnimCmd_KeepSprites
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
	assert_table_length $100 - FIRST_BATTLE_ANIM_CMD

BattleAnimCmd_EA:
BattleAnimCmd_EB:
BattleAnimCmd_EC:
BattleAnimCmd_ED:
	ret

BattleAnimCmd_Ret:
	ld hl, wBattleAnimFlags
	res BATTLEANIM_IN_SUBROUTINE_F, [hl]
	ld hl, wBattleAnimParent
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wBattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_Call:
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	push de
	ld hl, wBattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wBattleAnimParent
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	ld hl, wBattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wBattleAnimFlags
	set BATTLEANIM_IN_SUBROUTINE_F, [hl]
	ret

BattleAnimCmd_Jump:
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, wBattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_Loop:
	call GetBattleAnimByte
	ld hl, wBattleAnimFlags
	bit BATTLEANIM_IN_LOOP_F, [hl]
	jr nz, .continue_loop
	and a
	jr z, .perpetual
	dec a
	set BATTLEANIM_IN_LOOP_F, [hl]
	ld [wBattleAnimLoops], a
.continue_loop
	ld hl, wBattleAnimLoops
	ld a, [hl]
	and a
	jr z, .return_from_loop
	dec [hl]
.perpetual
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, wBattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.return_from_loop
	ld hl, wBattleAnimFlags
	res BATTLEANIM_IN_LOOP_F, [hl]
	ld hl, wBattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret

BattleAnimCmd_JumpUntil:
	ld hl, wBattleAnimParam
	ld a, [hl]
	and a
	jr z, .dont_jump

	dec [hl]
	call GetBattleAnimByte
	ld e, a
	call GetBattleAnimByte
	ld d, a
	ld hl, wBattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.dont_jump
	ld hl, wBattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret

BattleAnimCmd_SetVar:
	call GetBattleAnimByte
	ld [wBattleAnimVar], a
	ret

BattleAnimCmd_IncVar:
	ld hl, wBattleAnimVar
	inc [hl]
	ret

BattleAnimCmd_IfVarEqual:
	call GetBattleAnimByte
	ld hl, wBattleAnimVar
	cp [hl]
	jr z, .jump

	ld hl, wBattleAnimAddress
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
	ld hl, wBattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_IfParamEqual:
	call GetBattleAnimByte
	ld hl, wBattleAnimParam
	cp [hl]
	jr z, .jump

	ld hl, wBattleAnimAddress
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
	ld hl, wBattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_IfParamAnd:
	call GetBattleAnimByte
	ld e, a
	ld a, [wBattleAnimParam]
	and e
	jr nz, .jump

	ld hl, wBattleAnimAddress
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
	ld hl, wBattleAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ret

BattleAnimCmd_Obj:
; index, x, y, param
	call GetBattleAnimByte
	ld [wBattleObjectTempID], a
	call GetBattleAnimByte
	ld [wBattleObjectTempXCoord], a
	call GetBattleAnimByte
	ld [wBattleObjectTempYCoord], a
	call GetBattleAnimByte
	ld [wBattleObjectTempParam], a
	call QueueBattleAnimation
	ret

BattleAnimCmd_BGEffect:
	call GetBattleAnimByte
	ld [wBattleBGEffectTempID], a
	call GetBattleAnimByte
	ld [wBattleBGEffectTempJumptableIndex], a
	call GetBattleAnimByte
	ld [wBattleBGEffectTempTurn], a
	call GetBattleAnimByte
	ld [wBattleBGEffectTempParam], a
	call _QueueBGEffect
	ret

BattleAnimCmd_BGP:
	call GetBattleAnimByte
	ld [wBGP], a
	ret

BattleAnimCmd_OBP0:
	call GetBattleAnimByte
	ld [wOBP0], a
	ret

BattleAnimCmd_OBP1:
	call GetBattleAnimByte
	ld [wOBP1], a
	ret

BattleAnimCmd_ResetObp0:
	ldh a, [hSGB]
	and a
	ld a, $e0
	jr z, .not_sgb
	ld a, $f0
.not_sgb
	ld [wOBP0], a
	ret

BattleAnimCmd_ClearObjs:
	ld hl, wActiveAnimObjects
	ld a, NUM_ANIM_OBJECTS * BATTLEANIMSTRUCT_LENGTH
.loop
	ld [hl], 0
	inc hl
	dec a
	jr nz, .loop
	ret

BattleAnimCmd_1GFX:
BattleAnimCmd_2GFX:
BattleAnimCmd_3GFX:
BattleAnimCmd_4GFX:
BattleAnimCmd_5GFX:
	ld a, [wBattleAnimByte]
	and $f
	ld c, a
	ld hl, wBattleAnimTileDict
	xor a
	ld [wBattleAnimGFXTempTileID], a
.loop
	ld a, [wBattleAnimGFXTempTileID]
	cp (vTiles1 - vTiles0) / LEN_2BPP_TILE - BATTLEANIM_BASE_TILE
	vc_hook Reduce_move_anim_flashing_PRESENT
	ret nc
	call GetBattleAnimByte
	ld [hli], a
	ld a, [wBattleAnimGFXTempTileID]
	ld [hli], a
	push bc
	push hl
	ld l, a
	ld h, 0
rept 4
	add hl, hl
endr
	ld de, vTiles0 tile BATTLEANIM_BASE_TILE
	add hl, de
	ld a, [wBattleAnimByte]
	call LoadBattleAnimGFX
	ld a, [wBattleAnimGFXTempTileID]
	add c
	ld [wBattleAnimGFXTempTileID], a
	pop hl
	pop bc
	dec c
	jr nz, .loop
	ret

BattleAnimCmd_IncObj:
	call GetBattleAnimByte
	ld e, NUM_ANIM_OBJECTS
	ld bc, wActiveAnimObjects
.loop
	ld hl, BATTLEANIMSTRUCT_INDEX
	add hl, bc
	ld d, [hl]
	ld a, [wBattleAnimByte]
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
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

BattleAnimCmd_IncBGEffect:
	call GetBattleAnimByte
	ld e, NUM_BG_EFFECTS
	ld bc, wBGEffect1Function
.loop
	ld hl, $0
	add hl, bc
	ld d, [hl]
	ld a, [wBattleAnimByte]
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

BattleAnimCmd_SetObj:
	call GetBattleAnimByte
	ld e, NUM_ANIM_OBJECTS
	ld bc, wActiveAnimObjects
.loop
	ld hl, BATTLEANIMSTRUCT_INDEX
	add hl, bc
	ld d, [hl]
	ld a, [wBattleAnimByte]
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
	ld hl, BATTLEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], a
	ret

BattleAnimCmd_BattlerGFX_1Row:
	ld hl, wBattleAnimTileDict
.loop
	ld a, [hl]
	and a
	jr z, .okay
	inc hl
	inc hl
	jr .loop

.okay
	ld a, ANIM_GFX_PLAYERHEAD
	ld [hli], a
	ld a, ($80 - 6 - 7) - BATTLEANIM_BASE_TILE
	ld [hli], a
	ld a, ANIM_GFX_ENEMYFEET
	ld [hli], a
	ld a, ($80 - 6) - BATTLEANIM_BASE_TILE
	ld [hl], a

	ld hl, vTiles0 tile ($80 - 6 - 7)
	ld de, vTiles2 tile $06 ; Enemy feet start tile
	ld a, 7 tiles ; Enemy pic height
	ld [wBattleAnimGFXTempPicHeight], a
	ld a, 7 ; Copy 7x1 tiles
	call .LoadFeet
	ld de, vTiles2 tile $31 ; Player head start tile
	ld a, 6 tiles ; Player pic height
	ld [wBattleAnimGFXTempPicHeight], a
	ld a, 6 ; Copy 6x1 tiles
	call .LoadFeet
	ret

.LoadFeet:
	push af
	push hl
	push de
	lb bc, BANK(@), 1
	call Request2bpp
	pop de
	ld a, [wBattleAnimGFXTempPicHeight]
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
	jr nz, .LoadFeet
	ret

BattleAnimCmd_BattlerGFX_2Row:
	ld hl, wBattleAnimTileDict
.loop
	ld a, [hl]
	and a
	jr z, .okay
	inc hl
	inc hl
	jr .loop

.okay
	ld a, ANIM_GFX_PLAYERHEAD
	ld [hli], a
	ld a, ($80 - 6 * 2 - 7 * 2) - BATTLEANIM_BASE_TILE
	ld [hli], a
	ld a, ANIM_GFX_ENEMYFEET
	ld [hli], a
	ld a, ($80 - 6 * 2) - BATTLEANIM_BASE_TILE
	ld [hl], a

	ld hl, vTiles0 tile ($80 - 6 * 2 - 7 * 2)
	ld de, vTiles2 tile $05 ; Enemy feet start tile
	ld a, 7 tiles ; Enemy pic height
	ld [wBattleAnimGFXTempPicHeight], a
	ld a, 7 ; Copy 7x2 tiles
	call .LoadHead
	ld de, vTiles2 tile $31 ; Player head start tile
	ld a, 6 tiles ; Player pic height
	ld [wBattleAnimGFXTempPicHeight], a
	ld a, 6 ; Copy 6x2 tiles
	call .LoadHead
	ret

.LoadHead:
	push af
	push hl
	push de
	lb bc, BANK(@), 2
	call Request2bpp
	pop de
	ld a, [wBattleAnimGFXTempPicHeight]
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

BattleAnimCmd_CheckPokeball:
	callfar GetPokeBallWobble
	ld a, c
	ld [wBattleAnimVar], a
	ret

BattleAnimCmd_E7:
	ret

BattleAnimCmd_Transform:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wCurPartySpecies)
	ldh [rSVBK], a

	ld a, [wCurPartySpecies]
	push af

	ldh a, [hBattleTurn]
	and a
	jr z, .player

	ld a, [wTempBattleMonSpecies]
	ld [wCurPartySpecies], a
	ld hl, wBattleMonDVs
	predef GetUnownLetter
	ld de, vTiles0 tile $00
	predef GetMonFrontpic
	jr .done

.player
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ld hl, wEnemyMonDVs
	predef GetUnownLetter
	ld de, vTiles0 tile $00
	predef GetMonBackpic

.done
	pop af
	ld [wCurPartySpecies], a

	pop af
	ldh [rSVBK], a
	ret

BattleAnimCmd_UpdateActorPic:
	ld de, vTiles0 tile $00
	ldh a, [hBattleTurn]
	and a
	jr z, .player

	ld hl, vTiles2 tile $00
	ld b, 0
	ld c, 7 * 7
	call Request2bpp
	ret

.player
	ld hl, vTiles2 tile $31
	ld b, 0
	ld c, 6 * 6
	call Request2bpp
	ret

BattleAnimCmd_RaiseSub:
	ldh a, [rSVBK]
	push af
	ld a, 1 ; unnecessary bankswitch?
	ldh [rSVBK], a

	xor a ; BANK(sScratch)
	call OpenSRAM

GetSubstitutePic: ; used only for BANK(GetSubstitutePic)
	ld hl, sScratch
	ld bc, (7 * 7) tiles
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop

	ldh a, [hBattleTurn]
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

	ld hl, vTiles2 tile $00
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

	ld hl, vTiles2 tile $31
	ld de, sScratch
	lb bc, BANK(GetSubstitutePic), 6 * 6
	call Request2bpp

.done
	call CloseSRAM

	pop af
	ldh [rSVBK], a
	ret

.CopyTile:
	ld bc, 1 tiles
	ld a, BANK(MonsterSpriteGFX)
	call FarCopyBytes
	ret

BattleAnimCmd_MinimizeOpp:
	ldh a, [rSVBK]
	push af
	ld a, 1 ; unnecessary bankswitch?
	ldh [rSVBK], a

	xor a ; BANK(sScratch)
	call OpenSRAM
	call GetMinimizePic
	call Request2bpp
	call CloseSRAM

	pop af
	ldh [rSVBK], a
	ret

GetMinimizePic:
	ld hl, sScratch
	ld bc, (7 * 7) tiles
.loop
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop

	ldh a, [hBattleTurn]
	and a
	jr z, .player

	ld de, sScratch + (3 * 7 + 5) tiles
	call CopyMinimizePic
	ld hl, vTiles2 tile $00
	ld de, sScratch
	lb bc, BANK(GetMinimizePic), 7 * 7
	ret

.player
	ld de, sScratch + (3 * 6 + 4) tiles
	call CopyMinimizePic
	ld hl, vTiles2 tile $31
	ld de, sScratch
	lb bc, BANK(GetMinimizePic), 6 * 6
	ret

CopyMinimizePic:
	ld hl, MinimizePic
	ld bc, $10
	ld a, BANK(MinimizePic)
	call FarCopyBytes
	ret

MinimizePic:
INCBIN "gfx/battle/minimize.2bpp"

BattleAnimCmd_Minimize:
	ldh a, [rSVBK]
	push af
	ld a, 1 ; unnecessary bankswitch?
	ldh [rSVBK], a

	xor a ; BANK(sScratch)
	call OpenSRAM
	call GetMinimizePic
	ld hl, vTiles0 tile $00
	call Request2bpp
	call CloseSRAM

	pop af
	ldh [rSVBK], a
	ret

BattleAnimCmd_DropSub:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wCurPartySpecies)
	ldh [rSVBK], a

	ld a, [wCurPartySpecies]
	push af
	ldh a, [hBattleTurn]
	and a
	jr z, .player

	callfar DropEnemySub
	jr .done

.player
	callfar DropPlayerSub

.done
	pop af
	ld [wCurPartySpecies], a

	pop af
	ldh [rSVBK], a
	ret

BattleAnimCmd_BeatUp:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wCurPartySpecies)
	ldh [rSVBK], a

	ld a, [wCurPartySpecies]
	push af

	ld a, [wBattleAnimParam]
	ld [wCurPartySpecies], a

	ldh a, [hBattleTurn]
	and a
	jr z, .player

	ld hl, wBattleMonDVs
	predef GetUnownLetter
	ld de, vTiles2 tile $00
	predef GetMonFrontpic
	jr .done

.player
	ld hl, wEnemyMonDVs
	predef GetUnownLetter
	ld de, vTiles2 tile $31
	predef GetMonBackpic

.done
	pop af
	ld [wCurPartySpecies], a
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout

	pop af
	ldh [rSVBK], a
	ret

BattleAnimCmd_OAMOn:
	xor a
	ldh [hOAMUpdate], a
	ret

BattleAnimCmd_OAMOff:
	ld a, $1
	ldh [hOAMUpdate], a
	ret

BattleAnimCmd_KeepSprites:
	ld hl, wBattleAnimFlags
	set BATTLEANIM_KEEPSPRITES_F, [hl]
	ret

BattleAnimCmd_F5:
	ret

BattleAnimCmd_F6:
	ret

BattleAnimCmd_F7:
	ret

BattleAnimCmd_Sound:
	call GetBattleAnimByte
	ld e, a
	srl a
	srl a
	ld [wSFXDuration], a
	call .GetCryTrack
	maskbits NUM_NOISE_CHANS
	ld [wCryTracks], a

	ld e, a
	ld d, 0
	ld hl, .GetPanning
	add hl, de
	ld a, [hl]
	ld [wStereoPanningMask], a

	call GetBattleAnimByte
	ld e, a
	ld d, 0
	callfar PlayStereoSFX

	ret

.GetPanning:
	db $f0, $0f, $f0, $0f

.GetCryTrack:
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

	ld a, e
	ret

.enemy
	ld a, e
	xor 1
	ret

BattleAnimCmd_Cry:
	call GetBattleAnimByte
	maskbits NUM_NOISE_CHANS
	ld e, a
	ld d, 0
	ld hl, .CryData
rept 4
	add hl, de
endr

	ldh a, [rSVBK]
	push af
	ld a, BANK(wEnemyMon) ; wBattleMon is in WRAM0, but wEnemyMon is in WRAMX
	ldh [rSVBK], a

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

	ld a, $f0
	ld [wCryTracks], a
	ld a, [wBattleMonSpecies]
	jr .done_cry_tracks

.enemy
	ld a, $0f
	ld [wCryTracks], a
	ld a, [wEnemyMonSpecies]

.done_cry_tracks
	push hl
	call LoadCry
	pop hl
	jr c, .done

	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a

	push hl
	ld hl, wCryPitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, l
	ld [wCryPitch], a
	ld a, h
	ld [wCryPitch + 1], a
	pop hl

	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld hl, wCryLength
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc

	ld a, l
	ld [wCryLength], a
	ld a, h
	ld [wCryLength + 1], a
	ld a, 1
	ld [wStereoPanningMask], a

	callfar _PlayCry

.done
	pop af
	ldh [rSVBK], a
	ret

.CryData:
; +pitch, +length
	dw $0000, $00c0
	dw $0000, $0040
	dw $0000, $0000
	dw $0000, $0000

PlayHitSound:
	ld a, [wNumHits]
	cp BATTLEANIM_ENEMY_DAMAGE
	jr z, .okay
	cp BATTLEANIM_PLAYER_DAMAGE
	ret nz

.okay
	ld a, [wTypeModifier]
	and $7f
	ret z

	cp EFFECTIVE
	ld de, SFX_DAMAGE
	jr z, .play

	ld de, SFX_SUPER_EFFECTIVE
	jr nc, .play

	ld de, SFX_NOT_VERY_EFFECTIVE

.play
	call PlaySFX
	ret

BattleAnimAssignPals:
	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ldh a, [hSGB]
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

ClearBattleAnims::
; Clear animation block
	ld hl, wLYOverrides
	ld bc, wBattleAnimEnd - wLYOverrides
.loop
	ld [hl], 0
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop

	ld hl, wFXAnimID
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

BattleAnim_RevertPals:
	call WaitTop
	ld a, %11100100
	ld [wBGP], a
	ld [wOBP0], a
	ld [wOBP1], a
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	call BattleAnimDelayFrame
	ld a, $1
	ldh [hBGMapMode], a
	ret

BattleAnim_SetBGPals:
	ldh [rBGP], a
	ldh a, [hCGB]
	and a
	ret z
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld hl, wBGPals2
	ld de, wBGPals1
	ldh a, [rBGP]
	ld b, a
	ld c, 7
	call CopyPals
	ld hl, wOBPals2
	ld de, wOBPals1
	ldh a, [rBGP]
	ld b, a
	ld c, 2
	call CopyPals
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

BattleAnim_SetOBPals:
	ldh [rOBP0], a
	ldh a, [hCGB]
	and a
	ret z
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld hl, wOBPals2 palette PAL_BATTLE_OB_GRAY
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ldh a, [rOBP0]
	ld b, a
	ld c, 2
	call CopyPals
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

BattleAnim_UpdateOAM_All:
	ld a, 0
	ld [wBattleAnimOAMPointerLo], a
	ld hl, wActiveAnimObjects
	ld e, NUM_ANIM_OBJECTS
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
	ld h, HIGH(wShadowOAM)
.loop2
	ld a, l
	cp LOW(wShadowOAMEnd)
	jr nc, .done
	xor a
	ld [hli], a
	jr .loop2

.done
	ret
