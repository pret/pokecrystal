INCLUDE "macros/enum.inc"
INCLUDE "macros/rst.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "macros/scripts/text.inc"
INCLUDE "constants/battle_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/sfx_constants.inc"
INCLUDE "constants/std_constants.inc"


SECTION "engine/events/bug_contest/contest.asm@GiveParkBalls", ROMX

GiveParkBalls::
	xor a
	ld [wContestMon], a
	ld a, 20
	ld [wParkBallsRemaining], a
	farcall StartBugContestTimer
	ret


SECTION "engine/events/bug_contest/contest.asm@BugCatchingContestBattleScript", ROMX

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
	writetext BugCatchingContestText_BeeepTimesUp
	waitbutton
	sjump BugCatchingContestReturnToGateScript

BugCatchingContestOutOfBallsScript:
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestText_ContestIsOver
	waitbutton

BugCatchingContestReturnToGateScript::
	closetext
	jumpstd bugcontestresultswarp

BugCatchingContestText_BeeepTimesUp:
	; ANNOUNCER: BEEEP! Time's up!
	text_far UnknownText_0x1bd2ca
	text_end

BugCatchingContestText_ContestIsOver:
	; ANNOUNCER: The Contest is over!
	text_far UnknownText_0x1bd2e7
	text_end
