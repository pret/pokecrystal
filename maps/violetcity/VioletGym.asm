const_value set 2
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUY

VioletGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FalknerScript_0x683c2:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext UnknownText_0x68473
	waitbutton
	closetext
	winlosstext UnknownText_0x6854a, 0
	loadtrainer FALKNER, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext UnknownText_0x685af
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	checkcode VAR_BADGES
	scall VioletGymTriggerRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	domaptrigger ELMS_LAB, $2
	specialphonecall SPECIALCALL_ASSISTANT
	writetext UnknownText_0x685c8
	buttonsound
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext UnknownText_0x68648
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext UnknownText_0x68735
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBird_keeperRod:
	trainer EVENT_BEAT_BIRD_KEEPER_ROD, BIRD_KEEPER, ROD, Bird_keeperRodSeenText, Bird_keeperRodBeatenText, 0, Bird_keeperRodScript

Bird_keeperRodScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x68837
	waitbutton
	closetext
	end

TrainerBird_keeperAbe:
	trainer EVENT_BEAT_BIRD_KEEPER_ABE, BIRD_KEEPER, ABE, Bird_keeperAbeSeenText, Bird_keeperAbeBeatenText, 0, Bird_keeperAbeScript

Bird_keeperAbeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x688c7
	waitbutton
	closetext
	end

VioletGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	waitbutton
	closetext
	end

.VioletGymGuyWinScript:
	writetext VioletGymGuyWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext FALKNER, 1, $1
	jumpstd gymstatue2

UnknownText_0x68473:
	text "I'm FALKNER, the"
	line "VIOLET #MON GYM"
	cont "leader!"

	para "People say you can"
	line "clip flying-type"

	para "#MON's wings"
	line "with a jolt of"
	cont "electricity…"

	para "I won't allow such"
	line "insults to bird"
	cont "#MON!"

	para "I'll show you the"
	line "real power of the"

	para "magnificent bird"
	line "#MON!"
	done

UnknownText_0x6854a:
	text "…Darn! My dad's"
	line "cherished bird"
	cont "#MON…"

	para "All right."
	line "Take this."

	para "It's the official"
	line "#MON LEAGUE"
	cont "ZEPHYRBADGE."
	done

UnknownText_0x685af:
	text "<PLAYER> received"
	line "ZEPHYRBADGE."
	done

UnknownText_0x685c8:
	text "ZEPHYRBADGE"
	line "raises the attack"
	cont "power of #MON."

	para "It also enables"
	line "#MON to use"

	para "FLASH, if they"
	line "have it, anytime."

	para "Here--take this"
	line "too."
	done

UnknownText_0x68648:
	text "By using a TM, a"
	line "#MON will"

	para "instantly learn a"
	line "new move."

	para "Think before you"
	line "act--a TM can be"
	cont "used only once."

	para "TM31 contains"
	line "MUD-SLAP."

	para "It reduces the"
	line "enemy's accuracy"

	para "while it causes"
	line "damage."

	para "In other words, it"
	line "is both defensive"
	cont "and offensive."
	done

UnknownText_0x68735:
	text "There are #MON"
	line "GYMS in cities and"
	cont "towns ahead."

	para "You should test"
	line "your skills at"
	cont "these GYMS."

	para "I'm going to train"
	line "harder to become"

	para "the greatest bird"
	line "master!"
	done

Bird_keeperRodSeenText:
	text "The keyword is"
	line "guts!"

	para "Those here are"
	line "training night and"

	para "day to become bird"
	line "#MON masters."

	para "Come on!"
	done

Bird_keeperRodBeatenText:
	text "Gaaah!"
	done

UnknownText_0x68837:
	text "FALKNER's skills"
	line "are for real!"

	para "Don't get cocky"
	line "just because you"
	cont "beat me!"
	done

Bird_keeperAbeSeenText:
	text "Let me see if you"
	line "are good enough to"
	cont "face FALKNER!"
	done

Bird_keeperAbeBeatenText:
	text "This can't be"
	line "true!"
	done

UnknownText_0x688c7:
	text "This is pathetic,"
	line "losing to some"
	cont "rookie trainer…"
	done

VioletGymGuyText:
	text "Hey! I'm no train-"
	line "er but I can give"
	cont "some advice!"

	para "Believe me!"
	line "If you believe, a"

	para "championship dream"
	line "can come true."

	para "You believe?"
	line "Then listen."

	para "The grass-type is"
	line "weak against the"

	para "flying-type. Keep"
	line "this in mind."
	done

VioletGymGuyWinText:
	text "Nice battle! Keep"
	line "it up, and you'll"

	para "be the CHAMP in no"
	line "time at all!"
	done

VioletGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $f, $4, 2, VIOLET_CITY
	warp_def $f, $5, 2, VIOLET_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 13, 3, SIGNPOST_READ, VioletGymStatue
	signpost 13, 6, SIGNPOST_READ, VioletGymStatue

.PersonEvents:
	db 4
	person_event SPRITE_FALKNER, 1, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FalknerScript_0x683c2, -1
	person_event SPRITE_YOUNGSTER, 6, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBird_keeperRod, -1
	person_event SPRITE_YOUNGSTER, 10, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBird_keeperAbe, -1
	person_event SPRITE_GYM_GUY, 13, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, VioletGymGuyScript, -1
