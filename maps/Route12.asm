Route12_MapScriptHeader: ; 0x1a6fb3
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a6fb5

TrainerFisherKyle: ; 0x1a6fb5
	; bit/flag number
	dw $451

	; trainer group && trainer id
	db FISHER, KYLE

	; text when seen
	dw FisherKyleSeenText

	; text when trainer beaten
	dw FisherKyleBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherKyleScript
; 0x1a6fc1

FisherKyleScript: ; 0x1a6fc1
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a7238
	closetext
	loadmovesprites
	end
; 0x1a6fc9

TrainerFisherMartin: ; 0x1a6fc9
	; bit/flag number
	dw $45a

	; trainer group && trainer id
	db FISHER, MARTIN

	; text when seen
	dw FisherMartinSeenText

	; text when trainer beaten
	dw FisherMartinBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherMartinScript
; 0x1a6fd5

FisherMartinScript: ; 0x1a6fd5
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a704c
	closetext
	loadmovesprites
	end
; 0x1a6fdd

TrainerFisherStephen: ; 0x1a6fdd
	; bit/flag number
	dw $45b

	; trainer group && trainer id
	db FISHER, STEPHEN

	; text when seen
	dw FisherStephenSeenText

	; text when trainer beaten
	dw FisherStephenBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherStephenScript
; 0x1a6fe9

FisherStephenScript: ; 0x1a6fe9
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a70d4
	closetext
	loadmovesprites
	end
; 0x1a6ff1

TrainerFisherBarney: ; 0x1a6ff1
	; bit/flag number
	dw $45c

	; trainer group && trainer id
	db FISHER, BARNEY

	; text when seen
	dw FisherBarneySeenText

	; text when trainer beaten
	dw FisherBarneyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherBarneyScript
; 0x1a6ffd

FisherBarneyScript: ; 0x1a6ffd
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a716d
	closetext
	loadmovesprites
	end
; 0x1a7005

MapRoute12Signpost0Script: ; 0x1a7005
	jumptext UnknownText_0x1a72a0
; 0x1a7008

MapRoute12Signpost1Script: ; 0x1a7008
	jumptext UnknownText_0x1a72c1
; 0x1a700b

ItemFragment_0x1a700b: ; 0x1a700b
	db CALCIUM, 1
; 0x1a700d

ItemFragment_0x1a700d: ; 0x1a700d
	db NUGGET, 1
; 0x1a700f

MapRoute12SignpostItem2: ; 0x1a700f
	dw $00f3
	db ELIXER
	
; 0x1a7012

FisherMartinSeenText: ; 0x1a7012
	text "Patience is the"
	line "key to both fish-"
	cont "ing and #MON."
	done
; 0x1a7043

FisherMartinBeatenText: ; 0x1a7043
	text "Gwaaah!"
	done
; 0x1a704c

UnknownText_0x1a704c: ; 0x1a704c
	text "I'm too impatient"
	line "for fishing…"
	done
; 0x1a706b

FisherStephenSeenText: ; 0x1a706b
	text "I feel so content,"
	line "fishing while lis-"
	cont "tening to some"
	cont "tunes on my radio."
	done
; 0x1a70b4

FisherStephenBeatenText: ; 0x1a70b4
	text "My stupid radio"
	line "distracted me!"
	done
; 0x1a70d4

UnknownText_0x1a70d4: ; 0x1a70d4
	text "Have you checked"
	line "out KANTO's radio"

	para "programs? We get a"
	line "good variety here."
	done
; 0x1a711d

FisherBarneySeenText: ; 0x1a711d
	text "What's most impor-"
	line "tant in our every-"
	cont "day lives?"
	done
; 0x1a714e

FisherBarneyBeatenText: ; 0x1a714e
	text "The answer is"
	line "coming up next!"
	done
; 0x1a716d

UnknownText_0x1a716d: ; 0x1a716d
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
; 0x1a7214

FisherKyleSeenText: ; 0x1a7214
	text "Do you remember?"
	done
; 0x1a7226

FisherKyleBeatenText: ; 0x1a7226
	text "You do remember?"
	done
; 0x1a7238

UnknownText_0x1a7238: ; 0x1a7238
	text "The tug you feel"
	line "on the ROD when"

	para "you hook a #-"
	line "MON…"

	para "That's the best"
	line "feeling ever for"
	cont "an angler like me."
	done
; 0x1a72a0

UnknownText_0x1a72a0: ; 0x1a72a0
	text "ROUTE 12"

	para "NORTH TO LAVENDER"
	line "TOWN"
	done
; 0x1a72c1

UnknownText_0x1a72c1: ; 0x1a72c1
	text "FISHING SPOT"
	done
; 0x1a72cf

Route12_MapEventHeader: ; 0x1a72cf
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $21, $b, 1, GROUP_ROUTE_12_SUPER_ROD_HOUSE, MAP_ROUTE_12_SUPER_ROD_HOUSE

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 27, 11, $0, MapRoute12Signpost0Script
	signpost 9, 13, $0, MapRoute12Signpost1Script
	signpost 13, 14, $7, MapRoute12SignpostItem2

	; people-events
	db 6
	person_event SPRITE_FISHER, 17, 9, $a, $0, 255, 255, $a2, 1, TrainerFisherMartin, $ffff
	person_event SPRITE_FISHER, 27, 18, $6, $0, 255, 255, $a2, 1, TrainerFisherStephen, $ffff
	person_event SPRITE_FISHER, 42, 14, $8, $0, 255, 255, $a2, 5, TrainerFisherBarney, $ffff
	person_event SPRITE_FISHER, 11, 10, $9, $0, 255, 255, $a2, 3, TrainerFisherKyle, $ffff
	person_event SPRITE_POKE_BALL, 47, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a700b, $0788
	person_event SPRITE_POKE_BALL, 55, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a700d, $0789
; 0x1a7337



