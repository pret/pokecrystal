SafariZoneWardensHome_MapScriptHeader: ; 0x1965c4
	; trigger count
	db 0

	; callback count
	db 0
; 0x1965c6

LassScript_0x1965c6: ; 0x1965c6
	faceplayer
	loadfont
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue UnknownScript_0x1965d7
	writetext UnknownText_0x1965e6
	closetext
	loadmovesprites
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
; 0x1965d7

UnknownScript_0x1965d7: ; 0x1965d7
	writetext UnknownText_0x196691
	closetext
	loadmovesprites
	end
; 0x1965dd

MapSafariZoneWardensHomeSignpost2Script: ; 0x1965dd
	jumptext UnknownText_0x1966ea
; 0x1965e0

MapSafariZoneWardensHomeSignpost3Script: ; 0x1965e0
	jumptext UnknownText_0x196726
; 0x1965e3

MapSafariZoneWardensHomeSignpost1Script: ; 0x1965e3
	jumpstd $0002
; 0x1965e6

UnknownText_0x1965e6: ; 0x1965e6
	text "My grandpa is the"
	line "SAFARI ZONE WAR-"
	cont "DEN."

	para "At least he was…"

	para "He decided to go"
	line "on a vacation and"

	para "took off overseas"
	line "all by himself."

	para "He quit running"
	line "SAFARI ZONE just"
	cont "like that."
	done
; 0x196691

UnknownText_0x196691: ; 0x196691
	text "Many people were"
	line "disappointed that"

	para "SAFARI ZONE closed"
	line "down, but Grandpa"
	cont "is so stubborn…"
	done
; 0x1966ea

UnknownText_0x1966ea: ; 0x1966ea
	text "It's a photo of a"
	line "grinning old man"

	para "who's surrounded"
	line "by #MON."
	done
; 0x196726

UnknownText_0x196726: ; 0x196726
	text "It's a photo of a"
	line "huge grassy plain"

	para "with rare #MON"
	line "frolicking in it."
	done
; 0x19676b

SafariZoneWardensHome_MapEventHeader: ; 0x19676b
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $3, 6, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 1, 0, $0, MapSafariZoneWardensHomeSignpost1Script
	signpost 1, 1, $0, MapSafariZoneWardensHomeSignpost1Script
	signpost 0, 7, $0, MapSafariZoneWardensHomeSignpost2Script
	signpost 0, 9, $0, MapSafariZoneWardensHomeSignpost3Script

	; people-events
	db 1
	person_event SPRITE_LASS, 8, 6, $9, $0, 255, 255, $a0, 0, LassScript_0x1965c6, $ffff
; 0x19679c
