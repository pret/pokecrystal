const_value set 2
	const MAHOGANYMART1F_PHARMACIST
	const MAHOGANYMART1F_BLACK_BELT
	const MAHOGANYMART1F_LANCE
	const MAHOGANYMART1F_DRAGON
	const MAHOGANYMART1F_GRANNY

MahoganyMart1F_MapScripts:
.SceneScripts:
	db 2
	scene_script .DummyScene0
	scene_script .LanceUncoversStaircase

.MapCallbacks:
	db 1
	callback MAPCALLBACK_TILES, .MahoganyMart1FStaircase

.DummyScene0:
	end

.LanceUncoversStaircase:
	priorityjump UnknownScript_0x6c38f
	end

.MahoganyMart1FStaircase:
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	iftrue .ShowStairs
	return

.ShowStairs:
	changeblock 6, 2, $1e ; stairs
	return

PharmacistScript_0x6c367:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue UnknownScript_0x6c375
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_1
	closetext
	end

UnknownScript_0x6c375:
	writetext UnknownText_0x6c46b
	waitbutton
	closetext
	end

BlackBeltScript_0x6c37b:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue UnknownScript_0x6c389
	writetext UnknownText_0x6c494
	waitbutton
	closetext
	end

UnknownScript_0x6c389:
	writetext UnknownText_0x6c501
	waitbutton
	closetext
	end

UnknownScript_0x6c38f:
	pause 15
	opentext
	writetext UnknownText_0x6c52a
	pause 15
	closetext
	playsound SFX_TACKLE
	applymovement MAHOGANYMART1F_DRAGON, MovementData_0x6c3f6
	applymovement MAHOGANYMART1F_BLACK_BELT, MovementData_0x6c3fb
	pause 15
	disappear MAHOGANYMART1F_DRAGON
	pause 15
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c407
	opentext
	writetext UnknownText_0x6c549
	waitbutton
	closetext
	follow MAHOGANYMART1F_LANCE, PLAYER
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c40a
	applymovement MAHOGANYMART1F_PHARMACIST, MovementData_0x6c403
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c40e
	stopfollow
	opentext
	writetext UnknownText_0x6c59e
	waitbutton
	showemote EMOTE_SHOCK, MAHOGANYMART1F_PHARMACIST, 10
	playsound SFX_FAINT
	changeblock 6, 2, $1e ; stairs
	reloadmappart
	closetext
	setevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	spriteface MAHOGANYMART1F_LANCE, LEFT
	opentext
	writetext UnknownText_0x6c5ba
	waitbutton
	closetext
	applymovement MAHOGANYMART1F_LANCE, MovementData_0x6c412
	playsound SFX_EXIT_BUILDING
	disappear MAHOGANYMART1F_LANCE
	setscene 0
	waitsfx
	end

GrannyScript_0x6c3ee:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_2
	closetext
	end

MovementData_0x6c3f6:
	fix_facing
	big_step LEFT
	big_step RIGHT
	remove_fixed_facing
	step_end

MovementData_0x6c3fb:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

MovementData_0x6c403:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

MovementData_0x6c407:
	slow_step LEFT
	turn_head DOWN
	step_end

MovementData_0x6c40a:
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_0x6c40e:
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementData_0x6c412:
	slow_step RIGHT
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

MahoganyMart1F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def 3, 7, 1, MAHOGANY_TOWN
	warp_def 4, 7, 1, MAHOGANY_TOWN
	warp_def 7, 3, 1, TEAM_ROCKET_BASE_B1F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 5
	object_event 4, 3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PharmacistScript_0x6c367, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 1, 6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackBeltScript_0x6c37b, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event 4, 6, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event 3, 6, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event 1, 3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GrannyScript_0x6c3ee, EVENT_MAHOGANY_MART_OWNERS
