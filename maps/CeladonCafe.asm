CeladonCafe_MapScriptHeader: ; 0x73047
	; trigger count
	db 0

	; callback count
	db 0
; 0x73049

SuperNerdScript_0x73049: ; 0x73049
	faceplayer
	loadfont
	2writetext UnknownText_0x730de
	closetext
	loadmovesprites
	end
; 0x73051

FisherScript_0x73051: ; 0x73051
	loadfont
	2writetext UnknownText_0x73129
	closetext
	loadmovesprites
	faceplayer
	loadfont
	2writetext UnknownText_0x7313a
	closetext
	loadmovesprites
	spriteface $3, $2
	end
; 0x73062

FisherScript_0x73062: ; 0x73062
	loadfont
	2writetext UnknownText_0x7316a
	closetext
	loadmovesprites
	faceplayer
	loadfont
	2writetext UnknownText_0x73178
	closetext
	loadmovesprites
	spriteface $4, $3
	end
; 0x73073

FisherScript_0x73073: ; 0x73073
	loadfont
	2writetext UnknownText_0x731ae
	closetext
	loadmovesprites
	faceplayer
	loadfont
	2writetext UnknownText_0x731bd
	closetext
	loadmovesprites
	spriteface $5, $3
	end
; 0x73084

TeacherScript_0x73084: ; 0x73084
	checkitem COIN_CASE
	iftrue UnknownScript_0x7309a
	loadfont
	2writetext UnknownText_0x73201
	closetext
	loadmovesprites
	faceplayer
	loadfont
	2writetext UnknownText_0x73212
	closetext
	loadmovesprites
	spriteface $6, $2
	end
; 0x7309a

UnknownScript_0x7309a: ; 0x7309a
	loadfont
	2writetext UnknownText_0x73254
	closetext
	loadmovesprites
	spriteface $6, $3
	loadfont
	2writetext UnknownText_0x73278
	closetext
	loadmovesprites
	spriteface $6, $2
	end
; 0x730ad

MapCeladonCafeSignpost0Script: ; 0x730ad
	jumptext UnknownText_0x73285
; 0x730b0

MapCeladonCafeSignpost1Script: ; 0x730b0
	checkbit1 EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	iftrue UnknownScript_0x730db
	giveitem LEFTOVERS, $1
	iffalse UnknownScript_0x730cd
	loadfont
	itemtotext LEFTOVERS, $0
	2writetext UnknownText_0x732e7
	playsound $0001
	waitbutton
	itemnotify
	loadmovesprites
	setbit1 EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	end
; 0x730cd

UnknownScript_0x730cd: ; 0x730cd
	loadfont
	itemtotext LEFTOVERS, $0
	2writetext UnknownText_0x732e7
	keeptextopen
	2writetext UnknownText_0x732f7
	closetext
	loadmovesprites
	end
; 0x730db

UnknownScript_0x730db: ; 0x730db
	jumpstd $000d
; 0x730de

UnknownText_0x730de: ; 0x730de
	db $0, "Hi!", $51
	db "We're holding an", $4f
	db "eatathon contest.", $51
	db "We can't serve you", $4f
	db "right now. Sorry.", $57
; 0x73129

UnknownText_0x73129: ; 0x73129
	db $0, "…Snarfle, chew…", $57
; 0x7313a

UnknownText_0x7313a: ; 0x7313a
	db $0, "Don't talk to me!", $51
	db "You'll break my", $4f
	db "concentration!", $57
; 0x7316a

UnknownText_0x7316a: ; 0x7316a
	db $0, "…Gulp… Chew…", $57
; 0x73178

UnknownText_0x73178: ; 0x73178
	db $0, "I take quantity", $4f
	db "over quality!", $51
	db "I'm happy when I'm", $4f
	db "full!", $57
; 0x731ae

UnknownText_0x731ae: ; 0x731ae
	db $0, "Munch, munch…", $57
; 0x731bd

UnknownText_0x731bd: ; 0x731bd
	db $0, "The food is good", $4f
	db "here, but GOLDEN-", $55
	db "ROD has the best", $55
	db "food anywhere.", $57
; 0x73201

UnknownText_0x73201: ; 0x73201
	db $0, "Crunch… Crunch…", $57
; 0x73212

UnknownText_0x73212: ; 0x73212
	db $0, "Nobody here will", $4f
	db "give you a COIN", $51
	db "CASE. You should", $4f
	db "look in JOHTO.", $57
; 0x73254

UnknownText_0x73254: ; 0x73254
	db $0, "Crunch… Crunch…", $51
	db "I can keep eating!", $57
; 0x73278

UnknownText_0x73278: ; 0x73278
	db $0, "More, CHEF!", $57
; 0x73285

UnknownText_0x73285: ; 0x73285
	db $0, "Eatathon Contest!", $4f
	db "No time limit!", $51
	db "A battle without", $4f
	db "end! The biggest", $51
	db "muncher gets it", $4f
	db "all for free!", $57
; 0x732e7

UnknownText_0x732e7: ; 0x732e7
	db $0, $52, " found", $4f
	db "@"
	text_from_ram $d099
	db $0, "!", $57
; 0x732f7

UnknownText_0x732f7: ; 0x732f7
	db $0, "But ", $52, " can't", $4f
	db "hold another item…", $57
; 0x73316

CeladonCafe_MapEventHeader: ; 0x73316
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $6, 9, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $7, $7, 9, GROUP_CELADON_CITY, MAP_CELADON_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 5, $0, MapCeladonCafeSignpost0Script
	signpost 1, 7, $0, MapCeladonCafeSignpost1Script

	; people-events
	db 5
	person_event SPRITE_SUPER_NERD, 7, 13, $8, $0, 255, 255, $b0, 0, SuperNerdScript_0x73049, $ffff
	person_event SPRITE_FISHER, 10, 8, $8, $0, 255, 255, $0, 0, FisherScript_0x73051, $ffff
	person_event SPRITE_FISHER, 11, 5, $9, $0, 255, 255, $a0, 0, FisherScript_0x73062, $ffff
	person_event SPRITE_FISHER, 6, 5, $9, $0, 255, 255, $0, 0, FisherScript_0x73073, $ffff
	person_event SPRITE_TEACHER, 7, 8, $8, $0, 255, 255, $0, 0, TeacherScript_0x73084, $ffff
; 0x73371

