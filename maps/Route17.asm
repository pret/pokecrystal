const_value set 2
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4

Route17_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_NEWMAP, UnknownScript_0x1ad0ab

UnknownScript_0x1ad0ab:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	return

TrainerBikerCharles:
	trainer EVENT_BEAT_BIKER_CHARLES, BIKER, CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, BikerCharlesScript

BikerCharlesScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ad293
	waitbutton
	closetext
	end

TrainerBikerRiley:
	trainer EVENT_BEAT_BIKER_RILEY, BIKER, RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, BikerRileyScript

BikerRileyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ad13b
	waitbutton
	closetext
	end

TrainerBikerJoel:
	trainer EVENT_BEAT_BIKER_JOEL, BIKER, JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, BikerJoelScript

BikerJoelScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ad196
	waitbutton
	closetext
	end

TrainerBikerGlenn:
	trainer EVENT_BEAT_BIKER_GLENN, BIKER, GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, BikerGlennScript

BikerGlennScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ad225
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

UnknownText_0x1ad13b:
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

UnknownText_0x1ad196:
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

UnknownText_0x1ad225:
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

UnknownText_0x1ad293:
	text "Reckless driving"
	line "causes accidents!"
	cont "Take it easy!"
	done

Route17_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $52, $11, 1, ROUTE_17_18_GATE
	warp_def $53, $11, 2, ROUTE_17_18_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 54, 9, SIGNPOST_ITEM, Route17HiddenMaxEther
	signpost 77, 8, SIGNPOST_ITEM, Route17HiddenMaxElixer

.PersonEvents:
	db 4
	person_event SPRITE_BIKER, 17, 4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 4, TrainerBikerRiley, -1
	person_event SPRITE_BIKER, 68, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerBikerJoel, -1
	person_event SPRITE_BIKER, 53, 3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerBikerGlenn, -1
	person_event SPRITE_BIKER, 80, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 4, TrainerBikerCharles, -1
