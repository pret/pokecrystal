const_value set 2
	const ILEXFOREST_FARFETCHD
	const ILEXFOREST_YOUNGSTER1
	const ILEXFOREST_BLACK_BELT
	const ILEXFOREST_ROCKER
	const ILEXFOREST_POKE_BALL1
	const ILEXFOREST_KURT
	const ILEXFOREST_LASS
	const ILEXFOREST_YOUNGSTER2
	const ILEXFOREST_POKE_BALL2
	const ILEXFOREST_POKE_BALL3
	const ILEXFOREST_POKE_BALL4

IlexForest_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .FarfetchdCallback

.FarfetchdCallback:
	checkevent EVENT_GOT_HM01_CUT
	iftrue .Static
	copybytetovar FarfetchdPosition
	if_equal  1, .PositionOne
	if_equal  2, .PositionTwo
	if_equal  3, .PositionThree
	if_equal  4, .PositionFour
	if_equal  5, .PositionFive
	if_equal  6, .PositionSix
	if_equal  7, .PositionSeven
	if_equal  8, .PositionEight
	if_equal  9, .PositionNine
	if_equal 10, .PositionTen
.Static:
	return

.PositionOne:
	moveperson ILEXFOREST_FARFETCHD, $e, $1f
	appear ILEXFOREST_FARFETCHD
	return

.PositionTwo:
	moveperson ILEXFOREST_FARFETCHD, $f, $19
	appear ILEXFOREST_FARFETCHD
	return

.PositionThree:
	moveperson ILEXFOREST_FARFETCHD, $14, $18
	appear ILEXFOREST_FARFETCHD
	return

.PositionFour:
	moveperson ILEXFOREST_FARFETCHD, $1d, $16
	appear ILEXFOREST_FARFETCHD
	return

.PositionFive:
	moveperson ILEXFOREST_FARFETCHD, $1c, $1f
	appear ILEXFOREST_FARFETCHD
	return

.PositionSix:
	moveperson ILEXFOREST_FARFETCHD, $18, $23
	appear ILEXFOREST_FARFETCHD
	return

.PositionSeven:
	moveperson ILEXFOREST_FARFETCHD, $16, $1f
	appear ILEXFOREST_FARFETCHD
	return

.PositionEight:
	moveperson ILEXFOREST_FARFETCHD, $f, $1d
	appear ILEXFOREST_FARFETCHD
	return

.PositionNine:
	moveperson ILEXFOREST_FARFETCHD, $a, $23
	appear ILEXFOREST_FARFETCHD
	return

.PositionTen:
	moveperson ILEXFOREST_FARFETCHD, $6, $1c
	appear ILEXFOREST_FARFETCHD
	return

IlexForestCharcoalApprenticeScript:
	faceplayer
	opentext
	checkevent EVENT_HERDED_FARFETCHD
	iftrue .DoneFarfetchd
	writetext UnknownText_0x6ef5c
	waitbutton
	closetext
	end

.DoneFarfetchd:
	writetext UnknownText_0x6f019
	waitbutton
	closetext
	end

IlexForestFarfetchdScript:
	copybytetovar FarfetchdPosition
	if_equal  1, .Position1
	if_equal  2, .Position2
	if_equal  3, .Position3
	if_equal  4, .Position4
	if_equal  5, .Position5
	if_equal  6, .Position6
	if_equal  7, .Position7
	if_equal  8, .Position8
	if_equal  9, .Position9
	if_equal 10, .Position10

.Position1:
	faceplayer
	opentext
	writetext Text_ItsTheMissingPokemon
	buttonsound
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos1_Pos2
	moveperson ILEXFOREST_FARFETCHD, $f, $19
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 2
	end

.Position2:
	scall .CryAndCheckFacing
	if_equal DOWN, .Position2_Down
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos2_Pos3
	moveperson ILEXFOREST_FARFETCHD, $14, $18
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 3
	end

.Position2_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos2_Pos8
	moveperson ILEXFOREST_FARFETCHD, $f, $1d
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 8
	end

.Position3:
	scall .CryAndCheckFacing
	if_equal LEFT, .Position3_Left
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos3_Pos4
	moveperson ILEXFOREST_FARFETCHD, $1d, $16
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 4
	end

.Position3_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos3_Pos2
	moveperson ILEXFOREST_FARFETCHD, $f, $19
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 2
	end

.Position4:
	scall .CryAndCheckFacing
	if_equal UP, .Position4_Up
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos4_Pos5
	moveperson ILEXFOREST_FARFETCHD, $1c, $1f
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 5
	end

.Position4_Up:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos4_Pos3
	moveperson ILEXFOREST_FARFETCHD, $14, $18
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 3
	end

.Position5:
	scall .CryAndCheckFacing
	if_equal UP, .Position5_Up
	if_equal LEFT, .Position5_Left
	if_equal RIGHT, .Position5_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos5_Pos6
	moveperson ILEXFOREST_FARFETCHD, $18, $23
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 6
	end

.Position5_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos5_Pos7
	moveperson ILEXFOREST_FARFETCHD, $16, $1f
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 7
	end

.Position5_Up:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos5_Pos4_Up
	moveperson ILEXFOREST_FARFETCHD, $1d, $16
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 4
	end

.Position5_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos5_Pos4_Right
	moveperson ILEXFOREST_FARFETCHD, $1d, $16
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 4
	end

.Position6:
	scall .CryAndCheckFacing
	if_equal RIGHT, .Position6_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos6_Pos7
	moveperson ILEXFOREST_FARFETCHD, $16, $1f
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 7
	end

.Position6_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos6_Pos5
	moveperson ILEXFOREST_FARFETCHD, $1c, $1f
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 5
	end

.Position7:
	scall .CryAndCheckFacing
	if_equal DOWN, .Position7_Down
	if_equal LEFT, .Position7_Left
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos8
	moveperson ILEXFOREST_FARFETCHD, $f, $1d
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 8
	end

.Position7_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos6
	moveperson ILEXFOREST_FARFETCHD, $18, $23
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 6
	end

.Position7_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos5
	moveperson ILEXFOREST_FARFETCHD, $1c, $1f
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 5
	end

.Position8:
	scall .CryAndCheckFacing
	if_equal UP, .Position8_Up
	if_equal LEFT, .Position8_Left
	if_equal RIGHT, .Position8_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos9
	moveperson ILEXFOREST_FARFETCHD, $a, $23
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 9
	end

.Position8_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos7
	moveperson ILEXFOREST_FARFETCHD, $16, $1f
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 7
	end

.Position8_Up:
.Position8_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos2
	moveperson ILEXFOREST_FARFETCHD, $f, $19
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 2
	end

.Position9:
	scall .CryAndCheckFacing
	if_equal DOWN, .Position9_Down
	if_equal RIGHT, .Position9_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos10
	moveperson ILEXFOREST_FARFETCHD, $6, $1c
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 10
	appear ILEXFOREST_BLACK_BELT
	setevent EVENT_CHARCOAL_KILN_BOSS
	setevent EVENT_HERDED_FARFETCHD
	end

.Position9_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos8_Right
	moveperson ILEXFOREST_FARFETCHD, $f, $1d
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 8
	end

.Position9_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos8_Down
	moveperson ILEXFOREST_FARFETCHD, $f, $1d
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadvar FarfetchdPosition, 8
	end

.Position10:
	faceplayer
	opentext
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	end

.CryAndCheckFacing:
	faceplayer
	opentext
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	checkcode VAR_FACING
	end

IlexForestCharcoalMasterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .AlreadyGotCut
	writetext Text_CharcoalMasterIntro
	buttonsound
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	writetext Text_CharcoalMasterOutro
	waitbutton
	closetext
	setevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	clearevent EVENT_CHARCOAL_KILN_FARFETCH_D
	clearevent EVENT_CHARCOAL_KILN_APPRENTICE
	clearevent EVENT_CHARCOAL_KILN_BOSS
	end

.AlreadyGotCut:
	writetext Text_CharcoalMasterTalkAfter
	waitbutton
	closetext
	end

IlexForestHeadbuttGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .AlreadyGotHeadbutt
	writetext Text_HeadbuttIntro
	buttonsound
	verbosegiveitem TM_HEADBUTT
	iffalse .BagFull
	setevent EVENT_GOT_TM02_HEADBUTT
.AlreadyGotHeadbutt:
	writetext Text_HeadbuttOutro
	waitbutton
.BagFull:
	closetext
	end

TrainerBug_catcherWayne:
	trainer EVENT_BEAT_BUG_CATCHER_WAYNE, BUG_CATCHER, WAYNE, Bug_catcherWayneSeenText, Bug_catcherWayneBeatenText, 0, Bug_catcherWayneScript

Bug_catcherWayneScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherWayneAfterText
	waitbutton
	closetext
	end

IlexForestLassScript:
	jumptextfaceplayer Text_IlexForestLass

IlexForestRevive:
	itemball REVIVE

IlexForestXAttack:
	itemball X_ATTACK

IlexForestAntidote:
	itemball ANTIDOTE

IlexForestEther:
	itemball ETHER

IlexForestHiddenEther:
	dwb EVENT_ILEX_FOREST_HIDDEN_ETHER, ETHER


IlexForestHiddenSuperPotion:
	dwb EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION, SUPER_POTION


IlexForestHiddenFullHeal:
	dwb EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL, FULL_HEAL

IlexForestBoulder:
; unused
	jumpstd strengthboulder

MapIlexForestSignpost0Script:
	jumptext Text_IlexForestSignpost0

MapIlexForestSignpost4Script:
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .ForestIsRestless
	jump .DontDoCelebiEvent

.ForestIsRestless:
	checkitem GS_BALL
	iftrue .AskCelebiEvent
.DontDoCelebiEvent:
	jumptext Text_IlexForestShrine

.AskCelebiEvent:
	opentext
	writetext Text_ShrineCelebiEvent
	yesorno
	iftrue .CelebiEvent
	closetext
	end

.CelebiEvent:
	takeitem GS_BALL
	clearevent EVENT_FOREST_IS_RESTLESS
	setevent EVENT_AZALEA_TOWN_KURT
	disappear ILEXFOREST_LASS
	clearevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	writetext Text_InsertGSBall
	waitbutton
	closetext
	pause 20
	showemote EMOTE_SHOCK, PLAYER, 20
	special Special_FadeOutMusic
	applymovement PLAYER, MovementData_0x6ef58
	pause 30
	spriteface PLAYER, DOWN
	pause 20
	clearflag ENGINE_HAVE_EXAMINED_GS_BALL
	special Special_CelebiShrineEvent
	loadwildmon CELEBI, 30
	startbattle
	reloadmapafterbattle
	pause 20
	special CheckCaughtCelebi
	iffalse .DidntCatchCelebi
	appear ILEXFOREST_KURT
	applymovement ILEXFOREST_KURT, MovementData_0x6ef4e
	opentext
	writetext Text_KurtCaughtCelebi
	waitbutton
	closetext
	applymovement ILEXFOREST_KURT, MovementData_0x6ef53
	disappear ILEXFOREST_KURT
.DidntCatchCelebi:
	end

MovementData_Farfetchd_Pos1_Pos2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetchd_Pos2_Pos3:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos2_Pos8:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos3_Pos4:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetchd_Pos3_Pos2:
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos4_Pos5:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos4_Pos3:
	big_step LEFT
	jump_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos5_Pos6:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos5_Pos7:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetched_Pos5_Pos4_Up:
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	step_end

MovementData_Farfetched_Pos5_Pos4_Right:
	big_step RIGHT
	turn_head UP
	step_sleep 1
	turn_head DOWN
	step_sleep 1
	turn_head UP
	step_sleep 1
	big_step DOWN
	big_step DOWN
	fix_facing
	jump_step UP
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos6_Pos7:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos6_Pos5:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos7_Pos8:
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetched_Pos7_Pos6:
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos7_Pos5:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos8_Pos9:
	big_step DOWN
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetched_Pos8_Pos7:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos8_Pos2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos10:
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos8_Right:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos8_Down:
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_0x6ef4e:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x6ef53:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x6ef58:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

UnknownText_0x6ef5c:
	text "Oh, man… My boss"
	line "is going to be"
	cont "steaming…"

	para "The FARFETCH'D"
	line "that CUTS trees"

	para "for charcoal took"
	line "off on me."

	para "I can't go looking"
	line "for it here in the"
	cont "ILEX FOREST."

	para "It's too big, dark"
	line "and scary for me…"
	done

UnknownText_0x6f019:
	text "Wow! Thanks a"
	line "whole bunch!"

	para "My boss's #MON"
	line "won't obey me be-"
	cont "cause I don't have"
	cont "a BADGE."
	done

Text_ItsTheMissingPokemon:
	text "It's the missing"
	line "#MON!"
	done

Text_Kwaaaa:
	text "FARFETCH'D: Kwaa!"
	done

Text_CharcoalMasterIntro:
	text "Ah! My FARFETCH'D!"

	para "You found it for"
	line "us, kid?"

	para "Without it, we"
	line "wouldn't be able"

	para "to CUT trees for"
	line "charcoal."

	para "Thanks, kid!"

	para "Now, how can I"
	line "thank you…"

	para "I know! Here, take"
	line "this."
	done

Text_CharcoalMasterOutro:
	text "That's the CUT HM."
	line "Teach that to a"

	para "#MON to clear"
	line "small trees."

	para "Of course, you"
	line "have to have the"

	para "GYM BADGE from"
	line "AZALEA to use it."
	done

Text_CharcoalMasterTalkAfter:
	text "Do you want to"
	line "apprentice as a"

	para "charcoal maker"
	line "with me?"

	para "You'll be first-"
	line "rate in ten years!"
	done

Text_HeadbuttIntro:
	text "What am I doing?"

	para "I'm shaking trees"
	line "using HEADBUTT."

	para "It's fun. Here,"
	line "you try it too!"
	done

Text_HeadbuttOutro:
	text "Rattle trees with"
	line "HEADBUTT. Some-"
	cont "times, sleeping"
	cont "#MON fall out."
	done

Text_IlexForestLass:
	text "Did something"
	line "happen to the"
	cont "forest's guardian?"
	done

Text_IlexForestSignpost0:
	text "ILEX FOREST is"
	line "so overgrown with"

	para "trees that you"
	line "can't see the sky."

	para "Please watch out"
	line "for items that may"
	cont "have been dropped."
	done

Text_IlexForestShrine:
	text "ILEX FOREST"
	line "SHRINE…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"
	done

Text_ShrineCelebiEvent:
	text "ILEX FOREST"
	line "SHRINE…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"

	para "Oh? What is this?"

	para "It's a hole."
	line "It looks like the"

	para "GS BALL would fit"
	line "inside it."

	para "Want to put the GS"
	line "BALL here?"
	done

Text_InsertGSBall:
	text "<PLAYER> put in the"
	line "GS BALL."
	done

Text_KurtCaughtCelebi:
	text "Whew, wasn't that"
	line "something!"

	para "<PLAYER>, that was"
	line "fantastic. Thanks!"

	para "The legends about"
	line "that SHRINE were"
	cont "real after all."

	para "I feel inspired by"
	line "what I just saw."

	para "It motivates me to"
	line "make better BALLS!"

	para "I'm going!"
	done

Bug_catcherWayneSeenText:
	text "Don't sneak up on"
	line "me like that!"

	para "You frightened a"
	line "#MON away!"
	done

Bug_catcherWayneBeatenText:
	text "I hadn't seen that"
	line "#MON before…"
	done

Bug_catcherWayneAfterText:
	text "A #MON I've"
	line "never seen before"

	para "fell out of the"
	line "tree when I used"
	cont "HEADBUTT."

	para "I ought to use"
	line "HEADBUTT in other"
	cont "places too."
	done

IlexForest_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $5, $1, 3, ROUTE_34_ILEX_FOREST_GATE
	warp_def $2a, $3, 1, ILEX_FOREST_AZALEA_GATE
	warp_def $2b, $3, 2, ILEX_FOREST_AZALEA_GATE

.XYTriggers:
	db 0

.Signposts:
	db 5
	signpost 17, 3, SIGNPOST_READ, MapIlexForestSignpost0Script
	signpost 7, 11, SIGNPOST_ITEM, IlexForestHiddenEther
	signpost 14, 22, SIGNPOST_ITEM, IlexForestHiddenSuperPotion
	signpost 17, 1, SIGNPOST_ITEM, IlexForestHiddenFullHeal
	signpost 22, 8, SIGNPOST_UP, MapIlexForestSignpost4Script

.PersonEvents:
	db 11
	person_event SPRITE_BIRD, 31, 14, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, IlexForestFarfetchdScript, EVENT_ILEX_FOREST_FARFETCHD
	person_event SPRITE_YOUNGSTER, 28, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, IlexForestCharcoalApprenticeScript, EVENT_ILEX_FOREST_APPRENTICE
	person_event SPRITE_BLACK_BELT, 28, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IlexForestCharcoalMasterScript, EVENT_ILEX_FOREST_CHARCOAL_MASTER
	person_event SPRITE_ROCKER, 14, 15, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IlexForestHeadbuttGuyScript, -1
	person_event SPRITE_POKE_BALL, 32, 20, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestRevive, EVENT_ILEX_FOREST_REVIVE
	person_event SPRITE_KURT, 29, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_KURT
	person_event SPRITE_LASS, 24, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, IlexForestLassScript, EVENT_ILEX_FOREST_LASS
	person_event SPRITE_YOUNGSTER, 1, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 0, TrainerBug_catcherWayne, -1
	person_event SPRITE_POKE_BALL, 17, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestXAttack, EVENT_ILEX_FOREST_X_ATTACK
	person_event SPRITE_POKE_BALL, 7, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestAntidote, EVENT_ILEX_FOREST_ANTIDOTE
	person_event SPRITE_POKE_BALL, 1, 27, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestEther, EVENT_ILEX_FOREST_ETHER
