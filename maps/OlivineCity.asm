OlivineCity_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000

.MapCallbacks:
	db 1

	; callbacks
	dbw 5, .FlyPoint

.Trigger1
	end

.Trigger2
	end

.FlyPoint
	setflag ENGINE_FLYPOINT_OLIVINE
	return

UnknownScript_0x1a8833:
	spriteface $0, LEFT
	showemote EMOTE_SHOCK, $0, 15
	special Functionc48f
	pause 15
	playsound SFX_ENTER_DOOR
	appear $5
	waitbutton
	applymovement $5, MovementData_0x1a88d2
	playmusic MUSIC_RIVAL_ENCOUNTER
	loadfont
	writetext UnknownText_0x1a88fa
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x1a88f4
	spriteface $0, RIGHT
	applymovement $5, MovementData_0x1a88db
	dotrigger $1
	disappear $5
	special RestartMapMusic
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SWIMMER_GUY
	special RunCallback_04
	end

UnknownScript_0x1a886b:
	spriteface $0, LEFT
	showemote EMOTE_SHOCK, $0, 15
	special Functionc48f
	pause 15
	playsound SFX_ENTER_DOOR
	appear $5
	waitbutton
	applymovement $5, MovementData_0x1a88d6
	playmusic MUSIC_RIVAL_ENCOUNTER
	loadfont
	writetext UnknownText_0x1a88fa
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x1a88f7
	spriteface $0, RIGHT
	applymovement $5, MovementData_0x1a88e8
	disappear $5
	dotrigger $1
	special RestartMapMusic
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SWIMMER_GUY
	special RunCallback_04
	end

SailorScript_0x1a88a3:
	jumptextfaceplayer UnknownText_0x1a8a58

StandingYoungsterScript_0x1a88a6:
	faceplayer
	loadfont
	random $2
	if_equal $0, UnknownScript_0x1a88b4
	writetext UnknownText_0x1a8b04
	closetext
	loadmovesprites
	end

UnknownScript_0x1a88b4:
	writetext UnknownText_0x1a8b41
	closetext
	loadmovesprites
	end

SailorScript_0x1a88ba:
	jumptextfaceplayer UnknownText_0x1a8b71

OlivineCitySign:
	jumptext OlivineCitySignText

OlivineCityPortSign:
	jumptext OlivineCityPortSignText

OlivineGymSign:
	jumptext OlivineGymSignText

OlivineLighthouseSign:
	jumptext OlivineLighthouseSignText

OlivineCityBattleTowerSign:
	jumptext OlivineCityBattleTowerSignText

OlivineCityPokeCenterSign:
	jumpstd pokecentersign

OlivineCityMartSign:
	jumpstd martsign

MovementData_0x1a88d2:
	step_down
	step_right
	step_right
	step_end

MovementData_0x1a88d6:
	step_down
	step_down
	step_right
	step_right
	step_end

MovementData_0x1a88db:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

MovementData_0x1a88e8:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

MovementData_0x1a88f4:
	step_down
	turn_head_up
	step_end

MovementData_0x1a88f7:
	step_up
	turn_head_down
	step_end

UnknownText_0x1a88fa:
	text "…"

	para "You again?"

	para "There's no need to"
	line "panic. I don't"

	para "bother with wimps"
	line "like you."

	para "Speaking of weak-"
	line "lings, the city's"

	para "GYM LEADER isn't"
	line "here."

	para "Supposedly taking"
	line "care of a sick"

	para "#MON at the"
	line "LIGHTHOUSE."

	para "Humph! Boo-hoo!"
	line "Just let sick"
	cont "#MON go!"

	para "A #MON that"
	line "can't battle is"
	cont "worthless!"

	para "Why don't you go"
	line "train at the"
	cont "LIGHTHOUSE?"

	para "Who knows. It may"
	line "make you a bit"
	cont "less weak!"
	done

UnknownText_0x1a8a58:
	text "Dark roads are"
	line "dangerous at"
	cont "night."

	para "But in the pitch-"
	line "black of night,"

	para "the sea is even"
	line "more treacherous!"

	para "Without the beacon"
	line "of the LIGHTHOUSE"

	para "to guide it, no"
	line "ship can sail."
	done

UnknownText_0x1a8b04:
	text "That thing you"
	line "have--it's a #-"
	cont "GEAR, right? Wow,"
	cont "that's cool."
	done

UnknownText_0x1a8b41:
	text "Wow, you have a"
	line "#DEX!"

	para "That is just so"
	line "awesome."
	done

UnknownText_0x1a8b71:
	text "The sea is sweet!"

	para "Sunsets on the sea"
	line "are marvelous!"

	para "Sing with me! "
	line "Yo-ho! Blow the"
	cont "man down!…"
	done

OlivineCitySignText:
	text "OLIVINE CITY"

	para "The Port Closest"
	line "to Foreign Lands"
	done

OlivineCityPortSignText:
	text "OLIVINE PORT"
	line "FAST SHIP PIER"
	done

OlivineGymSignText:
	text "OLIVINE CITY"
	line "#MON GYM"
	cont "LEADER: JASMINE"

	para "The Steel-Clad"
	line "Defense Girl"
	done

OlivineLighthouseSignText:
	text "OLIVINE LIGHTHOUSE"
	line "Also known as the"
	cont "GLITTER LIGHTHOUSE"
	done

OlivineCityBattleTowerSignText:
	text "BATTLE TOWER AHEAD"
	line "Opening Now!"
	done

UnknownText_0x1a8cba:
	text "BATTLE TOWER AHEAD"
	done

OlivineCity_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 11
	warp_def $15, $d, 1, GROUP_OLIVINE_POKECENTER_1F, MAP_OLIVINE_POKECENTER_1F
	warp_def $b, $a, 1, GROUP_OLIVINE_GYM, MAP_OLIVINE_GYM
	warp_def $b, $19, 1, GROUP_OLIVINE_VOLTORB_HOUSE, MAP_OLIVINE_VOLTORB_HOUSE
	warp_def $0, $0, 1, GROUP_OLIVINE_HOUSE_BETA, MAP_OLIVINE_HOUSE_BETA
	warp_def $b, $1d, 1, GROUP_OLIVINE_PUNISHMENT_SPEECH_HOUSE, MAP_OLIVINE_PUNISHMENT_SPEECH_HOUSE
	warp_def $f, $d, 1, GROUP_OLIVINE_GOOD_ROD_HOUSE, MAP_OLIVINE_GOOD_ROD_HOUSE
	warp_def $15, $7, 1, GROUP_OLIVINE_CAFE, MAP_OLIVINE_CAFE
	warp_def $11, $13, 2, GROUP_OLIVINE_MART, MAP_OLIVINE_MART
	warp_def $1b, $1d, 1, GROUP_OLIVINE_LIGHTHOUSE_1F, MAP_OLIVINE_LIGHTHOUSE_1F
	warp_def $1b, $13, 1, GROUP_OLIVINE_PORT_PASSAGE, MAP_OLIVINE_PORT_PASSAGE
	warp_def $1b, $14, 2, GROUP_OLIVINE_PORT_PASSAGE, MAP_OLIVINE_PORT_PASSAGE

.XYTriggers:
	db 2
	xy_trigger 0, $c, $d, $0, UnknownScript_0x1a8833, $0, $0
	xy_trigger 0, $d, $d, $0, UnknownScript_0x1a886b, $0, $0

.Signposts:
	db 7
	signpost 11, 17, SIGNPOST_READ, OlivineCitySign
	signpost 24, 20, SIGNPOST_READ, OlivineCityPortSign
	signpost 11, 7, SIGNPOST_READ, OlivineGymSign
	signpost 28, 30, SIGNPOST_READ, OlivineLighthouseSign
	signpost 23, 3, SIGNPOST_READ, OlivineCityBattleTowerSign
	signpost 21, 14, SIGNPOST_READ, OlivineCityPokeCenterSign
	signpost 17, 20, SIGNPOST_READ, OlivineCityMartSign

.PersonEvents:
	db 4
	person_event SPRITE_SAILOR, 31, 30, OW_UP | $0, $10, -1, -1, $0, 0, SailorScript_0x1a88a3, -1
	person_event SPRITE_STANDING_YOUNGSTER, 17, 24, OW_DOWN | $3, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, StandingYoungsterScript_0x1a88a6, -1
	person_event SPRITE_SAILOR, 25, 21, OW_DOWN | $2, $11, -1, -1, $0, 0, SailorScript_0x1a88ba, -1
	person_event SPRITE_OLIVINE_RIVAL, 15, 14, OW_UP | $2, $0, -1, -1, $0, 0, ObjectEvent, EVENT_RIVAL_OLIVINE_CITY
