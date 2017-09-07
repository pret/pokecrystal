const_value set 2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

UnknownScript_0x75ea6:
	end

CaptainScript_0x75ea7:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue UnknownScript_0x75eb5
	writetext UnknownText_0x76012
	waitbutton
	closetext
	end

UnknownScript_0x75eb5:
	writetext UnknownText_0x76064
	waitbutton
	closetext
	end

TwinScript_0x75ebb:
	spriteface FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	opentext
	writetext UnknownText_0x761e0
	waitbutton
	closetext
	faceplayer
	opentext
	writetext UnknownText_0x7621f
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, MovementData_0x76004
	moveperson FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, $3, $13
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	spriteface PLAYER, UP
	spriteface FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	special Special_FadeInQuickly
	spriteface FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, MovementData_0x7600c
	spriteface FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue UnknownScript_0x75f03
	opentext
	writetext UnknownText_0x76284
	waitbutton
	closetext
	jump UnknownScript_0x75f09

UnknownScript_0x75f03:
	opentext
	writetext UnknownText_0x762c6
	waitbutton
	closetext
UnknownScript_0x75f09:
	spriteface FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, MovementData_0x76010
	opentext
	writetext UnknownText_0x76143
	buttonsound
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	domaptrigger FAST_SHIP_1F, $0
	jump UnknownScript_0x75f37

GentlemanScript_0x75f1f:
	faceplayer
	opentext
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue UnknownScript_0x75f67
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftrue UnknownScript_0x75f58
	writetext UnknownText_0x760ae
	waitbutton
	closetext
	domaptrigger FAST_SHIP_1F, $0
	end

UnknownScript_0x75f37:
	writetext UnknownText_0x7619b
	buttonsound
	verbosegiveitem METAL_COAT
	iffalse UnknownScript_0x75f44
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
UnknownScript_0x75f44:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext UnknownText_0x76645
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	closetext
	end

UnknownScript_0x75f58:
	writetext UnknownText_0x7619b
	buttonsound
	verbosegiveitem METAL_COAT
	iffalse UnknownScript_0x75f65
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
UnknownScript_0x75f65:
	closetext
	end

UnknownScript_0x75f67:
	writetext UnknownText_0x761be
	waitbutton
	closetext
	end

TwinScript_0x75f6d:
	faceplayer
	opentext
	writetext UnknownText_0x7630d
	waitbutton
	closetext
	end

TrainerPokefanmColin:
	trainer EVENT_BEAT_POKEFANM_COLIN, POKEFANM, COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, PokefanmColinScript

PokefanmColinScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7635b
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer EVENT_BEAT_TWINS_MEG_AND_PEG, TWINS, MEGANDPEG1, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, TwinsMegandpeg1Script

TwinsMegandpeg1Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x763c2
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer EVENT_BEAT_TWINS_MEG_AND_PEG, TWINS, MEGANDPEG2, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, TwinsMegandpeg2Script

TwinsMegandpeg2Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x76428
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer EVENT_BEAT_PSYCHIC_RODNEY, PSYCHIC_T, RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, PsychicRodneyScript

PsychicRodneyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x76497
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer EVENT_BEAT_POKEFANM_JEREMY, POKEFANM, JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, PokefanmJeremyScript

PokefanmJeremyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7651c
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer EVENT_BEAT_POKEFANF_GEORGIA, POKEFANF, GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, PokefanfGeorgiaScript

PokefanfGeorgiaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x76596
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer EVENT_BEAT_SUPER_NERD_SHAWN, SUPER_NERD, SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, SupernerdShawnScript

SupernerdShawnScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7660f
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd trashcan

MovementData_0x76004:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_0x7600c:
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x76010:
	step DOWN
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
	warp_def $7, $2, 8, FAST_SHIP_1F
	warp_def $7, $3, 8, FAST_SHIP_1F
	warp_def $13, $2, 9, FAST_SHIP_1F
	warp_def $13, $3, 9, FAST_SHIP_1F
	warp_def $21, $2, 10, FAST_SHIP_1F
	warp_def $21, $3, 10, FAST_SHIP_1F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 25, 4, SIGNPOST_READ, FastShipCaptainsCabinTrashcan

.PersonEvents:
	db 11
	person_event SPRITE_CAPTAIN, 25, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CaptainScript_0x75ea7, -1
	person_event SPRITE_GENTLEMAN, 17, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x75f1f, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	person_event SPRITE_TWIN, 17, 3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TwinScript_0x75f6d, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	person_event SPRITE_TWIN, 25, 2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TwinScript_0x75ebb, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	person_event SPRITE_POKEFAN_M, 6, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	person_event SPRITE_TWIN, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	person_event SPRITE_TWIN, 4, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	person_event SPRITE_SUPER_NERD, 5, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	person_event SPRITE_POKEFAN_F, 5, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	person_event SPRITE_SUPER_NERD, 15, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
