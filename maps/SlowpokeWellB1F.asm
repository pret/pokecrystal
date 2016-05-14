const_value set 2
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_SLOWPOKE2
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL

SlowpokeWellB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

KurtScript_0x5a5d5:
	jumptextfaceplayer UnknownText_0x5a6b5

TrainerGruntM29:
	trainer EVENT_BEAT_ROCKET_GRUNTM_29, GRUNTM, 29, GruntM29SeenText, GruntM29BeatenText, 0, GruntM29Script

GruntM29Script:
	end_if_just_battled
	opentext
	writetext TrainerGruntM29SlowpokeProfitText
	waitbutton
	closetext
	end

TrainerGruntM1:
	trainer EVENT_BEAT_ROCKET_GRUNTM_1, GRUNTM, 1, GruntM1SeenText, GruntM1BeatenText, 0, GruntM1Script

GruntM1Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special Special_FadeInQuickly
	disappear SLOWPOKEWELLB1F_KURT
	moveperson SLOWPOKEWELLB1F_KURT, $b, $6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	spriteface PLAYER, RIGHT
	opentext
	writetext KurtLeaveSlowpokeWellText
	waitbutton
	closetext
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_SILVER
	domaptrigger AZALEA_TOWN, $1
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp KURTS_HOUSE, $3, $3
	end

TrainerGruntM2:
	trainer EVENT_BEAT_ROCKET_GRUNTM_2, GRUNTM, 2, GruntM2SeenText, GruntM2BeatenText, 0, GruntM2Script

GruntM2Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5aaf2
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer EVENT_BEAT_ROCKET_GRUNTF_1, GRUNTF, 1, GruntF1SeenText, GruntF1BeatenText, 0, GruntF1Script

GruntF1Script:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5ab8d
	waitbutton
	closetext
	end

SlowpokeScript_0x5a681:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext UnknownText_0x5abcb
	yesorno
	iftrue UnknownScript_0x5a68f
	closetext
	end

UnknownScript_0x5a68f:
	writetext UnknownText_0x5ac09
	waitbutton
	closetext
	end

SlowpokeScript_0x5a695:
	faceplayer
	opentext
	writetext UnknownText_0x5ac61
	cry SLOWPOKE
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd strengthboulder

SlowpokeWellB1FSuperPotion:
	itemball SUPER_POTION

KurtSlowpokeWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

UnknownText_0x5a6b5:
	text "KURT: Hey there,"
	line "<PLAYER>!"

	para "The guard up top"
	line "took off when I"
	cont "shouted at him."

	para "But then I took a"
	line "tumble down the"
	cont "WELL."

	para "I slammed down"
	line "hard on my back,"
	cont "so I can't move."

	para "Rats! If I were"
	line "fit, my #MON"

	para "would've punished"
	line "them…"

	para "Ah, it can't be"
	line "helped."

	para "<PLAYER>, show them"
	line "how gutsy you are"
	cont "in my place!"
	done

KurtLeaveSlowpokeWellText:
	text "KURT: Way to go,"
	line "<PLAYER>!"

	para "TEAM ROCKET has"
	line "taken off."

	para "My back's better"
	line "too. Let's get out"
	cont "of here."
	done

GruntM29SeenText:
	text "Darn! I was stand-"
	line "ing guard up top"

	para "when some old coot"
	line "yelled at me."

	para "He startled me so"
	line "much that I fell"
	cont "down here."

	para "I think I'll vent"
	line "my anger by taking"
	cont "it out on you!"
	done

GruntM29BeatenText:
	text "Arrgh! This is NOT"
	line "my day!"
	done

TrainerGruntM29SlowpokeProfitText:
	text "Sure, we've been"
	line "hacking the tails"

	para "off SLOWPOKE and"
	line "selling them."

	para "Everything we do"
	line "is for profit."

	para "That's right!"
	line "We're TEAM ROCKET,"

	para "and we'll do any-"
	line "thing for money!"
	done

GruntM1SeenText:
	text "What do you want?"

	para "If you interrupt"
	line "our work, don't"
	cont "expect any mercy!"
	done

GruntM1BeatenText:
	text "You did OK today,"
	line "but wait till next"
	cont "time!"
	done

TrainerGruntM1WhenTalkText:
	text "Yeah, TEAM ROCKET"
	line "was broken up"
	cont "three years ago."

	para "But we continued"
	line "our activities"
	cont "underground."

	para "Now you can have"
	line "fun watching us"
	cont "stir up trouble!"
	done

GruntM2SeenText:
	text "Quit taking SLOW-"
	line "POKETAILS?"

	para "If we obeyed you,"
	line "TEAM ROCKET's rep"
	cont "would be ruined!"
	done

GruntM2BeatenText:
	text "Just…"
	line "Too strong…"
	done

UnknownText_0x5aaf2:
	text "We need the money,"
	line "but selling SLOW-"
	cont "POKETAILS?"

	para "It's tough being a"
	line "ROCKET GRUNT!"
	done

GruntF1SeenText:
	text "Stop taking TAILS?"

	para "Yeah, just try to"
	line "defeat all of us!"
	done

GruntF1BeatenText:
	text "You rotten brat!"
	done

UnknownText_0x5ab8d:
	text "SLOWPOKETAILS"
	line "grow back fast!"

	para "What's wrong with"
	line "selling them?"
	done

UnknownText_0x5abcb:
	text "A SLOWPOKE with"
	line "its TAIL cut off…"

	para "Huh? It has MAIL."
	line "Read it?"
	done

UnknownText_0x5ac09:
	text "<PLAYER> read the"
	line "MAIL."

	para "Be good and look"
	line "after the house"

	para "with Grandpa and"
	line "SLOWPOKE."

	para "Love, Dad"
	done

UnknownText_0x5ac61:
	text "A SLOWPOKE with"
	line "its TAIL cut off…"
	done

SlowpokeWellB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $f, $11, 6, AZALEA_TOWN
	warp_def $b, $7, 1, SLOWPOKE_WELL_B2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 9
	person_event SPRITE_ROCKET, 7, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 3, TrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_ROCKET, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 1, TrainerGruntM1, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_ROCKET, 6, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 2, TrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_ROCKET_GIRL, 4, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_SLOWPOKE, 4, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SlowpokeScript_0x5a681, EVENT_SLOWPOKE_WELL_SLOWPOKES
	person_event SPRITE_SLOWPOKE, 2, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SlowpokeScript_0x5a695, EVENT_SLOWPOKE_WELL_SLOWPOKES
	person_event SPRITE_KURT, 14, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KurtScript_0x5a5d5, EVENT_SLOWPOKE_WELL_KURT
	person_event SPRITE_BOULDER, 2, 3, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	person_event SPRITE_POKE_BALL, 3, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
