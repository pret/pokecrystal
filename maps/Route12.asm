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
	2writetext UnknownText_0x1a7238
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
	2writetext UnknownText_0x1a704c
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
	2writetext UnknownText_0x1a70d4
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
	2writetext UnknownText_0x1a716d
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
	db $0, "Patience is the", $4f
	db "key to both fish-", $55
	db "ing and #MON.", $57
; 0x1a7043

FisherMartinBeatenText: ; 0x1a7043
	db $0, "Gwaaah!", $57
; 0x1a704c

UnknownText_0x1a704c: ; 0x1a704c
	db $0, "I'm too impatient", $4f
	db "for fishing…", $57
; 0x1a706b

FisherStephenSeenText: ; 0x1a706b
	db $0, "I feel so content,", $4f
	db "fishing while lis-", $55
	db "tening to some", $55
	db "tunes on my radio.", $57
; 0x1a70b4

FisherStephenBeatenText: ; 0x1a70b4
	db $0, "My stupid radio", $4f
	db "distracted me!", $57
; 0x1a70d4

UnknownText_0x1a70d4: ; 0x1a70d4
	db $0, "Have you checked", $4f
	db "out KANTO's radio", $51
	db "programs? We get a", $4f
	db "good variety here.", $57
; 0x1a711d

FisherBarneySeenText: ; 0x1a711d
	db $0, "What's most impor-", $4f
	db "tant in our every-", $55
	db "day lives?", $57
; 0x1a714e

FisherBarneyBeatenText: ; 0x1a714e
	db $0, "The answer is", $4f
	db "coming up next!", $57
; 0x1a716d

UnknownText_0x1a716d: ; 0x1a716d
	db $0, "I think electric-", $4f
	db "ity is the most", $51
	db "important thing in", $4f
	db "our daily lives.", $51
	db "If it weren't,", $4f
	db "people wouldn't", $51
	db "have made such a", $4f
	db "fuss when the", $51
	db "POWER PLANT went", $4f
	db "out of commission.", $57
; 0x1a7214

FisherKyleSeenText: ; 0x1a7214
	db $0, "Do you remember?", $57
; 0x1a7226

FisherKyleBeatenText: ; 0x1a7226
	db $0, "You do remember?", $57
; 0x1a7238

UnknownText_0x1a7238: ; 0x1a7238
	db $0, "The tug you feel", $4f
	db "on the ROD when", $51
	db "you hook a #-", $4f
	db "MON…", $51
	db "That's the best", $4f
	db "feeling ever for", $55
	db "an angler like me.", $57
; 0x1a72a0

UnknownText_0x1a72a0: ; 0x1a72a0
	db $0, "ROUTE 12", $51
	db "NORTH TO LAVENDER", $4f
	db "TOWN", $57
; 0x1a72c1

UnknownText_0x1a72c1: ; 0x1a72c1
	db $0, "FISHING SPOT", $57
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
	person_event $3a, 17, 9, $a, $0, 255, 255, $a2, 1, TrainerFisherMartin, $ffff
	person_event $3a, 27, 18, $6, $0, 255, 255, $a2, 1, TrainerFisherStephen, $ffff
	person_event $3a, 42, 14, $8, $0, 255, 255, $a2, 5, TrainerFisherBarney, $ffff
	person_event $3a, 11, 10, $9, $0, 255, 255, $a2, 3, TrainerFisherKyle, $ffff
	person_event $54, 47, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a700b, $0788
	person_event $54, 55, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a700d, $0789
; 0x1a7337



