Route15_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerTeacherColette:
	trainer EVENT_BEAT_TEACHER_COLETTE, TEACHER, COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, $0000, TeacherColetteScript

TeacherColetteScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aa60d
	closetext
	loadmovesprites
	end

TrainerTeacherHillary:
	trainer EVENT_BEAT_TEACHER_HILLARY, TEACHER, HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, $0000, TeacherHillaryScript

TeacherHillaryScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aa6ca
	closetext
	loadmovesprites
	end

TrainerSchoolboyKipp:
	trainer EVENT_BEAT_SCHOOLBOY_KIP, SCHOOLBOY, KIPP, SchoolboyKippSeenText, SchoolboyKippBeatenText, $0000, SchoolboyKippScript

SchoolboyKippScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aa740
	closetext
	loadmovesprites
	end

TrainerSchoolboyTommy:
	trainer EVENT_BEAT_SCHOOLBOY_TOMMY, SCHOOLBOY, TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText, $0000, SchoolboyTommyScript

SchoolboyTommyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aa7bc
	closetext
	loadmovesprites
	end

TrainerSchoolboyJohnny:
	trainer EVENT_BEAT_SCHOOLBOY_JOHNNY, SCHOOLBOY, JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText, $0000, SchoolboyJohnnyScript

SchoolboyJohnnyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1aa84a
	closetext
	loadmovesprites
	end

TrainerSchoolboyBilly:
	trainer EVENT_BEAT_SCHOOLBOY_BILLY, SCHOOLBOY, BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText, $0000, SchoolboyBillyScript

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

.Warps:
	db 2
	warp_def $4, $2, 3, GROUP_ROUTE_15_FUCHSIA_GATE, MAP_ROUTE_15_FUCHSIA_GATE
	warp_def $5, $2, 4, GROUP_ROUTE_15_FUCHSIA_GATE, MAP_ROUTE_15_FUCHSIA_GATE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 9, 19, SIGNPOST_READ, MapRoute15Signpost0Script

.PersonEvents:
	db 7
	person_event SPRITE_YOUNGSTER, 14, 14, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 4, TrainerSchoolboyKipp, -1
	person_event SPRITE_YOUNGSTER, 17, 19, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerSchoolboyTommy, -1
	person_event SPRITE_YOUNGSTER, 14, 37, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerSchoolboyJohnny, -1
	person_event SPRITE_YOUNGSTER, 14, 31, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerSchoolboyBilly, -1
	person_event SPRITE_TEACHER, 16, 34, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 4, TrainerTeacherColette, -1
	person_event SPRITE_TEACHER, 14, 24, OW_LEFT | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerTeacherHillary, -1
	person_event SPRITE_POKE_BALL, 9, 16, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1aa5e4, EVENT_ROUTE_15_PP_UP
