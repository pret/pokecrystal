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
	db $0, "Have you forgotten", $4f
	db "anything?", $57
; 0x1aa604

TeacherColetteBeatenText: ; 0x1aa604
	db $0, "Kyaaah!", $57
; 0x1aa60d

UnknownText_0x1aa60d: ; 0x1aa60d
	db $0, "Before I became a", $4f
	db "teacher, I used to", $51
	db "forget a lot of", $4f
	db "things.", $57
; 0x1aa64b

TeacherHillarySeenText: ; 0x1aa64b
	db $0, "On sunny days, I", $4f
	db "think that the", $51
	db "kids would rather", $4f
	db "be playing in the", $51
	db "schoolyard than", $4f
	db "studying in class.", $57
; 0x1aa6b3

TeacherHillaryBeatenText: ; 0x1aa6b3
	db $0, "I didn't want to", $4f
	db "lose…", $57
; 0x1aa6ca

UnknownText_0x1aa6ca: ; 0x1aa6ca
	db $0, "Studying is impor-", $4f
	db "tant, but exercise", $55
	db "is just as vital.", $57
; 0x1aa703

SchoolboyKippSeenText: ; 0x1aa703
	db $0, "Hang on. I have to", $4f
	db "phone my mom.", $57
; 0x1aa725

SchoolboyKippBeatenText: ; 0x1aa725
	db $0, "Sorry, Mom!", $4f
	db "I was beaten!", $57
; 0x1aa740

UnknownText_0x1aa740: ; 0x1aa740
	db $0, "My mom worries so", $4f
	db "much about me, I", $51
	db "have to phone her", $4f
	db "all the time.", $57
; 0x1aa784

SchoolboyTommySeenText: ; 0x1aa784
	db $0, "Let's battle.", $4f
	db "I won't lose!", $57
; 0x1aa79f

SchoolboyTommyBeatenText: ; 0x1aa79f
	db $0, "I forgot to do my", $4f
	db "homework!", $57
; 0x1aa7bc

UnknownText_0x1aa7bc: ; 0x1aa7bc
	db $0, "Sayonara! I just", $4f
	db "learned that in my", $55
	db "Japanese class.", $57
; 0x1aa7f1

SchoolboyJohnnySeenText: ; 0x1aa7f1
	db $0, "We're on a field", $4f
	db "trip to LAVENDER", $51
	db "RADIO TOWER for", $4f
	db "social studies.", $57
; 0x1aa833

SchoolboyJohnnyBeatenText: ; 0x1aa833
	db $0, "You're wickedly", $4f
	db "tough!", $57
; 0x1aa84a

UnknownText_0x1aa84a: ; 0x1aa84a
	db $0, "I'm tired of walk-", $4f
	db "ing. I need to", $55
	db "take a break.", $57
; 0x1aa87a

SchoolboyBillySeenText: ; 0x1aa87a
	db $0, "My favorite class", $4f
	db "is gym!", $57
; 0x1aa895

SchoolboyBillyBeatenText: ; 0x1aa895
	db $0, "Oh, no!", $4f
	db "How could I lose?", $57
; 0x1aa8b0

UnknownText_0x1aa8b0: ; 0x1aa8b0
	db $0, "If #MON were a", $4f
	db "subject at school,", $55
	db "I'd be the best!", $57
; 0x1aa8e3

UnknownText_0x1aa8e3: ; 0x1aa8e3
	db $0, "ROUTE 15", $51
	db "FUCHSIA CITY -", $4f
	db "LAVENDER TOWN", $57
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

