const_value set 2
	const GOLDENRODDEPTSTORE1F_RECEPTIONIST
	const GOLDENRODDEPTSTORE1F_POKEFAN_F
	const GOLDENRODDEPTSTORE1F_BUG_CATCHER
	const GOLDENRODDEPTSTORE1F_GENTLEMAN

GoldenrodDeptStore1F_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

GoldenrodDeptStore1FReceptionistScript:
	jumptextfaceplayer GoldenrodDeptStore1FReceptionistText

GoldenrodDeptStore1FGentlemanScript:
	jumptextfaceplayer GoldenrodDeptStore1FGentlemanText

GoldenrodDeptStore1FPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStore1FPokefanFText

GoldenrodDeptStore1FBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStore1FBugCatcherText

GoldenrodDeptStore1FDirectory:
	jumptext GoldenrodDeptStore1FDirectoryText

GoldenrodDeptStore1FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore1FReceptionistText:
	text "Welcome to GOLDEN-"
	line "ROD DEPT.STORE."
	done

GoldenrodDeptStore1FGentlemanText:
	text "The DEPT.STORE"
	line "has a decent se-"
	cont "lection."

	para "But some items"
	line "are only available"

	para "as GAME CORNER"
	line "prizes."
	done

GoldenrodDeptStore1FPokefanFText:
	text "I'm raring to shop"
	line "again today!"
	done

GoldenrodDeptStore1FBugCatcherText:
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

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 0, 14, BGEVENT_READ, GoldenrodDeptStore1FDirectory
	bg_event 0, 3, BGEVENT_READ, GoldenrodDeptStore1FElevatorButton

.ObjectEvents:
	db 4
	object_event SPRITE_RECEPTIONIST, 1, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FReceptionistScript, -1
	object_event SPRITE_POKEFAN_F, 4, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FPokefanFScript, -1
	object_event SPRITE_BUG_CATCHER, 5, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FBugCatcherScript, -1
	object_event SPRITE_GENTLEMAN, 5, 11, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStore1FGentlemanScript, -1
