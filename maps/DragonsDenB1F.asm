const_value set 2
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_CLAIR
	const DRAGONSDENB1F_SILVER
	const DRAGONSDENB1F_COOLTRAINER_M
	const DRAGONSDENB1F_COOLTRAINER_F
	const DRAGONSDENB1F_TWIN1
	const DRAGONSDENB1F_TWIN2
	const DRAGONSDENB1F_POKE_BALL2
	const DRAGONSDENB1F_POKE_BALL3

DragonsDenB1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_NEWMAP, .CheckSilver

.Trigger0:
	end

.Trigger1:
	end

.CheckSilver:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .CheckDay
	disappear DRAGONSDENB1F_SILVER
	return

.CheckDay:
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, .AppearSilver
	if_equal THURSDAY, .AppearSilver
	disappear DRAGONSDENB1F_SILVER
	return

.AppearSilver:
	appear DRAGONSDENB1F_SILVER
	return

DragonsDenB1F_ClairTrigger:
	appear DRAGONSDENB1F_CLAIR
	opentext
	writetext ClairText_Wait
	pause 30
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	spriteface PLAYER, LEFT
	playmusic MUSIC_CLAIR
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksToYou
	opentext
	writetext ClairText_GiveDragonbreathDragonDen
	buttonsound
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	itemtotext TM_DRAGONBREATH, $0
	writetext NotifyReceiveDragonbreath
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext ClairText_DescribeDragonbreathDragonDen
	buttonsound
	writetext ClairText_WhatsTheMatterDragonDen
	waitbutton
	closetext
	jump .FinishClair

.BagFull:
	writetext ClairText_NoRoom
	waitbutton
	closetext
.FinishClair:
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksAway
	special Special_FadeOutMusic
	pause 30
	special RestartMapMusic
	disappear DRAGONSDENB1F_CLAIR
	dotrigger $0
	end

TrainerCooltrainermDarin:
	trainer EVENT_BEAT_COOLTRAINERM_DARIN, COOLTRAINERM, DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, 0, CooltrainermDarinScript

CooltrainermDarinScript:
	end_if_just_battled
	opentext
	writetext CooltrainermDarinAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfCara:
	trainer EVENT_BEAT_COOLTRAINERF_CARA, COOLTRAINERF, CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, 0, CooltrainerfCaraScript

CooltrainerfCaraScript:
	end_if_just_battled
	opentext
	writetext CooltrainerfCaraAfterText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia1:
	trainer EVENT_BEAT_TWINS_LEA_AND_PIA, TWINS, LEAANDPIA1, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, 0, TwinsLeaandpia1Script

TwinsLeaandpia1Script:
	end_if_just_battled
	opentext
	writetext TrinsLeaandpia1AfterText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia2:
	trainer EVENT_BEAT_TWINS_LEA_AND_PIA, TWINS, LEAANDPIA1, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, 0, TwinsLeaandpia2Script

TwinsLeaandpia2Script:
	end_if_just_battled
	opentext
	writetext TrinsLeaandpia2AfterText
	waitbutton
	closetext
	end

PokeBallScript_0x18c95a:
; This whole script is written out rather than as an
; item fragment because it's left over from the GS
; event.
	giveitem DRAGON_FANG
	iffalse .BagFull
	disappear DRAGONSDENB1F_POKE_BALL1
	opentext
	itemtotext DRAGON_FANG, $0
	writetext Text_FoundDragonFang
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

.BagFull:
	opentext
	itemtotext DRAGON_FANG, $0
	writetext Text_FoundDragonFang
	buttonsound
	writetext Text_NoRoomForDragonFang
	waitbutton
	closetext
	end

SilverScript_0x18c97e:
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue .SilverTalkAgain
	writetext SilverText_Training1
	waitbutton
	closetext
	setevent EVENT_GAVE_KURT_APRICORNS
	special RestartMapMusic
	end

.SilverTalkAgain:
	writetext SilverText_Training2
	waitbutton
	closetext
	special RestartMapMusic
	end

MapDragonsDenB1FSignpost0Script:
	jumptext DragonShrineSignpostText

DragonsDenB1FCalcium:
	itemball CALCIUM

DragonsDenB1FMaxElixer:
	itemball MAX_ELIXER

DragonsDenB1FHiddenRevive:
	dwb EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE, REVIVE

DragonsDenB1FHiddenMaxPotion:
	dwb EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION, MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	dwb EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER, MAX_ELIXER

MovementDragonsDen_ClairWalksToYou:
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementDragonsDen_ClairWalksAway:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	step_end

ClairText_Wait:
	text "Wait!"
	done

ClairText_GiveDragonbreathDragonDen:
	text "CLAIR: I'm sorry"
	line "about this."

	para "Here, take this as"
	line "my apology."
	done

NotifyReceiveDragonbreath:
	text "<PLAYER> received"
	line "TM24."
	done

ClairText_DescribeDragonbreathDragonDen:
	text "That contains"
	line "DRAGONBREATH."

	para "No, it doesn't"
	line "have anything to"
	cont "do with my breath."

	para "If you don't want"
	line "it, you don't have"
	cont "to take it."
	done

ClairText_NoRoom:
	text "Oh? You don't have"
	line "any room for this."

	para "I'm going back to"
	line "the GYM, so make"

	para "room, then come"
	line "see me there."
	done

ClairText_WhatsTheMatterDragonDen:
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

DragonShrineSignpostText:
	text "DRAGON SHRINE"

	para "A shrine honoring"
	line "the dragon #MON"

	para "said to have lived"
	line "in DRAGON'S DEN."
	done

SilverText_Training1:
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

SilverText_Training2:
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

CooltrainermDarinAfterText:
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

CooltrainerfCaraAfterText:
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

TrinsLeaandpia1AfterText:
	text "It was like having"
	line "to battle LANCE."
	done

TwinsLeaandpia2SeenText:
	text "Who are you?"
	done

TwinsLeaandpia2BeatenText:
	text "Meanie."
	done

TrinsLeaandpia2AfterText:
	text "We'll tell on you."

	para "MASTER will be"
	line "angry with you."
	done

Text_FoundDragonFang:
	text "<PLAYER> found"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

Text_NoRoomForDragonFang:
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

DragonsDenB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $14, 3, DRAGONS_DEN_1F
	warp_def $1d, $13, 1, DRAGON_SHRINE

.XYTriggers:
	db 1
	xy_trigger 1, $1e, $13, $0, DragonsDenB1F_ClairTrigger, $0, $0

.Signposts:
	db 4
	signpost 24, 18, SIGNPOST_READ, MapDragonsDenB1FSignpost0Script
	signpost 29, 33, SIGNPOST_ITEM, DragonsDenB1FHiddenRevive
	signpost 17, 21, SIGNPOST_ITEM, DragonsDenB1FHiddenMaxPotion
	signpost 15, 31, SIGNPOST_ITEM, DragonsDenB1FHiddenMaxElixer

.PersonEvents:
	db 9
	person_event SPRITE_POKE_BALL, 16, 35, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokeBallScript_0x18c95a, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	person_event SPRITE_CLAIR, 30, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	person_event SPRITE_SILVER, 23, 20, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SilverScript_0x18c97e, EVENT_RIVAL_DRAGONS_DEN
	person_event SPRITE_COOLTRAINER_M, 8, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerCooltrainermDarin, -1
	person_event SPRITE_COOLTRAINER_F, 8, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerCooltrainerfCara, -1
	person_event SPRITE_TWIN, 17, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsLeaandpia1, -1
	person_event SPRITE_TWIN, 18, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerTwinsLeaandpia2, -1
	person_event SPRITE_POKE_BALL, 4, 30, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, DragonsDenB1FCalcium, EVENT_DRAGONS_DEN_B1F_CALCIUM
	person_event SPRITE_POKE_BALL, 20, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, DragonsDenB1FMaxElixer, EVENT_DRAGONS_DEN_B1F_MAX_ELIXER
