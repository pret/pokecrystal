Route18_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerBird_keeperBoris:
	; bit/flag number
	dw EVENT_BEAT_BIRD_KEEPER_BORIS

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

Bird_keeperBorisScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1acfa5
	closetext
	loadmovesprites
	end

TrainerBird_keeperBob:
	; bit/flag number
	dw EVENT_BEAT_BIRD_KEEPER_BOB

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

Bird_keeperBobScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad00d
	closetext
	loadmovesprites
	end

MapRoute18Signpost0Script:
	jumptext UnknownText_0x1ad051

Bird_keeperBorisSeenText:
	text "If you're looking"
	line "for #MON, you"

	para "have to look in"
	line "the tall grass."
	done

Bird_keeperBorisBeatenText:
	text "Ayieee!"
	done

UnknownText_0x1acfa5:
	text "Since you're so"
	line "strong, it must be"
	cont "fun to battle."
	done

Bird_keeperBobSeenText:
	text "CYCLING ROAD is a"
	line "quick shortcut to"
	cont "CELADON."
	done

Bird_keeperBobBeatenText:
	text "…Whew!"
	done

UnknownText_0x1ad00d:
	text "If you don't have"
	line "a BICYCLE, you're"

	para "not allowed to use"
	line "the shortcut."
	done

UnknownText_0x1ad051:
	text "ROUTE 18"

	para "CELADON CITY -"
	line "FUCHSIA CITY"
	done

Route18_MapEventHeader:
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
	person_event SPRITE_YOUNGSTER, 16, 13, $a, $0, 255, 255, $92, 3, TrainerBird_keeperBoris, EVENT_ALWAYS_THERE
	person_event SPRITE_YOUNGSTER, 10, 17, $6, $0, 255, 255, $92, 3, TrainerBird_keeperBob, EVENT_ALWAYS_THERE
