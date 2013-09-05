EcruteakCity_MapScriptHeader: ; 0x1a4000
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a4005
; 0x1a4005

UnknownScript_0x1a4005: ; 0x1a4005
	setbit2 $0048
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
	checkbit1 EVENT_RELEASED_THE_BEASTS
	iftrue UnknownScript_0x1a4023
	2writetext UnknownText_0x1a421a
	closetext
	loadmovesprites
	end
; 0x1a4023

UnknownScript_0x1a4023: ; 0x1a4023
	2writetext UnknownText_0x1a4269
	closetext
	loadmovesprites
	end
; 0x1a4029

FisherScript_0x1a4029: ; 0x1a4029
	faceplayer
	loadfont
	checkbit1 EVENT_JASMINE_RETURNED_TO_GYM
	iftrue UnknownScript_0x1a4037
	2writetext UnknownText_0x1a42ac
	closetext
	loadmovesprites
	end
; 0x1a4037

UnknownScript_0x1a4037: ; 0x1a4037
	2writetext UnknownText_0x1a4325
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
	jumpstd $0010
; 0x1a4052

MapEcruteakCitySignpost6Script: ; 0x1a4052
	jumpstd $0011
; 0x1a4055

MapEcruteakCitySignpostItem7: ; 0x1a4055
	dw $00b4
	db HYPER_POTION
	
; 0x1a4058

UnusedMissingDaughterText: ; 0x1a4058
; This text is neither used nor referenced in the final game.
	db $0, "Oh, no. Oh, no…",$51
	db "My daughter is", $4f
	db "missing.", $51
	db "No… She couldn't", $4f
	db "have gone to the", $55
	db "BURNED TOWER.", $51
	db "I told her not to", $4f
	db "go near it…", $51
	db "People seem to", $4f
	db "disappear there…", $51
	db "Oh, what should I", $4f
	db "do…?", $57

UnknownText_0x1a4105: ; 0x1a4105
	db $0, "ECRUTEAK used to", $4f
	db "have two towers:", $51
	db "one each in the", $4f
	db "east and west.", $57
; 0x1a4147

UnknownText_0x1a4147: ; 0x1a4147
	db $0, "Ah, child.", $4f
	db "Have you learned", $51
	db "to dance like the", $4f
	db "KIMONO GIRLS?", $51
	db "If you go to their", $4f
	db "DANCE THEATER, an", $51
	db "odd old man will", $4f
	db "give you something", $55
	db "nice, I hear.", $57
; 0x1a41db

UnknownText_0x1a41db: ; 0x1a41db
	db $0, "I'm going to prac-", $4f
	db "tice at the DANCE", $51
	db "THEATER. Care to", $4f
	db "join me?", $57
; 0x1a421a

UnknownText_0x1a421a: ; 0x1a421a
	db $0, "The tower that", $4f
	db "used to be here…", $51
	db "My grandma told me", $4f
	db "it used to be much", $55
	db "taller.", $57
; 0x1a4269

UnknownText_0x1a4269: ; 0x1a4269
	db $0, "Three big #MON", $4f
	db "ran off in differ-", $55
	db "ent directions.", $55
	db "What were they?", $57
; 0x1a42ac

UnknownText_0x1a42ac: ; 0x1a42ac
	db $0, "I heard a rumor", $4f
	db "about OLIVINE", $55
	db "LIGHTHOUSE.", $51
	db "The #MON that", $4f
	db "serves as the", $51
	db "beacon fell ill.", $4f
	db "Sounds like they", $55
	db "are in trouble.", $57
; 0x1a4325

UnknownText_0x1a4325: ; 0x1a4325
	db $0, "The #MON at", $4f
	db "OLIVINE LIGHTHOUSE", $55
	db "has been cured.", $51
	db "Boats can safely", $4f
	db "sail out to sea at", $55
	db "night again.", $57
; 0x1a4386

UnknownText_0x1a4386: ; 0x1a4386
	db $0, "I hear #MON are", $4f
	db "rampaging at the", $51
	db "LAKE OF RAGE. I'd", $4f
	db "like to see that.", $57
; 0x1a43cb

UnknownText_0x1a43cb: ; 0x1a43cb
	db $0, "In the distant", $4f
	db "past…", $51
	db "This tower burned", $4f
	db "in a fire. Three", $51
	db "nameless #MON", $4f
	db "perished in it.", $51
	db "A rainbow-colored", $4f
	db "#MON descended", $51
	db "from the sky and", $4f
	db "resurrected them…", $51
	db "It's a legend that", $4f
	db "has been passed", $51
	db "down by ECRUTEAK", $4f
	db "GYM LEADERS.", $51
	db "Me?", $51
	db "I was a trainer", $4f
	db "way back when.", $55
	db "Hohoho!", $57
; 0x1a44d1

UnknownText_0x1a44d1: ; 0x1a44d1
	db $0, "ECRUTEAK CITY", $4f
	db "A Historical City", $51
	db "Where the Past", $4f
	db "Meets the Present", $57
; 0x1a4513

UnknownText_0x1a4513: ; 0x1a4513
	db $0, "TIN TOWER", $51
	db "A legendary #-", $4f
	db "MON is said to", $55
	db "roost here.", $57
; 0x1a4548

UnknownText_0x1a4548: ; 0x1a4548
	db $0, "ECRUTEAK CITY", $4f
	db "#MON GYM", $55
	db "LEADER: MORTY", $51
	db "The Mystic Seer of", $4f
	db "the Future", $57
; 0x1a458c

UnknownText_0x1a458c: ; 0x1a458c
	db $0, "ECRUTEAK DANCE", $4f
	db "THEATER", $57
; 0x1a45a4

UnknownText_0x1a45a4: ; 0x1a45a4
	db $0, "BURNED TOWER", $51
	db "It was destroyed", $4f
	db "by a mysterious", $55
	db "fire.", $51
	db "Please stay away,", $4f
	db "as it is unsafe.", $57
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

