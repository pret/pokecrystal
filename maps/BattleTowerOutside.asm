const_value set 2
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BUENA
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks
	dbw MAPCALLBACK_TILES, .Callback1
	dbw MAPCALLBACK_OBJECTS, .Callback2

.Callback1:
	return

.Callback2:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBuenaScript:
	jumptextfaceplayer BattleTowerOutsideBuenaText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

MapBattleTowerOutsideSignpost0Script:
	jumptext BattleTowerOutsideText_UltimateChallenge

BattleTowerOutsideYoungsterText:
	text "Wow, the BATTLE"
	line "TOWER is huge!"

	para "There must be many"
	line "kinds of #MON"
	cont "in there!"
	done

BattleTowerOutsideBuenaText:
	text "You can use only"
	line "three #MON."

	para "It's so hard to"
	line "decide which three"

	para "should go into"
	line "battle…"
	done

BattleTowerOutsideSailorText:
	text "Hehehe, I snuck"
	line "out from work."

	para "I can't bail out"
	line "until I've won!"

	para "I have to win it"
	line "all. That I must!"
	done

BattleTowerOutsideText_UltimateChallenge:
	text "BATTLE TOWER"

	para "Take the Ultimate"
	line "Trainer Challenge!"
	done

BattleTowerOutside_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $15, $8, 3, ROUTE_40_BATTLE_TOWER_GATE
	warp_def $15, $9, 4, ROUTE_40_BATTLE_TOWER_GATE
	warp_def $9, $8, 1, BATTLE_TOWER_1F
	warp_def $9, $9, 2, BATTLE_TOWER_1F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 10, 10, SIGNPOST_READ, MapBattleTowerOutsideSignpost0Script

.PersonEvents:
	db 4
	person_event SPRITE_STANDING_YOUNGSTER, 12, 6, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	person_event SPRITE_BUENA, 11, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BattleTowerOutsideBuenaScript, -1
	person_event SPRITE_SAILOR, 18, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	person_event SPRITE_LASS, 24, 12, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
