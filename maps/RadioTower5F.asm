RadioTower5F_MapScriptHeader: ; 0x60000
	; trigger count
	db 3

	; triggers
	dw UnknownScript_0x6000e, $0000
	dw UnknownScript_0x6000f, $0000
	dw UnknownScript_0x60010, $0000

	; callback count
	db 0
; 0x6000e

UnknownScript_0x6000e: ; 0x6000e
	end
; 0x6000f

UnknownScript_0x6000f: ; 0x6000f
	end
; 0x60010

UnknownScript_0x60010: ; 0x60010
	end
; 0x60011

UnknownScript_0x60011: ; 0x60011
	spriteface $2, $1
	showemote $0, $2, 15
	loadfont
	2writetext UnknownText_0x60128
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x60109
	playmusic $0039
	loadfont
	2writetext UnknownText_0x60147
	closetext
	loadmovesprites
	winlosstext UnknownText_0x60223, $0000
	setlasttalked $2
	loadtrainer EXECUTIVEM, 3
	startbattle
	returnafterbattle
	loadfont
	2writetext UnknownText_0x60246
	keeptextopen
	verbosegiveitem BASEMENT_KEY, 1
	loadmovesprites
	dotrigger $1
	setevent $0573
	end
; 0x60046

GentlemanScript_0x60046: ; 0x60046
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x60054
	2writetext UnknownText_0x60246
	closetext
	loadmovesprites
	end
; 0x60054

UnknownScript_0x60054: ; 0x60054
	2writetext UnknownText_0x60824
	closetext
	loadmovesprites
	end
; 0x6005a

TrainerExecutivef1: ; 0x6005a
	; bit/flag number
	dw $56f

	; trainer group && trainer id
	db EXECUTIVEF, 1

	; text when seen
	dw Executivef1SeenText

	; text when trainer beaten
	dw Executivef1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Executivef1Script
; 0x60066

Executivef1Script: ; 0x60066
	talkaftercancel
	loadfont
	2writetext UnknownText_0x60358
	closetext
	loadmovesprites
	end
; 0x6006e

UnknownScript_0x6006e: ; 0x6006e
	applymovement $0, MovementData_0x60125
	playmusic $0039
	spriteface $3, $3
	loadfont
	2writetext UnknownText_0x603d1
	closetext
	loadmovesprites
	winlosstext UnknownText_0x604f3, $0000
	setlasttalked $3
	loadtrainer EXECUTIVEM, 1
	startbattle
	returnafterbattle
	loadfont
	2writetext UnknownText_0x6050e
	closetext
	loadmovesprites
	special $0030
	special $0033
	disappear $3
	disappear $4
	pause 15
	special $0032
	setevent $0571
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag $0013
	setevent $06cc
	setevent $06cd
	setevent $06ce
	clearevent $0736
	clearflag $0017
	clearevent $06cf
	clearevent $06d0
	setevent $06e3
	clearevent $06e4
	special $003c
	disappear $2
	moveperson $2, $c, $0
	appear $2
	applymovement $2, MovementData_0x6010f
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x605b2
	keeptextopen
	verbosegiveitem CLEAR_BELL, 1
	2writetext UnknownText_0x6062c
	closetext
	loadmovesprites
	dotrigger $2
	domaptrigger GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE, $0
	setevent EVENT_GOT_CLEAR_BELL
	setevent $0761
	2jump UnknownScript_0x600f1
; 0x600f1

UnknownScript_0x600f1: ; 0x600f1
	applymovement $2, MovementData_0x6011a
	playsound $0023
	disappear $2
	end
; 0x600fb

RockerScript_0x600fb: ; 0x600fb
	jumptextfaceplayer UnknownText_0x608be
; 0x600fe

ItemFragment_0x600fe: ; 0x600fe
	db ULTRA_BALL, 1
; 0x60100

MapRadioTower5FSignpost0Script: ; 0x60100
	jumptext UnknownText_0x608e0
; 0x60103

MapRadioTower5FSignpost2Script: ; 0x60103
	jumptext UnknownText_0x608f9
; 0x60106

MapRadioTower5FSignpost4Script: ; 0x60106
	jumpstd $0003
; 0x60109

MovementData_0x60109: ; 0x60109
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end
; 0x6010f

MovementData_0x6010f: ; 0x6010f
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_left
	step_end
; 0x6011a

MovementData_0x6011a: ; 0x6011a
	step_right
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end
; 0x60125

MovementData_0x60125: ; 0x60125
	step_left
	step_left
	step_end
; 0x60128

UnknownText_0x60128: ; 0x60128
	db $0, "Y-you! You came to", $4f
	db "rescue me?", $57
; 0x60147

UnknownText_0x60147: ; 0x60147
	db $0, "Is that what you", $4f
	db "were expecting?", $51
	db "Wrong!", $4f
	db "I'm an imposter!", $51
	db "I pretended to be", $4f
	db "the real thing to", $51
	db "prepare for our", $4f
	db "takeover.", $51
	db "Do you want to", $4f
	db "know where we hid", $55
	db "the real DIRECTOR?", $51
	db "Sure, I'll tell", $4f
	db "you. But only if", $55
	db "you can beat me!", $57
; 0x60223

UnknownText_0x60223: ; 0x60223
	db $0, "OK, OK. I'll tell", $4f
	db "you where he is.", $57
; 0x60246

UnknownText_0x60246: ; 0x60246
	db $0, "We stashed the", $4f
	db "real DIRECTOR in", $51
	db "the UNDERGROUND", $4f
	db "WAREHOUSE.", $51
	db "It's at the far", $4f
	db "end of the UNDER-", $55
	db "GROUND.", $51
	db "But I doubt you'll", $4f
	db "get that far.", $57
; 0x602cb

Executivef1SeenText: ; 0x602cb
	db $0, "Remember me from", $4f
	db "the HIDEOUT in", $55
	db "MAHOGANY TOWN?", $51
	db "I lost then, but I", $4f
	db "won't this time.", $57
; 0x6031e

Executivef1BeatenText: ; 0x6031e
	db $0, "This can't be", $4f
	db "happening!", $51
	db "I fought hard, but", $4f
	db "I still lost…", $57
; 0x60358

UnknownText_0x60358: ; 0x60358
	db $0, $52, ", isn't it?", $51
	db "A brat like you", $4f
	db "won't appreciate", $51
	db "the magnificence", $4f
	db "of TEAM ROCKET.", $51
	db "That's too bad.", $4f
	db "I really admire", $55
	db "your power.", $57
; 0x603d1

UnknownText_0x603d1: ; 0x603d1
	db $0, "Oh? You managed to", $4f
	db "get this far?", $51
	db "You must be quite", $4f
	db "the trainer.", $51
	db "We intend to take", $4f
	db "over this RADIO", $51
	db "STATION and an-", $4f
	db "nounce our come-", $55
	db "back.", $51
	db "That should bring", $4f
	db "our boss GIOVANNI", $51
	db "back from his solo", $4f
	db "training.", $51
	db "We are going to", $4f
	db "regain our former", $55
	db "glory.", $51
	db "I won't allow you", $4f
	db "to interfere with", $55
	db "our plans.", $57
; 0x604f3

UnknownText_0x604f3: ; 0x604f3
	db $0, "No! Forgive me,", $4f
	db "GIOVANNI!", $57
; 0x6050e

UnknownText_0x6050e: ; 0x6050e
	db $0, "How could this be?", $51
	db "Our dreams have", $4f
	db "come to naught.", $51
	db "I wasn't up to the", $4f
	db "task after all.", $51
	db "Like GIOVANNI did", $4f
	db "before me, I will", $51
	db "disband TEAM", $4f
	db "ROCKET here today.", $51
	db "Farewell.", $57
; 0x605b2

UnknownText_0x605b2: ; 0x605b2
	db $0, "DIRECTOR: ", $14, ",", $4f
	db "thank you!", $51
	db "Your courageous", $4f
	db "actions have saved", $51
	db "#MON nation-", $4f
	db "wide.", $51
	db "I know it's not", $4f
	db "much, but please", $55
	db "take this.", $57
; 0x6062c

UnknownText_0x6062c: ; 0x6062c
	db $0, "There used to be a", $4f
	db "tower right here", $55
	db "in GOLDENROD CITY.", $51
	db "But it was old and", $4f
	db "creaky.", $51
	db "So we replaced it", $4f
	db "with our RADIO", $55
	db "TOWER.", $51
	db "We dug up that", $4f
	db "bell during", $55
	db "construction.", $51
	db "I heard that all", $4f
	db "sorts of #MON", $51
	db "lived in GOLDENROD", $4f
	db "in the past.", $51
	db "Perhaps…", $51
	db "That bell has some", $4f
	db "connection to the", $51
	db "TIN TOWER in", $4f
	db "ECRUTEAK CITY…", $51
	db "Ah!", $51
	db "That reminds me…", $51
	db "I overheard TEAM", $4f
	db "ROCKET whispering.", $51
	db "Apparently, some-", $4f
	db "thing is going on", $55
	db "at the TIN TOWER.", $51
	db "I have no idea", $4f
	db "what is happening,", $51
	db "but you might look", $4f
	db "into it.", $51
	db "OK, I better go to", $4f
	db "my OFFICE.", $57
; 0x60824

UnknownText_0x60824: ; 0x60824
	db $0, "DIRECTOR: Hello,", $4f
	db $14, "!", $51
	db "You know, I love", $4f
	db "#MON.", $51
	db "I built this RADIO", $4f
	db "TOWER so I could", $51
	db "express my love", $4f
	db "of #MON.", $51
	db "It would be nice", $4f
	db "if people enjoyed", $55
	db "our programs.", $57
; 0x608be

UnknownText_0x608be: ; 0x608be
	db $0, "BEN: Do you listen", $4f
	db "to our music?", $57
; 0x608e0

UnknownText_0x608e0: ; 0x608e0
	db $0, "5F DIRECTOR'S", $4f
	db "   OFFICE", $57
; 0x608f9

UnknownText_0x608f9: ; 0x608f9
	db $0, "5F STUDIO 1", $57
; 0x60906

RadioTower5F_MapEventHeader: ; 0x60906
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $0, $0, 1, GROUP_RADIO_TOWER_4F, MAP_RADIO_TOWER_4F
	warp_def $0, $c, 3, GROUP_RADIO_TOWER_4F, MAP_RADIO_TOWER_4F

	; xy triggers
	db 2
	xy_trigger 0, $3, $0, $0, UnknownScript_0x60011, $0, $0
	xy_trigger 1, $5, $10, $0, UnknownScript_0x6006e, $0, $0

	; signposts
	db 5
	signpost 0, 3, $0, MapRadioTower5FSignpost0Script
	signpost 0, 11, $0, MapRadioTower5FSignpost2Script
	signpost 0, 15, $0, MapRadioTower5FSignpost2Script
	signpost 1, 16, $0, MapRadioTower5FSignpost4Script
	signpost 1, 17, $0, MapRadioTower5FSignpost4Script

	; people-events
	db 5
	person_event SPRITE_GENTLEMAN, 10, 7, $3, $0, 255, 255, $0, 0, GentlemanScript_0x60046, $ffff
	person_event SPRITE_ROCKET, 9, 17, $8, $0, 255, 255, $0, 0, ObjectEvent, $06ce
	person_event SPRITE_ROCKET_GIRL, 6, 21, $8, $0, 255, 255, $82, 1, TrainerExecutivef1, $06ce
	person_event SPRITE_ROCKER, 9, 17, $8, $0, 255, 255, $80, 0, RockerScript_0x600fb, $06d0
	person_event SPRITE_POKE_BALL, 9, 12, $1, $0, 255, 255, $1, 0, ItemFragment_0x600fe, $07cd
; 0x60980

