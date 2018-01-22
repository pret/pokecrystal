const_value set 2
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_GYM_GUY
	const RADIOTOWER3F_COOLTRAINER_F
	const RADIOTOWER3F_ROCKET1
	const RADIOTOWER3F_ROCKET2
	const RADIOTOWER3F_ROCKET3
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 1
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	return

.Change:
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	return

RadioTower3FSuperNerdScript:
	jumptextfaceplayer RadioTower3FSuperNerdText

GymGuyScript_0x5e556:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x5e564
	writetext UnknownText_0x5e682
	waitbutton
	closetext
	end

UnknownScript_0x5e564:
	writetext UnknownText_0x5e6eb
	waitbutton
	closetext
	end

CooltrainerFScript_0x5e56a:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	iftrue UnknownScript_0x5e59d
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x5e58a
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue UnknownScript_0x5e584
	writetext UnknownText_0x5e754
	waitbutton
	closetext
	end

UnknownScript_0x5e584:
	writetext UnknownText_0x5e7cb
	waitbutton
	closetext
	end

UnknownScript_0x5e58a:
	writetext UnknownText_0x5e7e2
	buttonsound
	verbosegiveitem TM_SUNNY_DAY
	iffalse UnknownScript_0x5e5a1
	writetext UnknownText_0x5e821
	waitbutton
	closetext
	setevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	end

UnknownScript_0x5e59d:
	writetext UnknownText_0x5e85c
	waitbutton
UnknownScript_0x5e5a1:
	closetext
	end

TrainerGruntM7:
	trainer EVENT_BEAT_ROCKET_GRUNTM_7, GRUNTM, GRUNTM_7, GruntM7SeenText, GruntM7BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext GruntM7AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM8:
	trainer EVENT_BEAT_ROCKET_GRUNTM_8, GRUNTM, GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM9:
	trainer EVENT_BEAT_ROCKET_GRUNTM_9, GRUNTM, GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMarc:
	trainer EVENT_BEAT_SCIENTIST_MARC, SCIENTIST, MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

MapRadioTower3FSignpost2Script::
	opentext
	writetext UnknownText_0x5eaa4
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue UnknownScript_0x5e603
	checkitem CARD_KEY
	iftrue UnknownScript_0x5e605
UnknownScript_0x5e603:
	closetext
	end

UnknownScript_0x5e605:
	writetext UnknownText_0x5eabc
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	reloadmappart
	closetext
	waitsfx
	end

MapRadioTower3FSignpost0Script:
	jumptext UnknownText_0x5ead6

MapRadioTower3FSignpost1Script:
	jumptext UnknownText_0x5eae4

RadioTower3FSuperNerdText:
	text "We have recordings"
	line "of the cries of"

	para "all #MON that"
	line "have been found."

	para "We must have about"
	line "200 kinds."
	done

UnknownText_0x5e682:
	text "To trainers, #-"
	line "MON are their"
	cont "beloved partners."

	para "It's terrible how"
	line "TEAM ROCKET is"

	para "trying to control"
	line "#MON."
	done

UnknownText_0x5e6eb:
	text "We run 24 hours a"
	line "day to broadcast"

	para "entertaining pro-"
	line "grams."

	para "I'll do my best to"
	line "run around the"
	cont "clock too!"
	done

UnknownText_0x5e754:
	text "The TEAM ROCKET"
	line "boss has locked"
	cont "himself in."

	para "But the DIRECTOR"
	line "can open it."

	para "He's up on the"
	line "fifth floor."

	para "Please save him!"
	done

UnknownText_0x5e7cb:
	text "Is the DIRECTOR"
	line "safe?"
	done

UnknownText_0x5e7e2:
	text "Thank you!"
	line "You're my hero!"

	para "This is a token of"
	line "my appreciation."
	done

UnknownText_0x5e821:
	text "It's SUNNY DAY."
	line "It powers up fire-"
	cont "type moves for a"
	cont "while."
	done

UnknownText_0x5e85c:
	text "You were simply"
	line "marvelous!"
	done

GruntM7SeenText:
	text "I've been given"
	line "strict orders."

	para "I'm to crush any-"
	line "one who challenges"
	cont "TEAM ROCKET!"
	done

GruntM7BeatenText:
	text "What?!"
	done

GruntM7AfterBattleText:
	text "I failed in my"
	line "duties…"

	para "I'll be docked pay"
	line "for this…"
	done

GruntM8SeenText:
	text "It feels great"
	line "ordering #MON"
	cont "to commit crimes."
	done

GruntM8BeatenText:
	text "You're kidding!"
	done

GruntM8AfterBattleText:
	text "I feel lousy over"
	line "losing!"

	para "Darn it! I hate"
	line "useless #MON!"
	done

GruntM9SeenText:
	text "Why did the shut-"
	line "ter open? Did you"

	para "have something to"
	line "do with this?"
	done

GruntM9BeatenText:
	text "I'm done for!"
	done

GruntM9AfterBattleText:
	text "What?! You made it"
	line "past our men in"
	cont "the UNDERGROUND?"

	para "How could you?"
	done

ScientistMarcSeenText:
	text "An unknown child"
	line "wandering here?"

	para "Who are you?"
	done

ScientistMarcBeatenText:
	text "Tch! I took you"
	line "too lightly!"
	done

ScientistMarcAfterBattleText:
	text "Bwahahaha…"

	para "I can transmit as"
	line "strong a signal as"
	cont "I need from here."
	done

UnknownText_0x5eaa4:
	text "It's the CARD KEY"
	line "slot."
	done

UnknownText_0x5eabc:
	text "<PLAYER> inserted"
	line "the CARD KEY."
	done

UnknownText_0x5ead6:
	text "3F PERSONNEL"
	done

UnknownText_0x5eae4:
	text "#MON MUSIC with"
	line "Host DJ BEN"
	done

RadioTower3F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def 0, 0, 1, RADIO_TOWER_2F
	warp_def 7, 0, 2, RADIO_TOWER_4F
	warp_def 17, 0, 4, RADIO_TOWER_4F

.CoordEvents:
	db 0

.BGEvents:
	db 3
	bg_event 3, 0, BGEVENT_READ, MapRadioTower3FSignpost0Script
	bg_event 9, 0, BGEVENT_READ, MapRadioTower3FSignpost1Script
	bg_event 14, 2, BGEVENT_UP, MapRadioTower3FSignpost2Script

.ObjectEvents:
	db 7
	object_event 7, 4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3FSuperNerdScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 3, 4, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GymGuyScript_0x5e556, -1
	object_event 11, 3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CooltrainerFScript_0x5e56a, -1
	object_event 5, 1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 6, 2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16, 6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 9, 6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
