MahoganyTown_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000

.MapCallbacks:
	db 1

	; callbacks
	dbw 5, .FlyPoint

.Trigger1
	end

.Trigger2
	end

.FlyPoint
	setflag ENGINE_FLYPOINT_MAHOGANY
	return

UnknownScript_0x190013:
	showemote EMOTE_SHOCK, $2, 15
	applymovement $2, MovementData_0x1900a9
	follow $0, $2
	applymovement $0, MovementData_0x1900a7
	stopfollow
	spriteface $0, RIGHT
	scall UnknownScript_0x19002f
	applymovement $2, MovementData_0x1900ad
	end

PokefanMScript_0x19002e:
	faceplayer
UnknownScript_0x19002f:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x190039
	scall UnknownScript_0x190040
	end

UnknownScript_0x190039:
	loadfont
	writetext UnknownText_0x1901a6
	closetext
	loadmovesprites
	end

UnknownScript_0x190040:
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

UnknownScript_0x19006c:
	writetext UnknownText_0x19015b
	closetext
	loadmovesprites
	end

UnknownScript_0x190072:
	writetext UnknownText_0x190178
	closetext
	loadmovesprites
	end

UnknownScript_0x190078:
	writetext UnknownText_0x190188
	closetext
	loadmovesprites
	end

GrampsScript_0x19007e:
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19008c
	writetext UnknownText_0x1901e5
	closetext
	loadmovesprites
	end

UnknownScript_0x19008c:
	writetext UnknownText_0x19021d
	closetext
	loadmovesprites
	end

FisherScript_0x190092:
	jumptextfaceplayer UnknownText_0x190276

LassScript_0x190095:
	jumptextfaceplayer UnknownText_0x1902f2

MahoganyTownSign:
	jumptext MahoganyTownSignText

MahoganyTownRagecandybarSign:
	jumptext MahoganyTownRagecandybarSignText

MahoganyGymSign:
	jumptext MahoganyGymSignText

MahoganyTownPokeCenterSign:
	jumpstd pokecentersign

MovementData_0x1900a4:
	step_down
	big_step_up
	turn_head_down
MovementData_0x1900a7:
	step_left
	step_end

MovementData_0x1900a9:
	step_right
	step_down
	turn_head_left
	step_end

MovementData_0x1900ad:
	step_up
	turn_head_down
	step_end

UnknownText_0x1900b0:
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

UnknownText_0x19014a:
	text "Good! Savor it!"
	done

UnknownText_0x19015b:
	text "You don't have"
	line "enough money."
	done

UnknownText_0x190178:
	text "Oh, fine then…"
	done

UnknownText_0x190188:
	text "You don't have"
	line "room for this."
	done

UnknownText_0x1901a6:
	text "RAGECANDYBAR's"
	line "sold out."

	para "I'm packing up."
	line "Don't bother me,"
	cont "kiddo."
	done

UnknownText_0x1901e5:
	text "Are you off to see"
	line "the GYARADOS ram-"
	cont "page at the LAKE?"
	done

UnknownText_0x19021d:
	text "MAGIKARP have"
	line "returned to LAKE"
	cont "OF RAGE."

	para "That should be"
	line "good news for the"
	cont "anglers there."
	done

UnknownText_0x190276:
	text "Since you came"
	line "this far, take the"

	para "time to do some"
	line "sightseeing."

	para "You should head"
	line "north and check"

	para "out LAKE OF RAGE"
	line "right now."
	done

UnknownText_0x1902f2:
	text "Visit Grandma's"
	line "shop. She sells"

	para "stuff that nobody"
	line "else has."
	done

MahoganyTownSignText:
	text "MAHOGANY TOWN"

	para "Welcome to the"
	line "Home of the Ninja"
	done

MahoganyTownRagecandybarSignText:
	text "While visiting"
	line "MAHOGANY TOWN, try"
	cont "a RAGECANDYBAR!"
	done

MahoganyGymSignText:
	text "MAHOGANY TOWN"
	line "#MON GYM"
	cont "LEADER: PRYCE"

	para "The Teacher of"
	line "Winter's Harshness"
	done

MahoganyTown_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $7, $b, 1, GROUP_MAHOGANY_MART_1F, MAP_MAHOGANY_MART_1F
	warp_def $7, $11, 1, GROUP_MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, MAP_MAHOGANY_RED_GYARADOS_SPEECH_HOUSE
	warp_def $d, $6, 1, GROUP_MAHOGANY_GYM, MAP_MAHOGANY_GYM
	warp_def $d, $f, 1, GROUP_MAHOGANY_POKECENTER_1F, MAP_MAHOGANY_POKECENTER_1F
	warp_def $1, $9, 3, GROUP_ROUTE_43_MAHOGANY_GATE, MAP_ROUTE_43_MAHOGANY_GATE

.XYTriggers:
	db 2
	xy_trigger 0, $8, $13, $0, UnknownScript_0x190013, $0, $0
	xy_trigger 0, $9, $13, $0, UnknownScript_0x190013, $0, $0

.Signposts:
	db 4
	signpost 5, 1, SIGNPOST_READ, MahoganyTownSign
	signpost 7, 9, SIGNPOST_READ, MahoganyTownRagecandybarSign
	signpost 13, 3, SIGNPOST_READ, MahoganyGymSign
	signpost 13, 16, SIGNPOST_READ, MahoganyTownPokeCenterSign

.PersonEvents:
	db 4
	person_event SPRITE_POKEFAN_M, 12, 23, OW_UP | $2, $0, -1, -1, $0, 0, PokefanMScript_0x19002e, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	person_event SPRITE_GRAMPS, 13, 10, OW_UP | $1, $1, -1, -1, $0, 0, GrampsScript_0x19007e, -1
	person_event SPRITE_FISHER, 18, 10, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, FisherScript_0x190092, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	person_event SPRITE_LASS, 12, 16, OW_UP | $2, $0, -1, -1, $0, 0, LassScript_0x190095, EVENT_MAHOGANY_MART_OWNERS
