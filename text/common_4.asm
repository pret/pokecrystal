_OakText6: ; 0x1c4000
	text "Now, what did you"
	line "say your name was?"
	prompt
; 0x1c4026

_OakText7: ; 0x1c4026
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
; 0x1c40e6

UnknownText_0x1c40e6: ; 0x1c40e6
	text "The clock's time"
	line "may be wrong."

	para "Please reset the"
	line "time."
	prompt
; 0x1c411c

UnknownText_0x1c411c: ; 0x1c411c
	text "Set with the"
	line "Control Pad."

	para "Confirm: A Button"
	line "Cancel:  B Button"
	done
; 0x1c415b

UnknownText_0x1c415b: ; 0x1c415b
	text "Is this OK?"
	done
; 0x1c4168

UnknownText_0x1c4168: ; 0x1c4168
	text "The clock has been"
	line "reset."
	done
; 0x1c4183

UnknownText_0x1c4183: ; 0x1c4183
	text "Too much time has"
	line "elapsed. Please"
	cont "try again."
	prompt
; 0x1c41b1

UnknownText_0x1c41b1: ; 0x1c41b1
	text "If you trade that"
	line "#MON, you won't"
	cont "be able to battle."
	prompt
; 0x1c41e6

UnknownText_0x1c41e6: ; 0x1c41e6
	text "Your friend's"
	line "@"
	text_from_ram StringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt
; 0x1c4212

UnknownText_0x1c4212: ; 0x1c4212
	text "Trade @"
	text_from_ram wd004
	text ""
	line "for @"
	text_from_ram StringBuffer1
	text "?"
	done
; 0x1c422a

UnknownText_0x1c422a: ; 0x1c422a
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #MON."

	para "Is that OK?"
	done
; 0x1c4275

UnknownText_0x1c4275: ; 0x1c4275
	text "Need more info on"
	line "mobile battles?"
	done
; 0x1c4298

UnknownText_0x1c4298: ; 0x1c4298
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
; 0x1c439c

UnknownText_0x1c439c: ; 0x1c439c
	text "Today's remaining"
	line "time is @"
	deciram StringBuffer2, $12
	text " min."

	para "Would you like to"
	line "battle?"
	done
; 0x1c43dc

UnknownText_0x1c43dc: ; 0x1c43dc
	text "There are only @"
	deciram StringBuffer2, $12
	text ""
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done
; 0x1c4419

UnknownText_0x1c4419: ; 0x1c4419
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done
; 0x1c445a

UnknownText_0x1c445a: ; 0x1c445a
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done
; 0x1c449c

UnknownText_0x1c449c: ; 0x1c449c
	text "Try again using"
	line "the same settings?"
	done
; 0x1c44c0

UnknownText_0x1c44c0: ; 0x1c44c0
	text "There is less than"
	line "1 min. left today!"
	done
; 0x1c44e7

UnknownText_0x1c44e7: ; 0x1c44e7
	text "No time left for"
	line "linking today."
	done
; 0x1c4508

UnknownText_0x1c4508: ; 0x1c4508
	text "Pick three #MON"
	line "for battle."
	done
; 0x1c4525

UnknownText_0x1c4525: ; 0x1c4525
	text "Today's remaining"
	line "time is @"
	deciram StringBuffer2, $12
	text " min."
	done
; 0x1c454b

UnknownText_0x1c454b: ; 0x1c454b
	text "Would you like to"
	line "save the game?"
	done
; 0x1c456d

UnknownText_0x1c456d: ; 0x1c456d
	text "SAVING… DON'T TURN"
	line "OFF THE POWER."
	done
; 0x1c4590

UnknownText_0x1c4590: ; 0x1c4590
	text "<PLAYER> saved"
	line "the game."
	done
; 0x1c45a3

UnknownText_0x1c45a3: ; 0x1c45a3
	text "There is already a"
	line "save file. Is it"
	cont "OK to overwrite?"
	done
; 0x1c45d9

UnknownText_0x1c45d9: ; 0x1c45d9
	text "There is another"
	line "save file. Is it"
	cont "OK to overwrite?"
	done
; 0x1c460d

UnknownText_0x1c460d: ; 0x1c460d
	text "The save file is"
	line "corrupted!"
	prompt
; 0x1c462a

UnknownText_0x1c462a: ; 0x1c462a
	text "When you change a"
	line "#MON BOX, data"
	cont "will be saved. OK?"
	done
; 0x1c465f

UnknownText_0x1c465f: ; 0x1c465f
	text "Each time you move"
	line "a #MON, data"
	cont "will be saved. OK?"
	done
; 0x1c4693

UnknownText_0x1c4693: ; 0x1c4693
	text "The window save"
	line "area was exceeded."
	done
; 0x1c46b7

UnknownText_0x1c46b7: ; 0x1c46b7
	text "No windows avail-"
	line "able for popping."
	done
; 0x1c46dc

UnknownText_0x1c46dc: ; 0x1c46dc
	text "Corrupted event!"
	prompt
; 0x1c46ee

_ObjectEventText:: ; 0x1c46ee
	text "Object event"
	done
; 0x1c46fc

UnknownText_0x1c46fc:: ; 0x1c46fc
	text "BG event"
	done
; 0x1c4706

UnknownText_0x1c4706:: ; 0x1c4706
	text "Coordinates event"
	done
; 0x1c4719

UnknownText_0x1c4719:: ; 0x1c4719
	text "<PLAYER> received"
	line "@"
	text_from_ram StringBuffer4
	text "."
	done
; 0x1c472c

UnknownText_0x1c472c:: ; 0x1c472c
	text "<PLAYER> put the"
	line "@"
	text_from_ram StringBuffer1
	text " in"
	cont "the @"
	text_from_ram StringBuffer3
	text "."
	prompt
; 0x1c474b

UnknownText_0x1c474b:: ; 0x1c474b
	text "The @"
	text_from_ram StringBuffer3
	text ""
	line "is full…"
	prompt
; 0x1c475f

UnknownText_0x1c475f: ; 0x1c475f
	text "I see all."
	line "I know all…"

	para "Certainly, I know"
	line "of your #MON!"
	done
; 0x1c4797

UnknownText_0x1c4797: ; 0x1c4797
	text "Whaaaat? I can't"
	line "tell a thing!"

	para "How could I not"
	line "know of this?"
	done
; 0x1c47d4

UnknownText_0x1c47d4: ; 0x1c47d4
	text "Hm… I see you met"
	line "@"
	text_from_ram wd003
	text " here:"
	cont "@"
	text_from_ram wd00e
	text "!"
	prompt
; 0x1c47fa

UnknownText_0x1c47fa: ; 0x1c47fa
	text "The time was"
	line "@"
	text_from_ram wd01f
	text "!"

	para "Its level was @"
	text_from_ram wd036
	text "!"

	para "Am I good or what?"
	prompt
; 0x1c4837

UnknownText_0x1c4837: ; 0x1c4837
	text "Hm… @"
	text_from_ram wd003
	text ""
	line "came from @"
	text_from_ram wd02a
	text ""
	cont "in a trade?"

	para "@"
	text_from_ram wd00e
	text ""
	line "was where @"
	text_from_ram wd02a
	text ""
	cont "met @"
	text_from_ram wd003
	text "!"
	prompt
; 0x1c487f

UnknownText_0x1c487f: ; 0x1c487f
	text "What!? Incredible!"

	para "I don't understand"
	line "how, but it is"

	para "incredible!"
	line "You are special."

	para "I can't tell where"
	line "you met it, but it"
	cont "was at level @"
	text_from_ram wd036
	text "."

	para "Am I good or what?"
	prompt
; 0x1c491d

UnknownText_0x1c491d: ; 0x1c491d
	text "Hey!"

	para "That's an EGG!"

	para "You can't say that"
	line "you've met it yet…"
	done
; 0x1c4955

UnknownText_0x1c4955: ; 0x1c4955
	text "Fufufu! I saw that"
	line "you'd do nothing!"
	done
; 0x1c497a

UnknownText_0x1c497a: ; 0x1c497a
	text "Incidentally…"

	para "It would be wise"
	line "to raise your"

	para "#MON with a"
	line "little more care."
	done
; 0x1c49c6

UnknownText_0x1c49c6: ; 0x1c49c6
	text "Incidentally…"

	para "It seems to have"
	line "grown a little."

	para "@"
	text_from_ram wd003
	text " seems"
	line "to be becoming"
	cont "more confident."
	done
; 0x1c4a21

UnknownText_0x1c4a21: ; 0x1c4a21
	text "Incidentally…"

	para "@"
	text_from_ram wd003
	text " has"
	line "grown. It's gained"
	cont "much strength."
	done
; 0x1c4a5b

UnknownText_0x1c4a5b: ; 0x1c4a5b
	text "Incidentally…"

	para "It certainly has"
	line "grown mighty!"

	para "This @"
	text_from_ram wd003
	text ""
	line "must have come"

	para "through numerous"
	line "#MON battles."

	para "It looks brimming"
	line "with confidence."
	done
; 0x1c4ae5

UnknownText_0x1c4ae5: ; 0x1c4ae5
	text "Incidentally…"

	para "I'm impressed by"
	line "your dedication."

	para "It's been a long"
	line "time since I've"

	para "seen a #MON as"
	line "mighty as this"
	cont "@"
	text_from_ram wd003
	text "."

	para "I'm sure that"
	line "seeing @"
	text_from_ram wd003
	text ""
	para "in battle would"
	line "excite anyone."
	done
; 0x1c4b92

UnknownText_0x1c4b92: ; 0x1c4b92
	text "Congratulations!"
	line "Your @"
	text_from_ram StringBuffer2
	db "@"
; 0x1c4bae

UnknownText_0x1c4bae: ; 0x1c4bae
	db "@"
; 0x1c4baf

UnknownText_0x1c4baf: ; 0x1c4baf
	text ""
	para "evolved into"
	line "@"
	text_from_ram StringBuffer1
	text "!"
	done
; 0x1c4bc5

UnknownText_0x1c4bc5: ; 0x1c4bc5
	text "Huh? @"
	text_from_ram StringBuffer2
	text ""
	line "stopped evolving!"
	prompt
; 0x1c4be3

UnknownText_0x1c4be3: ; 0x1c4be3
	text "What? @"
	text_from_ram StringBuffer2
	text ""
	line "is evolving!"
	done
; 0x1c4bfd

UnknownText_0x1c4bfd: ; 0x1c4bfd
	text "How many?"
	done
; 0x1c4c08

UnknownText_0x1c4c08: ; 0x1c4c08
	deciram wd10c, $12
	text " @"
	text_from_ram StringBuffer2
	text "(S)"
	line "will be ¥@"
	deciram hMoneyTemp, $36
	text "."
	done
; 0x1c4c28

UnknownText_0x1c4c28: ; 0x1c4c28
	text "Hello, dear."

	para "I sell inexpensive"
	line "herbal medicine."

	para "They're good, but"
	line "a trifle bitter."

	para "Your #MON may"
	line "not like them."

	para "Hehehehe…"
	done
; 0x1c4ca3

UnknownText_0x1c4ca3: ; 0x1c4ca3
	text "How many?"
	done
; 0x1c4cae

UnknownText_0x1c4cae: ; 0x1c4cae
	deciram wd10c, $12
	text " @"
	text_from_ram StringBuffer2
	text "(S)"
	line "will be ¥@"
	deciram hMoneyTemp, $36
	text "."
	done
; 0x1c4cce

UnknownText_0x1c4cce: ; 0x1c4cce
	text "Thank you, dear."
	line "Hehehehe…"
	done
; 0x1c4cea

UnknownText_0x1c4cea: ; 0x1c4cea
	text "Oh? Your PACK is"
	line "full, dear."
	done
; 0x1c4d08

UnknownText_0x1c4d08: ; 0x1c4d08
	text "Hehehe… You don't"
	line "have the money."
	done
; 0x1c4d2a

UnknownText_0x1c4d2a: ; 0x1c4d2a
	text "Come again, dear."
	line "Hehehehe…"
	done
; 0x1c4d47

UnknownText_0x1c4d47: ; 0x1c4d47
	text "Hiya! Care to see"
	line "some bargains?"

	para "I sell rare items"
	line "that nobody else"

	para "carries--but only"
	line "one of each item."
	done
; 0x1c4db0

UnknownText_0x1c4db0: ; 0x1c4db0
	text_from_ram StringBuffer2
	text " costs"
	line "¥@"
	deciram hMoneyTemp, $36
	text ". Want it?"
	done
; 0x1c4dcd

UnknownText_0x1c4dcd: ; 0x1c4dcd
	text "Thanks."
	done
; 0x1c4dd6

UnknownText_0x1c4dd6: ; 0x1c4dd6
	text "Uh-oh, your PACK"
	line "is chock-full."
	done
; 0x1c4df7

UnknownText_0x1c4df7: ; 0x1c4df7
	text "You bought that"
	line "already. I'm all"
	cont "sold out of it."
	done
; 0x1c4e28

UnknownText_0x1c4e28: ; 0x1c4e28
	text "Uh-oh, you're"
	line "short on funds."
	done
; 0x1c4e46

UnknownText_0x1c4e46: ; 0x1c4e46
	text "Come by again"
	line "sometime."
	done
; 0x1c4e5f

UnknownText_0x1c4e5f: ; 0x1c4e5f
	text "What's up? Need"
	line "some medicine?"
	done
; 0x1c4e7e

UnknownText_0x1c4e7e: ; 0x1c4e7e
	text "How many?"
	done
; 0x1c4e89

UnknownText_0x1c4e89: ; 0x1c4e89
	deciram wd10c, $12
	text " @"
	text_from_ram StringBuffer2
	text "(S)"
	line "will cost ¥@"
	deciram hMoneyTemp, $36
	text "."
	done
; 0x1c4eab

UnknownText_0x1c4eab: ; 0x1c4eab
	text "Thanks much!"
	done
; 0x1c4eb9

UnknownText_0x1c4eb9: ; 0x1c4eb9
	text "You don't have any"
	line "more space."
	done
; 0x1c4ed8

UnknownText_0x1c4ed8: ; 0x1c4ed8
	text "Huh? That's not"
	line "enough money."
	done
; 0x1c4ef6

UnknownText_0x1c4ef6: ; 0x1c4ef6
	text "All right."
	line "See you around."
	done
; 0x1c4f12

UnknownText_0x1c4f12: ; 0x1c4f12
	text "You don't have"
	line "anything to sell."
	prompt
; 0x1c4f33

UnknownText_0x1c4f33: ; 0x1c4f33
	text "How many?"
	done
; 0x1c4f3e

UnknownText_0x1c4f3e: ; 0x1c4f3e
	text "I can pay you"
	line "¥@"
	deciram hMoneyTemp, $36
	text "."

	para "Is that OK?"
	done
; 0x1c4f62

UnknownText_0x1c4f62: ; 0x1c4f62
	text "Welcome! How may I"
	line "help you?"
	done
; 0x1c4f80

UnknownText_0x1c4f80: ; 0x1c4f80
	text "Here you are."
	line "Thank you!"
	done
; 0x1c4f9a

UnknownText_0x1c4f9a: ; 0x1c4f9a
	text "You don't have"
	line "enough money."
	done
; 0x1c4fb7

UnknownText_0x1c4fb7: ; 0x1c4fb7
	text "You can't carry"
	line "any more items."
	done
; 0x1c4fd7

UnknownText_0x1c4fd7: ; 0x1c4fd7
	text "Sorry, I can't buy"
	line "that from you."
	prompt
; 0x1c4ff9

UnknownText_0x1c4ff9: ; 0x1c4ff9
	text "Please come again!"
	done
; 0x1c500d

UnknownText_0x1c500d: ; 0x1c500d
	text "Can I do anything"
	line "else for you?"
	done
; 0x1c502e

UnknownText_0x1c502e: ; 0x1c502e
	text "Got ¥@"
	deciram hMoneyTemp, $36
	text " for"
	line "@"
	text_from_ram StringBuffer2
	text "(S)."
	done
; 0x1c5049

UnknownText_0x1c5049: ; 0x1c5049
	text "Bet how many"
	line "coins?"
	done
; 0x1c505e

UnknownText_0x1c505e: ; 0x1c505e
	text "Start!"
	done
; 0x1c5066

UnknownText_0x1c5066: ; 0x1c5066
	text "Not enough"
	line "coins."
	prompt
; 0x1c5079

UnknownText_0x1c5079: ; 0x1c5079
	text "Darn… Ran out of"
	line "coins…"
	done
; 0x1c5092

UnknownText_0x1c5092: ; 0x1c5092
	text "Play again?"
	done
; 0x1c509f

UnknownText_0x1c509f: ; 0x1c509f
	text "lined up!"
	line "Won @"
	text_from_ram StringBuffer2
	text " coins!"
	done
; 0x1c50bb

UnknownText_0x1c50bb: ; 0x1c50bb
	text "Darn!"
	done
; 0x1c50c2

_MobileStadiumEntryText: ; 0x1c50c2
	text "Data for use in"
	line "the MOBILE STADIUM"

	para "of the N64 #MON"
	line "STADIUM 2 can be"
	cont "read here."

	para "Read the data?"
	done
; 0x1c5121

_MobileStadiumSuccessText: ; 0x1c5121
	text "Data transfer is"
	line "complete."
	para "We hope you enjoy"
	line "MOBILE STADIUM"
	para "battles in the N64"
	line "#MON STADIUM 2."
	para ""
	done
; 0x1c5182

UnknownText_0x1c5182: ; 0x1c5182
	text "Clock time unknown"
	done
; 0x1c5196

UnknownText_0x1c5196: ; 0x1c5196
	text "Delete the saved"
	line "LOG-IN PASSWORD?"
	done
; 0x1c51b9

UnknownText_0x1c51b9: ; 0x1c51b9
	text "Deleted the LOG-IN"
	line "PASSWORD."
	done
; 0x1c51d7

UnknownText_0x1c51d7: ; 0x1c51d7
	text "Pick three #MON"
	line "for battle."
	prompt
; 0x1c51f4

UnknownText_0x1c51f4: ; 0x1c51f4
	text_from_ram wd006
	text ","
	line "@"
	text_from_ram wd00c
	text " and"
	cont "@"
	text_from_ram wd012
	text "."

	para "Use these three?"
	done
; 0x1c521c

UnknownText_0x1c521c: ; 0x1c521c
	text "Only three #MON"
	line "may enter."
	prompt
; 0x1c5238

UnknownText_0x1c5238: ; 0x1c5238
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
; 0x1c52bc

UnknownText_0x1c52bc: ; 0x1c52bc
	text "This is your CARD."
	para "Once you've"
	line "entered your phone"
	para "number, you can"
	line "trade CARDS with"
	cont "your friends."
	para ""
	done
; 0x1c531e

UnknownText_0x1c531e: ; 0x1c531e
	text "If you have your"
	line "friend's CARD, you"
	para "can use it to make"
	line "a call from a"
	para "mobile phone on"
	line "the 2nd floor of a"
	cont "#MON CENTER."
	para ""
	done
; 0x1c5394

UnknownText_0x1c5394: ; 0x1c5394
	text "To safely store"
	line "your collection of"
	para "CARDS, you must"
	line "set a PASSCODE for"
	cont "your CARD FOLDER."
	para ""
	done
; 0x1c53ee

UnknownText_0x1c53ee: ; 0x1c53ee
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
; 0x1c5494

UnknownText_0x1c5494: ; 0x1c5494
	text "Are you sure you"
	line "want to delete it?"
	done
; 0x1c54b9

UnknownText_0x1c54b9: ; 0x1c54b9
	text "The CARD FOLDER"
	line "has been deleted."
	para ""
	done
; 0x1c54dd

UnknownText_0x1c54dd: ; 0x1c54dd
	text "There is an older"
	line "CARD FOLDER from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done
; 0x1c552d

UnknownText_0x1c552d: ; 0x1c552d
	text "Delete the old"
	line "CARD FOLDER?"
	done
; 0x1c554a

UnknownText_0x1c554a: ; 0x1c554a
	text "Finish registering"
	line "CARDS?"
	done
; 0x1c5565

UnknownText_0x1c5565: ; 0x1c5565
	text "Huh? Sorry, wrong"
	line "number!"
	done
; 0x1c5580

UnknownText_0x1c5580: ; 0x1c5580
	text "Click!"
	done
; 0x1c5588

UnknownText_0x1c5588: ; 0x1c5588
	text $56
	done
; 0x1c558b

UnknownText_0x1c558b: ; 0x1c558b
	text "That number is out"
	line "of the area."
	done
; 0x1c55ac

UnknownText_0x1c55ac: ; 0x1c55ac
	text "Just go talk to"
	line "that person!"
	done
; 0x1c55ca

UnknownText_0x1c55ca: ; 0x1c55ca
	text "Thank you!"
	done
; 0x1c55d6

UnknownText_0x1c55d6: ; 0x1c55d6
	text "  :"
	done
; 0x1c55db

UnknownText_0x1c55db: ; 0x1c55db
	text "Password OK."
	line "Select CONTINUE &"
	cont "reset settings."
	prompt
; 0x1c560b

UnknownText_0x1c560b: ; 0x1c560b
	text "Wrong password!"
	prompt
; 0x1c561c

UnknownText_0x1c561c: ; 0x1c561c
	text "Reset the clock?"
	done
; 0x1c562e

UnknownText_0x1c562e: ; 0x1c562e
	text "Please enter the"
	line "password."
	done
; 0x1c564a

UnknownText_0x1c564a: ; 0x1c564a
	text "Clear all save"
	line "data?"
	done
; 0x1c5660

UnknownText_0x1c5660: ; 0x1c5660
	text_from_ram wd050
	text " learned"
	line "@"
	text_from_ram StringBuffer2
	text "!@"
	sound0
	text_waitbutton
	db "@"
; 0x1c5677

UnknownText_0x1c5677: ; 0x1c5677
	db "@"
; 0x1c5678

UnknownText_0x1c5678: ; 0x1c5678
	text "Which move should"
	next "be forgotten?"
	done
; 0x1c5699

UnknownText_0x1c5699: ; 0x1c5699
	text "Stop learning"
	line "@"
	text_from_ram StringBuffer2
	text "?"
	done
; 0x1c56af

UnknownText_0x1c56af: ; 0x1c56af
	text_from_ram wd050
	text ""
	line "did not learn"
	cont "@"
	text_from_ram StringBuffer2
	text "."
	prompt
; 0x1c56c9

UnknownText_0x1c56c9: ; 0x1c56c9
	text_from_ram wd050
	text " is"
	line "trying to learn"
	cont "@"
	text_from_ram StringBuffer2
	text "."

	para "But @"
	text_from_ram wd050
	text ""
	line "can't learn more"
	cont "than four moves."

	para "Delete an older"
	line "move to make room"
	cont "for @"
	text_from_ram StringBuffer2
	text "?"
	done
; 0x1c5740

UnknownText_0x1c5740: ; 0x1c5740
	text "1, 2 and…@"
	interpret_data
	db "@"
; 0x1c574d

UnknownText_0x1c574d: ; 0x1c574d
	db "@"
; 0x1c574e

UnknownText_0x1c574e: ; 0x1c574e
	text " Poof!@"
	interpret_data
	text ""
	para "@"
	text_from_ram wd050
	text " forgot"
	line "@"
	text_from_ram StringBuffer1
	text "."

	para "And…"
	prompt
; 0x1c5772

UnknownText_0x1c5772: ; 0x1c5772
	text "HM moves can't be"
	line "forgotten now."
	prompt
; 0x1c5793

UnknownText_0x1c5793: ; 0x1c5793
	text "Play with three"
	line "coins?"
	done
; 0x1c57ab

UnknownText_0x1c57ab: ; 0x1c57ab
	text "Not enough coins…"
	prompt
; 0x1c57be

UnknownText_0x1c57be: ; 0x1c57be
	text "Choose a card."
	done
; 0x1c57ce

UnknownText_0x1c57ce: ; 0x1c57ce
	text "Place your bet."
	done
; 0x1c57df

UnknownText_0x1c57df: ; 0x1c57df
	text "Want to play"
	line "again?"
	done
; 0x1c57f4

UnknownText_0x1c57f4: ; 0x1c57f4
	text "The cards have"
	line "been shuffled."
	prompt
; 0x1c5813

UnknownText_0x1c5813: ; 0x1c5813
	text "Yeah!"
	done
; 0x1c581a

UnknownText_0x1c581a: ; 0x1c581a
	text "Darn…"
	done
; 0x1c5821

UnknownText_0x1c5821: ; 0x1c5821
	current_day
	db "@"
; 0x1c5823

UnknownText_0x1c5823: ; 0x1c5823
	db "@"
; 0x1c5824

UnknownText_0x1c5824: ; 0x1c5824
	text $56
	done
; 0x1c5827

UnknownText_0x1c5827: ; 0x1c5827
	text "You're out of the"
	line "service area."
	prompt
; 0x1c5847

UnknownText_0x1c5847: ; 0x1c5847
	text "Whom do you want"
	line "to call?"
	done
; 0x1c5862

UnknownText_0x1c5862: ; 0x1c5862
	text "Press any button"
	line "to exit."
	done
; 0x1c587d

UnknownText_0x1c587d: ; 0x1c587d
	text "Delete this stored"
	line "phone number?"
	done
; 0x1c589f

UnknownText_0x1c589f: ; 0x1c589f
	text "Which prize would"
	line "you like?"
	done
; 0x1c58bc

UnknownText_0x1c58bc: ; 0x1c58bc
	text_from_ram StringBuffer1
	text "?"
	line "Is that right?"
	done
; 0x1c58d1

UnknownText_0x1c58d1: ; 0x1c58d1
	text "Here you go!"
	para ""
	done
; 0x1c58e0

UnknownText_0x1c58e0: ; 0x1c58e0
	text "You don't have"
	line "enough points."
	para ""
	done
; 0x1c58ff

UnknownText_0x1c58ff: ; 0x1c58ff
	text "You have no room"
	line "for it."
	para ""
	done
; 0x1c591a

UnknownText_0x1c591a: ; 0x1c591a
	text "Oh. Please come"
	line "back again!"
	done
; 0x1c5937

UnknownText_0x1c5937: ; 0x1c5937
	text "Excuse me!"
	para ""
	done
; 0x1c5944

UnknownText_0x1c5944: ; 0x1c5944
	text "Excuse me."
	line "You're not ready."
	para ""
	done
; 0x1c5962

UnknownText_0x1c5962: ; 0x1c5962
	text "Please return when"
	line "you're ready."
	done
; 0x1c5983

UnknownText_0x1c5983: ; 0x1c5983
	text "You need at least"
	line "three #MON."
	para ""
	done
; 0x1c59a3

UnknownText_0x1c59a3: ; 0x1c59a3
	text "Sorry, an EGG"
	line "doesn't qualify."
	para ""
	done
; 0x1c59c3

UnknownText_0x1c59c3: ; 0x1c59c3
	text "Only three #MON"
	line "may be entered."
	para ""
	done
; 0x1c59e5

UnknownText_0x1c59e5: ; 0x1c59e5
	text "The @"
	text_from_ram StringBuffer2
	text " #MON"
	line "must all be"
	cont "different kinds."
	para ""
	done
; 0x1c5a13

UnknownText_0x1c5a13: ; 0x1c5a13
	text "The @"
	text_from_ram StringBuffer2
	text " #MON"
	line "must not hold the"
	cont "same items."
	para ""
	done
; 0x1c5a42

UnknownText_0x1c5a42: ; 0x1c5a42
	text "You can't take an"
	line "EGG!"
	para ""
	done
; 0x1c5a5a

UnknownText_0x1c5a5a: ; 0x1c5a5a
	text "It dodged the"
	line "thrown BALL!"

	para "This #MON"
	line "can't be caught!"
	prompt
; 0x1c5a90

UnknownText_0x1c5a90: ; 0x1c5a90
	text "You missed the"
	line "#MON!"
	prompt
; 0x1c5aa6

UnknownText_0x1c5aa6: ; 0x1c5aa6
	text "Oh no! The #MON"
	line "broke free!"
	prompt
; 0x1c5ac3

UnknownText_0x1c5ac3: ; 0x1c5ac3
	text "Aww! It appeared"
	line "to be caught!"
	prompt
; 0x1c5ae3

UnknownText_0x1c5ae3: ; 0x1c5ae3
	text "Aargh!"
	line "Almost had it!"
	prompt
; 0x1c5afa

UnknownText_0x1c5afa: ; 0x1c5afa
	text "Shoot! It was so"
	line "close too!"
	prompt
; 0x1c5b17

UnknownText_0x1c5b17: ; 0x1c5b17
	text "Gotcha! @"
	text_from_ram EnemyMonNick
	text ""
	line "was caught!@"
	sound0x02
	db "@"
; 0x1c5b34

UnknownText_0x1c5b34: ; 0x1c5b34
	db "@"
; 0x1c5b35

UnknownText_0x1c5b35: ; 0x1c5b35
	text_waitbutton
	db "@"
; 0x1c5b37

UnknownText_0x1c5b37: ; 0x1c5b37
	db "@"
; 0x1c5b38

UnknownText_0x1c5b38: ; 0x1c5b38
	text_from_ram wd050
	text " was"
	line "sent to BILL's PC."
	prompt
; 0x1c5b53

UnknownText_0x1c5b53: ; 0x1c5b53
	text_from_ram EnemyMonNick
	text "'s data"
	line "was newly added to"
	cont "the #DEX.@"
	sound0x2C
	text_waitbutton
	db "@"
; 0x1c5b7e

UnknownText_0x1c5b7e: ; 0x1c5b7e
	db "@"
; 0x1c5b7f

UnknownText_0x1c5b7f: ; 0x1c5b7f
	text "Give a nickname to"
	line "@"
	text_from_ram StringBuffer1
	text "?"
	done
; 0x1c5b9a

UnknownText_0x1c5b9a: ; 0x1c5b9a
	text_from_ram StringBuffer1
	text "'s"
	line "@"
	text_from_ram StringBuffer2
	text " rose."
	prompt
; 0x1c5bac

UnknownText_0x1c5bac: ; 0x1c5bac
	text "That can't be used"
	line "on this #MON."
	prompt
; 0x1c5bcd

UnknownText_0x1c5bcd: ; 0x1c5bcd
	text "The REPEL used"
	line "earlier is still"
	cont "in effect."
	prompt
; 0x1c5bf9

UnknownText_0x1c5bf9: ; 0x1c5bf9
	text "Played the #"
	line "FLUTE."

	para "Now, that's a"
	line "catchy tune!"
	prompt
; 0x1c5c28

UnknownText_0x1c5c28: ; 0x1c5c28
	text "All sleeping"
	line "#MON woke up."
	prompt
; 0x1c5c44

UnknownText_0x1c5c44: ; 0x1c5c44
	text "<PLAYER> played the"
	line "# FLUTE.@"
	text_waitbutton
	db "@"
; 0x1c5c5d

UnknownText_0x1c5c5d: ; 0x1c5c5d
	db "@"
; 0x1c5c5e

UnknownText_0x1c5c5e: ; 0x1c5c5e
	text "You now have"
	line "@"
	deciram wdc4b, $12
	text " points."
	done
; 0x1c5c7b

UnknownText_0x1c5c7b: ; 0x1c5c7b
	text "Coins:"
	line "@"
	deciram Coins, $24
	db "@"
; 0x1c5c89

UnknownText_0x1c5c89: ; 0x1c5c89
	db "@"
; 0x1c5c8a

UnknownText_0x1c5c8a: ; 0x1c5c8a
	text "Raise the PP of"
	line "which move?"
	done
; 0x1c5ca7

UnknownText_0x1c5ca7: ; 0x1c5ca7
	text "Restore the PP of"
	line "which move?"
	done
; 0x1c5cc6

UnknownText_0x1c5cc6: ; 0x1c5cc6
	text_from_ram StringBuffer2
	text "'s PP"
	line "is maxed out."
	prompt
; 0x1c5cdd

UnknownText_0x1c5cdd: ; 0x1c5cdd
	text_from_ram StringBuffer2
	text "'s PP"
	line "increased."
	prompt
; 0x1c5cf1

UnknownText_0x1c5cf1: ; 0x1c5cf1
	text "PP was restored."
	prompt
; 0x1c5d03

UnknownText_0x1c5d03: ; 0x1c5d03
	text "There was a trophy"
	line "inside!@"
	sound0
	text ""
	para "@"
	text_from_ram PlayerName
	text " sent the"
	line "trophy home."
	prompt
; 0x1c5d3e

UnknownText_0x1c5d3e: ; 0x1c5d3e
	text "It looks bitter…"
	prompt
; 0x1c5d50

UnknownText_0x1c5d50: ; 0x1c5d50
	text "That can't be used"
	line "on an EGG."
	prompt
; 0x1c5d6e

UnknownText_0x1c5d6e: ; 0x1c5d6e
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt
; 0x1c5d97

UnknownText_0x1c5d97: ; 0x1c5d97
	text "That belongs to"
	line "someone else!"
	prompt
; 0x1c5db6

UnknownText_0x1c5db6: ; 0x1c5db6
	text "It won't have any"
	line "effect."
	prompt
; 0x1c5dd0

UnknownText_0x1c5dd0: ; 0x1c5dd0
	text "The trainer"
	line "blocked the BALL!"
	prompt
; 0x1c5def

UnknownText_0x1c5def: ; 0x1c5def
	text "Don't be a thief!"
	prompt
; 0x1c5e01

UnknownText_0x1c5e01: ; 0x1c5e01
	text "Cycling isn't"
	line "allowed here."
	prompt
; 0x1c5e1d

UnknownText_0x1c5e1d: ; 0x1c5e1d
	text "Can't get on your"
	line "@"
	text_from_ram StringBuffer1
	text " now."
	prompt
; 0x1c5e3a

UnknownText_0x1c5e3a: ; 0x1c5e3a
	text "The #MON BOX"
	line "is full. That"
	cont "can't be used now."
	prompt
; 0x1c5e68

UnknownText_0x1c5e68: ; 0x1c5e68
	text "<PLAYER> used the@"
	text_dunno1
	text_from_ram StringBuffer2
	text "."
	done
; 0x1c5e7b

UnknownText_0x1c5e7b: ; 0x1c5e7b
	text "<PLAYER> got on the@"
	text_dunno1
	text_from_ram StringBuffer2
	text "."
	prompt
; 0x1c5e90

UnknownText_0x1c5e90: ; 0x1c5e90
	text "<PLAYER> got off@"
	text_dunno1
	text "the @"
	text_from_ram StringBuffer2
	text "."
	prompt
; 0x1c5ea8

UnknownText_0x1c5ea8: ; 0x1c5ea8
	text_from_ram StringBuffer1
	text " knows"
	line "@"
	text_from_ram StringBuffer2
	text "."
	prompt
; 0x1c5eba

UnknownText_0x1c5eba: ; 0x1c5eba
	text "That #MON knows"
	line "only one move."
	done
; 0x1c5eda

UnknownText_0x1c5eda: ; 0x1c5eda
	text "Oh, make it forget"
	line "@"
	text_from_ram StringBuffer1
	text "?"
	done
; 0x1c5ef5

UnknownText_0x1c5ef5: ; 0x1c5ef5
	text "Done! Your #MON"
	line "forgot the move."
	done
; 0x1c5f17

UnknownText_0x1c5f17: ; 0x1c5f17
	text "An EGG doesn't"
	line "know any moves!"
	done
; 0x1c5f36

UnknownText_0x1c5f36: ; 0x1c5f36
	text "No? Come visit me"
	line "again."
	done
; 0x1c5f50

UnknownText_0x1c5f50: ; 0x1c5f50
	text "Which move should"
	line "it forget, then?"
	prompt
; 0x1c5f74

UnknownText_0x1c5f74: ; 0x1c5f74
	text "Um… Oh, yes, I'm"
	line "the MOVE DELETER."

	para "I can make #MON"
	line "forget moves."

	para "Shall I make a"
	line "#MON forget?"
	done
; 0x1c5fd1

UnknownText_0x1c5fd1: ; 0x1c5fd1
	text "Which #MON?"
	prompt
; 0x1c5fde

UnknownText_0x1c5fde: ; 0x1c5fde
	text " DST,"
	line "is that OK?"
	done
; 0x1c5ff1

UnknownText_0x1c5ff1: ; 0x1c5ff1
	text ","
	line "is that OK?"
	done
; 0x1c6000

UnknownText_0x1c6000: ; 0x1c6000
	text "Do you want to"
	line "switch to Daylight"
	cont "Saving Time?"
	done
; 0x1c6030

UnknownText_0x1c6030: ; 0x1c6030
	text "I set the clock"
	line "forward by one"
	cont "hour."
	prompt
; 0x1c6056

UnknownText_0x1c6056: ; 0x1c6056
	text "Is Daylight Saving"
	line "Time over?"
	done
; 0x1c6075

UnknownText_0x1c6075: ; 0x1c6075
	text "I put the clock"
	line "back one hour."
	prompt
; 0x1c6095

UnknownText_0x1c6095: ; 0x1c6095
	text "Do you want to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time?"
	done
; 0x1c60d1

UnknownText_0x1c60d1: ; 0x1c60d1
	text "I lost the in-"
	line "struction booklet"
	cont "for the #GEAR."

	para "Come back again in"
	line "a while."
	prompt
; 0x1c611e
