Route6SaffronGate_MapScriptHeader: ; 0x1926e3
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x1926e9, $0000

	; callback count
	db 0
; 0x1926e9

UnknownScript_0x1926e9: ; 0x1926e9
	end
; 0x1926ea

OfficerScript_0x1926ea: ; 0x1926ea
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x1926f8
	2writetext UnknownText_0x1926fe
	closetext
	loadmovesprites
	end
; 0x1926f8

UnknownScript_0x1926f8: ; 0x1926f8
	2writetext UnknownText_0x1927cb
	closetext
	loadmovesprites
	end
; 0x1926fe

UnknownText_0x1926fe: ; 0x1926fe
	db $0, "Welcome to SAFFRON", $4f
	db "CITY, home of the", $55
	db "MAGNET TRAIN!", $51
	db "…That's what I'd", $4f
	db "normally say, but", $51
	db "the MAGNET TRAIN", $4f
	db "isn't running now.", $51
	db "It's not getting", $4f
	db "any electricity", $51
	db "because there's", $4f
	db "something wrong", $51
	db "with the POWER", $4f
	db "PLANT.", $57
; 0x1927cb

UnknownText_0x1927cb: ; 0x1927cb
	db $0, "The MAGNET TRAIN", $4f
	db "is the most famous", $51
	db "thing about SAF-", $4f
	db "FRON.", $57
; 0x192807

Route6SaffronGate_MapEventHeader: ; 0x192807
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 12, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $0, $5, 13, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $4, 2, GROUP_ROUTE_6, MAP_ROUTE_6
	warp_def $7, $5, 2, GROUP_ROUTE_6, MAP_ROUTE_6

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 8, 4, $9, $0, 255, 255, $90, 0, OfficerScript_0x1926ea, $ffff
; 0x19282e

