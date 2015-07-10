OlivineLighthouse2F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerGentlemanAlfred:
	; bit/flag number
	dw EVENT_BEAT_GENTLEMAN_ALFRED

	; trainer group && trainer id
	db GENTLEMAN, ALFRED

	; text when seen
	dw GentlemanAlfredSeenText

	; text when trainer beaten
	dw GentlemanAlfredBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GentlemanAlfredScript

GentlemanAlfredScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5b13e
	closetext
	loadmovesprites
	end

TrainerSailorHuey1:
	; bit/flag number
	dw EVENT_BEAT_SAILOR_HUEY

	; trainer group && trainer id
	db SAILOR, HUEY1

	; text when seen
	dw SailorHuey1SeenText

	; text when trainer beaten
	dw SailorHuey1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorHuey1Script

SailorHuey1Script:
	writecode VAR_CALLERID, $7
	talkaftercancel
	loadfont
	checkflag $0066
	iftrue UnknownScript_0x5afc7
	checkcellnum $7
	iftrue UnknownScript_0x5b05f
	checkevent $0263
	iftrue UnknownScript_0x5afb0
	setevent $0263
	scall UnknownScript_0x5b053
	jump UnknownScript_0x5afb3

UnknownScript_0x5afb0:
	scall UnknownScript_0x5b057
UnknownScript_0x5afb3:
	askforphonenumber $7
	if_equal $1, UnknownScript_0x5b067
	if_equal $2, UnknownScript_0x5b063
	trainertotext SAILOR, HUEY1, $0
	scall UnknownScript_0x5b05b
	jump UnknownScript_0x5b05f

UnknownScript_0x5afc7:
	scall UnknownScript_0x5b06b
	winlosstext SailorHuey1BeatenText, $0000
	copybytetovar wd9f4
	if_equal $3, UnknownScript_0x5afe2
	if_equal $2, UnknownScript_0x5afe8
	if_equal $1, UnknownScript_0x5afee
	if_equal $0, UnknownScript_0x5aff4
UnknownScript_0x5afe2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x5b01b
UnknownScript_0x5afe8:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x5b00e
UnknownScript_0x5afee:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x5b001
UnknownScript_0x5aff4:
	loadtrainer SAILOR, HUEY1
	startbattle
	returnafterbattle
	loadvar wd9f4, $1
	clearflag $0066
	end

UnknownScript_0x5b001:
	loadtrainer SAILOR, HUEY2
	startbattle
	returnafterbattle
	loadvar wd9f4, $2
	clearflag $0066
	end

UnknownScript_0x5b00e:
	loadtrainer SAILOR, HUEY3
	startbattle
	returnafterbattle
	loadvar wd9f4, $3
	clearflag $0066
	end

UnknownScript_0x5b01b:
	loadtrainer SAILOR, HUEY4
	startbattle
	returnafterbattle
	clearflag $0066
	checkevent EVENT_HUEY_PROTEIN
	iftrue UnknownScript_0x5b03f
	checkevent $0265
	iftrue UnknownScript_0x5b03e
	scall UnknownScript_0x5b076
	verbosegiveitem PROTEIN, 1
	iffalse UnknownScript_0x5b06f
	setevent $0265
	jump UnknownScript_0x5b05f

UnknownScript_0x5b03e:
	end

UnknownScript_0x5b03f:
	loadfont
	writetext UnknownText_0x5b1b6
	closetext
	verbosegiveitem PROTEIN, 1
	iffalse UnknownScript_0x5b06f
	clearevent EVENT_HUEY_PROTEIN
	setevent $0265
	jump UnknownScript_0x5b05f

UnknownScript_0x5b053:
	jumpstd asknumber1m
	end

UnknownScript_0x5b057:
	jumpstd asknumber2m
	end

UnknownScript_0x5b05b:
	jumpstd registerednumberm
	end

UnknownScript_0x5b05f:
	jumpstd numberacceptedm
	end

UnknownScript_0x5b063:
	jumpstd numberdeclinedm
	end

UnknownScript_0x5b067:
	jumpstd phonefullm
	end

UnknownScript_0x5b06b:
	jumpstd rematchm
	end

UnknownScript_0x5b06f:
	setevent EVENT_HUEY_PROTEIN
	jumpstd packfullm
	end

UnknownScript_0x5b076:
	jumpstd rematchgiftm
	end

SailorHuey1SeenText:
	text "Men of the sea are"
	line "always spoiling"
	cont "for a good fight!"
	done

SailorHuey1BeatenText:
	text "Urf!"
	line "I lose!"
	done

; possibly unused
UnknownText_0x5b0be:
	text "What power!"
	line "How would you like"

	para "to sail the seas"
	line "with me?"
	done

GentlemanAlfredSeenText:
	text "Hm? This is no"
	line "place for playing."
	done

GentlemanAlfredBeatenText:
	text "Ah! I can see that"
	line "you're serious."
	done

UnknownText_0x5b13e:
	text "Up top is a #-"
	line "MON that keeps the"
	cont "LIGHTHOUSE lit."

	para "But I hear that"
	line "it's sick now and"

	para "can't be cured by"
	line "ordinary medicine."
	done

UnknownText_0x5b1b6:
	text "Man! You're as"
	line "tough as ever!"

	para "Anyway, here's"
	line "that medicine from"
	cont "before."
	done

OlivineLighthouse2F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $b, $3, 3, GROUP_OLIVINE_LIGHTHOUSE_1F, MAP_OLIVINE_LIGHTHOUSE_1F
	warp_def $3, $5, 2, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $d, $10, 4, GROUP_OLIVINE_LIGHTHOUSE_1F, MAP_OLIVINE_LIGHTHOUSE_1F
	warp_def $d, $11, 5, GROUP_OLIVINE_LIGHTHOUSE_1F, MAP_OLIVINE_LIGHTHOUSE_1F
	warp_def $b, $10, 4, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $b, $11, 5, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_SAILOR, 7, 13, $9, $0, 255, 255, $92, 3, TrainerSailorHuey1, $ffff
	person_event SPRITE_GENTLEMAN, 12, 21, $8, $0, 255, 255, $92, 3, TrainerGentlemanAlfred, $ffff
