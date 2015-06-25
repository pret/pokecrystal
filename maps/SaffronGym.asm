SaffronGym_MapScriptHeader: ; 0x189c2c
	; trigger count
	db 0

	; callback count
	db 0
; 0x189c2e

SabrinaScript_0x189c2e: ; 0x189c2e
	faceplayer
	loadfont
	checkflag $0028
	iftrue UnknownScript_0x189c65
	writetext UnknownText_0x189cdf
	closetext
	loadmovesprites
	winlosstext UnknownText_0x189df4, $0000
	loadtrainer SABRINA, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	loadfont
	writetext UnknownText_0x189e95
	playsound SFX_GET_BADGE
	waitbutton
	setflag $0028
	writetext UnknownText_0x189ead
	closetext
	loadmovesprites
	end
; 0x189c65

UnknownScript_0x189c65: ; 0x189c65
	writetext UnknownText_0x189f6c
	closetext
	loadmovesprites
	end
; 0x189c6b

TrainerMediumRebecca: ; 0x189c6b
	; bit/flag number
	dw $590

	; trainer group && trainer id
	db MEDIUM, REBECCA

	; text when seen
	dw MediumRebeccaSeenText

	; text when trainer beaten
	dw MediumRebeccaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw MediumRebeccaScript
; 0x189c77

MediumRebeccaScript: ; 0x189c77
	talkaftercancel
	loadfont
	writetext UnknownText_0x18a034
	closetext
	loadmovesprites
	end
; 0x189c7f

TrainerPsychicFranklin: ; 0x189c7f
	; bit/flag number
	dw $43b

	; trainer group && trainer id
	db PSYCHIC_T, FRANKLIN

	; text when seen
	dw PsychicFranklinSeenText

	; text when trainer beaten
	dw PsychicFranklinBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicFranklinScript
; 0x189c8b

PsychicFranklinScript: ; 0x189c8b
	talkaftercancel
	loadfont
	writetext UnknownText_0x18a0a6
	closetext
	loadmovesprites
	end
; 0x189c93

TrainerMediumDoris: ; 0x189c93
	; bit/flag number
	dw $591

	; trainer group && trainer id
	db MEDIUM, DORIS

	; text when seen
	dw MediumDorisSeenText

	; text when trainer beaten
	dw MediumDorisBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw MediumDorisScript
; 0x189c9f

MediumDorisScript: ; 0x189c9f
	talkaftercancel
	loadfont
	writetext UnknownText_0x18a136
	closetext
	loadmovesprites
	end
; 0x189ca7

TrainerPsychicJared: ; 0x189ca7
	; bit/flag number
	dw $444

	; trainer group && trainer id
	db PSYCHIC_T, JARED

	; text when seen
	dw PsychicJaredSeenText

	; text when trainer beaten
	dw PsychicJaredBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicJaredScript
; 0x189cb3

PsychicJaredScript: ; 0x189cb3
	talkaftercancel
	loadfont
	writetext UnknownText_0x18a1b3
	closetext
	loadmovesprites
	end
; 0x189cbb

SaffronGymGuyScript: ; 0x189cbb
	faceplayer
	loadfont
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuyWinScript
	writetext SaffronGymGuyText
	closetext
	loadmovesprites
	end

.SaffronGymGuyWinScript
	writetext SaffronGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x189ccf

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext SABRINA, 1, $1
	jumpstd gymstatue2

UnknownText_0x189cdf: ; 0x189cdf
	text "SABRINA: I knew"
	line "you were coming…"

	para "Three years ago I"
	line "had a vision of"
	cont "your arrival."

	para "You're after my"
	line "BADGE."

	para "I don't enjoy bat-"
	line "tling, but it's my"

	para "duty as a LEADER"
	line "to confer BADGES"

	para "on anyone who has"
	line "proven him- or"
	cont "herself worthy."

	para "Since you wish it,"
	line "I will show you my"
	cont "psychic powers!"
	done
; 0x189df4

UnknownText_0x189df4: ; 0x189df4
	text "SABRINA: Your"
	line "power…"

	para "It far exceeds"
	line "what I foresaw…"

	para "Maybe it isn't"
	line "possible to fully"

	para "predict what the"
	line "future holds…"

	para "OK, you win. You"
	line "earned yourself"
	cont "MARSHBADGE."
	done
; 0x189e95

UnknownText_0x189e95: ; 0x189e95
	text $52, " received"
	line "MARSHBADGE."
	done
; 0x189ead

UnknownText_0x189ead: ; 0x189ead
	text "SABRINA: MARSH-"
	line "BADGE draws out"

	para "your subliminal"
	line "powers…"

	para "Although I failed"
	line "to accurately pre-"
	cont "dict your power,"
	cont "this much I know"
	cont "to be true."

	para "You will become a"
	line "celebrated and"
	cont "beloved CHAMPION!"
	done
; 0x189f6c

UnknownText_0x189f6c: ; 0x189f6c
	text "SABRINA: Your love"
	line "for your #MON"

	para "overwhelmed my"
	line "psychic power…"

	para "The power of love,"
	line "I think, is also a"

	para "kind of psychic"
	line "power…"
	done
; 0x189fe9

MediumRebeccaSeenText: ; 0x189fe9
	text "The power of all"
	line "those you defeated"
	cont "comes to me!"
	done
; 0x18a01b

MediumRebeccaBeatenText: ; 0x18a01b
	text "Strong…"
	line "Far too strong…"
	done
; 0x18a034

UnknownText_0x18a034: ; 0x18a034
	text "What is the source"
	line "of your power?"
	done
; 0x18a057

PsychicFranklinSeenText: ; 0x18a057
	text "Psychic power is"
	line "the power of your"
	cont "soul."
	done
; 0x18a081

PsychicFranklinBeatenText: ; 0x18a081
	text "Your soul has more"
	line "power than mine!"
	done
; 0x18a0a6

UnknownText_0x18a0a6: ; 0x18a0a6
	text "You made your soul"
	line "stronger, not just"
	cont "your abilities."
	done
; 0x18a0dd

MediumDorisSeenText: ; 0x18a0dd
	text "Fufufufu…"
	line "I see it clearly."

	para "I can see into"
	line "your soul!"
	done
; 0x18a114

MediumDorisBeatenText: ; 0x18a114
	text "Though I read you,"
	line "I still lost…"
	done
; 0x18a136

UnknownText_0x18a136: ; 0x18a136
	text "Darn! I forgot"
	line "that I predicted I"
	cont "would lose to you."
	done
; 0x18a16c

PsychicJaredSeenText: ; 0x18a16c
	text "The FIGHTING DOJO"
	line "next door was once"
	cont "this city's GYM."
	done
; 0x18a1a2

PsychicJaredBeatenText: ; 0x18a1a2
	text "I was no match…"
	done
; 0x18a1b3

UnknownText_0x18a1b3: ; 0x18a1b3
	text "KARATE KING, the"
	line "master of the"

	para "FIGHTING DOJO, was"
	line "just destroyed by"
	cont "SABRINA."
	done
; 0x18a201

SaffronGymGuyText: ; 0x18a201
	text "Yo, CHAMP in"
	line "making!"

	para "A trainer as"
	line "skilled as you"

	para "doesn't need to be"
	line "told how to deal"

	para "with psychic-type"
	line "#MON, right?"

	para "I expect great"
	line "things from you!"

	para "Good luck!"
	done
; 0x18a2a0

SaffronGymGuyWinText: ; 0x18a2a0
	text "That was another"
	line "fantastic battle!"
	done
; 0x18a2c4

SaffronGym_MapEventHeader: ; 0x18a2c4
	; filler
	db 0, 0

	; warps
	db 32
	warp_def $11, $8, 2, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $11, $9, 2, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $f, $b, 18, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $f, $13, 19, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $b, $13, 20, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $b, $1, 21, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $5, 22, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $b, 23, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $f, $1, 24, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $13, 25, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $11, $f, 26, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $11, $5, 27, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $9, $5, 28, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $9, 29, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $9, $f, 30, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $f, 31, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $1, 32, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $11, $13, 3, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $9, $13, 4, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $9, $1, 5, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $5, 6, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $b, 7, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $11, $1, 8, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $13, 9, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $f, $f, 10, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $f, $5, 11, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $b, $5, 12, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $5, $9, 13, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $b, $f, 14, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $f, 15, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $3, $1, 16, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM
	warp_def $9, $b, 17, GROUP_SAFFRON_GYM, MAP_SAFFRON_GYM

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 15, 8, $0, SaffronGymStatue

	; people-events
	db 6
	person_event SPRITE_SABRINA, 12, 13, $6, $0, 255, 255, $80, 0, SabrinaScript_0x189c2e, $ffff
	person_event SPRITE_GRANNY, 20, 21, $a, $0, 255, 255, $b2, 3, TrainerMediumRebecca, $ffff
	person_event SPRITE_YOUNGSTER, 20, 7, $a, $0, 255, 255, $92, 3, TrainerPsychicFranklin, $ffff
	person_event SPRITE_GRANNY, 8, 7, $a, $0, 255, 255, $b2, 2, TrainerMediumDoris, $ffff
	person_event SPRITE_YOUNGSTER, 8, 21, $a, $0, 255, 255, $92, 2, TrainerPsychicJared, $ffff
	person_event SPRITE_GYM_GUY, 18, 13, $6, $0, 255, 255, $90, 0, SaffronGymGuyScript, $ffff
; 0x18a3bd
