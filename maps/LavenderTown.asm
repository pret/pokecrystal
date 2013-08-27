LavenderTown_MapScriptHeader: ; 0x1ad6db
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1ad6e0
; 0x1ad6e0

UnknownScript_0x1ad6e0: ; 0x1ad6e0
	setbit2 $003b
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
	jumpstd $0010
; 0x1ad6ff

MapLavenderTownSignpost5Script: ; 0x1ad6ff
	jumpstd $0011
; 0x1ad702

UnknownText_0x1ad702: ; 0x1ad702
	db $0, "That's quite some", $4f
	db "building, eh?", $51
	db "It's KANTO's RADIO", $4f
	db "TOWER.", $57
; 0x1ad73a

UnknownText_0x1ad73a: ; 0x1ad73a
	db $0, "KANTO has many", $4f
	db "good radio shows.", $57
; 0x1ad75c

UnknownText_0x1ad75c: ; 0x1ad75c
	db $0, "People come from", $4f
	db "all over to pay", $51
	db "their respects to", $4f
	db "the departed souls", $55
	db "of #MON.", $57
; 0x1ad7ac

UnknownText_0x1ad7ac: ; 0x1ad7ac
	db $0, "You need a #", $4f
	db "FLUTE to wake", $55
	db "sleeping #MON.", $51
	db "Every trainer has", $4f
	db "to know that!", $57
; 0x1ad7f7

UnknownText_0x1ad7f7: ; 0x1ad7f7
	db $0, "LAVENDER TOWN", $51
	db "The Noble Purple", $4f
	db "Town", $57
; 0x1ad81c

UnknownText_0x1ad81c: ; 0x1ad81c
	db $0, "KANTO RADIO", $4f
	db "STATION", $51
	db "Your Favorite", $4f
	db "Programs On-Air", $55
	db "Around the Clock!", $57
; 0x1ad861

UnknownText_0x1ad861: ; 0x1ad861
	db $0, "LAVENDER VOLUNTEER", $4f
	db "#MON HOUSE", $57
; 0x1ad880

UnknownText_0x1ad880: ; 0x1ad880
	db $0, "SOUL HOUSE", $51
	db "May the Souls of", $4f
	db "#MON Rest Easy", $57
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

