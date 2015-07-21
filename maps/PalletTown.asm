PalletTown_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw 5, .FlyPoint

.FlyPoint
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
	warp_def $5, $5, 1, GROUP_REDS_HOUSE_1F, MAP_REDS_HOUSE_1F
	warp_def $5, $d, 1, GROUP_BLUES_HOUSE, MAP_BLUES_HOUSE
	warp_def $b, $c, 1, GROUP_OAKS_LAB, MAP_OAKS_LAB

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
	person_event SPRITE_TEACHER, 12, 7, OW_DOWN | $2, $22, -1, -1, $0, 0, TeacherScript_0x1ac6d5, -1
	person_event SPRITE_FISHER, 18, 16, OW_UP | $1, $2, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, FisherScript_0x1ac6d8, -1
