Route6_MapScriptHeader: ; 0x1ad927
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ad929

TrainerPokefanmRex: ; 0x1ad929
	; bit/flag number
	dw $5c7

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
; 0x1ad935

PokefanmRexScript: ; 0x1ad935
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad9ff
	closetext
	loadmovesprites
	end
; 0x1ad93d

TrainerPokefanmAllan: ; 0x1ad93d
	; bit/flag number
	dw $5c8

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
; 0x1ad949

PokefanmAllanScript: ; 0x1ad949
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ada88
	closetext
	loadmovesprites
	end
; 0x1ad951

PokefanMScript_0x1ad951: ; 0x1ad951
	jumptextfaceplayer UnknownText_0x1ad957
; 0x1ad954

MapRoute6Signpost0Script: ; 0x1ad954
	jumptext UnknownText_0x1ad99b
; 0x1ad957

UnknownText_0x1ad957: ; 0x1ad957
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done
; 0x1ad99b

UnknownText_0x1ad99b: ; 0x1ad99b
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done
; 0x1ad9cc

PokefanmRexSeenText: ; 0x1ad9cc
	text "My PHANPY is the"
	line "cutest in the"
	cont "world."
	done
; 0x1ad9f3

PokefanmRexBeatenText: ; 0x1ad9f3
	text "My PHANPY!"
	done
; 0x1ad9ff

UnknownText_0x1ad9ff: ; 0x1ad9ff
	text "Look how adorable"
	line "my PHANPY acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done
; 0x1ada4f

PokefanmAllanSeenText: ; 0x1ada4f
	text "My TEDDIURSA is"
	line "the cutest in the"
	cont "world."
	done
; 0x1ada79

PokefanmAllanBeatenText: ; 0x1ada79
	text "My TEDDIURSA!"
	done
; 0x1ada88

UnknownText_0x1ada88: ; 0x1ada88
	text "Look how adorable"
	line "my TEDDIURSA acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done
; 0x1adadb

Route6_MapEventHeader: ; 0x1adadb
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
; 0x1adb17
