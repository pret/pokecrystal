GoldenrodCity_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 2

	; callbacks
	dbw 5, .FlyPointAndFloria
	dbw 2, .MoveTutor

.FlyPointAndFloria
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_16
	checkevent EVENT_MET_FLORIA
	iftrue .FloriaDone
	clearevent EVENT_FLORIA_AT_SUDOWOODO
.FloriaDone
	return

.MoveTutor
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .MoveTutorDone
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	checkcode $b
	if_equal WEDNESDAY, .MoveTutorAppear
	if_equal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear
	disappear $10
	return

.MoveTutorAppear
	checkflag ENGINE_5E
	iftrue .MoveTutorDone
	appear $10
.MoveTutorDone
	return

MoveTutor:
	faceplayer
	loadfont
	writetext UnknownText_0x199042
	yesorno
	iffalse UnknownScript_0x19899a
	special Function24b25
	writetext UnknownText_0x199090
	yesorno
	iffalse UnknownScript_0x1989a0
	checkcoins 4000
	if_equal $2, UnknownScript_0x1989dd
	writetext UnknownText_0x1990ce
	loadmenudata MenuDataHeader_0x198967
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0x19893a
	if_equal $2, UnknownScript_0x198949
	if_equal $3, UnknownScript_0x198958
	jump UnknownScript_0x1989d7

UnknownScript_0x19893a:
	writebyte $1
	writetext UnknownText_0x1991cf
	special Function4925b
	if_equal $0, UnknownScript_0x1989a6
	jump UnknownScript_0x1989d7

UnknownScript_0x198949:
	writebyte $2
	writetext UnknownText_0x1991cf
	special Function4925b
	if_equal $0, UnknownScript_0x1989a6
	jump UnknownScript_0x1989d7

UnknownScript_0x198958:
	writebyte $3
	writetext UnknownText_0x1991cf
	special Function4925b
	if_equal $0, UnknownScript_0x1989a6
	jump UnknownScript_0x1989d7


MenuDataHeader_0x198967:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw MenuData2_0x19896f
	db 1 ; default option

MenuData2_0x19896f:
	db $80 ; flags
	db 4 ; items
	db "FLAMETHROWER@"
	db "THUNDERBOLT@"
	db "ICE BEAM@"
	db "CANCEL@"


UnknownScript_0x19899a:
	writetext UnknownText_0x1990b4
	closetext
	loadmovesprites
	end

UnknownScript_0x1989a0:
	writetext UnknownText_0x199107
	closetext
	loadmovesprites
	end

UnknownScript_0x1989a6:
	writetext UnknownText_0x19913a
	keeptextopen
	takecoins 4000
	waitbutton
	playsound SFX_TRANSACTION
	special Function24b25
	writetext UnknownText_0x19918b
	closetext
	loadmovesprites
	checkcode $9
	if_equal $2, UnknownScript_0x1989c6
	applymovement $10, MovementData_0x198a5f
	jump UnknownScript_0x1989ca

UnknownScript_0x1989c6:
	applymovement $10, MovementData_0x198a63
UnknownScript_0x1989ca:
	playsound SFX_ENTER_DOOR
	disappear $10
	clearevent $076b
	setflag ENGINE_5E
	waitbutton
	end

UnknownScript_0x1989d7:
	writetext UnknownText_0x1991a4
	closetext
	loadmovesprites
	end

UnknownScript_0x1989dd:
	writetext UnknownText_0x1991ac
	closetext
	loadmovesprites
	end

PokefanMScript_0x1989e3:
	jumptextfaceplayer UnknownText_0x198a69

YoungsterScript_0x1989e6:
	jumptextfaceplayer UnknownText_0x198aa9

CooltrainerFScript_0x1989e9:
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1989f7
	writetext UnknownText_0x198ae6
	closetext
	loadmovesprites
	end

UnknownScript_0x1989f7:
	writetext UnknownText_0x198b2d
	closetext
	loadmovesprites
	end

CooltrainerFScript_0x1989fd:
	faceplayer
	loadfont
	checkflag $0000
	iftrue UnknownScript_0x198a0b
	writetext UnknownText_0x198b73
	closetext
	loadmovesprites
	end

UnknownScript_0x198a0b:
	writetext UnknownText_0x198c14
	closetext
	loadmovesprites
	end

YoungsterScript_0x198a11:
	jumptextfaceplayer UnknownText_0x198c36

LassScript_0x198a14:
	jumptextfaceplayer UnknownText_0x198c83

GrampsScript_0x198a17:
	jumptextfaceplayer UnknownText_0x198ccf

RocketScript_0x198a1a:
	loadfont
	writetext UnknownText_0x198d0d
	keeptextopen
	faceplayer
	writetext UnknownText_0x198d2a
	closetext
	loadmovesprites
	spriteface $9, UP
	end

RocketScript_0x198a29:
	jumptextfaceplayer UnknownText_0x198d4e

RocketScript_0x198a2c:
	jumptextfaceplayer UnknownText_0x198d6d

RocketScript_0x198a2f:
	jumptextfaceplayer UnknownText_0x198daa

RocketScript_0x198a32:
	jumptextfaceplayer UnknownText_0x198de2

RocketScript_0x198a35:
	jumptextfaceplayer UnknownText_0x198e1f

RocketScript_0x198a38:
	jumptextfaceplayer UnknownText_0x198e4b

GoldenrodCityStationSign:
	jumptext GoldenrodCityStationSignText

GoldenrodCityRadioTowerSign:
	jumptext GoldenrodCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

GoldenrodCitySign:
	jumptext GoldenrodCitySignText

GoldenrodCityBikeShopSign:
	jumptext GoldenrodCityBikeShopSignText

GoldenrodCityGameCornerSign:
	jumptext GoldenrodCityGameCornerSignText

GoldenrodCityNameRaterSign:
	jumptext GoldenrodCityNameRaterSignText

GoldenrodCityUndergroundSignNorth:
	jumptext GoldenrodCityUndergroundSignNorthText

GoldenrodCityUndergroundSignSouth:
	jumptext GoldenrodCityUndergroundSignSouthText

GoldenrodCityPokeCenterSign:
	jumpstd pokecentersign

GoldenrodCityFlowerShopSign:
	jumptext GoldenrodCityFlowerShopSignText

MovementData_0x198a5f:
	step_right
	step_right
	step_up
	step_end

MovementData_0x198a63:
	step_down
	step_right
	step_right
	step_up
	step_up
	step_end

UnknownText_0x198a69:
	text "They built the new"
	line "RADIO TOWER to"

	para "replace the old,"
	line "creaky one."
	done

UnknownText_0x198aa9:
	text "I know there's a"
	line "new BIKE SHOP, but"

	para "I can't find it"
	line "anywhere."
	done

UnknownText_0x198ae6:
	text "Is that man in"
	line "black dressed up"

	para "like a TEAM ROCKET"
	line "member? How silly!"
	done

UnknownText_0x198b2d:
	text "Was that man in"
	line "black really part"

	para "of TEAM ROCKET? I"
	line "can't believe it!"
	done

UnknownText_0x198b73:
	text "The RADIO TOWER in"
	line "GOLDENROD CITY is"
	cont "a landmark."

	para "They're running a"
	line "promotional cam- "
	cont "paign right now."

	para "They'll modify"
	line "your #GEAR,"

	para "so it can also"
	line "serve as a radio."
	done

UnknownText_0x198c14:
	text "Oh, your #GEAR"
	line "works as a radio!"
	done

UnknownText_0x198c36:
	text "E-he-he-he…"

	para "I got in trouble"
	line "for playing in the"

	para "basement of the"
	line "DEPT.STORE."
	done

UnknownText_0x198c83:
	text "The man at that"
	line "house rates your"
	cont "#MON names."

	para "He can even rename"
	line "your #MON."
	done

UnknownText_0x198ccf:
	text "Whew! This is one"
	line "big town. I don't"

	para "know where any-"
	line "thing is."
	done

UnknownText_0x198d0d:
	text "So this is the"
	line "RADIO TOWER…"
	done

UnknownText_0x198d2a:
	text "What do you want,"
	line "you pest? Scram!"
	done

UnknownText_0x198d4e:
	text "Stay out of the"
	line "way! Beat it!"
	done

UnknownText_0x198d6d:
	text "Take over the"
	line "RADIO TOWER…"

	para "What? It's none of"
	line "your business!"
	done

UnknownText_0x198daa:
	text "#MON? They're"
	line "nothing more than"

	para "tools for making"
	line "money!"
	done

UnknownText_0x198de2:
	text "Our dream will"
	line "soon come true…"

	para "It was such a long"
	line "struggle…"
	done

UnknownText_0x198e1f:
	text "Hey, brat! You"
	line "don't belong here!"
	cont "Get lost!"
	done

UnknownText_0x198e4b:
	text "Come taste the"
	line "true terror of"
	cont "TEAM ROCKET!"
	done

GoldenrodCityStationSignText:
	text "GOLDENROD CITY"
	line "STATION"
	done

GoldenrodCityRadioTowerSignText:
	text "GOLDENROD CITY"
	line "RADIO TOWER"
	done

GoldenrodDeptStoreSignText:
	text "Full Selection of"
	line "#MON Goods!"

	para "GOLDENROD CITY"
	line "DEPT.STORE"
	done

GoldenrodGymSignText:
	text "GOLDENROD CITY"
	line "#MON GYM"
	cont "LEADER: WHITNEY"

	para "The Incredibly"
	line "Pretty Girl!"
	done

GoldenrodCitySignText:
	text "GOLDENROD CITY"

	para "The Festive City"
	line "of Opulent Charm"
	done

GoldenrodCityBikeShopSignText:
	text "The World is a"
	line "Cycle Path!"
	cont "BIKE SHOP"
	done

GoldenrodCityGameCornerSignText:
	text "Your Playground!"

	para "GOLDENROD CITY"
	line "GAME CORNER"
	done

GoldenrodCityNameRaterSignText:
	text "NAME RATER"

	para "Get Your #MON"
	line "Nicknames Rated"
	done

GoldenrodCityUndergroundSignNorthText:
	text "UNDERGROUND"
	line "ENTRANCE"
	done

GoldenrodCityUndergroundSignSouthText:
	text "UNDERGROUND"
	line "ENTRANCE"
	done

PokeComCenterSignText:
; unused in the english version
	text "For Mobile Tips!"
	line "#COM CENTER"
	done

GoldenrodCityFlowerShopSignText:
	text "Blooming Beautiful"
	line "FLOWER SHOP"
	done

UnknownText_0x199042:
	text "I can teach your"
	line "#MON amazing"

	para "moves if you'd"
	line "like."

	para "Should I teach a"
	line "new move?"
	done

UnknownText_0x199090:
	text "It will cost you"
	line "4000 coins. Okay?"
	done

UnknownText_0x1990b4:
	text "Aww… But they're"
	line "amazing…"
	done

UnknownText_0x1990ce:
	text "Wahahah! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

UnknownText_0x199107:
	text "Hm, too bad. I'll"
	line "have to get some"
	cont "cash from home…"
	done

UnknownText_0x19913a:
	text "If you understand"
	line "what's so amazing"

	para "about this move,"
	line "you've made it as"
	cont "a trainer."
	done

UnknownText_0x19918b:
	text "Wahahah!"
	line "Farewell, kid!"
	done

UnknownText_0x1991a4:
	text "B-but…"
	done

UnknownText_0x1991ac:
	text "…You don't have"
	line "enough coins here…"
	done

UnknownText_0x1991cf:
	db $0, $57

GoldenrodCity_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 15
	warp_def $7, $18, 1, GROUP_GOLDENROD_GYM, MAP_GOLDENROD_GYM
	warp_def $1d, $1d, 1, GROUP_GOLDENROD_BIKE_SHOP, MAP_GOLDENROD_BIKE_SHOP
	warp_def $15, $1f, 1, GROUP_GOLDENROD_HAPPINESS_RATER, MAP_GOLDENROD_HAPPINESS_RATER
	warp_def $19, $5, 1, GROUP_GOLDENROD_BILLS_HOUSE, MAP_GOLDENROD_BILLS_HOUSE
	warp_def $d, $9, 2, GROUP_GOLDENROD_MAGNET_TRAIN_STATION, MAP_GOLDENROD_MAGNET_TRAIN_STATION
	warp_def $5, $1d, 1, GROUP_GOLDENROD_FLOWER_SHOP, MAP_GOLDENROD_FLOWER_SHOP
	warp_def $9, $21, 1, GROUP_GOLDENROD_PP_SPEECH_HOUSE, MAP_GOLDENROD_PP_SPEECH_HOUSE
	warp_def $7, $f, 1, GROUP_GOLDENROD_NAME_RATERS_HOUSE, MAP_GOLDENROD_NAME_RATERS_HOUSE
	warp_def $1b, $18, 1, GROUP_GOLDENROD_DEPT_STORE_1F, MAP_GOLDENROD_DEPT_STORE_1F
	warp_def $15, $e, 1, GROUP_GOLDENROD_GAME_CORNER, MAP_GOLDENROD_GAME_CORNER
	warp_def $f, $5, 1, GROUP_RADIO_TOWER_1F, MAP_RADIO_TOWER_1F
	warp_def $1, $13, 3, GROUP_ROUTE_35_GOLDENROD_GATE, MAP_ROUTE_35_GOLDENROD_GATE
	warp_def $5, $9, 8, GROUP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, MAP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def $1d, $b, 5, GROUP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, MAP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def $1b, $f, 1, GROUP_GOLDENROD_POKECENTER_1F, MAP_GOLDENROD_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 12
	signpost 14, 10, $0, GoldenrodCityStationSign
	signpost 17, 4, $0, GoldenrodCityRadioTowerSign
	signpost 27, 26, $0, GoldenrodDeptStoreSign
	signpost 9, 26, $0, GoldenrodGymSign
	signpost 18, 22, $0, GoldenrodCitySign
	signpost 30, 28, $0, GoldenrodCityBikeShopSign
	signpost 22, 16, $0, GoldenrodCityGameCornerSign
	signpost 7, 12, $0, GoldenrodCityNameRaterSign
	signpost 6, 8, $0, GoldenrodCityUndergroundSignNorth
	signpost 30, 12, $0, GoldenrodCityUndergroundSignSouth
	signpost 27, 16, $1, GoldenrodCityPokeCenterSign
	signpost 6, 30, $0, GoldenrodCityFlowerShopSign

	; people-events
	db 15
	person_event SPRITE_POKEFAN_M, 22, 11, $7, $0, 255, 255, $0, 0, PokefanMScript_0x1989e3, $06cf
	person_event SPRITE_YOUNGSTER, 21, 34, $2, $11, 255, 255, $0, 0, YoungsterScript_0x1989e6, $06cf
	person_event SPRITE_COOLTRAINER_F, 20, 16, $8, $0, 255, 255, $a0, 0, CooltrainerFScript_0x1989e9, $06cf
	person_event SPRITE_COOLTRAINER_F, 30, 24, $2, $21, 255, 255, $0, 0, CooltrainerFScript_0x1989fd, $06cf
	person_event SPRITE_YOUNGSTER, 21, 23, $2, $11, 255, 255, $80, 0, YoungsterScript_0x198a11, $06cf
	person_event SPRITE_LASS, 14, 21, $5, $2, 255, 255, $a0, 0, LassScript_0x198a14, $06cf
	person_event SPRITE_GRAMPS, 31, 15, $5, $1, 255, 255, $0, 0, GrampsScript_0x198a17, $06cf
	person_event SPRITE_ROCKET, 20, 8, $7, $0, 255, 255, $0, 0, RocketScript_0x198a1a, $06cc
	person_event SPRITE_ROCKET, 24, 32, $7, $0, 255, 255, $0, 0, RocketScript_0x198a29, $06cd
	person_event SPRITE_ROCKET, 19, 12, $6, $0, 255, 255, $0, 0, RocketScript_0x198a2c, $06cd
	person_event SPRITE_ROCKET, 27, 20, $9, $0, 255, 255, $0, 0, RocketScript_0x198a2f, $06ce
	person_event SPRITE_ROCKET, 24, 33, $7, $0, 255, 255, $0, 0, RocketScript_0x198a32, $06ce
	person_event SPRITE_ROCKET, 11, 33, $6, $0, 255, 255, $0, 0, RocketScript_0x198a35, $06ce
	person_event SPRITE_ROCKET, 14, 35, $8, $0, 255, 255, $0, 0, RocketScript_0x198a38, $06ce
	person_event SPRITE_POKEFAN_M, 26, 16, $3, $0, 255, 255, $80, 0, MoveTutor, $076a
