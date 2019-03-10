GiveParkBalls:
	xor a
	ld [wContestMon], a
	ld a, 20
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
	writetext BugCatchingContestText_BeeepTimesUp
	waitbutton
	sjump BugCatchingContestReturnToGateScript

BugCatchingContestOutOfBallsScript:
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestText_ContestIsOver
	waitbutton

BugCatchingContestReturnToGateScript:
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
