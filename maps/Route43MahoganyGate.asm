Route43MahoganyGate_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

OfficerScript_0x19ab0b:
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19ab19
	writetext UnknownText_0x19ab1f
	closetext
	loadmovesprites
	end

UnknownScript_0x19ab19:
	writetext UnknownText_0x19ab65
	closetext
	loadmovesprites
	end

UnknownText_0x19ab1f:
	text "Only people headed"
	line "up to LAKE OF RAGE"

	para "have been through"
	line "here lately."
	done

UnknownText_0x19ab65:
	text "Nobody goes up to"
	line "LAKE OF RAGE these"
	cont "days."
	done

Route43MahoganyGate_MapEventHeader:
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
	person_event SPRITE_OFFICER, 8, 4, LEFT << 2 | $1, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, OfficerScript_0x19ab0b, -1
