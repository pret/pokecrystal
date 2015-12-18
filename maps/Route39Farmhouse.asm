const_value set 2
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F

Route39Farmhouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x9ceb4:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cec5
	writetext UnknownText_0x9cf38
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

UnknownScript_0x9cec5:
	checkitem MOOMOO_MILK
	iftrue UnknownScript_0x9cf08
	writetext UnknownText_0x9cfe1
	special PlaceMoneyTopRight
	yesorno
	iffalse UnknownScript_0x9cf02
	checkmoney $0, 500
	if_equal $2, UnknownScript_0x9cef6
	giveitem MOOMOO_MILK
	iffalse UnknownScript_0x9cefc
	takemoney $0, 500
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x9d05d
	buttonsound
	itemnotify
	closetext
	end

UnknownScript_0x9cef6:
	writetext UnknownText_0x9d07c
	waitbutton
	closetext
	end

UnknownScript_0x9cefc:
	writetext UnknownText_0x9d09d
	waitbutton
	closetext
	end

UnknownScript_0x9cf02:
	writetext UnknownText_0x9d0b7
	waitbutton
	closetext
	end

UnknownScript_0x9cf08:
	writetext UnknownText_0x9d0dc
	waitbutton
	closetext
	end

PokefanFScript_0x9cf0e:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue UnknownScript_0x9cf2f
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cf22
	writetext UnknownText_0x9d0f6
	waitbutton
	closetext
	end

UnknownScript_0x9cf22:
	writetext UnknownText_0x9d156
	buttonsound
	verbosegiveitem TM_SNORE
	iffalse UnknownScript_0x9cf33
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
UnknownScript_0x9cf2f:
	writetext UnknownText_0x9d1c7
	waitbutton
UnknownScript_0x9cf33:
	closetext
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
	warp_def $7, $2, 2, ROUTE_39
	warp_def $7, $3, 2, ROUTE_39

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, FarmhouseBookshelf
	signpost 1, 1, SIGNPOST_READ, FarmhouseBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_POKEFAN_M, 2, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x9ceb4, -1
	person_event SPRITE_POKEFAN_F, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x9cf0e, -1
