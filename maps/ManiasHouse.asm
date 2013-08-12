ManiasHouse_MapScriptHeader: ; 0x9d276
	; trigger count
	db 0

	; callback count
	db 0
; 0x9d278

RockerScript_0x9d278: ; 0x9d278
	faceplayer
	loadfont
	checkbit1 $0046
	iftrue UnknownScript_0x9d2fa
	checkbit1 $0045
	iftrue UnknownScript_0x9d2a4
	2writetext UnknownText_0x9d303
	yesorno
	iffalse UnknownScript_0x9d2b6
	special SPECIAL_GIVESHUCKLE
	iffalse UnknownScript_0x9d2b0
	2writetext UnknownText_0x9d3ed
	keeptextopen
	waitbutton
	2writetext UnknownText_0x9d41b
	playsound $0091
	waitbutton
	loadmovesprites
	setbit1 $0045
	end
; 0x9d2a4

UnknownScript_0x9d2a4: ; 0x9d2a4
	checkbit2 $0055
	iffalse UnknownScript_0x9d2bc
	2writetext UnknownText_0x9d3ed
	closetext
	loadmovesprites
	end
; 0x9d2b0

UnknownScript_0x9d2b0: ; 0x9d2b0
	2writetext UnknownText_0x9d42f
	closetext
	loadmovesprites
	end
; 0x9d2b6

UnknownScript_0x9d2b6: ; 0x9d2b6
	2writetext UnknownText_0x9d449
	closetext
	loadmovesprites
	end
; 0x9d2bc

UnknownScript_0x9d2bc: ; 0x9d2bc
	2writetext UnknownText_0x9d470
	yesorno
	iffalse UnknownScript_0x9d2ee
	special $004c
	if_equal $0, UnknownScript_0x9d2df
	if_equal $1, UnknownScript_0x9d2ee
	if_equal $3, UnknownScript_0x9d2e5
	if_equal $4, UnknownScript_0x9d2fa
	2writetext UnknownText_0x9d4b1
	closetext
	loadmovesprites
	setbit1 $0046
	end
; 0x9d2df

UnknownScript_0x9d2df: ; 0x9d2df
	2writetext UnknownText_0x9d4bd
	closetext
	loadmovesprites
	end
; 0x9d2e5

UnknownScript_0x9d2e5: ; 0x9d2e5
	2writetext UnknownText_0x9d4e3
	closetext
	loadmovesprites
	setbit1 $0046
	end
; 0x9d2ee

UnknownScript_0x9d2ee: ; 0x9d2ee
	2writetext UnknownText_0x9d53f
	closetext
	loadmovesprites
	end
; 0x9d2f4

UnknownScript_0x9d2f4: ; 0x9d2f4
	2writetext UnknownText_0x9d5b0
	closetext
	loadmovesprites
	end
; 0x9d2fa

UnknownScript_0x9d2fa: ; 0x9d2fa
	2writetext UnknownText_0x9d56c
	closetext
	loadmovesprites
	end
; 0x9d300

UnknownScript_0x9d300: ; 0x9d300
	jumpstd $0002
; 0x9d303

UnknownText_0x9d303: ; 0x9d303
	db $0, "I, I'm in shock!", $51
	db "A guy about your", $4f
	db "age with piercing", $51
	db "eyes and long hair", $4f
	db "came in.", $51
	db "He scared me into", $4f
	db "giving him my", $55
	db "prized #MON!", $51
	db "I still have one", $4f
	db "left, but what if", $55
	db "he comes back?", $51
	db "You look strong.", $4f
	db "Could you look", $51
	db "after my #MON", $4f
	db "for a while?", $57
; 0x9d3ed

UnknownText_0x9d3ed: ; 0x9d3ed
	db $0, "Oh, thank you!", $51
	db "Take good care of", $4f
	db "it, please!", $57
; 0x9d41b

UnknownText_0x9d41b: ; 0x9d41b
	db $0, $52, " received a", $4f
	db "#MON.", $57
; 0x9d42f

UnknownText_0x9d42f: ; 0x9d42f
	db $0, "Your #MON party", $4f
	db "is full.", $57
; 0x9d449

UnknownText_0x9d449: ; 0x9d449
	db $0, "Oh, no… What'll", $4f
	db "I do if he comes", $55
	db "back?", $57
; 0x9d470

UnknownText_0x9d470: ; 0x9d470
	db $0, "Hi! How's my #-", $4f
	db "MON?", $51
	db "I think I'm safe", $4f
	db "now, so may I have", $55
	db "it back?", $57
; 0x9d4b1

UnknownText_0x9d4b1: ; 0x9d4b1
	db $0, "Thank you!", $57
; 0x9d4bd

UnknownText_0x9d4bd: ; 0x9d4bd
	db $0, "Hey, you don't", $4f
	db "have my #MON", $55
	db "with you.", $57
; 0x9d4e3

UnknownText_0x9d4e3: ; 0x9d4e3
	db $0, "My #MON has", $4f
	db "come to like you.", $51
	db "All right, you", $4f
	db "should keep it.", $51
	db "But promise to", $4f
	db "be good to it!", $57
; 0x9d53f

UnknownText_0x9d53f: ; 0x9d53f
	db $0, "Oh, no, no… That's", $4f
	db "the same as being", $55
	db "robbed.", $57
; 0x9d56c

UnknownText_0x9d56c: ; 0x9d56c
	db $0, "For #MON, hap-", $4f
	db "piness is being", $51
	db "with a person who", $4f
	db "treats them well.", $57
; 0x9d5b0

UnknownText_0x9d5b0: ; 0x9d5b0
	db $0, "If I take my #-", $4f
	db "MON back, what are", $51
	db "you going to use", $4f
	db "in battle?", $57
; 0x9d5f0

ManiasHouse_MapEventHeader: ; 0x9d5f0
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 1, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_ROCKER, 8, 6, $3, $0, 255, 255, $0, 0, RockerScript_0x9d278, $ffff
; 0x9d60d

