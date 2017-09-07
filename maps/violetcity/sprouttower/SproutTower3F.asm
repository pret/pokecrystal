const_value set 2
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_SILVER

SproutTower3F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x184945, 0
	dw UnknownScript_0x184946, 0

.MapCallbacks:
	db 0

UnknownScript_0x184945:
	end

UnknownScript_0x184946:
	end

UnknownScript_0x184947:
	spriteface PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, MovementData_0x184a1d
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a22
	opentext
	writetext UnknownText_0x184a27
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_SILVER, 15
	spriteface SPROUTTOWER3F_SILVER, DOWN
	pause 15
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a24
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext UnknownText_0x184aec
	waitbutton
	closetext
	spriteface SPROUTTOWER3F_SILVER, UP
	opentext
	writetext UnknownText_0x184bc8
	pause 15
	closetext
	playsound SFX_WARP_TO
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_SILVER
	waitsfx
	special Special_FadeInQuickly
	dotrigger $1
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue UnknownScript_0x1849d1
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext UnknownText_0x184cc2
	buttonsound
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext UnknownText_0x184d13
	waitbutton
	closetext
	end

UnknownScript_0x1849d1:
	writetext UnknownText_0x184d88
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer EVENT_BEAT_SAGE_JIN, SAGE, JIN, SageJinSeenText, SageJinBeatenText, 0, SageJinScript

SageJinScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x184dfa
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer EVENT_BEAT_SAGE_TROY, SAGE, TROY, SageTroySeenText, SageTroyBeatenText, 0, SageTroyScript

SageTroyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x184ea4
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer EVENT_BEAT_SAGE_NEAL, SAGE, NEAL, SageNealSeenText, SageNealBeatenText, 0, SageNealScript

SageNealScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x184f12
	waitbutton
	closetext
	end

MapSproutTower3FSignpost3Script:
	jumptext UnknownText_0x184f37

MapSproutTower3FSignpost5Script:
	jumptext UnknownText_0x184f61

SproutTower3FPotion:
	itemball POTION

SproutTower3FEscapeRope:
	itemball ESCAPE_ROPE

MovementData_0x184a1d:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x184a22:
	step UP
	step_end

MovementData_0x184a24:
	step RIGHT
	step DOWN
	step_end

UnknownText_0x184a27:
	text "ELDER: You are in-"
	line "deed skilled as a"
	cont "trainer."

	para "As promised, here"
	line "is your HM."

	para "But let me say"
	line "this: You should"

	para "treat your"
	line "#MON better."

	para "The way you battle"
	line "is far too harsh."

	para "#MON are not"
	line "tools of war…"
	done

UnknownText_0x184aec:
	text "…"
	line "…Humph!"

	para "He claims to be"
	line "the ELDER but"
	cont "he's weak."

	para "It stands to"
	line "reason."

	para "I'd never lose to"
	line "fools who babble"

	para "about being nice"
	line "to #MON."

	para "I only care about"
	line "strong #MON"
	cont "that can win."

	para "I really couldn't"
	line "care less about"
	cont "weak #MON."
	done

UnknownText_0x184bc8:
	text "<RIVAL> used an"
	line "ESCAPE ROPE!"
	done

SageLiSeenText:
	text "So good of you to"
	line "come here!"

	para "SPROUT TOWER is a"
	line "place of training."

	para "People and #MON"
	line "test their bonds"

	para "to build a bright"
	line "future together."

	para "I am the final"
	line "test."

	para "Allow me to check"
	line "the ties between"

	para "your #MON and"
	line "you!"
	done

SageLiBeatenText:
	text "Ah, excellent!"
	done

UnknownText_0x184cc2:
	text "You and your #-"
	line "MON should have"

	para "no problem using"
	line "this move."

	para "Take this FLASH"
	line "HM."
	done

UnknownText_0x184d13:
	text "FLASH illuminates"
	line "even the darkest"
	cont "of all places."

	para "But to use it out"
	line "of battle, you"

	para "need the BADGE"
	line "from VIOLET's GYM."
	done

UnknownText_0x184d88:
	text "I hope you learn"
	line "and grow from your"
	cont "journey."
	done

SageJinSeenText:
	text "I train to find"
	line "enlightenment in"
	cont "#MON!"
	done

SageJinBeatenText:
	text "My training is"
	line "incomplete…"
	done

UnknownText_0x184dfa:
	text "As #MON grow"
	line "stronger, so does"
	cont "the trainer."

	para "No, wait. As the"
	line "trainer grows"

	para "stronger, so do"
	line "the #MON."
	done

SageTroySeenText:
	text "Let me see how"
	line "much you trust"
	cont "your #MON."
	done

SageTroyBeatenText:
	text "Yes, your trust is"
	line "real!"
	done

UnknownText_0x184ea4:
	text "It is not far to"
	line "the ELDER."
	done

SageNealSeenText:
	text "The ELDER's HM"
	line "lights even pitch-"
	cont "black darkness."
	done

SageNealBeatenText:
	text "It is my head that"
	line "is bright!"
	done

UnknownText_0x184f12:
	text "Let there be light"
	line "on your journey."
	done

UnknownText_0x184f37:
	text "It's a powerful"
	line "painting of a"
	cont "BELLSPROUT."
	done

UnknownText_0x184f61:
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done

SproutTower3F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $e, $a, 4, SPROUT_TOWER_2F

.XYTriggers:
	db 1
	xy_trigger 0, $9, $b, $0, UnknownScript_0x184947, $0, $0

.Signposts:
	db 6
	signpost 1, 8, SIGNPOST_READ, MapSproutTower3FSignpost5Script
	signpost 1, 11, SIGNPOST_READ, MapSproutTower3FSignpost5Script
	signpost 0, 9, SIGNPOST_READ, MapSproutTower3FSignpost3Script
	signpost 0, 10, SIGNPOST_READ, MapSproutTower3FSignpost3Script
	signpost 15, 5, SIGNPOST_READ, MapSproutTower3FSignpost5Script
	signpost 15, 14, SIGNPOST_READ, MapSproutTower3FSignpost5Script

.PersonEvents:
	db 7
	person_event SPRITE_SAGE, 13, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSageJin, -1
	person_event SPRITE_SAGE, 8, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSageTroy, -1
	person_event SPRITE_SAGE, 2, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SageLiScript, -1
	person_event SPRITE_SAGE, 11, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSageNeal, -1
	person_event SPRITE_POKE_BALL, 14, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	person_event SPRITE_POKE_BALL, 1, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	person_event SPRITE_SILVER, 4, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
