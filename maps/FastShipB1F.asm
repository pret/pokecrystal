FastShipB1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x7673a, $0000
	dw UnknownScript_0x7673b, $0000

.MapCallbacks:
	db 0

UnknownScript_0x7673a:
	end

UnknownScript_0x7673b:
	end

UnknownScript_0x7673c:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftrue UnknownScript_0x76766
	applymovement $3, MovementData_0x76876
	moveperson $2, $1e, $6
	appear $2
	pause 5
	disappear $3
	end

UnknownScript_0x76751:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftrue UnknownScript_0x76766
	applymovement $2, MovementData_0x76871
	moveperson $3, $1f, $6
	appear $3
	pause 5
	disappear $2
	end

UnknownScript_0x76766:
	end

SailorScript_0x76767:
	faceplayer
	loadfont
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue UnknownScript_0x767a0
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftrue UnknownScript_0x7678d
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue UnknownScript_0x76787
	writetext UnknownText_0x7687b
	closetext
	loadmovesprites
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	end

UnknownScript_0x76787:
	writetext UnknownText_0x76907
	closetext
	loadmovesprites
	end

UnknownScript_0x7678d:
	writetext UnknownText_0x7692e
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalse UnknownScript_0x76799
	closetext
	loadmovesprites
	end

UnknownScript_0x76799:
	keeptextopen
	writetext UnknownText_0x7696d
	closetext
	loadmovesprites
	end

UnknownScript_0x767a0:
	writetext UnknownText_0x7699d
	closetext
	loadmovesprites
	end

TrainerSailorJeff:
	trainer EVENT_BEAT_SAILOR_JEFF, SAILOR, JEFF, SailorJeffSeenText, SailorJeffBeatenText, $0000, SailorJeffScript

SailorJeffScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76a38
	closetext
	loadmovesprites
	end

TrainerPicnickerDebra:
	trainer EVENT_BEAT_PICNICKER_DEBRA, PICNICKER, DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText, $0000, PicnickerDebraScript

PicnickerDebraScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76a99
	closetext
	loadmovesprites
	end

TrainerJugglerFritz:
	trainer EVENT_BEAT_JUGGLER_FRITZ, JUGGLER, FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText, $0000, JugglerFritzScript

JugglerFritzScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76b02
	closetext
	loadmovesprites
	end

TrainerSailorGarrett:
	trainer EVENT_BEAT_SAILOR_GARRETT, SAILOR, GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, $0000, SailorGarrettScript

SailorGarrettScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76b7a
	closetext
	loadmovesprites
	end

TrainerFisherJonah:
	trainer EVENT_BEAT_FISHER_JONAH, FISHER, JONAH, FisherJonahSeenText, FisherJonahBeatenText, $0000, FisherJonahScript

FisherJonahScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76c22
	closetext
	loadmovesprites
	end

TrainerBlackbeltWai:
	trainer EVENT_BEAT_BLACKBELT_WAI, BLACKBELT_T, WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText, $0000, BlackbeltWaiScript

BlackbeltWaiScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76c9e
	closetext
	loadmovesprites
	end

TrainerSailorKenneth:
	trainer EVENT_BEAT_SAILOR_KENNETH, SAILOR, KENNETH, SailorKennethSeenText, SailorKennethBeatenText, $0000, SailorKennethScript

SailorKennethScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76d5f
	closetext
	loadmovesprites
	end

TrainerTeacherShirley:
	trainer EVENT_BEAT_TEACHER_SHIRLEY, TEACHER, SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText, $0000, TeacherShirleyScript

TeacherShirleyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76de1
	closetext
	loadmovesprites
	end

TrainerSchoolboyNate:
	trainer EVENT_BEAT_SCHOOLBOY_NATE, SCHOOLBOY, NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText, $0000, SchoolboyNateScript

SchoolboyNateScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76e3d
	closetext
	loadmovesprites
	end

TrainerSchoolboyRicky:
	trainer EVENT_BEAT_SCHOOLBOY_RICKY, SCHOOLBOY, RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText, $0000, SchoolboyRickyScript

SchoolboyRickyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76eb6
	closetext
	loadmovesprites
	end

FashShipB1FTrashcan:
	jumpstd trashcan

MovementData_0x76871:
	fix_facing
	big_step_right
	remove_fixed_facing
	turn_head_down
	step_end

MovementData_0x76876:
	fix_facing
	big_step_left
	remove_fixed_facing
	turn_head_down
	step_end

UnknownText_0x7687b:
	text "Hey, kid. Could I"
	line "get you to look"
	cont "for my buddy?"

	para "He's goofing off"
	line "somewhere, that"
	cont "lazy bum!"

	para "I want to go find"
	line "him, but I'm on"
	cont "duty right now."
	done

UnknownText_0x76907:
	text "Oh, gee…"

	para "The CAPTAIN will"
	line "be furious…"
	done

UnknownText_0x7692e:
	text "Thanks, kid!"
	line "I chewed him out"

	para "good so he'll quit"
	line "slacking off!"
	done

UnknownText_0x7696d:
	text "A little girl?"

	para "I may have seen"
	line "her go by here."
	done

UnknownText_0x7699d:
	text "The dining room is"
	line "up ahead."

	para "The stairs at the"
	line "end lead to the"
	cont "CAPTAIN's cabin."
	done

SailorJeffSeenText:
	text "Nothing beats a"
	line "battle when I'm"
	cont "on my break."
	done

SailorJeffBeatenText:
	text "Win or lose, my"
	line "break's over!"
	done

UnknownText_0x76a38:
	text "I guess I can't"
	line "win if I don't get"
	cont "serious."
	done

PicnickerDebraSeenText:
	text "I'm so bored."
	line "Want to battle?"
	done

PicnickerDebraBeatenText:
	text "Yow! You're too"
	line "strong!"
	done

UnknownText_0x76a99:
	text "SAFFRON, CELADON…"
	line "I hear there are"

	para "many big cities"
	line "in KANTO."
	done

JugglerFritzSeenText:
	text "Urrf…"
	line "I'm seasick!"
	done

JugglerFritzBeatenText:
	text "I can't move any-"
	line "more…"
	done

UnknownText_0x76b02:
	text "No more ships for"
	line "me. Next time,"

	para "I'm taking the"
	line "MAGNET TRAIN."
	done

SailorGarrettSeenText:
	text "This is where we"
	line "sailors work!"
	done

SailorGarrettBeatenText:
	text "I lost on my home"
	line "field…"
	done

UnknownText_0x76b7a:
	text "We get different"
	line "passengers from"

	para "VERMILION CITY to"
	line "OLIVINE CITY."
	done

FisherJonahSeenText:
	text "Even though we're"
	line "out on the sea, I"
	cont "can't fish!"

	para "This is boring!"
	line "Let's battle!"
	done

FisherJonahBeatenText:
	text "I… I'm not bored"
	line "anymore…"
	done

UnknownText_0x76c22:
	text "I plan to fish off"
	line "VERMILION's pier."
	done

BlackbeltWaiSeenText:
	text "I'm building up my"
	line "legs by bracing"

	para "against the ship's"
	line "rocking!"
	done

BlackbeltWaiBeatenText:
	text "Rocked and rolled"
	line "over!"
	done

UnknownText_0x76c9e:
	text "I couldn't find"
	line "the KARATE KING in"
	cont "JOHTO."

	para "He's supposed to"
	line "be training in a"
	cont "cave somewhere."
	done

SailorKennethSeenText:
	text "I'm a sailor man!"

	para "But I'm training"
	line "#MON, so I can"
	cont "become the CHAMP!"
	done

SailorKennethBeatenText:
	text "My lack of train-"
	line "ing is obvious…"
	done

UnknownText_0x76d5f:
	text "Eight BADGES!"
	line "They must prove"

	para "that you've beaten"
	line "GYM LEADERS."

	para "No wonder you're"
	line "so good!"
	done

TeacherShirleySeenText:
	text "Don't lay a finger"
	line "on my students!"
	done

TeacherShirleyBeatenText:
	text "Aaack!"
	done

UnknownText_0x76de1:
	text "We're on a field"
	line "trip to the RUINS"
	cont "outside VIOLET."
	done

SchoolboyNateSeenText:
	text "Do you know the"
	line "RUINS OF ALPH?"
	done

SchoolboyNateBeatenText:
	text "Yaargh!"
	done

UnknownText_0x76e3d:
	text "Radios pick up"
	line "strange signals"
	cont "inside the RUINS."
	done

SchoolboyRickySeenText:
	text "There are some odd"
	line "stone panels in"
	cont "the RUINS OF ALPH."
	done

SchoolboyRickyBeatenText:
	text "I was done in!"
	done

UnknownText_0x76eb6:
	text "I read that there"
	line "are four of those"
	cont "stone panels."
	done

FastShipB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $b, $5, 11, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $d, $1f, 12, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F

.XYTriggers:
	db 2
	xy_trigger 0, $7, $1e, $0, UnknownScript_0x7673c, $0, $0
	xy_trigger 0, $7, $1f, $0, UnknownScript_0x76751, $0, $0

.Signposts:
	db 1
	signpost 9, 27, SIGNPOST_READ, FashShipB1FTrashcan

.PersonEvents:
	db 12
	person_event SPRITE_SAILOR, 10, 34, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SailorScript_0x76767, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	person_event SPRITE_SAILOR, 10, 35, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SailorScript_0x76767, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	person_event SPRITE_SAILOR, 15, 13, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	person_event SPRITE_LASS, 8, 10, OW_UP | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 1, TrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	person_event SPRITE_SUPER_NERD, 13, 30, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	person_event SPRITE_SAILOR, 8, 21, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	person_event SPRITE_FISHER, 12, 29, OW_UP | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	person_event SPRITE_BLACK_BELT, 15, 19, OW_RIGHT | $13, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	person_event SPRITE_SAILOR, 8, 27, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 4, TrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	person_event SPRITE_TEACHER, 15, 13, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	person_event SPRITE_YOUNGSTER, 13, 18, OW_DOWN | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	person_event SPRITE_YOUNGSTER, 15, 18, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
