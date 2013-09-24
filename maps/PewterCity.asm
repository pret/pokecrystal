PewterCity_MapScriptHeader: ; 0x18c000
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x18c005
; 0x18c005

UnknownScript_0x18c005: ; 0x18c005
	setbit2 $0037
	return
; 0x18c009

CooltrainerFScript_0x18c009: ; 0x18c009
	jumptextfaceplayer UnknownText_0x18c042
; 0x18c00c

BugCatcherScript_0x18c00c: ; 0x18c00c
	jumptextfaceplayer UnknownText_0x18c080
; 0x18c00f

GrampsScript_0x18c00f: ; 0x18c00f
	faceplayer
	loadfont
	checkevent EVENT_GOT_SILVER_WING
	iftrue UnknownScript_0x18c023
	2writetext UnknownText_0x18c0c6
	keeptextopen
	verbosegiveitem SILVER_WING, 1
	setevent EVENT_GOT_SILVER_WING
	loadmovesprites
	end
; 0x18c023

UnknownScript_0x18c023: ; 0x18c023
	2writetext UnknownText_0x18c1aa
	closetext
	loadmovesprites
	end
; 0x18c029

MapPewterCitySignpost0Script: ; 0x18c029
	jumptext UnknownText_0x18c1ff
; 0x18c02c

MapPewterCitySignpost1Script: ; 0x18c02c
	jumptext UnknownText_0x18c21e
; 0x18c02f

MapPewterCitySignpost2Script: ; 0x18c02f
	jumptext UnknownText_0x18c25e
; 0x18c032

MapPewterCitySignpost3Script: ; 0x18c032
	jumptext UnknownText_0x18c2a9
; 0x18c035

MapPewterCitySignpost4Script: ; 0x18c035
	jumptext UnknownText_0x18c2dc
; 0x18c038

MapPewterCitySignpost5Script: ; 0x18c038
	jumpstd $0010
; 0x18c03b

MapPewterCitySignpost6Script: ; 0x18c03b
	jumpstd $0011
; 0x18c03e

FruitTreeScript_0x18c03e: ; 0x18c03e
	fruittree $1c
; 0x18c040

FruitTreeScript_0x18c040: ; 0x18c040
	fruittree $1d
; 0x18c042

UnknownText_0x18c042: ; 0x18c042
	db $0, "Have you visited", $4f
	db "PEWTER GYM?", $51
	db "The LEADER uses", $4f
	db "rock-type #MON.", $57
; 0x18c080

UnknownText_0x18c080: ; 0x18c080
	db $0, "At night, CLEFAIRY", $4f
	db "come out to play", $55
	db "at MT.MOON.", $51
	db "But not every", $4f
	db "night.", $57
; 0x18c0c6

UnknownText_0x18c0c6: ; 0x18c0c6
	db $0, "Ah, you came all", $4f
	db "the way out here", $55
	db "from JOHTO?", $51
	db "That brings back", $4f
	db "memories. When I", $51
	db "was young, I went", $4f
	db "to JOHTO to train.", $51
	db "You remind me so", $4f
	db "much of what I was", $51
	db "like as a young", $4f
	db "man.", $51
	db "Here. I want you", $4f
	db "to have this item", $55
	db "I found in JOHTO.", $57
; 0x18c1aa

UnknownText_0x18c1aa: ; 0x18c1aa
	db $0, "Going to new, un-", $4f
	db "known places and", $55
	db "seeing new people…", $51
	db "Those are the joys", $4f
	db "of travel.", $57
; 0x18c1ff

UnknownText_0x18c1ff: ; 0x18c1ff
	db $0, "PEWTER CITY", $4f
	db "A Stone Gray City", $57
; 0x18c21e

UnknownText_0x18c21e: ; 0x18c21e
	db $0, "PEWTER CITY", $4f
	db "#MON GYM", $55
	db "LEADER: BROCK", $51
	db "The Rock Solid", $4f
	db "#MON Trainer", $57
; 0x18c25e

UnknownText_0x18c25e: ; 0x18c25e
	db $0, "There's a notice", $4f
	db "here…", $51
	db "PEWTER MUSEUM OF", $4f
	db "SCIENCE is closed", $55
	db "for renovations…", $57
; 0x18c2a9

UnknownText_0x18c2a9: ; 0x18c2a9
	db $0, "There's a notice", $4f
	db "here…", $51
	db "MT.MOON GIFT SHOP", $4f
	db "NOW OPEN!", $57
; 0x18c2dc

UnknownText_0x18c2dc: ; 0x18c2dc
	db $0, "WELCOME TO", $4f
	db "PEWTER CITY!", $57
; 0x18c2f5

PewterCity_MapEventHeader: ; 0x18c2f5
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $d, $1d, 1, GROUP_PEWTER_NIDORAN_SPEECH_HOUSE, MAP_PEWTER_NIDORAN_SPEECH_HOUSE
	warp_def $11, $10, 1, GROUP_PEWTER_GYM, MAP_PEWTER_GYM
	warp_def $11, $17, 2, GROUP_PEWTER_MART, MAP_PEWTER_MART
	warp_def $19, $d, 1, GROUP_PEWTER_POKECENTER_1F, MAP_PEWTER_POKECENTER_1F
	warp_def $1d, $7, 1, GROUP_PEWTER_SNOOZE_SPEECH_HOUSE, MAP_PEWTER_SNOOZE_SPEECH_HOUSE

	; xy triggers
	db 0

	; signposts
	db 7
	signpost 23, 25, $0, MapPewterCitySignpost0Script
	signpost 17, 11, $0, MapPewterCitySignpost1Script
	signpost 9, 15, $0, MapPewterCitySignpost2Script
	signpost 19, 33, $0, MapPewterCitySignpost3Script
	signpost 29, 19, $0, MapPewterCitySignpost4Script
	signpost 25, 14, $0, MapPewterCitySignpost5Script
	signpost 17, 24, $0, MapPewterCitySignpost6Script

	; people-events
	db 5
	person_event SPRITE_COOLTRAINER_F, 15, 23, $2, $22, 255, 255, $a0, 0, CooltrainerFScript_0x18c009, $ffff
	person_event SPRITE_BUG_CATCHER, 33, 18, $2, $22, 255, 255, $80, 0, BugCatcherScript_0x18c00c, $ffff
	person_event SPRITE_GRAMPS, 21, 33, $5, $2, 255, 255, $90, 0, GrampsScript_0x18c00f, $ffff
	person_event SPRITE_FRUIT_TREE, 7, 36, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x18c03e, $ffff
	person_event SPRITE_FRUIT_TREE, 7, 34, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x18c040, $ffff
; 0x18c378

