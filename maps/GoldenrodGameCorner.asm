GoldenrodGameCorner_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, UnknownScript_0x56bf9

UnknownScript_0x56bf9:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse UnknownScript_0x56c19
	checkitem COIN_CASE
	iffalse UnknownScript_0x56c0e
	checkcode VAR_WEEKDAY
	if_equal WEDNESDAY, UnknownScript_0x56c11
	if_equal SATURDAY, UnknownScript_0x56c11
UnknownScript_0x56c0e:
	appear $d
	return

UnknownScript_0x56c11:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue UnknownScript_0x56c19
	disappear $d
UnknownScript_0x56c19: ;0x56c19
	return

PokefanMScript_0x56c1a:
	faceplayer
	loadfont
	writetext UnknownText_0x5718a
	closetext
	loadmovesprites
	spriteface $d, RIGHT
	end

ClerkScript_0x56c25:
	jumpstd gamecornercoinvendor

ReceptionistScript_0x56c28:
	faceplayer
	loadfont
	writetext UnknownText_0x56e50
	closetext
	checkitem COIN_CASE
	iffalse UnknownScript_0x56cc3
	writetext UnknownText_0x56e8b
UnknownScript_0x56c36: ; 056c36
	special Function24b25
	loadmenudata MenuDataHeader_0x56cc9
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x56c4d
	if_equal $2, UnknownScript_0x56c69
	if_equal $3, UnknownScript_0x56c85
	jump UnknownScript_0x56cbd

UnknownScript_0x56c4d:
	checkcoins 5500
	if_equal $2, UnknownScript_0x56cb1
	itemtotext TM_THUNDER, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	giveitem TM_THUNDER, $1
	iffalse UnknownScript_0x56cb7
	takecoins 5500
	jump UnknownScript_0x56ca6

UnknownScript_0x56c69:
	checkcoins 5500
	if_equal $2, UnknownScript_0x56cb1
	itemtotext TM_BLIZZARD, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	giveitem TM_BLIZZARD, $1
	iffalse UnknownScript_0x56cb7
	takecoins 5500
	jump UnknownScript_0x56ca6

UnknownScript_0x56c85:
	checkcoins 5500
	if_equal $2, UnknownScript_0x56cb1
	itemtotext TM_FIRE_BLAST, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	giveitem TM_FIRE_BLAST, $1
	iffalse UnknownScript_0x56cb7
	takecoins 5500
	jump UnknownScript_0x56ca6

UnknownScript_0x56ca1:
	writetext UnknownText_0x56ea8
	yesorno
	end

UnknownScript_0x56ca6:
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	closetext
	jump UnknownScript_0x56c36

UnknownScript_0x56cb1:
	writetext UnknownText_0x56ecb
	closetext
	loadmovesprites
	end

UnknownScript_0x56cb7:
	writetext UnknownText_0x56ee8
	closetext
	loadmovesprites
	end

UnknownScript_0x56cbd:
	writetext UnknownText_0x56f09
	closetext
	loadmovesprites
	end

UnknownScript_0x56cc3:
	writetext UnknownText_0x56f35
	closetext
	loadmovesprites
	end


MenuDataHeader_0x56cc9:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw MenuData2_0x56cd1
	db 1 ; default option

MenuData2_0x56cd1:
	db $80 ; flags
	db 4 ; items
	db "TM25    5500@"
	db "TM14    5500@"
	db "TM38    5500@"
	db "CANCEL@"


ReceptionistScript_0x56d01:
	faceplayer
	loadfont
	writetext UnknownText_0x56e50
	closetext
	checkitem COIN_CASE
	iffalse UnknownScript_0x56cc3
UnknownScript_0x56d0c:
	writetext UnknownText_0x56e8b
	special Function24b25
	loadmenudata MenuDataHeader_0x56db0
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x56d26
	if_equal $2, UnknownScript_0x56d54
	if_equal $3, UnknownScript_0x56d82
	jump UnknownScript_0x56cbd

UnknownScript_0x56d26:
	checkcoins 100
	if_equal $2, UnknownScript_0x56cb1
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x56cb7
	pokenamemem ABRA, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	closetext
	writebyte ABRA
	special Special_GameCornerPrizeMonCheckDex
	givepoke ABRA, 5, 0, 0
	takecoins 100
	jump UnknownScript_0x56d0c

UnknownScript_0x56d54:
	checkcoins 800
	if_equal $2, UnknownScript_0x56cb1
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x56cb7
	pokenamemem CUBONE, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	closetext
	writebyte CUBONE
	special Special_GameCornerPrizeMonCheckDex
	givepoke CUBONE, 15, 0, 0
	takecoins 800
	jump UnknownScript_0x56d0c

UnknownScript_0x56d82:
	checkcoins 1500
	if_equal $2, UnknownScript_0x56cb1
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x56cb7
	pokenamemem WOBBUFFET, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	closetext
	writebyte WOBBUFFET
	special Special_GameCornerPrizeMonCheckDex
	givepoke WOBBUFFET, 15, 0, 0
	takecoins 1500
	jump UnknownScript_0x56d0c


MenuDataHeader_0x56db0:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 17 ; end coords
	dw MenuData2_0x56db8
	db 1 ; default option

MenuData2_0x56db8:
	db $80 ; flags
	db 4 ; items
	db "ABRA        100@"
	db "CUBONE      800@"
	db "WOBBUFFET  1500@"
	db "CANCEL@"


PharmacistScript_0x56df1:
	faceplayer
	loadfont
	writetext UnknownText_0x56f55
	closetext
	loadmovesprites
	spriteface $fe, LEFT
	end

PokefanMScript_0x56dfc:
	faceplayer
	loadfont
	writetext UnknownText_0x56f9e
	closetext
	loadmovesprites
	spriteface $7, RIGHT
	end

CooltrainerMScript_0x56e07:
	faceplayer
	loadfont
	writetext UnknownText_0x56ff4
	closetext
	loadmovesprites
	spriteface $8, LEFT
	end

PokefanFScript_0x56e12:
	faceplayer
	loadfont
	writetext UnknownText_0x5702b
	closetext
	loadmovesprites
	spriteface $9, RIGHT
	end

CooltrainerFScript_0x56e1d:
	jumptextfaceplayer UnknownText_0x57097

GentlemanScript_0x56e20:
	faceplayer
	loadfont
	writetext UnknownText_0x570b1
	closetext
	loadmovesprites
	spriteface $b, RIGHT
	end

PokefanMScript_0x56e2b:
	jumptextfaceplayer UnknownText_0x5710d

MapGoldenrodGameCornerSignpost30Script:
	jumptext UnknownText_0x571af

MapGoldenrodGameCornerSignpost17Script:
	random $6
	if_equal $0, MapGoldenrodGameCornerSignpost7Script
	refreshscreen $0
	writebyte $0
	special Special_SlotMachine
	loadmovesprites
	end

MapGoldenrodGameCornerSignpost7Script:
	refreshscreen $0
	writebyte $1
	special Special_SlotMachine
	loadmovesprites
	end

MapGoldenrodGameCornerSignpost29Script:
	refreshscreen $0
	special Special_CardFlip
	loadmovesprites
	end

UnknownText_0x56e50:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

UnknownText_0x56e8b:
	text "Which prize would"
	line "you like?"
	done

UnknownText_0x56ea8:
	text_from_ram StringBuffer3
	text "."
	line "Is that right?"
	done

UnknownText_0x56ebd:
	text "Here you go!"
	done

UnknownText_0x56ecb:
	text "Sorry! You need"
	line "more coins."
	done

UnknownText_0x56ee8:
	text "Sorry. You can't"
	line "carry any more."
	done

UnknownText_0x56f09:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

UnknownText_0x56f35:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

UnknownText_0x56f55:
	text "I always play this"
	line "slot machine. It"

	para "pays out more than"
	line "others, I think."
	done

UnknownText_0x56f9e:
	text "I just love this"
	line "new slot machine."

	para "It's more of a"
	line "challenge than the"
	cont "ones in CELADON."
	done

UnknownText_0x56ff4:
	text "Life is a gamble."
	line "I'm going to flip"
	cont "cards till I drop!"
	done

UnknownText_0x5702b:
	text "Card flip…"

	para "I prefer it over"
	line "the slots because"

	para "it's easier to"
	line "figure the odds."

	para "But the payout is"
	line "much lower."
	done

UnknownText_0x57097:
	text "I won't quit until"
	line "I win!"
	done

UnknownText_0x570b1:
	text "I taught BLIZZARD"
	line "to my #MON."

	para "It was hard to get"
	line "enough coins for"

	para "it, but it was"
	line "worth it."
	done

UnknownText_0x5710d:
	text "I couldn't win at"
	line "the slots, and I"

	para "blew it on card"
	line "flipping…"

	para "I got so furious,"
	line "I tossed out my"

	para "COIN CASE in the"
	line "UNDERGROUND."
	done

UnknownText_0x5718a:
	text "Wahahah! The coins"
	line "keep rolling in!"
	done

UnknownText_0x571af:
	text "Someone left their"
	line "drink."

	para "It smells sweet."
	done

GoldenrodGameCorner_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $d, $2, 10, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $d, $3, 10, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 31
	signpost 6, 6, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 7, 6, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 8, 6, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 9, 6, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 10, 6, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 11, 6, SIGNPOST_RIGHT, MapGoldenrodGameCornerSignpost17Script
	signpost 6, 7, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 7, 7, SIGNPOST_READ, MapGoldenrodGameCornerSignpost7Script
	signpost 8, 7, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 9, 7, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 10, 7, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 11, 7, SIGNPOST_LEFT, MapGoldenrodGameCornerSignpost17Script
	signpost 6, 12, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 7, 12, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 8, 12, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 9, 12, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 10, 12, SIGNPOST_READ, MapGoldenrodGameCornerSignpost17Script
	signpost 11, 12, SIGNPOST_RIGHT, MapGoldenrodGameCornerSignpost17Script
	signpost 6, 13, SIGNPOST_READ, MapGoldenrodGameCornerSignpost29Script
	signpost 7, 13, SIGNPOST_READ, MapGoldenrodGameCornerSignpost29Script
	signpost 8, 13, SIGNPOST_READ, MapGoldenrodGameCornerSignpost29Script
	signpost 9, 13, SIGNPOST_READ, MapGoldenrodGameCornerSignpost29Script
	signpost 10, 13, SIGNPOST_READ, MapGoldenrodGameCornerSignpost29Script
	signpost 11, 13, SIGNPOST_LEFT, MapGoldenrodGameCornerSignpost29Script
	signpost 6, 18, SIGNPOST_READ, MapGoldenrodGameCornerSignpost29Script
	signpost 7, 18, SIGNPOST_READ, MapGoldenrodGameCornerSignpost29Script
	signpost 8, 18, SIGNPOST_READ, MapGoldenrodGameCornerSignpost29Script
	signpost 9, 18, SIGNPOST_READ, MapGoldenrodGameCornerSignpost29Script
	signpost 10, 18, SIGNPOST_READ, MapGoldenrodGameCornerSignpost29Script
	signpost 11, 18, SIGNPOST_RIGHT, MapGoldenrodGameCornerSignpost29Script
	signpost 1, 12, SIGNPOST_LEFT, MapGoldenrodGameCornerSignpost30Script

.PersonEvents:
	db 12
	person_event SPRITE_CLERK, 6, 7, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, ClerkScript_0x56c25, -1
	person_event SPRITE_RECEPTIONIST, 6, 20, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, ReceptionistScript_0x56c28, -1
	person_event SPRITE_RECEPTIONIST, 6, 22, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, ReceptionistScript_0x56d01, -1
	person_event SPRITE_PHARMACIST, 11, 12, OW_LEFT | $0, $0, -1, 2, (PAL_OW_BLUE << 4) | $80, 0, PharmacistScript_0x56df1, -1
	person_event SPRITE_PHARMACIST, 11, 12, OW_LEFT | $0, $0, -1, 4, (PAL_OW_BLUE << 4) | $80, 0, PharmacistScript_0x56df1, -1
	person_event SPRITE_POKEFAN_M, 14, 15, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, PokefanMScript_0x56dfc, -1
	person_event SPRITE_COOLTRAINER_M, 12, 18, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, CooltrainerMScript_0x56e07, -1
	person_event SPRITE_POKEFAN_F, 10, 21, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, PokefanFScript_0x56e12, -1
	person_event SPRITE_COOLTRAINER_F, 7, 14, OW_DOWN | $2, $12, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, CooltrainerFScript_0x56e1d, -1
	person_event SPRITE_GENTLEMAN, 14, 9, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, GentlemanScript_0x56e20, -1
	person_event SPRITE_POKEFAN_M, 13, 6, OW_DOWN | $2, $11, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, PokefanMScript_0x56e2b, -1
	person_event SPRITE_POKEFAN_M, 14, 21, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, PokefanMScript_0x56c1a, EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
