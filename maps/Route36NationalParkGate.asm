const_value set 2
	const ROUTE36NATIONALPARKGATE_OFFICER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER2
	const ROUTE36NATIONALPARKGATE_ROCKER
	const ROUTE36NATIONALPARKGATE_POKEFAN_M
	const ROUTE36NATIONALPARKGATE_YOUNGSTER3
	const ROUTE36NATIONALPARKGATE_YOUNGSTER4
	const ROUTE36NATIONALPARKGATE_LASS
	const ROUTE36NATIONALPARKGATE_YOUNGSTER5
	const ROUTE36NATIONALPARKGATE_YOUNGSTER6
	const ROUTE36NATIONALPARKGATE_YOUNGSTER7
	const ROUTE36NATIONALPARKGATE_OFFICER2

Route36NationalParkGate_MapScripts:
.SceneScripts:
	db 3
	scene_script .DummyScene0
	scene_script .DummyScene1
	scene_script .LeaveContestEarly

.MapCallbacks:
	db 2
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	priorityjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene 0
	return

.BugContestIsRunning:
	setscene 2
	return

.CheckIfContestAvailable:
	checkevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	iftrue .Return
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, .SetContestOfficer
	if_equal THURSDAY, .SetContestOfficer
	if_equal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE36NATIONALPARKGATE_OFFICER1
	disappear ROUTE36NATIONALPARKGATE_OFFICER2
.Return:
	return

.LeavingContestEarly:
	spriteface PLAYER, UP
	opentext
	checkcode VAR_CONTESTMINUTES
	addvar 1
	vartomem MEM_BUFFER_0
	writetext UnknownText_0x6b284
	yesorno
	iffalse .GoBackToContest
	writetext UnknownText_0x6b2c5
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	applymovement PLAYER, MovementData_0x6add1
	pause 15
	special Special_FadeInQuickly
	jumpstd bugcontestresults

.GoBackToContest:
	writetext UnknownText_0x6b300
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special Special_FadeOutPalettes
	waitsfx
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear ROUTE36NATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear ROUTE36NATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear ROUTE36NATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route36OfficerScriptContest:
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, _ContestNotOn
	if_equal MONDAY, _ContestNotOn
	if_equal WEDNESDAY, _ContestNotOn
	if_equal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	scall Route36ParkGate_DayToText
	writetext UnknownText_0x6add5
	yesorno
	iffalse .DecidedNotToJoinContest
	checkcode VAR_PARTYCOUNT
	if_greater_than 1, .LeaveMonsWithOfficer
	special Special_ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6ae87
	buttonsound
	waitsfx
	writetext UnknownText_0x6aeb1
	playsound SFX_ITEM
	waitsfx
	writetext UnknownText_0x6aecc
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special Special_GiveParkBalls
	spriteface PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special Special_FadeOutPalettes
	waitsfx
	special Special_SelectRandomBugContestContestants
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.LeaveMonsWithOfficer:
	checkcode VAR_PARTYCOUNT
	if_less_than PARTY_LENGTH, .ContinueLeavingMons
	checkcode VAR_BOXSPACE
	if_equal 0, .BoxFull
.ContinueLeavingMons:
	special Special_CheckFirstMonIsEgg
	if_equal TRUE, .FirstMonIsEgg
	writetext UnknownText_0x6afb0
	yesorno
	iffalse .RefusedToLeaveMons
	special Special_ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext UnknownText_0x6b021
	buttonsound
	writetext UnknownText_0x6b055
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	jump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext UnknownText_0x6b0c6
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext UnknownText_0x6b081
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext UnknownText_0x6b0f2
	waitbutton
	closetext
	end

.BoxFull:
	writetext UnknownText_0x6b166
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext UnknownText_0x6b209
	waitbutton
	closetext
	end

Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext UnknownText_0x6b32b
	waitbutton
	closetext
	end

.Sunstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem SUN_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	closetext
	end

.Everstone:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext UnknownText_0x6b910
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer UnknownText_0x6b370

OfficerScript_0x6acf4:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	writetext UnknownText_0x6b370
	waitbutton
	closetext
	end

Route36ParkGate_DayToText:
	jumpstd daytotext
	end

YoungsterScript_0x6ad06:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x6ad14
	writetext UnknownText_0x6b399
	waitbutton
	closetext
	end

UnknownScript_0x6ad14:
	writetext UnknownText_0x6b3c4
	waitbutton
	closetext
	end

YoungsterScript_0x6ad1a:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x6ad28
	writetext UnknownText_0x6b40f
	waitbutton
	closetext
	end

UnknownScript_0x6ad28:
	writetext UnknownText_0x6b440
	waitbutton
	closetext
	end

RockerScript_0x6ad2e:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x6ad3c
	writetext UnknownText_0x6b462
	waitbutton
	closetext
	end

UnknownScript_0x6ad3c:
	writetext UnknownText_0x6b496
	waitbutton
	closetext
	end

PokefanMScript_0x6ad42:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x6ad50
	writetext UnknownText_0x6b4da
	waitbutton
	closetext
	end

UnknownScript_0x6ad50:
	writetext UnknownText_0x6b50a
	waitbutton
	closetext
	end

YoungsterScript_0x6ad56:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x6ad64
	writetext UnknownText_0x6b54e
	waitbutton
	closetext
	end

UnknownScript_0x6ad64:
	writetext UnknownText_0x6b57c
	waitbutton
	closetext
	end

YoungsterScript_0x6ad6a:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x6ad78
	writetext UnknownText_0x6b5b0
	waitbutton
	closetext
	end

UnknownScript_0x6ad78:
	writetext UnknownText_0x6b5dd
	waitbutton
	closetext
	end

LassScript_0x6ad7e:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x6ad8c
	writetext UnknownText_0x6b64b
	waitbutton
	closetext
	end

UnknownScript_0x6ad8c:
	writetext UnknownText_0x6b698
	waitbutton
	closetext
	end

YoungsterScript_0x6ad92:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x6ada0
	writetext UnknownText_0x6b6b8
	waitbutton
	closetext
	end

UnknownScript_0x6ada0:
	writetext UnknownText_0x6b6e9
	waitbutton
	closetext
	end

YoungsterScript_0x6ada6:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x6adb4
	writetext UnknownText_0x6b71b
	waitbutton
	closetext
	end

UnknownScript_0x6adb4:
	writetext UnknownText_0x6b740
	waitbutton
	closetext
	end

YoungsterScript_0x6adba:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iffalse UnknownScript_0x6adc8
	writetext UnknownText_0x6b76f
	waitbutton
	closetext
	end

UnknownScript_0x6adc8:
	writetext UnknownText_0x6b7af
	waitbutton
	closetext
	end

UnknownScript_0x6adce:
	jumptext UnknownText_0x6b84c

MovementData_0x6add1:
	big_step DOWN
	big_step RIGHT
	turn_head UP
	step_end

UnknownText_0x6add5:
	text "Today's @"
	text_from_ram wStringBuffer3
	text "."
	line "That means the"

	para "Bug-Catching Con-"
	line "test is on today."

	para "The rules are sim-"
	line "ple."

	para "Using one of your"
	line "#MON, catch a"

	para "bug #MON to be"
	line "judged."

	para "Would you like to"
	line "give it a try?"
	done

UnknownText_0x6ae87:
	text "Here are the PARK"
	line "BALLS for the"
	cont "Contest."
	done

UnknownText_0x6aeb1:
	text "<PLAYER> received"
	line "20 PARK BALLS."
	done

UnknownText_0x6aecc:
	text "The person who"
	line "gets the strong-"
	cont "est bug #MON"
	cont "is the winner."

	para "You have 20"
	line "minutes."

	para "If you run out of"
	line "PARK BALLS, you're"
	cont "done."

	para "You can keep the"
	line "last #MON you"
	cont "catch as your own."

	para "Go out and catch"
	line "the strongest bug"

	para "#MON you can"
	line "find!"
	done

UnknownText_0x6afb0:
	text "Uh-oh…"

	para "You have more than"
	line "one #MON."

	para "You'll have to use"
	line "@"
	text_from_ram wStringBuffer3
	text ", the"

	para "first #MON in"
	line "your party."

	para "Is that OK with"
	line "you?"
	done

UnknownText_0x6b021:
	text "Fine, we'll hold"
	line "your other #MON"
	cont "while you compete."
	done

UnknownText_0x6b055:
	text "<PLAYER>'s #MON"
	line "were left with the"
	cont "CONTEST HELPER."
	done

UnknownText_0x6b081:
	text "Please choose the"
	line "#MON to be used"

	para "in the Contest,"
	line "then come see me."
	done

UnknownText_0x6b0c6:
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done

UnknownText_0x6b0f2:
	text "Uh-oh…"
	line "The first #MON"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

UnknownText_0x6b166:
	text "Uh-oh…"
	line "Both your party"

	para "and your PC BOX"
	line "are full."

	para "You have no room"
	line "to put the bug"
	cont "#MON you catch."

	para "Please make room"
	line "in your party or"

	para "your PC BOX, then"
	line "come see me."
	done

UnknownText_0x6b209:
	text "Uh-oh…"
	line "You have an EGG as"

	para "the first #MON"
	line "in your party."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

UnknownText_0x6b284:
	text "You still have @"
	text_from_ram wStringBuffer3
	text_start
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done

UnknownText_0x6b2c5:
	text "OK. Please wait"
	line "here for the"

	para "announcement of"
	line "the winners."
	done

UnknownText_0x6b300:
	text "OK. Please go back"
	line "outside and finish"
	cont "up."
	done

UnknownText_0x6b32b:
	text "Today's Contest is"
	line "over. We hope you"

	para "will participate"
	line "in the future."
	done

UnknownText_0x6b370:
	text "Some #MON can"
	line "only be seen in"
	cont "the PARK."
	done

UnknownText_0x6b399:
	text "DON: Wow, you beat"
	line "me. You're pretty"
	cont "good."
	done

UnknownText_0x6b3c4:
	text "DON: Luck plays a"
	line "big part in this."

	para "You never know"
	line "what #MON will"
	cont "appear."
	done

UnknownText_0x6b40f:
	text "ED: I envy you."
	line "I just couldn't"
	cont "do it this time."
	done

UnknownText_0x6b440:
	text "ED: Maybe you win"
	line "with big #MON?"
	done

UnknownText_0x6b462:
	text "NICK: Well done!"
	line "I'm going to raise"
	cont "my #MON better."
	done

UnknownText_0x6b496:
	text "NICK: Maybe you"
	line "get a higher score"

	para "for a #MON of"
	line "an unusual color."
	done

UnknownText_0x6b4da:
	text "WILLIAM: You're"
	line "the winner? What"
	cont "did you catch?"
	done

UnknownText_0x6b50a:
	text "WILLIAM: Well, I'm"
	line "satisfied because"

	para "I caught a #MON"
	line "that I wanted."
	done

UnknownText_0x6b54e:
	text "BENNY: Congrats!"
	line "You have earned my"
	cont "respect!"
	done

UnknownText_0x6b57c:
	text "BENNY: I caught a"
	line "SCYTHER before,"
	cont "but I didn't win."
	done

UnknownText_0x6b5b0:
	text "BARRY: That #-"
	line "MON you caught…"
	cont "it's awesome!"
	done

UnknownText_0x6b5dd:
	text "BARRY: It's easier"
	line "to win if you get"

	para "a high-level bug"
	line "#MON."

	para "But I think they"
	line "also consider some"
	cont "other points."
	done

UnknownText_0x6b64b:
	text "CINDY: You won?"
	line "That's great!"

	para "Do you feel like"
	line "looking for bug"
	cont "#MON with me?"
	done

UnknownText_0x6b698:
	text "CINDY: I really"
	line "love bug #MON!"
	done

UnknownText_0x6b6b8:
	text "JOSH: I… I can't"
	line "believe I lost at"
	cont "bug-catching…"
	done

UnknownText_0x6b6e9:
	text "JOSH: I heard that"
	line "somebody won with"
	cont "a CATERPIE!"
	done

UnknownText_0x6b71b:
	text "SAMUEL: Next time,"
	line "I'm going to win."
	done

UnknownText_0x6b740:
	text "SAMUEL: Darn."
	line "I thought I would"
	cont "score higher…"
	done

UnknownText_0x6b76f:
	text "KIPP: Could you"
	line "give me some tips?"

	para "I want to study"
	line "your style."
	done

UnknownText_0x6b7af:
	text "KIPP: I study a"
	line "lot, but that's"

	para "not good enough to"
	line "win."
	done

; This text is unused and unreferenced in the final game.
; The tree Pokémon is Sudowoodo.
; The Silph Scope 2 was later reworked into the Squirtbottle.
UnusedSudowoodoText:
	text "I hear there's a"
	line "#MON that looks"
	cont "just like a tree."

	para "You can reveal its"
	line "identity using a"
	cont "SILPHSCOPE 2."
	done

UnknownText_0x6b84c:
	text "The Bug-Catching"
	line "Contest is held on"

	para "Tuesday, Thursday"
	line "and Saturday."

	para "Not only do you"
	line "earn a prize just"

	para "for participating,"
	line "you also get to"

	para "keep the bug"
	line "#MON you may"

	para "have at the end of"
	line "the contest."
	done

UnknownText_0x6b910:
	text "Uh-oh… Your PACK"
	line "is full."

	para "We'll hold on to"
	line "your prize, but"
	cont "only for today."

	para "Please make room,"
	line "then come see me."
	done

UnknownText_0x6b97f:
	text "<PLAYER>?"

	para "Here's the prize"
	line "we were holding"
	cont "for you."
	done

Route36NationalParkGate_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 0, 4, 1, NATIONAL_PARK
	warp_def 0, 5, 2, NATIONAL_PARK
	warp_def 9, 4, 1, ROUTE_36
	warp_def 9, 5, 2, ROUTE_36

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 6, 0, BGEVENT_READ, MapRoute36NationalParkGateSignpost0Script

.ObjectEvents:
	db 12
	object_event 0, 3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36OfficerScriptContest, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event 2, 5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, YoungsterScript_0x6ad06, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event 4, 5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YoungsterScript_0x6ad1a, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event 2, 6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RockerScript_0x6ad2e, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event 6, 5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanMScript_0x6ad42, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event 2, 7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, YoungsterScript_0x6ad56, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event 5, 6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YoungsterScript_0x6ad6a, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event 3, 6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LassScript_0x6ad7e, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event 4, 7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, YoungsterScript_0x6ad92, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event 6, 7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, YoungsterScript_0x6ada6, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event 6, 6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, YoungsterScript_0x6adba, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event 3, 2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OfficerScript_0x6acf4, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
