KurtsHouse_MapScriptHeader: ; 0x18e14f
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x18e154
; 0x18e154

UnknownScript_0x18e154: ; 0x18e154
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse UnknownScript_0x18e177
	checkevent $00c0
	iftrue UnknownScript_0x18e177
	checkflag $0050
	iftrue UnknownScript_0x18e16f
	disappear $5
	appear $2
	disappear $6
	appear $3
	return
; 0x18e16f

UnknownScript_0x18e16f: ; 0x18e16f
	disappear $2
	appear $5
	disappear $3
	appear $6
UnknownScript_0x18e177: ; 0x18e177
	return
; 0x18e178

KurtScript_0x18e178: ; 0x18e178
	faceplayer
	loadfont
	checkevent $0035
	iftrue UnknownScript_0x18e1cc
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue UnknownScript_0x18e1bf
	writetext UnknownText_0x18e473
	closetext
	loadmovesprites
	special Functionc48f
	setevent $06fa
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
; 0x18e1ab

UnknownScript_0x18e1ab: ; 0x18e1ab
	spriteface $0, DOWN
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e46c
	playsound SFX_EXIT_BUILDING
	disappear $2
	waitbutton
	special RestartMapMusic
	end
; 0x18e1bf

UnknownScript_0x18e1bf: ; 0x18e1bf
	writetext UnknownText_0x18e615
	keeptextopen
	verbosegiveitem LURE_BALL, 1
	iffalse UnknownScript_0x18e2b2
	setevent $0035
UnknownScript_0x18e1cc: ; 0x18e1cc
	checkevent $0000
	iftrue UnknownScript_0x18e29f
	checkevent $0258
	iftrue UnknownScript_0x18e2b4
	checkevent $0259
	iftrue UnknownScript_0x18e2ca
	checkevent $025a
	iftrue UnknownScript_0x18e2e0
	checkevent $025b
	iftrue UnknownScript_0x18e2f6
	checkevent $025c
	iftrue UnknownScript_0x18e30c
	checkevent $025d
	iftrue UnknownScript_0x18e322
	checkevent $025e
	iftrue UnknownScript_0x18e338
	checkevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	iftrue UnknownScript_0x18e34e
UnknownScript_0x18e202: ; 0x18e202
	checkevent $0001
	iftrue UnknownScript_0x18e212
	checkevent $0002
	iftrue UnknownScript_0x18e212
	writetext UnknownText_0x18e6c9
	closetext
UnknownScript_0x18e212: ; 0x18e212
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
	checkevent $0001
	iftrue UnknownScript_0x18e2ae
	checkevent $0002
	iftrue UnknownScript_0x18e243
	loadmovesprites
	end
; 0x18e243

UnknownScript_0x18e243: ; 0x18e243
	writetext UnknownText_0x18e6c9
	closetext
	loadmovesprites
	end
; 0x18e249

UnknownScript_0x18e249: ; 0x18e249
	writetext UnknownText_0x18e736
	keeptextopen
	setevent $0002
	special Function88018
	if_equal $0, UnknownScript_0x18e2a5
	if_equal $59, UnknownScript_0x18e275
	if_equal $5c, UnknownScript_0x18e27b
	if_equal $5d, UnknownScript_0x18e281
	if_equal $61, UnknownScript_0x18e287
	if_equal $63, UnknownScript_0x18e28d
	if_equal $65, UnknownScript_0x18e293
	setevent $0258
	jump UnknownScript_0x18e299
; 0x18e275

UnknownScript_0x18e275: ; 0x18e275
	setevent $0259
	jump UnknownScript_0x18e299
; 0x18e27b

UnknownScript_0x18e27b: ; 0x18e27b
	setevent $025a
	jump UnknownScript_0x18e299
; 0x18e281

UnknownScript_0x18e281: ; 0x18e281
	setevent $025b
	jump UnknownScript_0x18e299
; 0x18e287

UnknownScript_0x18e287: ; 0x18e287
	setevent $025c
	jump UnknownScript_0x18e299
; 0x18e28d

UnknownScript_0x18e28d: ; 0x18e28d
	setevent $025d
	jump UnknownScript_0x18e299
; 0x18e293

UnknownScript_0x18e293: ; 0x18e293
	setevent $025e
	jump UnknownScript_0x18e299
; 0x18e299

UnknownScript_0x18e299: ; 0x18e299
	setevent $0000
	setflag $0050
UnknownScript_0x18e29f: ; 0x18e29f
	writetext UnknownText_0x18e779
	closetext
	loadmovesprites
	end
; 0x18e2a5

UnknownScript_0x18e2a5: ; 0x18e2a5
	writetext UnknownText_0x18e7bc
	closetext
	loadmovesprites
	end
; 0x18e2ab

UnknownScript_0x18e2ab: ; 0x18e2ab
	setevent $0001
UnknownScript_0x18e2ae: ; 0x18e2ae
	writetext UnknownText_0x18e82a
	closetext
UnknownScript_0x18e2b2: ; 0x18e2b2
	loadmovesprites
	end
; 0x18e2b4

UnknownScript_0x18e2b4: ; 0x18e2b4
	checkflag $0050
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 LEVEL_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e2c4: ; 0x18e2c4
	clearevent $0258
	jump UnknownScript_0x18e2ab
; 0x18e2ca

UnknownScript_0x18e2ca: ; 0x18e2ca
	checkflag $0050
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 LURE_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e2da: ; 0x18e2da
	clearevent $0259
	jump UnknownScript_0x18e2ab
; 0x18e2e0

UnknownScript_0x18e2e0: ; 0x18e2e0
	checkflag $0050
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 MOON_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e2f0: ; 0x18e2f0
	clearevent $025a
	jump UnknownScript_0x18e2ab
; 0x18e2f6

UnknownScript_0x18e2f6: ; 0x18e2f6
	checkflag $0050
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 FRIEND_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e306: ; 0x18e306
	clearevent $025b
	jump UnknownScript_0x18e2ab
; 0x18e30c

UnknownScript_0x18e30c: ; 0x18e30c
	checkflag $0050
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 FAST_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e31c: ; 0x18e31c
	clearevent $025c
	jump UnknownScript_0x18e2ab
; 0x18e322

UnknownScript_0x18e322: ; 0x18e322
	checkflag $0050
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 HEAVY_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e332: ; 0x18e332
	clearevent $025d
	jump UnknownScript_0x18e2ab
; 0x18e338

UnknownScript_0x18e338: ; 0x18e338
	checkflag $0050
	iftrue UnknownScript_0x18e3c5
	writetext UnknownText_0x18e7fb
	keeptextopen
	verbosegiveitem2 LOVE_BALL, $16
	iffalse UnknownScript_0x18e2b2
UnknownScript_0x18e348: ; 0x18e348
	clearevent $025e
	jump UnknownScript_0x18e2ab
; 0x18e34e

UnknownScript_0x18e34e: ; 0x18e34e
	checkevent $00bf
	iftrue UnknownScript_0x18e368
	checkitem GS_BALL
	iffalse UnknownScript_0x18e202
	writetext UnknownText_0x18e8ab
	closetext
	loadmovesprites
	setevent $00bf
	takeitem GS_BALL, 1
	setflag $0050
	end
; 0x18e368

UnknownScript_0x18e368: ; 0x18e368
	checkflag $0050
	iffalse UnknownScript_0x18e378
	writetext UnknownText_0x18e934
	closetext
	writetext UnknownText_0x18e949
	closetext
	loadmovesprites
	end
; 0x18e378

UnknownScript_0x18e378: ; 0x18e378
	writetext UnknownText_0x18e95c
	closetext
	loadmovesprites
	setevent $00c0
	clearevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	clearevent $00bf
	special Functionc48f
	pause 20
	showemote $0, $2, 30
	checkcode VAR_FACING
	if_equal $1, UnknownScript_0x18e3a2
	spriteface $0, DOWN
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e466
	jump UnknownScript_0x18e3ac
; 0x18e3a2

UnknownScript_0x18e3a2: ; 0x18e3a2
	spriteface $0, DOWN
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e46c
UnknownScript_0x18e3ac: ; 0x18e3ac
	playsound SFX_EXIT_BUILDING
	disappear $2
	clearevent $07a4
	waitbutton
	special RestartMapMusic
	domaptrigger GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN, $2
	end
; 0x18e3bd

KurtScript_0x18e3bd: ; 0x18e3bd
	faceplayer
	loadfont
	checkevent $00bf
	iftrue UnknownScript_0x18e3e0
UnknownScript_0x18e3c5: ; 0x18e3c5
	checkevent $00bb
	iffalse UnknownScript_0x18e3d4
	writetext UnknownText_0x18e7d8
	closetext
	loadmovesprites
	spriteface $5, UP
	end
; 0x18e3d4

UnknownScript_0x18e3d4: ; 0x18e3d4
	writetext UnknownText_0x18e863
	closetext
	loadmovesprites
	spriteface $5, UP
	setevent $00bb
	end
; 0x18e3e0

UnknownScript_0x18e3e0: ; 0x18e3e0
	writetext UnknownText_0x18e934
	closetext
	spriteface $5, UP
	writetext UnknownText_0x18e949
	closetext
	loadmovesprites
	end
; 0x18e3ed

KurtsGranddaughter1:
	faceplayer
	checkevent $0000
	iftrue KurtsGranddaughter2Subscript
	checkevent $0001
	iftrue KurtsGranddaughterFunScript
	checkevent $00c0
	iftrue .Lonely
	checkevent $0030
	iftrue .Dad
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SlowpokeBack
	checkevent $06fa
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
	checkevent $00bf
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

KurtsGranddaughterFunScript: ; 0x18e448
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

MovementData_0x18e466: ; 0x18e466
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
; 0x18e46c

MovementData_0x18e46c: ; 0x18e46c
	big_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
; 0x18e473

UnknownText_0x18e473: ; 0x18e473
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
; 0x18e615

UnknownText_0x18e615: ; 0x18e615
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
; 0x18e6c9

UnknownText_0x18e6c9: ; 0x18e6c9
	text "KURT: I make BALLS"
	line "from APRICORNS."

	para "Collect them from"
	line "trees and bring"
	cont "'em to me."

	para "I'll make BALLS"
	line "out of them."
	done
; 0x18e736

UnknownText_0x18e736: ; 0x18e736
	text "KURT: You have an"
	line "APRICORN for me?"

	para "Fine! I'll turn it"
	line "into a BALL."
	done
; 0x18e779

UnknownText_0x18e779: ; 0x18e779
	text "KURT: It'll take a"
	line "day to make you a"

	para "BALL. Come back"
	line "for it later."
	done
; 0x18e7bc

UnknownText_0x18e7bc: ; 0x18e7bc
	text "KURT: Oh…"
	line "That's a letdown."
	done
; 0x18e7d8

UnknownText_0x18e7d8: ; 0x18e7d8
	text "KURT: I'm working!"
	line "Don't bother me!"
	done
; 0x18e7fb

UnknownText_0x18e7fb: ; 0x18e7fb
	text "KURT: Ah, <PLAYER>!"
	line "I just finished"
	cont "your BALL. Here!"
	done
; 0x18e82a

UnknownText_0x18e82a: ; 0x18e82a
	text "KURT: That turned"
	line "out great."

	para "Try catching"
	line "#MON with it."
	done
; 0x18e863

UnknownText_0x18e863: ; 0x18e863
	text "KURT: Now that my"
	line "granddaughter is"

	para "helping me, I can"
	line "work much faster."
	done
; 0x18e8ab

UnknownText_0x18e8ab: ; 0x18e8ab
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
; 0x18e934

UnknownText_0x18e934: ; 0x18e934
	text "I'm checking it"
	line "now."
	done
; 0x18e949

UnknownText_0x18e949: ; 0x18e949
	text "Ah-ha! I see!"
	line "So…"
	done
; 0x18e95c

UnknownText_0x18e95c: ; 0x18e95c
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

KurtsHouse_MapEventHeader: ; 0x18eba8
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
	signpost 1, 6, $0, KurtsHouseRadio
	signpost 0, 8, $0, KurtsHouseOakPhoto
	signpost 0, 9, $0, KurtsHouseOakPhoto
	signpost 1, 5, $0, KurtsHouseBookshelf
	signpost 1, 2, $0, KurtsHouseBookshelf
	signpost 1, 3, $0, KurtsHouseBookshelf
	signpost 1, 4, $0, KurtsHouseCelebiStatue

	; people-events
	db 5
	person_event SPRITE_KURT, 6, 7, $6, $0, 255, 255, $0, 0, KurtScript_0x18e178, $073e
	person_event SPRITE_TWIN, 7, 9, $3, $0, 255, 255, $0, 0, KurtsGranddaughter1, $078c
	person_event SPRITE_SLOWPOKE, 7, 10, $1, $0, 255, 255, $0, 0, KurtsHouseSlowpoke, $06fd
	person_event SPRITE_KURT, 7, 18, $7, $0, 255, 255, $0, 0, KurtScript_0x18e3bd, $073f
	person_event SPRITE_TWIN, 8, 15, $9, $0, 255, 255, $0, 0, KurtsGranddaughter2, $078d
; 0x18ec1c
