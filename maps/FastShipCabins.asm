FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader: ; 0x75ea4
	; trigger count
	db 0

	; callback count
	db 0
; 0x75ea6

UnknownScript_0x75ea6: ; 0x75ea6
	end
; 0x75ea7

CaptainScript_0x75ea7: ; 0x75ea7
	faceplayer
	loadfont
	checkevent $0030
	iftrue UnknownScript_0x75eb5
	2writetext UnknownText_0x76012
	closetext
	loadmovesprites
	end
; 0x75eb5

UnknownScript_0x75eb5: ; 0x75eb5
	2writetext UnknownText_0x76064
	closetext
	loadmovesprites
	end
; 0x75ebb

TwinScript_0x75ebb: ; 0x75ebb
	spriteface $5, $3
	loadfont
	2writetext UnknownText_0x761e0
	closetext
	loadmovesprites
	faceplayer
	loadfont
	2writetext UnknownText_0x7621f
	closetext
	loadmovesprites
	special $0030
	special $0033
	disappear $5
	applymovement $0, MovementData_0x76004
	moveperson $4, $3, $13
	appear $4
	spriteface $0, $1
	spriteface $4, $1
	special $0032
	spriteface $3, $0
	showemote $0, $3, 15
	applymovement $4, MovementData_0x7600c
	spriteface $3, $3
	checkflag $0063
	iftrue UnknownScript_0x75f03
	loadfont
	2writetext UnknownText_0x76284
	closetext
	loadmovesprites
	2jump UnknownScript_0x75f09
; 0x75f03

UnknownScript_0x75f03: ; 0x75f03
	loadfont
	2writetext UnknownText_0x762c6
	closetext
	loadmovesprites
UnknownScript_0x75f09: ; 0x75f09
	spriteface $5, $0
	applymovement $3, MovementData_0x76010
	loadfont
	2writetext UnknownText_0x76143
	keeptextopen
	setevent $072b
	domaptrigger GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $0
	2jump UnknownScript_0x75f37
; 0x75f1f

GentlemanScript_0x75f1f: ; 0x75f1f
	faceplayer
	loadfont
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue UnknownScript_0x75f67
	checkevent $0732
	iftrue UnknownScript_0x75f58
	2writetext UnknownText_0x760ae
	closetext
	loadmovesprites
	domaptrigger GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $0
	end
; 0x75f37

UnknownScript_0x75f37: ; 0x75f37
	2writetext UnknownText_0x7619b
	keeptextopen
	verbosegiveitem METAL_COAT, 1
	iffalse UnknownScript_0x75f44
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
UnknownScript_0x75f44: ; 0x75f44
	loadmovesprites
	waitbutton
	playsound $0027
	pause 30
	loadfont
	2writetext UnknownText_0x76645
	closetext
	setevent $0031
	setevent $0032
	loadmovesprites
	end
; 0x75f58

UnknownScript_0x75f58: ; 0x75f58
	2writetext UnknownText_0x7619b
	keeptextopen
	verbosegiveitem METAL_COAT, 1
	iffalse UnknownScript_0x75f65
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
UnknownScript_0x75f65: ; 0x75f65
	loadmovesprites
	end
; 0x75f67

UnknownScript_0x75f67: ; 0x75f67
	2writetext UnknownText_0x761be
	closetext
	loadmovesprites
	end
; 0x75f6d

TwinScript_0x75f6d: ; 0x75f6d
	faceplayer
	loadfont
	2writetext UnknownText_0x7630d
	closetext
	loadmovesprites
	end
; 0x75f75

TrainerPokefanmColin: ; 0x75f75
	; bit/flag number
	dw $4d5

	; trainer group && trainer id
	db POKEFANM, COLIN

	; text when seen
	dw PokefanmColinSeenText

	; text when trainer beaten
	dw PokefanmColinBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmColinScript
; 0x75f81

PokefanmColinScript: ; 0x75f81
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7635b
	closetext
	loadmovesprites
	end
; 0x75f89

TrainerTwinsMegandpeg1: ; 0x75f89
	; bit/flag number
	dw $46a

	; trainer group && trainer id
	db TWINS, MEGANDPEG1

	; text when seen
	dw TwinsMegandpeg1SeenText

	; text when trainer beaten
	dw TwinsMegandpeg1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsMegandpeg1Script
; 0x75f95

TwinsMegandpeg1Script: ; 0x75f95
	talkaftercancel
	loadfont
	2writetext UnknownText_0x763c2
	closetext
	loadmovesprites
	end
; 0x75f9d

TrainerTwinsMegandpeg2: ; 0x75f9d
	; bit/flag number
	dw $46a

	; trainer group && trainer id
	db TWINS, MEGANDPEG2

	; text when seen
	dw TwinsMegandpeg2SeenText

	; text when trainer beaten
	dw TwinsMegandpeg2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsMegandpeg2Script
; 0x75fa9

TwinsMegandpeg2Script: ; 0x75fa9
	talkaftercancel
	loadfont
	2writetext UnknownText_0x76428
	closetext
	loadmovesprites
	end
; 0x75fb1

TrainerPsychicRodney: ; 0x75fb1
	; bit/flag number
	dw $445

	; trainer group && trainer id
	db PSYCHIC_T, RODNEY

	; text when seen
	dw PsychicRodneySeenText

	; text when trainer beaten
	dw PsychicRodneyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicRodneyScript
; 0x75fbd

PsychicRodneyScript: ; 0x75fbd
	talkaftercancel
	loadfont
	2writetext UnknownText_0x76497
	closetext
	loadmovesprites
	end
; 0x75fc5

TrainerPokefanmJeremy: ; 0x75fc5
	; bit/flag number
	dw $4d4

	; trainer group && trainer id
	db POKEFANM, JEREMY

	; text when seen
	dw PokefanmJeremySeenText

	; text when trainer beaten
	dw PokefanmJeremyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmJeremyScript
; 0x75fd1

PokefanmJeremyScript: ; 0x75fd1
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7651c
	closetext
	loadmovesprites
	end
; 0x75fd9

TrainerPokefanfGeorgia: ; 0x75fd9
	; bit/flag number
	dw $4dd

	; trainer group && trainer id
	db POKEFANF, GEORGIA

	; text when seen
	dw PokefanfGeorgiaSeenText

	; text when trainer beaten
	dw PokefanfGeorgiaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanfGeorgiaScript
; 0x75fe5

PokefanfGeorgiaScript: ; 0x75fe5
	talkaftercancel
	loadfont
	2writetext UnknownText_0x76596
	closetext
	loadmovesprites
	end
; 0x75fed

TrainerSupernerdShawn: ; 0x75fed
	; bit/flag number
	dw $589

	; trainer group && trainer id
	db SUPER_NERD, SHAWN

	; text when seen
	dw SupernerdShawnSeenText

	; text when trainer beaten
	dw SupernerdShawnBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SupernerdShawnScript
; 0x75ff9

SupernerdShawnScript: ; 0x75ff9
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7660f
	closetext
	loadmovesprites
	end
; 0x76001

MapFastShipCabins_SE_SSE_CaptainsCabinSignpost0Script: ; 0x76001
	jumpstd $000d
; 0x76004

MovementData_0x76004: ; 0x76004
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end
; 0x7600c

MovementData_0x7600c: ; 0x7600c
	step_up
	step_up
	turn_head_left
	step_end
; 0x76010

MovementData_0x76010: ; 0x76010
	step_down
	step_end
; 0x76012

UnknownText_0x76012: ; 0x76012
	db $0, "Whew! Thanks for", $4f
	db "coming along.", $51
	db "Keeping that lit-", $4f
	db "tle girl amused", $55
	db "was exhausting.", $57
; 0x76064

UnknownText_0x76064: ; 0x76064
	db $0, "How do you like", $4f
	db "S.S.AQUA's ride?", $51
	db "She practically", $4f
	db "skates across the", $55
	db "waves.", $57
; 0x760ae

UnknownText_0x760ae: ; 0x760ae
	db $0, "Oh, hello…", $51
	db "I still can't find", $4f
	db "my granddaughter.", $51
	db "If she's on the", $4f
	db "ship, that's OK.", $51
	db "She's an energetic", $4f
	db "child, so she may", $51
	db "be bugging some-", $4f
	db "one. I'm worried…", $57
; 0x76143

UnknownText_0x76143: ; 0x76143
	db $0, $14, ", was it?", $4f
	db "I heard you enter-", $55
	db "tained my grand-", $55
	db "daughter.", $51
	db "I want to thank", $4f
	db "you for that.", $57
; 0x7619b

UnknownText_0x7619b: ; 0x7619b
	db $0, "I know! I'd like", $4f
	db "you to have this!", $57
; 0x761be

UnknownText_0x761be: ; 0x761be
	db $0, "We're traveling", $4f
	db "around the world.", $57
; 0x761e0

UnknownText_0x761e0: ; 0x761e0
	db $0, "CAPTAIN, play with", $4f
	db "me, please?", $51
	db "I'm bored! I want", $4f
	db "to play more!", $57
; 0x7621f

UnknownText_0x7621f: ; 0x7621f
	db $0, "Hi! Will you play", $4f
	db "with me?", $51
	db "…Oh!", $51
	db "Grandpa's worried", $4f
	db "about me?", $51
	db "I have to go!", $51
	db "I have to go find", $4f
	db "Grandpa!", $57
; 0x76284

UnknownText_0x76284: ; 0x76284
	db $0, "Grandpa, here I", $4f
	db "am! I was playing", $51
	db "with the CAPTAIN", $4f
	db "and this guy!", $57
; 0x762c6

UnknownText_0x762c6: ; 0x762c6
	db $0, "Grandpa, here I", $4f
	db "am! I was playing", $51
	db "with the CAPTAIN", $4f
	db "and this big girl!", $57
; 0x7630d

UnknownText_0x7630d: ; 0x7630d
	db $0, "I had lots of fun", $4f
	db "playing!", $57
; 0x76329

PokefanmColinSeenText: ; 0x76329
	db $0, "Hey, kid! Want to", $4f
	db "battle with me?", $57
; 0x7634c

PokefanmColinBeatenText: ; 0x7634c
	db $0, "You're strong!", $57
; 0x7635b

UnknownText_0x7635b: ; 0x7635b
	db $0, "You're traveling", $4f
	db "all alone?", $51
	db "Isn't your mom", $4f
	db "worried?", $57
; 0x7638e

TwinsMegandpeg1SeenText: ; 0x7638e
	db $0, "You think I'm a", $4f
	db "baby?", $55
	db "That's not fair!", $57
; 0x763b4

TwinsMegandpeg1BeatenText: ; 0x763b4
	db $0, "Oh! We lost!", $57
; 0x763c2

UnknownText_0x763c2: ; 0x763c2
	db $0, "Baby is a rude", $4f
	db "name to call us", $55
	db "girls!", $57
; 0x763e9

TwinsMegandpeg2SeenText: ; 0x763e9
	db $0, "I'm not a baby!", $51
	db "That's not nice to", $4f
	db "say to a lady!", $57
; 0x7641a

TwinsMegandpeg2BeatenText: ; 0x7641a
	db $0, "Oh! We lost!", $57
; 0x76428

UnknownText_0x76428: ; 0x76428
	db $0, "Sometimes, kids", $4f
	db "are smarter than", $55
	db "grown-ups!", $57
; 0x76455

PsychicRodneySeenText: ; 0x76455
	db $0, "Ssh! My brain is", $4f
	db "picking up radio", $55
	db "signals!", $57
; 0x76481

PsychicRodneyBeatenText: ; 0x76481
	db $0, "…I hear some-", $4f
	db "thing!", $57
; 0x76497

UnknownText_0x76497: ; 0x76497
	db $0, "I get it. You can", $4f
	db "hear JOHTO's radio", $55
	db "on the FAST SHIP.", $57
; 0x764ce

PokefanmJeremySeenText: ; 0x764ce
	db $0, "What do you think?", $4f
	db "My #MON are", $55
	db "beautiful, yes?", $57
; 0x764fe

PokefanmJeremyBeatenText: ; 0x764fe
	db $0, "Oh, no! My beauti-", $4f
	db "ful #MON!", $57
; 0x7651c

UnknownText_0x7651c: ; 0x7651c
	db $0, "I must go to the", $4f
	db "#MON SALON and", $55
	db "fix them up nice!", $57
; 0x7654f

PokefanfGeorgiaSeenText: ; 0x7654f
	db $0, "I'm going to shop", $4f
	db "at the DEPT.STORE", $55
	db "and then…", $57
; 0x7657d

PokefanfGeorgiaBeatenText: ; 0x7657d
	db $0, "What was I going", $4f
	db "to do?", $57
; 0x76596

UnknownText_0x76596: ; 0x76596
	db $0, "Oh, yes! I have to", $4f
	db "get my #MON out", $55
	db "of DAY-CARE!", $57
; 0x765c7

SupernerdShawnSeenText: ; 0x765c7
	db $0, "What kinds of #", $4f
	db "BALLS do you have", $55
	db "with you?", $57
; 0x765f4

SupernerdShawnBeatenText: ; 0x765f4
	db $0, "Wait! Stop! Don't!", $4f
	db "Please!", $57
; 0x7660f

UnknownText_0x7660f: ; 0x7660f
	db $0, "You should use the", $4f
	db "right BALLS to fit", $55
	db "the situation.", $57
; 0x76645

UnknownText_0x76645: ; 0x76645
	db $0, "FAST SHIP S.S.AQUA", $4f
	db "has arrived in", $55
	db "VERMILION CITY.", $57
; 0x76678

FastShipCabins_SE_SSE_CaptainsCabin_MapEventHeader: ; 0x76678
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $7, $2, 8, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $7, $3, 8, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $13, $2, 9, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $13, $3, 9, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $21, $2, 10, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $21, $3, 10, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 25, 4, $0, MapFastShipCabins_SE_SSE_CaptainsCabinSignpost0Script

	; people-events
	db 11
	person_event SPRITE_CAPTAIN, 29, 7, $6, $0, 255, 255, $90, 0, CaptainScript_0x75ea7, $ffff
	person_event SPRITE_GENTLEMAN, 21, 6, $9, $0, 255, 255, $90, 0, GentlemanScript_0x75f1f, $0730
	person_event SPRITE_TWIN, 21, 7, $a, $0, 255, 255, $0, 0, TwinScript_0x75f6d, $0731
	person_event SPRITE_TWIN, 29, 6, $a, $0, 255, 255, $0, 0, TwinScript_0x75ebb, $0732
	person_event SPRITE_POKEFAN_M, 10, 9, $8, $0, 255, 255, $82, 5, TrainerPokefanmColin, $0739
	person_event SPRITE_TWIN, 8, 6, $6, $0, 255, 255, $82, 1, TrainerTwinsMegandpeg1, $0739
	person_event SPRITE_TWIN, 8, 7, $6, $0, 255, 255, $82, 1, TrainerTwinsMegandpeg2, $0739
	person_event SPRITE_SUPER_NERD, 9, 9, $8, $0, 255, 255, $92, 5, TrainerPsychicRodney, $073a
	person_event SPRITE_POKEFAN_M, 7, 6, $6, $0, 255, 255, $82, 3, TrainerPokefanmJeremy, $073b
	person_event SPRITE_POKEFAN_F, 9, 9, $9, $0, 255, 255, $82, 1, TrainerPokefanfGeorgia, $073b
	person_event SPRITE_SUPER_NERD, 19, 5, $3, $0, 255, 255, $b2, 2, TrainerSupernerdShawn, $073a
; 0x76730

