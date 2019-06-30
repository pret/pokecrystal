; BattleTransitionJumptable.Jumptable indexes
BATTLETRANSITION_CAVE             EQU $01
BATTLETRANSITION_CAVE_STRONGER    EQU $09
BATTLETRANSITION_NO_CAVE          EQU $10
BATTLETRANSITION_NO_CAVE_STRONGER EQU $18
BATTLETRANSITION_FINISH           EQU $20
BATTLETRANSITION_END              EQU $80

BATTLETRANSITION_SQUARE EQU "8" ; $fe
BATTLETRANSITION_BLACK  EQU "9" ; $ff

DoBattleTransition:
	call .InitGFX
	ldh a, [rBGP]
	ld [wBGP], a
	ldh a, [rOBP0]
	ld [wOBP0], a
	ldh a, [rOBP1]
	ld [wOBP1], a
	call DelayFrame
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $1

.loop
	ld a, [wJumptableIndex]
	bit 7, a ; BATTLETRANSITION_END?
	jr nz, .done
	call BattleTransitionJumptable
	call DelayFrame
	jr .loop

.done
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, wBGPals1
	ld bc, 8 palettes
	xor a
	call ByteFill

	pop af
	ldh [rSVBK], a

	ld a, %11111111
	ld [wBGP], a
	call DmgToCgbBGPals
	call DelayFrame
	xor a
	ldh [hLCDCPointer], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	ldh [hSCY], a

	ld a, 1 ; unnecessary bankswitch?
	ldh [rSVBK], a
	pop af
	ldh [hVBlank], a
	call DelayFrame
	ret

.InitGFX:
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr z, .mobile
	farcall ReanchorBGMap_NoOAMUpdate
	call UpdateSprites
	call DelayFrame
	call .NonMobile_LoadPokeballTiles
	call BattleStart_CopyTilemapAtOnce
	jr .resume

.mobile
	call LoadTrainerBattlePokeballTiles

.resume
	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ld hl, wJumptableIndex
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	call WipeLYOverrides
	ret

.NonMobile_LoadPokeballTiles:
	call LoadTrainerBattlePokeballTiles
	hlbgcoord 0, 0
	call ConvertTrainerBattlePokeballTilesTo2bpp
	ret

LoadTrainerBattlePokeballTiles:
; Load the tiles used in the Pokeball Graphic that fills the screen
; at the start of every Trainer battle.
	ld de, TrainerBattlePokeballTiles
	ld hl, vTiles0 tile BATTLETRANSITION_SQUARE
	ld b, BANK(TrainerBattlePokeballTiles)
	ld c, 2
	call Request2bpp

	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a

	ld de, TrainerBattlePokeballTiles
	ld hl, vTiles3 tile BATTLETRANSITION_SQUARE
	ld b, BANK(TrainerBattlePokeballTiles)
	ld c, 2
	call Request2bpp

	pop af
	ldh [rVBK], a
	ret

ConvertTrainerBattlePokeballTilesTo2bpp:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a
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
	ld b, BANK(@)
	ld c, $28
	call Request2bpp
	pop af
	ldh [rSVBK], a
	ret

TrainerBattlePokeballTiles:
INCBIN "gfx/overworld/trainer_battle_pokeball_tiles.2bpp"

BattleTransitionJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable
	dw StartTrainerBattle_DetermineWhichAnimation ; 00

	; BATTLETRANSITION_CAVE
	dw StartTrainerBattle_LoadPokeBallGraphics ; 01
	dw StartTrainerBattle_SetUpBGMap ; 02
	dw StartTrainerBattle_Flash ; 03
	dw StartTrainerBattle_Flash ; 04
	dw StartTrainerBattle_Flash ; 05
	dw StartTrainerBattle_NextScene ; 06
	dw StartTrainerBattle_SetUpForWavyOutro ; 07
	dw StartTrainerBattle_SineWave ; 08

	; BATTLETRANSITION_CAVE_STRONGER
	dw StartTrainerBattle_LoadPokeBallGraphics ; 09
	dw StartTrainerBattle_SetUpBGMap ; 0a
	dw StartTrainerBattle_Flash ; 0b
	dw StartTrainerBattle_Flash ; 0c
	dw StartTrainerBattle_Flash ; 0d
	dw StartTrainerBattle_NextScene ; 0e
	; There is no setup for this one
	dw StartTrainerBattle_ZoomToBlack ; 0f

	; BATTLETRANSITION_NO_CAVE
	dw StartTrainerBattle_LoadPokeBallGraphics ; 10
	dw StartTrainerBattle_SetUpBGMap ; 11
	dw StartTrainerBattle_Flash ; 12
	dw StartTrainerBattle_Flash ; 13
	dw StartTrainerBattle_Flash ; 14
	dw StartTrainerBattle_NextScene ; 15
	dw StartTrainerBattle_SetUpForSpinOutro ; 16
	dw StartTrainerBattle_SpinToBlack ; 17

	; BATTLETRANSITION_NO_CAVE_STRONGER
	dw StartTrainerBattle_LoadPokeBallGraphics ; 18
	dw StartTrainerBattle_SetUpBGMap ; 19
	dw StartTrainerBattle_Flash ; 1a
	dw StartTrainerBattle_Flash ; 1b
	dw StartTrainerBattle_Flash ; 1c
	dw StartTrainerBattle_NextScene ; 1d
	dw StartTrainerBattle_SetUpForRandomScatterOutro ; 1e
	dw StartTrainerBattle_SpeckleToBlack ; 1f

	; BATTLETRANSITION_FINISH
	dw StartTrainerBattle_Finish ; 20

; transition animations
	const_def
	const TRANS_CAVE
	const TRANS_CAVE_STRONGER
	const TRANS_NO_CAVE
	const TRANS_NO_CAVE_STRONGER

; transition animation bits
TRANS_STRONGER_F EQU 0 ; bit set in TRANS_CAVE_STRONGER and TRANS_NO_CAVE_STRONGER
TRANS_NO_CAVE_F EQU 1 ; bit set in TRANS_NO_CAVE and TRANS_NO_CAVE_STRONGER

StartTrainerBattle_DetermineWhichAnimation:
; The screen flashes a different number of times depending on the level of
; your lead Pokemon relative to the opponent's.
; BUG: wBattleMonLevel and wEnemyMonLevel are not set at this point, so whatever
; values happen to be there will determine the animation.
	ld de, 0
	ld a, [wBattleMonLevel]
	add 3
	ld hl, wEnemyMonLevel
	cp [hl]
	jr nc, .not_stronger
	set TRANS_STRONGER_F, e
.not_stronger
	ld a, [wEnvironment]
	cp CAVE
	jr z, .cave
	cp ENVIRONMENT_5
	jr z, .cave
	cp DUNGEON
	jr z, .cave
	set TRANS_NO_CAVE_F, e
.cave
	ld hl, .StartingPoints
	add hl, de
	ld a, [hl]
	ld [wJumptableIndex], a
	ret

.StartingPoints:
; entries correspond to TRANS_* constants
	db BATTLETRANSITION_CAVE
	db BATTLETRANSITION_CAVE_STRONGER
	db BATTLETRANSITION_NO_CAVE
	db BATTLETRANSITION_NO_CAVE_STRONGER

StartTrainerBattle_Finish:
	call ClearSprites
	ld a, BATTLETRANSITION_END
	ld [wJumptableIndex], a
	ret

StartTrainerBattle_NextScene:
	ld hl, wJumptableIndex
	inc [hl]
	ret

StartTrainerBattle_SetUpBGMap:
	call StartTrainerBattle_NextScene
	xor a
	ld [wcf64], a
	ldh [hBGMapMode], a
	ret

StartTrainerBattle_Flash:
	call .DoFlashAnimation
	ret nc
	call StartTrainerBattle_NextScene
	ret

.DoFlashAnimation:
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

.pals
	dc 3, 3, 2, 1
	dc 3, 3, 3, 2
	dc 3, 3, 3, 3
	dc 3, 3, 3, 2
	dc 3, 3, 2, 1
	dc 3, 2, 1, 0
	dc 2, 1, 0, 0
	dc 1, 0, 0, 0
	dc 0, 0, 0, 0
	dc 1, 0, 0, 0
	dc 2, 1, 0, 0
	dc 3, 2, 1, 0
	dc 0, 0, 0, 1

StartTrainerBattle_SetUpForWavyOutro:
	farcall Function5602
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

	call StartTrainerBattle_NextScene

	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	xor a
	ldh [hLYOverrideStart], a
	ld a, $90
	ldh [hLYOverrideEnd], a
	xor a
	ld [wcf64], a
	ld [wcf65], a
	ret

StartTrainerBattle_SineWave:
	ld a, [wcf64]
	cp $60
	jr nc, .end
	call .DoSineWave
	ret

.end
	ld a, BATTLETRANSITION_FINISH
	ld [wJumptableIndex], a
	ret

.DoSineWave:
	ld hl, wcf65
	ld a, [hl]
	inc [hl]
	ld hl, wcf64
	ld d, [hl]
	add [hl]
	ld [hl], a
	ld a, wLYOverridesEnd - wLYOverrides
	ld bc, wLYOverrides
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

StartTrainerBattle_SetUpForSpinOutro:
	farcall Function5602
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	call StartTrainerBattle_NextScene
	xor a
	ld [wcf64], a
	ret

StartTrainerBattle_SpinToBlack:
	xor a
	ldh [hBGMapMode], a
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
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ld hl, wcf64
	inc [hl]
	ret

.end
	ld a, $1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ld a, BATTLETRANSITION_FINISH
	ld [wJumptableIndex], a
	ret

; quadrants
	const_def
	const UPPER_LEFT
	const UPPER_RIGHT
	const LOWER_LEFT
	const LOWER_RIGHT

; quadrant bits
RIGHT_QUADRANT_F EQU 0 ; bit set in UPPER_RIGHT and LOWER_RIGHT
LOWER_QUADRANT_F EQU 1 ; bit set in LOWER_LEFT and LOWER_RIGHT

.spintable
spintable_entry: MACRO
	db \1
	dw .wedge\2
	dwcoord \3, \4
ENDM
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

.load
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
	ld [hl], BATTLETRANSITION_BLACK
	ld a, [wcf65]
	bit RIGHT_QUADRANT_F, a
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
	bit LOWER_QUADRANT_F, a
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
	bit RIGHT_QUADRANT_F, a
	jr z, .leftside2
	dec hl
	jr .okay2
.leftside2
	inc hl
.okay2
	dec c
	jr nz, .loop2
	jr .loop

.wedge1 db 2, 3, 5, 4, 9, -1
.wedge2 db 1, 1, 2, 2, 4, 2, 4, 2, 3, -1
.wedge3 db 2, 1, 3, 1, 4, 1, 4, 1, 4, 1, 3, 1, 2, 1, 1, 1, 1, -1
.wedge4 db 4, 1, 4, 0, 3, 1, 3, 0, 2, 1, 2, 0, 1, -1
.wedge5 db 4, 0, 3, 0, 3, 0, 2, 0, 2, 0, 1, 0, 1, 0, 1, -1

StartTrainerBattle_SetUpForRandomScatterOutro:
	farcall Function5602
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	call StartTrainerBattle_NextScene
	ld a, $10
	ld [wcf64], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

StartTrainerBattle_SpeckleToBlack:
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
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ld a, BATTLETRANSITION_FINISH
	ld [wJumptableIndex], a
	ret

.BlackOutRandomTile:
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
	cp BATTLETRANSITION_BLACK
	jr z, .y_loop
	ld [hl], BATTLETRANSITION_BLACK
	ret

StartTrainerBattle_LoadPokeBallGraphics:
	ld a, [wOtherTrainerClass]
	and a
	jp z, .nextscene ; don't need to be here if wild

	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0, wAttrMap
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

	call .loadpokeballgfx
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
	ld [hl], BATTLETRANSITION_SQUARE
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

	ldh a, [hCGB]
	and a
	jr nz, .cgb
	ld a, $1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	jr .nextscene

.cgb
	ld hl, .daypals
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	cp DARKNESS_F
	jr nz, .daytime
	ld hl, .nightpals
.daytime
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	call .copypals
	push hl
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld bc, 1 palettes
	call CopyBytes
	pop hl
	ld de, wBGPals2 palette PAL_BG_TEXT
	ld bc, 1 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	call DelayFrame
	call BattleStart_CopyTilemapAtOnce

.nextscene
	call StartTrainerBattle_NextScene
	ret

.copypals
	ld de, wBGPals1 palette PAL_BG_TEXT
	call .copy
	ld de, wBGPals2 palette PAL_BG_TEXT
	call .copy
	ld de, wOBPals1 palette PAL_OW_TREE
	call .copy
	ld de, wOBPals2 palette PAL_OW_TREE
	call .copy
	ld de, wOBPals1 palette PAL_OW_ROCK
	call .copy
	ld de, wOBPals2 palette PAL_OW_ROCK

.copy
	push hl
	ld bc, 1 palettes
	call CopyBytes
	pop hl
	ret

.daypals
INCLUDE "gfx/overworld/trainer_battle_day.pal"

.nightpals
INCLUDE "gfx/overworld/trainer_battle_nite.pal"

.loadpokeballgfx
	ld a, [wOtherTrainerClass]
	ld de, PokeBallTransition
	ret

PokeBallTransition:
; 16x16 overlay of a Poke Ball
pusho
opt b.X ; . = 0, X = 1
	bigdw %......XXXX......
	bigdw %....XXXXXXXX....
	bigdw %..XXXX....XXXX..
	bigdw %..XX........XX..
	bigdw %.XX..........XX.
	bigdw %.XX...XXXX...XX.
	bigdw %XX...XX..XX...XX
	bigdw %XXXXXX....XXXXXX
	bigdw %XXXXXX....XXXXXX
	bigdw %XX...XX..XX...XX
	bigdw %.XX...XXXX...XX.
	bigdw %.XX..........XX.
	bigdw %..XX........XX..
	bigdw %..XXXX....XXXX..
	bigdw %....XXXXXXXX....
	bigdw %......XXXX......
popo

WipeLYOverrides:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

	ld hl, wLYOverrides
	call .wipe
	ld hl, wLYOverridesBackup
	call .wipe

	pop af
	ldh [rSVBK], a
	ret

.wipe
	xor a
	ld c, SCREEN_HEIGHT_PX
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

StartTrainerBattle_DrawSineWave:
	calc_sine_wave

StartTrainerBattle_ZoomToBlack:
	farcall Function5602
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
	ldh [hBGMapMode], a
	call .Copy
	call WaitBGMap
	jr .loop

.done
	ld a, BATTLETRANSITION_FINISH
	ld [wJumptableIndex], a
	ret

.boxes
zoombox: MACRO
; width, height, start y, start x
	db \1, \2
	dwcoord \3, \4
ENDM
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

.Copy:
	ld a, BATTLETRANSITION_BLACK
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

Unreferenced_Function8c7c9:
	ld a, $1
	ldh [hBGMapMode], a
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a
	ret
