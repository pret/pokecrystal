LavenderTown_MapScriptHeader: ; 0x1ad6db
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1ad6e0
; 0x1ad6e0

UnknownScript_0x1ad6e0: ; 0x1ad6e0
	setflag $003b
	return
; 0x1ad6e4

PokefanMScript_0x1ad6e4: ; 0x1ad6e4
	jumptextfaceplayer UnknownText_0x1ad702
; 0x1ad6e7

TeacherScript_0x1ad6e7: ; 0x1ad6e7
	jumptextfaceplayer UnknownText_0x1ad73a
; 0x1ad6ea

GrampsScript_0x1ad6ea: ; 0x1ad6ea
	jumptextfaceplayer UnknownText_0x1ad75c
; 0x1ad6ed

YoungsterScript_0x1ad6ed: ; 0x1ad6ed
	jumptextfaceplayer UnknownText_0x1ad7ac
; 0x1ad6f0

MapLavenderTownSignpost0Script: ; 0x1ad6f0
	jumptext UnknownText_0x1ad7f7
; 0x1ad6f3

MapLavenderTownSignpost1Script: ; 0x1ad6f3
	jumptext UnknownText_0x1ad81c
; 0x1ad6f6

MapLavenderTownSignpost2Script: ; 0x1ad6f6
	jumptext UnknownText_0x1ad861
; 0x1ad6f9

MapLavenderTownSignpost3Script: ; 0x1ad6f9
	jumptext UnknownText_0x1ad880
; 0x1ad6fc

MapLavenderTownSignpost4Script: ; 0x1ad6fc
	jumpstd pokecentersign
; 0x1ad6ff

MapLavenderTownSignpost5Script: ; 0x1ad6ff
	jumpstd martsign
; 0x1ad702

UnknownText_0x1ad702: ; 0x1ad702
	text "That's quite some"
	line "building, eh?"

	para "It's KANTO's RADIO"
	line "TOWER."
	done
; 0x1ad73a

UnknownText_0x1ad73a: ; 0x1ad73a
	text "KANTO has many"
	line "good radio shows."
	done
; 0x1ad75c

UnknownText_0x1ad75c: ; 0x1ad75c
	text "People come from"
	line "all over to pay"

	para "their respects to"
	line "the departed souls"
	cont "of #MON."
	done
; 0x1ad7ac

UnknownText_0x1ad7ac: ; 0x1ad7ac
	text "You need a #"
	line "FLUTE to wake"
	cont "sleeping #MON."

	para "Every trainer has"
	line "to know that!"
	done
; 0x1ad7f7

UnknownText_0x1ad7f7: ; 0x1ad7f7
	text "LAVENDER TOWN"

	para "The Noble Purple"
	line "Town"
	done
; 0x1ad81c

UnknownText_0x1ad81c: ; 0x1ad81c
	text "KANTO RADIO"
	line "STATION"

	para "Your Favorite"
	line "Programs On-Air"
	cont "Around the Clock!"
	done
; 0x1ad861

UnknownText_0x1ad861: ; 0x1ad861
	text "LAVENDER VOLUNTEER"
	line "#MON HOUSE"
	done
; 0x1ad880

UnknownText_0x1ad880: ; 0x1ad880
	text "SOUL HOUSE"

	para "May the Souls of"
	line "#MON Rest Easy"
	done
; 0x1ad8ac

LavenderTown_MapEventHeader: ; 0x1ad8ac
	; filler
	db 0, 0

	; warps
	db 7
	warp_def $5, $5, 1, GROUP_LAVENDER_POKECENTER_1F, MAP_LAVENDER_POKECENTER_1F
	warp_def $9, $5, 1, GROUP_MR_FUJIS_HOUSE, MAP_MR_FUJIS_HOUSE
	warp_def $d, $3, 1, GROUP_LAVENDER_TOWN_SPEECH_HOUSE, MAP_LAVENDER_TOWN_SPEECH_HOUSE
	warp_def $d, $7, 1, GROUP_LAVENDER_NAME_RATER, MAP_LAVENDER_NAME_RATER
	warp_def $5, $1, 2, GROUP_LAVENDER_MART, MAP_LAVENDER_MART
	warp_def $b, $d, 1, GROUP_SOUL_HOUSE, MAP_SOUL_HOUSE
	warp_def $5, $e, 1, GROUP_LAV_RADIO_TOWER_1F, MAP_LAV_RADIO_TOWER_1F

	; xy triggers
	db 0

	; signposts
	db 6
	signpost 3, 11, $0, MapLavenderTownSignpost0Script
	signpost 7, 15, $0, MapLavenderTownSignpost1Script
	signpost 9, 3, $0, MapLavenderTownSignpost2Script
	signpost 13, 15, $0, MapLavenderTownSignpost3Script
	signpost 5, 6, $0, MapLavenderTownSignpost4Script
	signpost 5, 2, $0, MapLavenderTownSignpost5Script

	; people-events
	db 4
	person_event SPRITE_POKEFAN_M, 11, 16, $5, $1, 255, 255, $80, 0, PokefanMScript_0x1ad6e4, $ffff
	person_event SPRITE_TEACHER, 19, 6, $5, $1, 255, 255, $90, 0, TeacherScript_0x1ad6e7, $ffff
	person_event SPRITE_GRAMPS, 16, 18, $7, $0, 255, 255, $0, 0, GrampsScript_0x1ad6ea, $ffff
	person_event SPRITE_YOUNGSTER, 15, 10, $5, $1, 255, 255, $a0, 1, YoungsterScript_0x1ad6ed, $ffff
; 0x1ad927
