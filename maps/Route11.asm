Route11_MapScriptHeader: ; 0x68000
	; trigger count
	db 0

	; callback count
	db 0
; 0x68002

TrainerYoungsterOwen: ; 0x68002
	; bit/flag number
	dw $5b3

	; trainer group && trainer id
	db YOUNGSTER, OWEN

	; text when seen
	dw YoungsterOwenSeenText

	; text when trainer beaten
	dw YoungsterOwenBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterOwenScript
; 0x6800e

YoungsterOwenScript: ; 0x6800e
	talkaftercancel
	loadfont
	2writetext UnknownText_0x680b2
	closetext
	loadmovesprites
	end
; 0x68016

TrainerYoungsterJason: ; 0x68016
	; bit/flag number
	dw $5b4

	; trainer group && trainer id
	db YOUNGSTER, JASON

	; text when seen
	dw YoungsterJasonSeenText

	; text when trainer beaten
	dw YoungsterJasonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterJasonScript
; 0x68022

YoungsterJasonScript: ; 0x68022
	talkaftercancel
	loadfont
	2writetext UnknownText_0x6814a
	closetext
	loadmovesprites
	end
; 0x6802a

TrainerPsychicHerman: ; 0x6802a
	; bit/flag number
	dw $43c

	; trainer group && trainer id
	db PSYCHIC_T, HERMAN

	; text when seen
	dw PsychicHermanSeenText

	; text when trainer beaten
	dw PsychicHermanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicHermanScript
; 0x68036

PsychicHermanScript: ; 0x68036
	talkaftercancel
	loadfont
	2writetext UnknownText_0x6817b
	closetext
	loadmovesprites
	end
; 0x6803e

TrainerPsychicFidel: ; 0x6803e
	; bit/flag number
	dw $43d

	; trainer group && trainer id
	db PSYCHIC_T, FIDEL

	; text when seen
	dw PsychicFidelSeenText

	; text when trainer beaten
	dw PsychicFidelBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicFidelScript
; 0x6804a

PsychicFidelScript: ; 0x6804a
	talkaftercancel
	loadfont
	2writetext UnknownText_0x681ec
	closetext
	loadmovesprites
	end
; 0x68052

MapRoute11Signpost0Script: ; 0x68052
	jumptext UnknownText_0x68238
; 0x68055

FruitTreeScript_0x68055: ; 0x68055
	fruittree $18
; 0x68057

MapRoute11SignpostItem1: ; 0x68057
	dw $00f5
	db REVIVE
	
; 0x6805a

YoungsterOwenSeenText: ; 0x6805a
	db $0, "There's no cheat-", $4f
	db "ing in #MON.", $51
	db "Let's keep it fair", $4f
	db "and square!", $57
; 0x68097

YoungsterOwenBeatenText: ; 0x68097
	db $0, "Huh? How did this", $4f
	db "happen?", $57
; 0x680b2

UnknownText_0x680b2: ; 0x680b2
	db $0, "I fought fair and", $4f
	db "square with honor.", $51
	db "I don't regret", $4f
	db "this at all.", $57
; 0x680f3

YoungsterJasonSeenText: ; 0x680f3
	db $0, "It itches and", $4f
	db "tickles a bit when", $51
	db "I wear shorts in", $4f
	db "the grass.", $57
; 0x68131

YoungsterJasonBeatenText: ; 0x68131
	db $0, "Aiyaaah!", $4f
	db "I got stomped!", $57
; 0x6814a

UnknownText_0x6814a: ; 0x6814a
	db $0, "I'm going to catch", $4f
	db "more #MON in", $55
	db "the grass.", $57
; 0x68175

PsychicHermanSeenText: ; 0x68175
	db $0, "…", $57
; 0x68178

PsychicHermanBeatenText: ; 0x68178
	db $0, "…", $57
; 0x6817b

UnknownText_0x6817b: ; 0x6817b
	db $0, "…", $51
	db "I lost while I had", $4f
	db "my eyes closed…", $57
; 0x681a1

PsychicFidelSeenText: ; 0x681a1
	db $0, "I can see it…", $51
	db "Everything to see", $4f
	db "about you…", $57
; 0x681cd

PsychicFidelBeatenText: ; 0x681cd
	db $0, "I couldn't foresee", $4f
	db "your power…", $57
; 0x681ec

UnknownText_0x681ec: ; 0x681ec
	db $0, "Strength in con-", $4f
	db "viction…", $51
	db "You're strong be-", $4f
	db "cause you believe", $55
	db "in your #MON.", $57
; 0x68238

UnknownText_0x68238: ; 0x68238
	db $0, "ROUTE 11", $57
; 0x68242

Route11_MapEventHeader: ; 0x68242
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 7, 3, $0, MapRoute11Signpost0Script
	signpost 5, 32, $7, MapRoute11SignpostItem1

	; people-events
	db 5
	person_event SPRITE_YOUNGSTER, 18, 26, $a, $0, 255, 255, $92, 3, TrainerYoungsterOwen, $ffff
	person_event SPRITE_YOUNGSTER, 8, 24, $6, $0, 255, 255, $92, 3, TrainerYoungsterJason, $ffff
	person_event SPRITE_YOUNGSTER, 11, 32, $6, $0, 255, 255, $92, 1, TrainerPsychicHerman, $ffff
	person_event SPRITE_YOUNGSTER, 10, 12, $a, $0, 255, 255, $92, 3, TrainerPsychicFidel, $ffff
	person_event SPRITE_FRUIT_TREE, 6, 36, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x68055, $ffff
; 0x68293

