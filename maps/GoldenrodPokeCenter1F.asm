const_value set 2
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x60f91:
	jumpstd pokecenternurse

GoldenrodPokeCenter1F_GSBallTriggerLeft:
	writebyte BATTLETOWERACTION_CHECKMOBILEEVENT
	special BattleTowerAction
	if_equal MOBILE_EVENT_OBJECT_GS_BALL, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveperson GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, $0, $7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x6105a
	spriteface PLAYER, UP
	opentext
	writetext UnknownText_0x622f0
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext UnknownText_0x62359
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x61060
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokeCenter1F_GSBallTriggerRight:
	writebyte BATTLETOWERACTION_CHECKMOBILEEVENT
	special BattleTowerAction
	if_equal MOBILE_EVENT_OBJECT_GS_BALL, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveperson GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, $0, $7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x61065
	spriteface PLAYER, UP
	opentext
	writetext UnknownText_0x622f0
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext UnknownText_0x62359
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, MovementData_0x6106c
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GameboyKidScript_0x6101e:
	jumptextfaceplayer UnknownText_0x62105

LassScript_0x61021:
	jumptextfaceplayer UnknownText_0x62260

PokefanFScript_0x61024:
	faceplayer
	opentext
	writetext UnknownText_0x623fb
	waitbutton
	writetext UnknownText_0x6248c
	yesorno
	iffalse UnknownScript_0x6104b
	takeitem EON_MAIL
	iffalse UnknownScript_0x6104b
	writetext UnknownText_0x62549
	waitbutton
	writetext UnknownText_0x624a4
	waitbutton
	verbosegiveitem REVIVE
	iffalse UnknownScript_0x61051
	writetext UnknownText_0x624e9
	waitbutton
	closetext
	end

UnknownScript_0x6104b:
	writetext UnknownText_0x62509
	waitbutton
	closetext
	end

UnknownScript_0x61051:
	giveitem EON_MAIL
	writetext UnknownText_0x6252a
	waitbutton
	closetext
	end

MovementData_0x6105a:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

MovementData_0x61060:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

MovementData_0x61065:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

MovementData_0x6106c:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

; unused
UnknownText_0x61072:
	text "Hello! Welcome to"
	line "#COM CENTER"
	cont "TRADE CORNER."

	para "You can trade"
	line "#MON with other"
	cont "people far away."
	done

UnknownText_0x610ce:
	text "To make a trade,"
	line "we must hold your"
	cont "#MON."

	para "Would you like to"
	line "trade?"
	done

UnknownText_0x61111:
	text "What kind of"
	line "#MON do you"
	cont "want in return?"
	done

UnknownText_0x6113b:
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

UnknownText_0x611c9:
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

UnknownText_0x61271:
	text "Your trade #MON"
	line "has been received."

	para "It will take time"
	line "to find a trade"

	para "partner. Please"
	line "come back later."
	done

UnknownText_0x612d8:
	text "Oh? You have only"
	line "one #MON in"
	cont "your party. "

	para "Please come back"
	line "once you've in-"
	cont "creased the size"
	cont "of your party."
	done

UnknownText_0x61344:
	text "We hope to see you"
	line "again."
	done

UnknownText_0x6135f:
	text "Communication"
	line "error…"
	done

UnknownText_0x61375:
	text "If we accept that"
	line "#MON, what will"
	cont "you battle with?"
	done

UnknownText_0x613a9:
	text "Sorry. We can't"
	line "accept an EGG."
	done

UnknownText_0x613c8:
	text "Sorry, but your"
	line "#MON appears to"

	para "be abnormal. We"
	line "can't accept it."
	done

UnknownText_0x61409:
	text "Oh? Aren't we"
	line "already holding a"
	cont "#MON of yours?"
	done

UnknownText_0x61438:
	text "We'll check the"
	line "rooms."

	para "Please wait."
	done

UnknownText_0x6145c:
	text "Thank you for your"
	line "patience."

	para "A trade partner"
	line "has been found."
	done

UnknownText_0x6149a:
	text "It's your new"
	line "partner."

	para "Please take care"
	line "of it with love."

	para "We hope to see you"
	line "again."
	done

UnknownText_0x614ed:
	text "Uh-oh. Your party"
	line "is already full."

	para "Please come back"
	line "when you have room"
	cont "in your party."
	done

UnknownText_0x61544:
	text "It's unfortunate,"
	line "but no one has"

	para "come forward as a"
	line "trade partner."

	para "Would you like"
	line "your #MON back?"
	done

UnknownText_0x615a5:
	text "We have returned"
	line "your #MON."
	done

UnknownText_0x615c2:
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

UnknownText_0x6166e:
	text "We hope to see you"
	line "again."
	done

UnknownText_0x61689:
	text "Fine. We will"
	line "continue to hold"
	cont "your #MON."
	done

UnknownText_0x616b4:
	text "Oh? You left your"
	line "#MON with us"
	cont "only recently."

	para "Please come back"
	line "later."
	done

UnknownText_0x616fb:
	text "We'll SAVE before"
	line "connecting to the"
	cont "CENTER."
	done

UnknownText_0x61727:
	text "Which #MON do"
	line "you want to trade?"
	done

UnknownText_0x61749:
	text "Sorry, but we must"
	line "cancel the trade."
	done

UnknownText_0x6176f:
	text "Oh!"

	para "I see you have an"
	line "EGG TICKET!"

	para "It's a coupon that"
	line "special people can"

	para "redeem for a"
	line "special #MON!"
	done

UnknownText_0x617d2:
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

UnknownText_0x6191f:
	text "Please wait a"
	line "moment."
	done

UnknownText_0x61936:
	text "Thank you for"
	line "waiting."

	para "We received your"
	line "ODD EGG."

	para "Here it is!"

	para "Please raise it"
	line "with loving care."
	done

UnknownText_0x61996:
	text "I'm awfully sorry."

	para "The EGG TICKET"
	line "exchange service"
	cont "isn't running now."
	done

UnknownText_0x619db:
	text "It's a #MON"
	line "NEWS MACHINE."
	done

UnknownText_0x619f5:
	text "What would you"
	line "like to do?"
	done

UnknownText_0x61a11:
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

UnknownText_0x61b7c:
	text "Would you like to"
	line "get the NEWS?"
	done

UnknownText_0x61b9d:
	text "Reading the latest"
	line "NEWS… Please wait."
	done

UnknownText_0x61bc4:
	text "There is no old"
	line "NEWS…"
	done

UnknownText_0x61bdb:
	text "The NEWS data is"
	line "corrupted."

	para "Please download"
	line "the NEWS again."
	done

UnknownText_0x61c18:
	text "We're making"
	line "preparations."

	para "Please come back"
	line "later."
	done

UnknownText_0x61c4b:
	text "We will SAVE your"
	line "progress before"

	para "starting the NEWS"
	line "MACHINE."
	done

UnknownText_0x61c89:
	text "Whoa, this #MON"
	line "CENTER is huge."

	para "They just built"
	line "this place. They"

	para "installed lots of"
	line "new machines too."
	done

UnknownText_0x61cef:
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

UnknownText_0x61dfd:
	text "They said you can"
	line "trade #MON with"

	para "total strangers up"
	line "here."

	para "But they're still"
	line "adjusting things."
	done

UnknownText_0x61e5c:
	text "Some girl I don't"
	line "know sent me her"

	para "HOPPIP."
	line "You should trade"

	para "for a #MON that"
	line "you want."
	done

UnknownText_0x61eb2:
	text "I received a"
	line "female HOPPIP, but"
	cont "its named STANLEY!"

	para "That's my dad's"
	line "name!"
	done

UnknownText_0x61efa:
	text "What is the NEWS"
	line "MACHINE?"

	para "Does it get news"
	line "from a wider area"
	cont "than the radio?"
	done

UnknownText_0x61f48:
	text "The #COM CENTER"
	line "will link with all"

	para "#MON CENTERS in"
	line "a wireless net."

	para "That must mean"
	line "I'll be able to"

	para "link with all"
	line "sorts of people."
	done

UnknownText_0x61fc9:
	text "The machines here"
	line "can't be used yet."

	para "Still, it's nice"
	line "coming to a trendy"

	para "place before other"
	line "people."
	done

UnknownText_0x6202c:
	text "My friend was in"
	line "the NEWS a while"

	para "back. I was really"
	line "surprised!"
	done

UnknownText_0x6206d:
	text "I get anxious if I"
	line "don't check out"
	cont "the latest NEWS!"
	done

UnknownText_0x620a1:
	text "If I get in the"
	line "NEWS and become"

	para "famous, I bet I'll"
	line "be adored."

	para "I wonder how I"
	line "could get in the"
	cont "NEWS?"
	done

UnknownText_0x62105:
	text "The COLOSSEUM"
	line "upstairs is for"
	cont "link battles."

	para "Battle records are"
	line "posted on the"

	para "wall, so I can't"
	line "afford to lose."
	done

UnknownText_0x62173:
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

UnknownText_0x62222:
	text "Just seeing all"
	line "these new things"

	para "here makes me feel"
	line "younger!"
	done

UnknownText_0x62260:
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

UnknownText_0x622f0:
	text "<PLAYER>, isn't it?"

	para "Congratulations!"

	para "As a special deal,"
	line "a GS BALL has been"
	cont "sent just for you!"

	para "Please accept it!"
	done

UnknownText_0x62359:
	text "Please do come"
	line "again!"
	done

UnknownText_0x62370:
	text "#COM CENTER"
	line "1F INFORMATION"

	para "Left:"
	line "ADMINISTRATION"

	para "Center:"
	line "TRADE CORNER"

	para "Right:"
	line "#MON NEWS"
	done

UnknownText_0x623c7:
	text "It's a #MON"
	line "NEWS MACHINE!"

	para "It's not in"
	line "operation yet…"
	done

UnknownText_0x623fb:
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

UnknownText_0x6248c:
	text "Give away an EON"
	line "MAIL?"
	done

UnknownText_0x624a4:
	text "Oh, that's great!"
	line "Thank you, honey!"

	para "Here, this is for"
	line "you in return!"
	done

UnknownText_0x624e9:
	text "My daughter will"
	line "be delighted!"
	done

UnknownText_0x62509:
	text "Oh? You don't have"
	line "one? Too bad."
	done

UnknownText_0x6252a:
	text "Oh… Well, another"
	line "time, then."
	done

UnknownText_0x62549:
	text "<PLAYER> gave away"
	line "the EON MAIL."
	done

GoldenrodPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $7, $3, 15, GOLDENROD_CITY
	warp_def $7, $4, 15, GOLDENROD_CITY
	warp_def $6, $0, 1, GOLDENROD_POKECOM_CENTER_2F_MOBILE
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 2
	xy_trigger 0, $7, $3, $0, GoldenrodPokeCenter1F_GSBallTriggerLeft, $0, $0
	xy_trigger 0, $7, $4, $0, GoldenrodPokeCenter1F_GSBallTriggerRight, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 5
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x60f91, -1
	person_event SPRITE_LINK_RECEPTIONIST, 8, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_GAMEBOY_KID, 1, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GameboyKidScript_0x6101e, -1
	person_event SPRITE_LASS, 4, 1, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x61021, -1
	person_event SPRITE_POKEFAN_F, 5, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x61024, -1
