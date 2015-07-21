DragonsDenB1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x18c89d, $0000
	dw UnknownScript_0x18c89e, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 5, UnknownScript_0x18c89f

UnknownScript_0x18c89d:
	end

UnknownScript_0x18c89e:
	end

UnknownScript_0x18c89f:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue UnknownScript_0x18c8a8
	disappear $4
	return

UnknownScript_0x18c8a8:
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, UnknownScript_0x18c8b5
	if_equal THURSDAY, UnknownScript_0x18c8b5
	disappear $4
	return

UnknownScript_0x18c8b5:
	appear $4
	return

UnknownScript_0x18c8b8:
	appear $3
	loadfont
	writetext UnknownText_0x18c9b8
	pause 30
	loadmovesprites
	showemote EMOTE_SHOCK, $0, 15
	spriteface $0, LEFT
	playmusic MUSIC_CLAIR
	applymovement $3, MovementData_0x18c9ae
	loadfont
	writetext UnknownText_0x18c9bf
	keeptextopen
	giveitem TM_DRAGONBREATH, $1
	iffalse UnknownScript_0x18c8f4
	itemtotext TM_DRAGONBREATH, $0
	writetext UnknownText_0x18c9fb
	playsound SFX_ITEM
	waitbutton
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext UnknownText_0x18ca0d
	keeptextopen
	writetext UnknownText_0x18caf1
	closetext
	loadmovesprites
	jump UnknownScript_0x18c8f9

UnknownScript_0x18c8f4:
	writetext UnknownText_0x18ca8b
	closetext
	loadmovesprites
UnknownScript_0x18c8f9:
	applymovement $3, MovementData_0x18c9b3
	special Functionc48f
	pause 30
	special RestartMapMusic
	disappear $3
	dotrigger $0
	end

TrainerCooltrainermDarin:
	trainer EVENT_BEAT_COOLTRAINERM_DARIN, COOLTRAINERM, DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, $0000, CooltrainermDarinScript

CooltrainermDarinScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18cd82
	closetext
	loadmovesprites
	end

TrainerCooltrainerfCara:
	trainer EVENT_BEAT_COOLTRAINERF_CARA, COOLTRAINERF, CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, $0000, CooltrainerfCaraScript

CooltrainerfCaraScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18ce11
	closetext
	loadmovesprites
	end

TrainerTwinsLeaandpia1:
	trainer EVENT_BEAT_TWINS_LEA_AND_PIA, TWINS, LEAANDPIA1, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, $0000, TwinsLeaandpia1Script

TwinsLeaandpia1Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18ced3
	closetext
	loadmovesprites
	end

TrainerTwinsLeaandpia2:
	trainer EVENT_BEAT_TWINS_LEA_AND_PIA, TWINS, LEAANDPIA1, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, $0000, TwinsLeaandpia2Script

TwinsLeaandpia2Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x18cf0f
	closetext
	loadmovesprites
	end

PokeBallScript_0x18c95a:
	giveitem DRAGON_FANG, $1
	iffalse UnknownScript_0x18c970
	disappear $2
	loadfont
	itemtotext DRAGON_FANG, $0
	writetext UnknownText_0x18cf41
	playsound SFX_ITEM
	waitbutton
	itemnotify
	loadmovesprites
	end

UnknownScript_0x18c970:
	loadfont
	itemtotext DRAGON_FANG, $0
	writetext UnknownText_0x18cf41
	keeptextopen
	writetext UnknownText_0x18cf51
	closetext
	loadmovesprites
	end

SilverScript_0x18c97e:
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	loadfont
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x18c995
	writetext UnknownText_0x18cc83
	closetext
	loadmovesprites
	setevent EVENT_GAVE_KURT_APRICORNS
	special RestartMapMusic
	end

UnknownScript_0x18c995:
	writetext UnknownText_0x18cd2d
	closetext
	loadmovesprites
	special RestartMapMusic
	end

MapDragonsDenB1FSignpost0Script:
	jumptext UnknownText_0x18cc2e

ItemFragment_0x18c9a1:
	db CALCIUM, 1

ItemFragment_0x18c9a3:
	db MAX_ELIXER, 1

MapDragonsDenB1FSignpostItem1:
	dwb EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE, REVIVE

MapDragonsDenB1FSignpostItem2:
	dwb EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION, MAX_POTION

MapDragonsDenB1FSignpostItem3:
	dwb EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER, MAX_ELIXER

MovementData_0x18c9ae:
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	step_end

MovementData_0x18c9b3:
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	step_end

UnknownText_0x18c9b8:
	text "Wait!"
	done

UnknownText_0x18c9bf:
	text "CLAIR: I'm sorry"
	line "about this."

	para "Here, take this as"
	line "my apology."
	done

UnknownText_0x18c9fb:
	text "<PLAYER> received"
	line "TM24."
	done

UnknownText_0x18ca0d:
	text "That contains"
	line "DRAGONBREATH."

	para "No, it doesn't"
	line "have anything to"
	cont "do with my breath."

	para "If you don't want"
	line "it, you don't have"
	cont "to take it."
	done

UnknownText_0x18ca8b:
	text "Oh? You don't have"
	line "any room for this."

	para "I'm going back to"
	line "the GYM, so make"

	para "room, then come"
	line "see me there."
	done

UnknownText_0x18caf1:
	text "CLAIR: What's the"
	line "matter? Aren't you"

	para "going on to the"
	line "#MON LEAGUE?"

	para "Do you know how to"
	line "get there?"

	para "From here, go to"
	line "NEW BARK TOWN."

	para "Then SURF east to"
	line "#MON LEAGUE."

	para "The route there is"
	line "very tough."

	para "Don't you dare"
	line "lose at the #-"
	cont "MON LEAGUE!"

	para "If you do, I'll"
	line "feel even worse"

	para "about having lost"
	line "to you!"

	para "Give it everything"
	line "you've got."
	done

UnknownText_0x18cc2e:
	text "DRAGON SHRINE"

	para "A shrine honoring"
	line "the dragon #MON"

	para "said to have lived"
	line "in DRAGON'S DEN."
	done

UnknownText_0x18cc83:
	text "…"
	line "What? <PLAYER>?"

	para "…No, I won't"
	line "battle you now…"

	para "My #MON aren't"
	line "ready to beat you."

	para "I can't push them"
	line "too hard now."

	para "I have to be dis-"
	line "ciplined to become"

	para "the greatest #-"
	line "MON trainer…"
	done

UnknownText_0x18cd2d:
	text "…"

	para "Whew…"

	para "Learn to stay out"
	line "of my way…"
	done

CooltrainermDarinSeenText:
	text "You! How dare you"
	line "enter uninvited!"
	done

CooltrainermDarinBeatenText:
	text "S-strong!"
	done

UnknownText_0x18cd82:
	text "The SHRINE ahead"
	line "is home to the"

	para "MASTER of our"
	line "dragon-user clan."

	para "You're not allowed"
	line "to just go in!"
	done

CooltrainerfCaraSeenText:
	text "You shouldn't be"
	line "in here!"
	done

CooltrainerfCaraBeatenText:
	text "Oh yikes, I lost!"
	done

UnknownText_0x18ce11:
	text "Soon I'm going to"
	line "get permission"

	para "from our MASTER to"
	line "use dragons."

	para "When I do, I'm"
	line "going to become an"

	para "admirable dragon"
	line "trainer and gain"

	para "our MASTER's"
	line "approval."
	done

TwinsLeaandpia1SeenText:
	text "It's a stranger we"
	line "don't know."
	done

TwinsLeaandpia1BeatenText:
	text "Ouchies."
	done

UnknownText_0x18ced3:
	text "It was like having"
	line "to battle LANCE."
	done

TwinsLeaandpia2SeenText:
	text "Who are you?"
	done

TwinsLeaandpia2BeatenText:
	text "Meanie."
	done

UnknownText_0x18cf0f:
	text "We'll tell on you."

	para "MASTER will be"
	line "angry with you."
	done

UnknownText_0x18cf41:
	text "<PLAYER> found"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

UnknownText_0x18cf51:
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

DragonsDenB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $14, 3, GROUP_DRAGONS_DEN_1F, MAP_DRAGONS_DEN_1F
	warp_def $1d, $13, 1, GROUP_DRAGON_SHRINE, MAP_DRAGON_SHRINE

.XYTriggers:
	db 1
	xy_trigger 1, $1e, $13, $0, UnknownScript_0x18c8b8, $0, $0

.Signposts:
	db 4
	signpost 24, 18, SIGNPOST_READ, MapDragonsDenB1FSignpost0Script
	signpost 29, 33, SIGNPOST_ITEM, MapDragonsDenB1FSignpostItem1
	signpost 17, 21, SIGNPOST_ITEM, MapDragonsDenB1FSignpostItem2
	signpost 15, 31, SIGNPOST_ITEM, MapDragonsDenB1FSignpostItem3

.PersonEvents:
	db 9
	person_event SPRITE_POKE_BALL, 20, 39, OW_DOWN | $1, $0, -1, -1, $0, 0, PokeBallScript_0x18c95a, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	person_event SPRITE_CLAIR, 34, 18, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	person_event SPRITE_SILVER, 27, 24, OW_DOWN | $2, $22, -1, -1, $0, 0, SilverScript_0x18c97e, EVENT_RIVAL_DRAGONS_DEN
	person_event SPRITE_COOLTRAINER_M, 12, 24, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 4, TrainerCooltrainermDarin, -1
	person_event SPRITE_COOLTRAINER_F, 12, 12, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerCooltrainerfCara, -1
	person_event SPRITE_TWIN, 21, 8, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerTwinsLeaandpia1, -1
	person_event SPRITE_TWIN, 22, 8, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerTwinsLeaandpia2, -1
	person_event SPRITE_POKE_BALL, 8, 34, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c9a1, EVENT_DRAGONS_DEN_B1F_CALCIUM
	person_event SPRITE_POKE_BALL, 24, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c9a3, EVENT_DRAGONS_DEN_B1F_MAX_ELIXER
