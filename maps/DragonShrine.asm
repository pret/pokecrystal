DragonShrine_MapScriptHeader: ; 0x18d014
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x18d01e, $0000
	dw UnknownScript_0x18d022, $0000

	; callback count
	db 0
; 0x18d01e

UnknownScript_0x18d01e: ; 0x18d01e
	priorityjump UnknownScript_0x18d023
	end
; 0x18d022

UnknownScript_0x18d022: ; 0x18d022
	end
; 0x18d023

UnknownScript_0x18d023: ; 0x18d023
	applymovement $0, MovementData_0x18d2bf
	applymovement $2, MovementData_0x18d2c7
	loadfont
	writetext UnknownText_0x18d2ea
	keeptextopen
UnknownScript_0x18d030: ; 0x18d030
	setevent $0001
	writetext UnknownText_0x18d3bc
	keeptextopen
	loadmenudata MenuDataHeader_0x18d215
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x18d0a9
	if_equal $2, UnknownScript_0x18d0cb
	if_equal $3, UnknownScript_0x18d0a9
	end
; 0x18d049

UnknownScript_0x18d049: ; 0x18d049
	setevent $0002
	writetext UnknownText_0x18d3d3
	keeptextopen
	loadmenudata MenuDataHeader_0x18d234
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x18d0a9
	if_equal $2, UnknownScript_0x18d0a9
	if_equal $3, UnknownScript_0x18d0cb
UnknownScript_0x18d061: ; 0x18d061
	setevent $0003
	writetext UnknownText_0x18d3f3
	keeptextopen
	loadmenudata MenuDataHeader_0x18d258
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x18d0cb
	if_equal $2, UnknownScript_0x18d0a9
	if_equal $3, UnknownScript_0x18d0a9
UnknownScript_0x18d079: ; 0x18d079
	setevent $0004
	writetext UnknownText_0x18d420
	keeptextopen
	loadmenudata MenuDataHeader_0x18d283
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x18d0a9
	if_equal $2, UnknownScript_0x18d0cb
	if_equal $3, UnknownScript_0x18d0a9
UnknownScript_0x18d091: ; 0x18d091
	setevent $0005
	writetext UnknownText_0x18d44a
	keeptextopen
	loadmenudata MenuDataHeader_0x18d2a5
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x18d0cb
	if_equal $2, UnknownScript_0x18d0a9
	if_equal $3, UnknownScript_0x18d0cb
UnknownScript_0x18d0a9: ; 0x18d0a9
	checkevent $0005
	iftrue UnknownScript_0x18d100
	writetext UnknownText_0x18d82d
	keeptextopen
	checkevent $0004
	iftrue UnknownScript_0x18d091
	checkevent $0003
	iftrue UnknownScript_0x18d079
	checkevent $0002
	iftrue UnknownScript_0x18d061
	checkevent $0001
	iftrue UnknownScript_0x18d049
UnknownScript_0x18d0cb: ; 0x18d0cb
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
	setevent $00c1
	loadfont
	checkevent $0005
	iftrue UnknownScript_0x18d091
	checkevent $0004
	iftrue UnknownScript_0x18d079
	checkevent $0003
	iftrue UnknownScript_0x18d061
	checkevent $0002
	iftrue UnknownScript_0x18d049
	checkevent $0001
	iftrue UnknownScript_0x18d030
UnknownScript_0x18d100: ; 0x18d100
	writetext UnknownText_0x18d47c
	closetext
	loadmovesprites
	playsound SFX_ENTER_DOOR
	showemote $0, $0, 15
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
	showemote $0, $5, 15
	loadfont
	writetext UnknownText_0x18d9ae
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x18d2e0
	loadfont
	writetext UnknownText_0x18d9bf
	closetext
	setflag $0022
	playsound SFX_GET_BADGE
	waitbutton
	special RestartMapMusic
	specialphonecall $8
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
	setevent $0000
	end
; 0x18d1a5

ElderScript_0x18d1a5: ; 0x18d1a5
	faceplayer
	loadfont
	checkevent $0000
	iftrue UnknownScript_0x18d1f9
	checkevent $0006
	iftrue UnknownScript_0x18d1ff
	checkevent $00bd
	iffalse UnknownScript_0x18d1c5
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue UnknownScript_0x18d1f3
	writetext UnknownText_0x18d724
	closetext
	loadmovesprites
	end
; 0x18d1c5

UnknownScript_0x18d1c5: ; 0x18d1c5
	writetext UnknownText_0x18d604
	closetext
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x18d1ed
	writetext UnknownText_0x18d697
	playsound SFX_CAUGHT_MON
	waitbutton
	givepoke DRATINI, 15, 0, 0
	checkevent $00c1
	special SpecialDratini
	setevent $00bd
	setevent $0006
	writetext UnknownText_0x18d6ca
	closetext
	loadmovesprites
	end
; 0x18d1ed

UnknownScript_0x18d1ed: ; 0x18d1ed
	writetext UnknownText_0x18d6ac
	closetext
	loadmovesprites
	end
; 0x18d1f3

UnknownScript_0x18d1f3: ; 0x18d1f3
	writetext UnknownText_0x18d782
	closetext
	loadmovesprites
	end
; 0x18d1f9

UnknownScript_0x18d1f9: ; 0x18d1f9
	writetext UnknownText_0x18d5e5
	closetext
	loadmovesprites
	end
; 0x18d1ff

UnknownScript_0x18d1ff: ; 0x18d1ff
	writetext UnknownText_0x18d6ca
	closetext
	loadmovesprites
	end
; 0x18d205

ElderScript_0x18d205: ; 0x18d205
	faceplayer
	loadfont
	writetext UnknownText_0x18d840
	closetext
	loadmovesprites
	end
; 0x18d20d

ElderScript_0x18d20d: ; 0x18d20d
	faceplayer
	loadfont
	writetext UnknownText_0x18d8b1
	closetext
	loadmovesprites
	end
; 0x18d215


MenuDataHeader_0x18d215: ; 0x18d215
	db $40 ; flags
	db 04, 08 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x18d21d
	db 1 ; default option
; 0x18d21d

MenuData2_0x18d21d: ; 0x18d21d
	db $81 ; flags
	db 3 ; items
	db "Pal@"
	db "Underling@"
	db "Friend@"
; 0x18d234


MenuDataHeader_0x18d234: ; 0x18d234
	db $40 ; flags
	db 04, 09 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x18d23c
	db 1 ; default option
; 0x18d23c

MenuData2_0x18d23c: ; 0x18d23c
	db $81 ; flags
	db 3 ; items
	db "Strategy@"
	db "Raising@"
	db "Cheating@"
; 0x18d258


MenuDataHeader_0x18d258: ; 0x18d258
	db $40 ; flags
	db 04, 05 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x18d260
	db 1 ; default option
; 0x18d260

MenuData2_0x18d260: ; 0x18d260
	db $81 ; flags
	db 3 ; items
	db "Weak person@"
	db "Tough person@"
	db "Anybody@"
; 0x18d283


MenuDataHeader_0x18d283: ; 0x18d283
	db $40 ; flags
	db 04, 08 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x18d28b
	db 1 ; default option
; 0x18d28b

MenuData2_0x18d28b: ; 0x18d28b
	db $81 ; flags
	db 3 ; items
	db "Love@"
	db "Violence@"
	db "Knowledge@"
; 0x18d2a5


MenuDataHeader_0x18d2a5: ; 0x18d2a5
	db $40 ; flags
	db 04, 12 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x18d2ad
	db 1 ; default option
; 0x18d2ad

MenuData2_0x18d2ad: ; 0x18d2ad
	db $81 ; flags
	db 3 ; items
	db "Tough@"
	db "Both@"
	db "Weak@"
; 0x18d2bf


MovementData_0x18d2bf: ; 0x18d2bf
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_right
	slow_step_up
	slow_step_up
	slow_step_up
	step_end
; 0x18d2c7

MovementData_0x18d2c7: ; 0x18d2c7
	slow_step_down
	step_end
; 0x18d2c9

MovementData_0x18d2c9: ; 0x18d2c9
	slow_step_left
	slow_step_left
	slow_step_left
	turn_head_down
	step_end
; 0x18d2ce

MovementData_0x18d2ce: ; 0x18d2ce
	slow_step_right
	slow_step_right
	step_end
; 0x18d2d1

MovementData_0x18d2d1: ; 0x18d2d1
	slow_step_right
	turn_head_down
	step_end
; 0x18d2d4

MovementData_0x18d2d4: ; 0x18d2d4
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end
; 0x18d2da

MovementData_0x18d2da: ; 0x18d2da
	fix_facing
	big_step_left
	step_end
; 0x18d2dd

MovementData_0x18d2dd: ; 0x18d2dd
	slow_step_left
	remove_fixed_facing
	step_end
; 0x18d2e0

MovementData_0x18d2e0: ; 0x18d2e0
	slow_step_right
	slow_step_right
	step_end
; 0x18d2e3

MovementData_0x18d2e3: ; 0x18d2e3
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x18d2ea

UnknownText_0x18d2ea: ; 0x18d2ea
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
; 0x18d3bc

UnknownText_0x18d3bc: ; 0x18d3bc
	text "What are #MON"
	line "to you?"
	done
; 0x18d3d3

UnknownText_0x18d3d3: ; 0x18d3d3
	text "What helps you to"
	line "win battles?"
	done
; 0x18d3f3

UnknownText_0x18d3f3: ; 0x18d3f3
	text "What kind of"
	line "trainer do you"
	cont "wish to battle?"
	done
; 0x18d420

UnknownText_0x18d420: ; 0x18d420
	text "What is most"
	line "important for"
	cont "raising #MON?"
	done
; 0x18d44a

UnknownText_0x18d44a: ; 0x18d44a
	text "Strong #MON."
	line "Weak #MON."

	para "Which is more"
	line "important?"
	done
; 0x18d47c

UnknownText_0x18d47c: ; 0x18d47c
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
; 0x18d520

UnknownText_0x18d520: ; 0x18d520
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
; 0x18d5a3

UnknownText_0x18d5a3: ; 0x18d5a3
	text "CLAIR…"

	para "Reflect upon what"
	line "it is that you"

	para "lack and this"
	line "child has."
	done
; 0x18d5e5

UnknownText_0x18d5e5: ; 0x18d5e5
	text "Come again, if you"
	line "so desire."
	done
; 0x18d604

UnknownText_0x18d604: ; 0x18d604
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
; 0x18d697

UnknownText_0x18d697: ; 0x18d697
	text "<PLAYER> received"
	line "DRATINI!"
	done
; 0x18d6ac

UnknownText_0x18d6ac: ; 0x18d6ac
	text "Hm? Your #MON"
	line "party is full."
	done
; 0x18d6ca

UnknownText_0x18d6ca: ; 0x18d6ca
	text "Dragon #MON are"
	line "symbolic of our"
	cont "clan."

	para "You have shown"
	line "that you can be"

	para "entrusted with"
	line "one."
	done
; 0x18d724

UnknownText_0x18d724: ; 0x18d724
	text "CLAIR appears to"
	line "have learned an"

	para "invaluable lesson"
	line "from you."

	para "I thank you as her"
	line "grandfather."
	done
; 0x18d782

UnknownText_0x18d782: ; 0x18d782
	text "A boy close to"
	line "your age is in"
	cont "training here."

	para "He is much like"
	line "CLAIR when she was"

	para "younger. It is a"
	line "little worrisome…"
	done
; 0x18d7f6

UnknownText_0x18d7f6: ; 0x18d7f6
	text "Hah? I didn't"
	line "quite catch that…"
	done
; 0x18d816

UnknownText_0x18d816: ; 0x18d816
	text "What was it you"
	line "said?"
	done
; 0x18d82d

UnknownText_0x18d82d: ; 0x18d82d
	text "Oh, I understand…"
	done
; 0x18d840

UnknownText_0x18d840: ; 0x18d840
	text "It's been quite"
	line "some time since a"

	para "trainer has gained"
	line "our MASTER's rare"
	cont "approval."

	para "In fact, not since"
	line "Master LANCE."
	done
; 0x18d8b1

UnknownText_0x18d8b1: ; 0x18d8b1
	text "You know young"
	line "Master LANCE?"

	para "He looks so much"
	line "like our MASTER"
	cont "did in his youth."

	para "It's in their"
	line "blood."
	done
; 0x18d916

UnknownText_0x18d916: ; 0x18d916
	text "So how did it go?"

	para "I guess there's no"
	line "point in asking."

	para "You did fail?"

	para $56, $56, $56, $56, $56, $56

	para "…What? You passed?"
	done
; 0x18d974

UnknownText_0x18d974: ; 0x18d974
	text "That can't be!"
	done
; 0x18d983

UnknownText_0x18d983: ; 0x18d983
	text "You're lying!"

	para "Even I haven't"
	line "been approved!"
	done
; 0x18d9ae

UnknownText_0x18d9ae: ; 0x18d9ae
	text "I-I understand…"
	done
; 0x18d9bf

UnknownText_0x18d9bf: ; 0x18d9bf
	text "Here, this is the"
	line "RISINGBADGE…"

	para "Hurry up! Take it!"
	done
; 0x18d9f2

UnknownText_0x18d9f2: ; 0x18d9f2
	text "<PLAYER> received"
	line "RISINGBADGE."
	done
; 0x18da0b

UnknownText_0x18da0b: ; 0x18da0b
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
; 0x18dab4

UnknownText_0x18dab4: ; 0x18dab4
	text $56, $56, $56, $56, $56, $56
	done
; 0x18dabc

DragonShrine_MapEventHeader: ; 0x18dabc
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $9, $4, 2, GROUP_DRAGONS_DEN_B1F, MAP_DRAGONS_DEN_B1F
	warp_def $9, $5, 2, GROUP_DRAGONS_DEN_B1F, MAP_DRAGONS_DEN_B1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_ELDER, 5, 9, $6, $0, 255, 255, $0, 0, ElderScript_0x18d1a5, $0000
	person_event SPRITE_ELDER, 8, 6, $9, $0, 255, 255, $0, 0, ElderScript_0x18d205, $0000
	person_event SPRITE_ELDER, 8, 11, $8, $0, 255, 255, $0, 0, ElderScript_0x18d20d, $0000
	person_event SPRITE_CLAIR, 12, 8, $7, $0, 255, 255, $90, 0, ObjectEvent, $0790
; 0x18db00
