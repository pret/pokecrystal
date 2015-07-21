KurtsHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, UnknownScript_0x18e154

UnknownScript_0x18e154:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse UnknownScript_0x18e177
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue UnknownScript_0x18e177
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue UnknownScript_0x18e16f
	disappear $5
	appear $2
	disappear $6
	appear $3
	return

UnknownScript_0x18e16f:
	disappear $2
	appear $5
	disappear $3
	appear $6
UnknownScript_0x18e177:
	return

KurtScript_0x18e178:
	faceplayer
	loadfont
	checkevent EVENT_KURT_GAVE_YOU_LURE_BALL
	iftrue .GotLureBall
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .ClearedSlowpokeWell
	writetext UnknownText_0x18e473
	closetext
	loadmovesprites
	special Functionc48f
	setevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	checkcode VAR_FACING
	if_equal UP, .RunAround
	spriteface $0, DOWN
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e466
	playsound SFX_EXIT_BUILDING
	disappear $2
	waitbutton
	special RestartMapMusic
	end

.RunAround:
	spriteface $0, DOWN
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e46c
	playsound SFX_EXIT_BUILDING
	disappear $2
	waitbutton
	special RestartMapMusic
	end

.ClearedSlowpokeWell:
	writetext UnknownText_0x18e615
	keeptextopen
	verbosegiveitem LURE_BALL, 1
	iffalse .NoRoomForBall
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
.GotLureBall:
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue .WaitForApricorns
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	checkevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	iftrue .CanGiveGSBallToKurt
.NoGSBall:
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue .CheckApricorns
	checkevent EVENT_DRAGON_SHRINE_QUESTION_2
	iftrue .CheckApricorns
	writetext UnknownText_0x18e6c9
	closetext
.CheckApricorns:
	checkitem RED_APRICORN
	iftrue .AskApricorn
	checkitem BLU_APRICORN
	iftrue .AskApricorn
	checkitem YLW_APRICORN
	iftrue .AskApricorn
	checkitem GRN_APRICORN
	iftrue .AskApricorn
	checkitem WHT_APRICORN
	iftrue .AskApricorn
	checkitem BLK_APRICORN
	iftrue .AskApricorn
	checkitem PNK_APRICORN
	iftrue .AskApricorn
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_DRAGON_SHRINE_QUESTION_2
	iftrue .IMakeBallsFromApricorns
	loadmovesprites
	end

.IMakeBallsFromApricorns:
	writetext UnknownText_0x18e6c9
	closetext
	loadmovesprites
	end

.AskApricorn:
	writetext UnknownText_0x18e736
	keeptextopen
	setevent EVENT_DRAGON_SHRINE_QUESTION_2
	special Function88018
	if_equal $0, .Cancel
	if_equal BLU_APRICORN, .Blu
	if_equal YLW_APRICORN, .Ylw
	if_equal GRN_APRICORN, .Grn
	if_equal WHT_APRICORN, .Wht
	if_equal BLK_APRICORN, .Blk
	if_equal PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	jump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	jump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	jump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	jump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	jump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	jump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
	jump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_GAVE_KURT_APRICORNS
	setflag ENGINE_KURT_MAKING_BALLS
.WaitForApricorns:
	writetext UnknownText_0x18e779
	closetext
	loadmovesprites
	end

.Cancel:
	writetext UnknownText_0x18e7bc
	closetext
	loadmovesprites
	end

._ThatTurnedOutGreat:
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
.ThatTurnedOutGreat:
	writetext UnknownText_0x18e82a
	closetext
.NoRoomForBall:
	loadmovesprites
	end

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 LEVEL_BALL, $16
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	jump ._ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 LURE_BALL, $16
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	jump ._ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 MOON_BALL, $16
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	jump ._ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 FRIEND_BALL, $16
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	jump ._ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 FAST_BALL, $16
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	jump ._ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 HEAVY_BALL, $16
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	jump ._ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 LOVE_BALL, $16
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	jump ._ThatTurnedOutGreat

.CanGiveGSBallToKurt:
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue .GaveGSBallToKurt
	checkitem GS_BALL
	iffalse .NoGSBall
	writetext UnknownText_0x18e8ab
	closetext
	loadmovesprites
	setevent EVENT_GAVE_GS_BALL_TO_KURT
	takeitem GS_BALL, 1
	setflag ENGINE_KURT_MAKING_BALLS
	end

.GaveGSBallToKurt:
	checkflag ENGINE_KURT_MAKING_BALLS
	iffalse .NotMakingBalls
	writetext UnknownText_0x18e934
	closetext
	writetext UnknownText_0x18e949
	closetext
	loadmovesprites
	end

.NotMakingBalls:
	writetext UnknownText_0x18e95c
	closetext
	loadmovesprites
	setevent EVENT_FOREST_IS_RESTLESS
	clearevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	clearevent EVENT_GAVE_GS_BALL_TO_KURT
	special Functionc48f
	pause 20
	showemote EMOTE_SHOCK, $2, 30
	checkcode VAR_FACING
	if_equal UP, .GSBallRunAround
	spriteface $0, DOWN
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e466
	jump .KurtHasLeftTheBuilding

.GSBallRunAround:
	spriteface $0, DOWN
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e46c
.KurtHasLeftTheBuilding:
	playsound SFX_EXIT_BUILDING
	disappear $2
	clearevent EVENT_AZALEA_TOWN_KURT
	waitbutton
	special RestartMapMusic
	domaptrigger GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN, $2
	end

KurtScript_0x18e3bd:
	faceplayer
	loadfont
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue KurtScript_ImCheckingItNow
KurtMakingBallsScript:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalse Script_FirstTimeBuggingKurt
	writetext UnknownText_0x18e7d8
	closetext
	loadmovesprites
	spriteface $5, UP
	end

Script_FirstTimeBuggingKurt:
	writetext UnknownText_0x18e863
	closetext
	loadmovesprites
	spriteface $5, UP
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end

KurtScript_ImCheckingItNow:
	writetext UnknownText_0x18e934
	closetext
	spriteface $5, UP
	writetext UnknownText_0x18e949
	closetext
	loadmovesprites
	end

KurtsGranddaughter1:
	faceplayer
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue KurtsGranddaughter2Subscript
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue KurtsGranddaughterFunScript
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .Lonely
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .Dad
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SlowpokeBack
	checkevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	iftrue .Lonely
	loadfont
	writetext KurtsGranddaughterSlowpokeGoneText
	closetext
	loadmovesprites
	end

.SlowpokeBack
	loadfont
	writetext KurtsGranddaughterSlowpokeBackText
	closetext
	loadmovesprites
	end

.Lonely
	loadfont
	writetext KurtsGranddaughterLonelyText
	closetext
	loadmovesprites
	end

.Dad
	loadfont
	writetext KurtsGranddaughterDadText
	closetext
	loadmovesprites
	end

KurtsGranddaughter2:
	faceplayer
KurtsGranddaughter2Subscript:
	loadfont
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue .GSBall
	writetext KurtsGranddaughterHelpText
	closetext
	loadmovesprites
	spriteface $6, RIGHT
	end

.GSBall
	writetext KurtsGranddaughterGSBallText
	closetext
	loadmovesprites
	spriteface $6, RIGHT
	end

KurtsGranddaughterFunScript:
	loadfont
	writetext KurtsGranddaughterFunText
	closetext
	loadmovesprites
	end

KurtsHouseSlowpoke:
	faceplayer
	loadfont
	writetext KurtsHouseSlowpokeText
	cry SLOWPOKE
	closetext
	loadmovesprites
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseCelebiStatue:
	jumptext KurtsHouseCelebiStatueText

KurtsHouseBookshelf:
	jumpstd difficultbookshelf

KurtsHouseRadio:
	jumpstd radio2

MovementData_0x18e466:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_0x18e46c:
	big_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

UnknownText_0x18e473:
	text "Hm? Who are you?"

	para "<PLAYER>, eh? You"
	line "want me to make"
	cont "some BALLS?"

	para "Sorry, but that'll"
	line "have to wait."

	para "Do you know TEAM"
	line "ROCKET? Ah, don't"

	para "worry. I'll tell"
	line "you anyhow."

	para "TEAM ROCKET's an"
	line "evil gang that"

	para "uses #MON for"
	line "their dirty work."

	para "They're supposed"
	line "to have disbanded"
	cont "three years ago."

	para "Anyway, they're at"
	line "the WELL, cutting"

	para "off SLOWPOKETAILS"
	line "for sale!"

	para "So I'm going to"
	line "go give them a"
	cont "lesson in pain!"

	para "Hang on, SLOWPOKE!"
	line "Old KURT is on his"
	cont "way!"
	done

UnknownText_0x18e615:
	text "KURT: Hi, <PLAYER>!"

	para "You handled your-"
	line "self like a real"
	cont "hero at the WELL."

	para "I like your style!"

	para "I would be honored"
	line "to make BALLS for"

	para "a trainer like"
	line "you."

	para "This is all I have"
	line "now, but take it."
	done

UnknownText_0x18e6c9:
	text "KURT: I make BALLS"
	line "from APRICORNS."

	para "Collect them from"
	line "trees and bring"
	cont "'em to me."

	para "I'll make BALLS"
	line "out of them."
	done

UnknownText_0x18e736:
	text "KURT: You have an"
	line "APRICORN for me?"

	para "Fine! I'll turn it"
	line "into a BALL."
	done

UnknownText_0x18e779:
	text "KURT: It'll take a"
	line "day to make you a"

	para "BALL. Come back"
	line "for it later."
	done

UnknownText_0x18e7bc:
	text "KURT: Oh…"
	line "That's a letdown."
	done

UnknownText_0x18e7d8:
	text "KURT: I'm working!"
	line "Don't bother me!"
	done

UnknownText_0x18e7fb:
	text "KURT: Ah, <PLAYER>!"
	line "I just finished"
	cont "your BALL. Here!"
	done

UnknownText_0x18e82a:
	text "KURT: That turned"
	line "out great."

	para "Try catching"
	line "#MON with it."
	done

UnknownText_0x18e863:
	text "KURT: Now that my"
	line "granddaughter is"

	para "helping me, I can"
	line "work much faster."
	done

UnknownText_0x18e8ab:
	text "Wh-what is that?"

	para "I've never seen"
	line "one before."

	para "It looks a lot"
	line "like a # BALL,"

	para "but it appears to"
	line "be something else."

	para "Let me check it"
	line "for you."
	done

UnknownText_0x18e934:
	text "I'm checking it"
	line "now."
	done

UnknownText_0x18e949:
	text "Ah-ha! I see!"
	line "So…"
	done

UnknownText_0x18e95c:
	text "<PLAYER>!"

	para "This BALL started"
	line "to shake while I"
	cont "was checking it."

	para "There must be"
	line "something to this!"
	done

KurtsGranddaughterSlowpokeGoneText:
	text "The SLOWPOKE are"
	line "gone… Were they"

	para "taken away by bad"
	line "people?"
	done

KurtsGranddaughterLonelyText:
	text "Grandpa's gone…"
	line "I'm so lonely…"
	done

KurtsGranddaughterSlowpokeBackText:
	text "The SLOWPOKE my"
	line "dad gave me came"

	para "back! Its TAIL is"
	line "growing back too!"
	done

KurtsGranddaughterDadText:
	text "Dad works at SILPH"
	line "where he studies"
	cont "# BALLS."

	para "I have to stay"
	line "home with Grandpa"
	cont "and SLOWPOKE."
	done

KurtsGranddaughterHelpText:
	text "I get to help"
	line "Grandpa now!"

	para "We'll make good"
	line "BALLS for you, so"
	cont "please wait!"
	done

KurtsGranddaughterFunText:
	text "It's fun to make"
	line "BALLS!"
	done

KurtsGranddaughterGSBallText:
	text "Grandpa's checking"
	line "a BALL right now."

	para "So I'm waiting"
	line "till he's done."
	done

KurtsHouseSlowpokeText:
	text "SLOWPOKE: …"
	line "Yawn?"
	done

KurtsHouseOakPhotoText:
	text "…A young PROF."
	line "OAK?"
	done

KurtsHouseCelebiStatueText:
	text "It's a statue of"
	line "the forest's pro-"
	cont "tector."
	done

KurtsHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $3, 4, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $7, $4, 4, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 7
	signpost 1, 6, SIGNPOST_READ, KurtsHouseRadio
	signpost 0, 8, SIGNPOST_READ, KurtsHouseOakPhoto
	signpost 0, 9, SIGNPOST_READ, KurtsHouseOakPhoto
	signpost 1, 5, SIGNPOST_READ, KurtsHouseBookshelf
	signpost 1, 2, SIGNPOST_READ, KurtsHouseBookshelf
	signpost 1, 3, SIGNPOST_READ, KurtsHouseBookshelf
	signpost 1, 4, SIGNPOST_READ, KurtsHouseCelebiStatue

.PersonEvents:
	db 5
	person_event SPRITE_KURT, 6, 7, OW_UP | $2, $0, -1, -1, $0, 0, KurtScript_0x18e178, EVENT_KURTS_HOUSE_KURT_1
	person_event SPRITE_TWIN, 7, 9, OW_DOWN | $3, $0, -1, -1, $0, 0, KurtsGranddaughter1, EVENT_KURTS_HOUSE_GRANDDAUGHTER_1
	person_event SPRITE_SLOWPOKE, 7, 10, OW_DOWN | $1, $0, -1, -1, $0, 0, KurtsHouseSlowpoke, EVENT_KURTS_HOUSE_SLOWPOKE
	person_event SPRITE_KURT, 7, 18, OW_UP | $3, $0, -1, -1, $0, 0, KurtScript_0x18e3bd, EVENT_KURTS_HOUSE_KURT_2
	person_event SPRITE_TWIN, 8, 15, OW_LEFT | $1, $0, -1, -1, $0, 0, KurtsGranddaughter2, EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
