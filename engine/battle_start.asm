Predef_StartBattle: ; 8c20f
	call .InitGFX
	ld a, [rBGP]
	ld [wBGP], a
	ld a, [rOBP0]
	ld [wOBP0], a
	ld a, [rOBP1]
	ld [wOBP1], a
	call DelayFrame
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $1

.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call FlashyTransitionToBattle
	call DelayFrame
	jr .loop

.done
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, UnknBGPals
	ld bc, 8 palettes
	xor a
	call ByteFill

	pop af
	ld [rSVBK], a

	ld a, %11111111
	ld [wBGP], a
	call DmgToCgbBGPals
	call DelayFrame
	xor a
	ld [hLCDCPointer], a
	ld [hLYOverrideStart], a
	ld [hLYOverrideEnd], a
	ld [hSCY], a

	ld a, $1
	ld [rSVBK], a
	pop af
	ld [hVBlank], a
	call DelayFrame
	ret
; 8c26d

.InitGFX: ; 8c26d
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr z, .mobile
	callba ReanchorBGMap_NoOAMUpdate
	call UpdateSprites
	call DelayFrame
	call .NonMobile_LoadPokeballTiles
	call BattleStart_LoadEDTile
	jr .resume

.mobile
	call LoadTrainerBattlePokeballTiles

.resume
	ld a, SCREEN_HEIGHT_PX
	ld [hWY], a
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld hl, wJumptableIndex
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	call WipeLYOverrides
	ret
; 8c2a0

.NonMobile_LoadPokeballTiles: ; 8c2a0
	call LoadTrainerBattlePokeballTiles
	hlbgcoord 0, 0
	call ConvertTrainerBattlePokeballTilesTo2bpp
	ret
; 8c2aa

LoadTrainerBattlePokeballTiles:
; Load the tiles used in the Pokeball Graphic that fills the screen
; at the start of every Trainer battle.
	ld de, TrainerBattlePokeballTiles
	ld hl, VTiles1 tile $7e
	ld b, BANK(TrainerBattlePokeballTiles)
	ld c, 2
	call Request2bpp

	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a

	ld de, TrainerBattlePokeballTiles
	ld hl, VTiles4 tile $7e
	ld b, BANK(TrainerBattlePokeballTiles)
	ld c, 2
	call Request2bpp

	pop af
	ld [rVBK], a
	ret
; 8c2cf

ConvertTrainerBattlePokeballTilesTo2bpp: ; 8c2cf
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push hl
	ld hl, wDecompressScratch
	ld bc, $28 tiles

.loop
	ld [hl], -1
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop

	pop hl
	ld de, wDecompressScratch
	ld b, BANK(ConvertTrainerBattlePokeballTilesTo2bpp) ; BANK(@)
	ld c, $28
	call Request2bpp
	pop af
	ld [rSVBK], a
	ret
; 8c2f4

TrainerBattlePokeballTiles: ; 8c2f4
INCBIN "gfx/overworld/trainer_battle_pokeball_tiles.2bpp"


FlashyTransitionToBattle: ; 8c314
	jumptable .dw, wJumptableIndex
; 8c323

.dw ; 8c323 (23:4323)
	dw StartTrainerBattle_DetermineWhichAnimation ; 00

	; Animation 1: cave
	dw StartTrainerBattle_LoadPokeBallGraphics ; 01
	dw StartTrainerBattle_SetUpBGMap ; 02
	dw StartTrainerBattle_Flash ; 03
	dw StartTrainerBattle_Flash ; 04
	dw StartTrainerBattle_Flash ; 05
	dw StartTrainerBattle_NextScene ; 06
	dw StartTrainerBattle_SetUpForWavyOutro ; 07
	dw StartTrainerBattle_SineWave ; 08

	; Animation 2: cave, stronger
	dw StartTrainerBattle_LoadPokeBallGraphics ; 09
	dw StartTrainerBattle_SetUpBGMap ; 0a
	dw StartTrainerBattle_Flash ; 0b
	dw StartTrainerBattle_Flash ; 0c
	dw StartTrainerBattle_Flash ; 0d
	dw StartTrainerBattle_NextScene ; 0e
	; There is no setup for this one
	dw StartTrainerBattle_ZoomToBlack ; 0f

	; Animation 3: no cave
	dw StartTrainerBattle_LoadPokeBallGraphics ; 10
	dw StartTrainerBattle_SetUpBGMap ; 11
	dw StartTrainerBattle_Flash ; 12
	dw StartTrainerBattle_Flash ; 13
	dw StartTrainerBattle_Flash ; 14
	dw StartTrainerBattle_NextScene ; 15
	dw StartTrainerBattle_SetUpForSpinOutro ; 16
	dw StartTrainerBattle_SpinToBlack ; 17

	; Animation 4: no cave, stronger
	dw StartTrainerBattle_LoadPokeBallGraphics ; 18
	dw StartTrainerBattle_SetUpBGMap ; 19
	dw StartTrainerBattle_Flash ; 1a
	dw StartTrainerBattle_Flash ; 1b
	dw StartTrainerBattle_Flash ; 1c
	dw StartTrainerBattle_NextScene ; 1d
	dw StartTrainerBattle_SetUpForRandomScatterOutro ; 1e
	dw StartTrainerBattle_SpeckleToBlack ; 1f

	; All animations jump to here.
	dw StartTrainerBattle_Finish ; 20


StartTrainerBattle_DetermineWhichAnimation: ; 8c365 (23:4365)
; The screen flashes a different number of
; times depending on the level of your lead
; Pokemon relative to the opponent's.
	ld de, 0
	ld a, [BattleMonLevel]
	add 3
	ld hl, EnemyMonLevel
	cp [hl]
	jr nc, .okay
	set 0, e
.okay
	ld a, [wPermission]
	cp CAVE
	jr z, .okay2
	cp PERM_5
	jr z, .okay2
	cp DUNGEON
	jr z, .okay2
	set 1, e
.okay2
	ld hl, .StartingPoints
	add hl, de
	ld a, [hl]
	ld [wJumptableIndex], a
	ret
; 8c38f (23:438f)

.StartingPoints: ; 8c38f
	db 1,  9
	db 16, 24
; 8c393

StartTrainerBattle_Finish: ; 8c393 (23:4393)
	call ClearSprites
	ld a, $80
	ld [wJumptableIndex], a
	ret

StartTrainerBattle_NextScene: ; 8c39c (23:439c)
	ld hl, wJumptableIndex
	inc [hl]
	ret

StartTrainerBattle_SetUpBGMap: ; 8c3a1 (23:43a1)
	call StartTrainerBattle_NextScene
	xor a
	ld [wcf64], a
	ld [hBGMapMode], a
	ret

StartTrainerBattle_Flash: ; 8c3ab (23:43ab)
	call .DoFlashAnimation
	ret nc
	call StartTrainerBattle_NextScene
	ret

.DoFlashAnimation: ; 8c3b3 (23:43b3)
	ld a, [wTimeOfDayPalset]
	cp %11111111 ; dark cave
	jr z, .done
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	srl a
	ld e, a
	ld d, 0
	ld hl, .pals
	add hl, de
	ld a, [hl]
	cp %00000001
	jr z, .done
	ld [wBGP], a
	call DmgToCgbBGPals
	and a
	ret

.done
	xor a
	ld [wcf64], a
	scf
	ret
; 8c3db (23:43db)

.pals ; 8c3db
	db %11111001 ; 3321
	db %11111110 ; 3332
	db %11111111 ; 3333
	db %11111110 ; 3332
	db %11111001 ; 3321
	db %11100100 ; 3210
	db %10010000 ; 2100
	db %01000000 ; 1000
	db %00000000 ; 0000
	db %01000000 ; 1000
	db %10010000 ; 2100
	db %11100100 ; 3210
	db %00000001 ; 0001
; 8c3e8

StartTrainerBattle_SetUpForWavyOutro: ; 8c3e8 (23:43e8)
	callba Function5602
	ld a, $5 ; BANK(LYOverrides)
	ld [rSVBK], a

	call StartTrainerBattle_NextScene

	ld a, rSCX - $ff00
	ld [hLCDCPointer], a
	xor a
	ld [hLYOverrideStart], a
	ld a, $90
	ld [hLYOverrideEnd], a
	xor a
	ld [wcf64], a
	ld [wcf65], a
	ret

StartTrainerBattle_SineWave: ; 8c408 (23:4408)
	ld a, [wcf64]
	cp $60
	jr nc, .end
	call .DoSineWave
	ret

.end
	ld a, $20
	ld [wJumptableIndex], a
	ret

.DoSineWave: ; 8c419 (23:4419)
	ld hl, wcf65
	ld a, [hl]
	inc [hl]
	ld hl, wcf64
	ld d, [hl]
	add [hl]
	ld [hl], a
	ld a, LYOverridesEnd - LYOverrides
	ld bc, LYOverrides
	ld e, $0

.loop
	push af
	push de
	ld a, e
	call StartTrainerBattle_DrawSineWave
	ld [bc], a
	inc bc
	pop de
	ld a, e
	add $2
	ld e, a
	pop af
	dec a
	jr nz, .loop
	ret

StartTrainerBattle_SetUpForSpinOutro: ; 8c43d (23:443d)
	callba Function5602
	ld a, $5 ; BANK(LYOverrides)
	ld [rSVBK], a
	call StartTrainerBattle_NextScene
	xor a
	ld [wcf64], a
	ret

spintable_entry: MACRO
	db \1
	dw .wedge\2
	dwcoord \3, \4
ENDM

; quadrants
	const_def
	const UPPER_LEFT
	const UPPER_RIGHT
	const LOWER_LEFT
	const LOWER_RIGHT

StartTrainerBattle_SpinToBlack: ; 8c44f (23:444f)
	xor a
	ld [hBGMapMode], a
	ld a, [wcf64]
	ld e, a
	ld d, 0
	ld hl, .spintable
rept 5
	add hl, de
endr
	ld a, [hli]
	cp -1
	jr z, .end
	ld [wcf65], a
	call .load
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ld hl, wcf64
	inc [hl]
	ret

.end
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld a, $20
	ld [wJumptableIndex], a
	ret
; 8c490 (23:4490)

.spintable ; 8c490
	spintable_entry UPPER_LEFT,  1,  1,  6
	spintable_entry UPPER_LEFT,  2,  0,  3
	spintable_entry UPPER_LEFT,  3,  1,  0
	spintable_entry UPPER_LEFT,  4,  5,  0
	spintable_entry UPPER_LEFT,  5,  9,  0
	spintable_entry UPPER_RIGHT, 5, 10,  0
	spintable_entry UPPER_RIGHT, 4, 14,  0
	spintable_entry UPPER_RIGHT, 3, 18,  0
	spintable_entry UPPER_RIGHT, 2, 19,  3
	spintable_entry UPPER_RIGHT, 1, 18,  6
	spintable_entry LOWER_RIGHT, 1, 18, 11
	spintable_entry LOWER_RIGHT, 2, 19, 14
	spintable_entry LOWER_RIGHT, 3, 18, 17
	spintable_entry LOWER_RIGHT, 4, 14, 17
	spintable_entry LOWER_RIGHT, 5, 10, 17
	spintable_entry LOWER_LEFT,  5,  9, 17
	spintable_entry LOWER_LEFT,  4,  5, 17
	spintable_entry LOWER_LEFT,  3,  1, 17
	spintable_entry LOWER_LEFT,  2,  0, 14
	spintable_entry LOWER_LEFT,  1,  1, 11
	db -1
; 8c4f5

.load ; 8c4f5 (23:44f5)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	push hl
	ld a, [de]
	ld c, a
	inc de
.loop1
	ld [hl], $ff
	ld a, [wcf65]
	bit 0, a
	jr z, .leftside
	inc hl
	jr .okay1
.leftside
	dec hl
.okay1
	dec c
	jr nz, .loop1
	pop hl
	ld a, [wcf65]
	bit 1, a
	ld bc, SCREEN_WIDTH
	jr z, .upper
	ld bc, -SCREEN_WIDTH
.upper
	add hl, bc
	ld a, [de]
	inc de
	cp -1
	ret z
	and a
	jr z, .loop
	ld c, a
.loop2
	ld a, [wcf65]
	bit 0, a
	jr z, .leftside2
	dec hl
	jr .okay2
.leftside2
	inc hl
.okay2
	dec c
	jr nz, .loop2
	jr .loop
; 8c538 (23:4538)

.wedge1 db 2, 3, 5, 4, 9, -1
.wedge2 db 1, 1, 2, 2, 4, 2, 4, 2, 3, -1
.wedge3 db 2, 1, 3, 1, 4, 1, 4, 1, 4, 1, 3, 1, 2, 1, 1, 1, 1, -1
.wedge4 db 4, 1, 4, 0, 3, 1, 3, 0, 2, 1, 2, 0, 1, -1
.wedge5 db 4, 0, 3, 0, 3, 0, 2, 0, 2, 0, 1, 0, 1, 0, 1, -1
; 8c578

StartTrainerBattle_SetUpForRandomScatterOutro: ; 8c578 (23:4578)
	callba Function5602
	ld a, $5 ; BANK(LYOverrides)
	ld [rSVBK], a
	call StartTrainerBattle_NextScene
	ld a, $10
	ld [wcf64], a
	ld a, $1
	ld [hBGMapMode], a
	ret

StartTrainerBattle_SpeckleToBlack: ; 8c58f (23:458f)
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld c, $c
.loop
	push bc
	call .BlackOutRandomTile
	pop bc
	dec c
	jr nz, .loop
	ret

.done
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld a, $20
	ld [wJumptableIndex], a
	ret

.BlackOutRandomTile: ; 8c5b8 (23:45b8)
.y_loop
	call Random
	cp SCREEN_HEIGHT
	jr nc, .y_loop
	ld b, a

.x_loop
	call Random
	cp SCREEN_WIDTH
	jr nc, .x_loop
	ld c, a

	hlcoord 0, -1
	ld de, SCREEN_WIDTH
	inc b

.row_loop
	add hl, de
	dec b
	jr nz, .row_loop
	add hl, bc

; If the tile has already been blacked out,
; sample a new tile
	ld a, [hl]
	cp $ff
	jr z, .y_loop
	ld [hl], $ff
	ret

StartTrainerBattle_LoadPokeBallGraphics: ; 8c5dc (23:45dc)
	ld a, [OtherTrainerClass]
	and a
	jp z, .nextscene ; don't need to be here if wild

	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	inc b
	inc c
	jr .enter_loop_midway

.loop
; set all pals to 7
	ld a, [hl]
	or %00000111
	ld [hli], a
.enter_loop_midway
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	call .loadpokeballgfx ; ld a, [OtherTrainerClass] \ ld de, PokeBallTransition \ ret
	hlcoord 2, 1

	ld b, SCREEN_WIDTH - 4
.loop2
	push hl
	ld c, 2
.loop3
	push hl
	ld a, [de]
	inc de
.loop4
; Loading is done bit by bit
	and a
	jr z, .done
	sla a
	jr nc, .no_load
	ld [hl], $fe
.no_load
	inc hl
	jr .loop4

.done
	pop hl
	push bc
	ld bc, (SCREEN_WIDTH - 4) / 2
	add hl, bc
	pop bc
	dec c
	jr nz, .loop3

	pop hl
	push bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop2

	ld a, [hCGB]
	and a
	jr nz, .cgb
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	jr .nextscene

.cgb
	ld hl, .daypals
	ld a, [TimeOfDayPal]
	and (1 << 2) - 1
	cp 3
	jr nz, .daytime
	ld hl, .nightpals
.daytime
	ld a, [rSVBK]
	push af
	ld a, $5 ; WRAM5 = palettes
	ld [rSVBK], a
	call .copypals
	push hl
	ld de, UnknBGPals + 7 palettes
	ld bc, 1 palettes
	call CopyBytes
	pop hl
	ld de, BGPals + 7 palettes
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	call DelayFrame
	call BattleStart_LoadEDTile

.nextscene ; 8c673 (23:4673)
	call StartTrainerBattle_NextScene
	ret

.copypals ; 8c677 (23:4677)
	ld de, UnknBGPals + 7 palettes
	call .copy
	ld de, BGPals + 7 palettes
	call .copy
	ld de, UnknOBPals + 6 palettes
	call .copy
	ld de, OBPals + 6 palettes
	call .copy
	ld de, UnknOBPals + 7 palettes
	call .copy
	ld de, OBPals + 7 palettes

.copy ; 8c698 (23:4698)
	push hl
	ld bc, 1 palettes
	call CopyBytes
	pop hl
	ret
; 8c6a1 (23:46a1)

.daypals ; 8c6a1
	RGB 31, 18, 29
	RGB 31, 11, 15
	RGB 31, 05, 05
	RGB 07, 07, 07
; 8c6a9

.nightpals ; 8c6a9
	RGB 31, 18, 29
	RGB 31, 05, 05
	RGB 31, 05, 05
	RGB 31, 05, 05

.loadpokeballgfx
	ld a, [OtherTrainerClass]
	ld de, PokeBallTransition
	ret

PokeBallTransition:
	db %00000011, %11000000
	db %00001111, %11110000
	db %00111100, %00111100
	db %00110000, %00001100
	db %01100000, %00000110
	db %01100011, %11000110
	db %11000110, %01100011
	db %11111100, %00111111
	db %11111100, %00111111
	db %11000110, %01100011
	db %01100011, %11000110
	db %01100000, %00000110
	db %00110000, %00001100
	db %00111100, %00111100
	db %00001111, %11110000
	db %00000011, %11000000

WipeLYOverrides: ; 8c6d8
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, LYOverrides
	call .wipe
	ld hl, LYOverridesBackup
	call .wipe

	pop af
	ld [rSVBK], a
	ret
; 8c6ef

.wipe ; 8c6ef
	xor a
	ld c, SCREEN_HEIGHT_PX
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 8c6f7


StartTrainerBattle_DrawSineWave: ; 8c6f7 (23:46f7)
	and (1 << 6) - 1
	cp 1 << 5
	jr nc, .okay
	call .DoSineWave
	ld a, h
	ret

.okay
	and (1 << 5) - 1
	call .DoSineWave
	ld a, h
	xor -1 ; cpl
	inc a
	ret

.DoSineWave: ; 8c70c (23:470c)
	ld e, a
	ld a, d
	ld d, 0
	ld hl, .sinewave
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0
.loop
	srl a
	jr nc, .skip
	add hl, de
.skip
	sla e
	rl d
	and a
	jr nz, .loop
	ret
; 8c728 (23:4728)

.sinewave ; 8c728
	sine_wave $100
; 8c768

zoombox: macro
; width, height, start y, start x
	db \1, \2
	dwcoord \3, \4
endm

StartTrainerBattle_ZoomToBlack: ; 8c768 (23:4768)
	callba Function5602
	ld de, .boxes

.loop
	ld a, [de]
	cp -1
	jr z, .done
	inc de
	ld c, a
	ld a, [de]
	inc de
	ld b, a
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	xor a
	ld [hBGMapMode], a
	call .Copy
	call WaitBGMap
	jr .loop

.done
	ld a, $20
	ld [wJumptableIndex], a
	ret
; 8c792 (23:4792)

.boxes ; 8c792
	zoombox  4,  2,  8, 8
	zoombox  6,  4,  7, 7
	zoombox  8,  6,  6, 6
	zoombox 10,  8,  5, 5
	zoombox 12, 10,  4, 4
	zoombox 14, 12,  3, 3
	zoombox 16, 14,  2, 2
	zoombox 18, 16,  1, 1
	zoombox 20, 18,  0, 0
	db -1
; 8c7b7

.Copy: ; 8c7b7 (23:47b7)
	ld a, $ff
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; 8c7c9 (23:47c9)
