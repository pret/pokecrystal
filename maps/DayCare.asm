DayCare_MapScriptHeader: ; 0x62f76
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x62f7b
; 0x62f7b

UnknownScript_0x62f7b: ; 0x62f7b
	checkflag $0005
	iftrue UnknownScript_0x62f88
	clearevent $06e5
	setevent $06e6
	return
; 0x62f88

UnknownScript_0x62f88: ; 0x62f88
	setevent $06e5
	clearevent $06e6
	return
; 0x62f8f

GrampsScript_0x62f8f: ; 0x62f8f
	faceplayer
	loadfont
	checkevent EVENT_GOT_ODD_EGG
	iftrue UnknownScript_0x62fbd
	2writetext UnknownText_0x630ce
	keeptextopen
	loadmovesprites
	checkcode $1
	if_equal $6, UnknownScript_0x62fb6
	special $007d
	loadfont
	2writetext UnknownText_0x631ae
	playsound $0091
	waitbutton
	2writetext UnknownText_0x631c3
	closetext
	loadmovesprites
	setevent EVENT_GOT_ODD_EGG
	end
; 0x62fb6

UnknownScript_0x62fb6: ; 0x62fb6
	loadfont
	2writetext UnknownText_0x63237
	closetext
	loadmovesprites
	end
; 0x62fbd

UnknownScript_0x62fbd: ; 0x62fbd
	special $001e
	closetext
	loadmovesprites
	end
; 0x62fc3

GrannyScript_0x62fc3: ; 0x62fc3
	faceplayer
	loadfont
	checkflag $0005
	iftrue UnknownScript_0x62fd1
	special $001f
	closetext
	loadmovesprites
	end
; 0x62fd1

UnknownScript_0x62fd1: ; 0x62fd1
	2writetext UnknownText_0x62fda
	closetext
	loadmovesprites
	end
; 0x62fd7

MapDayCareSignpost1Script: ; 0x62fd7
	jumpstd $0001
; 0x62fda

UnknownText_0x62fda: ; 0x62fda
	db $0, "Gramps was looking", $4f
	db "for you.", $57
; 0x62ff7

UnknownText_0x62ff7: ; 0x62ff7
	db $0, "I'm the DAY-CARE", $4f
	db "MAN.", $51
	db "There's something", $4f
	db "new in GOLDENROD", $51
	db "called the TRADE", $4f
	db "CORNER.", $51
	db "I was given an EGG", $4f
	db "TICKET that can be", $51
	db "traded in for a", $4f
	db "ODD EGG.", $51
	db "But since we run a", $4f
	db "DAY-CARE, we don't", $51
	db "need it. You may", $4f
	db "as well have it.", $57
; 0x630ce

UnknownText_0x630ce: ; 0x630ce
	db $0, "I'm the DAY-CARE", $4f
	db "MAN.", $51
	db "Do you know about", $4f
	db "EGGS?", $51
	db "I was raising", $4f
	db "#MON with my", $55
	db "wife, you see.", $51
	db "We were shocked to", $4f
	db "find an EGG!", $51
	db "How incredible is", $4f
	db "that?", $51
	db "Well, wouldn't you", $4f
	db "like this EGG?", $51
	db "Then fine, this is", $4f
	db "yours to keep!", $57
; 0x631a1

UnknownText_0x631a1: ; 0x631a1
	db $0, "Come again.", $57
; 0x631ae

UnknownText_0x631ae: ; 0x631ae
	db $0, $52, " received", $4f
	db "ODD EGG!", $57
; 0x631c3

UnknownText_0x631c3: ; 0x631c3
	db $0, "I found that when", $4f
	db "I was caring for", $51
	db "someone's #MON", $4f
	db "before.", $51
	db "But the trainer", $4f
	db "didn't want the", $51
	db "EGG, so I'd kept", $4f
	db "it around.", $57
; 0x63237

UnknownText_0x63237: ; 0x63237
	db $0, "You've no room for", $4f
	db "this.", $57
; 0x63250

DayCare_MapEventHeader: ; 0x63250
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $5, $0, 3, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $6, $0, 4, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $7, $2, 5, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $7, $3, 5, GROUP_ROUTE_34, MAP_ROUTE_34

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapDayCareSignpost1Script
	signpost 1, 1, $0, MapDayCareSignpost1Script

	; people-events
	db 2
	person_event SPRITE_GRAMPS, 7, 6, $9, $0, 255, 255, $0, 0, GrampsScript_0x62f8f, $06e5
	person_event SPRITE_GRANNY, 7, 9, $8, $0, 255, 255, $80, 0, GrannyScript_0x62fc3, $ffff
; 0x6328e


