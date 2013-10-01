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
	2writetext UnknownText_0x1896ce
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
	2writetext UnknownText_0x1898c0
	keeptextopen
	2writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	2call UnknownScript_0x1896a5
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal LICKITUNG, UnknownScript_0x1896c6
	2call UnknownScript_0x1896b0
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	2jump UnknownScript_0x18963b
; 0x189592

UnknownScript_0x189592: ; 0x189592
	2writetext UnknownText_0x1898ff
	keeptextopen
	2writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	2call UnknownScript_0x1896a5
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal ODDISH, UnknownScript_0x1896c6
	2call UnknownScript_0x1896b0
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	2jump UnknownScript_0x189652
; 0x1895b3

UnknownScript_0x1895b3: ; 0x1895b3
	2writetext UnknownText_0x189953
	keeptextopen
	2writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	2call UnknownScript_0x1896a5
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal STARYU, UnknownScript_0x1896c6
	2call UnknownScript_0x1896b0
	setevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	2jump UnknownScript_0x189669
; 0x1895d4

UnknownScript_0x1895d4: ; 0x1895d4
	checkver
	iftrue UnknownScript_0x1895f9
	2writetext UnknownText_0x1899fe
	keeptextopen
	2writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	2call UnknownScript_0x1896a5
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal GROWLITHE, UnknownScript_0x1896c6
	2call UnknownScript_0x1896b0
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	2jump UnknownScript_0x189680
; 0x1895f9

UnknownScript_0x1895f9: ; 0x1895f9
	2writetext UnknownText_0x189a57
	keeptextopen
	2writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	2call UnknownScript_0x1896a5
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal VULPIX, UnknownScript_0x1896c6
	2call UnknownScript_0x1896b0
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	2jump UnknownScript_0x189680
; 0x18961a

UnknownScript_0x18961a: ; 0x18961a
	2writetext UnknownText_0x189ab1
	keeptextopen
	2writetext UnknownText_0x189732
	yesorno
	iffalse UnknownScript_0x1896aa
	2call UnknownScript_0x1896a5
	special $004d
	iffalse UnknownScript_0x1896aa
	if_not_equal PICHU, UnknownScript_0x1896c6
	2call UnknownScript_0x1896b0
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	2jump UnknownScript_0x189697
; 0x18963b

UnknownScript_0x18963b: ; 0x18963b
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue UnknownScript_0x189592
	2call UnknownScript_0x1896b5
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
	2call UnknownScript_0x1896b5
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
	2call UnknownScript_0x1896b5
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
	2call UnknownScript_0x1896b5
	verbosegiveitem FIRE_STONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent $0000
	loadmovesprites
	end
; 0x189697

UnknownScript_0x189697: ; 0x189697
	2call UnknownScript_0x1896b5
	verbosegiveitem THUNDERSTONE, 1
	iffalse UnknownScript_0x1896cc
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	loadmovesprites
	end
; 0x1896a5

UnknownScript_0x1896a5: ; 0x1896a5
	2writetext UnknownText_0x189760
	keeptextopen
	end
; 0x1896aa

UnknownScript_0x1896aa: ; 0x1896aa
	2writetext UnknownText_0x189784
	closetext
	loadmovesprites
	end
; 0x1896b0

UnknownScript_0x1896b0: ; 0x1896b0
	2writetext UnknownText_0x1897a6
	keeptextopen
	end
; 0x1896b5

UnknownScript_0x1896b5: ; 0x1896b5
	2writetext UnknownText_0x1897e1
	keeptextopen
	end
; 0x1896ba

UnknownScript_0x1896ba: ; 0x1896ba
	2writetext UnknownText_0x18980e
	closetext
	loadmovesprites
	end
; 0x1896c0

UnknownScript_0x1896c0: ; 0x1896c0
	2writetext UnknownText_0x18982a
	closetext
	loadmovesprites
	end
; 0x1896c6

UnknownScript_0x1896c6: ; 0x1896c6
	2writetext UnknownText_0x189891
	closetext
	loadmovesprites
	end
; 0x1896cc

UnknownScript_0x1896cc: ; 0x1896cc
	loadmovesprites
	end
; 0x1896ce

UnknownText_0x1896ce: ; 0x1896ce
	db $0, "Hm? You know BILL?", $4f
	db "He's my grandson.", $51
	db "He's in JOHTO. He", $4f
	db "does something", $51
	db "with PCs, so I'm", $4f
	db "house-sitting.", $57
; 0x189732

UnknownText_0x189732: ; 0x189732
	db $0, "If you have that", $4f
	db "#MON, may I see", $55
	db "it, please?", $57
; 0x189760

UnknownText_0x189760: ; 0x189760
	db $0, "You will show me?", $4f
	db "How good of you!", $57
; 0x189784

UnknownText_0x189784: ; 0x189784
	db $0, "You don't have it?", $4f
	db "That's too bad…", $57
; 0x1897a6

UnknownText_0x1897a6: ; 0x1897a6
	db $0, "Ah, so that is", $4f
	db "@"
	text_from_ram $d099
	db $0, "?", $51
	db "Isn't it cute!", $4f
	db "That's so kind of", $55
	db "you.", $57
; 0x1897e1

UnknownText_0x1897e1: ; 0x1897e1
	db $0, "Thanks!", $51
	db "This is a token of", $4f
	db "my appreciation.", $57
; 0x18980e

UnknownText_0x18980e: ; 0x18980e
	db $0, "Come visit again", $4f
	db "sometime.", $57
; 0x18982a

UnknownText_0x18982a: ; 0x18982a
	db $0, "Thanks for showing", $4f
	db "me so many cute", $55
	db "#MON.", $51
	db "I really enjoyed", $4f
	db "myself. I'm glad", $51
	db "I've lived such a", $4f
	db "long life.", $57
; 0x189891

UnknownText_0x189891: ; 0x189891
	db $0, "Hm?", $51
	db "That's not the", $4f
	db "#MON that I was", $55
	db "told about.", $57
; 0x1898c0

UnknownText_0x1898c0: ; 0x1898c0
	db $0, "My grandson BILL", $4f
	db "told me about a", $51
	db "#MON that has a", $4f
	db "long tongue.", $57
; 0x1898ff

UnknownText_0x1898ff: ; 0x1898ff
	db $0, "Ah, my grandson", $4f
	db "mentioned a round,", $51
	db "green #MON that", $4f
	db "has leaves growing", $55
	db "on its head.", $57
; 0x189953

UnknownText_0x189953: ; 0x189953
	db $0, "Do you know of a", $4f
	db "sea #MON that", $51
	db "has a red sphere", $4f
	db "in its body?", $51
	db "You know, the one", $4f
	db "that's shaped like", $55
	db "a star?", $51
	db "I heard that it", $4f
	db "appears at night.", $51
	db "I would surely", $4f
	db "like to see it.", $57
; 0x1899fe

UnknownText_0x1899fe: ; 0x1899fe
	db $0, "BILL told me about", $4f
	db "a #MON that is", $51
	db "very loyal to its", $4f
	db "trainer.", $51
	db "It's supposed to", $4f
	db "ROAR well.", $57
; 0x189a57

UnknownText_0x189a57: ; 0x189a57
	db $0, "I heard about a", $4f
	db "cute #MON that", $55
	db "has six tails.", $51
	db "I would love to", $4f
	db "hug a cute #MON", $55
	db "like that.", $57
; 0x189ab1

UnknownText_0x189ab1: ; 0x189ab1
	db $0, "Do you know that", $4f
	db "hugely popular", $55
	db "#MON?", $51
	db "The #MON that", $4f
	db "has a yellow body", $55
	db "and red cheeks.", $51
	db "I would love to", $4f
	db "see what it looks", $51
	db "like before it", $4f
	db "evolves.", $57
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

