SECTION "engine/battle_anims/core.asm", ROMX

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
	ldh [hVBlank], a

	ld a, $1
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

	call BattleAnimClearHud
	call RunBattleAnimScript

	call BattleAnimAssignPals
	call BattleAnimRequestPals

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

	ld a, ANIM_BG_2E
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
	ld a, BANK(wCurBattleMon) ; aka BANK(wTempMon) and BANK(wPartyMon1) and several others
	ldh [rSVBK], a

	ld hl, UpdateBattleHuds
	ld a, BANK(UpdatePlayerHUD)
	rst FarCall ; Why not "call UpdateBattleHuds"?

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

Unreferenced_Functioncc220:
	xor a
	ldh [hBGMapMode], a
	ld a, LOW(vBGMap0 tile $28)
	ldh [hBGMapAddress], a
	ld a, HIGH(vBGMap0 tile $28)
	ldh [hBGMapAddress + 1], a
	call WaitBGMap2
	ld a, $60
	ldh [hWY], a
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

	; Instead of deleting the sprites, make them all use palette 0 (monochrome)
	ld hl, wVirtualOAMSprite00Attributes
	ld c, NUM_SPRITE_OAM_STRUCTS
.loop
	ld a, [hl]
	and $ff ^ (PALETTE_MASK | VRAM_BANK_1)
	ld [hli], a
rept SPRITEOAMSTRUCT_LENGTH + -1
	inc hl
endr
	dec c
	jr nz, .loop
	ret

.delete
	ld hl, wVirtualOAM
	ld c, wVirtualOAMEnd - wVirtualOAM
	xor a
.loop2
	ld [hli], a
	dec c
	jr nz, .loop2
	ret

INCLUDE "engine/battle_anims/anim_commands.asm"

PlayHitSound:
	ld a, [wNumHits]
	cp $1
	jr z, .okay
	cp $4
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
	ld [hl], $0
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
	ld a, $1
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
	ld a, $1
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
	ld h, HIGH(wVirtualOAM)
.loop2
	ld a, l
	cp LOW(wVirtualOAMEnd)
	jr nc, .done
	xor a
	ld [hli], a
	jr .loop2

.done
	ret

QueueBattleAnimation:
	ld hl, wActiveAnimObjects
	ld e, NUM_ANIM_OBJECTS
.loop
	ld a, [hl]
	and a
	jr z, .done
	ld bc, BATTLEANIMSTRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .loop
	scf
	ret

.done
	ld c, l
	ld b, h
	ld hl, wLastAnimObjectIndex
	inc [hl]
	call InitBattleAnimation
	ret

DeinitBattleAnimation:
	ld hl, BATTLEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

InitBattleAnimation:
	ld a, [wBattleObjectTempID]
	ld e, a
	ld d, 0
	ld hl, BattleAnimObjects
rept 6
	add hl, de
endr
	ld e, l
	ld d, h
	ld hl, BATTLEANIMSTRUCT_INDEX
	add hl, bc
	ld a, [wLastAnimObjectIndex]
	ld [hli], a ; Index
	ld a, [de]
	inc de
	ld [hli], a ; 01
	ld a, [de]
	inc de
	ld [hli], a ; 02
	ld a, [de]
	inc de
	ld [hli], a ; Frameset ID
	ld a, [de]
	inc de
	ld [hli], a ; Function
	ld a, [de]
	inc de
	ld [hli], a ; 05
	ld a, [de]
	call GetBattleAnimTileOffset
	ld [hli], a ; Tile ID
	ld a, [wBattleObjectTempXCoord]
	ld [hli], a ; X Coord
	ld a, [wBattleObjectTempYCoord]
	ld [hli], a ; Y Coord
	xor a
	ld [hli], a ; X Offset
	ld [hli], a ; Y Offset
	ld a, [wBattleObjectTempParam]
	ld [hli], a ; Param
	xor a
	ld [hli], a ; 0c
	dec a
	ld [hli], a ; 0d
	xor a
	ld [hli], a ; 0e
	ld [hli], a ; 0f
	ld [hl], a  ; 10
	ret

BattleAnimOAMUpdate:
	call InitBattleAnimBuffer
	call GetBattleAnimFrame
	cp dowait_command
	jp z, .done
	cp delanim_command
	jp z, .delete

	push af
	ld hl, wBattleAnimTempOAMFlags
	ld a, [wBattleAnimTempFrameOAMFlags]
	xor [hl]
	and PRIORITY | Y_FLIP | X_FLIP
	ld [hl], a
	pop af

	push bc
	call GetBattleAnimOAMPointer
	ld a, [wBattleAnimTempTileID]
	add [hl] ; tile offset
	ld [wBattleAnimTempTileID], a
	inc hl
	ld a, [hli] ; oam data length
	ld c, a
	ld a, [hli] ; oam data pointer
	ld h, [hl]
	ld l, a
	ld a, [wBattleAnimOAMPointerLo]
	ld e, a
	ld d, HIGH(wVirtualOAM)

.loop
	; Y Coord
	ld a, [wBattleAnimTempYCoord]
	ld b, a
	ld a, [wBattleAnimTempYOffset]
	add b
	ld b, a
	push hl
	ld a, [hl]
	ld hl, wBattleAnimTempOAMFlags
	bit OAM_Y_FLIP, [hl]
	jr z, .no_yflip
	add $8
	xor $ff
	inc a
.no_yflip
	pop hl
	add b
	ld [de], a

	; X Coord
	inc hl
	inc de
	ld a, [wBattleAnimTempXCoord]
	ld b, a
	ld a, [wBattleAnimTempXOffset]
	add b
	ld b, a
	push hl
	ld a, [hl]
	ld hl, wBattleAnimTempOAMFlags
	bit OAM_X_FLIP, [hl]
	jr z, .no_xflip
	add $8
	xor $ff
	inc a
.no_xflip
	pop hl
	add b
	ld [de], a

	; Tile ID
	inc hl
	inc de
	ld a, [wBattleAnimTempTileID]
	add BATTLEANIM_BASE_TILE
	add [hl]
	ld [de], a

	; Attributes
	inc hl
	inc de
	ld a, [wBattleAnimTempOAMFlags]
	ld b, a
	ld a, [hl]
	xor b
	and PRIORITY | Y_FLIP | X_FLIP
	ld b, a
	ld a, [hl]
	and OBP_NUM
	or b
	ld b, a
	ld a, [wBattleAnimTempPalette]
	and PALETTE_MASK | VRAM_BANK_1
	or b
	ld [de], a

	inc hl
	inc de
	ld a, e
	ld [wBattleAnimOAMPointerLo], a
	cp LOW(wVirtualOAMEnd)
	jr nc, .exit_set_carry
	dec c
	jr nz, .loop
	pop bc
	jr .done

.delete
	call DeinitBattleAnimation

.done
	and a
	ret

.exit_set_carry
	pop bc
	scf
	ret

InitBattleAnimBuffer:
	ld hl, BATTLEANIMSTRUCT_01
	add hl, bc
	ld a, [hl]

	and PRIORITY
	ld [wBattleAnimTempOAMFlags], a
	xor a
	ld [wBattleAnimTempFrameOAMFlags], a
	ld hl, BATTLEANIMSTRUCT_PALETTE
	add hl, bc
	ld a, [hl]
	ld [wBattleAnimTempPalette], a
	ld hl, BATTLEANIMSTRUCT_02
	add hl, bc
	ld a, [hl]
	ld [wBattleAnimTempField02], a
	ld hl, BATTLEANIMSTRUCT_TILEID
	add hl, bc
	ld a, [hli]
	ld [wBattleAnimTempTileID], a
	ld a, [hli]
	ld [wBattleAnimTempXCoord], a
	ld a, [hli]
	ld [wBattleAnimTempYCoord], a
	ld a, [hli]
	ld [wBattleAnimTempXOffset], a
	ld a, [hli]
	ld [wBattleAnimTempYOffset], a

	ldh a, [hBattleTurn]
	and a
	ret z

	ld hl, BATTLEANIMSTRUCT_01
	add hl, bc
	ld a, [hl]
	ld [wBattleAnimTempOAMFlags], a
	bit 0, [hl]
	ret z

	ld hl, BATTLEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hli]
	ld d, a
	ld a, (-10 * 8) + 4
	sub d
	ld [wBattleAnimTempXCoord], a
	ld a, [hli]
	ld d, a
	ld a, [wBattleAnimTempField02]
	cp $ff
	jr nz, .check_kinesis_softboiled_milkdrink
	ld a, 5 * 8
	add d
	jr .done

.check_kinesis_softboiled_milkdrink
	sub d
	push af
	ld a, [wFXAnimID + 1]
	or a
	jr nz, .no_sub
	ld a, [wFXAnimID]
	cp KINESIS
	jr z, .kinesis
	cp SOFTBOILED
	jr z, .softboiled
	cp MILK_DRINK
	jr nz, .no_sub
.kinesis
.softboiled
.milk_drink
	pop af
	sub 1 * 8
	jr .done

.no_sub
	pop af
.done
	ld [wBattleAnimTempYCoord], a
	ld a, [hli]
	xor $ff
	inc a
	ld [wBattleAnimTempXOffset], a
	ret

GetBattleAnimTileOffset:
	push hl
	push bc
	ld hl, wBattleAnimTileDict
	ld b, a
	ld c, 10 / 2
.loop
	ld a, [hli]
	cp b
	jr z, .load
	inc hl
	dec c
	jr nz, .loop
	xor a
	jr .done

.load
	ld a, [hl]
.done
	pop bc
	pop hl
	ret

_ExecuteBGEffects:
	callfar ExecuteBGEffects
	ret

_QueueBGEffect:
	callfar QueueBGEffect
	ret

INCLUDE "data/battle_anims/objects.asm"

INCLUDE "engine/battle_anims/functions.asm"

INCLUDE "engine/battle_anims/helpers.asm"
