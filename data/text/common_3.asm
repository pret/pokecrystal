_OakText6::
	text "Now, what did you"
	line "say your name was?"
	prompt

_OakText7::
	text "<PLAYER>, are you"
	line "ready?"

	para "Your very own"
	line "#MON story is"
	cont "about to unfold."

	para "You'll face fun"
	line "times and tough"
	cont "challenges."

	para "A world of dreams"
	line "and adventures"

	para "with #MON"
	line "awaits! Let's go!"

	para "I'll be seeing you"
	line "later!"
	done

Text_ClockReset::
	text "The clock's time"
	line "may be wrong."

	para "Please reset the"
	line "time."
	prompt

Text_ClockSetting::
	text "Set with the"
	line "Control Pad."

	para "Confirm: A Button"
	line "Cancel:  B Button"
	done

Text_ClockAskOk::
	text "Is this OK?"
	done

Text_ClockHasReset::
	text "The clock has been"
	line "reset."
	done

Text_LinkTimeout::
	text "Too much time has"
	line "elapsed. Please"
	cont "try again."
	prompt

Text_LinkTradeCantBattle::
	text "If you trade that"
	line "#MON, you won't"
	cont "be able to battle."
	prompt

Text_LinkAbnormalMon::
	text "Your friend's"
	line "@"
	text_ram wStringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

Text_LinkAskTradeFor::
	text "Trade @"
	text_ram wd004
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "?"
	done

; unused
UnknownText_0x1c422a::
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #MON."

	para "Is that OK?"
	done

; unused
UnknownText_0x1c4275::
	text "Need more info on"
	line "mobile battles?"
	done

; unused
UnknownText_0x1c4298::
	text "For a mobile"
	line "battle, choose"
	cont "three #MON."

	para "The maximum daily"
	line "play time is ten"

	para "minutes for each"
	line "linked player."

	para "If a battle isn't"
	line "finished within"

	para "the time limit,"
	line "the player with"

	para "the fewest fainted"
	line "#MON wins."

	para "If tied, the team"
	line "that lost the"

	para "least amount of HP"
	line "wins."
	done

; unused
UnknownText_0x1c439c::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Would you like to"
	line "battle?"
	done

; unused
UnknownText_0x1c43dc::
	text "There are only @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done

; unused
UnknownText_0x1c4419::
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done

; unused
UnknownText_0x1c445a::
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done

; unused
UnknownText_0x1c449c::
	text "Try again using"
	line "the same settings?"
	done

; unused
UnknownText_0x1c44c0::
	text "There is less than"
	line "1 min. left today!"
	done

; unused
UnknownText_0x1c44e7::
	text "No time left for"
	line "linking today."
	done

; unused
UnknownText_0x1c4508::
	text "Pick three #MON"
	line "for battle."
	done

; unused
UnknownText_0x1c4525::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

Text_AskSave::
	text "Would you like to"
	line "save the game?"
	done

Text_SaveNoPowerOff::
	text "SAVING… DON'T TURN"
	line "OFF THE POWER."
	done

Text_SavedGame::
	text "<PLAYER> saved"
	line "the game."
	done

Text_SaveAskOverwrite::
	text "There is already a"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

Text_SaveAskOverwrite2::
	text "There is another"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

Text_SaveCorrupt::
	text "The save file is"
	line "corrupted!"
	prompt

Text_SaveMonBox::
	text "When you change a"
	line "#MON BOX, data"
	cont "will be saved. OK?"
	done

Text_SaveMonData::
	text "Each time you move"
	line "a #MON, data"
	cont "will be saved. OK?"
	done

; unused
UnknownText_0x1c4693::
	text "The window save"
	line "area was exceeded."
	done

Text_MenuNoWindow::
	text "No windows avail-"
	line "able for popping."
	done

; unused
UnknownText_0x1c46dc::
	text "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object event"
	done

Text_BGEvent::
	text "BG event"
	done

Text_CoordEvent::
	text "Coordinates event"
	done

Text_ReceivedItem::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

Text_ItemInPocket::
	text "<PLAYER> put the"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "the @"
	text_ram wStringBuffer3
	text "."
	prompt

Text_BagFull::
	text "The @"
	text_ram wStringBuffer3
	text_start
	line "is full…"
	prompt

Text_SeerSeeAll::
	text "I see all."
	line "I know all…"

	para "Certainly, I know"
	line "of your #MON!"
	done

Text_SeerCantRead::
	text "Whaaaat? I can't"
	line "tell a thing!"

	para "How could I not"
	line "know of this?"
	done

Text_SeerNameLocation::
	text "Hm… I see you met"
	line "@"
	text_ram wSeerNickname
	text " here:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

Text_SeerTimeLevel::
	text "The time was"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Its level was @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Am I good or what?"
	prompt

Text_SeerTrade::
	text "Hm… @"
	text_ram wSeerNickname
	text_start
	line "came from @"
	text_ram wSeerOTName
	text_start
	cont "in a trade?"

	para "@"
	text_ram wSeerCaughtLocation
	text_start
	line "was where @"
	text_ram wSeerOTName
	text_start
	cont "met @"
	text_ram wSeerNickname
	text "!"
	prompt

Seer_TextNoLocation::
	text "What!? Incredible!"

	para "I don't understand"
	line "how, but it is"

	para "incredible!"
	line "You are special."

	para "I can't tell where"
	line "you met it, but it"
	cont "was at level @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Am I good or what?"
	prompt

Text_SeerEgg::
	text "Hey!"

	para "That's an EGG!"

	para "You can't say that"
	line "you've met it yet…"
	done

Text_SeerDoNothing::
	text "Fufufu! I saw that"
	line "you'd do nothing!"
	done

Text_SeerMoreCare::
	text "Incidentally…"

	para "It would be wise"
	line "to raise your"

	para "#MON with a"
	line "little more care."
	done

Text_SeerMoreConfident::
	text "Incidentally…"

	para "It seems to have"
	line "grown a little."

	para "@"
	text_ram wSeerNickname
	text " seems"
	line "to be becoming"
	cont "more confident."
	done

Text_SeerMuchStrength::
	text "Incidentally…"

	para "@"
	text_ram wSeerNickname
	text " has"
	line "grown. It's gained"
	cont "much strength."
	done

Text_SeerMighty::
	text "Incidentally…"

	para "It certainly has"
	line "grown mighty!"

	para "This @"
	text_ram wSeerNickname
	text_start
	line "must have come"

	para "through numerous"
	line "#MON battles."

	para "It looks brimming"
	line "with confidence."
	done

Text_SeerImpressed::
	text "Incidentally…"

	para "I'm impressed by"
	line "your dedication."

	para "It's been a long"
	line "time since I've"

	para "seen a #MON as"
	line "mighty as this"
	cont "@"
	text_ram wSeerNickname
	text "."

	para "I'm sure that"
	line "seeing @"
	text_ram wSeerNickname
	text_start

	para "in battle would"
	line "excite anyone."
	done

Text_Evolved1::
	text "Congratulations!"
	line "Your @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

Text_Evolved2::
	text_start

	para "evolved into"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

Text_EvolveStop::
	text "Huh? @"
	text_ram wStringBuffer2
	text_start
	line "stopped evolving!"
	prompt

Text_Evolving::
	text "What? @"
	text_ram wStringBuffer2
	text_start
	line "is evolving!"
	done

Text_MartHowMany::
	text "How many?"
	done

Text_MartFinalPrice::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

Text_HerbalLady::
	text "Hello, dear."

	para "I sell inexpensive"
	line "herbal medicine."

	para "They're good, but"
	line "a trifle bitter."

	para "Your #MON may"
	line "not like them."

	para "Hehehehe…"
	done

Text_HerbalLadyHowMany::
	text "How many?"
	done

Text_HerbalLadyFinalPrice::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

Text_HerbalLadyThanks::
	text "Thank you, dear."
	line "Hehehehe…"
	done

Text_HerbalLadyPackFull::
	text "Oh? Your PACK is"
	line "full, dear."
	done

Text_HerbalLadyNoMoney::
	text "Hehehe… You don't"
	line "have the money."
	done

Text_HerbalLadyComeAgain::
	text "Come again, dear."
	line "Hehehehe…"
	done

Text_BargainShop::
	text "Hiya! Care to see"
	line "some bargains?"

	para "I sell rare items"
	line "that nobody else"

	para "carries--but only"
	line "one of each item."
	done

Text_BargainShopCost::
	text_ram wStringBuffer2
	text " costs"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Want it?"
	done

Text_BargainShopThanks::
	text "Thanks."
	done

Text_BargainShopPackFull::
	text "Uh-oh, your PACK"
	line "is chock-full."
	done

Text_BargainShopSoldOut::
	text "You bought that"
	line "already. I'm all"
	cont "sold out of it."
	done

Text_BargainShopNoFunds::
	text "Uh-oh, you're"
	line "short on funds."
	done

Text_BargainShopComeAgain::
	text "Come by again"
	line "sometime."
	done

Text_MedShopIntro::
	text "What's up? Need"
	line "some medicine?"
	done

Text_MedShopHowMany::
	text "How many?"
	done

Text_MedShopFinalCost::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will cost ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

Text_MedShopThanks::
	text "Thanks much!"
	done

Text_MedShopNoSpace::
	text "You don't have any"
	line "more space."
	done

Text_MedShopNoMoney::
	text "Huh? That's not"
	line "enough money."
	done

Text_MedShopComeAgain::
	text "All right."
	line "See you around."
	done

; unused sell
UnknownText_0x1c4f12::
	text "You don't have"
	line "anything to sell."
	prompt

Text_MartSellHowMany::
	text "How many?"
	done

Text_MartSellPrice::
	text "I can pay you"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Is that OK?"
	done

Text_MartWelcome::
	text "Welcome! How may I"
	line "help you?"
	done

Text_MartThanks::
	text "Here you are."
	line "Thank you!"
	done

Text_MartNoMoney::
	text "You don't have"
	line "enough money."
	done

Text_MartBagFull::
	text "You can't carry"
	line "any more items."
	done

Text_MartCantBuy::
	text "Sorry, I can't buy"
	line "that from you."
	prompt

Text_MartComeAgain::
	text "Please come again!"
	done

Text_MartAskMore::
	text "Can I do anything"
	line "else for you?"
	done

Text_MartBought::
	text "Got ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " for"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	done

Text_SlotsAskBet::
	text "Bet how many"
	line "coins?"
	done

Text_SlotsStart::
	text "Start!"
	done

Text_SlotsNoCoins::
	text "Not enough"
	line "coins."
	prompt

Text_SlotsRanOut::
	text "Darn… Ran out of"
	line "coins…"
	done

Text_SlotsPlayAgain::
	text "Play again?"
	done

Text_SlotsLinedUp::
	text "lined up!"
	line "Won @"
	text_ram wStringBuffer2
	text " coins!"
	done

Text_SlotsDarn::
	text "Darn!"
	done

_MobileStadiumEntryText::
	text "Data for use in"
	line "the MOBILE STADIUM"

	para "of the N64 #MON"
	line "STADIUM 2 can be"
	cont "read here."

	para "Read the data?"
	done

_MobileStadiumSuccessText::
	text "Data transfer is"
	line "complete."

	para "We hope you enjoy"
	line "MOBILE STADIUM"

	para "battles in the N64"
	line "#MON STADIUM 2."

	para ""
	done

Text_MainMenuTimeUnknown::
	text "Clock time unknown"
	done

; unused mobile menu
UnknownText_0x1c5196::
	text "Delete the saved"
	line "LOG-IN PASSWORD?"
	done

; unused mobile menu
UnknownText_0x1c51b9::
	text "Deleted the LOG-IN"
	line "PASSWORD."
	done

; unused mobile menu
UnknownText_0x1c51d7::
	text "Pick three #MON"
	line "for battle."
	prompt

; unused mobile menu
UnknownText_0x1c51f4::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " and"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Use these three?"
	done

; unused mobile
UnknownText_0x1c521c::
	text "Only three #MON"
	line "may enter."
	prompt

; unused mobile
UnknownText_0x1c5238::
	text "The CARD FOLDER"
	line "stores your and"

	para "your friends'"
	line "CARDS."

	para "A CARD contains"
	line "information like"

	para "the person's name,"
	line "phone number and"
	cont "profile."

	para ""
	done

; unused mobile
UnknownText_0x1c52bc::
	text "This is your CARD."

	para "Once you've"
	line "entered your phone"

	para "number, you can"
	line "trade CARDS with"
	cont "your friends."

	para ""
	done

; unused mobile
UnknownText_0x1c531e::
	text "If you have your"
	line "friend's CARD, you"

	para "can use it to make"
	line "a call from a"

	para "mobile phone on"
	line "the 2nd floor of a"
	cont "#MON CENTER."

	para ""
	done

; unused mobile
UnknownText_0x1c5394::
	text "To safely store"
	line "your collection of"

	para "CARDS, you must"
	line "set a PASSCODE for"
	cont "your CARD FOLDER."

	para ""
	done

; unused mobile
UnknownText_0x1c53ee::
	text "If the CARD FOLDER"
	line "is deleted, all"

	para "its CARDS and the"
	line "PASSCODE will also"
	cont "be deleted."

	para "Beware--a deleted"
	line "CARD FOLDER can't"
	cont "be restored."

	para "Want to delete"
	line "your CARD FOLDER?"
	done

; unused mobile
UnknownText_0x1c5494::
	text "Are you sure you"
	line "want to delete it?"
	done

; unused mobile
UnknownText_0x1c54b9::
	text "The CARD FOLDER"
	line "has been deleted."

	para ""
	done

; unused mobile
UnknownText_0x1c54dd::
	text "There is an older"
	line "CARD FOLDER from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done

; unused mobile
UnknownText_0x1c552d::
	text "Delete the old"
	line "CARD FOLDER?"
	done

; unused mobile
UnknownText_0x1c554a::
	text "Finish registering"
	line "CARDS?"
	done

Text_PhoneWrongNumber::
	text "Huh? Sorry, wrong"
	line "number!"
	done

Text_PhoneClick::
	text "Click!"
	done

Text_PhoneEllipse::
	text "<……>"
	done

Text_PhoneOutOfArea::
	text "That number is out"
	line "of the area."
	done

Text_PhoneGoTalk::
	text "Just go talk to"
	line "that person!"
	done

Text_PhoneThankYou::
	text "Thank you!"
	done

; unused
UnknownText_0x1c55d6::
	text "  :"
	done

Text_PasswordAskReset::
	text "Password OK."
	line "Select CONTINUE &"
	cont "reset settings."
	prompt

Text_PasswordWrong::
	text "Wrong password!"
	prompt

Text_PasswordAskResetClock::
	text "Reset the clock?"
	done

Text_PasswordAskEnter::
	text "Please enter the"
	line "password."
	done

Text_AskClearData::
	text "Clear all save"
	line "data?"
	done

Text_MoveLearned::
	text_ram wMonOrItemNameBuffer
	text " learned"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	text_end

	text_end ; unused

Text_MoveAskForget::
	text "Which move should"
	next "be forgotten?"
	done

Text_MoveAskStopLearning::
	text "Stop learning"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

Text_MoveDidNotLearn::
	text_ram wMonOrItemNameBuffer
	text_start
	line "did not learn"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

Text_MoveAskDelete::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "trying to learn"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "But @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "can't learn more"
	cont "than four moves."

	para "Delete an older"
	line "move to make room"
	cont "for @"
	text_ram wStringBuffer2
	text "?"
	done

Text_MoveForgetCount::
	text "1, 2 and…@"
	text_pause
	text_end

	text_end ; unused

Text_MoveForgot::
	text " Poof!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " forgot"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "And…"
	prompt

Text_MoveCantForgetHM::
	text "HM moves can't be"
	line "forgotten now."
	prompt

Text_CardFlipAskThreeCoin::
	text "Play with three"
	line "coins?"
	done

Text_CardFlipNotEnough::
	text "Not enough coins…"
	prompt

Text_CardFlipChooseCard::
	text "Choose a card."
	done

Text_CardFlipPlaceBet::
	text "Place your bet."
	done

Text_CardFlipAskPlayAgain::
	text "Want to play"
	line "again?"
	done

Text_CardFlipShuffled::
	text "The cards have"
	line "been shuffled."
	prompt

Text_CardFlipYeah::
	text "Yeah!"
	done

Text_CardFlipDarn::
	text "Darn…"
	done

Text_GearToday::
	text_today
	text_end

	text_end ; unused

Text_GearEllipse::
	text "<……>"
	done

Text_GearOutOfService::
	text "You're out of the"
	line "service area."
	prompt

Text_GearAskWhoCall::
	text "Whom do you want"
	line "to call?"
	done

Text_GearPressButton::
	text "Press any button"
	line "to exit."
	done

Text_GearAskDelete::
	text "Delete this stored"
	line "phone number?"
	done

Text_BuenaAskWhichPrize::
	text "Which prize would"
	line "you like?"
	done

Text_BuenaThatRight::
	text_ram wStringBuffer1
	text "?"
	line "Is that right?"
	done

Text_BuenaHereYouGo::
	text "Here you go!"

	para ""
	done

Text_BuenaNotEnough::
	text "You don't have"
	line "enough points."

	para ""
	done

Text_BuenaNoRoom::
	text "You have no room"
	line "for it."

	para ""
	done

Text_BuenaComeAgain::
	text "Oh. Please come"
	line "back again!"
	done

Text_BTExcuseMe::
	text "Excuse me!"

	para ""
	done

Text_ExcuseMeYoureNotReady::
	text "Excuse me."
	line "You're not ready."

	para ""
	done

Text_BattleTowerReturnWhenReady::
	text "Please return when"
	line "you're ready."
	done

_NeedAtLeastThreeMonText::
	text "You need at least"
	line "three #MON."

	para ""
	done

_EggDoesNotQualifyText::
	text "Sorry, an EGG"
	line "doesn't qualify."

	para ""
	done

_OnlyThreeMonMayBeEnteredText::
	text "Only three #MON"
	line "may be entered."

	para ""
	done

_TheMonMustAllBeDifferentKindsText::
	text "The @"
	text_ram wStringBuffer2
	text " #MON"
	line "must all be"
	cont "different kinds."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "The @"
	text_ram wStringBuffer2
	text " #MON"
	line "must not hold the"
	cont "same items."

	para ""
	done

_YouCantTakeAnEggText::
	text "You can't take an"
	line "EGG!"

	para ""
	done

Text_BallCantCatch::
	text "It dodged the"
	line "thrown BALL!"

	para "This #MON"
	line "can't be caught!"
	prompt

Text_BallMissed::
	text "You missed the"
	line "#MON!"
	prompt

Text_BallBrokeFree::
	text "Oh no! The #MON"
	line "broke free!"
	prompt

Text_BallAppearedCaught::
	text "Aww! It appeared"
	line "to be caught!"
	prompt

Text_BallAlmostHadIt::
	text "Aargh!"
	line "Almost had it!"
	prompt

Text_BallSoClose::
	text "Shoot! It was so"
	line "close too!"
	prompt

Text_BallCaught::
	text "Gotcha! @"
	text_ram wEnemyMonNick
	text_start
	line "was caught!@"
	sound_caught_mon
	text_end

	text_end ; unused

Text_Waitbutton_2::
	text_waitbutton
	text_end

	text_end ; unused

Text_BallSentToPC::
	text_ram wMonOrItemNameBuffer
	text " was"
	line "sent to BILL's PC."
	prompt

Text_NewDexData::
	text_ram wEnemyMonNick
	text "'s data"
	line "was newly added to"
	cont "the #DEX.@"
	sound_slot_machine_start
	text_waitbutton
	text_end

	text_end ; unused

Text_AskGiveNickname::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

Text_ItemStatRose::
	text_ram wStringBuffer1
	text "'s"
	line "@"
	text_ram wStringBuffer2
	text " rose."
	prompt

Text_ItemCantUseOnMon::
	text "That can't be used"
	line "on this #MON."
	prompt

Text_RepelUsedEarlierIsStillInEffect::
	text "The REPEL used"
	line "earlier is still"
	cont "in effect."
	prompt

Text_PLayedFlute::
	text "Played the #"
	line "FLUTE."

	para "Now, that's a"
	line "catchy tune!"
	prompt

Text_FluteWakeUp::
	text "All sleeping"
	line "#MON woke up."
	prompt

Text_PayedPokeFlute::
	text "<PLAYER> played the"
	line "# FLUTE.@"
	text_waitbutton
	text_end

	text_end ; unused

Text_BlueCardBalance::
	text "You now have"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " points."
	done

Text_CoinCaseCount::
	text "Coins:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unused

Text_RaiseThePPOfWhichMove::
	text "Raise the PP of"
	line "which move?"
	done

Text_RestoreThePPOfWhichMove::
	text "Restore the PP of"
	line "which move?"
	done

Text_PPIsMaxedOut::
	text_ram wStringBuffer2
	text "'s PP"
	line "is maxed out."
	prompt

Text_PPsIncreased::
	text_ram wStringBuffer2
	text "'s PP"
	line "increased."
	prompt

Text_PPRestored::
	text "PP was restored."
	prompt

Text_SentTrophyHome::
	text "There was a trophy"
	line "inside!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " sent the"
	line "trophy home."
	prompt

Text_ItemLooksBitter::
	text "It looks bitter…"
	prompt

Text_ItemCantUseOnEgg::
	text "That can't be used"
	line "on an EGG."
	prompt

Text_ItemOakWarning::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

Text_BelongToSomeoneElse::
	text "That belongs to"
	line "someone else!"
	prompt

Text_ItemWontHaveEffect::
	text "It won't have any"
	line "effect."
	prompt

Text_BallBlocked::
	text "The trainer"
	line "blocked the BALL!"
	prompt

Text_BallNoSwiping::
	text "Don't be a thief!"
	prompt

Text_NoCycling::
	text "Cycling isn't"
	line "allowed here."
	prompt

Text_ItemCantGetOn::
	text "Can't get on your"
	line "@"
	text_ram wStringBuffer1
	text " now."
	prompt

Text_BallBoxFull::
	text "The #MON BOX"
	line "is full. That"
	cont "can't be used now."
	prompt

Text_ItemUsed::
	text "<PLAYER> used the@"
	text_low
	text_ram wStringBuffer2
	text "."
	done

Text_ItemGotOn::
	text "<PLAYER> got on the@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

Text_ItemGotOff::
	text "<PLAYER> got off@"
	text_low
	text "the @"
	text_ram wStringBuffer2
	text "."
	prompt

Text_MoveKnown::
	text_ram wStringBuffer1
	text " knows"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

Text_MoveKnowsOne::
	text "That #MON knows"
	line "only one move."
	done

Text_AskDeleteMove::
	text "Oh, make it forget"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

Text_DeleterForgotMove::
	text "Done! Your #MON"
	line "forgot the move."
	done

Text_DeleterEgg::
	text "An EGG doesn't"
	line "know any moves!"
	done

Text_DeleterNoComeAgain::
	text "No? Come visit me"
	line "again."
	done

Text_DeleterAskWhichMove::
	text "Which move should"
	line "it forget, then?"
	prompt

Text_DeleterIntro::
	text "Um… Oh, yes, I'm"
	line "the MOVE DELETER."

	para "I can make #MON"
	line "forget moves."

	para "Shall I make a"
	line "#MON forget?"
	done

Text_DeleterAskMon::
	text "Which #MON?"
	prompt

Text_DSTIsThatOK::
	text " DST,"
	line "is that OK?"
	done

Text_TimeAskOkay::
	text ","
	line "is that OK?"
	done

Text_TimesetAskDST::
	text "Do you want to"
	line "switch to Daylight"
	cont "Saving Time?"
	done

Text_TimesetDST::
	text "I set the clock"
	line "forward by one"
	cont "hour."
	prompt

Test_TimesetAskNotDST::
	text "Is Daylight Saving"
	line "Time over?"
	done

Text_TimesetNotDST::
	text "I put the clock"
	line "back one hour."
	prompt

Text_TimesetAskAdjustDST::
	text "Do you want to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time?"
	done

Text_MomLostGearBooklet::
	text "I lost the in-"
	line "struction booklet"
	cont "for the #GEAR."

	para "Come back again in"
	line "a while."
	prompt
