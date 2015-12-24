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
