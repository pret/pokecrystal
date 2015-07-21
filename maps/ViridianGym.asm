ViridianGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

BlueScript_0x9aa26:
	faceplayer
	loadfont
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext UnknownText_0x9aa7b
	closetext
	loadmovesprites
	winlosstext UnknownText_0x9abae, $0000
	loadtrainer BLUE, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_BLUE
	loadfont
	writetext UnknownText_0x9ac0f
	playsound SFX_GET_BADGE
	waitbutton
	setflag ENGINE_EARTHBADGE
	writetext UnknownText_0x9ac27
	closetext
	loadmovesprites
	end

.FightDone
	writetext UnknownText_0x9acab
	closetext
	loadmovesprites
	end

ViridianGymGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuyWinScript
	writetext ViridianGymGuyText
	closetext
	loadmovesprites
	end

.ViridianGymGuyWinScript
	writetext ViridianGymGuyWinText
	closetext
	loadmovesprites
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext BLUE, 1, $1
	jumpstd gymstatue2

UnknownText_0x9aa7b:
	text "BLUE: Yo! Finally"
	line "got here, huh?"

	para "I wasn't in the"
	line "mood at CINNABAR,"

	para "but now I'm ready"
	line "to battle you."

	para "…"

	para "You're telling me"
	line "you conquered all"
	cont "the GYMS in JOHTO?"

	para "Heh! JOHTO's GYMS"
	line "must be pretty"
	cont "pathetic then."

	para "Hey, don't worry"
	line "about it."

	para "I'll know if you"
	line "are good or not by"

	para "battling you right"
	line "now."

	para "Ready, JOHTO"
	line "CHAMP?"
	done

UnknownText_0x9abae:
	text "BLUE: What?"

	para "How the heck did I"
	line "lose to you?"

	para "…"

	para "Tch, all right…"
	line "Here, take this--"
	cont "it's EARTHBADGE."
	done

UnknownText_0x9ac0f:
	text "<PLAYER> received"
	line "EARTHBADGE."
	done

UnknownText_0x9ac27:
	text "BLUE: …"

	para "All right, I was"
	line "wrong. You're the"

	para "real deal. You are"
	line "a good trainer."

	para "But I'm going to"
	line "beat you someday."

	para "Don't you forget"
	line "it!"
	done

UnknownText_0x9acab:
	text "BLUE: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"
	done

ViridianGymGuyText:
	text "Yo, CHAMP in"
	line "making!"

	para "How's it going?"
	line "Looks like you're"
	cont "on a roll."

	para "The GYM LEADER is"
	line "a guy who battled"

	para "the CHAMPION three"
	line "years ago."

	para "He's no pushover."

	para "Give it everything"
	line "you've got!"
	done

ViridianGymGuyWinText:
	text "Man, you are truly"
	line "tough…"

	para "That was a heck of"
	line "an inspirational"

	para "battle. It brought"
	line "tears to my eyes."
	done

ViridianGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $11, $4, 1, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $11, $5, 1, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 13, 3, SIGNPOST_READ, ViridianGymStatue
	signpost 13, 6, SIGNPOST_READ, ViridianGymStatue

.PersonEvents:
	db 2
	person_event SPRITE_BLUE, 7, 9, OW_UP | $2, $0, -1, -1, $0, 0, BlueScript_0x9aa26, EVENT_VIRIDIAN_GYM_BLUE
	person_event SPRITE_GYM_GUY, 17, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, ViridianGymGuyScript, EVENT_VIRIDIAN_GYM_BLUE
