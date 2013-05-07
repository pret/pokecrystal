CeladonGameCornerPrizeRoom_MapScriptHeader: ; 0x726e7
	; trigger count
	db 0

	; callback count
	db 0
; 0x726e9

UnknownScript_0x726e9: ; 0x726e9
	jumptextfaceplayer UnknownText_0x728b8
; 0x726ec

UnknownScript_0x726ec: ; 0x726ec
	jumptextfaceplayer UnknownText_0x728e9
; 0x726ef

MapCeladonGameCornerPrizeRoomSignpost0Script: ; 0x726ef
	faceplayer
	loadfont
	2writetext UnknownText_0x7293e
	closetext
	checkitem COIN_CASE
	iffalse UnknownScript_0x7278a
	2writetext UnknownText_0x72974
UnknownScript_0x726fd: ; 0x726fd
	special $004f
	loadmenudata MenuDataHeader_0x72790
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x72714
	if_equal $2, UnknownScript_0x72730
	if_equal $3, UnknownScript_0x7274c
	2jump UnknownScript_0x72784
; 0x72714

UnknownScript_0x72714: ; 0x72714
	checkcoins 1500
	if_equal $2, UnknownScript_0x72778
	itemtotext TM_32, $0
	2call UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem TM_32, $1
	iffalse UnknownScript_0x7277e
	takecoins 1500
	2jump UnknownScript_0x7276d
; 0x72730

UnknownScript_0x72730: ; 0x72730
	checkcoins 3500
	if_equal $2, UnknownScript_0x72778
	itemtotext TM_29, $0
	2call UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem TM_29, $1
	iffalse UnknownScript_0x7277e
	takecoins 3500
	2jump UnknownScript_0x7276d
; 0x7274c

UnknownScript_0x7274c: ; 0x7274c
	checkcoins 7500
	if_equal $2, UnknownScript_0x72778
	itemtotext TM_15, $0
	2call UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem TM_15, $1
	iffalse UnknownScript_0x7277e
	takecoins 7500
	2jump UnknownScript_0x7276d
; 0x72768

UnknownScript_0x72768: ; 0x72768
	2writetext UnknownText_0x72991
	yesorno
	end
; 0x7276d

UnknownScript_0x7276d: ; 0x7276d
	waitbutton
	playsound $0022
	2writetext UnknownText_0x729ad
	closetext
	2jump UnknownScript_0x726fd
; 0x72778

UnknownScript_0x72778: ; 0x72778
	2writetext UnknownText_0x729bb
	closetext
	loadmovesprites
	end
; 0x7277e

UnknownScript_0x7277e: ; 0x7277e
	2writetext UnknownText_0x729d8
	closetext
	loadmovesprites
	end
; 0x72784

UnknownScript_0x72784: ; 0x72784
	2writetext UnknownText_0x729f2
	closetext
	loadmovesprites
	end
; 0x7278a

UnknownScript_0x7278a: ; 0x7278a
	2writetext UnknownText_0x72a14
	closetext
	loadmovesprites
	end
; 0x72790


MenuDataHeader_0x72790: ; 0x72790
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw MenuData2_0x72798
	db 1 ; default option
; 0x72798

MenuData2_0x72798: ; 0x72798
	db $80 ; flags
	db 4 ; items
	db "TM32    1500@"
	db "TM29    3500@"
	db "TM15    7500@"
	db "CANCEL@"
; 0x727c8


MapCeladonGameCornerPrizeRoomSignpost1Script: ; 0x727c8
	faceplayer
	loadfont
	2writetext UnknownText_0x7293e
	closetext
	checkitem COIN_CASE
	iffalse UnknownScript_0x7278a
UnknownScript_0x727d3: ; 0x727d3
	2writetext UnknownText_0x72974
	special $004f
	loadmenudata MenuDataHeader_0x72877
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x727ed
	if_equal $2, UnknownScript_0x7281b
	if_equal $3, UnknownScript_0x72849
	2jump UnknownScript_0x72784
; 0x727ed

UnknownScript_0x727ed: ; 0x727ed
	checkcoins 2222
	if_equal $2, UnknownScript_0x72778
	checkcode $1
	if_equal $6, UnknownScript_0x7277e
	pokenamemem PIKACHU, $0
	2call UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	waitbutton
	playsound $0022
	2writetext UnknownText_0x729ad
	closetext
	writebyte PIKACHU
	special $0039
	givepoke PIKACHU, 25, 0, 0
	takecoins 2222
	2jump UnknownScript_0x727d3
; 0x7281b

UnknownScript_0x7281b: ; 0x7281b
	checkcoins 5555
	if_equal $2, UnknownScript_0x72778
	checkcode $1
	if_equal $6, UnknownScript_0x7277e
	pokenamemem PORYGON, $0
	2call UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	waitbutton
	playsound $0022
	2writetext UnknownText_0x729ad
	closetext
	writebyte PORYGON
	special $0039
	givepoke PORYGON, 15, 0, 0
	takecoins 5555
	2jump UnknownScript_0x727d3
; 0x72849

UnknownScript_0x72849: ; 0x72849
	checkcoins 8888
	if_equal $2, UnknownScript_0x72778
	checkcode $1
	if_equal $6, UnknownScript_0x7277e
	pokenamemem LARVITAR, $0
	2call UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	waitbutton
	playsound $0022
	2writetext UnknownText_0x729ad
	closetext
	writebyte LARVITAR
	special $0039
	givepoke LARVITAR, 40, 0, 0
	takecoins 8888
	2jump UnknownScript_0x727d3
; 0x72877


MenuDataHeader_0x72877: ; 0x72877
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 17 ; end coords
	dw MenuData2_0x7287f
	db 1 ; default option
; 0x7287f

MenuData2_0x7287f: ; 0x7287f
	db $80 ; flags
	db 4 ; items
	db "PIKACHU    2222@"
	db "PORYGON    5555@"
	db "LARVITAR   8888@"
	db "CANCEL@"
; 0x728b8


UnknownText_0x728b8: ; 0x728b8
	db $0, "I wanted PORYGON,", $4f
	db "but I was short by", $55
	db "100 coins…", $57
; 0x728e9

UnknownText_0x728e9: ; 0x728e9
	db $0, "Whew…", $51
	db "I've got to stay", $4f
	db "calm and cool…", $51
	db "I can't lose my", $4f
	db "cool, or I'll lose", $55
	db "all my money…", $57
; 0x7293e

UnknownText_0x7293e: ; 0x7293e
	db $0, "Welcome!", $51
	db "We exchange your", $4f
	db "coins for fabulous", $55
	db "prizes!", $57
; 0x72974

UnknownText_0x72974: ; 0x72974
	db $0, "Which prize would", $4f
	db "you like?", $57
; 0x72991

UnknownText_0x72991: ; 0x72991
	db $0, "OK, so you wanted", $4f
	db "a @"
	text_from_ram $d099
	db $0, "?", $57
; 0x729ad

UnknownText_0x729ad: ; 0x729ad
	db $0, "Here you go!", $57
; 0x729bb

UnknownText_0x729bb: ; 0x729bb
	db $0, "You don't have", $4f
	db "enough coins.", $57
; 0x729d8

UnknownText_0x729d8: ; 0x729d8
	db $0, "You have no room", $4f
	db "for it.", $57
; 0x729f2

UnknownText_0x729f2: ; 0x729f2
	db $0, "Oh. Please come", $4f
	db "back with coins!", $57
; 0x72a14

UnknownText_0x72a14: ; 0x72a14
	db $0, "Oh? You don't have", $4f
	db "a COIN CASE.", $57
; 0x72a34

CeladonGameCornerPrizeRoom_MapEventHeader: ; 0x72a34
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $5, $2, 7, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $5, $3, 7, GROUP_CELADON_CITY, MAP_CELADON_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 2, $0, MapCeladonGameCornerPrizeRoomSignpost0Script
	signpost 1, 4, $0, MapCeladonGameCornerPrizeRoomSignpost1Script

	; people-events
	db 2
	person_event $40, 6, 4, $6, $0, 255, 255, $80, 0, UnknownScript_0x726e9, $ffff
	person_event $4b, 8, 8, $4, $10, 255, 255, $a0, 0, UnknownScript_0x726ec, $ffff
; 0x72a68

