INCLUDE "macros/rst.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "macros/scripts/text.inc"
INCLUDE "constants/battle_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/sfx_constants.inc"
INCLUDE "constants/std_constants.inc"


SECTION "engine/events/bug_contest/contest@GiveParkBalls", ROMX

GiveParkBalls::
	xor a
	ld [wContestMon], a
	ld a, 20
	ld [wParkBallsRemaining], a
	farcall StartBugContestTimer
	ret


SECTION "engine/events/bug_contest/contest@BugCatchingContestBattleScript", ROMX

BugCatchingContestBattleScript::
	loadvar VAR_BATTLETYPE, BATTLETYPE_CONTEST
	randomwildmon
	startbattle
	reloadmapafterbattle
	readmem wParkBallsRemaining
	iffalse BugCatchingContestOutOfBallsScript
	end

BugCatchingContestOverScript::
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestTimeUpText
	waitbutton
	sjump BugCatchingContestReturnToGateScript

BugCatchingContestOutOfBallsScript:
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestIsOverText
	waitbutton

BugCatchingContestReturnToGateScript::
	closetext
	jumpstd bugcontestresultswarp

BugCatchingContestTimeUpText:
	text_far _BugCatchingContestTimeUpText
	text_end

BugCatchingContestIsOverText:
	text_far _BugCatchingContestIsOverText
	text_end
