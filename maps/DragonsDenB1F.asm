	object_const_def
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_CLAIR
	const DRAGONSDENB1F_RIVAL
	const DRAGONSDENB1F_COOLTRAINER_M
	const DRAGONSDENB1F_COOLTRAINER_F
	const DRAGONSDENB1F_TWIN1
	const DRAGONSDENB1F_TWIN2
	const DRAGONSDENB1F_POKE_BALL2
	const DRAGONSDENB1F_POKE_BALL3

DragonsDenB1F_MapScripts:
	def_scene_scripts
	scene_script DragonsDenB1FNoop1Scene, SCENE_DRAGONSDENB1F_NOOP
	scene_script DragonsDenB1FNoop2Scene, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	def_callbacks
	callback MAPCALLBACK_NEWMAP, DragonsDenB1FCheckRivalCallback

DragonsDenB1FNoop1Scene:
	end

DragonsDenB1FNoop2Scene:
	end

DragonsDenB1FCheckRivalCallback:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .CheckDay
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.CheckDay:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .AppearRival
	ifequal THURSDAY, .AppearRival
	disappear DRAGONSDENB1F_RIVAL
	endcallback

.AppearRival:
	appear DRAGONSDENB1F_RIVAL
	endcallback

DragonsDenB1F_ClairScene:
; BUG: Clair can give TM24 Dragonbreath twice (see docs/bugs_and_glitches.md)
	appear DRAGONSDENB1F_CLAIR
	opentext
	writetext ClairText_Wait
	pause 30
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	playmusic MUSIC_CLAIR
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksToYou
	opentext
	writetext ClairText_GiveDragonbreathDragonDen
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext Text_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext ClairText_DescribeDragonbreathDragonDen
	promptbutton
	writetext ClairText_WhatsTheMatterDragonDen
	waitbutton
	closetext
	sjump .FinishClair

.BagFull:
	writetext ClairText_NoRoom
	waitbutton
	closetext
.FinishClair:
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksAway
	special FadeOutMusic
	pause 30
	special RestartMapMusic
	disappear DRAGONSDENB1F_CLAIR
	setscene SCENE_DRAGONSDENB1F_NOOP
	end

TrainerCooltrainermDarin:
	trainer COOLTRAINERM, DARIN, EVENT_BEAT_COOLTRAINERM_DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermDarinAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCara:
	trainer COOLTRAINERF, CARA, EVENT_BEAT_COOLTRAINERF_CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCaraAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia1:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia2:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia2AfterBattleText
	waitbutton
	closetext
	end

DragonsDenB1FDragonFangScript:
; This whole script is written out rather than as an itemball
; because it's left over from the GS event.
	giveitem DRAGON_FANG
	iffalse .BagFull
	disappear DRAGONSDENB1F_POKE_BALL1
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

.BagFull:
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	promptbutton
	writetext Text_NoRoomForDragonFang
	waitbutton
	closetext
	end

DragonsDenB1FRivalScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .RivalTalkAgain
	writetext RivalText_Training1
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	special RestartMapMusic
	end

.RivalTalkAgain:
	writetext RivalText_Training2
	waitbutton
	closetext
	special RestartMapMusic
	end

DragonShrineSignpost:
	jumptext DragonShrineSignpostText

DragonsDenB1FCalcium:
	itemball CALCIUM

DragonsDenB1FMaxElixer:
	itemball MAX_ELIXER

DragonsDenB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE

DragonsDenB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER

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
	text "Attends!"
	done

ClairText_GiveDragonbreathDragonDen:
	text "SANDRA: Excuse-moi"
	line "pour tout."

	para "Tiens. Pour me"
	line "faire pardonner."
	done

Text_ReceivedTM24:
	text "<PLAYER> reçoit"
	line "CT24."
	done

ClairText_DescribeDragonbreathDragonDen:
	text "Elle contient"
	line "DRACOSOUFFLE."

	para "Quoi? Non, ça n'a"
	line "rien à voir avec"
	cont "mon haleine."

	para "Ecoute: si tu la"
	line "veux pas, t'as"
	cont "qu'à la laisser."
	done

ClairText_NoRoom:
	text "Oh? Tu n'as plus"
	line "de place."

	para "Je retourne à"
	line "l'ARENE. Fais de"

	para "la place et re-"
	line "viens me voir."
	done

ClairText_WhatsTheMatterDragonDen:
	text "SANDRA: C'est quoi"
	line "ton problème?"

	para "Tu ne vas pas à"
	line "la LIGUE #MON?"

	para "Tu sais comment y"
	line "aller?"

	para "Va jusqu'au"
	line "BOURG GEON."

	para "Puis SURFE vers"
	line "l'est."

	para "Le chemin sera"
	line "dur."

	para "Ne va pas te faire"
	line "battre à la LIGUE"
	cont "#MON!"

	para "Sinon, j'aurais"
	line "l'air de quoi,"
	cont "moi?"

	para "Donne-toi à fond."
	done

DragonShrineSignpostText:
	text "AUTEL DRAGON"

	para "En l'honneur des"
	line "#MON dragons"
	cont "ayant vécu dans"
	cont "l'ANTRE du DRAGON."
	done

RivalText_Training1:
	text "......"
	line "Quoi? <PLAYER>?"

	para "...Non, je ne me"
	line "battrai pas avec"
	cont "toi maintenant..."

	para "Mes #MON ne"
	line "sont pas prêts."

	para "Et je ne veux pas"
	line "les pousser."

	para "Je dois être sage"
	line "pour devenir un"

	para "jour le plus grand"
	line "des dresseurs..."
	done

RivalText_Training2:
	text "......."

	para "Pffouiii..."

	para "Ne croise plus"
	line "jamais ma route..."
	done

CooltrainermDarinSeenText:
	text "Toi! On ne veut"
	line "pas de toi ici!"
	done

CooltrainermDarinBeatenText:
	text "Quelle puissance!"
	done

CooltrainermDarinAfterBattleText:
	text "Le TEMPLE est la"
	line "demeure de notre"

	para "MAITRE, chef du"
	line "clan des dragons."

	para "Tu n'as pas le"
	line "droit d'entrer!"
	done

CooltrainerfCaraSeenText:
	text "Tu ne dois pas"
	line "être ici!"
	done

CooltrainerfCaraBeatenText:
	text "Oups!"
	done

CooltrainerfCaraAfterBattleText:
	text "Je vais bientôt"
	line "avoir l'accord du"

	para "MAITRE pour utili-"
	line "ser des dragons."

	para "Et alors, je pour-"
	line "rai rendre mon"

	para "MAITRE fier en"
	line "devenant un grand"

	para "dresseur."
	done

TwinsLeaandpia1SeenText:
	text "C'est un étranger"
	line "que l'on ne"
	cont "connaît pas."
	done

TwinsLeaandpia1BeatenText:
	text "Ouille."
	done

TwinsLeaandpia1AfterBattleText:
	text "C'est comme com-"
	line "battre PETER."
	done

TwinsLeaandpia2SeenText:
	text "Qui es-tu?"
	done

TwinsLeaandpia2BeatenText:
	text "Pas sympa."
	done

TwinsLeaandpia2AfterBattleText:
	text "On va le dire."

	para "Le MAITRE ne sera"
	line "pas content."
	done

Text_FoundDragonFang:
	text "<PLAYER> trouve:"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Text_NoRoomForDragonFang:
	text "Mais <PLAYER> ne"
	line "peut plus rien"
	cont "porter."
	done

DragonsDenB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20,  3, DRAGONS_DEN_1F, 3
	warp_event 19, 29, DRAGON_SHRINE, 1

	def_coord_events
	coord_event 19, 30, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM, DragonsDenB1F_ClairScene

	def_bg_events
	bg_event 18, 24, BGEVENT_READ, DragonShrineSignpost
	bg_event 33, 29, BGEVENT_ITEM, DragonsDenB1FHiddenRevive
	bg_event 21, 17, BGEVENT_ITEM, DragonsDenB1FHiddenMaxPotion
	bg_event 31, 15, BGEVENT_ITEM, DragonsDenB1FHiddenMaxElixer

	def_object_events
	object_event 35, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FDragonFangScript, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	object_event 14, 30, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	object_event 20, 23, SPRITE_RIVAL, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FRivalScript, EVENT_RIVAL_DRAGONS_DEN
	object_event 20,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermDarin, -1
	object_event  8,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCara, -1
	object_event  4, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia1, -1
	object_event  4, 18, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia2, -1
	object_event 30,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FCalcium, EVENT_DRAGONS_DEN_B1F_CALCIUM
	object_event  5, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FMaxElixer, EVENT_DRAGONS_DEN_B1F_MAX_ELIXER
