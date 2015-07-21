GoldenrodCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks
	dbw 5, .FlyPointAndFloria
	dbw 2, .MoveTutor

.FlyPointAndFloria
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_FLORIA
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
	checkcode VAR_WEEKDAY
	if_equal WEDNESDAY, .MoveTutorAppear
	if_equal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear
	disappear $10
	return

.MoveTutorAppear
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear $10
.MoveTutorDone
	return

MoveTutor:
	faceplayer
	loadfont
	writetext UnknownText_0x199042
	yesorno
	iffalse .Refused
	special Function24b25
	writetext UnknownText_0x199090
	yesorno
	iffalse .Refused2
	checkcoins 4000
	if_equal $2, .NotEnoughMoney
	writetext UnknownText_0x1990ce
	loadmenudata .MoveMenuDataHeader
	interpretmenu2
	writebackup
	if_equal $1, .Flamethrower
	if_equal $2, .Thunderbolt
	if_equal $3, .IceBeam
	jump .Incompatible

.Flamethrower:
	writebyte $1
	writetext UnknownText_0x1991cf
	special Function4925b
	if_equal $0, .TeachMove
	jump .Incompatible

.Thunderbolt:
	writebyte $2
	writetext UnknownText_0x1991cf
	special Function4925b
	if_equal $0, .TeachMove
	jump .Incompatible

.IceBeam:
	writebyte $3
	writetext UnknownText_0x1991cf
	special Function4925b
	if_equal $0, .TeachMove
	jump .Incompatible


.MoveMenuDataHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "FLAMETHROWER@"
	db "THUNDERBOLT@"
	db "ICE BEAM@"
	db "CANCEL@"


.Refused:
	writetext UnknownText_0x1990b4
	closetext
	loadmovesprites
	end

.Refused2:
	writetext UnknownText_0x199107
	closetext
	loadmovesprites
	end

.TeachMove:
	writetext UnknownText_0x19913a
	keeptextopen
	takecoins 4000
	waitbutton
	playsound SFX_TRANSACTION
	special Function24b25
	writetext UnknownText_0x19918b
	closetext
	loadmovesprites
	checkcode VAR_FACING
	if_equal $2, .WalkAroundPlayer
	applymovement $10, MovementData_0x198a5f
	jump .GoInside

.WalkAroundPlayer:
	applymovement $10, MovementData_0x198a63
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear $10
	clearevent EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitbutton
	end

.Incompatible:
	writetext UnknownText_0x1991a4
	closetext
	loadmovesprites
	end

.NotEnoughMoney:
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
	iftrue .ClearedRadioTower
	writetext UnknownText_0x198ae6
	closetext
	loadmovesprites
	end

.ClearedRadioTower:
	writetext UnknownText_0x198b2d
	closetext
	loadmovesprites
	end

CooltrainerFScript_0x1989fd:
	faceplayer
	loadfont
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext UnknownText_0x198b73
	closetext
	loadmovesprites
	end

.GotRadioCard:
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
	text ""
	done

GoldenrodCity_MapEventHeader:
	; filler
	db 0, 0

.Warps:
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

.XYTriggers:
	db 0

.Signposts:
	db 12
	signpost 14, 10, SIGNPOST_READ, GoldenrodCityStationSign
	signpost 17, 4, SIGNPOST_READ, GoldenrodCityRadioTowerSign
	signpost 27, 26, SIGNPOST_READ, GoldenrodDeptStoreSign
	signpost 9, 26, SIGNPOST_READ, GoldenrodGymSign
	signpost 18, 22, SIGNPOST_READ, GoldenrodCitySign
	signpost 30, 28, SIGNPOST_READ, GoldenrodCityBikeShopSign
	signpost 22, 16, SIGNPOST_READ, GoldenrodCityGameCornerSign
	signpost 7, 12, SIGNPOST_READ, GoldenrodCityNameRaterSign
	signpost 6, 8, SIGNPOST_READ, GoldenrodCityUndergroundSignNorth
	signpost 30, 12, SIGNPOST_READ, GoldenrodCityUndergroundSignSouth
	signpost 27, 16, SIGNPOST_UP, GoldenrodCityPokeCenterSign
	signpost 6, 30, SIGNPOST_READ, GoldenrodCityFlowerShopSign

.PersonEvents:
	db 15
	person_event SPRITE_POKEFAN_M, 22, 11, OW_UP | $3, $0, -1, -1, $0, 0, PokefanMScript_0x1989e3, EVENT_GOLDENROD_CITY_CIVILIANS
	person_event SPRITE_YOUNGSTER, 21, 34, OW_DOWN | $2, $11, -1, -1, $0, 0, YoungsterScript_0x1989e6, EVENT_GOLDENROD_CITY_CIVILIANS
	person_event SPRITE_COOLTRAINER_F, 20, 16, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, CooltrainerFScript_0x1989e9, EVENT_GOLDENROD_CITY_CIVILIANS
	person_event SPRITE_COOLTRAINER_F, 30, 24, OW_DOWN | $2, $21, -1, -1, $0, 0, CooltrainerFScript_0x1989fd, EVENT_GOLDENROD_CITY_CIVILIANS
	person_event SPRITE_YOUNGSTER, 21, 23, OW_DOWN | $2, $11, -1, -1, (PAL_OW_RED << 4) | $80, 0, YoungsterScript_0x198a11, EVENT_GOLDENROD_CITY_CIVILIANS
	person_event SPRITE_LASS, 14, 21, OW_UP | $1, $2, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LassScript_0x198a14, EVENT_GOLDENROD_CITY_CIVILIANS
	person_event SPRITE_GRAMPS, 31, 15, OW_UP | $1, $1, -1, -1, $0, 0, GrampsScript_0x198a17, EVENT_GOLDENROD_CITY_CIVILIANS
	person_event SPRITE_ROCKET, 20, 8, OW_UP | $3, $0, -1, -1, $0, 0, RocketScript_0x198a1a, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	person_event SPRITE_ROCKET, 24, 32, OW_UP | $3, $0, -1, -1, $0, 0, RocketScript_0x198a29, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 19, 12, OW_UP | $2, $0, -1, -1, $0, 0, RocketScript_0x198a2c, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 27, 20, OW_LEFT | $1, $0, -1, -1, $0, 0, RocketScript_0x198a2f, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 24, 33, OW_UP | $3, $0, -1, -1, $0, 0, RocketScript_0x198a32, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 11, 33, OW_UP | $2, $0, -1, -1, $0, 0, RocketScript_0x198a35, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 14, 35, OW_LEFT | $0, $0, -1, -1, $0, 0, RocketScript_0x198a38, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_POKEFAN_M, 26, 16, OW_DOWN | $3, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, MoveTutor, EVENT_GOLDENROD_CITY_MOVE_TUTOR
