MahoganyMart1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x6c356, $0000
	dw UnknownScript_0x6c357, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, UnknownScript_0x6c35b

UnknownScript_0x6c356:
	end

UnknownScript_0x6c357:
	priorityjump UnknownScript_0x6c38f
	end

UnknownScript_0x6c35b:
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	iftrue UnknownScript_0x6c362
	return

UnknownScript_0x6c362:
	changeblock $6, $2, $1e
	return

PharmacistScript_0x6c367:
	faceplayer
	loadfont
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue UnknownScript_0x6c375
	pokemart $0, $000f
	loadmovesprites
	end

UnknownScript_0x6c375:
	writetext UnknownText_0x6c46b
	closetext
	loadmovesprites
	end

BlackBeltScript_0x6c37b:
	faceplayer
	loadfont
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue UnknownScript_0x6c389
	writetext UnknownText_0x6c494
	closetext
	loadmovesprites
	end

UnknownScript_0x6c389:
	writetext UnknownText_0x6c501
	closetext
	loadmovesprites
	end

UnknownScript_0x6c38f:
	pause 15
	loadfont
	writetext UnknownText_0x6c52a
	pause 15
	loadmovesprites
	playsound SFX_TACKLE
	applymovement $5, MovementData_0x6c3f6
	applymovement $3, MovementData_0x6c3fb
	pause 15
	disappear $5
	pause 15
	applymovement $4, MovementData_0x6c407
	loadfont
	writetext UnknownText_0x6c549
	closetext
	loadmovesprites
	follow $4, $0
	applymovement $4, MovementData_0x6c40a
	applymovement $2, MovementData_0x6c403
	applymovement $4, MovementData_0x6c40e
	stopfollow
	loadfont
	writetext UnknownText_0x6c59e
	closetext
	showemote EMOTE_SHOCK, $2, 10
	playsound SFX_UNKNOWN_2A
	changeblock $6, $2, $1e
	reloadmappart
	loadmovesprites
	setevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	spriteface $4, LEFT
	loadfont
	writetext UnknownText_0x6c5ba
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x6c412
	playsound SFX_EXIT_BUILDING
	disappear $4
	dotrigger $0
	waitbutton
	end

GrannyScript_0x6c3ee:
	faceplayer
	loadfont
	pokemart $0, $0010
	loadmovesprites
	end

MovementData_0x6c3f6:
	fix_facing
	big_step_left
	big_step_right
	remove_fixed_facing
	step_end

MovementData_0x6c3fb:
	fix_facing
	big_step_left
	remove_fixed_facing
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_end

MovementData_0x6c403:
	fix_facing
	big_step_left
	remove_fixed_facing
	step_end

MovementData_0x6c407:
	slow_step_left
	turn_head_down
	step_end

MovementData_0x6c40a:
	slow_step_right
	slow_step_up
	slow_step_up
	step_end

MovementData_0x6c40e:
	slow_step_up
	slow_step_right
	slow_step_right
	step_end

MovementData_0x6c412:
	slow_step_right
	step_end

UnknownText_0x6c414:
	text "Hello, kiddo!"

	para "How would you like"
	line "some RAGECANDYBAR?"

	para "It's the thing to"
	line "eat in MAHOGANY!"
	done

UnknownText_0x6c46b:
	text "Arrgh… You found"
	line "the secret stair-"
	cont "way…"
	done

UnknownText_0x6c494:
	text "Heheh! The experi-"
	line "ment worked like a"
	cont "charm."

	para "MAGIKARP are just"
	line "worthless, but"

	para "GYARADOS are big"
	line "moneymakers."
	done

UnknownText_0x6c501:
	text "Urrgh…"

	para "That guy's dragon"
	line "#MON are tough…"
	done

UnknownText_0x6c52a:
	text "LANCE: DRAGONITE,"
	line "HYPER BEAM."
	done

UnknownText_0x6c549:
	text "What took you,"
	line "<PLAY_G>?"

	para "Just as I thought,"
	line "that strange radio"

	para "signal is coming"
	line "from here."
	done

UnknownText_0x6c59e:
	text "The stairs are"
	line "right here."
	done

UnknownText_0x6c5ba:
	text "LANCE: <PLAY_G>, we"
	line "should split up to"

	para "check this place."
	line "I'll go first."
	done

MahoganyMart1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 1, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $7, $4, 1, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $3, $7, 1, GROUP_TEAM_ROCKET_BASE_B1F, MAP_TEAM_ROCKET_BASE_B1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 5
	person_event SPRITE_PHARMACIST, 7, 8, OW_UP | $2, $0, -1, -1, $0, 0, PharmacistScript_0x6c367, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_BLACK_BELT, 10, 5, OW_DOWN | $3, $0, -1, -1, $0, 0, BlackBeltScript_0x6c37b, EVENT_TEAM_ROCKET_BASE_POPULATION
	person_event SPRITE_LANCE, 10, 8, OW_LEFT | $0, $0, -1, -1, $0, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	person_event SPRITE_DRAGON, 10, 7, OW_LEFT | $0, $0, -1, -1, $0, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	person_event SPRITE_GRANNY, 7, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, GrannyScript_0x6c3ee, EVENT_MAHOGANY_MART_OWNERS
