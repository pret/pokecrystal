const_value set 2
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST

RadioTower4F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FisherScript_0x5eb82:
	jumptextfaceplayer UnknownText_0x5ec12

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
	trainer EVENT_BEAT_ROCKET_GRUNTM_10, GRUNTM, 10, GruntM10SeenText, GruntM10BeatenText, 0, GruntM10Script

GruntM10Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5ede2
	waitbutton
	closetext
	end

TrainerExecutivem2:
	trainer EVENT_BEAT_ROCKET_EXECUTIVEM_2, EXECUTIVEM, 2, Executivem2SeenText, Executivem2BeatenText, 0, Executivem2Script

Executivem2Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5ee69
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer EVENT_BEAT_ROCKET_GRUNTF_4, GRUNTF, 4, GruntF4SeenText, GruntF4BeatenText, 0, GruntF4Script

GruntF4Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5ef31
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer EVENT_BEAT_SCIENTIST_RICH, SCIENTIST, RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, ScientistRichScript

ScientistRichScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5efcb
	waitbutton
	closetext
	end

MapRadioTower4FSignpost0Script:
	jumptext UnknownText_0x5effe

MapRadioTower4FSignpost1Script:
	jumptext UnknownText_0x5f00d

UnknownText_0x5ec12:
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

UnknownText_0x5ede2:
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

UnknownText_0x5ee69:
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

UnknownText_0x5ef31:
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

UnknownText_0x5efcb:
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

RadioTower4F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $0, 1, RADIO_TOWER_5F
	warp_def $0, $9, 2, RADIO_TOWER_3F
	warp_def $0, $c, 2, RADIO_TOWER_5F
	warp_def $0, $11, 3, RADIO_TOWER_3F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 7, SIGNPOST_READ, MapRadioTower4FSignpost0Script
	signpost 0, 15, SIGNPOST_READ, MapRadioTower4FSignpost1Script

.PersonEvents:
	db 7
	person_event SPRITE_FISHER, 4, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x5eb82, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	person_event SPRITE_TEACHER, 6, 14, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TeacherScript_0x5eb85, -1
	person_event SPRITE_GROWLITHE, 7, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	person_event SPRITE_ROCKET, 6, 5, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET, 1, 14, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, -1, 0, PERSONTYPE_TRAINER, 2, TrainerExecutivem2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_ROCKET_GIRL, 4, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	person_event SPRITE_SCIENTIST, 2, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
