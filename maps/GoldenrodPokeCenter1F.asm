GoldenrodPokeCenter1F_MapScriptHeader: ; 0x60f8f
	; trigger count
	db 0

	; callback count
	db 0
; 0x60f91

UnknownScript_0x60f91: ; 0x60f91
	jumpstd $0000
; 0x60f94

UnknownScript_0x60f94: ; 0x60f94
	writebyte $b
	special $0086
	if_equal $b, UnknownScript_0x60f9e
	end
; 0x60f9e

UnknownScript_0x60f9e: ; 0x60f9e
	checkbit1 $0340
	iftrue UnknownScript_0x60fd8
	playsound $0023
	moveperson $3, $0, $7
	disappear $3
	appear $3
	playmusic $0011
	applymovement $3, MovementData_0x6105a
	spriteface $0, $1
	loadfont
	2writetext UnknownText_0x622f0
	closetext
	verbosegiveitem GS_BALL, 1
	setbit1 $0340
	setbit1 $00be
	2writetext UnknownText_0x62359
	closetext
	loadmovesprites
	applymovement $3, MovementData_0x61060
	special $003d
	disappear $3
	playsound $0023
UnknownScript_0x60fd8: ; 0x60fd8
	end
; 0x60fd9

UnknownScript_0x60fd9: ; 0x60fd9
	writebyte $b
	special $0086
	if_equal $b, UnknownScript_0x60fe3
	end
; 0x60fe3

UnknownScript_0x60fe3: ; 0x60fe3
	checkbit1 $0340
	iftrue UnknownScript_0x6101d
	playsound $0023
	moveperson $3, $0, $7
	disappear $3
	appear $3
	playmusic $0011
	applymovement $3, MovementData_0x61065
	spriteface $0, $1
	loadfont
	2writetext UnknownText_0x622f0
	closetext
	verbosegiveitem GS_BALL, 1
	setbit1 $0340
	setbit1 $00be
	2writetext UnknownText_0x62359
	closetext
	loadmovesprites
	applymovement $3, MovementData_0x6106c
	special $003d
	disappear $3
	playsound $0023
UnknownScript_0x6101d: ; 0x6101d
	end
; 0x6101e

UnknownScript_0x6101e: ; 0x6101e
	jumptextfaceplayer UnknownText_0x62105
; 0x61021

UnknownScript_0x61021: ; 0x61021
	jumptextfaceplayer UnknownText_0x62260
; 0x61024

UnknownScript_0x61024: ; 0x61024
	faceplayer
	loadfont
	2writetext UnknownText_0x623fb
	closetext
	2writetext UnknownText_0x6248c
	yesorno
	iffalse UnknownScript_0x6104b
	takeitem EON_MAIL, 1
	iffalse UnknownScript_0x6104b
	2writetext UnknownText_0x62549
	closetext
	2writetext UnknownText_0x624a4
	closetext
	verbosegiveitem REVIVE, 1
	iffalse UnknownScript_0x61051
	2writetext UnknownText_0x624e9
	closetext
	loadmovesprites
	end
; 0x6104b

UnknownScript_0x6104b: ; 0x6104b
	2writetext UnknownText_0x62509
	closetext
	loadmovesprites
	end
; 0x61051

UnknownScript_0x61051: ; 0x61051
	giveitem EON_MAIL, $1
	2writetext UnknownText_0x6252a
	closetext
	loadmovesprites
	end
; 0x6105a

MovementData_0x6105a: ; 0x6105a
	step_up
	step_right
	step_right
	step_right
	turn_head_down
	step_end
; 0x61060

MovementData_0x61060: ; 0x61060
	step_left
	step_left
	step_left
	step_down
	step_end
; 0x61065

MovementData_0x61065: ; 0x61065
	step_up
	step_right
	step_right
	step_right
	step_right
	turn_head_down
	step_end
; 0x6106c

MovementData_0x6106c: ; 0x6106c
	step_left
	step_left
	step_left
	step_left
	step_down
	step_end
; 0x61072

; unused
UnknownText_0x61072: ; 0x61072
	db $0, "Hello! Welcome to", $4f
	db "#COM CENTER", $55
	db "TRADE CORNER.", $51
	db "You can trade", $4f
	db "#MON with other", $55
	db "people far away.", $57
; 0x610ce

UnknownText_0x610ce: ; 0x610ce
	db $0, "To make a trade,", $4f
	db "we must hold your", $55
	db "#MON.", $51
	db "Would you like to", $4f
	db "trade?", $57
; 0x61111

UnknownText_0x61111: ; 0x61111
	db $0, "What kind of", $4f
	db "#MON do you", $55
	db "want in return?", $57
; 0x6113b

UnknownText_0x6113b: ; 0x6113b
	db $0, "Fine. We will try", $4f
	db "to trade your", $51
	db "@"
	text_from_ram $d099
	db $0, " for", $4f
	db "@"
	text_from_ram $d0ac
	db $0, ".", $51
	db "We'll have to hold", $4f
	db "your #MON", $55
	db "during the trade.", $51
	db "Please wait while", $4f
	db "we prepare the", $55
	db "room for it.", $57
; 0x611c9

UnknownText_0x611c9: ; 0x611c9
	db $0, "Fine. We will try", $4f
	db "to trade your", $51
	db "@"
	text_from_ram $d099
	db $0, " for a", $4f
	db "#MON that you", $55
	db "have never seen.", $51
	db "We'll have to hold", $4f
	db "your #MON", $55
	db "during the trade.", $51
	db "Please wait while", $4f
	db "we prepare the", $55
	db "room for it.", $57
; 0x61271

UnknownText_0x61271: ; 0x61271
	db $0, "Your trade #MON", $4f
	db "has been received.", $51
	db "It will take time", $4f
	db "to find a trade", $51
	db "partner. Please", $4f
	db "come back later.", $57
; 0x612d8

UnknownText_0x612d8: ; 0x612d8
	db $0, "Oh? You have only", $4f
	db "one #MON in", $55
	db "your party. ", $51
	db "Please come back", $4f
	db "once you've in-", $55
	db "creased the size", $55
	db "of your party.", $57
; 0x61344

UnknownText_0x61344: ; 0x61344
	db $0, "We hope to see you", $4f
	db "again.", $57
; 0x6135f

UnknownText_0x6135f: ; 0x6135f
	db $0, "Communication", $4f
	db "error…", $57
; 0x61375

UnknownText_0x61375: ; 0x61375
	db $0, "If we accept that", $4f
	db "#MON, what will", $55
	db "you battle with?", $57
; 0x613a9

UnknownText_0x613a9: ; 0x613a9
	db $0, "Sorry. We can't", $4f
	db "accept an EGG.", $57
; 0x613c8

UnknownText_0x613c8: ; 0x613c8
	db $0, "Sorry, but your", $4f
	db "#MON appears to", $51
	db "be abnormal. We", $4f
	db "can't accept it.", $57
; 0x61409

UnknownText_0x61409: ; 0x61409
	db $0, "Oh? Aren't we", $4f
	db "already holding a", $55
	db "#MON of yours?", $57
; 0x61438

UnknownText_0x61438: ; 0x61438
	db $0, "We'll check the", $4f
	db "rooms.", $51
	db "Please wait.", $57
; 0x6145c

UnknownText_0x6145c: ; 0x6145c
	db $0, "Thank you for your", $4f
	db "patience.", $51
	db "A trade partner", $4f
	db "has been found.", $57
; 0x6149a

UnknownText_0x6149a: ; 0x6149a
	db $0, "It's your new", $4f
	db "partner.", $51
	db "Please take care", $4f
	db "of it with love.", $51
	db "We hope to see you", $4f
	db "again.", $57
; 0x614ed

UnknownText_0x614ed: ; 0x614ed
	db $0, "Uh-oh. Your party", $4f
	db "is already full.", $51
	db "Please come back", $4f
	db "when you have room", $55
	db "in your party.", $57
; 0x61544

UnknownText_0x61544: ; 0x61544
	db $0, "It's unfortunate,", $4f
	db "but no one has", $51
	db "come forward as a", $4f
	db "trade partner.", $51
	db "Would you like", $4f
	db "your #MON back?", $57
; 0x615a5

UnknownText_0x615a5: ; 0x615a5
	db $0, "We have returned", $4f
	db "your #MON.", $57
; 0x615c2

UnknownText_0x615c2: ; 0x615c2
	db $0, "It's unfortunate,", $4f
	db "but no one has", $51
	db "come forward as a", $4f
	db "trade partner.", $51
	db "We've held your", $4f
	db "#MON for a long", $51
	db "time. As a result,", $4f
	db "it is very lonely.", $51
	db "Sorry, but we must", $4f
	db "return it to you.", $57
; 0x6166e

UnknownText_0x6166e: ; 0x6166e
	db $0, "We hope to see you", $4f
	db "again.", $57
; 0x61689

UnknownText_0x61689: ; 0x61689
	db $0, "Fine. We will", $4f
	db "continue to hold", $55
	db "your #MON.", $57
; 0x616b4

UnknownText_0x616b4: ; 0x616b4
	db $0, "Oh? You left your", $4f
	db "#MON with us", $55
	db "only recently.", $51
	db "Please come back", $4f
	db "later.", $57
; 0x616fb

UnknownText_0x616fb: ; 0x616fb
	db $0, "We'll SAVE before", $4f
	db "connecting to the", $55
	db "CENTER.", $57
; 0x61727

UnknownText_0x61727: ; 0x61727
	db $0, "Which #MON do", $4f
	db "you want to trade?", $57
; 0x61749

UnknownText_0x61749: ; 0x61749
	db $0, "Sorry, but we must", $4f
	db "cancel the trade.", $57
; 0x6176f

UnknownText_0x6176f: ; 0x6176f
	db $0, "Oh!", $51
	db "I see you have an", $4f
	db "EGG TICKET!", $51
	db "It's a coupon that", $4f
	db "special people can", $51
	db "redeem for a", $4f
	db "special #MON!", $57
; 0x617d2

UnknownText_0x617d2: ; 0x617d2
	db $0, "Let me give you a", $4f
	db "quick briefing.", $51
	db "Trades held at the", $4f
	db "TRADE CORNER are", $51
	db "between two", $4f
	db "trainers who don't", $51
	db "know each other's", $4f
	db "identity.", $51
	db "As a result, it", $4f
	db "may take time.", $51
	db "However, an ODD", $4f
	db "EGG is available", $55
	db "just for you.", $51
	db "It will be sent to", $4f
	db "you right away.", $51
	db "Please choose one", $4f
	db "of the rooms in", $51
	db "the CENTER.", $4f
	db "An ODD EGG will be", $51
	db "sent from the", $4f
	db "chosen room.", $57
; 0x6191f

UnknownText_0x6191f: ; 0x6191f
	db $0, "Please wait a", $4f
	db "moment.", $57
; 0x61936

UnknownText_0x61936: ; 0x61936
	db $0, "Thank you for", $4f
	db "waiting.", $51
	db "We received your", $4f
	db "ODD EGG.", $51
	db "Here it is!", $51
	db "Please raise it", $4f
	db "with loving care.", $57
; 0x61996

UnknownText_0x61996: ; 0x61996
	db $0, "I'm awfully sorry.", $51
	db "The EGG TICKET", $4f
	db "exchange service", $55
	db "isn't running now.", $57
; 0x619db

UnknownText_0x619db: ; 0x619db
	db $0, "It's a #MON", $4f
	db "NEWS MACHINE.", $57
; 0x619f5

UnknownText_0x619f5: ; 0x619f5
	db $0, "What would you", $4f
	db "like to do?", $57
; 0x61a11

UnknownText_0x61a11: ; 0x61a11
	db $0, "#MON NEWS is", $4f
	db "news compiled from", $51
	db "the SAVE files of", $4f
	db "#MON trainers.", $51
	db "When reading the", $4f
	db "NEWS, your SAVE", $51
	db "file may be sent", $4f
	db "out.", $51
	db "The SAVE file data", $4f
	db "will contain your", $51
	db "adventure log and", $4f
	db "mobile profile.", $51
	db "Your phone number", $4f
	db "will not be sent.", $51
	db "The contents of", $4f
	db "the NEWS will vary", $51
	db "depending on the", $4f
	db "SAVE files sent by", $51
	db "you and the other", $4f
	db "#MON trainers.", $51
	db "You might even be", $4f
	db "in the NEWS!", $57
; 0x61b7c

UnknownText_0x61b7c: ; 0x61b7c
	db $0, "Would you like to", $4f
	db "get the NEWS?", $57
; 0x61b9d

UnknownText_0x61b9d: ; 0x61b9d
	db $0, "Reading the latest", $4f
	db "NEWS… Please wait.", $57
; 0x61bc4

UnknownText_0x61bc4: ; 0x61bc4
	db $0, "There is no old", $4f
	db "NEWS…", $57
; 0x61bdb

UnknownText_0x61bdb: ; 0x61bdb
	db $0, "The NEWS data is", $4f
	db "corrupted.", $51
	db "Please download", $4f
	db "the NEWS again.", $57
; 0x61c18

UnknownText_0x61c18: ; 0x61c18
	db $0, "We're making", $4f
	db "preparations.", $51
	db "Please come back", $4f
	db "later.", $57
; 0x61c4b

UnknownText_0x61c4b: ; 0x61c4b
	db $0, "We will SAVE your", $4f
	db "progress before", $51
	db "starting the NEWS", $4f
	db "MACHINE.", $57
; 0x61c89

UnknownText_0x61c89: ; 0x61c89
	db $0, "Whoa, this #MON", $4f
	db "CENTER is huge.", $51
	db "They just built", $4f
	db "this place. They", $51
	db "installed lots of", $4f
	db "new machines too.", $57
; 0x61cef

UnknownText_0x61cef: ; 0x61cef
	db $0, "I thought up a fun", $4f
	db "new thing for the", $55
	db "TRADE CORNER!", $51
	db "I make a PIDGEY", $4f
	db "hold MAIL, then", $51
	db "put it up for", $4f
	db "trade for another", $55
	db "one!", $51
	db "If everyone did", $4f
	db "that, MAIL could", $51
	db "be traded with all", $4f
	db "sorts of people!", $51
	db "I call it PIDGEY", $4f
	db "MAIL!", $51
	db "If it becomes", $4f
	db "popular, I might", $51
	db "make lots of new", $4f
	db "friends!", $57
; 0x61dfd

UnknownText_0x61dfd: ; 0x61dfd
	db $0, "They said you can", $4f
	db "trade #MON with", $51
	db "total strangers up", $4f
	db "here.", $51
	db "But they're still", $4f
	db "adjusting things.", $57
; 0x61e5c

UnknownText_0x61e5c: ; 0x61e5c
	db $0, "Some girl I don't", $4f
	db "know sent me her", $51
	db "HOPPIP.", $4f
	db "You should trade", $51
	db "for a #MON that", $4f
	db "you want.", $57
; 0x61eb2

UnknownText_0x61eb2: ; 0x61eb2
	db $0, "I received a", $4f
	db "female HOPPIP, but", $55
	db "its named STANLEY!", $51
	db "That's my dad's", $4f
	db "name!", $57
; 0x61efa

UnknownText_0x61efa: ; 0x61efa
	db $0, "What is the NEWS", $4f
	db "MACHINE?", $51
	db "Does it get news", $4f
	db "from a wider area", $55
	db "than the radio?", $57
; 0x61f48

UnknownText_0x61f48: ; 0x61f48
	db $0, "The #COM CENTER", $4f
	db "will link with all", $51
	db "#MON CENTERS in", $4f
	db "a wireless net.", $51
	db "That must mean", $4f
	db "I'll be able to", $51
	db "link with all", $4f
	db "sorts of people.", $57
; 0x61fc9

UnknownText_0x61fc9: ; 0x61fc9
	db $0, "The machines here", $4f
	db "can't be used yet.", $51
	db "Still, it's nice", $4f
	db "coming to a trendy", $51
	db "place before other", $4f
	db "people.", $57
; 0x6202c

UnknownText_0x6202c: ; 0x6202c
	db $0, "My friend was in", $4f
	db "the NEWS a while", $51
	db "back. I was really", $4f
	db "surprised!", $57
; 0x6206d

UnknownText_0x6206d: ; 0x6206d
	db $0, "I get anxious if I", $4f
	db "don't check out", $55
	db "the latest NEWS!", $57
; 0x620a1

UnknownText_0x620a1: ; 0x620a1
	db $0, "If I get in the", $4f
	db "NEWS and become", $51
	db "famous, I bet I'll", $4f
	db "be adored.", $51
	db "I wonder how I", $4f
	db "could get in the", $55
	db "NEWS?", $57
; 0x62105

UnknownText_0x62105: ; 0x62105
	db $0, "The COLOSSEUM", $4f
	db "upstairs is for", $55
	db "link battles.", $51
	db "Battle records are", $4f
	db "posted on the", $51
	db "wall, so I can't", $4f
	db "afford to lose.", $57
; 0x62173

UnknownText_0x62173: ; 0x62173
	db $0, "I came over here", $4f
	db "when I got word", $51
	db "that GOLDENROD's", $4f
	db "#MON CENTER has", $51
	db "new machines that", $4f
	db "no one's ever seen", $55
	db "before.", $51
	db "But it looks like", $4f
	db "they're still busy", $51
	db "with all their", $4f
	db "preparations…", $57
; 0x62222

UnknownText_0x62222: ; 0x62222
	db $0, "Just seeing all", $4f
	db "these new things", $51
	db "here makes me feel", $4f
	db "younger!", $57
; 0x62260

UnknownText_0x62260: ; 0x62260
	db $0, "A higher level", $4f
	db "#MON doesn't", $55
	db "always win.", $51
	db "After all, it may", $4f
	db "have a type dis-", $55
	db "advantage.", $51
	db "I don't think", $4f
	db "there is a single", $51
	db "#MON that is", $4f
	db "the toughest.", $57
; 0x622f0

UnknownText_0x622f0: ; 0x622f0
	db $0, $52, ", isn't it?", $51
	db "Congratulations!", $51
	db "As a special deal,", $4f
	db "a GS BALL has been", $55
	db "sent just for you!", $51
	db "Please accept it!", $57
; 0x62359

UnknownText_0x62359: ; 0x62359
	db $0, "Please do come", $4f
	db "again!", $57
; 0x62370

UnknownText_0x62370: ; 0x62370
	db $0, "#COM CENTER", $4f
	db "1F INFORMATION", $51
	db "Left:", $4f
	db "ADMINISTRATION", $51
	db "Center:", $4f
	db "TRADE CORNER", $51
	db "Right:", $4f
	db "#MON NEWS", $57
; 0x623c7

UnknownText_0x623c7: ; 0x623c7
	db $0, "It's a #MON", $4f
	db "NEWS MACHINE!", $51
	db "It's not in", $4f
	db "operation yet…", $57
; 0x623fb

UnknownText_0x623fb: ; 0x623fb
	db $0, "Oh my, your pack", $4f
	db "looks so heavy!", $51
	db "Oh! Do you happen", $4f
	db "to have something", $55
	db "named EON MAIL?", $51
	db "My daughter is", $4f
	db "after one.", $51
	db "You can part with", $4f
	db "one, can't you?", $57
; 0x6248c

UnknownText_0x6248c: ; 0x6248c
	db $0, "Give away an EON", $4f
	db "MAIL?", $57
; 0x624a4

UnknownText_0x624a4: ; 0x624a4
	db $0, "Oh, that's great!", $4f
	db "Thank you, honey!", $51
	db "Here, this is for", $4f
	db "you in return!", $57
; 0x624e9

UnknownText_0x624e9: ; 0x624e9
	db $0, "My daughter will", $4f
	db "be delighted!", $57
; 0x62509

UnknownText_0x62509: ; 0x62509
	db $0, "Oh? You don't have", $4f
	db "one? Too bad.", $57
; 0x6252a

UnknownText_0x6252a: ; 0x6252a
	db $0, "Oh… Well, another", $4f
	db "time, then.", $57
; 0x62549

UnknownText_0x62549: ; 0x62549
	db $0, $52, " gave away", $4f
	db "the EON MAIL.", $57
; 0x62564

GoldenrodPokeCenter1F_MapEventHeader: ; 0x62564
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $7, $3, 15, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $4, 15, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $6, $0, 1, GROUP_GOLDENROD_POKECOM_CENTER_2F_MOBILE, MAP_GOLDENROD_POKECOM_CENTER_2F_MOBILE
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 2
	xy_trigger 0, $7, $3, $0, UnknownScript_0x60f94, $0, $0
	xy_trigger 0, $7, $4, $0, UnknownScript_0x60fd9, $0, $0

	; signposts
	db 0

	; people-events
	db 5
	person_event $37, 5, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x60f91, $ffff
	person_event $38, 12, 20, $6, $0, 255, 255, $90, 0, ObjectEvent, $ffff
	person_event $3, 5, 10, $6, $0, 255, 255, $a0, 0, UnknownScript_0x6101e, $ffff
	person_event $28, 8, 5, $5, $1, 255, 255, $0, 0, UnknownScript_0x61021, $ffff
	person_event $2e, 9, 11, $6, $0, 255, 255, $b0, 0, UnknownScript_0x61024, $ffff
; 0x625cf

