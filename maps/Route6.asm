Route6_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerPokefanmRex:
	; bit/flag number
	dw EVENT_BEAT_POKEFANM_REX

	; trainer group && trainer id
	db POKEFANM, REX

	; text when seen
	dw PokefanmRexSeenText

	; text when trainer beaten
	dw PokefanmRexBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmRexScript

PokefanmRexScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad9ff
	closetext
	loadmovesprites
	end

TrainerPokefanmAllan:
	; bit/flag number
	dw EVENT_BEAT_POKEFANM_ALLAN

	; trainer group && trainer id
	db POKEFANM, ALLAN

	; text when seen
	dw PokefanmAllanSeenText

	; text when trainer beaten
	dw PokefanmAllanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmAllanScript

PokefanmAllanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ada88
	closetext
	loadmovesprites
	end

PokefanMScript_0x1ad951:
	jumptextfaceplayer UnknownText_0x1ad957

MapRoute6Signpost0Script:
	jumptext UnknownText_0x1ad99b

UnknownText_0x1ad957:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done

UnknownText_0x1ad99b:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

PokefanmRexSeenText:
	text "My PHANPY is the"
	line "cutest in the"
	cont "world."
	done

PokefanmRexBeatenText:
	text "My PHANPY!"
	done

UnknownText_0x1ad9ff:
	text "Look how adorable"
	line "my PHANPY acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done

PokefanmAllanSeenText:
	text "My TEDDIURSA is"
	line "the cutest in the"
	cont "world."
	done

PokefanmAllanBeatenText:
	text "My TEDDIURSA!"
	done

UnknownText_0x1ada88:
	text "Look how adorable"
	line "my TEDDIURSA acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done

Route6_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $11, 1, GROUP_ROUTE_6_UNDERGROUND_ENTRANCE, MAP_ROUTE_6_UNDERGROUND_ENTRANCE
	warp_def $1, $6, 3, GROUP_ROUTE_6_SAFFRON_GATE, MAP_ROUTE_6_SAFFRON_GATE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 5, 19, $0, MapRoute6Signpost0Script

	; people-events
	db 3
	person_event SPRITE_POKEFAN_M, 8, 21, $6, $0, 255, 255, $b0, 2, PokefanMScript_0x1ad951, $0771
	person_event SPRITE_POKEFAN_M, 16, 13, $9, $0, 255, 255, $82, 0, TrainerPokefanmRex, $ffff
	person_event SPRITE_POKEFAN_M, 16, 14, $8, $0, 255, 255, $82, 0, TrainerPokefanmAllan, $ffff
