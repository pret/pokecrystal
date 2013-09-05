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
	setbit1 EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearbit1 $076c
	clearbit1 $076e
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
	checkbit2 $0024
	iftrue UnknownScript_0x188460
	2writetext UnknownText_0x188674
	closetext
	loadmovesprites
	winlosstext UnknownText_0x18870c, $0000
	loadtrainer MISTY, 1
	startbattle
	returnafterbattle
	setbit1 EVENT_BEAT_MISTY
	setbit1 EVENT_BEAT_SWIMMERF_DIANA
	setbit1 EVENT_BEAT_SWIMMERF_BRIANA
	setbit1 EVENT_BEAT_SWIMMERM_PARKER
	loadfont
	2writetext UnknownText_0x188768
	playsound $009c
	waitbutton
	setbit2 $0024
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
	checkbit1 EVENT_BEAT_MISTY
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
	checkbit1 $076f
	iffalse UnknownScript_0x1884d3
	loadfont
	2writetext UnknownText_0x188610
	closetext
	loadmovesprites
	end
; 0x1884c6

MapCeruleanGymSignpost2Script: ; 0x1884c6
	checkbit1 $076f
	iffalse UnknownScript_0x1884d3
	loadfont
	2writetext UnknownText_0x188642
	closetext
	loadmovesprites
	end
; 0x1884d3

UnknownScript_0x1884d3: ; 0x1884d3
	checkbit2 $0024
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
	db $0, "Oops! I so sorry!", $4f
	db "You not hurt,", $55
	db "okay?", $51
	db "I very busy.", $4f
	db "No time for talk-", $55
	db "ing with you. Not", $55
	db "good for me if", $55
	db "seen by somebody.", $57
; 0x188574

UnknownText_0x188574: ; 0x188574
	db $0, "Oh no! You seen", $4f
	db "me already! I make", $55
	db "big mistake!", $57
; 0x1885a5

UnknownText_0x1885a5: ; 0x1885a5
	db $0, "Hey, you! Forget", $4f
	db "you see me, okay?", $51
	db "You see, hear,", $4f
	db "know nothing,", $51
	db "okay?", $4f
	db "Bye, kid! Nothing!", $51
	db "Bye-bye a go-go!", $57
; 0x188610

UnknownText_0x188610: ; 0x188610
	db $0, "Sorry, I'll be out", $4f
	db "for a while.", $55
	db "MISTY, GYM LEADER", $57
; 0x188642

UnknownText_0x188642: ; 0x188642
	db $0, "Since MISTY's out,", $4f
	db "we'll be away too.", $55
	db "GYM TRAINERS", $57
; 0x188674

UnknownText_0x188674: ; 0x188674
	db $0, "MISTY: I was ex-", $4f
	db "pecting you, you", $55
	db "pest!", $51
	db "You may have a", $4f
	db "lot of JOHTO GYM", $51
	db "BADGES, but you'd", $4f
	db "better not take me", $55
	db "too lightly.", $51
	db "My water-type", $4f
	db "#MON are tough!", $57
; 0x18870c

UnknownText_0x18870c: ; 0x18870c
	db $0, "MISTY: You really", $4f
	db "are good…", $51
	db "I'll admit that", $4f
	db "you are skilled…", $51
	db "Here you go. It's", $4f
	db "CASCADEBADGE.", $57
; 0x188768

UnknownText_0x188768: ; 0x188768
	db $0, $52, " received", $4f
	db "CASCADEBADGE.", $57
; 0x188782

UnknownText_0x188782: ; 0x188782
	db $0, "MISTY: Are there", $4f
	db "many strong train-", $55
	db "ers in JOHTO? Like", $55
	db "you, I mean.", $51
	db "I'm going to", $4f
	db "travel one day, so", $51
	db "I can battle some", $4f
	db "skilled trainers.", $57
; 0x18880a

SwimmerfDianaSeenText: ; 0x18880a
	db $0, "Sorry about being", $4f
	db "away. Let's get on", $55
	db "with it!", $57
; 0x188838

SwimmerfDianaBeatenText: ; 0x188838
	db $0, "I give up! You're", $4f
	db "the winner!", $57
; 0x188856

UnknownText_0x188856: ; 0x188856
	db $0, "I'll be swimming", $4f
	db "quietly.", $57
; 0x188870

SwimmerfBrianaSeenText: ; 0x188870
	db $0, "Don't let my ele-", $4f
	db "gant swimming un-", $55
	db "nerve you.", $57
; 0x18889f

SwimmerfBrianaBeatenText: ; 0x18889f
	db $0, "Ooh, you calmly", $4f
	db "disposed of me…", $57
; 0x1888c0

UnknownText_0x1888c0: ; 0x1888c0
	db $0, "Don't be too smug", $4f
	db "about beating me.", $51
	db "MISTY will destroy", $4f
	db "you if you get", $55
	db "complacent.", $57
; 0x188912

SwimmermParkerSeenText: ; 0x188912
	db $0, "Glub…", $51
	db "I'm first! Come", $4f
	db "and get me!", $57
; 0x188934

SwimmermParkerBeatenText: ; 0x188934
	db $0, "This can't be…", $57
; 0x188943

UnknownText_0x188943: ; 0x188943
	db $0, "MISTY has gotten", $4f
	db "much better in the", $55
	db "past few years.", $51
	db "Don't let your", $4f
	db "guard down, or", $55
	db "you'll be crushed!", $57
; 0x1889a7

CeruleanGymGuyText: ; 0x1889a7
	db $0, "Yo! CHAMP in", $4f
	db "making!", $51
	db "Since MISTY was", $4f
	db "away, I went out", $51
	db "for some fun too.", $4f
	db "He-he-he.", $57
; 0x1889fa

CeruleanGymGuyWinText: ; 0x1889fa
	db $0, "Hoo, you showed me", $4f
	db "how tough you are.", $51
	db "As always, that", $4f
	db "was one heck of a", $55
	db "great battle!", $57
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

