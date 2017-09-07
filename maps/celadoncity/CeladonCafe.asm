const_value set 2
	const CELADONCAFE_SUPER_NERD
	const CELADONCAFE_FISHER1
	const CELADONCAFE_FISHER2
	const CELADONCAFE_FISHER3
	const CELADONCAFE_TEACHER

CeladonCafe_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

SuperNerdScript_0x73049:
	faceplayer
	opentext
	writetext UnknownText_0x730de
	waitbutton
	closetext
	end

FisherScript_0x73051:
	opentext
	writetext UnknownText_0x73129
	waitbutton
	closetext
	faceplayer
	opentext
	writetext UnknownText_0x7313a
	waitbutton
	closetext
	spriteface CELADONCAFE_FISHER1, LEFT
	end

FisherScript_0x73062:
	opentext
	writetext UnknownText_0x7316a
	waitbutton
	closetext
	faceplayer
	opentext
	writetext UnknownText_0x73178
	waitbutton
	closetext
	spriteface CELADONCAFE_FISHER2, RIGHT
	end

FisherScript_0x73073:
	opentext
	writetext UnknownText_0x731ae
	waitbutton
	closetext
	faceplayer
	opentext
	writetext UnknownText_0x731bd
	waitbutton
	closetext
	spriteface CELADONCAFE_FISHER3, RIGHT
	end

TeacherScript_0x73084:
	checkitem COIN_CASE
	iftrue UnknownScript_0x7309a
	opentext
	writetext UnknownText_0x73201
	waitbutton
	closetext
	faceplayer
	opentext
	writetext UnknownText_0x73212
	waitbutton
	closetext
	spriteface CELADONCAFE_TEACHER, LEFT
	end

UnknownScript_0x7309a:
	opentext
	writetext UnknownText_0x73254
	waitbutton
	closetext
	spriteface CELADONCAFE_TEACHER, RIGHT
	opentext
	writetext UnknownText_0x73278
	waitbutton
	closetext
	spriteface CELADONCAFE_TEACHER, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

CeladonCafeTrashcan:
	checkevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	iftrue .TrashEmpty
	giveitem LEFTOVERS
	iffalse .PackFull
	opentext
	itemtotext LEFTOVERS, $0
	writetext FoundLeftoversText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	end

.PackFull:
	opentext
	itemtotext LEFTOVERS, $0
	writetext FoundLeftoversText
	buttonsound
	writetext NoRoomForLeftoversText
	waitbutton
	closetext
	end

.TrashEmpty:
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

.Warps:
	db 2
	warp_def $7, $6, 9, CELADON_CITY
	warp_def $7, $7, 9, CELADON_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 5, SIGNPOST_READ, EatathonContestPoster
	signpost 1, 7, SIGNPOST_READ, CeladonCafeTrashcan

.PersonEvents:
	db 5
	person_event SPRITE_SUPER_NERD, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x73049, -1
	person_event SPRITE_FISHER, 6, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FisherScript_0x73051, -1
	person_event SPRITE_FISHER, 7, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x73062, -1
	person_event SPRITE_FISHER, 2, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FisherScript_0x73073, -1
	person_event SPRITE_TEACHER, 3, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x73084, -1
