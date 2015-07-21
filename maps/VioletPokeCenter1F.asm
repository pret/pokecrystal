VioletPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x694c9:
	jumpstd pokecenternurse

ScientistScript_0x694cc:
	faceplayer
	loadfont
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue UnknownScript_0x6953a
	writetext UnknownText_0x69555
UnknownScript_0x694d7:
	yesorno
	iffalse UnknownScript_0x69531
	checkcode VAR_PARTYCOUNT
	if_equal $6, UnknownScript_0x6952b
	giveegg TOGEPI, 5
	stringtotext .eggname, $1
	scall UnknownScript_0x69527
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	domaptrigger GROUP_ROUTE_32, MAP_ROUTE_32, $1
	writetext UnknownText_0x695c5
	closetext
	loadmovesprites
	checkcode VAR_FACING
	if_equal $1, .UnknownScript_0x69511
	spriteface $0, DOWN
	applymovement $6, MovementData_0x69549
	playsound SFX_EXIT_BUILDING
	disappear $6
	waitbutton
	end

.UnknownScript_0x69511
	applymovement $6, MovementData_0x6954e
	spriteface $0, DOWN
	applymovement $6, MovementData_0x69551
	playsound SFX_EXIT_BUILDING
	disappear $6
	waitbutton
	end

.eggname
	db "EGG@"

UnknownScript_0x69527:
	jumpstd receivetogepiegg
	end

UnknownScript_0x6952b:
	writetext UnknownText_0x69693
	closetext
	loadmovesprites
	end

UnknownScript_0x69531:
	writetext UnknownText_0x696f2
	closetext
	loadmovesprites
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

UnknownScript_0x6953a:
	writetext UnknownText_0x69712
	jump UnknownScript_0x694d7

GameboyKidScript_0x69540:
	jumptextfaceplayer UnknownText_0x69809

GentlemanScript_0x69543:
	jumptextfaceplayer UnknownText_0x6983c

YoungsterScript_0x69546:
	jumptextfaceplayer UnknownText_0x698b8

MovementData_0x69549:
	step_down
	step_down
	step_down
	step_down
	step_end

MovementData_0x6954e:
	step_left
	step_down
	step_end

MovementData_0x69551:
	step_down
	step_down
	step_down
	step_end

UnknownText_0x69555:
	text "<PLAY_G>, long"
	line "time, no see."

	para "PROF.ELM asked me"
	line "to find you."

	para "He has another"
	line "favor to ask."

	para "Would you take the"
	line "#MON EGG?"
	done

UnknownText_0x695c5:
	text "We discovered that"
	line "a #MON will not"

	para "hatch until it"
	line "grows in the EGG."

	para "It also has to be"
	line "with other active"
	cont "#MON to hatch."

	para "<PLAY_G>, you're"
	line "the only person"
	cont "we can rely on."

	para "Please call PROF."
	line "ELM when that EGG"
	cont "hatches!"
	done

UnknownText_0x69693:
	text "Oh, no. You can't"
	line "carry any more"
	cont "#MON with you."

	para "I'll wait here"
	line "while you make"
	cont "room for the EGG."
	done

UnknownText_0x696f2:
	text "B-but… PROF.ELM"
	line "asked for you…"
	done

UnknownText_0x69712:
	text "<PLAY_G>, will you"
	line "take the EGG?"
	done

UnknownText_0x6972d:
	text "I've been thinking"
	line "it'd be great to"

	para "be able to link up"
	line "and battle with my"

	para "friends who live"
	line "far away."
	done

UnknownText_0x69791:
	text "I just battled a"
	line "friend in CIANWOOD"
	cont "over a link."

	para "If you connect a"
	line "MOBILE ADAPTER,"

	para "you can link with"
	line "a friend far away."
	done

UnknownText_0x69809:
	text "A guy named BILL"
	line "made the #MON"
	cont "PC storage system."
	done

UnknownText_0x6983c:
	text "It was around"
	line "three years ago."

	para "TEAM ROCKET was up"
	line "to no good with"
	cont "#MON."

	para "But justice pre-"
	line "vailed--a young"
	cont "kid broke 'em up."
	done

UnknownText_0x698b8:
	text "#MON are smart."
	line "They won't obey a"

	para "trainer they don't"
	line "respect."

	para "Without the right"
	line "GYM BADGES, they"

	para "will just do as"
	line "they please."
	done

VioletPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 5, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $7, $4, 5, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 5
	person_event SPRITE_NURSE, 5, 7, OW_UP | $2, $0, -1, -1, $0, 0, NurseScript_0x694c9, -1
	person_event SPRITE_GAMEBOY_KID, 10, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, GameboyKidScript_0x69540, -1
	person_event SPRITE_GENTLEMAN, 8, 5, OW_DOWN | $3, $0, -1, -1, $0, 0, GentlemanScript_0x69543, -1
	person_event SPRITE_YOUNGSTER, 5, 12, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, YoungsterScript_0x69546, -1
	person_event SPRITE_SCIENTIST, 7, 8, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, ScientistScript_0x694cc, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
