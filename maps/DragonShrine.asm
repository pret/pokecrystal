DragonShrine_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000

.MapCallbacks:
	db 0

.Trigger1:
	priorityjump DragonShrineTestScript
	end

.Trigger2:
	end

DragonShrineTestScript:
	applymovement $0, MovementData_0x18d2bf
	applymovement $2, MovementData_0x18d2c7
	loadfont
	writetext UnknownText_0x18d2ea
	keeptextopen
.Question1:
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	writetext UnknownText_0x18d3bc
	keeptextopen
	loadmenudata MenuDataHeader_0x18d215
	interpretmenu2
	writebackup
	if_equal $1, .RightAnswer
	if_equal $2, .WrongAnswer
	if_equal $3, .RightAnswer
	end

.Question2:
	setevent EVENT_DRAGON_SHRINE_QUESTION_2
	writetext UnknownText_0x18d3d3
	keeptextopen
	loadmenudata MenuDataHeader_0x18d234
	interpretmenu2
	writebackup
	if_equal $1, .RightAnswer
	if_equal $2, .RightAnswer
	if_equal $3, .WrongAnswer
.Question3:
	setevent EVENT_DRAGON_SHRINE_QUESTION_3
	writetext UnknownText_0x18d3f3
	keeptextopen
	loadmenudata MenuDataHeader_0x18d258
	interpretmenu2
	writebackup
	if_equal $1, .WrongAnswer
	if_equal $2, .RightAnswer
	if_equal $3, .RightAnswer
.Question4:
	setevent EVENT_DRAGON_SHRINE_QUESTION_4
	writetext UnknownText_0x18d420
	keeptextopen
	loadmenudata MenuDataHeader_0x18d283
	interpretmenu2
	writebackup
	if_equal $1, .RightAnswer
	if_equal $2, .WrongAnswer
	if_equal $3, .RightAnswer
.Question5:
	setevent EVENT_DRAGON_SHRINE_QUESTION_5
	writetext UnknownText_0x18d44a
	keeptextopen
	loadmenudata MenuDataHeader_0x18d2a5
	interpretmenu2
	writebackup
	if_equal $1, .WrongAnswer
	if_equal $2, .RightAnswer
	if_equal $3, .WrongAnswer
.RightAnswer:
	checkevent EVENT_DRAGON_SHRINE_QUESTION_5
	iftrue .PassedTheTest
	writetext UnknownText_0x18d82d
	keeptextopen
	checkevent EVENT_DRAGON_SHRINE_QUESTION_4
	iftrue .Question5
	checkevent EVENT_DRAGON_SHRINE_QUESTION_3
	iftrue .Question4
	checkevent EVENT_DRAGON_SHRINE_QUESTION_2
	iftrue .Question3
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue .Question2
.WrongAnswer:
	loadmovesprites
	spriteface $2, LEFT
	loadfont
	writetext UnknownText_0x18d7f6
	closetext
	loadmovesprites
	spriteface $2, DOWN
	loadfont
	writetext UnknownText_0x18d816
	closetext
	loadmovesprites
	setevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	loadfont
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
	writetext UnknownText_0x18d47c
	closetext
	loadmovesprites
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, $0, 15
	playmusic MUSIC_CLAIR
	appear $5
	waitbutton
	spriteface $0, DOWN
	pause 30
	applymovement $5, MovementData_0x18d2d4
	spriteface $5, RIGHT
	spriteface $0, LEFT
	spriteface $2, LEFT
	loadfont
	writetext UnknownText_0x18d916
	closetext
	loadmovesprites
	special Functionc48f
	applymovement $5, MovementData_0x18d2da
	loadfont
	writetext UnknownText_0x18d974
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x18d2dd
	loadfont
	writetext UnknownText_0x18d983
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x18d2c9
	spriteface $5, UP
	loadfont
	writetext UnknownText_0x18d520
	closetext
	loadmovesprites
	showemote EMOTE_SHOCK, $5, 15
	loadfont
	writetext UnknownText_0x18d9ae
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x18d2e0
	loadfont
	writetext UnknownText_0x18d9bf
	closetext
	setflag ENGINE_RISINGBADGE
	playsound SFX_GET_BADGE
	waitbutton
	special RestartMapMusic
	specialphonecall ELMCALL_MASTERBALL
	dotrigger $1
	domaptrigger GROUP_DRAGONS_DEN_B1F, MAP_DRAGONS_DEN_B1F, $1
	writetext UnknownText_0x18d9f2
	keeptextopen
	writetext UnknownText_0x18da0b
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x18d2ce
	spriteface $5, UP
	applymovement $2, MovementData_0x18d2d1
	spriteface $0, UP
	loadfont
	writetext UnknownText_0x18d5a3
	closetext
	loadmovesprites
	loadfont
	writetext UnknownText_0x18dab4
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x18d2e3
	playsound SFX_ENTER_DOOR
	disappear $5
	waitbutton
	setevent EVENT_GAVE_KURT_APRICORNS
	end

ElderScript_0x18d1a5:
	faceplayer
	loadfont
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue .DontGiveDratiniYet
	checkevent EVENT_JUST_RECEIVED_DRATINI
	iftrue .ReceivedDratini
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratini
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .BeatRivalInMtMoon
	writetext UnknownText_0x18d724
	closetext
	loadmovesprites
	end

.GiveDratini:
	writetext UnknownText_0x18d604
	closetext
	checkcode VAR_PARTYCOUNT
	if_equal 6, .PartyFull
	writetext UnknownText_0x18d697
	playsound SFX_CAUGHT_MON
	waitbutton
	givepoke DRATINI, 15, 0, 0
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special SpecialDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_JUST_RECEIVED_DRATINI
	writetext UnknownText_0x18d6ca
	closetext
	loadmovesprites
	end

.PartyFull:
	writetext UnknownText_0x18d6ac
	closetext
	loadmovesprites
	end

.BeatRivalInMtMoon:
	writetext UnknownText_0x18d782
	closetext
	loadmovesprites
	end

.DontGiveDratiniYet:
	writetext UnknownText_0x18d5e5
	closetext
	loadmovesprites
	end

.ReceivedDratini:
	writetext UnknownText_0x18d6ca
	closetext
	loadmovesprites
	end

ElderScript_0x18d205:
	faceplayer
	loadfont
	writetext UnknownText_0x18d840
	closetext
	loadmovesprites
	end

ElderScript_0x18d20d:
	faceplayer
	loadfont
	writetext UnknownText_0x18d8b1
	closetext
	loadmovesprites
	end


MenuDataHeader_0x18d215:
	db $40 ; flags
	db 04, 08 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x18d21d
	db 1 ; default option

MenuData2_0x18d21d:
	db $81 ; flags
	db 3 ; items
	db "Pal@"
	db "Underling@"
	db "Friend@"


MenuDataHeader_0x18d234:
	db $40 ; flags
	db 04, 09 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x18d23c
	db 1 ; default option

MenuData2_0x18d23c:
	db $81 ; flags
	db 3 ; items
	db "Strategy@"
	db "Raising@"
	db "Cheating@"


MenuDataHeader_0x18d258:
	db $40 ; flags
	db 04, 05 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x18d260
	db 1 ; default option

MenuData2_0x18d260:
	db $81 ; flags
	db 3 ; items
	db "Weak person@"
	db "Tough person@"
	db "Anybody@"


MenuDataHeader_0x18d283:
	db $40 ; flags
	db 04, 08 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x18d28b
	db 1 ; default option

MenuData2_0x18d28b:
	db $81 ; flags
	db 3 ; items
	db "Love@"
	db "Violence@"
	db "Knowledge@"


MenuDataHeader_0x18d2a5:
	db $40 ; flags
	db 04, 12 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x18d2ad
	db 1 ; default option

MenuData2_0x18d2ad:
	db $81 ; flags
	db 3 ; items
	db "Tough@"
	db "Both@"
	db "Weak@"


MovementData_0x18d2bf:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_right
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

MovementData_0x18d2c7:
	slow_step_down
	step_end

MovementData_0x18d2c9:
	slow_step_left
	slow_step_left
	slow_step_left
	turn_head_down
	step_end

MovementData_0x18d2ce:
	slow_step_right
	slow_step_right
	step_end

MovementData_0x18d2d1:
	slow_step_right
	turn_head_down
	step_end

MovementData_0x18d2d4:
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

MovementData_0x18d2da:
	fix_facing
	big_step_left
	step_end

MovementData_0x18d2dd:
	slow_step_left
	remove_fixed_facing
	step_end

MovementData_0x18d2e0:
	slow_step_right
	slow_step_right
	step_end

MovementData_0x18d2e3:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

UnknownText_0x18d2ea:
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

UnknownText_0x18d3bc:
	text "What are #MON"
	line "to you?"
	done

UnknownText_0x18d3d3:
	text "What helps you to"
	line "win battles?"
	done

UnknownText_0x18d3f3:
	text "What kind of"
	line "trainer do you"
	cont "wish to battle?"
	done

UnknownText_0x18d420:
	text "What is most"
	line "important for"
	cont "raising #MON?"
	done

UnknownText_0x18d44a:
	text "Strong #MON."
	line "Weak #MON."

	para "Which is more"
	line "important?"
	done

UnknownText_0x18d47c:
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

UnknownText_0x18d520:
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

UnknownText_0x18d5a3:
	text "CLAIR…"

	para "Reflect upon what"
	line "it is that you"

	para "lack and this"
	line "child has."
	done

UnknownText_0x18d5e5:
	text "Come again, if you"
	line "so desire."
	done

UnknownText_0x18d604:
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

UnknownText_0x18d697:
	text "<PLAYER> received"
	line "DRATINI!"
	done

UnknownText_0x18d6ac:
	text "Hm? Your #MON"
	line "party is full."
	done

UnknownText_0x18d6ca:
	text "Dragon #MON are"
	line "symbolic of our"
	cont "clan."

	para "You have shown"
	line "that you can be"

	para "entrusted with"
	line "one."
	done

UnknownText_0x18d724:
	text "CLAIR appears to"
	line "have learned an"

	para "invaluable lesson"
	line "from you."

	para "I thank you as her"
	line "grandfather."
	done

UnknownText_0x18d782:
	text "A boy close to"
	line "your age is in"
	cont "training here."

	para "He is much like"
	line "CLAIR when she was"

	para "younger. It is a"
	line "little worrisome…"
	done

UnknownText_0x18d7f6:
	text "Hah? I didn't"
	line "quite catch that…"
	done

UnknownText_0x18d816:
	text "What was it you"
	line "said?"
	done

UnknownText_0x18d82d:
	text "Oh, I understand…"
	done

UnknownText_0x18d840:
	text "It's been quite"
	line "some time since a"

	para "trainer has gained"
	line "our MASTER's rare"
	cont "approval."

	para "In fact, not since"
	line "Master LANCE."
	done

UnknownText_0x18d8b1:
	text "You know young"
	line "Master LANCE?"

	para "He looks so much"
	line "like our MASTER"
	cont "did in his youth."

	para "It's in their"
	line "blood."
	done

UnknownText_0x18d916:
	text "So how did it go?"

	para "I guess there's no"
	line "point in asking."

	para "You did fail?"

	para $56, $56, $56, $56, $56, $56

	para "…What? You passed?"
	done

UnknownText_0x18d974:
	text "That can't be!"
	done

UnknownText_0x18d983:
	text "You're lying!"

	para "Even I haven't"
	line "been approved!"
	done

UnknownText_0x18d9ae:
	text "I-I understand…"
	done

UnknownText_0x18d9bf:
	text "Here, this is the"
	line "RISINGBADGE…"

	para "Hurry up! Take it!"
	done

UnknownText_0x18d9f2:
	text "<PLAYER> received"
	line "RISINGBADGE."
	done

UnknownText_0x18da0b:
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

UnknownText_0x18dab4:
	text $56, $56, $56, $56, $56, $56
	done

DragonShrine_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $9, $4, 2, GROUP_DRAGONS_DEN_B1F, MAP_DRAGONS_DEN_B1F
	warp_def $9, $5, 2, GROUP_DRAGONS_DEN_B1F, MAP_DRAGONS_DEN_B1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_ELDER, 5, 9, OW_UP | $2, $0, -1, -1, $0, 0, ElderScript_0x18d1a5, EVENT_GAVE_KURT_APRICORNS
	person_event SPRITE_ELDER, 8, 6, OW_LEFT | $1, $0, -1, -1, $0, 0, ElderScript_0x18d205, EVENT_GAVE_KURT_APRICORNS
	person_event SPRITE_ELDER, 8, 11, OW_LEFT | $0, $0, -1, -1, $0, 0, ElderScript_0x18d20d, EVENT_GAVE_KURT_APRICORNS
	person_event SPRITE_CLAIR, 12, 8, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, ObjectEvent, EVENT_DRAGON_SHRINE_CLAIR
