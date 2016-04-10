const_value set 2
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER

PalletTown_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PALLET
	return

TeacherScript_0x1ac6d5:
	jumptextfaceplayer UnknownText_0x1ac6e7

FisherScript_0x1ac6d8:
	jumptextfaceplayer UnknownText_0x1ac720

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

UnknownText_0x1ac6e7:
	text "I'm raising #-"
	line "MON too."

	para "They serve as my"
	line "private guards."
	done

UnknownText_0x1ac720:
	text "Technology is"
	line "incredible!"

	para "You can now trade"
	line "#MON across"
	cont "time like e-mail."
	done

PalletTownSignText:
	text "PALLET TOWN"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done

RedsHouseSignText:
	text "RED'S HOUSE"
	done

OaksLabSignText:
	text "OAK #MON"
	line "RESEARCH LAB"
	done

BluesHouseSignText:
	text "BLUE'S HOUSE"
	done

PalletTown_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $5, $5, 1, REDS_HOUSE_1F
	warp_def $5, $d, 1, BLUES_HOUSE
	warp_def $b, $c, 1, OAKS_LAB

.XYTriggers:
	db 0

.Signposts:
	db 4
	signpost 9, 7, SIGNPOST_READ, PalletTownSign
	signpost 5, 3, SIGNPOST_READ, RedsHouseSign
	signpost 13, 13, SIGNPOST_READ, OaksLabSign
	signpost 5, 11, SIGNPOST_READ, BluesHouseSign

.PersonEvents:
	db 2
	person_event SPRITE_TEACHER, 8, 3, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1ac6d5, -1
	person_event SPRITE_FISHER, 14, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x1ac6d8, -1
