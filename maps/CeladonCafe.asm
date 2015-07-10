CeladonCafe_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

SuperNerdScript_0x73049:
	faceplayer
	loadfont
	writetext UnknownText_0x730de
	closetext
	loadmovesprites
	end

FisherScript_0x73051:
	loadfont
	writetext UnknownText_0x73129
	closetext
	loadmovesprites
	faceplayer
	loadfont
	writetext UnknownText_0x7313a
	closetext
	loadmovesprites
	spriteface $3, LEFT
	end

FisherScript_0x73062:
	loadfont
	writetext UnknownText_0x7316a
	closetext
	loadmovesprites
	faceplayer
	loadfont
	writetext UnknownText_0x73178
	closetext
	loadmovesprites
	spriteface $4, RIGHT
	end

FisherScript_0x73073:
	loadfont
	writetext UnknownText_0x731ae
	closetext
	loadmovesprites
	faceplayer
	loadfont
	writetext UnknownText_0x731bd
	closetext
	loadmovesprites
	spriteface $5, RIGHT
	end

TeacherScript_0x73084:
	checkitem COIN_CASE
	iftrue UnknownScript_0x7309a
	loadfont
	writetext UnknownText_0x73201
	closetext
	loadmovesprites
	faceplayer
	loadfont
	writetext UnknownText_0x73212
	closetext
	loadmovesprites
	spriteface $6, LEFT
	end

UnknownScript_0x7309a:
	loadfont
	writetext UnknownText_0x73254
	closetext
	loadmovesprites
	spriteface $6, RIGHT
	loadfont
	writetext UnknownText_0x73278
	closetext
	loadmovesprites
	spriteface $6, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

CeladonCafeTrashcan:
	checkevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	iftrue .TrashEmpty
	giveitem LEFTOVERS, $1
	iffalse .PackFull
	loadfont
	itemtotext LEFTOVERS, $0
	writetext FoundLeftoversText
	playsound SFX_ITEM
	waitbutton
	itemnotify
	loadmovesprites
	setevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	end

.PackFull
	loadfont
	itemtotext LEFTOVERS, $0
	writetext FoundLeftoversText
	keeptextopen
	writetext NoRoomForLeftoversText
	closetext
	loadmovesprites
	end

.TrashEmpty
	jumpstd trashcan

UnknownText_0x730de:
	text "Hi!"

	para "We're holding an"
	line "eatathon contest."

	para "We can't serve you"
	line "right now. Sorry."
	done

UnknownText_0x73129:
	text "…Snarfle, chew…"
	done

UnknownText_0x7313a:
	text "Don't talk to me!"

	para "You'll break my"
	line "concentration!"
	done

UnknownText_0x7316a:
	text "…Gulp… Chew…"
	done

UnknownText_0x73178:
	text "I take quantity"
	line "over quality!"

	para "I'm happy when I'm"
	line "full!"
	done

UnknownText_0x731ae:
	text "Munch, munch…"
	done

UnknownText_0x731bd:
	text "The food is good"
	line "here, but GOLDEN-"
	cont "ROD has the best"
	cont "food anywhere."
	done

UnknownText_0x73201:
	text "Crunch… Crunch…"
	done

UnknownText_0x73212:
	text "Nobody here will"
	line "give you a COIN"

	para "CASE. You should"
	line "look in JOHTO."
	done

UnknownText_0x73254:
	text "Crunch… Crunch…"

	para "I can keep eating!"
	done

UnknownText_0x73278:
	text "More, CHEF!"
	done

EatathonContestPosterText:
	text "Eatathon Contest!"
	line "No time limit!"

	para "A battle without"
	line "end! The biggest"

	para "muncher gets it"
	line "all for free!"
	done

FoundLeftoversText:
	text "<PLAYER> found"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

NoRoomForLeftoversText:
	text "But <PLAYER> can't"
	line "hold another item…"
	done

CeladonCafe_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $6, 9, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $7, $7, 9, GROUP_CELADON_CITY, MAP_CELADON_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 5, $0, EatathonContestPoster
	signpost 1, 7, $0, CeladonCafeTrashcan

	; people-events
	db 5
	person_event SPRITE_SUPER_NERD, 7, 13, $8, $0, 255, 255, $b0, 0, SuperNerdScript_0x73049, $ffff
	person_event SPRITE_FISHER, 10, 8, $8, $0, 255, 255, $0, 0, FisherScript_0x73051, $ffff
	person_event SPRITE_FISHER, 11, 5, $9, $0, 255, 255, $a0, 0, FisherScript_0x73062, $ffff
	person_event SPRITE_FISHER, 6, 5, $9, $0, 255, 255, $0, 0, FisherScript_0x73073, $ffff
	person_event SPRITE_TEACHER, 7, 8, $8, $0, 255, 255, $0, 0, TeacherScript_0x73084, $ffff
