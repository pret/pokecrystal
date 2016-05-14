const_value set 2
	const FUCHSIAGYM_JANINE
	const FUCHSIAGYM_FUCHSIA_GYM_1
	const FUCHSIAGYM_FUCHSIA_GYM_2
	const FUCHSIAGYM_FUCHSIA_GYM_3
	const FUCHSIAGYM_FUCHSIA_GYM_4
	const FUCHSIAGYM_GYM_GUY

FuchsiaGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

JanineScript_0x195db9:
	checkflag ENGINE_SOULBADGE
	iftrue .FightDone
	applymovement FUCHSIAGYM_JANINE, MovementData_0x195f27
	faceplayer
	opentext
	writetext UnknownText_0x195f35
	waitbutton
	closetext
	winlosstext UnknownText_0x195fa1, 0
	loadtrainer JANINE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_LASS_ALICE
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_PICNICKER_CINDY
	setevent EVENT_BEAT_CAMPER_BARRY
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special MapCallbackSprites_LoadUsedSpritesGFX
	opentext
	writetext UnknownText_0x195feb
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SOULBADGE
	jump UnknownScript_0x195e02
.FightDone:
	faceplayer
	opentext
UnknownScript_0x195e02:
	checkevent EVENT_GOT_TM06_TOXIC
	iftrue UnknownScript_0x195e15
	writetext UnknownText_0x196002
	buttonsound
	verbosegiveitem TM_TOXIC
	iffalse UnknownScript_0x195e15
	setevent EVENT_GOT_TM06_TOXIC
UnknownScript_0x195e15:
	writetext UnknownText_0x196074
	waitbutton
	closetext
	end

FuschiaGym1Script_0x195e1b:
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue UnknownScript_0x195e2c
	applymovement FUCHSIAGYM_FUCHSIA_GYM_1, MovementData_0x195f27
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	special MapCallbackSprites_LoadUsedSpritesGFX
UnknownScript_0x195e2c:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue UnknownScript_0x195e4f
	writetext UnknownText_0x1960e6
	waitbutton
	closetext
	winlosstext UnknownText_0x196126, 0
	loadtrainer LASS, ALICE
	startbattle
	iftrue UnknownScript_0x195e4a
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_ALICE
	end

UnknownScript_0x195e4a:
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	reloadmapafterbattle
	end

UnknownScript_0x195e4f:
	writetext UnknownText_0x196139
	waitbutton
	closetext
	end

FuschiaGym2Script_0x195e55:
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue UnknownScript_0x195e66
	applymovement FUCHSIAGYM_FUCHSIA_GYM_2, MovementData_0x195f27
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	special MapCallbackSprites_LoadUsedSpritesGFX
UnknownScript_0x195e66:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue UnknownScript_0x195e89
	writetext UnknownText_0x196166
	waitbutton
	closetext
	winlosstext UnknownText_0x19617b, 0
	loadtrainer LASS, LINDA
	startbattle
	iftrue UnknownScript_0x195e84
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_LINDA
	end

UnknownScript_0x195e84:
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	reloadmapafterbattle
	end

UnknownScript_0x195e89:
	writetext UnknownText_0x196199
	waitbutton
	closetext
	end

FuschiaGym3Script_0x195e8f:
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue UnknownScript_0x195ea0
	applymovement FUCHSIAGYM_FUCHSIA_GYM_3, MovementData_0x195f27
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_LASS
	special MapCallbackSprites_LoadUsedSpritesGFX
UnknownScript_0x195ea0:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue UnknownScript_0x195ec3
	writetext UnknownText_0x1961bb
	waitbutton
	closetext
	winlosstext UnknownText_0x1961f1, 0
	loadtrainer PICNICKER, CINDY
	startbattle
	iftrue UnknownScript_0x195ebe
	reloadmapafterbattle
	setevent EVENT_BEAT_PICNICKER_CINDY
	end

UnknownScript_0x195ebe:
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	reloadmapafterbattle
	end

UnknownScript_0x195ec3:
	writetext UnknownText_0x19620c
	waitbutton
	closetext
	end

FuschiaGym4Script_0x195ec9:
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue UnknownScript_0x195eda
	applymovement FUCHSIAGYM_FUCHSIA_GYM_4, MovementData_0x195f27
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special MapCallbackSprites_LoadUsedSpritesGFX
UnknownScript_0x195eda:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue UnknownScript_0x195efd
	writetext UnknownText_0x196228
	waitbutton
	closetext
	winlosstext UnknownText_0x19624a, 0
	loadtrainer CAMPER, BARRY
	startbattle
	iftrue UnknownScript_0x195ef8
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_BARRY
	end

UnknownScript_0x195ef8:
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	reloadmapafterbattle
	end

UnknownScript_0x195efd:
	writetext UnknownText_0x19626b
	waitbutton
	closetext
	end

FuchsiaGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JANINE
	iftrue .FuchsiaGymGuyWinScript
	writetext FuchsiaGymGuyText
	waitbutton
	closetext
	end

.FuchsiaGymGuyWinScript:
	writetext FuchsiaGymGuyWinText
	waitbutton
	closetext
	end

FuchsiaGymStatue:
	checkflag ENGINE_SOULBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext JANINE, 1, $1
	jumpstd gymstatue2

MovementData_0x195f27:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

UnknownText_0x195f35:
	text "Fufufufu…"

	para "I'm sorry to dis-"
	line "appoint you…"

	para "I'm only joking!"

	para "I'm the real deal!"

	para "JANINE of FUCHSIA"
	line "GYM, that's me!"
	done

UnknownText_0x195fa1:
	text "JANINE: You're a"
	line "tough one. You"
	cont "definitely won…"

	para "Here's SOULBADGE."
	line "Take it."
	done

UnknownText_0x195feb:
	text "<PLAYER> received"
	line "SOULBADGE."
	done

UnknownText_0x196002:
	text "JANINE: You're so"
	line "tough! I have a"
	cont "special gift!"

	para "It's TOXIC, a pow-"
	line "erful poison that"

	para "steadily saps the"
	line "victim's HP."
	done

UnknownText_0x196074:
	text "JANINE: I'm going"
	line "to really apply"

	para "myself and improve"
	line "my skills."

	para "I want to become"
	line "better than both"
	cont "Father and you!"
	done

UnknownText_0x1960e6:
	text "Fufufu!"

	para "I'm JANINE, the"
	line "GYM LEADER!"

	para "No, I'm not!"
	line "Gotcha, sucker!"
	done

UnknownText_0x196126:
	text "I had you fooled…"
	done

UnknownText_0x196139:
	text "How will you dis-"
	line "tinguish our real"
	cont "LEADER?"
	done

UnknownText_0x196166:
	text "Fooled you!"
	line "Hahaha!"
	done

UnknownText_0x19617b:
	text "Ooh… I lost…"
	line "You're not weak…"
	done

UnknownText_0x196199:
	text "Well? Wasn't my"
	line "disguise perfect?"
	done

UnknownText_0x1961bb:
	text "I'm JANINE!"

	para "How did you know I"
	line "was real?"

	para "Let's battle!"
	done

UnknownText_0x1961f1:
	text "Darn it!"
	line "I wanted to win!"
	done

UnknownText_0x19620c:
	text "You must be"
	line "getting tired."
	done

UnknownText_0x196228:
	text "Wahahaha!"

	para "You betcha!"
	line "I'm JANINE!"
	done

UnknownText_0x19624a:
	text "My disguise was"
	line "right on! Dang!"
	done

UnknownText_0x19626b:
	text "Hey, you. Was my"
	line "disguise cute or"
	cont "what, huh?"
	done

FuchsiaGymGuyText:
	text "Yo, CHAMP in"
	line "making!"

	para "Whoops! Take a"
	line "good look around"

	para "you. The trainers"
	line "all look like the"
	cont "LEADER, JANINE."

	para "Which of them is"
	line "the real JANINE?"
	done

FuchsiaGymGuyWinText:
	text "That was a great"
	line "battle, trainer"
	cont "from JOHTO!"
	done

FuchsiaGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $11, $4, 3, FUCHSIA_CITY
	warp_def $11, $5, 3, FUCHSIA_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 15, 3, SIGNPOST_READ, FuchsiaGymStatue
	signpost 15, 6, SIGNPOST_READ, FuchsiaGymStatue

.PersonEvents:
	db 6
	person_event SPRITE_JANINE, 10, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, JanineScript_0x195db9, -1
	person_event SPRITE_FUCHSIA_GYM_1, 7, 5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FuschiaGym1Script_0x195e1b, -1
	person_event SPRITE_FUCHSIA_GYM_2, 11, 5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FuschiaGym2Script_0x195e55, -1
	person_event SPRITE_FUCHSIA_GYM_3, 4, 9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FuschiaGym3Script_0x195e8f, -1
	person_event SPRITE_FUCHSIA_GYM_4, 2, 4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FuschiaGym4Script_0x195ec9, -1
	person_event SPRITE_GYM_GUY, 15, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FuchsiaGymGuyScript, -1
