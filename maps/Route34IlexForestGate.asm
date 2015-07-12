Route34IlexForestGate_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x62d2d

UnknownScript_0x62d2d:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse UnknownScript_0x62d38
	disappear $2
	appear $5
	return

UnknownScript_0x62d38:
	disappear $5
	appear $2
	return

UnknownScript_0x62d3d:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse UnknownScript_0x62d62
	showemote $0, $5, 20
	spriteface $5, LEFT
	spriteface $0, RIGHT
	follow $0, $5
	applymovement $0, MovementData_0x62d97
	stopfollow
	spriteface $0, DOWN
	loadfont
	writetext UnknownText_0x62e41
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x62d9a
UnknownScript_0x62d62:
	end

TeacherScript_0x62d63:
	faceplayer
	loadfont
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue UnknownScript_0x62d84
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue UnknownScript_0x62d7e
	writetext UnknownText_0x62d9d
	keeptextopen
	verbosegiveitem TM_SWEET_SCENT, 1
	iffalse UnknownScript_0x62d82
	setevent EVENT_GOT_TM12_SWEET_SCENT
UnknownScript_0x62d7e:
	writetext UnknownText_0x62df6
	closetext
UnknownScript_0x62d82:
	loadmovesprites
	end

UnknownScript_0x62d84:
	writetext UnknownText_0x62e41
	keeptextopen
	loadmovesprites
	end

ButterfreeScript_0x62d8a:
	loadfont
	writetext UnknownText_0x62e83
	cry BUTTERFREE
	closetext
	loadmovesprites
	end

LassScript_0x62d94:
	jumptextfaceplayer UnknownText_0x62e97

MovementData_0x62d97:
	step_up
	step_up
	step_end

MovementData_0x62d9a:
	step_down
	step_right
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

	; warps
	db 4
	warp_def $0, $4, 1, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $0, $5, 2, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $7, $4, 1, GROUP_ILEX_FOREST, MAP_ILEX_FOREST
	warp_def $7, $5, 1, GROUP_ILEX_FOREST, MAP_ILEX_FOREST

	; xy triggers
	db 1
	xy_trigger 0, $7, $4, $0, UnknownScript_0x62d3d, $0, $0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_TEACHER, 7, 13, $8, $0, 255, 255, $90, 0, TeacherScript_0x62d63, EVENT_6EA
	person_event SPRITE_BUTTERFREE, 8, 13, $16, $0, 255, 255, $80, 0, ButterfreeScript_0x62d8a, EVENT_ALWAYS_THERE
	person_event SPRITE_LASS, 8, 7, $4, $10, 255, 255, $a0, 0, LassScript_0x62d94, EVENT_6EB
	person_event SPRITE_TEACHER, 11, 9, $7, $0, 255, 255, $90, 0, TeacherScript_0x62d63, EVENT_6EC
