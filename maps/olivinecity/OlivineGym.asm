const_value set 2
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUY

OlivineGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

JasmineScript_0x9c12f:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext UnknownText_0x9c1b9
	waitbutton
	closetext
	winlosstext UnknownText_0x9c2bb, 0
	loadtrainer JASMINE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext UnknownText_0x9c33a
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	checkcode VAR_BADGES
	scall OlivineGymTriggerRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue UnknownScript_0x9c172
	writetext UnknownText_0x9c354
	buttonsound
	verbosegiveitem TM_IRON_TAIL
	iffalse UnknownScript_0x9c176
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext UnknownText_0x9c3a5
	waitbutton
	closetext
	end

UnknownScript_0x9c172:
	writetext UnknownText_0x9c3d1
	waitbutton
UnknownScript_0x9c176:
	closetext
	end

OlivineGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

OlivineGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuyWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuyPreScript
	opentext
	writetext OlivineGymGuyText
	waitbutton
	closetext
	end

.OlivineGymGuyWinScript:
	opentext
	writetext OlivineGymGuyWinText
	waitbutton
	closetext
	end

.OlivineGymGuyPreScript:
	opentext
	writetext OlivineGymGuyPreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext JASMINE, 1, $1
	jumpstd gymstatue2

UnknownText_0x9c1b9:
	text "…Thank you for"
	line "your help at the"
	cont "LIGHTHOUSE…"

	para "But this is dif-"
	line "ferent. Please"

	para "allow me to intro-"
	line "duce myself."

	para "I am JASMINE, a"
	line "GYM LEADER. I use"
	cont "the steel-type."

	para "…Do you know about"
	line "the steel-type?"

	para "It's a type that"
	line "was only recently"
	cont "discovered."

	para "…Um… May I begin?"
	done

UnknownText_0x9c2bb:
	text "…You are a better"
	line "trainer than me,"

	para "in both skill and"
	line "kindness."

	para "In accordance with"
	line "LEAGUE rules, I"

	para "confer upon you"
	line "this BADGE."
	done

UnknownText_0x9c33a:
	text "<PLAYER> received"
	line "MINERALBADGE."
	done

UnknownText_0x9c354:
	text "MINERALBADGE"
	line "raises #MON's"
	cont "DEFENSE."

	para "…Um… Please take"
	line "this too…"
	done

UnknownText_0x9c393:
	text "<PLAYER> received"
	line "TM09."
	done

UnknownText_0x9c3a5:
	text "…You could use"
	line "that TM to teach"
	cont "IRON TAIL."
	done

UnknownText_0x9c3d1:
	text "Um… I don't know"
	line "how to say this,"
	cont "but good luck…"
	done

OlivineGymGuyText:
	text "JASMINE uses the"
	line "newly discovered"
	cont "steel-type."

	para "I don't know very"
	line "much about it."
	done

OlivineGymGuyWinText:
	text "That was awesome."

	para "The steel-type,"
	line "huh?"

	para "That was a close"
	line "encounter of an"
	cont "unknown kind!"
	done

OlivineGymGuyPreText:
	text "JASMINE, the GYM"
	line "LEADER, is at the"
	cont "LIGHTHOUSE."

	para "She's been tending"
	line "to a sick #MON."

	para "A strong trainer"
	line "has to be compas-"
	cont "sionate."
	done

OlivineGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $f, $4, 2, OLIVINE_CITY
	warp_def $f, $5, 2, OLIVINE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 13, 3, SIGNPOST_READ, OlivineGymStatue
	signpost 13, 6, SIGNPOST_READ, OlivineGymStatue

.PersonEvents:
	db 2
	person_event SPRITE_JASMINE, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, JasmineScript_0x9c12f, EVENT_OLIVINE_GYM_JASMINE
	person_event SPRITE_GYM_GUY, 13, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OlivineGymGuyScript, -1
