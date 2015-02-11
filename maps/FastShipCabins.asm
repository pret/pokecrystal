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
	writetext UnknownText_0x76012
	closetext
	loadmovesprites
	end
; 0x75eb5

UnknownScript_0x75eb5: ; 0x75eb5
	writetext UnknownText_0x76064
	closetext
	loadmovesprites
	end
; 0x75ebb

TwinScript_0x75ebb: ; 0x75ebb
	spriteface $5, $3
	loadfont
	writetext UnknownText_0x761e0
	closetext
	loadmovesprites
	faceplayer
	loadfont
	writetext UnknownText_0x7621f
	closetext
	loadmovesprites
	special Function8c0b6
	special Functiond91
	disappear $5
	applymovement $0, MovementData_0x76004
	moveperson $4, $3, $13
	appear $4
	spriteface $0, $1
	spriteface $4, $1
	special Function8c0ab
	spriteface $3, $0
	showemote $0, $3, 15
	applymovement $4, MovementData_0x7600c
	spriteface $3, $3
	checkflag $0063
	iftrue UnknownScript_0x75f03
	loadfont
	writetext UnknownText_0x76284
	closetext
	loadmovesprites
	jump UnknownScript_0x75f09
; 0x75f03

UnknownScript_0x75f03: ; 0x75f03
	loadfont
	writetext UnknownText_0x762c6
	closetext
	loadmovesprites
UnknownScript_0x75f09: ; 0x75f09
	spriteface $5, $0
	applymovement $3, MovementData_0x76010
	loadfont
	writetext UnknownText_0x76143
	keeptextopen
	setevent $072b
	domaptrigger GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $0
	jump UnknownScript_0x75f37
; 0x75f1f

GentlemanScript_0x75f1f: ; 0x75f1f
	faceplayer
	loadfont
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue UnknownScript_0x75f67
	checkevent $0732
	iftrue UnknownScript_0x75f58
	writetext UnknownText_0x760ae
	closetext
	loadmovesprites
	domaptrigger GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $0
	end
; 0x75f37

UnknownScript_0x75f37: ; 0x75f37
	writetext UnknownText_0x7619b
	keeptextopen
	verbosegiveitem METAL_COAT, 1
	iffalse UnknownScript_0x75f44
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
UnknownScript_0x75f44: ; 0x75f44
	loadmovesprites
	waitbutton
	playsound SFX_ELEVATOR_END
	pause 30
	loadfont
	writetext UnknownText_0x76645
	closetext
	setevent $0031
	setevent $0032
	loadmovesprites
	end
; 0x75f58

UnknownScript_0x75f58: ; 0x75f58
	writetext UnknownText_0x7619b
	keeptextopen
	verbosegiveitem METAL_COAT, 1
	iffalse UnknownScript_0x75f65
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
UnknownScript_0x75f65: ; 0x75f65
	loadmovesprites
	end
; 0x75f67

UnknownScript_0x75f67: ; 0x75f67
	writetext UnknownText_0x761be
	closetext
	loadmovesprites
	end
; 0x75f6d

TwinScript_0x75f6d: ; 0x75f6d
	faceplayer
	loadfont
	writetext UnknownText_0x7630d
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
	writetext UnknownText_0x7635b
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
	writetext UnknownText_0x763c2
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
	writetext UnknownText_0x76428
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
	writetext UnknownText_0x76497
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
	writetext UnknownText_0x7651c
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
	writetext UnknownText_0x76596
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
	writetext UnknownText_0x7660f
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
	text "Whew! Thanks for"
	line "coming along."

	para "Keeping that lit-"
	line "tle girl amused"
	cont "was exhausting."
	done
; 0x76064

UnknownText_0x76064: ; 0x76064
	text "How do you like"
	line "S.S.AQUA's ride?"

	para "She practically"
	line "skates across the"
	cont "waves."
	done
; 0x760ae

UnknownText_0x760ae: ; 0x760ae
	text "Oh, hello…"

	para "I still can't find"
	line "my granddaughter."

	para "If she's on the"
	line "ship, that's OK."

	para "She's an energetic"
	line "child, so she may"

	para "be bugging some-"
	line "one. I'm worried…"
	done
; 0x76143

UnknownText_0x76143: ; 0x76143
	text $14, ", was it?"
	line "I heard you enter-"
	cont "tained my grand-"
	cont "daughter."

	para "I want to thank"
	line "you for that."
	done
; 0x7619b

UnknownText_0x7619b: ; 0x7619b
	text "I know! I'd like"
	line "you to have this!"
	done
; 0x761be

UnknownText_0x761be: ; 0x761be
	text "We're traveling"
	line "around the world."
	done
; 0x761e0

UnknownText_0x761e0: ; 0x761e0
	text "CAPTAIN, play with"
	line "me, please?"

	para "I'm bored! I want"
	line "to play more!"
	done
; 0x7621f

UnknownText_0x7621f: ; 0x7621f
	text "Hi! Will you play"
	line "with me?"

	para "…Oh!"

	para "Grandpa's worried"
	line "about me?"

	para "I have to go!"

	para "I have to go find"
	line "Grandpa!"
	done
; 0x76284

UnknownText_0x76284: ; 0x76284
	text "Grandpa, here I"
	line "am! I was playing"

	para "with the CAPTAIN"
	line "and this guy!"
	done
; 0x762c6

UnknownText_0x762c6: ; 0x762c6
	text "Grandpa, here I"
	line "am! I was playing"

	para "with the CAPTAIN"
	line "and this big girl!"
	done
; 0x7630d

UnknownText_0x7630d: ; 0x7630d
	text "I had lots of fun"
	line "playing!"
	done
; 0x76329

PokefanmColinSeenText: ; 0x76329
	text "Hey, kid! Want to"
	line "battle with me?"
	done
; 0x7634c

PokefanmColinBeatenText: ; 0x7634c
	text "You're strong!"
	done
; 0x7635b

UnknownText_0x7635b: ; 0x7635b
	text "You're traveling"
	line "all alone?"

	para "Isn't your mom"
	line "worried?"
	done
; 0x7638e

TwinsMegandpeg1SeenText: ; 0x7638e
	text "You think I'm a"
	line "baby?"
	cont "That's not fair!"
	done
; 0x763b4

TwinsMegandpeg1BeatenText: ; 0x763b4
	text "Oh! We lost!"
	done
; 0x763c2

UnknownText_0x763c2: ; 0x763c2
	text "Baby is a rude"
	line "name to call us"
	cont "girls!"
	done
; 0x763e9

TwinsMegandpeg2SeenText: ; 0x763e9
	text "I'm not a baby!"

	para "That's not nice to"
	line "say to a lady!"
	done
; 0x7641a

TwinsMegandpeg2BeatenText: ; 0x7641a
	text "Oh! We lost!"
	done
; 0x76428

UnknownText_0x76428: ; 0x76428
	text "Sometimes, kids"
	line "are smarter than"
	cont "grown-ups!"
	done
; 0x76455

PsychicRodneySeenText: ; 0x76455
	text "Ssh! My brain is"
	line "picking up radio"
	cont "signals!"
	done
; 0x76481

PsychicRodneyBeatenText: ; 0x76481
	text "…I hear some-"
	line "thing!"
	done
; 0x76497

UnknownText_0x76497: ; 0x76497
	text "I get it. You can"
	line "hear JOHTO's radio"
	cont "on the FAST SHIP."
	done
; 0x764ce

PokefanmJeremySeenText: ; 0x764ce
	text "What do you think?"
	line "My #MON are"
	cont "beautiful, yes?"
	done
; 0x764fe

PokefanmJeremyBeatenText: ; 0x764fe
	text "Oh, no! My beauti-"
	line "ful #MON!"
	done
; 0x7651c

UnknownText_0x7651c: ; 0x7651c
	text "I must go to the"
	line "#MON SALON and"
	cont "fix them up nice!"
	done
; 0x7654f

PokefanfGeorgiaSeenText: ; 0x7654f
	text "I'm going to shop"
	line "at the DEPT.STORE"
	cont "and then…"
	done
; 0x7657d

PokefanfGeorgiaBeatenText: ; 0x7657d
	text "What was I going"
	line "to do?"
	done
; 0x76596

UnknownText_0x76596: ; 0x76596
	text "Oh, yes! I have to"
	line "get my #MON out"
	cont "of DAY-CARE!"
	done
; 0x765c7

SupernerdShawnSeenText: ; 0x765c7
	text "What kinds of #"
	line "BALLS do you have"
	cont "with you?"
	done
; 0x765f4

SupernerdShawnBeatenText: ; 0x765f4
	text "Wait! Stop! Don't!"
	line "Please!"
	done
; 0x7660f

UnknownText_0x7660f: ; 0x7660f
	text "You should use the"
	line "right BALLS to fit"
	cont "the situation."
	done
; 0x76645

UnknownText_0x76645: ; 0x76645
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "VERMILION CITY."
	done
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

