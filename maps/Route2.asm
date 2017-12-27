const_value set 2
	const ROUTE2_BUG_CATCHER1
	const ROUTE2_BUG_CATCHER2
	const ROUTE2_BUG_CATCHER3
	const ROUTE2_POKE_BALL1
	const ROUTE2_POKE_BALL2
	const ROUTE2_POKE_BALL3
	const ROUTE2_POKE_BALL4
	const ROUTE2_FRUIT_TREE

Route2_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TrainerBugCatcherRob:
	trainer EVENT_BEAT_BUG_CATCHER_ROB, BUG_CATCHER, ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BugCatcherRobAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherEd:
	trainer EVENT_BEAT_BUG_CATCHER_ED, BUG_CATCHER, ED, BugCatcherEdSeenText, BugCatcherEdBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BugCatcherEdAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDoug:
	trainer EVENT_BEAT_BUG_CATCHER_DOUG, BUG_CATCHER, DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BugCatcherDougAfterBattleText
	waitbutton
	closetext
	end

Route2Sign:
	jumptext Route2SignText

MapRoute2Signpost1Script:
	jumptext UnknownText_0x1ac49f

Route2DireHit:
	itemball DIRE_HIT

Route2MaxPotion:
	itemball MAX_POTION

Route2Carbos:
	itemball CARBOS

Route2Elixer:
	itemball ELIXER

FruitTreeScript_0x1ac306:
	fruittree FRUITTREE_ROUTE_2

Route2HiddenMaxEther:
	dwb EVENT_ROUTE_2_HIDDEN_MAX_ETHER, MAX_ETHER

Route2HiddenFullHeal:
	dwb EVENT_ROUTE_2_HIDDEN_FULL_HEAL, FULL_HEAL

Route2HiddenFullRestore:
	dwb EVENT_ROUTE_2_HIDDEN_FULL_RESTORE, FULL_RESTORE

Route2HiddenRevive:
	dwb EVENT_ROUTE_2_HIDDEN_REVIVE, REVIVE

BugCatcherRobSeenText:
	text "My bug #MON are"
	line "tough. Prepare to"
	cont "lose!"
	done

BugCatcherRobBeatenText:
	text "I was whipped…"
	done

BugCatcherRobAfterBattleText:
	text "I'm going to look"
	line "for stronger bug"
	cont "#MON."
	done

BugCatcherEdSeenText:
	text "If you walk in"
	line "tall grass wearing"

	para "shorts, do you get"
	line "nicks and cuts?"
	done

BugCatcherEdBeatenText:
	text "Ouch, ouch, ouch!"
	done

BugCatcherEdAfterBattleText:
	text "They'll really"
	line "sting when you"
	cont "take a bath."
	done

BugCatcherDougSeenText:
	text "Why don't girls"
	line "like bug #MON?"
	done

BugCatcherDougBeatenText:
	text "No good!"
	done

BugCatcherDougAfterBattleText:
	text "Bug #MON squish"
	line "like plush toys"

	para "when you squeeze"
	line "their bellies."

	para "I love how they"
	line "feel!"
	done

Route2SignText:
	text "ROUTE 2"

	para "VIRIDIAN CITY -"
	line "PEWTER CITY"
	done

UnknownText_0x1ac49f:
	text "DIGLETT'S CAVE"
	done

Route2_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $f, $f, 1, ROUTE_2_NUGGET_SPEECH_HOUSE
	warp_def $1f, $f, 3, ROUTE_2_GATE
	warp_def $1b, $10, 1, ROUTE_2_GATE
	warp_def $1b, $11, 2, ROUTE_2_GATE
	warp_def $7, $c, 3, DIGLETTS_CAVE

.CoordEvents:
	db 0

.BGEvents:
	db 6
	bg_event 51, 7, BGEVENT_READ, Route2Sign
	bg_event 9, 11, BGEVENT_READ, MapRoute2Signpost1Script
	bg_event 23, 7, BGEVENT_ITEM, Route2HiddenMaxEther
	bg_event 14, 4, BGEVENT_ITEM, Route2HiddenFullHeal
	bg_event 27, 4, BGEVENT_ITEM, Route2HiddenFullRestore
	bg_event 30, 11, BGEVENT_ITEM, Route2HiddenRevive

.ObjectEvents:
	db 8
	object_event SPRITE_BUG_CATCHER, 45, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherRob, -1
	object_event SPRITE_BUG_CATCHER, 4, 6, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherEd, -1
	object_event SPRITE_BUG_CATCHER, 40, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDoug, -1
	object_event SPRITE_POKE_BALL, 29, 0, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2DireHit, EVENT_ROUTE_2_DIRE_HIT
	object_event SPRITE_POKE_BALL, 23, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2MaxPotion, EVENT_ROUTE_2_MAX_POTION
	object_event SPRITE_POKE_BALL, 2, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Carbos, EVENT_ROUTE_2_CARBOS
	object_event SPRITE_POKE_BALL, 50, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Elixer, EVENT_ROUTE_2_ELIXER
	object_event SPRITE_FRUIT_TREE, 14, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FruitTreeScript_0x1ac306, -1
