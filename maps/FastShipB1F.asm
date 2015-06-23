FastShipB1F_MapScriptHeader: ; 0x76730
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x7673a, $0000
	dw UnknownScript_0x7673b, $0000

	; callback count
	db 0
; 0x7673a

UnknownScript_0x7673a: ; 0x7673a
	end
; 0x7673b

UnknownScript_0x7673b: ; 0x7673b
	end
; 0x7673c

UnknownScript_0x7673c: ; 0x7673c
	checkevent $072f
	iftrue UnknownScript_0x76766
	applymovement $3, MovementData_0x76876
	moveperson $2, $1e, $6
	appear $2
	pause 5
	disappear $3
	end
; 0x76751

UnknownScript_0x76751: ; 0x76751
	checkevent $072e
	iftrue UnknownScript_0x76766
	applymovement $2, MovementData_0x76871
	moveperson $3, $1f, $6
	appear $3
	pause 5
	disappear $2
	end
; 0x76766

UnknownScript_0x76766: ; 0x76766
	end
; 0x76767

SailorScript_0x76767: ; 0x76767
	faceplayer
	loadfont
	checkevent $0030
	iftrue UnknownScript_0x767a0
	checkevent $0033
	iftrue UnknownScript_0x7678d
	checkevent $0034
	iftrue UnknownScript_0x76787
	writetext UnknownText_0x7687b
	closetext
	loadmovesprites
	setevent $0034
	clearevent $072d
	end
; 0x76787

UnknownScript_0x76787: ; 0x76787
	writetext UnknownText_0x76907
	closetext
	loadmovesprites
	end
; 0x7678d

UnknownScript_0x7678d: ; 0x7678d
	writetext UnknownText_0x7692e
	checkevent $0032
	iffalse UnknownScript_0x76799
	closetext
	loadmovesprites
	end
; 0x76799

UnknownScript_0x76799: ; 0x76799
	keeptextopen
	writetext UnknownText_0x7696d
	closetext
	loadmovesprites
	end
; 0x767a0

UnknownScript_0x767a0: ; 0x767a0
	writetext UnknownText_0x7699d
	closetext
	loadmovesprites
	end
; 0x767a6

TrainerSailorJeff: ; 0x767a6
	; bit/flag number
	dw $57a

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
; 0x767b2

SailorJeffScript: ; 0x767b2
	talkaftercancel
	loadfont
	writetext UnknownText_0x76a38
	closetext
	loadmovesprites
	end
; 0x767ba

TrainerPicnickerDebra: ; 0x767ba
	; bit/flag number
	dw $485

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
; 0x767c6

PicnickerDebraScript: ; 0x767c6
	talkaftercancel
	loadfont
	writetext UnknownText_0x76a99
	closetext
	loadmovesprites
	end
; 0x767ce

TrainerJugglerFritz: ; 0x767ce
	; bit/flag number
	dw $496

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
; 0x767da

JugglerFritzScript: ; 0x767da
	talkaftercancel
	loadfont
	writetext UnknownText_0x76b02
	closetext
	loadmovesprites
	end
; 0x767e2

TrainerSailorGarrett: ; 0x767e2
	; bit/flag number
	dw $57b

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
; 0x767ee

SailorGarrettScript: ; 0x767ee
	talkaftercancel
	loadfont
	writetext UnknownText_0x76b7a
	closetext
	loadmovesprites
	end
; 0x767f6

TrainerFisherJonah: ; 0x767f6
	; bit/flag number
	dw $459

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
; 0x76802

FisherJonahScript: ; 0x76802
	talkaftercancel
	loadfont
	writetext UnknownText_0x76c22
	closetext
	loadmovesprites
	end
; 0x7680a

TrainerBlackbeltWai: ; 0x7680a
	; bit/flag number
	dw $4ac

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
; 0x76816

BlackbeltWaiScript: ; 0x76816
	talkaftercancel
	loadfont
	writetext UnknownText_0x76c9e
	closetext
	loadmovesprites
	end
; 0x7681e

TrainerSailorKenneth: ; 0x7681e
	; bit/flag number
	dw $57c

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
; 0x7682a

SailorKennethScript: ; 0x7682a
	talkaftercancel
	loadfont
	writetext UnknownText_0x76d5f
	closetext
	loadmovesprites
	end
; 0x76832

TrainerTeacherShirley: ; 0x76832
	; bit/flag number
	dw $5b7

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
; 0x7683e

TeacherShirleyScript: ; 0x7683e
	talkaftercancel
	loadfont
	writetext UnknownText_0x76de1
	closetext
	loadmovesprites
	end
; 0x76846

TrainerSchoolboyNate: ; 0x76846
	; bit/flag number
	dw $476

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
; 0x76852

SchoolboyNateScript: ; 0x76852
	talkaftercancel
	loadfont
	writetext UnknownText_0x76e3d
	closetext
	loadmovesprites
	end
; 0x7685a

TrainerSchoolboyRicky: ; 0x7685a
	; bit/flag number
	dw $477

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
; 0x76866

SchoolboyRickyScript: ; 0x76866
	talkaftercancel
	loadfont
	writetext UnknownText_0x76eb6
	closetext
	loadmovesprites
	end
; 0x7686e

MapFastShipB1FSignpost0Script: ; 0x7686e
	jumpstd $000d
; 0x76871

MovementData_0x76871: ; 0x76871
	fix_facing
	big_step_right
	remove_fixed_facing
	turn_head_down
	step_end
; 0x76876

MovementData_0x76876: ; 0x76876
	fix_facing
	big_step_left
	remove_fixed_facing
	turn_head_down
	step_end
; 0x7687b

UnknownText_0x7687b: ; 0x7687b
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
; 0x76907

UnknownText_0x76907: ; 0x76907
	text "Oh, gee…"

	para "The CAPTAIN will"
	line "be furious…"
	done
; 0x7692e

UnknownText_0x7692e: ; 0x7692e
	text "Thanks, kid!"
	line "I chewed him out"

	para "good so he'll quit"
	line "slacking off!"
	done
; 0x7696d

UnknownText_0x7696d: ; 0x7696d
	text "A little girl?"

	para "I may have seen"
	line "her go by here."
	done
; 0x7699d

UnknownText_0x7699d: ; 0x7699d
	text "The dining room is"
	line "up ahead."

	para "The stairs at the"
	line "end lead to the"
	cont "CAPTAIN's cabin."
	done
; 0x769ed

SailorJeffSeenText: ; 0x769ed
	text "Nothing beats a"
	line "battle when I'm"
	cont "on my break."
	done
; 0x76a1a

SailorJeffBeatenText: ; 0x76a1a
	text "Win or lose, my"
	line "break's over!"
	done
; 0x76a38

UnknownText_0x76a38: ; 0x76a38
	text "I guess I can't"
	line "win if I don't get"
	cont "serious."
	done
; 0x76a63

PicnickerDebraSeenText: ; 0x76a63
	text "I'm so bored."
	line "Want to battle?"
	done
; 0x76a81

PicnickerDebraBeatenText: ; 0x76a81
	text "Yow! You're too"
	line "strong!"
	done
; 0x76a99

UnknownText_0x76a99: ; 0x76a99
	text "SAFFRON, CELADON…"
	line "I hear there are"

	para "many big cities"
	line "in KANTO."
	done
; 0x76ad7

JugglerFritzSeenText: ; 0x76ad7
	text "Urrf…"
	line "I'm seasick!"
	done
; 0x76aea

JugglerFritzBeatenText: ; 0x76aea
	text "I can't move any-"
	line "more…"
	done
; 0x76b02

UnknownText_0x76b02: ; 0x76b02
	text "No more ships for"
	line "me. Next time,"

	para "I'm taking the"
	line "MAGNET TRAIN."
	done
; 0x76b40

SailorGarrettSeenText: ; 0x76b40
	text "This is where we"
	line "sailors work!"
	done
; 0x76b60

SailorGarrettBeatenText: ; 0x76b60
	text "I lost on my home"
	line "field…"
	done
; 0x76b7a

UnknownText_0x76b7a: ; 0x76b7a
	text "We get different"
	line "passengers from"

	para "VERMILION CITY to"
	line "OLIVINE CITY."
	done
; 0x76bbc

FisherJonahSeenText: ; 0x76bbc
	text "Even though we're"
	line "out on the sea, I"
	cont "can't fish!"

	para "This is boring!"
	line "Let's battle!"
	done
; 0x76c08

FisherJonahBeatenText: ; 0x76c08
	text "I… I'm not bored"
	line "anymore…"
	done
; 0x76c22

UnknownText_0x76c22: ; 0x76c22
	text "I plan to fish off"
	line "VERMILION's pier."
	done
; 0x76c47

BlackbeltWaiSeenText: ; 0x76c47
	text "I'm building up my"
	line "legs by bracing"

	para "against the ship's"
	line "rocking!"
	done
; 0x76c85

BlackbeltWaiBeatenText: ; 0x76c85
	text "Rocked and rolled"
	line "over!"
	done
; 0x76c9e

UnknownText_0x76c9e: ; 0x76c9e
	text "I couldn't find"
	line "the KARATE KING in"
	cont "JOHTO."

	para "He's supposed to"
	line "be training in a"
	cont "cave somewhere."
	done
; 0x76cf9

SailorKennethSeenText: ; 0x76cf9
	text "I'm a sailor man!"

	para "But I'm training"
	line "#MON, so I can"
	cont "become the CHAMP!"
	done
; 0x76d3c

SailorKennethBeatenText: ; 0x76d3c
	text "My lack of train-"
	line "ing is obvious…"
	done
; 0x76d5f

UnknownText_0x76d5f: ; 0x76d5f
	text "Eight BADGES!"
	line "They must prove"

	para "that you've beaten"
	line "GYM LEADERS."

	para "No wonder you're"
	line "so good!"
	done
; 0x76db6

TeacherShirleySeenText: ; 0x76db6
	text "Don't lay a finger"
	line "on my students!"
	done
; 0x76dd9

TeacherShirleyBeatenText: ; 0x76dd9
	text "Aaack!"
	done
; 0x76de1

UnknownText_0x76de1: ; 0x76de1
	text "We're on a field"
	line "trip to the RUINS"
	cont "outside VIOLET."
	done
; 0x76e14

SchoolboyNateSeenText: ; 0x76e14
	text "Do you know the"
	line "RUINS OF ALPH?"
	done
; 0x76e34

SchoolboyNateBeatenText: ; 0x76e34
	text "Yaargh!"
	done
; 0x76e3d

UnknownText_0x76e3d: ; 0x76e3d
	text "Radios pick up"
	line "strange signals"
	cont "inside the RUINS."
	done
; 0x76e6f

SchoolboyRickySeenText: ; 0x76e6f
	text "There are some odd"
	line "stone panels in"
	cont "the RUINS OF ALPH."
	done
; 0x76ea6

SchoolboyRickyBeatenText: ; 0x76ea6
	text "I was done in!"
	done
; 0x76eb6

UnknownText_0x76eb6: ; 0x76eb6
	text "I read that there"
	line "are four of those"
	cont "stone panels."
	done
; 0x76ee9

FastShipB1F_MapEventHeader: ; 0x76ee9
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
	signpost 9, 27, $0, MapFastShipB1FSignpost0Script

	; people-events
	db 12
	person_event SPRITE_SAILOR, 10, 34, $6, $0, 255, 255, $90, 0, SailorScript_0x76767, $072e
	person_event SPRITE_SAILOR, 10, 35, $6, $0, 255, 255, $90, 0, SailorScript_0x76767, $072f
	person_event SPRITE_SAILOR, 15, 13, $7, $0, 255, 255, $92, 3, TrainerSailorJeff, $0739
	person_event SPRITE_LASS, 8, 10, $7, $0, 255, 255, $a2, 1, TrainerPicnickerDebra, $0739
	person_event SPRITE_SUPER_NERD, 13, 30, $9, $0, 255, 255, $92, 1, TrainerJugglerFritz, $0739
	person_event SPRITE_SAILOR, 8, 21, $9, $0, 255, 255, $92, 4, TrainerSailorGarrett, $073a
	person_event SPRITE_FISHER, 12, 29, $7, $0, 255, 255, $a2, 3, TrainerFisherJonah, $073a
	person_event SPRITE_BLACK_BELT, 15, 19, $1f, $0, 255, 255, $b2, 3, TrainerBlackbeltWai, $073a
	person_event SPRITE_SAILOR, 8, 27, $9, $0, 255, 255, $92, 4, TrainerSailorKenneth, $073b
	person_event SPRITE_TEACHER, 15, 13, $7, $0, 255, 255, $82, 3, TrainerTeacherShirley, $073b
	person_event SPRITE_YOUNGSTER, 13, 18, $3, $0, 255, 255, $92, 1, TrainerSchoolboyNate, $073b
	person_event SPRITE_YOUNGSTER, 15, 18, $a, $0, 255, 255, $92, 1, TrainerSchoolboyRicky, $073b
; 0x76faa
