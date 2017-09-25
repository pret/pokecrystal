const_value set 2
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	buttonsound
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
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

.Warps:
	db 2
	warp_def $7, $2, 6, OLIVINE_CITY
	warp_def $7, $3, 6, OLIVINE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_FISHING_GURU, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GoodRodGuru, -1
