const_value set 2
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL

Route4_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperHank:
	trainer EVENT_BEAT_BIRD_KEEPER_HANK, BIRD_KEEPER, HANK, Bird_keeperHankSeenText, Bird_keeperHankBeatenText, 0, Bird_keeperHankScript

Bird_keeperHankScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae258
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer EVENT_BEAT_PICNICKER_HOPE, PICNICKER, HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, PicnickerHopeScript

PicnickerHopeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae320
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer EVENT_BEAT_PICNICKER_SHARON, PICNICKER, SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, PicnickerSharonScript

PicnickerSharonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae369
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
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

MtMoonSquareSignText:
	text "MT.MOON SQUARE"

	para "Just go up the"
	line "stairs."
	done

Route4_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $5, $2, 2, MOUNT_MOON

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 7, 3, SIGNPOST_READ, MtMoonSquareSign
	signpost 3, 10, SIGNPOST_ITEM, Route4HiddenUltraBall

.PersonEvents:
	db 4
	person_event SPRITE_YOUNGSTER, 9, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBird_keeperHank, -1
	person_event SPRITE_LASS, 8, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerPicnickerHope, -1
	person_event SPRITE_LASS, 6, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerPicnickerSharon, -1
	person_event SPRITE_POKE_BALL, 3, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
