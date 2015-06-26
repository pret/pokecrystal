OlivineGoodRodHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

GoodRodGuru:
	faceplayer
	loadfont
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	keeptextopen
	verbosegiveitem GOOD_ROD, 1
	writetext GaveGoodRodText
	closetext
	loadmovesprites
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt
	writetext DontWantGoodRodText
	closetext
	loadmovesprites
	end

.AlreadyGotItem
	writetext HaveGoodRodText
	closetext
	loadmovesprites
	end

GoodRodHouseBookshelf:
; unused
	jumpstd picturebookshelf

OfferGoodRodText:
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

GiveGoodRodText:
	text "Ah, hahah!"
	line "We have ourselves"
	cont "a new angler!"
	done

GaveGoodRodText:
	text "Fish aren't found"
	line "in the sea alone."

	para "They go wherever"
	line "there is water."
	done

DontWantGoodRodText:
	text "Whaaat? You don't"
	line "like to fish!?"
	cont "Incomprehensible!"
	done

HaveGoodRodText:
	text "How are things?"
	line "Land the big one?"
	done

OlivineGoodRodHouse_MapEventHeader:
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
	person_event SPRITE_FISHING_GURU, 7, 6, $6, $0, 255, 255, $a0, 0, GoodRodGuru, $ffff
