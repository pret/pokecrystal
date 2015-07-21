Route37_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, SunnyCallback

SunnyCallback:
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, .SunnyAppears
	disappear $6
	return

.SunnyAppears
	appear $6
	return

TrainerTwinsAnnandanne1:
	trainer EVENT_BEAT_TWINS_ANN_AND_ANNE, TWINS, ANNANDANNE1, TwinsAnnandanne1SeenText, TwinsAnnandanne1BeatenText, $0000, TwinsAnnandanne1Script

TwinsAnnandanne1Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a8e62
	closetext
	loadmovesprites
	end

TrainerTwinsAnnandanne2:
	trainer EVENT_BEAT_TWINS_ANN_AND_ANNE, TWINS, ANNANDANNE2, TwinsAnnandanne2SeenText, TwinsAnnandanne2BeatenText, $0000, TwinsAnnandanne2Script

TwinsAnnandanne2Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a8eec
	closetext
	loadmovesprites
	end

TrainerPsychicGreg:
	trainer EVENT_BEAT_PSYCHIC_GREG, PSYCHIC_T, GREG, PsychicGregSeenText, PsychicGregBeatenText, $0000, PsychicGregScript

PsychicGregScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a8f80
	closetext
	loadmovesprites
	end

SunnyScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	checkcode VAR_WEEKDAY
	if_not_equal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	keeptextopen
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	keeptextopen
	jump .next
.Kris
	writetext SunnyGivesGiftText2
	keeptextopen
.next
	verbosegiveitem MAGNET, 1
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	closetext
	loadmovesprites
	end

SunnySundayScript:
	writetext SunnySundayText
	closetext
SunnyDoneScript:
	loadmovesprites
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	closetext
	loadmovesprites
	end

MapRoute37Signpost0Script:
	jumptext UnknownText_0x1a9197

FruitTreeScript_0x1a8e09:
	fruittree $11

FruitTreeScript_0x1a8e0b:
	fruittree $12

FruitTreeScript_0x1a8e0d:
	fruittree $13

MapRoute37SignpostItem1:
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

UnknownText_0x1a9197:
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
	signpost 3, 5, SIGNPOST_READ, MapRoute37Signpost0Script
	signpost 2, 4, SIGNPOST_ITEM, MapRoute37SignpostItem1

.PersonEvents:
	db 7
	person_event SPRITE_WEIRD_TREE, 16, 10, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerTwinsAnnandanne1, -1
	person_event SPRITE_WEIRD_TREE, 16, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerTwinsAnnandanne2, -1
	person_event SPRITE_YOUNGSTER, 10, 10, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerPsychicGreg, -1
	person_event SPRITE_FRUIT_TREE, 9, 17, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1a8e09, -1
	person_event SPRITE_BUG_CATCHER, 12, 20, OW_DOWN | $2, $11, -1, -1, $0, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	person_event SPRITE_FRUIT_TREE, 9, 20, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1a8e0b, -1
	person_event SPRITE_FRUIT_TREE, 11, 19, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1a8e0d, -1
