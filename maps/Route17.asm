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
	2writetext UnknownText_0x1ad293
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
	2writetext UnknownText_0x1ad13b
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
	2writetext UnknownText_0x1ad196
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
	2writetext UnknownText_0x1ad225
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
	db $0, "Hey, you! You're", $4f
	db "from JOHTO, huh?", $57
; 0x1ad12a

BikerRileyBeatenText: ; 0x1ad12a
	db $0, "Whoa, you kick!", $57
; 0x1ad13b

UnknownText_0x1ad13b: ; 0x1ad13b
	db $0, "Don't get cocky,", $4f
	db "you JOHTO punk!", $57
; 0x1ad15c

BikerJoelSeenText: ; 0x1ad15c
	db $0, "Wow. That's a cool", $4f
	db "BICYCLE!", $57
; 0x1ad178

BikerJoelBeatenText: ; 0x1ad178
	db $0, "But you don't just", $4f
	db "look cool…", $57
; 0x1ad196

UnknownText_0x1ad196: ; 0x1ad196
	db $0, "I look cool, but", $4f
	db "I'm weak, so I'm", $55
	db "not really cool.", $51
	db "I have to train", $4f
	db "harder…", $57
; 0x1ad1e0

BikerGlennSeenText: ; 0x1ad1e0
	db $0, "Hey! Want to have", $4f
	db "a speed battle?", $57
; 0x1ad203

BikerGlennBeatenText: ; 0x1ad203
	db $0, "Yikes! You've got", $4f
	db "awesome torque!", $57
; 0x1ad225

UnknownText_0x1ad225: ; 0x1ad225
	db $0, "Hands-free riding", $4f
	db "is considered cool", $55
	db "on CYCLING ROAD.", $57
; 0x1ad25c

BikerCharlesSeenText: ; 0x1ad25c
	db $0, "We're fearless", $4f
	db "highway stars!", $57
; 0x1ad27a

BikerCharlesBeatenText: ; 0x1ad27a
	db $0, "Arrrgh! Crash and", $4f
	db "burn!", $57
; 0x1ad293

UnknownText_0x1ad293: ; 0x1ad293
	db $0, "Reckless driving", $4f
	db "causes accidents!", $55
	db "Take it easy!", $57
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

