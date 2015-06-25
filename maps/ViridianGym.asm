ViridianGym_MapScriptHeader: ; 0x9aa24
	; trigger count
	db 0

	; callback count
	db 0
; 0x9aa26

BlueScript_0x9aa26: ; 0x9aa26
	faceplayer
	loadfont
	checkflag $002a
	iftrue UnknownScript_0x9aa51
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
	setflag $002a
	writetext UnknownText_0x9ac27
	closetext
	loadmovesprites
	end
; 0x9aa51

UnknownScript_0x9aa51: ; 0x9aa51
	writetext UnknownText_0x9acab
	closetext
	loadmovesprites
	end
; 0x9aa57

ViridianGymGuyScript: ; 0x9aa57
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
; 0x9aa6b

MapViridianGymSignpost1Script: ; 0x9aa6b
	checkflag $002a
	iftrue UnknownScript_0x9aa74
	jumpstd gymstatue1
; 0x9aa74

UnknownScript_0x9aa74: ; 0x9aa74
	trainertotext BLUE, 1, $1
	jumpstd gymstatue2
; 0x9aa7b

UnknownText_0x9aa7b: ; 0x9aa7b
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
; 0x9abae

UnknownText_0x9abae: ; 0x9abae
	text "BLUE: What?"

	para "How the heck did I"
	line "lose to you?"

	para "…"

	para "Tch, all right…"
	line "Here, take this--"
	cont "it's EARTHBADGE."
	done
; 0x9ac0f

UnknownText_0x9ac0f: ; 0x9ac0f
	text $52, " received"
	line "EARTHBADGE."
	done
; 0x9ac27

UnknownText_0x9ac27: ; 0x9ac27
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
; 0x9acab

UnknownText_0x9acab: ; 0x9acab
	text "BLUE: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"
	done
; 0x9acee

ViridianGymGuyText: ; 0x9acee
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
; 0x9ada0

ViridianGymGuyWinText: ; 0x9ada0
	text "Man, you are truly"
	line "tough…"

	para "That was a heck of"
	line "an inspirational"

	para "battle. It brought"
	line "tears to my eyes."
	done
; 0x9ae04

ViridianGym_MapEventHeader: ; 0x9ae04
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $11, $4, 1, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $11, $5, 1, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 3, $0, MapViridianGymSignpost1Script
	signpost 13, 6, $0, MapViridianGymSignpost1Script

	; people-events
	db 2
	person_event SPRITE_BLUE, 7, 9, $6, $0, 255, 255, $0, 0, BlueScript_0x9aa26, $0776
	person_event SPRITE_GYM_GUY, 17, 11, $6, $0, 255, 255, $90, 0, ViridianGymGuyScript, $0776
; 0x9ae38
