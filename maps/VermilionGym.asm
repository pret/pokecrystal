const_value set 2
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUY

VermilionGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SurgeScript_0x1920a5:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext UnknownText_0x192142
	waitbutton
	closetext
	winlosstext UnknownText_0x192238, 0
	loadtrainer LT_SURGE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext UnknownText_0x192277
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext UnknownText_0x192291
	waitbutton
	closetext
	end

.FightDone:
	writetext UnknownText_0x192303
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer EVENT_BEAT_GENTLEMAN_GREGORY, GENTLEMAN, GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, GentlemanGregoryScript

GentlemanGregoryScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1923b0
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer EVENT_BEAT_GUITARIST_VINCENT, GUITARIST, VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, GuitaristVincentScript

GuitaristVincentScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19244b
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer EVENT_BEAT_JUGGLER_HORTON, JUGGLER, HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, JugglerHortonScript

JugglerHortonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1924d6
	waitbutton
	closetext
	end

VermilionGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuyWinScript
	writetext VermilionGymGuyText
	waitbutton
	closetext
	end

.VermilionGymGuyWinScript:
	writetext VermilionGymGuyWinText
	waitbutton
	closetext
	end

MapVermilionGymSignpost14Script:
	jumptext UnknownText_0x19261e

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext LT_SURGE, 1, $1
	jumpstd gymstatue2

UnknownText_0x192142:
	text "SURGE: Hey, you"
	line "little tyke!"

	para "I have to hand it"
	line "to you. It may not"

	para "be very smart to"
	line "challenge me, but"
	cont "it takes guts!"

	para "When it comes to"
	line "electric #MON,"
	cont "I'm number one!"

	para "I've never lost on"
	line "the battlefield."

	para "I'll zap you just"
	line "like I did my"
	cont "enemies in war!"
	done

UnknownText_0x192238:
	text "SURGE: Arrrgh!"
	line "You are strong!"

	para "OK, kid. You get"
	line "THUNDERBADGE!"
	done

UnknownText_0x192277:
	text "<PLAYER> received"
	line "THUNDERBADGE."
	done

UnknownText_0x192291:
	text "SURGE: THUNDER-"
	line "BADGE increases"
	cont "#MON's speed. "

	para "Consider it proof"
	line "that you defeated"

	para "me. You wear it"
	line "proudly, hear?"
	done

UnknownText_0x192303:
	text "SURGE: Hey, kid!"
	line "Still slugging and"
	cont "chugging away?"

	para "My #MON and I"
	line "are still at it!"
	done

GentlemanGregorySeenText:
	text "You're here to"
	line "defeat LT.SURGE?"

	para "Not if I can help"
	line "it!"
	done

GentlemanGregoryBeatenText:
	text "Sorry I failed"
	line "you, LT.SURGE,"
	cont "sir!"
	done

UnknownText_0x1923b0:
	text "When I was still"
	line "in the army, LT."

	para "SURGE saved my"
	line "life."
	done

GuitaristVincentSeenText:
	text "LT.SURGE recog-"
	line "nized my potential"

	para "with electric"
	line "#MON."

	para "Think you can beat"
	line "me?"
	done

GuitaristVincentBeatenText:
	text "Ooh, how shocking!"
	done

UnknownText_0x19244b:
	text "If the GYM's traps"
	line "were working, you"

	para "would have been"
	line "toast…"
	done

JugglerHortonSeenText:
	text "I'm going to take"
	line "you down! Prepare"
	cont "to be shocked!"
	done

JugglerHortonBeatenText:
	text "Gwaaah!"
	line "I was overpowered…"
	done

UnknownText_0x1924d6:
	text "Don't get too com-"
	line "fortable about"

	para "beating me…"
	line "LT.SURGE is tough."
	done

VermilionGymGuyText:
	text "Yo! CHAMP in"
	line "making!"

	para "You lucked out"
	line "this time."

	para "LT.SURGE is very"
	line "cautious. He has"

	para "traps set all over"
	line "the GYM."

	para "But--he-heh--the"
	line "traps aren't"
	cont "active right now."

	para "You'll have no"
	line "problem getting to"
	cont "LT.SURGE."
	done

VermilionGymGuyWinText:
	text "Whew! That was an"
	line "electrifying bout!"

	para "It sure made me"
	line "nervous."
	done

UnknownText_0x19261e:
	text "Nope! Nothing here"
	line "but trash."
	done

VermilionGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $11, $4, 7, VERMILION_CITY
	warp_def $11, $5, 7, VERMILION_CITY

.XYTriggers:
	db 0

.Signposts:
	db 17
	signpost 7, 1, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 7, 3, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 7, 5, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 7, 7, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 7, 9, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 9, 1, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 9, 3, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 9, 5, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 9, 7, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 9, 9, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 11, 1, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 11, 3, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 11, 5, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 11, 7, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 11, 9, SIGNPOST_READ, MapVermilionGymSignpost14Script
	signpost 15, 3, SIGNPOST_READ, VermilionGymStatue
	signpost 15, 6, SIGNPOST_READ, VermilionGymStatue

.PersonEvents:
	db 5
	person_event SPRITE_SURGE, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SurgeScript_0x1920a5, -1
	person_event SPRITE_GENTLEMAN, 8, 8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	person_event SPRITE_ROCKER, 7, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 3, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	person_event SPRITE_SUPER_NERD, 10, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	person_event SPRITE_GYM_GUY, 15, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 1, VermilionGymGuyScript, -1
