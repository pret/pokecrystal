	object_const_def
	const ROUTE37_WEIRD_TREE1
	const ROUTE37_WEIRD_TREE2
	const ROUTE37_YOUNGSTER
	const ROUTE37_FRUIT_TREE1
	const ROUTE37_SUNNY
	const ROUTE37_FRUIT_TREE2
	const ROUTE37_FRUIT_TREE3

Route37_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route37SunnyCallback

Route37SunnyCallback:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	endcallback

.SunnyAppears:
	appear ROUTE37_SUNNY
	endcallback

TrainerTwinsAnnandanne1:
	trainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne1SeenText, TwinsAnnandanne1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAnnandanne2:
	trainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne2SeenText, TwinsAnnandanne2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicGreg:
	trainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGregAfterBattleText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	promptbutton
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	promptbutton
	sjump .next
.Kris:
	writetext SunnyGivesGiftText2
	promptbutton
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

Route37Sign:
	jumptext Route37SignText

Route37FruitTree1:
	fruittree FRUITTREE_ROUTE_37_1

Route37FruitTree2:
	fruittree FRUITTREE_ROUTE_37_2

Route37FruitTree3:
	fruittree FRUITTREE_ROUTE_37_3

Route37HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

TwinsAnnandanne1SeenText:
	text "TEA: LEA et moi"
	line "sommes insépara-"
	cont "bles!"
	done

TwinsAnnandanne1BeatenText:
	text "TEA&LEA: ..."
	line "Pas possible."
	done

TwinsAnnandanne1AfterBattleText:
	text "TEA: Je pense"
	line "comme ma soeur et"

	para "comme mes #MON."
	done

TwinsAnnandanne2SeenText:
	text "LEA: TEA et moi"
	line "sommes insépara-"
	cont "bles!"
	done

TwinsAnnandanne2BeatenText:
	text "TEA&LEA: ..."
	line "Pas possible."
	done

TwinsAnnandanne2AfterBattleText:
	text "LEA: Nous ressen-"
	line "tons les mêmes"
	cont "choses que nos"
	cont "#MON."
	done

PsychicGregSeenText:
	text "Les #MON ne"
	line "peuvent rien faire"
	cont "s'ils dorment."

	para "Tu vas voir quel"
	line "effet ça fait!"
	done

PsychicGregBeatenText:
	text "Perdu. C'est"
	line "pas cool, ça..."
	done

PsychicGregAfterBattleText:
	text "Endormir ou para-"
	line "lyser les #MON"
	cont "est super utile"
	cont "en combat."
	done

MeetSunnyText:
	text "DIMITRI: Salut!"

	para "Moi c'est DIMITRI"
	line "du dimanche. Et on"
	cont "est dimanche!"
	done

SunnyGivesGiftText1:
	text "On m'a dit de te"
	line "donner ça!"
	done

SunnyGivesGiftText2:
	text "On m'a dit de te"
	line "donner ça!"
	done

SunnyGaveGiftText:
	text "DIMITRI: Ca..."

	para "Heu..."

	para "...C'est..."

	para "..."

	para "Oh! Je me "
	line "souviens!"

	para "C'est pour un"
	line "#MON à capaci-"
	cont "tés électriques."

	para "Ma soeur LUCIE"
	line "dit que ça les"
	cont "améliore!"
	done

SunnySundayText:
	text "DIMITRI: Mes frè-"
	line "res et soeurs sont"
	cont "LUCIE, MARIE,"
	cont "HOMER, JEROME,"
	cont "VANESSA et SAMUEL."

	para "Ils sont tous plus"
	line "vieux que moi!"
	done

SunnyNotSundayText:
	text "DIMITRI: On est"
	line "pas dimanche?"
	cont "Heu! Je sais plus!"
	done

Route37SignText:
	text "ROUTE 37"
	done

Route37_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  5,  3, BGEVENT_READ, Route37Sign
	bg_event  4,  2, BGEVENT_ITEM, Route37HiddenEther

	def_object_events
	object_event  6, 12, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne1, -1
	object_event  7, 12, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne2, -1
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicGreg, -1
	object_event 13,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree1, -1
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event 16,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree2, -1
	object_event 15,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route37FruitTree3, -1
