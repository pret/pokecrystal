SaffronCity_MapScriptHeader: ; 0x199321
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x199326
; 0x199326

UnknownScript_0x199326: ; 0x199326
	setbit2 $003c
	return
; 0x19932a

LassScript_0x19932a: ; 0x19932a
	faceplayer
	loadfont
	checkbit1 EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x199338
	2writetext UnknownText_0x19938d
	closetext
	loadmovesprites
	end
; 0x199338

UnknownScript_0x199338: ; 0x199338
	2writetext UnknownText_0x19940d
	closetext
	loadmovesprites
	end
; 0x19933e

PokefanMScript_0x19933e: ; 0x19933e
	faceplayer
	loadfont
	checkbit1 EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x19934c
	2writetext UnknownText_0x199460
	closetext
	loadmovesprites
	end
; 0x19934c

UnknownScript_0x19934c: ; 0x19934c
	2writetext UnknownText_0x1994ae
	closetext
	loadmovesprites
	end
; 0x199352

CooltrainerMScript_0x199352: ; 0x199352
	jumptextfaceplayer UnknownText_0x1994fe
; 0x199355

CooltrainerFScript_0x199355: ; 0x199355
	jumptextfaceplayer UnknownText_0x19958e
; 0x199358

FisherScript_0x199358: ; 0x199358
	faceplayer
	loadfont
	checkbit1 EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x199366
	2writetext UnknownText_0x1995fc
	closetext
	loadmovesprites
	end
; 0x199366

UnknownScript_0x199366: ; 0x199366
	2writetext UnknownText_0x19964b
	closetext
	loadmovesprites
	end
; 0x19936c

YoungsterScript_0x19936c: ; 0x19936c
	jumptextfaceplayer UnknownText_0x1996a5
; 0x19936f

YoungsterScript_0x19936f: ; 0x19936f
	jumptextfaceplayer UnknownText_0x1996e5
; 0x199372

LassScript_0x199372: ; 0x199372
	jumptextfaceplayer UnknownText_0x199745
; 0x199375

MapSaffronCitySignpost0Script: ; 0x199375
	jumptext UnknownText_0x1997b7
; 0x199378

MapSaffronCitySignpost1Script: ; 0x199378
	jumptext UnknownText_0x1997e6
; 0x19937b

MapSaffronCitySignpost2Script: ; 0x19937b
	jumptext UnknownText_0x199829
; 0x19937e

MapSaffronCitySignpost3Script: ; 0x19937e
	jumptext UnknownText_0x19984a
; 0x199381

MapSaffronCitySignpost4Script: ; 0x199381
	jumptext UnknownText_0x199865
; 0x199384

MapSaffronCitySignpost5Script: ; 0x199384
	jumptext UnknownText_0x199879
; 0x199387

MapSaffronCitySignpost6Script: ; 0x199387
	jumpstd $0010
; 0x19938a

MapSaffronCitySignpost7Script: ; 0x19938a
	jumpstd $0011
; 0x19938d

UnknownText_0x19938d: ; 0x19938d
	db $0, "A little girl who", $4f
	db "is an expert at", $51
	db "mimicking people", $4f
	db "lives here.", $51
	db "She even mimics", $4f
	db "the people she's", $51
	db "conversing with.", $4f
	db "It's confusing.", $57
; 0x19940d

UnknownText_0x19940d: ; 0x19940d
	db $0, "The COPYCAT girl", $4f
	db "looked unhappy.", $51
	db "She said she lost", $4f
	db "her favorite #", $55
	db "DOLL--CLEFAIRY.", $57
; 0x199460

UnknownText_0x199460: ; 0x199460
	db $0, "You came out from", $4f
	db "JOHTO?", $51
	db "You can zip back", $4f
	db "home if the MAGNET", $55
	db "TRAIN's running.", $57
; 0x1994ae

UnknownText_0x1994ae: ; 0x1994ae
	db $0, "You came out from", $4f
	db "JOHTO?", $51
	db "You can zip back", $4f
	db "home by hopping on", $55
	db "the MAGNET TRAIN.", $57
; 0x1994fe

UnknownText_0x1994fe: ; 0x1994fe
	db $0, "I went to the GYM,", $4f
	db "raring for battles", $55
	db "against trainers…", $51
	db "It turns out, I", $4f
	db "stumbled into the", $51
	db "unused GYM next", $4f
	db "door.", $51
	db "Boy, I was pretty", $4f
	db "embarrassed.", $57
; 0x19958e

UnknownText_0x19958e: ; 0x19958e
	db $0, "This is SILPH CO.,", $4f
	db "famous for #MON", $55
	db "merchandise.", $51
	db "In the past, TEAM", $4f
	db "ROCKET wanted the", $51
	db "company because of", $4f
	db "that.", $57
; 0x1995fc

UnknownText_0x1995fc: ; 0x1995fc
	db $0, "Chew… Chew…", $51
	db "I hear there's big", $4f
	db "trouble brewing at", $55
	db "the POWER PLANT.", $51
	db "Chew… Chew…", $57
; 0x19964b

UnknownText_0x19964b: ; 0x19964b
	db $0, "Chew… Chew…", $51
	db "I hear there was", $4f
	db "big trouble at the", $55
	db "POWER PLANT.", $51
	db "Chew… Chew…", $4f
	db "Haaah, I'm full!", $57
; 0x1996a5

UnknownText_0x1996a5: ; 0x1996a5
	db $0, "Going into an", $4f
	db "alley for the", $51
	db "first time makes", $4f
	db "me sorta anxious.", $57
; 0x1996e5

UnknownText_0x1996e5: ; 0x1996e5
	db $0, "There's a place", $4f
	db "called TRAINER", $51
	db "HOUSE in VIRIDIAN", $4f
	db "where trainers", $51
	db "gather from all", $4f
	db "over the place.", $57
; 0x199745

UnknownText_0x199745: ; 0x199745
	db $0, "Our city was", $4f
	db "featured on a", $55
	db "radio program.", $51
	db "It's nice to hear", $4f
	db "praise for your", $51
	db "city, but it's a", $4f
	db "bit embarrassing", $55
	db "too.", $57
; 0x1997b7

UnknownText_0x1997b7: ; 0x1997b7
	db $0, "SAFFRON CITY", $51
	db "Shining, Golden", $4f
	db "Land of Commerce", $57
; 0x1997e6

UnknownText_0x1997e6: ; 0x1997e6
	db $0, "SAFFRON CITY", $4f
	db "#MON GYM", $55
	db "LEADER: SABRINA", $51
	db "The Master of", $4f
	db "Psychic #MON!", $57
; 0x199829

UnknownText_0x199829: ; 0x199829
	db $0, "Everyone Welcome!", $4f
	db "FIGHTING DOJO", $57
; 0x19984a

UnknownText_0x19984a: ; 0x19984a
	db $0, "SILPH CO.", $4f
	db "OFFICE BUILDING", $57
; 0x199865

UnknownText_0x199865: ; 0x199865
	db $0, "MR.PSYCHIC'S", $4f
	db "HOUSE", $57
; 0x199879

UnknownText_0x199879: ; 0x199879
	db $0, "SAFFRON CITY", $4f
	db "MAGNET TRAIN", $55
	db "STATION", $57
; 0x19989c

SaffronCity_MapEventHeader: ; 0x19989c
	; filler
	db 0, 0

	; warps
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

	; xy triggers
	db 0

	; signposts
	db 8
	signpost 5, 21, $0, MapSaffronCitySignpost0Script
	signpost 5, 33, $0, MapSaffronCitySignpost1Script
	signpost 5, 25, $0, MapSaffronCitySignpost2Script
	signpost 21, 15, $0, MapSaffronCitySignpost3Script
	signpost 29, 25, $0, MapSaffronCitySignpost4Script
	signpost 5, 11, $0, MapSaffronCitySignpost5Script
	signpost 29, 10, $0, MapSaffronCitySignpost6Script
	signpost 11, 26, $0, MapSaffronCitySignpost7Script

	; people-events
	db 8
	person_event SPRITE_LASS, 18, 11, $5, $2, 255, 255, $80, 0, LassScript_0x19932a, $ffff
	person_event SPRITE_POKEFAN_M, 34, 23, $5, $2, 255, 255, $b0, 0, PokefanMScript_0x19933e, $ffff
	person_event SPRITE_COOLTRAINER_M, 11, 36, $5, $1, 255, 255, $a0, 0, CooltrainerMScript_0x199352, $ffff
	person_event SPRITE_COOLTRAINER_F, 28, 24, $5, $2, 255, 255, $80, 0, CooltrainerFScript_0x199355, $ffff
	person_event SPRITE_FISHER, 16, 31, $6, $0, 255, 255, $a0, 0, FisherScript_0x199358, $ffff
	person_event SPRITE_YOUNGSTER, 23, 19, $4, $10, 255, 255, $90, 0, YoungsterScript_0x19936c, $ffff
	person_event SPRITE_YOUNGSTER, 26, 39, $2, $11, 255, 255, $80, 0, YoungsterScript_0x19936f, $ffff
	person_event SPRITE_LASS, 12, 23, $3, $0, 255, 255, $a0, 0, LassScript_0x199372, $ffff
; 0x19997d

