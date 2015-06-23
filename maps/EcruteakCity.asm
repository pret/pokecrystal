EcruteakCity_MapScriptHeader: ; 0x1a4000
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a4005
; 0x1a4005

UnknownScript_0x1a4005: ; 0x1a4005
	setflag $0048
	return
; 0x1a4009

GrampsScript_0x1a4009: ; 0x1a4009
	jumptextfaceplayer UnknownText_0x1a4105
; 0x1a400c

GrampsScript_0x1a400c: ; 0x1a400c
	jumptextfaceplayer UnknownText_0x1a4147
; 0x1a400f

GrampsScript_0x1a400f: ; 0x1a400f
	jumptextfaceplayer UnknownText_0x1a43cb
; 0x1a4012

LassScript_0x1a4012: ; 0x1a4012
	jumptextfaceplayer UnknownText_0x1a41db
; 0x1a4015

LassScript_0x1a4015: ; 0x1a4015
	faceplayer
	loadfont
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue UnknownScript_0x1a4023
	writetext UnknownText_0x1a421a
	closetext
	loadmovesprites
	end
; 0x1a4023

UnknownScript_0x1a4023: ; 0x1a4023
	writetext UnknownText_0x1a4269
	closetext
	loadmovesprites
	end
; 0x1a4029

FisherScript_0x1a4029: ; 0x1a4029
	faceplayer
	loadfont
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue UnknownScript_0x1a4037
	writetext UnknownText_0x1a42ac
	closetext
	loadmovesprites
	end
; 0x1a4037

UnknownScript_0x1a4037: ; 0x1a4037
	writetext UnknownText_0x1a4325
	closetext
	loadmovesprites
	end
; 0x1a403d

YoungsterScript_0x1a403d: ; 0x1a403d
	jumptextfaceplayer UnknownText_0x1a4386
; 0x1a4040

MapEcruteakCitySignpost0Script: ; 0x1a4040
	jumptext UnknownText_0x1a44d1
; 0x1a4043

MapEcruteakCitySignpost1Script: ; 0x1a4043
	jumptext UnknownText_0x1a4513
; 0x1a4046

MapEcruteakCitySignpost2Script: ; 0x1a4046
	jumptext UnknownText_0x1a4548
; 0x1a4049

MapEcruteakCitySignpost3Script: ; 0x1a4049
	jumptext UnknownText_0x1a458c
; 0x1a404c

MapEcruteakCitySignpost4Script: ; 0x1a404c
	jumptext UnknownText_0x1a45a4
; 0x1a404f

MapEcruteakCitySignpost5Script: ; 0x1a404f
	jumpstd pokecentersign
; 0x1a4052

MapEcruteakCitySignpost6Script: ; 0x1a4052
	jumpstd martsign
; 0x1a4055

MapEcruteakCitySignpostItem7: ; 0x1a4055
	dw $00b4
	db HYPER_POTION
	
; 0x1a4058

UnusedMissingDaughterText: ; 0x1a4058
; This text is neither used nor referenced in the final game.
	text "Oh, no. Oh, no…"

	para "My daughter is"
	line "missing."

	para "No… She couldn't"
	line "have gone to the"
	cont "BURNED TOWER."

	para "I told her not to"
	line "go near it…"

	para "People seem to"
	line "disappear there…"

	para "Oh, what should I"
	line "do…?"
	done

UnknownText_0x1a4105: ; 0x1a4105
	text "ECRUTEAK used to"
	line "have two towers:"

	para "one each in the"
	line "east and west."
	done
; 0x1a4147

UnknownText_0x1a4147: ; 0x1a4147
	text "Ah, child."
	line "Have you learned"

	para "to dance like the"
	line "KIMONO GIRLS?"

	para "If you go to their"
	line "DANCE THEATER, an"

	para "odd old man will"
	line "give you something"
	cont "nice, I hear."
	done
; 0x1a41db

UnknownText_0x1a41db: ; 0x1a41db
	text "I'm going to prac-"
	line "tice at the DANCE"

	para "THEATER. Care to"
	line "join me?"
	done
; 0x1a421a

UnknownText_0x1a421a: ; 0x1a421a
	text "The tower that"
	line "used to be here…"

	para "My grandma told me"
	line "it used to be much"
	cont "taller."
	done
; 0x1a4269

UnknownText_0x1a4269: ; 0x1a4269
	text "Three big #MON"
	line "ran off in differ-"
	cont "ent directions."
	cont "What were they?"
	done
; 0x1a42ac

UnknownText_0x1a42ac: ; 0x1a42ac
	text "I heard a rumor"
	line "about OLIVINE"
	cont "LIGHTHOUSE."

	para "The #MON that"
	line "serves as the"

	para "beacon fell ill."
	line "Sounds like they"
	cont "are in trouble."
	done
; 0x1a4325

UnknownText_0x1a4325: ; 0x1a4325
	text "The #MON at"
	line "OLIVINE LIGHTHOUSE"
	cont "has been cured."

	para "Boats can safely"
	line "sail out to sea at"
	cont "night again."
	done
; 0x1a4386

UnknownText_0x1a4386: ; 0x1a4386
	text "I hear #MON are"
	line "rampaging at the"

	para "LAKE OF RAGE. I'd"
	line "like to see that."
	done
; 0x1a43cb

UnknownText_0x1a43cb: ; 0x1a43cb
	text "In the distant"
	line "past…"

	para "This tower burned"
	line "in a fire. Three"

	para "nameless #MON"
	line "perished in it."

	para "A rainbow-colored"
	line "#MON descended"

	para "from the sky and"
	line "resurrected them…"

	para "It's a legend that"
	line "has been passed"

	para "down by ECRUTEAK"
	line "GYM LEADERS."

	para "Me?"

	para "I was a trainer"
	line "way back when."
	cont "Hohoho!"
	done
; 0x1a44d1

UnknownText_0x1a44d1: ; 0x1a44d1
	text "ECRUTEAK CITY"
	line "A Historical City"

	para "Where the Past"
	line "Meets the Present"
	done
; 0x1a4513

UnknownText_0x1a4513: ; 0x1a4513
	text "TIN TOWER"

	para "A legendary #-"
	line "MON is said to"
	cont "roost here."
	done
; 0x1a4548

UnknownText_0x1a4548: ; 0x1a4548
	text "ECRUTEAK CITY"
	line "#MON GYM"
	cont "LEADER: MORTY"

	para "The Mystic Seer of"
	line "the Future"
	done
; 0x1a458c

UnknownText_0x1a458c: ; 0x1a458c
	text "ECRUTEAK DANCE"
	line "THEATER"
	done
; 0x1a45a4

UnknownText_0x1a45a4: ; 0x1a45a4
	text "BURNED TOWER"

	para "It was destroyed"
	line "by a mysterious"
	cont "fire."

	para "Please stay away,"
	line "as it is unsafe."
	done
; 0x1a45fc

EcruteakCity_MapEventHeader: ; 0x1a45fc
	; filler
	db 0, 0

	; warps
	db 15
	warp_def $1a, $23, 1, GROUP_ROUTE_42_ECRUTEAK_GATE, MAP_ROUTE_42_ECRUTEAK_GATE
	warp_def $1b, $23, 2, GROUP_ROUTE_42_ECRUTEAK_GATE, MAP_ROUTE_42_ECRUTEAK_GATE
	warp_def $b, $12, 1, GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE
	warp_def $2, $14, 1, GROUP_WISE_TRIOS_ROOM, MAP_WISE_TRIOS_ROOM
	warp_def $3, $14, 2, GROUP_WISE_TRIOS_ROOM, MAP_WISE_TRIOS_ROOM
	warp_def $1b, $17, 1, GROUP_ECRUTEAK_POKECENTER_1F, MAP_ECRUTEAK_POKECENTER_1F
	warp_def $15, $5, 1, GROUP_ECRUTEAK_LUGIA_SPEECH_HOUSE, MAP_ECRUTEAK_LUGIA_SPEECH_HOUSE
	warp_def $15, $17, 1, GROUP_DANCE_THEATRE, MAP_DANCE_THEATRE
	warp_def $15, $1d, 2, GROUP_ECRUTEAK_MART, MAP_ECRUTEAK_MART
	warp_def $1b, $6, 1, GROUP_ECRUTEAK_GYM, MAP_ECRUTEAK_GYM
	warp_def $1b, $d, 1, GROUP_ECRUTEAK_ITEMFINDER_HOUSE, MAP_ECRUTEAK_ITEMFINDER_HOUSE
	warp_def $7, $25, 1, GROUP_TIN_TOWER_1F, MAP_TIN_TOWER_1F
	warp_def $5, $5, 1, GROUP_BURNED_TOWER_1F, MAP_BURNED_TOWER_1F
	warp_def $12, $0, 3, GROUP_ROUTE_38_ECRUTEAK_GATE, MAP_ROUTE_38_ECRUTEAK_GATE
	warp_def $13, $0, 4, GROUP_ROUTE_38_ECRUTEAK_GATE, MAP_ROUTE_38_ECRUTEAK_GATE

	; xy triggers
	db 0

	; signposts
	db 8
	signpost 21, 15, $0, MapEcruteakCitySignpost0Script
	signpost 10, 38, $0, MapEcruteakCitySignpost1Script
	signpost 28, 8, $0, MapEcruteakCitySignpost2Script
	signpost 21, 21, $0, MapEcruteakCitySignpost3Script
	signpost 10, 2, $0, MapEcruteakCitySignpost4Script
	signpost 27, 24, $0, MapEcruteakCitySignpost5Script
	signpost 21, 30, $0, MapEcruteakCitySignpost6Script
	signpost 14, 23, $7, MapEcruteakCitySignpostItem7

	; people-events
	db 7
	person_event SPRITE_GRAMPS, 19, 22, $2, $11, 255, 255, $0, 0, GrampsScript_0x1a4009, $ffff
	person_event SPRITE_GRAMPS, 25, 24, $3, $0, 255, 255, $0, 0, GrampsScript_0x1a400c, $ffff
	person_event SPRITE_LASS, 33, 25, $5, $2, 255, 255, $90, 0, LassScript_0x1a4012, $ffff
	person_event SPRITE_LASS, 13, 7, $7, $0, 255, 255, $0, 0, LassScript_0x1a4015, $ffff
	person_event SPRITE_FISHER, 26, 13, $5, $1, 255, 255, $a0, 0, FisherScript_0x1a4029, $ffff
	person_event SPRITE_YOUNGSTER, 18, 14, $2, $11, 255, 255, $80, 0, YoungsterScript_0x1a403d, $ffff
	person_event SPRITE_GRAMPS, 11, 7, $2, $11, 255, 255, $a0, 0, GrampsScript_0x1a400f, $07a9
; 0x1a46d0
