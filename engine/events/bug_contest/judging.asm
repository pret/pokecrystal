_BugContestJudging:
	call ContestScore
	farcall StubbedTrainerRankings_BugContestScore
	call BugContest_JudgeContestants
	ld a, [wBugContestThirdPlaceWinnerID]
	call LoadContestantName
	ld a, [wBugContestThirdPlaceMon]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, ContestJudging_ThirdPlaceText
	call PrintText
	ld a, [wBugContestSecondPlaceWinnerID]
	call LoadContestantName
	ld a, [wBugContestSecondPlaceMon]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, ContestJudging_SecondPlaceText
	call PrintText
	ld a, [wBugContestFirstPlaceWinnerID]
	call LoadContestantName
	ld a, [wBugContestFirstPlaceMon]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, ContestJudging_FirstPlaceText
	call PrintText
	jp BugContest_GetPlayersResult

ContestJudging_FirstPlaceText:
	text_far _ContestJudging_FirstPlaceText
	text_asm
	ld de, SFX_1ST_PLACE
	call PlaySFX
	call WaitSFX
	ld hl, ContestJudging_FirstPlaceScoreText
	ret

ContestJudging_FirstPlaceScoreText:
	text_far _ContestJudging_FirstPlaceScoreText
	text_end

ContestJudging_SecondPlaceText:
	; Placing second was @ , who caught a @ !@ @
	text_far _ContestJudging_SecondPlaceText
	text_asm
	ld de, SFX_2ND_PLACE
	call PlaySFX
	call WaitSFX
	ld hl, ContestJudging_SecondPlaceScoreText
	ret

ContestJudging_SecondPlaceScoreText:
	text_far _ContestJudging_SecondPlaceScoreText
	text_end

ContestJudging_ThirdPlaceText:
	; Placing third was @ , who caught a @ !@ @
	text_far _ContestJudging_ThirdPlaceText
	text_asm
	ld de, SFX_3RD_PLACE
	call PlaySFX
	call WaitSFX
	ld hl, ContestJudging_ThirdPlaceScoreText
	ret

ContestJudging_ThirdPlaceScoreText:
	text_far _ContestJudging_ThirdPlaceScoreText
	text_end

LoadContestantName:
; If a = 1, get your name.
	assert BUG_CONTEST_PLAYER == 1
	dec a
	jr z, .player
; Find the pointer for the trainer class of the Bug Catching Contestant whose ID is in a.
	ld c, a
	ld b, 0
	ld hl, BugContestantPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
; Copy the Trainer Class to c.
	ld a, [hli]
	ld c, a
; Save hl and bc for later.
	push hl
	push bc
; Get the Trainer Class name and copy it into wBugContestWinnerName.
	callfar GetTrainerClassName
	ld hl, wStringBuffer1
	ld de, wBugContestWinnerName
	ld bc, TRAINER_CLASS_NAME_LENGTH
	call CopyBytes
	ld hl, wBugContestWinnerName
; Delete the trailing terminator and replace it with a space.
.next
	ld a, [hli]
	cp "@"
	jr nz, .next
	dec hl
	ld [hl], " "
	inc hl
	ld d, h
	ld e, l
; Restore the Trainer Class ID and Trainer ID pointer.  Save de for later.
	pop bc
	pop hl
	push de
; Get the name of the trainer with class c and ID b.
	ld a, [hl]
	ld b, a
	callfar GetTrainerName
; Append the name to wBugContestWinnerName.
	ld hl, wStringBuffer1
	pop de
	ld bc, NAME_LENGTH - 1
	jp CopyBytes

.player
	ld hl, wPlayerName
	ld de, wBugContestWinnerName
	ld bc, NAME_LENGTH
	jp CopyBytes

INCLUDE "data/events/bug_contest_winners.asm"

BugContest_GetPlayersResult:
	ld hl, wBugContestThirdPlaceWinnerID
	ld de, -BUG_CONTESTANT_SIZE
	ld b, 3 ; 3rd, 2nd, or 1st
.loop
	ld a, [hl]
	cp BUG_CONTEST_PLAYER
	jr z, .done
	add hl, de
	dec b
	jr nz, .loop

.done
	ret

BugContest_JudgeContestants:
	call ClearContestResults
	call ComputeAIContestantScores
	ld hl, wBugContestTempWinnerID
	ld a, BUG_CONTEST_PLAYER
	ld [hli], a
	ld a, [wContestMon]
	ld [hli], a
	ldh a, [hProduct]
	ld [hli], a
	ldh a, [hProduct + 1]
	ld [hl], a
	call DetermineContestWinners
	ret

ClearContestResults:
	ld hl, wBugContestResults
	ld b, wBugContestWinnersEnd - wBugContestResults
	xor a
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

DetermineContestWinners:
	ld de, wBugContestTempScore
	ld hl, wBugContestFirstPlaceScore
	ld c, 2
	call CompareBytes
	jr c, .not_first_place
	ld hl, wBugContestSecondPlaceWinnerID
	ld de, wBugContestThirdPlaceWinnerID
	ld bc, BUG_CONTESTANT_SIZE
	call CopyBytes
	ld hl, wBugContestFirstPlaceWinnerID
	ld de, wBugContestSecondPlaceWinnerID
	ld bc, BUG_CONTESTANT_SIZE
	call CopyBytes
	ld hl, wBugContestFirstPlaceWinnerID
	call CopyTempContestant
	jr .done

.not_first_place
	ld de, wBugContestTempScore
	ld hl, wBugContestSecondPlaceScore
	ld c, 2
	call CompareBytes
	jr c, .not_second_place
	ld hl, wBugContestSecondPlaceWinnerID
	ld de, wBugContestThirdPlaceWinnerID
	ld bc, BUG_CONTESTANT_SIZE
	call CopyBytes
	ld hl, wBugContestSecondPlaceWinnerID
	call CopyTempContestant
	jr .done

.not_second_place
	ld de, wBugContestTempScore
	ld hl, wBugContestThirdPlaceScore
	ld c, 2
	call CompareBytes
	jr c, .done
	ld hl, wBugContestThirdPlaceWinnerID
	call CopyTempContestant

.done
	ret

CopyTempContestant:
; Could've just called CopyBytes.
	ld de, wBugContestTempWinnerID
rept BUG_CONTESTANT_SIZE - 1
	ld a, [de]
	inc de
	ld [hli], a
endr
	ld a, [de]
	inc de
	ld [hl], a
	ret

ComputeAIContestantScores:
	ld e, 0
.loop
	push de
	call CheckBugContestContestantFlag
	pop de
	jr nz, .done
	ld a, e
	inc a
	inc a
	ld [wBugContestTempWinnerID], a
	dec a
	ld c, a
	ld b, 0
	ld hl, BugContestantPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
.loop2
	; 0, 1, or 2 for 1st, 2nd, or 3rd
	call Random
	and 3
	cp 3
	jr z, .loop2
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wBugContestTempMon], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; randomly perturb score
	call Random
	and %111
	ld c, a
	ld b, 0
	add hl, bc
	ld a, h
	ld [wBugContestTempScore], a
	ld a, l
	ld [wBugContestTempScore + 1], a
	push de
	call DetermineContestWinners
	pop de

.done
	inc e
	ld a, e
	cp NUM_BUG_CONTESTANTS
	jr nz, .loop
	ret

ContestScore:
; Determine the player's score in the Bug Catching Contest.

	xor a
	ldh [hProduct], a
	ldh [hMultiplicand], a

	ld a, [wContestMonSpecies] ; Species
	and a
	jr z, .done

	; Tally the following:

	; Max HP * 4
	ld a, [wContestMonMaxHP + 1]
	call .AddContestStat
	ld a, [wContestMonMaxHP + 1]
	call .AddContestStat
	ld a, [wContestMonMaxHP + 1]
	call .AddContestStat
	ld a, [wContestMonMaxHP + 1]
	call .AddContestStat

	; Stats
	ld a, [wContestMonAttack  + 1]
	call .AddContestStat
	ld a, [wContestMonDefense + 1]
	call .AddContestStat
	ld a, [wContestMonSpeed   + 1]
	call .AddContestStat
	ld a, [wContestMonSpclAtk + 1]
	call .AddContestStat
	ld a, [wContestMonSpclDef + 1]
	call .AddContestStat

	; DVs
	ld a, [wContestMonDVs + 0]
	ld b, a
	and %0010
	add a
	add a
	ld c, a

	swap b
	ld a, b
	and %0010
	add a
	add c
	ld d, a

	ld a, [wContestMonDVs + 1]
	ld b, a
	and %0010
	ld c, a

	swap b
	ld a, b
	and %0010
	srl a
	add c
	add c
	add d
	add d

	call .AddContestStat

	; Remaining HP / 8
	ld a, [wContestMonHP + 1]
	srl a
	srl a
	srl a
	call .AddContestStat

	; Whether it's holding an item
	ld a, [wContestMonItem]
	and a
	jr z, .done

	ld a, 1
	call .AddContestStat

.done
	ret

.AddContestStat:
	ld hl, hMultiplicand
	add [hl]
	ld [hl], a
	ret nc
	dec hl
	inc [hl]
	ret
