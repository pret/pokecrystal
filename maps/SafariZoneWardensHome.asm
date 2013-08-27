SafariZoneWardensHome_MapScriptHeader: ; 0x1965c4
	; trigger count
	db 0

	; callback count
	db 0
; 0x1965c6

LassScript_0x1965c6: ; 0x1965c6
	faceplayer
	loadfont
	checkbit1 $00d9
	iftrue UnknownScript_0x1965d7
	2writetext UnknownText_0x1965e6
	closetext
	loadmovesprites
	setbit1 $00d9
	end
; 0x1965d7

UnknownScript_0x1965d7: ; 0x1965d7
	2writetext UnknownText_0x196691
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
	db $0, "My grandpa is the", $4f
	db "SAFARI ZONE WAR-", $55
	db "DEN.", $51
	db "At least he was…", $51
	db "He decided to go", $4f
	db "on a vacation and", $51
	db "took off overseas", $4f
	db "all by himself.", $51
	db "He quit running", $4f
	db "SAFARI ZONE just", $55
	db "like that.", $57
; 0x196691

UnknownText_0x196691: ; 0x196691
	db $0, "Many people were", $4f
	db "disappointed that", $51
	db "SAFARI ZONE closed", $4f
	db "down, but Grandpa", $55
	db "is so stubborn…", $57
; 0x1966ea

UnknownText_0x1966ea: ; 0x1966ea
	db $0, "It's a photo of a", $4f
	db "grinning old man", $51
	db "who's surrounded", $4f
	db "by #MON.", $57
; 0x196726

UnknownText_0x196726: ; 0x196726
	db $0, "It's a photo of a", $4f
	db "huge grassy plain", $51
	db "with rare #MON", $4f
	db "frolicking in it.", $57
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

