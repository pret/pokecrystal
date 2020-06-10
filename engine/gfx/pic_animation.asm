; Pic animation arrangement.

Unused_AnimateMon_Slow_Normal:
	hlcoord 12, 0
	ld a, [wBattleMode]
	cp WILD_BATTLE
	jr z, .wild
	ld e, ANIM_MON_SLOW
	ld d, $0
	call AnimateFrontpic
	ret

.wild
	ld e, ANIM_MON_NORMAL
	ld d, $0
	call AnimateFrontpic
	ret

AnimateMon_Menu:
	ld e, ANIM_MON_MENU
	ld d, $0
	call AnimateFrontpic
	ret

AnimateMon_Trade:
	ld e, ANIM_MON_TRADE
	ld d, $0
	call AnimateFrontpic
	ret

AnimateMon_Evolve:
	ld e, ANIM_MON_EVOLVE
	ld d, $0
	call AnimateFrontpic
	ret

AnimateMon_Hatch:
	ld e, ANIM_MON_HATCH
	ld d, $0
	call AnimateFrontpic
	ret

AnimateMon_HOF:
	ld e, ANIM_MON_HOF
	ld d, $0
	call AnimateFrontpic
	ret

pokeanim: MACRO
rept _NARG
	db (PokeAnim_\1_SetupCommand - PokeAnim_SetupCommands) / 2
	shift
endr
	db (PokeAnim_Finish_SetupCommand - PokeAnim_SetupCommands) / 2
ENDM

PokeAnims:
; entries correspond to ANIM_MON_* constants
	dw .Slow
	dw .Normal
	dw .Menu
	dw .Trade
	dw .Evolve
	dw .Hatch
	dw .HOF
	dw .Egg1
	dw .Egg2

.Slow:   pokeanim StereoCry, Setup2, Play
.Normal: pokeanim StereoCry, Setup, Play
.Menu:   pokeanim CryNoWait, Setup, Play, SetWait, Wait, Idle, Play
.Trade:  pokeanim Idle, Play2, Idle, Play, SetWait, Wait, Cry, Setup, Play
.Evolve: pokeanim Idle, Play, SetWait, Wait, CryNoWait, Setup, Play
.Hatch:  pokeanim Idle, Play, CryNoWait, Setup, Play, SetWait, Wait, Idle, Play
.HOF:    pokeanim CryNoWait, Setup, Play, SetWait, Wait, Idle, Play
.Egg1:   pokeanim Setup, Play
.Egg2:   pokeanim Idle, Play

AnimateFrontpic:
	call AnimateMon_CheckIfPokemon
	ret c
	call LoadMonAnimation
.loop
	call SetUpPokeAnim
	push af
	farcall HDMATransferTilemapToWRAMBank3
	pop af
	jr nc, .loop
	ret

LoadMonAnimation:
	push hl
	ld c, e
	ld b, 0
	ld hl, PokeAnims
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	call PokeAnim_InitPicAttributes
	ret

SetUpPokeAnim:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPokeAnimStruct)
	ldh [rSVBK], a
	ld a, [wPokeAnimSceneIndex]
	ld c, a
	ld b, 0
	ld hl, wPokeAnimPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, [hl]
	ld hl, PokeAnim_SetupCommands
	rst JumpTable
	ld a, [wPokeAnimSceneIndex]
	ld c, a
	pop af
	ldh [rSVBK], a
	ld a, c
	and $80
	ret z
	scf
	ret

add_setup_command: MACRO
\1_SetupCommand:
	dw \1
ENDM

PokeAnim_SetupCommands:
	add_setup_command PokeAnim_Finish
	add_setup_command PokeAnim_BasePic
	add_setup_command PokeAnim_SetWait
	add_setup_command PokeAnim_Wait
	add_setup_command PokeAnim_Setup
	add_setup_command PokeAnim_Setup2
	add_setup_command PokeAnim_Idle
	add_setup_command PokeAnim_Play
	add_setup_command PokeAnim_Play2
	add_setup_command PokeAnim_Cry
	add_setup_command PokeAnim_CryNoWait
	add_setup_command PokeAnim_StereoCry

PokeAnim_SetWait:
	ld a, 18
	ld [wPokeAnimWaitCounter], a
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a

PokeAnim_Wait:
	ld hl, wPokeAnimWaitCounter
	dec [hl]
	ret nz
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret

PokeAnim_Setup:
	ld c, FALSE
	ld b, 0
	call PokeAnim_InitAnim
	call PokeAnim_SetVBank1
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret

PokeAnim_Setup2:
	ld c, FALSE
	ld b, 4
	call PokeAnim_InitAnim
	call PokeAnim_SetVBank1
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret

PokeAnim_Idle:
	ld c, TRUE
	ld b, 0
	call PokeAnim_InitAnim
	call PokeAnim_SetVBank1
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret

PokeAnim_Play:
	call PokeAnim_DoAnimScript
	ld a, [wPokeAnimJumptableIndex]
	bit 7, a
	ret z
	call PokeAnim_PlaceGraphic
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret

PokeAnim_Play2:
	call PokeAnim_DoAnimScript
	ld a, [wPokeAnimJumptableIndex]
	bit 7, a
	ret z
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret

PokeAnim_BasePic:
	call PokeAnim_DeinitFrames
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret

PokeAnim_Finish:
	call PokeAnim_DeinitFrames
	ld hl, wPokeAnimSceneIndex
	set 7, [hl]
	ret

PokeAnim_Cry:
	ld a, [wPokeAnimSpecies]
	call _PlayMonCry
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret

PokeAnim_CryNoWait:
	ld a, [wPokeAnimSpecies]
	call PlayMonCry2
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret

PokeAnim_StereoCry:
	ld a, $f
	ld [wCryTracks], a
	ld a, [wPokeAnimSpecies]
	call PlayStereoCry2
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret

PokeAnim_DeinitFrames:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPokeAnimCoord)
	ldh [rSVBK], a
	call PokeAnim_PlaceGraphic
	farcall HDMATransferTilemapToWRAMBank3
	call PokeAnim_SetVBank0
	farcall HDMATransferAttrmapToWRAMBank3
	pop af
	ldh [rSVBK], a
	ret

AnimateMon_CheckIfPokemon:
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .fail
	call IsAPokemon
	jr c, .fail
	and a
	ret

.fail
	scf
	ret

PokeAnim_InitPicAttributes:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPokeAnimStruct)
	ldh [rSVBK], a

	push bc
	push de
	push hl
	ld hl, wPokeAnimStruct
	ld bc, wPokeAnimStructEnd - wPokeAnimStruct
	xor a
	call ByteFill
	pop hl
	pop de
	pop bc

; bc contains anim pointer
	ld a, c
	ld [wPokeAnimPointer], a
	ld a, b
	ld [wPokeAnimPointer + 1], a
; hl contains tilemap coords
	ld a, l
	ld [wPokeAnimCoord], a
	ld a, h
	ld [wPokeAnimCoord + 1], a
; d = start tile
	ld a, d
	ld [wPokeAnimGraphicStartTile], a

	ld a, BANK(wCurPartySpecies)
	ld hl, wCurPartySpecies
	call GetFarWRAMByte
	ld [wPokeAnimSpecies], a

	ld a, BANK(wUnownLetter)
	ld hl, wUnownLetter
	call GetFarWRAMByte
	ld [wPokeAnimUnownLetter], a

	call PokeAnim_GetSpeciesOrUnown
	ld [wPokeAnimSpeciesOrUnown], a

	call PokeAnim_GetFrontpicDims
	ld a, c
	ld [wPokeAnimFrontpicHeight], a

	pop af
	ldh [rSVBK], a
	ret

PokeAnim_InitAnim:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPokeAnimIdleFlag)
	ldh [rSVBK], a
	push bc
	ld hl, wPokeAnimIdleFlag
	ld bc, wPokeAnimStructEnd - wPokeAnimIdleFlag
	xor a
	call ByteFill
	pop bc
	ld a, b
	ld [wPokeAnimSpeed], a
	ld a, c
	ld [wPokeAnimIdleFlag], a
	call GetMonAnimPointer
	call GetMonFramesPointer
	call GetMonBitmaskPointer
	pop af
	ldh [rSVBK], a
	ret

PokeAnim_DoAnimScript:
	xor a
	ldh [hBGMapMode], a
.loop
	ld a, [wPokeAnimJumptableIndex]
	and $7f
	ld hl, .Jumptable
	rst JumpTable
	ret

.Jumptable:
	dw .RunAnim
	dw .WaitAnim

.RunAnim:
	call PokeAnim_GetPointer
	ld a, [wPokeAnimCommand]
	cp endanim_command
	jr z, PokeAnim_End
	cp setrepeat_command
	jr z, .SetRepeat
	cp dorepeat_command
	jr z, .DoRepeat
	call PokeAnim_GetFrame
	ld a, [wPokeAnimParameter]
	call PokeAnim_GetDuration
	ld [wPokeAnimWaitCounter], a
	call PokeAnim_StartWaitAnim
.WaitAnim:
	ld a, [wPokeAnimWaitCounter]
	dec a
	ld [wPokeAnimWaitCounter], a
	ret nz
	call PokeAnim_StopWaitAnim
	ret

.SetRepeat:
	ld a, [wPokeAnimParameter]
	ld [wPokeAnimRepeatTimer], a
	jr .loop

.DoRepeat:
	ld a, [wPokeAnimRepeatTimer]
	and a
	ret z
	dec a
	ld [wPokeAnimRepeatTimer], a
	ret z
	ld a, [wPokeAnimParameter]
	ld [wPokeAnimFrame], a
	jr .loop

PokeAnim_End:
	ld hl, wPokeAnimJumptableIndex
	set 7, [hl]
	ret

PokeAnim_GetDuration:
; a * (1 + [wPokeAnimSpeed] / 16)
	ld c, a
	ld b, $0
	ld hl, 0
	ld a, [wPokeAnimSpeed]
	call AddNTimes
	ld a, h
	swap a
	and $f0
	ld h, a
	ld a, l
	swap a
	and $f
	or h
	add c
	ret

PokeAnim_GetFrame:
	call PokeAnim_PlaceGraphic
	ld a, [wPokeAnimCommand]
	and a
	ret z
	call PokeAnim_GetBitmaskIndex
	push hl
	call PokeAnim_CopyBitmaskToBuffer
	pop hl
	call PokeAnim_ConvertAndApplyBitmask
	ret

PokeAnim_StartWaitAnim:
	ld a, [wPokeAnimJumptableIndex]
	inc a
	ld [wPokeAnimJumptableIndex], a
	ret

PokeAnim_StopWaitAnim:
	ld a, [wPokeAnimJumptableIndex]
	dec a
	ld [wPokeAnimJumptableIndex], a
	ret

PokeAnim_IsUnown:
	ld a, [wPokeAnimSpecies]
	cp UNOWN
	ret

PokeAnim_IsEgg:
	ld a, [wPokeAnimSpecies]
	cp EGG
	ret

PokeAnim_GetPointer:
	push hl
	ld a, [wPokeAnimFrame]
	ld e, a
	ld d, $0
	ld hl, wPokeAnimPointerAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	add hl, de
	ld a, [wPokeAnimPointerBank]
	call GetFarHalfword
	ld a, l
	ld [wPokeAnimCommand], a
	ld a, h
	ld [wPokeAnimParameter], a
	ld hl, wPokeAnimFrame
	inc [hl]
	pop hl
	ret

PokeAnim_GetBitmaskIndex:
	ld a, [wPokeAnimCommand]
	dec a
	ld c, a
	ld b, $0
	ld hl, wPokeAnimFramesAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	add hl, bc
	ld a, [wPokeAnimFramesBank]
	call GetFarHalfword
	ld a, [wPokeAnimFramesBank]
	call GetFarByte
	ld [wPokeAnimCurBitmask], a
	inc hl
	ret

PokeAnim_CopyBitmaskToBuffer:
	call .GetSize
	push bc
	ld hl, wPokeAnimBitmaskAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPokeAnimCurBitmask]
	call AddNTimes
	pop bc
	ld de, wPokeAnimBitmaskBuffer
	ld a, [wPokeAnimBitmaskBank]
	call FarCopyBytes
	ret

.GetSize:
	push hl
	ld a, [wPokeAnimFrontpicHeight]
	sub 5 ; to get a number 0, 1, or 2
	ld c, a
	ld b, 0
	ld hl, .Sizes
	add hl, bc
	ld c, [hl]
	ld b, 0
	pop hl
	ret

.Sizes: db 4, 5, 7

poke_anim_box: MACRO
y = 7
rept \1
x = 7 - \1
rept \1
	db x + y
x = x + 1
endr
y = y + 7
endr
ENDM

PokeAnim_ConvertAndApplyBitmask:
	xor a
	ld [wPokeAnimBitmaskCurBit], a
	ld [wPokeAnimBitmaskCurRow], a
	ld [wPokeAnimBitmaskCurCol], a
.loop
	push hl
	call .IsCurBitSet
	pop hl
	ld a, b
	and a
	jr z, .next

	ld a, [wPokeAnimFramesBank]
	call GetFarByte
	inc hl
	push hl
	call .ApplyFrame
	pop hl

.next
	push hl
	call .NextBit
	pop hl
	jr nc, .loop
	ret

.IsCurBitSet:
; which byte
	ld a, [wPokeAnimBitmaskCurBit]
	and $f8
	rrca
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, wPokeAnimBitmaskBuffer
	add hl, de
	ld b, [hl]
; which bit
	ld a, [wPokeAnimBitmaskCurBit]
	and $7
	jr z, .skip

	ld c, a
	ld a, b
.loop2
	rrca
	dec c
	jr nz, .loop2
	ld b, a

.skip
	xor a
	bit 0, b
	jr z, .finish
	ld a, 1

.finish
	ld b, a
	ld hl, wPokeAnimBitmaskCurBit
	inc [hl]
	ret

.ApplyFrame:
	push af
	call .GetCoord
	pop af
	push hl
	call .GetTilemap
	ld hl, wPokeAnimGraphicStartTile
	add [hl]
	pop hl
	ld [hl], a
	ret

.GetCoord:
	call .GetStartCoord
	ld a, [wPokeAnimBitmaskCurRow]
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld a, [wBoxAlignment]
	and a
	jr nz, .go
	ld a, [wPokeAnimBitmaskCurCol]
	ld e, a
	ld d, 0
	add hl, de
	jr .skip2

.go
	ld a, [wPokeAnimBitmaskCurCol]
	ld e, a
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc 0
	ld h, a

.skip2
	ret

; unused
	db 6, 5, 4

.GetTilemap:
	push af
	ld a, [wPokeAnimFrontpicHeight]
	cp 5
	jr z, .check_add_24
	cp 6
	jr z, .check_add_13
	pop af
	ret

.check_add_24
	pop af
	cp 5 * 5
	jr nc, .add_24
	push hl
	push de
	ld hl, ._5by5
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.add_24
	add 24
	ret

.check_add_13
	pop af
	cp 6 * 6
	jr nc, .add_13
	push hl
	push de
	ld hl, ._6by6
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret

.add_13
	add 13
	ret

._5by5:
	poke_anim_box 5
	; db  9, 10, 11, 12, 13
	; db 16, 17, 18, 19, 20
	; db 23, 24, 25, 26, 27
	; db 30, 31, 32, 33, 34
	; db 37, 38, 39, 40, 41

._6by6:
	poke_anim_box 6
	; db  8,  9, 10, 11, 12, 13
	; db 15, 16, 17, 18, 19, 20
	; db 22, 23, 24, 25, 26, 27
	; db 29, 30, 31, 32, 33, 34
	; db 36, 37, 38, 39, 40, 41
	; db 43, 44, 45, 46, 47, 48

.GetStartCoord:
	ld hl, wPokeAnimCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wPokeAnimFrontpicHeight]
	ld de, 0
	ld bc, 6
	cp 7
	jr z, .okay
	ld de, SCREEN_WIDTH + 1
	ld bc, SCREEN_WIDTH + 5
	cp 6
	jr z, .okay
	ld de, 2 * SCREEN_WIDTH + 1
	ld bc, 2 * SCREEN_WIDTH + 5
.okay

	ld a, [wBoxAlignment]
	and a
	jr nz, .add_bc
	add hl, de
	ret

.add_bc
	add hl, bc
	ret

.NextBit:
	ld a, [wPokeAnimBitmaskCurRow]
	inc a
	ld [wPokeAnimBitmaskCurRow], a
	ld c, a
	ld a, [wPokeAnimFrontpicHeight]
	cp c
	jr nz, .no_carry
	xor a
	ld [wPokeAnimBitmaskCurRow], a
	ld a, [wPokeAnimBitmaskCurCol]
	inc a
	ld [wPokeAnimBitmaskCurCol], a
	ld c, a
	ld a, [wPokeAnimFrontpicHeight]
	cp c
	jr nz, .no_carry
	scf
	ret

.no_carry
	xor a
	ret

PokeAnim_PlaceGraphic:
	call .ClearBox
	ld a, [wBoxAlignment]
	and a
	jr nz, .flipped
	ld de, 1
	ld bc, 0
	jr .okay

.flipped
	ld de, -1
	ld bc, 6

.okay
	ld hl, wPokeAnimCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, 7
	ld b, 7
	ld a, [wPokeAnimGraphicStartTile]
.loop
	push bc
	push hl
	push de
	ld de, SCREEN_WIDTH
.loop2
	ld [hl], a
	inc a
	add hl, de
	dec b
	jr nz, .loop2
	pop de
	pop hl
	add hl, de
	pop bc
	dec c
	jr nz, .loop
	ret

.ClearBox:
	ld hl, wPokeAnimCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 7
	ld c, 7
	call ClearBox
	ret

PokeAnim_SetVBank1:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPokeAnimCoord)
	ldh [rSVBK], a
	xor a
	ldh [hBGMapMode], a
	call .SetFlag
	farcall HDMATransferAttrmapToWRAMBank3
	pop af
	ldh [rSVBK], a
	ret

.SetFlag:
	call PokeAnim_GetAttrmapCoord
	ld b, 7
	ld c, 7
	ld de, SCREEN_WIDTH
.row
	push bc
	push hl
.col
	ld a, [hl]
	or 8
	ld [hl], a
	add hl, de
	dec c
	jr nz, .col
	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .row
	ret

PokeAnim_SetVBank0:
	call PokeAnim_GetAttrmapCoord
	ld b, 7
	ld c, 7
	ld de, SCREEN_WIDTH
.row
	push bc
	push hl
.col
	ld a, [hl]
	and $f7
	ld [hl], a
	add hl, de
	dec c
	jr nz, .col
	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .row
	ret

PokeAnim_GetAttrmapCoord:
	ld hl, wPokeAnimCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wAttrmap - wTilemap
	add hl, de
	ret

GetMonAnimPointer:
	call PokeAnim_IsEgg
	jr z, .egg

	ld c, BANK(UnownAnimationPointers) ; aka BANK(UnownAnimationIdlePointers)
	ld hl, UnownAnimationPointers
	ld de, UnownAnimationIdlePointers
	call PokeAnim_IsUnown
	jr z, .unown
	ld c, BANK(AnimationPointers) ; aka BANK(AnimationIdlePointers)
	ld hl, AnimationPointers
	ld de, AnimationIdlePointers
.unown

	ld a, [wPokeAnimIdleFlag]
	and a
	jr z, .idles
	ld h, d
	ld l, e
.idles

	ld a, [wPokeAnimSpeciesOrUnown]
	dec a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, c
	ld [wPokeAnimPointerBank], a
	call GetFarHalfword
	ld a, l
	ld [wPokeAnimPointerAddr], a
	ld a, h
	ld [wPokeAnimPointerAddr + 1], a
	ret

.egg
	ld hl, EggAnimation
	ld c, BANK(EggAnimation)
	ld a, [wPokeAnimIdleFlag]
	and a
	jr z, .idles_egg
	ld hl, EggAnimationIdle
	ld c, BANK(EggAnimationIdle)
.idles_egg

	ld a, c
	ld [wPokeAnimPointerBank], a
	ld a, l
	ld [wPokeAnimPointerAddr], a
	ld a, h
	ld [wPokeAnimPointerAddr + 1], a
	ret

PokeAnim_GetFrontpicDims:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wCurPartySpecies)
	ldh [rSVBK], a
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBasePicSize]
	and $f
	ld c, a
	pop af
	ldh [rSVBK], a
	ret

GetMonFramesPointer:
	call PokeAnim_IsEgg
	jr z, .egg

	call PokeAnim_IsUnown
	ld b, BANK(UnownFramesPointers)
	ld c, BANK(UnownsFrames)
	ld hl, UnownFramesPointers
	jr z, .got_frames
	ld a, [wPokeAnimSpecies]
	cp JOHTO_POKEMON
	ld b, BANK(FramesPointers)
	ld c, BANK(KantoFrames)
	ld hl, FramesPointers
	jr c, .got_frames
	ld c, BANK(JohtoFrames)
.got_frames
	ld a, c
	ld [wPokeAnimFramesBank], a

	ld a, [wPokeAnimSpeciesOrUnown]
	dec a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, b
	call GetFarHalfword
	ld a, l
	ld [wPokeAnimFramesAddr], a
	ld a, h
	ld [wPokeAnimFramesAddr + 1], a
	ret

.egg
	ld hl, EggFrames
	ld c, BANK(EggFrames)
	ld a, c
	ld [wPokeAnimFramesBank], a
	ld a, l
	ld [wPokeAnimFramesAddr], a
	ld a, h
	ld [wPokeAnimFramesAddr + 1], a
	ret

GetMonBitmaskPointer:
	call PokeAnim_IsEgg
	jr z, .egg

	call PokeAnim_IsUnown
	ld a, BANK(UnownBitmasksPointers)
	ld hl, UnownBitmasksPointers
	jr z, .unown
	ld a, BANK(BitmasksPointers)
	ld hl, BitmasksPointers
.unown
	ld [wPokeAnimBitmaskBank], a

	ld a, [wPokeAnimSpeciesOrUnown]
	dec a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [wPokeAnimBitmaskBank]
	call GetFarHalfword
	ld a, l
	ld [wPokeAnimBitmaskAddr], a
	ld a, h
	ld [wPokeAnimBitmaskAddr + 1], a
	ret

.egg
	ld c, BANK(EggBitmasks)
	ld hl, EggBitmasks
	ld a, c
	ld [wPokeAnimBitmaskBank], a
	ld a, l
	ld [wPokeAnimBitmaskAddr], a
	ld a, h
	ld [wPokeAnimBitmaskAddr + 1], a
	ret

PokeAnim_GetSpeciesOrUnown:
	call PokeAnim_IsUnown
	jr z, .unown
	ld a, [wPokeAnimSpecies]
	ret

.unown
	ld a, [wPokeAnimUnownLetter]
	ret

Unused_HOF_AnimateAlignedFrontpic:
	ld a, $1
	ld [wBoxAlignment], a

HOF_AnimateFrontpic:
	call AnimateMon_CheckIfPokemon
	jr c, .fail
	ld h, d
	ld l, e
	push bc
	push hl
	ld de, vTiles2
	predef GetAnimatedFrontpic
	pop hl
	pop bc
	ld d, 0
	ld e, c
	call AnimateFrontpic
	xor a
	ld [wBoxAlignment], a
	ret

.fail
	xor a
	ld [wBoxAlignment], a
	inc a
	ld [wCurPartySpecies], a
	ret
