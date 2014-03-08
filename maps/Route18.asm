Route18_MapScriptHeader: ; 0x1acf2f
	; trigger count
	db 0

	; callback count
	db 0
; 0x1acf31

TrainerBird_keeperBoris: ; 0x1acf31
	; bit/flag number
	dw $404

	; trainer group && trainer id
	db BIRD_KEEPER, BORIS

	; text when seen
	dw Bird_keeperBorisSeenText

	; text when trainer beaten
	dw Bird_keeperBorisBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperBorisScript
; 0x1acf3d

Bird_keeperBorisScript: ; 0x1acf3d
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1acfa5
	closetext
	loadmovesprites
	end
; 0x1acf45

TrainerBird_keeperBob: ; 0x1acf45
	; bit/flag number
	dw $405

	; trainer group && trainer id
	db BIRD_KEEPER, BOB

	; text when seen
	dw Bird_keeperBobSeenText

	; text when trainer beaten
	dw Bird_keeperBobBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperBobScript
; 0x1acf51

Bird_keeperBobScript: ; 0x1acf51
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ad00d
	closetext
	loadmovesprites
	end
; 0x1acf59

MapRoute18Signpost0Script: ; 0x1acf59
	jumptext UnknownText_0x1ad051
; 0x1acf5c

Bird_keeperBorisSeenText: ; 0x1acf5c
	text "If you're looking"
	line "for #MON, you"

	para "have to look in"
	line "the tall grass."
	done
; 0x1acf9c

Bird_keeperBorisBeatenText: ; 0x1acf9c
	text "Ayieee!"
	done
; 0x1acfa5

UnknownText_0x1acfa5: ; 0x1acfa5
	text "Since you're so"
	line "strong, it must be"
	cont "fun to battle."
	done
; 0x1acfd7

Bird_keeperBobSeenText: ; 0x1acfd7
	text "CYCLING ROAD is a"
	line "quick shortcut to"
	cont "CELADON."
	done
; 0x1ad005

Bird_keeperBobBeatenText: ; 0x1ad005
	text "…Whew!"
	done
; 0x1ad00d

UnknownText_0x1ad00d: ; 0x1ad00d
	text "If you don't have"
	line "a BICYCLE, you're"

	para "not allowed to use"
	line "the shortcut."
	done
; 0x1ad051

UnknownText_0x1ad051: ; 0x1ad051
	text "ROUTE 18"

	para "CELADON CITY -"
	line "FUCHSIA CITY"
	done
; 0x1ad077

Route18_MapEventHeader: ; 0x1ad077
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $6, $2, 3, GROUP_ROUTE_17_18_GATE, MAP_ROUTE_17_18_GATE
	warp_def $7, $2, 4, GROUP_ROUTE_17_18_GATE, MAP_ROUTE_17_18_GATE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 5, 9, $0, MapRoute18Signpost0Script

	; people-events
	db 2
	person_event SPRITE_YOUNGSTER, 16, 13, $a, $0, 255, 255, $92, 3, TrainerBird_keeperBoris, $ffff
	person_event SPRITE_YOUNGSTER, 10, 17, $6, $0, 255, 255, $92, 3, TrainerBird_keeperBob, $ffff
; 0x1ad0a6

