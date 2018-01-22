const_value set 2
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST

RadioTower4F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

RadioTower4FFisherScript:
	jumptextfaceplayer RadioTower4FFisherText

TeacherScript_0x5eb85:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue UnknownScript_0x5ebac
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x5eb99
	writetext UnknownText_0x5ec68
	waitbutton
	closetext
	end

UnknownScript_0x5eb99:
	writetext UnknownText_0x5ecab
	buttonsound
	verbosegiveitem PINK_BOW
	iffalse UnknownScript_0x5ebb0
	writetext UnknownText_0x5ecef
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

UnknownScript_0x5ebac:
	writetext UnknownText_0x5ed2c
	waitbutton
UnknownScript_0x5ebb0:
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

TrainerGruntM10:
	trainer EVENT_BEAT_ROCKET_GRUNTM_10, GRUNTM, GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end

TrainerExecutivem2:
	trainer EVENT_BEAT_ROCKET_EXECUTIVEM_2, EXECUTIVEM, EXECUTIVEM_2, Executivem2SeenText, Executivem2BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext Executivem2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer EVENT_BEAT_ROCKET_GRUNTF_4, GRUNTF, GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext GruntF4AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer EVENT_BEAT_SCIENTIST_RICH, SCIENTIST, RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

MapRadioTower4FSignpost0Script:
	jumptext UnknownText_0x5effe

MapRadioTower4FSignpost1Script:
	jumptext UnknownText_0x5f00d

RadioTower4FFisherText:
	text "I listened to the"
	line "radio while I was"
	cont "at the RUINS."

	para "I heard a strange"
	line "broadcast there."
	done

UnknownText_0x5ec68:
	text "MARY: Why? Why do"
	line "I have to suffer"
	cont "through this?"

	para "MEOWTH, help me!"
	done

UnknownText_0x5ecab:
	text "MARY: Oh! You're"
	line "my little savior!"

	para "Will you take this"
	line "as my thanks?"
	done

UnknownText_0x5ecef:
	text "MARY: It's just"
	line "right for #MON"

	para "that know normal-"
	line "type moves."
	done

UnknownText_0x5ed2c:
	text "MARY: Please tune"
	line "into me on PROF."

	para "OAK'S #MON TALK"
	line "show."
	done

RadioTowerMeowthText:
	text "MEOWTH: Meowth…"
	done

GruntM10SeenText:
	text "You plan to rescue"
	line "the DIRECTOR?"

	para "That won't be pos-"
	line "sible because I'm"
	cont "going to beat you!"
	done

GruntM10BeatenText:
	text "No! Unbelievable!"
	done

GruntM10AfterBattleText:
	text "I don't believe"
	line "it! I was beaten!"
	done

Executivem2SeenText:
	text "Stop! I'm known as"
	line "the TEAM ROCKET"
	cont "fortress!"

	para "You're not taking"
	line "another step!"
	done

Executivem2BeatenText:
	text "The fortress came"
	line "down!"
	done

Executivem2AfterBattleText:
	text "You've earned my"
	line "respect, so here's"
	cont "some advice."

	para "It's not too late."
	line "You can still turn"
	cont "back."
	done

GruntF4SeenText:
	text "Don't I think"
	line "#MON are cute?"

	para "I'll think my"
	line "#MON are cute--"

	para "after they beat"
	line "yours!"
	done

GruntF4BeatenText:
	text "Oh, no! They're so"
	line "useless!"
	done

GruntF4AfterBattleText:
	text "I love my"
	line "beautiful self!"

	para "Who cares about"
	line "#MON?"
	done

ScientistRichSeenText:
	text "Most excellent."

	para "This RADIO TOWER"
	line "will fulfill our"
	cont "grand design."
	done

ScientistRichBeatenText:
	text "Hmmm…"

	para "All grand plans"
	line "come with snags."
	done

ScientistRichAfterBattleText:
	text "Do you honestly"
	line "believe you can"
	cont "stop TEAM ROCKET?"
	done

UnknownText_0x5effe:
	text "4F PRODUCTION"
	done

UnknownText_0x5f00d:
	text "4F STUDIO 2"
	done

RadioTower4F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 0, 0, 1, RADIO_TOWER_5F
	warp_def 9, 0, 2, RADIO_TOWER_3F
	warp_def 12, 0, 2, RADIO_TOWER_5F
	warp_def 17, 0, 3, RADIO_TOWER_3F

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 7, 0, BGEVENT_READ, MapRadioTower4FSignpost0Script
	bg_event 15, 0, BGEVENT_READ, MapRadioTower4FSignpost1Script

.ObjectEvents:
	db 7
	object_event 6, 4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FFisherScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14, 6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TeacherScript_0x5eb85, -1
	object_event 12, 7, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event 5, 6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14, 1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerExecutivem2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12, 4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 4, 2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
