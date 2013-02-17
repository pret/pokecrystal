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
	2writetext UnknownText_0x1ae258
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
	2writetext UnknownText_0x1ae320
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
	2writetext UnknownText_0x1ae369
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
	db $0, "I'm raising my", $4f
	db "#MON. Want to", $55
	db "battle with me?", $57
; 0x1ae241

Bird_keeperHankBeatenText: ; 0x1ae241
	db $0, "Ack! I lost that", $4f
	db "one…", $57
; 0x1ae258

UnknownText_0x1ae258: ; 0x1ae258
	db $0, "If you have a", $4f
	db "specific #MON", $51
	db "that you want to", $4f
	db "raise, put it out", $51
	db "first, then switch", $4f
	db "it right away.", $51
	db "That's how to do", $4f
	db "it.", $57
; 0x1ae2ce

PicnickerHopeSeenText: ; 0x1ae2ce
	db $0, "I have a feeling", $4f
	db "that I can win.", $51
	db "Let's see if I'm", $4f
	db "right!", $57
; 0x1ae306

PicnickerHopeBeatenText: ; 0x1ae306
	db $0, "Aww, you are too", $4f
	db "strong.", $57
; 0x1ae320

UnknownText_0x1ae320: ; 0x1ae320
	db $0, "I heard CLEFAIRY", $4f
	db "appear at MT.MOON.", $51
	db "But where could", $4f
	db "they be?", $57
; 0x1ae35e

PicnickerSharonSeenText: ; 0x1ae35e
	db $0, "Um…", $4f
	db "I…", $57
; 0x1ae366

PicnickerSharonBeatenText: ; 0x1ae366
	db $0, "…", $57
; 0x1ae369

UnknownText_0x1ae369: ; 0x1ae369
	db $0, "……I'll go train", $4f
	db "some more…", $57
; 0x1ae384

UnknownText_0x1ae384: ; 0x1ae384
	db $0, "MT.MOON SQUARE", $51
	db "Just go up the", $4f
	db "stairs.", $57
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
	person_event $27, 13, 21, $6, $0, 255, 255, $92, 3, TrainerBird_keeperHank, $ffff
	person_event $28, 12, 13, $8, $0, 255, 255, $a2, 4, TrainerPicnickerHope, $ffff
	person_event $28, 10, 25, $9, $0, 255, 255, $a2, 4, TrainerPicnickerSharon, $ffff
	person_event $54, 7, 30, $1, $0, 255, 255, $1, 0, ItemFragment_0x1ae20f, $0787
; 0x1ae3f4

