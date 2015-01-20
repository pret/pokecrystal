Route17_MapScriptHeader: ; 0x1ad0a6
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1ad0ab
; 0x1ad0ab

UnknownScript_0x1ad0ab: ; 0x1ad0ab
	setflag $0019
	setflag $001a
	return
; 0x1ad0b2

TrainerBikerCharles: ; 0x1ad0b2
	; bit/flag number
	dw $436

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
; 0x1ad0be

BikerCharlesScript: ; 0x1ad0be
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad293
	closetext
	loadmovesprites
	end
; 0x1ad0c6

TrainerBikerRiley: ; 0x1ad0c6
	; bit/flag number
	dw $437

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
; 0x1ad0d2

BikerRileyScript: ; 0x1ad0d2
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad13b
	closetext
	loadmovesprites
	end
; 0x1ad0da

TrainerBikerJoel: ; 0x1ad0da
	; bit/flag number
	dw $438

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
; 0x1ad0e6

BikerJoelScript: ; 0x1ad0e6
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad196
	closetext
	loadmovesprites
	end
; 0x1ad0ee

TrainerBikerGlenn: ; 0x1ad0ee
	; bit/flag number
	dw $439

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
; 0x1ad0fa

BikerGlennScript: ; 0x1ad0fa
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad225
	closetext
	loadmovesprites
	end
; 0x1ad102

MapRoute17SignpostItem0: ; 0x1ad102
	dw $00f6
	db MAX_ETHER
	
; 0x1ad105

MapRoute17SignpostItem1: ; 0x1ad105
	dw $00f7
	db MAX_ELIXER
	
; 0x1ad108

BikerRileySeenText: ; 0x1ad108
	text "Hey, you! You're"
	line "from JOHTO, huh?"
	done
; 0x1ad12a

BikerRileyBeatenText: ; 0x1ad12a
	text "Whoa, you kick!"
	done
; 0x1ad13b

UnknownText_0x1ad13b: ; 0x1ad13b
	text "Don't get cocky,"
	line "you JOHTO punk!"
	done
; 0x1ad15c

BikerJoelSeenText: ; 0x1ad15c
	text "Wow. That's a cool"
	line "BICYCLE!"
	done
; 0x1ad178

BikerJoelBeatenText: ; 0x1ad178
	text "But you don't just"
	line "look cool…"
	done
; 0x1ad196

UnknownText_0x1ad196: ; 0x1ad196
	text "I look cool, but"
	line "I'm weak, so I'm"
	cont "not really cool."

	para "I have to train"
	line "harder…"
	done
; 0x1ad1e0

BikerGlennSeenText: ; 0x1ad1e0
	text "Hey! Want to have"
	line "a speed battle?"
	done
; 0x1ad203

BikerGlennBeatenText: ; 0x1ad203
	text "Yikes! You've got"
	line "awesome torque!"
	done
; 0x1ad225

UnknownText_0x1ad225: ; 0x1ad225
	text "Hands-free riding"
	line "is considered cool"
	cont "on CYCLING ROAD."
	done
; 0x1ad25c

BikerCharlesSeenText: ; 0x1ad25c
	text "We're fearless"
	line "highway stars!"
	done
; 0x1ad27a

BikerCharlesBeatenText: ; 0x1ad27a
	text "Arrrgh! Crash and"
	line "burn!"
	done
; 0x1ad293

UnknownText_0x1ad293: ; 0x1ad293
	text "Reckless driving"
	line "causes accidents!"
	cont "Take it easy!"
	done
; 0x1ad2c5

Route17_MapEventHeader: ; 0x1ad2c5
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
; 0x1ad313

