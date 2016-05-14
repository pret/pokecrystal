const_value set 2
	const ROUTE34ILEXFORESTGATE_TEACHER1
	const ROUTE34ILEXFORESTGATE_BUTTERFREE
	const ROUTE34ILEXFORESTGATE_LASS
	const ROUTE34ILEXFORESTGATE_TEACHER2

Route34IlexForestGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, UnknownScript_0x62d2d

UnknownScript_0x62d2d:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse UnknownScript_0x62d38
	disappear ROUTE34ILEXFORESTGATE_TEACHER1
	appear ROUTE34ILEXFORESTGATE_TEACHER2
	return

UnknownScript_0x62d38:
	disappear ROUTE34ILEXFORESTGATE_TEACHER2
	appear ROUTE34ILEXFORESTGATE_TEACHER1
	return

UnknownScript_0x62d3d:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse UnknownScript_0x62d62
	showemote EMOTE_SHOCK, ROUTE34ILEXFORESTGATE_TEACHER2, 20
	spriteface ROUTE34ILEXFORESTGATE_TEACHER2, LEFT
	spriteface PLAYER, RIGHT
	follow PLAYER, ROUTE34ILEXFORESTGATE_TEACHER2
	applymovement PLAYER, MovementData_0x62d97
	stopfollow
	spriteface PLAYER, DOWN
	opentext
	writetext UnknownText_0x62e41
	waitbutton
	closetext
	applymovement ROUTE34ILEXFORESTGATE_TEACHER2, MovementData_0x62d9a
UnknownScript_0x62d62:
	end

TeacherScript_0x62d63:
	faceplayer
	opentext
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue UnknownScript_0x62d84
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue UnknownScript_0x62d7e
	writetext UnknownText_0x62d9d
	buttonsound
	verbosegiveitem TM_SWEET_SCENT
	iffalse UnknownScript_0x62d82
	setevent EVENT_GOT_TM12_SWEET_SCENT
UnknownScript_0x62d7e:
	writetext UnknownText_0x62df6
	waitbutton
UnknownScript_0x62d82:
	closetext
	end

UnknownScript_0x62d84:
	writetext UnknownText_0x62e41
	buttonsound
	closetext
	end

IlexGateButterfree:
	opentext
	writetext UnknownText_0x62e83
	cry BUTTERFREE
	waitbutton
	closetext
	end

LassScript_0x62d94:
	jumptextfaceplayer UnknownText_0x62e97

MovementData_0x62d97:
	step UP
	step UP
	step_end

MovementData_0x62d9a:
	step DOWN
	step RIGHT
	step_end

UnknownText_0x62d9d:
	text "Oh, honey. You're"
	line "making a #DEX?"

	para "It must be hard if"
	line "#MON won't"

	para "appear. Try using"
	line "this TM."
	done

UnknownText_0x62df6:
	text "It's SWEET SCENT."

	para "Use it wherever"
	line "#MON appear."

	para "#MON will be"
	line "enticed by it."
	done

UnknownText_0x62e41:
	text "Something's wrong"
	line "in ILEX FOREST…"

	para "You should stay"
	line "away right now."
	done

UnknownText_0x62e83:
	text "BUTTERFREE: Freeh!"
	done

UnknownText_0x62e97:
	text "Did you see the"
	line "shrine honoring"
	cont "the protector?"

	para "It watches over"
	line "the FOREST from"
	cont "across time."

	para "I think that it"
	line "must be a grass-"
	cont "type #MON."
	done

Route34IlexForestGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 1, ROUTE_34
	warp_def $0, $5, 2, ROUTE_34
	warp_def $7, $4, 1, ILEX_FOREST
	warp_def $7, $5, 1, ILEX_FOREST

.XYTriggers:
	db 1
	xy_trigger 0, $7, $4, $0, UnknownScript_0x62d3d, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_TEACHER, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x62d63, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_BEHIND_COUNTER
	person_event SPRITE_BUTTERFREE, 4, 9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, IlexGateButterfree, -1
	person_event SPRITE_LASS, 4, 3, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x62d94, EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	person_event SPRITE_TEACHER, 7, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x62d63, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY
