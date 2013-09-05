MahoganyTown_MapScriptHeader: ; 0x190000
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x19000d, $0000
	dw UnknownScript_0x19000e, $0000

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x19000f
; 0x19000d

UnknownScript_0x19000d: ; 0x19000d
	end
; 0x19000e

UnknownScript_0x19000e: ; 0x19000e
	end
; 0x19000f

UnknownScript_0x19000f: ; 0x19000f
	setbit2 $0049
	return
; 0x190013

UnknownScript_0x190013: ; 0x190013
	showemote $0, $2, 15
	applymovement $2, MovementData_0x1900a9
	follow $0, $2
	applymovement $0, MovementData_0x1900a7
	stopfollow
	spriteface $0, $3
	2call UnknownScript_0x19002f
	applymovement $2, MovementData_0x1900ad
	end
; 0x19002e

PokefanMScript_0x19002e: ; 0x19002e
	faceplayer
UnknownScript_0x19002f: ; 0x19002f
	checkbit1 EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x190039
	2call UnknownScript_0x190040
	end
; 0x190039

UnknownScript_0x190039: ; 0x190039
	loadfont
	2writetext UnknownText_0x1901a6
	closetext
	loadmovesprites
	end
; 0x190040

UnknownScript_0x190040: ; 0x190040
	loadfont
	2writetext UnknownText_0x1900b0
	special $0051
	yesorno
	iffalse UnknownScript_0x190072
	checkmoney $0, 300
	if_equal $2, UnknownScript_0x19006c
	giveitem RAGECANDYBAR, $1
	iffalse UnknownScript_0x190078
	waitbutton
	playsound $0022
	takemoney $0, 300
	special $0051
	2writetext UnknownText_0x19014a
	closetext
	loadmovesprites
	end
; 0x19006c

UnknownScript_0x19006c: ; 0x19006c
	2writetext UnknownText_0x19015b
	closetext
	loadmovesprites
	end
; 0x190072

UnknownScript_0x190072: ; 0x190072
	2writetext UnknownText_0x190178
	closetext
	loadmovesprites
	end
; 0x190078

UnknownScript_0x190078: ; 0x190078
	2writetext UnknownText_0x190188
	closetext
	loadmovesprites
	end
; 0x19007e

GrampsScript_0x19007e: ; 0x19007e
	faceplayer
	loadfont
	checkbit1 EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19008c
	2writetext UnknownText_0x1901e5
	closetext
	loadmovesprites
	end
; 0x19008c

UnknownScript_0x19008c: ; 0x19008c
	2writetext UnknownText_0x19021d
	closetext
	loadmovesprites
	end
; 0x190092

FisherScript_0x190092: ; 0x190092
	jumptextfaceplayer UnknownText_0x190276
; 0x190095

LassScript_0x190095: ; 0x190095
	jumptextfaceplayer UnknownText_0x1902f2
; 0x190098

MapMahoganyTownSignpost0Script: ; 0x190098
	jumptext UnknownText_0x19032e
; 0x19009b

MapMahoganyTownSignpost1Script: ; 0x19009b
	jumptext UnknownText_0x19035e
; 0x19009e

MapMahoganyTownSignpost2Script: ; 0x19009e
	jumptext UnknownText_0x190391
; 0x1900a1

MapMahoganyTownSignpost3Script: ; 0x1900a1
	jumpstd $0010
; 0x1900a4

MovementData_0x1900a4: ; 0x1900a4
	step_down
	big_step_up
	turn_head_down
MovementData_0x1900a7: ; 0x1900a7
	step_left
	step_end
; 0x1900a9

MovementData_0x1900a9: ; 0x1900a9
	step_right
	step_down
	turn_head_left
	step_end
; 0x1900ad

MovementData_0x1900ad: ; 0x1900ad
	step_up
	turn_head_down
	step_end
; 0x1900b0

UnknownText_0x1900b0: ; 0x1900b0
	db $0, "Hiya, kid!", $51
	db "I see you're new", $4f
	db "in MAHOGANY TOWN.", $51
	db "Since you're new,", $4f
	db "you should try a", $51
	db "yummy RAGECANDY-", $4f
	db "BAR!", $51
	db "Right now, it can", $4f
	db "be yours for just", $55
	db "¥300! Want one?", $57
; 0x19014a

UnknownText_0x19014a: ; 0x19014a
	db $0, "Good! Savor it!", $57
; 0x19015b

UnknownText_0x19015b: ; 0x19015b
	db $0, "You don't have", $4f
	db "enough money.", $57
; 0x190178

UnknownText_0x190178: ; 0x190178
	db $0, "Oh, fine then…", $57
; 0x190188

UnknownText_0x190188: ; 0x190188
	db $0, "You don't have", $4f
	db "room for this.", $57
; 0x1901a6

UnknownText_0x1901a6: ; 0x1901a6
	db $0, "RAGECANDYBAR's", $4f
	db "sold out.", $51
	db "I'm packing up.", $4f
	db "Don't bother me,", $55
	db "kiddo.", $57
; 0x1901e5

UnknownText_0x1901e5: ; 0x1901e5
	db $0, "Are you off to see", $4f
	db "the GYARADOS ram-", $55
	db "page at the LAKE?", $57
; 0x19021d

UnknownText_0x19021d: ; 0x19021d
	db $0, "MAGIKARP have", $4f
	db "returned to LAKE", $55
	db "OF RAGE.", $51
	db "That should be", $4f
	db "good news for the", $55
	db "anglers there.", $57
; 0x190276

UnknownText_0x190276: ; 0x190276
	db $0, "Since you came", $4f
	db "this far, take the", $51
	db "time to do some", $4f
	db "sightseeing.", $51
	db "You should head", $4f
	db "north and check", $51
	db "out LAKE OF RAGE", $4f
	db "right now.", $57
; 0x1902f2

UnknownText_0x1902f2: ; 0x1902f2
	db $0, "Visit Grandma's", $4f
	db "shop. She sells", $51
	db "stuff that nobody", $4f
	db "else has.", $57
; 0x19032e

UnknownText_0x19032e: ; 0x19032e
	db $0, "MAHOGANY TOWN", $51
	db "Welcome to the", $4f
	db "Home of the Ninja", $57
; 0x19035e

UnknownText_0x19035e: ; 0x19035e
	db $0, "While visiting", $4f
	db "MAHOGANY TOWN, try", $55
	db "a RAGECANDYBAR!", $57
; 0x190391

UnknownText_0x190391: ; 0x190391
	db $0, "MAHOGANY TOWN", $4f
	db "#MON GYM", $55
	db "LEADER: PRYCE", $51
	db "The Teacher of", $4f
	db "Winter's Harshness", $57
; 0x1903d8

MahoganyTown_MapEventHeader: ; 0x1903d8
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $7, $b, 1, GROUP_MAHOGANY_MART_1F, MAP_MAHOGANY_MART_1F
	warp_def $7, $11, 1, GROUP_MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, MAP_MAHOGANY_RED_GYARADOS_SPEECH_HOUSE
	warp_def $d, $6, 1, GROUP_MAHOGANY_GYM, MAP_MAHOGANY_GYM
	warp_def $d, $f, 1, GROUP_MAHOGANY_POKECENTER_1F, MAP_MAHOGANY_POKECENTER_1F
	warp_def $1, $9, 3, GROUP_ROUTE_43_MAHOGANY_GATE, MAP_ROUTE_43_MAHOGANY_GATE

	; xy triggers
	db 2
	xy_trigger 0, $8, $13, $0, UnknownScript_0x190013, $0, $0
	xy_trigger 0, $9, $13, $0, UnknownScript_0x190013, $0, $0

	; signposts
	db 4
	signpost 5, 1, $0, MapMahoganyTownSignpost0Script
	signpost 7, 9, $0, MapMahoganyTownSignpost1Script
	signpost 13, 3, $0, MapMahoganyTownSignpost2Script
	signpost 13, 16, $0, MapMahoganyTownSignpost3Script

	; people-events
	db 4
	person_event SPRITE_POKEFAN_M, 12, 23, $6, $0, 255, 255, $0, 0, PokefanMScript_0x19002e, $0756
	person_event SPRITE_GRAMPS, 13, 10, $5, $1, 255, 255, $0, 0, GrampsScript_0x19007e, $ffff
	person_event SPRITE_FISHER, 18, 10, $6, $0, 255, 255, $a0, 0, FisherScript_0x190092, $0757
	person_event SPRITE_LASS, 12, 16, $6, $0, 255, 255, $0, 0, LassScript_0x190095, $0736
; 0x19044f

