IndigoPlateauPokeCenter1F_MapScriptHeader: ; 0x180000
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x180009, $0000

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x18000a
; 0x180009

UnknownScript_0x180009: ; 0x180009
	end
; 0x18000a

UnknownScript_0x18000a: ; 0x18000a
	domaptrigger GROUP_WILLS_ROOM, MAP_WILLS_ROOM, $0
	domaptrigger GROUP_KOGAS_ROOM, MAP_KOGAS_ROOM, $0
	domaptrigger GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM, $0
	domaptrigger GROUP_KARENS_ROOM, MAP_KARENS_ROOM, $0
	domaptrigger GROUP_LANCES_ROOM, MAP_LANCES_ROOM, $0
	domaptrigger GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME, $0
	clearbit1 $0309
	clearbit1 $030a
	clearbit1 $030b
	clearbit1 $030c
	clearbit1 $030d
	clearbit1 $030e
	clearbit1 $030f
	clearbit1 $0310
	clearbit1 $0311
	clearbit1 $0312
	clearbit1 $05b8
	clearbit1 $05b9
	clearbit1 $05ba
	clearbit1 $05bb
	clearbit1 $05bc
	setbit1 $075f
	return
; 0x180053

UnknownScript_0x180053: ; 0x180053
	checkbit1 $0319
	iffalse UnknownScript_0x18012b
	checkbit2 $005d
	iftrue UnknownScript_0x18012b
	checkcode $b
	if_equal SUNDAY, UnknownScript_0x18012b
	if_equal TUESDAY, UnknownScript_0x18012b
	if_equal THURSDAY, UnknownScript_0x18012b
	if_equal FRIDAY, UnknownScript_0x18012b
	if_equal SATURDAY, UnknownScript_0x18012b
	moveperson $5, $11, $9
	appear $5
	spriteface $0, $0
	showemote $0, $0, 15
	special $006a
	pause 15
	applymovement $5, MovementData_0x180164
	playmusic $001f
	spriteface $0, $3
	2jump UnknownScript_0x1800ce
; 0x180094

UnknownScript_0x180094: ; 0x180094
	checkbit1 $0319
	iffalse UnknownScript_0x18012b
	checkbit2 $005d
	iftrue UnknownScript_0x18012b
	checkcode $b
	if_equal SUNDAY, UnknownScript_0x18012b
	if_equal TUESDAY, UnknownScript_0x18012b
	if_equal THURSDAY, UnknownScript_0x18012b
	if_equal FRIDAY, UnknownScript_0x18012b
	if_equal SATURDAY, UnknownScript_0x18012b
	appear $5
	spriteface $0, $0
	showemote $0, $0, 15
	special $006a
	pause 15
	applymovement $5, MovementData_0x18016b
	playmusic $001f
	spriteface $0, $2
UnknownScript_0x1800ce: ; 0x1800ce
	loadfont
	2writetext UnknownText_0x1801f5
	closetext
	loadmovesprites
	setbit1 $077b
	checkbit1 $001c
	iftrue UnknownScript_0x1800f3
	checkbit1 $001d
	iftrue UnknownScript_0x180103
	winlosstext UnknownText_0x180295, UnknownText_0x1802fd
	setlasttalked $5
	loadtrainer RIVAL2, 6
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x180113
; 0x1800f3

UnknownScript_0x1800f3: ; 0x1800f3
	winlosstext UnknownText_0x180295, UnknownText_0x1802fd
	setlasttalked $5
	loadtrainer RIVAL2, 4
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x180113
; 0x180103

UnknownScript_0x180103: ; 0x180103
	winlosstext UnknownText_0x180295, UnknownText_0x1802fd
	setlasttalked $5
	loadtrainer RIVAL2, 5
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x180113
; 0x180113

UnknownScript_0x180113: ; 0x180113
	playmusic $0020
	loadfont
	2writetext UnknownText_0x1802a4
	closetext
	loadmovesprites
	spriteface $0, $0
	applymovement $5, MovementData_0x180172
	disappear $5
	dotrigger $0
	playmapmusic
	setbit2 $005d
UnknownScript_0x18012b: ; 0x18012b
	end
; 0x18012c

UnknownScript_0x18012c: ; 0x18012c
	jumpstd $0000
; 0x18012f

UnknownScript_0x18012f: ; 0x18012f
	loadfont
	pokemart $0, $0020
	loadmovesprites
	end
; 0x180136

UnknownScript_0x180136: ; 0x180136
	jumptextfaceplayer UnknownText_0x180178
; 0x180139

UnknownScript_0x180139: ; 0x180139
	faceplayer
	loadfont
	2writetext UnknownText_0x180335
	yesorno
	iffalse UnknownScript_0x180154
	2writetext UnknownText_0x1803e7
	closetext
	loadmovesprites
	playsound $0013
	special $002e
	waitbutton
	warp GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN, $d, $6
	end
; 0x180154

UnknownScript_0x180154: ; 0x180154
	2writetext UnknownText_0x180411
	closetext
	loadmovesprites
	end
; 0x18015a

UnknownScript_0x18015a: ; 0x18015a
	loadfont
	2writetext UnknownText_0x180433
	cry ABRA
	closetext
	loadmovesprites
	end
; 0x180164

MovementData_0x180164: ; 0x180164
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end
; 0x18016b

MovementData_0x18016b: ; 0x18016b
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_right
	step_end
; 0x180172

MovementData_0x180172: ; 0x180172
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x180178

UnknownText_0x180178: ; 0x180178
	db $0, "At the #MON", $4f
	db "LEAGUE, you'll get", $51
	db "tested by the", $4f
	db "ELITE FOUR.", $51
	db "You have to beat", $4f
	db "them all. If you", $51
	db "lose, you have to", $4f
	db "start all over!", $57
; 0x1801f5

UnknownText_0x1801f5: ; 0x1801f5
	db $0, "Hold it.", $51
	db "You're going to", $4f
	db "take the #MON", $51
	db "LEAGUE challenge", $4f
	db "now?", $51
	db "That's not going", $4f
	db "to happen.", $51
	db "My super-well-", $4f
	db "trained #MON", $51
	db "are going to pound", $4f
	db "you.", $51
	db $52, "!", $4f
	db "I challenge you!", $57
; 0x180295

UnknownText_0x180295: ; 0x180295
	db $0, "…", $51
	db "OK--I lost…", $57
; 0x1802a4

UnknownText_0x1802a4: ; 0x1802a4
	db $0, "…Darn… I still", $4f
	db "can't win…", $51
	db "I… I have to think", $4f
	db "more about my", $55
	db "#MON…", $51
	db "Humph! Try not to", $4f
	db "lose!", $57
; 0x1802fd

UnknownText_0x1802fd: ; 0x1802fd
	db $0, "…", $51
	db "Whew…", $4f
	db "With my partners,", $51
	db "I'm going to be", $4f
	db "the CHAMPION!", $57
; 0x180335

UnknownText_0x180335: ; 0x180335
	db $0, "Ah! You're chal-", $4f
	db "lenging the ELITE", $51
	db "FOUR? Are you sure", $4f
	db "you're ready?", $51
	db "If you need to", $4f
	db "train some more,", $51
	db "my ABRA can help", $4f
	db "you.", $51
	db "It can TELEPORT", $4f
	db "you home.", $51
	db "Would you like to", $4f
	db "go home now?", $57
; 0x1803e7

UnknownText_0x1803e7: ; 0x1803e7
	db $0, "OK, OK. Picture", $4f
	db "your house in your", $55
	db "mind…", $57
; 0x180411

UnknownText_0x180411: ; 0x180411
	db $0, "OK, OK. The best", $4f
	db "of luck to you!", $57
; 0x180433

UnknownText_0x180433: ; 0x180433
	db $0, "ABRA: Aabra…", $57
; 0x180441

IndigoPlateauPokeCenter1F_MapEventHeader: ; 0x180441
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $d, $5, 1, GROUP_ROUTE_23, MAP_ROUTE_23
	warp_def $d, $6, 2, GROUP_ROUTE_23, MAP_ROUTE_23
	warp_def $d, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $3, $e, 1, GROUP_WILLS_ROOM, MAP_WILLS_ROOM

	; xy triggers
	db 2
	xy_trigger 0, $4, $10, $0, UnknownScript_0x180053, $0, $0
	xy_trigger 0, $4, $11, $0, UnknownScript_0x180094, $0, $0

	; signposts
	db 0

	; people-events
	db 6
	person_event $37, 11, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x18012c, $ffff
	person_event $39, 11, 15, $6, $0, 255, 255, $0, 0, UnknownScript_0x18012f, $ffff
	person_event $23, 15, 15, $2, $22, 255, 255, $0, 0, UnknownScript_0x180136, $ffff
	person_event $4, 13, 20, $7, $0, 255, 255, $0, 0, ObjectEvent, $077b
	person_event $2f, 13, 5, $6, $0, 255, 255, $90, 0, UnknownScript_0x180139, $077c
	person_event $91, 13, 4, $16, $0, 255, 255, $b0, 0, UnknownScript_0x18015a, $077c
; 0x1804b9

