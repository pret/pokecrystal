Route12_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerFisherKyle:
	trainer EVENT_BEAT_FISHER_KYLE, FISHER, KYLE, FisherKyleSeenText, FisherKyleBeatenText, $0000, FisherKyleScript

FisherKyleScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a7238
	closetext
	loadmovesprites
	end

TrainerFisherMartin:
	trainer EVENT_BEAT_FISHER_MARTIN, FISHER, MARTIN, FisherMartinSeenText, FisherMartinBeatenText, $0000, FisherMartinScript

FisherMartinScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a704c
	closetext
	loadmovesprites
	end

TrainerFisherStephen:
	trainer EVENT_BEAT_FISHER_STEPHEN, FISHER, STEPHEN, FisherStephenSeenText, FisherStephenBeatenText, $0000, FisherStephenScript

FisherStephenScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a70d4
	closetext
	loadmovesprites
	end

TrainerFisherBarney:
	trainer EVENT_BEAT_FISHER_BARNEY, FISHER, BARNEY, FisherBarneySeenText, FisherBarneyBeatenText, $0000, FisherBarneyScript

FisherBarneyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a716d
	closetext
	loadmovesprites
	end

MapRoute12Signpost0Script:
	jumptext UnknownText_0x1a72a0

MapRoute12Signpost1Script:
	jumptext UnknownText_0x1a72c1

ItemFragment_0x1a700b:
	db CALCIUM, 1

ItemFragment_0x1a700d:
	db NUGGET, 1

MapRoute12SignpostItem2:
	dwb EVENT_ROUTE_12_HIDDEN_ELIXER, ELIXER
	

FisherMartinSeenText:
	text "Patience is the"
	line "key to both fish-"
	cont "ing and #MON."
	done

FisherMartinBeatenText:
	text "Gwaaah!"
	done

UnknownText_0x1a704c:
	text "I'm too impatient"
	line "for fishing…"
	done

FisherStephenSeenText:
	text "I feel so content,"
	line "fishing while lis-"
	cont "tening to some"
	cont "tunes on my radio."
	done

FisherStephenBeatenText:
	text "My stupid radio"
	line "distracted me!"
	done

UnknownText_0x1a70d4:
	text "Have you checked"
	line "out KANTO's radio"

	para "programs? We get a"
	line "good variety here."
	done

FisherBarneySeenText:
	text "What's most impor-"
	line "tant in our every-"
	cont "day lives?"
	done

FisherBarneyBeatenText:
	text "The answer is"
	line "coming up next!"
	done

UnknownText_0x1a716d:
	text "I think electric-"
	line "ity is the most"

	para "important thing in"
	line "our daily lives."

	para "If it weren't,"
	line "people wouldn't"

	para "have made such a"
	line "fuss when the"

	para "POWER PLANT went"
	line "out of commission."
	done

FisherKyleSeenText:
	text "Do you remember?"
	done

FisherKyleBeatenText:
	text "You do remember?"
	done

UnknownText_0x1a7238:
	text "The tug you feel"
	line "on the ROD when"

	para "you hook a #-"
	line "MON…"

	para "That's the best"
	line "feeling ever for"
	cont "an angler like me."
	done

UnknownText_0x1a72a0:
	text "ROUTE 12"

	para "NORTH TO LAVENDER"
	line "TOWN"
	done

UnknownText_0x1a72c1:
	text "FISHING SPOT"
	done

Route12_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $21, $b, 1, GROUP_ROUTE_12_SUPER_ROD_HOUSE, MAP_ROUTE_12_SUPER_ROD_HOUSE

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 27, 11, SIGNPOST_READ, MapRoute12Signpost0Script
	signpost 9, 13, SIGNPOST_READ, MapRoute12Signpost1Script
	signpost 13, 14, SIGNPOST_ITEM, MapRoute12SignpostItem2

.PersonEvents:
	db 6
	person_event SPRITE_FISHER, 17, 9, OW_LEFT | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 1, TrainerFisherMartin, -1
	person_event SPRITE_FISHER, 27, 18, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 1, TrainerFisherStephen, -1
	person_event SPRITE_FISHER, 42, 14, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 5, TrainerFisherBarney, -1
	person_event SPRITE_FISHER, 11, 10, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerFisherKyle, -1
	person_event SPRITE_POKE_BALL, 47, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1a700b, EVENT_ROUTE_12_CALCIUM
	person_event SPRITE_POKE_BALL, 55, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1a700d, EVENT_ROUTE_12_NUGGET
