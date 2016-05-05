; Pic animation arrangement.


AnimateMon_Slow_Normal: ; d0000
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
; d001a

AnimateMon_Menu: ; d001a
	ld e, ANIM_MON_MENU
	ld d, $0
	call AnimateFrontpic
	ret
; d0022

AnimateMon_Trade: ; d0022
	ld e, ANIM_MON_TRADE
	ld d, $0
	call AnimateFrontpic
	ret
; d002a

AnimateMon_Evolve: ; d002a
	ld e, ANIM_MON_EVOLVE
	ld d, $0
	call AnimateFrontpic
	ret
; d0032

AnimateMon_Hatch: ; d0032
	ld e, ANIM_MON_HATCH
	ld d, $0
	call AnimateFrontpic
	ret
; d003a

AnimateMon_Unused: ; d003a
	ld e, ANIM_MON_UNUSED
	ld d, $0
	call AnimateFrontpic
	ret
; d0042


POKEANIM: MACRO
	rept _NARG

; Workaround for a bug where macro args can't come after the start of a symbol
if !def(\1_POKEANIM)
\1_POKEANIM equs "PokeAnim_\1_"
endc

	db (\1_POKEANIM - PokeAnim_SetupCommands) / 2
	shift
	endr

	db (PokeAnim_Finish_ - PokeAnim_SetupCommands) / 2
ENDM


PokeAnims: ; d0042
	dw .Slow
	dw .Normal
	dw .Menu
	dw .Trade
	dw .Evolve
	dw .Hatch
	dw .Unused ; same as .Menu
	dw .Egg1
	dw .Egg2

.Slow:   POKEANIM StereoCry, Setup2, Play
.Normal: POKEANIM StereoCry, Setup, Play
.Menu:   POKEANIM CryNoWait, Setup, Play, SetWait, Wait, Extra, Play
.Trade:  POKEANIM Extra, Play2, Extra, Play, SetWait, Wait, Cry, Setup, Play
.Evolve: POKEANIM Extra, Play, SetWait, Wait, CryNoWait, Setup, Play
.Hatch:  POKEANIM Extra, Play, CryNoWait, Setup, Play, SetWait, Wait, Extra, Play
.Unused: POKEANIM CryNoWait, Setup, Play, SetWait, Wait, Extra, Play
.Egg1:   POKEANIM Setup, Play
.Egg2:   POKEANIM Extra, Play


AnimateFrontpic: ; d008e
	call AnimateMon_CheckIfPokemon
	ret c
	call LoadMonAnimation
.loop
	call SetUpPokeAnim
	push af
	callba HDMATransferTileMapToWRAMBank3
	pop af
	jr nc, .loop
	ret
; d00a3

LoadMonAnimation: ; d00a3
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
	call Functiond01d6
	ret
; d00b4

SetUpPokeAnim: ; d00b4
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
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
	ld [rSVBK], a
	ld a, c
	and $80
	ret z
	scf
	ret
; d00da

PokeAnim_SetupCommands: ; d00da
setup_command: macro
\1_: dw \1
endm
	setup_command PokeAnim_Finish
	setup_command PokeAnim_Nop
	setup_command PokeAnim_SetWait
	setup_command PokeAnim_Wait
	setup_command PokeAnim_Setup
	setup_command PokeAnim_Setup2
	setup_command PokeAnim_Extra
	setup_command PokeAnim_Play
	setup_command PokeAnim_Play2
	setup_command PokeAnim_Cry
	setup_command PokeAnim_CryNoWait
	setup_command PokeAnim_StereoCry
; d00f2

PokeAnim_SetWait: ; d00f2
	ld a, 18
	ld [wPokeAnimWaitCounter], a
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a

PokeAnim_Wait: ; d00fe
	ld hl, wPokeAnimWaitCounter
	dec [hl]
	ret nz
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d010b

PokeAnim_Setup: ; d010b
	ld c, FALSE
	ld b, 0
	call Functiond0228
	call Functiond0504
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d011d

PokeAnim_Setup2: ; d011d
	ld c, FALSE
	ld b, 4
	call Functiond0228
	call Functiond0504
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d012f

PokeAnim_Extra: ; d012f
	ld c, TRUE
	ld b, 0
	call Functiond0228
	call Functiond0504
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0141

PokeAnim_Play: ; d0141
	call Functiond0250
	ld a, [w2_d17e]
	bit 7, a
	ret z
	call Functiond04bd
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0155

PokeAnim_Play2: ; d0155
	call Functiond0250
	ld a, [w2_d17e]
	bit 7, a
	ret z
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0166

PokeAnim_Nop: ; d0166
	call Functiond01a9
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0171

PokeAnim_Finish: ; d0171
	call Functiond01a9
	ld hl, wPokeAnimSceneIndex
	set 7, [hl]
	ret
; d017a

PokeAnim_Cry: ; d017a
	ld a, [wPokeAnimSpecies]
	call _PlayCry
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0188

PokeAnim_CryNoWait: ; d0188
	ld a, [wPokeAnimSpecies]
	call PlayCry2
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0196

PokeAnim_StereoCry: ; d0196
	ld a, $f
	ld [CryTracks], a
	ld a, [wPokeAnimSpecies]
	call PlayStereoCry2
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d01a9

Functiond01a9: ; d01a9
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	call Functiond04bd
	callba HDMATransferTileMapToWRAMBank3
	call Functiond0536
	callba HDMATransferAttrMapToWRAMBank3
	pop af
	ld [rSVBK], a
	ret
; d01c6

AnimateMon_CheckIfPokemon: ; d01c6
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .fail
	call IsAPokemon
	jr c, .fail
	and a
	ret

.fail
	scf
	ret
; d01d6

Functiond01d6: ; d01d6
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a

	push bc
	push de
	push hl
	ld hl, wPokeAnimSceneIndex
	ld bc, wPokeAnimStructEnd - wPokeAnimSceneIndex
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
; hl contains TileMap coords
	ld a, l
	ld [wPokeAnimCoord], a
	ld a, h
	ld [wPokeAnimCoord + 1], a
; d = ?????
	ld a, d
	ld [w2_d16e], a
	ld a, $1
	ld hl, CurPartySpecies
	call GetFarWRAMByte
	ld [wPokeAnimSpecies], a
	ld a, $1
	ld hl, UnownLetter
	call GetFarWRAMByte
	ld [wPokeAnimUnownLetter], a
	call PokeAnim_GetSpeciesOrUnown
	ld [wPokeAnimSpeciesOrUnown], a
	call PokeAnim_GetFrontpicDims
	ld a, c
	ld [wPokeAnimFrontpicHeight], a
	pop af
	ld [rSVBK], a
	ret
; d0228

Functiond0228: ; d0228
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	push bc
	ld hl, wPokeAnimExtraFlag
	ld bc, wPokeAnimStructEnd - wPokeAnimExtraFlag
	xor a
	call ByteFill
	pop bc
	ld a, b
	ld [w2_d173], a
	ld a, c
	ld [wPokeAnimExtraFlag], a
	call GetMonAnimPointer
	call GetMonFramesPointer
	call GetMonBitmaskPointer
	pop af
	ld [rSVBK], a
	ret
; d0250

Functiond0250: ; d0250
	xor a
	ld [hBGMapMode], a

Functiond0253: ; d0253
	ld a, [w2_d17e]
	and $7f
	ld hl, Tabled025d
	rst JumpTable
	ret
; d025d

Tabled025d: ; d025d
	dw Functiond0261
	dw Functiond0282
; d0261

Functiond0261: ; d0261
	call Functiond02f8
	ld a, [w2_d182]
	cp $ff
	jr z, PokeAnim_End
	cp $fe
	jr z, PokeAnim_SetRepeat
	cp $fd
	jr z, PokeAnim_DoRepeat
	call Functiond02c8
	ld a, [w2_d183]
	call Functiond02ae
	ld [wPokeAnimWaitCounter], a
	call Functiond02dc

Functiond0282: ; d0282
	ld a, [wPokeAnimWaitCounter]
	dec a
	ld [wPokeAnimWaitCounter], a
	ret nz
	call Functiond02e4
	ret
; d028e

PokeAnim_SetRepeat: ; d028e
	ld a, [w2_d183]
	ld [wPokeAnimRepeatTimer], a
	jr Functiond0253
; d0296

PokeAnim_DoRepeat: ; d0296
	ld a, [wPokeAnimRepeatTimer]
	and a
	ret z
	dec a
	ld [wPokeAnimRepeatTimer], a
	ret z
	ld a, [w2_d183]
	ld [w2_d17d], a
	jr Functiond0253
; d02a8

PokeAnim_End: ; d02a8
	ld hl, w2_d17e
	set 7, [hl]
	ret
; d02ae

Functiond02ae: ; d02ae
	ld c, a
	ld b, $0
	ld hl, 0
	ld a, [w2_d173]
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
; d02c8

Functiond02c8: ; d02c8
	call Functiond04bd
	ld a, [w2_d182]
	and a
	ret z
	call Functiond031b
	push hl
	call Functiond033b
	pop hl
	call Functiond036b
	ret
; d02dc

Functiond02dc: ; d02dc
	ld a, [w2_d17e]
	inc a
	ld [w2_d17e], a
	ret
; d02e4

Functiond02e4: ; d02e4
	ld a, [w2_d17e]
	dec a
	ld [w2_d17e], a
	ret
; d02ec

PokeAnim_IsUnown: ; d02ec
	ld a, [wPokeAnimSpecies]
	cp UNOWN
	ret
; d02f2

PokeAnim_IsEgg: ; d02f2
	ld a, [wPokeAnimSpecies]
	cp EGG
	ret
; d02f8

Functiond02f8: ; d02f8
	push hl
	ld a, [w2_d17d]
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
	ld [w2_d182], a
	ld a, h
	ld [w2_d183], a
	ld hl, w2_d17d
	inc [hl]
	pop hl
	ret
; d031b

Functiond031b: ; d031b
	ld a, [w2_d182]
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
	ld [w2_d180], a
	inc hl
	ret
; d033b

Functiond033b: ; d033b
	call Functiond0356
	push bc
	ld hl, wPokeAnimBitmaskAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [w2_d180]
	call AddNTimes
	pop bc
	ld de, w2_d188
	ld a, [wPokeAnimBitmaskBank]
	call FarCopyBytes
	ret
; d0356

Functiond0356: ; d0356
	push hl
	ld a, [wPokeAnimFrontpicHeight]
	sub 5
	ld c, a
	ld b, 0
	ld hl, Unknown_d0368
	add hl, bc
	ld c, [hl]
	ld b, 0
	pop hl
	ret
; d0368

Unknown_d0368: db 4, 5, 7

Functiond036b: ; d036b
	xor a
	ld [w2_d187], a
	ld [w2_d186], a
	ld [w2_d185], a
.loop
	push hl
	call Functiond0392
	pop hl
	ld a, b
	and a
	jr z, .next

	ld a, [wPokeAnimFramesBank]
	call GetFarByte
	inc hl
	push hl
	call Functiond03bd
	pop hl

.next
	push hl
	call Functiond0499
	pop hl
	jr nc, .loop
	ret
; d0392

Functiond0392: ; d0392
	ld a, [w2_d187]
	and $f8
	rrca
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, w2_d188
	add hl, de
	ld b, [hl]
	ld a, [w2_d187]
	and 7
	jr z, .skip

	ld c, a
	ld a, b
.loop
	rrca
	dec c
	jr nz, .loop
	ld b, a

.skip
	xor a
	bit 0, b
	jr z, .finish
	ld a, 1

.finish
	ld b, a
	ld hl, w2_d187
	inc [hl]
	ret
; d03bd

Functiond03bd: ; d03bd
	push af
	call Functiond03cd
	pop af
	push hl
	call Functiond03f7
	ld hl, w2_d16e
	add [hl]
	pop hl
	ld [hl], a
	ret
; d03cd

Functiond03cd: ; d03cd
	call Functiond046c
	ld a, [w2_d186]
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld a, [wBoxAlignment]
	and a
	jr nz, .go
	ld a, [w2_d185]
	ld e, a
	ld d, 0
	add hl, de
	jr .skip

.go
	ld a, [w2_d185]
	ld e, a
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc 0
	ld h, a

.skip
	ret
; d03f4

Unknown_d03f4: db 6, 5, 4

Functiond03f7: ; d03f7
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
	ld hl, Unknown_d042f
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
	ld hl, Unknown_d0448
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
; d042f

macro_d042f: MACRO
y = 7
rept 7 +- \1
x = \1
rept 7 +- \1
	db x + y
x = x + 1
endr
y = y + 7
endr
endm

Unknown_d042f:
	macro_d042f 2
	; db  9, 10, 11, 12, 13
	; db 16, 17, 18, 19, 20
	; db 23, 24, 25, 26, 27
	; db 30, 31, 32, 33, 34
	; db 37, 38, 39, 40, 41

Unknown_d0448:
	macro_d042f 1
	; db  8,  9, 10, 11, 12, 13
	; db 15, 16, 17, 18, 19, 20
	; db 22, 23, 24, 25, 26, 27
	; db 29, 30, 31, 32, 33, 34
	; db 36, 37, 38, 39, 40, 41
	; db 43, 44, 45, 46, 47, 48


Functiond046c: ; d046c
	ld hl, wPokeAnimCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wPokeAnimFrontpicHeight]
	ld de, 0
	ld bc, 6
	cp 7
	jr z, .okay
	ld de, 21
	ld bc, 25
	cp 6
	jr z, .okay
	ld de, 41
	ld bc, 45
.okay

	ld a, [wBoxAlignment]
	and a
	jr nz, .add_bc
	add hl, de
	ret

.add_bc
	add hl, bc
	ret
; d0499

Functiond0499: ; d0499
	ld a, [w2_d186]
	inc a
	ld [w2_d186], a
	ld c, a
	ld a, [wPokeAnimFrontpicHeight]
	cp c
	jr nz, .no_carry
	xor a
	ld [w2_d186], a
	ld a, [w2_d185]
	inc a
	ld [w2_d185], a
	ld c, a
	ld a, [wPokeAnimFrontpicHeight]
	cp c
	jr nz, .no_carry
	scf
	ret

.no_carry
	xor a
	ret
; d04bd

Functiond04bd: ; d04bd
	call Functiond04f6
	ld a, [wBoxAlignment]
	and a
	jr nz, .minus_one_and_six
	ld de, 1
	ld bc, 0
	jr .okay

.minus_one_and_six
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
	ld a, [w2_d16e]
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
; d04f6

Functiond04f6: ; d04f6
	ld hl, wPokeAnimCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 7
	ld c, 7
	call ClearBox
	ret
; d0504

Functiond0504: ; d0504
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	xor a
	ld [hBGMapMode], a
	call Functiond051b
	callba HDMATransferAttrMapToWRAMBank3
	pop af
	ld [rSVBK], a
	ret
; d051b

Functiond051b: ; d051b
	call Functiond0551
	ld b, 7
	ld c, 7
	ld de, $0014
.asm_d0525
	push bc
	push hl
.asm_d0527
	ld a, [hl]
	or 8
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_d0527
	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .asm_d0525
	ret
; d0536

Functiond0536: ; d0536
	call Functiond0551
	ld b, 7
	ld c, 7
	ld de, $0014
.asm_d0540
	push bc
	push hl
.asm_d0542
	ld a, [hl]
	and $f7
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_d0542
	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .asm_d0540
	ret
; d0551

Functiond0551: ; d0551
	ld hl, wPokeAnimCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, AttrMap - TileMap
	add hl, de
	ret
; d055c

GetMonAnimPointer: ; d055c
	call PokeAnim_IsEgg
	jr z, .egg

	ld c, BANK(UnownAnimations)
	ld hl, UnownAnimationPointers
	ld de, UnownAnimationExtraPointers
	call PokeAnim_IsUnown
	jr z, .unown
	ld c, BANK(PicAnimations)
	ld hl, AnimationPointers
	ld de, AnimationExtraPointers
.unown

	ld a, [wPokeAnimExtraFlag]
	and a
	jr z, .extras
	ld h, d
	ld l, e
.extras

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
	ld a, [wPokeAnimExtraFlag]
	and a
	jr z, .extras_egg
	ld hl, EggAnimationExtra
	ld c, BANK(EggAnimationExtra)
.extras_egg

	ld a, c
	ld [wPokeAnimPointerBank], a
	ld a, l
	ld [wPokeAnimPointerAddr], a
	ld a, h
	ld [wPokeAnimPointerAddr + 1], a
	ret
; d05b4

PokeAnim_GetFrontpicDims: ; d05b4
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BasePicSize]
	and $f
	ld c, a
	pop af
	ld [rSVBK], a
	ret
; d05ce

GetMonFramesPointer: ; d05ce
	call PokeAnim_IsEgg
	jr z, .egg

	call PokeAnim_IsUnown
	ld b, BANK(UnownFramesPointers)
	ld c, BANK(UnownsFrames)
	ld hl, UnownFramesPointers
	jr z, .got_frames
	ld a, [wPokeAnimSpecies]
	cp CHIKORITA
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
; d061b

GetMonBitmaskPointer: ; d061b
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
; d065c

PokeAnim_GetSpeciesOrUnown: ; d065c
	call PokeAnim_IsUnown
	jr z, .unown
	ld a, [wPokeAnimSpecies]
	ret

.unown
	ld a, [wPokeAnimUnownLetter]
	ret
; d0669

Functiond0669: ; d0669 Predef 48
	ld a, $1
	ld [wBoxAlignment], a

HOF_AnimateFrontpic: ; d066e Predef 49
	call AnimateMon_CheckIfPokemon
	jr c, .fail
	ld h, d
	ld l, e
	push bc
	push hl
	ld de, VTiles2
	predef FrontpicPredef
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
	ld [CurPartySpecies], a
	ret
; d0695
