const_value set 2
	const ROUTE31VIOLETGATE_OFFICER
	const ROUTE31VIOLETGATE_COOLTRAINER_F

Route31VioletGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x197634:
	jumptextfaceplayer UnknownText_0x19763a

CooltrainerFScript_0x197637:
	jumptextfaceplayer UnknownText_0x197661

UnknownText_0x19763a:
	text "Hi there!"
	line "Did you visit"
	cont "SPROUT TOWER?"
	done

UnknownText_0x197661:
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

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OfficerScript_0x197634, -1
	person_event SPRITE_COOLTRAINER_F, 2, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x197637, -1
