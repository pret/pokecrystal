_FruitBearingTreeText::
	text "It's a fruit-"
	line "bearing tree."
	done

_HeyItsFruitText::
	text "Hey! It's"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "Obtained"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "But the PACK is"
	line "full…"
	done

_NothingHereText::
	text "There's nothing"
	line "here…"
	done

UnknownText_0x1bc06b::
	text "Which APRICORN"
	line "should I use?"
	done

UnknownText_0x1bc089::
	text "How many should I"
	line "make?"
	done

UnknownText_0x1bc0a2::
	text_from_ram StringBuffer1
	text ""
	line "recovered @"
	deciram wd1f3, 2, 3
	text "HP!"
	done

UnknownText_0x1bc0bb::
	text_from_ram StringBuffer1
	text "'s"
	line "cured of poison."
	done

UnknownText_0x1bc0d2::
	text_from_ram StringBuffer1
	text "'s"
	line "rid of paralysis."
	done

UnknownText_0x1bc0ea::
	text_from_ram StringBuffer1
	text "'s"
	line "burn was healed."
	done

UnknownText_0x1bc101::
	text_from_ram StringBuffer1
	text ""
	line "was defrosted."
	done

UnknownText_0x1bc115::
	text_from_ram StringBuffer1
	text ""
	line "woke up."
	done

UnknownText_0x1bc123::
	text_from_ram StringBuffer1
	text "'s"
	line "health returned."
	done

UnknownText_0x1bc13a::
	text_from_ram StringBuffer1
	text ""
	line "is revitalized."
	done

UnknownText_0x1bc14f::
	text_from_ram StringBuffer1
	text " grew to"
	line "level @"
	deciram CurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	db "@@"

UnknownText_0x1bc16e::
	text_from_ram StringBuffer1
	text " came"
	line "to its senses."
	done

UnknownText_0x1bc187::
	text "Please enter any"
	line "four-digit number."
	done

UnknownText_0x1bc1ac::
	text "Enter the same"
	line "number to confirm."
	done

UnknownText_0x1bc1cf::
	text "That's not the"
	line "same number."
	done

UnknownText_0x1bc1eb::
	text "Your PASSCODE has"
	line "been set."
	para "Enter this number"
	line "next time to open"
	cont "the CARD FOLDER."
	para ""
	done

UnknownText_0x1bc23e::
	text "0000 is invalid!"
	para ""
	done

UnknownText_0x1bc251::
	text "Enter the CARD"
	next "FOLDER PASSCODE."
	done

UnknownText_0x1bc272::
	text "Incorrect"
	line "PASSCODE!"
	para ""
	done

UnknownText_0x1bc288::
	text "CARD FOLDER open.@@"

UnknownText_0x1bc29c::
	text "<......><......><......><......><......><......>"
	line "<......><......><......><......><......><......>"

	para "Zzz… Hm? Wha…?"
	line "You woke me up!"

	para "Will you check the"
	line "clock for me?"
	prompt

UnknownText_0x1bc2eb::
	text "What time is it?"
	done

UnknownText_0x1bc2fd::
	text "What?@@"

UnknownText_0x1bc305::
	text "?"
	done

UnknownText_0x1bc308::
	text "How many minutes?"
	done

UnknownText_0x1bc31b::
	text "Whoa!@@"

UnknownText_0x1bc323::
	text "?"
	done

UnknownText_0x1bc326::
	text "!"
	line "I overslept!"
	done

UnknownText_0x1bc336::
	text "!"
	line "Yikes! I over-"
	cont "slept!"
	done

UnknownText_0x1bc34f::
	text "!"
	line "No wonder it's so"
	cont "dark!"
	done

UnknownText_0x1bc369::
	text "What day is it?"
	done

UnknownText_0x1bc37a::
	text ", is it?"
	done

UnknownText_0x1bc384::
	text "There is nothing"
	line "connected."
	done

UnknownText_0x1bc3a1::
	text "Check cell phone"
	line "adapter."
	done

UnknownText_0x1bc3bc::
	text "Check CDMA"
	line "adapter."
	done

UnknownText_0x1bc3d1::
	text "Check DOCOMO PHS"
	line "adapter."
	done

UnknownText_0x1bc3ec::
	text "Check DDI PHS"
	line "adapter."
	done

UnknownText_0x1bc404::
	text "Check unlimited"
	line "battle mobile"
	cont "adapter."
	done

UnknownText_0x1bc42c::
	text "The password is:"
	line ""
	done

UnknownText_0x1bc43f::
	text "Is this OK?"
	done

UnknownText_0x1bc44c::
	text "Enter the"
	line "ID no."
	done

UnknownText_0x1bc45e::
	text "Enter the"
	line "amount."
	done

UnknownText_0x1bc471::
	text "There's nothing to"
	line "choose."
	prompt

UnknownText_0x1bc48c::
	text "Which side do you"
	line "want to put it on?"
	done

UnknownText_0x1bc4b2::
	text "Which side do you"
	line "want to put away?"
	done

UnknownText_0x1bc4d7::
	text "Put away the"
	line "@"
	text_from_ram StringBuffer3
	text "."
	prompt

UnknownText_0x1bc4ec::
	text "There's nothing to"
	line "put away."
	prompt

UnknownText_0x1bc509::
	text "Set up the"
	line "@"
	text_from_ram StringBuffer3
	text "."
	prompt

UnknownText_0x1bc51c::
	text "Put away the"
	line "@"
	text_from_ram StringBuffer3
	text ""

	para "and set up the"
	line "@"
	text_from_ram StringBuffer4
	text "."
	prompt

UnknownText_0x1bc546::
	text "That's already set"
	line "up."
	prompt

UnknownText_0x1bc55d::
	text "It's the TOWN MAP."
	done

UnknownText_0x1bc570::
	text "It's a poster of a"
	line "cute PIKACHU."
	done

UnknownText_0x1bc591::
	text "It's a poster of a"
	line "cute CLEFAIRY."
	done

UnknownText_0x1bc5b3::
	text "It's a poster of a"
	line "cute JIGGLYPUFF."
	done

UnknownText_0x1bc5d7::
	text "It's an adorable"
	line "@"
	text_from_ram StringBuffer3
	text "."
	done

UnknownText_0x1bc5ef::
	text "A giant doll! It's"
	line "fluffy and cuddly."
	done

UnknownText_0x1bc615::
	text "Hi, <PLAYER>!"
	line "How are you?"
	prompt

UnknownText_0x1bc62a::
	text "I found a useful"
	line "item shopping, so"
	prompt

UnknownText_0x1bc64e::
	text "I bought it with"
	line "your money. Sorry!"
	prompt

UnknownText_0x1bc673::
	text "It's in your PC."
	line "You'll like it!"
	done

UnknownText_0x1bc693::
	text "While shopping"
	line "today, I saw this"
	cont "adorable doll, so"
	prompt

UnknownText_0x1bc6c7::
	text "It's in your room."
	line "You'll love it!"
	done

UnknownText_0x1bc6e9::
	text_from_ram wPlayerTrademonSpeciesName
	text " was"
	line "sent to @"
	text_from_ram wOTTrademonSenderName
	text "."
	done

UnknownText_0x1bc701::
	text ""
	done

UnknownText_0x1bc703::
	text_from_ram wOTTrademonSenderName
	text " bids"
	line "farewell to"
	done

UnknownText_0x1bc719::
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc71f::
	text "Take good care of"
	line "@"
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc739::
	text "For @"
	text_from_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_from_ram wPlayerTrademonSpeciesName
	text ","
	done

UnknownText_0x1bc74c::
	text_from_ram wOTTrademonSenderName
	text " sends"
	line "@"
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc75e::
	text_from_ram wOTTrademonSenderName
	text " will"
	line "trade @"
	text_from_ram wOTTrademonSpeciesName
	db "@@"

UnknownText_0x1bc774::
	text "for @"
	text_from_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_from_ram wPlayerTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc787::
	text_from_ram wPlayerTrademonSenderName
	text " will"
	line "trade @"
	text_from_ram wPlayerTrademonSpeciesName
	db "@@"

UnknownText_0x1bc79d::
	text "for @"
	text_from_ram wOTTrademonSenderName
	text "'s"
	line "@"
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc7b0::
	text_from_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_from_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

UnknownText_0x1bc7c3::
	text "Take good care of"
	line "@"
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc7dd::
	text_from_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_from_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

UnknownText_0x1bc7f0::
	text "Take good care of"
	line "@"
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc80a::
	text_from_ram wOTTrademonSpeciesName
	text " came"
	line "back!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text ""
	line "MARY: PROF.OAK'S"
	done

_OPT_IntroText2::
	text ""
	line "#MON TALK!"
	done

_OPT_IntroText3::
	text ""
	line "With me, MARY!"
	done

_OPT_OakText1::
	text ""
	line "OAK: @"
	text_from_ram wMonOrItemNameBuffer
	db "@@"

_OPT_OakText2::
	text ""
	line "may be seen around"
	done

_OPT_OakText3::
	text ""
	line "@"
	text_from_ram StringBuffer1
	text "."
	done

_OPT_MaryText1::
	text ""
	line "MARY: @"
	text_from_ram StringBuffer1
	text "'s"
	done

OPT_SweetAdorably::
	text ""
	line "sweet and adorably"
	done

OPT_WigglySlickly::
	text ""
	line "wiggly and slickly"
	done

OPT_AptlyNamed::
	text ""
	line "aptly named and"
	done

OPT_UndeniablyKindOf::
	text ""
	line "undeniably kind of"
	done

OPT_Unbearably::
	text ""
	line "so, so unbearably"
	done

OPT_WowImpressively::
	text ""
	line "wow, impressively"
	done

OPT_AlmostPoisonously::
	text ""
	line "almost poisonously"
	done

OPT_Sensually::
	text ""
	line "ooh, so sensually"
	done

OPT_Mischievously::
	text ""
	line "so mischievously"
	done

OPT_Topically::
	text ""
	line "so very topically"
	done

OPT_Addictively::
	text ""
	line "sure addictively"
	done

OPT_LooksInWater::
	text ""
	line "looks in water is"
	done

OPT_EvolutionMustBe::
	text ""
	line "evolution must be"
	done

OPT_Provocatively::
	text ""
	line "provocatively"
	done

OPT_FlippedOut::
	text ""
	line "so flipped out and"
	done

OPT_HeartMeltingly::
	text ""
	line "heart-meltingly"
	done

OPT_Cute::
	text ""
	line "cute."
	done

OPT_Weird::
	text ""
	line "weird."
	done

OPT_Pleasant::
	text ""
	line "pleasant."
	done

OPT_BoldSortOf::
	text ""
	line "bold, sort of."
	done

OPT_Frightening::
	text ""
	line "frightening."
	done

OPT_SuaveDebonair::
	text ""
	line "suave & debonair!"
	done

OPT_Powerful::
	text ""
	line "powerful."
	done

OPT_Exciting::
	text ""
	line "exciting."
	done

OPT_Groovy::
	text ""
	line "groovy!"
	done

OPT_Inspiring::
	text ""
	line "inspiring."
	done

OPT_Friendly::
	text ""
	line "friendly."
	done

OPT_HotHotHot::
	text ""
	line "hot, hot, hot!"
	done

OPT_Stimulating::
	text ""
	line "stimulating."
	done

OPT_Guarded::
	text ""
	line "guarded."
	done

OPT_Lovely::
	text ""
	line "lovely."
	done

OPT_Speedy::
	text ""
	line "speedy."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text ""
	line "@"
	text_from_ram StringBuffer1
	db "@@"

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text ""
	line "BEN: #MON MUSIC"
	done

_BenIntroText2::
	text ""
	line "CHANNEL!"
	done

_BenIntroText3::
	text ""
	line "It's me, DJ BEN!"
	done

_FernIntroText1::
	text ""
	line "FERN: #MUSIC!"
	done

_FernIntroText2::
	text ""
	line "With DJ FERN!"
	done

_BenFernText1::
	text ""
	line "Today's @"
	current_day
	text ","
	done

_BenFernText2A::
	text ""
	line "so let us jam to"
	done

_BenFernText2B::
	text ""
	line "so chill out to"
	done

_BenFernText3A::
	text ""
	line "#MON March!"
	done

_BenFernText3B::
	text ""
	line "#MON Lullaby!"
	done

; Lucky Channel

_LC_Text1::
	text ""
	line "REED: Yeehaw! How"
	done

_LC_Text2::
	text ""
	line "y'all doin' now?"
	done

_LC_Text3::
	text ""
	line "Whether you're up"
	done

_LC_Text4::
	text ""
	line "or way down low,"
	done

_LC_Text5::
	text ""
	line "don't you miss the"
	done

_LC_Text6::
	text ""
	line "LUCKY NUMBER SHOW!"
	done

_LC_Text7::
	text ""
	line "This week's Lucky"
	done

_LC_Text8::
	text ""
	line "Number is @"
	interpret_data
	text_from_ram StringBuffer1
	text "!"
	done

_LC_Text9::
	text ""
	line "I'll repeat that!"
	done

_LC_Text10::
	text ""
	line "Match it and go to"
	done

_LC_Text11::
	text ""
	line "the RADIO TOWER!"
	done

_LC_DragText1::
	text ""
	line "…Repeating myself"
	done

_LC_DragText2::
	text ""
	line "gets to be a drag…"
	done

; Places and People

_PnP_Text1::
	text ""
	line "PLACES AND PEOPLE!"
	done

_PnP_Text2::
	text ""
	line "Brought to you by"
	done

_PnP_Text3::
	text ""
	line "me, DJ LILY!"
	done

_PnP_Text4::
	text ""
	line "@"
	text_from_ram StringBuffer2
	text " @"
	text_from_ram StringBuffer1
	db "@@"

_PnP_cute::
	text ""
	line "is cute."
	done

_PnP_lazy::
	text ""
	line "is sort of lazy."
	done

_PnP_happy::
	text ""
	line "is always happy."
	done

_PnP_noisy::
	text ""
	line "is quite noisy."
	done

_PnP_precocious::
	text ""
	line "is precocious."
	done

_PnP_bold::
	text ""
	line "is somewhat bold."
	done

_PnP_picky::
	text ""
	line "is too picky!"
	done

_PnP_sortofok::
	text ""
	line "is sort of OK."
	done

_PnP_soso::
	text ""
	line "is just so-so."
	done

_PnP_great::
	text ""
	line "is actually great."
	done

_PnP_mytype::
	text ""
	line "is just my type."
	done

_PnP_cool::
	text ""
	line "is so cool, no?"
	done

_PnP_inspiring::
	text ""
	line "is inspiring!"
	done

_PnP_weird::
	text ""
	line "is kind of weird."
	done

_PnP_rightforme::
	text ""
	line "is right for me?"
	done

_PnP_odd::
	text ""
	line "is definitely odd!"
	done

_PnP_Text5::
	text ""
	line "@"
	text_from_ram StringBuffer1
	db "@@"

_RocketRadioText1::
	text ""
	line "… …Ahem, we are"
	done

_RocketRadioText2::
	text ""
	line "TEAM ROCKET!"
	done

_RocketRadioText3::
	text ""
	line "After three years"
	done

_RocketRadioText4::
	text ""
	line "of preparation, we"
	done

_RocketRadioText5::
	text ""
	line "have risen again"
	done

_RocketRadioText6::
	text ""
	line "from the ashes!"
	done

_RocketRadioText7::
	text ""
	line "GIOVANNI! @"
	interpret_data
	text "Can you"
	done

_RocketRadioText8::
	text ""
	line "hear?@"
	interpret_data
	text " We did it!"
	done

_RocketRadioText9::
	text ""
	line "@"
	interpret_data
	text "Where is our boss?"
	done

_RocketRadioText10::
	text ""
	line "@"
	interpret_data
	text "Is he listening?"
	done

_BuenaRadioText1::
	text ""
	line "BUENA: BUENA here!"
	done

_BuenaRadioText2::
	text ""
	line "Today's password!"
	done

_BuenaRadioText3::
	text ""
	line "Let me think… It's"
	done

_BuenaRadioText4::
	text ""
	line "@"
	text_from_ram StringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text ""
	line "Don't forget it!"
	done

_BuenaRadioText6::
	text ""
	line "I'm in GOLDENROD's"
	done

_BuenaRadioText7::
	text ""
	line "RADIO TOWER!"
	done

_BuenaRadioMidnightText1::
	text ""
	line "BUENA: Oh my…"
	done

_BuenaRadioMidnightText2::
	text ""
	line "It's midnight! I"
	done

_BuenaRadioMidnightText3::
	text ""
	line "have to shut down!"
	done

_BuenaRadioMidnightText4::
	text ""
	line "Thanks for tuning"
	done

_BuenaRadioMidnightText5::
	text ""
	line "in to the end! But"
	done

_BuenaRadioMidnightText6::
	text ""
	line "don't stay up too"
	done

_BuenaRadioMidnightText7::
	text ""
	line "late! Presented to"
	done

_BuenaRadioMidnightText8::
	text ""
	line "you by DJ BUENA!"
	done

_BuenaRadioMidnightText9::
	text "I'm outta here!"
	done

_BuenaRadioMidnightText10::
	text "…"
	done

_BuenaOffTheAirText::
	text ""
	line ""
	done

Text_EnemyWithdrew::
	text "<ENEMY>"
	line "withdrew"
	cont "@"
	text_from_ram EnemyMonNick
	text "!"
	prompt

Text_EnemyUsedOn::
	text "<ENEMY>"
	line "used @"
	text_from_ram wMonOrItemNameBuffer
	text ""
	cont "on @"
	text_from_ram EnemyMonNick
	text "!"
	prompt

Text_ThatCantBeUsedRightNow::
	text "That can't be used"
	line "right now."
	prompt

Text_ThatItemCantBePutInThePack::
	text "That item can't be"
	line "put in the PACK."
	done

Text_TheItemWasPutInThePack::
	text "The @"
	text_from_ram StringBuffer1
	text ""
	line "was put in the"
	cont "PACK."
	done

Text_RemainingTime::
	text "Remaining Time"
	done

Text_YourPkmnsHPWasHealed::
	text "Your #MON's HP"
	line "was healed."
	prompt

Text_Warping::
	text "Warping…"
	done

UnknownText_0x1bd05e::
	text "Which number"
	line "should be changed?"
	done

UnknownText_0x1bd07f::
	text "Will you play with"
	line "@"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1bd09a::
	text "You need two #-"
	line "MON for breeding."
	prompt

Text_BreedingIsNotPossible::
	text "Breeding is not"
	line "possible."
	prompt

UnknownText_0x1bd0d8::
	text "The compatibility"
	line "is @"
	deciram wd265, 1, 3
	text "."
	cont "Should they breed?"
	done

UnknownText_0x1bd109::
	text "There is no EGG."
	line ""
	prompt

UnknownText_0x1bd11c::
	text "It's going to"
	line "hatch!"
	prompt

UnknownText_0x1bd131::
	text "Test event"
	line "@"
	deciram StringBuffer2, 1, 2
	text "?"
	done

UnknownText_0x1bd145::
	text "Start!"
	done

UnknownText_0x1bd14d::
	text "End!"
	done

UnknownText_0x1bd153::
	text "For a boy!"
	done

UnknownText_0x1bd15f::
	text "For a girl!"
	done

UnknownText_0x1bd16c::
	text "This doesn't"
	line "concern a boy!"
	done

UnknownText_0x1bd188::
	text "The BOX is full!"
	done

UnknownText_0x1bd19a::
	text "A new CARD arrived"
	line "from @"
	text_from_ram StringBuffer2
	text "."
	done

UnknownText_0x1bd1ba::
	text "Put this CARD in"
	line "the CARD FOLDER?"
	done

UnknownText_0x1bd1dd::
	text_from_ram StringBuffer2
	text "'s CARD was"
	line "listed as no.@"
	deciram StringBuffer1, 1, 2
	text "."
	prompt

UnknownText_0x1bd201::
	text "Starting link."
	done

UnknownText_0x1bd211::
	text "Link terminated."
	done

UnknownText_0x1bd223::
	text "Closing link."
	done

UnknownText_0x1bd232::
	text "Clear the time"
	line "limit?"
	done

UnknownText_0x1bd249::
	text "The time limit was"
	line "cleared."
	done

UnknownText_0x1bd266::
	text "Pick which packet"
	line "as an error?"
	done

UnknownText_0x1bd286::
	text "Trading @"
	text_from_ram StringBuffer2
	text ""
	line "for @"
	text_from_ram StringBuffer1
	text "…"
	done

UnknownText_0x1bd2a0::
	text "Obtained the"
	line "VOLTORBBADGE!"
	done

UnknownText_0x1bd2bc::
	text "Which floor?"
	done

UnknownText_0x1bd2ca::
	text "ANNOUNCER: BEEEP!"

	para "Time's up!"
	done

UnknownText_0x1bd2e7::
	text "ANNOUNCER: The"
	line "Contest is over!"
	done

UnknownText_0x1bd308::
	text "REPEL's effect"
	line "wore off."
	done

UnknownText_0x1bd321::
	text "<PLAYER> found"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

UnknownText_0x1bd331::
	text "But <PLAYER> has"
	line "no space left…"
	done

UnknownText_0x1bd34b::
	text "I just saw some"
	line "rare @"
	text_from_ram StringBuffer1
	text " in"
	cont "@"
	text_from_ram StringBuffer2
	text "."

	para "I'll call you if I"
	line "see another rare"
	cont "#MON, OK?"
	prompt

UnknownText_0x1bd39e::
	text "SAVING RECORD…"
	line "DON'T TURN OFF!"
	done

UnknownText_0x1bd3be::
	text_from_ram PlayerName
	text " received"
	line "@"
	text_from_ram StringBuffer1
	text "!@"
	sound_item
	text_waitbutton
	db "@@"

UnknownText_0x1bd3d7::
	text "You have no coins."
	prompt

UnknownText_0x1bd3eb::
	text "You don't have a"
	line "COIN CASE."
	prompt

UnknownText_0x1bd407::
	text "OK, connect the"
	line "Game Link Cable."
	prompt

UnknownText_0x1bd429::
	text "<PLAYER> traded"
	line "@"
	text_from_ram wMonOrItemNameBuffer
	text " for"
	cont "@"
	text_from_ram StringBuffer2
	text ".@@"

UnknownText_0x1bd445::
	sound_dex_fanfare_80_109
	interpret_data
	db "@@"

UnknownText_0x1bd449::
	text "I collect #MON."
	line "Do you have"
	cont "@"
	text_from_ram StringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1bd48c::
	text "You don't want to"
	line "trade? Aww…"
	done

UnknownText_0x1bd4aa::
	text "Huh? That's not"
	line "@"
	text_from_ram StringBuffer1
	text ". "
	cont "What a letdown…"
	done

UnknownText_0x1bd4d2::
	text "Yay! I got myself"
	line "@"
	text_from_ram StringBuffer1
	text "!"
	cont "Thanks!"
	done

UnknownText_0x1bd4f4::
	text "Hi, how's my old"
	line "@"
	text_from_ram StringBuffer2
	text " doing?"
	done

UnknownText_0x1bd512::
	text "Hi, I'm looking"
	line "for this #MON."

	para "If you have"
	line "@"
	text_from_ram StringBuffer1
	text ", would"

	para "you trade it for"
	line "my @"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1bd565::
	text "You don't have"
	line "one either?"

	para "Gee, that's really"
	line "disappointing…"
	done

UnknownText_0x1bd5a1::
	text "You don't have"
	line "@"
	text_from_ram StringBuffer1
	text "? That's"
	cont "too bad, then."
	done

UnknownText_0x1bd5cc::
	text "Great! Thank you!"

	para "I finally got"
	line "@"
	text_from_ram StringBuffer1
	text "."
	done

UnknownText_0x1bd5f4::
	text "Hi! The @"
	text_from_ram wMonOrItemNameBuffer
	text ""
	line "you traded me is"
	cont "doing great!"
	done

UnknownText_0x1bd621::
	text_from_ram wMonOrItemNameBuffer
	text "'s cute,"
	line "but I don't have"

	para "it. Do you have"
	line "@"
	text_from_ram StringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1bd673::
	text "You don't want to"
	line "trade? Oh, darn…"
	done

UnknownText_0x1bd696::
	text "That's not"
	line "@"
	text_from_ram StringBuffer1
	text "."

	para "Please trade with"
	line "me if you get one."
	done

UnknownText_0x1bd6cd::
	text "Wow! Thank you!"
	line "I always wanted"
	cont "@"
	text_from_ram wMonOrItemNameBuffer
	text "!"
	done

UnknownText_0x1bd6f5::
	text "How is that"
	line "@"
	text_from_ram StringBuffer2
	text " I"
	cont "traded you doing?"

	para "Your @"
	text_from_ram wMonOrItemNameBuffer
	text "'s"
	line "so cute!"
	done

UnknownText_0x1bd731::
	text "Uh? What happened?"
	done

UnknownText_0x1bd745::
	text "Trading is so odd…"

	para "I still have a lot"
	line "to learn about it."
	done

UnknownText_0x1bd77f::
	text "Wow, that's a cute"
	line "#MON."

	para "Where did you get"
	line "it?"

	para "…"

	para "So, you're leaving"
	line "on an adventure…"

	para "OK!"
	line "I'll help too."

	para "But what can I do"
	line "for you?"

	para "I know! I'll save"
	line "money for you."

	para "On a long journey,"
	line "money's important."

	para "Do you want me to"
	line "save your money?"
	done

UnknownText_0x1bd868::
	text "OK, I'll take care"
	line "of your money."

	para "<......><......><......>"
	prompt

UnknownText_0x1bd88e::
	text "Be careful."

	para "#MON are your"
	line "friends. You need"
	cont "to work as a team."

	para "Now, go on!"
	done

UnknownText_0x1bd8da::
	text "Hi! Welcome home!"
	line "You're trying very"
	cont "hard, I see."

	para "I've kept your"
	line "room tidy."

	para "Or is this about"
	line "your money?"
	done

UnknownText_0x1bd942::
	text "What do you want"
	line "to do?"
	done

UnknownText_0x1bd95b::
	text "How much do you"
	line "want to save?"
	done

UnknownText_0x1bd97a::
	text "How much do you"
	line "want to take?"
	done

UnknownText_0x1bd999::
	text "Do you want to"
	line "save some money?"
	done

UnknownText_0x1bd9ba::
	text "You haven't saved"
	line "that much."
	prompt

UnknownText_0x1bd9d7::
	text "You can't take"
	line "that much."
	prompt

UnknownText_0x1bd9f1::
	text "You don't have"
	line "that much."
	prompt

UnknownText_0x1bda0b::
	text "You can't save"
	line "that much."
	prompt

UnknownText_0x1bda25::
	text "OK, I'll save your"
	line "money. Trust me!"

	para "<PLAYER>, stick"
	line "with it!"
	done

UnknownText_0x1bda5b::
	text "Your money's safe"
	line "here! Get going!"
	done

UnknownText_0x1bda7e::
	text "<PLAYER>, don't"
	line "give up!"
	done

UnknownText_0x1bda90::
	text "Just do what"
	line "you can."
	done

UnknownText_0x1bdaa7::
	text ""
	done

UnknownText_0x1bdaa9::
	text "I'm the DAY-CARE"
	line "MAN. Want me to"
	cont "raise a #MON?"
	done

UnknownText_0x1bdad8::
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

UnknownText_0x1bdb85::
	text "I'm the DAY-CARE"
	line "LADY."

	para "Should I raise a"
	line "#MON for you?"
	done

UnknownText_0x1bdbbb::
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

UnknownText_0x1bdc79::
	text "What should I"
	line "raise for you?"
	prompt

UnknownText_0x1bdc97::
	text "Oh? But you have"
	line "just one #MON."
	prompt

UnknownText_0x1bdcb8::
	text "Sorry, but I can't"
	line "accept an EGG."
	prompt

UnknownText_0x1bdcda::
	text "Remove MAIL before"
	line "you come see me."
	prompt

UnknownText_0x1bdcff::
	text "If you give me"
	line "that, what will"
	cont "you battle with?"
	prompt

UnknownText_0x1bdd30::
	text "OK. I'll raise"
	line "your @"
	text_from_ram StringBuffer1
	text "."
	prompt

UnknownText_0x1bdd4b::
	text "Come back for it"
	line "later."
	done

UnknownText_0x1bdd64::
	text "Are we geniuses or"
	line "what? Want to see"
	cont "your @"
	text_from_ram StringBuffer1
	text "?"
	done

UnknownText_0x1bdd96::
	text "Your @"
	text_from_ram StringBuffer1
	text ""
	line "has grown a lot."

	para "By level, it's"
	line "grown by @"
	deciram StringBuffer2 + 1, 1, 3
	text "."

	para "If you want your"
	line "#MON back, it"
	cont "will cost ¥@"
	deciram StringBuffer2 + 2, 3, 4
	text "."
	done

UnknownText_0x1bde04::
	text "Perfect! Here's"
	line "your #MON."
	prompt

UnknownText_0x1bde1f::
	text "<PLAYER> got back"
	line "@"
	text_from_ram StringBuffer1
	text "."
	prompt

UnknownText_0x1bde32::
	text "Huh? Back already?"
	line "Your @"
	text_from_ram StringBuffer1
	text ""
	para "needs a little"
	line "more time with us."

	para "If you want your"
	line "#MON back, it"
	cont "will cost ¥100."
	done

UnknownText_0x1bdea2::
	text "You have no room"
	line "for it."
	prompt

UnknownText_0x1bdebc::
	text "You don't have"
	line "enough money."
	prompt

UnknownText_0x1bded9::
	text "Oh, fine then."
	prompt

UnknownText_0x1bdee9::
	text "Come again."
	done

UnknownText_0x1bdef6::
	text "Not yet…"
	done

UnknownText_0x1bdf00::
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

UnknownText_0x1bdfa5::
	text "<PLAYER> received"
	line "the EGG!"
	done

UnknownText_0x1bdfba::
	text "Take good care of"
	line "it."
	done

UnknownText_0x1bdfd1::
	text "Well then, I'll"
	line "keep it. Thanks!"
	done

UnknownText_0x1bdff2::
	text "You have no room"
	line "in your party."
	cont "Come back later."
	done

UnknownText_0x1be024::
	text "Which #MON"
	line "should I photo-"
	cont "graph?"
	prompt

UnknownText_0x1be047::
	text "All righty. Hold"
	line "still for a bit."
	prompt

UnknownText_0x1be06a::
	text "Presto! All done."
	line "Come again, OK?"
	done
