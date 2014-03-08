OlivineGoodRodHouse_MapScriptHeader: ; 0x9c719
	; trigger count
	db 0

	; callback count
	db 0
; 0x9c71b

FishingGuruScript_0x9c71b: ; 0x9c71b
	faceplayer
	loadfont
	checkevent EVENT_GOT_GOOD_ROD
	iftrue UnknownScript_0x9c740
	2writetext UnknownText_0x9c749
	yesorno
	iffalse UnknownScript_0x9c73a
	2writetext UnknownText_0x9c7db
	keeptextopen
	verbosegiveitem GOOD_ROD, 1
	2writetext UnknownText_0x9c807
	closetext
	loadmovesprites
	setevent EVENT_GOT_GOOD_ROD
	end
; 0x9c73a

UnknownScript_0x9c73a: ; 0x9c73a
	2writetext UnknownText_0x9c84c
	closetext
	loadmovesprites
	end
; 0x9c740

UnknownScript_0x9c740: ; 0x9c740
	2writetext UnknownText_0x9c87f
	closetext
	loadmovesprites
	end
; 0x9c746

UnknownScript_0x9c746: ; 0x9c746
	jumpstd $0002
; 0x9c749

UnknownText_0x9c749: ; 0x9c749
	text "OLIVINE is on the"
	line "sea!"

	para "And if it's on the"
	line "sea, there are"
	cont "bound to be fish!"

	para "I've fished here"
	line "for 30 years."

	para "Would you like to"
	line "face the sea and"
	cont "fish?"
	done
; 0x9c7db

UnknownText_0x9c7db: ; 0x9c7db
	text "Ah, hahah!"
	line "We have ourselves"
	cont "a new angler!"
	done
; 0x9c807

UnknownText_0x9c807: ; 0x9c807
	text "Fish aren't found"
	line "in the sea alone."

	para "They go wherever"
	line "there is water."
	done
; 0x9c84c

UnknownText_0x9c84c: ; 0x9c84c
	text "Whaaat? You don't"
	line "like to fish!?"
	cont "Incomprehensible!"
	done
; 0x9c87f

UnknownText_0x9c87f: ; 0x9c87f
	text "How are things?"
	line "Land the big one?"
	done
; 0x9c8a2

OlivineGoodRodHouse_MapEventHeader: ; 0x9c8a2
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 6, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_FISHING_GURU, 7, 6, $6, $0, 255, 255, $a0, 0, FishingGuruScript_0x9c71b, $ffff
; 0x9c8bf

