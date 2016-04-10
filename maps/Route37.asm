const_value set 2
	const ROUTE37_WEIRD_TREE1
	const ROUTE37_WEIRD_TREE2
	const ROUTE37_YOUNGSTER
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_SUNNY
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3

Route37_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, SunnyCallback

SunnyCallback:
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	return

.SunnyAppears:
	appear ROUTE37_SUNNY
	return

TrainerTwinsAnnandanne1:
	trainer EVENT_BEAT_TWINS_ANN_AND_ANNE, TWINS, ANNANDANNE1, TwinsAnnandanne1SeenText, TwinsAnnandanne1BeatenText, 0, TwinsAnnandanne1Script

TwinsAnnandanne1Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a8e62
	waitbutton
	closetext
	end

TrainerTwinsAnnandanne2:
	trainer EVENT_BEAT_TWINS_ANN_AND_ANNE, TWINS, ANNANDANNE2, TwinsAnnandanne2SeenText, TwinsAnnandanne2BeatenText, 0, TwinsAnnandanne2Script

TwinsAnnandanne2Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a8eec
	waitbutton
	closetext
	end

TrainerPsychicGreg:
	trainer EVENT_BEAT_PSYCHIC_GREG, PSYCHIC_T, GREG, PsychicGregSeenText, PsychicGregBeatenText, 0, PsychicGregScript

PsychicGregScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a8f80
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	checkcode VAR_WEEKDAY
	if_not_equal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	buttonsound
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	buttonsound
	jump .next
.Kris:
	writetext SunnyGivesGiftText2
	buttonsound
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

Route37Sign:
	jumptext Route37SignText

FruitTreeScript_0x1a8e09:
	fruittree FRUITTREE_ROUTE_37_1

FruitTreeScript_0x1a8e0b:
	fruittree FRUITTREE_ROUTE_37_2

FruitTreeScript_0x1a8e0d:
	fruittree FRUITTREE_ROUTE_37_3

Route37HiddenEther:
	dwb EVENT_ROUTE_37_HIDDEN_ETHER, ETHER


TwinsAnnandanne1SeenText:
	text "ANN: ANNE and I"
	line "are in this to-"
	cont "gether!"
	done

TwinsAnnandanne1BeatenText:
	text "ANN & ANNE: Nnn… A"
	line "little too strong."
	done

UnknownText_0x1a8e62:
	text "ANN: I can tell"
	line "what my sister and"

	para "my #MON are"
	line "thinking."
	done

TwinsAnnandanne2SeenText:
	text "ANNE: ANN and I"
	line "are in this to-"
	cont "gether!"
	done

TwinsAnnandanne2BeatenText:
	text "ANN & ANNE: Nnn… A"
	line "little too strong."
	done

UnknownText_0x1a8eec:
	text "ANNE: We share the"
	line "same feelings as"
	cont "our #MON."
	done

PsychicGregSeenText:
	text "#MON can't do a"
	line "thing if they are"
	cont "asleep."

	para "I'll show you how"
	line "scary that is!"
	done

PsychicGregBeatenText:
	text "I lost. That's"
	line "pretty sad…"
	done

UnknownText_0x1a8f80:
	text "Putting #MON to"
	line "sleep or paralyz-"
	cont "ing them are good"
	cont "battle techniques."
	done

MeetSunnyText:
	text "SUNNY: Hi!"

	para "I'm SUNNY of Sun-"
	line "day, meaning it's"
	cont "Sunday today!"
	done

SunnyGivesGiftText1:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGivesGiftText2:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGaveGiftText:
	text "SUNNY: That thing…"

	para "Um…"

	para "… What was it now…"

	para "…"

	para "Oh! I remember"
	line "now!"

	para "A #MON that"
	line "knows electric"

	para "moves should hold"
	line "it."

	para "My sis MONICA said"
	line "it powers up"
	cont "electric moves!"
	done

SunnySundayText:
	text "SUNNY: My sisters"
	line "and brothers are"
	cont "MONICA, TUSCANY,"
	cont "WESLEY, ARTHUR,"
	cont "FRIEDA and SANTOS."

	para "They're all older"
	line "than me!"
	done

SunnyNotSundayText:
	text "SUNNY: Isn't today"
	line "Sunday?"
	cont "Um… I forgot!"
	done

Route37SignText:
	text "ROUTE 37"
	done

Route37_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 0

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 3, 5, SIGNPOST_READ, Route37Sign
	signpost 2, 4, SIGNPOST_ITEM, Route37HiddenEther

.PersonEvents:
	db 7
	person_event SPRITE_WEIRD_TREE, 12, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsAnnandanne1, -1
	person_event SPRITE_WEIRD_TREE, 12, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsAnnandanne2, -1
	person_event SPRITE_YOUNGSTER, 6, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerPsychicGreg, -1
	person_event SPRITE_FRUIT_TREE, 5, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a8e09, -1
	person_event SPRITE_BUG_CATCHER, 8, 16, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	person_event SPRITE_FRUIT_TREE, 5, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a8e0b, -1
	person_event SPRITE_FRUIT_TREE, 7, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x1a8e0d, -1
