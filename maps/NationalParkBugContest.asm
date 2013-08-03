NationalParkBugContest_MapScriptHeader: ; 0x5c8ea
	; trigger count
	db 0

	; callback count
	db 0
; 0x5c8ec

YoungsterScript_0x5c8ec: ; 0x5c8ec
	faceplayer
	loadfont
	2writetext UnknownText_0x5c94c
	closetext
	loadmovesprites
	end
; 0x5c8f4

YoungsterScript_0x5c8f4: ; 0x5c8f4
	faceplayer
	loadfont
	2writetext UnknownText_0x5c973
	closetext
	loadmovesprites
	end
; 0x5c8fc

RockerScript_0x5c8fc: ; 0x5c8fc
	faceplayer
	loadfont
	2writetext UnknownText_0x5c9a3
	closetext
	loadmovesprites
	end
; 0x5c904

PokefanMScript_0x5c904: ; 0x5c904
	faceplayer
	loadfont
	2writetext UnknownText_0x5c9cc
	closetext
	loadmovesprites
	end
; 0x5c90c

YoungsterScript_0x5c90c: ; 0x5c90c
	faceplayer
	loadfont
	2writetext UnknownText_0x5ca15
	closetext
	loadmovesprites
	end
; 0x5c914

YoungsterScript_0x5c914: ; 0x5c914
	faceplayer
	loadfont
	2writetext UnknownText_0x5ca52
	closetext
	loadmovesprites
	end
; 0x5c91c

LassScript_0x5c91c: ; 0x5c91c
	faceplayer
	loadfont
	2writetext UnknownText_0x5ca8f
	closetext
	loadmovesprites
	end
; 0x5c924

YoungsterScript_0x5c924: ; 0x5c924
	faceplayer
	loadfont
	2writetext UnknownText_0x5cac8
	closetext
	loadmovesprites
	end
; 0x5c92c

YoungsterScript_0x5c92c: ; 0x5c92c
	faceplayer
	loadfont
	2writetext UnknownText_0x5cb25
	closetext
	loadmovesprites
	end
; 0x5c934

YoungsterScript_0x5c934: ; 0x5c934
	faceplayer
	loadfont
	2writetext UnknownText_0x5cb64
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
	db $0, "DON: I'm going to", $4f
	db "win! Don't bother", $55
	db "me.", $57
; 0x5c973

UnknownText_0x5c973: ; 0x5c973
	db $0, "ED: My PARASECT", $4f
	db "puts #MON to", $55
	db "sleep with SPORE.", $57
; 0x5c9a3

UnknownText_0x5c9a3: ; 0x5c9a3
	db $0, "NICK: I'm raising", $4f
	db "fast #MON for", $55
	db "battles.", $57
; 0x5c9cc

UnknownText_0x5c9cc: ; 0x5c9cc
	db $0, "WILLIAM: I'm not", $4f
	db "concerned about", $55
	db "winning.", $51
	db "I'm just looking", $4f
	db "for rare #MON.", $57
; 0x5ca15

UnknownText_0x5ca15: ; 0x5ca15
	db $0, "BENNY: Ssh! You'll", $4f
	db "scare off SCYTHER.", $51
	db "I'll talk to you", $4f
	db "later.", $57
; 0x5ca52

UnknownText_0x5ca52: ; 0x5ca52
	db $0, "BARRY: You should", $4f
	db "weaken bug #MON", $51
	db "first, then throw", $4f
	db "a BALL.", $57
; 0x5ca8f

UnknownText_0x5ca8f: ; 0x5ca8f
	db $0, "CINDY: I love bug", $4f
	db "#MON.", $51
	db "I guess you must", $4f
	db "like them too.", $57
; 0x5cac8

UnknownText_0x5cac8: ; 0x5cac8
	db $0, "JOSH: I've been", $4f
	db "collecting bug", $51
	db "#MON since I", $4f
	db "was just a baby.", $51
	db "There's no way I'm", $4f
	db "going to lose!", $57
; 0x5cb25

UnknownText_0x5cb25: ; 0x5cb25
	db $0, "SAMUEL: If you've", $4f
	db "got the time to", $51
	db "chat, go find some", $4f
	db "bug #MON.", $57
; 0x5cb64

UnknownText_0x5cb64: ; 0x5cb64
	db $0, "KIPP: I've studied", $4f
	db "about bug #MON", $55
	db "a lot.", $51
	db "I'm going to win", $4f
	db "for sure.", $57
; 0x5cba7

UnknownText_0x5cba7: ; 0x5cba7
	db $0, "RELAXATION SQUARE", $4f
	db "NATIONAL PARK", $57
; 0x5cbc8

UnknownText_0x5cbc8: ; 0x5cbc8
	db $0, "What is this", $4f
	db "notice?", $51
	db "Please battle only", $4f
	db "in the grass.", $51
	db "NATIONAL PARK", $4f
	db "WARDEN'S OFFICE", $57
; 0x5cc1d

UnknownText_0x5cc1d: ; 0x5cc1d
	db $0, "TRAINER TIPS", $51
	db "Print out MAIL by", $4f
	db "opening it then", $55
	db "pressing START.", $57
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

