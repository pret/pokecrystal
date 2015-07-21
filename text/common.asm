UnknownText_0x1b0000: ; 0x1b0000
	text "Good morning!"
	line "Welcome to our"
	cont "#MON CENTER."
	done
; 0x1b002b

UnknownText_0x1b002b: ; 0x1b002b
	text "Hello!"
	line "Welcome to our"
	cont "#MON CENTER."
	done
; 0x1b004f

UnknownText_0x1b004f: ; 0x1b004f
	text "Good evening!"
	line "You're out late."

	para "Welcome to our"
	line "#MON CENTER."
	done
; 0x1b008a

UnknownText_0x1b008a: ; 0x1b008a
	text "Good morning!"

	para "This is the #-"
	line "MON COMMUNICATION"

	para "CENTER--or the"
	line "#COM CENTER."
	done
; 0x1b00d6

UnknownText_0x1b00d6: ; 0x1b00d6
	text "Hello!"

	para "This is the #-"
	line "MON COMMUNICATION"

	para "CENTER--or the"
	line "#COM CENTER."
	done
; 0x1b011b

UnknownText_0x1b011b: ; 0x1b011b
	text "Good to see you"
	line "working so late."

	para "This is the #-"
	line "MON COMMUNICATION"

	para "CENTER--or the"
	line "#COM CENTER."
	done
; 0x1b017a

UnknownText_0x1b017a: ; 0x1b017a
	text "We can heal your"
	line "#MON to perfect"
	cont "health."

	para "Shall we heal your"
	line "#MON?"
	done
; 0x1b01bd

UnknownText_0x1b01bd: ; 0x1b01bd
	text "OK, may I see your"
	line "#MON?"
	done
; 0x1b01d7

UnknownText_0x1b01d7: ; 0x1b01d7
	text "Thank you for"
	line "waiting."

	para "Your #MON are"
	line "fully healed."
	done
; 0x1b020b

UnknownText_0x1b020b: ; 0x1b020b
	text "We hope to see you"
	line "again."
	done
; 0x1b0226

UnknownText_0x1b0226: ; 0x1b0226
	text "We hope to see you"
	line "again."
	done
; 0x1b0241

UnknownText_0x1b0241: ; 0x1b0241
	text "Your #MON"
	line "appear to be"

	para "infected by tiny"
	line "life forms."

	para "Your #MON are"
	line "healthy and seem"
	cont "to be fine."

	para "But we can't tell"
	line "you anything more"

	para "at a #MON"
	line "CENTER."
	done
; 0x1b02d6

UnknownText_0x1b02d6: ; 0x1b02d6
	text "Your #MON"
	line "appear to be"

	para "infected by tiny"
	line "life forms."

	para "Your #MON are"
	line "healthy and seem"
	cont "to be fine."

	para "But we can't tell"
	line "you anything more."
	done
; 0x1b035a

DifficultBookshelfText:
	text "It's full of"
	line "difficult books."
	done

PictureBookshelfText:
	text "A whole collection"
	line "of #MON picture"
	cont "books!"
	done

MagazineBookshelfText:
	text "#MON magazines…"
	line "#MON PAL,"

	para "#MON HANDBOOK,"
	line "#MON GRAPH…"
	done

TeamRocketOathText:
	text "TEAM ROCKET OATH"

	para "Steal #MON for"
	line "profit!"

	para "Exploit #MON"
	line "for profit!"

	para "All #MON exist"
	line "for the glory of"
	cont "TEAM ROCKET!"
	done

IncenseBurnerText:
	text "What is this?"

	para "Oh, it's an"
	line "incense burner!"
	done

MerchandiseShelfText:
	text "Lots of #MON"
	line "merchandise!"
	done

TownMapText:
	text "It's the TOWN MAP."
	done

WindowText:
	text "My reflection!"
	line "Lookin' good!"
	done

TVText:
	text "It's a TV."
	done

HomepageText:
	text "#MON JOURNAL"
	line "HOME PAGE…"

	para "It hasn't been"
	line "updated…"
	done

UnknownText_0x1b04f9: ; 0x1b04f9
	text "#MON RADIO!"

	para "Call in with your"
	line "requests now!"
	done
; 0x1b0526

TrashCanText:
	text "There's nothing in"
	line "here…"
	done

UnknownText_0x1b053f: ; 0x1b053f
	text "A #MON may be"
	line "able to move this."
	done
; 0x1b0561

UnknownText_0x1b0561: ; 0x1b0561
	text "Maybe a #MON"
	line "can break this."
	done
; 0x1b057f

PokeCenterSignText:
	text "Heal Your #MON!"
	line "#MON CENTER"
	done

MartSignText:
	text "For All Your"
	line "#MON Needs"

	para "#MON MART"
	done

ContestResults_ReadyToJudgeText: ; 0x1b05bf
	text "We will now judge"
	line "the #MON you've"
	cont "caught."

	para $56
	line $56

	para "We have chosen the"
	line "winners!"

	para "Are you ready for"
	line "this?"
	done
; 0x1b0621

ContestResults_PlayerWonAPrizeText: ; 0x1b0621
	text "<PLAYER>, the No.@"
	text_from_ram StringBuffer3
	text ""
	line "finisher, wins"
	cont "@"
	text_from_ram StringBuffer4
	text "!"
	done
; 0x1b0648

ReceivedItemText: ; 0x1b0648
	text "<PLAYER> received"
	line "@"
	text_from_ram StringBuffer4
	text "."
	done
; 0x1b065b

ContestResults_JoinUsNextTimeText: ; 0x1b065b
	text "Please join us for"
	line "the next Contest!"
	done
; 0x1b0681

ContestResults_ConsolationPrizeText: ; 0x1b0681
	text "Everyone else gets"
	line "a BERRY as a con-"
	cont "solation prize!"
	done
; 0x1b06b7

ContestResults_DidNotWinText: ; 0x1b06b7
	text "We hope you do"
	line "better next time."
	done
; 0x1b06d9

ContestResults_ReturnPartyText: ; 0x1b06d9
	text "We'll return the"
	line "#MON we kept"

	para "for you."
	line "Here you go!"
	done
; 0x1b070d

ContestResults_PartyFullText: ; 0x1b070d
	text "Your party's full,"
	line "so the #MON was"

	para "sent to your BOX"
	line "in BILL's PC."
	done
; 0x1b074e

GymStatue_CityGymText: ; 0x1b074e
	text_from_ram StringBuffer3
	text ""
	line "#MON GYM"
	done
; 0x1b075c

GymStatue_WinningTrainersText: ; 0x1b075c
	text "LEADER: @"
	text_from_ram StringBuffer4
	text ""
	para "WINNING TRAINERS:"
	line "<PLAYER>"
	done
; 0x1b077f

CoinVendor_WelcomeText: ; 0x1b077f
	text "Welcome to the"
	line "GAME CORNER."
	done
; 0x1b079c

CoinVendor_NoCoinCaseText: ; 0x1b079c
	text "Do you need game"
	line "coins?"

	para "Oh, you don't have"
	line "a COIN CASE for"
	cont "your coins."
	done
; 0x1b07e3

CoinVendor_IntroText: ; 0x1b07e3
	text "Do you need some"
	line "game coins?"

	para "It costs ¥1000 for"
	line "50 coins. Do you"
	cont "want some?"
	done
; 0x1b0830

CoinVendor_Buy50CoinsText: ; 0x1b0830
	text "Thank you!"
	line "Here are 50 coins."
	done
; 0x1b084f

CoinVendor_Buy500CoinsText: ; 0x1b084f
	text "Thank you! Here"
	line "are 500 coins."
	done
; 0x1b086f

CoinVendor_NotEnoughMoneyText: ; 0x1b086f
	text "You don't have"
	line "enough money."
	done
; 0x1b088c

CoinVendor_CoinCaseFullText: ; 0x1b088c
	text "Whoops! Your COIN"
	line "CASE is full."
	done
; 0x1b08ad

CoinVendor_CancelText: ; 0x1b08ad
	text "No coins for you?"
	line "Come again!"
	done
; 0x1b08cc

UnknownText_0x1b08cc: ; 0x1b08cc
	text "Oh? Your PACK is"
	line "full."

	para "We'll keep this"
	line "for you today, so"

	para "come back when you"
	line "make room for it."
	done
; 0x1b092a

HappinessText3:
	text "Wow! You and your"
	line "#MON are really"
	cont "close!"
	done

HappinessText2:
	text "#MON get more"
	line "friendly if you"

	para "spend time with"
	line "them."
	done

HappinessText1:
	text "You haven't tamed"
	line "your #MON."

	para "If you aren't"
	line "nice, it'll pout."
	done

RegisteredNumber1Text:
	text "<PLAYER> registered"
	line "@"
	text_from_ram StringBuffer3
	text "'s number."
	done

RegisteredNumber2Text:
	text "<PLAYER> registered"
	line "@"
	text_from_ram StringBuffer3
	text "'s number."
	done
