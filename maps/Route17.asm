const_value set 2
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4

Route17_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_NEWMAP, .AlwaysOnBike

.AlwaysOnBike:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	return

TrainerBikerCharles:
	trainer EVENT_BEAT_BIKER_CHARLES, BIKER, CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerRiley:
	trainer EVENT_BEAT_BIKER_RILEY, BIKER, RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerJoel:
	trainer EVENT_BEAT_BIKER_JOEL, BIKER, JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerGlenn:
	trainer EVENT_BEAT_BIKER_GLENN, BIKER, GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BikerGlennAfterBattleText
	waitbutton
	closetext
	end

Route17HiddenMaxEther:
	dwb EVENT_ROUTE_17_HIDDEN_MAX_ETHER, MAX_ETHER


Route17HiddenMaxElixer:
	dwb EVENT_ROUTE_17_HIDDEN_MAX_ELIXER, MAX_ELIXER


BikerRileySeenText:
	text "Hey, you! You're"
	line "from JOHTO, huh?"
	done

BikerRileyBeatenText:
	text "Whoa, you kick!"
	done

BikerRileyAfterBattleText:
	text "Don't get cocky,"
	line "you JOHTO punk!"
	done

BikerJoelSeenText:
	text "Wow. That's a cool"
	line "BICYCLE!"
	done

BikerJoelBeatenText:
	text "But you don't just"
	line "look cool…"
	done

BikerJoelAfterBattleText:
	text "I look cool, but"
	line "I'm weak, so I'm"
	cont "not really cool."

	para "I have to train"
	line "harder…"
	done

BikerGlennSeenText:
	text "Hey! Want to have"
	line "a speed battle?"
	done

BikerGlennBeatenText:
	text "Yikes! You've got"
	line "awesome torque!"
	done

BikerGlennAfterBattleText:
	text "Hands-free riding"
	line "is considered cool"
	cont "on CYCLING ROAD."
	done

BikerCharlesSeenText:
	text "We're fearless"
	line "highway stars!"
	done

BikerCharlesBeatenText:
	text "Arrrgh! Crash and"
	line "burn!"
	done

BikerCharlesAfterBattleText:
	text "Reckless driving"
	line "causes accidents!"
	cont "Take it easy!"
	done

Route17_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 17, 82, 1, ROUTE_17_ROUTE_18_GATE
	warp_def 17, 83, 2, ROUTE_17_ROUTE_18_GATE

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 9, 54, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event 8, 77, BGEVENT_ITEM, Route17HiddenMaxElixer

.ObjectEvents:
	db 4
	object_event 4, 17, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, -1
	object_event 9, 68, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBikerJoel, -1
	object_event 3, 53, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerGlenn, -1
	object_event 6, 80, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerCharles, -1
