CeladonGameCornerPrizeRoom_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GentlemanScript_0x726e9:
	jumptextfaceplayer UnknownText_0x728b8

PharmacistScript_0x726ec:
	jumptextfaceplayer UnknownText_0x728e9

MapCeladonGameCornerPrizeRoomSignpost0Script:
	faceplayer
	loadfont
	writetext UnknownText_0x7293e
	closetext
	checkitem COIN_CASE
	iffalse UnknownScript_0x7278a
	writetext UnknownText_0x72974
UnknownScript_0x726fd:
	special Function24b25
	loadmenudata MenuDataHeader_0x72790
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x72714
	if_equal $2, UnknownScript_0x72730
	if_equal $3, UnknownScript_0x7274c
	jump UnknownScript_0x72784

UnknownScript_0x72714:
	checkcoins 1500
	if_equal $2, UnknownScript_0x72778
	itemtotext TM_DOUBLE_TEAM, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem TM_DOUBLE_TEAM, $1
	iffalse UnknownScript_0x7277e
	takecoins 1500
	jump UnknownScript_0x7276d

UnknownScript_0x72730:
	checkcoins 3500
	if_equal $2, UnknownScript_0x72778
	itemtotext TM_PSYCHIC, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem TM_PSYCHIC, $1
	iffalse UnknownScript_0x7277e
	takecoins 3500
	jump UnknownScript_0x7276d

UnknownScript_0x7274c:
	checkcoins 7500
	if_equal $2, UnknownScript_0x72778
	itemtotext TM_HYPER_BEAM, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	giveitem TM_HYPER_BEAM, $1
	iffalse UnknownScript_0x7277e
	takecoins 7500
	jump UnknownScript_0x7276d

UnknownScript_0x72768:
	writetext UnknownText_0x72991
	yesorno
	end

UnknownScript_0x7276d:
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	closetext
	jump UnknownScript_0x726fd

UnknownScript_0x72778:
	writetext UnknownText_0x729bb
	closetext
	loadmovesprites
	end

UnknownScript_0x7277e:
	writetext UnknownText_0x729d8
	closetext
	loadmovesprites
	end

UnknownScript_0x72784:
	writetext UnknownText_0x729f2
	closetext
	loadmovesprites
	end

UnknownScript_0x7278a:
	writetext UnknownText_0x72a14
	closetext
	loadmovesprites
	end


MenuDataHeader_0x72790:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw MenuData2_0x72798
	db 1 ; default option

MenuData2_0x72798:
	db $80 ; flags
	db 4 ; items
	db "TM32    1500@"
	db "TM29    3500@"
	db "TM15    7500@"
	db "CANCEL@"


MapCeladonGameCornerPrizeRoomSignpost1Script:
	faceplayer
	loadfont
	writetext UnknownText_0x7293e
	closetext
	checkitem COIN_CASE
	iffalse UnknownScript_0x7278a
UnknownScript_0x727d3:
	writetext UnknownText_0x72974
	special Function24b25
	loadmenudata MenuDataHeader_0x72877
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x727ed
	if_equal $2, UnknownScript_0x7281b
	if_equal $3, UnknownScript_0x72849
	jump UnknownScript_0x72784

UnknownScript_0x727ed:
	checkcoins 2222
	if_equal $2, UnknownScript_0x72778
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x7277e
	pokenamemem PIKACHU, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	closetext
	writebyte PIKACHU
	special Special_GameCornerPrizeMonCheckDex
	givepoke PIKACHU, 25, 0, 0
	takecoins 2222
	jump UnknownScript_0x727d3

UnknownScript_0x7281b:
	checkcoins 5555
	if_equal $2, UnknownScript_0x72778
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x7277e
	pokenamemem PORYGON, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	closetext
	writebyte PORYGON
	special Special_GameCornerPrizeMonCheckDex
	givepoke PORYGON, 15, 0, 0
	takecoins 5555
	jump UnknownScript_0x727d3

UnknownScript_0x72849:
	checkcoins 8888
	if_equal $2, UnknownScript_0x72778
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x7277e
	pokenamemem LARVITAR, $0
	scall UnknownScript_0x72768
	iffalse UnknownScript_0x72784
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x729ad
	closetext
	writebyte LARVITAR
	special Special_GameCornerPrizeMonCheckDex
	givepoke LARVITAR, 40, 0, 0
	takecoins 8888
	jump UnknownScript_0x727d3


MenuDataHeader_0x72877:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 17 ; end coords
	dw MenuData2_0x7287f
	db 1 ; default option

MenuData2_0x7287f:
	db $80 ; flags
	db 4 ; items
	db "PIKACHU    2222@"
	db "PORYGON    5555@"
	db "LARVITAR   8888@"
	db "CANCEL@"


UnknownText_0x728b8:
	text "I wanted PORYGON,"
	line "but I was short by"
	cont "100 coins…"
	done

UnknownText_0x728e9:
	text "Whew…"

	para "I've got to stay"
	line "calm and cool…"

	para "I can't lose my"
	line "cool, or I'll lose"
	cont "all my money…"
	done

UnknownText_0x7293e:
	text "Welcome!"

	para "We exchange your"
	line "coins for fabulous"
	cont "prizes!"
	done

UnknownText_0x72974:
	text "Which prize would"
	line "you like?"
	done

UnknownText_0x72991:
	text "OK, so you wanted"
	line "a @"
	text_from_ram StringBuffer3
	text "?"
	done

UnknownText_0x729ad:
	text "Here you go!"
	done

UnknownText_0x729bb:
	text "You don't have"
	line "enough coins."
	done

UnknownText_0x729d8:
	text "You have no room"
	line "for it."
	done

UnknownText_0x729f2:
	text "Oh. Please come"
	line "back with coins!"
	done

UnknownText_0x72a14:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

CeladonGameCornerPrizeRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $5, $2, 7, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $5, $3, 7, GROUP_CELADON_CITY, MAP_CELADON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 2, SIGNPOST_READ, MapCeladonGameCornerPrizeRoomSignpost0Script
	signpost 1, 4, SIGNPOST_READ, MapCeladonGameCornerPrizeRoomSignpost1Script

.PersonEvents:
	db 2
	person_event SPRITE_GENTLEMAN, 6, 4, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, GentlemanScript_0x726e9, -1
	person_event SPRITE_PHARMACIST, 8, 8, OW_UP | $0, $10, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, PharmacistScript_0x726ec, -1
