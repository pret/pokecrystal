const_value set 2
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_TWIN1
	const KURTSHOUSE_SLOWPOKE
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_TWIN2

KurtsHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, UnknownScript_0x18e154

UnknownScript_0x18e154:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse UnknownScript_0x18e177
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue UnknownScript_0x18e177
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue UnknownScript_0x18e16f
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	disappear KURTSHOUSE_TWIN2
	appear KURTSHOUSE_TWIN1
	return

UnknownScript_0x18e16f:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
	disappear KURTSHOUSE_TWIN1
	appear KURTSHOUSE_TWIN2
UnknownScript_0x18e177:
	return

KurtScript_0x18e178:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_LURE_BALL
	iftrue .GotLureBall
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .ClearedSlowpokeWell
	writetext UnknownText_0x18e473
	waitbutton
	closetext
	special Special_FadeOutMusic
	setevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	checkcode VAR_FACING
	if_equal UP, .RunAround
	spriteface PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, MovementData_0x18e466
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.RunAround:
	spriteface PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, MovementData_0x18e46c
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.ClearedSlowpokeWell:
	writetext UnknownText_0x18e615
	buttonsound
	verbosegiveitem LURE_BALL
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
	waitbutton
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
	closetext
	end

.IMakeBallsFromApricorns:
	writetext UnknownText_0x18e6c9
	waitbutton
	closetext
	end

.AskApricorn:
	writetext UnknownText_0x18e736
	buttonsound
	setevent EVENT_DRAGON_SHRINE_QUESTION_2
	special Special_SelectApricornForKurt
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
	waitbutton
	closetext
	end

.Cancel:
	writetext UnknownText_0x18e7bc
	waitbutton
	closetext
	end

._ThatTurnedOutGreat:
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
.ThatTurnedOutGreat:
	writetext UnknownText_0x18e82a
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 LEVEL_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	jump ._ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 LURE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	jump ._ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 MOON_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	jump ._ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 FRIEND_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	jump ._ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 FAST_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	jump ._ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 HEAVY_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	jump ._ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext UnknownText_0x18e7fb
	buttonsound
	verbosegiveitem2 LOVE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	jump ._ThatTurnedOutGreat

.CanGiveGSBallToKurt:
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue .GaveGSBallToKurt
	checkitem GS_BALL
	iffalse .NoGSBall
	writetext UnknownText_0x18e8ab
	waitbutton
	closetext
	setevent EVENT_GAVE_GS_BALL_TO_KURT
	takeitem GS_BALL
	setflag ENGINE_KURT_MAKING_BALLS
	end

.GaveGSBallToKurt:
	checkflag ENGINE_KURT_MAKING_BALLS
	iffalse .NotMakingBalls
	writetext UnknownText_0x18e934
	waitbutton
	writetext UnknownText_0x18e949
	waitbutton
	closetext
	end

.NotMakingBalls:
	writetext UnknownText_0x18e95c
	waitbutton
	closetext
	setevent EVENT_FOREST_IS_RESTLESS
	clearevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	clearevent EVENT_GAVE_GS_BALL_TO_KURT
	special Special_FadeOutMusic
	pause 20
	showemote EMOTE_SHOCK, KURTSHOUSE_KURT1, 30
	checkcode VAR_FACING
	if_equal UP, .GSBallRunAround
	spriteface PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, MovementData_0x18e466
	jump .KurtHasLeftTheBuilding

.GSBallRunAround:
	spriteface PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, MovementData_0x18e46c
.KurtHasLeftTheBuilding:
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	clearevent EVENT_AZALEA_TOWN_KURT
	waitsfx
	special RestartMapMusic
	domaptrigger AZALEA_TOWN, $2
	end

KurtScript_0x18e3bd:
	faceplayer
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue KurtScript_ImCheckingItNow
KurtMakingBallsScript:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalse Script_FirstTimeBuggingKurt
	writetext UnknownText_0x18e7d8
	waitbutton
	closetext
	spriteface KURTSHOUSE_KURT2, UP
	end

Script_FirstTimeBuggingKurt:
	writetext UnknownText_0x18e863
	waitbutton
	closetext
	spriteface KURTSHOUSE_KURT2, UP
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end

KurtScript_ImCheckingItNow:
	writetext UnknownText_0x18e934
	waitbutton
	spriteface KURTSHOUSE_KURT2, UP
	writetext UnknownText_0x18e949
	waitbutton
	closetext
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
	opentext
	writetext KurtsGranddaughterSlowpokeGoneText
	waitbutton
	closetext
	end

.SlowpokeBack:
	opentext
	writetext KurtsGranddaughterSlowpokeBackText
	waitbutton
	closetext
	end

.Lonely:
	opentext
	writetext KurtsGranddaughterLonelyText
	waitbutton
	closetext
	end

.Dad:
	opentext
	writetext KurtsGranddaughterDadText
	waitbutton
	closetext
	end

KurtsGranddaughter2:
	faceplayer
KurtsGranddaughter2Subscript:
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue .GSBall
	writetext KurtsGranddaughterHelpText
	waitbutton
	closetext
	spriteface KURTSHOUSE_TWIN2, RIGHT
	end

.GSBall:
	writetext KurtsGranddaughterGSBallText
	waitbutton
	closetext
	spriteface KURTSHOUSE_TWIN2, RIGHT
	end

KurtsGranddaughterFunScript:
	opentext
	writetext KurtsGranddaughterFunText
	waitbutton
	closetext
	end

KurtsHouseSlowpoke:
	faceplayer
	opentext
	writetext KurtsHouseSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
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
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_0x18e46c:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
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
	warp_def $7, $3, 4, AZALEA_TOWN
	warp_def $7, $4, 4, AZALEA_TOWN

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
	person_event SPRITE_KURT, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KurtScript_0x18e178, EVENT_KURTS_HOUSE_KURT_1
	person_event SPRITE_TWIN, 3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KurtsGranddaughter1, EVENT_KURTS_HOUSE_GRANDDAUGHTER_1
	person_event SPRITE_SLOWPOKE, 3, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KurtsHouseSlowpoke, EVENT_KURTS_HOUSE_SLOWPOKE
	person_event SPRITE_KURT, 3, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KurtScript_0x18e3bd, EVENT_KURTS_HOUSE_KURT_2
	person_event SPRITE_TWIN, 4, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KurtsGranddaughter2, EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
