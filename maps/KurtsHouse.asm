KurtsHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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
	checkevent EVENT_035
	iftrue UnknownScript_0x18e1cc
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue UnknownScript_0x18e1bf
	writetext UnknownText_0x18e473
	closetext
	loadmovesprites
	special Functionc48f
	setevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	checkcode VAR_FACING
	if_equal $1, UnknownScript_0x18e1ab
	spriteface $0, DOWN
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e466
	playsound SFX_EXIT_BUILDING
	disappear $2
	waitbutton
	special RestartMapMusic
	end

UnknownScript_0x18e1ab:
	spriteface $0, DOWN
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e46c
	playsound SFX_EXIT_BUILDING
	disappear $2
	waitbutton
	special RestartMapMusic
	end

UnknownScript_0x18e1bf:
	writetext UnknownText_0x18e615
	keeptextopen
	verbosegiveitem LURE_BALL, 1
	iffalse UnknownScript_0x18e2b2
	setevent EVENT_035
UnknownScript_0x18e1cc:
	checkevent EVENT_000
	iftrue UnknownScript_0x18e29f
	checkevent EVENT_258
	iftrue UnknownScript_0x18e2b4
	checkevent EVENT_259
	iftrue UnknownScript_0x18e2ca
	checkevent EVENT_25A
	iftrue UnknownScript_0x18e2e0
	checkevent EVENT_25B
	iftrue UnknownScript_0x18e2f6
	checkevent EVENT_25C
	iftrue UnknownScript_0x18e30c
	checkevent EVENT_25D
	iftrue UnknownScript_0x18e322
	checkevent EVENT_25E
	iftrue UnknownScript_0x18e338
	checkevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	iftrue UnknownScript_0x18e34e
UnknownScript_0x18e202:
	checkevent EVENT_001
	iftrue UnknownScript_0x18e212
	checkevent EVENT_002
	iftrue UnknownScript_0x18e212
	writetext UnknownText_0x18e6c9
	closetext
UnknownScript_0x18e212:
	checkitem RED_APRICORN
	iftrue UnknownScript_0x18e249
	checkitem BLU_APRICORN
	iftrue UnknownScript_0x18e249
	checkitem YLW_APRICORN
	iftrue UnknownScript_0x18e249
	checkitem GRN_APRICORN
	iftrue UnknownScript_0x18e249
	checkitem WHT_APRICORN
	iftrue UnknownScript_0x18e249
	checkitem BLK_APRICORN
	iftrue UnknownScript_0x18e249
	checkitem PNK_APRICORN
	iftrue UnknownScript_0x18e249
	checkevent EVENT_001
	iftrue UnknownScript_0x18e2ae
	checkevent EVENT_002
	iftrue UnknownScript_0x18e243
	loadmovesprites
	end

UnknownScript_0x18e243:
	writetext UnknownText_0x18e6c9
	closetext
	loadmovesprites
	end

UnknownScript_0x18e249:
	writetext UnknownText_0x18e736
	keeptextopen
	setevent EVENT_002
	special Function88018
	if_equal $0, UnknownScript_0x18e2a5
	if_equal $59, UnknownScript_0x18e275
	if_equal $5c, UnknownScript_0x18e27b
	if_equal $5d, UnknownScript_0x18e281
	if_equal $61, UnknownScript_0x18e287
	if_equal $63, UnknownScript_0x18e28d
	if_equal $65, UnknownScript_0x18e293
	setevent EVENT_258
	jump UnknownScript_0x18e299

UnknownScript_0x18e275:
	setevent EVENT_259
	jump UnknownScript_0x18e299

UnknownScript_0x18e27b:
	setevent EVENT_25A
	jump UnknownScript_0x18e299

UnknownScript_0x18e281:
	setevent EVENT_25B
	jump UnknownScript_0x18e299

UnknownScript_0x18e287:
	setevent EVENT_25C
	jump UnknownScript_0x18e299

UnknownScript_0x18e28d:
	setevent EVENT_25D
	jump UnknownScript_0x18e299

UnknownScript_0x18e293:
	setevent EVENT_25E
	jump UnknownScript_0x18e299

UnknownScript_0x18e299:
	setevent EVENT_000
	setflag ENGINE_KURT_MAKING_BALLS
UnknownScript_0x18e29f:
	writetext UnknownText_0x18e779
	closetext
	loadmovesprites
	end

UnknownScript_0x18e2a5:
	writetext UnknownText_0x18e7bc
	closetext
	loadmovesprites
	end

UnknownScript_0x18e2ab:
	setevent EVENT_001
UnknownScript_0x18e2ae:
	writetext UnknownText_0x18e82a
	closetext
UnknownScript_0x18e2b2:
	loadmovesprites
	end

UnknownScript_0x18e2b4:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 LEVEL_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e2c4:
	clearevent EVENT_258
	jump UnknownScript_0x18e2ab

UnknownScript_0x18e2ca:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 LURE_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e2da:
	clearevent EVENT_259
	jump UnknownScript_0x18e2ab

UnknownScript_0x18e2e0:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 MOON_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e2f0:
	clearevent EVENT_25A
	jump UnknownScript_0x18e2ab

UnknownScript_0x18e2f6:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 FRIEND_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e306:
	clearevent EVENT_25B
	jump UnknownScript_0x18e2ab

UnknownScript_0x18e30c:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 FAST_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e31c:
	clearevent EVENT_25C
	jump UnknownScript_0x18e2ab

UnknownScript_0x18e322:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 HEAVY_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e332:
	clearevent EVENT_25D
	jump UnknownScript_0x18e2ab

UnknownScript_0x18e338:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 LOVE_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e348:
	clearevent EVENT_25E
	jump UnknownScript_0x18e2ab

UnknownScript_0x18e34e:
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue UnknownScript_0x18e368
	checkitem GS_BALL
	iffalse UnknownScript_0x18e202
	writetext UnknownText_0x18e8ab
	closetext
	loadmovesprites
	setevent EVENT_GAVE_GS_BALL_TO_KURT
	takeitem GS_BALL, 1
	setflag ENGINE_KURT_MAKING_BALLS
	end

UnknownScript_0x18e368:
	checkflag ENGINE_KURT_MAKING_BALLS
	iffalse UnknownScript_0x18e378
	writetext UnknownText_0x18e934
	closetext
	writetext UnknownText_0x18e949
	closetext
	loadmovesprites
	end

UnknownScript_0x18e378:
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
	if_equal $1, UnknownScript_0x18e3a2
	spriteface $0, DOWN
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e466
	jump UnknownScript_0x18e3ac

UnknownScript_0x18e3a2:
	spriteface $0, DOWN
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e46c
UnknownScript_0x18e3ac:
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
	iftrue UnknownScript_0x18e3e0
UnknownScript_0x18e3c5:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalse UnknownScript_0x18e3d4
	writetext UnknownText_0x18e7d8
	closetext
	loadmovesprites
	spriteface $5, UP
	end

UnknownScript_0x18e3d4:
	writetext UnknownText_0x18e863
	closetext
	loadmovesprites
	spriteface $5, UP
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end

UnknownScript_0x18e3e0:
	writetext UnknownText_0x18e934
	closetext
	spriteface $5, UP
	writetext UnknownText_0x18e949
	closetext
	loadmovesprites
	end

KurtsGranddaughter1:
	faceplayer
	checkevent EVENT_000
	iftrue KurtsGranddaughter2Subscript
	checkevent EVENT_001
	iftrue KurtsGranddaughterFunScript
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .Lonely
	checkevent EVENT_030
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

	; warps
	db 2
	warp_def $7, $3, 4, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $7, $4, 4, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN

	; xy triggers
	db 0

	; signposts
	db 7
	signpost 1, 6, SIGNPOST_READ, KurtsHouseRadio
	signpost 0, 8, SIGNPOST_READ, KurtsHouseOakPhoto
	signpost 0, 9, SIGNPOST_READ, KurtsHouseOakPhoto
	signpost 1, 5, SIGNPOST_READ, KurtsHouseBookshelf
	signpost 1, 2, SIGNPOST_READ, KurtsHouseBookshelf
	signpost 1, 3, SIGNPOST_READ, KurtsHouseBookshelf
	signpost 1, 4, SIGNPOST_READ, KurtsHouseCelebiStatue

	; people-events
	db 5
	person_event SPRITE_KURT, 6, 7, UP << 2 | $2, $0, -1, -1, $0, 0, KurtScript_0x18e178, EVENT_KURTS_HOUSE_KURT_1
	person_event SPRITE_TWIN, 7, 9, DOWN << 2 | $3, $0, -1, -1, $0, 0, KurtsGranddaughter1, EVENT_KURTS_HOUSE_GRANDDAUGHTER_1
	person_event SPRITE_SLOWPOKE, 7, 10, DOWN << 2 | $1, $0, -1, -1, $0, 0, KurtsHouseSlowpoke, EVENT_KURTS_HOUSE_SLOWPOKE
	person_event SPRITE_KURT, 7, 18, UP << 2 | $3, $0, -1, -1, $0, 0, KurtScript_0x18e3bd, EVENT_KURTS_HOUSE_KURT_2
	person_event SPRITE_TWIN, 8, 15, LEFT << 2 | $1, $0, -1, -1, $0, 0, KurtsGranddaughter2, EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
