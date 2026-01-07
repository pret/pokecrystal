; NewGameOptions menu constants
	const_def
	const NEWGAMEOPT_WILD_ENCOUNTERS  ; 0
	const NEWGAMEOPT_STARTER_RAND     ; 1
	const NEWGAMEOPT_TM_MODE          ; 2
	const NEWGAMEOPT_CONTINUE         ; 3
DEF NUM_NEWGAMEOPTIONS EQU const_value ; 4

_NewGameOptions:
	; Initialize Crystal data (including all new game options to defaults)
	call InitCrystalData
	
	; Set up the screen
	call InitGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetDefaultBGPAndOBP
	
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], TRUE
	
	hlcoord 0, 0
	ld b, SCREEN_HEIGHT - 2
	ld c, SCREEN_WIDTH - 2
	call Textbox
	hlcoord 2, 2
	ld de, StringNewGameOptions
	call PlaceString
	xor a
	ld [wJumptableIndex], a

; Display the settings of each option when the menu is opened
	ld c, NUM_NEWGAMEOPTIONS - 1 ; omit continue button
.print_text_loop
	push bc
	xor a
	ldh [hJoyLast], a
	call GetNewGameOptionPointer
	pop bc
	ld hl, wJumptableIndex
	inc [hl]
	dec c
	jr nz, .print_text_loop

	xor a
	ld [wJumptableIndex], a
	inc a
	ldh [hBGMapMode], a
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetDefaultBGPAndOBP

.joypad_loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and PAD_START
	jr nz, .ExitOptions
	ldh a, [hJoyPressed]
	and PAD_B
	jr nz, .CancelNewGame
	call NewGameOptionsControl
	jr c, .dpad
	call GetNewGameOptionPointer
	jr c, .ExitOptions

.dpad
	call NewGameOptions_UpdateCursorPosition
	ld c, 3
	call DelayFrames
	jr .joypad_loop

.ExitOptions:
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	pop af
	ldh [hInMenu], a
	and a ; clear carry, continue with new game
	ret

.CancelNewGame:
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	pop af
	ldh [hInMenu], a
	scf ; set carry, cancel new game
	ret

StringNewGameOptions:
	db "WILD #MON<LF>"
	db "      :<LF>"
	db "STARTERS<LF>"
	db "      :<LF>"
	db "TM MODE<LF>"
	db "      :<LF>"
	db "CONTINUE@"

GetNewGameOptionPointer:
	jumptable .Pointers, wJumptableIndex

.Pointers:
; entries correspond to NEWGAMEOPT_* constants
	dw NewGameOptions_WildEncounters
	dw NewGameOptions_StarterRandomization
	dw NewGameOptions_TMMode
	dw NewGameOptions_Continue

NewGameOptions_WildEncounters:
	ld a, [wWildEncounterType]
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .Toggle
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
.Toggle:
	ld a, [wWildEncounterType]
	xor 1 ; Toggle between 0 and 1
	ld [wWildEncounterType], a
.NonePressed:
	ld a, [wWildEncounterType]
	and a
	jr nz, .Randomized
	ld de, .Standard
	jr .Display
.Randomized:
	ld de, .Randomized_str
.Display:
	hlcoord 8, 3
	call PlaceString
	and a
	ret

.Standard:     db "STANDARD  @"
.Randomized_str: db "RANDOMIZED@"

NewGameOptions_StarterRandomization:
	ld a, [wStarterRandomization]
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .Toggle
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
.Toggle:
	ld a, [wStarterRandomization]
	xor 1
	ld [wStarterRandomization], a
.NonePressed:
	ld a, [wStarterRandomization]
	and a
	jr nz, .Randomized
	ld de, .Standard
	jr .Display
.Randomized:
	ld de, .Randomized_str
.Display:
	hlcoord 8, 5
	call PlaceString
	and a
	ret

.Standard:     db "STANDARD  @"
.Randomized_str: db "RANDOMIZED@"

NewGameOptions_TMMode:
	ld a, [wTMMode]
	ldh a, [hJoyPressed]
	bit B_PAD_LEFT, a
	jr nz, .Toggle
	bit B_PAD_RIGHT, a
	jr z, .NonePressed
.Toggle:
	ld a, [wTMMode]
	xor 1
	ld [wTMMode], a
.NonePressed:
	ld a, [wTMMode]
	and a
	jr nz, .Unlimited
	ld de, .Standard
	jr .Display
.Unlimited:
	ld de, .Unlimited_str
.Display:
	hlcoord 8, 7
	call PlaceString
	and a
	ret

.Standard:     db "STANDARD @"
.Unlimited_str: db "UNLIMITED@"

NewGameOptions_Continue:
	ldh a, [hJoyPressed]
	and PAD_A
	jr nz, .pressed
	and a
	ret

.pressed:
	scf
	ret

NewGameOptionsControl:
	ld hl, wJumptableIndex
	ldh a, [hJoyLast]
	cp PAD_DOWN
	jr z, .DownPressed
	cp PAD_UP
	jr z, .UpPressed
	and a
	ret

.DownPressed:
	ld a, [hl]
	cp NEWGAMEOPT_CONTINUE
	jr z, .WrapToTop
	inc [hl]
	scf
	ret

.WrapToTop:
	ld [hl], NEWGAMEOPT_WILD_ENCOUNTERS
	scf
	ret

.UpPressed:
	ld a, [hl]
	and a
	jr z, .WrapToBottom
	dec [hl]
	scf
	ret

.WrapToBottom:
	ld [hl], NEWGAMEOPT_CONTINUE
	scf
	ret

NewGameOptions_UpdateCursorPosition:
	; Clear cursor positions at rows 2, 4, 6, 8 only
	hlcoord 1, 2
	ld [hl], $7f ; space character
	hlcoord 1, 4
	ld [hl], $7f ; space character
	hlcoord 1, 6
	ld [hl], $7f ; space character
	hlcoord 1, 8
	ld [hl], $7f ; space character
	
	; Place cursor at current position
	hlcoord 1, 2
	ld bc, SCREEN_WIDTH * 2
	ld a, [wJumptableIndex]
	call AddNTimes
	ld [hl], $ec ; right arrow
	ret
