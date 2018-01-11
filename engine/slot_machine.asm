SLOTS_NO_BIAS  EQU -1
SLOTS_NO_MATCH EQU -1

SLOTS_SEVEN    EQU $00
SLOTS_POKEBALL EQU $04
SLOTS_CHERRY   EQU $08
SLOTS_PIKACHU  EQU $0c
SLOTS_SQUIRTLE EQU $10
SLOTS_STARYU   EQU $14

REEL_SIZE EQU 15

; Constants for slot_reel offsets (see macros/wram.asm)
REEL_ACTION        EQUS "(wReel1ReelAction - wReel1)"
REEL_TILEMAP_ADDR  EQUS "(wReel1TilemapAddr - wReel1)"
REEL_POSITION      EQUS "(wReel1Position - wReel1)"
REEL_SPIN_DISTANCE EQUS "(wReel1SpinDistance - wReel1)"
REEL_SPIN_RATE     EQUS "(wReel1SpinRate - wReel1)"
REEL_OAM_ADDR      EQUS "(wReel1OAMAddr - wReel1)"
REEL_X_COORD       EQUS "(wReel1XCoord - wReel1)"
REEL_MANIP_COUNTER EQUS "(wReel1ManipCounter - wReel1)"
REEL_MANIP_DELAY   EQUS "(wReel1ManipDelay - wReel1)"
REEL_FIELD_0B      EQUS "(wReel1Field0b - wReel1)"
REEL_STOP_DELAY    EQUS "(wReel1StopDelay - wReel1)"

; SlotsJumptable constants
	const_def
	const SLOTS_INIT
	const SLOTS_BET_AND_START
	const SLOTS_WAIT_START
	const SLOTS_WAIT_REEL1
	const SLOTS_WAIT_STOP_REEL1
	const SLOTS_WAIT_REEL2
	const SLOTS_WAIT_STOP_REEL2
	const SLOTS_WAIT_REEL3
	const SLOTS_WAIT_STOP_REEL3
	const SLOTS_NEXT_09
	const SLOTS_NEXT_0A
	const SLOTS_NEXT_0B
	const SLOTS_FLASH_IF_WIN
	const SLOTS_FLASH_SCREEN
	const SLOTS_GIVE_EARNED_COINS
	const SLOTS_PAYOUT_TEXT_AND_ANIM
	const SLOTS_PAYOUT_ANIM
	const SLOTS_RESTART_OF_QUIT
	const SLOTS_QUIT
SLOTS_END_LOOP_F EQU 7

; ReelActionJumptable constants
	const_def
	const REEL_ACTION_DO_NOTHING
	const REEL_ACTION_STOP_REEL_IGNORE_JOYPAD
	const REEL_ACTION_QUADRUPLE_RATE
	const REEL_ACTION_DOUBLE_RATE
	const REEL_ACTION_NORMAL_RATE
	const REEL_ACTION_HALF_RATE
	const REEL_ACTION_QUARTER_RATE
	const REEL_ACTION_STOP_REEL1
	const REEL_ACTION_STOP_REEL2
	const REEL_ACTION_STOP_REEL3
	const REEL_ACTION_SET_UP_REEL2_SKIP_TO_7
	const REEL_ACTION_WAIT_REEL2_SKIP_TO_7
	const REEL_ACTION_FAST_SPIN_REEL2_UNTIL_LINED_UP_7S
	const REEL_ACTION_UNUSED
	const REEL_ACTION_CHECK_DROP_REEL
	const REEL_ACTION_WAIT_DROP_REEL
	const REEL_ACTION_START_SLOW_ADVANCE_REEL3
	const REEL_ACTION_WAIT_SLOW_ADVANCE_REEL3
	const REEL_ACTION_INIT_GOLEM
	const REEL_ACTION_WAIT_GOLEM
	const REEL_ACTION_END_GOLEM
	const REEL_ACTION_INIT_CHANSEY
	const REEL_ACTION_WAIT_CHANSEY
	const REEL_ACTION_WAIT_EGG
	const REEL_ACTION_DROP_REEL

_SlotMachine:
	ld hl, Options
	set NO_TEXT_SCROLL, [hl]
	call .InitGFX
	call DelayFrame
.loop
	call SlotsLoop
	jr nc, .loop
	call WaitSFX
	ld de, SFX_QUIT_SLOTS
	call PlaySFX
	call WaitSFX
	call ClearBGPalettes
	farcall TrainerRankings_EndSlotsWinStreak
	ld hl, Options
	res NO_TEXT_SCROLL, [hl]
	ld hl, rLCDC
	res rLCDC_SPRITE_SIZE, [hl] ; 8x8
	ret

.InitGFX: ; 926f7 (24:66f7)
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call DisableLCD
	hlbgcoord 0, 0
	ld bc, vBGMap1 - vBGMap0
	ld a, " "
	call ByteFill
	ld b, SCGB_SLOT_MACHINE
	call GetSGBLayout
	callfar ClearSpriteAnims
	ld hl, wSlots
	ld bc, wSlotsDataEnd - wSlots
	xor a
	call ByteFill

	ld hl, Slots2LZ
	ld de, vTiles0 tile $00
	call Decompress

	ld hl, Slots3LZ
	ld de, vTiles0 tile $40
	call Decompress

	ld hl, Slots1LZ
	ld de, vTiles2 tile $00
	call Decompress

	ld hl, Slots2LZ
	ld de, vTiles2 tile $25
	call Decompress

	ld hl, SlotsTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * 12
	call CopyBytes

	ld hl, rLCDC
	set rLCDC_SPRITE_SIZE, [hl] ; 8x16
	call EnableLCD
	ld hl, wSlots
	ld bc, wSlotsEnd - wSlots
	xor a
	call ByteFill
	call Slots_InitReelTiles
	call Slots_GetPals
	ld a, $7
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $40
	xor a ; SLOTS_INIT
	ld [wJumptableIndex], a
	ld a, SLOTS_NO_BIAS
	ld [wSlotBias], a
	ld de, MUSIC_GAME_CORNER
	call PlayMusic
	xor a
	ld [wKeepSevenBiasChance], a ; 87.5% chance
	call Random
	and %00101010
	ret nz
	ld a, 1
	ld [wKeepSevenBiasChance], a ; 12.5% chance
	ret

Slots_GetPals: ; 9279b (24:679b)
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	ld a, [hCGB]
	and a
	jr nz, .cgb
	lb de, %11000000, %11100100
.cgb
	call DmgToCgbObjPals
	ret

SlotsLoop: ; 927af (24:67af)
	ld a, [wJumptableIndex]
	bit SLOTS_END_LOOP_F, a
	jr nz, .stop
	call SlotsJumptable
	call Slots_SpinReels
	xor a
	ld [wCurrSpriteOAMAddr], a
	callfar DoNextFrameForFirst16Sprites
	call .PrintCoinsAndPayout
	call .DummyFunc
	call DelayFrame
	and a
	ret

.stop
	scf
	ret

.DummyFunc: ; 927d3 (24:67d3)
; dummied out
	ret
	ld a, [wReel1ReelAction]
	and a
	ret nz
	ld a, [wReel2ReelAction]
	and a
	ret nz
	ld a, [wFirstTwoReelsMatchingSevens]
	and a
	jr nz, .matching_sevens
	ld a, %11100100
	call DmgToCgbBGPals
	ret

.matching_sevens
	ld a, [TextDelayFrames]
	and $7
	ret nz
	ld a, [rBGP]
	xor %00001100
	call DmgToCgbBGPals
	ret

; 927f8

.PrintCoinsAndPayout: ; 927f8 (24:67f8)
	hlcoord 5, 1
	ld de, Coins
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	hlcoord 11, 1
	ld de, wPayout
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	ret

; 92811 (24:6811)

Function92811: ; 92811
; unreferenced - debug function?
	ld a, [wSlotBias]
	add 0
	daa
	ld e, a
	and $f
	add "0"
	hlcoord 1, 0
	ld [hl], a
	ld a, e
	swap a
	and $f
	add "0"
	hlcoord 0, 0
	ld [hl], a
	ret

; 9282c

Function9282c: ; 9282c
; unreferenced
; animate OAM tiles?
	ld hl, wcf66
	ld a, [hl]
	inc [hl]
	and $7
	ret nz
	ld hl, Sprite17TileID
	ld c, NUM_SPRITE_OAM_STRUCTS - 16
.loop
	ld a, [hl]
	xor %00100000
	ld [hli], a ; tile id
rept SPRITEOAMSTRUCT_LENGTH +- 1
	inc hl
endr
	dec c
	jr nz, .loop
	ret

; 92844

SlotsJumptable: ; 92844 (24:6844)
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	dw SlotsAction_Init              ; 00
	dw SlotsAction_BetAndStart       ; 01
	dw SlotsAction_WaitStart         ; 02
	dw SlotsAction_WaitReel1         ; 03
	dw SlotsAction_WaitStopReel1     ; 04
	dw SlotsAction_WaitReel2         ; 05
	dw SlotsAction_WaitStopReel2     ; 06
	dw SlotsAction_WaitReel3         ; 07
	dw SlotsAction_WaitStopReel3     ; 08
	dw SlotsAction_Next              ; 09
	dw SlotsAction_Next              ; 0a
	dw SlotsAction_Next              ; 0b
	dw SlotsAction_FlashIfWin        ; 0c
	dw SlotsAction_FlashScreen       ; 0d
	dw SlotsAction_GiveEarnedCoins   ; 0e
	dw SlotsAction_PayoutTextAndAnim ; 0f
	dw SlotsAction_PayoutAnim        ; 10
	dw SlotsAction_RestartOrQuit     ; 11
	dw SlotsAction_Quit              ; 12

SlotsAction_Next: ; 92879 (24:6879)
	ld hl, wJumptableIndex
	inc [hl]
	ret

SlotsAction_Init: ; 9287e (24:687e)
	call SlotsAction_Next
	xor a
	ld [wFirstTwoReelsMatching], a
	ld [wFirstTwoReelsMatchingSevens], a
	ld a, SLOTS_NO_MATCH
	ld [wSlotMatched], a
	ret

SlotsAction_BetAndStart: ; 9288e (24:688e)
	call Slots_AskBet
	jr nc, .proceed
	ld a, SLOTS_QUIT
	ld [wJumptableIndex], a
	ret

.proceed
	call SlotsAction_Next
	call Slots_IlluminateBetLights
	call Slots_InitBias
	ld a, 32
	ld [wSlotsDelay], a
	ld a, REEL_ACTION_NORMAL_RATE
	ld [wReel1ReelAction], a
	ld [wReel2ReelAction], a
	ld [wReel3ReelAction], a
	ld a, 4
	ld [wReel1ManipCounter], a
	ld [wReel2ManipCounter], a
	ld [wReel3ManipCounter], a
	call WaitSFX
	ld a, SFX_SLOT_MACHINE_START
	call Slots_PlaySFX
	ret

SlotsAction_WaitStart: ; 928c6 (24:68c6)
	ld hl, wSlotsDelay
	ld a, [hl]
	and a
	jr z, .proceed
	dec [hl]
	ret

.proceed
	call SlotsAction_Next
	xor a
	ld [hJoypadSum], a
	ret

SlotsAction_WaitReel1: ; 928d6 (24:68d6)
	ld hl, hJoypadSum
	ld a, [hl]
	and A_BUTTON
	ret z
	call SlotsAction_Next
	call Slots_StopReel1
	ld [wReel1ReelAction], a
SlotsAction_WaitStopReel1: ; 928e6 (24:68e6)
	ld a, [wReel1ReelAction]
	cp REEL_ACTION_DO_NOTHING
	ret nz
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld bc, wReel1
	ld de, wReel1Stopped
	call Slots_LoadReelState
	call SlotsAction_Next
	xor a
	ld [hJoypadSum], a
SlotsAction_WaitReel2: ; 92900 (24:6900)
	ld hl, hJoypadSum
	ld a, [hl]
	and A_BUTTON
	ret z
	call SlotsAction_Next
	call Slots_StopReel2
	ld [wReel2ReelAction], a
SlotsAction_WaitStopReel2: ; 92910 (24:6910)
	ld a, [wReel2ReelAction]
	cp REEL_ACTION_DO_NOTHING
	ret nz
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld bc, wReel2
	ld de, wReel2Stopped
	call Slots_LoadReelState
	call SlotsAction_Next
	xor a
	ld [hJoypadSum], a
SlotsAction_WaitReel3: ; 9292a (24:692a)
	ld hl, hJoypadSum
	ld a, [hl]
	and A_BUTTON
	ret z
	call SlotsAction_Next
	call Slots_StopReel3
	ld [wReel3ReelAction], a
SlotsAction_WaitStopReel3: ; 9293a (24:693a)
	ld a, [wReel3ReelAction]
	cp REEL_ACTION_DO_NOTHING
	ret nz
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld bc, wReel3
	ld de, wReel3Stopped
	call Slots_LoadReelState
	call SlotsAction_Next
	xor a
	ld [hJoypadSum], a
	ret

SlotsAction_FlashIfWin: ; 92955 (24:6955)
	ld a, [wSlotMatched]
	cp SLOTS_NO_MATCH
	jr nz, .GotIt
	call SlotsAction_Next
	call SlotsAction_Next
	ret

.GotIt:
	call SlotsAction_Next
	ld a, 16
	ld [wSlotsDelay], a
SlotsAction_FlashScreen: ; 9296b (24:696b)
	ld hl, wSlotsDelay
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	srl a
	ret z

	ld a, [rOBP0]
	xor $ff
	ld e, a
	ld d, a
	call DmgToCgbObjPals
	ret

.done
	call Slots_GetPals
	call SlotsAction_Next
	ret

SlotsAction_GiveEarnedCoins: ; 92987 (24:6987)
	xor a
	ld [wFirstTwoReelsMatching], a
	ld [wFirstTwoReelsMatchingSevens], a
	ld a, %11100100
	call DmgToCgbBGPals
	call Slots_GetPayout
	xor a
	ld [wSlotsDelay], a
	call SlotsAction_Next
	ret

SlotsAction_PayoutTextAndAnim: ; 9299e (24:699e)
	call Slots_PayoutText
	call SlotsAction_Next
SlotsAction_PayoutAnim: ; 929a4 (24:69a4)
	ld hl, wSlotsDelay
	ld a, [hl]
	inc [hl]
	and $1
	ret z
	ld hl, wPayout
	ld a, [hli]
	ld d, a
	or [hl]
	jr z, .done
	ld e, [hl]
	dec de
	ld [hl], e
	dec hl
	ld [hl], d
	ld hl, Coins
	ld d, [hl]
	inc hl
	ld e, [hl]
	call Slots_CheckCoinCaseFull
	jr c, .okay
	inc de
.okay
	ld [hl], e
	dec hl
	ld [hl], d
	ld a, [wSlotsDelay]
	and $7
	ret z ; ret nz would be more appropriate
	ld de, SFX_GET_COIN_FROM_SLOTS
	call PlaySFX
	ret

.done
	call SlotsAction_Next
	ret

SlotsAction_RestartOrQuit: ; 929d9 (24:69d9)
	call Slots_DeilluminateBetLights
	call WaitPressAorB_BlinkCursor
	call Slots_AskPlayAgain
	jr c, .exit_slots
	ld a, SLOTS_INIT
	ld [wJumptableIndex], a
	ret

.exit_slots
	ld a, SLOTS_QUIT
	ld [wJumptableIndex], a
	ret

SlotsAction_Quit: ; 929f0 (24:69f0)
	ld hl, wJumptableIndex
	set SLOTS_END_LOOP_F, [hl]
	ret

Slots_LoadReelState: ; 929f6 (24:69f6)
	push de
	call Slots_GetCurrentReelState
	pop de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret

Slots_CheckCoinCaseFull: ; 92a04 (24:6a04)
	ld a, d
	cp HIGH(MAX_COINS)
	jr c, .not_full
	ld a, e
	cp LOW(MAX_COINS)
	jr c, .not_full
	scf
	ret

.not_full
	and a
	ret

Slots_GetCurrentReelState: ; 92a12 (24:6a12)
	ld hl, REEL_POSITION
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .okay
	ld a, $f
.okay
	dec a
	and $f
	ld e, a
	ld d, $0
	ld hl, REEL_TILEMAP_ADDR
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ret

Slots_StopReel1: ; 92a2b (24:6a2b)
; Always set the REEL_ACTION_STOP_REEL1 action.
	ld a, REEL_ACTION_STOP_REEL1
	ret

Slots_StopReel2: ; 92a2e (24:6a2e)
; As long as, the following three meet, there's a 31.25% chance
; to set action REEL_ACTION_SET_UP_REEL2_SKIP_TO_7:
; - Bet is >= 2 coins
; - There's a 7 symbol visible in reel #1
; - Current spin isn't biased or is biased towards SEVEN
; In any other case, REEL_ACTION_STOP_REEL2 is set.

	ld a, [wSlotBet]
	cp $2
	jr c, .dont_jump
	ld a, [wSlotBias]
	and a
	jr z, .skip
	cp SLOTS_NO_BIAS
	jr nz, .dont_jump
.skip
	call .CheckReel1ForASeven
	jr nz, .dont_jump
	call Random
	cp $50 ; 32%
	jr nc, .dont_jump
	ld a, REEL_ACTION_SET_UP_REEL2_SKIP_TO_7
	ret

.dont_jump
	ld a, REEL_ACTION_STOP_REEL2
	ret

.CheckReel1ForASeven: ; 92a51 (24:6a51)
	ld a, [wReel1Stopped]
	and a
	ret z
	ld a, [wReel1Stopped + 1]
	and a
	ret z
	ld a, [wReel1Stopped + 2]
	and a
	ret

Slots_StopReel3: ; 92a60 (24:6a60)
; If no matching SEVEN symbols in reels #1 and #2:
; - REEL_ACTION_STOP_REEL3, 100%

; If matching SEVEN symbols and NO bias to SEVEN:
; - REEL_ACTION_STOP_REEL3, 37.5%
; - REEL_ACTION_START_SLOW_ADVANCE_REEL3, 31.3%
; - REEL_ACTION_INIT_GOLEM, 31.3%
; - REEL_ACTION_INIT_CHANSEY, 0%

; If matching SEVEN symbols and bias to SEVEN:
; - REEL_ACTION_STOP_REEL3, 29.7%
; - REEL_ACTION_START_SLOW_ADVANCE_REEL3, 23.4%
; - REEL_ACTION_INIT_GOLEM, 23.4%
; - REEL_ACTION_INIT_CHANSEY, 23.4%

	ld a, [wFirstTwoReelsMatching]
	and a
	jr z, .stop
	ld a, [wFirstTwoReelsMatchingSevens]
	and a
	jr z, .stop
	ld a, [wSlotBias]
	and a
	jr nz, .biased
	call Random
	cp 180
	jr nc, .stop
	cp 120
	jr nc, .slow_advance
	cp 60
	jr nc, .golem
	ld a, REEL_ACTION_INIT_CHANSEY
	ret

.biased
	call Random
	cp 160
	jr nc, .stop
	cp 80
	jr nc, .slow_advance
.golem
	ld a, REEL_ACTION_INIT_GOLEM
	ret

.slow_advance
	ld a, REEL_ACTION_START_SLOW_ADVANCE_REEL3
	ret

.stop
	ld a, REEL_ACTION_STOP_REEL3
	ret

Slots_InitReelTiles: ; 92a98 (24:6a98)
	ld bc, wReel1
	ld hl, REEL_OAM_ADDR
	add hl, bc
	ld de, Sprite17
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_TILEMAP_ADDR
	add hl, bc
	ld de, Reel1Tilemap
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_X_COORD
	add hl, bc
	ld [hl], 6 * 8
	call .OAM

	ld bc, wReel2
	ld hl, REEL_OAM_ADDR
	add hl, bc
	ld de, Sprite25
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_TILEMAP_ADDR
	add hl, bc
	ld de, Reel2Tilemap
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_X_COORD
	add hl, bc
	ld [hl], 10 * 8
	call .OAM

	ld bc, wReel3
	ld hl, REEL_OAM_ADDR
	add hl, bc
	ld de, Sprite33
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_TILEMAP_ADDR
	add hl, bc
	ld de, Reel3Tilemap
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, REEL_X_COORD
	add hl, bc
	ld [hl], 14 * 8
	call .OAM
	ret

.OAM: ; 92af9 (24:6af9)
	ld hl, REEL_ACTION
	add hl, bc
	ld [hl], REEL_ACTION_DO_NOTHING
	ld hl, REEL_POSITION
	add hl, bc
	ld [hl], REEL_SIZE - 1
	ld hl, REEL_SPIN_DISTANCE
	add hl, bc
	ld [hl], REEL_ACTION_DO_NOTHING
	call Slots_UpdateReelPositionAndOAM
	ret

Slots_SpinReels: ; 92b0f (24:6b0f)
	ld bc, wReel1
	call .SpinReel
	ld bc, wReel2
	call .SpinReel
	ld bc, wReel3
	call .SpinReel
	ret

.SpinReel: ; 92b22 (24:6b22)
	ld hl, REEL_SPIN_DISTANCE
	add hl, bc
	ld a, [hl]
	and $f
	jr nz, .skip
	call ReelActionJumptable
.skip
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld d, a
	ld hl, REEL_SPIN_DISTANCE
	add hl, bc
	add [hl]
	ld [hl], a
	and $f
	jr z, Slots_UpdateReelPositionAndOAM
	ld hl, REEL_OAM_ADDR
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, $8
.loop
	ld a, [hl]
	add d
	ld [hli], a
	inc hl
	inc hl
	inc hl
	dec e
	jr nz, .loop
	ret

Slots_UpdateReelPositionAndOAM: ; 92b53 (24:6b53)
	ld hl, REEL_X_COORD
	add hl, bc
	ld a, [hl]
	ld [wCurrReelXCoord], a
	ld a, 10 * 8
	ld [wCurrReelYCoord], a
	ld hl, REEL_POSITION
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, REEL_TILEMAP_ADDR
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	call .LoadOAM
	ld hl, REEL_POSITION
	add hl, bc
	ld a, [hl]
	inc a
	and $f
	cp REEL_SIZE
	jr nz, .load
	xor a
.load
	ld [hl], a
	ret

.LoadOAM: ; 92b83 (24:6b83)
	ld hl, REEL_OAM_ADDR
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop
	ld a, [wCurrReelYCoord]
	ld [hli], a ; y
	ld a, [wCurrReelXCoord]
	ld [hli], a ; x
	ld a, [de]
	ld [hli], a ; tile id
	srl a
	srl a
	set OAM_PRIORITY, a
	ld [hli], a ; attributes

	ld a, [wCurrReelYCoord]
	ld [hli], a ; y
	ld a, [wCurrReelXCoord]
	add 1 * TILE_WIDTH
	ld [hli], a ; x
	ld a, [de]
	inc a
	inc a
	ld [hli], a ; tile id
	srl a
	srl a
	set OAM_PRIORITY, a
	ld [hli], a ; attributes
	inc de
	ld a, [wCurrReelYCoord]
	sub 2 * TILE_WIDTH
	ld [wCurrReelYCoord], a
	cp 2 * TILE_WIDTH
	jr nz, .loop
	ret

; 92bbe (24:6bbe)

; unreferenced
Function92bbe: ; 92bbe
	push hl
	srl a
	srl a
	add LOW(.Unknown_92bce)
	ld l, a
	ld a, 0
	adc HIGH(.Unknown_92bce)
	ld h, a
	ld a, [hl]
	pop hl
	ret

; 92bce

.Unknown_92bce: ; 92bce
	db 0, 1, 2, 3, 4, 5
; 92bd4

ReelActionJumptable: ; 92bd4 (24:6bd4)
	ld hl, REEL_ACTION
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

; 92be4 (24:6be4)

.Jumptable: ; 92be4
	dw ReelAction_DoNothing                   ; 00
	dw ReelAction_StopReelIgnoreJoypad        ; 01
	dw ReelAction_QuadrupleRate               ; 02
	dw ReelAction_DoubleRate                  ; 03
	dw ReelAction_NormalRate                  ; 04
	dw ReelAction_HalfRate                    ; 05
	dw ReelAction_QuarterRate                 ; 06
	dw ReelAction_StopReel1                   ; 07
	dw ReelAction_StopReel2                   ; 08
	dw ReelAction_StopReel3                   ; 09
	dw ReelAction_SetUpReel2SkipTo7           ; 0a
	dw ReelAction_WaitReel2SkipTo7            ; 0b
	dw ReelAction_FastSpinReel2UntilLinedUp7s ; 0c
	dw ReelAction_Unused                      ; 0d
	dw ReelAction_CheckDropReel               ; 0e
	dw ReelAction_WaitDropReel                ; 0f
	dw ReelAction_StartSlowAdvanceReel3       ; 10
	dw ReelAction_WaitSlowAdvanceReel3        ; 11
	dw ReelAction_InitGolem                   ; 12
	dw ReelAction_WaitGolem                   ; 13
	dw ReelAction_EndGolem                    ; 14
	dw ReelAction_InitChansey                 ; 15
	dw ReelAction_WaitChansey                 ; 16
	dw ReelAction_WaitEgg                     ; 17
	dw ReelAction_DropReel                    ; 18
; 92c16

ReelAction_DoNothing: ; 92c16
	ret

; 92c17

ReelAction_QuadrupleRate: ; 92c17
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 16
	ret

; 92c1e

ReelAction_DoubleRate: ; 92c1e
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 8
	ret

; 92c25

ReelAction_NormalRate: ; 92c25
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 4
	ret

; 92c2c

ReelAction_HalfRate: ; 92c2c
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 2
	ret

; 92c33

ReelAction_QuarterRate: ; 92c33
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 1
	ret

; 92c3a

Slots_StopReel: ; 92c3a
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	ld hl, REEL_ACTION
	add hl, bc
	ld [hl], REEL_ACTION_STOP_REEL_IGNORE_JOYPAD
	ld hl, REEL_STOP_DELAY
	add hl, bc
	ld [hl], 3
ReelAction_StopReelIgnoreJoypad: ; 92c4c
	ld hl, REEL_STOP_DELAY
	add hl, bc
	ld a, [hl]
	and a
	jr z, .EndReel
	dec [hl]
	ret

.EndReel:
	ld hl, REEL_ACTION
	add hl, bc
	ld a, REEL_ACTION_DO_NOTHING
	ld [hl], a
	ret

; 92c5e

ReelAction_StopReel1: ; 92c5e
; If no bias: don't manipulate reel.
; If bias: manipulate reel up to wReel1ManipCounter (i.e. 4) slots,
; stoping early if the biased symbol shows up anywhere in reel #1,
; even if the current bet won't allow lining it up.

	ld a, [wSlotBias]
	cp SLOTS_NO_BIAS
	jr z, .NoBias
	ld hl, REEL_MANIP_COUNTER
	add hl, bc
	ld a, [hl]
	and a
	jr z, .NoBias
	dec [hl]
	call .CheckForBias
	ret nz
.NoBias:
	call Slots_StopReel
	ret

; 92c76

.CheckForBias: ; 92c76
	call Slots_GetCurrentReelState
	ld a, [wSlotBias]
	ld e, a
	ld a, [hli]
	cp e
	ret z
	ld a, [hli]
	cp e
	ret z
	ld a, [hl]
	cp e
	ret

; 92c86

ReelAction_StopReel2: ; 92c86
; If no bias: don't manipulate reel.
; If bias: manipulate reel up to wReel2ManipCounter (i.e. 4) slots,
; stoping early if the biased symbol is lined up in the first two
; reels, according to the lines that the current bet allows.

	call Slots_CheckMatchedFirstTwoReels
	jr nc, .nope
	ld a, [wSlotBuildingMatch]
	ld hl, wSlotBias
	cp [hl]
	jr z, .NoBias
.nope
	ld a, [wSlotBias]
	cp SLOTS_NO_BIAS
	jr z, .NoBias
	ld hl, REEL_MANIP_COUNTER
	add hl, bc
	ld a, [hl]
	and a
	jr z, .NoBias
	dec [hl]
	ret

.NoBias:
	call Slots_StopReel
	ret

; 92ca9

ReelAction_StopReel3: ; 92ca9
; Manipulate the reel up to wReel3ManipCounter (i.e. 4) slots,
; stopping early if the bias symbol is lined up for a win.
; If not biased to any symbols, stop as soon as nothing is lined up.

	call Slots_CheckMatchedAllThreeReels
	jr nc, .NoMatch
	ld hl, wSlotBias
	cp [hl]
	jr z, .NoBias
	ld hl, REEL_MANIP_COUNTER
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret

.NoMatch:
	ld a, [wSlotBias]
	cp SLOTS_NO_BIAS
	jr z, .NoBias
	ld hl, REEL_MANIP_COUNTER
	add hl, bc
	ld a, [hl]
	and a
	jr z, .NoBias
	dec [hl]
	ret

.NoBias:
	call Slots_StopReel
	ret

; 92cd2

ReelAction_SetUpReel2SkipTo7: ; 92cd2
; Unique reel 2 action (see Slots_StopReel2)
; Ensures that 7 symbols become lined up in the first two reels,
; but more often than not, this is only a way to get our hopes up, as
; it makes exciting reel #3 modes with no success hope more common.

	call Slots_CheckMatchedFirstTwoReels
	jr nc, .no_match
	ld a, [wFirstTwoReelsMatchingSevens]
	and a
	jr z, .no_match
	call Slots_StopReel
	ret

.no_match
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_REEL2_SKIP_TO_7
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld [hl], 32
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	ret

; 92cf8

ReelAction_WaitReel2SkipTo7: ; 92cf8
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_92d02
	dec [hl]
	ret

.asm_92d02
	ld a, SFX_THROW_BALL
	call Slots_PlaySFX
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_FAST_SPIN_REEL2_UNTIL_LINED_UP_7S
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 8
	ret

; 92d13

ReelAction_FastSpinReel2UntilLinedUp7s: ; 92d13
	call Slots_CheckMatchedFirstTwoReels
	ret nc
	ld a, [wFirstTwoReelsMatchingSevens]
	and a
	ret z
	call Slots_StopReel
	ret

; 92d20

ReelAction_InitGolem: ; 92d20
; Ensures SEVENs are lined up if there's bias to SEVEN.
; Ensures nothing is lined up if there's no bias symbols.
; No other bias symbols are compatible with this mode.

; This is achieved by throwing Golem until the desired result
; is produced. The amount of Golem thrown can be anywhere from
;  1 to 14 for SEVEN bias, and 4-8 for no bias.

	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_GOLEM
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	call Slots_GetNumberOfGolems
	push bc
	push af
	depixel 12, 13
	ld a, SPRITE_ANIM_INDEX_SLOTS_GOLEM
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	pop af
	ld [hl], a
	pop bc
	xor a
	ld [wSlotsDelay], a
ReelAction_WaitGolem: ; 92d4f
	ld a, [wSlotsDelay]
	cp 2
	jr z, .two
	cp 1
	jr z, .one
	ret

.two
	call Slots_CheckMatchedAllThreeReels
	call Slots_StopReel
	ret

.one
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_END_GOLEM
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 8
	ret

; 92d6e

ReelAction_EndGolem: ; 92d6e
	xor a
	ld [wSlotsDelay], a
	ld hl, REEL_ACTION
	add hl, bc
	dec [hl] ; REEL_ACTION_WAIT_GOLEM
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	ret

; 92d7e

ReelAction_InitChansey: ; 92d7e
; Ensures the lining up of SEVEN symbols, but this mode is only possible
; when there is bias to SEVEN symbols (and even then, it's still rare).
; Chansey releases and egg and reel #3 is made to advance 17 slots very
; quickly as many times as necessary for the match to SEVENs to show up.

	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_CHANSEY
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	push bc
	depixel 12, 0
	ld a, SPRITE_ANIM_INDEX_SLOTS_CHANSEY
	call _InitSpriteAnimStruct
	pop bc
	xor a
	ld [wSlotsDelay], a
	ret

; 92da4

ReelAction_WaitChansey: ; 92da4
	ld a, [wSlotsDelay]
	and a
	ret z
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_EGG
	ld a, 2
	ld [wSlotsDelay], a
ReelAction_WaitEgg: ; 92db3
	ld a, [wSlotsDelay]
	cp $4
	ret c
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_DROP_REEL
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 16
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld [hl], 17
ReelAction_DropReel: ; 92dca
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld a, [hl]
	and a
	jr z, .check_match
	dec [hl]
	ret

.check_match
	call Slots_CheckMatchedAllThreeReels
	jr nc, .EggAgain
	and a
	jr nz, .EggAgain
	ld a, 5
	ld [wSlotsDelay], a
	call Slots_StopReel
	ret

.EggAgain:
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
	ld hl, REEL_ACTION
	add hl, bc
	dec [hl]
	dec [hl] ; REEL_ACTION_WAIT_CHANSEY
	ld a, 1
	ld [wSlotsDelay], a
	ret

; 92df7

ReelAction_Unused: ; 92df7
	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_CHECK_DROP_REEL
	call Slots_GetNumberOfGolems
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld [hl], a
ReelAction_CheckDropReel: ; 92e10
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .spin
	call Slots_CheckMatchedAllThreeReels
	call Slots_StopReel
	ret

.spin
	dec [hl]
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_DROP_REEL
	ld hl, REEL_FIELD_0B
	add hl, bc
	ld [hl], 32
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 0
ReelAction_WaitDropReel: ; 92e31
	ld hl, REEL_FIELD_0B
	add hl, bc
	ld a, [hl]
	and a
	jr z, .DropReel
	dec [hl]
	ret

.DropReel:
	ld hl, REEL_ACTION
	add hl, bc
	dec [hl]
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 8
	ret

; 92e47

ReelAction_StartSlowAdvanceReel3: ; 92e47
; Ensures SEVENs are lined up if there's bias to SEVEN.
; Ensures nothing is lined up if there's no bias symbols.
; No other bias symbols are compatible with this mode.

; This is achieved by slowly advancing the reel a full round,
; plus any necessary slot until the desired result is produced.

	call Slots_CheckMatchedAllThreeReels
	ret c
	ld a, SFX_STOP_SLOT
	call Slots_PlaySFX
	call Slots_WaitSFX
	ld hl, REEL_SPIN_RATE
	add hl, bc
	ld [hl], 1
	ld hl, REEL_ACTION
	add hl, bc
	inc [hl] ; REEL_ACTION_WAIT_SLOW_ADVANCE_REEL3
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld [hl], 16
ReelAction_WaitSlowAdvanceReel3: ; 92e64
	ld hl, REEL_MANIP_DELAY
	add hl, bc
	ld a, [hl]
	and a
	jr z, .check1
	dec [hl]
.play_sfx
	ld a, SFX_GOT_SAFARI_BALLS
	call Slots_PlaySFX
	ret

.check1
	ld a, [wSlotBias]
	and a
	jr nz, .check2
	call Slots_CheckMatchedAllThreeReels
	jr nc, .play_sfx
	and a
	jr nz, .play_sfx
	call Slots_StopReel
	call WaitSFX
	ret

.check2
	call Slots_CheckMatchedAllThreeReels
	jr c, .play_sfx
	call Slots_StopReel
	call WaitSFX
	ret

; 92e94

Slots_CheckMatchedFirstTwoReels: ; 92e94
	xor a
	ld [wFirstTwoReelsMatching], a
	ld [wFirstTwoReelsMatchingSevens], a
	call Slots_GetCurrentReelState
	call Slots_CopyReelState
	ld a, [wSlotBet]
	and 3
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return
	push de
	jp hl

.return
	ld a, [wFirstTwoReelsMatching]
	and a
	ret z
	scf
	ret

; 92ebd

.Jumptable: ; 92ebd
	dw .zero
	dw .one
	dw .two
	dw .three
; 92ec5

.three ; 92ec5
	call .CheckUpwardsDiag
	call .CheckDownwardsDiag

.two ; 92ecb
	call .CheckBottomRow
	call .CheckTopRow

.one ; 92ed1
	call .CheckMiddleRow

.zero ; 92ed4
	ret

; 92ed5

.CheckBottomRow: ; 92ed5
	ld hl, wCurrReelStopped
	ld a, [wReel1Stopped]
	cp [hl]
	call z, .StoreResult
	ret

; 92ee0

.CheckUpwardsDiag: ; 92ee0
	ld hl, wCurrReelStopped + 1
	ld a, [wReel1Stopped]
	cp [hl]
	call z, .StoreResult
	ret

; 92eeb

.CheckMiddleRow: ; 92eeb
	ld hl, wCurrReelStopped + 1
	ld a, [wReel1Stopped + 1]
	cp [hl]
	call z, .StoreResult
	ret

; 92ef6

.CheckDownwardsDiag: ; 92ef6
	ld hl, wCurrReelStopped + 1
	ld a, [wReel1Stopped + 2]
	cp [hl]
	call z, .StoreResult
	ret

; 92f01

.CheckTopRow: ; 92f01
	ld hl, wCurrReelStopped + 2
	ld a, [wReel1Stopped + 2]
	cp [hl]
	call z, .StoreResult
	ret

; 92f0c

.StoreResult: ; 92f0c
	ld [wSlotBuildingMatch], a
	and a
	jr nz, .matching_sevens
	ld a, 1
	ld [wFirstTwoReelsMatchingSevens], a

.matching_sevens
	ld a, 1
	ld [wFirstTwoReelsMatching], a
	ret

; 92f1d

Slots_CheckMatchedAllThreeReels: ; 92f1d
	ld a, SLOTS_NO_MATCH
	ld [wSlotMatched], a
	call Slots_GetCurrentReelState
	call Slots_CopyReelState
	ld a, [wSlotBet]
	and 3
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return
	push de
	jp hl

.return
	ld a, [wSlotMatched]
	cp SLOTS_NO_MATCH
	jr nz, .matched_nontrivial
	and a
	ret

.matched_nontrivial
	scf
	ret

; 92f48

.Jumptable: ; 92f48
	dw .zero
	dw .one
	dw .two
	dw .three
; 92f50

.three ; 92f50
	call .CheckUpwardsDiag
	call .CheckDownwardsDiag

.two ; 92f56
	call .CheckBottomRow
	call .CheckTopRow

.one ; 92f5c
	call .CheckMiddleRow

.zero ; 92f5f
	ret

; 92f60

.CheckBottomRow: ; 92f60
	ld hl, wCurrReelStopped
	ld a, [wReel1Stopped]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped
	cp [hl]
	call z, .StoreResult
	ret

; 92f70

.CheckUpwardsDiag: ; 92f70
	ld hl, wCurrReelStopped + 2
	ld a, [wReel1Stopped]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 1
	cp [hl]
	call z, .StoreResult
	ret

; 92f80

.CheckMiddleRow: ; 92f80
	ld hl, wCurrReelStopped + 1
	ld a, [wReel1Stopped + 1]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 1
	cp [hl]
	call z, .StoreResult
	ret

; 92f90

.CheckDownwardsDiag: ; 92f90
	ld hl, wCurrReelStopped
	ld a, [wReel1Stopped + 2]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 1
	cp [hl]
	call z, .StoreResult
	ret

; 92fa0

.CheckTopRow: ; 92fa0
	ld hl, wCurrReelStopped + 2
	ld a, [wReel1Stopped + 2]
	cp [hl]
	ret nz
	ld hl, wReel2Stopped + 2
	cp [hl]
	call z, .StoreResult
	ret

; 92fb0

.StoreResult: ; 92fb0
	ld [wSlotMatched], a
	ret

; 92fb4

Slots_CopyReelState: ; 92fb4
	ld de, wCurrReelStopped
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

; 92fc0

Slots_GetNumberOfGolems: ; 92fc0
	ld hl, REEL_POSITION
	add hl, bc
	ld a, [hl]
	push af
	push hl
	call .Check7Bias
	pop hl
	pop af
	ld [hl], a
	ld a, e
	ret

; 92fcf

.Check7Bias: ; 92fcf
	ld a, [wSlotBias]
	and a
	jr nz, .not_biased_to_seven
	ld e, $0
.loop1
	ld hl, REEL_POSITION
	add hl, bc
	inc [hl]
	inc e
	push de
	call Slots_CheckMatchedAllThreeReels
	pop de
	jr nc, .loop1
	and a
	jr nz, .loop1
	ret

.not_biased_to_seven
	call Random
	and $7
	cp $4 ; ((50 percent) & 7) + 1
	jr c, .not_biased_to_seven
	ld e, a
.loop2
	ld a, e
	inc e
	ld hl, REEL_POSITION
	add hl, bc
	add [hl]
	ld [hl], a
	push de
	call Slots_CheckMatchedAllThreeReels
	pop de
	jr c, .loop2
	ret

; 93002

Slots_InitBias: ; 93002 (24:7002)
	ld a, [wSlotBias]
	and a
	ret z
	ld hl, .Normal
	ld a, [ScriptVar]
	and a
	jr z, .okay
	ld hl, .Lucky
.okay
	call Random
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr nc, .done
	inc hl
	jr .loop

.done
	ld a, [hl]
	ld [wSlotBias], a
	ret

; 93023 (24:7023)

.Normal: ; 93023
	db $01, SLOTS_SEVEN    ; 1/256
	db $03, SLOTS_POKEBALL ; 1/128
	db $0a, SLOTS_STARYU   ; 7/256
	db $14, SLOTS_SQUIRTLE ; 5/128
	db $28, SLOTS_PIKACHU  ; 5/64
	db $30, SLOTS_CHERRY   ; 1/32
	db $ff, SLOTS_NO_BIAS   ; everything else
; 93031

.Lucky: ; 93031
	db $02, SLOTS_SEVEN    ;  1/128
	db $03, SLOTS_POKEBALL ;  1/256
	db $08, SLOTS_STARYU   ;  5/256
	db $10, SLOTS_SQUIRTLE ;  1/32
	db $1e, SLOTS_PIKACHU  ;  7/128
	db $50, SLOTS_CHERRY   ; 25/128
	db $ff, SLOTS_NO_BIAS   ; everything else
; 9303f

Slots_IlluminateBetLights: ; 9303f (24:703f)
	ld b, $14 ; turned on
	ld a, [wSlotBet]
	dec a
	jr z, Slots_Lights1OnOff
	dec a
	jr z, Slots_Lights2OnOff
	jr Slots_Lights3OnOff

Slots_DeilluminateBetLights: ; 9304c (24:704c)
	ld b, $23 ; turned off
Slots_Lights3OnOff: ; 9304e (24:704e)
	hlcoord 3, 2
	call Slots_TurnLightsOnOrOff
	hlcoord 3, 10
	call Slots_TurnLightsOnOrOff
Slots_Lights2OnOff: ; 9305a (24:705a)
	hlcoord 3, 4
	call Slots_TurnLightsOnOrOff
	hlcoord 3, 8
	call Slots_TurnLightsOnOrOff
Slots_Lights1OnOff: ; 93066 (24:7066)
	hlcoord 3, 6

Slots_TurnLightsOnOrOff: ; 93069 (24:7069)
	ld a, b
	ld [hl], a
	ld de, SCREEN_WIDTH / 2 + 3
	add hl, de
	ld [hl], a
	ld de, SCREEN_WIDTH / 2 - 3
	add hl, de
	inc a
	ld [hl], a
	ld de, SCREEN_WIDTH / 2 + 3
	add hl, de
	ld [hl], a
	ret

Slots_AskBet: ; 9307c (24:707c)
.loop
	ld hl, .Text_BetHowManyCoins
	call PrintText
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	call VerticalMenu
	call CloseWindow
	ret c
	ld a, [wMenuCursorY]
	ld b, a
	ld a, 4
	sub b
	ld [wSlotBet], a
	ld hl, Coins
	ld c, a
	ld a, [hli]
	and a
	jr nz, .Start
	ld a, [hl]
	cp c
	jr nc, .Start
	ld hl, .Text_NotEnoughCoins
	call PrintText
	jr .loop

.Start:
	ld hl, Coins + 1
	ld a, [hl]
	sub c
	ld [hld], a
	jr nc, .ok
	dec [hl]
.ok
	call WaitSFX
	ld de, SFX_PAY_DAY
	call PlaySFX
	ld hl, .Text_Start
	call PrintText
	and a
	ret

; 930c7 (24:70c7)

.Text_BetHowManyCoins: ; 0x930c7
	; Bet how many coins?
	text_jump UnknownText_0x1c5049
	db "@"
; 0x930cc

.Text_Start: ; 0x930cc
	; Start!
	text_jump UnknownText_0x1c505e
	db "@"
; 0x930d1

.Text_NotEnoughCoins: ; 0x930d1
	; Not enough coins.
	text_jump UnknownText_0x1c5066
	db "@"
; 0x930d6

.MenuDataHeader: ; 0x930d6
	db $40 ; flags
	db 10, 14 ; start coords
	db 17, 19 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x930de

.MenuData2: ; 0x930de
	db $80 ; flags
	db 3 ; items
	db " 3@"
	db " 2@"
	db " 1@"
; 0x930e9

Slots_AskPlayAgain: ; 930e9 (24:70e9)
	ld hl, Coins
	ld a, [hli]
	or [hl]
	jr nz, .you_have_coins
	ld hl, .Text_OutOfCoins
	call PrintText
	ld c, 60
	call DelayFrames
	jr .exit_slots

.you_have_coins
	ld hl, .Text_PlayAgain
	call PrintText
	call LoadMenuTextBox
	lb bc, 14, 12
	call PlaceYesNoBox
	ld a, [wMenuCursorY]
	dec a
	call CloseWindow
	and a
	jr nz, .exit_slots
	and a
	ret

.exit_slots
	scf
	ret

; 9311a (24:711a)

.Text_OutOfCoins: ; 9311a
	text_jump UnknownText_0x1c5079
	db "@"

.Text_PlayAgain: ; 9311f
	text_jump UnknownText_0x1c5092
	db "@"

Slots_GetPayout: ; 93124 (24:7124)
	ld a, [wSlotMatched]
	cp SLOTS_NO_MATCH
	jr z, .no_win
	srl a
	ld e, a
	ld d, 0
	ld hl, .PayoutTable
	add hl, de
	ld a, [hli]
	ld [wPayout + 1], a
	ld e, a
	ld a, [hl]
	ld [wPayout], a
	ld d, a
	farcall TrainerRankings_AddToSlotsPayouts
	ret

.PayoutTable:
	dw 300
	dw  50
	dw   6
	dw   8
	dw  10
	dw  15

.no_win
	ld hl, wPayout
	xor a
	ld [hli], a
	ld [hl], a
	ret

Slots_PayoutText: ; 93158 (24:7158)
	ld a, [wSlotMatched]
	cp SLOTS_NO_MATCH
	jr nz, .MatchedSomething
	ld hl, .Text_Darn
	call PrintText
	farcall TrainerRankings_EndSlotsWinStreak
	ret

.MatchedSomething:
	srl a
	ld e, a
	ld d, 0
	ld hl, .PayoutStrings
	add hl, de
	add hl, de
	add hl, de
	ld de, StringBuffer2
	ld bc, 4
	call CopyBytes
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return
	push de
	jp hl

.return
	ld hl, .Text_PrintPayout
	call PrintText
	farcall TrainerRankings_AddToSlotsWinStreak
	ret

; 93195 (24:7195)

.PayoutStrings: ; 93195
	dbw "300@", .LinedUpSevens
	dbw "50@@", .LinedUpPokeballs
	dbw "6@@@", .LinedUpMonOrCherry
	dbw "8@@@", .LinedUpMonOrCherry
	dbw "10@@", .LinedUpMonOrCherry
	dbw "15@@", .LinedUpMonOrCherry
; 931b9

.Text_PrintPayout: ; 0x931b9
	start_asm
	ld a, [wSlotMatched]
	add $25
	ldcoord_a 2, 13
	inc a
	ldcoord_a 2, 14
	inc a
	ldcoord_a 3, 13
	inc a
	ldcoord_a 3, 14
	hlcoord 18, 17
	ld [hl], "▼"
	ld hl, .Text_LinedUpWonCoins
rept 4
	inc bc
endr
	ret

; 931db

.Text_LinedUpWonCoins: ; 0x931db
	; lined up! Won @  coins!
	text_jump UnknownText_0x1c509f
	db "@"
; 0x931e0

.Text_Darn: ; 0x931e0
	; Darn!
	text_jump UnknownText_0x1c50bb
	db "@"
; 0x931e5

.LinedUpSevens: ; 931e5
	ld a, SFX_2ND_PLACE
	call Slots_PlaySFX
	call WaitSFX

; Oddly, the rarest mode (wKeepSevenBiasChance = 1) is the one with
; the worse odds to favor seven symbol streaks (12.5% vs 25%).
; it's possible that either the wKeepSevenBiasChance initialization
; or this code was intended to lead to flipped percentages.
	ld a, [wKeepSevenBiasChance]
	and a
	jr nz, .lower_seven_streak_odds
	call Random
	and %0010100
	ret z ; 25% chance to stick with seven symbol bias
	ld a, SLOTS_NO_BIAS
	ld [wSlotBias], a
	ret

.lower_seven_streak_odds
	call Random
	and %0011100
	ret z ; 12.5% chance to stick with seven symbol bias
	ld a, SLOTS_NO_BIAS
	ld [wSlotBias], a
	ret

; 9320b

.LinedUpPokeballs: ; 9320b
	ld a, SFX_3RD_PLACE
	call Slots_PlaySFX
	call WaitSFX
	ret

; 93214

.LinedUpMonOrCherry: ; 93214
	ld a, SFX_PRESENT
	call Slots_PlaySFX
	call WaitSFX
	ret

; 9321d

Slots_AnimateGolem: ; 9321d (24:721d)
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable: ; 9322d (24:722d)
	dw .init
	dw .fall
	dw .roll

.init ; 93233 (24:7233)
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .retain
	ld a, 2
	ld [wSlotsDelay], a
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

.retain
	dec [hl]
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], $0

.fall ; 93259 (24:7259)
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $20
	jr c, .play_sound
	dec [hl]
	ld e, a
	ld d, 14 * 8
	farcall BattleAnim_Sine_e
	ld a, e
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.play_sound
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $2
	ld a, 1
	ld [wSlotsDelay], a
	ld a, SFX_PLACE_PUZZLE_PIECE_DOWN
	call Slots_PlaySFX
	ret

.roll ; 93289 (24:7289)
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	cp 9 * 8
	jr nc, .restart
	and $3
	ret nz
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	xor $ff
	inc a
	ld [hl], a
	ld [hSCY], a
	ret

.restart
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	xor a
	ld [hl], a
	ld [hSCY], a
	ret

Slots_AnimateChansey: ; 932ac (24:72ac)
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable: ; 932bc (24:72bc)
	dw .walk
	dw .one
	dw .two

.walk ; 932c2 (24:72c2)
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp 13 * 8
	jr z, .limit
	and $f
	ret nz
	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	ret

.limit
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld a, 1
	ld [wSlotsDelay], a

.one ; 932e0 (24:72e0)
	ld a, [wSlotsDelay]
	cp $2
	jr z, .retain
	cp $5
	ret nz
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

.retain
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $8
.two ; 932fc (24:72fc)
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .spawn_egg
	dec [hl]
	ret

.spawn_egg
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	dec [hl]
	push bc
	depixel 12, 13, 0, 4
	ld a, SPRITE_ANIM_INDEX_SLOTS_EGG
	call _InitSpriteAnimStruct
	pop bc
	ret

; 93316 (24:7316)

Slots_WaitSFX: ; 93316
	push bc
	ld c, 16
	call DelayFrames
	pop bc
	ret

; 9331e

Slots_PlaySFX: ; 9331e (24:731e)
	push de
	ld e, a
	ld d, 0
	call PlaySFX
	pop de
	ret

; 93327 (24:7327)

; The first three positions are repeated to
; avoid needing to check indices when copying.
Reel1Tilemap: ; 93327
	db SLOTS_SEVEN    ;  0
	db SLOTS_CHERRY   ;  1
	db SLOTS_STARYU   ;  2
	db SLOTS_PIKACHU  ;  3
	db SLOTS_SQUIRTLE ;  4
	db SLOTS_SEVEN    ;  5
	db SLOTS_CHERRY   ;  6
	db SLOTS_STARYU   ;  7
	db SLOTS_PIKACHU  ;  8
	db SLOTS_SQUIRTLE ;  9
	db SLOTS_POKEBALL ; 10
	db SLOTS_CHERRY   ; 11
	db SLOTS_STARYU   ; 12
	db SLOTS_PIKACHU  ; 13
	db SLOTS_SQUIRTLE ; 14
	db SLOTS_SEVEN    ;  0
	db SLOTS_CHERRY   ;  1
	db SLOTS_STARYU   ;  2

Reel2Tilemap: ; 93339
	db SLOTS_SEVEN    ;  0
	db SLOTS_PIKACHU  ;  1
	db SLOTS_CHERRY   ;  2
	db SLOTS_SQUIRTLE ;  3
	db SLOTS_STARYU   ;  4
	db SLOTS_POKEBALL ;  5
	db SLOTS_PIKACHU  ;  6
	db SLOTS_CHERRY   ;  7
	db SLOTS_SQUIRTLE ;  8
	db SLOTS_STARYU   ;  9
	db SLOTS_POKEBALL ; 10
	db SLOTS_PIKACHU  ; 11
	db SLOTS_CHERRY   ; 12
	db SLOTS_SQUIRTLE ; 13
	db SLOTS_STARYU   ; 14
	db SLOTS_SEVEN    ;  0
	db SLOTS_PIKACHU  ;  1
	db SLOTS_CHERRY   ;  2

Reel3Tilemap: ; 9334b
	db SLOTS_SEVEN    ;  0
	db SLOTS_PIKACHU  ;  1
	db SLOTS_CHERRY   ;  2
	db SLOTS_SQUIRTLE ;  3
	db SLOTS_STARYU   ;  4
	db SLOTS_PIKACHU  ;  5
	db SLOTS_CHERRY   ;  6
	db SLOTS_SQUIRTLE ;  7
	db SLOTS_STARYU   ;  8
	db SLOTS_PIKACHU  ;  9
	db SLOTS_POKEBALL ; 10
	db SLOTS_CHERRY   ; 11
	db SLOTS_SQUIRTLE ; 12
	db SLOTS_STARYU   ; 13
	db SLOTS_PIKACHU  ; 14
	db SLOTS_SEVEN    ;  0
	db SLOTS_PIKACHU  ;  1
	db SLOTS_CHERRY   ;  2
; 9335d

SlotsTilemap: ; 9335d
INCBIN "gfx/slots/slots.tilemap"
; 9344d

Slots1LZ: ; 9344d
INCBIN "gfx/slots/slots_1.2bpp.lz"
; 935cd

Slots2LZ: ; 935cd
INCBIN "gfx/slots/slots_2.2bpp.lz"
; 9382d

Slots3LZ: ; 9382d
INCBIN "gfx/slots/slots_3.2bpp.lz"
; 93a3d
