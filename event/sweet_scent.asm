SweetScentFromMenu: ; 506bc
	ld hl, UnknownScript_0x506c8
	call QueueScript
	ld a, $1
	ld [wFieldMoveSucceeded], a
	ret
; 506c8

UnknownScript_0x506c8: ; 0x506c8
	reloadmappart
	special UpdateTimePals
	callasm GetPartyNick
	writetext UnknownText_0x50726
	waitbutton
	callasm SweetScentEncounter
	iffalse UnknownScript_0x506e9
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue UnknownScript_0x506e5
	randomwildmon
	startbattle
	reloadmapafterbattle
	end
; 0x506e5

UnknownScript_0x506e5: ; 0x506e5
	farjump BugCatchingContestBattleScript
; 0x506e9

UnknownScript_0x506e9: ; 0x506e9
	writetext UnknownText_0x5072b
	waitbutton
	closetext
	end
; 0x506ef

SweetScentEncounter: ; 506ef
	callba CanUseSweetScent
	jr nc, .no_battle
	ld hl, StatusFlags2
	bit 2, [hl]
	jr nz, .not_in_bug_contest
	callba GetMapEncounterRate
	ld a, b
	and a
	jr z, .no_battle
	callba ChooseWildEncounter
	jr nz, .no_battle
	jr .start_battle

.not_in_bug_contest
	callba ChooseWildEncounter_BugContest

.start_battle
	ld a, $1
	ld [ScriptVar], a
	ret

.no_battle
	xor a
	ld [ScriptVar], a
	ld [BattleType], a
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
