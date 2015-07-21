UndergroundPathSwitchRoomEntrances_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x7c9f5, $0000
	dw UnknownScript_0x7c9f6, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, UnknownScript_0x7c9f7

UnknownScript_0x7c9f5:
	end

UnknownScript_0x7c9f6:
	end

UnknownScript_0x7c9f7:
	checkevent EVENT_SWITCH_4
	iffalse UnknownScript_0x7ca01
	changeblock $10, $6, $2d
UnknownScript_0x7ca01:
	checkevent EVENT_SWITCH_5
	iffalse UnknownScript_0x7ca0b
	changeblock $a, $6, $2d
UnknownScript_0x7ca0b:
	checkevent EVENT_SWITCH_6
	iffalse UnknownScript_0x7ca15
	changeblock $2, $6, $2d
UnknownScript_0x7ca15:
	checkevent EVENT_SWITCH_7
	iffalse UnknownScript_0x7ca1f
	changeblock $2, $a, $2d
UnknownScript_0x7ca1f:
	checkevent EVENT_SWITCH_8
	iffalse UnknownScript_0x7ca29
	changeblock $a, $a, $2d
UnknownScript_0x7ca29:
	checkevent EVENT_SWITCH_9
	iffalse UnknownScript_0x7ca33
	changeblock $10, $a, $2d
UnknownScript_0x7ca33:
	checkevent EVENT_SWITCH_10
	iffalse UnknownScript_0x7ca41
	changeblock $c, $6, $2a
	changeblock $c, $8, $2d
UnknownScript_0x7ca41:
	checkevent EVENT_SWITCH_11
	iffalse UnknownScript_0x7ca4f
	changeblock $6, $6, $2a
	changeblock $6, $8, $2d
UnknownScript_0x7ca4f:
	checkevent EVENT_SWITCH_12
	iffalse UnknownScript_0x7ca5d
	changeblock $c, $a, $2a
	changeblock $c, $c, $2d
UnknownScript_0x7ca5d:
	checkevent EVENT_SWITCH_13
	iffalse UnknownScript_0x7ca6b
	changeblock $6, $a, $2a
	changeblock $6, $c, $2d
UnknownScript_0x7ca6b:
	checkevent EVENT_SWITCH_14
	iffalse UnknownScript_0x7ca79
	changeblock $12, $a, $2a
	changeblock $12, $c, $2d
UnknownScript_0x7ca79:
	return

SuperNerdScript_0x7ca7a:
	jumptextfaceplayer UnknownText_0x7d176

TeacherScript_0x7ca7d:
	jumptextfaceplayer UnknownText_0x7d1d0

UnknownScript_0x7ca80:
	spriteface $0, RIGHT
	showemote EMOTE_SHOCK, $0, 15
	special Functionc48f
	pause 15
	playsound SFX_EXIT_BUILDING
	appear $c
	waitbutton
	applymovement $c, MovementData_0x7ce87
	spriteface $0, RIGHT
	scall UnknownScript_0x7cad4
	applymovement $c, MovementData_0x7ce92
	playsound SFX_EXIT_BUILDING
	disappear $c
	dotrigger $1
	waitbutton
	playmapmusic
	end

UnknownScript_0x7caaa:
	spriteface $0, RIGHT
	showemote EMOTE_SHOCK, $0, 15
	special Functionc48f
	pause 15
	playsound SFX_EXIT_BUILDING
	appear $c
	waitbutton
	applymovement $c, MovementData_0x7ce8c
	spriteface $0, RIGHT
	scall UnknownScript_0x7cad4
	applymovement $c, MovementData_0x7ce97
	playsound SFX_EXIT_BUILDING
	disappear $c
	dotrigger $1
	waitbutton
	playmapmusic
	end

UnknownScript_0x7cad4:
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue UnknownScript_0x7cae1
	setevent EVENT_RIVAL_BURNED_TOWER
	domaptrigger GROUP_BURNED_TOWER_1F, MAP_BURNED_TOWER_1F, $1
UnknownScript_0x7cae1:
	playmusic MUSIC_RIVAL_ENCOUNTER
	loadfont
	writetext UnknownText_0x7ce9d
	closetext
	loadmovesprites
	setevent EVENT_RIVAL_UNDERGROUND_PATH
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x7cb09
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x7cb19
	winlosstext UnknownText_0x7cf5d, UnknownText_0x7d102
	setlasttalked $c
	loadtrainer RIVAL1, RIVAL1_12
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x7cb29

UnknownScript_0x7cb09:
	winlosstext UnknownText_0x7cf5d, UnknownText_0x7d102
	setlasttalked $c
	loadtrainer RIVAL1, RIVAL1_10
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x7cb29

UnknownScript_0x7cb19:
	winlosstext UnknownText_0x7cf5d, UnknownText_0x7d102
	setlasttalked $c
	loadtrainer RIVAL1, RIVAL1_11
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x7cb29

UnknownScript_0x7cb29:
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	writetext UnknownText_0x7cfc2
	closetext
	loadmovesprites
	end

TrainerGruntM11:
	trainer EVENT_BEAT_ROCKET_GRUNTM_11, GRUNTM, 11, GruntM11SeenText, GruntM11BeatenText, $0000, GruntM11Script

GruntM11Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d290
	closetext
	loadmovesprites
	end

TrainerGruntM25:
	trainer EVENT_BEAT_ROCKET_GRUNTM_25, GRUNTM, 25, GruntM25SeenText, GruntM25BeatenText, $0000, GruntM25Script

GruntM25Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d347
	closetext
	loadmovesprites
	end

TrainerBurglarDuncan:
	trainer EVENT_BEAT_BURGLAR_DUNCAN, BURGLAR, DUNCAN, BurglarDuncanSeenText, BurglarDuncanBeatenText, $0000, BurglarDuncanScript

BurglarDuncanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d3cf
	closetext
	loadmovesprites
	end

TrainerBurglarEddie:
	trainer EVENT_BEAT_BURGLAR_EDDIE, BURGLAR, EDDIE, BurglarEddieSeenText, BurglarEddieBeatenText, $0000, BurglarEddieScript

BurglarEddieScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d45b
	closetext
	loadmovesprites
	end

TrainerGruntM13:
	trainer EVENT_BEAT_ROCKET_GRUNTM_13, GRUNTM, 13, GruntM13SeenText, GruntM13BeatenText, $0000, GruntM13Script

GruntM13Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d51f
	closetext
	loadmovesprites
	end

TrainerGruntF3:
	trainer EVENT_BEAT_ROCKET_GRUNTF_3, GRUNTF, 3, GruntF3SeenText, GruntF3BeatenText, $0000, GruntF3Script

GruntF3Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d5e6
	closetext
	loadmovesprites
	end

MapUndergroundPathSwitchRoomEntrancesSignpost0Script:
	loadfont
	writetext UnknownText_0x7d554
	keeptextopen
	checkevent EVENT_SWITCH_1
	iftrue UnknownScript_0x7cbcb
	writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar $1
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_SWITCH_1
	jump UnknownScript_0x7cc8d

UnknownScript_0x7cbcb:
	writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar -1
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_SWITCH_1
	jump UnknownScript_0x7cc8d

MapUndergroundPathSwitchRoomEntrancesSignpost1Script:
	loadfont
	writetext UnknownText_0x7d643
	keeptextopen
	checkevent EVENT_SWITCH_2
	iftrue UnknownScript_0x7cc00
	writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar $2
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_SWITCH_2
	jump UnknownScript_0x7cc8d

UnknownScript_0x7cc00:
	writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar -2
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_SWITCH_2
	jump UnknownScript_0x7cc8d

MapUndergroundPathSwitchRoomEntrancesSignpost2Script:
	loadfont
	writetext UnknownText_0x7d65a
	keeptextopen
	checkevent EVENT_SWITCH_3
	iftrue UnknownScript_0x7cc35
	writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar $3
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_SWITCH_3
	jump UnknownScript_0x7cc8d

UnknownScript_0x7cc35:
	writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar -3
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_SWITCH_3
	jump UnknownScript_0x7cc8d

MapUndergroundPathSwitchRoomEntrancesSignpost3Script:
	loadfont
	writetext UnknownText_0x7d671
	keeptextopen
	checkevent EVENT_EMERGENCY_SWITCH
	iftrue UnknownScript_0x7cc70
	writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	writebyte $7
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_EMERGENCY_SWITCH
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	jump UnknownScript_0x7cc8d

UnknownScript_0x7cc70:
	writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	writebyte $0
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	jump UnknownScript_0x7cc8d

UnknownScript_0x7cc8b:
	loadmovesprites
	end

UnknownScript_0x7cc8d:
	copybytetovar UndergroundSwitchPositions
	if_equal $0, UnknownScript_0x7ccb0
	if_equal $1, UnknownScript_0x7ccd7
	if_equal $2, UnknownScript_0x7ccf2
	if_equal $3, UnknownScript_0x7cd0d
	if_equal $4, UnknownScript_0x7cd28
	if_equal $5, UnknownScript_0x7cd43
	if_equal $6, UnknownScript_0x7cd5e
	if_equal $7, UnknownScript_0x7cd79
UnknownScript_0x7ccb0:
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7ce11
	scall UnknownScript_0x7ce19
	scall UnknownScript_0x7ce21
	scall UnknownScript_0x7ce29
	scall UnknownScript_0x7ce31
	scall UnknownScript_0x7ce39
	scall UnknownScript_0x7ce41
	scall UnknownScript_0x7ce4d
	scall UnknownScript_0x7ce59
	scall UnknownScript_0x7ce65
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end

UnknownScript_0x7ccd7:
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cda5
	scall UnknownScript_0x7cdd5
	scall UnknownScript_0x7cdf9
	scall UnknownScript_0x7ce39
	scall UnknownScript_0x7ce4d
	scall UnknownScript_0x7ce59
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end

UnknownScript_0x7ccf2:
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cdad
	scall UnknownScript_0x7cde1
	scall UnknownScript_0x7cded
	scall UnknownScript_0x7ce31
	scall UnknownScript_0x7ce41
	scall UnknownScript_0x7ce65
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end

UnknownScript_0x7cd0d:
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cdb5
	scall UnknownScript_0x7cdd5
	scall UnknownScript_0x7cdf9
	scall UnknownScript_0x7ce29
	scall UnknownScript_0x7ce4d
	scall UnknownScript_0x7ce59
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end

UnknownScript_0x7cd28:
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cdbd
	scall UnknownScript_0x7cde1
	scall UnknownScript_0x7cded
	scall UnknownScript_0x7ce21
	scall UnknownScript_0x7ce41
	scall UnknownScript_0x7ce65
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end

UnknownScript_0x7cd43:
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cdc5
	scall UnknownScript_0x7cdd5
	scall UnknownScript_0x7cdf9
	scall UnknownScript_0x7ce19
	scall UnknownScript_0x7ce4d
	scall UnknownScript_0x7ce59
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end

UnknownScript_0x7cd5e:
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cdcd
	scall UnknownScript_0x7cde1
	scall UnknownScript_0x7cded
	scall UnknownScript_0x7ce05
	scall UnknownScript_0x7ce11
	scall UnknownScript_0x7ce41
	scall UnknownScript_0x7ce65
	reloadmappart
	loadmovesprites
	end

UnknownScript_0x7cd79:
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7ce11
	scall UnknownScript_0x7ce19
	scall UnknownScript_0x7cdb5
	scall UnknownScript_0x7ce29
	scall UnknownScript_0x7cdc5
	scall UnknownScript_0x7cdcd
	scall UnknownScript_0x7ce41
	scall UnknownScript_0x7cde1
	scall UnknownScript_0x7cded
	scall UnknownScript_0x7ce65
	scall UnknownScript_0x7ce05
	reloadmappart
	loadmovesprites
	writebyte $6
	copyvartobyte UndergroundSwitchPositions
	end

UnknownScript_0x7cda5:
	changeblock $10, $6, $2d
	setevent EVENT_SWITCH_4
	end

UnknownScript_0x7cdad:
	changeblock $a, $6, $2d
	setevent EVENT_SWITCH_5
	end

UnknownScript_0x7cdb5:
	changeblock $2, $6, $2d
	setevent EVENT_SWITCH_6
	end

UnknownScript_0x7cdbd:
	changeblock $2, $a, $2d
	setevent EVENT_SWITCH_7
	end

UnknownScript_0x7cdc5:
	changeblock $a, $a, $2d
	setevent EVENT_SWITCH_8
	end

UnknownScript_0x7cdcd:
	changeblock $10, $a, $2d
	setevent EVENT_SWITCH_9
	end

UnknownScript_0x7cdd5:
	changeblock $c, $6, $2a
	changeblock $c, $8, $2d
	setevent EVENT_SWITCH_10
	end

UnknownScript_0x7cde1:
	changeblock $6, $6, $2a
	changeblock $6, $8, $2d
	setevent EVENT_SWITCH_11
	end

UnknownScript_0x7cded:
	changeblock $c, $a, $2a
	changeblock $c, $c, $2d
	setevent EVENT_SWITCH_12
	end

UnknownScript_0x7cdf9:
	changeblock $6, $a, $2a
	changeblock $6, $c, $2d
	setevent EVENT_SWITCH_13
	end

UnknownScript_0x7ce05:
	changeblock $12, $a, $2a
	changeblock $12, $c, $2d
	setevent EVENT_SWITCH_14
	end

UnknownScript_0x7ce11:
	changeblock $10, $6, $3e
	clearevent EVENT_SWITCH_4
	end

UnknownScript_0x7ce19:
	changeblock $a, $6, $3e
	clearevent EVENT_SWITCH_5
	end

UnknownScript_0x7ce21:
	changeblock $2, $6, $3e
	clearevent EVENT_SWITCH_6
	end

UnknownScript_0x7ce29:
	changeblock $2, $a, $3e
	clearevent EVENT_SWITCH_7
	end

UnknownScript_0x7ce31:
	changeblock $a, $a, $3e
	clearevent EVENT_SWITCH_8
	end

UnknownScript_0x7ce39:
	changeblock $10, $a, $3e
	clearevent EVENT_SWITCH_9
	end

UnknownScript_0x7ce41:
	changeblock $c, $6, $3f
	changeblock $c, $8, $3d
	clearevent EVENT_SWITCH_10
	end

UnknownScript_0x7ce4d:
	changeblock $6, $6, $3f
	changeblock $6, $8, $3d
	clearevent EVENT_SWITCH_11
	end

UnknownScript_0x7ce59:
	changeblock $c, $a, $3f
	changeblock $c, $c, $3d
	clearevent EVENT_SWITCH_12
	end

UnknownScript_0x7ce65:
	changeblock $6, $a, $3f
	changeblock $6, $c, $3d
	clearevent EVENT_SWITCH_13
	end

UnknownScript_0x7ce71:
	changeblock $12, $a, $3f
	changeblock $12, $c, $3d
	clearevent EVENT_SWITCH_14
	end

ItemFragment_0x7ce7d:
	db SMOKE_BALL, 1

ItemFragment_0x7ce7f:
	db FULL_HEAL, 1

MapUndergroundPathSwitchRoomEntrancesSignpostItem4:
	dwb EVENT_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_HIDDEN_MAX_POTION, MAX_POTION
	

MapUndergroundPathSwitchRoomEntrancesSignpostItem5:
	dwb EVENT_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_HIDDEN_REVIVE, REVIVE
	

MovementData_0x7ce87:
	step_down
	step_left
	step_left
	step_left
	step_end

MovementData_0x7ce8c:
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end

MovementData_0x7ce92:
	step_right
	step_right
	step_right
	step_up
	step_end

MovementData_0x7ce97:
	step_right
	step_right
	step_right
	step_up
	step_up
	step_end

UnknownText_0x7ce9d:
	text "Hold it!"

	para "I saw you, so I"
	line "tailed you."

	para "I don't need you"
	line "underfoot while I"

	para "take care of TEAM"
	line "ROCKET."

	para "…Wait a second."
	line "You beat me be-"
	cont "fore, didn't you?"

	para "That was just a"
	line "fluke."

	para "But I repay my"
	line "debts!"
	done

UnknownText_0x7cf5d:
	text "…Why…"
	line "Why do I lose?"

	para "I've assembled the"
	line "toughest #MON."

	para "I didn't ease up"
	line "on the gas."

	para "So why do I lose?"
	done

UnknownText_0x7cfc2:
	text "…I don't under-"
	line "stand…"

	para "Is what that LANCE"
	line "guy said true?"

	para "That I don't treat"
	line "#MON properly?"

	para "Love…"

	para "Trust…"

	para "Are they really"
	line "what I lack?"

	para "Are they keeping"
	line "me from winning?"

	para "I… I just don't"
	line "understand."

	para "But it's not going"
	line "to end here."

	para "Not now. Not"
	line "because of this."

	para "I won't give up my"
	line "dream of becoming"

	para "the world's best"
	line "#MON trainer!"
	done

UnknownText_0x7d102:
	text "Humph. This is my"
	line "real power, wimp."

	para "I'll make TEAM"
	line "ROCKET history."

	para "And I'm going to"
	line "grind that LANCE"
	cont "under my heels."
	done

UnknownText_0x7d176:
	text "I was challenged"
	line "to a battle down-"
	cont "stairs."

	para "It's rough down"
	line "there. You'd"
	cont "better be careful."
	done

UnknownText_0x7d1d0:
	text "There are some"
	line "shops downstairs…"

	para "But there are"
	line "also trainers."

	para "I'm scared to go"
	line "down there."
	done

GruntM11SeenText:
	text "Open one shutter,"
	line "another closes."

	para "Bet you can't get"
	line "where you want!"
	done

GruntM11BeatenText:
	text "Drat! I was sunk"
	line "by indecision!"
	done

UnknownText_0x7d290:
	text "I'm confused too…"
	line "The switch on the"

	para "end is the one to"
	line "press first, but…"
	done

GruntM25SeenText:
	text "Kwahaha!"

	para "Confounded by the"
	line "shutters, are we?"

	para "I'll let you in on"
	line "a secret if you"
	cont "can beat me!"
	done

GruntM25BeatenText:
	text "Uwww…"
	line "I blew it."
	done

UnknownText_0x7d347:
	text "All right. A hint!"

	para "Change the order"
	line "of switching."

	para "That'll change the"
	line "ways the shutters"
	cont "open and close."
	done

BurglarDuncanSeenText:
	text "Fork over your"
	line "goodies!"
	done

BurglarDuncanBeatenText:
	text "Mercy!"
	done

UnknownText_0x7d3cf:
	text "Steal and sell!"
	line "That's basic in"
	cont "crime, kid!"
	done

BurglarEddieSeenText:
	text "They ditched this"
	line "project before"
	cont "they finished."

	para "I'm searching for"
	line "leftover loot."
	done

BurglarEddieBeatenText:
	text "Over the top!"
	done

UnknownText_0x7d45b:
	text "UNDERGROUND WARE-"
	line "HOUSE?"

	para "What do you want"
	line "to go there for?"

	para "There's nothing"
	line "down there."
	done

GruntM13SeenText:
	text "I don't care if"
	line "you're lost."

	para "You show up here,"
	line "you're nothing but"
	cont "a victim!"
	done

GruntM13BeatenText:
	text "Urk! Yeah, think"
	line "you're cool, huh?"
	done

UnknownText_0x7d51f:
	text "You must have ice"
	line "in your veins to"
	cont "dis TEAM ROCKET."
	done

UnknownText_0x7d554:
	text "It's labeled"
	line "SWITCH 1."
	done

GruntF3SeenText:
	text "Are you lost? No,"
	line "you can't be."

	para "You don't have"
	line "that scared look."

	para "I'll give you"
	line "something to be"
	cont "scared about!"
	done

GruntF3BeatenText:
	text "How could you?"
	done

UnknownText_0x7d5e6:
	text "Go wherever you'd"
	line "like! Get lost!"
	cont "See if I care!"
	done

UnknownText_0x7d617:
	text "It's OFF."
	line "Turn it ON?"
	done

UnknownText_0x7d62d:
	text "It's ON."
	line "Turn it OFF?"
	done

UnknownText_0x7d643:
	text "It's labeled"
	line "SWITCH 2."
	done

UnknownText_0x7d65a:
	text "It's labeled"
	line "SWITCH 3."
	done

UnknownText_0x7d671:
	text "It's labeled"
	line "EMERGENCY."
	done

UndergroundPathSwitchRoomEntrances_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 9
	warp_def $3, $17, 6, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $a, $16, 1, GROUP_UNDERGROUND_WAREHOUSE, MAP_UNDERGROUND_WAREHOUSE
	warp_def $a, $17, 2, GROUP_UNDERGROUND_WAREHOUSE, MAP_UNDERGROUND_WAREHOUSE
	warp_def $19, $5, 2, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $1d, $4, 14, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $1d, $5, 14, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $19, $15, 1, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $1d, $14, 13, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $1d, $15, 13, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

.XYTriggers:
	db 2
	xy_trigger 0, $4, $13, $0, UnknownScript_0x7ca80, $0, $0
	xy_trigger 0, $5, $13, $0, UnknownScript_0x7caaa, $0, $0

.Signposts:
	db 6
	signpost 1, 16, SIGNPOST_READ, MapUndergroundPathSwitchRoomEntrancesSignpost0Script
	signpost 1, 10, SIGNPOST_READ, MapUndergroundPathSwitchRoomEntrancesSignpost1Script
	signpost 1, 2, SIGNPOST_READ, MapUndergroundPathSwitchRoomEntrancesSignpost2Script
	signpost 11, 20, SIGNPOST_READ, MapUndergroundPathSwitchRoomEntrancesSignpost3Script
	signpost 9, 8, SIGNPOST_ITEM, MapUndergroundPathSwitchRoomEntrancesSignpostItem4
	signpost 8, 1, SIGNPOST_ITEM, MapUndergroundPathSwitchRoomEntrancesSignpostItem5

.PersonEvents:
	db 11
	person_event SPRITE_PHARMACIST, 16, 13, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 2, TrainerBurglarDuncan, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_PHARMACIST, 12, 8, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 2, TrainerBurglarEddie, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 6, 21, OW_UP | $2, $0, -1, -1, $2, 3, TrainerGruntM13, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 6, 15, OW_UP | $2, $0, -1, -1, $2, 3, TrainerGruntM11, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 6, 7, OW_UP | $2, $0, -1, -1, $2, 3, TrainerGruntM25, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET_GIRL, 16, 23, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerGruntF3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_TEACHER, 31, 7, OW_UP | $2, $0, -1, -1, $0, 0, TeacherScript_0x7ca7d, -1
	person_event SPRITE_SUPER_NERD, 31, 23, OW_UP | $2, $0, -1, -1, $0, 0, SuperNerdScript_0x7ca7a, -1
	person_event SPRITE_POKE_BALL, 16, 5, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7ce7d, EVENT_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_SMOKE_BALL
	person_event SPRITE_POKE_BALL, 13, 18, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7ce7f, EVENT_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_FULL_HEAL
	person_event SPRITE_SILVER, 7, 27, OW_UP | $2, $0, -1, -1, $0, 0, ObjectEvent, EVENT_RIVAL_UNDERGROUND_PATH
