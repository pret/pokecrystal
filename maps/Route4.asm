Route4_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerBird_keeperHank:
	; bit/flag number
	dw EVENT_BEAT_BIRD_KEEPER_HANK

	; trainer group && trainer id
	db BIRD_KEEPER, HANK

	; text when seen
	dw Bird_keeperHankSeenText

	; text when trainer beaten
	dw Bird_keeperHankBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperHankScript

Bird_keeperHankScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae258
	closetext
	loadmovesprites
	end

TrainerPicnickerHope:
	; bit/flag number
	dw EVENT_BEAT_PICNICKER_HOPE

	; trainer group && trainer id
	db PICNICKER, HOPE

	; text when seen
	dw PicnickerHopeSeenText

	; text when trainer beaten
	dw PicnickerHopeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerHopeScript

PicnickerHopeScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae320
	closetext
	loadmovesprites
	end

TrainerPicnickerSharon:
	; bit/flag number
	dw EVENT_BEAT_PICNICKER_SHARON

	; trainer group && trainer id
	db PICNICKER, SHARON

	; text when seen
	dw PicnickerSharonSeenText

	; text when trainer beaten
	dw PicnickerSharonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerSharonScript

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
	dw $00f1
	db ULTRA_BALL
	

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

	; warps
	db 1
	warp_def $5, $2, 2, GROUP_MOUNT_MOON, MAP_MOUNT_MOON

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 7, 3, $0, MapRoute4Signpost0Script
	signpost 3, 10, $7, MapRoute4SignpostItem1

	; people-events
	db 4
	person_event SPRITE_YOUNGSTER, 13, 21, $6, $0, 255, 255, $92, 3, TrainerBird_keeperHank, $ffff
	person_event SPRITE_LASS, 12, 13, $8, $0, 255, 255, $a2, 4, TrainerPicnickerHope, $ffff
	person_event SPRITE_LASS, 10, 25, $9, $0, 255, 255, $a2, 4, TrainerPicnickerSharon, $ffff
	person_event SPRITE_POKE_BALL, 7, 30, $1, $0, 255, 255, $1, 0, ItemFragment_0x1ae20f, $0787
