Route9_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerCamperDean:
	trainer EVENT_BEAT_CAMPER_DEAN, CAMPER, DEAN, CamperDeanSeenText, CamperDeanBeatenText, $0000, CamperDeanScript

CamperDeanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aafd9
	closetext
	loadmovesprites
	end

TrainerPicnickerHeidi:
	trainer EVENT_BEAT_PICNICKER_HEIDI, PICNICKER, HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, $0000, PicnickerHeidiScript

PicnickerHeidiScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ab07c
	closetext
	loadmovesprites
	end

TrainerCamperSid:
	trainer EVENT_BEAT_CAMPER_SID, CAMPER, SID, CamperSidSeenText, CamperSidBeatenText, $0000, CamperSidScript

CamperSidScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ab0f6
	closetext
	loadmovesprites
	end

TrainerPicnickerEdna:
	trainer EVENT_BEAT_PICNICKER_EDNA, PICNICKER, EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, $0000, PicnickerEdnaScript

PicnickerEdnaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ab15f
	closetext
	loadmovesprites
	end

TrainerHikerTim:
	trainer EVENT_BEAT_HIKER_TIM, HIKER, TIM, HikerTimSeenText, HikerTimBeatenText, $0000, HikerTimScript

HikerTimScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ab210
	closetext
	loadmovesprites
	end

TrainerHikerSidney:
	trainer EVENT_BEAT_HIKER_SIDNEY, HIKER, SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, $0000, HikerSidneyScript

HikerSidneyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ab278
	closetext
	loadmovesprites
	end

MapRoute9Signpost0Script:
	jumptext UnknownText_0x1ab2a2

MapRoute9SignpostItem1:
	dwb EVENT_ROUTE_9_HIDDEN_ETHER, ETHER
	

CamperDeanSeenText:
	text "I came to explore"
	line "ROCK TUNNEL."
	done

CamperDeanBeatenText:
	text "Whoa! Danger, man."
	done

UnknownText_0x1aafd9:
	text "My #MON were"
	line "hurt before even"

	para "entering ROCK"
	line "TUNNEL."

	para "I'd better take"
	line "them to a #MON"
	cont "CENTER right away."
	done

PicnickerHeidiSeenText:
	text "Have you ever been"
	line "to a picnic?"

	para "They're so much"
	line "fun!"
	done

PicnickerHeidiBeatenText:
	text "Ohhhh!"
	done

UnknownText_0x1ab07c:
	text "We bake lots of"
	line "goodies and share"

	para "them all around."
	line "They're delicious!"
	done

CamperSidSeenText:
	text "Hey, you!"
	line "Don't litter!"
	done

CamperSidBeatenText:
	text "I was just point-"
	line "ing out…"
	done

UnknownText_0x1ab0f6:
	text "Sorry. You weren't"
	line "littering. It was"
	cont "my mistake."
	done

PicnickerEdnaSeenText:
	text "People shouldn't"
	line "leave any litter"
	cont "behind."
	done

PicnickerEdnaBeatenText:
	text "Ohh… I lost…"
	done

UnknownText_0x1ab15f:
	text "Conserving energy"
	line "is important, but"

	para "the environment is"
	line "even more vital."
	done

HikerTimSeenText:
	text "She'll be coming"
	line "'round MT.SILVER"
	cont "when she comes…"

	para "MT.SILVER is in"
	line "JOHTO, right?"
	done

HikerTimBeatenText:
	text "I was too busy"
	line "singing…"
	done

UnknownText_0x1ab210:
	text "Battles are about"
	line "concentration."
	done

HikerSidneySeenText:
	text "I'll tell you a"
	line "secret."

	para "But first, we"
	line "battle!"
	done

HikerSidneyBeatenText:
	text "Oh, dang!"
	line "I lost that…"
	done

UnknownText_0x1ab278:
	text "The POWER PLANT is"
	line "across a small"
	cont "river."
	done

UnknownText_0x1ab2a2:
	text "ROUTE 9"

	para "CERULEAN CITY -"
	line "ROCK TUNNEL"
	done

Route9_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $f, $30, 1, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 7, 15, SIGNPOST_READ, MapRoute9Signpost0Script
	signpost 15, 41, SIGNPOST_ITEM, MapRoute9SignpostItem1

.PersonEvents:
	db 6
	person_event SPRITE_YOUNGSTER, 15, 27, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerCamperDean, -1
	person_event SPRITE_LASS, 12, 43, OW_LEFT | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerPicnickerHeidi, -1
	person_event SPRITE_YOUNGSTER, 8, 15, OW_LEFT | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 5, TrainerCamperSid, -1
	person_event SPRITE_LASS, 19, 16, OW_UP | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 1, TrainerPicnickerEdna, -1
	person_event SPRITE_POKEFAN_M, 7, 32, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 2, TrainerHikerTim, -1
	person_event SPRITE_POKEFAN_M, 19, 40, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 4, TrainerHikerSidney, -1
