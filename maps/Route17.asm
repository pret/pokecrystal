Route17_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1ad0ab

UnknownScript_0x1ad0ab:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	return

TrainerBikerCharles:
	; bit/flag number
	dw EVENT_BEAT_BIKER_CHARLES

	; trainer group && trainer id
	db BIKER, CHARLES

	; text when seen
	dw BikerCharlesSeenText

	; text when trainer beaten
	dw BikerCharlesBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BikerCharlesScript

BikerCharlesScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad293
	closetext
	loadmovesprites
	end

TrainerBikerRiley:
	; bit/flag number
	dw EVENT_BEAT_BIKER_RILEY

	; trainer group && trainer id
	db BIKER, RILEY

	; text when seen
	dw BikerRileySeenText

	; text when trainer beaten
	dw BikerRileyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BikerRileyScript

BikerRileyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad13b
	closetext
	loadmovesprites
	end

TrainerBikerJoel:
	; bit/flag number
	dw EVENT_BEAT_BIKER_JOEL

	; trainer group && trainer id
	db BIKER, JOEL

	; text when seen
	dw BikerJoelSeenText

	; text when trainer beaten
	dw BikerJoelBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BikerJoelScript

BikerJoelScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad196
	closetext
	loadmovesprites
	end

TrainerBikerGlenn:
	; bit/flag number
	dw EVENT_BEAT_BIKER_GLENN

	; trainer group && trainer id
	db BIKER, GLENN

	; text when seen
	dw BikerGlennSeenText

	; text when trainer beaten
	dw BikerGlennBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BikerGlennScript

BikerGlennScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad225
	closetext
	loadmovesprites
	end

MapRoute17SignpostItem0:
	dw $00f6
	db MAX_ETHER
	

MapRoute17SignpostItem1:
	dw $00f7
	db MAX_ELIXER
	

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

	; warps
	db 2
	warp_def $52, $11, 1, GROUP_ROUTE_17_18_GATE, MAP_ROUTE_17_18_GATE
	warp_def $53, $11, 2, GROUP_ROUTE_17_18_GATE, MAP_ROUTE_17_18_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 54, 9, $7, MapRoute17SignpostItem0
	signpost 77, 8, $7, MapRoute17SignpostItem1

	; people-events
	db 4
	person_event SPRITE_BIKER, 21, 8, $a, $0, 255, 255, $b2, 4, TrainerBikerRiley, $ffff
	person_event SPRITE_BIKER, 72, 13, $6, $0, 255, 255, $b2, 1, TrainerBikerJoel, $ffff
	person_event SPRITE_BIKER, 57, 7, $a, $0, 255, 255, $b2, 3, TrainerBikerGlenn, $ffff
	person_event SPRITE_BIKER, 84, 10, $9, $0, 255, 255, $b2, 4, TrainerBikerCharles, $ffff
