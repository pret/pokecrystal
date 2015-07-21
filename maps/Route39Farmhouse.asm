Route39Farmhouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x9ceb4:
	faceplayer
	loadfont
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cec5
	writetext UnknownText_0x9cf38
	closetext
	loadmovesprites
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

UnknownScript_0x9cec5:
	checkitem MOOMOO_MILK
	iftrue UnknownScript_0x9cf08
	writetext UnknownText_0x9cfe1
	special Function24ae8
	yesorno
	iffalse UnknownScript_0x9cf02
	checkmoney $0, 500
	if_equal $2, UnknownScript_0x9cef6
	giveitem MOOMOO_MILK, $1
	iffalse UnknownScript_0x9cefc
	takemoney $0, 500
	special Function24ae8
	waitbutton
	playsound SFX_TRANSACTION
	writetext UnknownText_0x9d05d
	keeptextopen
	itemnotify
	loadmovesprites
	end

UnknownScript_0x9cef6:
	writetext UnknownText_0x9d07c
	closetext
	loadmovesprites
	end

UnknownScript_0x9cefc:
	writetext UnknownText_0x9d09d
	closetext
	loadmovesprites
	end

UnknownScript_0x9cf02:
	writetext UnknownText_0x9d0b7
	closetext
	loadmovesprites
	end

UnknownScript_0x9cf08:
	writetext UnknownText_0x9d0dc
	closetext
	loadmovesprites
	end

PokefanFScript_0x9cf0e:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue UnknownScript_0x9cf2f
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cf22
	writetext UnknownText_0x9d0f6
	closetext
	loadmovesprites
	end

UnknownScript_0x9cf22:
	writetext UnknownText_0x9d156
	keeptextopen
	verbosegiveitem TM_SNORE, 1
	iffalse UnknownScript_0x9cf33
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
UnknownScript_0x9cf2f:
	writetext UnknownText_0x9d1c7
	closetext
UnknownScript_0x9cf33:
	loadmovesprites
	end

FarmhouseBookshelf:
	jumpstd picturebookshelf

UnknownText_0x9cf38:
	text "My MILTANK ain't"
	line "givin' me milk"
	cont "n'more."

	para "This here FARM's"
	line "got famous milk."

	para "Most everyone"
	line "wants a drink."

	para "It'll give me lots"
	line "o' milk if'n I"

	para "feed it lots o'"
	line "BERRIES, I reckon."
	done

UnknownText_0x9cfe1:
	text "How'd you like my"
	line "MOOMOO MILK?"

	para "It's my pride and"
	line "joy, there."

	para "Give it to #MON"
	line "to restore HP!"

	para "I'll give it to ya"
	line "fer just ¥500."
	done

UnknownText_0x9d05d:
	text "Here ya go!"
	line "Drink up'n enjoy!"
	done

UnknownText_0x9d07c:
	text "Sorry, there."
	line "No cash, no sale!"
	done

UnknownText_0x9d09d:
	text "I reckon yer"
	line "PACK's full."
	done

UnknownText_0x9d0b7:
	text "You don't want it?"
	line "Come again, hear?"
	done

UnknownText_0x9d0dc:
	text "I best go do my"
	line "milkin'."
	done

UnknownText_0x9d0f6:
	text "Our milk even goes"
	line "out to KANTO."

	para "So if our own"
	line "MILTANK won't give"

	para "us any milk, we're"
	line "in trouble."
	done

UnknownText_0x9d156:
	text "You fixed our"
	line "MILTANK, hon. Now"

	para "it gives MOOMOO"
	line "MILK again."

	para "Here's somethin'"
	line "fer your trouble."
	done

UnknownText_0x9d1b5:
	text "<PLAYER> received"
	line "TM13."
	done

UnknownText_0x9d1c7:
	text "That there's"
	line "SNORE."

	para "It's a rare move"
	line "that only works"

	para "while the #MON"
	line "is asleep."

	para "You best think how"
	line "you ought to use"
	cont "it, hon."
	done

Route39Farmhouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 2, GROUP_ROUTE_39, MAP_ROUTE_39
	warp_def $7, $3, 2, GROUP_ROUTE_39, MAP_ROUTE_39

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, FarmhouseBookshelf
	signpost 1, 1, SIGNPOST_READ, FarmhouseBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_POKEFAN_M, 6, 7, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, PokefanMScript_0x9ceb4, -1
	person_event SPRITE_POKEFAN_F, 8, 9, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, PokefanFScript_0x9cf0e, -1
