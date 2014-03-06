CeruleanGym_MapScriptHeader: ; 0x1883cf
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1883d9, $0000
	dw UnknownScript_0x1883da, $0000

	; callback count
	db 0
; 0x1883d9

UnknownScript_0x1883d9: ; 0x1883d9
	end
; 0x1883da

UnknownScript_0x1883da: ; 0x1883da
	priorityjump UnknownScript_0x1883de
	end
; 0x1883de

UnknownScript_0x1883de: ; 0x1883de
	applymovement $2, MovementData_0x1884e3
	playsound $0041
	applymovement $2, MovementData_0x1884eb
	playmusic $0039
	loadfont
	2writetext UnknownText_0x1884fb
	closetext
	loadmovesprites
	showemote $0, $2, 15
	applymovement $2, MovementData_0x1884f7
	loadfont
	2writetext UnknownText_0x188574
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x1884f5
	loadfont
	2writetext UnknownText_0x1885a5
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x1884e8
	playsound $0023
	disappear $2
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent $076c
	clearevent $076e
	dotrigger $0
	domaptrigger GROUP_ROUTE_25, MAP_ROUTE_25, $1
	domaptrigger GROUP_POWER_PLANT, MAP_POWER_PLANT, $0
	waitbutton
	special $003d
	pause 15
	spriteface $0, $0
	pause 15
	end
; 0x188432

MistyScript_0x188432: ; 0x188432
	faceplayer
	loadfont
	checkflag $0024
	iftrue UnknownScript_0x188460
	2writetext UnknownText_0x188674
	closetext
	loadmovesprites
	winlosstext UnknownText_0x18870c, $0000
	loadtrainer MISTY, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SWIMMERM_PARKER
	loadfont
	2writetext UnknownText_0x188768
	playsound $009c
	waitbutton
	setflag $0024
UnknownScript_0x188460: ; 0x188460
	2writetext UnknownText_0x188782
	closetext
	loadmovesprites
	end
; 0x188466

TrainerSwimmerfDiana: ; 0x188466
	; bit/flag number
	dw $3f9

	; trainer group && trainer id
	db SWIMMERF, DIANA

	; text when seen
	dw SwimmerfDianaSeenText

	; text when trainer beaten
	dw SwimmerfDianaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfDianaScript
; 0x188472

SwimmerfDianaScript: ; 0x188472
	talkaftercancel
	loadfont
	2writetext UnknownText_0x188856
	closetext
	loadmovesprites
	end
; 0x18847a

TrainerSwimmerfBriana: ; 0x18847a
	; bit/flag number
	dw $3fa

	; trainer group && trainer id
	db SWIMMERF, BRIANA

	; text when seen
	dw SwimmerfBrianaSeenText

	; text when trainer beaten
	dw SwimmerfBrianaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfBrianaScript
; 0x188486

SwimmerfBrianaScript: ; 0x188486
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1888c0
	closetext
	loadmovesprites
	end
; 0x18848e

TrainerSwimmermParker: ; 0x18848e
	; bit/flag number
	dw $5a8

	; trainer group && trainer id
	db SWIMMERM, PARKER

	; text when seen
	dw SwimmermParkerSeenText

	; text when trainer beaten
	dw SwimmermParkerBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermParkerScript
; 0x18849a

SwimmermParkerScript: ; 0x18849a
	talkaftercancel
	loadfont
	2writetext UnknownText_0x188943
	closetext
	loadmovesprites
	end
; 0x1884a2

CeruleanGymGuyScript: ; 0x1884a2
	faceplayer
	loadfont
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuyWinScript
	2writetext CeruleanGymGuyText
	closetext
	loadmovesprites
	end

.CeruleanGymGuyWinScript
	2writetext CeruleanGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x1884b6

MapCeruleanGymSignpostItem0: ; 0x1884b6
	dw $00fb
	db MACHINE_PART
	
; 0x1884b9

MapCeruleanGymSignpost1Script: ; 0x1884b9
	checkevent $076f
	iffalse UnknownScript_0x1884d3
	loadfont
	2writetext UnknownText_0x188610
	closetext
	loadmovesprites
	end
; 0x1884c6

MapCeruleanGymSignpost2Script: ; 0x1884c6
	checkevent $076f
	iffalse UnknownScript_0x1884d3
	loadfont
	2writetext UnknownText_0x188642
	closetext
	loadmovesprites
	end
; 0x1884d3

UnknownScript_0x1884d3: ; 0x1884d3
	checkflag $0024
	iftrue UnknownScript_0x1884dc
	jumpstd $002d
; 0x1884dc

UnknownScript_0x1884dc: ; 0x1884dc
	trainertotext MISTY, 1, $1
	jumpstd $002e
; 0x1884e3

MovementData_0x1884e3: ; 0x1884e3
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
; 0x1884e8

MovementData_0x1884e8: ; 0x1884e8
	big_step_right
	big_step_down
	step_end
; 0x1884eb

MovementData_0x1884eb: ; 0x1884eb
	fix_facing
	db $39 ; movement
	jump_step_up
	db $38 ; movement
	remove_fixed_facing
	accelerate_last
	accelerate_last
	step_down
	step_down
	step_end
; 0x1884f5

MovementData_0x1884f5: ; 0x1884f5
	big_step_down
	step_end
; 0x1884f7

MovementData_0x1884f7: ; 0x1884f7
	fix_facing
	slow_step_up
	remove_fixed_facing
	step_end
; 0x1884fb

UnknownText_0x1884fb: ; 0x1884fb
	text "Oops! I so sorry!"
	line "You not hurt,"
	cont "okay?"

	para "I very busy."
	line "No time for talk-"
	cont "ing with you. Not"
	cont "good for me if"
	cont "seen by somebody."
	done
; 0x188574

UnknownText_0x188574: ; 0x188574
	text "Oh no! You seen"
	line "me already! I make"
	cont "big mistake!"
	done
; 0x1885a5

UnknownText_0x1885a5: ; 0x1885a5
	text "Hey, you! Forget"
	line "you see me, okay?"

	para "You see, hear,"
	line "know nothing,"

	para "okay?"
	line "Bye, kid! Nothing!"

	para "Bye-bye a go-go!"
	done
; 0x188610

UnknownText_0x188610: ; 0x188610
	text "Sorry, I'll be out"
	line "for a while."
	cont "MISTY, GYM LEADER"
	done
; 0x188642

UnknownText_0x188642: ; 0x188642
	text "Since MISTY's out,"
	line "we'll be away too."
	cont "GYM TRAINERS"
	done
; 0x188674

UnknownText_0x188674: ; 0x188674
	text "MISTY: I was ex-"
	line "pecting you, you"
	cont "pest!"

	para "You may have a"
	line "lot of JOHTO GYM"

	para "BADGES, but you'd"
	line "better not take me"
	cont "too lightly."

	para "My water-type"
	line "#MON are tough!"
	done
; 0x18870c

UnknownText_0x18870c: ; 0x18870c
	text "MISTY: You really"
	line "are good…"

	para "I'll admit that"
	line "you are skilled…"

	para "Here you go. It's"
	line "CASCADEBADGE."
	done
; 0x188768

UnknownText_0x188768: ; 0x188768
	text $52, " received"
	line "CASCADEBADGE."
	done
; 0x188782

UnknownText_0x188782: ; 0x188782
	text "MISTY: Are there"
	line "many strong train-"
	cont "ers in JOHTO? Like"
	cont "you, I mean."

	para "I'm going to"
	line "travel one day, so"

	para "I can battle some"
	line "skilled trainers."
	done
; 0x18880a

SwimmerfDianaSeenText: ; 0x18880a
	text "Sorry about being"
	line "away. Let's get on"
	cont "with it!"
	done
; 0x188838

SwimmerfDianaBeatenText: ; 0x188838
	text "I give up! You're"
	line "the winner!"
	done
; 0x188856

UnknownText_0x188856: ; 0x188856
	text "I'll be swimming"
	line "quietly."
	done
; 0x188870

SwimmerfBrianaSeenText: ; 0x188870
	text "Don't let my ele-"
	line "gant swimming un-"
	cont "nerve you."
	done
; 0x18889f

SwimmerfBrianaBeatenText: ; 0x18889f
	text "Ooh, you calmly"
	line "disposed of me…"
	done
; 0x1888c0

UnknownText_0x1888c0: ; 0x1888c0
	text "Don't be too smug"
	line "about beating me."

	para "MISTY will destroy"
	line "you if you get"
	cont "complacent."
	done
; 0x188912

SwimmermParkerSeenText: ; 0x188912
	text "Glub…"

	para "I'm first! Come"
	line "and get me!"
	done
; 0x188934

SwimmermParkerBeatenText: ; 0x188934
	text "This can't be…"
	done
; 0x188943

UnknownText_0x188943: ; 0x188943
	text "MISTY has gotten"
	line "much better in the"
	cont "past few years."

	para "Don't let your"
	line "guard down, or"
	cont "you'll be crushed!"
	done
; 0x1889a7

CeruleanGymGuyText: ; 0x1889a7
	text "Yo! CHAMP in"
	line "making!"

	para "Since MISTY was"
	line "away, I went out"

	para "for some fun too."
	line "He-he-he."
	done
; 0x1889fa

CeruleanGymGuyWinText: ; 0x1889fa
	text "Hoo, you showed me"
	line "how tough you are."

	para "As always, that"
	line "was one heck of a"
	cont "great battle!"
	done
; 0x188a51

CeruleanGym_MapEventHeader: ; 0x188a51
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $4, 5, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $f, $5, 5, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 8, 3, $7, MapCeruleanGymSignpostItem0
	signpost 13, 2, $0, MapCeruleanGymSignpost1Script
	signpost 13, 6, $0, MapCeruleanGymSignpost2Script

	; people-events
	db 6
	person_event SPRITE_ROCKET, 14, 8, $6, $0, 255, 255, $0, 0, ObjectEvent, $076d
	person_event SPRITE_MISTY, 7, 9, $6, $0, 255, 255, $80, 0, MistyScript_0x188432, $076f
	person_event SPRITE_SWIMMER_GIRL, 10, 8, $9, $0, 255, 255, $a2, 3, TrainerSwimmerfDiana, $076f
	person_event SPRITE_SWIMMER_GIRL, 13, 5, $9, $0, 255, 255, $a2, 1, TrainerSwimmerfBriana, $076f
	person_event SPRITE_SWIMMER_GUY, 13, 12, $8, $0, 255, 255, $82, 3, TrainerSwimmermParker, $076f
	person_event SPRITE_GYM_GUY, 17, 11, $6, $0, 255, 255, $90, 0, CeruleanGymGuyScript, $076f
; 0x188abe

