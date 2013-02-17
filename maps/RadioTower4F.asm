RadioTower4F_MapScriptHeader: ; 0x5eb80
	; trigger count
	db 0

	; callback count
	db 0
; 0x5eb82

UnknownScript_0x5eb82: ; 0x5eb82
	jumptextfaceplayer UnknownText_0x5ec12
; 0x5eb85

UnknownScript_0x5eb85: ; 0x5eb85
	faceplayer
	loadfont
	checkbit1 $0048
	iftrue UnknownScript_0x5ebac
	checkbit1 $0021
	iftrue UnknownScript_0x5eb99
	2writetext UnknownText_0x5ec68
	closetext
	loadmovesprites
	end
; 0x5eb99

UnknownScript_0x5eb99: ; 0x5eb99
	2writetext UnknownText_0x5ecab
	keeptextopen
	verbosegiveitem PINK_BOW, 1
	iffalse UnknownScript_0x5ebb0
	2writetext UnknownText_0x5ecef
	closetext
	loadmovesprites
	setbit1 $0048
	end
; 0x5ebac

UnknownScript_0x5ebac: ; 0x5ebac
	2writetext UnknownText_0x5ed2c
	closetext
UnknownScript_0x5ebb0: ; 0x5ebb0
	loadmovesprites
	end
; 0x5ebb2

UnknownScript_0x5ebb2: ; 0x5ebb2
	loadfont
	2writetext UnknownText_0x5ed66
	cry MEOWTH
	closetext
	loadmovesprites
	end
; 0x5ebbc

TrainerGruntM10: ; 0x5ebbc
	; bit/flag number
	dw $4fa

	; trainer group && trainer id
	db GRUNTM, 10

	; text when seen
	dw GruntM10SeenText

	; text when trainer beaten
	dw GruntM10BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM10Script
; 0x5ebc8

GruntM10Script: ; 0x5ebc8
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5ede2
	closetext
	loadmovesprites
	end
; 0x5ebd0

TrainerExecutivem2: ; 0x5ebd0
	; bit/flag number
	dw $572

	; trainer group && trainer id
	db EXECUTIVEM, 2

	; text when seen
	dw Executivem2SeenText

	; text when trainer beaten
	dw Executivem2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Executivem2Script
; 0x5ebdc

Executivem2Script: ; 0x5ebdc
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5ee69
	closetext
	loadmovesprites
	end
; 0x5ebe4

TrainerGruntF4: ; 0x5ebe4
	; bit/flag number
	dw $513

	; trainer group && trainer id
	db GRUNTF, 4

	; text when seen
	dw GruntF4SeenText

	; text when trainer beaten
	dw GruntF4BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntF4Script
; 0x5ebf0

GruntF4Script: ; 0x5ebf0
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5ef31
	closetext
	loadmovesprites
	end
; 0x5ebf8

TrainerScientistRich: ; 0x5ebf8
	; bit/flag number
	dw $4a3

	; trainer group && trainer id
	db SCIENTIST, RICH

	; text when seen
	dw ScientistRichSeenText

	; text when trainer beaten
	dw ScientistRichBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw ScientistRichScript
; 0x5ec04

ScientistRichScript: ; 0x5ec04
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5efcb
	closetext
	loadmovesprites
	end
; 0x5ec0c

MapRadioTower4FSignpost0Script: ; 0x5ec0c
	jumptext UnknownText_0x5effe
; 0x5ec0f

MapRadioTower4FSignpost1Script: ; 0x5ec0f
	jumptext UnknownText_0x5f00d
; 0x5ec12

UnknownText_0x5ec12: ; 0x5ec12
	db $0, "I listened to the", $4f
	db "radio while I was", $55
	db "at the RUINS.", $51
	db "I heard a strange", $4f
	db "broadcast there.", $57
; 0x5ec68

UnknownText_0x5ec68: ; 0x5ec68
	db $0, "MARY: Why? Why do", $4f
	db "I have to suffer", $55
	db "through this?", $51
	db "MEOWTH, help me!", $57
; 0x5ecab

UnknownText_0x5ecab: ; 0x5ecab
	db $0, "MARY: Oh! You're", $4f
	db "my little savior!", $51
	db "Will you take this", $4f
	db "as my thanks?", $57
; 0x5ecef

UnknownText_0x5ecef: ; 0x5ecef
	db $0, "MARY: It's just", $4f
	db "right for #MON", $51
	db "that know normal-", $4f
	db "type moves.", $57
; 0x5ed2c

UnknownText_0x5ed2c: ; 0x5ed2c
	db $0, "MARY: Please tune", $4f
	db "into me on PROF.", $51
	db "OAK'S #MON TALK", $4f
	db "show.", $57
; 0x5ed66

UnknownText_0x5ed66: ; 0x5ed66
	db $0, "MEOWTH: Meowth…", $57
; 0x5ed77

GruntM10SeenText: ; 0x5ed77
	db $0, "You plan to rescue", $4f
	db "the DIRECTOR?", $51
	db "That won't be pos-", $4f
	db "sible because I'm", $55
	db "going to beat you!", $57
; 0x5edcf

GruntM10BeatenText: ; 0x5edcf
	db $0, "No! Unbelievable!", $57
; 0x5ede2

UnknownText_0x5ede2: ; 0x5ede2
	db $0, "I don't believe", $4f
	db "it! I was beaten!", $57
; 0x5ee04

Executivem2SeenText: ; 0x5ee04
	db $0, "Stop! I'm known as", $4f
	db "the TEAM ROCKET", $55
	db "fortress!", $51
	db "You're not taking", $4f
	db "another step!", $57
; 0x5ee50

Executivem2BeatenText: ; 0x5ee50
	db $0, "The fortress came", $4f
	db "down!", $57
; 0x5ee69

UnknownText_0x5ee69: ; 0x5ee69
	db $0, "You've earned my", $4f
	db "respect, so here's", $55
	db "some advice.", $51
	db "It's not too late.", $4f
	db "You can still turn", $55
	db "back.", $57
; 0x5eec4

GruntF4SeenText: ; 0x5eec4
	db $0, "Don't I think", $4f
	db "#MON are cute?", $51
	db "I'll think my", $4f
	db "#MON are cute--", $51
	db "after they beat", $4f
	db "yours!", $57
; 0x5ef15

GruntF4BeatenText: ; 0x5ef15
	db $0, "Oh, no! They're so", $4f
	db "useless!", $57
; 0x5ef31

UnknownText_0x5ef31: ; 0x5ef31
	db $0, "I love my", $4f
	db "beautiful self!", $51
	db "Who cares about", $4f
	db "#MON?", $57
; 0x5ef62

ScientistRichSeenText: ; 0x5ef62
	db $0, "Most excellent.", $51
	db "This RADIO TOWER", $4f
	db "will fulfill our", $55
	db "grand design.", $57
; 0x5efa3

ScientistRichBeatenText: ; 0x5efa3
	db $0, "Hmmm…", $51
	db "All grand plans", $4f
	db "come with snags.", $57
; 0x5efcb

UnknownText_0x5efcb: ; 0x5efcb
	db $0, "Do you honestly", $4f
	db "believe you can", $55
	db "stop TEAM ROCKET?", $57
; 0x5effe

UnknownText_0x5effe: ; 0x5effe
	db $0, "4F PRODUCTION", $57
; 0x5f00d

UnknownText_0x5f00d: ; 0x5f00d
	db $0, "4F STUDIO 2", $57
; 0x5f01a

RadioTower4F_MapEventHeader: ; 0x5f01a
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $0, 1, GROUP_RADIO_TOWER_5F, MAP_RADIO_TOWER_5F
	warp_def $0, $9, 2, GROUP_RADIO_TOWER_3F, MAP_RADIO_TOWER_3F
	warp_def $0, $c, 2, GROUP_RADIO_TOWER_5F, MAP_RADIO_TOWER_5F
	warp_def $0, $11, 3, GROUP_RADIO_TOWER_3F, MAP_RADIO_TOWER_3F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 7, $0, MapRadioTower4FSignpost0Script
	signpost 0, 15, $0, MapRadioTower4FSignpost1Script

	; people-events
	db 7
	person_event $3a, 8, 10, $7, $0, 255, 255, $80, 0, UnknownScript_0x5eb82, $06d0
	person_event $29, 10, 18, $3, $0, 255, 255, $a0, 0, UnknownScript_0x5eb85, $ffff
	person_event $82, 11, 16, $16, $0, 255, 255, $80, 0, UnknownScript_0x5ebb2, $ffff
	person_event $35, 10, 9, $1f, $0, 255, 255, $2, 3, TrainerGruntM10, $06ce
	person_event $35, 5, 18, $8, $2, 255, 255, $2, 2, TrainerExecutivem2, $06ce
	person_event $36, 8, 16, $9, $0, 255, 255, $82, 1, TrainerGruntF4, $06ce
	person_event $3c, 6, 8, $8, $0, 255, 255, $92, 4, TrainerScientistRich, $06ce
; 0x5f099



