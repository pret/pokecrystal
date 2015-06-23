Route43MahoganyGate_MapScriptHeader: ; 0x19ab09
	; trigger count
	db 0

	; callback count
	db 0
; 0x19ab0b

OfficerScript_0x19ab0b: ; 0x19ab0b
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19ab19
	writetext UnknownText_0x19ab1f
	closetext
	loadmovesprites
	end
; 0x19ab19

UnknownScript_0x19ab19: ; 0x19ab19
	writetext UnknownText_0x19ab65
	closetext
	loadmovesprites
	end
; 0x19ab1f

UnknownText_0x19ab1f: ; 0x19ab1f
	text "Only people headed"
	line "up to LAKE OF RAGE"

	para "have been through"
	line "here lately."
	done
; 0x19ab65

UnknownText_0x19ab65: ; 0x19ab65
	text "Nobody goes up to"
	line "LAKE OF RAGE these"
	cont "days."
	done
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
