const_value set 2
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_GRANNY1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_GRANNY2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUY

SaffronGym_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

SabrinaScript_0x189c2e:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext UnknownText_0x189cdf
	waitbutton
	closetext
	winlosstext UnknownText_0x189df4, 0
	loadtrainer SABRINA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext UnknownText_0x189e95
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext UnknownText_0x189ead
	waitbutton
	closetext
	end

.FightDone:
	writetext UnknownText_0x189f6c
	waitbutton
	closetext
	end

TrainerMediumRebecca:
	trainer EVENT_BEAT_MEDIUM_REBECCA, MEDIUM, REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer EVENT_BEAT_PSYCHIC_FRANKLIN, PSYCHIC_T, FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PsychicFranklinAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumDoris:
	trainer EVENT_BEAT_MEDIUM_DORIS, MEDIUM, DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer EVENT_BEAT_PSYCHIC_JARED, PSYCHIC_T, JARED, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuyWinScript
	writetext SaffronGymGuyText
	waitbutton
	closetext
	end

.SaffronGymGuyWinScript:
	writetext SaffronGymGuyWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext SABRINA, 1, $1
	jumpstd gymstatue2

UnknownText_0x189cdf:
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

UnknownText_0x189df4:
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

UnknownText_0x189e95:
	text "<PLAYER> received"
	line "MARSHBADGE."
	done

UnknownText_0x189ead:
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

UnknownText_0x189f6c:
	text "SABRINA: Your love"
	line "for your #MON"

	para "overwhelmed my"
	line "psychic power…"

	para "The power of love,"
	line "I think, is also a"

	para "kind of psychic"
	line "power…"
	done

MediumRebeccaSeenText:
	text "The power of all"
	line "those you defeated"
	cont "comes to me!"
	done

MediumRebeccaBeatenText:
	text "Strong…"
	line "Far too strong…"
	done

MediumRebeccaAfterBattleText:
	text "What is the source"
	line "of your power?"
	done

PsychicFranklinSeenText:
	text "Psychic power is"
	line "the power of your"
	cont "soul."
	done

PsychicFranklinBeatenText:
	text "Your soul has more"
	line "power than mine!"
	done

PsychicFranklinAfterBattleText:
	text "You made your soul"
	line "stronger, not just"
	cont "your abilities."
	done

MediumDorisSeenText:
	text "Fufufufu…"
	line "I see it clearly."

	para "I can see into"
	line "your soul!"
	done

MediumDorisBeatenText:
	text "Though I read you,"
	line "I still lost…"
	done

MediumDorisAfterBattleText:
	text "Darn! I forgot"
	line "that I predicted I"
	cont "would lose to you."
	done

PsychicJaredSeenText:
	text "The FIGHTING DOJO"
	line "next door was once"
	cont "this city's GYM."
	done

PsychicJaredBeatenText:
	text "I was no match…"
	done

PsychicJaredAfterBattleText:
	text "KARATE KING, the"
	line "master of the"

	para "FIGHTING DOJO, was"
	line "just destroyed by"
	cont "SABRINA."
	done

SaffronGymGuyText:
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

SaffronGymGuyWinText:
	text "That was another"
	line "fantastic battle!"
	done

SaffronGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 32
	warp_def 8, 17, 2, SAFFRON_CITY
	warp_def 9, 17, 2, SAFFRON_CITY
	warp_def 11, 15, 18, SAFFRON_GYM
	warp_def 19, 15, 19, SAFFRON_GYM
	warp_def 19, 11, 20, SAFFRON_GYM
	warp_def 1, 11, 21, SAFFRON_GYM
	warp_def 5, 3, 22, SAFFRON_GYM
	warp_def 11, 5, 23, SAFFRON_GYM
	warp_def 1, 15, 24, SAFFRON_GYM
	warp_def 19, 3, 25, SAFFRON_GYM
	warp_def 15, 17, 26, SAFFRON_GYM
	warp_def 5, 17, 27, SAFFRON_GYM
	warp_def 5, 9, 28, SAFFRON_GYM
	warp_def 9, 3, 29, SAFFRON_GYM
	warp_def 15, 9, 30, SAFFRON_GYM
	warp_def 15, 5, 31, SAFFRON_GYM
	warp_def 1, 5, 32, SAFFRON_GYM
	warp_def 19, 17, 3, SAFFRON_GYM
	warp_def 19, 9, 4, SAFFRON_GYM
	warp_def 1, 9, 5, SAFFRON_GYM
	warp_def 5, 5, 6, SAFFRON_GYM
	warp_def 11, 3, 7, SAFFRON_GYM
	warp_def 1, 17, 8, SAFFRON_GYM
	warp_def 19, 5, 9, SAFFRON_GYM
	warp_def 15, 15, 10, SAFFRON_GYM
	warp_def 5, 15, 11, SAFFRON_GYM
	warp_def 5, 11, 12, SAFFRON_GYM
	warp_def 9, 5, 13, SAFFRON_GYM
	warp_def 15, 11, 14, SAFFRON_GYM
	warp_def 15, 3, 15, SAFFRON_GYM
	warp_def 1, 3, 16, SAFFRON_GYM
	warp_def 11, 9, 17, SAFFRON_GYM

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 8, 15, BGEVENT_READ, SaffronGymStatue

.ObjectEvents:
	db 6
	object_event 9, 8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SabrinaScript_0x189c2e, -1
	object_event 17, 16, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event 3, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFranklin, -1
	object_event 3, 4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event 17, 4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJared, -1
	object_event 9, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuyScript, -1
