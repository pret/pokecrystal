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
	dt 1000