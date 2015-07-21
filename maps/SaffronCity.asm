SaffronCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw 5, .FlyPoint

.FlyPoint
	setflag ENGINE_FLYPOINT_SAFFRON
	return

LassScript_0x19932a:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x199338
	writetext UnknownText_0x19938d
	closetext
	loadmovesprites
	end

UnknownScript_0x199338:
	writetext UnknownText_0x19940d
	closetext
	loadmovesprites
	end

PokefanMScript_0x19933e:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x19934c
	writetext UnknownText_0x199460
	closetext
	loadmovesprites
	end

UnknownScript_0x19934c:
	writetext UnknownText_0x1994ae
	closetext
	loadmovesprites
	end

CooltrainerMScript_0x199352:
	jumptextfaceplayer UnknownText_0x1994fe

CooltrainerFScript_0x199355:
	jumptextfaceplayer UnknownText_0x19958e

FisherScript_0x199358:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x199366
	writetext UnknownText_0x1995fc
	closetext
	loadmovesprites
	end

UnknownScript_0x199366:
	writetext UnknownText_0x19964b
	closetext
	loadmovesprites
	end

YoungsterScript_0x19936c:
	jumptextfaceplayer UnknownText_0x1996a5

YoungsterScript_0x19936f:
	jumptextfaceplayer UnknownText_0x1996e5

LassScript_0x199372:
	jumptextfaceplayer UnknownText_0x199745

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityMagnetTrainStationSign:
	jumptext SaffronCityMagnetTrainStationSignText

SaffronCityPokeCenterSign:
	jumpstd pokecentersign

SaffronCityMartSign:
	jumpstd martsign

UnknownText_0x19938d:
	text "A little girl who"
	line "is an expert at"

	para "mimicking people"
	line "lives here."

	para "She even mimics"
	line "the people she's"

	para "conversing with."
	line "It's confusing."
	done

UnknownText_0x19940d:
	text "The COPYCAT girl"
	line "looked unhappy."

	para "She said she lost"
	line "her favorite #"
	cont "DOLL--CLEFAIRY."
	done

UnknownText_0x199460:
	text "You came out from"
	line "JOHTO?"

	para "You can zip back"
	line "home if the MAGNET"
	cont "TRAIN's running."
	done

UnknownText_0x1994ae:
	text "You came out from"
	line "JOHTO?"

	para "You can zip back"
	line "home by hopping on"
	cont "the MAGNET TRAIN."
	done

UnknownText_0x1994fe:
	text "I went to the GYM,"
	line "raring for battles"
	cont "against trainers…"

	para "It turns out, I"
	line "stumbled into the"

	para "unused GYM next"
	line "door."

	para "Boy, I was pretty"
	line "embarrassed."
	done

UnknownText_0x19958e:
	text "This is SILPH CO.,"
	line "famous for #MON"
	cont "merchandise."

	para "In the past, TEAM"
	line "ROCKET wanted the"

	para "company because of"
	line "that."
	done

UnknownText_0x1995fc:
	text "Chew… Chew…"

	para "I hear there's big"
	line "trouble brewing at"
	cont "the POWER PLANT."

	para "Chew… Chew…"
	done

UnknownText_0x19964b:
	text "Chew… Chew…"

	para "I hear there was"
	line "big trouble at the"
	cont "POWER PLANT."

	para "Chew… Chew…"
	line "Haaah, I'm full!"
	done

UnknownText_0x1996a5:
	text "Going into an"
	line "alley for the"

	para "first time makes"
	line "me sorta anxious."
	done

UnknownText_0x1996e5:
	text "There's a place"
	line "called TRAINER"

	para "HOUSE in VIRIDIAN"
	line "where trainers"

	para "gather from all"
	line "over the place."
	done

UnknownText_0x199745:
	text "Our city was"
	line "featured on a"
	cont "radio program."

	para "It's nice to hear"
	line "praise for your"

	para "city, but it's a"
	line "bit embarrassing"
	cont "too."
	done

SaffronCitySignText:
	text "SAFFRON CITY"

	para "Shining, Golden"
	line "Land of Commerce"
	done

SaffronGymSignText:
	text "SAFFRON CITY"
	line "#MON GYM"
	cont "LEADER: SABRINA"

	para "The Master of"
	line "Psychic #MON!"
	done

FightingDojoSignText:
	text "Everyone Welcome!"
	line "FIGHTING DOJO"
	done

SilphCoSignText:
	text "SILPH CO."
	line "OFFICE BUILDING"
	done

MrPsychicsHouseSignText:
	text "MR.PSYCHIC'S"
	line "HOUSE"
	done

SaffronCityMagnetTrainStationSignText:
	text "SAFFRON CITY"
	line "MAGNET TRAIN"
	cont "STATION"
	done

SaffronCity_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 15
	warp_def $3, $1a, 1, GROUP_FIGHTING_DOJO, MAP_FIGHTING_DOJO
	warp_def $3, $22, 1, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $b, $19, 2, GROUP_SAFFRON_MART, MAP_SAFFRON_MART
	warp_def $1d, $9, 1, GROUP_SAFFRON_POKECENTER_1F, MAP_SAFFRON_POKECENTER_1F
	warp_def $1d, $1b, 1, GROUP_MR_PSYCHICS_HOUSE, MAP_MR_PSYCHICS_HOUSE
	warp_def $3, $8, 2, GROUP_SAFFRON_TRAIN_STATION, MAP_SAFFRON_TRAIN_STATION
	warp_def $15, $12, 1, GROUP_SILPH_CO_1F, MAP_SILPH_CO_1F
	warp_def $b, $9, 1, GROUP_COPYCATS_HOUSE_1F, MAP_COPYCATS_HOUSE_1F
	warp_def $3, $12, 3, GROUP_ROUTE_5_SAFFRON_CITY_GATE, MAP_ROUTE_5_SAFFRON_CITY_GATE
	warp_def $18, $0, 3, GROUP_ROUTE_7_SAFFRON_GATE, MAP_ROUTE_7_SAFFRON_GATE
	warp_def $19, $0, 4, GROUP_ROUTE_7_SAFFRON_GATE, MAP_ROUTE_7_SAFFRON_GATE
	warp_def $21, $10, 1, GROUP_ROUTE_6_SAFFRON_GATE, MAP_ROUTE_6_SAFFRON_GATE
	warp_def $21, $11, 2, GROUP_ROUTE_6_SAFFRON_GATE, MAP_ROUTE_6_SAFFRON_GATE
	warp_def $16, $27, 1, GROUP_ROUTE_8_SAFFRON_GATE, MAP_ROUTE_8_SAFFRON_GATE
	warp_def $17, $27, 2, GROUP_ROUTE_8_SAFFRON_GATE, MAP_ROUTE_8_SAFFRON_GATE

.XYTriggers:
	db 0

.Signposts:
	db 8
	signpost 5, 21, SIGNPOST_READ, SaffronCitySign
	signpost 5, 33, SIGNPOST_READ, SaffronGymSign
	signpost 5, 25, SIGNPOST_READ, FightingDojoSign
	signpost 21, 15, SIGNPOST_READ, SilphCoSign
	signpost 29, 25, SIGNPOST_READ, MrPsychicsHouseSign
	signpost 5, 11, SIGNPOST_READ, SaffronCityMagnetTrainStationSign
	signpost 29, 10, SIGNPOST_READ, SaffronCityPokeCenterSign
	signpost 11, 26, SIGNPOST_READ, SaffronCityMartSign

.PersonEvents:
	db 8
	person_event SPRITE_LASS, 18, 11, OW_UP | $1, $2, -1, -1, (PAL_OW_RED << 4) | $80, 0, LassScript_0x19932a, -1
	person_event SPRITE_POKEFAN_M, 34, 23, OW_UP | $1, $2, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, PokefanMScript_0x19933e, -1
	person_event SPRITE_COOLTRAINER_M, 11, 36, OW_UP | $1, $1, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, CooltrainerMScript_0x199352, -1
	person_event SPRITE_COOLTRAINER_F, 28, 24, OW_UP | $1, $2, -1, -1, (PAL_OW_RED << 4) | $80, 0, CooltrainerFScript_0x199355, -1
	person_event SPRITE_FISHER, 16, 31, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, FisherScript_0x199358, -1
	person_event SPRITE_YOUNGSTER, 23, 19, OW_UP | $0, $10, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, YoungsterScript_0x19936c, -1
	person_event SPRITE_YOUNGSTER, 26, 39, OW_DOWN | $2, $11, -1, -1, (PAL_OW_RED << 4) | $80, 0, YoungsterScript_0x19936f, -1
	person_event SPRITE_LASS, 12, 23, OW_DOWN | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LassScript_0x199372, -1
