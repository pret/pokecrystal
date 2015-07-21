FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

UnknownScript_0x75ea6:
	end

CaptainScript_0x75ea7:
	faceplayer
	loadfont
	checkevent EVENT_FAST_SHIP_FIRST_TIME
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
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear $5
	applymovement $0, MovementData_0x76004
	moveperson $4, $3, $13
	appear $4
	spriteface $0, UP
	spriteface $4, UP
	special Special_FadeInQuickly
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
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	domaptrigger GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $0
	jump UnknownScript_0x75f37

GentlemanScript_0x75f1f:
	faceplayer
	loadfont
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue UnknownScript_0x75f67
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
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
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
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
	trainer EVENT_BEAT_POKEFANM_COLIN, POKEFANM, COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, $0000, PokefanmColinScript

PokefanmColinScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7635b
	closetext
	loadmovesprites
	end

TrainerTwinsMegandpeg1:
	trainer EVENT_BEAT_TWINS_MEG_AND_PEG, TWINS, MEGANDPEG1, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, $0000, TwinsMegandpeg1Script

TwinsMegandpeg1Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x763c2
	closetext
	loadmovesprites
	end

TrainerTwinsMegandpeg2:
	trainer EVENT_BEAT_TWINS_MEG_AND_PEG, TWINS, MEGANDPEG2, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, $0000, TwinsMegandpeg2Script

TwinsMegandpeg2Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76428
	closetext
	loadmovesprites
	end

TrainerPsychicRodney:
	trainer EVENT_BEAT_PSYCHIC_RODNEY, PSYCHIC_T, RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, $0000, PsychicRodneyScript

PsychicRodneyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76497
	closetext
	loadmovesprites
	end

TrainerPokefanmJeremy:
	trainer EVENT_BEAT_POKEFANM_JEREMY, POKEFANM, JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, $0000, PokefanmJeremyScript

PokefanmJeremyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7651c
	closetext
	loadmovesprites
	end

TrainerPokefanfGeorgia:
	trainer EVENT_BEAT_POKEFANF_GEORGIA, POKEFANF, GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, $0000, PokefanfGeorgiaScript

PokefanfGeorgiaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x76596
	closetext
	loadmovesprites
	end

TrainerSupernerdShawn:
	trainer EVENT_BEAT_SUPER_NERD_SHAWN, SUPER_NERD, SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, $0000, SupernerdShawnScript

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

.Warps:
	db 6
	warp_def $7, $2, 8, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $7, $3, 8, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $13, $2, 9, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $13, $3, 9, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $21, $2, 10, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $21, $3, 10, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 25, 4, SIGNPOST_READ, FastShipCaptainsCabinTrashcan

.PersonEvents:
	db 11
	person_event SPRITE_CAPTAIN, 29, 7, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, CaptainScript_0x75ea7, -1
	person_event SPRITE_GENTLEMAN, 21, 6, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, GentlemanScript_0x75f1f, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	person_event SPRITE_TWIN, 21, 7, OW_LEFT | $2, $0, -1, -1, $0, 0, TwinScript_0x75f6d, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	person_event SPRITE_TWIN, 29, 6, OW_LEFT | $2, $0, -1, -1, $0, 0, TwinScript_0x75ebb, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	person_event SPRITE_POKEFAN_M, 10, 9, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	person_event SPRITE_TWIN, 8, 6, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	person_event SPRITE_TWIN, 8, 7, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	person_event SPRITE_SUPER_NERD, 9, 9, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	person_event SPRITE_POKEFAN_M, 7, 6, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	person_event SPRITE_POKEFAN_F, 9, 9, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	person_event SPRITE_SUPER_NERD, 19, 5, OW_DOWN | $3, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
