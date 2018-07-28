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
	text_from_ram wStringBuffer1
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
	text_from_ram wStringBuffer1
	text "?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat @"
	text_from_ram wStringBuffer1
	text_start
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
	text_from_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_from_ram wStringBuffer1
	text " gained@@"

Text_ABoostedStringBuffer2ExpPoints::
	text_start
	line "a boosted"
	cont "@"
	deciram wStringBuffer2, 2, 4
	text " EXP. Points!"
	prompt

Text_StringBuffer2ExpPoints::
	text_start
	line "@"
	deciram wStringBuffer2, 2, 4
	text " EXP. Points!"
	prompt

Text_GoMon::
	text "Go! @@"

Text_DoItMon::
	text "Do it! @@"

Text_GoForItMon::
	text "Go for it,"
	line "@@"

Text_YourFoesWeakGetmMon::
	text "Your foe's weak!"
	line "Get'm, @@"

Text_BattleMonNick01::
	text_from_ram wBattleMonNick
	text "!"
	done

Text_BattleMonNickComma::
	text_from_ram wBattleMonNick
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
	text_from_ram wStringBuffer2
	text "."

	para "Teach @"
	text_from_ram wStringBuffer2
	text_start
	line "to a #MON?"
	done

UnknownText_0x1c03c2::
	text_from_ram wStringBuffer2
	text " is"
	line "not compatible"
	cont "with @"
	text_from_ram wStringBuffer1
	text "."

	para "It can't learn"
	line "@"
	text_from_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c03fa::
	text "You have no room"
	line "for any more"
	cont "@"
	text_from_ram wStringBuffer1
	text "S."
	prompt

UnknownText_0x1c0421::
	text "You received"
	line "@"
	text_from_ram wStringBuffer1
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
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c04fa::
	text_from_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_from_ram wStringBuffer1
	text_start
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
	deciram wDeciramBuffer, 1, 2
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
	text_from_ram wStringBuffer2
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

_UsedSurfText::
	text_from_ram wStringBuffer2
	text " used"
	line "SURF!"
	done

_CantSurfText::
	text "You can't SURF"
	line "here."
	prompt

_AlreadySurfingText::
	text "You're already"
	line "SURFING."
	prompt

_AskSurfText::
	text "The water is calm."
	line "Want to SURF?"
	done

UnknownText_0x1c068e::
	text_from_ram wStringBuffer2
	text " used"
	line "WATERFALL!"
	done

UnknownText_0x1c06a3::
	text "Wow, it's a huge"
	line "waterfall."
	done

UnknownText_0x1c06bf::
	text "Do you want to use"
	line "WATERFALL?"
	done

UnknownText_0x1c06de::
	text_from_ram wStringBuffer2
	text " used"
	line "DIG!"
	done

UnknownText_0x1c06ed::
	text "<PLAYER> used an"
	line "ESCAPE ROPE."
	done

UnknownText_0x1c0705::
	text "Can't use that"
	line "here."
	done

UnknownText_0x1c071a::
	text "Return to the last"
	line "#MON CENTER."
	done

UnknownText_0x1c073b::
	text "Can't use that"
	line "here."

	para ""
	done

UnknownText_0x1c0751::
	text "A #MON is using"
	line "STRENGTH already."
	prompt

UnknownText_0x1c0774::
	text_from_ram wStringBuffer2
	text " used"
	line "STRENGTH!"
	done

UnknownText_0x1c0788::
	text_from_ram wStringBuffer1
	text " can"
	line "move boulders."
	prompt

UnknownText_0x1c07a0::
	text "A #MON may be"
	line "able to move this."

	para "Want to use"
	line "STRENGTH?"
	done

UnknownText_0x1c07d8::
	text "Boulders may now"
	line "be moved!"
	done

UnknownText_0x1c07f4::
	text "A #MON may be"
	line "able to move this."
	done

UnknownText_0x1c0816::
	text_from_ram wStringBuffer2
	text " used"
	line "WHIRLPOOL!"
	prompt

UnknownText_0x1c082b::
	text "It's a vicious"
	line "whirlpool!"

	para "A #MON may be"
	line "able to pass it."
	done

UnknownText_0x1c0864::
	text "A whirlpool is in"
	line "the way."

	para "Want to use"
	line "WHIRLPOOL?"
	done

UnknownText_0x1c0897::
	text_from_ram wStringBuffer2
	text " did a"
	line "HEADBUTT!"
	prompt

UnknownText_0x1c08ac::
	text "Nope. Nothing…"
	done

UnknownText_0x1c08bc::
	text "A #MON could be"
	line "in this tree."

	para "Want to HEADBUTT"
	line "it?"
	done

UnknownText_0x1c08f0::
	text_from_ram wStringBuffer2
	text " used"
	line "ROCK SMASH!"
	prompt

UnknownText_0x1c0906::
	text "Maybe a #MON"
	line "can break this."
	done

UnknownText_0x1c0924::
	text "This rock looks"
	line "breakable."

	para "Want to use ROCK"
	line "SMASH?"
	done

UnknownText_0x1c0958::
	text "Oh!"
	line "A bite!"
	prompt

UnknownText_0x1c0965::
	text "Not even a nibble!"
	prompt

UnknownText_0x1c0979::
	text "Looks like there's"
	line "nothing here."
	prompt

UnknownText_0x1c099a::
	text "You can't get off"
	line "here!"
	done

UnknownText_0x1c09b2::
	text "<PLAYER> got on the"
	line "@"
	text_from_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c09c7::
	text "<PLAYER> got off"
	line "the @"
	text_from_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c09dd::
	text "This tree can be"
	line "CUT!"

	para "Want to use CUT?"
	done

UnknownText_0x1c0a05::
	text "This tree can be"
	line "CUT!"
	done

UnknownText_0x1c0a1c::
	text "<PLAYER> found"
	line "@"
	text_from_ram wStringBuffer3
	text "!"
	done

UnknownText_0x1c0a2c::
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

UnknownText_0x1c0a4e::
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	done

UnknownText_0x1c0a77::
	text "Yes! ITEMFINDER"
	line "indicates there's"
	cont "an item nearby."
	prompt

UnknownText_0x1c0aa9::
	text "Nope! ITEMFINDER"
	line "isn't responding."
	prompt

UnknownText_0x1c0acc::
	text_from_ram wStringBuffer3
	text_start
	line "fainted!"
	prompt

UnknownText_0x1c0ada::
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	prompt

UnknownText_0x1c0b03::
	text_from_ram wStringBuffer3
	text " used"
	line "SWEET SCENT!"
	done

UnknownText_0x1c0b1a::
	text "Looks like there's"
	line "nothing here…"
	done

UnknownText_0x1c0b3b::
	text "<PLAYER> sprinkled"
	line "water."

	para "But nothing"
	line "happened…"
	done

UnknownText_0x1c0b65::
	text "<PLAYER>'s #MON"
	line "were all healed!"
	done

Text_AnEGGCantHoldAnItem::
	text "An EGG can't hold"
	line "an item."
	prompt

UnknownText_0x1c0b9a::
	text "No items."
	done

UnknownText_0x1c0ba5::
	text "Throw away how"
	line "many?"
	done

UnknownText_0x1c0bbb::
	text "Throw away @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_from_ram wStringBuffer2
	text "(S)?"
	done

UnknownText_0x1c0bd8::
	text "Threw away"
	line "@"
	text_from_ram wStringBuffer2
	text "(S)."
	prompt

UnknownText_0x1c0bee::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

Text_YouDontHaveAMon::
	text "You don't have a"
	line "#MON!"
	prompt

UnknownText_0x1c0c2e::
	text "Registered the"
	line "@"
	text_from_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c0c45::
	text "You can't register"
	line "that item."
	prompt

UnknownText_0x1c0c63::
	text "Where should this"
	line "be moved to?"
	done

UnknownText_0x1c0c83::
	text_start
	done

Text_YouCantUseItInABattle::
	text "You can't use it"
	line "in a battle."
	prompt

Text_AreYouABoyOrAreYouAGirl::
	text "Are you a boy?"
	line "Or are you a girl?"
	done

UnknownText_0x1c0cc6::
	text "<USER>'s"
	line "@"
	text_from_ram wStringBuffer2
	db "@@"

UnknownText_0x1c0cd0::
	interpret_data
	text "<SCROLL>went way up!"
	prompt

UnknownText_0x1c0ce0::
	text " went up!"
	prompt

UnknownText_0x1c0ceb::
	text "<TARGET>'s"
	line "@"
	text_from_ram wStringBuffer2
	db "@@"

UnknownText_0x1c0cf5::
	interpret_data
	text "<SCROLL>sharply fell!"
	prompt

UnknownText_0x1c0d06::
	text " fell!"
	prompt

UnknownText_0x1c0d0e::
	text "<USER>@@"

UnknownText_0x1c0d12::
	text_start
	line "made a whirlwind!"
	prompt

UnknownText_0x1c0d26::
	text_start
	line "took in sunlight!"
	prompt

UnknownText_0x1c0d3a::
	text_start
	line "lowered its head!"
	prompt

UnknownText_0x1c0d4e::
	text_start
	line "is glowing!"
	prompt

UnknownText_0x1c0d5c::
	text_start
	line "flew up high!"
	prompt

UnknownText_0x1c0d6c::
	text_start
	line "dug a hole!"
	prompt

_ActorNameText::
	text "<USER>@@"

_UsedMove1Text::
	text_start
	line "used @@"

_UsedMove2Text::
	text_start
	line "used @@"

_UsedInsteadText::
	text "instead,"
	cont "@@"

_MoveNameText::
	text_from_ram wStringBuffer2
	db "@@"

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

UnknownText_0x1c0db0::
	text "Huh?"

	para "@@"

UnknownText_0x1c0db8::
	text_start
	done

UnknownText_0x1c0dba::
	text_from_ram wStringBuffer1
	text " came"
	line "out of its EGG!@"
	sound_caught_mon
	text_waitbutton
	db "@@"

UnknownText_0x1c0dd8::
	text "Give a nickname to"
	line "@"
	text_from_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c0df3::
	text "It's @"
	text_from_ram wBreedMon2Nick
	text_start
	line "that was left with"
	cont "the DAY-CARE LADY."
	done

UnknownText_0x1c0e24::
	text "It's @"
	text_from_ram wBreedMon1
	text_start
	line "that was left with"
	cont "the DAY-CARE MAN."
	done

UnknownText_0x1c0e54::
	text "It's brimming with"
	line "energy."
	prompt

UnknownText_0x1c0e6f::
	text "It has no interest"
	line "in @"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0e8d::
	text "It appears to care"
	line "for @"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0eac::
	text "It's friendly with"
	line "@"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0ec6::
	text "It shows interest"
	line "in @"
	text_from_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "There's no MAIL"
	line "here."
	prompt

ClearedMailPutAwayText::
	text "The cleared MAIL"
	line "was put away."
	prompt

MailPackFullText::
	text "The PACK is full."
	prompt

MailMessageLostText::
	text "The MAIL's message"
	line "will be lost. OK?"
	done

MailAlreadyHoldingItemText::
	text "It's already hold-"
	line "ing an item."
	prompt

MailEggText::
	text "An EGG can't hold"
	line "any MAIL."
	prompt

MailMovedFromBoxText::
	text "The MAIL was moved"
	line "from the MAILBOX."
	prompt

UnknownText_0x1c0fb3::
	text "Yes"
	prompt

UnknownText_0x1c0fb8::
	text "No"
	prompt

UnknownText_0x1c0fbc::
	deciram wcf64, 1, 3
	text " @"
	text_from_ram wStringBuffer1
	text_start
	line "Animation type @"
	text_from_ram wStringBuffer2
	db "@@"

UnknownText_0x1c0fdd::
	text "#MON number?"
	done

Text_WasSentToBillsPC::
	text_from_ram wStringBuffer1
	text " was"
	line "sent to BILL's PC."
	prompt

UnknownText_0x1c1006::
	text "You gotta have"
	line "#MON to call!"
	prompt

UnknownText_0x1c1024::
	text "What?"
	done

UnknownText_0x1c102b::
	text "There is a #MON"
	line "holding MAIL."

	para "Please remove the"
	line "MAIL."
	prompt

UnknownText_0x1c1062::
	text "You don't have a"
	line "single #MON!"
	prompt

UnknownText_0x1c1080::
	text "You can't deposit"
	line "your last #MON!"
	prompt

UnknownText_0x1c10a2::
	text "You can't take any"
	line "more #MON."
	prompt

UnknownText_0x1c10c0::
	text "Caught @"
	text_from_ram wStringBuffer1
	text "!"
	prompt

UnknownText_0x1c10cf::
	text "Switch #MON?"
	done

UnknownText_0x1c10dd::
	text "You already caught"
	line "a @"
	text_from_ram wStringBuffer1
	text "."
	prompt

ContestJudging_FirstPlaceText::
	text "This Bug-Catching"
	line "Contest winner is@"
	interpret_data
	text "…"

	para "@"
	text_from_ram wBugContestWinnerName
	text ","
	line "who caught a"
	cont "@"
	text_from_ram wStringBuffer1
	text "!@@"

ContestJudging_FirstPlaceScoreText::
	text_start

	para "The winning score"
	line "was @"
	deciram wBugContestFirstPlaceScore, 2, 3
	text " points!"
	prompt

ContestJudging_SecondPlaceText::
	text "Placing second was"
	line "@"
	text_from_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_from_ram wStringBuffer1
	text "!@@"

ContestJudging_SecondPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	deciram wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

ContestJudging_ThirdPlaceText::
	text "Placing third was"
	line "@"
	text_from_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_from_ram wStringBuffer1
	text "!@@"

ContestJudging_ThirdPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	deciram wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

UnknownText_0x1c1203::
	text "Let me measure"
	line "that MAGIKARP."

	para "…Hm, it measures"
	line "@"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c123a::
	text "CURRENT RECORD"

	para "@"
	text_from_ram wStringBuffer1
	text " caught by"
	line "@"
	text_from_ram wMagikarpRecordHoldersName
	text_waitbutton
	db "@@"

UnknownText_0x1c1261::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_from_ram wStringBuffer1
	text " in"
	line "your party."
	prompt

UnknownText_0x1c12ae::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_from_ram wStringBuffer1
	text " in"
	line "your PC BOX."
	prompt

UnknownText_0x1c12fc::
	text "Give a nickname to"
	line "the @"
	text_from_ram wStringBuffer1
	text " you"
	cont "received?"
	done

UnknownText_0x1c1328::
	text "Bzzzzt! You must"
	line "have a #MON to"
	cont "use this!"
	prompt

UnknownText_0x1c1353::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

UnknownText_0x1c1368::
	text "What do you want"
	line "to do?"
	done

_PlayersPCHowManyWithdrawText::
	text "How many do you"
	line "want to withdraw?"
	done

_PlayersPCWithdrewItemsText::
	text "Withdrew @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_from_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "There's no room"
	line "for more items."
	prompt

UnknownText_0x1c13df::
	text "No items here!"
	prompt

_PlayersPCHowManyDepositText::
	text "How many do you"
	line "want to deposit?"
	done

_PlayersPCDepositItemsText::
	text "Deposited @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_from_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomDepositText::
	text "There's no room to"
	line "store items."
	prompt

UnknownText_0x1c144d::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

UnknownText_0x1c1462::
	text "Access whose PC?"
	done

UnknownText_0x1c1474::
	text "BILL's PC"
	line "accessed."

	para "#MON Storage"
	line "System opened."
	prompt

UnknownText_0x1c14a4::
	text "Accessed own PC."

	para "Item Storage"
	line "System opened."
	prompt

UnknownText_0x1c14d2::
	text "PROF.OAK's PC"
	line "accessed."

	para "#DEX Rating"
	line "System opened."
	prompt

UnknownText_0x1c1505::
	text "…"
	line "Link closed…"
	done

_OakPCText1::
	text "Want to get your"
	line "#DEX rated?"
	done

_OakPCText2::
	text "Current #DEX"
	line "completion level:"
	prompt

_OakPCText3::
	text_from_ram wStringBuffer3
	text " #MON seen"
	line "@"
	text_from_ram wStringBuffer4
	text " #MON owned"

	para "PROF.OAK's"
	line "Rating:"
	done

_OakRating01::
	text "Look for #MON"
	line "in grassy areas!"
	done

_OakRating02::
	text "Good. I see you"
	line "understand how to"
	cont "use # BALLS."
	done

_OakRating03::
	text "You're getting"
	line "good at this."

	para "But you have a"
	line "long way to go."
	done

_OakRating04::
	text "You need to fill"
	line "up the #DEX."

	para "Catch different"
	line "kinds of #MON!"
	done

_OakRating05::
	text "You're trying--I"
	line "can see that."

	para "Your #DEX is"
	line "coming together."
	done

_OakRating06::
	text "To evolve, some"
	line "#MON grow,"

	para "others use the"
	line "effects of STONES."
	done

_OakRating07::
	text "Have you gotten a"
	line "fishing ROD? You"

	para "can catch #MON"
	line "by fishing."
	done

_OakRating08::
	text "Excellent! You"
	line "seem to like col-"
	cont "lecting things!"
	done

_OakRating09::
	text "Some #MON only"
	line "appear during"

	para "certain times of"
	line "the day."
	done

_OakRating10::
	text "Your #DEX is"
	line "filling up. Keep"
	cont "up the good work!"
	done

_OakRating11::
	text "I'm impressed."
	line "You're evolving"

	para "#MON, not just"
	line "catching them."
	done

_OakRating12::
	text "Have you met KURT?"
	line "His custom BALLS"
	cont "should help."
	done

_OakRating13::
	text "Wow. You've found"
	line "more #MON than"

	para "the last #DEX"
	line "research project."
	done

_OakRating14::
	text "Are you trading"
	line "your #MON?"

	para "It's tough to do"
	line "this alone!"
	done

_OakRating15::
	text "Wow! You've hit"
	line "200! Your #DEX"
	cont "is looking great!"
	done

_OakRating16::
	text "You've found so"
	line "many #MON!"

	para "You've really"
	line "helped my studies!"
	done

_OakRating17::
	text "Magnificent! You"
	line "could become a"

	para "#MON professor"
	line "right now!"
	done

_OakRating18::
	text "Your #DEX is"
	line "amazing! You're"

	para "ready to turn"
	line "professional!"
	done

_OakRating19::
	text "Whoa! A perfect"
	line "#DEX! I've"

	para "dreamt about this!"
	line "Congratulations!"
	done

_OakPCText4::
	text "The link to PROF."
	line "OAK's PC closed."
	done

UnknownText_0x1c19cd::
	text "Triple-theme"
	line "trainer ranking!"

	para "The SAVE file you"
	line "just sent might"
	cont "make the rankings!"

	para ""
	done

UnknownText_0x1c1a22::
	text "There is no"
	line "ranking data."

	para "Link to obtain"
	line "ranking data."

	para ""
	done

UnknownText_0x1c1a5b::
	text " , yeah!"
	done

UnknownText_0x1c1a65::
	text "Darn…"
	done

UnknownText_0x1c1a6c::
	text "Would you like to"
	line "end the Contest?"
	done

UnknownText_0x1c1a90::
	text "Toss out how many"
	line "@"
	text_from_ram wStringBuffer2
	text "(S)?"
	done

UnknownText_0x1c1aad::
	text "Throw away @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_from_ram wStringBuffer2
	text "(S)?"
	done

UnknownText_0x1c1aca::
	text "Discarded"
	line "@"
	text_from_ram wStringBuffer1
	text "(S)."
	prompt

UnknownText_0x1c1adf::
	text "That's too impor-"
	line "tant to toss out!"
	prompt

UnknownText_0x1c1b03::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	done

UnknownText_0x1c1b2c::
	text "Took @"
	text_from_ram wMonOrItemNameBuffer
	text "'s"
	line "@"
	text_from_ram wStringBuffer1
	text " and"

	para "made it hold"
	line "@"
	text_from_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b57::
	text "Made @"
	text_from_ram wMonOrItemNameBuffer
	text_start
	line "hold @"
	text_from_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b6f::
	text "Please remove the"
	line "MAIL first."
	prompt

UnknownText_0x1c1b8e::
	text_from_ram wMonOrItemNameBuffer
	text " isn't"
	line "holding anything."
	prompt

UnknownText_0x1c1baa::
	text "Item storage space"
	line "full."
	prompt

UnknownText_0x1c1bc4::
	text "Took @"
	text_from_ram wStringBuffer1
	text_start
	line "from @"
	text_from_ram wMonOrItemNameBuffer
	text "."
	prompt

UnknownText_0x1c1bdc::
	text_from_ram wMonOrItemNameBuffer
	text " is"
	line "already holding"

	para "@"
	text_from_ram wStringBuffer1
	text "."
	line "Switch items?"
	done

UnknownText_0x1c1c09::
	text "This item can't be"
	line "held."
	prompt

UnknownText_0x1c1c22::
	text "The MAIL will lose"
	line "its message. OK?"
	done

UnknownText_0x1c1c47::
	text "MAIL detached from"
	line "@"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c1c62::
	text "There's no space"
	line "for removing MAIL."
	prompt

UnknownText_0x1c1c86::
	text "Send the removed"
	line "MAIL to your PC?"
	done

UnknownText_0x1c1ca9::
	text "Your PC's MAILBOX"
	line "is full."
	prompt

UnknownText_0x1c1cc4::
	text "The MAIL was sent"
	line "to your PC."
	prompt

UnknownText_0x1c1ce3::
	text "Not enough HP!"
	prompt

UnknownText_0x1c1cf3::
	text "An item in your"
	line "PACK may be"

	para "registered for use"
	line "on SELECT Button."
	done

_OakText1::
	text "Hello! Sorry to"
	line "keep you waiting!"

	para "Welcome to the"
	line "world of #MON!"

	para "My name is OAK."

	para "People call me the"
	line "#MON PROF."
	prompt

_OakText2::
	text "This world is in-"
	line "habited by crea-"
	cont "tures that we call"
	cont "#MON.@@"

_OakText3::
	text_waitbutton
	db "@@"

_OakText4::
	text "People and #MON"
	line "live together by"

	para "supporting each"
	line "other."

	para "Some people play"
	line "with #MON, some"
	cont "battle with them."
	prompt

_OakText5::
	text "But we don't know"
	line "everything about"
	cont "#MON yet."

	para "There are still"
	line "many mysteries to"
	cont "solve."

	para "That's why I study"
	line "#MON every day."
	prompt
