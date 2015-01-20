NationalParkBugContest_MapScriptHeader: ; 0x5c8ea
	; trigger count
	db 0

	; callback count
	db 0
; 0x5c8ec

YoungsterScript_0x5c8ec: ; 0x5c8ec
	faceplayer
	loadfont
	writetext UnknownText_0x5c94c
	closetext
	loadmovesprites
	end
; 0x5c8f4

YoungsterScript_0x5c8f4: ; 0x5c8f4
	faceplayer
	loadfont
	writetext UnknownText_0x5c973
	closetext
	loadmovesprites
	end
; 0x5c8fc

RockerScript_0x5c8fc: ; 0x5c8fc
	faceplayer
	loadfont
	writetext UnknownText_0x5c9a3
	closetext
	loadmovesprites
	end
; 0x5c904

PokefanMScript_0x5c904: ; 0x5c904
	faceplayer
	loadfont
	writetext UnknownText_0x5c9cc
	closetext
	loadmovesprites
	end
; 0x5c90c

YoungsterScript_0x5c90c: ; 0x5c90c
	faceplayer
	loadfont
	writetext UnknownText_0x5ca15
	closetext
	loadmovesprites
	end
; 0x5c914

YoungsterScript_0x5c914: ; 0x5c914
	faceplayer
	loadfont
	writetext UnknownText_0x5ca52
	closetext
	loadmovesprites
	end
; 0x5c91c

LassScript_0x5c91c: ; 0x5c91c
	faceplayer
	loadfont
	writetext UnknownText_0x5ca8f
	closetext
	loadmovesprites
	end
; 0x5c924

YoungsterScript_0x5c924: ; 0x5c924
	faceplayer
	loadfont
	writetext UnknownText_0x5cac8
	closetext
	loadmovesprites
	end
; 0x5c92c

YoungsterScript_0x5c92c: ; 0x5c92c
	faceplayer
	loadfont
	writetext UnknownText_0x5cb25
	closetext
	loadmovesprites
	end
; 0x5c934

YoungsterScript_0x5c934: ; 0x5c934
	faceplayer
	loadfont
	writetext UnknownText_0x5cb64
	closetext
	loadmovesprites
	end
; 0x5c93c

MapNationalParkBugContestSignpost0Script: ; 0x5c93c
	jumptext UnknownText_0x5cba7
; 0x5c93f

MapNationalParkBugContestSignpost1Script: ; 0x5c93f
	jumptext UnknownText_0x5cbc8
; 0x5c942

MapNationalParkBugContestSignpost3Script: ; 0x5c942
	jumptext UnknownText_0x5cc1d
; 0x5c945

ItemFragment_0x5c945: ; 0x5c945
	db PARLYZ_HEAL, 1
; 0x5c947

ItemFragment_0x5c947: ; 0x5c947
	db TM_28, 1
; 0x5c949

MapNationalParkBugContestSignpostItem2: ; 0x5c949
	dw $0084
	db FULL_HEAL
	
; 0x5c94c

UnknownText_0x5c94c: ; 0x5c94c
	text "DON: I'm going to"
	line "win! Don't bother"
	cont "me."
	done
; 0x5c973

UnknownText_0x5c973: ; 0x5c973
	text "ED: My PARASECT"
	line "puts #MON to"
	cont "sleep with SPORE."
	done
; 0x5c9a3

UnknownText_0x5c9a3: ; 0x5c9a3
	text "NICK: I'm raising"
	line "fast #MON for"
	cont "battles."
	done
; 0x5c9cc

UnknownText_0x5c9cc: ; 0x5c9cc
	text "WILLIAM: I'm not"
	line "concerned about"
	cont "winning."

	para "I'm just looking"
	line "for rare #MON."
	done
; 0x5ca15

UnknownText_0x5ca15: ; 0x5ca15
	text "BENNY: Ssh! You'll"
	line "scare off SCYTHER."

	para "I'll talk to you"
	line "later."
	done
; 0x5ca52

UnknownText_0x5ca52: ; 0x5ca52
	text "BARRY: You should"
	line "weaken bug #MON"

	para "first, then throw"
	line "a BALL."
	done
; 0x5ca8f

UnknownText_0x5ca8f: ; 0x5ca8f
	text "CINDY: I love bug"
	line "#MON."

	para "I guess you must"
	line "like them too."
	done
; 0x5cac8

UnknownText_0x5cac8: ; 0x5cac8
	text "JOSH: I've been"
	line "collecting bug"

	para "#MON since I"
	line "was just a baby."

	para "There's no way I'm"
	line "going to lose!"
	done
; 0x5cb25

UnknownText_0x5cb25: ; 0x5cb25
	text "SAMUEL: If you've"
	line "got the time to"

	para "chat, go find some"
	line "bug #MON."
	done
; 0x5cb64

UnknownText_0x5cb64: ; 0x5cb64
	text "KIPP: I've studied"
	line "about bug #MON"
	cont "a lot."

	para "I'm going to win"
	line "for sure."
	done
; 0x5cba7

UnknownText_0x5cba7: ; 0x5cba7
	text "RELAXATION SQUARE"
	line "NATIONAL PARK"
	done
; 0x5cbc8

UnknownText_0x5cbc8: ; 0x5cbc8
	text "What is this"
	line "notice?"

	para "Please battle only"
	line "in the grass."

	para "NATIONAL PARK"
	line "WARDEN'S OFFICE"
	done
; 0x5cc1d

UnknownText_0x5cc1d: ; 0x5cc1d
	text "TRAINER TIPS"

	para "Print out MAIL by"
	line "opening it then"
	cont "pressing START."
	done
; 0x5cc5d

NationalParkBugContest_MapEventHeader: ; 0x5cc5d
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $12, $21, 1, GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE
	warp_def $13, $21, 1, GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE
	warp_def $2f, $a, 1, GROUP_ROUTE_35_NATIONAL_PARK_GATE, MAP_ROUTE_35_NATIONAL_PARK_GATE
	warp_def $2f, $b, 1, GROUP_ROUTE_35_NATIONAL_PARK_GATE, MAP_ROUTE_35_NATIONAL_PARK_GATE

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 44, 14, $0, MapNationalParkBugContestSignpost0Script
	signpost 31, 27, $0, MapNationalParkBugContestSignpost1Script
	signpost 47, 6, $7, MapNationalParkBugContestSignpostItem2
	signpost 4, 12, $0, MapNationalParkBugContestSignpost3Script

	; people-events
	db 12
	person_event SPRITE_YOUNGSTER, 33, 23, $2, $22, 255, 255, $80, 0, YoungsterScript_0x5c8ec, $0716
	person_event SPRITE_YOUNGSTER, 26, 32, $2, $22, 255, 255, $a0, 0, YoungsterScript_0x5c8f4, $0717
	person_event SPRITE_ROCKER, 22, 13, $7, $0, 255, 255, $90, 0, RockerScript_0x5c8fc, $0718
	person_event SPRITE_POKEFAN_M, 17, 11, $4, $1, 255, 255, $b0, 0, PokefanMScript_0x5c904, $0719
	person_event SPRITE_YOUNGSTER, 13, 27, $3, $0, 255, 255, $80, 0, YoungsterScript_0x5c90c, $071a
	person_event SPRITE_YOUNGSTER, 17, 31, $2, $33, 255, 255, $a0, 0, YoungsterScript_0x5c914, $071b
	person_event SPRITE_LASS, 27, 11, $5, $2, 255, 255, $90, 0, LassScript_0x5c91c, $071c
	person_event SPRITE_YOUNGSTER, 31, 15, $2, $11, 255, 255, $80, 0, YoungsterScript_0x5c924, $071d
	person_event SPRITE_YOUNGSTER, 12, 20, $2, $11, 255, 255, $a0, 0, YoungsterScript_0x5c92c, $071e
	person_event SPRITE_YOUNGSTER, 38, 21, $2, $33, 255, 255, $90, 0, YoungsterScript_0x5c934, $071f
	person_event SPRITE_POKE_BALL, 16, 39, $1, $0, 255, 255, $1, 0, ItemFragment_0x5c945, $0658
	person_event SPRITE_POKE_BALL, 47, 5, $1, $0, 255, 255, $1, 0, ItemFragment_0x5c947, $0659
; 0x5cd27

