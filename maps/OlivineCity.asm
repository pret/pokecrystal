OlivineCity_MapScriptHeader: ; 0x1a8820
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1a882d, $0000
	dw UnknownScript_0x1a882e, $0000

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a882f
; 0x1a882d

UnknownScript_0x1a882d: ; 0x1a882d
	end
; 0x1a882e

UnknownScript_0x1a882e: ; 0x1a882e
	end
; 0x1a882f

UnknownScript_0x1a882f: ; 0x1a882f
	setflag $0047
	return
; 0x1a8833

UnknownScript_0x1a8833: ; 0x1a8833
	spriteface $0, $2
	showemote $0, $0, 15
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
	spriteface $0, $3
	applymovement $5, MovementData_0x1a88db
	dotrigger $1
	disappear $5
	special RestartMapMusic
	variablesprite $5, $31
	special Function14209
	end
; 0x1a886b

UnknownScript_0x1a886b: ; 0x1a886b
	spriteface $0, $2
	showemote $0, $0, 15
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
	spriteface $0, $3
	applymovement $5, MovementData_0x1a88e8
	disappear $5
	dotrigger $1
	special RestartMapMusic
	variablesprite $5, $31
	special Function14209
	end
; 0x1a88a3

SailorScript_0x1a88a3: ; 0x1a88a3
	jumptextfaceplayer UnknownText_0x1a8a58
; 0x1a88a6

StandingYoungsterScript_0x1a88a6: ; 0x1a88a6
	faceplayer
	loadfont
	random $2
	if_equal $0, UnknownScript_0x1a88b4
	writetext UnknownText_0x1a8b04
	closetext
	loadmovesprites
	end
; 0x1a88b4

UnknownScript_0x1a88b4: ; 0x1a88b4
	writetext UnknownText_0x1a8b41
	closetext
	loadmovesprites
	end
; 0x1a88ba

SailorScript_0x1a88ba: ; 0x1a88ba
	jumptextfaceplayer UnknownText_0x1a8b71
; 0x1a88bd

MapOlivineCitySignpost0Script: ; 0x1a88bd
	jumptext UnknownText_0x1a8bd0
; 0x1a88c0

MapOlivineCitySignpost1Script: ; 0x1a88c0
	jumptext UnknownText_0x1a8c00
; 0x1a88c3

MapOlivineCitySignpost2Script: ; 0x1a88c3
	jumptext UnknownText_0x1a8c1d
; 0x1a88c6

MapOlivineCitySignpost3Script: ; 0x1a88c6
	jumptext UnknownText_0x1a8c60
; 0x1a88c9

MapOlivineCitySignpost4Script: ; 0x1a88c9
	jumptext UnknownText_0x1a8c99
; 0x1a88cc

MapOlivineCitySignpost5Script: ; 0x1a88cc
	jumpstd pokecentersign
; 0x1a88cf

MapOlivineCitySignpost6Script: ; 0x1a88cf
	jumpstd martsign
; 0x1a88d2

MovementData_0x1a88d2: ; 0x1a88d2
	step_down
	step_right
	step_right
	step_end
; 0x1a88d6

MovementData_0x1a88d6: ; 0x1a88d6
	step_down
	step_down
	step_right
	step_right
	step_end
; 0x1a88db

MovementData_0x1a88db: ; 0x1a88db
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
; 0x1a88e8

MovementData_0x1a88e8: ; 0x1a88e8
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
; 0x1a88f4

MovementData_0x1a88f4: ; 0x1a88f4
	step_down
	turn_head_up
	step_end
; 0x1a88f7

MovementData_0x1a88f7: ; 0x1a88f7
	step_up
	turn_head_down
	step_end
; 0x1a88fa

UnknownText_0x1a88fa: ; 0x1a88fa
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
; 0x1a8a58

UnknownText_0x1a8a58: ; 0x1a8a58
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
; 0x1a8b04

UnknownText_0x1a8b04: ; 0x1a8b04
	text "That thing you"
	line "have--it's a #-"
	cont "GEAR, right? Wow,"
	cont "that's cool."
	done
; 0x1a8b41

UnknownText_0x1a8b41: ; 0x1a8b41
	text "Wow, you have a"
	line "#DEX!"

	para "That is just so"
	line "awesome."
	done
; 0x1a8b71

UnknownText_0x1a8b71: ; 0x1a8b71
	text "The sea is sweet!"

	para "Sunsets on the sea"
	line "are marvelous!"

	para "Sing with me! "
	line "Yo-ho! Blow the"
	cont "man down!…"
	done
; 0x1a8bd0

UnknownText_0x1a8bd0: ; 0x1a8bd0
	text "OLIVINE CITY"

	para "The Port Closest"
	line "to Foreign Lands"
	done
; 0x1a8c00

UnknownText_0x1a8c00: ; 0x1a8c00
	text "OLIVINE PORT"
	line "FAST SHIP PIER"
	done
; 0x1a8c1d

UnknownText_0x1a8c1d: ; 0x1a8c1d
	text "OLIVINE CITY"
	line "#MON GYM"
	cont "LEADER: JASMINE"

	para "The Steel-Clad"
	line "Defense Girl"
	done
; 0x1a8c60

UnknownText_0x1a8c60: ; 0x1a8c60
	text "OLIVINE LIGHTHOUSE"
	line "Also known as the"
	cont "GLITTER LIGHTHOUSE"
	done
; 0x1a8c99

UnknownText_0x1a8c99: ; 0x1a8c99
	text "BATTLE TOWER AHEAD"
	line "Opening Now!"
	done
; 0x1a8cba

UnknownText_0x1a8cba: ; 0x1a8cba
	text "BATTLE TOWER AHEAD"
	done
; 0x1a8cce

OlivineCity_MapEventHeader: ; 0x1a8cce
	; filler
	db 0, 0

	; warps
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

	; xy triggers
	db 2
	xy_trigger 0, $c, $d, $0, UnknownScript_0x1a8833, $0, $0
	xy_trigger 0, $d, $d, $0, UnknownScript_0x1a886b, $0, $0

	; signposts
	db 7
	signpost 11, 17, $0, MapOlivineCitySignpost0Script
	signpost 24, 20, $0, MapOlivineCitySignpost1Script
	signpost 11, 7, $0, MapOlivineCitySignpost2Script
	signpost 28, 30, $0, MapOlivineCitySignpost3Script
	signpost 23, 3, $0, MapOlivineCitySignpost4Script
	signpost 21, 14, $0, MapOlivineCitySignpost5Script
	signpost 17, 20, $0, MapOlivineCitySignpost6Script

	; people-events
	db 4
	person_event SPRITE_SAILOR, 31, 30, $4, $10, 255, 255, $0, 0, SailorScript_0x1a88a3, $ffff
	person_event SPRITE_STANDING_YOUNGSTER, 17, 24, $3, $0, 255, 255, $80, 0, StandingYoungsterScript_0x1a88a6, $ffff
	person_event SPRITE_SAILOR, 25, 21, $2, $11, 255, 255, $0, 0, SailorScript_0x1a88ba, $ffff
	person_event SPRITE_OLIVINE_RIVAL, 15, 14, $6, $0, 255, 255, $0, 0, ObjectEvent, $06c3
; 0x1a8d72
