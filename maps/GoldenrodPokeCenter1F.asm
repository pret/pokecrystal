GoldenrodPokeCenter1F_MapScriptHeader: ; 0x60f8f
	; trigger count
	db 0

	; callback count
	db 0
; 0x60f91

NurseScript_0x60f91: ; 0x60f91
	jumpstd pokecenternurse
; 0x60f94

UnknownScript_0x60f94: ; 0x60f94
	writebyte $b
	special Function170687
	if_equal $b, UnknownScript_0x60f9e
	end
; 0x60f9e

UnknownScript_0x60f9e: ; 0x60f9e
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue UnknownScript_0x60fd8
	playsound SFX_EXIT_BUILDING
	moveperson $3, $0, $7
	disappear $3
	appear $3
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement $3, MovementData_0x6105a
	spriteface $0, $1
	loadfont
	writetext UnknownText_0x622f0
	closetext
	verbosegiveitem GS_BALL, 1
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext UnknownText_0x62359
	closetext
	loadmovesprites
	applymovement $3, MovementData_0x61060
	special RestartMapMusic
	disappear $3
	playsound SFX_EXIT_BUILDING
UnknownScript_0x60fd8: ; 0x60fd8
	end
; 0x60fd9

UnknownScript_0x60fd9: ; 0x60fd9
	writebyte $b
	special Function170687
	if_equal $b, UnknownScript_0x60fe3
	end
; 0x60fe3

UnknownScript_0x60fe3: ; 0x60fe3
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue UnknownScript_0x6101d
	playsound SFX_EXIT_BUILDING
	moveperson $3, $0, $7
	disappear $3
	appear $3
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement $3, MovementData_0x61065
	spriteface $0, $1
	loadfont
	writetext UnknownText_0x622f0
	closetext
	verbosegiveitem GS_BALL, 1
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext UnknownText_0x62359
	closetext
	loadmovesprites
	applymovement $3, MovementData_0x6106c
	special RestartMapMusic
	disappear $3
	playsound SFX_EXIT_BUILDING
UnknownScript_0x6101d: ; 0x6101d
	end
; 0x6101e

GameboyKidScript_0x6101e: ; 0x6101e
	jumptextfaceplayer UnknownText_0x62105
; 0x61021

LassScript_0x61021: ; 0x61021
	jumptextfaceplayer UnknownText_0x62260
; 0x61024

PokefanFScript_0x61024: ; 0x61024
	faceplayer
	loadfont
	writetext UnknownText_0x623fb
	closetext
	writetext UnknownText_0x6248c
	yesorno
	iffalse UnknownScript_0x6104b
	takeitem EON_MAIL, 1
	iffalse UnknownScript_0x6104b
	writetext UnknownText_0x62549
	closetext
	writetext UnknownText_0x624a4
	closetext
	verbosegiveitem REVIVE, 1
	iffalse UnknownScript_0x61051
	writetext UnknownText_0x624e9
	closetext
	loadmovesprites
	end
; 0x6104b

UnknownScript_0x6104b: ; 0x6104b
	writetext UnknownText_0x62509
	closetext
	loadmovesprites
	end
; 0x61051

UnknownScript_0x61051: ; 0x61051
	giveitem EON_MAIL, $1
	writetext UnknownText_0x6252a
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
	text "Hello! Welcome to"
	line "#COM CENTER"
	cont "TRADE CORNER."

	para "You can trade"
	line "#MON with other"
	cont "people far away."
	done
; 0x610ce

UnknownText_0x610ce: ; 0x610ce
	text "To make a trade,"
	line "we must hold your"
	cont "#MON."

	para "Would you like to"
	line "trade?"
	done
; 0x61111

UnknownText_0x61111: ; 0x61111
	text "What kind of"
	line "#MON do you"
	cont "want in return?"
	done
; 0x6113b

UnknownText_0x6113b: ; 0x6113b
	text "Fine. We will try"
	line "to trade your"

	para "@"
	text_from_ram StringBuffer3
	text " for"
	line "@"
	text_from_ram StringBuffer4
	text "."

	para "We'll have to hold"
	line "your #MON"
	cont "during the trade."

	para "Please wait while"
	line "we prepare the"
	cont "room for it."
	done
; 0x611c9

UnknownText_0x611c9: ; 0x611c9
	text "Fine. We will try"
	line "to trade your"

	para "@"
	text_from_ram StringBuffer3
	text " for a"
	line "#MON that you"
	cont "have never seen."

	para "We'll have to hold"
	line "your #MON"
	cont "during the trade."

	para "Please wait while"
	line "we prepare the"
	cont "room for it."
	done
; 0x61271

UnknownText_0x61271: ; 0x61271
	text "Your trade #MON"
	line "has been received."

	para "It will take time"
	line "to find a trade"

	para "partner. Please"
	line "come back later."
	done
; 0x612d8

UnknownText_0x612d8: ; 0x612d8
	text "Oh? You have only"
	line "one #MON in"
	cont "your party. "

	para "Please come back"
	line "once you've in-"
	cont "creased the size"
	cont "of your party."
	done
; 0x61344

UnknownText_0x61344: ; 0x61344
	text "We hope to see you"
	line "again."
	done
; 0x6135f

UnknownText_0x6135f: ; 0x6135f
	text "Communication"
	line "error…"
	done
; 0x61375

UnknownText_0x61375: ; 0x61375
	text "If we accept that"
	line "#MON, what will"
	cont "you battle with?"
	done
; 0x613a9

UnknownText_0x613a9: ; 0x613a9
	text "Sorry. We can't"
	line "accept an EGG."
	done
; 0x613c8

UnknownText_0x613c8: ; 0x613c8
	text "Sorry, but your"
	line "#MON appears to"

	para "be abnormal. We"
	line "can't accept it."
	done
; 0x61409

UnknownText_0x61409: ; 0x61409
	text "Oh? Aren't we"
	line "already holding a"
	cont "#MON of yours?"
	done
; 0x61438

UnknownText_0x61438: ; 0x61438
	text "We'll check the"
	line "rooms."

	para "Please wait."
	done
; 0x6145c

UnknownText_0x6145c: ; 0x6145c
	text "Thank you for your"
	line "patience."

	para "A trade partner"
	line "has been found."
	done
; 0x6149a

UnknownText_0x6149a: ; 0x6149a
	text "It's your new"
	line "partner."

	para "Please take care"
	line "of it with love."

	para "We hope to see you"
	line "again."
	done
; 0x614ed

UnknownText_0x614ed: ; 0x614ed
	text "Uh-oh. Your party"
	line "is already full."

	para "Please come back"
	line "when you have room"
	cont "in your party."
	done
; 0x61544

UnknownText_0x61544: ; 0x61544
	text "It's unfortunate,"
	line "but no one has"

	para "come forward as a"
	line "trade partner."

	para "Would you like"
	line "your #MON back?"
	done
; 0x615a5

UnknownText_0x615a5: ; 0x615a5
	text "We have returned"
	line "your #MON."
	done
; 0x615c2

UnknownText_0x615c2: ; 0x615c2
	text "It's unfortunate,"
	line "but no one has"

	para "come forward as a"
	line "trade partner."

	para "We've held your"
	line "#MON for a long"

	para "time. As a result,"
	line "it is very lonely."

	para "Sorry, but we must"
	line "return it to you."
	done
; 0x6166e

UnknownText_0x6166e: ; 0x6166e
	text "We hope to see you"
	line "again."
	done
; 0x61689

UnknownText_0x61689: ; 0x61689
	text "Fine. We will"
	line "continue to hold"
	cont "your #MON."
	done
; 0x616b4

UnknownText_0x616b4: ; 0x616b4
	text "Oh? You left your"
	line "#MON with us"
	cont "only recently."

	para "Please come back"
	line "later."
	done
; 0x616fb

UnknownText_0x616fb: ; 0x616fb
	text "We'll SAVE before"
	line "connecting to the"
	cont "CENTER."
	done
; 0x61727

UnknownText_0x61727: ; 0x61727
	text "Which #MON do"
	line "you want to trade?"
	done
; 0x61749

UnknownText_0x61749: ; 0x61749
	text "Sorry, but we must"
	line "cancel the trade."
	done
; 0x6176f

UnknownText_0x6176f: ; 0x6176f
	text "Oh!"

	para "I see you have an"
	line "EGG TICKET!"

	para "It's a coupon that"
	line "special people can"

	para "redeem for a"
	line "special #MON!"
	done
; 0x617d2

UnknownText_0x617d2: ; 0x617d2
	text "Let me give you a"
	line "quick briefing."

	para "Trades held at the"
	line "TRADE CORNER are"

	para "between two"
	line "trainers who don't"

	para "know each other's"
	line "identity."

	para "As a result, it"
	line "may take time."

	para "However, an ODD"
	line "EGG is available"
	cont "just for you."

	para "It will be sent to"
	line "you right away."

	para "Please choose one"
	line "of the rooms in"

	para "the CENTER."
	line "An ODD EGG will be"

	para "sent from the"
	line "chosen room."
	done
; 0x6191f

UnknownText_0x6191f: ; 0x6191f
	text "Please wait a"
	line "moment."
	done
; 0x61936

UnknownText_0x61936: ; 0x61936
	text "Thank you for"
	line "waiting."

	para "We received your"
	line "ODD EGG."

	para "Here it is!"

	para "Please raise it"
	line "with loving care."
	done
; 0x61996

UnknownText_0x61996: ; 0x61996
	text "I'm awfully sorry."

	para "The EGG TICKET"
	line "exchange service"
	cont "isn't running now."
	done
; 0x619db

UnknownText_0x619db: ; 0x619db
	text "It's a #MON"
	line "NEWS MACHINE."
	done
; 0x619f5

UnknownText_0x619f5: ; 0x619f5
	text "What would you"
	line "like to do?"
	done
; 0x61a11

UnknownText_0x61a11: ; 0x61a11
	text "#MON NEWS is"
	line "news compiled from"

	para "the SAVE files of"
	line "#MON trainers."

	para "When reading the"
	line "NEWS, your SAVE"

	para "file may be sent"
	line "out."

	para "The SAVE file data"
	line "will contain your"

	para "adventure log and"
	line "mobile profile."

	para "Your phone number"
	line "will not be sent."

	para "The contents of"
	line "the NEWS will vary"

	para "depending on the"
	line "SAVE files sent by"

	para "you and the other"
	line "#MON trainers."

	para "You might even be"
	line "in the NEWS!"
	done
; 0x61b7c

UnknownText_0x61b7c: ; 0x61b7c
	text "Would you like to"
	line "get the NEWS?"
	done
; 0x61b9d

UnknownText_0x61b9d: ; 0x61b9d
	text "Reading the latest"
	line "NEWS… Please wait."
	done
; 0x61bc4

UnknownText_0x61bc4: ; 0x61bc4
	text "There is no old"
	line "NEWS…"
	done
; 0x61bdb

UnknownText_0x61bdb: ; 0x61bdb
	text "The NEWS data is"
	line "corrupted."

	para "Please download"
	line "the NEWS again."
	done
; 0x61c18

UnknownText_0x61c18: ; 0x61c18
	text "We're making"
	line "preparations."

	para "Please come back"
	line "later."
	done
; 0x61c4b

UnknownText_0x61c4b: ; 0x61c4b
	text "We will SAVE your"
	line "progress before"

	para "starting the NEWS"
	line "MACHINE."
	done
; 0x61c89

UnknownText_0x61c89: ; 0x61c89
	text "Whoa, this #MON"
	line "CENTER is huge."

	para "They just built"
	line "this place. They"

	para "installed lots of"
	line "new machines too."
	done
; 0x61cef

UnknownText_0x61cef: ; 0x61cef
	text "I thought up a fun"
	line "new thing for the"
	cont "TRADE CORNER!"

	para "I make a PIDGEY"
	line "hold MAIL, then"

	para "put it up for"
	line "trade for another"
	cont "one!"

	para "If everyone did"
	line "that, MAIL could"

	para "be traded with all"
	line "sorts of people!"

	para "I call it PIDGEY"
	line "MAIL!"

	para "If it becomes"
	line "popular, I might"

	para "make lots of new"
	line "friends!"
	done
; 0x61dfd

UnknownText_0x61dfd: ; 0x61dfd
	text "They said you can"
	line "trade #MON with"

	para "total strangers up"
	line "here."

	para "But they're still"
	line "adjusting things."
	done
; 0x61e5c

UnknownText_0x61e5c: ; 0x61e5c
	text "Some girl I don't"
	line "know sent me her"

	para "HOPPIP."
	line "You should trade"

	para "for a #MON that"
	line "you want."
	done
; 0x61eb2

UnknownText_0x61eb2: ; 0x61eb2
	text "I received a"
	line "female HOPPIP, but"
	cont "its named STANLEY!"

	para "That's my dad's"
	line "name!"
	done
; 0x61efa

UnknownText_0x61efa: ; 0x61efa
	text "What is the NEWS"
	line "MACHINE?"

	para "Does it get news"
	line "from a wider area"
	cont "than the radio?"
	done
; 0x61f48

UnknownText_0x61f48: ; 0x61f48
	text "The #COM CENTER"
	line "will link with all"

	para "#MON CENTERS in"
	line "a wireless net."

	para "That must mean"
	line "I'll be able to"

	para "link with all"
	line "sorts of people."
	done
; 0x61fc9

UnknownText_0x61fc9: ; 0x61fc9
	text "The machines here"
	line "can't be used yet."

	para "Still, it's nice"
	line "coming to a trendy"

	para "place before other"
	line "people."
	done
; 0x6202c

UnknownText_0x6202c: ; 0x6202c
	text "My friend was in"
	line "the NEWS a while"

	para "back. I was really"
	line "surprised!"
	done
; 0x6206d

UnknownText_0x6206d: ; 0x6206d
	text "I get anxious if I"
	line "don't check out"
	cont "the latest NEWS!"
	done
; 0x620a1

UnknownText_0x620a1: ; 0x620a1
	text "If I get in the"
	line "NEWS and become"

	para "famous, I bet I'll"
	line "be adored."

	para "I wonder how I"
	line "could get in the"
	cont "NEWS?"
	done
; 0x62105

UnknownText_0x62105: ; 0x62105
	text "The COLOSSEUM"
	line "upstairs is for"
	cont "link battles."

	para "Battle records are"
	line "posted on the"

	para "wall, so I can't"
	line "afford to lose."
	done
; 0x62173

UnknownText_0x62173: ; 0x62173
	text "I came over here"
	line "when I got word"

	para "that GOLDENROD's"
	line "#MON CENTER has"

	para "new machines that"
	line "no one's ever seen"
	cont "before."

	para "But it looks like"
	line "they're still busy"

	para "with all their"
	line "preparations…"
	done
; 0x62222

UnknownText_0x62222: ; 0x62222
	text "Just seeing all"
	line "these new things"

	para "here makes me feel"
	line "younger!"
	done
; 0x62260

UnknownText_0x62260: ; 0x62260
	text "A higher level"
	line "#MON doesn't"
	cont "always win."

	para "After all, it may"
	line "have a type dis-"
	cont "advantage."

	para "I don't think"
	line "there is a single"

	para "#MON that is"
	line "the toughest."
	done
; 0x622f0

UnknownText_0x622f0: ; 0x622f0
	text $52, ", isn't it?"

	para "Congratulations!"

	para "As a special deal,"
	line "a GS BALL has been"
	cont "sent just for you!"

	para "Please accept it!"
	done
; 0x62359

UnknownText_0x62359: ; 0x62359
	text "Please do come"
	line "again!"
	done
; 0x62370

UnknownText_0x62370: ; 0x62370
	text "#COM CENTER"
	line "1F INFORMATION"

	para "Left:"
	line "ADMINISTRATION"

	para "Center:"
	line "TRADE CORNER"

	para "Right:"
	line "#MON NEWS"
	done
; 0x623c7

UnknownText_0x623c7: ; 0x623c7
	text "It's a #MON"
	line "NEWS MACHINE!"

	para "It's not in"
	line "operation yet…"
	done
; 0x623fb

UnknownText_0x623fb: ; 0x623fb
	text "Oh my, your pack"
	line "looks so heavy!"

	para "Oh! Do you happen"
	line "to have something"
	cont "named EON MAIL?"

	para "My daughter is"
	line "after one."

	para "You can part with"
	line "one, can't you?"
	done
; 0x6248c

UnknownText_0x6248c: ; 0x6248c
	text "Give away an EON"
	line "MAIL?"
	done
; 0x624a4

UnknownText_0x624a4: ; 0x624a4
	text "Oh, that's great!"
	line "Thank you, honey!"

	para "Here, this is for"
	line "you in return!"
	done
; 0x624e9

UnknownText_0x624e9: ; 0x624e9
	text "My daughter will"
	line "be delighted!"
	done
; 0x62509

UnknownText_0x62509: ; 0x62509
	text "Oh? You don't have"
	line "one? Too bad."
	done
; 0x6252a

UnknownText_0x6252a: ; 0x6252a
	text "Oh… Well, another"
	line "time, then."
	done
; 0x62549

UnknownText_0x62549: ; 0x62549
	text $52, " gave away"
	line "the EON MAIL."
	done
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
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x60f91, $ffff
	person_event SPRITE_LINK_RECEPTIONIST, 12, 20, $6, $0, 255, 255, $90, 0, ObjectEvent, $ffff
	person_event SPRITE_GAMEBOY_KID, 5, 10, $6, $0, 255, 255, $a0, 0, GameboyKidScript_0x6101e, $ffff
	person_event SPRITE_LASS, 8, 5, $5, $1, 255, 255, $0, 0, LassScript_0x61021, $ffff
	person_event SPRITE_POKEFAN_F, 9, 11, $6, $0, 255, 255, $b0, 0, PokefanFScript_0x61024, $ffff
; 0x625cf
