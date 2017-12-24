const_value set 2
	const ROUTE31VIOLETGATE_OFFICER
	const ROUTE31VIOLETGATE_COOLTRAINER_F

Route31VioletGate_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route31VioletGateOfficerScript:
	jumptextfaceplayer Route31VioletGateOfficerText

Route31VioletGateCooltrainerFScript:
	jumptextfaceplayer Route31VioletGateCooltrainerFText

Route31VioletGateOfficerText:
	text "Hi there!"
	line "Did you visit"
	cont "SPROUT TOWER?"
	done

Route31VioletGateCooltrainerFText:
	text "I came too far"
	line "out. I'd better"
	cont "phone home!"
	done

Route31VioletGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 8, VIOLET_CITY
	warp_def $5, $0, 9, VIOLET_CITY
	warp_def $4, $9, 1, ROUTE_31
	warp_def $5, $9, 2, ROUTE_31

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 2
	object_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route31VioletGateOfficerScript, -1
	object_event SPRITE_COOLTRAINER_F, 2, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route31VioletGateCooltrainerFScript, -1
