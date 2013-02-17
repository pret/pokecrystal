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
	2writetext UnknownText_0x1ad9ff
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
	2writetext UnknownText_0x1ada88
	closetext
	loadmovesprites
	end
; 0x1ad951

UnknownScript_0x1ad951: ; 0x1ad951
	jumptextfaceplayer UnknownText_0x1ad957
; 0x1ad954

MapRoute6Signpost0Script: ; 0x1ad954
	jumptext UnknownText_0x1ad99b
; 0x1ad957

UnknownText_0x1ad957: ; 0x1ad957
	db $0, "The road is closed", $4f
	db "until the problem", $51
	db "at the POWER PLANT", $4f
	db "is solved.", $57
; 0x1ad99b

UnknownText_0x1ad99b: ; 0x1ad99b
	db $0, "UNDERGROUND PATH", $51
	db "CERULEAN CITY -", $4f
	db "VERMILION CITY", $57
; 0x1ad9cc

PokefanmRexSeenText: ; 0x1ad9cc
	db $0, "My PHANPY is the", $4f
	db "cutest in the", $55
	db "world.", $57
; 0x1ad9f3

PokefanmRexBeatenText: ; 0x1ad9f3
	db $0, "My PHANPY!", $57
; 0x1ad9ff

UnknownText_0x1ad9ff: ; 0x1ad9ff
	db $0, "Look how adorable", $4f
	db "my PHANPY acts!", $51
	db "Isn't it cute", $4f
	db "enough to make", $55
	db "your heart melt?", $57
; 0x1ada4f

PokefanmAllanSeenText: ; 0x1ada4f
	db $0, "My TEDDIURSA is", $4f
	db "the cutest in the", $55
	db "world.", $57
; 0x1ada79

PokefanmAllanBeatenText: ; 0x1ada79
	db $0, "My TEDDIURSA!", $57
; 0x1ada88

UnknownText_0x1ada88: ; 0x1ada88
	db $0, "Look how adorable", $4f
	db "my TEDDIURSA acts!", $51
	db "Isn't it cute", $4f
	db "enough to make", $55
	db "your heart melt?", $57
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
	person_event $2d, 8, 21, $6, $0, 255, 255, $b0, 2, UnknownScript_0x1ad951, $0771
	person_event $2d, 16, 13, $9, $0, 255, 255, $82, 0, TrainerPokefanmRex, $ffff
	person_event $2d, 16, 14, $8, $0, 255, 255, $82, 0, TrainerPokefanmAllan, $ffff
; 0x1adb17

