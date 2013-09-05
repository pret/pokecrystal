Route43MahoganyGate_MapScriptHeader: ; 0x19ab09
	; trigger count
	db 0

	; callback count
	db 0
; 0x19ab0b

OfficerScript_0x19ab0b: ; 0x19ab0b
	faceplayer
	loadfont
	checkbit1 EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19ab19
	2writetext UnknownText_0x19ab1f
	closetext
	loadmovesprites
	end
; 0x19ab19

UnknownScript_0x19ab19: ; 0x19ab19
	2writetext UnknownText_0x19ab65
	closetext
	loadmovesprites
	end
; 0x19ab1f

UnknownText_0x19ab1f: ; 0x19ab1f
	db $0, "Only people headed", $4f
	db "up to LAKE OF RAGE", $51
	db "have been through", $4f
	db "here lately.", $57
; 0x19ab65

UnknownText_0x19ab65: ; 0x19ab65
	db $0, "Nobody goes up to", $4f
	db "LAKE OF RAGE these", $55
	db "days.", $57
; 0x19ab91

Route43MahoganyGate_MapEventHeader: ; 0x19ab91
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 1, GROUP_ROUTE_43, MAP_ROUTE_43
	warp_def $0, $5, 2, GROUP_ROUTE_43, MAP_ROUTE_43
	warp_def $7, $4, 5, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $7, $5, 5, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 8, 4, $9, $0, 255, 255, $80, 0, OfficerScript_0x19ab0b, $ffff
; 0x19abb8

