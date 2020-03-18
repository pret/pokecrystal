INCLUDE "constants.asm"

SECTION "_FruitBearingTreeText", ROMX
_FruitBearingTreeText::
	text "It's a fruit-"
	line "bearing tree."
	done

SECTION "_HeyItsFruitText", ROMX
_HeyItsFruitText::
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ObtainedFruitText", ROMX
_ObtainedFruitText::
	text "Obtained 2"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_FruitPackIsFullText", ROMX
_FruitPackIsFullText::
	text "But the PACK is"
	line "full…"
	done

SECTION "_NothingHereText", ROMX
_NothingHereText::
	text "There's nothing"
	line "here…"
	done

SECTION "_WhichApricornText", ROMX
_WhichApricornText::
	text "Which APRICORN"
	line "should I use?"
	done

SECTION "_HowManyShouldIMakeText", ROMX
_HowManyShouldIMakeText::
	text "How many should I"
	line "make?"
	done

SECTION "_RecoveredSomeHPText", ROMX
_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "recovered @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "HP!"
	done

SECTION "_CuredOfPoisonText", ROMX
_CuredOfPoisonText::
	text_ram wStringBuffer1
	text "'s"
	line "cured of poison."
	done

SECTION "_RidOfParalysisText", ROMX
_RidOfParalysisText::
	text_ram wStringBuffer1
	text "'s"
	line "rid of paralysis."
	done

SECTION "_BurnWasHealedText", ROMX
_BurnWasHealedText::
	text_ram wStringBuffer1
	text "'s"
	line "burn was healed."
	done

SECTION "_WasDefrostedText", ROMX
_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "was defrosted."
	done

SECTION "_WokeUpText", ROMX
_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "woke up."
	done

SECTION "_HealthReturnedText", ROMX
_HealthReturnedText::
	text_ram wStringBuffer1
	text "'s"
	line "health returned."
	done

SECTION "_RevitalizedText", ROMX
_RevitalizedText::
	text_ram wStringBuffer1
	text_start
	line "is revitalized."
	done

SECTION "_GrewToLevelText", ROMX
_GrewToLevelText::
	text_ram wStringBuffer1
	text " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_promptbutton
	text_end

	text_end ; unused

SECTION "_CameToItsSensesText", ROMX
_CameToItsSensesText::
	text_ram wStringBuffer1
	text " came"
	line "to its senses."
	done

SECTION "_EnterNewPasscodeText", ROMX
_EnterNewPasscodeText::
	text "Please enter any"
	line "four-digit number."
	done

SECTION "_ConfirmPasscodeText", ROMX
_ConfirmPasscodeText::
	text "Enter the same"
	line "number to confirm."
	done

SECTION "_PasscodesNotSameText", ROMX
_PasscodesNotSameText::
	text "That's not the"
	line "same number."
	done

SECTION "_PasscodeSetText", ROMX
_PasscodeSetText::
	text "Your PASSCODE has"
	line "been set."

	para "Enter this number"
	line "next time to open"
	cont "the CARD FOLDER."

	para ""
	done

SECTION "_FourZerosInvalidText", ROMX
_FourZerosInvalidText::
	text "0000 is invalid!"

	para ""
	done

SECTION "_EnterPasscodeText", ROMX
_EnterPasscodeText::
	text "Enter the CARD"
	next "FOLDER PASSCODE."
	done

SECTION "_IncorrectPasscodeText", ROMX
_IncorrectPasscodeText::
	text "Incorrect"
	line "PASSCODE!"

	para ""
	done

SECTION "_CardFolderOpenText", ROMX
_CardFolderOpenText::
	text "CARD FOLDER open.@"
	text_end

SECTION "_OakTimeWokeUpText", ROMX
_OakTimeWokeUpText::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz… Hm? Wha…?"
	line "You woke me up!"

	para "Will you check the"
	line "clock for me?"
	prompt

SECTION "_OakTimeWhatTimeIsItText", ROMX
_OakTimeWhatTimeIsItText::
	text "What time is it?"
	done

SECTION "_OakTimeWhatHoursText", ROMX
_OakTimeWhatHoursText::
	text "What?@"
	text_end

SECTION "_OakTimeHoursQuestionMarkText", ROMX
_OakTimeHoursQuestionMarkText::
	text "?"
	done

SECTION "_OakTimeHowManyMinutesText", ROMX
_OakTimeHowManyMinutesText::
	text "How many minutes?"
	done

SECTION "_OakTimeWhoaMinutesText", ROMX
_OakTimeWhoaMinutesText::
	text "Whoa!@"
	text_end

SECTION "_OakTimeMinutesQuestionMarkText", ROMX
_OakTimeMinutesQuestionMarkText::
	text "?"
	done

SECTION "_OakTimeOversleptText", ROMX
_OakTimeOversleptText::
	text "!"
	line "I overslept!"
	done

SECTION "_OakTimeYikesText", ROMX
_OakTimeYikesText::
	text "!"
	line "Yikes! I over-"
	cont "slept!"
	done

SECTION "_OakTimeSoDarkText", ROMX
_OakTimeSoDarkText::
	text "!"
	line "No wonder it's so"
	cont "dark!"
	done

SECTION "_OakTimeWhatDayIsItText", ROMX
_OakTimeWhatDayIsItText::
	text "What day is it?"
	done

SECTION "_OakTimeIsItText", ROMX
_OakTimeIsItText::
	text ", is it?"
	done

; Mobile Adapter

SECTION "UnknownText_0x1bc384", ROMX
UnknownText_0x1bc384::
	text "There is nothing"
	line "connected."
	done

SECTION "UnknownText_0x1bc3a1", ROMX
UnknownText_0x1bc3a1::
	text "Check cell phone"
	line "adapter."
	done

SECTION "UnknownText_0x1bc3bc", ROMX
UnknownText_0x1bc3bc::
	text "Check CDMA"
	line "adapter."
	done

SECTION "UnknownText_0x1bc3d1", ROMX
UnknownText_0x1bc3d1::
	text "Check DOCOMO PHS"
	line "adapter."
	done

SECTION "UnknownText_0x1bc3ec", ROMX
UnknownText_0x1bc3ec::
	text "Check DDI PHS"
	line "adapter."
	done

SECTION "UnknownText_0x1bc404", ROMX
UnknownText_0x1bc404::
	text "Check unlimited"
	line "battle mobile"
	cont "adapter."
	done

SECTION "UnknownText_0x1bc42c", ROMX
UnknownText_0x1bc42c::
	text "The password is:"
	line ""
	done

SECTION "UnknownText_0x1bc43f", ROMX
UnknownText_0x1bc43f::
	text "Is this OK?"
	done

SECTION "UnknownText_0x1bc44c", ROMX
UnknownText_0x1bc44c::
	text "Enter the"
	line "ID no."
	done

; Mobile Adapter End

SECTION "UnknownText_0x1bc45e", ROMX
UnknownText_0x1bc45e::
	text "Enter the"
	line "amount."
	done

SECTION "_NothingToChooseText", ROMX
_NothingToChooseText::
	text "There's nothing to"
	line "choose."
	prompt

SECTION "_WhichSidePutOnText", ROMX
_WhichSidePutOnText::
	text "Which side do you"
	line "want to put it on?"
	done

SECTION "_WhichSidePutAwayText", ROMX
_WhichSidePutAwayText::
	text "Which side do you"
	line "want to put away?"
	done

SECTION "_PutAwayTheDecoText", ROMX
_PutAwayTheDecoText::
	text "Put away the"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_NothingToPutAwayText", ROMX
_NothingToPutAwayText::
	text "There's nothing to"
	line "put away."
	prompt

SECTION "_SetUpTheDecoText", ROMX
_SetUpTheDecoText::
	text "Set up the"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_PutAwayAndSetUpText", ROMX
_PutAwayAndSetUpText::
	text "Put away the"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "and set up the"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

SECTION "_AlreadySetUpText", ROMX
_AlreadySetUpText::
	text "That's already set"
	line "up."
	prompt

SECTION "_LookTownMapText", ROMX
_LookTownMapText::
	text "It's the TOWN MAP."
	done

SECTION "_LookPikachuPosterText", ROMX
_LookPikachuPosterText::
	text "It's a poster of a"
	line "cute PIKACHU."
	done

SECTION "_LookClefairyPosterText", ROMX
_LookClefairyPosterText::
	text "It's a poster of a"
	line "cute CLEFAIRY."
	done

SECTION "_LookJigglypuffPosterText", ROMX
_LookJigglypuffPosterText::
	text "It's a poster of a"
	line "cute JIGGLYPUFF."
	done

SECTION "_LookAdorableDecoText", ROMX
_LookAdorableDecoText::
	text "It's an adorable"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

SECTION "_LookGiantDecoText", ROMX
_LookGiantDecoText::
	text "A giant doll! It's"
	line "fluffy and cuddly."
	done

SECTION "_MomHiHowAreYouText", ROMX
_MomHiHowAreYouText::
	text "Hi, <PLAYER>!"
	line "How are you?"
	prompt

SECTION "_MomFoundAnItemText", ROMX
_MomFoundAnItemText::
	text "I found a useful"
	line "item shopping, so"
	prompt

SECTION "_MomBoughtWithYourMoneyText", ROMX
_MomBoughtWithYourMoneyText::
	text "I bought it with"
	line "your money. Sorry!"
	prompt

SECTION "_MomItsInPCText", ROMX
_MomItsInPCText::
	text "It's in your PC."
	line "You'll like it!"
	done

SECTION "_MomFoundADollText", ROMX
_MomFoundADollText::
	text "While shopping"
	line "today, I saw this"
	cont "adorable doll, so"
	prompt

SECTION "_MomItsInYourRoomText", ROMX
_MomItsInYourRoomText::
	text "It's in your room."
	line "You'll love it!"
	done

SECTION "_MonWasSentToText", ROMX
_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " was"
	line "sent to @"
	text_ram wOTTrademonSenderName
	text "."
	done

SECTION "_MonNameSentToText", ROMX
_MonNameSentToText::
	text_start
	done

SECTION "_BidsFarewellToMonText", ROMX
_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " bids"
	line "farewell to"
	done

SECTION "_MonNameBidsFarewellText", ROMX
_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_TakeGoodCareOfMonText", ROMX
_TakeGoodCareOfMonText::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_ForYourMonSendsText", ROMX
_ForYourMonSendsText::
	text "For @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text ","
	done

SECTION "_OTSendsText", ROMX
_OTSendsText::
	text_ram wOTTrademonSenderName
	text " sends"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_WillTradeText", ROMX
_WillTradeText::
	text_ram wOTTrademonSenderName
	text " will"
	line "trade @"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unused

SECTION "_ForYourMonWillTradeText", ROMX
_ForYourMonWillTradeText::
	text "for @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

SECTION "_MobilePlayerWillTradeMonText", ROMX
_MobilePlayerWillTradeMonText::
	text_ram wPlayerTrademonSenderName
	text " will"
	line "trade @"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unused

SECTION "_MobileForPartnersMonText", ROMX
_MobileForPartnersMonText::
	text "for @"
	text_ram wOTTrademonSenderName
	text "'s"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

; unused
SECTION "_MobilePlayersMonTradeText", ROMX
_MobilePlayersMonTradeText::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

SECTION "_MobileTakeGoodCareOfMonText", ROMX
_MobileTakeGoodCareOfMonText::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_MobilePlayersMonTrade2Text", ROMX
_MobilePlayersMonTrade2Text::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

SECTION "_MobileTakeGoodCareOfText", ROMX
_MobileTakeGoodCareOfText::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

SECTION "_MobileTradeCameBackText", ROMX
_MobileTradeCameBackText::
	text_ram wOTTrademonSpeciesName
	text " came"
	line "back!"
	done

; Oak's Pokémon Talk

SECTION "_OPT_IntroText1", ROMX
_OPT_IntroText1::
	text_start
	line "MARY: PROF.OAK'S"
	done

SECTION "_OPT_IntroText2", ROMX
_OPT_IntroText2::
	text_start
	line "#MON TALK!"
	done

SECTION "_OPT_IntroText3", ROMX
_OPT_IntroText3::
	text_start
	line "With me, MARY!"
	done

SECTION "_OPT_OakText1", ROMX
_OPT_OakText1::
	text_start
	line "OAK: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unused

SECTION "_OPT_OakText2", ROMX
_OPT_OakText2::
	text_start
	line "may be seen around"
	done

SECTION "_OPT_OakText3", ROMX
_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

SECTION "_OPT_MaryText1", ROMX
_OPT_MaryText1::
	text_start
	line "MARY: @"
	text_ram wStringBuffer1
	text "'s"
	done

SECTION "_OPT_SweetAdorablyText", ROMX
_OPT_SweetAdorablyText::
	text_start
	line "sweet and adorably"
	done

SECTION "_OPT_WigglySlicklyText", ROMX
_OPT_WigglySlicklyText::
	text_start
	line "wiggly and slickly"
	done

SECTION "_OPT_AptlyNamedText", ROMX
_OPT_AptlyNamedText::
	text_start
	line "aptly named and"
	done

SECTION "_OPT_UndeniablyKindOfText", ROMX
_OPT_UndeniablyKindOfText::
	text_start
	line "undeniably kind of"
	done

SECTION "_OPT_UnbearablyText", ROMX
_OPT_UnbearablyText::
	text_start
	line "so, so unbearably"
	done

SECTION "_OPT_WowImpressivelyText", ROMX
_OPT_WowImpressivelyText::
	text_start
	line "wow, impressively"
	done

SECTION "_OPT_AlmostPoisonouslyText", ROMX
_OPT_AlmostPoisonouslyText::
	text_start
	line "almost poisonously"
	done

SECTION "_OPT_SensuallyText", ROMX
_OPT_SensuallyText::
	text_start
	line "ooh, so sensually"
	done

SECTION "_OPT_MischievouslyText", ROMX
_OPT_MischievouslyText::
	text_start
	line "so mischievously"
	done

SECTION "_OPT_TopicallyText", ROMX
_OPT_TopicallyText::
	text_start
	line "so very topically"
	done

SECTION "_OPT_AddictivelyText", ROMX
_OPT_AddictivelyText::
	text_start
	line "sure addictively"
	done

SECTION "_OPT_LooksInWaterText", ROMX
_OPT_LooksInWaterText::
	text_start
	line "looks in water is"
	done

SECTION "_OPT_EvolutionMustBeText", ROMX
_OPT_EvolutionMustBeText::
	text_start
	line "evolution must be"
	done

SECTION "_OPT_ProvocativelyText", ROMX
_OPT_ProvocativelyText::
	text_start
	line "provocatively"
	done

SECTION "_OPT_FlippedOutText", ROMX
_OPT_FlippedOutText::
	text_start
	line "so flipped out and"
	done

SECTION "_OPT_HeartMeltinglyText", ROMX
_OPT_HeartMeltinglyText::
	text_start
	line "heart-meltingly"
	done

SECTION "_OPT_CuteText", ROMX
_OPT_CuteText::
	text_start
	line "cute."
	done

SECTION "_OPT_WeirdText", ROMX
_OPT_WeirdText::
	text_start
	line "weird."
	done

SECTION "_OPT_PleasantText", ROMX
_OPT_PleasantText::
	text_start
	line "pleasant."
	done

SECTION "_OPT_BoldSortOfText", ROMX
_OPT_BoldSortOfText::
	text_start
	line "bold, sort of."
	done

SECTION "_OPT_FrighteningText", ROMX
_OPT_FrighteningText::
	text_start
	line "frightening."
	done

SECTION "_OPT_SuaveDebonairText", ROMX
_OPT_SuaveDebonairText::
	text_start
	line "suave & debonair!"
	done

SECTION "_OPT_PowerfulText", ROMX
_OPT_PowerfulText::
	text_start
	line "powerful."
	done

SECTION "_OPT_ExcitingText", ROMX
_OPT_ExcitingText::
	text_start
	line "exciting."
	done

SECTION "_OPT_GroovyText", ROMX
_OPT_GroovyText::
	text_start
	line "groovy!"
	done

SECTION "_OPT_InspiringText", ROMX
_OPT_InspiringText::
	text_start
	line "inspiring."
	done

SECTION "_OPT_FriendlyText", ROMX
_OPT_FriendlyText::
	text_start
	line "friendly."
	done

SECTION "_OPT_HotHotHotText", ROMX
_OPT_HotHotHotText::
	text_start
	line "hot, hot, hot!"
	done

SECTION "_OPT_StimulatingText", ROMX
_OPT_StimulatingText::
	text_start
	line "stimulating."
	done

SECTION "_OPT_GuardedText", ROMX
_OPT_GuardedText::
	text_start
	line "guarded."
	done

SECTION "_OPT_LovelyText", ROMX
_OPT_LovelyText::
	text_start
	line "lovely."
	done

SECTION "_OPT_SpeedyText", ROMX
_OPT_SpeedyText::
	text_start
	line "speedy."
	done

SECTION "_OPT_PokemonChannelText", ROMX
_OPT_PokemonChannelText::
	text "#MON"
	done

SECTION "_PokedexShowText", ROMX
_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

; Pokémon Music Channel / Pokémusic

SECTION "_BenIntroText1", ROMX
_BenIntroText1::
	text_start
	line "BEN: #MON MUSIC"
	done

SECTION "_BenIntroText2", ROMX
_BenIntroText2::
	text_start
	line "CHANNEL!"
	done

SECTION "_BenIntroText3", ROMX
_BenIntroText3::
	text_start
	line "It's me, DJ BEN!"
	done

SECTION "_FernIntroText1", ROMX
_FernIntroText1::
	text_start
	line "FERN: #MUSIC!"
	done

SECTION "_FernIntroText2", ROMX
_FernIntroText2::
	text_start
	line "With DJ FERN!"
	done

SECTION "_BenFernText1", ROMX
_BenFernText1::
	text_start
	line "Today's @"
	text_today
	text ","
	done

SECTION "_BenFernText2A", ROMX
_BenFernText2A::
	text_start
	line "so let us jam to"
	done

SECTION "_BenFernText2B", ROMX
_BenFernText2B::
	text_start
	line "so chill out to"
	done

SECTION "_BenFernText3A", ROMX
_BenFernText3A::
	text_start
	line "#MON March!"
	done

SECTION "_BenFernText3B", ROMX
_BenFernText3B::
	text_start
	line "#MON Lullaby!"
	done

; Lucky Channel

SECTION "_LC_Text1", ROMX
_LC_Text1::
	text_start
	line "REED: Yeehaw! How"
	done

SECTION "_LC_Text2", ROMX
_LC_Text2::
	text_start
	line "y'all doin' now?"
	done

SECTION "_LC_Text3", ROMX
_LC_Text3::
	text_start
	line "Whether you're up"
	done

SECTION "_LC_Text4", ROMX
_LC_Text4::
	text_start
	line "or way down low,"
	done

SECTION "_LC_Text5", ROMX
_LC_Text5::
	text_start
	line "don't you miss the"
	done

SECTION "_LC_Text6", ROMX
_LC_Text6::
	text_start
	line "LUCKY NUMBER SHOW!"
	done

SECTION "_LC_Text7", ROMX
_LC_Text7::
	text_start
	line "This week's Lucky"
	done

SECTION "_LC_Text8", ROMX
_LC_Text8::
	text_start
	line "Number is @"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_LC_Text9", ROMX
_LC_Text9::
	text_start
	line "I'll repeat that!"
	done

SECTION "_LC_Text10", ROMX
_LC_Text10::
	text_start
	line "Match it and go to"
	done

SECTION "_LC_Text11", ROMX
_LC_Text11::
	text_start
	line "the RADIO TOWER!"
	done

SECTION "_LC_DragText1", ROMX
_LC_DragText1::
	text_start
	line "…Repeating myself"
	done

SECTION "_LC_DragText2", ROMX
_LC_DragText2::
	text_start
	line "gets to be a drag…"
	done

; Places and People

SECTION "_PnP_Text1", ROMX
_PnP_Text1::
	text_start
	line "PLACES AND PEOPLE!"
	done

SECTION "_PnP_Text2", ROMX
_PnP_Text2::
	text_start
	line "Brought to you by"
	done

SECTION "_PnP_Text3", ROMX
_PnP_Text3::
	text_start
	line "me, DJ LILY!"
	done

SECTION "_PnP_Text4", ROMX
_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

SECTION "_PnP_CuteText", ROMX
_PnP_CuteText::
	text_start
	line "is cute."
	done

SECTION "_PnP_LazyText", ROMX
_PnP_LazyText::
	text_start
	line "is sort of lazy."
	done

SECTION "_PnP_HappyText", ROMX
_PnP_HappyText::
	text_start
	line "is always happy."
	done

SECTION "_PnP_NoisyText", ROMX
_PnP_NoisyText::
	text_start
	line "is quite noisy."
	done

SECTION "_PnP_PrecociousText", ROMX
_PnP_PrecociousText::
	text_start
	line "is precocious."
	done

SECTION "_PnP_BoldText", ROMX
_PnP_BoldText::
	text_start
	line "is somewhat bold."
	done

SECTION "_PnP_PickyText", ROMX
_PnP_PickyText::
	text_start
	line "is too picky!"
	done

SECTION "_PnP_SortOfOKText", ROMX
_PnP_SortOfOKText::
	text_start
	line "is sort of OK."
	done

SECTION "_PnP_SoSoText", ROMX
_PnP_SoSoText::
	text_start
	line "is just so-so."
	done

SECTION "_PnP_GreatText", ROMX
_PnP_GreatText::
	text_start
	line "is actually great."
	done

SECTION "_PnP_MyTypeText", ROMX
_PnP_MyTypeText::
	text_start
	line "is just my type."
	done

SECTION "_PnP_CoolText", ROMX
_PnP_CoolText::
	text_start
	line "is so cool, no?"
	done

SECTION "_PnP_InspiringText", ROMX
_PnP_InspiringText::
	text_start
	line "is inspiring!"
	done

SECTION "_PnP_WeirdText", ROMX
_PnP_WeirdText::
	text_start
	line "is kind of weird."
	done

SECTION "_PnP_RightForMeText", ROMX
_PnP_RightForMeText::
	text_start
	line "is right for me?"
	done

SECTION "_PnP_OddText", ROMX
_PnP_OddText::
	text_start
	line "is definitely odd!"
	done

SECTION "_PnP_Text5", ROMX
_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

SECTION "_RocketRadioText1", ROMX
_RocketRadioText1::
	text_start
	line "… …Ahem, we are"
	done

SECTION "_RocketRadioText2", ROMX
_RocketRadioText2::
	text_start
	line "TEAM ROCKET!"
	done

SECTION "_RocketRadioText3", ROMX
_RocketRadioText3::
	text_start
	line "After three years"
	done

SECTION "_RocketRadioText4", ROMX
_RocketRadioText4::
	text_start
	line "of preparation, we"
	done

SECTION "_RocketRadioText5", ROMX
_RocketRadioText5::
	text_start
	line "have risen again"
	done

SECTION "_RocketRadioText6", ROMX
_RocketRadioText6::
	text_start
	line "from the ashes!"
	done

SECTION "_RocketRadioText7", ROMX
_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Can you"
	done

SECTION "_RocketRadioText8", ROMX
_RocketRadioText8::
	text_start
	line "hear?@"
	text_pause
	text " We did it!"
	done

SECTION "_RocketRadioText9", ROMX
_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Where is our boss?"
	done

SECTION "_RocketRadioText10", ROMX
_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Is he listening?"
	done

SECTION "_BuenaRadioText1", ROMX
_BuenaRadioText1::
	text_start
	line "BUENA: BUENA here!"
	done

SECTION "_BuenaRadioText2", ROMX
_BuenaRadioText2::
	text_start
	line "Today's password!"
	done

SECTION "_BuenaRadioText3", ROMX
_BuenaRadioText3::
	text_start
	line "Let me think… It's"
	done

SECTION "_BuenaRadioText4", ROMX
_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_BuenaRadioText5", ROMX
_BuenaRadioText5::
	text_start
	line "Don't forget it!"
	done

SECTION "_BuenaRadioText6", ROMX
_BuenaRadioText6::
	text_start
	line "I'm in GOLDENROD's"
	done

SECTION "_BuenaRadioText7", ROMX
_BuenaRadioText7::
	text_start
	line "RADIO TOWER!"
	done

SECTION "_BuenaRadioMidnightText1", ROMX
_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Oh my…"
	done

SECTION "_BuenaRadioMidnightText2", ROMX
_BuenaRadioMidnightText2::
	text_start
	line "It's midnight! I"
	done

SECTION "_BuenaRadioMidnightText3", ROMX
_BuenaRadioMidnightText3::
	text_start
	line "have to shut down!"
	done

SECTION "_BuenaRadioMidnightText4", ROMX
_BuenaRadioMidnightText4::
	text_start
	line "Thanks for tuning"
	done

SECTION "_BuenaRadioMidnightText5", ROMX
_BuenaRadioMidnightText5::
	text_start
	line "in to the end! But"
	done

SECTION "_BuenaRadioMidnightText6", ROMX
_BuenaRadioMidnightText6::
	text_start
	line "don't stay up too"
	done

SECTION "_BuenaRadioMidnightText7", ROMX
_BuenaRadioMidnightText7::
	text_start
	line "late! Presented to"
	done

SECTION "_BuenaRadioMidnightText8", ROMX
_BuenaRadioMidnightText8::
	text_start
	line "you by DJ BUENA!"
	done

SECTION "_BuenaRadioMidnightText9", ROMX
_BuenaRadioMidnightText9::
	text "I'm outta here!"
	done

SECTION "_BuenaRadioMidnightText10", ROMX
_BuenaRadioMidnightText10::
	text "…"
	done

SECTION "_BuenaOffTheAirText", ROMX
_BuenaOffTheAirText::
	text_start
	line ""
	done

SECTION "_EnemyWithdrewText", ROMX
_EnemyWithdrewText::
	text "<ENEMY>"
	line "withdrew"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

SECTION "_EnemyUsedOnText", ROMX
_EnemyUsedOnText::
	text "<ENEMY>"
	line "used @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "on @"
	text_ram wEnemyMonNick
	text "!"
	prompt

SECTION "Text_ThatCantBeUsedRightNow", ROMX
Text_ThatCantBeUsedRightNow::
	text "That can't be used"
	line "right now."
	prompt

SECTION "Text_ThatItemCantBePutInThePack", ROMX
Text_ThatItemCantBePutInThePack::
	text "That item can't be"
	line "put in the PACK."
	done

SECTION "Text_TheItemWasPutInThePack", ROMX
Text_TheItemWasPutInThePack::
	text "The @"
	text_ram wStringBuffer1
	text_start
	line "was put in the"
	cont "PACK."
	done

SECTION "Text_RemainingTime", ROMX
Text_RemainingTime::
	text "Remaining Time"
	done

SECTION "Text_YourMonsHPWasHealed", ROMX
Text_YourMonsHPWasHealed::
	text "Your #MON's HP"
	line "was healed."
	prompt

SECTION "Text_Warping", ROMX
Text_Warping::
	text "Warping…"
	done

SECTION "UnknownText_0x1bd05e", ROMX
UnknownText_0x1bd05e::
	text "Which number"
	line "should be changed?"
	done

SECTION "UnknownText_0x1bd07f", ROMX
UnknownText_0x1bd07f::
	text "Will you play with"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

SECTION "UnknownText_0x1bd09a", ROMX
UnknownText_0x1bd09a::
	text "You need two #-"
	line "MON for breeding."
	prompt

SECTION "Text_BreedingIsNotPossible", ROMX
Text_BreedingIsNotPossible::
	text "Breeding is not"
	line "possible."
	prompt

SECTION "UnknownText_0x1bd0d8", ROMX
UnknownText_0x1bd0d8::
	text "The compatibility"
	line "is @"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "Should they breed?"
	done

SECTION "UnknownText_0x1bd109", ROMX
UnknownText_0x1bd109::
	text "There is no EGG."
	line ""
	prompt

SECTION "UnknownText_0x1bd11c", ROMX
UnknownText_0x1bd11c::
	text "It's going to"
	line "hatch!"
	prompt

SECTION "UnknownText_0x1bd131", ROMX
UnknownText_0x1bd131::
	text "Test event"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

SECTION "UnknownText_0x1bd145", ROMX
UnknownText_0x1bd145::
	text "Start!"
	done

SECTION "UnknownText_0x1bd14d", ROMX
UnknownText_0x1bd14d::
	text "End!"
	done

SECTION "UnknownText_0x1bd153", ROMX
UnknownText_0x1bd153::
	text "For a boy!"
	done

SECTION "UnknownText_0x1bd15f", ROMX
UnknownText_0x1bd15f::
	text "For a girl!"
	done

SECTION "UnknownText_0x1bd16c", ROMX
UnknownText_0x1bd16c::
	text "This doesn't"
	line "concern a boy!"
	done

SECTION "UnknownText_0x1bd188", ROMX
UnknownText_0x1bd188::
	text "The BOX is full!"
	done

SECTION "UnknownText_0x1bd19a", ROMX
UnknownText_0x1bd19a::
	text "A new CARD arrived"
	line "from @"
	text_ram wStringBuffer2
	text "."
	done

SECTION "UnknownText_0x1bd1ba", ROMX
UnknownText_0x1bd1ba::
	text "Put this CARD in"
	line "the CARD FOLDER?"
	done

SECTION "UnknownText_0x1bd1dd", ROMX
UnknownText_0x1bd1dd::
	text_ram wStringBuffer2
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

SECTION "UnknownText_0x1bd201", ROMX
UnknownText_0x1bd201::
	text "Starting link."
	done

SECTION "UnknownText_0x1bd211", ROMX
UnknownText_0x1bd211::
	text "Link terminated."
	done

SECTION "UnknownText_0x1bd223", ROMX
UnknownText_0x1bd223::
	text "Closing link."
	done

SECTION "UnknownText_0x1bd232", ROMX
UnknownText_0x1bd232::
	text "Clear the time"
	line "limit?"
	done

SECTION "UnknownText_0x1bd249", ROMX
UnknownText_0x1bd249::
	text "The time limit was"
	line "cleared."
	done

SECTION "UnknownText_0x1bd266", ROMX
UnknownText_0x1bd266::
	text "Pick which packet"
	line "as an error?"
	done

SECTION "UnknownText_0x1bd286", ROMX
UnknownText_0x1bd286::
	text "Trading @"
	text_ram wStringBuffer2
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "…"
	done

SECTION "UnknownText_0x1bd2a0", ROMX
UnknownText_0x1bd2a0::
	text "Obtained the"
	line "VOLTORBBADGE!"
	done

SECTION "_AskFloorElevatorText", ROMX
_AskFloorElevatorText::
	text "Which floor?"
	done

SECTION "_BugCatchingContestTimeUpText", ROMX
_BugCatchingContestTimeUpText::
	text "ANNOUNCER: BEEEP!"

	para "Time's up!"
	done

SECTION "_BugCatchingContestIsOverText", ROMX
_BugCatchingContestIsOverText::
	text "ANNOUNCER: The"
	line "Contest is over!"
	done

SECTION "_RepelWoreOffText", ROMX
_RepelWoreOffText::
	text "REPEL's effect"
	line "wore off."
	done

SECTION "_UseAnotherRepelText", ROMX
_UseAnotherRepelText::
	text "REPEL's effect"
	line "wore off."

	para "Use another?"
	done

SECTION "_PlayerFoundItemText", ROMX
_PlayerFoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_ButNoSpaceText", ROMX
_ButNoSpaceText::
	text "But <PLAYER> has"
	line "no space left…"
	done

SECTION "_JustSawSomeRareMonText", ROMX
_JustSawSomeRareMonText::
	text "I just saw some"
	line "rare @"
	text_ram wStringBuffer1
	text " in"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "I'll call you if I"
	line "see another rare"
	cont "#MON, OK?"
	prompt

SECTION "_SavingRecordText", ROMX
_SavingRecordText::
	text "SAVING RECORD…"
	line "DON'T TURN OFF!"
	done

SECTION "_ReceiveItemText", ROMX
_ReceiveItemText::
	text_ram wPlayerName
	text " received"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_promptbutton
	text_end

	text_end ; unused

SECTION "_NoCoinsText", ROMX
_NoCoinsText::
	text "You have no coins."
	prompt

SECTION "_NoCoinCaseText", ROMX
_NoCoinCaseText::
	text "You don't have a"
	line "COIN CASE."
	prompt

SECTION "_NPCTradeCableText", ROMX
_NPCTradeCableText::
	text "OK, connect the"
	line "Game Link Cable."
	prompt

SECTION "Text_NPCTraded", ROMX
Text_NPCTraded::
	text "<PLAYER> traded"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " for"
	cont "@"
	text_ram wStringBuffer2
	text ".@"
	text_end

SECTION "_NPCTradeFanfareText", ROMX
_NPCTradeFanfareText::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unused

SECTION "_NPCTradeIntroText1", ROMX
_NPCTradeIntroText1::
	text "I collect #MON."
	line "Do you have"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText1", ROMX
_NPCTradeCancelText1::
	text "You don't want to"
	line "trade? Aww…"
	done

SECTION "_NPCTradeWrongText1", ROMX
_NPCTradeWrongText1::
	text "Huh? That's not"
	line "@"
	text_ram wStringBuffer1
	text ". "
	cont "What a letdown…"
	done

SECTION "_NPCTradeCompleteText1", ROMX
_NPCTradeCompleteText1::
	text "Yay! I got myself"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "Thanks!"
	done

SECTION "_NPCTradeAfterText1", ROMX
_NPCTradeAfterText1::
	text "Hi, how's my old"
	line "@"
	text_ram wStringBuffer2
	text " doing?"
	done

SECTION "_NPCTradeIntroText2", ROMX
_NPCTradeIntroText2::
	text "Hi, I'm looking"
	line "for this #MON."

	para "If you have"
	line "@"
	text_ram wStringBuffer1
	text ", would"

	para "you trade it for"
	line "my @"
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText2", ROMX
_NPCTradeCancelText2::
	text "You don't have"
	line "one either?"

	para "Gee, that's really"
	line "disappointing…"
	done

SECTION "_NPCTradeWrongText2", ROMX
_NPCTradeWrongText2::
	text "You don't have"
	line "@"
	text_ram wStringBuffer1
	text "? That's"
	cont "too bad, then."
	done

SECTION "_NPCTradeCompleteText2", ROMX
_NPCTradeCompleteText2::
	text "Great! Thank you!"

	para "I finally got"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

SECTION "_NPCTradeAfterText2", ROMX
_NPCTradeAfterText2::
	text "Hi! The @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "you traded me is"
	cont "doing great!"
	done

SECTION "_NPCTradeIntroText3", ROMX
_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text "'s cute,"
	line "but I don't have"

	para "it. Do you have"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_NPCTradeCancelText3", ROMX
_NPCTradeCancelText3::
	text "You don't want to"
	line "trade? Oh, darn…"
	done

SECTION "_NPCTradeWrongText3", ROMX
_NPCTradeWrongText3::
	text "That's not"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Please trade with"
	line "me if you get one."
	done

SECTION "_NPCTradeCompleteText3", ROMX
_NPCTradeCompleteText3::
	text "Wow! Thank you!"
	line "I always wanted"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

SECTION "_NPCTradeAfterText3", ROMX
_NPCTradeAfterText3::
	text "How is that"
	line "@"
	text_ram wStringBuffer2
	text " I"
	cont "traded you doing?"

	para "Your @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "so cute!"
	done

SECTION "_NPCTradeCompleteText4", ROMX
_NPCTradeCompleteText4::
	text "Uh? What happened?"
	done

SECTION "_NPCTradeAfterText4", ROMX
_NPCTradeAfterText4::
	text "Trading is so odd…"

	para "I still have a lot"
	line "to learn about it."
	done

SECTION "_MomLeavingText1", ROMX
_MomLeavingText1::
	text "On a long journey,"
	line "money's important."

	para "Do you want me to"
	line "save your money?"
	done

SECTION "_MomLeavingText2", ROMX
_MomLeavingText2::
	text "OK, I'll take care"
	line "of your money."

	para "<……><……><……>"
	prompt

SECTION "_MomLeavingText3", ROMX
_MomLeavingText3::
	text "Be careful."

	para "#MON are your"
	line "friends. You need"
	cont "to work as a team."

	para "Now, go on!"
	done

SECTION "_MomIsThisAboutYourMoneyText", ROMX
_MomIsThisAboutYourMoneyText::
	text "Hi! Welcome home!"
	line "You're trying very"
	cont "hard, I see."

	para "I've kept your"
	line "room tidy."

	para "Or is this about"
	line "your money?"
	done

SECTION "_MomBankWhatDoYouWantToDoText", ROMX
_MomBankWhatDoYouWantToDoText::
	text "What do you want"
	line "to do?"
	done

SECTION "_MomStoreMoneyText", ROMX
_MomStoreMoneyText::
	text "How much do you"
	line "want to save?"
	done

SECTION "_MomTakeMoneyText", ROMX
_MomTakeMoneyText::
	text "How much do you"
	line "want to take?"
	done

SECTION "_MomSaveMoneyText", ROMX
_MomSaveMoneyText::
	text "Do you want to"
	line "save some money?"
	done

SECTION "_MomHaventSavedThatMuchText", ROMX
_MomHaventSavedThatMuchText::
	text "You haven't saved"
	line "that much."
	prompt

SECTION "_MomNotEnoughRoomInWalletText", ROMX
_MomNotEnoughRoomInWalletText::
	text "You can't take"
	line "that much."
	prompt

SECTION "_MomInsufficientFundsInWalletText", ROMX
_MomInsufficientFundsInWalletText::
	text "You don't have"
	line "that much."
	prompt

SECTION "_MomNotEnoughRoomInBankText", ROMX
_MomNotEnoughRoomInBankText::
	text "You can't save"
	line "that much."
	prompt

SECTION "_MomStartSavingMoneyText", ROMX
_MomStartSavingMoneyText::
	text "OK, I'll save your"
	line "money. Trust me!"

	para "<PLAYER>, stick"
	line "with it!"
	done

SECTION "_MomStoredMoneyText", ROMX
_MomStoredMoneyText::
	text "Your money's safe"
	line "here! Get going!"
	done

SECTION "_MomTakenMoneyText", ROMX
_MomTakenMoneyText::
	text "<PLAYER>, don't"
	line "give up!"
	done

SECTION "_MomJustDoWhatYouCanText", ROMX
_MomJustDoWhatYouCanText::
	text "Just do what"
	line "you can."
	done

SECTION "_DaycareDummyText", ROMX
_DaycareDummyText::
	text_start
	done

SECTION "_DayCareManIntroText", ROMX
_DayCareManIntroText::
	text "I'm the DAY-CARE"
	line "MAN. Want me to"
	cont "raise a #MON?"
	done

SECTION "_DayCareManOddEggText", ROMX
_DayCareManOddEggText::
	text "I'm the DAY-CARE"
	line "MAN. Do you know"
	cont "about EGGS?"

	para "I was raising"
	line "#MON with my"
	cont "wife, you see."

	para "We were shocked to"
	line "find an EGG!"

	para "How incredible is"
	line "that?"

	para "So, want me to"
	line "raise a #MON?"
	done

SECTION "_DayCareLadyIntroText", ROMX
_DayCareLadyIntroText::
	text "I'm the DAY-CARE"
	line "LADY."

	para "Should I raise a"
	line "#MON for you?"
	done

SECTION "_DayCareLadyOddEggText", ROMX
_DayCareLadyOddEggText::
	text "I'm the DAY-CARE"
	line "LADY. Do you know"
	cont "about EGGS?"

	para "My husband and I"
	line "were raising some"
	cont "#MON, you see."

	para "We were shocked to"
	line "find an EGG!"

	para "How incredible"
	line "could that be?"

	para "Should I raise a"
	line "#MON for you?"
	done

SECTION "_WhatShouldIRaiseText", ROMX
_WhatShouldIRaiseText::
	text "What should I"
	line "raise for you?"
	prompt

SECTION "_OnlyOneMonText", ROMX
_OnlyOneMonText::
	text "Oh? But you have"
	line "just one #MON."
	prompt

SECTION "_CantAcceptEggText", ROMX
_CantAcceptEggText::
	text "Sorry, but I can't"
	line "accept an EGG."
	prompt

SECTION "_RemoveMailText", ROMX
_RemoveMailText::
	text "Remove MAIL before"
	line "you come see me."
	prompt

SECTION "_LastHealthyMonText", ROMX
_LastHealthyMonText::
	text "If you give me"
	line "that, what will"
	cont "you battle with?"
	prompt

SECTION "_IllRaiseYourMonText", ROMX
_IllRaiseYourMonText::
	text "OK. I'll raise"
	line "your @"
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_ComeBackLaterText", ROMX
_ComeBackLaterText::
	text "Come back for it"
	line "later."
	done

SECTION "_AreWeGeniusesText", ROMX
_AreWeGeniusesText::
	text "Are we geniuses or"
	line "what? Want to see"
	cont "your @"
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_YourMonHasGrownText", ROMX
_YourMonHasGrownText::
	text "Your @"
	text_ram wStringBuffer1
	text_start
	line "has grown a lot."

	para "By level, it's"
	line "grown by @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "If you want your"
	line "#MON back, it"
	cont "will cost ¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

SECTION "_PerfectHeresYourMonText", ROMX
_PerfectHeresYourMonText::
	text "Perfect! Here's"
	line "your #MON."
	prompt

SECTION "_GotBackMonText", ROMX
_GotBackMonText::
	text "<PLAYER> got back"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BackAlreadyText", ROMX
_BackAlreadyText::
	text "Huh? Back already?"
	line "Your @"
	text_ram wStringBuffer1
	text_start
	para "needs a little"
	line "more time with us."

	para "If you want your"
	line "#MON back, it"
	cont "will cost ¥100."
	done

SECTION "_HaveNoRoomText", ROMX
_HaveNoRoomText::
	text "You have no room"
	line "for it."
	prompt

SECTION "_NotEnoughMoneyText", ROMX
_NotEnoughMoneyText::
	text "You don't have"
	line "enough money."
	prompt

SECTION "_OhFineThenText", ROMX
_OhFineThenText::
	text "Oh, fine then."
	prompt

SECTION "_ComeAgainText", ROMX
_ComeAgainText::
	text "Come again."
	done

SECTION "_NotYetText", ROMX
_NotYetText::
	text "Not yet…"
	done

SECTION "_FoundAnEggText", ROMX
_FoundAnEggText::
	text "Ah, it's you!"

	para "We were raising"
	line "your #MON, and"

	para "my goodness, were"
	line "we surprised!"

	para "Your #MON had"
	line "an EGG!"

	para "We don't know how"
	line "it got there, but"

	para "your #MON had"
	line "it. You want it?"
	done

SECTION "_ReceivedEggText", ROMX
_ReceivedEggText::
	text "<PLAYER> received"
	line "the EGG!"
	done

SECTION "_TakeGoodCareOfEggText", ROMX
_TakeGoodCareOfEggText::
	text "Take good care of"
	line "it."
	done

SECTION "_IllKeepItThanksText", ROMX
_IllKeepItThanksText::
	text "Well then, I'll"
	line "keep it. Thanks!"
	done

SECTION "_NoRoomForEggText", ROMX
_NoRoomForEggText::
	text "You have no room"
	line "in your party."
	cont "Come back later."
	done

SECTION "_WhichMonPhotoText", ROMX
_WhichMonPhotoText::
	text "Which #MON"
	line "should I photo-"
	cont "graph?"
	prompt

SECTION "_HoldStillText", ROMX
_HoldStillText::
	text "All righty. Hold"
	line "still for a bit."
	prompt

SECTION "_PrestoAllDoneText", ROMX
_PrestoAllDoneText::
	text "Presto! All done."
	line "Come again, OK?"
	done
SECTION "_NoPhotoText", ROMX
_NoPhotoText::
	text "Oh, no picture?"
	line "Come again, OK?"
	done

SECTION "_EggPhotoText", ROMX
_EggPhotoText::
	text "An EGG? My talent"
	line "is worth more…"
	done

SECTION "_NameRaterHelloText", ROMX
_NameRaterHelloText::
	text "Hello, hello! I'm"
	line "the NAME RATER."

	para "I rate the names"
	line "of #MON."

	para "Would you like me"
	line "to rate names?"
	done

SECTION "_NameRaterWhichMonText", ROMX
_NameRaterWhichMonText::
	text "Which #MON's"
	line "nickname should I"
	cont "rate for you?"
	prompt

SECTION "_NameRaterBetterNameText", ROMX
_NameRaterBetterNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "That's a fairly"
	cont "decent name."

	para "But, how about a"
	line "slightly better"
	cont "nickname?"

	para "Want me to give it"
	line "a better name?"
	done

SECTION "_NameRaterWhatNameText", ROMX
_NameRaterWhatNameText::
	text "All right. What"
	line "name should we"
	cont "give it, then?"
	prompt

SECTION "_NameRaterFinishedText", ROMX
_NameRaterFinishedText::
	text "That's a better"
	line "name than before!"

	para "Well done!"
	done

SECTION "_NameRaterComeAgainText", ROMX
_NameRaterComeAgainText::
	text "OK, then. Come"
	line "again sometime."
	done

SECTION "_NameRaterPerfectNameText", ROMX
_NameRaterPerfectNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat @"
	text_ram wStringBuffer1
	text_start
	line "with loving care."
	done

SECTION "_NameRaterEggText", ROMX
_NameRaterEggText::
	text "Whoa… That's just"
	line "an EGG."
	done

SECTION "_NameRaterSameNameText", ROMX
_NameRaterSameNameText::
	text "It might look the"
	line "same as before,"

	para "but this new name"
	line "is much better!"

	para "Well done!"
	done

SECTION "_NameRaterNamedText", ROMX
_NameRaterNamedText::
	text "All right. This"
	line "#MON is now"
	cont "named @"
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "Text_Gained", ROMX
Text_Gained::
	text_ram wStringBuffer1
	text " gained@"
	text_end

SECTION "_BoostedExpPointsText", ROMX
_BoostedExpPointsText::
	text_start
	line "a boosted"
	cont "@"
	text_decimal wStringBuffer2, 2, 5
	text " EXP. Points!"
	prompt

SECTION "_ExpPointsText", ROMX
_ExpPointsText::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 5
	text " EXP. Points!"
	prompt

SECTION "Text_GoMon", ROMX
Text_GoMon::
	text "Go! @"
	text_end

SECTION "Text_DoItMon", ROMX
Text_DoItMon::
	text "Do it! @"
	text_end

SECTION "Text_GoForItMon", ROMX
Text_GoForItMon::
	text "Go for it,"
	line "@"
	text_end

SECTION "Text_YourFoesWeakGetmMon", ROMX
Text_YourFoesWeakGetmMon::
	text "Your foe's weak!"
	line "Get'm, @"
	text_end

SECTION "_BattleMonNicknameText", ROMX
_BattleMonNicknameText::
	text_ram wBattleMonNick
	text "!"
	done

SECTION "Text_BattleMonNickComma", ROMX
Text_BattleMonNickComma::
	text_ram wBattleMonNick
	text ",@"
	text_end

SECTION "_ThatsEnoughComeBackText", ROMX
_ThatsEnoughComeBackText::
	text " that's"
	line "enough! Come back!@"
	text_end

SECTION "_OKComeBackText", ROMX
_OKComeBackText::
	text " OK!"
	line "Come back!@"
	text_end

SECTION "_GoodComeBackText", ROMX
_GoodComeBackText::
	text " good!"
	line "Come back!@"
	text_end

SECTION "_ComeBackText", ROMX
_ComeBackText::
	text " come"
	line "back!"
	done

SECTION "_BootedTMText", ROMX
_BootedTMText::
	text "Booted up a TM."
	prompt

SECTION "_BootedHMText", ROMX
_BootedHMText::
	text "Booted up an HM."
	prompt

SECTION "_ContainedMoveText", ROMX
_ContainedMoveText::
	text "It contained"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Teach @"
	text_ram wStringBuffer2
	text_start
	line "to a #MON?"
	done

SECTION "_TMHMNotCompatibleText", ROMX
_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " is"
	line "not compatible"
	cont "with @"
	text_ram wStringBuffer1
	text "."

	para "It can't learn"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_NoRoomTMHMText", ROMX
_NoRoomTMHMText::
	text "You have no room"
	line "for any more"
	cont "@"
	text_ram wStringBuffer1
	text "S."
	prompt

SECTION "_ReceivedTMHMText", ROMX
_ReceivedTMHMText::
	text "You received"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

SECTION "_MysteryGiftCanceledText", ROMX
_MysteryGiftCanceledText::
	text "The link has been"
	line "cancelled."
	prompt

SECTION "_MysteryGiftCommErrorText", ROMX
_MysteryGiftCommErrorText::
	text "Communication"
	line "error."
	prompt

SECTION "_RetrieveMysteryGiftText", ROMX
_RetrieveMysteryGiftText::
	text "Must retrieve GIFT"
	line "at #MON CENTER."
	prompt

SECTION "_YourFriendIsNotReadyText", ROMX
_YourFriendIsNotReadyText::
	text "Your friend isn't"
	line "ready."
	prompt

SECTION "_MysteryGiftFiveADayText", ROMX
_MysteryGiftFiveADayText::
	text "Sorry--only five"
	line "GIFTS a day."
	prompt

SECTION "_MysteryGiftOneADayText", ROMX
_MysteryGiftOneADayText::
	text "Sorry. One GIFT"
	line "a day per person."
	prompt

SECTION "_MysteryGiftSentText", ROMX
_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_MysteryGiftSentHomeText", ROMX
_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "to @"
	text_ram wMysteryGiftPlayerName
	text "'s home."
	prompt

SECTION "_MysteryGiftReceivedCardText", ROMX
_MysteryGiftReceivedCardText::
	text "Received"
	line "@"
	text_ram wc850
	text "'s CARD."
	prompt

SECTION "_MysteryGiftListedCardText", ROMX
_MysteryGiftListedCardText::
	text_ram wc850
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wDeciramBuffer, 1, 2
	text "."
	prompt

SECTION "_MysteryGiftNotRegisteredCardText", ROMX
_MysteryGiftNotRegisteredCardText::
	text "The CARD was not"
	line "registered."
	prompt

SECTION "_MysteryGiftLinkCancelledText", ROMX
_MysteryGiftLinkCancelledText::
	text "The link has been"
	line "cancelled."
	prompt

SECTION "_MysteryGiftLinkCommErrorText", ROMX
_MysteryGiftLinkCommErrorText::
	text "Communication"
	line "error."
	prompt

SECTION "_BadgeRequiredText", ROMX
_BadgeRequiredText::
	text "Sorry! A new BADGE"
	line "is required."
	prompt

SECTION "_CantUseItemText", ROMX
_CantUseItemText::
	text "Can't use that"
	line "here."
	prompt

SECTION "_UseCutText", ROMX
_UseCutText::
	text_ram wStringBuffer2
	text " used"
	line "CUT!"
	prompt

SECTION "_CutNothingText", ROMX
_CutNothingText::
	text "There's nothing to"
	line "CUT here."
	prompt

SECTION "_BlindingFlashText", ROMX
_BlindingFlashText::
	text "A blinding FLASH"
	line "lights the area!@"
	text_promptbutton
	text_end

	text_end ; unused

SECTION "_UsedSurfText", ROMX
_UsedSurfText::
	text_ram wStringBuffer2
	text " used"
	line "SURF!"
	done

SECTION "_CantSurfText", ROMX
_CantSurfText::
	text "You can't SURF"
	line "here."
	prompt

SECTION "_AlreadySurfingText", ROMX
_AlreadySurfingText::
	text "You're already"
	line "SURFING."
	prompt

SECTION "_AskSurfText", ROMX
_AskSurfText::
	text "The water is calm."
	line "Want to SURF?"
	done

SECTION "_UseWaterfallText", ROMX
_UseWaterfallText::
	text_ram wStringBuffer2
	text " used"
	line "WATERFALL!"
	done

SECTION "_HugeWaterfallText", ROMX
_HugeWaterfallText::
	text "Wow, it's a huge"
	line "waterfall."
	done

SECTION "_AskWaterfallText", ROMX
_AskWaterfallText::
	text "Do you want to use"
	line "WATERFALL?"
	done

SECTION "_UseDigText", ROMX
_UseDigText::
	text_ram wStringBuffer2
	text " used"
	line "DIG!"
	done

SECTION "_UseEscapeRopeText", ROMX
_UseEscapeRopeText::
	text "<PLAYER> used an"
	line "ESCAPE ROPE."
	done

SECTION "_CantUseDigText", ROMX
_CantUseDigText::
	text "Can't use that"
	line "here."
	done

SECTION "_TeleportReturnText", ROMX
_TeleportReturnText::
	text "Return to the last"
	line "#MON CENTER."
	done

SECTION "_CantUseTeleportText", ROMX
_CantUseTeleportText::
	text "Can't use that"
	line "here."

	para ""
	done

SECTION "_AlreadyUsingStrengthText", ROMX
_AlreadyUsingStrengthText::
	text "A #MON is using"
	line "STRENGTH already."
	prompt

SECTION "_UseStrengthText", ROMX
_UseStrengthText::
	text_ram wStringBuffer2
	text " used"
	line "STRENGTH!"
	done

SECTION "_MoveBoulderText", ROMX
_MoveBoulderText::
	text_ram wStringBuffer1
	text " can"
	line "move boulders."
	prompt

SECTION "_AskStrengthText", ROMX
_AskStrengthText::
	text "A #MON may be"
	line "able to move this."

	para "Want to use"
	line "STRENGTH?"
	done

SECTION "_BouldersMoveText", ROMX
_BouldersMoveText::
	text "Boulders may now"
	line "be moved!"
	done

SECTION "_BouldersMayMoveText", ROMX
_BouldersMayMoveText::
	text "A #MON may be"
	line "able to move this."
	done

SECTION "_UseWhirlpoolText", ROMX
_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " used"
	line "WHIRLPOOL!"
	prompt

SECTION "_MayPassWhirlpoolText", ROMX
_MayPassWhirlpoolText::
	text "It's a vicious"
	line "whirlpool!"

	para "A #MON may be"
	line "able to pass it."
	done

SECTION "_AskWhirlpoolText", ROMX
_AskWhirlpoolText::
	text "A whirlpool is in"
	line "the way."

	para "Want to use"
	line "WHIRLPOOL?"
	done

SECTION "_UseHeadbuttText", ROMX
_UseHeadbuttText::
	text_ram wStringBuffer2
	text " did a"
	line "HEADBUTT!"
	prompt

SECTION "_HeadbuttNothingText", ROMX
_HeadbuttNothingText::
	text "Nope. Nothing…"
	done

SECTION "_AskHeadbuttText", ROMX
_AskHeadbuttText::
	text "A #MON could be"
	line "in this tree."

	para "Want to HEADBUTT"
	line "it?"
	done

SECTION "_UseRockSmashText", ROMX
_UseRockSmashText::
	text_ram wStringBuffer2
	text " used"
	line "ROCK SMASH!"
	prompt

SECTION "_MaySmashText", ROMX
_MaySmashText::
	text "Maybe a #MON"
	line "can break this."
	done

SECTION "_AskRockSmashText", ROMX
_AskRockSmashText::
	text "This rock looks"
	line "breakable."

	para "Want to use ROCK"
	line "SMASH?"
	done

SECTION "_RodBiteText", ROMX
_RodBiteText::
	text "Oh!"
	line "A bite!"
	prompt

SECTION "_RodNothingText", ROMX
_RodNothingText::
	text "Not even a nibble!"
	prompt

; unused
SECTION "_UnusedNothingHereText", ROMX
_UnusedNothingHereText::
	text "Looks like there's"
	line "nothing here."
	prompt

SECTION "_CantGetOffBikeText", ROMX
_CantGetOffBikeText::
	text "You can't get off"
	line "here!"
	done

SECTION "_GotOnBikeText", ROMX
_GotOnBikeText::
	text "<PLAYER> got on the"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

SECTION "_GotOffBikeText", ROMX
_GotOffBikeText::
	text "<PLAYER> got off"
	line "the @"
	text_ram wStringBuffer2
	text "."
	done

SECTION "_AskCutText", ROMX
_AskCutText::
	text "This tree can be"
	line "CUT!"

	para "Want to use CUT?"
	done

SECTION "_CanCutText", ROMX
_CanCutText::
	text "This tree can be"
	line "CUT!"
	done

SECTION "_FoundItemText", ROMX
_FoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

SECTION "_CantCarryItemText", ROMX
_CantCarryItemText::
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

SECTION "_WhitedOutText", ROMX
_WhitedOutText::
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	done

SECTION "_ItemfinderItemNearbyText", ROMX
_ItemfinderItemNearbyText::
	text "Yes! ITEMFINDER"
	line "indicates there's"
	cont "an item nearby."
	prompt

SECTION "_ItemfinderNopeText", ROMX
_ItemfinderNopeText::
	text "Nope! ITEMFINDER"
	line "isn't responding."
	prompt

SECTION "_PoisonFaintText", ROMX
_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "fainted!"
	prompt

SECTION "_PoisonWhiteoutText", ROMX
_PoisonWhiteoutText::
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	prompt

SECTION "_UseSweetScentText", ROMX
_UseSweetScentText::
	text_ram wStringBuffer3
	text " used"
	line "SWEET SCENT!"
	done

SECTION "_SweetScentNothingText", ROMX
_SweetScentNothingText::
	text "Looks like there's"
	line "nothing here…"
	done

SECTION "_SquirtbottleNothingText", ROMX
_SquirtbottleNothingText::
	text "<PLAYER> sprinkled"
	line "water."

	para "But nothing"
	line "happened…"
	done

SECTION "_UseSacredAshText", ROMX
_UseSacredAshText::
	text "<PLAYER>'s #MON"
	line "were all healed!"
	done

SECTION "_AnEggCantHoldAnItemText", ROMX
_AnEggCantHoldAnItemText::
	text "An EGG can't hold"
	line "an item."
	prompt

SECTION "_PackNoItemText", ROMX
_PackNoItemText::
	text "No items."
	done

SECTION "_AskThrowAwayText", ROMX
_AskThrowAwayText::
	text "Throw away how"
	line "many?"
	done

SECTION "_AskQuantityThrowAwayText", ROMX
_AskQuantityThrowAwayText::
	text "Throw away @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

SECTION "_ThrewAwayText", ROMX
_ThrewAwayText::
	text "Threw away"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

SECTION "_OakThisIsntTheTimeText", ROMX
_OakThisIsntTheTimeText::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

SECTION "_YouDontHaveAMonText", ROMX
_YouDontHaveAMonText::
	text "You don't have a"
	line "#MON!"
	prompt

SECTION "_RegisteredItemText", ROMX
_RegisteredItemText::
	text "Registered the"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_CantRegisterText", ROMX
_CantRegisterText::
	text "You can't register"
	line "that item."
	prompt

SECTION "_AskItemMoveText", ROMX
_AskItemMoveText::
	text "Where should this"
	line "be moved to?"
	done

SECTION "_PackEmptyText", ROMX
_PackEmptyText::
	text_start
	done

SECTION "_YouCantUseItInABattleText", ROMX
_YouCantUseItInABattleText::
	text "You can't use it"
	line "in a battle."
	prompt

SECTION "_AreYouABoyOrAreYouAGirlText", ROMX
_AreYouABoyOrAreYouAGirlText::
	text "Are you a boy?"
	line "Or are you a girl?"
	done

SECTION "Text_BattleEffectActivate", ROMX
Text_BattleEffectActivate::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

SECTION "_BattleStatWentWayUpText", ROMX
_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>went way up!"
	prompt

SECTION "_BattleStatWentUpText", ROMX
_BattleStatWentUpText::
	text " went up!"
	prompt

SECTION "Text_BattleFoeEffectActivate", ROMX
Text_BattleFoeEffectActivate::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

SECTION "_BattleStatSharplyFellText", ROMX
_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>sharply fell!"
	prompt

SECTION "_BattleStatFellText", ROMX
_BattleStatFellText::
	text " fell!"
	prompt

SECTION "Text_BattleUser", ROMX
Text_BattleUser::
	text "<USER>@"
	text_end

SECTION "_BattleMadeWhirlwindText", ROMX
_BattleMadeWhirlwindText::
	text_start
	line "made a whirlwind!"
	prompt

SECTION "_BattleTookSunlightText", ROMX
_BattleTookSunlightText::
	text_start
	line "took in sunlight!"
	prompt

SECTION "_BattleLoweredHeadText", ROMX
_BattleLoweredHeadText::
	text_start
	line "lowered its head!"
	prompt

SECTION "_BattleGlowingText", ROMX
_BattleGlowingText::
	text_start
	line "is glowing!"
	prompt

SECTION "_BattleFlewText", ROMX
_BattleFlewText::
	text_start
	line "flew up high!"
	prompt

SECTION "_BattleDugText", ROMX
_BattleDugText::
	text_start
	line "dug a hole!"
	prompt

SECTION "_ActorNameText", ROMX
_ActorNameText::
	text "<USER>@"
	text_end

SECTION "_UsedMoveText", ROMX
_UsedMoveText::
	text_start
	line "used @"
	text_end

SECTION "_UsedInsteadText", ROMX
_UsedInsteadText::
	text "instead,"
	cont "@"
	text_end

SECTION "_MoveNameText", ROMX
_MoveNameText::
	text_ram wStringBuffer2
	text "!"
	done

SECTION "Text_BreedHuh", ROMX
Text_BreedHuh::
	text "Huh?"

	para "@"
	text_end

SECTION "_BreedClearboxText", ROMX
_BreedClearboxText::
	text_start
	done

SECTION "_BreedEggHatchText", ROMX
_BreedEggHatchText::
	text_ram wStringBuffer1
	text " came"
	line "out of its EGG!@"
	sound_caught_mon
	text_promptbutton
	text_end

	text_end ; unused

SECTION "_BreedAskNicknameText", ROMX
_BreedAskNicknameText::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_LeftWithDayCareLadyText", ROMX
_LeftWithDayCareLadyText::
	text "It's @"
	text_ram wBreedMon2Nick
	text_start
	line "that was left with"
	cont "the DAY-CARE LADY."
	done

SECTION "_LeftWithDayCareManText", ROMX
_LeftWithDayCareManText::
	text "It's @"
	text_ram wBreedMon1Nick
	text_start
	line "that was left with"
	cont "the DAY-CARE MAN."
	done

SECTION "_BreedBrimmingWithEnergyText", ROMX
_BreedBrimmingWithEnergyText::
	text "It's brimming with"
	line "energy."
	prompt

SECTION "_BreedNoInterestText", ROMX
_BreedNoInterestText::
	text "It has no interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedAppearsToCareForText", ROMX
_BreedAppearsToCareForText::
	text "It appears to care"
	line "for @"
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedFriendlyText", ROMX
_BreedFriendlyText::
	text "It's friendly with"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_BreedShowsInterestText", ROMX
_BreedShowsInterestText::
	text "It shows interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_EmptyMailboxText", ROMX
_EmptyMailboxText::
	text "There's no MAIL"
	line "here."
	prompt

SECTION "_MailClearedPutAwayText", ROMX
_MailClearedPutAwayText::
	text "The cleared MAIL"
	line "was put away."
	prompt

SECTION "_MailPackFullText", ROMX
_MailPackFullText::
	text "The PACK is full."
	prompt

SECTION "_MailMessageLostText", ROMX
_MailMessageLostText::
	text "The MAIL's message"
	line "will be lost. OK?"
	done

SECTION "_MailAlreadyHoldingItemText", ROMX
_MailAlreadyHoldingItemText::
	text "It's already hold-"
	line "ing an item."
	prompt

SECTION "_MailEggText", ROMX
_MailEggText::
	text "An EGG can't hold"
	line "any MAIL."
	prompt

SECTION "_MailMovedFromBoxText", ROMX
_MailMovedFromBoxText::
	text "The MAIL was moved"
	line "from the MAILBOX."
	prompt

; unused
SECTION "_YesPromptText", ROMX
_YesPromptText::
	text "Yes"
	prompt

; unused
SECTION "_NoPromptText", ROMX
_NoPromptText::
	text "No"
	prompt

; unused
SECTION "_AnimationTypeText", ROMX
_AnimationTypeText::
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Animation type @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

; unused
SECTION "_MonNumberText", ROMX
_MonNumberText::
	text "#MON number?"
	done

SECTION "_WasSentToBillsPCText", ROMX
_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text " was"
	line "sent to BILL's PC."
	prompt

SECTION "_PCGottaHavePokemonText", ROMX
_PCGottaHavePokemonText::
	text "You gotta have"
	line "#MON to call!"
	prompt

SECTION "_PCWhatText", ROMX
_PCWhatText::
	text "What?"
	done

SECTION "_PCMonHoldingMailText", ROMX
_PCMonHoldingMailText::
	text "There is a #MON"
	line "holding MAIL."

	para "Please remove the"
	line "MAIL."
	prompt

SECTION "_PCNoSingleMonText", ROMX
_PCNoSingleMonText::
	text "You don't have a"
	line "single #MON!"
	prompt

SECTION "_PCCantDepositLastMonText", ROMX
_PCCantDepositLastMonText::
	text "You can't deposit"
	line "your last #MON!"
	prompt

SECTION "_PCCantTakeText", ROMX
_PCCantTakeText::
	text "You can't take any"
	line "more #MON."
	prompt

SECTION "_ContestCaughtMonText", ROMX
_ContestCaughtMonText::
	text "Caught @"
	text_ram wStringBuffer1
	text "!"
	prompt

SECTION "_ContestAskSwitchText", ROMX
_ContestAskSwitchText::
	text "Switch #MON?"
	done

SECTION "_ContestAlreadyCaughtText", ROMX
_ContestAlreadyCaughtText::
	text "You already caught"
	line "a @"
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_ContestJudging_FirstPlaceText", ROMX
_ContestJudging_FirstPlaceText::
	text "This Bug-Catching"
	line "Contest winner is@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "who caught a"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "_ContestJudging_FirstPlaceScoreText", ROMX
_ContestJudging_FirstPlaceScoreText::
	text_start

	para "The winning score"
	line "was @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " points!"
	prompt

SECTION "_ContestJudging_SecondPlaceText", ROMX
_ContestJudging_SecondPlaceText::
	text "Placing second was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "_ContestJudging_SecondPlaceScoreText", ROMX
_ContestJudging_SecondPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

SECTION "_ContestJudging_ThirdPlaceText", ROMX
_ContestJudging_ThirdPlaceText::
	text "Placing third was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

SECTION "_ContestJudging_ThirdPlaceScoreText", ROMX
_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

SECTION "_MagikarpGuruMeasureText", ROMX
_MagikarpGuruMeasureText::
	text "Let me measure"
	line "that MAGIKARP."

	para "…Hm, it measures"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_KarpGuruRecordText", ROMX
_KarpGuruRecordText::
	text "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer1
	text " caught by"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

	text_end ; unused

SECTION "_LuckyNumberMatchPartyText", ROMX
_LuckyNumberMatchPartyText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your party."
	prompt

SECTION "_LuckyNumberMatchPCText", ROMX
_LuckyNumberMatchPCText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your PC BOX."
	prompt

SECTION "_CaughtAskNicknameText", ROMX
_CaughtAskNicknameText::
	text "Give a nickname to"
	line "the @"
	text_ram wStringBuffer1
	text " you"
	cont "received?"
	done

SECTION "_PokecenterPCCantUseText", ROMX
_PokecenterPCCantUseText::
	text "Bzzzzt! You must"
	line "have a #MON to"
	cont "use this!"
	prompt

SECTION "_PlayersPCTurnOnText", ROMX
_PlayersPCTurnOnText::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

SECTION "_PlayersPCAskWhatDoText", ROMX
_PlayersPCAskWhatDoText::
	text "What do you want"
	line "to do?"
	done

SECTION "_PlayersPCHowManyWithdrawText", ROMX
_PlayersPCHowManyWithdrawText::
	text "How many do you"
	line "want to withdraw?"
	done

SECTION "_PlayersPCWithdrewItemsText", ROMX
_PlayersPCWithdrewItemsText::
	text "Withdrew @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

SECTION "_PlayersPCNoRoomWithdrawText", ROMX
_PlayersPCNoRoomWithdrawText::
	text "There's no room"
	line "for more items."
	prompt

SECTION "_PlayersPCNoItemsText", ROMX
_PlayersPCNoItemsText::
	text "No items here!"
	prompt

SECTION "_PlayersPCHowManyDepositText", ROMX
_PlayersPCHowManyDepositText::
	text "How many do you"
	line "want to deposit?"
	done

SECTION "_PlayersPCDepositItemsText", ROMX
_PlayersPCDepositItemsText::
	text "Deposited @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

SECTION "_PlayersPCNoRoomDepositText", ROMX
_PlayersPCNoRoomDepositText::
	text "There's no room to"
	line "store items."
	prompt

SECTION "_PokecenterPCTurnOnText", ROMX
_PokecenterPCTurnOnText::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

SECTION "_PokecenterPCWhoseText", ROMX
_PokecenterPCWhoseText::
	text "Access whose PC?"
	done

SECTION "_PokecenterBillsPCText", ROMX
_PokecenterBillsPCText::
	text "BILL's PC"
	line "accessed."

	para "#MON Storage"
	line "System opened."
	prompt

SECTION "_PokecenterPlayersPCText", ROMX
_PokecenterPlayersPCText::
	text "Accessed own PC."

	para "Item Storage"
	line "System opened."
	prompt

SECTION "_PokecenterOaksPCText", ROMX
_PokecenterOaksPCText::
	text "PROF.OAK's PC"
	line "accessed."

	para "#DEX Rating"
	line "System opened."
	prompt

SECTION "_PokecenterPCOaksClosedText", ROMX
_PokecenterPCOaksClosedText::
	text "…"
	line "Link closed…"
	done

SECTION "_OakPCText1", ROMX
_OakPCText1::
	text "Want to get your"
	line "#DEX rated?"
	done

SECTION "_OakPCText2", ROMX
_OakPCText2::
	text "Current #DEX"
	line "completion level:"
	prompt

SECTION "_OakPCText3", ROMX
_OakPCText3::
	text_ram wStringBuffer3
	text " #MON seen"
	line "@"
	text_ram wStringBuffer4
	text " #MON owned"

	para "PROF.OAK's"
	line "Rating:"
	done

SECTION "_OakRating01", ROMX
_OakRating01::
	text "Look for #MON"
	line "in grassy areas!"
	done

SECTION "_OakRating02", ROMX
_OakRating02::
	text "Good. I see you"
	line "understand how to"
	cont "use # BALLS."
	done

SECTION "_OakRating03", ROMX
_OakRating03::
	text "You're getting"
	line "good at this."

	para "But you have a"
	line "long way to go."
	done

SECTION "_OakRating04", ROMX
_OakRating04::
	text "You need to fill"
	line "up the #DEX."

	para "Catch different"
	line "kinds of #MON!"
	done

SECTION "_OakRating05", ROMX
_OakRating05::
	text "You're trying--I"
	line "can see that."

	para "Your #DEX is"
	line "coming together."
	done

SECTION "_OakRating06", ROMX
_OakRating06::
	text "To evolve, some"
	line "#MON grow,"

	para "others use the"
	line "effects of STONES."
	done

SECTION "_OakRating07", ROMX
_OakRating07::
	text "Have you gotten a"
	line "fishing ROD? You"

	para "can catch #MON"
	line "by fishing."
	done

SECTION "_OakRating08", ROMX
_OakRating08::
	text "Excellent! You"
	line "seem to like col-"
	cont "lecting things!"
	done

SECTION "_OakRating09", ROMX
_OakRating09::
	text "Some #MON only"
	line "appear during"

	para "certain times of"
	line "the day."
	done

SECTION "_OakRating10", ROMX
_OakRating10::
	text "Your #DEX is"
	line "filling up. Keep"
	cont "up the good work!"
	done

SECTION "_OakRating11", ROMX
_OakRating11::
	text "I'm impressed."
	line "You're evolving"

	para "#MON, not just"
	line "catching them."
	done

SECTION "_OakRating12", ROMX
_OakRating12::
	text "Have you met KURT?"
	line "His custom BALLS"
	cont "should help."
	done

SECTION "_OakRating13", ROMX
_OakRating13::
	text "Wow. You've found"
	line "more #MON than"

	para "the last #DEX"
	line "research project."
	done

SECTION "_OakRating14", ROMX
_OakRating14::
	text "Are you trading"
	line "your #MON?"

	para "It's tough to do"
	line "this alone!"
	done

SECTION "_OakRating15", ROMX
_OakRating15::
	text "Wow! You've hit"
	line "200! Your #DEX"
	cont "is looking great!"
	done

SECTION "_OakRating16", ROMX
_OakRating16::
	text "You've found so"
	line "many #MON!"

	para "You've really"
	line "helped my studies!"
	done

SECTION "_OakRating17", ROMX
_OakRating17::
	text "Magnificent! You"
	line "could become a"

	para "#MON professor"
	line "right now!"
	done

SECTION "_OakRating18", ROMX
_OakRating18::
	text "Your #DEX is"
	line "amazing! You're"

	para "ready to turn"
	line "professional!"
	done

SECTION "_OakRating19", ROMX
_OakRating19::
	text "Whoa! A perfect"
	line "#DEX! I've"

	para "dreamt about this!"
	line "Congratulations!"
	done

SECTION "_OakPCText4", ROMX
_OakPCText4::
	text "The link to PROF."
	line "OAK's PC closed."
	done

; unused
SECTION "_TrainerRankingExplanationText", ROMX
_TrainerRankingExplanationText::
	text "Triple-theme"
	line "trainer ranking!"

	para "The SAVE file you"
	line "just sent might"
	cont "make the rankings!"

	para ""
	done

; unused
SECTION "_TrainerRankingNoDataText", ROMX
_TrainerRankingNoDataText::
	text "There is no"
	line "ranking data."

	para "Link to obtain"
	line "ranking data."

	para ""
	done

SECTION "_DummyGameYeahText", ROMX
_DummyGameYeahText::
	text " , yeah!"
	done

SECTION "_DummyGameDarnText", ROMX
_DummyGameDarnText::
	text "Darn…"
	done

SECTION "_StartMenuContestEndText", ROMX
_StartMenuContestEndText::
	text "Would you like to"
	line "end the Contest?"
	done

SECTION "_ItemsTossOutHowManyText", ROMX
_ItemsTossOutHowManyText::
	text "Toss out how many"
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

SECTION "_ItemsThrowAwayText", ROMX
_ItemsThrowAwayText::
	text "Throw away @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

SECTION "_ItemsDiscardedText", ROMX
_ItemsDiscardedText::
	text "Discarded"
	line "@"
	text_ram wStringBuffer1
	text "(S)."
	prompt

SECTION "_ItemsTooImportantText", ROMX
_ItemsTooImportantText::
	text "That's too impor-"
	line "tant to toss out!"
	prompt

SECTION "_ItemsOakWarningText", ROMX
_ItemsOakWarningText::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	done

SECTION "_PokemonSwapItemText", ROMX
_PokemonSwapItemText::
	text "Took @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "@"
	text_ram wStringBuffer1
	text " and"

	para "made it hold"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_PokemonHoldItemText", ROMX
_PokemonHoldItemText::
	text "Made @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "hold @"
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_PokemonRemoveMailText", ROMX
_PokemonRemoveMailText::
	text "Please remove the"
	line "MAIL first."
	prompt

SECTION "_PokemonNotHoldingText", ROMX
_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " isn't"
	line "holding anything."
	prompt

SECTION "_ItemStorageFullText", ROMX
_ItemStorageFullText::
	text "Item storage space"
	line "full."
	prompt

SECTION "_PokemonTookItemText", ROMX
_PokemonTookItemText::
	text "Took @"
	text_ram wStringBuffer1
	text_start
	line "from @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

SECTION "_PokemonAskSwapItemText", ROMX
_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "already holding"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Switch items?"
	done

SECTION "_ItemCantHeldText", ROMX
_ItemCantHeldText::
	text "This item can't be"
	line "held."
	prompt

SECTION "_MailLoseMessageText", ROMX
_MailLoseMessageText::
	text "The MAIL will lose"
	line "its message. OK?"
	done

SECTION "_MailDetachedText", ROMX
_MailDetachedText::
	text "MAIL detached from"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

SECTION "_MailNoSpaceText", ROMX
_MailNoSpaceText::
	text "There's no space"
	line "for removing MAIL."
	prompt

SECTION "_MailAskSendToPCText", ROMX
_MailAskSendToPCText::
	text "Send the removed"
	line "MAIL to your PC?"
	done

SECTION "_MailboxFullText", ROMX
_MailboxFullText::
	text "Your PC's MAILBOX"
	line "is full."
	prompt

SECTION "_MailSentToPCText", ROMX
_MailSentToPCText::
	text "The MAIL was sent"
	line "to your PC."
	prompt

SECTION "_PokemonNotEnoughHPText", ROMX
_PokemonNotEnoughHPText::
	text "Not enough HP!"
	prompt

SECTION "_MayRegisterItemText", ROMX
_MayRegisterItemText::
	text "An item in your"
	line "PACK may be"

	para "registered for use"
	line "on SELECT Button."
	done

SECTION "_OakText1", ROMX
_OakText1::
	text "Hello! Sorry to"
	line "keep you waiting!"

	para "Welcome to the"
	line "world of #MON!"

	para "My name is OAK."

	para "People call me the"
	line "#MON PROF."
	prompt

SECTION "_OakText2", ROMX
_OakText2::
	text "This world is in-"
	line "habited by crea-"
	cont "tures that we call"
	cont "#MON.@"
	text_end

SECTION "_OakText3", ROMX
_OakText3::
	text_promptbutton
	text_end

	text_end ; unused

SECTION "_OakText4", ROMX
_OakText4::
	text "People and #MON"
	line "live together by"

	para "supporting each"
	line "other."

	para "Some people play"
	line "with #MON, some"
	cont "battle with them."
	prompt

SECTION "_OakText5", ROMX
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
SECTION "_OakText6", ROMX
_OakText6::
	text "Now, what did you"
	line "say your name was?"
	prompt

SECTION "_OakText7", ROMX
_OakText7::
	text "And which"
	line "<PKMN> will"
	cont "be your partner?"
	prompt

SECTION "_IsThisYourPartnerText", ROMX
_IsThisYourPartnerText::
	text "Is this your"
	line "partner?"
	done

SECTION "_OakText8", ROMX
_OakText8::
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

SECTION "_ClockTimeMayBeWrongText", ROMX
_ClockTimeMayBeWrongText::
	text "Please set the"
	line "time."
	prompt

SECTION "_ClockSetWithControlPadText", ROMX
_ClockSetWithControlPadText::
	text "Set with the"
	line "Control Pad."

	para "Confirm: A Button"
	done

SECTION "_ClockIsThisOKText", ROMX
_ClockIsThisOKText::
	text "Is this OK?"
	done

SECTION "_ClockHasResetText", ROMX
_ClockHasResetText::
	text "The clock has been"
	line "set."
	done

SECTION "_LinkTimeoutText", ROMX
_LinkTimeoutText::
	text "Too much time has"
	line "elapsed. Please"
	cont "try again."
	prompt

SECTION "_LinkTradeCantBattleText", ROMX
_LinkTradeCantBattleText::
	text "If you trade that"
	line "#MON, you won't"
	cont "be able to battle."
	prompt

SECTION "_LinkAbnormalMonText", ROMX
_LinkAbnormalMonText::
	text "Your friend's"
	line "@"
	text_ram wStringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

SECTION "_LinkAskTradeForText", ROMX
_LinkAskTradeForText::
	text "Trade @"
	text_ram wd004
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "?"
	done

SECTION "UnknownText_0x1c422a", ROMX
UnknownText_0x1c422a::
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #MON."

	para "Is that OK?"
	done

SECTION "UnknownText_0x1c4275", ROMX
UnknownText_0x1c4275::
	text "Need more info on"
	line "mobile battles?"
	done

SECTION "UnknownText_0x1c4298", ROMX
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

SECTION "UnknownText_0x1c439c", ROMX
UnknownText_0x1c439c::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Would you like to"
	line "battle?"
	done

SECTION "UnknownText_0x1c43dc", ROMX
UnknownText_0x1c43dc::
	text "There are only @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done

SECTION "UnknownText_0x1c4419", ROMX
UnknownText_0x1c4419::
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done

SECTION "UnknownText_0x1c445a", ROMX
UnknownText_0x1c445a::
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done

SECTION "UnknownText_0x1c449c", ROMX
UnknownText_0x1c449c::
	text "Try again using"
	line "the same settings?"
	done

SECTION "_MobileBattleLessThanOneMinuteLeftText", ROMX
_MobileBattleLessThanOneMinuteLeftText::
	text "There is less than"
	line "1 min. left today!"
	done

SECTION "_MobileBattleNoTimeLeftForLinkingText", ROMX
_MobileBattleNoTimeLeftForLinkingText::
	text "No time left for"
	line "linking today."
	done

SECTION "UnknownText_0x1c4508", ROMX
UnknownText_0x1c4508::
	text "Pick three #MON"
	line "for battle."
	done

SECTION "UnknownText_0x1c4525", ROMX
UnknownText_0x1c4525::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

SECTION "_WouldYouLikeToSaveTheGameText", ROMX
_WouldYouLikeToSaveTheGameText::
	text "Would you like to"
	line "save the game?"
	done

SECTION "_SavedTheGameText", ROMX
_SavedTheGameText::
	text "<PLAYER> saved"
	line "the game."
	done

SECTION "_AnotherSaveFileText", ROMX
_AnotherSaveFileText::
	text "There is another"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

SECTION "_SaveFileCorruptedText", ROMX
_SaveFileCorruptedText::
	text "The save file is"
	line "corrupted!"
	prompt

SECTION "_ChangeBoxSaveText", ROMX
_ChangeBoxSaveText::
	text "When you change a"
	line "#MON BOX, data"
	cont "will be saved. OK?"
	done

SECTION "_MoveMonWOMailSaveText", ROMX
_MoveMonWOMailSaveText::
	text "Each time you move"
	line "a #MON, data"
	cont "will be saved. OK?"
	done

; unused
SECTION "_WindowAreaExceededErrorText", ROMX
_WindowAreaExceededErrorText::
	text "The window save"
	line "area was exceeded."
	done

SECTION "_WindowPoppingErrorText", ROMX
_WindowPoppingErrorText::
	text "No windows avail-"
	line "able for popping."
	done

; unused
SECTION "_CorruptedEventErrorText", ROMX
_CorruptedEventErrorText::
	text "Corrupted event!"
	prompt

SECTION "_ObjectEventText", ROMX
_ObjectEventText::
	text "Object event"
	done

SECTION "_BGEventText", ROMX
_BGEventText::
	text "BG event"
	done

SECTION "_CoordinatesEventText", ROMX
_CoordinatesEventText::
	text "Coordinates event"
	done

SECTION "_ReceivedItemText", ROMX
_ReceivedItemText::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

SECTION "_PutItemInPocketText", ROMX
_PutItemInPocketText::
	text "<PLAYER> put the"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "the @"
	text_ram wStringBuffer3
	text "."
	prompt

SECTION "_PocketIsFullText", ROMX
_PocketIsFullText::
	text "The @"
	text_ram wStringBuffer3
	text_start
	line "is full…"
	prompt

SECTION "_SeerSeeAllText", ROMX
_SeerSeeAllText::
	text "I see all."
	line "I know all…"

	para "Certainly, I know"
	line "of your #MON!"
	done

SECTION "_SeerCantTellAThingText", ROMX
_SeerCantTellAThingText::
	text "Whaaaat? I can't"
	line "tell a thing!"

	para "How could I not"
	line "know of this?"
	done

SECTION "_SeerNameLocationText", ROMX
_SeerNameLocationText::
	text "Hm… I see you met"
	line "@"
	text_ram wSeerNickname
	text " here:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

SECTION "_SeerTimeLevelText", ROMX
_SeerTimeLevelText::
	text "The time was"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Its level was @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Am I good or what?"
	prompt

SECTION "_SeerTradeText", ROMX
_SeerTradeText::
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

SECTION "_SeerNoLocationText", ROMX
_SeerNoLocationText::
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

SECTION "_SeerEggText", ROMX
_SeerEggText::
	text "Hey!"

	para "That's an EGG!"

	para "You can't say that"
	line "you've met it yet…"
	done

SECTION "_SeerDoNothingText", ROMX
_SeerDoNothingText::
	text "Fufufu! I saw that"
	line "you'd do nothing!"
	done

SECTION "_SeerMoreCareText", ROMX
_SeerMoreCareText::
	text "Incidentally…"

	para "It would be wise"
	line "to raise your"

	para "#MON with a"
	line "little more care."
	done

SECTION "_SeerMoreConfidentText", ROMX
_SeerMoreConfidentText::
	text "Incidentally…"

	para "It seems to have"
	line "grown a little."

	para "@"
	text_ram wSeerNickname
	text " seems"
	line "to be becoming"
	cont "more confident."
	done

SECTION "_SeerMuchStrengthText", ROMX
_SeerMuchStrengthText::
	text "Incidentally…"

	para "@"
	text_ram wSeerNickname
	text " has"
	line "grown. It's gained"
	cont "much strength."
	done

SECTION "_SeerMightyText", ROMX
_SeerMightyText::
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

SECTION "_SeerImpressedText", ROMX
_SeerImpressedText::
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

SECTION "_CongratulationsYourPokemonText", ROMX
_CongratulationsYourPokemonText::
	text "Congratulations!"
	line "Your @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

SECTION "_EvolvedIntoText", ROMX
_EvolvedIntoText::
	text_start

	para "evolved into"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

SECTION "_StoppedEvolvingText", ROMX
_StoppedEvolvingText::
	text "Huh? @"
	text_ram wStringBuffer2
	text_start
	line "stopped evolving!"
	prompt

SECTION "_EvolvingText", ROMX
_EvolvingText::
	text "What? @"
	text_ram wStringBuffer2
	text_start
	line "is evolving!"
	done

SECTION "_MartHowManyText", ROMX
_MartHowManyText::
	text "How many?"
	done

SECTION "_AlreadyHaveTMText", ROMX
_AlreadyHaveTMText::
	text "You already have"
	line "that TM."
	done

SECTION "_MartFinalPriceText", ROMX
_MartFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

SECTION "_HerbShopLadyIntroText", ROMX
_HerbShopLadyIntroText::
	text "Hello, dear."

	para "I sell inexpensive"
	line "herbal medicine."

	para "They're good, but"
	line "a trifle bitter."

	para "Your #MON may"
	line "not like them."

	para "Hehehehe…"
	done

SECTION "_HerbalLadyHowManyText", ROMX
_HerbalLadyHowManyText::
	text "How many?"
	done

SECTION "_HerbalLadyFinalPriceText", ROMX
_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

SECTION "_HerbalLadyThanksText", ROMX
_HerbalLadyThanksText::
	text "Thank you, dear."
	line "Hehehehe…"
	done

SECTION "_HerbalLadyPackFullText", ROMX
_HerbalLadyPackFullText::
	text "Oh? Your PACK is"
	line "full, dear."
	done

SECTION "_HerbalLadyNoMoneyText", ROMX
_HerbalLadyNoMoneyText::
	text "Hehehe… You don't"
	line "have the money."
	done

SECTION "_HerbalLadyComeAgainText", ROMX
_HerbalLadyComeAgainText::
	text "Come again, dear."
	line "Hehehehe…"
	done

SECTION "_BargainShopIntroText", ROMX
_BargainShopIntroText::
	text "Hiya! Care to see"
	line "some bargains?"

	para "I sell rare items"
	line "that nobody else"

	para "carries--but only"
	line "one of each item."
	done

SECTION "_BargainShopFinalPriceText", ROMX
_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " costs"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Want it?"
	done

SECTION "_BargainShopThanksText", ROMX
_BargainShopThanksText::
	text "Thanks."
	done

SECTION "_BargainShopPackFullText", ROMX
_BargainShopPackFullText::
	text "Uh-oh, your PACK"
	line "is chock-full."
	done

SECTION "_BargainShopSoldOutText", ROMX
_BargainShopSoldOutText::
	text "You bought that"
	line "already. I'm all"
	cont "sold out of it."
	done

SECTION "_BargainShopNoFundsText", ROMX
_BargainShopNoFundsText::
	text "Uh-oh, you're"
	line "short on funds."
	done

SECTION "_BargainShopComeAgainText", ROMX
_BargainShopComeAgainText::
	text "Come by again"
	line "sometime."
	done

SECTION "_PharmacyIntroText", ROMX
_PharmacyIntroText::
	text "What's up? Need"
	line "some medicine?"
	done

SECTION "_PharmacyHowManyText", ROMX
_PharmacyHowManyText::
	text "How many?"
	done

SECTION "_PharmacyFinalPriceText", ROMX
_PharmacyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will cost ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

SECTION "_PharmacyThanksText", ROMX
_PharmacyThanksText::
	text "Thanks much!"
	done

SECTION "_PharmacyPackFullText", ROMX
_PharmacyPackFullText::
	text "You don't have any"
	line "more space."
	done

SECTION "_PharmacyNoMoneyText", ROMX
_PharmacyNoMoneyText::
	text "Huh? That's not"
	line "enough money."
	done

SECTION "_PharmacyComeAgainText", ROMX
_PharmacyComeAgainText::
	text "All right."
	line "See you around."
	done

; unused
SECTION "_NothingToSellText", ROMX
_NothingToSellText::
	text "You don't have"
	line "anything to sell."
	prompt

SECTION "_MartSellHowManyText", ROMX
_MartSellHowManyText::
	text "How many?"
	done

SECTION "_MartSellPriceText", ROMX
_MartSellPriceText::
	text "I can pay you"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Is that OK?"
	done

SECTION "_MartWelcomeText", ROMX
_MartWelcomeText::
	text "Welcome! How may I"
	line "help you?"
	done

SECTION "_MartThanksText", ROMX
_MartThanksText::
	text "Here you are."
	line "Thank you!"
	done

SECTION "_MartNoMoneyText", ROMX
_MartNoMoneyText::
	text "You don't have"
	line "enough money."
	done

SECTION "_MartPackFullText", ROMX
_MartPackFullText::
	text "You can't carry"
	line "any more items."
	done

SECTION "_MartCantBuyText", ROMX
_MartCantBuyText::
	text "Sorry, I can't buy"
	line "that from you."
	prompt

SECTION "_MartComeAgainText", ROMX
_MartComeAgainText::
	text "Please come again!"
	done

SECTION "_MartAskMoreText", ROMX
_MartAskMoreText::
	text "Can I do anything"
	line "else for you?"
	done

SECTION "_MartBoughtText", ROMX
_MartBoughtText::
	text "Got ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " for"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	done

SECTION "_SlotsBetHowManyCoinsText", ROMX
_SlotsBetHowManyCoinsText::
	text "Bet how many"
	line "coins?"
	done

SECTION "_SlotsStartText", ROMX
_SlotsStartText::
	text "Start!"
	done

SECTION "_SlotsNotEnoughCoinsText", ROMX
_SlotsNotEnoughCoinsText::
	text "Not enough"
	line "coins."
	prompt

SECTION "_SlotsRanOutOfCoinsText", ROMX
_SlotsRanOutOfCoinsText::
	text "Darn… Ran out of"
	line "coins…"
	done

SECTION "_SlotsPlayAgainText", ROMX
_SlotsPlayAgainText::
	text "Play again?"
	done

SECTION "_SlotsLinedUpText", ROMX
_SlotsLinedUpText::
	text "lined up!"
	line "Won @"
	text_ram wStringBuffer2
	text " coins!"
	done

SECTION "_SlotsDarnText", ROMX
_SlotsDarnText::
	text "Darn!"
	done

SECTION "_MobileStadiumEntryText", ROMX
_MobileStadiumEntryText::
	text "Data for use in"
	line "the MOBILE STADIUM"

	para "of the N64 #MON"
	line "STADIUM 2 can be"
	cont "read here."

	para "Read the data?"
	done

SECTION "_MobileStadiumSuccessText", ROMX
_MobileStadiumSuccessText::
	text "Data transfer is"
	line "complete."

	para "We hope you enjoy"
	line "MOBILE STADIUM"

	para "battles in the N64"
	line "#MON STADIUM 2."

	para ""
	done

SECTION "_MainMenuTimeUnknownText", ROMX
_MainMenuTimeUnknownText::
	text "Clock time unknown"
	done

; unused mobile
SECTION "_DeleteSavedLoginPasswordText", ROMX
_DeleteSavedLoginPasswordText::
	text "Delete the saved"
	line "LOG-IN PASSWORD?"
	done

; unused mobile
SECTION "_DeletedTheLoginPasswordText", ROMX
_DeletedTheLoginPasswordText::
	text "Deleted the LOG-IN"
	line "PASSWORD."
	done

; unused mobile
SECTION "_MobilePickThreeMonForBattle", ROMX
_MobilePickThreeMonForBattle::
	text "Pick three #MON"
	line "for battle."
	prompt

; unused mobile
SECTION "_MobileUseTheseThreeMonText", ROMX
_MobileUseTheseThreeMonText::
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
SECTION "_MobileOnlyThreeMonMayEnterText", ROMX
_MobileOnlyThreeMonMayEnterText::
	text "Only three #MON"
	line "may enter."
	prompt

; unused mobile
SECTION "_MobileCardFolderIntro1Text", ROMX
_MobileCardFolderIntro1Text::
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
SECTION "_MobileCardFolderIntro2Text", ROMX
_MobileCardFolderIntro2Text::
	text "This is your CARD."

	para "Once you've"
	line "entered your phone"

	para "number, you can"
	line "trade CARDS with"
	cont "your friends."

	para ""
	done

; unused mobile
SECTION "_MobileCardFolderIntro3Text", ROMX
_MobileCardFolderIntro3Text::
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
SECTION "_MobileCardFolderIntro4Text", ROMX
_MobileCardFolderIntro4Text::
	text "To safely store"
	line "your collection of"

	para "CARDS, you must"
	line "set a PASSCODE for"
	cont "your CARD FOLDER."

	para ""
	done

; unused mobile
SECTION "_MobileCardFolderAskDeleteText", ROMX
_MobileCardFolderAskDeleteText::
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
SECTION "_MobileCardFolderDeleteAreYouSureText", ROMX
_MobileCardFolderDeleteAreYouSureText::
	text "Are you sure you"
	line "want to delete it?"
	done

; unused mobile
SECTION "_MobileCardFolderDeletedText", ROMX
_MobileCardFolderDeletedText::
	text "The CARD FOLDER"
	line "has been deleted."

	para ""
	done

; unused mobile
SECTION "_MobileCardFolderAskOpenOldText", ROMX
_MobileCardFolderAskOpenOldText::
	text "There is an older"
	line "CARD FOLDER from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done

; unused mobile
SECTION "_MobileCardFolderAskDeleteOldText", ROMX
_MobileCardFolderAskDeleteOldText::
	text "Delete the old"
	line "CARD FOLDER?"
	done

; unused mobile
SECTION "_MobileCardFolderFinishRegisteringCardsText", ROMX
_MobileCardFolderFinishRegisteringCardsText::
	text "Finish registering"
	line "CARDS?"
	done

SECTION "_PhoneWrongNumberText", ROMX
_PhoneWrongNumberText::
	text "Huh? Sorry, wrong"
	line "number!"
	done

SECTION "_PhoneClickText", ROMX
_PhoneClickText::
	text "Click!"
	done

SECTION "_PhoneEllipseText", ROMX
_PhoneEllipseText::
	text "<……>"
	done

SECTION "_PhoneOutOfAreaText", ROMX
_PhoneOutOfAreaText::
	text "That number is out"
	line "of the area."
	done

SECTION "_PhoneJustTalkToThemText", ROMX
_PhoneJustTalkToThemText::
	text "Just go talk to"
	line "that person!"
	done

SECTION "_PhoneThankYouText", ROMX
_PhoneThankYouText::
	text "Thank you!"
	done

; unused
SECTION "UnknownText_0x1c55d6", ROMX
UnknownText_0x1c55d6::
	text "  :"
	done

SECTION "_PasswordAskResetText", ROMX
_PasswordAskResetText::
	text "Password OK."
	line "Select CONTINUE &"
	cont "reset settings."
	prompt

SECTION "_PasswordWrongText", ROMX
_PasswordWrongText::
	text "Wrong password!"
	prompt

SECTION "_PasswordAskResetClockText", ROMX
_PasswordAskResetClockText::
	text "Reset the clock?"
	done

SECTION "_PasswordAskEnterText", ROMX
_PasswordAskEnterText::
	text "Please enter the"
	line "password."
	done

SECTION "_ClearAllSaveDataText", ROMX
_ClearAllSaveDataText::
	text "Clear all save"
	line "data?"
	done

SECTION "_LearnedMoveText", ROMX
_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " learned"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

	text_end ; unused

SECTION "_StopLearningMoveText", ROMX
_StopLearningMoveText::
	text "Stop learning"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

SECTION "_AskForgetMoveText", ROMX
_AskForgetMoveText::
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

SECTION "Text_MoveForgetCount", ROMX
Text_MoveForgetCount::
	text "1, 2 and…@"
	text_pause
	text_end

	text_end ; unused

SECTION "_MoveForgotText", ROMX
_MoveForgotText::
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

SECTION "_MoveCantForgetHMText", ROMX
_MoveCantForgetHMText::
	text "HM moves can't be"
	line "forgotten now."
	prompt

SECTION "_CardFlipPlayWithThreeCoinsText", ROMX
_CardFlipPlayWithThreeCoinsText::
	text "Play with three"
	line "coins?"
	done

SECTION "_CardFlipNotEnoughCoinsText", ROMX
_CardFlipNotEnoughCoinsText::
	text "Not enough coins…"
	prompt

SECTION "_CardFlipChooseACardText", ROMX
_CardFlipChooseACardText::
	text "Choose a card."
	done

SECTION "_CardFlipPlaceYourBetText", ROMX
_CardFlipPlaceYourBetText::
	text "Place your bet."
	done

SECTION "_CardFlipPlayAgainText", ROMX
_CardFlipPlayAgainText::
	text "Want to play"
	line "again?"
	done

SECTION "_CardFlipShuffledText", ROMX
_CardFlipShuffledText::
	text "The cards have"
	line "been shuffled."
	prompt

SECTION "_CardFlipYeahText", ROMX
_CardFlipYeahText::
	text "Yeah!"
	done

SECTION "_CardFlipDarnText", ROMX
_CardFlipDarnText::
	text "Darn…"
	done

SECTION "_GearTodayText", ROMX
_GearTodayText::
	text_today
	text_end

	text_end ; unused

SECTION "_GearEllipseText", ROMX
_GearEllipseText::
	text "<……>"
	done

SECTION "_GearOutOfServiceText", ROMX
_GearOutOfServiceText::
	text "You're out of the"
	line "service area."
	prompt

SECTION "_PokegearAskWhoCallText", ROMX
_PokegearAskWhoCallText::
	text "Whom do you want"
	line "to call?"
	done

SECTION "_PokegearPressButtonText", ROMX
_PokegearPressButtonText::
	text "Press any button"
	line "to exit."
	done

SECTION "_PokegearAskDeleteText", ROMX
_PokegearAskDeleteText::
	text "Delete this stored"
	line "phone number?"
	done

SECTION "_BuenaAskWhichPrizeText", ROMX
_BuenaAskWhichPrizeText::
	text "Which prize would"
	line "you like?"
	done

SECTION "_BuenaIsThatRightText", ROMX
_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "Is that right?"
	done

SECTION "_BuenaHereYouGoText", ROMX
_BuenaHereYouGoText::
	text "Here you go!"

	para ""
	done

SECTION "_BuenaNotEnoughPointsText", ROMX
_BuenaNotEnoughPointsText::
	text "You don't have"
	line "enough points."

	para ""
	done

SECTION "_BuenaNoRoomText", ROMX
_BuenaNoRoomText::
	text "You have no room"
	line "for it."

	para ""
	done

SECTION "_BuenaComeAgainText", ROMX
_BuenaComeAgainText::
	text "Oh. Please come"
	line "back again!"
	done

SECTION "_BTExcuseMeText", ROMX
_BTExcuseMeText::
	text "Excuse me!"

	para ""
	done

SECTION "_ExcuseMeYoureNotReadyText", ROMX
_ExcuseMeYoureNotReadyText::
	text "Excuse me."
	line "You're not ready."

	para ""
	done

SECTION "_BattleTowerReturnWhenReadyText", ROMX
_BattleTowerReturnWhenReadyText::
	text "Please return when"
	line "you're ready."
	done

SECTION "_NeedAtLeastThreeMonText", ROMX
_NeedAtLeastThreeMonText::
	text "You need at least"
	line "three #MON."

	para ""
	done

SECTION "_EggDoesNotQualifyText", ROMX
_EggDoesNotQualifyText::
	text "Sorry, an EGG"
	line "doesn't qualify."

	para ""
	done

SECTION "_OnlyThreeMonMayBeEnteredText", ROMX
_OnlyThreeMonMayBeEnteredText::
	text "Only three #MON"
	line "may be entered."

	para ""
	done

SECTION "_TheMonMustAllBeDifferentKindsText", ROMX
_TheMonMustAllBeDifferentKindsText::
	text "The @"
	text_ram wStringBuffer2
	text " #MON"
	line "must all be"
	cont "different kinds."

	para ""
	done

SECTION "_TheMonMustNotHoldTheSameItemsText", ROMX
_TheMonMustNotHoldTheSameItemsText::
	text "The @"
	text_ram wStringBuffer2
	text " #MON"
	line "must not hold the"
	cont "same items."

	para ""
	done

SECTION "_YouCantTakeAnEggText", ROMX
_YouCantTakeAnEggText::
	text "You can't take an"
	line "EGG!"

	para ""
	done

SECTION "_BallDodgedText", ROMX
_BallDodgedText::
	text "It dodged the"
	line "thrown BALL!"

	para "This #MON"
	line "can't be caught!"
	prompt

SECTION "_BallMissedText", ROMX
_BallMissedText::
	text "You missed the"
	line "#MON!"
	prompt

SECTION "_BallBrokeFreeText", ROMX
_BallBrokeFreeText::
	text "Oh no! The #MON"
	line "broke free!"
	prompt

SECTION "_BallAppearedCaughtText", ROMX
_BallAppearedCaughtText::
	text "Aww! It appeared"
	line "to be caught!"
	prompt

SECTION "_BallAlmostHadItText", ROMX
_BallAlmostHadItText::
	text "Aargh!"
	line "Almost had it!"
	prompt

SECTION "_BallSoCloseText", ROMX
_BallSoCloseText::
	text "Shoot! It was so"
	line "close too!"
	prompt

SECTION "Text_BallCaught", ROMX
Text_BallCaught::
	text "Gotcha! @"
	text_ram wEnemyMonNick
	text_start
	line "was caught!@"
	sound_caught_mon
	text_end

	text_end ; unused

SECTION "_WaitButtonText", ROMX
_WaitButtonText::
	text_promptbutton
	text_end

	text_end ; unused

SECTION "_BallSentToPCText", ROMX
_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text " was"
	line "sent to BILL's PC."
	prompt

SECTION "_NewDexDataText", ROMX
_NewDexDataText::
	text_ram wEnemyMonNick
	text "'s data"
	line "was newly added to"
	cont "the #DEX.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

	text_end ; unused

SECTION "_AskGiveNicknameText", ROMX
_AskGiveNicknameText::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_ItemStatRoseText", ROMX
_ItemStatRoseText::
	text_ram wStringBuffer1
	text "'s"
	line "@"
	text_ram wStringBuffer2
	text " rose."
	prompt

SECTION "_ItemCantUseOnMonText", ROMX
_ItemCantUseOnMonText::
	text "That can't be used"
	line "on this #MON."
	prompt

SECTION "_RepelUsedEarlierIsStillInEffectText", ROMX
_RepelUsedEarlierIsStillInEffectText::
	text "The REPEL used"
	line "earlier is still"
	cont "in effect."
	prompt

SECTION "_PlayedFluteText", ROMX
_PlayedFluteText::
	text "Played the #"
	line "FLUTE."

	para "Now, that's a"
	line "catchy tune!"
	prompt

SECTION "_FluteWakeUpText", ROMX
_FluteWakeUpText::
	text "All sleeping"
	line "#MON woke up."
	prompt

SECTION "Text_PlayedPokeFlute", ROMX
Text_PlayedPokeFlute::
	text "<PLAYER> played the"
	line "# FLUTE.@"
	text_promptbutton
	text_end

	text_end ; unused

SECTION "_BlueCardBalanceText", ROMX
_BlueCardBalanceText::
	text "You now have"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " points."
	done

SECTION "_CoinCaseCountText", ROMX
_CoinCaseCountText::
	text "Coins:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unused

SECTION "_RaiseThePPOfWhichMoveText", ROMX
_RaiseThePPOfWhichMoveText::
	text "Raise the PP of"
	line "which move?"
	done

SECTION "_RestoreThePPOfWhichMoveText", ROMX
_RestoreThePPOfWhichMoveText::
	text "Restore the PP of"
	line "which move?"
	done

SECTION "_PPIsMaxedOutText", ROMX
_PPIsMaxedOutText::
	text_ram wStringBuffer2
	text "'s PP"
	line "is maxed out."
	prompt

SECTION "_PPsIncreasedText", ROMX
_PPsIncreasedText::
	text_ram wStringBuffer2
	text "'s PP"
	line "increased."
	prompt

SECTION "_PPRestoredText", ROMX
_PPRestoredText::
	text "PP was restored."
	prompt

SECTION "_SentTrophyHomeText", ROMX
_SentTrophyHomeText::
	text "There was a trophy"
	line "inside!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " sent the"
	line "trophy home."
	prompt

SECTION "_ItemLooksBitterText", ROMX
_ItemLooksBitterText::
	text "It looks bitter…"
	prompt

SECTION "_ItemCantUseOnEggText", ROMX
_ItemCantUseOnEggText::
	text "That can't be used"
	line "on an EGG."
	prompt

SECTION "_ItemOakWarningText", ROMX
_ItemOakWarningText::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

SECTION "_ItemBelongsToSomeoneElseText", ROMX
_ItemBelongsToSomeoneElseText::
	text "That belongs to"
	line "someone else!"
	prompt

SECTION "_ItemWontHaveEffectText", ROMX
_ItemWontHaveEffectText::
	text "It won't have any"
	line "effect."
	prompt

SECTION "_BallBlockedText", ROMX
_BallBlockedText::
	text "The trainer"
	line "blocked the BALL!"
	prompt

SECTION "_BallDontBeAThiefText", ROMX
_BallDontBeAThiefText::
	text "Don't be a thief!"
	prompt

SECTION "_NoCyclingText", ROMX
_NoCyclingText::
	text "Cycling isn't"
	line "allowed here."
	prompt

SECTION "_ItemCantGetOnText", ROMX
_ItemCantGetOnText::
	text "Can't get on your"
	line "@"
	text_ram wStringBuffer1
	text " now."
	prompt

SECTION "_BallBoxFullText", ROMX
_BallBoxFullText::
	text "The #MON BOX"
	line "is full. That"
	cont "can't be used now."
	prompt

SECTION "_ItemUsedText", ROMX
_ItemUsedText::
	text "<PLAYER> used the@"
	text_low
	text_ram wStringBuffer2
	text "."
	done

SECTION "_ItemGotOnText", ROMX
_ItemGotOnText::
	text "<PLAYER> got on the@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_ItemGotOffText", ROMX
_ItemGotOffText::
	text "<PLAYER> got off@"
	text_low
	text "the @"
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_KnowsMoveText", ROMX
_KnowsMoveText::
	text_ram wStringBuffer1
	text " knows"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

SECTION "_MoveKnowsOneText", ROMX
_MoveKnowsOneText::
	text "That #MON knows"
	line "only one move."
	done

SECTION "_AskDeleteMoveText", ROMX
_AskDeleteMoveText::
	text "Oh, make it forget"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

SECTION "_DeleterForgotMoveText", ROMX
_DeleterForgotMoveText::
	text "Done! Your #MON"
	line "forgot the move."
	done

SECTION "_DeleterEggText", ROMX
_DeleterEggText::
	text "An EGG doesn't"
	line "know any moves!"
	done

SECTION "_DeleterNoComeAgainText", ROMX
_DeleterNoComeAgainText::
	text "No? Come visit me"
	line "again."
	done

SECTION "_DeleterAskWhichMoveText", ROMX
_DeleterAskWhichMoveText::
	text "Which move should"
	line "it forget, then?"
	prompt

SECTION "_DeleterIntroText", ROMX
_DeleterIntroText::
	text "Um… Oh, yes, I'm"
	line "the MOVE DELETER."

	para "I can make #MON"
	line "forget moves."

	para "Shall I make a"
	line "#MON forget?"
	done

SECTION "_DeleterAskWhichMonText", ROMX
_DeleterAskWhichMonText::
	text "Which #MON?"
	prompt

SECTION "_DSTIsThatOKText", ROMX
_DSTIsThatOKText::
	text " DST,"
	line "is that OK?"
	done

SECTION "_TimeAskOkayText", ROMX
_TimeAskOkayText::
	text ","
	line "is that OK?"
	done

SECTION "_TimesetAskDSTText", ROMX
_TimesetAskDSTText::
	text "Do you want to"
	line "switch to Daylight"
	cont "Saving Time?"
	done

SECTION "_TimesetDSTText", ROMX
_TimesetDSTText::
	text "I set the clock"
	line "forward by one"
	cont "hour."
	prompt

SECTION "_TimesetAskNotDSTText", ROMX
_TimesetAskNotDSTText::
	text "Is Daylight Saving"
	line "Time over?"
	done

SECTION "_TimesetNotDSTText", ROMX
_TimesetNotDSTText::
	text "I put the clock"
	line "back one hour."
	prompt

SECTION "_TimesetAskAdjustDSTText", ROMX
_TimesetAskAdjustDSTText::
	text "Do you want to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time?"
	done

SECTION "_MomLostGearBookletText", ROMX
_MomLostGearBookletText::
	text "I lost the in-"
	line "struction booklet"
	cont "for the #GEAR."

	para "Come back again in"
	line "a while."
	prompt
