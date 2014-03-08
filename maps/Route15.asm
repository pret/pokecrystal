Route15_MapScriptHeader: ; 0x1aa567
	; trigger count
	db 0

	; callback count
	db 0
; 0x1aa569

TrainerTeacherColette: ; 0x1aa569
	; bit/flag number
	dw $5b5

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
; 0x1aa575

TeacherColetteScript: ; 0x1aa575
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1aa60d
	closetext
	loadmovesprites
	end
; 0x1aa57d

TrainerTeacherHillary: ; 0x1aa57d
	; bit/flag number
	dw $5b6

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
; 0x1aa589

TeacherHillaryScript: ; 0x1aa589
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1aa6ca
	closetext
	loadmovesprites
	end
; 0x1aa591

TrainerSchoolboyKipp: ; 0x1aa591
	; bit/flag number
	dw $46d

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
; 0x1aa59d

SchoolboyKippScript: ; 0x1aa59d
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1aa740
	closetext
	loadmovesprites
	end
; 0x1aa5a5

TrainerSchoolboyTommy: ; 0x1aa5a5
	; bit/flag number
	dw $471

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
; 0x1aa5b1

SchoolboyTommyScript: ; 0x1aa5b1
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1aa7bc
	closetext
	loadmovesprites
	end
; 0x1aa5b9

TrainerSchoolboyJohnny: ; 0x1aa5b9
	; bit/flag number
	dw $46f

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
; 0x1aa5c5

SchoolboyJohnnyScript: ; 0x1aa5c5
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1aa84a
	closetext
	loadmovesprites
	end
; 0x1aa5cd

TrainerSchoolboyBilly: ; 0x1aa5cd
	; bit/flag number
	dw $474

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
; 0x1aa5d9

SchoolboyBillyScript: ; 0x1aa5d9
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1aa8b0
	closetext
	loadmovesprites
	end
; 0x1aa5e1

MapRoute15Signpost0Script: ; 0x1aa5e1
	jumptext UnknownText_0x1aa8e3
; 0x1aa5e4

ItemFragment_0x1aa5e4: ; 0x1aa5e4
	db PP_UP, 1
; 0x1aa5e6

TeacherColetteSeenText: ; 0x1aa5e6
	text "Have you forgotten"
	line "anything?"
	done
; 0x1aa604

TeacherColetteBeatenText: ; 0x1aa604
	text "Kyaaah!"
	done
; 0x1aa60d

UnknownText_0x1aa60d: ; 0x1aa60d
	text "Before I became a"
	line "teacher, I used to"

	para "forget a lot of"
	line "things."
	done
; 0x1aa64b

TeacherHillarySeenText: ; 0x1aa64b
	text "On sunny days, I"
	line "think that the"

	para "kids would rather"
	line "be playing in the"

	para "schoolyard than"
	line "studying in class."
	done
; 0x1aa6b3

TeacherHillaryBeatenText: ; 0x1aa6b3
	text "I didn't want to"
	line "lose…"
	done
; 0x1aa6ca

UnknownText_0x1aa6ca: ; 0x1aa6ca
	text "Studying is impor-"
	line "tant, but exercise"
	cont "is just as vital."
	done
; 0x1aa703

SchoolboyKippSeenText: ; 0x1aa703
	text "Hang on. I have to"
	line "phone my mom."
	done
; 0x1aa725

SchoolboyKippBeatenText: ; 0x1aa725
	text "Sorry, Mom!"
	line "I was beaten!"
	done
; 0x1aa740

UnknownText_0x1aa740: ; 0x1aa740
	text "My mom worries so"
	line "much about me, I"

	para "have to phone her"
	line "all the time."
	done
; 0x1aa784

SchoolboyTommySeenText: ; 0x1aa784
	text "Let's battle."
	line "I won't lose!"
	done
; 0x1aa79f

SchoolboyTommyBeatenText: ; 0x1aa79f
	text "I forgot to do my"
	line "homework!"
	done
; 0x1aa7bc

UnknownText_0x1aa7bc: ; 0x1aa7bc
	text "Sayonara! I just"
	line "learned that in my"
	cont "Japanese class."
	done
; 0x1aa7f1

SchoolboyJohnnySeenText: ; 0x1aa7f1
	text "We're on a field"
	line "trip to LAVENDER"

	para "RADIO TOWER for"
	line "social studies."
	done
; 0x1aa833

SchoolboyJohnnyBeatenText: ; 0x1aa833
	text "You're wickedly"
	line "tough!"
	done
; 0x1aa84a

UnknownText_0x1aa84a: ; 0x1aa84a
	text "I'm tired of walk-"
	line "ing. I need to"
	cont "take a break."
	done
; 0x1aa87a

SchoolboyBillySeenText: ; 0x1aa87a
	text "My favorite class"
	line "is gym!"
	done
; 0x1aa895

SchoolboyBillyBeatenText: ; 0x1aa895
	text "Oh, no!"
	line "How could I lose?"
	done
; 0x1aa8b0

UnknownText_0x1aa8b0: ; 0x1aa8b0
	text "If #MON were a"
	line "subject at school,"
	cont "I'd be the best!"
	done
; 0x1aa8e3

UnknownText_0x1aa8e3: ; 0x1aa8e3
	text "ROUTE 15"

	para "FUCHSIA CITY -"
	line "LAVENDER TOWN"
	done
; 0x1aa90a

Route15_MapEventHeader: ; 0x1aa90a
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
	signpost 9, 19, $0, MapRoute15Signpost0Script

	; people-events
	db 7
	person_event SPRITE_YOUNGSTER, 14, 14, $9, $0, 255, 255, $92, 4, TrainerSchoolboyKipp, $ffff
	person_event SPRITE_YOUNGSTER, 17, 19, $7, $0, 255, 255, $92, 3, TrainerSchoolboyTommy, $ffff
	person_event SPRITE_YOUNGSTER, 14, 37, $6, $0, 255, 255, $92, 3, TrainerSchoolboyJohnny, $ffff
	person_event SPRITE_YOUNGSTER, 14, 31, $6, $0, 255, 255, $92, 3, TrainerSchoolboyBilly, $ffff
	person_event SPRITE_TEACHER, 16, 34, $7, $0, 255, 255, $82, 4, TrainerTeacherColette, $ffff
	person_event SPRITE_TEACHER, 14, 24, $a, $0, 255, 255, $82, 3, TrainerTeacherHillary, $ffff
	person_event SPRITE_POKE_BALL, 9, 16, $1, $0, 255, 255, $1, 0, ItemFragment_0x1aa5e4, $078a
; 0x1aa97a

