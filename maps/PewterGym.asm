PewterGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

BrockScript_0x1a2864:
	faceplayer
	loadfont
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext UnknownText_0x1a28d0
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1a29bb, $0000
	loadtrainer BROCK, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	loadfont
	writetext UnknownText_0x1a2a3d
	playsound SFX_GET_BADGE
	waitbutton
	setflag ENGINE_BOULDERBADGE
	writetext UnknownText_0x1a2a57
	closetext
	loadmovesprites
	end

.FightDone
	writetext UnknownText_0x1a2ada
	closetext
	loadmovesprites
	end

TrainerCamperJerry:
	trainer EVENT_BEAT_CAMPER_JERRY, CAMPER, JERRY, CamperJerrySeenText, CamperJerryBeatenText, $0000, CamperJerryScript

CamperJerryScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a2c0f
	closetext
	loadmovesprites
	end

PewterGymGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuyWinScript
	writetext PewterGymGuyText
	closetext
	loadmovesprites
	end

.PewterGymGuyWinScript
	writetext PewterGymGuyWinText
	closetext
	loadmovesprites
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext BROCK, 1, $1
	jumpstd gymstatue2

UnknownText_0x1a28d0:
	text "BROCK: Wow, it's"
	line "not often that we"

	para "get a challenger"
	line "from JOHTO."

	para "I'm BROCK, the"
	line "PEWTER GYM LEADER."

	para "I'm an expert on"
	line "rock-type #MON."

	para "My #MON are im-"
	line "pervious to most"

	para "physical attacks."
	line "You'll have a hard"

	para "time inflicting"
	line "any damage."

	para "Come on!"
	done

UnknownText_0x1a29bb:
	text "BROCK: Your #-"
	line "MON's powerful at-"
	cont "tacks overcame my"
	cont "rock-hard defense…"

	para "You're stronger"
	line "than I expected…"

	para "Go ahead--take"
	line "this BADGE."
	done

UnknownText_0x1a2a3d:
	text "<PLAYER> received"
	line "BOULDERBADGE."
	done

UnknownText_0x1a2a57:
	text "BROCK: <PLAY_G>,"
	line "thanks. I enjoyed"

	para "battling you, even"
	line "though I am a bit"
	cont "upset."

	para "That BOULDERBADGE"
	line "will make your"

	para "#MON even more"
	line "powerful."
	done

UnknownText_0x1a2ada:
	text "BROCK: The world"
	line "is huge. There are"

	para "still many strong"
	line "trainers like you."

	para "Just wait and see."
	line "I'm going to be-"
	cont "come a lot strong-"
	cont "er too."
	done

CamperJerrySeenText:
	text "The trainers of"
	line "this GYM use rock-"
	cont "type #MON."

	para "The rock-type has"
	line "high DEFENSE."

	para "Battles could end"
	line "up going a long"

	para "time. Are you"
	line "ready for this?"
	done

CamperJerryBeatenText:
	text "I have to win"
	line "these battles…"
	done

UnknownText_0x1a2c0f:
	text "Hey, you! Trainer"
	line "from JOHTO! BROCK"

	para "is tough. He'll"
	line "punish you if you"

	para "don't take him"
	line "seriously."
	done

PewterGymGuyText:
	text "Yo! CHAMP in"
	line "making! You're"

	para "really rocking."
	line "Are you battling"

	para "the GYM LEADERS of"
	line "KANTO?"

	para "They're strong and"
	line "dedicated people,"

	para "just like JOHTO's"
	line "GYM LEADERS."
	done

PewterGymGuyWinText:
	text "Yo! CHAMP in"
	line "making! That GYM"

	para "didn't give you"
	line "much trouble."

	para "The way you took"
	line "charge was really"

	para "inspiring. I mean"
	line "that seriously."
	done

PewterGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $d, $4, 2, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $d, $5, 2, GROUP_PEWTER_CITY, MAP_PEWTER_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 11, 2, SIGNPOST_READ, PewterGymStatue
	signpost 11, 7, SIGNPOST_READ, PewterGymStatue

.PersonEvents:
	db 3
	person_event SPRITE_BROCK, 5, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, BrockScript_0x1a2864, -1
	person_event SPRITE_YOUNGSTER, 9, 6, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerCamperJerry, -1
	person_event SPRITE_GYM_GUY, 15, 10, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 1, PewterGymGuyScript, -1
