RadioTower4F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

FisherScript_0x5eb82:
	jumptextfaceplayer UnknownText_0x5ec12

TeacherScript_0x5eb85:
	faceplayer
	loadfont
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue UnknownScript_0x5ebac
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x5eb99
	writetext UnknownText_0x5ec68
	closetext
	loadmovesprites
	end

UnknownScript_0x5eb99:
	writetext UnknownText_0x5ecab
	keeptextopen
	verbosegiveitem PINK_BOW, 1
	iffalse UnknownScript_0x5ebb0
	writetext UnknownText_0x5ecef
	closetext
	loadmovesprites
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

UnknownScript_0x5ebac:
	writetext UnknownText_0x5ed2c
	closetext
UnknownScript_0x5ebb0:
	loadmovesprites
	end

GrowlitheScript_0x5ebb2:
	loadfont
	writetext UnknownText_0x5ed66
	cry MEOWTH
	closetext
	loadmovesprites
	end

TrainerGruntM10:
	; bit/flag number
	dw EVENT_BEAT_ROCKET_GRUNTM_10

	; trainer group && trainer id
	db GRUNTM, 10

	; text when seen
	dw GruntM10SeenText

	; text when trainer beaten
	dw GruntM10BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM10Script

GruntM10Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5ede2
	closetext
	loadmovesprites
	end

TrainerExecutivem2:
	; bit/flag number
	dw EVENT_BEAT_ROCKET_EXECUTIVEM_2

	; trainer group && trainer id
	db EXECUTIVEM, 2

	; text when seen
	dw Executivem2SeenText

	; text when trainer beaten
	dw Executivem2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Executivem2Script

Executivem2Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5ee69
	closetext
	loadmovesprites
	end

TrainerGruntF4:
	; bit/flag number
	dw EVENT_BEAT_ROCKET_GRUNTF_4

	; trainer group && trainer id
	db GRUNTF, 4

	; text when seen
	dw GruntF4SeenText

	; text when trainer beaten
	dw GruntF4BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntF4Script

GruntF4Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5ef31
	closetext
	loadmovesprites
	end

TrainerScientistRich:
	; bit/flag number
	dw EVENT_BEAT_SCIENTIST_RICH

	; trainer group && trainer id
	db SCIENTIST, RICH

	; text when seen
	dw ScientistRichSeenText

	; text when trainer beaten
	dw ScientistRichBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw ScientistRichScript

ScientistRichScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5efcb
	closetext
	loadmovesprites
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

UnknownText_0x5ed66:
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

	; warps
	db 4
	warp_def $0, $0, 1, GROUP_RADIO_TOWER_5F, MAP_RADIO_TOWER_5F
	warp_def $0, $9, 2, GROUP_RADIO_TOWER_3F, MAP_RADIO_TOWER_3F
	warp_def $0, $c, 2, GROUP_RADIO_TOWER_5F, MAP_RADIO_TOWER_5F
	warp_def $0, $11, 3, GROUP_RADIO_TOWER_3F, MAP_RADIO_TOWER_3F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 7, $0, MapRadioTower4FSignpost0Script
	signpost 0, 15, $0, MapRadioTower4FSignpost1Script

	; people-events
	db 7
	person_event SPRITE_FISHER, 8, 10, $7, $0, 255, 255, $80, 0, FisherScript_0x5eb82, $06d0
	person_event SPRITE_TEACHER, 10, 18, $3, $0, 255, 255, $a0, 0, TeacherScript_0x5eb85, $ffff
	person_event SPRITE_GROWLITHE, 11, 16, $16, $0, 255, 255, $80, 0, GrowlitheScript_0x5ebb2, $ffff
	person_event SPRITE_ROCKET, 10, 9, $1f, $0, 255, 255, $2, 3, TrainerGruntM10, $06ce
	person_event SPRITE_ROCKET, 5, 18, $8, $2, 255, 255, $2, 2, TrainerExecutivem2, $06ce
	person_event SPRITE_ROCKET_GIRL, 8, 16, $9, $0, 255, 255, $82, 1, TrainerGruntF4, $06ce
	person_event SPRITE_SCIENTIST, 6, 8, $8, $0, 255, 255, $92, 4, TrainerScientistRich, $06ce
