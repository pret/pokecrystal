FastShipB1F_MapScriptHeader:
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x7673a, $0000
	dw UnknownScript_0x7673b, $0000

	; callback count
	db 0

UnknownScript_0x7673a:
	end

UnknownScript_0x7673b:
	end

UnknownScript_0x7673c:
	checkevent EVENT_72F
	iftrue UnknownScript_0x76766
	applymovement $3, MovementData_0x76876
	moveperson $2, $1e, $6
	appear $2
	pause 5
	disappear $3
	end

UnknownScript_0x76751:
	checkevent EVENT_72E
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
	checkevent EVENT_030
	iftrue UnknownScript_0x767a0
	checkevent EVENT_033
	iftrue UnknownScript_0x7678d
	checkevent EVENT_034
	iftrue UnknownScript_0x76787
	writetext UnknownText_0x7687b
	closetext
	loadmovesprites
	setevent EVENT_034
	clearevent EVENT_72D
	end

UnknownScript_0x76787:
	writetext UnknownText_0x76907
	closetext
	loadmovesprites
	end

UnknownScript_0x7678d:
	writetext UnknownText_0x7692e
	checkevent EVENT_032
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
	; bit/flag number
	dw EVENT_BEAT_SAILOR_JEFF

	; trainer group && trainer id
	db SAILOR, JEFF

	; text when seen
	dw SailorJeffSeenText

	; text when trainer beaten
	dw SailorJeffBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorJeffScript

SailorJeffScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76a38
	closetext
	loadmovesprites
	end

TrainerPicnickerDebra:
	; bit/flag number
	dw EVENT_BEAT_PICNICKER_DEBRA

	; trainer group && trainer id
	db PICNICKER, DEBRA

	; text when seen
	dw PicnickerDebraSeenText

	; text when trainer beaten
	dw PicnickerDebraBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerDebraScript

PicnickerDebraScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76a99
	closetext
	loadmovesprites
	end

TrainerJugglerFritz:
	; bit/flag number
	dw EVENT_BEAT_JUGGLER_FRITZ

	; trainer group && trainer id
	db JUGGLER, FRITZ

	; text when seen
	dw JugglerFritzSeenText

	; text when trainer beaten
	dw JugglerFritzBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw JugglerFritzScript

JugglerFritzScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76b02
	closetext
	loadmovesprites
	end

TrainerSailorGarrett:
	; bit/flag number
	dw EVENT_BEAT_SAILOR_GARRETT

	; trainer group && trainer id
	db SAILOR, GARRETT

	; text when seen
	dw SailorGarrettSeenText

	; text when trainer beaten
	dw SailorGarrettBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorGarrettScript

SailorGarrettScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76b7a
	closetext
	loadmovesprites
	end

TrainerFisherJonah:
	; bit/flag number
	dw EVENT_BEAT_FISHER_JONAH

	; trainer group && trainer id
	db FISHER, JONAH

	; text when seen
	dw FisherJonahSeenText

	; text when trainer beaten
	dw FisherJonahBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherJonahScript

FisherJonahScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76c22
	closetext
	loadmovesprites
	end

TrainerBlackbeltWai:
	; bit/flag number
	dw EVENT_BEAT_BLACKBELT_WAI

	; trainer group && trainer id
	db BLACKBELT_T, WAI

	; text when seen
	dw BlackbeltWaiSeenText

	; text when trainer beaten
	dw BlackbeltWaiBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BlackbeltWaiScript

BlackbeltWaiScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76c9e
	closetext
	loadmovesprites
	end

TrainerSailorKenneth:
	; bit/flag number
	dw EVENT_BEAT_SAILOR_KENNETH

	; trainer group && trainer id
	db SAILOR, KENNETH

	; text when seen
	dw SailorKennethSeenText

	; text when trainer beaten
	dw SailorKennethBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorKennethScript

SailorKennethScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76d5f
	closetext
	loadmovesprites
	end

TrainerTeacherShirley:
	; bit/flag number
	dw EVENT_BEAT_TEACHER_SHIRLEY

	; trainer group && trainer id
	db TEACHER, SHIRLEY

	; text when seen
	dw TeacherShirleySeenText

	; text when trainer beaten
	dw TeacherShirleyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TeacherShirleyScript

TeacherShirleyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76de1
	closetext
	loadmovesprites
	end

TrainerSchoolboyNate:
	; bit/flag number
	dw EVENT_BEAT_SCHOOLBOY_NATE

	; trainer group && trainer id
	db SCHOOLBOY, NATE

	; text when seen
	dw SchoolboyNateSeenText

	; text when trainer beaten
	dw SchoolboyNateBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyNateScript

SchoolboyNateScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76e3d
	closetext
	loadmovesprites
	end

TrainerSchoolboyRicky:
	; bit/flag number
	dw EVENT_BEAT_SCHOOLBOY_RICKY

	; trainer group && trainer id
	db SCHOOLBOY, RICKY

	; text when seen
	dw SchoolboyRickySeenText

	; text when trainer beaten
	dw SchoolboyRickyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyRickyScript

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

	; warps
	db 2
	warp_def $b, $5, 11, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $d, $1f, 12, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F

	; xy triggers
	db 2
	xy_trigger 0, $7, $1e, $0, UnknownScript_0x7673c, $0, $0
	xy_trigger 0, $7, $1f, $0, UnknownScript_0x76751, $0, $0

	; signposts
	db 1
	signpost 9, 27, SIGNPOST_READ, FashShipB1FTrashcan

	; people-events
	db 12
	person_event SPRITE_SAILOR, 10, 34, UP << 2 | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SailorScript_0x76767, EVENT_72E
	person_event SPRITE_SAILOR, 10, 35, UP << 2 | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SailorScript_0x76767, EVENT_72F
	person_event SPRITE_SAILOR, 15, 13, UP << 2 | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerSailorJeff, EVENT_739
	person_event SPRITE_LASS, 8, 10, UP << 2 | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 1, TrainerPicnickerDebra, EVENT_739
	person_event SPRITE_SUPER_NERD, 13, 30, LEFT << 2 | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerJugglerFritz, EVENT_739
	person_event SPRITE_SAILOR, 8, 21, LEFT << 2 | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 4, TrainerSailorGarrett, EVENT_73A
	person_event SPRITE_FISHER, 12, 29, UP << 2 | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerFisherJonah, EVENT_73A
	person_event SPRITE_BLACK_BELT, 15, 19, RIGHT << 2 | $13, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerBlackbeltWai, EVENT_73A
	person_event SPRITE_SAILOR, 8, 27, LEFT << 2 | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 4, TrainerSailorKenneth, EVENT_73B
	person_event SPRITE_TEACHER, 15, 13, UP << 2 | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerTeacherShirley, EVENT_73B
	person_event SPRITE_YOUNGSTER, 13, 18, DOWN << 2 | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerSchoolboyNate, EVENT_73B
	person_event SPRITE_YOUNGSTER, 15, 18, LEFT << 2 | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerSchoolboyRicky, EVENT_73B
