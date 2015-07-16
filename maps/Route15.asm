Route15_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerTeacherColette:
	; bit/flag number
	dw EVENT_BEAT_TEACHER_COLETTE

	; trainer group && trainer id
	db TEACHER, COLETTE

	; text when seen
	dw TeacherColetteSeenText

	; text when trainer beaten
	dw TeacherColetteBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TeacherColetteScript

TeacherColetteScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aa60d
	closetext
	loadmovesprites
	end

TrainerTeacherHillary:
	; bit/flag number
	dw EVENT_BEAT_TEACHER_HILLARY

	; trainer group && trainer id
	db TEACHER, HILLARY

	; text when seen
	dw TeacherHillarySeenText

	; text when trainer beaten
	dw TeacherHillaryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TeacherHillaryScript

TeacherHillaryScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aa6ca
	closetext
	loadmovesprites
	end

TrainerSchoolboyKipp:
	; bit/flag number
	dw EVENT_BEAT_SCHOOLBOY_KIP

	; trainer group && trainer id
	db SCHOOLBOY, KIPP

	; text when seen
	dw SchoolboyKippSeenText

	; text when trainer beaten
	dw SchoolboyKippBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyKippScript

SchoolboyKippScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aa740
	closetext
	loadmovesprites
	end

TrainerSchoolboyTommy:
	; bit/flag number
	dw EVENT_BEAT_SCHOOLBOY_TOMMY

	; trainer group && trainer id
	db SCHOOLBOY, TOMMY

	; text when seen
	dw SchoolboyTommySeenText

	; text when trainer beaten
	dw SchoolboyTommyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyTommyScript

SchoolboyTommyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aa7bc
	closetext
	loadmovesprites
	end

TrainerSchoolboyJohnny:
	; bit/flag number
	dw EVENT_BEAT_SCHOOLBOY_JOHNNY

	; trainer group && trainer id
	db SCHOOLBOY, JOHNNY

	; text when seen
	dw SchoolboyJohnnySeenText

	; text when trainer beaten
	dw SchoolboyJohnnyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyJohnnyScript

SchoolboyJohnnyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aa84a
	closetext
	loadmovesprites
	end

TrainerSchoolboyBilly:
	; bit/flag number
	dw EVENT_BEAT_SCHOOLBOY_BILLY

	; trainer group && trainer id
	db SCHOOLBOY, BILLY

	; text when seen
	dw SchoolboyBillySeenText

	; text when trainer beaten
	dw SchoolboyBillyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyBillyScript

SchoolboyBillyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aa8b0
	closetext
	loadmovesprites
	end

MapRoute15Signpost0Script:
	jumptext UnknownText_0x1aa8e3

ItemFragment_0x1aa5e4:
	db PP_UP, 1

TeacherColetteSeenText:
	text "Have you forgotten"
	line "anything?"
	done

TeacherColetteBeatenText:
	text "Kyaaah!"
	done

UnknownText_0x1aa60d:
	text "Before I became a"
	line "teacher, I used to"

	para "forget a lot of"
	line "things."
	done

TeacherHillarySeenText:
	text "On sunny days, I"
	line "think that the"

	para "kids would rather"
	line "be playing in the"

	para "schoolyard than"
	line "studying in class."
	done

TeacherHillaryBeatenText:
	text "I didn't want to"
	line "lose…"
	done

UnknownText_0x1aa6ca:
	text "Studying is impor-"
	line "tant, but exercise"
	cont "is just as vital."
	done

SchoolboyKippSeenText:
	text "Hang on. I have to"
	line "phone my mom."
	done

SchoolboyKippBeatenText:
	text "Sorry, Mom!"
	line "I was beaten!"
	done

UnknownText_0x1aa740:
	text "My mom worries so"
	line "much about me, I"

	para "have to phone her"
	line "all the time."
	done

SchoolboyTommySeenText:
	text "Let's battle."
	line "I won't lose!"
	done

SchoolboyTommyBeatenText:
	text "I forgot to do my"
	line "homework!"
	done

UnknownText_0x1aa7bc:
	text "Sayonara! I just"
	line "learned that in my"
	cont "Japanese class."
	done

SchoolboyJohnnySeenText:
	text "We're on a field"
	line "trip to LAVENDER"

	para "RADIO TOWER for"
	line "social studies."
	done

SchoolboyJohnnyBeatenText:
	text "You're wickedly"
	line "tough!"
	done

UnknownText_0x1aa84a:
	text "I'm tired of walk-"
	line "ing. I need to"
	cont "take a break."
	done

SchoolboyBillySeenText:
	text "My favorite class"
	line "is gym!"
	done

SchoolboyBillyBeatenText:
	text "Oh, no!"
	line "How could I lose?"
	done

UnknownText_0x1aa8b0:
	text "If #MON were a"
	line "subject at school,"
	cont "I'd be the best!"
	done

UnknownText_0x1aa8e3:
	text "ROUTE 15"

	para "FUCHSIA CITY -"
	line "LAVENDER TOWN"
	done

Route15_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $4, $2, 3, GROUP_ROUTE_15_FUCHSIA_GATE, MAP_ROUTE_15_FUCHSIA_GATE
	warp_def $5, $2, 4, GROUP_ROUTE_15_FUCHSIA_GATE, MAP_ROUTE_15_FUCHSIA_GATE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 9, 19, SIGNPOST_READ, MapRoute15Signpost0Script

	; people-events
	db 7
	person_event SPRITE_YOUNGSTER, 14, 14, LEFT << 2 | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 4, TrainerSchoolboyKipp, -1
	person_event SPRITE_YOUNGSTER, 17, 19, UP << 2 | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerSchoolboyTommy, -1
	person_event SPRITE_YOUNGSTER, 14, 37, UP << 2 | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerSchoolboyJohnny, -1
	person_event SPRITE_YOUNGSTER, 14, 31, UP << 2 | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerSchoolboyBilly, -1
	person_event SPRITE_TEACHER, 16, 34, UP << 2 | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 4, TrainerTeacherColette, -1
	person_event SPRITE_TEACHER, 14, 24, LEFT << 2 | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerTeacherHillary, -1
	person_event SPRITE_POKE_BALL, 9, 16, DOWN << 2 | $1, $0, -1, -1, $1, 0, ItemFragment_0x1aa5e4, EVENT_78A
