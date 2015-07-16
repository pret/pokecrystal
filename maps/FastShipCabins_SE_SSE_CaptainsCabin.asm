FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

UnknownScript_0x75ea6:
	end

CaptainScript_0x75ea7:
	faceplayer
	loadfont
	checkevent EVENT_030
	iftrue UnknownScript_0x75eb5
	writetext UnknownText_0x76012
	closetext
	loadmovesprites
	end

UnknownScript_0x75eb5:
	writetext UnknownText_0x76064
	closetext
	loadmovesprites
	end

TwinScript_0x75ebb:
	spriteface $5, RIGHT
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
	spriteface $0, UP
	spriteface $4, UP
	special Function8c0ab
	spriteface $3, DOWN
	showemote EMOTE_SHOCK, $3, 15
	applymovement $4, MovementData_0x7600c
	spriteface $3, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue UnknownScript_0x75f03
	loadfont
	writetext UnknownText_0x76284
	closetext
	loadmovesprites
	jump UnknownScript_0x75f09

UnknownScript_0x75f03:
	loadfont
	writetext UnknownText_0x762c6
	closetext
	loadmovesprites
UnknownScript_0x75f09:
	spriteface $5, DOWN
	applymovement $3, MovementData_0x76010
	loadfont
	writetext UnknownText_0x76143
	keeptextopen
	setevent EVENT_72B
	domaptrigger GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $0
	jump UnknownScript_0x75f37

GentlemanScript_0x75f1f:
	faceplayer
	loadfont
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue UnknownScript_0x75f67
	checkevent EVENT_732
	iftrue UnknownScript_0x75f58
	writetext UnknownText_0x760ae
	closetext
	loadmovesprites
	domaptrigger GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $0
	end

UnknownScript_0x75f37:
	writetext UnknownText_0x7619b
	keeptextopen
	verbosegiveitem METAL_COAT, 1
	iffalse UnknownScript_0x75f44
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
UnknownScript_0x75f44:
	loadmovesprites
	waitbutton
	playsound SFX_ELEVATOR_END
	pause 30
	loadfont
	writetext UnknownText_0x76645
	closetext
	setevent EVENT_031
	setevent EVENT_032
	loadmovesprites
	end

UnknownScript_0x75f58:
	writetext UnknownText_0x7619b
	keeptextopen
	verbosegiveitem METAL_COAT, 1
	iffalse UnknownScript_0x75f65
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
UnknownScript_0x75f65:
	loadmovesprites
	end

UnknownScript_0x75f67:
	writetext UnknownText_0x761be
	closetext
	loadmovesprites
	end

TwinScript_0x75f6d:
	faceplayer
	loadfont
	writetext UnknownText_0x7630d
	closetext
	loadmovesprites
	end

TrainerPokefanmColin:
	; bit/flag number
	dw EVENT_BEAT_POKEFANM_COLIN

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

PokefanmColinScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7635b
	closetext
	loadmovesprites
	end

TrainerTwinsMegandpeg1:
	; bit/flag number
	dw EVENT_BEAT_TWINS_MEG_AND_PEG

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

TwinsMegandpeg1Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x763c2
	closetext
	loadmovesprites
	end

TrainerTwinsMegandpeg2:
	; bit/flag number
	dw EVENT_BEAT_TWINS_MEG_AND_PEG

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

TwinsMegandpeg2Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76428
	closetext
	loadmovesprites
	end

TrainerPsychicRodney:
	; bit/flag number
	dw EVENT_BEAT_PSYCHIC_RODNEY

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

PsychicRodneyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76497
	closetext
	loadmovesprites
	end

TrainerPokefanmJeremy:
	; bit/flag number
	dw EVENT_BEAT_POKEFANM_JEREMY

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

PokefanmJeremyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7651c
	closetext
	loadmovesprites
	end

TrainerPokefanfGeorgia:
	; bit/flag number
	dw EVENT_BEAT_POKEFANF_GEORGIA

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

PokefanfGeorgiaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76596
	closetext
	loadmovesprites
	end

TrainerSupernerdShawn:
	; bit/flag number
	dw EVENT_BEAT_SUPER_NERD_SHAWN

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

SupernerdShawnScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7660f
	closetext
	loadmovesprites
	end

FastShipCaptainsCabinTrashcan:
	jumpstd trashcan

MovementData_0x76004:
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_0x7600c:
	step_up
	step_up
	turn_head_left
	step_end

MovementData_0x76010:
	step_down
	step_end

UnknownText_0x76012:
	text "Whew! Thanks for"
	line "coming along."

	para "Keeping that lit-"
	line "tle girl amused"
	cont "was exhausting."
	done

UnknownText_0x76064:
	text "How do you like"
	line "S.S.AQUA's ride?"

	para "She practically"
	line "skates across the"
	cont "waves."
	done

UnknownText_0x760ae:
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

UnknownText_0x76143:
	text "<PLAY_G>, was it?"
	line "I heard you enter-"
	cont "tained my grand-"
	cont "daughter."

	para "I want to thank"
	line "you for that."
	done

UnknownText_0x7619b:
	text "I know! I'd like"
	line "you to have this!"
	done

UnknownText_0x761be:
	text "We're traveling"
	line "around the world."
	done

UnknownText_0x761e0:
	text "CAPTAIN, play with"
	line "me, please?"

	para "I'm bored! I want"
	line "to play more!"
	done

UnknownText_0x7621f:
	text "Hi! Will you play"
	line "with me?"

	para "…Oh!"

	para "Grandpa's worried"
	line "about me?"

	para "I have to go!"

	para "I have to go find"
	line "Grandpa!"
	done

UnknownText_0x76284:
	text "Grandpa, here I"
	line "am! I was playing"

	para "with the CAPTAIN"
	line "and this guy!"
	done

UnknownText_0x762c6:
	text "Grandpa, here I"
	line "am! I was playing"

	para "with the CAPTAIN"
	line "and this big girl!"
	done

UnknownText_0x7630d:
	text "I had lots of fun"
	line "playing!"
	done

PokefanmColinSeenText:
	text "Hey, kid! Want to"
	line "battle with me?"
	done

PokefanmColinBeatenText:
	text "You're strong!"
	done

UnknownText_0x7635b:
	text "You're traveling"
	line "all alone?"

	para "Isn't your mom"
	line "worried?"
	done

TwinsMegandpeg1SeenText:
	text "You think I'm a"
	line "baby?"
	cont "That's not fair!"
	done

TwinsMegandpeg1BeatenText:
	text "Oh! We lost!"
	done

UnknownText_0x763c2:
	text "Baby is a rude"
	line "name to call us"
	cont "girls!"
	done

TwinsMegandpeg2SeenText:
	text "I'm not a baby!"

	para "That's not nice to"
	line "say to a lady!"
	done

TwinsMegandpeg2BeatenText:
	text "Oh! We lost!"
	done

UnknownText_0x76428:
	text "Sometimes, kids"
	line "are smarter than"
	cont "grown-ups!"
	done

PsychicRodneySeenText:
	text "Ssh! My brain is"
	line "picking up radio"
	cont "signals!"
	done

PsychicRodneyBeatenText:
	text "…I hear some-"
	line "thing!"
	done

UnknownText_0x76497:
	text "I get it. You can"
	line "hear JOHTO's radio"
	cont "on the FAST SHIP."
	done

PokefanmJeremySeenText:
	text "What do you think?"
	line "My #MON are"
	cont "beautiful, yes?"
	done

PokefanmJeremyBeatenText:
	text "Oh, no! My beauti-"
	line "ful #MON!"
	done

UnknownText_0x7651c:
	text "I must go to the"
	line "#MON SALON and"
	cont "fix them up nice!"
	done

PokefanfGeorgiaSeenText:
	text "I'm going to shop"
	line "at the DEPT.STORE"
	cont "and then…"
	done

PokefanfGeorgiaBeatenText:
	text "What was I going"
	line "to do?"
	done

UnknownText_0x76596:
	text "Oh, yes! I have to"
	line "get my #MON out"
	cont "of DAY-CARE!"
	done

SupernerdShawnSeenText:
	text "What kinds of #"
	line "BALLS do you have"
	cont "with you?"
	done

SupernerdShawnBeatenText:
	text "Wait! Stop! Don't!"
	line "Please!"
	done

UnknownText_0x7660f:
	text "You should use the"
	line "right BALLS to fit"
	cont "the situation."
	done

UnknownText_0x76645:
	text "FAST SHIP S.S.AQUA"
	line "has arrived in"
	cont "VERMILION CITY."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEventHeader:
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
	signpost 25, 4, SIGNPOST_READ, FastShipCaptainsCabinTrashcan

	; people-events
	db 11
	person_event SPRITE_CAPTAIN, 29, 7, UP << 2 | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, CaptainScript_0x75ea7, -1
	person_event SPRITE_GENTLEMAN, 21, 6, LEFT << 2 | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, GentlemanScript_0x75f1f, EVENT_730
	person_event SPRITE_TWIN, 21, 7, LEFT << 2 | $2, $0, -1, -1, $0, 0, TwinScript_0x75f6d, EVENT_731
	person_event SPRITE_TWIN, 29, 6, LEFT << 2 | $2, $0, -1, -1, $0, 0, TwinScript_0x75ebb, EVENT_732
	person_event SPRITE_POKEFAN_M, 10, 9, LEFT << 2 | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 5, TrainerPokefanmColin, EVENT_739
	person_event SPRITE_TWIN, 8, 6, UP << 2 | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerTwinsMegandpeg1, EVENT_739
	person_event SPRITE_TWIN, 8, 7, UP << 2 | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerTwinsMegandpeg2, EVENT_739
	person_event SPRITE_SUPER_NERD, 9, 9, LEFT << 2 | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 5, TrainerPsychicRodney, EVENT_73A
	person_event SPRITE_POKEFAN_M, 7, 6, UP << 2 | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerPokefanmJeremy, EVENT_73B
	person_event SPRITE_POKEFAN_F, 9, 9, LEFT << 2 | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerPokefanfGeorgia, EVENT_73B
	person_event SPRITE_SUPER_NERD, 19, 5, DOWN << 2 | $3, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 2, TrainerSupernerdShawn, EVENT_73A
