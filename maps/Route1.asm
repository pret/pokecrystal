Route1_MapScriptHeader: ; 0x1ac554
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac556

TrainerSchoolboyDanny: ; 0x1ac556
	; bit/flag number
	dw $470

	; trainer group && trainer id
	db SCHOOLBOY, DANNY

	; text when seen
	dw SchoolboyDannySeenText

	; text when trainer beaten
	dw SchoolboyDannyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyDannyScript
; 0x1ac562

SchoolboyDannyScript: ; 0x1ac562
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac5d7
	closetext
	loadmovesprites
	end
; 0x1ac56a

TrainerCooltrainerfQuinn: ; 0x1ac56a
	; bit/flag number
	dw $568

	; trainer group && trainer id
	db COOLTRAINERF, QUINN

	; text when seen
	dw CooltrainerfQuinnSeenText

	; text when trainer beaten
	dw CooltrainerfQuinnBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfQuinnScript
; 0x1ac576

CooltrainerfQuinnScript: ; 0x1ac576
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac640
	closetext
	loadmovesprites
	end
; 0x1ac57e

MapRoute1Signpost0Script: ; 0x1ac57e
	jumptext UnknownText_0x1ac675
; 0x1ac581

FruitTreeScript_0x1ac581: ; 0x1ac581
	fruittree $1a
; 0x1ac583

SchoolboyDannySeenText: ; 0x1ac583
	text "If trainers meet,"
	line "the first thing to"
	cont "do is battle."
	done
; 0x1ac5b7

SchoolboyDannyBeatenText: ; 0x1ac5b7
	text "Awww… I've got a"
	line "losing record…"
	done
; 0x1ac5d7

UnknownText_0x1ac5d7: ; 0x1ac5d7
	text "For trainers, it's"
	line "a given that we'll"

	para "battle whenever we"
	line "meet."
	done
; 0x1ac615

CooltrainerfQuinnSeenText: ; 0x1ac615
	text "You there!"
	line "Want to battle?"
	done
; 0x1ac631

CooltrainerfQuinnBeatenText: ; 0x1ac631
	text "Down and out…"
	done
; 0x1ac640

UnknownText_0x1ac640: ; 0x1ac640
	text "You're strong."

	para "You obviously must"
	line "have trained hard."
	done
; 0x1ac675

UnknownText_0x1ac675: ; 0x1ac675
	text "ROUTE 1"

	para "PALLET TOWN -"
	line "VIRIDIAN CITY"
	done
; 0x1ac69a

Route1_MapEventHeader: ; 0x1ac69a
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 27, 7, $0, MapRoute1Signpost0Script

	; people-events
	db 3
	person_event SPRITE_YOUNGSTER, 16, 8, $9, $0, 255, 255, $92, 4, TrainerSchoolboyDanny, $ffff
	person_event SPRITE_COOLTRAINER_F, 29, 13, $a, $0, 255, 255, $82, 2, TrainerCooltrainerfQuinn, $ffff
	person_event SPRITE_FRUIT_TREE, 11, 7, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1ac581, $ffff
; 0x1ac6cc
