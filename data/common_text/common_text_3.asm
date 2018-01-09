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

UnknownText_0x1c40e6::
	text "The clock's time"
	line "may be wrong."

	para "Please reset the"
	line "time."
	prompt

UnknownText_0x1c411c::
	text "Set with the"
	line "Control Pad."

	para "Confirm: A Button"
	line "Cancel:  B Button"
	done

UnknownText_0x1c415b::
	text "Is this OK?"
	done

UnknownText_0x1c4168::
	text "The clock has been"
	line "reset."
	done

UnknownText_0x1c4183::
	text "Too much time has"
	line "elapsed. Please"
	cont "try again."
	prompt

UnknownText_0x1c41b1::
	text "If you trade that"
	line "#MON, you won't"
	cont "be able to battle."
	prompt

UnknownText_0x1c41e6::
	text "Your friend's"
	line "@"
	text_from_ram StringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

UnknownText_0x1c4212::
	text "Trade @"
	text_from_ram wd004
	text ""
	line "for @"
	text_from_ram StringBuffer1
	text "?"
	done

UnknownText_0x1c422a::
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #MON."

	para "Is that OK?"
	done

UnknownText_0x1c4275::
	text "Need more info on"
	line "mobile battles?"
	done

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

UnknownText_0x1c439c::
	text "Today's remaining"
	line "time is @"
	deciram StringBuffer2, 1, 2
	text " min."

	para "Would you like to"
	line "battle?"
	done

UnknownText_0x1c43dc::
	text "There are only @"
	deciram StringBuffer2, 1, 2
	text ""
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done

UnknownText_0x1c4419::
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done

UnknownText_0x1c445a::
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done

UnknownText_0x1c449c::
	text "Try again using"
	line "the same settings?"
	done

UnknownText_0x1c44c0::
	text "There is less than"
	line "1 min. left today!"
	done

UnknownText_0x1c44e7::
	text "No time left for"
	line "linking today."
	done

UnknownText_0x1c4508::
	text "Pick three #MON"
	line "for battle."
	done

UnknownText_0x1c4525::
	text "Today's remaining"
	line "time is @"
	deciram StringBuffer2, 1, 2
	text " min."
	done

UnknownText_0x1c454b::
	text "Would you like to"
	line "save the game?"
	done

UnknownText_0x1c456d::
	text "SAVING… DON'T TURN"
	line "OFF THE POWER."
	done

UnknownText_0x1c4590::
	text "<PLAYER> saved"
	line "the game."
	done

UnknownText_0x1c45a3::
	text "There is already a"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

UnknownText_0x1c45d9::
	text "There is another"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

UnknownText_0x1c460d::
	text "The save file is"
	line "corrupted!"
	prompt

UnknownText_0x1c462a::
	text "When you change a"
	line "#MON BOX, data"
	cont "will be saved. OK?"
	done

UnknownText_0x1c465f::
	text "Each time you move"
	line "a #MON, data"
	cont "will be saved. OK?"
	done

UnknownText_0x1c4693::
	text "The window save"
	line "area was exceeded."
	done

UnknownText_0x1c46b7::
	text "No windows avail-"
	line "able for popping."
	done

UnknownText_0x1c46dc::
	text "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object event"
	done

UnknownText_0x1c46fc::
	text "BG event"
	done

UnknownText_0x1c4706::
	text "Coordinates event"
	done

UnknownText_0x1c4719::
	text "<PLAYER> received"
	line "@"
	text_from_ram StringBuffer4
	text "."
	done

UnknownText_0x1c472c::
	text "<PLAYER> put the"
	line "@"
	text_from_ram StringBuffer1
	text " in"
	cont "the @"
	text_from_ram StringBuffer3
	text "."
	prompt

UnknownText_0x1c474b::
	text "The @"
	text_from_ram StringBuffer3
	text ""
	line "is full…"
	prompt

UnknownText_0x1c475f::
	text "I see all."
	line "I know all…"

	para "Certainly, I know"
	line "of your #MON!"
	done

UnknownText_0x1c4797::
	text "Whaaaat? I can't"
	line "tell a thing!"

	para "How could I not"
	line "know of this?"
	done

UnknownText_0x1c47d4::
	text "Hm… I see you met"
	line "@"
	text_from_ram wSeerNickname
	text " here:"
	cont "@"
	text_from_ram wSeerCaughtLocation
	text "!"
	prompt

UnknownText_0x1c47fa::
	text "The time was"
	line "@"
	text_from_ram wSeerTimeOfDay
	text "!"

	para "Its level was @"
	text_from_ram wSeerCaughtLevelString
	text "!"

	para "Am I good or what?"
	prompt

UnknownText_0x1c4837::
	text "Hm… @"
	text_from_ram wSeerNickname
	text ""
	line "came from @"
	text_from_ram wSeerOTName
	text ""
	cont "in a trade?"

	para "@"
	text_from_ram wSeerCaughtLocation
	text ""
	line "was where @"
	text_from_ram wSeerOTName
	text ""
	cont "met @"
	text_from_ram wSeerNickname
	text "!"
	prompt

UnknownText_0x1c487f::
	text "What!? Incredible!"

	para "I don't understand"
	line "how, but it is"

	para "incredible!"
	line "You are special."

	para "I can't tell where"
	line "you met it, but it"
	cont "was at level @"
	text_from_ram wSeerCaughtLevelString
	text "."

	para "Am I good or what?"
	prompt

UnknownText_0x1c491d::
	text "Hey!"

	para "That's an EGG!"

	para "You can't say that"
	line "you've met it yet…"
	done

UnknownText_0x1c4955::
	text "Fufufu! I saw that"
	line "you'd do nothing!"
	done

UnknownText_0x1c497a::
	text "Incidentally…"

	para "It would be wise"
	line "to raise your"

	para "#MON with a"
	line "little more care."
	done

UnknownText_0x1c49c6::
	text "Incidentally…"

	para "It seems to have"
	line "grown a little."

	para "@"
	text_from_ram wSeerNickname
	text " seems"
	line "to be becoming"
	cont "more confident."
	done

UnknownText_0x1c4a21::
	text "Incidentally…"

	para "@"
	text_from_ram wSeerNickname
	text " has"
	line "grown. It's gained"
	cont "much strength."
	done

UnknownText_0x1c4a5b::
	text "Incidentally…"

	para "It certainly has"
	line "grown mighty!"

	para "This @"
	text_from_ram wSeerNickname
	text ""
	line "must have come"

	para "through numerous"
	line "#MON battles."

	para "It looks brimming"
	line "with confidence."
	done

UnknownText_0x1c4ae5::
	text "Incidentally…"

	para "I'm impressed by"
	line "your dedication."

	para "It's been a long"
	line "time since I've"

	para "seen a #MON as"
	line "mighty as this"
	cont "@"
	text_from_ram wSeerNickname
	text "."

	para "I'm sure that"
	line "seeing @"
	text_from_ram wSeerNickname
	text ""
	para "in battle would"
	line "excite anyone."
	done

UnknownText_0x1c4b92::
	text "Congratulations!"
	line "Your @"
	text_from_ram StringBuffer2
	db "@@"

UnknownText_0x1c4baf::
	text ""
	para "evolved into"
	line "@"
	text_from_ram StringBuffer1
	text "!"
	done

UnknownText_0x1c4bc5::
	text "Huh? @"
	text_from_ram StringBuffer2
	text ""
	line "stopped evolving!"
	prompt

UnknownText_0x1c4be3::
	text "What? @"
	text_from_ram StringBuffer2
	text ""
	line "is evolving!"
	done

UnknownText_0x1c4bfd::
	text "How many?"
	done

UnknownText_0x1c4c08::
	deciram wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_from_ram StringBuffer2
	text "(S)"
	line "will be ¥@"
	deciram hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4c28::
	text "Hello, dear."

	para "I sell inexpensive"
	line "herbal medicine."

	para "They're good, but"
	line "a trifle bitter."

	para "Your #MON may"
	line "not like them."

	para "Hehehehe…"
	done

UnknownText_0x1c4ca3::
	text "How many?"
	done

UnknownText_0x1c4cae::
	deciram wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_from_ram StringBuffer2
	text "(S)"
	line "will be ¥@"
	deciram hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4cce::
	text "Thank you, dear."
	line "Hehehehe…"
	done

UnknownText_0x1c4cea::
	text "Oh? Your PACK is"
	line "full, dear."
	done

UnknownText_0x1c4d08::
	text "Hehehe… You don't"
	line "have the money."
	done

UnknownText_0x1c4d2a::
	text "Come again, dear."
	line "Hehehehe…"
	done

UnknownText_0x1c4d47::
	text "Hiya! Care to see"
	line "some bargains?"

	para "I sell rare items"
	line "that nobody else"

	para "carries--but only"
	line "one of each item."
	done

UnknownText_0x1c4db0::
	text_from_ram StringBuffer2
	text " costs"
	line "¥@"
	deciram hMoneyTemp, 3, 6
	text ". Want it?"
	done

UnknownText_0x1c4dcd::
	text "Thanks."
	done

UnknownText_0x1c4dd6::
	text "Uh-oh, your PACK"
	line "is chock-full."
	done

UnknownText_0x1c4df7::
	text "You bought that"
	line "already. I'm all"
	cont "sold out of it."
	done

UnknownText_0x1c4e28::
	text "Uh-oh, you're"
	line "short on funds."
	done

UnknownText_0x1c4e46::
	text "Come by again"
	line "sometime."
	done

UnknownText_0x1c4e5f::
	text "What's up? Need"
	line "some medicine?"
	done

UnknownText_0x1c4e7e::
	text "How many?"
	done

UnknownText_0x1c4e89::
	deciram wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_from_ram StringBuffer2
	text "(S)"
	line "will cost ¥@"
	deciram hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4eab::
	text "Thanks much!"
	done

UnknownText_0x1c4eb9::
	text "You don't have any"
	line "more space."
	done

UnknownText_0x1c4ed8::
	text "Huh? That's not"
	line "enough money."
	done

UnknownText_0x1c4ef6::
	text "All right."
	line "See you around."
	done

UnknownText_0x1c4f12::
	text "You don't have"
	line "anything to sell."
	prompt

UnknownText_0x1c4f33::
	text "How many?"
	done

UnknownText_0x1c4f3e::
	text "I can pay you"
	line "¥@"
	deciram hMoneyTemp, 3, 6
	text "."

	para "Is that OK?"
	done

UnknownText_0x1c4f62::
	text "Welcome! How may I"
	line "help you?"
	done

UnknownText_0x1c4f80::
	text "Here you are."
	line "Thank you!"
	done

UnknownText_0x1c4f9a::
	text "You don't have"
	line "enough money."
	done

UnknownText_0x1c4fb7::
	text "You can't carry"
	line "any more items."
	done

UnknownText_0x1c4fd7::
	text "Sorry, I can't buy"
	line "that from you."
	prompt

UnknownText_0x1c4ff9::
	text "Please come again!"
	done

UnknownText_0x1c500d::
	text "Can I do anything"
	line "else for you?"
	done

UnknownText_0x1c502e::
	text "Got ¥@"
	deciram hMoneyTemp, 3, 6
	text " for"
	line "@"
	text_from_ram StringBuffer2
	text "(S)."
	done

UnknownText_0x1c5049::
	text "Bet how many"
	line "coins?"
	done

UnknownText_0x1c505e::
	text "Start!"
	done

UnknownText_0x1c5066::
	text "Not enough"
	line "coins."
	prompt

UnknownText_0x1c5079::
	text "Darn… Ran out of"
	line "coins…"
	done

UnknownText_0x1c5092::
	text "Play again?"
	done

UnknownText_0x1c509f::
	text "lined up!"
	line "Won @"
	text_from_ram StringBuffer2
	text " coins!"
	done

UnknownText_0x1c50bb::
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

UnknownText_0x1c5182::
	text "Clock time unknown"
	done

UnknownText_0x1c5196::
	text "Delete the saved"
	line "LOG-IN PASSWORD?"
	done

UnknownText_0x1c51b9::
	text "Deleted the LOG-IN"
	line "PASSWORD."
	done

UnknownText_0x1c51d7::
	text "Pick three #MON"
	line "for battle."
	prompt

UnknownText_0x1c51f4::
	text_from_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_from_ram wMobileParticipant2Nickname
	text " and"
	cont "@"
	text_from_ram wMobileParticipant3Nickname
	text "."

	para "Use these three?"
	done

UnknownText_0x1c521c::
	text "Only three #MON"
	line "may enter."
	prompt

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

UnknownText_0x1c52bc::
	text "This is your CARD."
	para "Once you've"
	line "entered your phone"
	para "number, you can"
	line "trade CARDS with"
	cont "your friends."
	para ""
	done

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

UnknownText_0x1c5394::
	text "To safely store"
	line "your collection of"
	para "CARDS, you must"
	line "set a PASSCODE for"
	cont "your CARD FOLDER."
	para ""
	done

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

UnknownText_0x1c5494::
	text "Are you sure you"
	line "want to delete it?"
	done

UnknownText_0x1c54b9::
	text "The CARD FOLDER"
	line "has been deleted."
	para ""
	done

UnknownText_0x1c54dd::
	text "There is an older"
	line "CARD FOLDER from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done

UnknownText_0x1c552d::
	text "Delete the old"
	line "CARD FOLDER?"
	done

UnknownText_0x1c554a::
	text "Finish registering"
	line "CARDS?"
	done

UnknownText_0x1c5565::
	text "Huh? Sorry, wrong"
	line "number!"
	done

UnknownText_0x1c5580::
	text "Click!"
	done

UnknownText_0x1c5588::
	text "<......>"
	done

UnknownText_0x1c558b::
	text "That number is out"
	line "of the area."
	done

UnknownText_0x1c55ac::
	text "Just go talk to"
	line "that person!"
	done

UnknownText_0x1c55ca::
	text "Thank you!"
	done

UnknownText_0x1c55d6::
	text "  :"
	done

UnknownText_0x1c55db::
	text "Password OK."
	line "Select CONTINUE &"
	cont "reset settings."
	prompt

UnknownText_0x1c560b::
	text "Wrong password!"
	prompt

UnknownText_0x1c561c::
	text "Reset the clock?"
	done

UnknownText_0x1c562e::
	text "Please enter the"
	line "password."
	done

UnknownText_0x1c564a::
	text "Clear all save"
	line "data?"
	done

UnknownText_0x1c5660::
	text_from_ram wMonOrItemNameBuffer
	text " learned"
	line "@"
	text_from_ram StringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	db "@@"

UnknownText_0x1c5678::
	text "Which move should"
	next "be forgotten?"
	done

UnknownText_0x1c5699::
	text "Stop learning"
	line "@"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1c56af::
	text_from_ram wMonOrItemNameBuffer
	text ""
	line "did not learn"
	cont "@"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c56c9::
	text_from_ram wMonOrItemNameBuffer
	text " is"
	line "trying to learn"
	cont "@"
	text_from_ram StringBuffer2
	text "."

	para "But @"
	text_from_ram wMonOrItemNameBuffer
	text ""
	line "can't learn more"
	cont "than four moves."

	para "Delete an older"
	line "move to make room"
	cont "for @"
	text_from_ram StringBuffer2
	text "?"
	done

UnknownText_0x1c5740::
	text "1, 2 and…@"
	interpret_data
	db "@@"

UnknownText_0x1c574e::
	text " Poof!@"
	interpret_data
	text ""
	para "@"
	text_from_ram wMonOrItemNameBuffer
	text " forgot"
	line "@"
	text_from_ram StringBuffer1
	text "."

	para "And…"
	prompt

UnknownText_0x1c5772::
	text "HM moves can't be"
	line "forgotten now."
	prompt

UnknownText_0x1c5793::
	text "Play with three"
	line "coins?"
	done

UnknownText_0x1c57ab::
	text "Not enough coins…"
	prompt

UnknownText_0x1c57be::
	text "Choose a card."
	done

UnknownText_0x1c57ce::
	text "Place your bet."
	done

UnknownText_0x1c57df::
	text "Want to play"
	line "again?"
	done

UnknownText_0x1c57f4::
	text "The cards have"
	line "been shuffled."
	prompt

UnknownText_0x1c5813::
	text "Yeah!"
	done

UnknownText_0x1c581a::
	text "Darn…"
	done

UnknownText_0x1c5821::
	current_day
	db "@@"

UnknownText_0x1c5824::
	text "<......>"
	done

UnknownText_0x1c5827::
	text "You're out of the"
	line "service area."
	prompt

UnknownText_0x1c5847::
	text "Whom do you want"
	line "to call?"
	done

UnknownText_0x1c5862::
	text "Press any button"
	line "to exit."
	done

UnknownText_0x1c587d::
	text "Delete this stored"
	line "phone number?"
	done

UnknownText_0x1c589f::
	text "Which prize would"
	line "you like?"
	done

UnknownText_0x1c58bc::
	text_from_ram StringBuffer1
	text "?"
	line "Is that right?"
	done

UnknownText_0x1c58d1::
	text "Here you go!"
	para ""
	done

UnknownText_0x1c58e0::
	text "You don't have"
	line "enough points."
	para ""
	done

UnknownText_0x1c58ff::
	text "You have no room"
	line "for it."
	para ""
	done

UnknownText_0x1c591a::
	text "Oh. Please come"
	line "back again!"
	done

UnknownText_0x1c5937::
	text "Excuse me!"
	para ""
	done

Text_ExcuseMeYoureNotReady::
	text "Excuse me."
	line "You're not ready."
	para ""
	done

UnknownText_0x1c5962::
	text "Please return when"
	line "you're ready."
	done

UnknownText_0x1c5983::
	text "You need at least"
	line "three #MON."
	para ""
	done

UnknownText_0x1c59a3::
	text "Sorry, an EGG"
	line "doesn't qualify."
	para ""
	done

Text_OnlyThreePkmnMayBeEntered::
	text "Only three #MON"
	line "may be entered."
	para ""
	done

Text_ThePkmnMustAllBeDifferentKinds::
	text "The @"
	text_from_ram StringBuffer2
	text " #MON"
	line "must all be"
	cont "different kinds."
	para ""
	done

Text_ThePkmnMustNotHoldTheSameItems::
	text "The @"
	text_from_ram StringBuffer2
	text " #MON"
	line "must not hold the"
	cont "same items."
	para ""
	done

Text_YouCantTakeAnEgg::
	text "You can't take an"
	line "EGG!"
	para ""
	done

UnknownText_0x1c5a5a::
	text "It dodged the"
	line "thrown BALL!"

	para "This #MON"
	line "can't be caught!"
	prompt

UnknownText_0x1c5a90::
	text "You missed the"
	line "#MON!"
	prompt

UnknownText_0x1c5aa6::
	text "Oh no! The #MON"
	line "broke free!"
	prompt

UnknownText_0x1c5ac3::
	text "Aww! It appeared"
	line "to be caught!"
	prompt

UnknownText_0x1c5ae3::
	text "Aargh!"
	line "Almost had it!"
	prompt

UnknownText_0x1c5afa::
	text "Shoot! It was so"
	line "close too!"
	prompt

UnknownText_0x1c5b17::
	text "Gotcha! @"
	text_from_ram EnemyMonNick
	text ""
	line "was caught!@"
	sound_caught_mon
	db "@@"

Text_Waitbutton_2::
	text_waitbutton
	db "@@"

UnknownText_0x1c5b38::
	text_from_ram wMonOrItemNameBuffer
	text " was"
	line "sent to BILL's PC."
	prompt

UnknownText_0x1c5b53::
	text_from_ram EnemyMonNick
	text "'s data"
	line "was newly added to"
	cont "the #DEX.@"
	sound_slot_machine_start
	text_waitbutton
	db "@@"

UnknownText_0x1c5b7f::
	text "Give a nickname to"
	line "@"
	text_from_ram StringBuffer1
	text "?"
	done

UnknownText_0x1c5b9a::
	text_from_ram StringBuffer1
	text "'s"
	line "@"
	text_from_ram StringBuffer2
	text " rose."
	prompt

UnknownText_0x1c5bac::
	text "That can't be used"
	line "on this #MON."
	prompt

Text_RepelUsedEarlierIsStillInEffect::
	text "The REPEL used"
	line "earlier is still"
	cont "in effect."
	prompt

UnknownText_0x1c5bf9::
	text "Played the #"
	line "FLUTE."

	para "Now, that's a"
	line "catchy tune!"
	prompt

UnknownText_0x1c5c28::
	text "All sleeping"
	line "#MON woke up."
	prompt

UnknownText_0x1c5c44::
	text "<PLAYER> played the"
	line "# FLUTE.@"
	text_waitbutton
	db "@@"

UnknownText_0x1c5c5e::
	text "You now have"
	line "@"
	deciram wBlueCardBalance, 1, 2
	text " points."
	done

UnknownText_0x1c5c7b::
	text "Coins:"
	line "@"
	deciram Coins, 2, 4
	db "@@"

Text_RaiseThePPOfWhichMove::
	text "Raise the PP of"
	line "which move?"
	done

Text_RestoreThePPOfWhichMove::
	text "Restore the PP of"
	line "which move?"
	done

Text_PPIsMaxedOut::
	text_from_ram StringBuffer2
	text "'s PP"
	line "is maxed out."
	prompt

Text_PPsIncreased::
	text_from_ram StringBuffer2
	text "'s PP"
	line "increased."
	prompt

UnknownText_0x1c5cf1::
	text "PP was restored."
	prompt

UnknownText_0x1c5d03::
	text "There was a trophy"
	line "inside!@"
	sound_dex_fanfare_50_79
	text ""
	para "@"
	text_from_ram PlayerName
	text " sent the"
	line "trophy home."
	prompt

UnknownText_0x1c5d3e::
	text "It looks bitter…"
	prompt

UnknownText_0x1c5d50::
	text "That can't be used"
	line "on an EGG."
	prompt

UnknownText_0x1c5d6e::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

UnknownText_0x1c5d97::
	text "That belongs to"
	line "someone else!"
	prompt

UnknownText_0x1c5db6::
	text "It won't have any"
	line "effect."
	prompt

UnknownText_0x1c5dd0::
	text "The trainer"
	line "blocked the BALL!"
	prompt

UnknownText_0x1c5def::
	text "Don't be a thief!"
	prompt

UnknownText_0x1c5e01::
	text "Cycling isn't"
	line "allowed here."
	prompt

UnknownText_0x1c5e1d::
	text "Can't get on your"
	line "@"
	text_from_ram StringBuffer1
	text " now."
	prompt

UnknownText_0x1c5e3a::
	text "The #MON BOX"
	line "is full. That"
	cont "can't be used now."
	prompt

UnknownText_0x1c5e68::
	text "<PLAYER> used the@"
	text_low
	text_from_ram StringBuffer2
	text "."
	done

UnknownText_0x1c5e7b::
	text "<PLAYER> got on the@"
	text_low
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c5e90::
	text "<PLAYER> got off@"
	text_low
	text "the @"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c5ea8::
	text_from_ram StringBuffer1
	text " knows"
	line "@"
	text_from_ram StringBuffer2
	text "."
	prompt

UnknownText_0x1c5eba::
	text "That #MON knows"
	line "only one move."
	done

UnknownText_0x1c5eda::
	text "Oh, make it forget"
	line "@"
	text_from_ram StringBuffer1
	text "?"
	done

UnknownText_0x1c5ef5::
	text "Done! Your #MON"
	line "forgot the move."
	done

UnknownText_0x1c5f17::
	text "An EGG doesn't"
	line "know any moves!"
	done

UnknownText_0x1c5f36::
	text "No? Come visit me"
	line "again."
	done

UnknownText_0x1c5f50::
	text "Which move should"
	line "it forget, then?"
	prompt

UnknownText_0x1c5f74::
	text "Um… Oh, yes, I'm"
	line "the MOVE DELETER."

	para "I can make #MON"
	line "forget moves."

	para "Shall I make a"
	line "#MON forget?"
	done

UnknownText_0x1c5fd1::
	text "Which #MON?"
	prompt

Text_DSTIsThatOK::
	text " DST,"
	line "is that OK?"
	done

UnknownText_0x1c5ff1::
	text ","
	line "is that OK?"
	done

UnknownText_0x1c6000::
	text "Do you want to"
	line "switch to Daylight"
	cont "Saving Time?"
	done

UnknownText_0x1c6030::
	text "I set the clock"
	line "forward by one"
	cont "hour."
	prompt

UnknownText_0x1c6056::
	text "Is Daylight Saving"
	line "Time over?"
	done

UnknownText_0x1c6075::
	text "I put the clock"
	line "back one hour."
	prompt

UnknownText_0x1c6095::
	text "Do you want to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time?"
	done

UnknownText_0x1c60d1::
	text "I lost the in-"
	line "struction booklet"
	cont "for the #GEAR."

	para "Come back again in"
	line "a while."
	prompt
