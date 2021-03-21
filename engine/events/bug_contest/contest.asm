GiveParkBalls:
	xor a
	ld [wContestMon], a
	ld a, BUG_CONTEST_BALLS
	ld [wParkBallsRemaining], a
	farcall StartBugContestTimer
	ret

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

BugCatchingContestReturnToGateScript:
	closetext
	jumpstd BugContestResultsWarpScript

BugCatchingContestTimeUpText:
	text_far _BugCatchingContestTimeUpText
	text_end

BugCatchingContestIsOverText:
	text_far _BugCatchingContestIsOverText
	text_end
