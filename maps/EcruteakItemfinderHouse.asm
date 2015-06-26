EcruteakItemfinderHouse_MapScriptHeader: ; 0x9a5f9
	; trigger count
	db 0

	; callback count
	db 0
; 0x9a5fb

CooltrainerMScript_0x9a5fb: ; 0x9a5fb
	faceplayer
	loadfont
	checkevent EVENT_GOT_ITEMFINDER
	iftrue UnknownScript_0x9a614
	writetext UnknownText_0x9a63c
	yesorno
	iffalse UnknownScript_0x9a61a
	writetext UnknownText_0x9a6b5
	keeptextopen
	verbosegiveitem ITEMFINDER, 1
	setevent EVENT_GOT_ITEMFINDER
UnknownScript_0x9a614: ; 0x9a614
	writetext UnknownText_0x9a70e
	closetext
	loadmovesprites
	end
; 0x9a61a

UnknownScript_0x9a61a: ; 0x9a61a
	writetext UnknownText_0x9a805
	closetext
	loadmovesprites
	end
; 0x9a620

PokedexScript_0x9a620: ; 0x9a620
	loadfont
	writetext UnknownText_0x9a826
	yesorno
	iftrue UnknownScript_0x9a62a
	loadmovesprites
	end
; 0x9a62a

UnknownScript_0x9a62a: ; 0x9a62a
	writetext UnknownText_0x9a84c
	yesorno
	iftrue UnknownScript_0x9a633
	loadmovesprites
	end
; 0x9a633

UnknownScript_0x9a633: ; 0x9a633
	writetext UnknownText_0x9a902
	closetext
	loadmovesprites
	end
; 0x9a639

ItemFinderHouseRadio:
	jumpstd radio2

UnknownText_0x9a63c: ; 0x9a63c
	text "Ah. You're on an"
	line "adventure with"
	cont "your #MON?"

	para "Well, what's an"
	line "adventure without"
	cont "treasure hunting?"

	para "Am I right, or am"
	line "I right?"
	done
; 0x9a6b5

UnknownText_0x9a6b5: ; 0x9a6b5
	text "Good! You under-"
	line "stand the true"

	para "spirit of adven-"
	line "ture."

	para "I like that! Take"
	line "this with you."
	done
; 0x9a70e

UnknownText_0x9a70e: ; 0x9a70e
	text "There are many"
	line "items lying about"

	para "that aren't ob-"
	line "vious."

	para "Use ITEMFINDER to"
	line "check if there is"

	para "an item on the"
	line "ground near you."

	para "It doesn't show"
	line "the exact spot,"

	para "so you'll have to"
	line "look yourself."

	para "Oh yeah--I heard"
	line "there are items"

	para "in ECRUTEAK's"
	line "BURNED TOWER."
	done
; 0x9a805

UnknownText_0x9a805: ; 0x9a805
	text "Oh… To each his"
	line "own, I suppose…"
	done
; 0x9a826

UnknownText_0x9a826: ; 0x9a826
	text "HISTORY OF"
	line "ECRUTEAK"

	para "Want to read it?"
	done
; 0x9a84c

UnknownText_0x9a84c: ; 0x9a84c
	text "In ECRUTEAK, there"
	line "were two towers."

	para "Each tower was the"
	line "roost of powerful"
	cont "flying #MON."

	para "But one of the"
	line "towers burned to"
	cont "the ground."

	para "The two #MON"
	line "haven't been seen"
	cont "since…"

	para "Keep reading?"
	done
; 0x9a902

UnknownText_0x9a902: ; 0x9a902
	text "ECRUTEAK was also"
	line "home to three"

	para "#MON that raced"
	line "around the town."

	para "They were said to"
	line "have been born of"

	para "water, lightning"
	line "and fire."

	para "But they could not"
	line "contain their"
	cont "excessive power."

	para "So they say the"
	line "three ran like the"

	para "wind off into the"
	line "grassland."
	done
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
	signpost 1, 2, $0, ItemFinderHouseRadio

	; people-events
	db 2
	person_event SPRITE_COOLTRAINER_M, 7, 6, $6, $0, 255, 255, $80, 0, CooltrainerMScript_0x9a5fb, $ffff
	person_event SPRITE_POKEDEX, 7, 7, $1, $0, 255, 255, $0, 0, PokedexScript_0x9a620, $ffff
; 0x9aa24
