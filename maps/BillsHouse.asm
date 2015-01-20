BillsHouse_MapScriptHeader: ; 0x189536
	; trigger count
	db 0

	; callback count
	db 0
; 0x189538

GrampsScript_0x189538: ; 0x189538
	faceplayer
	loadfont
	checkevent $0000
	iftrue UnknownScript_0x1896ba
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue UnknownScript_0x1896c0
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue UnknownScript_0x189553
	writetext UnknownText_0x1896ce
	keeptextopen
	setevent EVENT_MET_BILLS_GRANDPA
UnknownScript_0x189553: ; 0x189553
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
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal LICKITUNG, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	jump UnknownScript_0x18963b
; 0x189592

UnknownScript_0x189592: ; 0x189592
	writetext UnknownText_0x1898ff
	keeptextopen
	writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	scall UnknownScript_0x1896a5
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal ODDISH, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	jump UnknownScript_0x189652
; 0x1895b3

UnknownScript_0x1895b3: ; 0x1895b3
	writetext UnknownText_0x189953
	keeptextopen
	writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	scall UnknownScript_0x1896a5
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal STARYU, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	jump UnknownScript_0x189669
; 0x1895d4

UnknownScript_0x1895d4: ; 0x1895d4
	checkver
	iftrue UnknownScript_0x1895f9
	writetext UnknownText_0x1899fe
	keeptextopen
	writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	scall UnknownScript_0x1896a5
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal GROWLITHE, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	jump UnknownScript_0x189680
; 0x1895f9

UnknownScript_0x1895f9: ; 0x1895f9
	writetext UnknownText_0x189a57
	keeptextopen
	writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	scall UnknownScript_0x1896a5
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal VULPIX, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	jump UnknownScript_0x189680
; 0x18961a

UnknownScript_0x18961a: ; 0x18961a
	writetext UnknownText_0x189ab1
	keeptextopen
	writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	scall UnknownScript_0x1896a5
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal PICHU, UnknownScript_0x1896c6
	scall UnknownScript_0x1896b0
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	jump UnknownScript_0x189697
; 0x18963b

UnknownScript_0x18963b: ; 0x18963b
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue UnknownScript_0x189592
	scall UnknownScript_0x1896b5
	verbosegiveitem EVERSTONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	setevent $0000
	loadmovesprites
	end
; 0x189652

UnknownScript_0x189652: ; 0x189652
	checkevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	iftrue UnknownScript_0x1895b3
	scall UnknownScript_0x1896b5
	verbosegiveitem LEAF_STONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	setevent $0000
	loadmovesprites
	end
; 0x189669

UnknownScript_0x189669: ; 0x189669
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue UnknownScript_0x1895d4
	scall UnknownScript_0x1896b5
	verbosegiveitem WATER_STONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	setevent $0000
	loadmovesprites
	end
; 0x189680

UnknownScript_0x189680: ; 0x189680
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue UnknownScript_0x18961a
	scall UnknownScript_0x1896b5
	verbosegiveitem FIRE_STONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent $0000
	loadmovesprites
	end
; 0x189697

UnknownScript_0x189697: ; 0x189697
	scall UnknownScript_0x1896b5
	verbosegiveitem THUNDERSTONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	loadmovesprites
	end
; 0x1896a5

UnknownScript_0x1896a5: ; 0x1896a5
	writetext UnknownText_0x189760
	keeptextopen
	end
; 0x1896aa

UnknownScript_0x1896aa: ; 0x1896aa
	writetext UnknownText_0x189784
	closetext
	loadmovesprites
	end
; 0x1896b0

UnknownScript_0x1896b0: ; 0x1896b0
	writetext UnknownText_0x1897a6
	keeptextopen
	end
; 0x1896b5

UnknownScript_0x1896b5: ; 0x1896b5
	writetext UnknownText_0x1897e1
	keeptextopen
	end
; 0x1896ba

UnknownScript_0x1896ba: ; 0x1896ba
	writetext UnknownText_0x18980e
	closetext
	loadmovesprites
	end
; 0x1896c0

UnknownScript_0x1896c0: ; 0x1896c0
	writetext UnknownText_0x18982a
	closetext
	loadmovesprites
	end
; 0x1896c6

UnknownScript_0x1896c6: ; 0x1896c6
	writetext UnknownText_0x189891
	closetext
	loadmovesprites
	end
; 0x1896cc

UnknownScript_0x1896cc: ; 0x1896cc
	loadmovesprites
	end
; 0x1896ce

UnknownText_0x1896ce: ; 0x1896ce
	text "Hm? You know BILL?"
	line "He's my grandson."

	para "He's in JOHTO. He"
	line "does something"

	para "with PCs, so I'm"
	line "house-sitting."
	done
; 0x189732

UnknownText_0x189732: ; 0x189732
	text "If you have that"
	line "#MON, may I see"
	cont "it, please?"
	done
; 0x189760

UnknownText_0x189760: ; 0x189760
	text "You will show me?"
	line "How good of you!"
	done
; 0x189784

UnknownText_0x189784: ; 0x189784
	text "You don't have it?"
	line "That's too bad…"
	done
; 0x1897a6

UnknownText_0x1897a6: ; 0x1897a6
	text "Ah, so that is"
	line "@"
	text_from_ram $d099
	text "?"

	para "Isn't it cute!"
	line "That's so kind of"
	cont "you."
	done
; 0x1897e1

UnknownText_0x1897e1: ; 0x1897e1
	text "Thanks!"

	para "This is a token of"
	line "my appreciation."
	done
; 0x18980e

UnknownText_0x18980e: ; 0x18980e
	text "Come visit again"
	line "sometime."
	done
; 0x18982a

UnknownText_0x18982a: ; 0x18982a
	text "Thanks for showing"
	line "me so many cute"
	cont "#MON."

	para "I really enjoyed"
	line "myself. I'm glad"

	para "I've lived such a"
	line "long life."
	done
; 0x189891

UnknownText_0x189891: ; 0x189891
	text "Hm?"

	para "That's not the"
	line "#MON that I was"
	cont "told about."
	done
; 0x1898c0

UnknownText_0x1898c0: ; 0x1898c0
	text "My grandson BILL"
	line "told me about a"

	para "#MON that has a"
	line "long tongue."
	done
; 0x1898ff

UnknownText_0x1898ff: ; 0x1898ff
	text "Ah, my grandson"
	line "mentioned a round,"

	para "green #MON that"
	line "has leaves growing"
	cont "on its head."
	done
; 0x189953

UnknownText_0x189953: ; 0x189953
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
; 0x1899fe

UnknownText_0x1899fe: ; 0x1899fe
	text "BILL told me about"
	line "a #MON that is"

	para "very loyal to its"
	line "trainer."

	para "It's supposed to"
	line "ROAR well."
	done
; 0x189a57

UnknownText_0x189a57: ; 0x189a57
	text "I heard about a"
	line "cute #MON that"
	cont "has six tails."

	para "I would love to"
	line "hug a cute #MON"
	cont "like that."
	done
; 0x189ab1

UnknownText_0x189ab1: ; 0x189ab1
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
; 0x189b42

BillsHouse_MapEventHeader: ; 0x189b42
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_25, MAP_ROUTE_25
	warp_def $7, $3, 1, GROUP_ROUTE_25, MAP_ROUTE_25

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_GRAMPS, 7, 6, $7, $20, 255, 255, $90, 0, GrampsScript_0x189538, $ffff
; 0x189b5f

