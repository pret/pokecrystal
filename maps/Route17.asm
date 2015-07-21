Route17_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1ad0ab

UnknownScript_0x1ad0ab:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	return

TrainerBikerCharles:
	trainer EVENT_BEAT_BIKER_CHARLES, BIKER, CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, $0000, BikerCharlesScript

BikerCharlesScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad293
	closetext
	loadmovesprites
	end

TrainerBikerRiley:
	trainer EVENT_BEAT_BIKER_RILEY, BIKER, RILEY, BikerRileySeenText, BikerRileyBeatenText, $0000, BikerRileyScript

BikerRileyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad13b
	closetext
	loadmovesprites
	end

TrainerBikerJoel:
	trainer EVENT_BEAT_BIKER_JOEL, BIKER, JOEL, BikerJoelSeenText, BikerJoelBeatenText, $0000, BikerJoelScript

BikerJoelScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad196
	closetext
	loadmovesprites
	end

TrainerBikerGlenn:
	trainer EVENT_BEAT_BIKER_GLENN, BIKER, GLENN, BikerGlennSeenText, BikerGlennBeatenText, $0000, BikerGlennScript

BikerGlennScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad225
	closetext
	loadmovesprites
	end

MapRoute17SignpostItem0:
	dwb EVENT_ROUTE_17_HIDDEN_MAX_ETHER, MAX_ETHER
	

MapRoute17SignpostItem1:
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
	warp_def $52, $11, 1, GROUP_ROUTE_17_18_GATE, MAP_ROUTE_17_18_GATE
	warp_def $53, $11, 2, GROUP_ROUTE_17_18_GATE, MAP_ROUTE_17_18_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 54, 9, SIGNPOST_ITEM, MapRoute17SignpostItem0
	signpost 77, 8, SIGNPOST_ITEM, MapRoute17SignpostItem1

.PersonEvents:
	db 4
	person_event SPRITE_BIKER, 21, 8, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 4, TrainerBikerRiley, -1
	person_event SPRITE_BIKER, 72, 13, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 1, TrainerBikerJoel, -1
	person_event SPRITE_BIKER, 57, 7, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerBikerGlenn, -1
	person_event SPRITE_BIKER, 84, 10, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 4, TrainerBikerCharles, -1
