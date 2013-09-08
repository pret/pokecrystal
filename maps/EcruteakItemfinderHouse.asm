EcruteakItemfinderHouse_MapScriptHeader: ; 0x9a5f9
	; trigger count
	db 0

	; callback count
	db 0
; 0x9a5fb

CooltrainerMScript_0x9a5fb: ; 0x9a5fb
	faceplayer
	loadfont
	checkbit1 EVENT_GOT_ITEMFINDER
	iftrue UnknownScript_0x9a614
	2writetext UnknownText_0x9a63c
	yesorno
	iffalse UnknownScript_0x9a61a
	2writetext UnknownText_0x9a6b5
	keeptextopen
	verbosegiveitem ITEMFINDER, 1
	setbit1 EVENT_GOT_ITEMFINDER
UnknownScript_0x9a614: ; 0x9a614
	2writetext UnknownText_0x9a70e
	closetext
	loadmovesprites
	end
; 0x9a61a

UnknownScript_0x9a61a: ; 0x9a61a
	2writetext UnknownText_0x9a805
	closetext
	loadmovesprites
	end
; 0x9a620

PokedexScript_0x9a620: ; 0x9a620
	loadfont
	2writetext UnknownText_0x9a826
	yesorno
	iftrue UnknownScript_0x9a62a
	loadmovesprites
	end
; 0x9a62a

UnknownScript_0x9a62a: ; 0x9a62a
	2writetext UnknownText_0x9a84c
	yesorno
	iftrue UnknownScript_0x9a633
	loadmovesprites
	end
; 0x9a633

UnknownScript_0x9a633: ; 0x9a633
	2writetext UnknownText_0x9a902
	closetext
	loadmovesprites
	end
; 0x9a639

MapEcruteakItemfinderHouseSignpost0Script: ; 0x9a639
	jumpstd $000c
; 0x9a63c

UnknownText_0x9a63c: ; 0x9a63c
	db $0, "Ah. You're on an", $4f
	db "adventure with", $55
	db "your #MON?", $51
	db "Well, what's an", $4f
	db "adventure without", $55
	db "treasure hunting?", $51
	db "Am I right, or am", $4f
	db "I right?", $57
; 0x9a6b5

UnknownText_0x9a6b5: ; 0x9a6b5
	db $0, "Good! You under-", $4f
	db "stand the true", $51
	db "spirit of adven-", $4f
	db "ture.", $51
	db "I like that! Take", $4f
	db "this with you.", $57
; 0x9a70e

UnknownText_0x9a70e: ; 0x9a70e
	db $0, "There are many", $4f
	db "items lying about", $51
	db "that aren't ob-", $4f
	db "vious.", $51
	db "Use ITEMFINDER to", $4f
	db "check if there is", $51
	db "an item on the", $4f
	db "ground near you.", $51
	db "It doesn't show", $4f
	db "the exact spot,", $51
	db "so you'll have to", $4f
	db "look yourself.", $51
	db "Oh yeah--I heard", $4f
	db "there are items", $51
	db "in ECRUTEAK's", $4f
	db "BURNED TOWER.", $57
; 0x9a805

UnknownText_0x9a805: ; 0x9a805
	db $0, "Oh… To each his", $4f
	db "own, I suppose…", $57
; 0x9a826

UnknownText_0x9a826: ; 0x9a826
	db $0, "HISTORY OF", $4f
	db "ECRUTEAK", $51
	db "Want to read it?", $57
; 0x9a84c

UnknownText_0x9a84c: ; 0x9a84c
	db $0, "In ECRUTEAK, there", $4f
	db "were two towers.", $51
	db "Each tower was the", $4f
	db "roost of powerful", $55
	db "flying #MON.", $51
	db "But one of the", $4f
	db "towers burned to", $55
	db "the ground.", $51
	db "The two #MON", $4f
	db "haven't been seen", $55
	db "since…", $51
	db "Keep reading?", $57
; 0x9a902

UnknownText_0x9a902: ; 0x9a902
	db $0, "ECRUTEAK was also", $4f
	db "home to three", $51
	db "#MON that raced", $4f
	db "around the town.", $51
	db "They were said to", $4f
	db "have been born of", $51
	db "water, lightning", $4f
	db "and fire.", $51
	db "But they could not", $4f
	db "contain their", $55
	db "excessive power.", $51
	db "So they say the", $4f
	db "three ran like the", $51
	db "wind off into the", $4f
	db "grassland.", $57
; 0x9a9f5

EcruteakItemfinderHouse_MapEventHeader: ; 0x9a9f5
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $3, 11, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $7, $4, 11, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 1, 2, $0, MapEcruteakItemfinderHouseSignpost0Script

	; people-events
	db 2
	person_event SPRITE_COOLTRAINER_M, 7, 6, $6, $0, 255, 255, $80, 0, CooltrainerMScript_0x9a5fb, $ffff
	person_event SPRITE_POKEDEX, 7, 7, $1, $0, 255, 255, $0, 0, PokedexScript_0x9a620, $ffff
; 0x9aa24

