CharcoalKiln_MapScriptHeader: ; 0x18dd18
	; trigger count
	db 0

	; callback count
	db 0
; 0x18dd1a

UnknownScript_0x18dd1a: ; 0x18dd1a
	faceplayer
	loadfont
	checkbit1 $0010
	iftrue UnknownScript_0x18dd34
	checkbit1 $002b
	iftrue UnknownScript_0x18dd2e
	2writetext UnknownText_0x18dd74
	closetext
	loadmovesprites
	end
; 0x18dd2e

UnknownScript_0x18dd2e: ; 0x18dd2e
	2writetext UnknownText_0x18ddfd
	closetext
	loadmovesprites
	end
; 0x18dd34

UnknownScript_0x18dd34: ; 0x18dd34
	2writetext UnknownText_0x18de73
	closetext
	loadmovesprites
	end
; 0x18dd3a

UnknownScript_0x18dd3a: ; 0x18dd3a
	faceplayer
	loadfont
	checkbit1 $005e
	iftrue UnknownScript_0x18dd5d
	checkbit1 $0010
	iftrue UnknownScript_0x18dd4e
	2writetext UnknownText_0x18dee0
	closetext
	loadmovesprites
	end
; 0x18dd4e

UnknownScript_0x18dd4e: ; 0x18dd4e
	2writetext UnknownText_0x18df25
	keeptextopen
	verbosegiveitem CHARCOAL, 1
	iffalse UnknownScript_0x18dd61
	setbit1 $005e
	loadmovesprites
	end
; 0x18dd5d

UnknownScript_0x18dd5d: ; 0x18dd5d
	2writetext UnknownText_0x18df93
	closetext
UnknownScript_0x18dd61: ; 0x18dd61
	loadmovesprites
	end
; 0x18dd63

UnknownScript_0x18dd63: ; 0x18dd63
	faceplayer
	loadfont
	2writetext UnknownText_0x18dfe5
	cry FARFETCH_D
	closetext
	loadmovesprites
	end
; 0x18dd6e

MapCharcoalKilnSignpost1Script: ; 0x18dd6e
	jumpstd $0003
; 0x18dd71

MapCharcoalKilnSignpost2Script: ; 0x18dd71
	jumpstd $000c
; 0x18dd74

UnknownText_0x18dd74: ; 0x18dd74
	db $0, "All the SLOWPOKE", $4f
	db "have disappeared", $55
	db "from the town.", $51
	db "The forest's pro-", $4f
	db "tector may be", $55
	db "angry with us…", $51
	db "It may be a bad", $4f
	db "omen. We should", $55
	db "stay in.", $57
; 0x18ddfd

UnknownText_0x18ddfd: ; 0x18ddfd
	db $0, "The SLOWPOKE have", $4f
	db "returned…", $51
	db "But my APPRENTICE", $4f
	db "hasn't come back", $55
	db "from ILEX FOREST.", $51
	db "Where in the world", $4f
	db "is that lazy guy?", $57
; 0x18de73

UnknownText_0x18de73: ; 0x18de73
	db $0, "You chased off", $4f
	db "TEAM ROCKET and", $51
	db "went to ILEX", $4f
	db "FOREST alone?", $51
	db "That takes guts!", $4f
	db "I like that. Come", $55
	db "train with us.", $57
; 0x18dee0

UnknownText_0x18dee0: ; 0x18dee0
	db $0, "Where have all the", $4f
	db "SLOWPOKE gone?", $51
	db "Are they out play-", $4f
	db "ing somewhere?", $57
; 0x18df25

UnknownText_0x18df25: ; 0x18df25
	db $0, "I'm sorry--I for-", $4f
	db "got to thank you.", $51
	db "This is CHARCOAL", $4f
	db "that I made.", $51
	db "Fire-type #MON", $4f
	db "would be happy to", $55
	db "hold that.", $57
; 0x18df93

UnknownText_0x18df93: ; 0x18df93
	db $0, "The SLOWPOKE came", $4f
	db "back, and you even", $55
	db "found FARFETCH'D.", $51
	db "You're the cool-", $4f
	db "est, man!", $57
; 0x18dfe5

UnknownText_0x18dfe5: ; 0x18dfe5
	db $0, "FARFETCH'D: Kwaa!", $57
; 0x18dff8

CharcoalKiln_MapEventHeader: ; 0x18dff8
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $7, $3, 2, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, MapCharcoalKilnSignpost1Script
	signpost 1, 1, $0, MapCharcoalKilnSignpost1Script
	signpost 1, 7, $0, MapCharcoalKilnSignpost2Script

	; people-events
	db 3
	person_event $41, 7, 6, $3, $0, 255, 255, $0, 0, UnknownScript_0x18dd1a, $06f7
	person_event $27, 7, 9, $2, $11, 255, 255, $0, 0, UnknownScript_0x18dd3a, $06f6
	person_event $9e, 10, 9, $16, $22, 255, 255, $b0, 0, UnknownScript_0x18dd63, $06f5
; 0x18e03e

