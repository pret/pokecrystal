BillsHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GrampsScript_0x189538:
	faceplayer
	loadfont
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x1896ba
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue UnknownScript_0x1896c0
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue UnknownScript_0x189553
	writetext UnknownText_0x1896ce
	keeptextopen
	setevent EVENT_MET_BILLS_GRANDPA
UnknownScript_0x189553:
	checkevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	iftrue UnknownScript_0x189697
	checkevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	iftrue UnknownScript_0x189680
	checkevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	iftrue UnknownScript_0x189669
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue UnknownScript_0x189652
	checkevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	iftrue UnknownScript_0x18963b
	writetext UnknownText_0x1898c0
	keeptextopen
	writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	scall UnknownScript_0x1896a5
	special Function73f7
	iffalse UnknownScript_0x1896aa
	if_not_equal LICKITUNG, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	jump UnknownScript_0x18963b

UnknownScript_0x189592:
	writetext UnknownText_0x1898ff
	keeptextopen
	writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	scall UnknownScript_0x1896a5
	special Function73f7
	iffalse UnknownScript_0x1896aa
	if_not_equal ODDISH, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	jump UnknownScript_0x189652

UnknownScript_0x1895b3:
	writetext UnknownText_0x189953
	keeptextopen
	writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	scall UnknownScript_0x1896a5
	special Function73f7
	iffalse UnknownScript_0x1896aa
	if_not_equal STARYU, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	jump UnknownScript_0x189669

UnknownScript_0x1895d4:
	checkver
	iftrue UnknownScript_0x1895f9
	writetext UnknownText_0x1899fe
	keeptextopen
	writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	scall UnknownScript_0x1896a5
	special Function73f7
	iffalse UnknownScript_0x1896aa
	if_not_equal GROWLITHE, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	jump UnknownScript_0x189680

UnknownScript_0x1895f9:
	writetext UnknownText_0x189a57
	keeptextopen
	writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	scall UnknownScript_0x1896a5
	special Function73f7
	iffalse UnknownScript_0x1896aa
	if_not_equal VULPIX, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	jump UnknownScript_0x189680

UnknownScript_0x18961a:
	writetext UnknownText_0x189ab1
	keeptextopen
	writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	scall UnknownScript_0x1896a5
	special Function73f7
	iffalse UnknownScript_0x1896aa
	if_not_equal PICHU, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	jump UnknownScript_0x189697

UnknownScript_0x18963b:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue UnknownScript_0x189592
	scall UnknownScript_0x1896b5
	verbosegiveitem EVERSTONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_GAVE_KURT_APRICORNS
	loadmovesprites
	end

UnknownScript_0x189652:
	checkevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	iftrue UnknownScript_0x1895b3
	scall UnknownScript_0x1896b5
	verbosegiveitem LEAF_STONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_GAVE_KURT_APRICORNS
	loadmovesprites
	end

UnknownScript_0x189669:
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue UnknownScript_0x1895d4
	scall UnknownScript_0x1896b5
	verbosegiveitem WATER_STONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_GAVE_KURT_APRICORNS
	loadmovesprites
	end

UnknownScript_0x189680:
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue UnknownScript_0x18961a
	scall UnknownScript_0x1896b5
	verbosegiveitem FIRE_STONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_GAVE_KURT_APRICORNS
	loadmovesprites
	end

UnknownScript_0x189697:
	scall UnknownScript_0x1896b5
	verbosegiveitem THUNDERSTONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	loadmovesprites
	end

UnknownScript_0x1896a5:
	writetext UnknownText_0x189760
	keeptextopen
	end

UnknownScript_0x1896aa:
	writetext UnknownText_0x189784
	closetext
	loadmovesprites
	end

UnknownScript_0x1896b0:
	writetext UnknownText_0x1897a6
	keeptextopen
	end

UnknownScript_0x1896b5:
	writetext UnknownText_0x1897e1
	keeptextopen
	end

UnknownScript_0x1896ba:
	writetext UnknownText_0x18980e
	closetext
	loadmovesprites
	end

UnknownScript_0x1896c0:
	writetext UnknownText_0x18982a
	closetext
	loadmovesprites
	end

UnknownScript_0x1896c6:
	writetext UnknownText_0x189891
	closetext
	loadmovesprites
	end

UnknownScript_0x1896cc:
	loadmovesprites
	end

UnknownText_0x1896ce:
	text "Hm? You know BILL?"
	line "He's my grandson."

	para "He's in JOHTO. He"
	line "does something"

	para "with PCs, so I'm"
	line "house-sitting."
	done

UnknownText_0x189732:
	text "If you have that"
	line "#MON, may I see"
	cont "it, please?"
	done

UnknownText_0x189760:
	text "You will show me?"
	line "How good of you!"
	done

UnknownText_0x189784:
	text "You don't have it?"
	line "That's too bad…"
	done

UnknownText_0x1897a6:
	text "Ah, so that is"
	line "@"
	text_from_ram StringBuffer3
	text "?"

	para "Isn't it cute!"
	line "That's so kind of"
	cont "you."
	done

UnknownText_0x1897e1:
	text "Thanks!"

	para "This is a token of"
	line "my appreciation."
	done

UnknownText_0x18980e:
	text "Come visit again"
	line "sometime."
	done

UnknownText_0x18982a:
	text "Thanks for showing"
	line "me so many cute"
	cont "#MON."

	para "I really enjoyed"
	line "myself. I'm glad"

	para "I've lived such a"
	line "long life."
	done

UnknownText_0x189891:
	text "Hm?"

	para "That's not the"
	line "#MON that I was"
	cont "told about."
	done

UnknownText_0x1898c0:
	text "My grandson BILL"
	line "told me about a"

	para "#MON that has a"
	line "long tongue."
	done

UnknownText_0x1898ff:
	text "Ah, my grandson"
	line "mentioned a round,"

	para "green #MON that"
	line "has leaves growing"
	cont "on its head."
	done

UnknownText_0x189953:
	text "Do you know of a"
	line "sea #MON that"

	para "has a red sphere"
	line "in its body?"

	para "You know, the one"
	line "that's shaped like"
	cont "a star?"

	para "I heard that it"
	line "appears at night."

	para "I would surely"
	line "like to see it."
	done

UnknownText_0x1899fe:
	text "BILL told me about"
	line "a #MON that is"

	para "very loyal to its"
	line "trainer."

	para "It's supposed to"
	line "ROAR well."
	done

UnknownText_0x189a57:
	text "I heard about a"
	line "cute #MON that"
	cont "has six tails."

	para "I would love to"
	line "hug a cute #MON"
	cont "like that."
	done

UnknownText_0x189ab1:
	text "Do you know that"
	line "hugely popular"
	cont "#MON?"

	para "The #MON that"
	line "has a yellow body"
	cont "and red cheeks."

	para "I would love to"
	line "see what it looks"

	para "like before it"
	line "evolves."
	done

BillsHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_25, MAP_ROUTE_25
	warp_def $7, $3, 1, GROUP_ROUTE_25, MAP_ROUTE_25

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_GRAMPS, 7, 6, OW_UP | $3, $20, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, GrampsScript_0x189538, -1
