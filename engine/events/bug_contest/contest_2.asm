SelectRandomBugContestContestants:
; Select five random people to participate in the current contest.

; First we have to make sure that any old data is cleared away.
	ld c, NUM_BUG_CONTESTANTS
	ld hl, BugCatchingContestantEventFlagTable
.loop1
	push bc
	push hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, RESET_FLAG
	call EventFlagAction
	pop hl
	inc hl
	inc hl
	pop bc
	dec c
	jr nz, .loop1

; Now that that's out of the way, we can get on to the good stuff.
	ld c, 5
.loop2
	push bc
.next
; Choose a flag at uniform random to be set.
	call Random
	cp $ff / NUM_BUG_CONTESTANTS * NUM_BUG_CONTESTANTS
	jr nc, .next
	ld c, $ff / NUM_BUG_CONTESTANTS
	call SimpleDivide
	ld e, b
	ld d, 0
	ld hl, BugCatchingContestantEventFlagTable
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
; If we've already set it, it doesn't count.
	ld b, CHECK_FLAG
	call EventFlagAction
	pop de
	ld a, c
	and a
	jr nz, .next
; Set the flag.  This will cause that sprite to not be visible in the contest.
	ld b, SET_FLAG
	call EventFlagAction
	pop bc
; Check if we're done.  If so, return.  Otherwise, choose the next victim.
	dec c
	jr nz, .loop2
	ret

CheckBugContestContestantFlag:
; Checks the flag of the Bug Catching Contestant whose index is loaded in a.

	ld hl, BugCatchingContestantEventFlagTable
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, CHECK_FLAG
	call EventFlagAction
	ret

INCLUDE "data/events/bug_contest_flags.asm"

ContestDropOffMons:
	ld hl, wPartyMon1HP
	ld a, [hli]
	or [hl]
	jr z, .fainted
; Mask the rest of your party by setting the count to 1...
	ld hl, wPartyCount
	ld a, 1
	ld [hli], a
	inc hl
; ... backing up the second mon index somewhere...
	ld a, [hl]
	ld [wBugContestSecondPartySpecies], a
; ... and replacing it with the terminator byte
	ld [hl], -1
	xor a
	ld [wScriptVar], a
	ret

.fainted
	ld a, $1
	ld [wScriptVar], a
	ret

ContestReturnMons:
; Restore the species of the second mon.
	ld hl, wPartySpecies + 1
	ld a, [wBugContestSecondPartySpecies]
	ld [hl], a
; Restore the party count, which must be recomputed.
	ld b, 1
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	inc b
	jr .loop

.done
	ld a, b
	ld [wPartyCount], a
	ret
