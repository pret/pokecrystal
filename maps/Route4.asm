Route4_MapScriptHeader: ; 0x1ae1ce
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ae1d0

TrainerBird_keeperHank: ; 0x1ae1d0
	; bit/flag number
	dw $402

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
; 0x1ae1dc

Bird_keeperHankScript: ; 0x1ae1dc
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae258
	closetext
	loadmovesprites
	end
; 0x1ae1e4

TrainerPicnickerHope: ; 0x1ae1e4
	; bit/flag number
	dw $483

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
; 0x1ae1f0

PicnickerHopeScript: ; 0x1ae1f0
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae320
	closetext
	loadmovesprites
	end
; 0x1ae1f8

TrainerPicnickerSharon: ; 0x1ae1f8
	; bit/flag number
	dw $484

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
; 0x1ae204

PicnickerSharonScript: ; 0x1ae204
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae369
	closetext
	loadmovesprites
	end
; 0x1ae20c

MapRoute4Signpost0Script: ; 0x1ae20c
	jumptext UnknownText_0x1ae384
; 0x1ae20f

ItemFragment_0x1ae20f: ; 0x1ae20f
	db HP_UP, 1
; 0x1ae211

MapRoute4SignpostItem1: ; 0x1ae211
	dw $00f1
	db ULTRA_BALL
	
; 0x1ae214

Bird_keeperHankSeenText: ; 0x1ae214
	text "I'm raising my"
	line "#MON. Want to"
	cont "battle with me?"
	done
; 0x1ae241

Bird_keeperHankBeatenText: ; 0x1ae241
	text "Ack! I lost that"
	line "one…"
	done
; 0x1ae258

UnknownText_0x1ae258: ; 0x1ae258
	text "If you have a"
	line "specific #MON"

	para "that you want to"
	line "raise, put it out"

	para "first, then switch"
	line "it right away."

	para "That's how to do"
	line "it."
	done
; 0x1ae2ce

PicnickerHopeSeenText: ; 0x1ae2ce
	text "I have a feeling"
	line "that I can win."

	para "Let's see if I'm"
	line "right!"
	done
; 0x1ae306

PicnickerHopeBeatenText: ; 0x1ae306
	text "Aww, you are too"
	line "strong."
	done
; 0x1ae320

UnknownText_0x1ae320: ; 0x1ae320
	text "I heard CLEFAIRY"
	line "appear at MT.MOON."

	para "But where could"
	line "they be?"
	done
; 0x1ae35e

PicnickerSharonSeenText: ; 0x1ae35e
	text "Um…"
	line "I…"
	done
; 0x1ae366

PicnickerSharonBeatenText: ; 0x1ae366
	text "…"
	done
; 0x1ae369

UnknownText_0x1ae369: ; 0x1ae369
	text "……I'll go train"
	line "some more…"
	done
; 0x1ae384

UnknownText_0x1ae384: ; 0x1ae384
	text "MT.MOON SQUARE"

	para "Just go up the"
	line "stairs."
	done
; 0x1ae3ab

Route4_MapEventHeader: ; 0x1ae3ab
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
; 0x1ae3f4
