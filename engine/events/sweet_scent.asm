SweetScentFromMenu: ; 506bc
	ld hl, .SweetScent
	call QueueScript
	ld a, $1
	ld [wFieldMoveSucceeded], a
	ret
; 506c8

.SweetScent: ; 0x506c8
	reloadmappart
	special UpdateTimePals
	callasm GetPartyNick
	writetext UnknownText_0x50726
	waitbutton
	callasm SweetScentEncounter
	iffalse SweetScentNothing
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugCatchingContest
	randomwildmon
	startbattle
	reloadmapafterbattle
	end
; 0x506e5

.BugCatchingContest: ; 0x506e5
	farjump BugCatchingContestBattleScript
; 0x506e9

SweetScentNothing: ; 0x506e9
	writetext UnknownText_0x5072b
	waitbutton
	closetext
	end
; 0x506ef

SweetScentEncounter: ; 506ef
	farcall CanUseSweetScent
	jr nc, .no_battle
	ld hl, wStatusFlags2
	bit 2, [hl]
	jr nz, .not_in_bug_contest
	farcall GetMapEncounterRate
	ld a, b
	and a
	jr z, .no_battle
	farcall ChooseWildEncounter
	jr nz, .no_battle
	jr .start_battle

.not_in_bug_contest
	farcall ChooseWildEncounter_BugContest

.start_battle
	ld a, $1
	ld [wScriptVar], a
	ret

.no_battle
	xor a
	ld [wScriptVar], a
	ld [wBattleType], a
	ret
; 50726

UnknownText_0x50726: ; 0x50726
	; used SWEET SCENT!
	text_jump UnknownText_0x1c0b03
	db "@"
; 0x5072b

UnknownText_0x5072b: ; 0x5072b
	; Looks like there's nothing here…
	text_jump UnknownText_0x1c0b1a
	db "@"
; 0x50730
