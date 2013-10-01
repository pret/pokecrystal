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
	2writetext UnknownText_0x7687b
	closetext
	loadmovesprites
	setevent $0034
	clearevent $072d
	end
; 0x76787

UnknownScript_0x76787: ; 0x76787
	2writetext UnknownText_0x76907
	closetext
	loadmovesprites
	end
; 0x7678d

UnknownScript_0x7678d: ; 0x7678d
	2writetext UnknownText_0x7692e
	checkevent $0032
	iffalse UnknownScript_0x76799
	closetext
	loadmovesprites
	end
; 0x76799

UnknownScript_0x76799: ; 0x76799
	keeptextopen
	2writetext UnknownText_0x7696d
	closetext
	loadmovesprites
	end
; 0x767a0

UnknownScript_0x767a0: ; 0x767a0
	2writetext UnknownText_0x7699d
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
	2writetext UnknownText_0x76a38
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
	2writetext UnknownText_0x76a99
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
	2writetext UnknownText_0x76b02
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
	2writetext UnknownText_0x76b7a
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
	2writetext UnknownText_0x76c22
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
	2writetext UnknownText_0x76c9e
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
	2writetext UnknownText_0x76d5f
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
	2writetext UnknownText_0x76de1
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
	2writetext UnknownText_0x76e3d
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
	2writetext UnknownText_0x76eb6
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
	db $0, "Hey, kid. Could I", $4f
	db "get you to look", $55
	db "for my buddy?", $51
	db "He's goofing off", $4f
	db "somewhere, that", $55
	db "lazy bum!", $51
	db "I want to go find", $4f
	db "him, but I'm on", $55
	db "duty right now.", $57
; 0x76907

UnknownText_0x76907: ; 0x76907
	db $0, "Oh, gee…", $51
	db "The CAPTAIN will", $4f
	db "be furious…", $57
; 0x7692e

UnknownText_0x7692e: ; 0x7692e
	db $0, "Thanks, kid!", $4f
	db "I chewed him out", $51
	db "good so he'll quit", $4f
	db "slacking off!", $57
; 0x7696d

UnknownText_0x7696d: ; 0x7696d
	db $0, "A little girl?", $51
	db "I may have seen", $4f
	db "her go by here.", $57
; 0x7699d

UnknownText_0x7699d: ; 0x7699d
	db $0, "The dining room is", $4f
	db "up ahead.", $51
	db "The stairs at the", $4f
	db "end lead to the", $55
	db "CAPTAIN's cabin.", $57
; 0x769ed

SailorJeffSeenText: ; 0x769ed
	db $0, "Nothing beats a", $4f
	db "battle when I'm", $55
	db "on my break.", $57
; 0x76a1a

SailorJeffBeatenText: ; 0x76a1a
	db $0, "Win or lose, my", $4f
	db "break's over!", $57
; 0x76a38

UnknownText_0x76a38: ; 0x76a38
	db $0, "I guess I can't", $4f
	db "win if I don't get", $55
	db "serious.", $57
; 0x76a63

PicnickerDebraSeenText: ; 0x76a63
	db $0, "I'm so bored.", $4f
	db "Want to battle?", $57
; 0x76a81

PicnickerDebraBeatenText: ; 0x76a81
	db $0, "Yow! You're too", $4f
	db "strong!", $57
; 0x76a99

UnknownText_0x76a99: ; 0x76a99
	db $0, "SAFFRON, CELADON…", $4f
	db "I hear there are", $51
	db "many big cities", $4f
	db "in KANTO.", $57
; 0x76ad7

JugglerFritzSeenText: ; 0x76ad7
	db $0, "Urrf…", $4f
	db "I'm seasick!", $57
; 0x76aea

JugglerFritzBeatenText: ; 0x76aea
	db $0, "I can't move any-", $4f
	db "more…", $57
; 0x76b02

UnknownText_0x76b02: ; 0x76b02
	db $0, "No more ships for", $4f
	db "me. Next time,", $51
	db "I'm taking the", $4f
	db "MAGNET TRAIN.", $57
; 0x76b40

SailorGarrettSeenText: ; 0x76b40
	db $0, "This is where we", $4f
	db "sailors work!", $57
; 0x76b60

SailorGarrettBeatenText: ; 0x76b60
	db $0, "I lost on my home", $4f
	db "field…", $57
; 0x76b7a

UnknownText_0x76b7a: ; 0x76b7a
	db $0, "We get different", $4f
	db "passengers from", $51
	db "VERMILION CITY to", $4f
	db "OLIVINE CITY.", $57
; 0x76bbc

FisherJonahSeenText: ; 0x76bbc
	db $0, "Even though we're", $4f
	db "out on the sea, I", $55
	db "can't fish!", $51
	db "This is boring!", $4f
	db "Let's battle!", $57
; 0x76c08

FisherJonahBeatenText: ; 0x76c08
	db $0, "I… I'm not bored", $4f
	db "anymore…", $57
; 0x76c22

UnknownText_0x76c22: ; 0x76c22
	db $0, "I plan to fish off", $4f
	db "VERMILION's pier.", $57
; 0x76c47

BlackbeltWaiSeenText: ; 0x76c47
	db $0, "I'm building up my", $4f
	db "legs by bracing", $51
	db "against the ship's", $4f
	db "rocking!", $57
; 0x76c85

BlackbeltWaiBeatenText: ; 0x76c85
	db $0, "Rocked and rolled", $4f
	db "over!", $57
; 0x76c9e

UnknownText_0x76c9e: ; 0x76c9e
	db $0, "I couldn't find", $4f
	db "the KARATE KING in", $55
	db "JOHTO.", $51
	db "He's supposed to", $4f
	db "be training in a", $55
	db "cave somewhere.", $57
; 0x76cf9

SailorKennethSeenText: ; 0x76cf9
	db $0, "I'm a sailor man!", $51
	db "But I'm training", $4f
	db "#MON, so I can", $55
	db "become the CHAMP!", $57
; 0x76d3c

SailorKennethBeatenText: ; 0x76d3c
	db $0, "My lack of train-", $4f
	db "ing is obvious…", $57
; 0x76d5f

UnknownText_0x76d5f: ; 0x76d5f
	db $0, "Eight BADGES!", $4f
	db "They must prove", $51
	db "that you've beaten", $4f
	db "GYM LEADERS.", $51
	db "No wonder you're", $4f
	db "so good!", $57
; 0x76db6

TeacherShirleySeenText: ; 0x76db6
	db $0, "Don't lay a finger", $4f
	db "on my students!", $57
; 0x76dd9

TeacherShirleyBeatenText: ; 0x76dd9
	db $0, "Aaack!", $57
; 0x76de1

UnknownText_0x76de1: ; 0x76de1
	db $0, "We're on a field", $4f
	db "trip to the RUINS", $55
	db "outside VIOLET.", $57
; 0x76e14

SchoolboyNateSeenText: ; 0x76e14
	db $0, "Do you know the", $4f
	db "RUINS OF ALPH?", $57
; 0x76e34

SchoolboyNateBeatenText: ; 0x76e34
	db $0, "Yaargh!", $57
; 0x76e3d

UnknownText_0x76e3d: ; 0x76e3d
	db $0, "Radios pick up", $4f
	db "strange signals", $55
	db "inside the RUINS.", $57
; 0x76e6f

SchoolboyRickySeenText: ; 0x76e6f
	db $0, "There are some odd", $4f
	db "stone panels in", $55
	db "the RUINS OF ALPH.", $57
; 0x76ea6

SchoolboyRickyBeatenText: ; 0x76ea6
	db $0, "I was done in!", $57
; 0x76eb6

UnknownText_0x76eb6: ; 0x76eb6
	db $0, "I read that there", $4f
	db "are four of those", $55
	db "stone panels.", $57
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

