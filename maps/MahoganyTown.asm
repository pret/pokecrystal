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
	setflag $0049
	return
; 0x190013

UnknownScript_0x190013: ; 0x190013
	showemote $0, $2, 15
	applymovement $2, MovementData_0x1900a9
	follow $0, $2
	applymovement $0, MovementData_0x1900a7
	stopfollow
	spriteface $0, $3
	scall UnknownScript_0x19002f
	applymovement $2, MovementData_0x1900ad
	end
; 0x19002e

PokefanMScript_0x19002e: ; 0x19002e
	faceplayer
UnknownScript_0x19002f: ; 0x19002f
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x190039
	scall UnknownScript_0x190040
	end
; 0x190039

UnknownScript_0x190039: ; 0x190039
	loadfont
	writetext UnknownText_0x1901a6
	closetext
	loadmovesprites
	end
; 0x190040

UnknownScript_0x190040: ; 0x190040
	loadfont
	writetext UnknownText_0x1900b0
	special Function24ae8
	yesorno
	iffalse UnknownScript_0x190072
	checkmoney $0, 300
	if_equal $2, UnknownScript_0x19006c
	giveitem RAGECANDYBAR, $1
	iffalse UnknownScript_0x190078
	waitbutton
	playsound SFX_TRANSACTION
	takemoney $0, 300
	special Function24ae8
	writetext UnknownText_0x19014a
	closetext
	loadmovesprites
	end
; 0x19006c

UnknownScript_0x19006c: ; 0x19006c
	writetext UnknownText_0x19015b
	closetext
	loadmovesprites
	end
; 0x190072

UnknownScript_0x190072: ; 0x190072
	writetext UnknownText_0x190178
	closetext
	loadmovesprites
	end
; 0x190078

UnknownScript_0x190078: ; 0x190078
	writetext UnknownText_0x190188
	closetext
	loadmovesprites
	end
; 0x19007e

GrampsScript_0x19007e: ; 0x19007e
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19008c
	writetext UnknownText_0x1901e5
	closetext
	loadmovesprites
	end
; 0x19008c

UnknownScript_0x19008c: ; 0x19008c
	writetext UnknownText_0x19021d
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
	text "Hiya, kid!"

	para "I see you're new"
	line "in MAHOGANY TOWN."

	para "Since you're new,"
	line "you should try a"

	para "yummy RAGECANDY-"
	line "BAR!"

	para "Right now, it can"
	line "be yours for just"
	cont "¥300! Want one?"
	done
; 0x19014a

UnknownText_0x19014a: ; 0x19014a
	text "Good! Savor it!"
	done
; 0x19015b

UnknownText_0x19015b: ; 0x19015b
	text "You don't have"
	line "enough money."
	done
; 0x190178

UnknownText_0x190178: ; 0x190178
	text "Oh, fine then…"
	done
; 0x190188

UnknownText_0x190188: ; 0x190188
	text "You don't have"
	line "room for this."
	done
; 0x1901a6

UnknownText_0x1901a6: ; 0x1901a6
	text "RAGECANDYBAR's"
	line "sold out."

	para "I'm packing up."
	line "Don't bother me,"
	cont "kiddo."
	done
; 0x1901e5

UnknownText_0x1901e5: ; 0x1901e5
	text "Are you off to see"
	line "the GYARADOS ram-"
	cont "page at the LAKE?"
	done
; 0x19021d

UnknownText_0x19021d: ; 0x19021d
	text "MAGIKARP have"
	line "returned to LAKE"
	cont "OF RAGE."

	para "That should be"
	line "good news for the"
	cont "anglers there."
	done
; 0x190276

UnknownText_0x190276: ; 0x190276
	text "Since you came"
	line "this far, take the"

	para "time to do some"
	line "sightseeing."

	para "You should head"
	line "north and check"

	para "out LAKE OF RAGE"
	line "right now."
	done
; 0x1902f2

UnknownText_0x1902f2: ; 0x1902f2
	text "Visit Grandma's"
	line "shop. She sells"

	para "stuff that nobody"
	line "else has."
	done
; 0x19032e

UnknownText_0x19032e: ; 0x19032e
	text "MAHOGANY TOWN"

	para "Welcome to the"
	line "Home of the Ninja"
	done
; 0x19035e

UnknownText_0x19035e: ; 0x19035e
	text "While visiting"
	line "MAHOGANY TOWN, try"
	cont "a RAGECANDYBAR!"
	done
; 0x190391

UnknownText_0x190391: ; 0x190391
	text "MAHOGANY TOWN"
	line "#MON GYM"
	cont "LEADER: PRYCE"

	para "The Teacher of"
	line "Winter's Harshness"
	done
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
