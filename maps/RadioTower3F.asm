RadioTower3F_MapScriptHeader: ; 0x5e53e
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x5e543
; 0x5e543

UnknownScript_0x5e543: ; 0x5e543
	checkbit1 EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue UnknownScript_0x5e54a
	return
; 0x5e54a

UnknownScript_0x5e54a: ; 0x5e54a
	changeblock $e, $2, $2a
	changeblock $e, $4, $1
	return
; 0x5e553

SuperNerdScript_0x5e553: ; 0x5e553
	jumptextfaceplayer UnknownText_0x5e621
; 0x5e556

GymGuyScript_0x5e556: ; 0x5e556
	faceplayer
	loadfont
	checkbit1 EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x5e564
	2writetext UnknownText_0x5e682
	closetext
	loadmovesprites
	end
; 0x5e564

UnknownScript_0x5e564: ; 0x5e564
	2writetext UnknownText_0x5e6eb
	closetext
	loadmovesprites
	end
; 0x5e56a

CooltrainerFScript_0x5e56a: ; 0x5e56a
	faceplayer
	loadfont
	checkbit1 EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	iftrue UnknownScript_0x5e59d
	checkbit1 EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x5e58a
	checkbit1 EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue UnknownScript_0x5e584
	2writetext UnknownText_0x5e754
	closetext
	loadmovesprites
	end
; 0x5e584

UnknownScript_0x5e584: ; 0x5e584
	2writetext UnknownText_0x5e7cb
	closetext
	loadmovesprites
	end
; 0x5e58a

UnknownScript_0x5e58a: ; 0x5e58a
	2writetext UnknownText_0x5e7e2
	keeptextopen
	verbosegiveitem TM_11, 1
	iffalse UnknownScript_0x5e5a1
	2writetext UnknownText_0x5e821
	closetext
	loadmovesprites
	setbit1 EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	end
; 0x5e59d

UnknownScript_0x5e59d: ; 0x5e59d
	2writetext UnknownText_0x5e85c
	closetext
UnknownScript_0x5e5a1: ; 0x5e5a1
	loadmovesprites
	end
; 0x5e5a3

TrainerGruntM7: ; 0x5e5a3
	; bit/flag number
	dw $4f7

	; trainer group && trainer id
	db GRUNTM, 7

	; text when seen
	dw GruntM7SeenText

	; text when trainer beaten
	dw GruntM7BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM7Script
; 0x5e5af

GruntM7Script: ; 0x5e5af
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5e8d0
	closetext
	loadmovesprites
	end
; 0x5e5b7

TrainerGruntM8: ; 0x5e5b7
	; bit/flag number
	dw $4f8

	; trainer group && trainer id
	db GRUNTM, 8

	; text when seen
	dw GruntM8SeenText

	; text when trainer beaten
	dw GruntM8BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM8Script
; 0x5e5c3

GruntM8Script: ; 0x5e5c3
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5e944
	closetext
	loadmovesprites
	end
; 0x5e5cb

TrainerGruntM9: ; 0x5e5cb
	; bit/flag number
	dw $4f9

	; trainer group && trainer id
	db GRUNTM, 9

	; text when seen
	dw GruntM9SeenText

	; text when trainer beaten
	dw GruntM9BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM9Script
; 0x5e5d7

GruntM9Script: ; 0x5e5d7
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5e9d0
	closetext
	loadmovesprites
	end
; 0x5e5df

TrainerScientistMarc: ; 0x5e5df
	; bit/flag number
	dw $4a2

	; trainer group && trainer id
	db SCIENTIST, MARC

	; text when seen
	dw ScientistMarcSeenText

	; text when trainer beaten
	dw ScientistMarcBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw ScientistMarcScript
; 0x5e5eb

ScientistMarcScript: ; 0x5e5eb
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5ea61
	closetext
	loadmovesprites
	end
; 0x5e5f3

MapRadioTower3FSignpost2Script: ; 0x5e5f3
	loadfont
	2writetext UnknownText_0x5eaa4
	closetext
	checkbit1 EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue UnknownScript_0x5e603
	checkitem CARD_KEY
	iftrue UnknownScript_0x5e605
UnknownScript_0x5e603: ; 0x5e603
	loadmovesprites
	end
; 0x5e605

UnknownScript_0x5e605: ; 0x5e605
	2writetext UnknownText_0x5eabc
	closetext
	setbit1 EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound $001f
	changeblock $e, $2, $2a
	changeblock $e, $4, $1
	reloadmappart
	loadmovesprites
	waitbutton
	end
; 0x5e61b

MapRadioTower3FSignpost0Script: ; 0x5e61b
	jumptext UnknownText_0x5ead6
; 0x5e61e

MapRadioTower3FSignpost1Script: ; 0x5e61e
	jumptext UnknownText_0x5eae4
; 0x5e621

UnknownText_0x5e621: ; 0x5e621
	db $0, "We have recordings", $4f
	db "of the cries of", $51
	db "all #MON that", $4f
	db "have been found.", $51
	db "We must have about", $4f
	db "200 kinds.", $57
; 0x5e682

UnknownText_0x5e682: ; 0x5e682
	db $0, "To trainers, #-", $4f
	db "MON are their", $55
	db "beloved partners.", $51
	db "It's terrible how", $4f
	db "TEAM ROCKET is", $51
	db "trying to control", $4f
	db "#MON.", $57
; 0x5e6eb

UnknownText_0x5e6eb: ; 0x5e6eb
	db $0, "We run 24 hours a", $4f
	db "day to broadcast", $51
	db "entertaining pro-", $4f
	db "grams.", $51
	db "I'll do my best to", $4f
	db "run around the", $55
	db "clock too!", $57
; 0x5e754

UnknownText_0x5e754: ; 0x5e754
	db $0, "The TEAM ROCKET", $4f
	db "boss has locked", $55
	db "himself in.", $51
	db "But the DIRECTOR", $4f
	db "can open it.", $51
	db "He's up on the", $4f
	db "fifth floor.", $51
	db "Please save him!", $57
; 0x5e7cb

UnknownText_0x5e7cb: ; 0x5e7cb
	db $0, "Is the DIRECTOR", $4f
	db "safe?", $57
; 0x5e7e2

UnknownText_0x5e7e2: ; 0x5e7e2
	db $0, "Thank you!", $4f
	db "You're my hero!", $51
	db "This is a token of", $4f
	db "my appreciation.", $57
; 0x5e821

UnknownText_0x5e821: ; 0x5e821
	db $0, "It's SUNNY DAY.", $4f
	db "It powers up fire-", $55
	db "type moves for a", $55
	db "while.", $57
; 0x5e85c

UnknownText_0x5e85c: ; 0x5e85c
	db $0, "You were simply", $4f
	db "marvelous!", $57
; 0x5e878

GruntM7SeenText: ; 0x5e878
	db $0, "I've been given", $4f
	db "strict orders.", $51
	db "I'm to crush any-", $4f
	db "one who challenges", $55
	db "TEAM ROCKET!", $57
; 0x5e8c8

GruntM7BeatenText: ; 0x5e8c8
	db $0, "What?!", $57
; 0x5e8d0

UnknownText_0x5e8d0: ; 0x5e8d0
	db $0, "I failed in my", $4f
	db "duties…", $51
	db "I'll be docked pay", $4f
	db "for this…", $57
; 0x5e904

GruntM8SeenText: ; 0x5e904
	db $0, "It feels great", $4f
	db "ordering #MON", $55
	db "to commit crimes.", $57
; 0x5e934

GruntM8BeatenText: ; 0x5e934
	db $0, "You're kidding!", $57
; 0x5e944

UnknownText_0x5e944: ; 0x5e944
	db $0, "I feel lousy over", $4f
	db "losing!", $51
	db "Darn it! I hate", $4f
	db "useless #MON!", $57
; 0x5e97d

GruntM9SeenText: ; 0x5e97d
	db $0, "Why did the shut-", $4f
	db "ter open? Did you", $51
	db "have something to", $4f
	db "do with this?", $57
; 0x5e9c2

GruntM9BeatenText: ; 0x5e9c2
	db $0, "I'm done for!", $57
; 0x5e9d0

UnknownText_0x5e9d0: ; 0x5e9d0
	db $0, "What?! You made it", $4f
	db "past our men in", $55
	db "the UNDERGROUND?", $51
	db "How could you?", $57
; 0x5ea14

ScientistMarcSeenText: ; 0x5ea14
	db $0, "An unknown child", $4f
	db "wandering here?", $51
	db "Who are you?", $57
; 0x5ea43

ScientistMarcBeatenText: ; 0x5ea43
	db $0, "Tch! I took you", $4f
	db "too lightly!", $57
; 0x5ea61

UnknownText_0x5ea61: ; 0x5ea61
	db $0, "Bwahahaha…", $51
	db "I can transmit as", $4f
	db "strong a signal as", $55
	db "I need from here.", $57
; 0x5eaa4

UnknownText_0x5eaa4: ; 0x5eaa4
	db $0, "It's the CARD KEY", $4f
	db "slot.", $57
; 0x5eabc

UnknownText_0x5eabc: ; 0x5eabc
	db $0, $52, " inserted", $4f
	db "the CARD KEY.", $57
; 0x5ead6

UnknownText_0x5ead6: ; 0x5ead6
	db $0, "3F PERSONNEL", $57
; 0x5eae4

UnknownText_0x5eae4: ; 0x5eae4
	db $0, "#MON MUSIC with", $4f
	db "Host DJ BEN", $57
; 0x5eb01

RadioTower3F_MapEventHeader: ; 0x5eb01
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $0, 1, GROUP_RADIO_TOWER_2F, MAP_RADIO_TOWER_2F
	warp_def $0, $7, 2, GROUP_RADIO_TOWER_4F, MAP_RADIO_TOWER_4F
	warp_def $0, $11, 4, GROUP_RADIO_TOWER_4F, MAP_RADIO_TOWER_4F

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 0, 3, $0, MapRadioTower3FSignpost0Script
	signpost 0, 9, $0, MapRadioTower3FSignpost1Script
	signpost 2, 14, $1, MapRadioTower3FSignpost2Script

	; people-events
	db 7
	person_event SPRITE_SUPER_NERD, 8, 11, $7, $0, 255, 255, $90, 0, SuperNerdScript_0x5e553, $06d0
	person_event SPRITE_GYM_GUY, 8, 7, $a, $0, 255, 255, $80, 0, GymGuyScript_0x5e556, $ffff
	person_event SPRITE_COOLTRAINER_F, 7, 15, $2, $11, 255, 255, $a0, 0, CooltrainerFScript_0x5e56a, $ffff
	person_event SPRITE_ROCKET, 5, 9, $9, $0, 255, 255, $2, 2, TrainerGruntM7, $06ce
	person_event SPRITE_ROCKET, 6, 10, $6, $0, 255, 255, $2, 3, TrainerGruntM8, $06ce
	person_event SPRITE_ROCKET, 10, 20, $7, $0, 255, 255, $2, 3, TrainerGruntM9, $06ce
	person_event SPRITE_SCIENTIST, 10, 13, $7, $0, 255, 255, $92, 5, TrainerScientistMarc, $06ce
; 0x5eb80

