UnknownText_0x1c0000::
	text "Oh, no picture?"
	line "Come again, OK?"
	done

UnknownText_0x1c0021::
	text "An EGG? My talent"
	line "is worth more…"
	done

UnknownText_0x1c0043::
	text "Hello, hello! I'm"
	line "the NAME RATER."

	para "I rate the names"
	line "of #MON."

	para "Would you like me"
	line "to rate names?"
	done

UnknownText_0x1c00a0::
	text "Which #MON's"
	line "nickname should I"
	cont "rate for you?"
	prompt

UnknownText_0x1c00cd::
	text "Hm… @"
	text_from_ram StringBuffer1
	text "…"
	line "That's a fairly"
	cont "decent name."

	para "But, how about a"
	line "slightly better"
	cont "nickname?"

	para "Want me to give it"
	line "a better name?"
	done

UnknownText_0x1c0142::
	text "All right. What"
	line "name should we"
	cont "give it, then?"
	prompt

UnknownText_0x1c0171::
	text "That's a better"
	line "name than before!"

	para "Well done!"
	done

UnknownText_0x1c019e::
	text "OK, then. Come"
	line "again sometime."
	done

UnknownText_0x1c01be::
	text "Hm… @"
	text_from_ram StringBuffer1
	text "?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat @"
	text_from_ram StringBuffer1
	text ""
	line "with loving care."
	done

UnknownText_0x1c0208::
	text "Whoa… That's just"
	line "an EGG."
	done

UnknownText_0x1c0222::
	text "It might look the"
	line "same as before,"

	para "but this new name"
	line "is much better!"

	para "Well done!"
	done

UnknownText_0x1c0272::
	text "All right. This"
	line "#MON is now"
	cont "named @"
	text_from_ram StringBuffer1
	text "."
	prompt

Text_Gained::
	text_from_ram StringBuffer1
	text " gained@@"

Text_ABoostedStringBuffer2ExpPoints::
	text ""
	line "a boosted"
	cont "@"
	deciram StringBuffer2, 2, 4
	text " EXP. Points!"
	prompt

Text_StringBuffer2ExpPoints::
	text ""
	line "@"
	deciram StringBuffer2, 2, 4
	text " EXP. Points!"
	prompt

Text_GoPkmn::
	text "Go! @@"

Text_DoItPkmn::
	text "Do it! @@"

Text_GoForItPkmn::
	text "Go for it,"
	line "@@"

Text_YourFoesWeakGetmPkmn::
	text "Your foe's weak!"
	line "Get'm, @@"

Text_BattleMonNick01::
	text_from_ram BattleMonNick
	text "!"
	done

Text_BattleMonNickComma::
	text_from_ram BattleMonNick
	text ",@@"

Text_ThatsEnoughComeBack::
	text " that's"
	line "enough! Come back!@@"

Text_OKComeBack::
	text " OK!"
	line "Come back!@@"

Text_GoodComeBack::
	text " good!"
	line "Come back!@@"

Text_ComeBack::
	text " come"
	line "back!"
	done

UnknownText_0x1c0373::
	text "Booted up a TM."
	prompt

UnknownText_0x1c0384::
	text "Booted up an HM."
	prompt

UnknownText_0x1c0396::
	text "It contained"
	line "@"
	text_from_ram StringBuffer2
	text "."

	para "Teach @"
	text_from_ram StringBuffer2
	text ""
	line "to a #MON?"
	done

UnknownText_0x1c03c2::
	text_from_ram StringBuffer2
	text " is"
	line "not compatible"
	cont "with @"
	text_from_ram StringBuffer1
	text "."

	para "It can't learn"
	line "@"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c03fa::
	text "You have no room"
	line "for any more"
	cont "@"
	text_from_ram StringBuffer1
	text "S."
	prompt

UnknownText_0x1c0421::
	text "You received"
	line "@"
	text_from_ram StringBuffer1
	text "!"
	prompt

UnknownText_0x1c0436::
	text "The link has been"
	line "cancelled."
	prompt

UnknownText_0x1c0454::
	text "Communication"
	line "error."
	prompt

UnknownText_0x1c046a::
	text "Must retrieve GIFT"
	line "at #MON CENTER."
	prompt

UnknownText_0x1c048e::
	text "Your friend isn't"
	line "ready."
	prompt

UnknownText_0x1c04a7::
	text "Sorry--only five"
	line "GIFTS a day."
	prompt

UnknownText_0x1c04c6::
	text "Sorry. One GIFT"
	line "a day per person."
	prompt

UnknownText_0x1c04e9::
	text_from_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_from_ram StringBuffer1
	text "."
	prompt

UnknownText_0x1c04fa::
	text_from_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_from_ram StringBuffer1
	text ""
	cont "to @"
	text_from_ram wMysteryGiftPlayerName
	text "'s home."
	prompt

UnknownText_0x1c051a::
	text "Received"
	line "@"
	text_from_ram wc850
	text "'s CARD."
	prompt

UnknownText_0x1c0531::
	text_from_ram wc850
	text "'s CARD was"
	line "listed as no.@"
	deciram wd265, 1, 2
	text "."
	prompt

UnknownText_0x1c0555::
	text "The CARD was not"
	line "registered."
	prompt

UnknownText_0x1c0573::
	text "The link has been"
	line "cancelled."
	prompt

UnknownText_0x1c0591::
	text "Communication"
	line "error."
	prompt

_BadgeRequiredText::
	text "Sorry! A new BADGE"
	line "is required."
	prompt

UnknownText_0x1c05c8::
	text "Can't use that"
	line "here."
	prompt

UnknownText_0x1c05dd::
	text_from_ram StringBuffer2
	text " used"
	line "CUT!"
	prompt

UnknownText_0x1c05ec::
	text "There's nothing to"
	line "CUT here."
	prompt

UnknownText_0x1c0609::
	text "A blinding FLASH"
	line "lights the area!@"
	text_waitbutton
	db "@@"
