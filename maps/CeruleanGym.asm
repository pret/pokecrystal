CeruleanGym_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x1883d9, $0000
	dw UnknownScript_0x1883da, $0000

.MapCallbacks:
	db 0

UnknownScript_0x1883d9:
	end

UnknownScript_0x1883da:
	priorityjump UnknownScript_0x1883de
	end

UnknownScript_0x1883de:
	applymovement $2, MovementData_0x1884e3
	playsound SFX_TACKLE
	applymovement $2, MovementData_0x1884eb
	playmusic MUSIC_ROCKET_ENCOUNTER
	loadfont
	writetext UnknownText_0x1884fb
	closetext
	loadmovesprites
	showemote EMOTE_SHOCK, $2, 15
	applymovement $2, MovementData_0x1884f7
	loadfont
	writetext UnknownText_0x188574
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x1884f5
	loadfont
	writetext UnknownText_0x1885a5
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x1884e8
	playsound SFX_EXIT_BUILDING
	disappear $2
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	clearevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	dotrigger $0
	domaptrigger GROUP_ROUTE_25, MAP_ROUTE_25, $1
	domaptrigger GROUP_POWER_PLANT, MAP_POWER_PLANT, $0
	waitbutton
	special RestartMapMusic
	pause 15
	spriteface $0, DOWN
	pause 15
	end

MistyScript_0x188432:
	faceplayer
	loadfont
	checkflag ENGINE_CASCADEBADGE
	iftrue .FightDone
	writetext UnknownText_0x188674
	closetext
	loadmovesprites
	winlosstext UnknownText_0x18870c, $0000
	loadtrainer MISTY, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SWIMMERM_PARKER
	loadfont
	writetext UnknownText_0x188768
	playsound SFX_GET_BADGE
	waitbutton
	setflag ENGINE_CASCADEBADGE
.FightDone
	writetext UnknownText_0x188782
	closetext
	loadmovesprites
	end

TrainerSwimmerfDiana:
	trainer EVENT_BEAT_SWIMMERF_DIANA, SWIMMERF, DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText, $0000, SwimmerfDianaScript

SwimmerfDianaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x188856
	closetext
	loadmovesprites
	end

TrainerSwimmerfBriana:
	trainer EVENT_BEAT_SWIMMERF_BRIANA, SWIMMERF, BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText, $0000, SwimmerfBrianaScript

SwimmerfBrianaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1888c0
	closetext
	loadmovesprites
	end

TrainerSwimmermParker:
	trainer EVENT_BEAT_SWIMMERM_PARKER, SWIMMERM, PARKER, SwimmermParkerSeenText, SwimmermParkerBeatenText, $0000, SwimmermParkerScript

SwimmermParkerScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x188943
	closetext
	loadmovesprites
	end

CeruleanGymGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuyWinScript
	writetext CeruleanGymGuyText
	closetext
	loadmovesprites
	end

.CeruleanGymGuyWinScript
	writetext CeruleanGymGuyWinText
	closetext
	loadmovesprites
	end

MapCeruleanGymSignpostItem0:
	dwb EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM, MACHINE_PART
	

CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	loadfont
	writetext CeruleanGymNote1
	closetext
	loadmovesprites
	end

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	loadfont
	writetext CeruleanGymNote2
	closetext
	loadmovesprites
	end

CeruleanGymStatue:
	checkflag ENGINE_CASCADEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext MISTY, 1, $1
	jumpstd gymstatue2

MovementData_0x1884e3:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_0x1884e8:
	big_step_right
	big_step_down
	step_end

MovementData_0x1884eb:
	fix_facing
	db $39 ; movement
	jump_step_up
	db $38 ; movement
	remove_fixed_facing
	accelerate_last
	accelerate_last
	step_down
	step_down
	step_end

MovementData_0x1884f5:
	big_step_down
	step_end

MovementData_0x1884f7:
	fix_facing
	slow_step_up
	remove_fixed_facing
	step_end

UnknownText_0x1884fb:
	text "Oops! I so sorry!"
	line "You not hurt,"
	cont "okay?"

	para "I very busy."
	line "No time for talk-"
	cont "ing with you. Not"
	cont "good for me if"
	cont "seen by somebody."
	done

UnknownText_0x188574:
	text "Oh no! You seen"
	line "me already! I make"
	cont "big mistake!"
	done

UnknownText_0x1885a5:
	text "Hey, you! Forget"
	line "you see me, okay?"

	para "You see, hear,"
	line "know nothing,"

	para "okay?"
	line "Bye, kid! Nothing!"

	para "Bye-bye a go-go!"
	done

CeruleanGymNote1:
	text "Sorry, I'll be out"
	line "for a while."
	cont "MISTY, GYM LEADER"
	done

CeruleanGymNote2:
	text "Since MISTY's out,"
	line "we'll be away too."
	cont "GYM TRAINERS"
	done

UnknownText_0x188674:
	text "MISTY: I was ex-"
	line "pecting you, you"
	cont "pest!"

	para "You may have a"
	line "lot of JOHTO GYM"

	para "BADGES, but you'd"
	line "better not take me"
	cont "too lightly."

	para "My water-type"
	line "#MON are tough!"
	done

UnknownText_0x18870c:
	text "MISTY: You really"
	line "are good…"

	para "I'll admit that"
	line "you are skilled…"

	para "Here you go. It's"
	line "CASCADEBADGE."
	done

UnknownText_0x188768:
	text "<PLAYER> received"
	line "CASCADEBADGE."
	done

UnknownText_0x188782:
	text "MISTY: Are there"
	line "many strong train-"
	cont "ers in JOHTO? Like"
	cont "you, I mean."

	para "I'm going to"
	line "travel one day, so"

	para "I can battle some"
	line "skilled trainers."
	done

SwimmerfDianaSeenText:
	text "Sorry about being"
	line "away. Let's get on"
	cont "with it!"
	done

SwimmerfDianaBeatenText:
	text "I give up! You're"
	line "the winner!"
	done

UnknownText_0x188856:
	text "I'll be swimming"
	line "quietly."
	done

SwimmerfBrianaSeenText:
	text "Don't let my ele-"
	line "gant swimming un-"
	cont "nerve you."
	done

SwimmerfBrianaBeatenText:
	text "Ooh, you calmly"
	line "disposed of me…"
	done

UnknownText_0x1888c0:
	text "Don't be too smug"
	line "about beating me."

	para "MISTY will destroy"
	line "you if you get"
	cont "complacent."
	done

SwimmermParkerSeenText:
	text "Glub…"

	para "I'm first! Come"
	line "and get me!"
	done

SwimmermParkerBeatenText:
	text "This can't be…"
	done

UnknownText_0x188943:
	text "MISTY has gotten"
	line "much better in the"
	cont "past few years."

	para "Don't let your"
	line "guard down, or"
	cont "you'll be crushed!"
	done

CeruleanGymGuyText:
	text "Yo! CHAMP in"
	line "making!"

	para "Since MISTY was"
	line "away, I went out"

	para "for some fun too."
	line "He-he-he."
	done

CeruleanGymGuyWinText:
	text "Hoo, you showed me"
	line "how tough you are."

	para "As always, that"
	line "was one heck of a"
	cont "great battle!"
	done

CeruleanGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $f, $4, 5, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $f, $5, 5, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 8, 3, SIGNPOST_ITEM, MapCeruleanGymSignpostItem0
	signpost 13, 2, SIGNPOST_READ, CeruleanGymStatue1
	signpost 13, 6, SIGNPOST_READ, CeruleanGymStatue2

.PersonEvents:
	db 6
	person_event SPRITE_ROCKET, 14, 8, OW_UP | $2, $0, -1, -1, $0, 0, ObjectEvent, EVENT_CERULEAN_GYM_ROCKET
	person_event SPRITE_MISTY, 7, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, MistyScript_0x188432, EVENT_TRAINERS_IN_CERULEAN_GYM
	person_event SPRITE_SWIMMER_GIRL, 10, 8, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	person_event SPRITE_SWIMMER_GIRL, 13, 5, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 1, TrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	person_event SPRITE_SWIMMER_GUY, 13, 12, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerSwimmermParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	person_event SPRITE_GYM_GUY, 17, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, CeruleanGymGuyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
