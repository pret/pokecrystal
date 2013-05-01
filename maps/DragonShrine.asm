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
	2writetext UnknownText_0x18d2ea
	keeptextopen
UnknownScript_0x18d030: ; 0x18d030
	setbit1 $0001
	2writetext UnknownText_0x18d3bc
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
	setbit1 $0002
	2writetext UnknownText_0x18d3d3
	keeptextopen
	loadmenudata MenuDataHeader_0x18d234
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x18d0a9
	if_equal $2, UnknownScript_0x18d0a9
	if_equal $3, UnknownScript_0x18d0cb
UnknownScript_0x18d061: ; 0x18d061
	setbit1 $0003
	2writetext UnknownText_0x18d3f3
	keeptextopen
	loadmenudata MenuDataHeader_0x18d258
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x18d0cb
	if_equal $2, UnknownScript_0x18d0a9
	if_equal $3, UnknownScript_0x18d0a9
UnknownScript_0x18d079: ; 0x18d079
	setbit1 $0004
	2writetext UnknownText_0x18d420
	keeptextopen
	loadmenudata MenuDataHeader_0x18d283
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x18d0a9
	if_equal $2, UnknownScript_0x18d0cb
	if_equal $3, UnknownScript_0x18d0a9
UnknownScript_0x18d091: ; 0x18d091
	setbit1 $0005
	2writetext UnknownText_0x18d44a
	keeptextopen
	loadmenudata MenuDataHeader_0x18d2a5
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x18d0cb
	if_equal $2, UnknownScript_0x18d0a9
	if_equal $3, UnknownScript_0x18d0cb
UnknownScript_0x18d0a9: ; 0x18d0a9
	checkbit1 $0005
	iftrue UnknownScript_0x18d100
	2writetext UnknownText_0x18d82d
	keeptextopen
	checkbit1 $0004
	iftrue UnknownScript_0x18d091
	checkbit1 $0003
	iftrue UnknownScript_0x18d079
	checkbit1 $0002
	iftrue UnknownScript_0x18d061
	checkbit1 $0001
	iftrue UnknownScript_0x18d049
UnknownScript_0x18d0cb: ; 0x18d0cb
	loadmovesprites
	spriteface $2, $2
	loadfont
	2writetext UnknownText_0x18d7f6
	closetext
	loadmovesprites
	spriteface $2, $0
	loadfont
	2writetext UnknownText_0x18d816
	closetext
	loadmovesprites
	setbit1 $00c1
	loadfont
	checkbit1 $0005
	iftrue UnknownScript_0x18d091
	checkbit1 $0004
	iftrue UnknownScript_0x18d079
	checkbit1 $0003
	iftrue UnknownScript_0x18d061
	checkbit1 $0002
	iftrue UnknownScript_0x18d049
	checkbit1 $0001
	iftrue UnknownScript_0x18d030
UnknownScript_0x18d100: ; 0x18d100
	2writetext UnknownText_0x18d47c
	closetext
	loadmovesprites
	playsound $001f
	showemote $0, $0, 15
	playmusic $005d
	appear $5
	waitbutton
	spriteface $0, $0
	pause 30
	applymovement $5, MovementData_0x18d2d4
	spriteface $5, $3
	spriteface $0, $2
	spriteface $2, $2
	loadfont
	2writetext UnknownText_0x18d916
	closetext
	loadmovesprites
	special $006a
	applymovement $5, MovementData_0x18d2da
	loadfont
	2writetext UnknownText_0x18d974
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x18d2dd
	loadfont
	2writetext UnknownText_0x18d983
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x18d2c9
	spriteface $5, $1
	loadfont
	2writetext UnknownText_0x18d520
	closetext
	loadmovesprites
	showemote $0, $5, 15
	loadfont
	2writetext UnknownText_0x18d9ae
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x18d2e0
	loadfont
	2writetext UnknownText_0x18d9bf
	closetext
	setbit2 $0022
	playsound $009c
	waitbutton
	special $003d
	specialphonecall $8
	dotrigger $1
	domaptrigger GROUP_DRAGONS_DEN_B1F, MAP_DRAGONS_DEN_B1F, $1
	2writetext UnknownText_0x18d9f2
	keeptextopen
	2writetext UnknownText_0x18da0b
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x18d2ce
	spriteface $5, $1
	applymovement $2, MovementData_0x18d2d1
	spriteface $0, $1
	loadfont
	2writetext UnknownText_0x18d5a3
	closetext
	loadmovesprites
	loadfont
	2writetext UnknownText_0x18dab4
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x18d2e3
	playsound $001f
	disappear $5
	waitbutton
	setbit1 $0000
	end
; 0x18d1a5

UnknownScript_0x18d1a5: ; 0x18d1a5
	faceplayer
	loadfont
	checkbit1 $0000
	iftrue UnknownScript_0x18d1f9
	checkbit1 $0006
	iftrue UnknownScript_0x18d1ff
	checkbit1 $00bd
	iffalse UnknownScript_0x18d1c5
	checkbit1 $0319
	iftrue UnknownScript_0x18d1f3
	2writetext UnknownText_0x18d724
	closetext
	loadmovesprites
	end
; 0x18d1c5

UnknownScript_0x18d1c5: ; 0x18d1c5
	2writetext UnknownText_0x18d604
	closetext
	checkcode $1
	if_equal $6, UnknownScript_0x18d1ed
	2writetext UnknownText_0x18d697
	playsound $0002
	waitbutton
	givepoke DRATINI, 15, 0, 0
	checkbit1 $00c1
	special $0094
	setbit1 $00bd
	setbit1 $0006
	2writetext UnknownText_0x18d6ca
	closetext
	loadmovesprites
	end
; 0x18d1ed

UnknownScript_0x18d1ed: ; 0x18d1ed
	2writetext UnknownText_0x18d6ac
	closetext
	loadmovesprites
	end
; 0x18d1f3

UnknownScript_0x18d1f3: ; 0x18d1f3
	2writetext UnknownText_0x18d782
	closetext
	loadmovesprites
	end
; 0x18d1f9

UnknownScript_0x18d1f9: ; 0x18d1f9
	2writetext UnknownText_0x18d5e5
	closetext
	loadmovesprites
	end
; 0x18d1ff

UnknownScript_0x18d1ff: ; 0x18d1ff
	2writetext UnknownText_0x18d6ca
	closetext
	loadmovesprites
	end
; 0x18d205

UnknownScript_0x18d205: ; 0x18d205
	faceplayer
	loadfont
	2writetext UnknownText_0x18d840
	closetext
	loadmovesprites
	end
; 0x18d20d

UnknownScript_0x18d20d: ; 0x18d20d
	faceplayer
	loadfont
	2writetext UnknownText_0x18d8b1
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
	db $0, "Hm… Good to see", $4f
	db "you here.", $51
	db "No need to explain", $4f
	db "why you came.", $51
	db "CLAIR sent you", $4f
	db "here, didn't she?", $51
	db "That girl is a", $4f
	db "handful…", $51
	db "I am sorry, but I", $4f
	db "must test you.", $51
	db "Not to worry, you", $4f
	db "are to answer only", $55
	db "a few questions.", $51
	db "Ready?", $57
; 0x18d3bc

UnknownText_0x18d3bc: ; 0x18d3bc
	db $0, "What are #MON", $4f
	db "to you?", $57
; 0x18d3d3

UnknownText_0x18d3d3: ; 0x18d3d3
	db $0, "What helps you to", $4f
	db "win battles?", $57
; 0x18d3f3

UnknownText_0x18d3f3: ; 0x18d3f3
	db $0, "What kind of", $4f
	db "trainer do you", $55
	db "wish to battle?", $57
; 0x18d420

UnknownText_0x18d420: ; 0x18d420
	db $0, "What is most", $4f
	db "important for", $55
	db "raising #MON?", $57
; 0x18d44a

UnknownText_0x18d44a: ; 0x18d44a
	db $0, "Strong #MON.", $4f
	db "Weak #MON.", $51
	db "Which is more", $4f
	db "important?", $57
; 0x18d47c

UnknownText_0x18d47c: ; 0x18d47c
	db $0, "Hm… I see…", $51
	db "You care deeply", $4f
	db "for #MON.", $51
	db "Very commendable.", $51
	db "That conviction is", $4f
	db "what is important!", $51
	db $52, ", don't", $4f
	db "lose that belief.", $51
	db "It will see you", $4f
	db "through at the", $55
	db "#MON LEAGUE.", $57
; 0x18d520

UnknownText_0x18d520: ; 0x18d520
	db $0, "CLAIR!", $51
	db "This child is", $4f
	db "impeccable, in", $55
	db "skill and spirit!", $51
	db "Admit defeat and", $4f
	db "confer the RISING-", $55
	db "BADGE!", $51
	db "…Or must I inform", $4f
	db "LANCE of this?", $57
; 0x18d5a3

UnknownText_0x18d5a3: ; 0x18d5a3
	db $0, "CLAIR…", $51
	db "Reflect upon what", $4f
	db "it is that you", $51
	db "lack and this", $4f
	db "child has.", $57
; 0x18d5e5

UnknownText_0x18d5e5: ; 0x18d5e5
	db $0, "Come again, if you", $4f
	db "so desire.", $57
; 0x18d604

UnknownText_0x18d604: ; 0x18d604
	db $0, "Hm… Good to see", $4f
	db "you here.", $51
	db "Your arrival is", $4f
	db "most fortunate.", $51
	db "I have something", $4f
	db "for you.", $51
	db "Take this DRATINI", $4f
	db "as proof that I", $51
	db "have recognized", $4f
	db "your worth.", $57
; 0x18d697

UnknownText_0x18d697: ; 0x18d697
	db $0, $52, " received", $4f
	db "DRATINI!", $57
; 0x18d6ac

UnknownText_0x18d6ac: ; 0x18d6ac
	db $0, "Hm? Your #MON", $4f
	db "party is full.", $57
; 0x18d6ca

UnknownText_0x18d6ca: ; 0x18d6ca
	db $0, "Dragon #MON are", $4f
	db "symbolic of our", $55
	db "clan.", $51
	db "You have shown", $4f
	db "that you can be", $51
	db "entrusted with", $4f
	db "one.", $57
; 0x18d724

UnknownText_0x18d724: ; 0x18d724
	db $0, "CLAIR appears to", $4f
	db "have learned an", $51
	db "invaluable lesson", $4f
	db "from you.", $51
	db "I thank you as her", $4f
	db "grandfather.", $57
; 0x18d782

UnknownText_0x18d782: ; 0x18d782
	db $0, "A boy close to", $4f
	db "your age is in", $55
	db "training here.", $51
	db "He is much like", $4f
	db "CLAIR when she was", $51
	db "younger. It is a", $4f
	db "little worrisome…", $57
; 0x18d7f6

UnknownText_0x18d7f6: ; 0x18d7f6
	db $0, "Hah? I didn't", $4f
	db "quite catch that…", $57
; 0x18d816

UnknownText_0x18d816: ; 0x18d816
	db $0, "What was it you", $4f
	db "said?", $57
; 0x18d82d

UnknownText_0x18d82d: ; 0x18d82d
	db $0, "Oh, I understand…", $57
; 0x18d840

UnknownText_0x18d840: ; 0x18d840
	db $0, "It's been quite", $4f
	db "some time since a", $51
	db "trainer has gained", $4f
	db "our MASTER's rare", $55
	db "approval.", $51
	db "In fact, not since", $4f
	db "Master LANCE.", $57
; 0x18d8b1

UnknownText_0x18d8b1: ; 0x18d8b1
	db $0, "You know young", $4f
	db "Master LANCE?", $51
	db "He looks so much", $4f
	db "like our MASTER", $55
	db "did in his youth.", $51
	db "It's in their", $4f
	db "blood.", $57
; 0x18d916

UnknownText_0x18d916: ; 0x18d916
	db $0, "So how did it go?", $51
	db "I guess there's no", $4f
	db "point in asking.", $51
	db "You did fail?", $51
	db $56, $56, $56, $56, $56, $56, $51
	db "…What? You passed?", $57
; 0x18d974

UnknownText_0x18d974: ; 0x18d974
	db $0, "That can't be!", $57
; 0x18d983

UnknownText_0x18d983: ; 0x18d983
	db $0, "You're lying!", $51
	db "Even I haven't", $4f
	db "been approved!", $57
; 0x18d9ae

UnknownText_0x18d9ae: ; 0x18d9ae
	db $0, "I-I understand…", $57
; 0x18d9bf

UnknownText_0x18d9bf: ; 0x18d9bf
	db $0, "Here, this is the", $4f
	db "RISINGBADGE…", $51
	db "Hurry up! Take it!", $57
; 0x18d9f2

UnknownText_0x18d9f2: ; 0x18d9f2
	db $0, $52, " received", $4f
	db "RISINGBADGE.", $57
; 0x18da0b

UnknownText_0x18da0b: ; 0x18da0b
	db $0, "RISINGBADGE will", $4f
	db "enable your", $51
	db "#MON to use the", $4f
	db "move for climbing", $55
	db "waterfalls.", $51
	db "Also, all #MON", $4f
	db "will recognize you", $51
	db "as a trainer and", $4f
	db "obey your every", $51
	db "command without", $4f
	db "question.", $57
; 0x18dab4

UnknownText_0x18dab4: ; 0x18dab4
	db $0, $56, $56, $56, $56, $56, $56, $57
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
	person_event $9, 5, 9, $6, $0, 255, 255, $0, 0, UnknownScript_0x18d1a5, $0000
	person_event $9, 8, 6, $9, $0, 255, 255, $0, 0, UnknownScript_0x18d205, $0000
	person_event $9, 8, 11, $8, $0, 255, 255, $0, 0, UnknownScript_0x18d20d, $0000
	person_event $19, 12, 8, $7, $0, 255, 255, $90, 0, ObjectEvent, $0790
; 0x18db00

