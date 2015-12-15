const_value set 2
	const GOLDENRODGAMECORNER_CLERK
	const GOLDENRODGAMECORNER_RECEPTIONIST1
	const GOLDENRODGAMECORNER_RECEPTIONIST2
	const GOLDENRODGAMECORNER_PHARMACIST1
	const GOLDENRODGAMECORNER_PHARMACIST2
	const GOLDENRODGAMECORNER_POKEFAN_M1
	const GOLDENRODGAMECORNER_COOLTRAINER_M
	const GOLDENRODGAMECORNER_POKEFAN_F
	const GOLDENRODGAMECORNER_COOLTRAINER_F
	const GOLDENRODGAMECORNER_GENTLEMAN
	const GOLDENRODGAMECORNER_POKEFAN_M2
	const GOLDENRODGAMECORNER_POKEFAN_M3

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
	appear GOLDENRODGAMECORNER_POKEFAN_M3
	return

UnknownScript_0x56c11:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue UnknownScript_0x56c19
	disappear GOLDENRODGAMECORNER_POKEFAN_M3
UnknownScript_0x56c19: ;0x56c19
	return

PokefanMScript_0x56c1a:
	faceplayer
	opentext
	writetext UnknownText_0x5718a
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_POKEFAN_M3, RIGHT
	end

ClerkScript_0x56c25:
	jumpstd gamecornercoinvendor

ReceptionistScript_0x56c28:
	faceplayer
	opentext
	writetext UnknownText_0x56e50
	waitbutton
	checkitem COIN_CASE
	iffalse UnknownScript_0x56cc3
	writetext UnknownText_0x56e8b
UnknownScript_0x56c36: ; 056c36
	special Special_DisplayCoinCaseBalance
	loadmenudata MenuDataHeader_0x56cc9
	verticalmenu
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
	giveitem TM_THUNDER
	iffalse UnknownScript_0x56cb7
	takecoins 5500
	jump UnknownScript_0x56ca6

UnknownScript_0x56c69:
	checkcoins 5500
	if_equal $2, UnknownScript_0x56cb1
	itemtotext TM_BLIZZARD, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	giveitem TM_BLIZZARD
	iffalse UnknownScript_0x56cb7
	takecoins 5500
	jump UnknownScript_0x56ca6

UnknownScript_0x56c85:
	checkcoins 5500
	if_equal $2, UnknownScript_0x56cb1
	itemtotext TM_FIRE_BLAST, $0
	scall UnknownScript_0x56ca1
	iffalse UnknownScript_0x56cbd
	giveitem TM_FIRE_BLAST
	iffalse UnknownScript_0x56cb7
	takecoins 5500
	jump UnknownScript_0x56ca6

UnknownScript_0x56ca1:
	writetext UnknownText_0x56ea8
	yesorno
	end

UnknownScript_0x56ca6:
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	waitbutton
	jump UnknownScript_0x56c36

UnknownScript_0x56cb1:
	writetext UnknownText_0x56ecb
	waitbutton
	closetext
	end

UnknownScript_0x56cb7:
	writetext UnknownText_0x56ee8
	waitbutton
	closetext
	end

UnknownScript_0x56cbd:
	writetext UnknownText_0x56f09
	waitbutton
	closetext
	end

UnknownScript_0x56cc3:
	writetext UnknownText_0x56f35
	waitbutton
	closetext
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
	opentext
	writetext UnknownText_0x56e50
	waitbutton
	checkitem COIN_CASE
	iffalse UnknownScript_0x56cc3
UnknownScript_0x56d0c:
	writetext UnknownText_0x56e8b
	special Special_DisplayCoinCaseBalance
	loadmenudata MenuDataHeader_0x56db0
	verticalmenu
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
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	waitbutton
	writebyte ABRA
	special Special_GameCornerPrizeMonCheckDex
	givepoke ABRA, 5
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
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	waitbutton
	writebyte CUBONE
	special Special_GameCornerPrizeMonCheckDex
	givepoke CUBONE, 15
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
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x56ebd
	waitbutton
	writebyte WOBBUFFET
	special Special_GameCornerPrizeMonCheckDex
	givepoke WOBBUFFET, 15
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
	opentext
	writetext UnknownText_0x56f55
	waitbutton
	closetext
	spriteface LAST_TALKED, LEFT
	end

PokefanMScript_0x56dfc:
	faceplayer
	opentext
	writetext UnknownText_0x56f9e
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_POKEFAN_M1, RIGHT
	end

CooltrainerMScript_0x56e07:
	faceplayer
	opentext
	writetext UnknownText_0x56ff4
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_COOLTRAINER_M, LEFT
	end

PokefanFScript_0x56e12:
	faceplayer
	opentext
	writetext UnknownText_0x5702b
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_POKEFAN_F, RIGHT
	end

CooltrainerFScript_0x56e1d:
	jumptextfaceplayer UnknownText_0x57097

GentlemanScript_0x56e20:
	faceplayer
	opentext
	writetext UnknownText_0x570b1
	waitbutton
	closetext
	spriteface GOLDENRODGAMECORNER_GENTLEMAN, RIGHT
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
	closetext
	end

MapGoldenrodGameCornerSignpost7Script:
	refreshscreen $0
	writebyte $1
	special Special_SlotMachine
	closetext
	end

MapGoldenrodGameCornerSignpost29Script:
	refreshscreen $0
	special Special_CardFlip
	closetext
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
	warp_def $d, $2, 10, GOLDENROD_CITY
	warp_def $d, $3, 10, GOLDENROD_CITY

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
	person_event SPRITE_CLERK, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ClerkScript_0x56c25, -1
	person_event SPRITE_RECEPTIONIST, 2, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x56c28, -1
	person_event SPRITE_RECEPTIONIST, 2, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x56d01, -1
	person_event SPRITE_PHARMACIST, 7, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 2, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PharmacistScript_0x56df1, -1
	person_event SPRITE_PHARMACIST, 7, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 4, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PharmacistScript_0x56df1, -1
	person_event SPRITE_POKEFAN_M, 10, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x56dfc, -1
	person_event SPRITE_COOLTRAINER_M, 8, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x56e07, -1
	person_event SPRITE_POKEFAN_F, 6, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x56e12, -1
	person_event SPRITE_COOLTRAINER_F, 3, 10, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x56e1d, -1
	person_event SPRITE_GENTLEMAN, 10, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x56e20, -1
	person_event SPRITE_POKEFAN_M, 9, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x56e2b, -1
	person_event SPRITE_POKEFAN_M, 10, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x56c1a, EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
