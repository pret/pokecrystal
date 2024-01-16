    const_def
	const MOVERELEARNERTEXT_INTRO
	const MOVERELEARNERTEXT_WHICHMON
	const MOVERELEARNERTEXT_WHICHMOVE
	const MOVERELEARNERTEXT_COMEAGAIN
	const MOVERELEARNERTEXT_EGG
	const MOVERELEARNERTEXT_NOTAPOKEMON
	const MOVERELEARNERTEXT_NOTENOUGHMONEY
	const MOVERELEARNERTEXT_NOMOVESTOLEARN

MoveRelearner:
	ld a, MOVERELEARNERTEXT_INTRO
	call PrintMoveRelearnerText
	farcall PlaceMoneyTopRight
	call YesNoBox
	jp c, .cancel
	ld hl, .cost_to_relearn
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall CompareMoney
	jp c, .not_enough_money
	ld a, MOVERELEARNERTEXT_WHICHMON
	call PrintMoveRelearnerText
	call JoyWaitAorB

	ld b, $6
	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg

	call IsAPokemon
	jr c, .no_mon

	call GetRelearnableMoves
	jr z, .no_moves

	ld a, MOVERELEARNERTEXT_WHICHMOVE
	call PrintMoveRelearnerText
	call JoyWaitAorB

	call ChooseMoveToLearn
	jr c, .skip_learn
	ld a, [wMenuSelection]
	ld [wTempSpecies], a
	call GetMoveName
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	ld bc, wStringBuffer2 - wStringBuffer1
	call CopyBytes
	ld b, 0
	predef LearnMove
	ld a, b
	and a
	jr z, .skip_learn
	ld hl, .cost_to_relearn
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall TakeMoney
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
.skip_learn
	call CloseSubmenu
	call SpeechTextbox
.cancel
	ld a, MOVERELEARNERTEXT_COMEAGAIN
	call PrintMoveRelearnerText
	ret
.egg
	ld a, MOVERELEARNERTEXT_EGG
	call PrintMoveRelearnerText
	ret
.not_enough_money
	ld a, MOVERELEARNERTEXT_NOTENOUGHMONEY
	call PrintMoveRelearnerText
	ret
.no_mon
	ld a, MOVERELEARNERTEXT_NOTAPOKEMON
	call PrintMoveRelearnerText
	ret
.no_moves
	ld a, MOVERELEARNERTEXT_NOMOVESTOLEARN
	call PrintMoveRelearnerText
	ret

.cost_to_relearn
	dt 500

GetRelearnableMoves:
	; Get moves relearnable by CurPartyMon
	; Returns z if no moves can be relearned.
	ld hl, wd002
	xor a
	ld [hli], a
	ld [hl], $ff

	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartySpecies], a

	push af
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a

	ld b, 0
	ld de, wd002 + 1
; based on GetEggMove in engine/pokemon/breeding.asm 
	ld a, [wCurPartySpecies]
	dec a
	push bc
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarWord
.skip_evos
	ld a, BANK(EvosAttacks)
	call GetFarByte
	inc hl
	and a
	jr nz, .skip_evos

.loop_moves
	ld a, BANK(EvosAttacks)
	call GetFarByte
	inc hl
	and a
	jr z, .done
	ld c, a
	ld a, [wCurPartyLevel]
	cp c
	ld a, BANK(EvosAttacks)
	call GetFarByte
	inc hl
	jr c, .loop_moves

	ld c, a
	call CheckAlreadyInList
	jr c, .loop_moves
	call CheckPokemonAlreadyKnowsMove
	jr c, .loop_moves
	ld a, c
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	pop bc
	inc b
	push bc
	jr .loop_moves
.done
	pop bc
	pop af
	ld [wCurPartySpecies], a
	ld a, b
	ld [wd002], a
	and a
	ret

CheckAlreadyInList:
	push hl
	ld hl, wd002 + 1
.loop
	ld a, [hli]
	inc a
	jr z, .nope
	dec a
	cp c
	jr nz, .loop
	pop hl
	scf
	ret
.nope
	pop hl
	and a
	ret

CheckPokemonAlreadyKnowsMove:
	; Check if move c is in the selected pokemon's movepool already.
	; Returns c if yes.
	push hl
	push bc
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld b, 4
.loop
	ld a, [hli]
	cp c
	jr z, .yes
	dec b
	jr nz, .loop
	pop bc
	pop hl
	and a
	ret
.yes
	pop bc
	pop hl
	scf
	ret

ChooseMoveToLearn:
	; Open a full-screen scrolling menu
	; Number of items stored in wd002
	; List of items stored in wd002 + 1
	; Print move names, PP, details, and descriptions
	; Enable Up, Down, A, and B
	; Up scrolls up
	; Down scrolls down
	; A confirms selection
	; B backs out
	call FadeToMenu
	farcall BlankScreen
	call UpdateSprites
	ld hl, .MenuHeader
	call CopyMenuHeader
	xor a
	ld [wMenuCursorPosition], a
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	call SpeechTextbox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .carry
	ld a, [wMenuSelection]
	ld [wPutativeTMHMMove], a
	and a
	ret

.carry
	scf
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, SCREEN_WIDTH - 1, 11
	dw .MenuData
	db 1 ; default option

.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_FUNCTION3 ; item format
	db 5, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; horizontal spacing
	dba  wd002
	dba .PrintMoveName
	dba .PrintDetails
	dba .PrintMoveDesc

.PrintMoveName
	push de
	ld a, [wMenuSelection]
	ld [wTempSpecies], a
	call GetMoveName
	pop hl
	call PlaceString
	ret
.PrintDetails
	ld hl, wStringBuffer1
	ld bc, wStringBuffer2 - wStringBuffer1
	ld a, " "
	call ByteFill
	ld a, [wMenuSelection]
	inc a
	ret z
	dec a
	push de
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_TYPE
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wTempSpecies], a
	; get move type
	; 6 characters
	ld c, a ;character width loaded into c
	add a ;double a (two characters)
	add c ;add c to a (three charaters)
	add a ;double a (six characters)
	add c ;add c to a (seven charaters, needed for blank space at the end)
	ld c, a
	ld b, 0
	ld hl, .Types
	add hl, bc
	ld d, h
	ld e, l
	ld hl, wStringBuffer1
	ld bc, 7
	call PlaceString

	ld hl, wStringBuffer1 + 7
	ld [hl], "P"
	inc hl
	ld [hl], "P"
	inc hl
	ld [hl], ":"
	ld a, [wMenuSelection]
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_PP
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wCurCoordEvent], a ;Changed from wEngineBuffer1
	ld hl, wStringBuffer1 + 10
	ld de, wCurCoordEvent ;Changed from wEngineBuffer1
	ld bc, $102
	call PrintNum
	ld hl, wStringBuffer1 + 12
	ld [hl], "@"

	ld hl, SCREEN_WIDTH - 5
	pop de
	add hl, de
	push de
	ld de, wStringBuffer1
	call PlaceString
	pop de
	ret

.Types
	db "NORMAL@"
	db "FIGHT@@"
	db "FLYING@"
	db "POISON@"
	db "GROUND@"
	db "ROCK@@@"
	db "BIRD@@@"
	db "BUG@@@@"
	db "GHOST@@"
	db "STEEL@@"
	db "UNUSED@"
	db "UNUSED@"
	db "UNUSED@"
	db "UNUSED@"
	db "UNUSED@"
	db "UNUSED@"
	db "UNUSED@"
	db "UNUSED@"
	db "UNUSED@"
	db "CURSE@@"
	db "FIRE@@@"
	db "WATER@@"
	db "GRASS@@"
	db "ELECTR@"
	db "PSYCH@@"
	db "ICE@@@@"
	db "DRAGON@"
	db "DARK@@@"

.PrintMoveDesc
	push de
	call SpeechTextbox
	ld a, [wMenuSelection]
	inc a
	pop de
	ret z
	dec a
	ld [wCurSpecies], a
	hlcoord 1, 14
	predef PrintMoveDescription
	ret

PrintMoveRelearnerText:
	ld e, a
	ld d, 0
	ld hl, .TextPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret
.TextPointers
	dw .Intro
	dw .WhichMon
	dw .WhichMove
	dw .ComeAgain
	dw .Egg
	dw .NotMon
	dw .NotEnoughMoney
	dw .NoMovesToLearn

.Intro
	text "Hello! I am the"
	line "MOVE RELEARNER."

	para "I know every"
	line "move that each"
	cont "#MON can learn."

	para "For just ¥500, I"
	line "can share that"

	para "knowledge with"
	line "you. How about it?"
	done
.WhichMon
	text "Very well! Which"
	line "#MON should"
	cont "remember a move?"
	done
.WhichMove
	text "Which move should"
	line "it remember?"
	done
.ComeAgain
	text "Thanks! Come see"
	line "me again, if you"
	cont "want me to teach"
	cont "your #MON!"
	done
.Egg
	text "An EGG can't learn"
	line "any moves."
	done
.NotMon
	text "That's not"
	line "a #MON!"
	done
.NotEnoughMoney
	text "I'm sorry, but"
	line "you don't have"
	cont "enough money."
	done
.NoMovesToLearn
	text "This #MON can't"
	line "learn any moves"
	cont "from me."
	done