Route36RuinsofAlphgate_MapScriptHeader: ; 0x6aa18
	; trigger count
	db 0

	; callback count
	db 0
; 0x6aa1a

OfficerScript_0x6aa1a: ; 0x6aa1a
	jumptextfaceplayer UnknownText_0x6aa20
; 0x6aa1d

GrampsScript_0x6aa1d: ; 0x6aa1d
	jumptextfaceplayer UnknownText_0x6aa5b
; 0x6aa20

UnknownText_0x6aa20: ; 0x6aa20
	db $0, "Don't you wonder", $4f
	db "who'd make some-", $55
	db "thing like this?", $55
	db "And why?", $57
; 0x6aa5b

UnknownText_0x6aa5b: ; 0x6aa5b
	db $0, "Did you see that", $4f
	db "strange tree in", $55
	db "the road?", $51
	db "That may explain", $4f
	db "why fewer people", $51
	db "are visiting the", $4f
	db "RUINS OF ALPH.", $57
; 0x6aac9

Route36RuinsofAlphgate_MapEventHeader: ; 0x6aac9
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 3, GROUP_ROUTE_36, MAP_ROUTE_36
	warp_def $0, $5, 4, GROUP_ROUTE_36, MAP_ROUTE_36
	warp_def $7, $4, 9, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $7, $5, 9, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_OFFICER, 8, 4, $9, $0, 255, 255, $80, 0, OfficerScript_0x6aa1a, $ffff
	person_event SPRITE_GRAMPS, 9, 11, $2, $21, 255, 255, $b0, 0, GrampsScript_0x6aa1d, $ffff
; 0x6aafd

