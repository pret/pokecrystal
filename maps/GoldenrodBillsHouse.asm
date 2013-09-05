GoldenrodBillsHouse_MapScriptHeader: ; 0x54be2
	; trigger count
	db 0

	; callback count
	db 0
; 0x54be4

BillScript_0x54be4: ; 0x54be4
	faceplayer
	loadfont
	checkbit1 EVENT_GOT_EEVEE
	iftrue UnknownScript_0x54c1f
	2writetext UnknownText_0x54c74
	yesorno
	iffalse UnknownScript_0x54c19
	2writetext UnknownText_0x54d3f
	keeptextopen
	waitbutton
	checkcode $1
	if_equal $6, UnknownScript_0x54c13
	2writetext UnknownText_0x54dae
	playsound $0002
	waitbutton
	givepoke EEVEE, 20, 0, 0
	setbit1 EVENT_GOT_EEVEE
	2writetext UnknownText_0x54dc1
	closetext
	loadmovesprites
	end
; 0x54c13

UnknownScript_0x54c13: ; 0x54c13
	2writetext UnknownText_0x54e02
	closetext
	loadmovesprites
	end
; 0x54c19

UnknownScript_0x54c19: ; 0x54c19
	2writetext UnknownText_0x54e2d
	closetext
	loadmovesprites
	end
; 0x54c1f

UnknownScript_0x54c1f: ; 0x54c1f
	2writetext UnknownText_0x54e42
	closetext
	loadmovesprites
	end
; 0x54c25

PokefanFScript_0x54c25: ; 0x54c25
	faceplayer
	loadfont
	checkbit1 $0712
	iffalse UnknownScript_0x54c33
	2writetext UnknownText_0x54ea8
	closetext
	loadmovesprites
	end
; 0x54c33

UnknownScript_0x54c33: ; 0x54c33
	2writetext UnknownText_0x54f4e
	closetext
	loadmovesprites
	end
; 0x54c39

TwinScript_0x54c39: ; 0x54c39
	faceplayer
	loadfont
	checkcellnum $3
	iftrue UnknownScript_0x54c58
	2writetext UnknownText_0x54f9e
	askforphonenumber $3
	if_equal $1, UnknownScript_0x54c64
	if_equal $2, UnknownScript_0x54c5e
	waitbutton
	addcellnum $3
	2writetext UnknownText_0x54fd9
	playsound $0093
	waitbutton
	keeptextopen
UnknownScript_0x54c58: ;0x54c58
	2writetext UnknownText_0x55069
	closetext
	loadmovesprites
	end
; 0x54c5e

UnknownScript_0x54c5e: ; 0x54c5e
	2writetext UnknownText_0x54ff3
	closetext
	loadmovesprites
	end
; 0x54c64

UnknownScript_0x54c64: ; 0x54c64
	2writetext UnknownText_0x55046
	keeptextopen
	2jump UnknownScript_0x54c5e
; 0x54c6b

MapGoldenrodBillsHouseSignpost1Script: ; 0x54c6b
	jumpstd $0002
; 0x54c6e

MapGoldenrodBillsHouseSignpost0Script: ; 0x54c6e
	jumpstd $0003
; 0x54c71

MapGoldenrodBillsHouseSignpost2Script: ; 0x54c71
	jumpstd $000c
; 0x54c74

UnknownText_0x54c74: ; 0x54c74
	db $0, "BILL: Hi, ", $52, "!", $4f
	db "Do us a favor and", $55
	db "take this EEVEE.", $51
	db "It came over when", $4f
	db "I was adjusting", $55
	db "the TIME CAPSULE.", $51
	db "Someone has to", $4f
	db "take care of it,", $51
	db "but I don't like", $4f
	db "being outside.", $51
	db "Can I count on you", $4f
	db "to play with it,", $55
	db $52, "?", $57
; 0x54d3f

UnknownText_0x54d3f: ; 0x54d3f
	db $0, "BILL: I knew you'd", $4f
	db "come through!", $51
	db "Way to go! You're", $4f
	db "the real deal!", $51
	db "OK, I'm counting", $4f
	db "on you.", $51
	db "Take good care of", $4f
	db "it!", $57
; 0x54dae

UnknownText_0x54dae: ; 0x54dae
	db $0, $52, " received", $4f
	db "EEVEE!", $57
; 0x54dc1

UnknownText_0x54dc1: ; 0x54dc1
	db $0, "BILL: PROF.ELM", $4f
	db "claims EEVEE may", $51
	db "evolve in new and", $4f
	db "unknown ways.", $57
; 0x54e02

UnknownText_0x54e02: ; 0x54e02
	db $0, "Whoa, wait. You", $4f
	db "can't carry any", $55
	db "more #MON.", $57
; 0x54e2d

UnknownText_0x54e2d: ; 0x54e2d
	db $0, "Oh… Now what to", $4f
	db "do?", $57
; 0x54e42

UnknownText_0x54e42: ; 0x54e42
	db $0, "BILL: My pop, he", $4f
	db "won't work. All he", $51
	db "does is goof off", $4f
	db "all day long.", $51
	db "He's getting to be", $4f
	db "a real headache…", $57
; 0x54ea8

UnknownText_0x54ea8: ; 0x54ea8
	db $0, "Oh, you collect", $4f
	db "#MON? My son", $55
	db "BILL is an expert.", $51
	db "He just got called", $4f
	db "to the #MON", $51
	db "CENTER in ECRUTEAK", $4f
	db "CITY.", $51
	db "My husband went", $4f
	db "off to the GAME", $51
	db "CORNER without", $4f
	db "being called…", $57
; 0x54f4e

UnknownText_0x54f4e: ; 0x54f4e
	db $0, "My husband was", $4f
	db "once known as a", $51
	db "#MANIAC.", $4f
	db "BILL must have", $51
	db "taken after his", $4f
	db "father.", $57
; 0x54f9e

UnknownText_0x54f9e: ; 0x54f9e
	db $0, "Are you a trainer?", $51
	db "I've got a useful", $4f
	db "phone number for", $55
	db "you.", $57
; 0x54fd9

UnknownText_0x54fd9: ; 0x54fd9
	db $0, $52, " recorded", $4f
	db "BILL's number.", $57
; 0x54ff3

UnknownText_0x54ff3: ; 0x54ff3
	db $0, "My brother made", $4f
	db "the PC #MON", $55
	db "storage system.", $51
	db "I was going to", $4f
	db "give you BILL's", $55
	db "number…", $57
; 0x55046

UnknownText_0x55046: ; 0x55046
	db $0, "You can't record", $4f
	db "any more numbers.", $57
; 0x55069

UnknownText_0x55069: ; 0x55069
	db $0, "My big brother", $4f
	db "BILL made the PC", $51
	db "#MON storage", $4f
	db "system.", $57
; 0x5509f

GoldenrodBillsHouse_MapEventHeader: ; 0x5509f
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 4, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, MapGoldenrodBillsHouseSignpost0Script
	signpost 1, 1, $0, MapGoldenrodBillsHouseSignpost1Script
	signpost 1, 7, $0, MapGoldenrodBillsHouseSignpost2Script

	; people-events
	db 3
	person_event SPRITE_BILL, 7, 6, $9, $0, 255, 255, $0, 0, BillScript_0x54be4, $0712
	person_event SPRITE_POKEFAN_F, 7, 9, $6, $0, 255, 255, $0, 0, PokefanFScript_0x54c25, $ffff
	person_event SPRITE_TWIN, 8, 9, $2, $11, 255, 255, $a0, 0, TwinScript_0x54c39, $ffff
; 0x550e5

