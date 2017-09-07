const_value set 2
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BUENA
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2

CeladonGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ErikaScript_0x72a6a:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext UnknownText_0x72b28
	waitbutton
	closetext
	winlosstext UnknownText_0x72c3e, 0
	loadtrainer ERIKA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext UnknownText_0x72c96
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue UnknownScript_0x72aae
	writetext UnknownText_0x72cb0
	buttonsound
	verbosegiveitem TM_GIGA_DRAIN
	iffalse UnknownScript_0x72aae
	setevent EVENT_GOT_TM19_GIGA_DRAIN
UnknownScript_0x72aae:
	writetext UnknownText_0x72d8f
	waitbutton
	closetext
	end

TrainerLassMichelle:
	trainer EVENT_BEAT_LASS_MICHELLE, LASS, MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, LassMichelleScript

LassMichelleScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x72e30
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer EVENT_BEAT_PICNICKER_TANYA, PICNICKER, TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, PicnickerTanyaScript

PicnickerTanyaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x72e8e
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer EVENT_BEAT_BEAUTY_JULIA, BEAUTY, JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, BeautyJuliaScript

BeautyJuliaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x72f01
	waitbutton
	closetext
	end

TrainerTwinsJoandzoe1:
	trainer EVENT_BEAT_TWINS_JO_AND_ZOE, TWINS, JOANDZOE1, TwinsJoandzoe1SeenText, TwinsJoandzoe1BeatenText, 0, TwinsJoandzoe1Script

TwinsJoandzoe1Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x72f70
	waitbutton
	closetext
	end

TrainerTwinsJoandzoe2:
	trainer EVENT_BEAT_TWINS_JO_AND_ZOE, TWINS, JOANDZOE2, TwinsJoandzoe2SeenText, TwinsJoandzoe2BeatenText, 0, TwinsJoandzoe2Script

TwinsJoandzoe2Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x72fc0
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext ERIKA, 1, $1
	jumpstd gymstatue2

UnknownText_0x72b28:
	text "ERIKA: Hello…"
	line "Lovely weather,"

	para "isn't it?"
	line "It's so pleasant…"

	para "…I'm afraid I may"
	line "doze off…"

	para "My name is ERIKA."
	line "I am the LEADER of"
	cont "CELADON GYM."

	para "…Oh? All the way"
	line "from JOHTO, you"
	cont "say? How nice…"

	para "Oh. I'm sorry, I"
	line "didn't realize"

	para "that you wished to"
	line "challenge me."

	para "Very well, but I"
	line "shall not lose."
	done

UnknownText_0x72c3e:
	text "ERIKA: Oh!"
	line "I concede defeat…"

	para "You are remarkably"
	line "strong…"

	para "I shall give you"
	line "RAINBOWBADGE…"
	done

UnknownText_0x72c96:
	text "<PLAYER> received"
	line "RAINBOWBADGE."
	done

UnknownText_0x72cb0:
	text "ERIKA: That was a"
	line "delightful match."

	para "I felt inspired."
	line "Please, I wish you"
	cont "to have this TM."

	para "It is GIGA DRAIN."

	para "It is a wonderful"
	line "move that drains"

	para "half the damage it"
	line "inflicts to heal"
	cont "your #MON."

	para "Please use it if"
	line "it pleases you…"
	done

UnknownText_0x72d8f:
	text "ERIKA: Losing"
	line "leaves a bitter"
	cont "aftertaste…"

	para "But knowing that"
	line "there are strong"

	para "trainers spurs me"
	line "to do better…"
	done

LassMichelleSeenText:
	text "Do you think a"
	line "girls-only GYM"
	cont "is rare?"
	done

LassMichelleBeatenText:
	text "Oh, bleah!"
	done

UnknownText_0x72e30:
	text "I just got care-"
	line "less, that's all!"
	done

PicnickerTanyaSeenText:
	text "Oh, a battle?"
	line "That's kind of"
	cont "scary, but OK!"
	done

PicnickerTanyaBeatenText:
	text "Oh, that's it?"
	done

UnknownText_0x72e8e:
	text "Oh, look at all"
	line "your BADGES. No"

	para "wonder I couldn't"
	line "win!"
	done

BeautyJuliaSeenText:
	text "Were you looking"
	line "at these flowers"
	cont "or at me?"
	done

BeautyJuliaBeatenText:
	text "How annoying!"
	done

UnknownText_0x72f01:
	text "How do I go about"
	line "becoming ladylike"
	cont "like ERIKA?"
	done

TwinsJoandzoe1SeenText:
	text "We'll show you"
	line "#MON moves that"
	cont "ERIKA taught us!"
	done

TwinsJoandzoe1BeatenText:
	text "Oh… We lost…"
	done

UnknownText_0x72f70:
	text "ERIKA will get you"
	line "back for us!"
	done

TwinsJoandzoe2SeenText:
	text "We're going to"
	line "protect ERIKA!"
	done

TwinsJoandzoe2BeatenText:
	text "We couldn't win…"
	done

UnknownText_0x72fc0:
	text "ERIKA is much,"
	line "much stronger!"
	done

CeladonGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $11, $4, 8, CELADON_CITY
	warp_def $11, $5, 8, CELADON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 15, 3, SIGNPOST_READ, CeladonGymStatue
	signpost 15, 6, SIGNPOST_READ, CeladonGymStatue

.PersonEvents:
	db 6
	person_event SPRITE_ERIKA, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ErikaScript_0x72a6a, -1
	person_event SPRITE_LASS, 8, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerLassMichelle, -1
	person_event SPRITE_LASS, 8, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	person_event SPRITE_BUENA, 5, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	person_event SPRITE_TWIN, 10, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsJoandzoe1, -1
	person_event SPRITE_TWIN, 10, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsJoandzoe2, -1
