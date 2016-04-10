const_value set 2
	const ROUTE15_YOUNGSTER1
	const ROUTE15_YOUNGSTER2
	const ROUTE15_YOUNGSTER3
	const ROUTE15_YOUNGSTER4
	const ROUTE15_TEACHER1
	const ROUTE15_TEACHER2
	const ROUTE15_POKE_BALL

Route15_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerTeacherColette:
	trainer EVENT_BEAT_TEACHER_COLETTE, TEACHER, COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, TeacherColetteScript

TeacherColetteScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa60d
	waitbutton
	closetext
	end

TrainerTeacherHillary:
	trainer EVENT_BEAT_TEACHER_HILLARY, TEACHER, HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, TeacherHillaryScript

TeacherHillaryScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa6ca
	waitbutton
	closetext
	end

TrainerSchoolboyKipp:
	trainer EVENT_BEAT_SCHOOLBOY_KIP, SCHOOLBOY, KIPP, SchoolboyKippSeenText, SchoolboyKippBeatenText, 0, SchoolboyKippScript

SchoolboyKippScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa740
	waitbutton
	closetext
	end

TrainerSchoolboyTommy:
	trainer EVENT_BEAT_SCHOOLBOY_TOMMY, SCHOOLBOY, TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText, 0, SchoolboyTommyScript

SchoolboyTommyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa7bc
	waitbutton
	closetext
	end

TrainerSchoolboyJohnny:
	trainer EVENT_BEAT_SCHOOLBOY_JOHNNY, SCHOOLBOY, JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText, 0, SchoolboyJohnnyScript

SchoolboyJohnnyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa84a
	waitbutton
	closetext
	end

TrainerSchoolboyBilly:
	trainer EVENT_BEAT_SCHOOLBOY_BILLY, SCHOOLBOY, BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText, 0, SchoolboyBillyScript

SchoolboyBillyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1aa8b0
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

Route15PPUp:
	itemball PP_UP

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

Route15SignText:
	text "ROUTE 15"

	para "FUCHSIA CITY -"
	line "LAVENDER TOWN"
	done

Route15_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $4, $2, 3, ROUTE_15_FUCHSIA_GATE
	warp_def $5, $2, 4, ROUTE_15_FUCHSIA_GATE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 9, 19, SIGNPOST_READ, Route15Sign

.PersonEvents:
	db 7
	person_event SPRITE_YOUNGSTER, 10, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerSchoolboyKipp, -1
	person_event SPRITE_YOUNGSTER, 13, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSchoolboyTommy, -1
	person_event SPRITE_YOUNGSTER, 10, 33, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSchoolboyJohnny, -1
	person_event SPRITE_YOUNGSTER, 10, 27, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSchoolboyBilly, -1
	person_event SPRITE_TEACHER, 12, 30, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerTeacherColette, -1
	person_event SPRITE_TEACHER, 10, 20, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	person_event SPRITE_POKE_BALL, 5, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route15PPUp, EVENT_ROUTE_15_PP_UP
