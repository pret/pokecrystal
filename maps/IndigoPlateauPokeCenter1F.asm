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
	clearevent $0309
	clearevent EVENT_WILLS_ROOM_EXIT_OPEN
	clearevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KOGAS_ROOM_EXIT_OPEN
	clearevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	clearevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KARENS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent $0312
	clearevent $05b8
	clearevent $05b9
	clearevent $05ba
	clearevent EVENT_BEAT_ELITE_4_KAREN
	clearevent EVENT_BEAT_CHAMPION_LANCE
	setevent $075f
	return
; 0x180053

UnknownScript_0x180053: ; 0x180053
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse UnknownScript_0x18012b
	checkflag $005d
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
	special Functionc48f
	pause 15
	applymovement $5, MovementData_0x180164
	playmusic MUSIC_RIVAL_ENCOUNTER
	spriteface $0, $3
	jump UnknownScript_0x1800ce
; 0x180094

UnknownScript_0x180094: ; 0x180094
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse UnknownScript_0x18012b
	checkflag $005d
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
	special Functionc48f
	pause 15
	applymovement $5, MovementData_0x18016b
	playmusic MUSIC_RIVAL_ENCOUNTER
	spriteface $0, $2
UnknownScript_0x1800ce: ; 0x1800ce
	loadfont
	writetext UnknownText_0x1801f5
	closetext
	loadmovesprites
	setevent $077b
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x1800f3
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x180103
	winlosstext UnknownText_0x180295, UnknownText_0x1802fd
	setlasttalked $5
	loadtrainer RIVAL2, 6
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x180113
; 0x1800f3

UnknownScript_0x1800f3: ; 0x1800f3
	winlosstext UnknownText_0x180295, UnknownText_0x1802fd
	setlasttalked $5
	loadtrainer RIVAL2, 4
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x180113
; 0x180103

UnknownScript_0x180103: ; 0x180103
	winlosstext UnknownText_0x180295, UnknownText_0x1802fd
	setlasttalked $5
	loadtrainer RIVAL2, 5
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x180113
; 0x180113

UnknownScript_0x180113: ; 0x180113
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	writetext UnknownText_0x1802a4
	closetext
	loadmovesprites
	spriteface $0, $0
	applymovement $5, MovementData_0x180172
	disappear $5
	dotrigger $0
	playmapmusic
	setflag $005d
UnknownScript_0x18012b: ; 0x18012b
	end
; 0x18012c

NurseScript_0x18012c: ; 0x18012c
	jumpstd pokecenternurse
; 0x18012f

ClerkScript_0x18012f: ; 0x18012f
	loadfont
	pokemart $0, $0020
	loadmovesprites
	end
; 0x180136

CooltrainerMScript_0x180136: ; 0x180136
	jumptextfaceplayer UnknownText_0x180178
; 0x180139

GrampsScript_0x180139: ; 0x180139
	faceplayer
	loadfont
	writetext UnknownText_0x180335
	yesorno
	iffalse UnknownScript_0x180154
	writetext UnknownText_0x1803e7
	closetext
	loadmovesprites
	playsound SFX_WARP_TO
	special Function8c084
	waitbutton
	warp GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN, $d, $6
	end
; 0x180154

UnknownScript_0x180154: ; 0x180154
	writetext UnknownText_0x180411
	closetext
	loadmovesprites
	end
; 0x18015a

JynxScript_0x18015a: ; 0x18015a
	loadfont
	writetext UnknownText_0x180433
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
	text "At the #MON"
	line "LEAGUE, you'll get"

	para "tested by the"
	line "ELITE FOUR."

	para "You have to beat"
	line "them all. If you"

	para "lose, you have to"
	line "start all over!"
	done
; 0x1801f5

UnknownText_0x1801f5: ; 0x1801f5
	text "Hold it."

	para "You're going to"
	line "take the #MON"

	para "LEAGUE challenge"
	line "now?"

	para "That's not going"
	line "to happen."

	para "My super-well-"
	line "trained #MON"

	para "are going to pound"
	line "you."

	para $52, "!"
	line "I challenge you!"
	done
; 0x180295

UnknownText_0x180295: ; 0x180295
	text "…"

	para "OK--I lost…"
	done
; 0x1802a4

UnknownText_0x1802a4: ; 0x1802a4
	text "…Darn… I still"
	line "can't win…"

	para "I… I have to think"
	line "more about my"
	cont "#MON…"

	para "Humph! Try not to"
	line "lose!"
	done
; 0x1802fd

UnknownText_0x1802fd: ; 0x1802fd
	text "…"

	para "Whew…"
	line "With my partners,"

	para "I'm going to be"
	line "the CHAMPION!"
	done
; 0x180335

UnknownText_0x180335: ; 0x180335
	text "Ah! You're chal-"
	line "lenging the ELITE"

	para "FOUR? Are you sure"
	line "you're ready?"

	para "If you need to"
	line "train some more,"

	para "my ABRA can help"
	line "you."

	para "It can TELEPORT"
	line "you home."

	para "Would you like to"
	line "go home now?"
	done
; 0x1803e7

UnknownText_0x1803e7: ; 0x1803e7
	text "OK, OK. Picture"
	line "your house in your"
	cont "mind…"
	done
; 0x180411

UnknownText_0x180411: ; 0x180411
	text "OK, OK. The best"
	line "of luck to you!"
	done
; 0x180433

UnknownText_0x180433: ; 0x180433
	text "ABRA: Aabra…"
	done
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
	person_event SPRITE_NURSE, 11, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x18012c, $ffff
	person_event SPRITE_CLERK, 11, 15, $6, $0, 255, 255, $0, 0, ClerkScript_0x18012f, $ffff
	person_event SPRITE_COOLTRAINER_M, 15, 15, $2, $22, 255, 255, $0, 0, CooltrainerMScript_0x180136, $ffff
	person_event SPRITE_SILVER, 13, 20, $7, $0, 255, 255, $0, 0, ObjectEvent, $077b
	person_event SPRITE_GRAMPS, 13, 5, $6, $0, 255, 255, $90, 0, GrampsScript_0x180139, $077c
	person_event SPRITE_JYNX, 13, 4, $16, $0, 255, 255, $b0, 0, JynxScript_0x18015a, $077c
; 0x1804b9
