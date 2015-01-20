VioletPokeCenter1F_MapScriptHeader: ; 0x694c7
	; trigger count
	db 0

	; callback count
	db 0
; 0x694c9

NurseScript_0x694c9: ; 0x694c9
	jumpstd $0000
; 0x694cc

ScientistScript_0x694cc: ; 0x694cc
	faceplayer
	loadfont
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue UnknownScript_0x6953a
	writetext UnknownText_0x69555
UnknownScript_0x694d7: ; 0x694d7
	yesorno
	iffalse UnknownScript_0x69531
	checkcode $1
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
	checkcode $9
	if_equal $1, .UnknownScript_0x69511
	spriteface $0, $0
	applymovement $6, MovementData_0x69549
	playsound SFX_EXIT_BUILDING
	disappear $6
	waitbutton
	end

.UnknownScript_0x69511 ; 0x69511
	applymovement $6, MovementData_0x6954e
	spriteface $0, $0
	applymovement $6, MovementData_0x69551
	playsound SFX_EXIT_BUILDING
	disappear $6
	waitbutton
	end
; 0x69523

.eggname ; 0x69523
	db "EGG@"
; 0x69527

UnknownScript_0x69527: ; 0x69527
	jumpstd $0030
	end
; 0x6952b

UnknownScript_0x6952b: ; 0x6952b
	writetext UnknownText_0x69693
	closetext
	loadmovesprites
	end
; 0x69531

UnknownScript_0x69531: ; 0x69531
	writetext UnknownText_0x696f2
	closetext
	loadmovesprites
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end
; 0x6953a

UnknownScript_0x6953a: ; 0x6953a
	writetext UnknownText_0x69712
	jump UnknownScript_0x694d7
; 0x69540

GameboyKidScript_0x69540: ; 0x69540
	jumptextfaceplayer UnknownText_0x69809
; 0x69543

GentlemanScript_0x69543: ; 0x69543
	jumptextfaceplayer UnknownText_0x6983c
; 0x69546

YoungsterScript_0x69546: ; 0x69546
	jumptextfaceplayer UnknownText_0x698b8
; 0x69549

MovementData_0x69549: ; 0x69549
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x6954e

MovementData_0x6954e: ; 0x6954e
	step_left
	step_down
	step_end
; 0x69551

MovementData_0x69551: ; 0x69551
	step_down
	step_down
	step_down
	step_end
; 0x69555

UnknownText_0x69555: ; 0x69555
	text $14, ", long"
	line "time, no see."

	para "PROF.ELM asked me"
	line "to find you."

	para "He has another"
	line "favor to ask."

	para "Would you take the"
	line "#MON EGG?"
	done
; 0x695c5

UnknownText_0x695c5: ; 0x695c5
	text "We discovered that"
	line "a #MON will not"

	para "hatch until it"
	line "grows in the EGG."

	para "It also has to be"
	line "with other active"
	cont "#MON to hatch."

	para $14, ", you're"
	line "the only person"
	cont "we can rely on."

	para "Please call PROF."
	line "ELM when that EGG"
	cont "hatches!"
	done
; 0x69693

UnknownText_0x69693: ; 0x69693
	text "Oh, no. You can't"
	line "carry any more"
	cont "#MON with you."

	para "I'll wait here"
	line "while you make"
	cont "room for the EGG."
	done
; 0x696f2

UnknownText_0x696f2: ; 0x696f2
	text "B-but… PROF.ELM"
	line "asked for you…"
	done
; 0x69712

UnknownText_0x69712: ; 0x69712
	text $14, ", will you"
	line "take the EGG?"
	done
; 0x6972d

UnknownText_0x6972d: ; 0x6972d
	text "I've been thinking"
	line "it'd be great to"

	para "be able to link up"
	line "and battle with my"

	para "friends who live"
	line "far away."
	done
; 0x69791

UnknownText_0x69791: ; 0x69791
	text "I just battled a"
	line "friend in CIANWOOD"
	cont "over a link."

	para "If you connect a"
	line "MOBILE ADAPTER,"

	para "you can link with"
	line "a friend far away."
	done
; 0x69809

UnknownText_0x69809: ; 0x69809
	text "A guy named BILL"
	line "made the #MON"
	cont "PC storage system."
	done
; 0x6983c

UnknownText_0x6983c: ; 0x6983c
	text "It was around"
	line "three years ago."

	para "TEAM ROCKET was up"
	line "to no good with"
	cont "#MON."

	para "But justice pre-"
	line "vailed--a young"
	cont "kid broke 'em up."
	done
; 0x698b8

UnknownText_0x698b8: ; 0x698b8
	text "#MON are smart."
	line "They won't obey a"

	para "trainer they don't"
	line "respect."

	para "Without the right"
	line "GYM BADGES, they"

	para "will just do as"
	line "they please."
	done
; 0x69935

VioletPokeCenter1F_MapEventHeader: ; 0x69935
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 5, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $7, $4, 5, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x694c9, $ffff
	person_event SPRITE_GAMEBOY_KID, 10, 11, $6, $0, 255, 255, $a0, 0, GameboyKidScript_0x69540, $ffff
	person_event SPRITE_GENTLEMAN, 8, 5, $3, $0, 255, 255, $0, 0, GentlemanScript_0x69543, $ffff
	person_event SPRITE_YOUNGSTER, 5, 12, $6, $0, 255, 255, $80, 0, YoungsterScript_0x69546, $ffff
	person_event SPRITE_SCIENTIST, 7, 8, $6, $0, 255, 255, $90, 0, ScientistScript_0x694cc, $0700
; 0x6998b

