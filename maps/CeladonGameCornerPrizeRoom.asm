CeladonGameCornerPrizeRoom_MapScriptHeader: ; 0x726e7
	; trigger count
	db 0

	; callback count
	db 0
; 0x726e9

GentlemanScript_0x726e9: ; 0x726e9
	jumptextfaceplayer UnknownText_0x728b8
; 0x726ec

PharmacistScript_0x726ec: ; 0x726ec
	jumptextfaceplayer UnknownText_0x728e9
; 0x726ef

MapCeladonGameCornerPrizeRoomSignpost0Script: ; 0x726ef
	faceplayer
	loadfont
	writetext UnknownText_0x7293e
	closetext
	checkitem COIN_CASE
	iffalse UnknownScript_0x7278a
	writetext UnknownText_0x72974
UnknownScript_0x726fd: ; 0x726fd
	special Function24b25
	loadmenudata MenuDataHeader_0x72790
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x72714
	if_equal $2, UnknownScript_0x72730
	if_equal $3, UnknownScript_0x7274c
	jump UnknownScript_0x72784
; 0x72714

UnknownScript_0x72714: ; 0x72714
	checkcoins 1500
	if_equal $2, UnknownScript_0x72778
	itemtotext TM_DOUBLE_TEAM, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem TM_DOUBLE_TEAM, $1
	iffalse UnknownScript_0x7277e
	takecoins 1500
	jump UnknownScript_0x7276d
; 0x72730

UnknownScript_0x72730: ; 0x72730
	checkcoins 3500
	if_equal $2, UnknownScript_0x72778
	itemtotext TM_PSYCHIC, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem TM_PSYCHIC, $1
	iffalse UnknownScript_0x7277e
	takecoins 3500
	jump UnknownScript_0x7276d
; 0x7274c

UnknownScript_0x7274c: ; 0x7274c
	checkcoins 7500
	if_equal $2, UnknownScript_0x72778
	itemtotext TM_HYPER_BEAM, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem TM_HYPER_BEAM, $1
	iffalse UnknownScript_0x7277e
	takecoins 7500
	jump UnknownScript_0x7276d
; 0x72768

UnknownScript_0x72768: ; 0x72768
	writetext UnknownText_0x72991
	yesorno
	end
; 0x7276d

UnknownScript_0x7276d: ; 0x7276d
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	closetext
	jump UnknownScript_0x726fd
; 0x72778

UnknownScript_0x72778: ; 0x72778
	writetext UnknownText_0x729bb
	closetext
	loadmovesprites
	end
; 0x7277e

UnknownScript_0x7277e: ; 0x7277e
	writetext UnknownText_0x729d8
	closetext
	loadmovesprites
	end
; 0x72784

UnknownScript_0x72784: ; 0x72784
	writetext UnknownText_0x729f2
	closetext
	loadmovesprites
	end
; 0x7278a

UnknownScript_0x7278a: ; 0x7278a
	writetext UnknownText_0x72a14
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
	writetext UnknownText_0x7293e
	closetext
	checkitem COIN_CASE
	iffalse UnknownScript_0x7278a
UnknownScript_0x727d3: ; 0x727d3
	writetext UnknownText_0x72974
	special Function24b25
	loadmenudata MenuDataHeader_0x72877
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x727ed
	if_equal $2, UnknownScript_0x7281b
	if_equal $3, UnknownScript_0x72849
	jump UnknownScript_0x72784
; 0x727ed

UnknownScript_0x727ed: ; 0x727ed
	checkcoins 2222
	if_equal $2, UnknownScript_0x72778
	checkcode $1
	if_equal $6, UnknownScript_0x7277e
	pokenamemem PIKACHU, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	closetext
	writebyte PIKACHU
	special Functionc230
	givepoke PIKACHU, 25, 0, 0
	takecoins 2222
	jump UnknownScript_0x727d3
; 0x7281b

UnknownScript_0x7281b: ; 0x7281b
	checkcoins 5555
	if_equal $2, UnknownScript_0x72778
	checkcode $1
	if_equal $6, UnknownScript_0x7277e
	pokenamemem PORYGON, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	closetext
	writebyte PORYGON
	special Functionc230
	givepoke PORYGON, 15, 0, 0
	takecoins 5555
	jump UnknownScript_0x727d3
; 0x72849

UnknownScript_0x72849: ; 0x72849
	checkcoins 8888
	if_equal $2, UnknownScript_0x72778
	checkcode $1
	if_equal $6, UnknownScript_0x7277e
	pokenamemem LARVITAR, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	closetext
	writebyte LARVITAR
	special Functionc230
	givepoke LARVITAR, 40, 0, 0
	takecoins 8888
	jump UnknownScript_0x727d3
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
	text "I wanted PORYGON,"
	line "but I was short by"
	cont "100 coins…"
	done
; 0x728e9

UnknownText_0x728e9: ; 0x728e9
	text "Whew…"

	para "I've got to stay"
	line "calm and cool…"

	para "I can't lose my"
	line "cool, or I'll lose"
	cont "all my money…"
	done
; 0x7293e

UnknownText_0x7293e: ; 0x7293e
	text "Welcome!"

	para "We exchange your"
	line "coins for fabulous"
	cont "prizes!"
	done
; 0x72974

UnknownText_0x72974: ; 0x72974
	text "Which prize would"
	line "you like?"
	done
; 0x72991

UnknownText_0x72991: ; 0x72991
	text "OK, so you wanted"
	line "a @"
	text_from_ram StringBuffer3
	text "?"
	done
; 0x729ad

UnknownText_0x729ad: ; 0x729ad
	text "Here you go!"
	done
; 0x729bb

UnknownText_0x729bb: ; 0x729bb
	text "You don't have"
	line "enough coins."
	done
; 0x729d8

UnknownText_0x729d8: ; 0x729d8
	text "You have no room"
	line "for it."
	done
; 0x729f2

UnknownText_0x729f2: ; 0x729f2
	text "Oh. Please come"
	line "back with coins!"
	done
; 0x72a14

UnknownText_0x72a14: ; 0x72a14
	text "Oh? You don't have"
	line "a COIN CASE."
	done
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
	person_event SPRITE_GENTLEMAN, 6, 4, $6, $0, 255, 255, $80, 0, GentlemanScript_0x726e9, $ffff
	person_event SPRITE_PHARMACIST, 8, 8, $4, $10, 255, 255, $a0, 0, PharmacistScript_0x726ec, $ffff
; 0x72a68
