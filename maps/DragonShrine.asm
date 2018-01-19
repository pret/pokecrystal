const_value set 2
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_ELDER2
	const DRAGONSHRINE_ELDER3
	const DRAGONSHRINE_CLAIR

DragonShrine_MapScripts:
.SceneScripts:
	db 2
	scene_script .DragonShrineTest
	scene_script .DummyScene

.MapCallbacks:
	db 0

.DragonShrineTest:
	priorityjump .DragonShrineTestScript
	end

.DummyScene:
	end

.DragonShrineTestScript:
	applymovement PLAYER, DragonShrinePlayerWalkInMovement
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderStepDownMovement
	opentext
	writetext DragonShrineElderGreetingText
	buttonsound
.Question1:
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	writetext DragonShrineQuestion1Text
	buttonsound
	loadmenudata DragonShrineQuestion1_MenuDataHeader
	verticalmenu
	closewindow
	if_equal 1, .RightAnswer
	if_equal 2, .WrongAnswer
	if_equal 3, .RightAnswer
	end

.Question2:
	setevent EVENT_DRAGON_SHRINE_QUESTION_2
	writetext DragonShrineQuestion2Text
	buttonsound
	loadmenudata DragonShrineQuestion2_MenuDataHeader
	verticalmenu
	closewindow
	if_equal 1, .RightAnswer
	if_equal 2, .RightAnswer
	if_equal 3, .WrongAnswer
.Question3:
	setevent EVENT_DRAGON_SHRINE_QUESTION_3
	writetext DragonShrineQuestion3Text
	buttonsound
	loadmenudata DragonShrineQuestion3_MenuDataHeader
	verticalmenu
	closewindow
	if_equal 1, .WrongAnswer
	if_equal 2, .RightAnswer
	if_equal 3, .RightAnswer
.Question4:
	setevent EVENT_DRAGON_SHRINE_QUESTION_4
	writetext DragonShrineQuestion4Text
	buttonsound
	loadmenudata DragonShrineQuestion4_MenuDataHeader
	verticalmenu
	closewindow
	if_equal 1, .RightAnswer
	if_equal 2, .WrongAnswer
	if_equal 3, .RightAnswer
.Question5:
	setevent EVENT_DRAGON_SHRINE_QUESTION_5
	writetext DragonShrineQuestion5Text
	buttonsound
	loadmenudata DragonShrineQuestion5_MenuDataHeader
	verticalmenu
	closewindow
	if_equal 1, .WrongAnswer
	if_equal 2, .RightAnswer
	if_equal 3, .WrongAnswer
.RightAnswer:
	checkevent EVENT_DRAGON_SHRINE_QUESTION_5
	iftrue .PassedTheTest
	writetext DragonShrineRightAnswerText
	buttonsound
	checkevent EVENT_DRAGON_SHRINE_QUESTION_4
	iftrue .Question5
	checkevent EVENT_DRAGON_SHRINE_QUESTION_3
	iftrue .Question4
	checkevent EVENT_DRAGON_SHRINE_QUESTION_2
	iftrue .Question3
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue .Question2
.WrongAnswer:
	closetext
	spriteface DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineWrongAnswerText1
	waitbutton
	closetext
	spriteface DRAGONSHRINE_ELDER1, DOWN
	opentext
	writetext DragonShrineWrongAnswerText2
	waitbutton
	closetext
	setevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	opentext
	checkevent EVENT_DRAGON_SHRINE_QUESTION_5
	iftrue .Question5
	checkevent EVENT_DRAGON_SHRINE_QUESTION_4
	iftrue .Question4
	checkevent EVENT_DRAGON_SHRINE_QUESTION_3
	iftrue .Question3
	checkevent EVENT_DRAGON_SHRINE_QUESTION_2
	iftrue .Question2
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue .Question1
.PassedTheTest:
	writetext DragonShrinePassedTestText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_CLAIR
	appear DRAGONSHRINE_CLAIR
	waitsfx
	spriteface PLAYER, DOWN
	pause 30
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkInMovement
	spriteface DRAGONSHRINE_CLAIR, RIGHT
	spriteface PLAYER, LEFT
	spriteface DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineClairYouPassedText
	waitbutton
	closetext
	special Special_FadeOutMusic
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairBigStepLeftMovement
	opentext
	writetext DragonShrineClairThatCantBeText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairSlowStepLeftMovement
	opentext
	writetext DragonShrineClairYoureLyingText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkToClairMovement
	spriteface DRAGONSHRINE_CLAIR, UP
	opentext
	writetext DragonShrineMustIInformLanceText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, DRAGONSHRINE_CLAIR, 15
	opentext
	writetext DragonShrineIUnderstandText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, MovementData_0x18d2e0
	opentext
	writetext DragonShrineHereRisingBadgeText
	waitbutton
	setflag ENGINE_RISINGBADGE
	playsound SFX_GET_BADGE
	waitsfx
	special RestartMapMusic
	specialphonecall SPECIALCALL_MASTERBALL
	setscene 1
	setmapscene DRAGONS_DEN_B1F, 1
	writetext DragonShrinePlayerReceivedRisingBadgeText
	buttonsound
	writetext DragonShrineRisingBadgeExplanationText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, MovementData_0x18d2ce
	spriteface DRAGONSHRINE_CLAIR, UP
	applymovement DRAGONSHRINE_ELDER1, MovementData_0x18d2d1
	spriteface PLAYER, UP
	opentext
	writetext DragonShrineElderScoldsClairText
	waitbutton
	closetext
	opentext
	writetext DragonShrineSpeechlessText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, MovementData_0x18d2e3
	playsound SFX_ENTER_DOOR
	disappear DRAGONSHRINE_CLAIR
	waitsfx
	setevent EVENT_GAVE_KURT_APRICORNS
	end

DragonShrineElder1Script:
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue .DontGiveDratiniYet
	checkevent EVENT_JUST_RECEIVED_DRATINI
	iftrue .ReceivedDratini
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratini
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .BeatRivalInMtMoon
	writetext DragonShrineClairsGrandfatherText
	waitbutton
	closetext
	end

.GiveDratini:
	writetext DragonShrineTakeThisDratiniText
	waitbutton
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext DragonShrinePlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special Special_Dratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_JUST_RECEIVED_DRATINI
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

.PartyFull:
	writetext DragonShrinePartyFullText
	waitbutton
	closetext
	end

.BeatRivalInMtMoon:
	writetext DragonShrineSilverIsInTrainingText
	waitbutton
	closetext
	end

.DontGiveDratiniYet:
	writetext DragonShrineComeAgainText
	waitbutton
	closetext
	end

.ReceivedDratini:
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

DragonShrineElder2Script:
	faceplayer
	opentext
	writetext DragonShrineElder2Text
	waitbutton
	closetext
	end

DragonShrineElder3Script:
	faceplayer
	opentext
	writetext DragonShrineElder3Text
	waitbutton
	closetext
	end

DragonShrineQuestion1_MenuDataHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Pal@"
	db "Underling@"
	db "Friend@"

DragonShrineQuestion2_MenuDataHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Strategy@"
	db "Raising@"
	db "Cheating@"

DragonShrineQuestion3_MenuDataHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Weak person@"
	db "Tough person@"
	db "Anybody@"

DragonShrineQuestion4_MenuDataHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Love@"
	db "Violence@"
	db "Knowledge@"

DragonShrineQuestion5_MenuDataHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Tough@"
	db "Both@"
	db "Weak@"

DragonShrinePlayerWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineElderStepDownMovement:
	slow_step DOWN
	step_end

DragonShrineElderWalkToClairMovement:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	turn_head DOWN
	step_end

MovementData_0x18d2ce:
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementData_0x18d2d1:
	slow_step RIGHT
	turn_head DOWN
	step_end

DragonShrineClairWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineClairBigStepLeftMovement:
	fix_facing
	big_step LEFT
	step_end

DragonShrineClairSlowStepLeftMovement:
	slow_step LEFT
	remove_fixed_facing
	step_end

MovementData_0x18d2e0:
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementData_0x18d2e3:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DragonShrineElderGreetingText:
	text "Hm… Good to see"
	line "you here."

	para "No need to explain"
	line "why you came."

	para "CLAIR sent you"
	line "here, didn't she?"

	para "That girl is a"
	line "handful…"

	para "I am sorry, but I"
	line "must test you."

	para "Not to worry, you"
	line "are to answer only"
	cont "a few questions."

	para "Ready?"
	done

DragonShrineQuestion1Text:
	text "What are #MON"
	line "to you?"
	done

DragonShrineQuestion2Text:
	text "What helps you to"
	line "win battles?"
	done

DragonShrineQuestion3Text:
	text "What kind of"
	line "trainer do you"
	cont "wish to battle?"
	done

DragonShrineQuestion4Text:
	text "What is most"
	line "important for"
	cont "raising #MON?"
	done

DragonShrineQuestion5Text:
	text "Strong #MON."
	line "Weak #MON."

	para "Which is more"
	line "important?"
	done

DragonShrinePassedTestText:
	text "Hm… I see…"

	para "You care deeply"
	line "for #MON."

	para "Very commendable."

	para "That conviction is"
	line "what is important!"

	para "<PLAYER>, don't"
	line "lose that belief."

	para "It will see you"
	line "through at the"
	cont "#MON LEAGUE."
	done

DragonShrineMustIInformLanceText:
	text "CLAIR!"

	para "This child is"
	line "impeccable, in"
	cont "skill and spirit!"

	para "Admit defeat and"
	line "confer the RISING-"
	cont "BADGE!"

	para "…Or must I inform"
	line "LANCE of this?"
	done

DragonShrineElderScoldsClairText:
	text "CLAIR…"

	para "Reflect upon what"
	line "it is that you"

	para "lack and this"
	line "child has."
	done

DragonShrineComeAgainText:
	text "Come again, if you"
	line "so desire."
	done

DragonShrineTakeThisDratiniText:
	text "Hm… Good to see"
	line "you here."

	para "Your arrival is"
	line "most fortunate."

	para "I have something"
	line "for you."

	para "Take this DRATINI"
	line "as proof that I"

	para "have recognized"
	line "your worth."
	done

DragonShrinePlayerReceivedDratiniText:
	text "<PLAYER> received"
	line "DRATINI!"
	done

DragonShrinePartyFullText:
	text "Hm? Your #MON"
	line "party is full."
	done

DragonShrineSymbolicDragonText:
	text "Dragon #MON are"
	line "symbolic of our"
	cont "clan."

	para "You have shown"
	line "that you can be"

	para "entrusted with"
	line "one."
	done

DragonShrineClairsGrandfatherText:
	text "CLAIR appears to"
	line "have learned an"

	para "invaluable lesson"
	line "from you."

	para "I thank you as her"
	line "grandfather."
	done

DragonShrineSilverIsInTrainingText:
	text "A boy close to"
	line "your age is in"
	cont "training here."

	para "He is much like"
	line "CLAIR when she was"

	para "younger. It is a"
	line "little worrisome…"
	done

DragonShrineWrongAnswerText1:
	text "Hah? I didn't"
	line "quite catch that…"
	done

DragonShrineWrongAnswerText2:
	text "What was it you"
	line "said?"
	done

DragonShrineRightAnswerText:
	text "Oh, I understand…"
	done

DragonShrineElder2Text:
	text "It's been quite"
	line "some time since a"

	para "trainer has gained"
	line "our MASTER's rare"
	cont "approval."

	para "In fact, not since"
	line "Master LANCE."
	done

DragonShrineElder3Text:
	text "You know young"
	line "Master LANCE?"

	para "He looks so much"
	line "like our MASTER"
	cont "did in his youth."

	para "It's in their"
	line "blood."
	done

DragonShrineClairYouPassedText:
	text "So how did it go?"

	para "I guess there's no"
	line "point in asking."

	para "You did fail?"

	para "<……><……><……><……><……><……>"

	para "…What? You passed?"
	done

DragonShrineClairThatCantBeText:
	text "That can't be!"
	done

DragonShrineClairYoureLyingText:
	text "You're lying!"

	para "Even I haven't"
	line "been approved!"
	done

DragonShrineIUnderstandText:
	text "I-I understand…"
	done

DragonShrineHereRisingBadgeText:
	text "Here, this is the"
	line "RISINGBADGE…"

	para "Hurry up! Take it!"
	done

DragonShrinePlayerReceivedRisingBadgeText:
	text "<PLAYER> received"
	line "RISINGBADGE."
	done

DragonShrineRisingBadgeExplanationText:
	text "RISINGBADGE will"
	line "enable your"

	para "#MON to use the"
	line "move for climbing"
	cont "waterfalls."

	para "Also, all #MON"
	line "will recognize you"

	para "as a trainer and"
	line "obey your every"

	para "command without"
	line "question."
	done

DragonShrineSpeechlessText:
	text "<……><……><……><……><……><……>"
	done

DragonShrine_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 4, 9, 2, DRAGONS_DEN_B1F
	warp_def 5, 9, 2, DRAGONS_DEN_B1F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 4
	object_event 5, 1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, EVENT_GAVE_KURT_APRICORNS
	object_event 2, 4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder2Script, EVENT_GAVE_KURT_APRICORNS
	object_event 7, 4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder3Script, EVENT_GAVE_KURT_APRICORNS
	object_event 4, 8, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGON_SHRINE_CLAIR
