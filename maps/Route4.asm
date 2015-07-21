Route4_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperHank:
	trainer EVENT_BEAT_BIRD_KEEPER_HANK, BIRD_KEEPER, HANK, Bird_keeperHankSeenText, Bird_keeperHankBeatenText, $0000, Bird_keeperHankScript

Bird_keeperHankScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae258
	closetext
	loadmovesprites
	end

TrainerPicnickerHope:
	trainer EVENT_BEAT_PICNICKER_HOPE, PICNICKER, HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, $0000, PicnickerHopeScript

PicnickerHopeScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae320
	closetext
	loadmovesprites
	end

TrainerPicnickerSharon:
	trainer EVENT_BEAT_PICNICKER_SHARON, PICNICKER, SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, $0000, PicnickerSharonScript

PicnickerSharonScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae369
	closetext
	loadmovesprites
	end

MapRoute4Signpost0Script:
	jumptext UnknownText_0x1ae384

ItemFragment_0x1ae20f:
	db HP_UP, 1

MapRoute4SignpostItem1:
	dwb EVENT_ROUTE_4_HIDDEN_ULTRA_BALL, ULTRA_BALL
	

Bird_keeperHankSeenText:
	text "I'm raising my"
	line "#MON. Want to"
	cont "battle with me?"
	done

Bird_keeperHankBeatenText:
	text "Ack! I lost that"
	line "one…"
	done

UnknownText_0x1ae258:
	text "If you have a"
	line "specific #MON"

	para "that you want to"
	line "raise, put it out"

	para "first, then switch"
	line "it right away."

	para "That's how to do"
	line "it."
	done

PicnickerHopeSeenText:
	text "I have a feeling"
	line "that I can win."

	para "Let's see if I'm"
	line "right!"
	done

PicnickerHopeBeatenText:
	text "Aww, you are too"
	line "strong."
	done

UnknownText_0x1ae320:
	text "I heard CLEFAIRY"
	line "appear at MT.MOON."

	para "But where could"
	line "they be?"
	done

PicnickerSharonSeenText:
	text "Um…"
	line "I…"
	done

PicnickerSharonBeatenText:
	text "…"
	done

UnknownText_0x1ae369:
	text "……I'll go train"
	line "some more…"
	done

UnknownText_0x1ae384:
	text "MT.MOON SQUARE"

	para "Just go up the"
	line "stairs."
	done

Route4_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $5, $2, 2, GROUP_MOUNT_MOON, MAP_MOUNT_MOON

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 7, 3, SIGNPOST_READ, MapRoute4Signpost0Script
	signpost 3, 10, SIGNPOST_ITEM, MapRoute4SignpostItem1

.PersonEvents:
	db 4
	person_event SPRITE_YOUNGSTER, 13, 21, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerBird_keeperHank, -1
	person_event SPRITE_LASS, 12, 13, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 4, TrainerPicnickerHope, -1
	person_event SPRITE_LASS, 10, 25, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 4, TrainerPicnickerSharon, -1
	person_event SPRITE_POKE_BALL, 7, 30, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1ae20f, EVENT_ROUTE_4_HP_UP
