const_value set 2
	const GOLDENRODDEPTSTORE1F_RECEPTIONIST
	const GOLDENRODDEPTSTORE1F_POKEFAN_F
	const GOLDENRODDEPTSTORE1F_BUG_CATCHER
	const GOLDENRODDEPTSTORE1F_GENTLEMAN

GoldenrodDeptStore1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ReceptionistScript_0x55981:
	jumptextfaceplayer UnknownText_0x55993

GentlemanScript_0x55984:
	jumptextfaceplayer UnknownText_0x559b7

PokefanFScript_0x55987:
	jumptextfaceplayer UnknownText_0x55a1a

BugCatcherScript_0x5598a:
	jumptextfaceplayer UnknownText_0x55a3a

GoldenrodDeptStore1FDirectory:
	jumptext GoldenrodDeptStore1FDirectoryText

GoldenrodDeptStore1FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x55993:
	text "Welcome to GOLDEN-"
	line "ROD DEPT.STORE."
	done

UnknownText_0x559b7:
	text "The DEPT.STORE"
	line "has a decent se-"
	cont "lection."

	para "But some items"
	line "are only available"

	para "as GAME CORNER"
	line "prizes."
	done

UnknownText_0x55a1a:
	text "I'm raring to shop"
	line "again today!"
	done

UnknownText_0x55a3a:
	text "Mom's good at"
	line "bargain hunting."

	para "She always buys"
	line "stuff at lower"
	cont "prices."
	done

GoldenrodDeptStore1FDirectoryText:
	text "1F SERVICE COUNTER"

	para "2F TRAINER'S"
	line "   MARKET"

	para "3F BATTLE"
	line "   COLLECTION"

	para "4F MEDICINE BOX"

	para "5F TM CORNER"

	para "6F TRANQUIL SQUARE"

	para "ROOFTOP LOOKOUT"
	done

GoldenrodDeptStore1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $7, $7, 9, GOLDENROD_CITY
	warp_def $7, $8, 9, GOLDENROD_CITY
	warp_def $0, $f, 2, GOLDENROD_DEPT_STORE_2F
	warp_def $0, $2, 1, GOLDENROD_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 14, SIGNPOST_READ, GoldenrodDeptStore1FDirectory
	signpost 0, 3, SIGNPOST_READ, GoldenrodDeptStore1FElevatorButton

.PersonEvents:
	db 4
	person_event SPRITE_RECEPTIONIST, 1, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x55981, -1
	person_event SPRITE_POKEFAN_F, 4, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x55987, -1
	person_event SPRITE_BUG_CATCHER, 5, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BugCatcherScript_0x5598a, -1
	person_event SPRITE_GENTLEMAN, 5, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x55984, -1
