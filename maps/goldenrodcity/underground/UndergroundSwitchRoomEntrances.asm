UNDERGROUND_DOOR_CLOSED1 EQU $2a
UNDERGROUND_DOOR_CLOSED2 EQU $3e
UNDERGROUND_DOOR_CLOSED3 EQU $3f
UNDERGROUND_DOOR_OPEN1   EQU $2d
UNDERGROUND_DOOR_OPEN2   EQU $3d

ugdoor: macro
\1_YCOORD EQU \2
\1_XCOORD EQU \3
endm

	ugdoor UGDOOR_1,  $10, $06
	ugdoor UGDOOR_2,  $0a, $06
	ugdoor UGDOOR_3,  $02, $06
	ugdoor UGDOOR_4,  $02, $0a
	ugdoor UGDOOR_5,  $0a, $0a
	ugdoor UGDOOR_6,  $10, $0a
	ugdoor UGDOOR_7,  $0c, $06
	ugdoor UGDOOR_8,  $0c, $08
	ugdoor UGDOOR_9,  $06, $06
	ugdoor UGDOOR_10, $06, $08
	ugdoor UGDOOR_11, $0c, $0a
	ugdoor UGDOOR_12, $0c, $0c
	ugdoor UGDOOR_13, $06, $0a
	ugdoor UGDOOR_14, $06, $0c
	ugdoor UGDOOR_15, $12, $0a
	ugdoor UGDOOR_16, $12, $0c

doorstate: macro
	changeblock UGDOOR_\1_YCOORD, UGDOOR_\1_XCOORD, UNDERGROUND_DOOR_\2
endm

const_value set 2
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_PHARMACIST1
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_PHARMACIST2
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_ROCKET1
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_ROCKET2
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_ROCKET3
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_ROCKET_GIRL
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_TEACHER
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_SUPER_NERD
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_POKE_BALL1
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_POKE_BALL2
	const UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER

UndergroundPathSwitchRoomEntrances_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, .UpdateDoorPositions

.Trigger0:
	end

.Trigger1:
	end

.UpdateDoorPositions:
	checkevent EVENT_SWITCH_4
	iffalse .false4
	doorstate 1, OPEN1
.false4
	checkevent EVENT_SWITCH_5
	iffalse .false5
	doorstate 2, OPEN1
.false5
	checkevent EVENT_SWITCH_6
	iffalse .false6
	doorstate 3, OPEN1
.false6
	checkevent EVENT_SWITCH_7
	iffalse .false7
	doorstate 4, OPEN1
.false7
	checkevent EVENT_SWITCH_8
	iffalse .false8
	doorstate 5, OPEN1
.false8
	checkevent EVENT_SWITCH_9
	iffalse .false9
	doorstate 6, OPEN1
.false9
	checkevent EVENT_SWITCH_10
	iffalse .false10
	doorstate 7, CLOSED1
	doorstate 8, OPEN1
.false10
	checkevent EVENT_SWITCH_11
	iffalse .false11
	doorstate 9, CLOSED1
	doorstate 10, OPEN1
.false11
	checkevent EVENT_SWITCH_12
	iffalse .false12
	doorstate 11, CLOSED1
	doorstate 12, OPEN1
.false12
	checkevent EVENT_SWITCH_13
	iffalse .false13
	doorstate 13, CLOSED1
	doorstate 14, OPEN1
.false13
	checkevent EVENT_SWITCH_14
	iffalse .false14
	doorstate 15, CLOSED1
	doorstate 16, OPEN1
.false14
	return

SuperNerdScript_0x7ca7a:
	jumptextfaceplayer UndergroundPathSwitchRoomEntrances_SuperNerdText

TeacherScript_0x7ca7d:
	jumptextfaceplayer UndergroundPathSwitchRoomEntrances_TeacherText

UndergroundSilverTrigger1:
	spriteface PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	waitsfx
	applymovement UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER, UndergroundSilverApproachMovement1
	spriteface PLAYER, RIGHT
	scall UndergroundSilverBattleScript
	applymovement UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER, UndergroundSilverRetreatMovement1
	playsound SFX_EXIT_BUILDING
	disappear UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	dotrigger 1
	waitsfx
	playmapmusic
	end

UndergroundSilverTrigger2:
	spriteface PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	playsound SFX_EXIT_BUILDING
	appear UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	waitsfx
	applymovement UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER, UndergroundSilverApproachMovement2
	spriteface PLAYER, RIGHT
	scall UndergroundSilverBattleScript
	applymovement UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER, UndergroundSilverRetreatMovement2
	playsound SFX_EXIT_BUILDING
	disappear UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	dotrigger 1
	waitsfx
	playmapmusic
	end

UndergroundSilverBattleScript:
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue .Continue
	setevent EVENT_RIVAL_BURNED_TOWER
	domaptrigger BURNED_TOWER_1F, 1
.Continue:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UndergroundSilverBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_UNDERGROUND_PATH
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	setlasttalked UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	loadtrainer RIVAL1, RIVAL1_12
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishRivalBattle

.Totodile:
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	setlasttalked UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	loadtrainer RIVAL1, RIVAL1_10
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishRivalBattle

.Chikorita:
	winlosstext UndergroundSilverWinText, UndergroundSilverLossText
	setlasttalked UNDERGROUNDPATHSWITCHROOMENTRANCES_SILVER
	loadtrainer RIVAL1, RIVAL1_11
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishRivalBattle

.FinishRivalBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext UndergroundSilverAfterText
	waitbutton
	closetext
	end

TrainerGruntM11:
	trainer EVENT_BEAT_ROCKET_GRUNTM_11, GRUNTM, 11, GruntM11SeenText, GruntM11BeatenText, 0, GruntM11Script

GruntM11Script:
	end_if_just_battled
	opentext
	writetext GruntM11AfterText
	waitbutton
	closetext
	end

TrainerGruntM25:
	trainer EVENT_BEAT_ROCKET_GRUNTM_25, GRUNTM, 25, GruntM25SeenText, GruntM25BeatenText, 0, GruntM25Script

GruntM25Script:
	end_if_just_battled
	opentext
	writetext GruntM25AfterText
	waitbutton
	closetext
	end

TrainerBurglarDuncan:
	trainer EVENT_BEAT_BURGLAR_DUNCAN, BURGLAR, DUNCAN, BurglarDuncanSeenText, BurglarDuncanBeatenText, 0, BurglarDuncanScript

BurglarDuncanScript:
	end_if_just_battled
	opentext
	writetext BurglarDuncanAfterText
	waitbutton
	closetext
	end

TrainerBurglarEddie:
	trainer EVENT_BEAT_BURGLAR_EDDIE, BURGLAR, EDDIE, BurglarEddieSeenText, BurglarEddieBeatenText, 0, BurglarEddieScript

BurglarEddieScript:
	end_if_just_battled
	opentext
	writetext BurglarEddieAfterText
	waitbutton
	closetext
	end

TrainerGruntM13:
	trainer EVENT_BEAT_ROCKET_GRUNTM_13, GRUNTM, 13, GruntM13SeenText, GruntM13BeatenText, 0, GruntM13Script

GruntM13Script:
	end_if_just_battled
	opentext
	writetext GruntM13AfterText
	waitbutton
	closetext
	end

TrainerGruntF3:
	trainer EVENT_BEAT_ROCKET_GRUNTF_3, GRUNTF, 3, GruntF3SeenText, GruntF3BeatenText, 0, GruntF3Script

GruntF3Script:
	end_if_just_battled
	opentext
	writetext GruntF3AfterText
	waitbutton
	closetext
	end

Switch1Script:
	opentext
	writetext SwitchRoomText_Switch1
	buttonsound
	checkevent EVENT_SWITCH_1
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse UndergroundPathSwitchRoomEntrances_DontToggle
	copybytetovar UndergroundSwitchPositions
	addvar 1
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_SWITCH_1
	jump UndergroundPathSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse UndergroundPathSwitchRoomEntrances_DontToggle
	copybytetovar UndergroundSwitchPositions
	addvar -1
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_SWITCH_1
	jump UndergroundPathSwitchRoomEntrances_UpdateDoors

Switch2Script:
	opentext
	writetext SwitchRoomText_Switch2
	buttonsound
	checkevent EVENT_SWITCH_2
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse UndergroundPathSwitchRoomEntrances_DontToggle
	copybytetovar UndergroundSwitchPositions
	addvar 2
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_SWITCH_2
	jump UndergroundPathSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse UndergroundPathSwitchRoomEntrances_DontToggle
	copybytetovar UndergroundSwitchPositions
	addvar -2
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_SWITCH_2
	jump UndergroundPathSwitchRoomEntrances_UpdateDoors

Switch3Script:
	opentext
	writetext SwitchRoomText_Switch3
	buttonsound
	checkevent EVENT_SWITCH_3
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse UndergroundPathSwitchRoomEntrances_DontToggle
	copybytetovar UndergroundSwitchPositions
	addvar 3
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_SWITCH_3
	jump UndergroundPathSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse UndergroundPathSwitchRoomEntrances_DontToggle
	copybytetovar UndergroundSwitchPositions
	addvar -3
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_SWITCH_3
	jump UndergroundPathSwitchRoomEntrances_UpdateDoors

EmergencySwitchScript:
	opentext
	writetext SwitchRoomText_Emergency
	buttonsound
	checkevent EVENT_EMERGENCY_SWITCH
	iftrue .On
	writetext SwitchRoomText_OffTurnOn
	yesorno
	iffalse UndergroundPathSwitchRoomEntrances_DontToggle
	writebyte 7
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_EMERGENCY_SWITCH
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	jump UndergroundPathSwitchRoomEntrances_UpdateDoors

.On:
	writetext SwitchRoomText_OnTurnOff
	yesorno
	iffalse UndergroundPathSwitchRoomEntrances_DontToggle
	writebyte 0
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	jump UndergroundPathSwitchRoomEntrances_UpdateDoors

UndergroundPathSwitchRoomEntrances_DontToggle:
	closetext
	end

UndergroundPathSwitchRoomEntrances_UpdateDoors:
	copybytetovar UndergroundSwitchPositions
	if_equal 0, .Position0
	if_equal 1, .Position1
	if_equal 2, .Position2
	if_equal 3, .Position3
	if_equal 4, .Position4
	if_equal 5, .Position5
	if_equal 6, .Position6
	if_equal 7, .EmergencyPosition
.Position0:
	playsound SFX_ENTER_DOOR
	scall .Clear4
	scall .Clear5
	scall .Clear6
	scall .Clear7
	scall .Clear8
	scall .Clear9
	scall .Clear10
	scall .Clear11
	scall .Clear12
	scall .Clear13
	scall .Clear14
	reloadmappart
	closetext
	end

.Position1:
	playsound SFX_ENTER_DOOR
	scall .Set4
	scall .Set10
	scall .Set13
	scall .Clear9
	scall .Clear11
	scall .Clear12
	scall .Clear14
	reloadmappart
	closetext
	end

.Position2:
	playsound SFX_ENTER_DOOR
	scall .Set5
	scall .Set11
	scall .Set12
	scall .Clear8
	scall .Clear10
	scall .Clear13
	scall .Clear14
	reloadmappart
	closetext
	end

.Position3:
	playsound SFX_ENTER_DOOR
	scall .Set6
	scall .Set10
	scall .Set13
	scall .Clear7
	scall .Clear11
	scall .Clear12
	scall .Clear14
	reloadmappart
	closetext
	end

.Position4:
	playsound SFX_ENTER_DOOR
	scall .Set7
	scall .Set11
	scall .Set12
	scall .Clear6
	scall .Clear10
	scall .Clear13
	scall .Clear14
	reloadmappart
	closetext
	end

.Position5:
	playsound SFX_ENTER_DOOR
	scall .Set8
	scall .Set10
	scall .Set13
	scall .Clear5
	scall .Clear11
	scall .Clear12
	scall .Clear14
	reloadmappart
	closetext
	end

.Position6:
	playsound SFX_ENTER_DOOR
	scall .Set9
	scall .Set11
	scall .Set12
	scall .Set14
	scall .Clear4
	scall .Clear10
	scall .Clear13
	reloadmappart
	closetext
	end

.EmergencyPosition:
	playsound SFX_ENTER_DOOR
	scall .Clear4
	scall .Clear5
	scall .Set6
	scall .Clear7
	scall .Set8
	scall .Set9
	scall .Clear10
	scall .Set11
	scall .Set12
	scall .Clear13
	scall .Set14
	reloadmappart
	closetext
	writebyte 6
	copyvartobyte UndergroundSwitchPositions
	end

.Set4:
	doorstate 1, OPEN1
	setevent EVENT_SWITCH_4
	end

.Set5:
	doorstate 2, OPEN1
	setevent EVENT_SWITCH_5
	end

.Set6:
	doorstate 3, OPEN1
	setevent EVENT_SWITCH_6
	end

.Set7:
	doorstate 4, OPEN1
	setevent EVENT_SWITCH_7
	end

.Set8:
	doorstate 5, OPEN1
	setevent EVENT_SWITCH_8
	end

.Set9:
	doorstate 6, OPEN1
	setevent EVENT_SWITCH_9
	end

.Set10:
	doorstate 7, CLOSED1
	doorstate 8, OPEN1
	setevent EVENT_SWITCH_10
	end

.Set11:
	doorstate 9, CLOSED1
	doorstate 10, OPEN1
	setevent EVENT_SWITCH_11
	end

.Set12:
	doorstate 11, CLOSED1
	doorstate 12, OPEN1
	setevent EVENT_SWITCH_12
	end

.Set13:
	doorstate 13, CLOSED1
	doorstate 14, OPEN1
	setevent EVENT_SWITCH_13
	end

.Set14:
	doorstate 15, CLOSED1
	doorstate 16, OPEN1
	setevent EVENT_SWITCH_14
	end

.Clear4:
	doorstate 1, CLOSED2
	clearevent EVENT_SWITCH_4
	end

.Clear5:
	doorstate 2, CLOSED2
	clearevent EVENT_SWITCH_5
	end

.Clear6:
	doorstate 3, CLOSED2
	clearevent EVENT_SWITCH_6
	end

.Clear7:
	doorstate 4, CLOSED2
	clearevent EVENT_SWITCH_7
	end

.Clear8:
	doorstate 5, CLOSED2
	clearevent EVENT_SWITCH_8
	end

.Clear9:
	doorstate 6, CLOSED2
	clearevent EVENT_SWITCH_9
	end

.Clear10:
	doorstate 7, CLOSED3
	doorstate 8, OPEN2
	clearevent EVENT_SWITCH_10
	end

.Clear11:
	doorstate 9, CLOSED3
	doorstate 10, OPEN2
	clearevent EVENT_SWITCH_11
	end

.Clear12:
	doorstate 11, CLOSED3
	doorstate 12, OPEN2
	clearevent EVENT_SWITCH_12
	end

.Clear13:
	doorstate 13, CLOSED3
	doorstate 14, OPEN2
	clearevent EVENT_SWITCH_13
	end

.Clear14:
	doorstate 15, CLOSED3
	doorstate 16, OPEN2
	clearevent EVENT_SWITCH_14
	end

UndergroundPathSwitchRoomEntrancesSmokeBall:
	itemball SMOKE_BALL

UndergroundPathSwitchRoomEntrancesFullHeal:
	itemball FULL_HEAL

UndergroundPathSwitchRoomEntrancesHiddenMaxPotion:
	dwb EVENT_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_HIDDEN_MAX_POTION, MAX_POTION


UndergroundPathSwitchRoomEntrancesHiddenRevive:
	dwb EVENT_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_HIDDEN_REVIVE, REVIVE


UndergroundSilverApproachMovement1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

UndergroundSilverApproachMovement2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step_end

UndergroundSilverRetreatMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end

UndergroundSilverRetreatMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

UndergroundSilverBeforeText:
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

UndergroundSilverWinText:
	text "…Why…"
	line "Why do I lose?"

	para "I've assembled the"
	line "toughest #MON."

	para "I didn't ease up"
	line "on the gas."

	para "So why do I lose?"
	done

UndergroundSilverAfterText:
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

UndergroundSilverLossText:
	text "Humph. This is my"
	line "real power, wimp."

	para "I'll make TEAM"
	line "ROCKET history."

	para "And I'm going to"
	line "grind that LANCE"
	cont "under my heels."
	done

UndergroundPathSwitchRoomEntrances_SuperNerdText:
	text "I was challenged"
	line "to a battle down-"
	cont "stairs."

	para "It's rough down"
	line "there. You'd"
	cont "better be careful."
	done

UndergroundPathSwitchRoomEntrances_TeacherText:
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

GruntM11AfterText:
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

GruntM25AfterText:
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

BurglarDuncanAfterText:
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

BurglarEddieAfterText:
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

GruntM13AfterText:
	text "You must have ice"
	line "in your veins to"
	cont "dis TEAM ROCKET."
	done

SwitchRoomText_Switch1:
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

GruntF3AfterText:
	text "Go wherever you'd"
	line "like! Get lost!"
	cont "See if I care!"
	done

SwitchRoomText_OffTurnOn:
	text "It's OFF."
	line "Turn it ON?"
	done

SwitchRoomText_OnTurnOff:
	text "It's ON."
	line "Turn it OFF?"
	done

SwitchRoomText_Switch2:
	text "It's labeled"
	line "SWITCH 2."
	done

SwitchRoomText_Switch3:
	text "It's labeled"
	line "SWITCH 3."
	done

SwitchRoomText_Emergency:
	text "It's labeled"
	line "EMERGENCY."
	done

UndergroundPathSwitchRoomEntrances_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 9
	warp_def $3, $17, 6, WAREHOUSE_ENTRANCE
	warp_def $a, $16, 1, UNDERGROUND_WAREHOUSE
	warp_def $a, $17, 2, UNDERGROUND_WAREHOUSE
	warp_def $19, $5, 2, WAREHOUSE_ENTRANCE
	warp_def $1d, $4, 14, GOLDENROD_CITY
	warp_def $1d, $5, 14, GOLDENROD_CITY
	warp_def $19, $15, 1, WAREHOUSE_ENTRANCE
	warp_def $1d, $14, 13, GOLDENROD_CITY
	warp_def $1d, $15, 13, GOLDENROD_CITY

.XYTriggers:
	db 2
	xy_trigger 0, $4, $13, $0, UndergroundSilverTrigger1, $0, 0
	xy_trigger 0, $5, $13, $0, UndergroundSilverTrigger2, $0, 0

.Signposts:
	db 6
	signpost 1, 16, SIGNPOST_READ, Switch1Script
	signpost 1, 10, SIGNPOST_READ, Switch2Script
	signpost 1, 2, SIGNPOST_READ, Switch3Script
	signpost 11, 20, SIGNPOST_READ, EmergencySwitchScript
	signpost 9, 8, SIGNPOST_ITEM, UndergroundPathSwitchRoomEntrancesHiddenMaxPotion
	signpost 8, 1, SIGNPOST_ITEM, UndergroundPathSwitchRoomEntrancesHiddenRevive

.PersonEvents:
	db 11
	person_event SPRITE_PHARMACIST, 12, 9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerBurglarDuncan, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_PHARMACIST, 8, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerBurglarEddie, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 2, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, TrainerGruntM13, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 2, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, TrainerGruntM11, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, TrainerGruntM25, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET_GIRL, 12, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerGruntF3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_TEACHER, 27, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x7ca7d, -1
	person_event SPRITE_SUPER_NERD, 27, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x7ca7a, -1
	person_event SPRITE_POKE_BALL, 12, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UndergroundPathSwitchRoomEntrancesSmokeBall, EVENT_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_SMOKE_BALL
	person_event SPRITE_POKE_BALL, 9, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UndergroundPathSwitchRoomEntrancesFullHeal, EVENT_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_FULL_HEAL
	person_event SPRITE_SILVER, 3, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_UNDERGROUND_PATH
